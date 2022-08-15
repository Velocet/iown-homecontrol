# io-homecontrol radio protocol description

## Physical specifications

The io-homecontrol protocol is constructed on 2-FSK encoded frames.

There are 3 channels as following:

* 868.25MHz
* 868.95MHz
* 869.85MHz

The data is transmitted with a baud rate of 38400bauds (on 2-FSK that's a bandwith of 38,4kbs).

## Raw data sending

The data is transmitted as 8-bit bytes with 1 start bit (`0`) and a stop bit (`1`). Bytes are transmitted in order, but bits of each byte are swapped: the least significant bit is transmitted first.

Messages start with a preamble with an alternating bit sequence: `010101...` They are constructed from a long sequence of bytes `0x55`. This gives a bit sequence: `0 10101010 1 0 10101010 1...` There seem to be multiple variants of the preamble length. The preamble is completed by the bytes `FF 33`, i.e. bits `0 11111111 1 0 11001100 1`.

Then, it sends the data packet's bytes. The first 5 least significant bits of the data packet, that is the first byte `& 0x1F`, gives the length of the payload. In the example `0 00011111 1`, it is `0b111000 = 0x18 = 24`. The length of the payload does not include the first byte itself. After the payload, there is a 16-bit CRC with polynomial `0x(1)8408` over the data packet (i.e. length byte + payload). The CRC's initial value is `0` and it does not employ an XOR/NOT. The least significant byte of the CRC is transmitted first.

## Packet structure

L, S and X are variable offsets/lengths. In packets found so far, S = 8 and X = 0.

* [0] & 0x1F: length of payload (L), excluding this first byte and 2 trailing CRC bytes.
* [0] & 0x20: iff set, there is a 8 byte suffix (S = 8). Otherwise, S = 0.
* [0] & 0x40: unknown
* [0] & 0x80: unknown
* [1] & 0x03: iff == 0x03 and the next bytes equal 0B 01, then skip the next two bytes (X = 2). Otherwise, X = 0.
* [1] & 0x04: unknown
* [1] & 0x08: unknown
* [1] & 0x10: unknown
* [1] & 0x20: unknown
* [1] & 0xC0: unknown; 2 bits seem to be related
* [2:4]: ignored if equal to 0B 01 and [1] & 0x03 == 0x03
* [X+2:X+5]: address (presumably destination?)
* [X+5:X+8]: sender address
* [X+8]: command/message code. The firmware dispatches on this byte.
* [X+9:1+L-S]: application data
* [1+L-S:1+L]: optional suffix
    * [1+L-S+0]: unknown
    * [1+L-S+1]: sequence number?
    * [1+L-S+2:1+L-S+8]: 6 high entropy bytes.

## Address structure

Addresses have a specific structure. It looks like there are several address classes. Some of the structure is parsed using the following algorithm:
```
int get_address_class(char (*address)[3])
{
  if (address[0] != 0) { // bits 0..8
    return 13;
  }
  if (address[1] || (address[2] & 0xC0) != 0) // bits 8..18
  {
    switch (address[2] & 0x3F) { // bits 18..24
      case 0x3Bu: return 7;
      case 0x3Cu: return 8;
      case 0x3Du: return 9;
      case 0x3Eu: return 10;
      case 0x3Fu: return 11;
      default: return 12;
    }
  }
  else
  {
    switch (address[2] & 0x3F) // bits 18..24
    {
    case 0: return 0;
    default: return 1;
    case 0x3Bu: return 2;
    case 0x3Cu: return 3;
    case 0x3Du: return 4;
    case 0x3Eu: return 5;
    case 0x3Fu: return 6; // broadcast?
    }
  }
}
```

## Example

This analysis was based on the data from https://github.com/101010b/io-home - This is a very useful starting point. Two things missed by this source were the start- and stop bits and the fact that the data is bitswapped. Correcting for this and removing the leading/trailing preamble and noise gives the following three byte sequences.

Below the packets from 101010b (in sequence), the data sniffed from a SMOOVE Origin IO is listed. For both data sources, in reality all packets were repeated 4 times.

```
vvvvv end of preamble
      vv first byte, length and flags
         vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv payload
         vv more flags
            vvvvvvvv destination address
                     vvvvvvvv sender address
                              vv command/message code
                                 vvvvvvvvvvvvvvvvvvvvvvv application data (low entropy)
                                                         vvvvvvvvvvvvvvvvvvvvvvv suffix
                                                            vv sequence number?
                                                               vvvvvvvvvvvvvvvvv high entropy (challenge? anti-replay?)
                                                                                 vvvvv CRC over first byte + payload

FF 33 F8 00 00 00 3F 1A 38 0B 00 01 61 00 00 80 D8 05 00 02 A6 24 22 2E 8B A3 51 5F 52 - 101010b packet 1
FF 33 F8 00 00 00 3F 1A 38 0B 20 02 FF 01 61 00 0E 00 00 02 A7 4F E2 F6 8C 4F 88 B5 0D - 101010b packet 2
FF 33 F8 00 00 00 3F 1A 38 0B 20 02 FF 01 61 00 05 FF 00 02 A8 C7 74 2D FE 1F 33 3B 82 - 101010b packet 3

FF 33 F6 00 00 00 3F 48 5B 37 00 01 43 D2 00 00 00       03 D6 B6 3C B3 CD CD 2B 8A 2E - SMOOVE Origin IO packet 1
FF 33 F8 00 00 00 3F 48 5B 37 20 02 ff 01 43 02 0c 00 00 03 D7 74 59 2B C4 B3 36 FD A4 - SMOOVE Origin IO packet 2
FF 33 F8 00 00 00 3F 48 5B 37 20 02 ff 01 43 02 05 ff 00 03 D8 90 39 62 DB AD 98 FB 24 - SMOOVE Origin IO packet 3
```

## CRC example

The following shows how to check the CRC:

```
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

print("%04X" % compute_crc_8408(b"\xF8\x00\x00\x00\x3F\x1A\x38\x0B\x00\x01\x61\x00\x00\x80\xD8\x05\x00\x02\xA6\x24\x22\x2E\x8B\xA3\x51")) # gives 525F
print("%04X" % compute_crc_8408(b"\xF8\x00\x00\x00\x3F\x1A\x38\x0B\x00\x01\x61\x00\x00\x80\xD8\x05\x00\x02\xA6\x24\x22\x2E\x8B\xA3\x51\x5F\x52")) # gives 0000, i.e. CRC is ok
```
