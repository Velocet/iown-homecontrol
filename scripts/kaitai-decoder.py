#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Decode io-homecontrol packet using auto-generated code from Kaitai Struct"""

"""
How-to
  1. Download and Install Kaitai Struct compiler: http://kaitai.io/#download
  2. generate decoder-class from Kaitai Struct with `kaitai-struct-compiler -t python io-homecontrol.ksy`
  3. install python dependencies with `pip install crc kaitaistruct`
  4. run this file: `python3 kaitai-decoder.py`
"""
from crc import Calculator, Crc16
from iohomecontrol import Iohomecontrol, KaitaiStream, BytesIO

# sample = "ff33 f8 00 00007f e1f573 00 0161d40080c80000 0daa eb6adf4f8fad 3404"
sample = "FF 33 F6 00 00 00 3F 48 5B 37 00 01 43 D2 00 00 00       03 D6 B6 3C B3 CD CD 2B 8A 2E"

packet = bytes.fromhex(sample)
decoded = Iohomecontrol(KaitaiStream(BytesIO(packet)))

print("Control 1:")
print("    Order: {}".format(decoded.control1.order.name))
print("    Mode: {}".format(decoded.control1.mode.name))
print("    Payload Length: {}".format(decoded.control1.payload_length))
print("Control 2:")
print("    use_beacon: {}".format(decoded.control2.use_beacon))
print("    routed: {}".format(decoded.control2.routed))
print("    low_power_mode: {}".format(decoded.control2.low_power_mode))
print("    ack: {}".format(decoded.control2.ack))
print("    protocol_version: {}".format(decoded.control2.protocol_version))
print("Source Node-ID: 0x{:06x}".format(decoded.source_id))
print("Target Node-ID: 0x{:06x}".format(decoded.target_id))
print("Command: {}".format(decoded.command.name))
print("Payload Bytes: [{}]".format(', '.join('0x{:02X}'.format(x) for x in decoded.parameter)))
print("Counter: 0x{:04x} ({})".format(decoded.counter, decoded.counter))
print("MAC: 0x{:012x}".format(int.from_bytes(decoded.mac, "big")))

# verify checksum; skip SFD and stop before the received checksum
crc_ok = Calculator(Crc16.KERMIT).verify(packet[2:-2], decoded.checksum)
print("Checksum: {} (0x{:04x})".format("OK" if crc_ok else "Error", decoded.checksum))
