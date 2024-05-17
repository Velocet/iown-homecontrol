# Velux KLI 31x Series - Wall mounted Remote Controls

The Velux KLI 31x Series consists for four different models with each model having a unique device function it handles:

- KLI310: Universal
- KLI311: Inner Shades
- KLI312: Window Opener
- KLI313: Roller Shutter

They each share the same hardware with different prints on the cases.

- [Data Sheet (German)](https://velcdn.azureedge.net/-/media/marketing/de/dokumente/pdf/produktanleitungen/produktdatenblatt/integra/velux-produktdatenblatt-funk-wandschalter-kli310_311_312_313.pdf)

- Velux Sticker (backside)
  - `3LI D13 WW`
  - Model: `BG-RC011-01`
  - `20BK05B`
  - `831646`

## Hardware

- PCB marking: `831491/03` = Internal SAP inventory number / Revision
- PCB size: 68,75mm x 74,2mm

- Silicon Labs `EFR32FG1P133F256GM48` MCU
  - [Manufacturer Site](https://www.silabs.com/wireless/proprietary/efr32fg1-series-1-sub-ghz-2-4-ghz-socs)
  - [Data Sheet](https://www.silabs.com/documents/public/data-sheets/efr32fg1-datasheet.pdf)
  - [Reference Manual](https://www.silabs.com/documents/public/reference-manuals/efr32xg1-rm.pdf)

### Debug Interface & PCB

The PCB contains two a and modified software (if the software is modified at all)*

``` ascii title="QFN48 2.4 GHz and Sub-GHz Device Pinout"
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
        |    Pitch = 1.27 mm          |
        |                             |
+-------+                             +-------+
|                                             |
|                                             |
|                                             |
+---------------------------------------------+
```

| PIN | MCU<br/>PIN | MCU<br/>PIN Name | Function             |
| --: | ----------: | :--------------- | :------------------- |
| 1   | 24          | `PD15`           | `DBG SWO`            |
| 2   | 0           | `Vss`            | Ground               |
| 3   | 1           | `PF0`            | `DBG SWCLK / TCK`    |
| 4   | 32          | `PB12`           | *Unknown*            |
| 5   | 2           | `PF1`            | `DBG SWDIO / TMS`    |
| 6   | 12          | `RESETn`         | `RESET`              |
| 7   | 47          | `PC10`           | *Unknown*            |
| 8   | 43          | `PC6`            | *Unknown*            |
| 9   | 27          | `PA2`            | *Unknown*            |
| 10  | 37          | `Vcc/Vdd`        | Supply Voltage: 3,3V |



## Package Marking

> EFR32<br/>
> PPPPPPPPP = FG1P133GG<br/>
> YYWWRTTTTT N = 1952C012VF 0

- 1st Line: PPPPPPPPP – The part number designation.
  1. Family Code: F
  2. G = Gecko
  3. Series: 1
  4. Performance Grade: P
  5. Feature Code: 1
  6. TRx Code: 3 = TxRx
  7. RF Band: 3 = Dual-band (Sub-GHz + 2.4 GHz)
  8. Flash Size: G = 256K
  9. Temperature Grade: G = -40 to 85
- 2nd Line: YYWWRTTTTT N
  - YY – Assembly Year (last 2 digits) = 2019
  - WW – Assembly Year Workweek = 52
  - R - Device Revision: C
  - TTTTT – Trace or Manufacturing Code: 012VF
  - N – Bootloader Revision: 0
