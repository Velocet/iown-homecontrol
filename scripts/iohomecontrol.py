# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class Iohomecontrol(KaitaiStruct):
    """describes a io-homecontrol packet (Layer 3; Network)
    It starts with the SFD (Start Frame Delimiter) and ends with a checksum (CRC-16)
    The encoding is big-endian (except the 16-bit checksum)
    example: ff 33 f8 00 00 00 7f 70 87 58 00 01 61 d4 00 80 c8 00 00 3b d5 05 52 68 75 49 9c 7e 72
             |___|       |______| |______|                            |___|                   |___|
              SFD         target   source                            counter                   crc
    """

    class Order(Enum):
        single = 0
        next_in_series = 1
        next_in_parallel = 2
        command_group_end = 3

    class Mode(Enum):
        two_way = 0
        one_way = 1

    class Command(Enum):
        execute_function = 0
        activate_mode = 1
        direct_command = 2
        private_command = 3
        private_command_answer = 4
        discover = 40
        discover_answer = 41
        discover_remote = 42
        discover_remote_answer = 43
        discover_actuator_confirmation = 44
        discover_confirmation_ack = 45
        send_key = 48
        ask_challenge = 49
        key_transfer = 50
        key_transfer_ack = 51
        address_request = 54
        address_answer = 55
        launch_key_transfer = 56
        remove_controller = 57
        challenge_request = 60
        challenge_response = 61
        script_upload = 70
        download_config = 71
        rename_file = 74
        get_name = 80
        get_name_answer = 81
        write_name = 82
        write_name_ack = 83
        get_general_info_1 = 84
        general_info_1_answer = 85
        get_general_info_2 = 86
        general_info_2_answer = 87
        bootloader_command = 224
        bootloader_device = 225
        send_raw_message = 240
        reboot = 242
        service_status_ack = 243
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.sfd = self._io.read_bytes(2)
        if not self.sfd == b"\xFF\x33":
            raise kaitaistruct.ValidationNotEqualError(b"\xFF\x33", self.sfd, self._io, u"/seq/0")
        self.control1 = Iohomecontrol.Control1(self._io, self, self._root)
        self.control2 = Iohomecontrol.Control2(self._io, self, self._root)
        self.target_id = self._io.read_bits_int_be(24)
        self.source_id = self._io.read_bits_int_be(24)
        self._io.align_to_byte()
        self.command = KaitaiStream.resolve_enum(Iohomecontrol.Command, self._io.read_u1())
        self.parameter = self._io.read_bytes((((self.control1.payload_length - 8) - 2) - 6))
        self.counter = self._io.read_u2be()
        self.mac = self._io.read_bytes(6)
        self.checksum = self._io.read_u2le()

    class Control1(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.order = KaitaiStream.resolve_enum(Iohomecontrol.Order, self._io.read_bits_int_be(2))
            self.mode = KaitaiStream.resolve_enum(Iohomecontrol.Mode, self._io.read_bits_int_be(1))
            self.payload_length = self._io.read_bits_int_be(5)


    class Control2(KaitaiStruct):
        """Extended Frame Information."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.use_beacon = self._io.read_bits_int_be(1) != 0
            self.routed = self._io.read_bits_int_be(1) != 0
            self.low_power_mode = self._io.read_bits_int_be(1) != 0
            self.ack = self._io.read_bits_int_be(1) != 0
            self.unknown = self._io.read_bits_int_be(2)
            self.protocol_version = self._io.read_bits_int_be(2)



