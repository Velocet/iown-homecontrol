# io-homecontrol Devices

This page lists devices for which their internal hardware (eg.: MCU, SoC, RF, etc.) is known.

<!-- TODO Link to sub pages for the different products with more indepth knowledge -->

## OEM Hardware <!-- TODO make table with mcus, etc. -->

List of supported OEM hardware including pictures and hardware description (if available).

### Velux

See [Velux](devices/velux/README.md).

### Somfy

The default password for animeo products is `somfy`.

- Info Snippets
  - Factory Codes
    - 000000 (+ A+S Buttons at once)
    - 0000
    - 12345

- Situo 1 io (1W) (via [reddit](https://www.reddit.com/r/AskElectronics/comments/cz8trb/need_help_identifying_rf_ic_nr3_x6_046/))
  - MCU: STM8L151C8U6 GH22C VG CHN 723 (UART: 38834 Baud = 38400, the difference is related to the STM8's internal clock)
  - RF: [Semtech SX1243](https://www.semtech.com/products/wireless-rf/frequency-shift-keying-fsk/sx1243#datasheets)
- TaHoma
  - MCU: STM32F101RCT6
  - RF: Si4461

#### LED Colors and Button Functions

The LED(s) display the product's operating mode or status.

- Orange: Boot Phase
- Blue "Breathing": WiFi credential change
- White Flashing: WiFi/Server connection
- Red Flashing: Not connected to Wifi or Server
- White: Connected to Server

#### Kizbox II

- LED Colors
  - During *Boot Phase*
    - Orange: Booting
    - Red blinking: Updating
    - Orange blinking: Initialization before *Standard Operating Mode*
  - During *Standard Operating Mode*
    - Green: Box connected to the cloud
    - Red: Box not connected to the cloud
    - Blue blinking: Box is pairing (*Local Mode*)
    - Blue: Box is paired in *Local Mode*
- Buttons
  - During *Boot Phase*
    - RST: Forces Box update. "Use a tool to operate it."
  - During *Standard Operating Mode*
    - CFG, RST: Action is software dependent
    - CFG: Short press cancels *Local Mode* pairing
    - Pressing CFG for 2s: initiates pairing to *Local Mode*.
      If no pairing is completed within 60s, box returns to *Standard Operating Mode*

> [Kizbox II Operation and Installation](https://www.overkiz.com/wp-content/uploads/2018/12/NOTICE_KIZBOX_UK_WEB_8fa0.pdf)

#### TaHoma V1/V2

- LED Colors
  - Green: Online / Automations On / Alarm Activ
  - White: Online
  - Red: Offline / Alarm gone off / Connecting
  - Orange blinking: Progress indicator for update or trying to connect
  - Yellow: Automations Off

#### TaHoma Switch

- Top LEDs:
  - White blinking: WiFi New Connection
  - Blue blinking: WiFi Configuration
  - Red blinking: WiFi Connection Refused
  - Orange: Restart Indicator
  - Green: Pro-Mode Indicator ("only via Pro App")
  - White (slow blinking): Scene started
  - Red: Scene stopped via Stop-Button
- Bottom LED:
  - Red = Offline
  - White = Online

## MAC, UUIDs and other known values to identify products

| Vendor   | Product                  | VID    | PID | OUI               | Type   | Other | Notes                       |
| -------: | :----------------------- | ------ | --- | ----------------- | ------ | ----- | --------------------------- |
| Somfy    | Unknown Sensor (OSB/ISB) |        |     | 00:05:51          |        |       | F&S Elektronik Systeme GmbH |
| Somfy    | Connect BMS              |        |     | 00:50:4E:11:78:12 |        |       | OUI: Sierra Monitor Corp.   |
| Somfy    |                          | 0x1220 |     |                   | ZigBee |       |                             |
| Overkiz  |                          | 0x123D |     |                   | ZigBee |       |                             |
| Atlantic |                          | 0x125B |     |                   | ZigBee |       |                             |
| Somfy    | SDN Gateway (USA)        |        |     | 04:91:62:68:EF:20 |        |       |                             |
|          |                          |        |     |                   |        |       |                             |

- Somfy TaHoma (Overkiz_KB1 = KizBox1): Ref. 5067437X03. PIN: 0201-0568-4011. MAC: F8:81:1A:00:02:38
- Somfy SDN Gateway (USA)
  - SDN Motors attached = 067071, 068A80, 068AA7, 0667B4

## Hardware Buttons

It seems that all devices have (at least) four different durations of button presses they recognize

- Command Presses (Up, Down, my, Stop, etc.)
- Reset, Programm, Pair Presses
  - Short: 0,5 sec = Confirm/Pair
  - Intermediate: 1.5 sec = "Long Press before Stop"
  - Medium: 4-5 sec = ?
  - Long: 8 sec = Reset
  - Very Long: 10 - 15 sec = Ignore (in case of abort)
  - Ultra Long: >20 sec (Some special internal stuff?)

## Device/Factory Reset and Double Power Cut (DPC)

- Factory Reset: Dual Power Cut
  - Unplug: 6 seconds
  - PlugIn: 10 seconds
  - Unplug: 6 seconds
  - PlugIn: Actuator will move.
  - Press and hold the *PROGRAMMING BUTTON* on the remote. Continue to hold the programming button until the motor jogs 2 times and has finished jogging.
    - NOTE: 1 Jog = 1 Up + 1 Down Movement

When it comes to iohc it seems the Double Power Cut is essential for reprogramming. The Double Power Cut puts the device into "Learning Mode". It seems that it's also possible to get into this learning mode with a simple 1W remote via pressing the Up/Down Button simultanisly.

- Double Power Cut (Standard)
  - 3 sec. Off
  - 10 sec. On
  - 3 sec Off
  - On: Actuator confirms with "Wink"
    - Option 1: Stop Learn Mode = Short Press "My" on Remote Controller
    - Option 2: Reset = Long Press (8 sec) "PROG" on Remote Controller
      - There will be a response from the Actuator which lasts around 10 seconds
    - Option 3: Pair = Short Press (0,5 sec) "PROG" on Remote Controller
      - Only deletes Remotes. Sensors remain paired to the Actuator.

- "my" Position (Intermedia Position IP)
  - Save new my Position
    - Long Press (8 sec) "my" Button: Actuator confirms with "Wink"
  - Change my Position
    - Long Press (8 sec) "my" Button: Actuator confirms with "Wink"
  - Delete my Position
    - Short Press (0,5 sec) "my" Button: Wait for Actuator
    - Long Press (8 sec) "my" Button: Actuator conforms with "Wink"

- io-homecontrol
  - Copy Remote Controller (1W)
    - Medium Press (~4 sec) "PROG" on Old Remote Controller
    - Short Press (0,5 sec) "PROG" on New Remote Controller
  - Add Sensor
    - Short Press (0,5 sec) "PROG" on Paired Remote Controller
    - Short Press (0,5 sec) "PROG" on New Sensor

> NOTE: This information (and more) can either be found in the io handbook or via the iohc db or XML files.
<!-- TODO: link above mentioned things -->

### Initial Setup Programming

Initial Setup Programming instructions is to be used to set the limits on a motor that has been reset to factory settings with the remote control paired to the motor.

## Overkiz

- Factory Mode:
  - 256 = reset on smartkiz
  - 258 = prog on mbrd
  -  26 = reset on kizbox3

### KizBoxMini

- [Kizbox mini](https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/at91-kizboxmini-common.dtsi) = `kizboxmini`
- [Kizbox mini base board](https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/at91-kizboxmini-base.dts) = `kizboxmini-base`
- [Kizbox Mini RailDIN](https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/at91-kizboxmini-rd.dts) = `kizboxmini-rd`
- [Kizbox Mini Mother Board](https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/at91-kizboxmini-mb.dts) = `kizboxmini-mb`

DTSI Definitions:
bootargs = "ubi.mtd=ubi";
stdout-path = &dbgu;
- keys
  - PB_PROG: pioC 17 GPIO_ACTIVE_LOW linux_code = 0x102
  - PB_RST: pioC 16 GPIO_ACTIVE_LOW linux_code = 0x100
  - usart0: use-dma-rx/tx
  - macb0: phy-mode = "rmii"
  - ebi-0: ebi_addr_nand ebi_data_0_7
  - nand_controller-0 nand_oe_we nand_cs nand_rb
  - nand@3
    - rb = pioD 5 GPIO_HIGH>;
    - cs = pioD 4 GPIO_HIGH>;
  - usb0 ports = 1
    - MotherBoard: ports = 2
  - usb1

base:
- usart0
  PIOA 0 A    PULL_UP
  PIOA 1 A    NONE
  PIOA 2 GPIO MULTI_DRIVE

RailDIN:
- adc0_ad5 vref=2500 channels=0x0020 - PIOB 16 GPIO NONE /* pull-up disable */

### SMARTKIZ

- 2 USB Ports
- ADC Clock
- UART Serial5

i2c1-0 PIOC 0 PULL_UP
i2c1-0 PIOC 1 PULL_UP
adc0_ad0  /* pull-up disable */ PIOB 11
adc0_ad5  /* pull-up disable */ PIOB 16
adc0_ad6   PIOB 17
adc0_ad11  PIOB 10
prog       pioC 17 //button
reset      pioC 16 //button
hk_reset   pioC 13
power_rf   pioA 20
power_wifi pioA 21
nand_rb    pioD 5 HIGH
nand_cs    pioD 4 HIGH

led_blue:   pwm0 2
led_green:  pwm0 0
led_red:    pwm0 1


### KizBox 3

- https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/at91-kizbox3-hs.dts
  - https://floss.overkiz.com/build/2022.6/at91-kizbox3/linux-overkiz-5.4.208-r4/0008-ARM-at91-dts-at91-kizbox3-hs-update-default-pins-sta.patch
- https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/at91-kizbox3_common.dtsi

3x USB
8x UART 0o
		serial0 = UART0;
		serial1 = UART1; /* Debug */
		serial2 = UART2;
		serial3 = UART3;
		serial4 = UART4;
		serial5 = UART5; /* Flexcom0 */
		serial6 = UART8; /* Flexcom3 */

name           =  ADDRESS     SIZE
bootstrap      = 0x000000 0x0020000
securam        = 0x001400 0x0000020  /* overkiz u-boot mode/version and factory */
u-boot         = 0x020000 0x0140000
u-boot-factory = 0x160000 0x0140000
ubi            = 0x2A0000 0x7D60000

TXD/RXD = USART
FlexCom = ATMEL FLEXCOM_MODE_USART

PD12 I2C6_DATA_FLEXCOM4_IO0 /* FLEXCOM_TWI */
PD13 I2C6_CLK_FLEXCOM4_IO1 /* FLEXCOM_TWI */
PA22 SW0 pioC  LOW linuxcode 0x100 /* PB_RST=button-reset */
PA29 SW1 pioA  LOW linuxcode 0x101 /* PB_USER=button-user */
PA18 SW2 pioA  LOW linuxcode 0x102 /* PB_PROG=button-prog */
PA22 SW3 pioA  LOW linuxcode 0x103 /* */
PA26 SW7 pioA  LOW linuxcode 0x107 /* */
PA24 SW8 pioA  LOW linuxcode 0x108 /* */
PB01 led_red pioA  HIGH
PB03 RXD4
PB04 TXD4
PB08 led_white pioA  HIGH
PB11 verbose_bootloader pioA  HIGH INPUT
PB12 nail_bed_detection pioA  HIGH INPUT
PB21 zbe_test_radio pioA  HIGH
PB22 TXD5 /* UART5=FLEXCOM0_IO0 */
PB23 RXD5 /* UART5=FLEXCOM0_IO1 */
PB25 zbe_rst       pioA  HIGH
PB26 RXD0
PB27 TXD0
PB30 io_reset      pioA  HIGH /* stm32 reset must be open drain (internal pull up) */
PC00 id_usba       pioA  LOW INPUT
PC09 io_test_radio pioA  HIGH
PC11 io_boot_0     pioA  HIGH
PC12 RXD3
PC13 TXD3
PC17 io_boot_1     pioA  HIGH
PC19 rf_on         pioA  HIGH
PC20 wifi_on       pioA  HIGH
PD02 RXD1 /* UART1=DEBUG */
PD03 TXD1 /* UART1=DEBUG */
PD04 RXD2 /* UART2 */
PD05 TXD2 /* UART2 */

## Somfy TaHoma (KizBox1)

- AT91SAM9G20 CU 1010 B KLRK1-3
  - RAM: Samsung 004 K4S561632J-UC75 S5616 WRL093GDU
  - ROM: SH80001B 2BN6
  - Atmel 32UC3B1 256-U 0940 265-1
    - ADF7020-BCPZ

## Connexoon

- AT91SAM-9G20: Kizbox
- AT91SAM-9G25: Kizbox Mini, SmartKiz
  - Kizbox Mini Base Board (kizboxmini-base)
  - Kizbox Mini Mother Board (kizboxmini-mb), Minikiz
  - Kizbox Mini RailDIN (kizboxmini-rd)
- AT91SAM-A5D31: Kizbox 2/II
  - Kizbox 2 with 2 head board (kizbox2-2)
- AT91SAM-A5D27: Kizbox 3 (Kizbox3)
  - kizbox3-hs - Kizbox3-HS (Kizbox3-HS)

---

- AT91SAM9G25 CU 2002 A 200275V
  - RAM: SKHynix H5PS1G63KFR S5C 747A NW3M2662BH
  - ROM: MxIC L194010 MX30LF1G18AC-TI 8F1332?? SH80003D
  - RTS/io-homecontrol: STM32F101RCT6
    - Silicon Labs Si4461 Rev. 2A

## KizBox2

- Linux (curl) compiliation settings
  > '--build=x86_64-linux' '--host=arm-overkiz-linux-gnueabi' '--target=arm-overkiz-linux-gnueabi' 'build_alias=x86_64-linux' 'host_alias=arm-overkiz-linux-gnueabi' 'target_alias=arm-overkiz-linux-gnueabi'
  > '--prefix=/usr' '--exec_prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--libexecdir=/usr/libexec' '--datadir=/usr/share' '--sysconfdir=/etc' '--sharedstatedir=/com' '--localstatedir=/var' '--libdir=/usr/lib' '--includedir=/usr/include' '--oldincludedir=/usr/include' '--infodir=/usr/share/info' '--mandir=/usr/share/man'
  > '--with-random=/dev/urandom' '--with-libtool-sysroot=/home/slave/j2data/workspace/yocto-build/build/at91-kizbox2/tmp/sysroots/at91-kizbox2' '--with-mbedtls=/home/slave/j2data/workspace/yocto-build/build/at91-kizbox2/tmp/sysroots/at91-kizbox2/usr/lib/../' '--with-zlib=/home/slave/j2data/workspace/yocto-build/build/at91-kizbox2/tmp/sysroots/at91-kizbox2/usr/lib/../'
  > '--without-cyassl' '--without-gnutls' '--without-libidn' '--without-libssh2' '--without-nss' '--without-ssl'
  > '--disable-curldebug' '--disable-debug' '--disable-dependency-tracking' '--disable-dict' '--disable-file' '--disable-ftp' '--disable-gopher' '--disable-imap' '--disable-ldap' '--disable-ntlm-wb' '--disable-pop3' '--disable-rtsp' '--disable-silent-rules' '--disable-smtp' '--disable-telnet' '--disable-tftp'
  > '--enable-ares' '--enable-crypto-auth' '--enable-http' '--enable-werror' '--without-axtls'
  > 'CC=arm-overkiz-linux-gnueabi-gcc -march=armv7-a -marm -mfpu=vfp -mfloat-abi=hard -mtune=cortex-a5 --sysroot=/home/slave/j2data/workspace/yocto-build/build/at91-kizbox2/tmp/sysroots/at91-kizbox2'
  > 'LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed' 'CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/home/slave/j2data/workspace/yocto-build/build/at91-kizbox2/tmp/work/cortexa5hf-vfp-overkiz-linux-gnueabi/curl-mbedtls/7.54.0-r0=/usr/src/debug/curl-mbedtls/7.54.0-r0 -fdebug-prefix-map=/home/slave/j2data/workspace/yocto-build/build/at91-kizbox2/tmp/sysroots/x86_64-linux= -fdebug-prefix-map=/home/slave/j2data/workspace/yocto-build/build/at91-kizbox2/tmp/sysroots/at91-kizbox2= '
  > 'CPPFLAGS=' 'CPP=arm-overkiz-linux-gnueabi-gcc -E --sysroot=/home/slave/j2data/workspace/yocto-build/build/at91-kizbox2/tmp/sysroots/at91-kizbox2  -march=armv7-a -marm -mfpu=vfp  -mfloat-abi=hard -mtune=cortex-a5`

at91-gpio export -q PE3 1

## Somfy

Somfy TaHoma Ethernet Adapter 1870470A MAC ID: 00:0E:C6:A3:37:12 (OUI: 00:0E:C6 = Asix Electronics Corp.)


Somfy TaHoma 1601-0089-8476 yahpoker@gmail.com Activation Date: 02-17-2021
Somfy TaHoma 1602-0265-7960
Somfy TaHoma 1602-5563-2031
Somfy/Overkiz TaHomaBeecon/Smartkiz Serial: O17196101F0106

Overkiz Demo/Internal PIN: 0801-0001-0000

### TaHoma Switch/Beecon (SmartKiz) Test Commands

REF: 5153854A

QR: 0 649A TU13 10577;2001-9782-3599;649A 0 10577;MKNPROQJ;J8gmBYXbmcqF;5153854A

QR: ???;PIN;???;???;???;REF
MAC: 48:D8:90:85:AC:E4
PIN: 2001-9782-3599

- RTS

```shell
init             # Initialisation
sx1243 init test # Initialisation RTS (Test mode)
sx1243 tx on     # Pure Carrier frequency
sx1243 data on   # Modulated Carrier frequency
sx1243 stop
```

<!-- TODO: Fix Link -->
This program can be found under extras.

- ZigBee

  ```shell
  init
  efr32 init
  efr32 start 1
  efr32 set-chan <num channel>
  efr32 set-power 14 0
  efr32 stream start
  efr32 stop 1
  ```

### Somfy Situo 1 io

### Wind Sensor io

- PCB
  - 5057130
  - QR: 1100327255
- Analog Devices (ADI): ADF7020BCPZ
- Microchip MCQE128C
- HC161 - Generic Counter

## Other Vendors

### Roma RomaPad / TaHomaPad io

- ID: 00:0A:EB:3E:7D:64 - SW Version: 5109529A013
  - Kernel Version: Linux 2.6.35.3-571-gcca29a0 (factory@factory-laptop) (gcc-version: 4.4.4 (4.4.4_09.06.2010))
  - #308 PREEMPT Mon Oct 17 14:34:29 HKT 2013
  - Product Software Version: 5109529A020
  - DB Hardware Version: 5102951A001
  - DB Software Version: 5103448A016
  - VmRSS: 76888 kB
  - Sat Jan 1 00:16:39 2000
  - Internal Settings: Einstellungen / System/ Login / Passwort: INSTAL / Software Verwaltung
- ID: 00:0A:EB:3E:7D:F6 - SW Version: 5109529A013
- ID: 00:0A:EB:3E:7E:98 - SW Version: 5109259A018

- Software
  - [Romapad Update Checker v1.0.17.1](https://web.archive.org/web/20180418024112/http://www.roma.de/de/service/romapad.html)
    - [Download](https://web.archive.org/web/20180418024112/http://padupdate.roma.de/RomapadUpdateChecker_Package_v1.0.17.0.exe)
    - [Download 1.0.18.0](https://web.archive.org/web/20170622220109/http://ftp.roma.de/padupdate/RomapadUpdateChecker_Package_v1.0.18.0.exe)
    - http://padupdate.roma.de/RomapadUpdateChecker_Package_v1.0.0.0.exe
    - http://padupdate.roma.de/RomapadUpdateChecker_Package_v1.0.10.0.exe
    - https://web.archive.org/web/20130518032046/http://padupdate.roma.de/RomapadUpdateChecker_Package_v1.0.0.0.exe
    - https://web.archive.org/web/20140701223938/http://padupdate.roma.de/RomapadUpdateChecker_Package_v1.0.10.0.exe
    - https://web.archive.org/web/20150317224215/http://padupdate.roma.de/RomapadUpdateChecker_Package_v1.0.16.0.exe
    - https://web.archive.org/web/20180418024112/http://padupdate.roma.de/RomapadUpdateChecker_Package_v1.0.17.0.exe
    - https://web.archive.org/web/20180315095745/http://ftp.roma.de/padupdate/RomapadUpdateChecker_Package_v1.0.18.0.exe
    -
