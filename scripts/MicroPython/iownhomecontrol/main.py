#!/usr/bin/env python
# -*- coding: utf-8 -*-
# SPDX-License-Identifier: BuyMeABeer-1.0
"""Entry point for iown-homecontrol."""


"""Constant variables."""
__VERSION__ = "0.1.0"
__NAME__ = "iown-homecontrol for MicroPython"


"""Imports:  Standard Libs > 3rd Party > Local."""
import os
import sys
import argparse
import esp32


"""Main entry point: Always executes when initialized."""
def main(arguments): # pragma: no cover
    """App entry point = Main Function.

    Executes on commands: `python -m iownHomecontrol` and `$ iownHomecontrol `.
    """
    # parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    # parser.add_argument('infile', help="Input file", type=argparse.FileType('r'))
    # parser.add_argument('-o', '--outfile', help="Output file", default=sys.stdout, type=argparse.FileType('w'))
    # args = parser.parse_args(arguments)
    # print(args)
    # def func(a: str = '' | int = 0 | None = None, b: str = '' | None = None) -> str:

    """CRC16-KERMIT - Calculate the CRC16-KERMIT and return bool/bytes.

        Args:
            data: bytes over which the crc is calculated.
            crc: crc to compare against the calculated data crc.
              Optional: If not given the function returns the crc for data.

        Returns:
            Boolean: True/False if args(crc) is correct
            bytes:   CRC for args(data) if args(crc) is missing

        Raises:
            GuruMeditation: Press left mouse button to continue.

        Example:
        ioFrame    = b'\xC8\x10\x00\x00\x3B\x26\x64\xB3\x28' # KLR100 Discover Frame
        ioFrameCrc = b'\x92\x8A'                             # KLR100 Discover CRC
        print(crc16kermit(data=ioFrame))                     # Returns 0x928A
        print(crc16kermit(data=ioFrame, crc=ioFrameCrc))     # Returns True
        print(crc16kermit(data=ioFrame, crc=b'\xD0\x0D'))    # Returns False
    """
    def crc16kermit(data: bytes = 0, crc: bytes = None, result: int = 0, POLY: int = 0x8408):
        for _byte in data:
            result = result ^ _byte
            for _pos in range(8): result = (result >> 1) ^ POLY if result & 1 else result >> 1
        result = result.to_bytes(length=2, byteorder='little', signed=False)
        return (result == crc) if crc else result

    # def rtc_example():
    #     from machine import RTC
    #     rtc = RTC()
    #     rtc.datetime((2017, 8, 23, 1, 12, 48, 0, 0)) # set a specific date and time
    #     rtc.datetime() # get date and time

    # def esp32_heltec():
    #     """https://docs.micropython.org/en/latest/esp32/quickref.html#webrepl-web-browser-interactive-prompt"""
    #     import webrepl_setup # WebREPL (web browser interactive prompt)
    #     import webrepl
    #     webrepl.start()
    #     webrepl.start(password='mypass') # or, start with a specific password


"""Executes when NOT initialized via import."""
if __name__ == '__main__':  # pragma: no cover
    sys.exit(main(sys.argv[1:]))


# https://google.github.io/styleguide/pyguide.html
