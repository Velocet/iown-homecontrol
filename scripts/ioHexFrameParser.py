#!/usr/bin/env python3

import sys
import struct
import binascii

#### io-homecontrol definitions

class IoFrame:

  Oneway = "One-Way"
  TwoWay = "Two-Way"

  def __init__(self, raw=None):
    self.raw = raw
    self.control_byte1 = 0
    self.control_byte2 = 0
    self.length = 0
    self.end_frame = False
    self.start_frame = False
    self.protocol_mode = IoFrame.Oneway
    self.from_addr = 0
    self.to_addr = 0
    self.use_beacon = False
    self.routed = False
    self.lpm = False
    self.protocol_version = 0
    self.commandid = 0
    self.commanddata = None
    self.seqnum = 0
    self.crc = 0
    if raw is not None:
      self.parse_raw(raw)

  def parse_raw(self, rframe):
    if len(rframe) < 5:
      raise ValueError("An io frame has at least control bytes, command ID and CRC")
    self.raw = rframe
    self.control_byte1 = rframe[0]
    self.control_byte2 = rframe[1]
    self.length = self.control_byte1 & 0x1f
    if self.length > len(rframe):
      raise ValueError("Frame is incomplete (bytes missing)")
    self.end_frame = True if rframe[0] & 0x80 != 0 else False
    self.start_frame = True if rframe[0] & 0x40 != 0 else False
    self.protocol_mode = IoFrame.Oneway if rframe[0] & 0x20 != 0 else IoFrame.TwoWay
    self.from_addr = rframe[2:5]
    self.to_addr = rframe[5:8]
    self.use_beacon = True if rframe[1] & 0x80 != 0 else False
    self.routed = True if rframe[1] & 0x40 != 0 else False
    self.lpm = True if rframe[1] & 0x20 != 0 else False
    self.protocol_version = rframe[1] & 0x03
    self.commandid = rframe[8]
    self.commanddata = rframe[9:self.length+1]
    self.crc = rframe[self.length+1:]

  def __str__(self) -> str:
    return_string = ""
    if self.length != 0:
      return_string += f"io-homecontrol frame: length={self.length}, from_addr={binascii.hexlify(self.from_addr)}, to_addr={binascii.hexlify(self.to_addr)}\n"
      return_string += f"  control byte 1=0x{self.control_byte1:02x} ("
      return_string += f"first frame={self.start_frame}, last frame={self.end_frame}, "
      return_string += f"protocol mode = {self.protocol_mode})\n"
      return_string += f"  control byte 2=0x{self.control_byte2:02x} ("
      return_string += f"use beacon={self.use_beacon}, routed={self.routed}, low power mode={self.lpm}, "
      return_string += f"protocol version={self.protocol_version})\n"
      return_string += f"  command ID=0x{self.commandid:02x}\n"
      return_string += f"  command data={binascii.hexlify(self.commanddata)}\n"
      return_string += f"  CRC={binascii.hexlify(self.crc)}\n"
      return return_string
    else:
      return "None"

def main(args):
  if len(args) < 2 or len(args) == 2 and args[1] == "-f":
    print(f"Usage: {args[0]} <hex encoded frame or -f file>")
    return

  raw_frames = []
  if args[1] == "-f":
    with open(args[2], "rt") as f:
      for line in f:
        raw_frames.append(line)
  else:
    raw_frames.append(''.join(sys.argv[1:]))

  for rframe in raw_frames:
    frame = IoFrame(bytes.fromhex(rframe))
    print(frame)


if __name__ == "__main__":
  main(sys.argv)
