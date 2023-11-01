<div align="center" width="100%">

> **Note**:
>
> [![Join the iown-homecontrol Telegram Group](https://img.shields.io/badge/Telegram-Join-5865F2?style=for-the-badge&logo=telegram)](https://t.me/iownHomecontrol) [![Join the iown-homecontrol Discord Server](https://img.shields.io/badge/Discord-Join-5865F2?style=for-the-badge&logo=discord)](https://discord.gg/MPEb7dTNdN)

</div>

---

# iown-homecontrol

<div align="center" width="100%">

Documentation and Implementation of the *io-homecontrol*® protocol in support of<br/><a href="https://www.somfy-group.com/en-en/news/2018-01-04-somfy-launches-its-so-open-with-somfy-program-allowing-easier-access-to-smart-home-soluti">Somfy's "So Open" commitment</a><br/><br/>:trollface:</div>

## Status

- [X] Document Layer 1/2
  - [X] io-homecontrol Paket definition
- [ ] Document Layer 3+: Ongoing
- [ ] Correct rtl_433 Implementation: 80%
- [X] ReWrite of crypto test in Python
- [ ] Reflash existing hardware?
- [ ] Protocol Documentation
- [ ] Portable library for a wide range of MCU/SoCs
- [X] High Level API (already available in the form of KLF200 abstractions)
- [ ] Bonus Points: Build the better Kizbox/Connectivity Kit with a LoRa32 incl. support for RTS ;)

### Possible Solutions

- Clone Remote with a LoRa32 (ESP32+868MHz RF module) (maybe repurpose ZigBee USB Stick?)
- Clone Remote (1W) with repurposed Ikea remote (8€...)?
- Create new PCB ([see those guys from poland...](http://techniline.com/index.php/en/intelligent-buildings/item/6-velux-window-actuator-regular-with-intelligent-building))
- Emulate Remote Control/Gateway firmware (eg. via QEMU or RENODE)

## Protocol

io-homecontrol protocol handles half-duplex RF communication between a MASTER and SLAVEs:

- MASTER nodes can send commands at any time to one or more SLAVEs.
- SLAVE nodes can only execute commands or report their status when requested by a MASTER.
  - Exception: devices can send their address when requested by the user (eg.: via pushbutton on the device) without any MASTER request.
- A third BEACON mode acts like a SLAVE

1W Remotes can normally store max. 10 devices and 2W Remotes have an unlimited amount...

### Naming Convention and Packet Description

- Session: Abstraction describing the communication for one Action (eg. Button Press)
  - Defines that a Packet is repeated four times (see FHSS)
- Packet = Physical Layer (RF/Radio)
  - Carrier Sense / Ramp Up Signal Phase
  - Preamble: Sequence of a repeating 01 pattern (0101010101...)
  - Sync Word: UART encoded word (0xFF 0x33) to break the preamble and signal the start of the the frame
  - Frame: UART encoded data to be interpreted by ioHc
  - Postamble: 0xFF
  - (Interframe/Interpacket) Gap
- Frame = Data Link Layer
  - Transmission Control - Start: CRC16-KERMIT
    - Control Byte 1
      - \[7:6\]: Packet Relationship
      - \[4:0\]: Frame Length = Start: Control Byte 2, End: CRC16
    - Control Byte 2
  - MAC Header: Combination of 
  - Payload: Variable length field between the MAC header and CRC holds the usable data aka Message
  - CRC: Calculated over the Frame
  - MAC Header (6 Byte): Sender and Receiver NodeID in EUI/OUI-48 form
    - NodeID: built-in 3-bytes device address (LSBF!)
      - Used in every communication to identify the transmitter and the receiver(s).
      - Programmed during manufacturing and "cannot be changed" (which is untrue as we will see later...).
      - Found on the device labels in plain text and as barcode/qr-code.
      - "NodeIDs are recycled on a 3 to 5 years basis, depending on the product sales."
      - "NodeID can be considered unique per installation/home."
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
      |  0     0 |  0     0 |  3     F | 0x00003F = Broadcast (1W)
      |0000  0000|0000  0000|0011  1111|
       |    |  ||                 |   |
       |    |  ||                 |   least-significant-bit of OUI
       |    |  ||                 least-significant-byte of OUI
       |    |  |least-significant-bit of first octet of OUI = I/G or M bit
       |    |  next-to-least-significant-bit of first octet of OUI = U/L or X bit
       |    most-significant-byte of OUI
       most-significant-bit of OUI
       ```
    - Broadcasts are valid OUI-48 when Bit-Reversed and then Bit-Inverted (see LSBF). 00:00:3F > Reverse > Invert = 03:FF:FF.
      - See: [Universal vs. Local Bit](https://en.wikipedia.org/wiki/MAC_address#Universal_vs._local_(U/L_bit))
      - Mentioned in SDN (Somfy Digital Network) documents and observable via SDN Frame Builder
  - Payload = Data: everything needed to interpret/validate the Message
    - Message
      - CommandID
      - Optional: Parameter (for Mp/Fp see KLF200 API)
        - Main Parameter
        - Function Parameter
    - 1W Only:
      - Rolling Code (used by HMAC)
      - HMAC
    - 2W Only: Some 128-bit AES encrypted data xD

#### Layer 1: Frequency / Modulation

| Mode  | Channel |  Start    |    End    |   CENTER   |
| ----: | :-----: | :-------: | :-------: | :--------: |
| 2W    |    1    | 868,0 MHz | 868,6 MHz | 868,25 MHz |
| 1W/2W |    2    | 868,7 MHz | 869,2 MHz | 868,95 MHz |
| 1W    |    3    | 869,7 MHz | 870,0 MHz | 869,85 MHz |

- Modulation: FSK (2FSK) with 19,2 kHz Deviation (Narrow Band: 12,5/25kHz)
- Data/Baud Rate: 38,4 kbps
- Encoding: NRZ (on-the-radio) / Data: UART (on-the-line)
- Checks: CRC16-KERMIT, Preamble, Start Byte (Sync Word)
- FHSS per Channel: 2,7ms (Patent: 3ms)

### Protocol Details

- [Radio](docs/Radio.md)
- [Link Layer](docs/LinkLayer.md)
- [Commands](docs/Commands.md)

### Background

There is a low level lib thats accessable to members of the io-homecontrol board. Gateways ("Boxes") like the TaHoma/Cozytouch/etc. are a whiteware product from Overkiz. The mobile apps are built by Modulotech. Overkiz, Somfy and Modulotech are owned by Atlantic.

- Overkiz KizBox/MiniBox Whiteware Examples
  - Cozytouch Branding: Atlantic, Thermor 
  - Cotherm I-Vista
  - Hitachi HI-KUMO
  - Nexity Eugénie
  - Rexel Energeasy Connect
  - Somfy Connexoon, TaHoma

- Other ioHc Manufacturers
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

<details><summary>io-homecontrol FAQ</summary>

> **Note**: Taken from the official io-homecontrol homepage (which is offline .. of course it is^^)

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

- io-homecontrol history
  - Initative was created in 2002
  - Launched in July 2005 by Somfy, Velux and Honeywell
  - First companies to adopt: Hörmann, Assa Abloy, Niko, Renson, Windowmaster
    - [https://press.velux.com/assa-abloy-becomes-a-new-member-of-io-homecontrol/]

</details>

### Hardware <!-- TODO make table with mcus, etc. -->

OEM Hardware Overview (eg. transceiver chips, MCUs, SOCs, remote controls)

> **Note**: Every radio chip with FSK (2FSK) support in the 868MHz range should be usable.

- io-Homecontrol capable radios
  - Analog Devices Inc. (ADI) ADF702x Family
    - ADF7022 (dedicated io-Homecontrol Transceiver)
    - [ADF7020](https://www.analog.com/media/en/technical-documentation/data-sheets/ADF7020.pdf), ADF7021(-V/N), ADF7023 (non-ioHc ADF7022 version), ADF7024, ADF7025, ADF7030(-1)
  - Semtech
    - SX1243, SX127x (except SX1278)
  - Texas Instruments (ti)
    - CC110x: CC1101
    - CC112x: CC1120 / CC1121 / CC1125
    - CC120x: CC1200 / CC1201

#### Somfy

<details><summary>Overview</summary>
  
- Situo 1 io (1W) (via [reddit](https://www.reddit.com/r/AskElectronics/comments/cz8trb/need_help_identifying_rf_ic_nr3_x6_046/))
  - MCU: STM8L151C8U6 GH22C VG CHN 723 (UART: 38834 Baud = 38400, the difference is related to the STM8's internal clock)
  - RF: [Semtech SX1243](https://www.semtech.com/products/wireless-rf/frequency-shift-keying-fsk/sx1243#datasheets)
- TaHoma
  - MCU: STM32F101RCT6
  - RF: Si4461

</details>
  
#### Velux

<details><summary>Hardware</summary>

- Velux Solar Powered Blinds (SSL)
  - Version from 2012: [Akkutausch beim VELUX INTEGRA® SOLAR SSL](https://hartgeloetet.blogspot.com/2017/04/akkutausch-beim-velux-integra-solar-ssl.html)
  - Renesas D78F1144: 16-bit uC (78K0R/Kx3-Family), 128kB Flash, 8kB RAM
  - Analog Devices ADF7020
- Velux KLF 200
  - EFM32 (EFM32GG990F-1024D) = ARM Cortex-M3
  - RF: Analog Devices ADF7022
  - MCU: [STM32F427II-H6](https://www.st.com/en/microcontrollers-microprocessors/stm32f427ii.html) = ARM Cortex-M4 with DSP & FPU, 2MB Flash, 180MHz

</details>

<details><summary>Product Range</summary>

- Naming Scheme: ABC nnn (nAB Cnn DD)
  - ABC nnn
  - n = / AB = | C = / nn = | DD = Region (WW > WorldWide / EU > Europe / US > US of A)
- VELUX INTEGRA® (ioHc) Products
  - roof windows GGL (----21), GGU (----21)
  - Solar roof windows GGL (----30), GGU (----30)
  - flat roof window CVP (3MX A02)
  - modular skylight HVC (3MA A01, 3MA A02, 3MA A03, 3MA A04, 3MA A05)
  - conversion kit KMX 100 (3MG A01, 3UC A02, 3LA A01, 3LR A01) for roof windows GGL, GGU
  - conversion kit KMX 200 (3MX A01, 3LA A01, 3LR A01) for roof windows GHL, GHU, GPL, GPU, GTL, GTU, VKU
  - Solar conversion kits KSX 100 (3SM B01, 3SD B01, 3LR A01), KSX 100K (3SM BK01, 3LR A02) for roof windows GGL, GGU
  - Control pad KLR 200 (3LR A02)
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
- KLA 130 - UNKNOWN

</details>

## Links

- FCC: [VELUX America Inc.](https://fccid.io/XSG)
- [FLOSS @ Overkiz](https://floss.overkiz.com)
  - [https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/at91-kizbox.dts]
- Kizbox Rooting
  - TaHoma: [Somfy TaHoma Jailbreak](https://github.com/Aldohrs/tahoma-jailbreak)
  - Connexoon: [No clouds, just sunshine. Disconnecting Somfy Connexoon from the cloud.](https://blog.unauthorizedaccess.nl/2021/04/07/no-clouds-just-sunshine.html)
  - CozyTouch: [CozyTouch Rooting the CozyTouch aka KizBox Mini](https://www.lafois.com/2020/11/07/rooting-the-cozytouch-aka-kizbox-mini-part-1/)
- Software
  - RTL-SDR
    - [Universal Radio Hacker](https://github.com/jopohl/urh)
    - [SDRangel](https://github.com/f4exb/sdrangel)
    - [inspectrum](https://github.com/miek/inspectrum)
    - [HDSDR](http://www.hdsdr.de/)
- Online Discussions
  - [https://github.com/merbanan/rtl_433/issues/1376]
  - [https://github.com/RFD-FHEM/RFFHEM/issues/984]
  - [https://community.openhab.org/t/io-homecontrol-velux-somethings-in-the-bush/11413]
  - Velux Blinds
    - [No KUX, just Loxone](https://smarthome.exposed/controlling-velux-windows/)
    - [Velux SML Rolläden „ablernen“ bzw. resetten](https://wolf-u.li/5920/velux-sml-rollaeden-ablernen-bzw-resetten/)
    - [snipsvelux](https://github.com/Psychokiller1888/snipsvelux)
    - [VeluxIR](https://github.com/zschub/VeluxIR) - IR protocol for old Velux remotes
