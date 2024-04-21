
# OEM Hardware <!-- TODO make table with mcus, etc. -->

List of supported OEM hardware including pictures and hardware description (if available).

## Somfy


- Situo 1 io (1W) (via [reddit](https://www.reddit.com/r/AskElectronics/comments/cz8trb/need_help_identifying_rf_ic_nr3_x6_046/))
  - MCU: STM8L151C8U6 GH22C VG CHN 723 (UART: 38834 Baud = 38400, the difference is related to the STM8's internal clock)
  - RF: [Semtech SX1243](https://www.semtech.com/products/wireless-rf/frequency-shift-keying-fsk/sx1243#datasheets)
- TaHoma
  - MCU: STM32F101RCT6
  - RF: Si4461


## Velux

### Hardware

- Velux Solar Powered Blinds (SSL)
  - Version from 2012: [Akkutausch beim VELUX INTEGRA® SOLAR SSL](https://hartgeloetet.blogspot.com/2017/04/akkutausch-beim-velux-integra-solar-ssl.html)
  - Renesas D78F1144: 16-bit uC (78K0R/Kx3-Family), 128kB Flash, 8kB RAM
  - Analog Devices ADF7020
- Velux KLF 200
  - EFM32 (EFM32GG990F-1024D) = ARM Cortex-M3
  - RF: Analog Devices ADF7022
  - MCU: [STM32F427II-H6](https://www.st.com/en/microcontrollers-microprocessors/stm32f427ii.html) = ARM Cortex-M4 with DSP & FPU, 2MB Flash, 180MHz

### Product Range

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
- [KLI 313 - (1w) Wall Mounted Remote Control for Outer Sun Blind](devices/Velux/KLI31x/README.md)
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
