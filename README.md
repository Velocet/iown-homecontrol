<div align="center" width="100%">
  
[![Join the iown-homecontrol Telegram Group](https://img.shields.io/badge/Telegram-Join-5865F2?style=for-the-badge&logo=telegram)](https://t.me/iownHomecontrol) [![Join the iown-homecontrol Discord Server](https://img.shields.io/badge/Discord-Join-5865F2?style=for-the-badge&logo=discord)](https://discord.gg/MPEb7dTNdN)

---
# iown-homecontrol

*io-homecontrol*® [Documentation](https://velocet.github.io/iown-homecontrol) & Implementation in support of<br/><a href="https://www.somfy-group.com/en-en/news/2018-01-04-somfy-launches-its-so-open-with-somfy-program-allowing-easier-access-to-smart-home-soluti">Somfy's "So Open" commitment</a><br/><br/>:trollface:

</div>

## Status

- [X] [Document Layer 1](docs/RADIO.md)
- [X] [Document Layer 2](docs/LINKLAYER.md)
- [X] [Document Layer 3](docs/COMMANDS.md)
  - [X] io-homecontrol Paket Definition
- [ ] Document Layer 4+
  - [X] Standard commands
  - [X] Advanced commands
  - [ ] EMS2 Frame/CarrierSense: Infos needed!
- [X] [Documentation](https://velocet.github.io/iown-homecontrol)
  - [ ] Cleanup: 60 %
  - [X] MkDocs version
  - [X] Better understanding of the device serial and QR/Barcode
- [ ] iohc Firmware
  - [X] Reverse official Somfy iohc Firmware
    - [X] Renode: Emulate Firmware
    - [X] Custom IDA Pro Loader
    - [X] Custom SVD file for use in Ghidra/IDA Pro
    - [X] Extract Si4461 config
  - [ ] Reverse Actuator Firmware: STILL MISSING! Can you provide one?
  - [ ] Hack the god damn ESP32 based Somfy Connectivity Box
- [ ] [rtl_433](https://github.com/merbanan/rtl_433/blob/master/src/devices/somfy_iohc.c): Corrections
- [X] ReWrite of crypto test in Python
- [ ] Library
  - [X] [RadioLib Fork](https://github.com/Velocet/RadioLib_IoHc)
  - [ ] 1W Library - Implementation Status: WIP
  - [ ] 2W Library - Implementation Status: WIP
  - [ ] Simple [MicroPython](https://micropython.org/) implementation for rapid testing/prototyping
  - [ ] [Kaitai Struct](https://kaitai.io/) implementation for easier portablity: 30%
- [X] High Level Abstraction (KLF200 API and Overkiz Cloud JSON...)
- [ ] Bonus Points: Build a better/cheaper Somfy TaHoma with a LoRa32
  - [ ] Support for RTS ^^
  - [ ] Expose as ZigBee device for HomeAssistant integration other smart home systems
  - [ ] Expose as HomeKit device (HomeSpan?) incl. QR code to ease installation

> [!IMPORTANT]
> We need your help implementing the procotol! Please contact us!

## Implementation

LoRa32 boards (HelTec/LilyGo) are the main target platform cause they work out of the box: Connect USB and flash via web interface (work in progress).

If you want to port the library to a non-ESP32 platform you should consider the following:

- Non-Volatile Storage needed
- Optional: AES engine (if you want to test your neighbors security)

> [!TIP]
> Got a rtl-sdr? Use [rtl_433](https://github.com/merbanan/rtl_433) to decode io-homecontrol: `rtl_433 -R 189 -f 868.9M -s 1000k -g 42.1`

### Compatibale Hardware

The recommended method is to use a LoRa32 board from HelTec or LilyGo. But there are many other boards, modules and combinations which work.

Be aware to use a device with support for FSK modulation in the 868 MHz band. That's it.

<!-- TODO Devices...
<div align="center" width="100%">

If not explicitly mentioned every board version is supported.
| [HelTec](https://heltec.org/product-category/lora/lrnode/esp32-lora/)  | [LilyGo](https://www.lilygo.cc/collections/lora-or-gps)   | AdaFruit   | Other |
|:------------: | :------------: | :------------: | :------------: |
| [WiFi LoRa32](https://heltec.org/project/wifi-lora-32-v3/)   | LoRa32     | [ESP32 Feather](https://www.adafruit.com/product/5900)<br/>+<br/>FeatherWing [RFM69HCW](https://www.adafruit.com/product/3229)/[RFM95W](https://www.adafruit.com/product/3231)     | [FireBeetle ESP32](https://www.dfrobot.com/product-1590.html)<br/>+<br/>[LoRa 868MHz- Cover](https://www.dfrobot.com/product-1831.html)
| [Wireless Bridge](https://heltec.org/project/wireless-bridge/)    | T-Beam     | | |
| [Wireless Tracker](https://heltec.org/project/wireless-tracker/)    | T3-S3     |      | |
| [Wireless Stick](https://heltec.org/project/wireless-stick-v3/)    | T-Watch S3     |     | |
| [Wireless Stick Lite](https://heltec.org/project/wireless-stick-lite-v2/)    |      |      | |
</div> -->

## Protocol

<div align="center" width="100%">

| Channel | Mode  | CENTER         | Start     | End       |
| ------: | :---: | :------------: | :-------: | :-------: |
| 1       | 2W    | **868,25 MHz** | 868,0 MHz | 868,6 MHz |
| 2       | 1W/2W | **868,95 MHz** | 868,7 MHz | 869,2 MHz |
| 3       | 2W    | **869,85 MHz** | 869,7 MHz | 870,0 MHz |

io-homecontrol (iohc) is a half-duplex protocol in the 868 MHz band with 2 modes.

</div>

- 1W (OneWay): Uni-Directional (1 Channel)
- 2W (TwoWay):  Bi-Directional (3 Channels)
- Modulation: FSK with 19,2 kHz deviation (Encoding: NRZ)
- Data/Baud Rate: 38400 bps (Encoding: UART 8N1)
- Frequency Hopping (FHSS): 2,7ms (Patent: 3ms) per Channel

### Protocol Details
<!-- TODO: Link all documents or better link to mkdocs -->

- [Documentation](https://velocet.github.io/iown-homecontrol)
  - Layer 1: [Radio](docs/RADIO.md)
  - Layer 2: [Link Layer](docs/LINKLAYER.md)
  - Layer 3: [Commands](docs/COMMANDS.md)

## Appendix

<details><summary>Appendix</summary>

### Naming Conventions & Wording

<details><summary>Naming Conventions & Wording</summary>

> Based on the official iohc wording and [Ethernet Frame](https://en.wikipedia.org/wiki/Ethernet_frame) description.

- Session: Abstraction describing the whole communication process for one action (eg. close windows)
- Action: A command executed by the actuator
- Layer 1: Packet = Physical (RF/Radio)
- Packet: Breaks down a session transmission into chunks with each containing a preamble, sync word, frame and interpacket gap.
- Carrier Sense: In case of iohc the abuse of the preamble as detection of an incoming signal. Normally just a unmodulated signal.
- Ramp Up Phase: Time it takes for the radio to initiate the power amplifier.
- Preamble: Sequence of a repeating bit pattern (0101010101...) to synchronize the receiver clock with the sender clock and determine the baud rate. At the same time this is also used to announce a transmission to wake-up a receiver from a low-power mode.
- Sync Word (SFD = Start Frame Delimiter): Breaks the preamble and signals the start of the frame.
- Frame: Data after the sync word including the CRC.
- Postamble: Same as preamble but this time it is to signal the end of a transmission.
- (Interframe/Interpacket) Gap: Time between a repeated packet transmission of a session.
- Layer 2: Frame = Data Link
- Transmission Control / Header: Describes a header (CtrlByte1/2) which holds information about the iohc protocol and frame
- MAC Header: Sender & Receiver NodeID in EUI/OUI-48 form
- NodeID: built-in 3-bytes device address (LSBF!)
  - Used in every communication to identify the transmitter and the receiver(s).
  - Programmed during manufacturing and "cannot be changed" (which is untrue as we will see later...).
  - Predefined ranges exist to differentiate manufacturers, types, etc.
  - Found on the device labels in plain text and as barcode/qr-code.
  - > "NodeIDs are recycled on a 3 to 5 years basis, depending on the product sales."
  - > "NodeID can be considered unique per installation/home."
  - Broadcasts are valid OUI-48 when Bit-Reversed and then Bit-Inverted (see LSBF). 00:00:3F > Reverse > Invert = 03:FF:FF.
    - See: [Universal vs. Local Bit](https://en.wikipedia.org/wiki/MAC_address#Universal_vs._local_(U/L_bit))
    - Mentioned in SDN (Somfy Digital Network) documents and observable via SDN Frame Builder
- Payload: Variable length field after the MAC header excluding the CRC which holds the usable data aka Message
- CRC (FCS = Frame Check Sequence): Calculated over the Frame
  - [CRC/CRC16-CCITT](https://srecord.sourceforge.net/crc16-ccitt.html) vs. [CRC16-KERMIT](https://reveng.sourceforge.io/crc-catalogue/16.htm#crc.cat.crc-16-kermit)
  - Check for yourself with reveng: `reveng.exe -m CRC-16/KERMIT -X -c "%*"`

</details>

### iohc Alliance Background & History

Since this is very uninstering for most people it is behind a collapsed section:

<details><summary>iohc Alliance Background & History</summary><br/><br/>

There is a low level software library thats accessable to members of the iohc alliance. Gateways ("Boxes") like the TaHoma/Cozytouch/etc. are just a whiteware product from Overkiz. The mobile apps are built by Modulotech. Overkiz, Somfy and Modulotech are owned by Atlantic.

The first manufacturer id was given to Velux. The initial alliance consisted of Velux, Somfy and Honeywell. From looking at the timeline my best guess would be that Somfy "invented" a new protocol but needed a stronger partner to get a bigger market share for their newly invented protocol.
<br/>
The approached Velux and exchanged some patents. After their lawyers had a look at those patents they realized that Honeywell held some important patents without they would never make it to market. So they made them an offer to join the alliance in exchange for the patents as they predicted a big market share (Velux is the market leader in Europe). Honeywell only ever produced one gateway and seems to have implemented their own version of iohc named EvoHome (Protocol: Ramses II).

> Fun Facts:
>
> iohc is only really used in Europe. For the american market they use either RTS (433 MHz) or a 2.4GHz bastard implementation with a shitty range.
>
> From the first 12 iohc alliance members only two use iohc to this day: Somfy and Velux. Everyone else quickly realizied that using such an obscure protocol is a dead end with no benefits which is costing them a lot of money.

- Overkiz KizBox/MiniBox Whiteware Examples
  - Cozytouch Branding: Atlantic, Thermor
  - Cotherm I-Vista
  - Hitachi HI-KUMO
  - Nexity Eugénie
  - Rexel Energeasy Connect
  - Somfy Connexoon, TaHoma

- iohc Alliance Members without any iohc products
  - SecuYou
  - Assa Abloy
  - niko
  - WindowMaster
  - Renson
  - Ciat
  - Honeywell
  - Hörmann
  - Ehret (VOLETRONIC io)
  - Alulux
  - SIMU
  - ExtremeLine (?)

#### iohc Quotes

<details><summary>Quotes</summary>

Taken from the FAQ on the io-homecontrol homepage (which is offline .. of course it is^^)

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

#### iohc History

<details><summary>Quotes</summary>

- Initative was created in 2002
- Launched in July 2005 by Somfy, Velux and Honeywell
- First companies to adopt: Hörmann, Assa Abloy, Niko, Renson, Windowmaster
  - [Velux PR: Assa Abloy becomes new ioHome member](https://press.velux.com/assa-abloy-becomes-a-new-member-of-io-homecontrol/)

</details></details>

### Links

<details><summary>Links</summary>

- Online Discussions
  - [rtl_433: Add new decoder for Velux shutter remote control - io-homecontrol protocoll](https://github.com/merbanan/rtl_433/issues/1376)
  - [RFHEM: Somfy Smoove io remote 868.25 MHz](https://github.com/RFD-FHEM/RFFHEM/issues/984)
  - [OpenHAB: Io-homecontrol / velux - something’s in the bush](https://community.openhab.org/t/io-homecontrol-velux-somethings-in-the-bush/11413)
  - Velux Blinds
    - [No KUX, just Loxone](https://smarthome.exposed/controlling-velux-windows/)
    - [Velux SML Rolläden „ablernen“ bzw. resetten](https://wolf-u.li/5920/velux-sml-rollaeden-ablernen-bzw-resetten/)
    - [snipsvelux](https://github.com/Psychokiller1888/snipsvelux)
    - [VeluxIR](https://github.com/zschub/VeluxIR) - IR protocol for old Velux remotes
- Kizbox Rooting
  - TaHoma: [Somfy TaHoma Jailbreak](https://github.com/Aldohrs/tahoma-jailbreak)
  - Connexoon: [No clouds, just sunshine. Disconnecting Somfy Connexoon from the cloud.](https://blog.unauthorizedaccess.nl/2021/04/07/no-clouds-just-sunshine.html)
  - CozyTouch: [CozyTouch Rooting the CozyTouch aka KizBox Mini](https://www.lafois.com/2020/11/07/rooting-the-cozytouch-aka-kizbox-mini-part-1/)
- FCC: [VELUX America Inc.](https://fccid.io/XSG)
- [FLOSS @ Overkiz](https://floss.overkiz.com)
  - [Device Tree from a KizBox](https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/microchip/at91-kizbox.dts)

</details></details>

## Contributors <!-- Add all Names/Projects which helped -->

<div align="center" width="100%">

**Thanks to everyone who helped in gathering all the information that makes up this repo!**

Since there are so many people who helped with the "opening" of the procotol i will try my best to name everyone involved. If you want your name on here or deleted then drop me a message.

</div>
