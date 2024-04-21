# Somfy SMOOVE Origin IO

- Smoove 1 IN io Pure Shine
- `1811093D`

---

- Article Number `5121820C008`

[Product Page Smoove Origin IB](https://shop.somfy.de/zentralschalter-smoove-origin-ib.html)

---

[Product Page](https://www.somfy.co.uk/products/1811066/smoove-origin-io)

[English Instruction Manual](https://asset.somfy.com/Document/27a4f13b-37e6-42c1-88ad-8a2fca49de15_5067070C001_LEAFLET_SMOOVE_ORIGIN_IO-ENESPTEL.pdf)

## Hardware

- Board: `5144596 A000`
- Data Matrix: `24056510313571`

- ST Microelectronics `STM8L151C8U6` MCU
  - [Device Page](https://www.st.com/en/microcontrollers-microprocessors/stm8l-series.html)
  - [Data Sheet](https://www.st.com/resource/en/datasheet/stm8l151r6.pdf)
  - [Reference Manual](https://www.st.com/resource/en/reference_manual/rm0013-stm8l001xx-and-stm8l101xx-microcontroller-families-stmicroelectronics.pdf)
- RF Transmitter `SX1243`
  - [Device Page](https://www.semtech.com/products/wireless-rf/frequency-shift-keying-fsk/sx1243)
  - [Datasheet](https://semtech.my.salesforce.com/sfc/p/#E0000000JelG/a/44000000MDlb/p4okZwnHfVvk3NmiQL0nzegedKDB6WpYP3XwfsUEpLw)


## Debug Interface

- Pitch = 2.54 mm

```text
MCU Side

+-+
|6|
|5|
|4|   +---+
|3|   |MCU|
|2|   +---+
|1|
+-+
```

Pinout:

- Debug Pin 1 $\rightarrow$ MCU Pin 1 $\rightarrow$ `PA0(9) / [USART1_CK](2) / SWIM / BEEP / IR_TIM` $\rightarrow$ Probably SWIM (One wire debug interface)
- Debug Pin 2 $\rightarrow$ `GND`
- Debug Pin 3 $\rightarrow$ MCU Pin 2 $\rightarrow$ `NRST / PA1`
- Debug Pin 4 $\rightarrow$ MCU Pin 48 $\rightarrow$ `PE7 / LED_SEG27 / TIM5_ETR / USART3_RX / [LCD_COM7]` $\rightarrow$ Probably UART RX
- Debug Pin 5 $\rightarrow$ MCU Pin 47 $\rightarrow$ `PE6 / LCD_SEG26 (3) / PVD_IN / TIM5_BKIN / USART3_TX / [LCD_COM6]` $\rightarrow$ Probably UART TX
- Debug Pin 6 $\rightarrow$ `VCC` @ 3V
