import aes
import serial
import struct
import secrets
import time

medium = serial.Serial('COM4', timeout=1.) # use a timeout because otherwise the python process cannot be killed with ctrl+c if no data is received

def read_indefinitely(medium, size):
    data = b''
    while len(data) < size:
        chunk = medium.read(size - len(data))
        if chunk is not None:
            data += chunk
    return data

key = bytes.fromhex("9A 00 72 1E 3E E2 9A 7B F1 B4 A6 08 6C 14 52 EB")
print(key)
cipher = aes.AES(key)
print(cipher)

def compute_crc_8408_byte(data, crc = 0):
    crc ^= data
    for i in range(8):
        remainder = 0x8408 if crc & 1 else 0
        crc = (crc >> 1) ^ remainder
    return crc

def compute_crc_8408(data, crc = 0):
    for b in data:
        crc = compute_crc_8408_byte(b, crc)
    return crc

def decrypt_packet(packet):
    assert (len(packet) - 5) % 16 == 0, "crypted data length is not a multiple of the block size"
    iv, ciphertext = packet[5:21], packet[21:]
    padded_plaintext = cipher.decrypt_custom(ciphertext, iv)
    #assert cipher.encrypt_custom(padded_plaintext, iv) == ciphertext
    padding_size = iv[0]
    assert all(b == 0x55 for b in padded_plaintext[-padding_size:]), "incorrect padding"
    return (
        struct.pack('>H', len(packet) - 16 - padding_size) +
        packet[2:5] +
        padded_plaintext[:-padding_size])

def encrypt_packet(packet):
    padding_size = 16 - (len(packet) - 5) % 16
    assert padding_size > 0 and padding_size <= 0x10
    #iv = struct.pack('>B', padding_size) + secrets.token_bytes(15)
    iv = struct.pack('>B', padding_size) + bytes.fromhex("6F F8 7F 48 07 50 F7 A0 E7 8E BD 26 75 BE 4D")
    plaintext = packet[5:] + padding_size * b'\x55'
    ciphertext = cipher.encrypt_custom(plaintext, iv)
    return (
        struct.pack('>H', 5 + 16 + len(ciphertext)) +
        packet[2:5] +
        iv +
        ciphertext
    )

def pack(message):
    packet_length, is_encrypted, unknown3, unknown4 = len(message) + 7, 1, 0, 0
    packet = struct.pack('>HBBB', packet_length, is_encrypted, unknown3, unknown4) + message
    computed_crc = compute_crc_8408(packet)
    packet += struct.pack(">H", computed_crc)
    if is_encrypted:
        packet = encrypt_packet(packet)
    return packet

def unpack(packet):
    packet_length, is_encrypted, unknown3, unknown4 = struct.unpack('>HBBB', packet[0:5])
    assert packet_length == len(packet), "incorrect length"
    if is_encrypted:
        packet = decrypt_packet(packet)
    computed_crc = compute_crc_8408(packet[:-2])
    received_crc, = struct.unpack(">H", packet[-2:])
    assert computed_crc == received_crc, "incorrect CRC"
    return packet[5:-2]

# this assert is only true if iv is not random!
#a = pack(bytes.fromhex("10e300ffff0038353036373530314130303300ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0138353130323430344130333500ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"))
#b = bytes.fromhex("0095010000046FF87F480750F7A0E78EBD2675BE4D96F232596E9BDC25351ED400EB25C209BF25862FC6B53525BE033C125D69249770669ACCE678CAB4CEEE2CE33D069B4A9D09E177051AB1BF37058361E77EE8F947BB53DD0E7A22A8DEE14260F4E63172FBF144177FFD0D9DC88134CE7045EB349D09E177051AB1BF37058361E77EE8079D09E177051AB1BF3705C2E04DD442AD")
#assert a == b

#test = bytes.fromhex("008101000010e300ffff0038353036373530314130303300ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0138353130323430344130333500ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbe7e")
#assert unpack(pack(test)) == test

def index_or_end(container, element):
    return next((i for i, it in enumerate(container) if it == element), len(container))

def receive_messages():
    data = bytearray()
    while True:
        data += read_indefinitely(medium, 1)
        start_index = index_or_end(data, 0xC0)
        if start_index != 0:
            print("dropped %d bytes" % start_index, data)
        data = data[start_index:]
        while True:
            if len(data) < 4: break
            length, = struct.unpack('>H', data[1:3])
            if len(data) < length + 2: break
            if data[length + 1] == 0xC0:
                medium.write(b'\x55')
                message = unpack(data[1:length + 1])
                print("IN>   ", message.hex())
                yield message
                data = data[length + 2:]
            else:
                data = data[length + 1:]
                print("dropped %d bytes" % (length + 1))

def send_message(data_str):
    time.sleep(0.2)
    data = bytes.fromhex(data_str)
    print("  <OUT", data.hex())
    medium.write(b'\xC0' + pack(data) + b'\xC0')
    ack = read_indefinitely(medium, 1)
    assert ack == b'\x55', ack.hex()

def hex_block(id, text):
    data = bytes.fromhex(text)
    return "%02x%02x%s" % (id, len(data), data.hex())

def int8_block(id, value):
    assert value <= 0xff
    data = struct.pack(">B", value)
    return "%02x%02x%s" % (id, len(data), data.hex())

def int16_block(id, value):
    assert value <= 0xffff
    data = struct.pack(">H", value)
    return "%02x%02x%s" % (id, len(data), data.hex())

def int24_block(id, value):
    assert value <= 0xffffff
    data = struct.pack(">I", value)[1:4]
    return "%02x%02x%s" % (id, len(data), data.hex())

def string_block(id, capacity, text):
    return hex_block(id, bytes(text, encoding="ascii").hex() + "00" + "ff" * (capacity - len(text) - 1))

def read_blocks(message_part):
    blocks = {}
    rest = message_part
    while len(rest) > 1:
        id, size, *rest = rest
        data, rest = bytes(rest[:size]), bytes(rest[size:])
        assert id not in blocks
        blocks[id] = data
    assert rest == bytes.fromhex("ff"), (rest, bytes.fromhex("ff"), message_part)
    return blocks

def read_block(message_part, id):
    return read_blocks(message_part)[id]

def read_packed_block(message_part, id, format):
    result, = struct.unpack(format, read_block(message_part, id))
    return result

def read_int8_block(message_part, id):
    return read_packed_block(message_part, id, '>B')

def read_int16_block(message_part, id):
    return read_packed_block(message_part, id, '>H')

def read_int24_block(message_part, id):
    result, = struct.unpack(">I", b'\x00' + read_block(message_part, id))
    return result

assert string_block(0, 56, "5067501A003") == "0038353036373530314130303300ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"
#print(read_blocks(bytes.fromhex("00 02 1234 01 03 123456 ff")))

# "embedded test" does not seem to do much
#if read_indefinitely(medium, 3) == bytes.fromhex("02 04 fa"):
#    print("hello")
#    medium.write(bytes.fromhex("43 05 FF B9"))

received_messages = receive_messages()
last_message = None

def expect_message(data_str):
    global last_message
    data = bytes.fromhex(data_str)
    if last_message is not None:
        packet = last_message
        last_message = None
    else:
        packet = next(received_messages)
    if packet != data:
        print("EXPECTED %s BUT GOT %s" % (data.hex(), packet.hex()))

def expect_any_message():
    global last_message
    if last_message is not None:
        packet = last_message
    last_message = None

for message in received_messages:
    last_message = message

    # shows on startup only
    if message[0:2] == bytes.fromhex("10E2"):
        print("--- ReadObjectSynchro 10")
        expect_message("10e2d0 510000ffff")
        send_message("10e300 ffff" + string_block(0, 56, "5067501A003") + string_block(1, 56, "5102404A042V2") + "ff")

    # shows on startup only
    elif message == bytes.fromhex("1106"):
        print("--- StartIoNetwork")
        expect_message("1106")
        send_message("110703")

    # shows several times
    elif message == bytes.fromhex("11e6"):
        print("--- EraseAllObjectsSynchro")
        expect_message("11e6")
        send_message("11e700")

    elif message[0:3] == bytes.fromhex("110000"):
        print("--- IoDiscoverNodesSession")
        phase = read_int16_block(message[3:], 1) # 0001 for two-way, 0002 for one-way, 0040 for other

        if phase == 1:
            print("--- (phase 1)")
            # 2W Controller discovery
            expect_message("110000" + int8_block(0, 1) + int16_block(1, phase) + "ff")
            send_message("110100")

            # the set&go device itself? to get the key from?
            send_message("110201 0007   00 03 2dac01   01 03 2dac01   02 02 03ff   03 01 00   04 01 01   05 01 01   06 01 00   07 01 01   08 01 03   09 01 00   ff")
            expect_message("110300")
        elif phase == 2:
            print("--- (phase 2)")
            # 2W Equipment discovery
            expect_message("110000" + int8_block(0, 2) + int16_block(1, phase) + hex_block(2, "7859af8d446b5b7154cda7e1a378cb02") + "ff")
            send_message("110100")


            # main_type == 4: IoNodeByActuator
            # main_type == 5: IoNodeByBeacon
            # main_type == 6: IoNodeByScd
            # main_type == 7: IoNodeByController
            # main_type == 8: IoNodeBySensor
            # main_type == 9: IoNodeBySensor
            # main_type == 10: IoNodeBySensorBox

            # sub_type == 0: Unknown
            # sub_type == 1: Interior venetian blind
            # sub_type == 2: Roller shutter
            # sub_type == 3: Vertical blind
            # sub_type == 4: Window
            # sub_type == 5: Garage door
            # sub_type == 6: Light
            # there are more sub types

            #                    vvvv main_type?
            #                                 vvvvvv motor address as displayed in UI
            #                                                vvvvvv related motor address?
            #                                                               vvvv sub_type?
            send_message("110201 0004   00 03 2d680a   01 03 7944bc   02 02 0002   03 01 00   04 01 01   05 01 01   06 01 00   07 01 00   08 01 01   09 01 00   ff")
            expect_message("110300")
            send_message("110201 0004   00 03 7944bc   01 03 7944bc   02 02 0004   03 01 01   04 01 01   05 01 01   06 01 00   07 01 01   08 01 00   09 01 00   ff")
            expect_message("110300")
            send_message("110201 0004   00 03 d6bbc7   01 03 d6bbc7   02 02 0004   03 01 01   04 01 01   05 01 01   06 01 00   07 01 01   08 01 00   09 01 00   ff")
            expect_message("110300")
            send_message("110201 0004   00 03 ff10c0   01 03 d6bbc7   02 02 0002   03 01 00   04 01 01   05 01 01   06 01 00   07 01 00   08 01 01   09 01 00   ff")
            expect_message("110300")
            main_type, sub_type = 4, 2
            motor_id, related_motor_id = 0x123400, 0x123400
            send_message("110201" +
                struct.pack('>H', main_type).hex() +
                int24_block(0, motor_id) +
                int24_block(1, related_motor_id) +
                int16_block(2, sub_type) +
                int8_block(3, 1) +
                int8_block(4, 1) +
                int8_block(5, 2) +
                int8_block(6, 0) +
                int8_block(7, 1) +
                int8_block(8, 0) +
                int8_block(9, 0) +
                "ff")
            expect_message("110300")
        elif phase == 6:
            print("--- (phase 6)")
            expect_message("110000" + int8_block(0, 1) + int16_block(1, phase) + "ff")
            send_message("110100")
        elif phase == 0x40:
            print("--- (phase 0x64)")
            expect_message("110000" + int8_block(0, 2) + int16_block(1, phase) + hex_block(2, "7859af8d446b5b7154cda7e1a378cb02") + "ff")
            send_message("110100")
        else:
            assert False

        send_message("110200")
        expect_message("110300")

    elif message[0:3] == bytes.fromhex("110002"):
        print("--- IoKeyGettingSession")
        expect_message("110002   00 03   2dac01   ff")
        send_message("110100")
        send_message("110200" + hex_block(0, "7859af8d446b5b7154cda7e1a378cb02") + "ff")
        expect_message("110300")

    elif message[0:3] == bytes.fromhex("11e400"):
        print("--- WriteObjectSynchro 11")
        # one of:
        # expect_message("11e400 01 00000002 0000 ffff   00 10 7859af8d446b5b7154cda7e1a378cb02   ff")
        # expect_message("11e400 01 00000004 0000 ffff   00 03 2d680a   01 03 7944bc   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
        # expect_message("11e400 01 00000004 0001 ffff   00 03 7944bc   01 03 7944bc   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
        # expect_message("11e400 01 00000004 0002 ffff   00 03 d6bbc7   01 03 d6bbc7   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
        # expect_message("11e400 01 00000004 0003 ffff   00 03 ff10c0   01 03 d6bbc7   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
        # expect_message("11e400 01 00000007 0000 ffff   00 03 2dac01   01 03 2dac01   02 02 03ff   03 01 00   05 01 02   04 01 01   06 01 01   07 01 01   08 01 00   ff")
        expect_any_message()
        send_message("11e500")

    elif message[0:3] == bytes.fromhex("110028"):
        print("--- IoGetNameSession")
        motor_id = read_int24_block(message[3:], 0)
        expect_message("110028" +
            int24_block(0, motor_id) +
            "ff")
        send_message("110100")
        send_message("110200" +
            string_block(0, 16, "motor_%06X" % motor_id) +
            int16_block(0xfe, 0xffb8) +
            "ff")
        expect_message("110300")

    elif message[0:3] == bytes.fromhex("110021"):
        print("--- IoActionStatusSession")
        motor_id = read_int24_block(message[3:], 0)
        expect_message("110021" +
            int24_block(0, motor_id) +
            int16_block(1, 0x1003) +
            "ff")
        send_message("110100")
        send_message("110200   00 03 050000   01 02 0000   03 03 72be6e   04 01 01   02 05 10c800c800   fe 02 ffb7   ff")
        expect_message("110300")

    elif message[0:3] == bytes.fromhex("110022"):
        print("--- IoIdentifyNodeSession")
        # identify
        motor_id = read_int24_block(message[3:], 0)
        expect_message("110022" +
            int24_block(0, motor_id) +
            int8_block(1, 1) +
            int8_block(2, 0xfe) +
            "ff")
        send_message("110100")
        send_message("110200   fe 02 ffb4   ff")
        expect_message("110300")

    elif message[0:3] == bytes.fromhex("110027"):
        print("--- IoSetNameSession")
        expect_message("110027   00 03 2d680a   01 06 68656c6c6f00   ff")
        # I have no logs, so the following is probably wrong
        send_message("110100")
        send_message("110200")
        expect_message("110300")

    elif message[0:3] == bytes.fromhex("11000b"):
        print("--- IoObjectsTransferWithRCMSession")
        # pair
        expect_message("11000b   01 01 01   02 01 01   03 06 0004012d680a   ff")
        # I have no logs, so the following is probably wrong
        expect_any_message()
        send_message("110100")
        send_message("110200")
        expect_message("110300")

    elif message[0:3] == bytes.fromhex("110003"):
        print("--- IoKeyUpdateSession")
        # for temporary keys?
        # I have no logs, so the following is probably wrong
        expect_any_message()
        send_message("110100")
        send_message("110200")
        expect_message("110300")

    elif message[0:3] == bytes.fromhex("110004"):
        print("--- IoKeyGivingSession")
        # for temporary keys?
        # I have no logs, so the following is probably wrong
        expect_any_message()
        send_message("110100")
        send_message("110200")
        expect_message("110300")

    elif message[0:3] == bytes.fromhex("110005"):
        print("--- IoKeyCheckingSession")
        # for temporary keys?
        # I have no logs, so the following is probably wrong
        expect_any_message()
        send_message("110100")
        send_message("110200")
        expect_message("110300")

    elif message[0:3] == bytes.fromhex("110007"):
        print("--- IoConfigurationStateSession")
        # called when skipping 2W devices
        # I have no logs, so the following is probably wrong
        expect_any_message()
        send_message("110100")
        send_message("110200")
        expect_message("110300")

    elif message[0:3] == bytes.fromhex("110029"):
        print("--- IoGetGeneralInfoSession")
        # called when skipping 2W devices
        # I have no logs, so the following is probably wrong
        expect_any_message()
        send_message("110100")
        send_message("110200" +
            string_block(0, 16, "abc") + # shows up as "motor vabc" (version?)
            string_block(1, 16, "def") +
            hex_block(2, b"ghi".hex()) +
            hex_block(3, b"jkl".hex()) +
            hex_block(4, b"mno".hex()) +
            "ff")
        expect_message("110300")
    print()

if False:
    # print("detect 2W control")
    # expect_message("10e2d0 510000ffff")
    # send_message("10e300 ffff   00 38 353036373530314130303300ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff   01 38 3531303234303441303432563200ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff   ff")
    # expect_message("1106")
    # send_message("110703")

    # expect_message("11e6")
    # send_message("11e700")

    # while True:
    #     # 110000   00 01 01   01 02 0001   ff = Nina io
    #     # 110000   00 01 01   01 02 0001   ff = Nina Timer io
    #     # 110000   00 01 01   01 02 0001   ff = Connexoon
    #     # 110000   00 01 01   01 02 0001   ff = TaHoma
    #     # 110000   00 01 01   01 02 0001   ff = Telis Composio io
    #     # 110000   00 01 01   01 02 0001   ff = Easysun io
    #     # 110000   00 01 01   01 02 0001   ff = TaHoma Pad io
    #     # 110000   00 01 01   01 02 0001   ff = other two-way (2W) io control
    #     # 110000   00 01 01   01 02 0001   ff = Skitter io
    #     # 110000   00 01 04   01 02 0002   ff = other one-way (1W) io control
    #     # 110000   00 01 01   01 02 0040   ff = other (skip both 1W and 2W)
    #     print(next(received_packets).hex())
    #     send_message("110100")
    #     send_message("110200")
    #     expect_message("110300")
    #     expect_message("11e6")
    #     send_message("11e700")

    #print("retry detect 2W control (not detected)")
    #expect_message("110000   00 01 01   01 02 0001   ff")
    #send_message("110100")
    #send_message("110200")
    #expect_message("110300")

    #expect_message("11e6")
    #send_message("11e700")

    # automatic second attempt
    #expect_message("110000   00 01 01   01 02 0001   ff")
    #send_message("110100")
    #send_message("110200")
    #expect_message("110300")

    #expect_message("11e6")
    #send_message("11e700")

    # press retry

    # print("detect 2W control")
    # expect_message("110000   00 01 01   01 02 0001   ff") # IoDiscoverNodesSession
    # send_message("110100")
    # send_message("110201 0007   00 03 2dac01   01 03 2dac01   02 02 03ff   03 01 00   04 01 01   05 01 01   06 01 00   07 01 01   08 01 03   09 01 00   ff")
    # expect_message("110300")
    # send_message("110200")
    # expect_message("110300")

    # expect_message("110002   00 03   2dac01   ff") # IoKeyGettingSession
    # send_message("110100")
    # send_message("110200   00 10 7859af8d446b5b7154cda7e1a378cb02   ff")
    # expect_message("110300")

    expect_message("11e6")
    send_message("11e700")
    expect_message("11e400 01 00000007 0000 ffff   00 03 2dac01   01 03 2dac01   02 02 03ff   03 01 00   05 01 02   04 01 01   06 01 01   07 01 01   08 01 00   ff")
    send_message("11e500")

    expect_message("110000   00 01 02   01 02 0002   02 10 7859af8d446b5b7154cda7e1a378cb02   ff") # IoDiscoverNodesSession
    send_message("110100")
    send_message("110201 0004   00 03 2d680a   01 03 7944bc   02 02 0002   03 01 00   04 01 01   05 01 01   06 01 00   07 01 00   08 01 01   09 01 00   ff")
    expect_message("110300")
    send_message("110201 0004   00 03 7944bc   01 03 7944bc   02 02 0004   03 01 01   04 01 01   05 01 01   06 01 00   07 01 01   08 01 00   09 01 00   ff")
    expect_message("110300")
    send_message("110201 0004   00 03 d6bbc7   01 03 d6bbc7   02 02 0004   03 01 01   04 01 01   05 01 01   06 01 00   07 01 01   08 01 00   09 01 00   ff")
    expect_message("110300")
    send_message("110201 0004   00 03 ff10c0   01 03 d6bbc7   02 02 0002   03 01 00   04 01 01   05 01 01   06 01 00   07 01 00   08 01 01   09 01 00   ff")
    expect_message("110300")
    send_message("110200")
    expect_message("110300")

    expect_message("11e6")
    send_message("11e700")
    expect_message("11e400 01 00000002 0000 ffff   00 10 7859af8d446b5b7154cda7e1a378cb02   ff")
    send_message("11e500")
    expect_message("11e400 01 00000004 0000 ffff   00 03 2d680a   01 03 7944bc   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    send_message("11e500")
    expect_message("11e400 01 00000004 0001 ffff   00 03 7944bc   01 03 7944bc   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    send_message("11e500")
    expect_message("11e400 01 00000004 0002 ffff   00 03 d6bbc7   01 03 d6bbc7   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    send_message("11e500")
    expect_message("11e400 01 00000004 0003 ffff   00 03 ff10c0   01 03 d6bbc7   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    send_message("11e500")
    expect_message("11e400 01 00000007 0000 ffff   00 03 2dac01   01 03 2dac01   02 02 03ff   03 01 00   05 01 02   04 01 01   06 01 01   07 01 01   08 01 00   ff")
    send_message("11e500")

    expect_message("110000   00 01 02   01 02 0040   02 10 7859af8d446b5b7154cda7e1a378cb02   ff") # IoDiscoverNodesSession
    send_message("110100")
    send_message("110200")
    expect_message("110300")

    expect_message("11e6")
    send_message("11e700")
    expect_message("11e400 01 00000002 0000 ffff   00 10 7859af8d446b5b7154cda7e1a378cb02   ff")
    send_message("11e500")
    expect_message("11e400 01 00000004 0000 ffff   00 03 2d680a   01 03 7944bc   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    send_message("11e500")
    expect_message("11e400 01 00000004 0001 ffff   00 03 7944bc   01 03 7944bc   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    send_message("11e500")
    expect_message("11e400 01 00000004 0002 ffff   00 03 d6bbc7   01 03 d6bbc7   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    send_message("11e500")
    expect_message("11e400 01 00000004 0003 ffff   00 03 ff10c0   01 03 d6bbc7   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    send_message("11e500")
    expect_message("11e400 01 00000007 0000 ffff   00 03 2dac01   01 03 2dac01   02 02 03ff   03 01 00   05 01 02   04 01 01   06 01 01   07 01 01   08 01 00   ff")
    send_message("11e500")

    expect_message("110028   00 03 2d680a   ff") # IoGetNameSession
    send_message("110100")
    send_message("110200   00 10 526f6c6c6572204e696c5300ffffffff   fe 02 ffb8   ff")
    expect_message("110300")

    expect_message("110021   00 03 2d680a   01 02 1003 ff") # IoActionStatusSession
    send_message("110100")
    send_message("110200   00 03 050000   01 02 0000   03 03 72be6e   04 01 01   02 05 10c800c800   fe 02 ffb7   ff")
    expect_message("110300")

    expect_message("110028   00 03 7944bc ff") # IoGetNameSession
    send_message("110100")
    send_message("110200   00 10 57696e646f77204e696c7300ffffffff   fe 02 ffba   ff")
    expect_message("110300")

    expect_message("110021   00 03 7944bc   01 02 1003 ff") # IoActionStatusSession
    send_message("110100")
    send_message("110200   00 03 050000   01 02 0000   03 03 72be6e   04 01 01   02 05 10c800c800   fe 02 ffb8   ff")
    expect_message("110300")

    expect_message("110028   00 03 d6bbc7 ff") # IoGetNameSession
    send_message("110100")
    send_message("110200   00 10 57696e646f772068616c6c00ffffffff   fe 02 ffbb   ff")
    expect_message("110300")

    expect_message("110021   00 03 d6bbc7   01 02 1003 ff") # IoActionStatusSession
    send_message("110100")
    send_message("110200   00 03 050000   01 02 0000   03 03 72be6e   04 01 01   02 05 10c800c800   fe 02 ffba   ff")
    expect_message("110300")

    expect_message("110028   00 03 ff10c0 ff") # IoGetNameSession
    send_message("110100")
    send_message("110200   00 10 526f6c6c65722068616c5500ffffffff   fe 02 ffbb   ff")
    expect_message("110300")

    expect_message("110021   00 03 ff10c0   01 02 1003   ff") # IoActionStatusSession
    send_message("110100")
    send_message("110200   00 03 050000   01 02 0000   03 03 2dac01   04 01 01   02 05 100e020e02   fe 02 ffbb   ff")
    expect_message("110300")

    expect_message("11e6")
    send_message("11e700")
    expect_message("11e400 01 00000002 0000 ffff   00 10 7859af8d446b5b7154cda7e1a378cb02   ff")
    send_message("11e500")
    expect_message("11e400 01 00000004 0000 ffff   00 03 2d680a   01 03 7944bc   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    send_message("11e500")
    expect_message("11e400 01 00000004 0001 ffff   00 03 7944bc   01 03 7944bc   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    send_message("11e500")
    expect_message("11e400 01 00000004 0002 ffff   00 03 d6bbc7   01 03 d6bbc7   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    send_message("11e500")
    expect_message("11e400 01 00000004 0003 ffff   00 03 ff10c0   01 03 d6bbc7   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    send_message("11e500")

    #print("not sure")
    #expect_message("110000   00 01 01   01 02 0006   ff")
    #send_message("110100")
    #send_message("110200")
    #expect_message("110300")

    #expect_message("11e6")
    #send_message("11e700")
    #expect_message("11e400 01 00000002 0000 ffff   00 10 7859af8d446b5b7154cda7e1a378cb02   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0000 ffff   00 03 2d680a   01 03 7944bc   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0001 ffff   00 03 7944bc   01 03 7944bc   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0002 ffff   00 03 d6bbc7   01 03 d6bbc7   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0003 ffff   00 03 ff10c0   01 03 d6bbc7   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    #send_message("11e500")

    #expect_message("110000   00 01 01   01 02 0040   ff")
    #send_message("110100")
    #send_message("110200")
    #expect_message("110300")

    #expect_message("11e6")
    #send_message("11e700")
    #expect_message("11e400 01 00000002 0000 ffff   00 10 7859af8d446b5b7154cda7e1a378cb02   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0000 ffff   00 03 2d680a   01 03 7944bc   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0001 ffff   00 03 7944bc   01 03 7944bc   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0002 ffff   00 03 d6bbc7   01 03 d6bbc7   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0003 ffff   00 03 ff10c0   01 03 d6bbc7   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    #send_message("11e500")

    #expect_message("110000   00 01 02   01 02 0002   02 10 7859af8d446b5b7154cda7e1a378cb02   ff")
    #send_message("110100")
    #send_message("110200")
    #expect_message("110300")

    #expect_message("11e6")
    #send_message("11e700")
    #expect_message("11e400 01 00000002 0000 ffff   00 10 7859af8d446b5b7154cda7e1a378cb02   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0000 ffff   00 03 2d680a   01 03 7944bc   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0001 ffff   00 03 7944bc   01 03 7944bc   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0002 ffff   00 03 d6bbc7   01 03 d6bbc7   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0003 ffff   00 03 ff10c0   01 03 d6bbc7   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    #send_message("11e500")

    #expect_message("110000   00 01 02   01 02 0040   02 10 7859af8d446b5b7154cda7e1a378cb02   ff")
    #send_message("110100")
    #send_message("110200")
    #expect_message("110300")

    #expect_message("11e6")
    #send_message("11e700")
    #expect_message("11e400 01 00000002 0000 ffff   00 10 7859af8d446b5b7154cda7e1a378cb02   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0000 ffff   00 03 2d680a   01 03 7944bc   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0001 ffff   00 03 7944bc   01 03 7944bc   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0002 ffff   00 03 d6bbc7   01 03 d6bbc7   02 02 0004   03 01 01   05 01 01   04 01 01   06 01 00   07 01 01   08 01 00   ff")
    #send_message("11e500")
    #expect_message("11e400 01 00000004 0003 ffff   00 03 ff10c0   01 03 d6bbc7   02 02 0002   03 01 00   05 01 01   04 01 01   06 01 00   07 01 00   08 01 01   ff")
    #send_message("11e500")

    print("get information on 'Roller halU'")
    expect_message("110028   00 03 ff10c0   ff")
    send_message("110100")
    send_message("110200   00 10 526f6c6c65722068616c5500ffffffff   fe 02 ffb7   ff")
    expect_message("110300")

    print("identify 'Roller halU'")
    expect_message("110022   00 03 ff10c0   01 01 01   02 01 fe   ff")
    send_message("110100")
    send_message("110200   fe 02 ffb4   ff")
    expect_message("110300")

    print("get information on 'Window Nils'")
    expect_message("110028   00 03 7944bc   ff")
    send_message("110100")
    send_message("110200   00 10 57696e646f77204e696c7300ffffffff   fe 02 ffb6   ff")
    expect_message("110300")

    print("get information on 'Window hall'")
    expect_message("110028   00 03 d6bbc7   ff")
    send_message("110100")
    send_message("110200   00 10 57696e646f772068616c6c00ffffffff   fe 02 ffb5   ff")
    expect_message("110300")

    print("get information on 'Window Nils'")
    expect_message("110028   00 03 7944bc   ff")
    send_message("110100")
    send_message("110200   00 10 57696e646f77204e696c7300ffffffff   fe 02 ffb6   ff")
    expect_message("110300")

    print("get information on 'Window hall'")
    expect_message("110028   00 03 d6bbc7   ff")
    send_message("110100")
    send_message("110200   00 10 57696e646f772068616c6c00ffffffff   fe 02 ffb4   ff")
    expect_message("110300")

    print("identify 'Window hall'")
    expect_message("110022   00 03 d6bbc7   01 01 01   02 01 fe   ff")
    send_message("110100")
    send_message("110200   fe 02 ffb3   ff")
    expect_message("110300")

    expect_message("110022   00 03 d6bbc7   01 01 01   02 01 fe   ff")
    send_message("110100")
    send_message("110200   fe 02 ffba   ff")
    expect_message("110300")

    expect_message("110022   00 03 d6bbc7   01 01 01   02 01 fe   ff")
    send_message("110100")
    send_message("110200   fe 02 ffbe   ff")
    expect_message("110300")



    # sessions:
    # 0x005f9b64 IoDiscoverNodesSession
    # 0x005feb56 IoKeyGettingSession
    # 0x005f9b64 IoDiscoverNodesSession
    # 0x005f9b64 IoDiscoverNodesSession
    # 0x0060a614 IoUpdateActuatorDataSession : IoComposedSession : IoMultipleSession
    # 0x005fcd86 IoGetNameSession
    # 0x005fae36 IoActionStatusSession
    # 0x0060a614 IoUpdateActuatorDataSession : IoComposedSession : IoMultipleSession
    # 0x005fcd86 IoGetNameSession
    # 0x005fae36 IoActionStatusSession
    # 0x0060a614 IoUpdateActuatorDataSession : IoComposedSession : IoMultipleSession
    # 0x005fcd86 IoGetNameSession
    # 0x005fae36 IoActionStatusSession
    # 0x0060a614 IoUpdateActuatorDataSession : IoComposedSession : IoMultipleSession
    # 0x005fcd86 IoGetNameSession
    # 0x005fae36 IoActionStatusSession
    # 0x0060a614 IoGetInstallerInfosDataSession : IoComposedSession : IoMultipleSession
    # 0x005fcd86 IoGetNameSession
    # 0x005fd0f4 IoIdentifyNodeSession
