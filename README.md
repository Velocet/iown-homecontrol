<div align="center" width="100%">

> **Note**:
>
> [![Join the iown-homecontrol Telegram Group](https://img.shields.io/badge/Telegram-Join-5865F2?style=for-the-badge&logo=telegram)](https://t.me/iownHomecontrol) [![Join the iown-homecontrol Discord Server](https://img.shields.io/badge/Discord-Join-5865F2?style=for-the-badge&logo=discord)](https://discord.gg/MPEb7dTNdN)</div>


---

# iown-homecontrol

<div align="center" width="100%">

Documentation and implementation of the *io-homecontrol*® protocol in support of<br/><a href="https://www.somfy-group.com/en-en/news/2018-01-04-somfy-launches-its-so-open-with-somfy-program-allowing-easier-access-to-smart-home-soluti">Somfy's "So Open" commitment</a><br/><br/>:trollface:</div>

## Goals & Solutions & Topics

- [X] Document Layer 1/2
  - [X] io-homecontrol Paket definition
- [ ] Document Layer 3+: Ongoing
- [ ] Correct rtl_433 Implementation: 80%
- [X] ReWrite of crypto test in Python
- [ ] Reflash existing hardware?
- [ ] Documentation of the io-homecontrol protocol
- [ ] Portable library to implement io-homecontrol on every MCU/SoC thats out there
- [ ] High Level API
- [ ] Bonus Points: Build the better Kizbox/Connectivity Kit with a LoRa32 incl. support for RTS ;)

### Possible "Solutions"

- Clone 1/2-way Remote with ESP32+868MHz (Repurpose ZigBee?)
- Clone 1-way Remote with repurposed Ikea remote (8€...)
- Create new PCB ([see those guys from poland...](http://techniline.com/index.php/en/intelligent-buildings/item/6-velux-window-actuator-regular-with-intelligent-building))
- Emulate Remote/Gateway firmware (eg. via QEMU)

## Information

Covered in the following documents are the details of the io-homecontrol protocols

* [Radio](docs/Radio.md)
* [Link Layer](docs/LinkLayer.md)
* [Commands](docs/Commands.md)

### Basics

There is a low level lib thats accessable to members of the io-homecontrol board.
The design of the TaHoma/Cozytouch/etc. boxes seems to be mostly based of a framework from Overkiz.
The mobile apps are built by Modulotech.
Overkiz, Somfy and Modulotech are owned by Atlantic.

<details><summary>Official io-homecontrol FAQ</summary>

> Why three frequencies? - How does it work?
>
> - Before sending a command, the transmitter “listens to“ each of the three available frequencies.
> - It selects the one that is free and when the product(s) do not react immediately, the command is also emitted on one of the other frequencies.

> Encryption: the key to security - How does it work?
>
> Each io-homecontrol installation has its own encryption key, which is present in all io products in the home. This key is automatically activated when the installation is first used. The emitter (remote control) issues its encryption key to the receiver (e.g. roller shutter) once and once only.
>
> - For each command issued by the remote control, the receiver generates and sends back to the emitter a random number generated from a range of several billions.
> - The emitter and receiver both perform automatic calculations based on this random number and the encryption key.
> - If the results of these two calculations are identical, the emitter and receiver must have the same key, and the command (e.g. close the shutter) can therefore be carried out (e.g. close the shutter). The emitter is then informed that the command has been carried out.
>
> The encryption key is “buried“ among these exchanges between emitters and receivers, making it undetectable.
>
> Bei der ersten Benutzung tauschen Fernbedienung (Sender) und Produkt (Empfänger) einen 128-Bit-Verschlüsselungscode aus und verbinden ihn bei jeder neuen Aktion mit einer zufällig gewählten Zahl. Daraus errechnet sich ein Code, den Sender und Empfänger miteinander abgleichen. Nur bei Übereinstimmung reagiert das Produkt auf die geforderte Aktion. Durch diesen Sicherheitsmechanismus wird die Reaktion auf einen fremden Sender ausgeschlossen. Die neue Anwendung sucht automatisch nach bereits bestehenden Produkten und berücksichtigt diese bei ihren Aktionen. Bevor Sender und Empfänger miteinander kommunizieren, wird die Verfügbarkeit des Kanals überprüft. Sollte eine Bandbreite überlagert oder besetzt sein, wartet die Anwendung vor der Kommunikation auf das Freiwerden der Frequenz (Listen before Talk) oder weicht auf einen der anderen Kanäle aus (Adaptive Frequency Agility).
</details>

### Hardware

<!-- TODO make table with mcus, etc. -->
OEM Hardware Overview (eg. transceiver chips, MCUs, SOCs, remote controls)

- io-Homecontrol capable radios
  - Analog Devices Inc. (ADI) ADF702x Family
    - ADF7022 (dedicated io-Homecontrol Transceiver)
    - [ADF7020](https://www.analog.com/media/en/technical-documentation/data-sheets/ADF7020.pdf), ADF7021(-V/N), ADF7023, ADF7024, ADF7025, ADF7030(-1)
  - Semtech
    - SX1243
  - Texas Instruments (ti)
    - CC112x: CC1120 / CC1121 / CC1125
    - CC120x: CC1200 / CC1201
- Velux Solar Powered Blinds (SSL)
  - Version from 2012: [Akkutausch beim VELUX INTEGRA® SOLAR SSL](https://hartgeloetet.blogspot.com/2017/04/akkutausch-beim-velux-integra-solar-ssl.html)
    - Renesas D78F1144: 16-bit uC (78K0R/Kx3-Family), 128kB Flash, 8kB RAM
    - Analog Devices Inc. ADF7020 -
- Velux KLF 200
  - EFM32 (EFM32GG990F-1024D)
    - Arm Cortex M3 SoC
    - Some RAM
    - Semtech ADF7022 - io-homecontrol
  - STM32 ([STM32F427II-H6](https://www.st.com/en/microcontrollers-microprocessors/stm32f427ii.html))
    - Arm Cortex-M4 with DSP & FPU, 2 MB Flash, 180 MHz, (Chrom-)ART Accelerator, FMC with SDRAM
    - Some Ram
- Somfy Situo 1 io (1-Way) (via [reddit](https://www.reddit.com/r/AskElectronics/comments/cz8trb/need_help_identifying_rf_ic_nr3_x6_046/))
  - MCU: STM8L151C8U6 GH22C VG CHN 723 (UART: 38834 Baud)
  - Radio: [Semtech SX1243](https://www.semtech.com/products/wireless-rf/frequency-shift-keying-fsk/sx1243#datasheets)


- Velux
  - Naming Scheme: ABC nnn (nAB Cnn DD)
    - ABC nnn
    - n = / AB = | C = / nn = | DD = Region (WW > WorldWide / EU > Europe / US > US of A)
  - KLF  50 - Wall Switch
  - KLF 100 - Interface (see [Controling Velux Windows With Fibaro](https://k2aab.com/home-automation/sub-page-1/controling-velux-windows-with-fibaro/))
  - KLF 200 - Internet Gateway/Interface
  - KRX 100 - (2w) Remote Controller with Screen (KLF 102 > 3LF D02)
  - KLR 100 - (2w) Remote Control with Screen
  - KLR 200 - (2w) Remote Control Pad
  - KUX 100 - (1w) Remote Control (long, like KLF 31x)
  - KUX 110 - (2w) Controller for wired products (via 24V +/-) via io-Homecontrol (KUX 100 successor)
  - KLI 310 - (1w) Wall Mounted Remote Control for Universal Usage
  - KLI 311 - (1w) Wall Mounted Remote Control for Window
  - KLI 312 - (1w) Wall Mounted Remote Control for Inner Sun Blind
  - [KLI 313 - (1w) Wall Mounted Remote Control for Outer Sun Blind](/products/velux/kli_313.md)
  - KIX 300 - Package: KIG 300, Raumklimasensor, Abwesenheitsschalter
    - VELUX ACTIVE indoor climate control KIX 300
    - Gateway KLG 300/3LG E01/NXG01E
    - Climate Sensor KLA 300/3LA E06/NXS01
    - Departure Switch KLN 300/3LN E01/NXD01E
  - KIG 300 - Internet Gateway NXG01E / NXG01C / NXS01 / NXD01E
  - KRD 100 - Remote Socket (1w)
  - KMX 100 - UNKNOWN
  - KMX 200 - UNKNOWN
  - KLA 130 -
- Overkiz Minibox
  - Cozytouch Branding
    - Atlantic
    - Thermor
  - Cotherm I-Vista
  - Hitachi HI-KUMO
  - Nexity Eugénie
  - Rexel Energeasy Connect
  - Somfy Connexoon
  - [Somfy SMOOVE Origin IO](/products/somfy/smoove_origin_io.md)
  - Somfy TaHoma
    - SI4461 + STM32F101RCT6
- Other Manufacturers
  - SecuYou - Status: No iohc
  - Assa Abloy - Status: No iohc
  - niko - Status: No iohc
  - WindowMaster
  - Renson - Status: No new iohc
  - Ciat - Status: No new iohc
  - Honeywell - Status: No iohc
  - Hörmann - Status: No iohc
  - Ehret (VOLETRONIC io) - Status: No iohc
  - Alulux - Status: No iohc
  - ExtremeLine (?) - Status: Off-The-Shelf Somfy iohc. No real vendor.


### Protocol

UART Data Packet consists of:
- Carrier Sense / Ramp Up Signal Phase
- Preamble (0101010101...)
- Sync Word (0xFF 0x33)
  - Start of UART encoding
- Transmission Control
  - Start of CRC16-KERMIT
  - Control Byte 1
    - \[7:6\]: Session Relationship
    - \[4:0\]: Length = From Control Byte 2 to CRC16
  - Control Byte 2
- 6 Byte MAC Header in EUI/OUI-48 form
  - 3 Byte Sender Address (SA)
  - 3 Byte Destination Address (DA)
  - ```ASCII
    |            EUI/OUI             |
    | Octet 0  | Octet 1  | Octet 2  |
    |  nibble  |  nibble  |  nibble  |
    |  __||__  |  __||__  |  __||__  |
    | |      | | |      | | |      | |
    | 0  ||  1 | 2  ||  3 | 4  ||  5 |
    |bits||bits|bits||bits|bits||bits|
    |7654||3210|7654||3210|7654||3210|
    |||||  |||||||||  |||||||||  |||||
    |  0     0 |  0     0 |  3     F |
    |0000  0000|0000  0000|0011  1111|
     |    |  ||                 |   |
     |    |  ||                 |   least-significant-bit of OUI
     |    |  ||                 least-significant-byte of OUI
     |    |  |least-significant-bit of first octet of OUI = I/G or M bit
     |    |  next-to-least-significant-bit of first octet of OUI = U/L or X bit
     |    most-significant-byte of OUI
     most-significant-bit of OUI
     ```
   - ToBeConfirmed: Broadcasts are valid OUI-48 when Bit-Reversed and then Bit-Inverted. 00:00:3F > Reverse > Invert = 03:FF:FF.
     - See: https://en.wikipedia.org/wiki/File:MAC-48_Address.svg / https://en.wikipedia.org/wiki/MAC_address#Universal_vs._local_(U/L_bit)
   - This is also mentioned in the SDN documents
- Payload 1W
  - Function:
    - Command ID
    - Optional: Parameter
  - Rolling Code (used by HMAC)
  - HMAC
- Payload 2W: Some 128-bit AES encrypted data xD
- CRC16-KERMIT: From Control Byte 1 to here
- Postamble: 0xFF

### Layer 1: Frequency / Modulation

- 868.00 MHz –  870.00 MHz with 3 Channels: (EU / WorldWide > NXG01E)
  - Ch 1: 868.25 MHz (868.00 MHz – 868.60 MHz) 2W
  - Ch 2: 868.95 MHz (868.70 MHz – 869.20 MHz) 2W/1W
  - Ch 3: 869.85 MHz (869.70 MHz – 870.00 MHz) 2W
- Band (Narrow): 12.5/25 kHz
- Deviation: 19.2 kHz
- Data/Baud Rate: 38.4 kbps
- Encoding: NRZ
- Modulation: 2FSK
- Standards: IEEE 802.15.4(g) / ETSI-300-200
- Modes: Master, Slave, Beacon
- Checks: CRC16-KERMIT, Preamble, Start Byte (Sync Word)
- Encoding (Data): UART
- 2400.00 MHz - 2483.50 MHz (USA / Canada > NXG01C) - UNCONFIRMED if io-Homecontrol (used by Velux)
- 1W Remotes: max. 10 devices / 2W Remotes: Unlimited

|          Radio |         Frequency | Power (mW) | NXG01E | NXG01C | NXS01 | NXD01E |
| -------------: | ----------------: | ---------: | :----: | :----: | :---: | :----: |
| io-homecontrol |  868 -  870.0 MHz |         20 |   X    |   -    |   -   |   -    |
| io-homecontrol | 2400 - 2483.5 MHz |         25 |   -    |   X    |   -   |   -    |
|     RF Sub-GHz |  863 -  870.0 MHz |         15 |   X    |   X    |   X   |   X    |
|     WiFi b/g/n | 2400 - 2483.5 MHz |        100 |   X    |   X    |   -   |   -    |

|     Radio      | Channel |   Start    |    End     |    Base    |
| :------------: | :-----: | :--------: | :--------: | :--------: |
| io-homecontrol |    1    | 868.00 MHz | 868.60 MHz | 868.25 MHz |
| io-homecontrol |    2    | 868.70 MHz | 869.20 MHz | 868.95 MHz |
| io-homecontrol |    3    | 869.70 MHz | 870.00 MHz | 869.85 MHz |
|    io-WiFi     |  b/g/n  | 2400.0 MHz | 2483.5 MHz |     -      |
<!--
  | ![io-Homecontrol frequencies](https://liaison.mainguet.org/_img/iohomecontrol_frequence.png) |
  | -------------------------------------------------------------------------------------------: |
  |     taken from [les technologies de liaison](https://liaison.mainguet.org/iohomecontrol.htm) |

- VELUX INTEGRA® io enabled products
  - roof windows GGL (----21), GGU (----21)
  - Solar roof windows GGL (----30), GGU (----30)
  - flat roof window CVP (3MX A02)
  - modular skylight HVC (3MA A01, 3MA A02, 3MA A03, 3MA A04, 3MA A05)
  - conversion kit KMX 100 (3MG A01, 3UC A02, 3LA A01, 3LR A01) for roof windows GGL, GGU
  - conversion kit KMX 200 (3MX A01, 3LA A01, 3LR A01) for roof windows GHL, GHU, GPL, GPU, GTL, GTU, VKU
  - Solar conversion kits KSX 100 (3SM B01, 3SD B01, 3LR A01), KSX 100K (3SM BK01, 3LR A02) for roof windows GGL, GGU
  - Control pad KLR 200 (3LR A02)
-->

### io-homecontrol history

- Initative was created in 2002
- Launched in July 2005 by Somfy, Velux and Honeywell
- First companies to adopt: Hörmann, Assa Abloy, Niko, Renson, Windowmaster
  - [https://press.velux.com/assa-abloy-becomes-a-new-member-of-io-homecontrol/]

## Links

- FCC: [VELUX America Inc.](https://fccid.io/XSG)

### RTL-SDR

[Universal Radio Hacker](https://github.com/jopohl/urh)
[SDRangel](https://github.com/f4exb/sdrangel)
[inspectrum](https://github.com/miek/inspectrum)
[HDSDR](http://www.hdsdr.de/)

### Kizbox Rooting

TaHoma: [Somfy TaHoma Jailbreak](https://github.com/Aldohrs/tahoma-jailbreak)
Connexoon: [No clouds, just sunshine. Disconnecting Somfy Connexoon from the cloud.](https://blog.unauthorizedaccess.nl/2021/04/07/no-clouds-just-sunshine.html)
CozyTouch: [CozyTouch Rooting the CozyTouch aka KizBox Mini](https://www.lafois.com/2020/11/07/rooting-the-cozytouch-aka-kizbox-mini-part-1/)

[FLOSS @ Overkiz](https://floss.overkiz.com)
[https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/at91-kizbox.dts]

### Online Discussions

[https://github.com/merbanan/rtl_433/issues/1376]
[https://github.com/RFD-FHEM/RFFHEM/issues/984]
[https://community.openhab.org/t/io-homecontrol-velux-somethings-in-the-bush/11413]

#### Velux Blinds

[No KUX, just Loxone](https://smarthome.exposed/controlling-velux-windows/)
[Velux SML Rolläden „ablernen“ bzw. resetten](https://wolf-u.li/5920/velux-sml-rollaeden-ablernen-bzw-resetten/)
[snipsvelux](https://github.com/Psychokiller1888/snipsvelux)
[VeluxIR](https://github.com/zschub/VeluxIR) - IR protocol for old Velux remotes
