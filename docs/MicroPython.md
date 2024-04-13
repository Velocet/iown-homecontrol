<!-- TODO: Take notes from Arduino.md -->


#### Compatibale Modules

Basically there are only three main manufacturers of radio modules used in the maker scene:

- Semtech (SX12xx)
- Silicon Labs (SI446x)
- Texas Instruments (CC1xxx)
  - CC1121
  - CC1120
  - CC1200
  - CC1125
  - CC1201
  - CC110L
  - CC1101
  - CC1020
  - CC1021
- Analog Devices (ADF70xx)

All other companies (HopeRF, Seeed, etc.) only rebrand those modules.
HopeRF RF modules are named RFM and the ICs named RF. NB RFM95 contains an RF96 IC.

^Semtech ^ HopeRF IC/RFM ^ FSK kbps ^ LoRa gen ^ LoRa kbps  ^ Frequency MHz  ^ Market ^
|[[https://www.semtech.com/products/wireless-rf/frequency-shift-keying-fsk/sx1231|SX1231]]  | [[https://www.hoperf.com/modules/rf_transceiver/RFM69W.html|RF69/RFM69]]  | 300      | N/A      | N/A          | 433, 868 & 915   |        |
|SX1272  | RF92/RFM92W | 300      | 1        | 0.3 - 40     | 862 - 1020       | NA/EU  |
|SX1273  |             | 300      | 1        | 1.7 - 40     | 862 - 1020       |        |
|[[https://www.semtech.com/products/wireless-rf/lora-core/sx1276|SX1276]]  | [[https://www.hoperf.com/modules/lora/RFM95.html|RF96/RFM95W]] | 300      | 1        | 0.018 - 40   | 137 - 1020       | GLOBAL |
|SX1277  |             | 300      | 1        | 1.7 - 40     | 137 - 1020       |        |
|SX1278  | [[https://www.hoperf.com/modules/lora/RFM98.html|RF98/RFM98W]] | 300      | 1        | 0.018 - 40   | 137 - 525        | CN     |
|SX1279  |             | 300      | 1        | 0.018 - 40   | 137 - 960        |        |
|SX1261  |             | 300      | 2        | 0.018 - 62.5 | 150 - 960        |        |
|[[https://www.semtech.com/products/wireless-rf/lora-core/sx1262|SX1262]]  |             | 300      | 2        | 0.018 - 62.5 | 150 - 960        |        |
|SX1268  |             | 300      | 2        | 0.018 - 62.5 | 410 - 810        | CN     |

^ HopeRF RFM ^ Frequency MHz  ^ LoRa kbps ^
|[[https://www.hoperf.com/modules/lora/RFM95.html|RFM95W]] | 868, 915 | .293   - 37.5  |
|[[https://www.hoperf.com/modules/lora/RFM96.html|RFM96W]]/[[https://www.hoperf.com/modules/lora/RFM98.html|RFM98W]] | 433, 470 | .1465  - 37.5 |
|[[https://www.hoperf.com/modules/lora/RFM98.html|RFM98W]] | 169      | .07324 - 9.375 |

RFM12	Si4420
RFM12b	Si4421
RFM22b	Si4432
RFM23b	Si4431
RFM24w	Si446x(?)
RFM26w	Si446x(?)
RFM31b	Si4330
RFM42b	Si4032
RFM43b	Si4031
RFM50	Si1000(?)
RFM60	Si4010
RFM63W	Semtech SX1211
RFM64W	Semtech SX1212
RFM65W	Semtech SX1239
RFM66W	Semtech SX1232
RFM67W	Semtech SX1230
RFM68W	Semtech SX1243
RFM69W	Semtech SX1231

Semtech SX1276/77/78/79 based boards including:
  Dragino Lora Shield
  HopeRF RFM95W, RFM96W, and RFM98W
  Modtronix inAir4, inAir9, and inAir9B
Arduino MKR WAN 1300

===Modules===

Two types of module exist using Semtech/HopeRF ICs. Ones that interface directly to the IC and expose the native SPI bus or others that include a microcontroller with a UART interface which provides a high level API.

- SPI modules interface directly to the IC and can be multi-purpose or for the Arduino, RPi, etc.

^ IC or RFM ^ Product ^ Platform ^ Features ^ Data-sheet ^
| SX1276/SX1278 | [[https://web.archive.org/web/20201111221243/https://wiki.dragino.com/index.php?title=Lora/GPS_HAT|Dragino LoRa/GPS HAT]] | RPi     | MT3339 GPS and temperature | [[http://www.farnell.com/datasheets/2624999.pdf|Dragino Lora/GPS HAT]] |
| SX1276        | [[https://web.archive.org/web/20200219204541/http://wiki.dragino.com:80/index.php?title=Lora_Shield|Dragino LoRa Shield]]   | Arduino | 3v3/5v compatible |[[http://www.farnell.com/datasheets/2630874.pdf|Dragino LoRa Shield for Arduino]] |
| RFM95W        | [[https://www.adafruit.com/product/4074|Adafruit LoRa Radio Bonnet with OLED]] | RPi     | 128x32 display    | N/A |

- UART modules contain an intelligent controller and use a high level API. The API may mimic the HAYES AT modem command set or be original.

^ IC or RFM ^ Product ^ RPi add-on ^
| SX1276 | [[https://docs.rakwireless.com/Product-Categories/WisDuo/RAK811-Module/Datasheet/|RAK RAK811]]               | [[https://uk.pi-supply.com/products/iot-lora-node-phat-for-raspberry-pi|Pi Supply / pHAT PIS-1128]] |
| SX1262 | [[https://www.ebyte.com/en/downpdf.aspx?id=483|EBYTE E22-230T30S]]                                           | [[https://www.waveshare.com/wiki/SX1262_868M_LoRa_HAT|Waveshare SX1262 868M LoRa HAT]] |
| SX1276 | [[https://www.murata.com/en-eu/products/connectivitymodule/lpwa/overview/lineup/type-abz|Murata CMWX1ZZABZ]] | [[https://store.arduino.cc/arduino-mkr-wan-1300-lora-connectivity-1414|ARDUINO MKR WAN 1300]] |

# Rapid Development and Testing with MicroPython

This document should hold the basic setup for sending and receiving iohc frames via a ESP32 LoRa32 board with a SX1276. The only usable SX127x chips are: SX1276, SX1277, SX1279.

> **Note**: The SX1278 does not support 868 MHz!

As with the rest of the documentation this is mostly to get people without that much knowledge up and running. If know how to develop yourself there should be now need to explain on where to look and how to configure your board. Either way .. this is also my first time xD

> **Note**: Though unconfirmed, it seems the SX126x chips lack the possibility to send a steady data stream via one of the GPIO pins. If you have such a board and confirm this then please let me and everyone else know :)
> **Note**: Most of this stuff is an adaption of this repo: [Learn SX1276](https://github.com/xg590/Learn_SX1276)

- Board Configuration
  - HelTec LoRa32 v2.x
    ```PYTHON
      LoRa_MISO_Pin = 19
      LoRa_MOSI_Pin = 27
      LoRa_SCK_Pin  =  5
      LoRa_CS_Pin   = 18
      LoRa_RST_Pin  = 14
      LoRa_DIO0_Pin = 26 # UART Data
      LoRa_DIO1_Pin = 35
      LoRa_DIO2_Pin = 34 # UART Clock Signal
      SPI_CH        =  1
    ```
  - TTGO T-Beam v1.1 (untested)
    ```
      LoRa_MISO_Pin = 19
      LoRa_MOSI_Pin = 27
      LoRa_SCK_Pin  =  5
      LoRa_CS_Pin   = 18
      LoRa_RST_Pin  = 23
      LoRa_DIO0_Pin = 26
    ```

  ----------------------------------------------------------------------
  | ESP32 Interface       | #define       | ESP32 Pin | External RS485 |
  |                       |               |           |   Driver Pin   |
  | ----------------------|---------------|-----------|----------------|
  | Transmit Data (TxD)   | ECHO_TEST_TXD | GPIO23    | DI             |
  | Receive Data (RxD)    | ECHO_TEST_RXD | GPIO22    | RO             |
  | Request To Send (RTS) | ECHO_TEST_RTS | GPIO18    | ~RE/DE         |
  | Ground                | n/a           | GND       | GND            |
  ----------------------------------------------------------------------

## Mode of Operation

The SX1276 is a very sophisticated and delicate rf chip with a lot of functionality.
It even has a built-in (official!) io-homecontrol mode! Guess what?
We use none of that and take the same route as Somfy and squeeze our bits diretly on the antenna.
This means the only thing the SX1276 is doing is to modulate (2FSK) the signal from the data we provide.
When dealing with the SX1276 on a board like the HelTec LoRa32, this provides us with two interfaces and helps to ease the configuration.
Interface 1 is used to configure the radio via SPI and a simple high level api to alter the config registers.
Interface 2 is a simple UART which takes care of generating the clock and wrapping the data into the correct format for rf transmission.

> 2.1.9.2 Data Operation Modes
> Continuous mode: each bit transmitted or received is accessed in real time at the DIO2/DATA pin. This mode may be used if adequate external signal processing is available.
> 2.1.12 Continous Mode
> Continuous mode the NRZ data to (from) the (de)modulator is directly accessed by the uC on the bidirectional DIO2/DATA pin. The FIFO and packet handler are thus inactive.

## Basic Setup

- MicroPython
- esptool
- [PyBoard](https://github.com/micropython/micropython/raw/master/tools/pyboard.py)
- mpremote: https://docs.micropython.org/en/latest/reference/mpremote.html
  - ``pip install mpremote``
- Link: [Documentation for the pyboard.py tool](https://docs.micropython.org/en/latest/reference/pyboard.py.html)
- Interesting Libs:
  - https://github.com/peterhinch/micropython-micro-gui
  - https://github.com/stlehmann/micropython-ssd1306
  - https://github.com/xg590/SX1276


### SX1276 Config

If you are lazy like me grab the SX1276 configuration software from Semtech and export the CFG. STRG + ALT + N is your friend ;)

Run this regex on the created config file: `^.*Reg(.*)\W(0x.*)\W(0x.*)$` and for the output use ``


The bitrate setting is referenced to the crystal oscillator and provides a precise means of setting the bit rate (or equivalently chip) rate of the radio.
In continuous transmit mode (Section 2.1.12) the data stream to be transmitted can be input directly to the modulator via pin 10 (DIO2/DATA) in an asynchronous manner
When Gaussian filtering is used, in which case the DCLK signal on pin 9 (DIO1/DCLK) is used to synchronize the data stream. See section 2.1.2.3 for details on the Gaussian filter.
In Continuous mode with Gaussian filtering enabled, the Bit Rate (BR) is controlled by bits Bitrate in RegBitrateMsb and RegBitrateLsb

| Classical modem baud rates<br/>(multiples of 1.2 kbps) | BitRate<br/>(15:8) | BitRate<br/>(7:0) | Actual BR<br/>b/s |
| ------------------------------------------------------ | ------------------ | ----------------- | ----------------- |
| 38.4 kbps<br/>(G)FSK                                   | 0x03               | 0x41              | 38.415,36         |

## uP Commands

- machine.bitstream(pin, encoding, timing, data, /)
  > Transmits data by bit-banging the specified pin. The encoding argument specifies how the bits are encoded, and timing is an encoding-specific timing specification.
  >
  > The supported encodings are:
  >
  > 0 for “high low” pulse duration modulation. This will transmit 0 and 1 bits as timed pulses, starting with the most significant bit.
  > The timing must be a four-tuple of nanoseconds in the format (high_time_0, low_time_0, high_time_1, low_time_1).
  > For example, (400, 850, 800, 450) is the timing specification for WS2812 RGB LEDs at 800kHz.

### class UART – duplex serial communication bus

UART implements the standard U(S)ART duplex serial communications protocol. At the physical level it consists of 2 lines: RX and TX. The unit of communication is a character (not to be confused with a string character) which can be 8 or 9 bits wide. UART objects can be created and initialised using:

```PYTHON
    from machine import UART
    uart = UART(1, 9600)                         # init with given baudrate
    uart.init(9600, bits=8, parity=None, stop=1) # init with given parameters

# A UART object acts like a `stream` object and reading and writing is done using the standard stream methods:
#    uart.read(10)       # read 10 characters, returns a bytes object
#    uart.read()         # read all available characters
#    uart.readline()     # read a line
#    uart.readinto(buf)  # read and store into the given buffer
    uart.write('abc')   # write the 3 characters
```
