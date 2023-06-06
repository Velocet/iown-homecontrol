# Somfy Izymo Transmitter io

- [Product Page](https://www.somfy.co.uk/products/1822609/izymo-transmitter-io)
- [Usage Instructions](https://service.somfy.com/downloads/uk_v5/5141230aizymo_io-en-el.pdf)
- [Usage Instructions](https://asset.somfy.com/Document/a56b6cff-2ff1-42cc-8377-c34fbc708133_5141230A_IZYMO_io-EN-EL.pdf)

## Hardware

- MCU `STM8L151C8U6`

## Debug Interface

```text
MCU Side   | Battery Side
1  2  3    |    3  2  1
4  5       |       5  4
6          |          6
```

```text
+---------+
| 1  2  3 |
| 4  5 +--+
| 6 +--+
+---+

         +---+
         |MCU|
         +---+
```

Pinout:

- Debug Pin 1 $\rightarrow$ MCU Pin 48 $\rightarrow$ `PE7 / LED_SEG27 / TIM5_ETR / USART3_RX / [LCD_COM7]` $\rightarrow$ Probably UART RX
- Debug Pin 2 $\rightarrow$ MCU Pin 1 $\rightarrow$ `PA0(9) / [USART1_CK](2) / SWIM / BEEP / IR_TIM` $\rightarrow$ Probably SWIM (One wire debug interface)
- Debug Pin 3 $\rightarrow$ MCU Pin 2 $\rightarrow$ = `NRST / PA1`
- Debug Pin 4 $\rightarrow$ `GND`
- Debug Pin 5 $\rightarrow$ `VCC` @ 3V
- Debug Pin 6 $\rightarrow$ MCU Pin 47 $\rightarrow$ `PE6 / LCD_SEG26 (3) / PVD_IN / TIM5_BKIN / USART3_TX / [LCD_COM6]` $\rightarrow$ Probably UART TX
