# Velux KLI 313 - Wall mounted Remote Control for Outer Sun Blind

*KLI 310/311/312/312 use probably the same hardware just with different cases and modified software (if the software is modified at all)*

- [Data Sheet (German)](https://velcdn.azureedge.net/-/media/marketing/de/dokumente/pdf/produktanleitungen/produktdatenblatt/integra/velux-produktdatenblatt-funk-wandschalter-kli310_311_312_313.pdf)

- `3LI D13 WW`
- Model: `BG-RC011-01`
- `20BK05B`
- `831646`

## Hardware

- Board `831491/03`
- PCB size: 68,75mm x 74,2mm

- Silicon Labs `EFR32FG1P133F256GM48` MCU
  - [Manufacturer Site](https://www.silabs.com/wireless/proprietary/efr32fg1-series-1-sub-ghz-2-4-ghz-socs)
  - [Data Sheet](https://www.silabs.com/documents/public/data-sheets/efr32fg1-datasheet.pdf)
  - [Reference Manual](https://www.silabs.com/documents/public/reference-manuals/efr32xg1-rm.pdf)

## Debug Interface

- Pitch = 1.27 mm

```text
        +-----------------------------+
        |                             |
        |                             |
        |                             |
        |                             |
        |                             |
        |                             |
        |                             |
        |  +----------------+         |
        |  | 2  4  6  8  9  |         |
        |  |                |         |
        |  | 1  3  5  7  10 |         |
        |  +----------------+         |
+-------+                             +-------+
|                                             |
|                                             |
|                                             |
+---------------------------------------------+
```

- Debug Pin 1 $\rightarrow$ MCU Pin 24 $\rightarrow$ `PD15` $\rightarrow$ `DBG_SWO`
- Debug Pin 2 $\rightarrow$ `GND`
- Debug Pin 3 $\rightarrow$ MCU Pin 1 $\rightarrow$ `PF0` $\rightarrow$ `DBG_SWCLKTCK`
- Debug Pin 4 $\rightarrow$ MCU Pin 32 $\rightarrow$ `PB12`
- Debug Pin 5 $\rightarrow$ MCU Pin 2 $\rightarrow$ `PF1` $\rightarrow$ `DBG_SWDIOTMS`
- Debug Pin 6 $\rightarrow$ MCU Pin 12 $\rightarrow$ `RESETn`
- Debug Pin 7 $\rightarrow$ MCU Pin 47 $\rightarrow$ `PC10`
- Debug Pin 8 $\rightarrow$ MCU Pin 43 $\rightarrow$ `PC6`
- Debug Pin 9 $\rightarrow$ MCU Pin 27 $\rightarrow$ `PA2`
- Debug Pin 10 $\rightarrow$ `VCC` @ 3V $\rightarrow$ Probably VCC, not sure though
