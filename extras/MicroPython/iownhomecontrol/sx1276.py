#!/usr/bin/env python
# -*- coding: utf-8 -*-
# SPDX-License-Identifier: BuyMeABeer-1.0
"""iown-homecontrol - SX1276 Transceiver"""


"""Imports:  Standard Libs > 3rd Party > Local."""
from iownhomecontrol import config
from machine import Pin, SPI, SoftSPI, UART
from time import sleep
import gc
import struct
import esp32


class sx1276:

    """State Machine = RegOpMode."""
    Mode = {
        'SLEEP'        : 0b000,
        'STANDBY'      : 0b001,
        'FSTX'         : 0b010,
        'TX'           : 0b011,
        'FSRX'         : 0b100,
        'RX'           : 0b101,
        'RXCONTINUOUS' : 0b101,
        'RXSINGLE'     : 0b110,
        'CAD'          : 0b111,}

    """SX1276 Transceiver - Basic Mode of Operation.

      - Configure (Soft)SPI/UART and setup your board
      - Set SX1276 into Sleep/StandBy
      - Configure SX1276 via SPI
      - Bring SX1276 back up
      - SX1276 ready to receive raw data
    """
    def __init__(self, boardConfig: dict | None = None, maxTxPwr: bool = False):
        self._board     = boardConfig if boardConfig else board.config
        self._regs      = config.Register
        self._regstdval = config.iownStd
        self._iownTxCh2 = config.iownMin

        self._iownData  = SoftSPI (                             # Initialise SPI Bus
          baudrate = 38400,                                     # SCK Clock Rate
          polarity = 0,                                         # Idle Clock Level
          phase    = 0,                                         # sample on first or second clock edge
          bits     = 8,                                         # transfer width in bits
          firstbit = SoftSPI.MSB,                               # MSB or LSB
          sck      = Pin(_board['DCLK'],Pin.OUT,Pin.PULL_DOWN), # CS/CLK to drive the SX1276 in cont. mode
          mosi     = Pin(_board['DATA'],Pin.OUT,Pin.PULL_UP),   # Data
          miso     = Pin(_board['DIO0'],Pin.IN, Pin.PULL_UP),)  # Abuse MISO as interrupt for tx_ready (not configured/used)
        self._spi = SPI(SPI_CH = _board['SPIch'])               # Construct SPI object on bus #
        _spi.init(                                              # Initialise SPI bus
          baudrate = 10_000_000,                                # SCK clock rate
          polarity = 0,                                         # Idle clock level
          phase    = 0,                                         # sample on first or second clock edge
          bits     = 8,                                         # transfer width in bits
          firstbit = SPI.MSB,                                   # MSB or LSB
          sck      = Pin(_board['SCK'], Pin.OUT,Pin.PULL_DOWN), # CS/CLK to drive the SX1276 in cont. mode
          mosi     = Pin(_board['MOSI'],Pin.OUT,Pin.PULL_UP),   # Data
          miso     = Pin(_board['MISO'],Pin.IN, Pin.PULL_UP),)  # Abuse MISO as interrupt for tx_ready (not configured/used)

        def _pinInit():
            """
            ESP32 PIN Drive Strengths

                DRIVE_0:  5mA / 130 ohm
                DRIVE_1: 10mA /  60 ohm
                DRIVE_2: 20mA /  30 ohm (default)
                DRIVE_3: 40mA /  15 ohm
            """
            for _pin in _board.key:
                  # foreach _pin read and configure the pin

    """UART"""
    def uart_write():
        # UART objects can be created and initialised using:
        uart = UART(1, 38400)                         # init with given baudrate
        uart.init(38400, bits=8, parity=None, stop=1, tx=_board[DATA], rts=_board[DCLK], timeout=0, timeout_char=0) # init with given parameters
        # A UART object acts like a stream object and reading and writing is done using the standard stream methods:
        uart.read(10)       # read 10 characters, returns a bytes object
        uart.read()         # read all available characters
        uart.readline()     # read a line
        uart.readinto(buf)  # read and store into the given buffer
        uart.write('abc')   # write the 3 characters
        """ESP32"""
        # The ESP32 has three hardware UARTs: UART0, UART1 and UART2.
        # They each have default GPIO assigned to them, however depending on your ESP32 variant and board, these pins may conflict with embedded flash, onboard PSRAM or peripherals.
        # Any GPIO can be used for hardware UARTs using the GPIO matrix, except for input-only pins 34-39 that can be used as rx.
        # To avoid conflicts simply provide tx and rx pins when constructing.
        # UART0: tx:00,rx:03
        # UART1: tx:10,rx:09
        # UART2: tx:17,rx:16
        uart1 = UART(1, baudrate=9600, tx=33, rx=32)
        uart1.write('hello')  # write 5 bytes
        uart1.read(5)         # read up to 5 bytes

    """Serial Peripheral Interface bus protocol"""
    # SPI.init(baudrate=1000000, *, polarity=0, phase=0, bits=8, firstbit=SPI.MSB, sck=None, mosi=None, miso=None, pins=(SCK, MOSI, MISO))
    def spi_exanple():
        _spi = SPI(0, baudrate=10000000)           # Create SPI peripheral 0 at frequency of 400kHz. Depending on the use case, extra parameters may be required to select the bus characteristics and/or pins to use.
        cs = Pin(4, mode=Pin.OUT, value=1)      # Create chip-select on pin 4.
        try:
            cs(0)                               # Select peripheral.
            spi.write(b"12345678")              # Write 8 bytes, and don't care about received data.
        finally:
            cs(1)                               # Deselect peripheral.
        try:
            cs(0)                               # Select peripheral.
            rxdata = spi.read(8, 0x42)          # Read 8 bytes while writing 0x42 for each byte.
        finally:
            cs(1)                               # Deselect peripheral.
        rxdata = bytearray(8)
        try:
            cs(0)                               # Select peripheral.
            spi.readinto(rxdata, 0x42)          # Read 8 bytes inplace while writing 0x42 for each byte.
        finally:
            cs(1)                               # Deselect peripheral.
        txdata = b"12345678"
        rxdata = bytearray(len(txdata))
        try:
            cs(0)                               # Select peripheral.
            spi.write_readinto(txdata, rxdata)  # Simultaneously write and read bytes.
        finally:
            cs(1)                               # Deselect peripheral.



    """SPI: Read Register (SPI)."""
    def read(self, address: int) -> int: # https://docs.micropython.org/en/latest/library/machine.SPI.html#machine-softspi
        self.cs_pin.value(0)
        data = self.spi.read(length+1, self.Register[address])[1]
        self.cs_pin.value(1)
        return data
    """SPI: Read Register (SPI)."""
    def read_register(self, register: int, byteorder = 'big') -> int:
        response = self.transfer(register & 0x7f) # Create a reading byte
        return int.from_bytes(response, byteorder)
    """SPI: Write Value to Register (SPI)."""
    def write(self, reg, data):
        wb = bytes([self.RegTable[reg] | 0x80]) # Create a writing byte
        if isinstance(data, int): data = wb + bytes([data])
        elif isinstance(data, str): data = wb + bytes(data, 'utf-8')
        else: raise
        self.cs_pin.value(0) # Bring the CS pin low to enable communication
        self.spi.write(data)
        self.cs_pin.value(1) # release the bus.

    """Print Hardware Version/Revision."""
    def version(self):
        version = 0x00 # TODO Which Version?
        assert self.read(Register['Version']) == version, "Read:Version Failed!" # Test Read Function
        print("SX1276 Version: {}".format(self.read_register(Register['Version'])))
    def standby(self): self.write(Register['OpMode'], Mode['STDBY'])
    def sleep(self):   self.write(Register['OpMode'], Mode['SLEEP'])
    def dump_registers(self):
        for reg in range(128):
            print("0x{:02X}:{:02X}".format(reg,self.read_register(reg)),end="")
            if (reg+1)%4 == 0: print()
            else:              print(" | ", end="")
    def blink_led(self,times: int = 1, on_seconds=0.1,off_seconds=0.1):
        for i in range(times):
            if self._led_status:
                self._led_status.value(True)
                sleep(on_seconds)
                self._led_status.value(False)
                sleep(off_seconds)
    def collect_garbage(self):
        print('[GC] INIT')
        print('[GC][RAM] Free: {}\t\tAllocated: {}]'.format(gc.mem_free(), gc.mem_alloc()))
        gc.collect()
        print('[GC][RAM] Free: {}\t\tAllocated: {}]'.format(gc.mem_free(), gc.mem_alloc()))



"""Main entry point: Always executes when initialized."""
def main(): # pragma: no cover
    """App entry point (Main Function). Executes on: `$> python -m iownHomecontrol` and `$> iownHomecontrol`."""
    payload = bytes(0x55)
    while 1:
        iown.send(payload);time.sleep(5)
        # time.sleep(1)           # sleep for 1 second
        # time.sleep_ms(500)      # sleep for 500 milliseconds
        # time.sleep_us(10)       # sleep for 10 microseconds
        # start = time.ticks_ms() # get millisecond counter
        # delta = time.ticks_diff(time.ticks_ms(), start) # compute time difference


"""Executes when NOT initialized via import."""
if __name__ == '__main__':  # pragma: no cover
    sys.exit(main(sys.argv[1:]))


# https://google.github.io/styleguide/pyguide.html #
