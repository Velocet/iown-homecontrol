# DIO Mapping in PACKET Mode

- Preamble IRQ: On
- Clock Out Frequency: Off (better Rx/Tx)
- RegOSC = 0x07 // Clock Out Frequency: Off

| DIO  | Sleep | StandBy | FSRx/Tx | Rx           | Tx         |
| ---- | ----- | ------- | ------- | ------------ | ---------- |
| DIO5 | -     | -       | -       | ModeReady    | ModeReady  |
| DIO4 | -     | -       | -       | LowBat       | -          |
| DIO3 | -     | -       | -       | -            | TxReady    |
| DIO2 | -     | -       | -       | RxReady      | FIFOFull   |
| DIO1 | -     | -       | -       | FIFOFull     | FIFOEmpty  |
| DIO0 | -     | -       | -       | PayloadReady | PacketSent |

// Receiver DIO Mapping in PACKET Mode
RegDIOMapping1 = 0x25
RegDIOMapping2 = 0x30 // Preamble IRQ: Off
RegDIOMapping2 = 0x31 // Preamble IRQ: On

// Transmitter DIO Mapping in PACKET Mode (Preamble IRQ: Off)
RegDIOMapping1 = 0x11
RegDIOMapping1 = 0xB0

// Preamble Detection: 2 Byte + 1 chip error tolerance
// Chip = bits of the code sequence. Used to distinguish between the longer (un-coded) bits of the original data signal.
// Sync Word: 1 Byte Preamble + UART encoded Sync Word
RegPreambleDetect = 0xA1
RegRxBw = 0x0B                // Rx Filter Bandwidth: 50 kHz

// DIO5: Data
// DIO4: PreambleDetect
// DIO3: TxReady
// DIO2: Sync
// DIO1: FIFO empty
// DIO0: PayloadReady|PacketSent


