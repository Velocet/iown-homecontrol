NOTE: ["Official" Telegram Group](https://t.me/iownHomecontrol)

- Someone is in the process of writing a CC1101 implementation
- **A lot** of information was gathered in the last months which is reviewed. The repo will be updated in the next few days.
- Currently we are searching someone knowledgable with Flutter Reverse Engeneering
- Feel free to ask questions in the Telegram group or contribute to this repo :)

# iown-control / IOmecontrol

This project should document every bit of information about io-homecontrol and make it a freely available protocol for everyone to use. Matter is right around the corner and still there are some companies that insist on using this proprietary crapload. It seems that at least Velux knows how shitty io-homecontrol is cause they are the only once who have implemented their own "KizBox".

## Goals

- Freely available documentation of the io-homecontrol protocol
- Freely available and portable library to implement io-homecontrol on every MCU/SoC thats out there
- Freely available and portable high level API
- Find a simple (!) way to flash new firmware
  - Either via OTA or debug bridge
- Bonus Points: Build a Somfy TaHoma or Velux KLF 200 clone out of M5 hardware for less money ;)

## Possible "Solutions"

- Clone 1/2-way Remote with ESP32+868MHz (ZigBee?)
- Clone 1/2-way Remote with local setup (RPi/PC)
- Clone 1-way Remote with repurposed Ikea remote (8€...)
- Create new PCB ([see those guys from poland...](http://techniline.com/index.php/en/intelligent-buildings/item/6-velux-window-actuator-regular-with-intelligent-building))
- Flash hacked Ikea Frytur firmware onto Velux/Somfy blinds
- Emulated KLR 200/KIX 300 (eg. via QEMU)
- Somfy only: Get rid of the stupid start/end position tool which costs a shit load of money for nothing

## Open Topix

- [ ] Document Layer 1/2 (Hint: See Patents...)
  - [ ] io-homecontrol Paket definition
- [ ] Document Layer 3+
- [ ] Correct rtl_433 Implementation
- [ ] ReWrite of crypto test in Python
- [ ] What is Velux using in the US?
  - Same PCB layout/design with different antennas, radios and/or chips (MCU/SoC) as in EU/China
  - WiFi instead of 868 MHz ISM Band > io-homecontrol iomecontrol iomecntrl
- [ ] Possible to flash Velux/Somfy firmware onto Ikea remotes?

## Detailed Information

Covered in the following documents are the details of the io-homecontrol protocols

* [Radio](Radio.md)
* [Link Layer](LinkLayer.md)
* [Commands](Commands.md)

## Basic Information

There is a low level lib thats accessable to members of the io-homecontrol board.
The design of the TaHoma/Cozytouch/etc. boxes seems to be mostly based of a framework from Overkiz.
The mobile apps are built by Modulotech.
Overkiz, Somfy and Modulotech are owned by Atlantic.

> Why three frequencies? - How does it work?
>
> - Before sending a command, the transmitter “listens to“ each of the three available frequencies.
> - It selects the one that is free and when the product(s) do not react immediately, the command is also emitted on one of the other frequencies.
>
> Encrypted emissions: the key to security - How does it work?
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

### Hardware

Overview of official hardware (eg. transceiver chips, MCUs, SOCs, remote controls)

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
  - KLI 310 - (1w) Remote Control
  - KLI 311 - (1w) Remote Control Window
  - KLI 312 - (1w) Remote Control Inner
  - KLI 313 - (1w) Remote Control Outer
  - KIX 300 - Package: KIG 300, Raumklimasensor, Abwesenheitsschalter
    - VELUX ACTIVE indoor climate control KIX 300 (gateway 3LG E01/NXG01E, climate sensor KLA 300/3LA E06/NXS01 and departure switch KLN 300/3LN E01/NXD01E)
  - KIG 300 - Internet Gateway NXG01E / NXG01C / NXS01 / NXD01E
  - KRD 100 - Remote Socket (1w)
  - KMX 100 - UNKNOWN
  - KMX 200 - UNKNOWN
  - KLA 130 -
- Overkiz Minibox
  - Atlantic Cozytouch
  - Thermor Cozytouch
  - Cotherm I-Vista
  - Hitachi HI-KUMO
  - Nexity Eugénie
  - Rexel Energeasy Connect
  - Somfy Connexoon
  - Somfy TaHoma
    - SI4461 + STM32F101RCT6
- Other Companies
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
  - ExtremeLine (?)

### Encryption

128-Bit AES

### Protocol

Data packet consists of:
  Preamble
  Start Byte
  Address
  Data: UART encoded
  CRC


### Layer 1/2

#### Frequency / Modulation

- 868.00 MHz –  870.00 MHz with 3 Channels: (EU / WorldWide > NXG01E)
  - 1: 868.25 MHz (868.00 MHz – 868.60 MHz)
  - 2: 868.95 MHz (868.70 MHz – 869.20 MHz)
  - 3: 869.85 MHz (869.70 MHz – 870.00 MHz)
- Band (Narrow): 12.5/25 kHz (> add 50 kHz rtl_433 Range)
- Deviation: 20 kHz (> add another 40 kHz)
- Data/Baud Rate: 38.4 kbps
- Encoding: NRZ
- Modulation: (G)FSK [TODO: NEEDS CLARIFICATION]
  - According to [From Baseband to Bitstream](https://cansecwest.com/slides/2015/From_Baseband_to_bitstream_Andy_Davis.pdf): GFSK ([RFTM](http://nccgroup.github.io/RFTM/))
  - According to ADF7022 Datasheet: FSK
- Standards: IEEE 802.15.4(g) / ETSI-300-200
- Modes: Master, Slave, Beacon
- Checks: CRC, preamble, start byte
- Encoding (data): UART
- 2400.00 MHz - 2483.50 MHz (USA / Canada > NXG01C) - UNCONFIRMED if io-Homecontrol (used by Velux)
- 1-way remotes: max. 10 devices / 2-way remotes: unlimited devices

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

  | ![io-Homecontrol frequencies](https://liaison.mainguet.org/_img/iohomecontrol_frequence.png) |
  | -------------------------------------------------------------------------------------------: |
  |     taken from [les technologies de liaison](https://liaison.mainguet.org/iohomecontrol.htm) |

VELUX INTEGRA® io enabled products

- roof windows GGL (----21), GGU (----21)
- Solar roof windows GGL (----30), GGU (----30)
- flat roof window CVP (3MX A02)
- modular skylight HVC (3MA A01, 3MA A02, 3MA A03, 3MA A04, 3MA A05)
- conversion kit KMX 100 (3MG A01, 3UC A02, 3LA A01, 3LR A01) for roof windows GGL, GGU
- conversion kit KMX 200 (3MX A01, 3LA A01, 3LR A01) for roof windows GHL, GHU, GPL, GPU, GTL, GTU, VKU
- Solar conversion kits KSX 100 (3SM B01, 3SD B01, 3LR A01), KSX 100K (3SM BK01, 3LR A02) for roof windows GGL, GGU
- Control pad KLR 200 (3LR A02)

### Other tidbits

Older versions of the Velux blinds could be configured to bypass the io homecontrol features to allow direct control of the motors. I had planned to use Hunter Douglas DBMZ Z-Wave controllers to drive the blinds. However, the blinds I purchased (Velux FMK 24 Volt) had the bypass feature removed, so I am left with blinds that don’t work.

#### Patents, Companies, etc

Overkiz > Somfy > Atlantic
> We provide global IoT solutions that connect, install, control, and monitor equipment from different manufacturers and technologies for home and building automation.
> Overkiz is an OEM company and subsidiary of Somfy Group

But since this bullshit circle isn't enough: All iOS/Android Apps that OverKiz provides to all its customers (Hitachi, somfy, ubiwizz, nexity, etc.) is done by [Modulotech](https://modulotech.fr).

And i bet my left ball that also the KizBoxes are not built by themself...

#### io-homecontrol history

- Initative was created in 2002
Launched in July 2005 by Somfy, Velux and Honeywell
- First companies to adopt:
  - Hörmann, Assa Abloy, Niko, Renson, Windowmaster
[https://press.velux.com/assa-abloy-becomes-a-new-member-of-io-homecontrol/]

## Links

- FCC: [VELUX America Inc.](https://fccid.io/XSG)

### Software

[Universal Radio Hacker](https://github.com/jopohl/urh)
[SDRangel](https://github.com/f4exb/sdrangel)
[inspectrum](https://github.com/miek/inspectrum)
[HDSDR](http://www.hdsdr.de/)

### Rooting

TaHoma: [Somfy TaHoma Jailbreak](https://github.com/Aldohrs/tahoma-jailbreak)
Connexoon: [No clouds, just sunshine. Disconnecting Somfy Connexoon from the cloud.](https://blog.unauthorizedaccess.nl/2021/04/07/no-clouds-just-sunshine.html)
CozyTouch: [CozyTouch Rooting the CozyTouch aka KizBox Mini](https://www.lafois.com/2020/11/07/rooting-the-cozytouch-aka-kizbox-mini-part-1/)

### OverKiz

[https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/at91-kizbox.dts]

### Online Discussions

[https://github.com/merbanan/rtl_433/issues/1376]
[https://github.com/RFD-FHEM/RFFHEM/issues/984]
[https://community.openhab.org/t/io-homecontrol-velux-somethings-in-the-bush/11413]

### Velux Blinds

[No KUX, just Loxone](https://smarthome.exposed/controlling-velux-windows/)
[Velux SML Rolläden „ablernen“ bzw. resetten](https://wolf-u.li/5920/velux-sml-rollaeden-ablernen-bzw-resetten/)
[snipsvelux](https://github.com/Psychokiller1888/snipsvelux)
[VeluxIR](https://github.com/zschub/VeluxIR) - IR protocol for old Velux remotes

## Official Hardware and Vendors
