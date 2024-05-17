# Velux io-homecontrol Devices

![Velux label](../../assets/images/support/velux-label_example.png)

| `{0x2B, 0x7E, 0x15, 0x16, 0x28, 0xAE, 0xD2, 0xA6, 0xAB, 0xF7, 0x15, 0x88, 0x09, 0xCF, 0x4F, 0x3C}` |
| :------------------------------------------------------------------------------------------------: |
| `bootloader_decryption_Key[]`                                                                      |

## Product Range

- Naming Scheme: ABC nnn (nAB Cnn DD)
  - ABC nnn
  - n = / AB = | C = / nn = | DD = Region (WW > WorldWide / EU > Europe / US > US of A)

- Controls
  - KLR 100 - (2w) Remote Control with Screen.
  - [KLR 200 - (2w) Remote Control Pad (3LR A02)](#klr-200)
  - [KLR 300 - (2w) Remote Control Pad (3LR A03)](#klr-300)
  - KUX 100 - (1w) Remote Control (long but not as long as KLR 100)
  - KLI 110/310 - (1w) Control switch.
    - KLI 310 - (1w) Remote Control for Universal Usage
    - KLI 311 - (1w) Remote Control for Window
    - KLI 312 - (1w) Remote Control for Inner Sun Blind
    - [KLI 313 - (1w) Remote Control for Outer Sun Blind](KLI31x/README.md)
  - KRX 100 - (2w) Remote Control with Screen (KLF 102 > 3LF D02).
  - KLA 130 - Solar sensor.
  - KLF 050 - Switch interface.
  - KLF 100 - Interface. See [Controlling Velux Windows With Fibaro](https://k2aab.com/home-automation/sub-page-1/controling-velux-windows-with-fibaro/).
  - [KLF 200 - Internet (gateway)](#klf-200)
- Power Supplies
  - KUX 100 - (2w) control system for roof window. consists of control unit and (1w) remote control.
  - KLC 500 - control unit for up to 5 products in roof windows.
- Roller Shutters And Blinds
  - SML (SSL) - roller shutter (solar) for outside of roof window.
  - MML (MSL) - awning blind (solar) for outside of window.
  - DML (DSL) - blackout blind (solar) for roof windows.
  - RML (RSL) - roller blinds (solar) for roof windows.
  - FML - pleated blind for roof windows.
  - FMG - pleated blind for flat roof windows (CFP/CVP = 3MX A02).
  - GGL (GGU) - roof windows: ----21 (solar: ----30)
  - PML - venetian blind for roof windows.
  - HVC - modular skylight (3MA A01, 3MA A02, 3MA A03, 3MA A04, 3MA A05)
- Other & Sets (xxX)
  - KRA 100 - Frame lights for use with GGL/GGU or KMX 100/200 equipped windows.
  - KRD 100 - (1w) Remote Socket.
  - KMG 100 - window operator
  - KMX 100 - window operator – conversion kit (3MG A01, 3UC A02, 3LA A01, 3LR A01) for GGL, GGU
  - KMX 200 - window operator – conversion kit (3MX A01, 3LA A01, 3LR A01) for GHL, GHU, GPL, GPU, GTL, GTU, VKU
  - KSX 100 - Solar window operator / conversion kits (3SM B01, 3SD B01, 3LR A01) KSX 100K (3SM BK01, 3LR A02) for GGL, GGU
  - KIG 300 - Internet Gateway (NXG01E / NXG01C / NXS01 / NXD01E)
  - KIX 300 - Indoor climate control
    - KIG 300 Internet Gateway (App Control)
    - KLG 300 Gateway (3LG E01/NXG01E)
    - KLA 300 Room Climate Sensor (3LA E06/NXS01)
    - KLN 300 Departure Switch (3LN E01/NXD01E)

### Examples

Real world examples with the data taken

- KLF 200 (Internet Gateway)
  - 3LF D03 WW **/** Model-BE-RC009-02 **/** 35BM08B - 6594 B801 2B21 003D
  - SSID: VELUX_KLF_84C3 **/** Password: 2Em29uN76b
  - MAC WiFi/LAN: 74-7A-90-8A-84-C3 **/** 64-61-84-00-A8-36

## KLF 200

- MCU: EFM32 Giant Gecko ([EFM32GG990F1024G-E-BGA112](https://www.silabs.com/documents/public/data-sheets/efm32gg-datasheet.pdf)) 48MHz ARM Cortex-M3, 1MB Flash, 128KB RAM
  - FLASH: 256Mbit (Unknown)
- MCU: [STM32F427II-H6](https://www.st.com/en/microcontrollers-microprocessors/stm32f427ii.html)(High-performance advanced line) 180MHz ARM Cortex-M4 with DSP/FPU, 2MB Flash, Chrom-ART Accelerator
  - FLASH: 256Mbit (Unknown)
- RF: Analog Devices `ADF7022`
- WiFi: `SP-7DZX`
  - Front End 2.4GHz: `CC2590`
  - Low Power 2.4GHz: `AT86RF233`
- Ethernet: `W5500`

## KLR 200

- RAM: [ISSI IS62WV51216BLL-55BLI/55BI](https://www.issi.com/WW/pdf/62WV51216ALL.pdf) 8MBit, 3,3V, 55ns
- ROM: [Micron MT29F4G16ABADAH4 NW197](https://media-www.micron.com/-/media/client/global/documents/products/technical-note/nand-flash/tn_29_68_60_series_otp_operations.pdf) 4Gb, 16bits, 3,3V, SPI/ASync

## KLR 300

KLR 300 QR Code regex:

``` regex
  ^P(\d{1,}W|T(\d{1,}H(\d{1,}M(\d{1,}S)?)?|\d{1,}M(\d{1,}S)?|\d{1,}S)|(\d{1,}D|\d{1,}M(\d{1,}D)?|\d{1,}Y(\d{1,}M(\d{1,}D)?)?)(T(\d{1,}H(\d{1,}M(\d{1,}S)?)?|\d{1,}M(\d{1,}S)?|\d{1,}S))?)#$
  ^([+-]?\d{4,6})-?(\d\d)-?(\d\d)(?:[ T](\d\d)(?::?(\d\d)(?::?(\d\d)(?:[.,](\d+))?)?)?( ?[zZ]| ?([-+])(\d\d)(?::?(\d\d))?)?)?$8
```

## KLG 300

QR Code Payload: Ethernet MAC, WiFi MAC, UUID, Code

## SSL

Solar Powered Blinds

- Version from 2012: [Akkutausch beim VELUX INTEGRA® SOLAR SSL](https://hartgeloetet.blogspot.com/2017/04/akkutausch-beim-velux-integra-solar-ssl.html)
- Renesas `D78F1144`: 16-bit uC (`78K0R/Kx3`-Family), 128kB ROM, 8kB RAM
- Analog Devices `ADF7020`

### Solar Motor PCB

PCB Markings: 833436 (Sticker) / 833431/04 (PCB Print)

```ASCII
  1  0  0  0  1  0
      __       __---SOLAR
  |  |  |  |  |  |
  |  |  |  |  |  |
  |  |__|  |_____|
  |  GRND  |     |
  |4-P-I-N |  |  |
  |  |  |  |  |  |
  R  S  B  G  SOLAR
  1  2  3  4
     |  |  |
     |__|__|
```
