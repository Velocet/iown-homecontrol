---
title: iown-homecontrol - Commands
description: io-homecontrol commands and parameter
icon: material/deathly-hallows
---

# Commands

This document lists the known io-homecontrol "Command IDs" (CMD), their corresponding parameters and structure.

## Basics

These basics should help you understand which wording is used to find parameter information inside the LuaJIT files.

> The io-homecontrol&reg; concept is built on the idea of different "applications" or "profiles". Each vendor has to implement a basic set of standard profiles but can also implement its own set of pre-defined profiles.

A Session in the context of io-homecontrol is a predefined *Action*. As an example this *Action* could be the exchange of a key or the opening of a window and could consist of one or more packets (with each consisting of 4 frame).
A *Use Case* (UC) is the payload of an io-homecontrol frame. Each UC consists of a *Command ID* (CMD) and corresponding _Parameter_ (MP = *MainParameter*) with up to 16 _Functional Parameter_ (FP). The MP is predefined by the CMD. Not every command has a MP. If it has a MP it is either a value or predefined _Function_.
Commands are combined in groups of _Command Types_.

### Naming & Wording & Abbreviations

<details markdown><summary>Naming Conventions & Wording</summary>

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
- CRC (FCS = Frame Check Sequence): Calculated over the Frame. ([CRC/CRC16-CCITT](https://srecord.sourceforge.net/crc16-ccitt.html) vs. [CRC16-KERMIT](https://reveng.sourceforge.io/crc-catalogue/16.htm#crc.cat.crc-16-kermit))

</details>

<details markdown><summary>Abbreviations</summary>

> ![NOTE]
> Those values are taken from the ioHome firmware and LuaJIT files and represent only official abbreviations.

| Abr.   | Meaning                                      |
| -----: | :------------------------------------------- |
| DCT    | Dry Contact Trigger                          |
| IP     | Intermediate Position                        |
| OSB    | Outdoor Sensor Box                           |
| ISB    | Indoor  Sensor Box                           |
| MP     | Main       Parameter                         |
| FP     | Functional Parameter                         |
|        |                                              |
| DHW    | Domestic Hot Water                           |
| FCM    |                                              |
| RCM    | Receive Config Mode                          |
| TCM    | Transmit Config Mode                         |
| CMD    | Command (ID)                                 |
| ACT    | Actuator                                     |
| REV    |                                              |
| WDT    |                                              |
| RX     | Receive                                      |
| TX     | Transmit                                     |
| GRP    | Group                                        |
| SID    | SystemID                                     |
| POS    | Current Position                             |
| OTL    | Over The Line                                |
| APC    | Atlantic                                     |
| IVB    | Interior Venitian Blind                      |
| EVB    | Exterior Venetian Blind                      |
| SUC    | Static Update Controller                     |
| IO_SWF | Somfy iohc WireFree (SWF): IO 2.4Ghz Variant |
| OVP    | Overkiz Radio Protocol                       |
| SCD    | Secure Configuration/Credential Device       |
| SFY    | Somfy                                        |
| VLX    | Velux                                        |
| ISB    | Inside Sensor Box                            |
| OSB    | Outside Sensor Box                           |
| RD     | RailDIN                                      |
|        |                                              |
| ZIC    | InstallCode                                  |
| DI     | DeviceId                                     |
| BPC    | BPinCode                                     |
| IR     | IndustrialReference                          |

</details>

### Device: Labels, Serial Numbers, QR Codes / Barcodes

<details markdown><summary>Labels, Serial Numbers, QR Codes / Barcodes</summary>

Software Revision Is = Somfy=%d     S2IH=%d  POD=%d Rev=%d
Hardware Revision Is = Type=0x%02X Month=%d Year=%d Rev=0x%02X

#### Serial Number

The Serial Number is a 12 byte ASCII string used as a unique identifier for a given product.

| Length | 6 byte | 2 byte | 2 byte | 2 byte |
| -----: | :----: | :----: | :----: | :----: |
| Name   | NodeID | OemID  | Year   | Week   |

- NodeID: Built-in Address
- OemID: Manufacturer Identification of the Supplier
- Year: Year of manufacturing
- Week: Week of manufacturing

#### QR Code

For some devices the length of the QR code gives a hint about the device itself. The minimum length is 40 hex characters (20 byte).

- QR Code Length
  - KeyGo: 40 Hex Chars (20 Byte)
  - Situo: 56 Hex Chars (23 Byte)

##### Example

*Somfy Situo* QR codes:
- `452A1F832ADDFC13C9976011B1C109FBF3952FA14E846341FFFFFFFF`
- `455B9AA02CC31E641F61C503B74C112A41A11FA94E650A41FFFFFFFF`
- `4540A05DCC7AD1FD67BB1EDDE33ECD09DC602DBF4E846341FFFFFFFF`

```PYTHON
qrPayload = "452A1F832ADDFC13C9976011B1C109FBF3952FA14E846341FFFFFFFF"

def parseOneWayControllerQRPayload(qrPayload):
  """Parse 1W Controller QR Payload."""
  address = qrPayload[2:8]
  productKey = qrPayload[8:40]
  return address, productKey


def computeOneWayControllerAddress(controllerAddress, channel = 1)
  """Compute 1W Controller Address. It is unknown if this function just translates to BigEndian."""
  # channelAddress = controllerAddress + channel - 1
  channelAddress = [0x83, 0x1F, 0x2A]
  return channelAddress


def function handleOneWayController(qrPayload, channel = 1, addOrRemove = 1)
  payload = [] # Create list which holds the payload

  # address = "2A1F83", productKey = "2ADDFC13C9976011B1C109FBF3952FA1"
  controllerAddress, productKey = parseOneWayControllerQRPayload(qrPayload)
  channelAddress = computeOneWayControllerAddress(controllerAddress, channel)
  channelAddress = [0x83, 0x1F, 0x2A]

  payload.append(addOrRemove)      # Unknown: Either 0 or 1
  payload.append(channelAddress)   # Channel Address: Same as controllerAddress (but BigEndian)
  payload.append(0x00, 0x00, 0x3F) # Broadcast Address
  payload.append(productKey)       # Product Key
  payload.append(0x00, 0x00)       # Unknown
  payload.append(0x00)             # Unknown
  payload.append(0x03)             # Unknown
```

</details>

## Command Structure

A command is built as follow:

| Command ID | Parameter |
| :--------: | :------: |
|   1 Byte   |  n Byte  |

- Command ID (CMD): Identifies the desired action
- Parameter (MP): Optional Parameter for the desired action.
  - The type of the parameter is defined by the CMD

### Parameter

For detailed information on parameters see [Parameter](README.md)

> ![NOTE]
> See also KLF200 API: `Appendix 2: List of actuator types and their use of Main Parameter and Functional Parameters`

<details markdown><summary>Parameter Details</summary>

#### ACEI

> NOTE: LSB must be 1: The frame is not considered valid if this bit is set to 0!

| **PARAMETER** | A: Level | C: Service | E: Extended Info | I: IsValid |
| ------------: | :------: | :--------: | :--------------: | :--------: |
| **BIT**       | 7-5      | 4-3        | 2-1              | 0          |

- bit[3] Priority Level (Velux KLF200 API @ Page 58/59)
  - Protection Level
    - 0 b[000] = Personal/Human: Most secure level. Will disable all categories (Level 0 to 7).
      > "*Since consequences of misusing this level can deeply impact the system behaviour, and therefore the io-homecontrol image, it is mandatory for the manufacturer that wants to use this level of priority to receive an agreement from io-homecontrol&reg;.*"
    - 1 b[001] = End Product/Environment = (House) Goods Protection: Local Sensors
  - User Level = User Control
    - 2 b[010] = Level 1 - High: Controllers have a higher level of priority than others.
    - 3 b[011] = Level 2 - Default: Default for (Remote) Controllers. Send immediate Command(s).
  - Comfort Level = Automatic Control
    - 4 b[100] = Level 1 - TBD
    - 5 b[101] = Level 2 - TBD
    - 6 b[110] = Level 3 - SAAC: Stand Alone Automatic Controls
    - 7 b[111] = Level 4 - TBD (Default Channel: KLF100)
- bit[2] Priority Service Number
  - 0 b[00] = Service 1 - TBD
  - 1 b[01] = Service 2 - TBD
  - 2 b[10] = Service 3 - TBD
  - 3 b[11] = Service 4 - TBD
- bit[2] Extended Info TODO
  - 0 b[00] = TBD
  - 1 b[01] = TBD
  - 2 b[10] = TBD
  - 3 b[11] = TBD
- bit[1] Is Valid Frame/Session: Always 1.

#### Multi Information Byte

| **Parameter** | Actuator Turnaround Time | SyncCtrlGrp | Unknown | RF Support | io-Membership | Power Save Mode |
| :-----------: | :----------------------: | :---------: | :-----: | :--------: | :-----------: | :-------------: |
| **Bit**       | 7-6                      | 5           | 4       | 3          | 2             | 1-0             |

- bit[7-6] Actuator Turnaround Time (ATT) = Time span in which the actuator normally responds
  - 0b00 = 0:  5 seconds
  - 0b01 = 1: 10 seconds
  - 0b10 = 2: 20 seconds
  - 0b11 = 3: 40 seconds
- bit[5] SyncCtrlGrp - Supports Sync Control Group?
  - 0 = b[0]: No
  - 1 = b[1]: Yes
- bit[4] Unknown
- bit[3] RF Support in Node
  - 0: Yes
  - 1: No
- bit[2] io-Membership (Always Yes...)
  - 0: Yes
  - 1: No
- bit[1-0] Power Save Mode
  - 0: Off = Always Alive
  - 1: On  = Low Power Mode

#### Command Originator

Specifies what or who fired the command.

- 0x00 = User: Local - User button press on Actuator
- 0x01 = **User**: User Remote Control causing Actuator Action
- 0x02 = Sensor: Rain
- 0x03 = Sensor: Timer
- 0x04 = Security: SCD Controlling Actuator
- 0x05 = UPS: Uninterruptible Power Supply Unit
- 0x06 = SFC: Smart Function Controller
- 0x07 = LSC: Lifestyle Scenario Controller
- 0x08 = **SAAC**: Stand Alone Automatic Controls
- 0x09 = Sensor: Wind
- 0x0A = Unknown
- 0x0B = Automatic Cycle/External Access/Load Shedding (Managers for requiring a particular electric load shed)
- 0x0C = Sensor: Local Light
- 0x0D = Sensor: Unspecified Enviroment Sensor (Used with commands of Unknown Sensor for Protection of End-Product or house goods)
- 0x10 = Myself: Used when Actuator decides to move by itself (Generated by Actuator)
- 0xC8 = Unknown
- 0xFE = Automatic Cycle
- 0xFF = Emergency: Used in context with Emergency or Security commands. *This command originator should never be disabled.*

> [!NOTE] Typically only **USER** or **SAAC** are used.

#### Standard Values

Standard Parameter Values for Main and Functional Parameters (MP, FP)

| Min      | Max      | Std    | Type                             | Range                       |
| -------: | -------: | -----: | -------------------------------: | --------------------------: |
| 0x0000   | 0xFFFF   |        | 16-bit split into Access Methods | 0 - 65535                   |
|          |          | 0x0000 | Min / On / 1W: Button Up         |                             |
|          |          | 0x0001 | 1W: Button Down                  |                             |
|          |          | 0x0002 | 1W: Button Stop                  |                             |
|          |          | 0x0003 | 1W: Button Prog (My?)            |                             |
|          |          | 0x00FE | Button Released                  |                             |
|          |          | 0x00FF | Button Stop                      |                             |
|          |          | 0xC800 | Max / Off / Down                 |                             |
| 0x0000   | 0xC800   |        | Relative Percentage (%)          | 0 - 100                     |
| *0xC801* | *0xC8FF* |        | *Unknown*                        |                             |
| 0xC900   | 0xD0D0   |        | Percentage (%)                   | -100 - 100                  |
| *0xD0D1* | *0xD0FF* |        | *Unknown*                        |                             |
|          |          | 0xD100 | Target                           | Execution Parameter Buffer  |
| 0xD101   | 0xD1FF   |        |                                  |                             |
|          |          | 0xD200 | Current                          | Execution Parameter Buffer  |
| *0xD201* | *0xD2FF* |        | *Unknown*                        |                             |
|          |          | 0xD300 | Default                          | Relative / Target / Current |
| *0xD301* | *0xD3FF* |        | *Unknown*                        |                             |
|          |          | 0xD400 | MP: Ignore / FP: ReadOnly        |                             |
| *0xD401* | *0x7CEE* |        | *Unknown*                        |                             |
|          |          | 0x6E00 | Running                          |                             |
|          |          | 0x7D00 | +/-                              | Default                     |
|          |          | 0xE000 | Retry                            |                             |
| *0x7D01* | *0xF7FE* |        | *Unknown*                        |                             |
|          |          | 0xF7FF | Unknown Feedback Value           |                             |
| *0xF800* | *0xFFFF* |        | *Unknown*                        |                             |
|          |          |        |                                  |                             |

#### Function IDs

| HEX        | DEC        | NAME                                                                                         |
| ---------: | ---------: | :------------------------------------------------------------------------------------------- |
| 00         | 00         | No Parameter                                                                                 |
| 01         | 01         | Name                                                                                         |
| 02         | 02         | Unknown                                                                                      |
| 03         | 03         | Unknown                                                                                      |
| 04         | 04         | Identification                                                                               |
| 05         | 05         | Refresh: Advanced                                                                            |
| ...        | ...        | Unknown                                                                                      |
| 0B         | 11         | Config State                                                                                 |
| 01 00 D800 | 16832512   | Refresh: Memorized Position                                                                  |
| 01 00 D80A | 16832522   | Secured Position                                                                             |
| 01 00 01   | 65537      | My, Open/Up/Raise/Extend, Close/Down/Lower/Retract, Stop, Set: Closure, Deployment, Position |
| 01 00 12   | 65554      | Manufacturer Settings                                                                        |
| 02 F2 0200 | 49414656   | 1W Controller: Pairing All and Delete Node                                                   |
| 7F F1 001D | 2146500637 | IO Key                                                                                       |
| 7F F1 0022 | 2146500642 | 1W Controller: Pairing                                                                       |
| 7F F1 0023 | 2146500643 | 1W Controller: Pairing All                                                                   |

##### Private Function IDs

<details markdown><summary>List of Private Function IDs</summary>

This data is from *Set&Go io* XML definitions.

| MP     | FP1 | NAME                                                                  |
| -----: | --: | :-------------------------------------------------------------------- |
| 0x0004 | 000 | last-transmitted-orders                                               |
| 0x0004 | 128 | nb-of-transmitted-orders                                              |
| 0x0004 | 129 | nb-of-out-of-order-due-to-battery                                     |
| 0x0005 | 000 | detailled-event-subscription                                          |
| 0x0006 | 000 | batterystatus                                                         |
| 0x0006 | 128 | battery-measurement-at-runtime                                        |
| 0x0007 | 128 | threshold-per-sensor                                                  |
| 0x0007 | 129 | sensor-status-ackstatus                                               |
| 0x0007 | 130 | latest-read-environmental-magnitude-per-sensor                        |
| 0x0008 | 000 | controller-type                                                       |
| 0x0009 | 000 | battery-state                                                         |
| 0x0009 | 001 | battery-level                                                         |
| 0x4003 | 128 | battery-measurement-at-runtime                                        |
| 0x4004 | 128 | environmental-magnitude                                               |
| 0x4100 | 000 | sensor-type                                                           |
| 0x4100 | 001 | benefit-type-group                                                    |
| 0x4100 | 002 | activation-status                                                     |
| 0x4100 | 003 | number-of-threshold-relative-values                                   |
| 0x4100 | 004 | current-threshold-1-relative-value                                    |
| 0x4100 | 005 | current-threshold-2-relative-value                                    |
| 0x4100 | 006 | sensor-based-automatism-scale-factor-value                            |
| 0x4100 | 007 | minimum-oem-threshold-absolute-value                                  |
| 0x4100 | 008 | maximum-oem-threshold-absolute-value                                  |
| 0x4100 | 009 | minimum-threshold-absolute-value                                      |
| 0x4100 | 010 | maximum-threshold-absolute-value                                      |
| 0x4100 | 011 | current-threshold-1-absolute-value                                    |
| 0x4100 | 012 | current-threshold-2-absolute-value                                    |
| 0x4100 | 020 | zone-1-action                                                         |
| 0x4100 | 021 | zone-1-user-locking-time                                              |
| 0x4100 | 022 | zone-1-automatism-locking-time                                        |
| 0x4100 | 023 | zone-1-repetition-interval                                            |
| 0x4100 | 024 | zone-1-movement-limitation                                            |
| 0x4100 | 030 | zone-2-action                                                         |
| 0x4100 | 031 | zone-2-user-locking-time                                              |
| 0x4100 | 032 | zone-2-automatism-locking-time                                        |
| 0x4100 | 033 | zone-2-repetition-interval                                            |
| 0x4100 | 034 | zone-2-movement-limitation                                            |
| 0x4100 | 040 | zone-3-action                                                         |
| 0x4100 | 041 | zone-3-user-locking-time                                              |
| 0x4100 | 042 | zone-3-automatism-locking-time                                        |
| 0x4100 | 043 | zone-3-repetition-interval                                            |
| 0x4100 | 044 | zone-3-movement-limitation                                            |
| 0x4101 | 000 | sensor-type                                                           |
| 0x4101 | 001 | linked-adress-that-sends-sensor-events                                |
| 0x4101 | 002 | minimum-sensed-value                                                  |
| 0x4101 | 003 | maximum-sensed-value                                                  |
| 0x4101 | 004 | sensor-capacity-scale-factor-value                                    |
| 0x6103 | 000 | 2way-key-is-recorded                                                  |
| 0x6103 | 001 | local-stimuli-status                                                  |
| 0x6104 | 128 | user-product-name                                                     |
| 0x6105 | 000 | feedback-name                                                         |
| 0x8002 |     | HARD_VERSION_3S                                                       |
| 0x9800 | 000 | request-per-recorded-io-sensors                                       |
| 0x9800 | 001 | status-of-request-per-recorded-io-sensors                             |
| 0x9800 | 002 | request-per-recorded-private-sensors                                  |
| 0x9800 | 003 | status-of-request-per-recorded-private-sensors                        |
| 0x9801 | 000 | request-per-delegation                                                |
| 0x9801 | 001 | status-of-request-per-delegation                                      |
| 0xA100 |     | MODE_USER_TOTAL                                                       |
| 0xA101 |     | CLOSE_TEMPO_TOTAL_MODE_3S                                             |
| 0xA102 |     | MODE_USER_PARTAL                                                      |
| 0xA103 |     | CLOSE_SHORT_TEMPO_PARTIAL_MODE                                        |
| 0xA104 |     | CLOSE_LONG_TEMPO_PARTIAL_MODE                                         |
| 0xA105 |     | ORANGE_LIGHT_PRE_LIGHTING                                             |
| 0xA106 |     | CRUISING_SPEED_TYPE_CLOSING                                           |
| 0xA107 |     | CRUISING_SPEED_TYPE_OPENING                                           |
| 0xA108 |     | DOCKING_AREA_TYPE_IN_CLOSING                                          |
| 0xA109 |     | DOCKING_AREA_TYPE_IN_OPENING                                          |
| 0xA10A |     | MOTOR_SHIFT_IN_CLOSING                                                |
| 0xA10B |     | MOTOR_SHIFT_IN_OPENING                                                |
| 0xA10C |     | MOTOR1_CLOSING_TORQUE_LIMITATION                                      |
| 0xA10D |     | MOTOR1_OPENING_TORQUE_LIMITATION                                      |
| 0xA10E |     | MOTOR1_CLOSING_SLOWDOWN_TORQUE_LIMITATION                             |
| 0xA10F |     | MOTOR1_OPENING_SLOWDOWN_TORQUE_LIMITATION                             |
| 0xA110 |     | MOTOR2_CLOSING_TORQUE_LIMITATION                                      |
| 0xA111 |     | MOTOR2_OPENING_TORQUE_LIMITATION                                      |
| 0xA112 |     | MOTOR2_CLOSING_SLOWDOWN_TORQUE_LIMITATION                             |
| 0xA113 |     | MOTOR2_OPENING_SLOWDOWN_TORQUE_LIMITATION                             |
| 0xA114 |     | MOTOR_DIRECTION                                                       |
| 0xA116 |     | RESISTANCE_SENSITIVITY                                                |
| 0xA117 |     | CELLS_ACTIVATION                                                      |
| 0xA118 |     | SAFETY_EDGE_ACTIVATION                                                |
| 0xA119 |     | PROGRAMMABLE_SAFETY_INPUT                                             |
| 0xA11A |     | PROGRAMMABLE_SAFETY_INPUT_FUNCTION                                    |
| 0xA11B |     | PROGRAMMABLE_SAFETY_INPUT_ACTION                                      |
| 0xA11C |     | WIRED_CONTROL                                                         |
| 0xA11D |     | AREA_LIGHTING_ACTIVATION                                              |
| 0xA11E |     | AREA_LIGHTING_TEMPORIZATION                                           |
| 0xA11F |     | AUXILIARY_CONTROL_ACTIVATION                                          |
| 0xA120 |     | AUXILIARY_CONTROL_TEMPORIZATION                                       |
| 0xA121 |     | LOCK_OUTPUT                                                           |
| 0xA122 |     | LOCK_RELEASE                                                          |
| 0xA124 |     | ADDITIONAL_THRUST_IN_CLOSING                                          |
| 0xA126 |     | POP_VALUE                                                             |
| 0xA129 |     | SETTINGS_LOCK_STATUS                                                  |
| 0xA12B |     | DOCKING_AREA_SPEED_CLOSING                                            |
| 0xA12C |     | DOCKING_AREA_SPEED_OPENING                                            |
| 0xA132 |     | ACTION_CONTROL                                                        |
| 0xA133 |     | INTERMEDIARY_POSITION_IN_CM                                           |
| 0xA134 |     | CLOSE_TEMPO_TOTAL_MODE                                                |
| 0xA137 |     | IN_POP_POSITION                                                       |
| 0xA138 |     | ACCESS_ACTUATOR_LOCATION_CURRENT_POSITION                             |
| 0xA205 |     | M1_RACE_LENGHT                                                        |
| 0xA226 |     | ACTUATOR_SETTINGS_STATE                                               |
| 0xA227 |     | SUPPLY_POWER_TYPE                                                     |
| 0xA228 |     | KEYSWITCH_INPUT_STATUS                                                |
| 0xA229 |     | KEYSWITCH_INPUT2_STATUS                                               |
| 0xA22A |     | PHOTOCELLS_INPUT_STATUS                                               |
| 0xA22B |     | SAFETY_EDGE_INPUT_STATUS                                              |
| 0xA22C |     | WICKET_DOOR_INPUT_STATUS                                              |
| 0xA232 |     | DETAILED_ACTUATOR_TYPE                                                |
| 0xA233 |     | LAST_PHOTOCELLS_SELF_TEST_STATUS                                      |
| 0xA235 |     | INDUS_SOFTWARE_VERSION                                                |
| 0xA236 |     | INDUS_PRODUCT_TECH_REF                                                |
| 0xA237 |     | NB_RTX_1W_REMOTE_IN_CF                                                |
| 0xA239 |     | INDUS_PRODUCT_COMM_NAME                                               |
| 0xA23A |     | INDUS_PRODUCT_TECH_NAME                                               |
| 0xA23E |     | HARD_VERSION                                                          |
| 0xA246 |     | LAST_SAFETY_EDGE_SELF_TEST_STATUS                                     |
| 0xA247 |     | LAST_WICKET_DOOR_SELF_TEST_STATUS                                     |
| 0xA249 |     | LAST_PERIPH_POWER_SELF_TEST_STATUS                                    |
| 0xA318 |     | NB_OF_LOCAL_ORDERS                                                    |
| 0xA319 |     | NB_OF_REMOTE_ORDERS                                                   |
| 0xA330 |     | EVENT_LIST                                                            |
| 0xA400 |     | NB_GLOBAL_CYCLES                                                      |
| 0xA401 |     | NB_PARTIAL_CYCLES                                                     |
| 0xA402 |     | NB_GLOBAL_CYCLES_AFTER_LEARNING                                       |
| 0xA403 |     | NB_GLOBAL_RESCALING                                                   |
| 0xA404 |     | NB_GLOBAL_OBSTACLE_DETECTIONS                                         |
| 0xA407 |     | NB_OBSTACLE_DETECTIONS_AFTER_LEARNING                                 |
| 0xA409 |     | DEFAUT_LIST                                                           |
| 0xA40E |     | RTX_INFO_REQUEST                                                      |
| 0xA40F |     | NB_RTX_1W_REMOTE_FOR_LIGHT                                            |
| 0xA410 |     | NB_RTX_1W_REMOTE_FOR_AUXILIARY                                        |
| 0xA416 |     | NB_OF_REMOTE_ORDERS_FOR_MOTOR_3S                                      |
| 0xA417 |     | NB_OF_REMOTE_ORDERS_FOR_LIGHT_AND_AUXILIARY_3S                        |
| 0xA418 |     | NB_GLOBAL_OBSTACLE_DETECTIONS_3S                                      |
| 0xA419 |     | NB_OBSTACLE_DETECTIONS_AFTER_LEARNING_3S                              |
| 0xA41C |     | NB_GLOBAL_CYCLES_3S                                                   |
| 0xA41D |     | NB_PARTIAL_CYCLES_3S                                                  |
| 0xA41E |     | NB_GLOBAL_CYCLES_AFTER_LEARNING_3S                                    |
| 0xA41F |     | NB_GLOBAL_RESCALING_3S                                                |
| 0xA44D |     | RTX_INFO_REQUEST_TOTAL                                                |
| 0xA44E |     | RTX_INFO_REQUEST_PARTIAL                                              |
| 0xA450 |     | SYSTEM_KEY_2_WAY_STORED                                               |
| 0xA451 |     | DAUGHTER_BOARD_ACTUATOR_NAME_RECEIVED                                 |
| 0xA4FE |     | DATA_TRANSFER_SPECIFICATION_VERSION                                   |
| 0xA4FF |     | LIST_OF_SUPPORTED_OBJECTS_ID                                          |
| 0xA500 |     | DUMP_REQUEST                                                          |
| 0xA504 |     | GO_INTO_FACTORY_MODE                                                  |
| 0xA506 |     | PAIRING_MODE_REQUEST                                                  |
| 0xA601 | 000 | power-supply-source                                                   |
| 0xA601 | 001 | batterystatus                                                         |
| 0xA601 | 002 | batterystatus-reliability                                             |
| 0xA601 | 128 | power-supply-min                                                      |
| 0xA601 | 128 | power-supply-min                                                      |
| 0xA601 | 129 | power-supply-max-rms-value                                            |
| 0xA601 | 129 | power-supply-max-rms-value                                            |
| 0xA601 | 130 | nb-of-power-shutdown                                                  |
| 0xA601 | 131 | nb-of-double-power-cut                                                |
| 0xA601 | 132 | nb-of-swicth-from-mains-to-backup-battery                             |
| 0xA601 | 133 | nb-of-swicth-from-battery-low-to-battery-very-low                     |
| 0xA601 | 134 | battery-measurement-at-runtime                                        |
| 0xA601 | 135 | nb-of-charge-by-external-power-supply                                 |
| 0xA601 | 136 | nb-of-storage-mode                                                    |
| 0xA601 | 137 | nb-of-swicth-from-battery-ok-to-battery-low                           |
| 0xA602 | 000 | endofmovementcause                                                    |
| 0xA602 | 128 | nb-of-return-in-factory-settings                                      |
| 0xA602 | 129 | nb-of-return-in-factory-settings-caused-by-private-frame              |
| 0xA602 | 130 | nb-of-stops-caused-by-crown-stop                                      |
| 0xA602 | 131 | nb-of-stops-caused-by-thermal-protection                              |
| 0xA602 | 131 | nb-of-stops-caused-by-thermal-protection                              |
| 0xA602 | 132 | nb-of-eld-tcs-in-roll-at-rel                                          |
| 0xA602 | 132 | nb-of-eld-tcs-in-roll-at-rel                                          |
| 0xA602 | 133 | nb-of-eld-tcs-in-unroll-at-uel                                        |
| 0xA602 | 133 | nb-of-eld-tcs-in-unroll-at-uel                                        |
| 0xA602 | 134 | nb-of-rel-reached-in-counting-mode                                    |
| 0xA602 | 135 | nb-of-uel-reached-in-counting-mode                                    |
| 0xA602 | 136 | nb-of-obstacle-in-roll                                                |
| 0xA602 | 137 | nb-of-obstacle-in-unroll                                              |
| 0xA602 | 138 | motor-rotation-duration                                               |
| 0xA602 | 138 | tube-rotation-in-pulses-nb                                            |
| 0xA602 | 138 | tube-rotation-in-seconds                                              |
| 0xA602 | 139 | nb-of-eld-in-roll-at-rel-low-level                                    |
| 0xA602 | 140 | nb-of-eld-in-roll-at-rel-nominal-level                                |
| 0xA602 | 141 | nb-of-eld-in-roll-at-rel-high-level                                   |
| 0xA602 | 142 | total-actuator-functioning-hours                                      |
| 0xA602 | 142 | total-actuator-functioning-seconds                                    |
| 0xA602 | 143 | running-time-up-auto-calibration-iteration-quantity                   |
| 0xA602 | 144 | running-time-down-auto-calibration-iteration-quantity                 |
| 0xA602 | 145 | running-time-up-auto-calibration-setting-quantity                     |
| 0xA602 | 146 | running-time-down-auto-calibration-setting-quantity                   |
| 0xA602 | 147 | projection-cycles-nb                                                  |
| 0xA602 | 148 | deprojection-cycles-nb                                                |
| 0xA602 | 149 | nb-of-obstacle-in-projection-phase                                    |
| 0xA602 | 150 | nb-of-obstacle-in-deprojection-phase                                  |
| 0xA602 | 151 | nb-of-stops-in-abutment-or-rel-achieved-per-mode                      |
| 0xA602 | 152 | nb-of-stops-in-abutment-or-uel-achieved-per-mode                      |
| 0xA602 | 153 | nb-of-cycles-in-intermediate-maintenance-mode                         |
| 0xA602 | 154 | bad-sensors-sequence-pec                                              |
| 0xA602 | 155 | nb-of-bad-braking                                                     |
| 0xA602 | 156 | nb-of-slip-after-braking                                              |
| 0xA602 | 157 | max-slip-during-braking                                               |
| 0xA602 | 158 | nbmotormoveerrors                                                     |
| 0xA602 | 159 | nbmotorinternalbuserrors                                              |
| 0xA602 | 160 | maxbatteryvoltage                                                     |
| 0xA602 | 161 | nbendlimitdownadjustments                                             |
| 0xA602 | 162 | nbendlimitupadjustments                                               |
| 0xA602 | 163 | nbmotorfactoryreset                                                   |
| 0xA602 | 164 | nbpowerinterruptduringmvt                                             |
| 0xA602 | 166 | totalactuatorinlowpowermodeduration                                   |
| 0xA602 | 167 | nbbuserrorreaddetectedbyradioboard                                    |
| 0xA602 | 168 | nbbuserrorwritedetectedbyradioboard                                   |
| 0xA602 | 169 | nbbuserrorcrcdetectedbyradioboard                                     |
| 0xA602 | 170 | nbbuserrorcrcdetectedbymotor                                          |
| 0xA602 | 171 | nbofmotorpermutations                                                 |
| 0xA602 | 172 | nbofautomaticdesensitization-smart-protect                            |
| 0xA602 | 173 | nbofautomaticresensitization-smart-protect                            |
| 0xA602 | 174 | nb-of-high-speed-movements                                            |
| 0xA602 | 175 | overcurrent-detected-before-regulation-pec                            |
| 0xA602 | 176 | bad-current-check-before-start-pec                                    |
| 0xA602 | 177 | bad-current-check-after-start-pec                                     |
| 0xA602 | 178 | bad-current-check-during-regulation-pec                               |
| 0xA602 | 179 | nb-of-eld-in-roll-at-rel-very-high-level                              |
| 0xA602 | 180 | nb-of-eld-in-unroll-at-uel-low-level                                  |
| 0xA602 | 181 | nb-of-eld-in-unroll-at-uel-nominal-level                              |
| 0xA602 | 182 | nb-of-eld-in-unroll-at-uel-high-level                                 |
| 0xA602 | 183 | nb-of-eld-in-unroll-at-uel-very-high-level                            |
| 0xA602 | 184 | nb-time-out-detected-to-reach-rel                                     |
| 0xA602 | 185 | nb-time-out-detected-to-reach-uel                                     |
| 0xA602 | 186 | nb-overintensity-decteted                                             |
| 0xA602 | 187 | nb-position-sensor-failures                                           |
| 0xA602 | 188 | nb-current-sensor-failures                                            |
| 0xA602 | 189 | nb-product-has-gone-in-secondary-secured-position                     |
| 0xA602 | 190 | nb-order-received-on-wired-input                                      |
| 0xA602 | 191 | nb-order-received-by-radio                                            |
| 0xA602 | 192 | zones-learning-attempts-nb                                            |
| 0xA602 | 193 | nb-mouvements-without-abutment                                        |
| 0xA602 | 194 | nb-mouvements-to-ventilation                                          |
| 0xA602 | 195 | odometer-in-integration-phase                                         |
| 0xA603 | 000 | type-of-setting-for-roll-end-limit                                    |
| 0xA603 | 001 | type-of-setting-for-unroll-end-limit                                  |
| 0xA603 | 002 | current-status                                                        |
| 0xA603 | 003 | rotation-direction                                                    |
| 0xA603 | 003 | rotation-direction                                                    |
| 0xA603 | 004 | status-of-intermediate-position                                       |
| 0xA603 | 005 | rotation-direction-determination                                      |
| 0xA603 | 006 | kinematics                                                            |
| 0xA603 | 006 | kinematics                                                            |
| 0xA603 | 007 | status-of-max-linear-position                                         |
| 0xA603 | 008 | status-of-stop-mode                                                   |
| 0xA603 | 009 | last-movement                                                         |
| 0xA603 | 010 | travel-current-state                                                  |
| 0xA603 | 010 | travel-current-state                                                  |
| 0xA603 | 011 | travel-zone-state                                                     |
| 0xA603 | 012 | movementmanager-current-state                                         |
| 0xA603 | 013 | current-settings-within-evb-io                                        |
| 0xA603 | 014 | brake-slip-upwards                                                    |
| 0xA603 | 015 | brake-slip-downwards                                                  |
| 0xA603 | 016 | initial-type-of-setting-for-roll-end-limit                            |
| 0xA603 | 017 | initial-type-of-setting-for-unroll-end-limit                          |
| 0xA603 | 018 | behaviour-at-roll-end-limit                                           |
| 0xA603 | 019 | behaviour-at-unroll-end-limit                                         |
| 0xA603 | 020 | status-of-flat-slat-position                                          |
| 0xA603 | 021 | softstart-uel                                                         |
| 0xA603 | 022 | softstop-uel                                                          |
| 0xA603 | 023 | softstart-rel                                                         |
| 0xA603 | 024 | softstop-rel                                                          |
| 0xA603 | 025 | smart-protect-sensitivity                                             |
| 0xA603 | 026 | visual-pictogram                                                      |
| 0xA603 | 027 | coexistenceid                                                         |
| 0xA603 | 028 | sound-enable                                                          |
| 0xA603 | 029 | recovered-state-after-power-cut                                       |
| 0xA603 | 030 | output-operator-type                                                  |
| 0xA603 | 031 | input-ergonomy                                                        |
| 0xA603 | 032 | lock-device                                                           |
| 0xA603 | 033 | curtain-outstretching-level                                           |
| 0xA603 | 128 | low-speed-value-min                                                   |
| 0xA603 | 129 | low-speed-value-max                                                   |
| 0xA603 | 130 | nominal-speed-value-min                                               |
| 0xA603 | 131 | nominal-speed-value-max                                               |
| 0xA603 | 132 | default-low-speed-value                                               |
| 0xA603 | 133 | default-nominal-speed-value                                           |
| 0xA603 | 134 | high-speed-current-value                                              |
| 0xA603 | 135 | operationnal-running-timeout-enable                                   |
| 0xA603 | 136 | operationnal-running-timeout-value-in-s                               |
| 0xA603 | 137 | smart-protect-activation                                              |
| 0xA603 | 138 | automatic-adjustment-of-the-roll-end-limit-every-x-cycles             |
| 0xA603 | 139 | applicativeaccessories                                                |
| 0xA603 | 140 | maintenance-by-up-down-wt-ergonomy                                    |
| 0xA603 | 141 | wired-input-type                                                      |
| 0xA603 | 142 | operationnal-running-remaining-time-in-s                              |
| 0xA603 | 143 | max-acceptable-sink-current                                           |
| 0xA604 | 000 | io-profile-and-sub-profile                                            |
| 0xA604 | 001 | manufacturer-actuator-id                                              |
| 0xA604 | 002 | product-address                                                       |
| 0xA605 | 000 | current-movement-area                                                 |
| 0xA605 | 001 | current-operating-mode                                                |
| 0xA606 | 000 | ctn-is-operational                                                    |
| 0xA606 | 128 | max-detected-temperature                                              |
| 0xA606 | 129 | coil-temperature                                                      |
| 0xA607 | 000 | paired-product-type                                                   |
| 0xA607 | 001 | out-of-order-time-out-in-s                                            |
| 0xA607 | 002 | paired-product-address-msb-first                                      |
| 0xA607 | 003 | one-way-key                                                           |
| 0xA607 | 004 | sequence-nb                                                           |
| 0xA607 | 005 | manufacturer-id                                                       |
| 0xA607 | 006 | io-membership-flag                                                    |
| 0xA607 | 007 | controller-type                                                       |
| 0xA607 | 008 | battery-state                                                         |
| 0xA607 | 009 | battery-level                                                         |
| 0xA608 | 000 | nb-of-motors                                                          |
| 0xA608 | 001 | covering-panel                                                        |
| 0xA608 | 002 | position-sensor-type                                                  |
| 0xA609 | 000 | travel-zones-learning-phase                                           |
| 0xA609 | 001 | secured-ventilation-entry-learning-state                              |
| 0xA609 | 128 | current-position-lift                                                 |
| 0xA609 | 128 | current-position-lift                                                 |
| 0xA609 | 128 | current-position-lift                                                 |
| 0xA609 | 129 | roll-end-limit-position                                               |
| 0xA609 | 129 | roll-end-limit-position                                               |
| 0xA609 | 129 | roll-end-limit-position                                               |
| 0xA609 | 129 | roll-end-limit-position                                               |
| 0xA609 | 130 | unroll-end-limit-position                                             |
| 0xA609 | 130 | unroll-end-limit-position                                             |
| 0xA609 | 130 | unroll-end-limit-position                                             |
| 0xA609 | 130 | unroll-end-limit-position                                             |
| 0xA609 | 131 | intermediate-position-lift                                            |
| 0xA609 | 131 | intermediate-position-lift                                            |
| 0xA609 | 131 | intermediate-position-lift                                            |
| 0xA609 | 131 | intermediate-position-lift                                            |
| 0xA609 | 132 | reference-position                                                    |
| 0xA609 | 132 | reference-position                                                    |
| 0xA609 | 133 | exit-unroll-end-limit-position                                        |
| 0xA609 | 136 | current-position-tilt                                                 |
| 0xA609 | 136 | current-position-tilt                                                 |
| 0xA609 | 137 | intermediate-position-tilt                                            |
| 0xA609 | 137 | intermediate-position-tilt                                            |
| 0xA609 | 138 | running-time-up                                                       |
| 0xA609 | 139 | running-time-down                                                     |
| 0xA609 | 140 | flat-slats-value                                                      |
| 0xA609 | 140 | flat-slats-value                                                      |
| 0xA609 | 145 | min-linear-limit-position                                             |
| 0xA609 | 146 | max-linear-limit-position                                             |
| 0xA609 | 147 | max-toggle-limit-position                                             |
| 0xA609 | 148 | current-position-in-percent                                           |
| 0xA609 | 149 | automatic-max-linear-limit-position                                   |
| 0xA609 | 150 | mp-middle-of-slide-in-order-to-project                                |
| 0xA609 | 151 | mu-middle-of-slide-in-order-to-unproject                              |
| 0xA609 | 152 | pelp-projection-end-limit-to-project                                  |
| 0xA609 | 153 | pelu-projection-end-limit-to-unproject                                |
| 0xA609 | 154 | nb-auto-learning-requested                                            |
| 0xA609 | 155 | nb-auto-learning-not-validated                                        |
| 0xA609 | 156 | secured-ventilation-position-lift                                     |
| 0xA609 | 157 | secured-ventilation-entry-position-lift                               |
| 0xA609 | 158 | seal-position-lift                                                    |
| 0xA60A | 000 | operating-status                                                      |
| 0xA60A | 001 | eld-inhibition-on-start                                               |
| 0xA60A | 128 | general-eld-level                                                     |
| 0xA60A | 129 | level-set-by-user-when-rolling                                        |
| 0xA60A | 130 | level-set-by-user-when-unrolling                                      |
| 0xA60B | 000 | stress-reduction-status                                               |
| 0xA60B | 000 | stress-reduction-status                                               |
| 0xA60B | 001 | warning-movement                                                      |
| 0xA60B | 128 | back-impulse-angle                                                    |
| 0xA60B | 129 | nb-of-distressing                                                     |
| 0xA60B | 130 | stress-reduction-value                                                |
| 0xA60B | 131 | backlashvalue                                                         |
| 0xA60B | 132 | tiltingtime                                                           |
| 0xA60B | 133 | startdelay                                                            |
| 0xA60B | 134 | smart-back-release                                                    |
| 0xA60B | 135 | delta-to-set-auto-uel                                                 |
| 0xA60B | 136 | delta-to-set-auto-rel                                                 |
| 0xA60B | 137 | choregraphy-disable-variator-down-move-min                            |
| 0xA60B | 138 | choregraphy-disable-variator-up-move-min                              |
| 0xA60B | 139 | choregraphy-enable-variator-down-move-min                             |
| 0xA60B | 140 | choregraphy-enable-variator-up-move-min                               |
| 0xA60B | 141 | working-angle-tilt-position                                           |
| 0xA60B | 142 | tiltingtravel                                                         |
| 0xA60B | 143 | covering-panel-closing-delay                                          |
| 0xA60B | 144 | covered-panel-closing-delay                                           |
| 0xA60B | 145 | covering-panel-opening-delay                                          |
| 0xA60B | 146 | covered-panel-opening-delay                                           |
| 0xA60B | 147 | minimum-angular-open-end-limit                                        |
| 0xA60B | 148 | position-convertion                                                   |
| 0xA60C | 000 | array-of-160-char                                                     |
| 0xA60C | 001 | line-1-of-10-lines-of-16-char                                         |
| 0xA60C | 002 | line-2-of-10-lines-of-16-char                                         |
| 0xA60C | 003 | line-3-of-10-lines-of-16-char                                         |
| 0xA60C | 004 | line-4-of-10-lines-of-16-char                                         |
| 0xA60C | 005 | line-5-of-10-lines-of-16-char                                         |
| 0xA60C | 006 | line-6-of-10-lines-of-16-char                                         |
| 0xA60C | 007 | line-7-of-10-lines-of-16-char                                         |
| 0xA60C | 008 | line-8-of-10-lines-of-16-char                                         |
| 0xA60C | 009 | line-9-of-10-lines-of-16-char                                         |
| 0xA60C | 010 | line-10-of-10-lines-of-16-char                                        |
| 0xA60D | 128 | nb-of-paired-1w-controllers                                           |
| 0xA60D | 129 | nb-of-alive-paired-1w-sensors                                         |
| 0xA60D | 130 | nb-of-paired-1w-sensors-out-of-order                                  |
| 0xA60E | 000 | io-1w-sensor-address                                                  |
| 0xA60E | 001 | profil-id                                                             |
| 0xA60E | 002 | battery-level                                                         |
| 0xA60E | 003 | threshold-value                                                       |
| 0xA60E | 004 | thresholds-range                                                      |
| 0xA60E | 005 | status-protection                                                     |
| 0xA60E | 006 | threshold-value-secondary                                             |
| 0xA60E | 007 | demo-mode                                                             |
| 0xA60F | 128 | nb-of-reset-caused-by-independant-watchdog                            |
| 0xA60F | 129 | nb-of-reset-caused-by-external-pin                                    |
| 0xA60F | 130 | nb-of-reset-caused-by-crc-error                                       |
| 0xA60F | 131 | nb-of-reset-caused-by-system                                          |
| 0xA60F | 132 | nb-of-reset-caused-by-brown-out                                       |
| 0xA60F | 133 | nb-of-reset-caused-by-brown-out-during-power-on                       |
| 0xA60F | 134 | nb-of-reset-caused-by-power-on                                        |
| 0xA60F | 135 | nb-of-reset-caused-by-power-on-without-save-informations              |
| 0xA60F | 136 | nb-of-reset-caused-by-others                                          |
| 0xA60F | 137 | nb-of-reset-caused-by-window-watchdog                                 |
| 0xA60F | 138 | nb-of-periodical-system-reset                                         |
| 0xA60F | 139 | nb-of-reset-because-ram-is-ko                                         |
| 0xA60F | 140 | total-nb-of-resets                                                    |
| 0xA60F | 141 | nb-of-nominal-init                                                    |
| 0xA60F | 142 | nb-of-warm-reset                                                      |
| 0xA610 | 000 | initial-rotation-direction                                            |
| 0xA610 | 002 | initial-behaviour-at-roll-end-limit                                   |
| 0xA610 | 003 | initial-behaviour-at-unroll-end-limit                                 |
| 0xA610 | 004 | initial-softstart-uel                                                 |
| 0xA610 | 005 | initial-softstop-uel                                                  |
| 0xA610 | 006 | initial-softstart-rel                                                 |
| 0xA610 | 007 | initial-softstop-rel                                                  |
| 0xA610 | 008 | initial-coexistence-id                                                |
| 0xA610 | 009 | initial-nb-of-motors                                                  |
| 0xA610 | 010 | initial-covering-panel                                                |
| 0xA610 | 011 | initial-lock-device                                                   |
| 0xA610 | 128 | initial-nb-of-cycles-in-intermediate-maintenance-mode                 |
| 0xA610 | 129 | initial-low-speed-value-rpm                                           |
| 0xA610 | 130 | initial-nominal-speed-value-rpm                                       |
| 0xA610 | 131 | initial-smart-protect-activation                                      |
| 0xA610 | 132 | initial-automatic-adjustment-of-the-roll-end-limit-every-x-cycles     |
| 0xA610 | 133 | initial-general-eld-level                                             |
| 0xA610 | 134 | initial-stress-reduction-value                                        |
| 0xA610 | 135 | allow-changes-of-automatic-adjustment-at-the-roll-end-limit           |
| 0xA610 | 136 | prohibit-changes-of-roll-end-limit                                    |
| 0xA610 | 137 | prohibit-changes-of-unroll-end-limit                                  |
| 0xA610 | 138 | initial-covering-panel-closing-delay                                  |
| 0xA610 | 139 | initial-covered-panel-closing-delay                                   |
| 0xA610 | 140 | initial-covering-panel-opening-delay                                  |
| 0xA610 | 141 | initial-covered-panel-opening-delay                                   |
| 0xA612 | 000 | pandp-uel-current-mode                                                |
| 0xA612 | 001 | pandp-rel-current-mode                                                |
| 0xA613 | 000 | last-events-type-of-last-stop                                         |
| 0xA613 | 001 | historical-of-the-10-dwp-last-command-received                        |
| 0xA613 | 002 | historical-of-the-last-10-orders-received-radio                       |
| 0xA613 | 003 | historical-of-the-last-10-orders-manual-received-eg-order-wired       |
| 0xA613 | 004 | historical-of-the-last-10-movements-made                              |
| 0xA613 | 005 | historical-of-the-last-20-orders-received                             |
| 0xA613 | 006 | 1of4parts-of-the-last-20-orders-received                              |
| 0xA613 | 007 | 2of4parts-of-the-last-20-orders-received                              |
| 0xA613 | 008 | 3of4parts-of-the-last-20-orders-received                              |
| 0xA613 | 009 | 4of4parts-of-the-last-20-orders-received                              |
| 0xA613 | 128 | historical-of-10-last-faults-or-failure                               |
| 0xA613 | 133 | history-of-el-manual-reinit-in-unit-nb-of-stop-at-uel                 |
| 0xA613 | 134 | history-of-el-manual-reinit-in-unit-nb-of-stop-at-del                 |
| 0xA613 | 135 | history-of-pnp-auto-reinit-in-unit-nb-of-stop-at-uel                  |
| 0xA613 | 136 | history-of-pnp-auto-reinit-in-unit-nb-of-stop-at-del                  |
| 0xA613 | 137 | history-of-obstacle-in-unit-nb-of-stop-at-uel                         |
| 0xA613 | 138 | history-of-obstacle-in-unit-nb-of-stop-at-del                         |
| 0xA613 | 139 | history-of-auto-learning-in-unit-nb-of-el                             |
| 0xA614 | 000 | motor-type                                                            |
| 0xA614 | 001 | mode-user-or-production                                               |
| 0xA614 | 002 | status-of-dielectric-test                                             |
| 0xA614 | 003 | nb-of-passes-to-test-the-dielectric-test                              |
| 0xA614 | 004 | reserve-functional-test                                               |
| 0xA614 | 005 | functional-test-measured-values                                       |
| 0xA614 | 006 | status-of-functional-test                                             |
| 0xA614 | 007 | nb-of-passes-to-test-the-functional-test                              |
| 0xA614 | 008 | reserve-programming-test                                              |
| 0xA614 | 009 | status-of-programming-test                                            |
| 0xA614 | 010 | nb-of-passes-to-test-the-programming-test                             |
| 0xA614 | 011 | noise-value-measured                                                  |
| 0xA614 | 012 | status-of-noise-test                                                  |
| 0xA614 | 013 | nb-of-passes-to-test-the-noise-test                                   |
| 0xA614 | 014 | last-post-past                                                        |
| 0xA614 | 015 | status-of-the-last-post-made                                          |
| 0xA614 | 016 | reserve-process                                                       |
| 0xA614 | 017 | blocked-rotor-pec                                                     |
| 0xA614 | 017 | blocked-rotor-pec                                                     |
| 0xA614 | 018 | overcurrent-detected-during-regulation-pec                            |
| 0xA614 | 018 | overcurrent-detected-during-regulation-pec                            |
| 0xA614 | 019 | speed-pec                                                             |
| 0xA614 | 019 | speed-pec                                                             |
| 0xA614 | 020 | thermal-pec                                                           |
| 0xA614 | 020 | thermal-pec                                                           |
| 0xA614 | 021 | unique-io-nb                                                          |
| 0xA614 | 022 | channel-1-calibration                                                 |
| 0xA614 | 023 | channel-2-calibration                                                 |
| 0xA614 | 024 | channel-3-calibration                                                 |
| 0xA614 | 025 | radio-test-signature                                                  |
| 0xA614 | 026 | vdd-measure                                                           |
| 0xA614 | 027 | ems-software-test-revision                                            |
| 0xA614 | 028 | ems-test-status                                                       |
| 0xA614 | 029 | calibration-number                                                    |
| 0xA614 | 128 | software-version                                                      |
| 0xA614 | 129 | part-nb                                                               |
| 0xA614 | 129 | part-nb                                                               |
| 0xA614 | 130 | production-date                                                       |
| 0xA614 | 130 | production-date                                                       |
| 0xA614 | 130 | production-date                                                       |
| 0xA614 | 132 | actuator-serial-nb                                                    |
| 0xA614 | 132 | actuator-serial-nb                                                    |
| 0xA614 | 133 | product-version-finished-product                                      |
| 0xA614 | 134 | motor-identification-name-commercial-name                             |
| 0xA614 | 135 | actuator-serial-nb-on-22-characters                                   |
| 0xA614 | 137 | nominal-torque                                                        |
| 0xA614 | 138 | commercial-speed                                                      |
| 0xA614 | 139 | ems-date-code-of-manufacture                                          |
| 0xA614 | 139 | ems-date-code-of-manufacture                                          |
| 0xA614 | 140 | ems-manufacturing-order                                               |
| 0xA614 | 141 | ems-plant-code-and-controller-nb                                      |
| 0xA614 | 142 | ems-test-flags                                                        |
| 0xA614 | 143 | injected-temperature-calibration                                      |
| 0xA614 | 144 | temperature-calibration-motor-resistivity                             |
| 0xA615 | 128 | oem-acces-code                                                        |
| 0xA615 | 129 | eom-name                                                              |
| 0xA615 | 129 | eom-name                                                              |
| 0xA615 | 130 | production-site-name                                                  |
| 0xA615 | 131 | oem-free-words                                                        |
| 0xA615 | 132 | customer-production-date                                              |
| 0xA615 | 133 | client-model-reference                                                |
| 0xA615 | 133 | client-model-reference                                                |
| 0xA615 | 134 | client-model-name                                                     |
| 0xA615 | 134 | client-model-name                                                     |
| 0xA615 | 135 | workstation-nb                                                        |
| 0xA615 | 136 | of-nb                                                                 |
| 0xA615 | 137 | cde-nb                                                                |
| 0xA615 | 138 | cde-nb-rank                                                           |
| 0xA615 | 139 | oem-battery-reference                                                 |
| 0xA615 | 140 | oem-battery-name                                                      |
| 0xA615 | 141 | oem-solarpanel-reference                                              |
| 0xA615 | 142 | oem-solarpanel-name                                                   |
| 0xA617 | 000 | wind-high-speed-activation                                            |
| 0xA617 | 001 | sun-low-speed-activation                                              |
| 0xA617 | 128 | low-speed-value                                                       |
| 0xA617 | 129 | nominal-speed-value                                                   |
| 0xA618 | 128 | nb-of-factory-mode-due-to-ems-frame-raz-oem                           |
| 0xA618 | 129 | nb-of-factory-mode-due-to-a-prog-7s-on-a-1w-after-a-double-power-cut  |
| 0xA618 | 130 | nb-of-factory-mode-due-to-an-explicit-io-frame                        |
| 0xA618 | 131 | nb-of-factory-mode-due-to-a-warm-reset-with-unvalid-end-limits-in-ram |
| 0xA618 | 132 | nb-of-factory-mode-due-to-a-warm-reset-in-movement                    |
| 0xA618 | 133 | nb-of-factory-mode-due-to-bad-ram-and-flash                           |
| 0xA618 | 134 | nb-of-withdraw-to-default-values-due-to-bad-flash                     |
| 0xA618 | 135 | nb-of-oem-factory-mode-due-to-local-stimuli                           |
| 0xA618 | 136 | nb-of-sfy-factory-mode-due-to-local-stimuli                           |
| 0xA618 | 137 | nb-of-oem-factory-mode-due-to-serial-link                             |
| 0xA618 | 138 | nb-of-sfy-factory-mode-due-to-serial-link                             |
| 0xA618 | 139 | nb-of-oem-factory-mode-due-to-an-explicit-io-frame                    |
| 0xA619 | 000 | initial-torque-curve                                                  |
| 0xA619 | 001 | penultimate-torque-curve                                              |
| 0xA619 | 002 | ultimate-torque-curve                                                 |
| 0xA61A | 000 | time-stamp                                                            |
| 0xA61A | 001 | event-name                                                            |
| 0xA61A | 002 | raw-data                                                              |
| 0xA61A | 003 | voltage-type                                                          |
| 0xA61A | 004 | reset-type                                                            |
| 0xA61A | 005 | motor-state-at-power-fail                                             |
| 0xA61A | 006 | current-position                                                      |
| 0xA61A | 007 | wt-command-type                                                       |
| 0xA61A | 008 | wt-command-details                                                    |
| 0xA61A | 009 | actuator-reaction-type                                                |
| 0xA61A | 010 | thermal-protection-cause                                              |
| 0xA61A | 011 | measure-location                                                      |
| 0xA61A | 012 | origin-file-id                                                        |
| 0xA61A | 013 | origin-function-id                                                    |
| 0xA61A | 014 | initial-speed                                                         |
| 0xA61A | 015 | movement-id                                                           |
| 0xA61A | 016 | transmitter-address                                                   |
| 0xA61A | 017 | io-command                                                            |
| 0xA61A | 018 | io-frame-data                                                         |
| 0xA61A | 019 | internal-event-type                                                   |
| 0xA61A | 020 | time-out-origin                                                       |
| 0xA61A | 021 | threshold-value                                                       |
| 0xA61A | 022 | travel-zone                                                           |
| 0xA61A | 023 | stop-type                                                             |
| 0xA61A | 024 | rotation-dir-type                                                     |
| 0xA61A | 025 | odometer-lsb                                                          |
| 0xA61A | 026 | brake-slip-type                                                       |
| 0xA61A | 027 | hot-reset-type                                                        |
| 0xA61A | 028 | reset-count                                                           |
| 0xA61A | 029 | pairing-type                                                          |
| 0xA61A | 030 | manufacturer-id                                                       |
| 0xA61A | 031 | sequence-number                                                       |
| 0xA61A | 032 | master-1w-type                                                        |
| 0xA61A | 033 | setting-modification-type                                             |
| 0xA61A | 034 | requester                                                             |
| 0xA61A | 035 | previous-value                                                        |
| 0xA61A | 036 | new-value                                                             |
| 0xA61A | 037 | back-to-factory-mode-cause                                            |
| 0xA61A | 039 | ip-infos                                                              |
| 0xA61A | 040 | rotation-direction                                                    |
| 0xA61A | 041 | upper-end-limit-infos                                                 |
| 0xA61A | 042 | lower-end-limit-infos                                                 |
| 0xA61A | 043 | actuator-status                                                       |
| 0xA61A | 044 | status-rx-frame                                                       |
| 0xA61A | 045 | status-tx-frame                                                       |
| 0xA61A | 046 | particular-position-infos                                             |
| 0xA61A | 047 | radio-request                                                         |
| 0xA61A | 048 | radio-target                                                          |
| 0xA61B | 128 | nb-hard-obstacle-in-unpaired-mode-open                                |
| 0xA61B | 129 | nb-hard-obstacle-in-unpaired-mode-close                               |
| 0xA61B | 130 | nb-hard-obstacle-in-interm-maint-mode-z1-open                         |
| 0xA61B | 131 | nb-hard-obstacle-in-interm-maint-mode-z2-open                         |
| 0xA61B | 132 | nb-hard-obstacle-in-interm-maint-mode-z3-open                         |
| 0xA61B | 133 | nb-hard-obstacle-in-interm-maint-mode-z1s-open                        |
| 0xA61B | 134 | nb-hard-obstacle-in-interm-maint-mode-z1-close                        |
| 0xA61B | 135 | nb-hard-obstacle-in-interm-maint-mode-z2-close                        |
| 0xA61B | 136 | nb-hard-obstacle-in-interm-maint-mode-z3-close                        |
| 0xA61B | 137 | nb-hard-obstacle-in-interm-maint-mode-z1s-close                       |
| 0xA61B | 138 | nb-hard-obstacle-in-count-or-maint-mode-z1-open                       |
| 0xA61B | 139 | nb-hard-obstacle-in-count-or-maint-mode-z2-open                       |
| 0xA61B | 140 | nb-hard-obstacle-in-count-or-maint-mode-z3-open                       |
| 0xA61B | 141 | nb-hard-obstacle-in-count-or-maint-mode-z1s-open                      |
| 0xA61B | 142 | nb-hard-obstacle-in-count-or-maint-mode-z1-close                      |
| 0xA61B | 143 | nb-hard-obstacle-in-count-or-maint-mode-z2-close                      |
| 0xA61B | 144 | nb-hard-obstacle-in-count-or-maint-mode-z3-close                      |
| 0xA61B | 145 | nb-hard-obstacle-in-count-or-maint-mode-z1s-close                     |
| 0xA61B | 146 | nb-soft-obstacle-in-interm-maint-mode-z1-open                         |
| 0xA61B | 147 | nb-soft-obstacle-in-interm-maint-mode-z2-open                         |
| 0xA61B | 148 | nb-soft-obstacle-in-interm-maint-mode-z3-open                         |
| 0xA61B | 149 | nb-soft-obstacle-in-interm-maint-mode-z1s-open                        |
| 0xA61B | 150 | nb-soft-obstacle-in-interm-maint-mode-z1-close                        |
| 0xA61B | 151 | nb-soft-obstacle-in-interm-maint-mode-z2-close                        |
| 0xA61B | 152 | nb-soft-obstacle-in-interm-maint-mode-z3-close                        |
| 0xA61B | 153 | nb-soft-obstacle-in-interm-maint-mode-z1s-close                       |
| 0xA61B | 154 | nb-soft-obstacle-in-count-or-maint-mode-z1-open                       |
| 0xA61B | 155 | nb-soft-obstacle-in-count-or-maint-mode-z2-open                       |
| 0xA61B | 156 | nb-soft-obstacle-in-count-or-maint-mode-z3-open                       |
| 0xA61B | 157 | nb-soft-obstacle-in-count-or-maint-mode-z1s-open                      |
| 0xA61B | 158 | nb-soft-obstacle-in-count-or-maint-mode-z1-close                      |
| 0xA61B | 159 | nb-soft-obstacle-in-count-or-maint-mode-z2-close                      |
| 0xA61B | 160 | nb-soft-obstacle-in-count-or-maint-mode-z3-close                      |
| 0xA61B | 161 | nb-soft-obstacle-in-count-or-maint-mode-z1s-close                     |
| 0xA61B | 162 | nb-obstacle-zair-open                                                 |
| 0xA61B | 163 | nb-obstacle-zair-close                                                |
| 0xA61B | 164 | nb-in-normative-area-obstacle-open                                    |
| 0xA61B | 165 | nb-out-normative-area-obstacle-open                                   |
| 0xA61B | 166 | nb-in-normative-area-obstacle-close                                   |
| 0xA61B | 167 | nb-out-normative-area-obstacle-close                                  |
| 0xA61B | 168 | nb-abnormal-resistance-in-initial-mode-open                           |
| 0xA61B | 169 | nb-abnormal-resistance-in-initial-mode-close                          |
| 0xA61B | 170 | nb-abnormal-resistance-in-interm-maint-mode-open                      |
| 0xA61B | 171 | nb-abnormal-resistance-in-interm-maint-mode-close                     |
| 0xA61B | 172 | nb-abnormal-resistance-in-count-or-maint-mode-z1-open                 |
| 0xA61B | 173 | nb-abnormal-resistance-in-count-or-maint-mode-z2-open                 |
| 0xA61B | 174 | nb-abnormal-resistance-in-count-or-maint-mode-z1-close                |
| 0xA61B | 175 | nb-abnormal-resistance-in-count-or-maint-mode-z2-close                |
| 0xA61B | 176 | nb-crown-stop-in-interm-maint-mode-z1-open                            |
| 0xA61B | 177 | nb-crown-stop-in-interm-maint-mode-z2-open                            |
| 0xA61B | 178 | nb-crown-stop-in-interm-maint-mode-z3-open                            |
| 0xA61B | 179 | nb-crown-stop-in-interm-maint-mode-z1s-open                           |
| 0xA61B | 180 | nb-crown-stop-in-interm-maint-mode-z1-close                           |
| 0xA61B | 181 | nb-crown-stop-in-interm-maint-mode-z2-close                           |
| 0xA61B | 182 | nb-crown-stop-in-interm-maint-mode-z3-close                           |
| 0xA61B | 183 | nb-crown-stop-in-interm-maint-mode-z1s-close                          |
| 0xA61B | 184 | nb-crown-stop-in-count-or-maint-mode-z1-open                          |
| 0xA61B | 185 | nb-crown-stop-in-count-or-maint-mode-z2-open                          |
| 0xA61B | 186 | nb-crown-stop-in-count-or-maint-mode-z3-open                          |
| 0xA61B | 187 | nb-crown-stop-in-count-or-maint-mode-z1s-open                         |
| 0xA61B | 188 | nb-crown-stop-in-count-or-maint-mode-z1-close                         |
| 0xA61B | 189 | nb-crown-stop-in-count-or-maint-mode-z2-close                         |
| 0xA61B | 190 | nb-crown-stop-in-count-or-maint-mode-z3-close                         |
| 0xA61B | 191 | nb-crown-stop-in-count-or-maint-mode-z1s-close                        |
| 0xA61B | 192 | nb-open-over-speed-in-unpaired-phase                                  |
| 0xA61B | 193 | nb-close-over-speed-in-unpaired-phase                                 |
| 0xA61B | 194 | nb-open-over-speed-in-initial-mode                                    |
| 0xA61B | 195 | nb-close-over-speed-in-initial-mode                                   |
| 0xA61B | 196 | nb-overspeed-in-interm-maint-mode-z1-open                             |
| 0xA61B | 197 | nb-overspeed-in-interm-maint-mode-z2-open                             |
| 0xA61B | 198 | nb-overspeed-in-interm-maint-mode-z3-open                             |
| 0xA61B | 199 | nb-overspeed-in-interm-maint-mode-z1s-open                            |
| 0xA61B | 200 | nb-overspeed-in-interm-maint-mode-z1-close                            |
| 0xA61B | 201 | nb-overspeed-in-interm-maint-mode-z2-close                            |
| 0xA61B | 202 | nb-overspeed-in-interm-maint-mode-z3-close                            |
| 0xA61B | 203 | nb-overspeed-in-interm-maint-mode-z1s-close                           |
| 0xA61B | 204 | nb-overspeed-in-count-or-maint-mode-z1-open                           |
| 0xA61B | 205 | nb-overspeed-in-count-or-maint-mode-z2-open                           |
| 0xA61B | 206 | nb-overspeed-in-count-or-maint-mode-z3-open                           |
| 0xA61B | 207 | nb-overspeed-in-count-or-maint-mode-z1s-open                          |
| 0xA61B | 208 | nb-overspeed-in-count-or-maint-mode-z1-close                          |
| 0xA61B | 209 | nb-overspeed-in-count-or-maint-mode-z2-close                          |
| 0xA61B | 210 | nb-overspeed-in-count-or-maint-mode-z3-close                          |
| 0xA61B | 211 | nb-overspeed-in-count-or-maint-mode-z1s-close                         |
| 0xA61B | 212 | nb-manual-movement-from-close-position                                |
| 0xA61B | 213 | nb-uncoupled-or-breaking-movement                                     |
| 0xA61B | 214 | nb-secured-ventilation-entry-learning-pass                            |
| 0xA61B | 215 | nb-bounce-effect-pec                                                  |
| 0xA61B | 216 | nb-unlock-successfully                                                |
| 0xA61B | 217 | nb-manual-movement                                                    |
| 0xA61B | 218 | nb-movements-to-ventilation-error                                     |
| 0xA61C | 000 | success                                                               |
| 0xA61C | 001 | locking                                                               |
| 0xA61C | 128 | max-torque                                                            |
| 0xA61C | 129 | attempt-index                                                         |
| 0xA620 | 000 | status                                                                |
| 0xA621 | 000 | derogation                                                            |
| 0xA622 | 000 | diagnosis                                                             |
| 0xA623 | 000 | synchro                                                               |
| 0xA624 | 000 | settings                                                              |
| 0xA625 | 000 | temp-mode                                                             |
| 0xA626 | 000 | time-prog-1                                                           |
| 0xA627 | 000 | time-prog-2                                                           |
| 0xFFFD | 000 | rs100-debug                                                           |

> ![NOTE]
> You can find the unaltered data from the XML files and more on the [Set&Go io page](devices/somfy/SetGo/README.md).

###### SIMU

| CMD    | NAME                    |
| -----: | :---------------------- |
| 0x0003 | SMF_SAP_SETTINGS_GET    |
| 0x0004 | SMF_SAP_SETTINGS_SET    |
| 0x0005 | SMF_HAND_SHAKE          |
| 0x0100 | SMF_CONFIG_GET          |
| 0x0101 | SMF_CONFIG_SET          |
| 0x0200 | SMF_RTS_EXEC            |
| 0x0201 | SMF_RTS_EXEC_SCENE      |
| 0x0202 | SMF_RTS_SUN_ON_OFF_EXEC |
| 0x0300 | SMF_LOG_GET             |
| 0x0301 | SMF_LOG_CLEAR           |
| 0x0400 | SMF_TIME_GET            |
| 0x0401 | SMF_TIME_SET            |
| 0x5000 | SM_GET_INFO             |
| 0x6000 | SMF_REBOOT_COLA         |
| 0x6001 | SMF_QUERY_COLA_INFO     |
| 0x6002 | SMF_OPEN_COLA_UPDATE    |
| 0x6003 | SMF_PUSH_COLA_DATA      |
| 0x6004 | SMF_CLOSE_COLA_UPDATE   |

</details>

#### Data Types

-  0 = Binary
-  1 = INTEGER / Binary XML
-  2 = FLOAT   / XML
-  3 = STRING
-  4 = BLOB
-  5 = DATE
-  6 = BOOLEAN
-  7 = VALUE MAPPING (JSON)
-  8 = INTERVAL MAPPING
-  9 = PASSWORD
- 10 = ARRAY
- 11 = DYNAMIC OBJECT

#### Manufacturer IDs

Also called OEM ID. Each Manufacturer has their own ID:

- 0x00 = No Type = All nodes except controller
- 0x01 = Velux
- 0x02 = Somfy
- 0x03 = Honeywell
- 0x04 = Hörmann
- 0x05 = ASSA ABLOY
- 0x06 = Niko
- 0x07 = Window Master
- 0x08 = Renson
- 0x09 = CIAT
- 0x0A = Secuyou
- 0x0B = Overkiz
- 0x0C = Atlantic Group
- 0x0D = Zehnder Group
- 0x0E = ???
- 0x0F = ???

> ![NOTE]
> Manufacturers are only defined as Unknown when they are not assigned an ID. This is the case for old io-homecontrol installations.

#### Node Types & Node Sub Types

<details markdown><summary>List of Node Types & Node Sub Types</summary>

| HEX  | NOTATION | TYPE         | SUB TYPE | NAME                                                 |
| :--: | -------: | :----------: | :------: | :--------------------------------------------------- |
| 0000 | 0.00     | 00 0000 0000 | 000000   | All Nodes except Controller (No Type)                |
| 0033 | 0.51     | 00 0000 0000 | 110011   | Smart Plug                                           |
| 0040 | 1.00     | 00 0000 0001 | 000000   | Interior Venetian Blind (IVB)                        |
| 006A | 1.42     | 00 0000 0001 | 110011   | Light Sensor                                         |
| 0080 | 2.00     | 00 0000 0010 | 000000   | Roller Shutter                                       |
| 0081 | 2.01     | 00 0000 0010 | 000001   | Roller Shutter with Adjustable Slats                 |
| 0082 | 2.02     | 00 0000 0010 | 000010   | Roller Shutter with Projection                       |
| 00C0 | 3.00     | 00 0000 0011 | 000000   | Vertical Exterior Awning (Terrace)                   |
| 00CA | 3.10     | 00 0000 0011 | 001010   | Window Covering Device                               |
| 00CB | 3.11     | 00 0000 0011 | 001011   | Window Covering Controller                           |
| 0100 | 4.00     | 00 0000 0100 | 000000   | Window Opener                                        |
| 0101 | 4.01     | 00 0000 0100 | 000001   | Window Opener with Integrated Rain Sensor            |
| 012E | 4.46     | 00 0000 0100 | 101110   | Temp and Humidity Sensor                             |
| 0140 | 5.00     | 00 0000 0101 | 000000   | Garage Door Opener                                   |
| 017A | 5.58     | 00 0000 0101 | 111010   | Garage Door Opener: Open/Close Only                  |
| 0180 | 6.00     | 00 0000 0110 | 000000   | Light: On/Off + Dimming                              |
| 0192 | 6.18     | 00 0000 0110 | 010010   | IAS Zone                                             |
| 01BA | 6.58     | 00 0000 0110 | 111010   | Light: On/Off Only                                   |
| 01C0 | 7.00     | 00 0000 0111 | 000000   | Gate Opener                                          |
| 01FA | 7.58     | 00 0000 0111 | 111010   | Gate Opener: Open/Close Only                         |
| 0200 | 8.00     | 00 0000 1000 | 000000   | Rolling Door Opener                                  |
| 0240 | 9.00     | 00 0000 1001 | 000000   | Door Lock / Motorized Bolt                           |
| 0241 | 9.01     | 00 0000 1001 | 000001   | Window Lock                                          |
| 0280 | 10.00    | 00 0000 1010 | 000000   | Vertical Interior Blind                              |
| 0290 | 11.00    | 00 0000 1011 | 000000   | Secure Configuration Device (SCD)                    |
| 0300 | 12.00    | 00 0000 1100 | 000000   | Beacon = Gateway/Repeater                            |
| 0340 | 13.00    | 00 0000 1101 | 000000   | Dual Roller Shutter                                  |
| 0380 | 14.00    | 00 0000 1110 | 000000   | Heating Temperature Interface                        |
| 03C0 | 15.00    | 00 0000 1111 | 000000   | Switch: On/Off                                       |
| 0400 | 16.00    | 00 0001 0000 | 000000   | Horizontal Awning                                    |
| 0401 | 16.01    | 00 0001 0000 | 000001   | Pergola Rail Guided Awning                           |
| 0440 | 17.00    | 00 0001 0001 | 000000   | Exterior Venetian Blind (EVB)                        |
| 0480 | 18.00    | 00 0001 0010 | 000000   | Louver Blind                                         |
| 04C0 | 19.00    | 00 0001 0011 | 000000   | Curtain Track                                        |
| 0500 | 20.00    | 00 0001 0100 | 000000   | Ventilation Point                                    |
| 0501 | 20.01    | 00 0001 0100 | 000001   | Air Inlet                                            |
| 0502 | 20.02    | 00 0001 0100 | 000010   | Air Transfer                                         |
| 0503 | 20.03    | 00 0001 0100 | 000011   | Air Outlet                                           |
| 0540 | 21.00    | 00 0001 0101 | 000000   | Exterior Heating                                     |
| 057A | 21.58    | 00 0001 0101 | 110011   | Exterior Heating: On/Off Only                        |
| 0580 | 22.00    | 00 0001 0110 | 000000   | Heat Pump                                            |
| 05C0 | 23.00    | 00 0001 0111 | 000000   | Intrusion Alarm System                               |
| 0600 | 24.00    | 00 0001 1000 | 000000   | Swinging Shutter                                     |
| 0601 | 24.01    | 00 0001 1000 | 000001   | Swinging Shutter with Independent Handling of Leaves |
|      | 27.00    | 00 0001 1011 | 000000   | Sliding Window                                       |
|      | 28.00    | 00 0001 1100 | 000000   | Zone Control Generator                               |
|      | 29.00    | 00 0001 1101 | 000000   | Bioclimatic Pergola                                  |
|      | 30.00    | 00 0001 1110 | 000000   | Indoor Siren                                         |
|      | 51.00    | 00 0010 0000 | 000000   | Domestic Hot Water                                   |
|      | 52.00    | 00 0010 0000 | 000000   | Electrical Heater                                    |
|      | 53.00    | 00 0010 0000 | 000000   | Heat Recovery Ventilation                            |
| 3FC0 | 255.00   | 00 1111 1111 | 000000   | Central House Control                                |
| FC00 | 1008.00  | 11 1111 0000 | 000000   | Test and Evaluation (RD)                             |
| FFC0 | 1023.00  | 11 1111 1111 | 000000   | Remote Controller (RC)                               |

> ![NOTE]
> Only values in the *HEX* row reflect the actual data. You can also get these values when combining *TYPE* and *SUBTYPE* binary rows.

##### Sensor Types

- 0   = UNKNOWN SENSOR
- 1   = Light Inside
- 1.B = Light Outside (Sun Sensor)
- 2   = TEMPERATURE INSIDE SENSOR
- 3   = TEMPERATURE OUTSIDE SENSOR
- 5   = PRESSURE SENSOR
- 11  = LIGHT OUTSIDE SENSOR
- 12  = CUMULATED GAS
- 13  = WATER CONSUMPTION SENSOR
- 14  = THERMAL CONSUMPTION SENSOR
- 15  = ELECTRIC CONSUMPTION SENSOR
- 128 = SMOKE SENSOR
- 133 = OPENING DETECTOR
- 134 = MOTION SENSOR
- 254 = MULTITYPE SENSOR

##### Node Variations

- byte[1] NodeVariation: Depends on NodeType/SubType
  - Window
    - 0 = Not Set
    - 1 = Top Hung
    - 2 = Kip
    - 3 = Flat Roof
    - 4 = Sky Light

</details>

#### Priorities

- Level
  - 0x0 = Protection Level: Human
  - 0x1 = Protection Level: Environment
  - 0x2 = User Level 1
  - 0x3 = User Level 2
  - 0x4 = Comfort Level 1
  - 0x5 = Comfort Level 2
  - 0x6 = Comfort Level 3
  - 0x7 = Comfort Level 4
- Level Lock
  - 0x0 = No: No Priority Level Lock
  - 0x1 = Min30: Lock one or more Priority Level for 30 Minutes
  - 0x2 = Forever: Lock one or more Priority Level Forever

##### animeo IP Priorities

This definition seems to be also viable for io-homecontrol:

animeo IP operates with a priority scale of 0 (highest) - 32000 (lowest).
Using the animeo IP BMS Interface commands can be sent at a priority level between 12500 and 32000.
A devices's priority level can be set individually.
By default, the animeo IP BMS Interface applies a priority of 12500 to all devices in the system.
Changing a priority level of a device will only effect future commands, it will not effect already sent commands.
Once a command is sent to a device it will remain locked at that priority level until it is unlocked by adjusting the devices priority to -1; the shade will not be able to be moved unless a command with a higher priority is sent to the device.

- 0-12500 = animeo IP SECURITY
- 12500 = animeo IP BMS Interface (LIMIT) - Default
- 13000 = LOCAL PC COMMAND
- 14000 = LOCAL COMMAND TIMER
- 15000 = LOCAL COMMAND
- 19000 = TIMER
- 20000 = GET HEAT
- 21000 = PRESERVE HEAT
- 22000 = SUN
- 32000 = DEFAULT
- 32000 = CUSTOM DEFAULT

</details>

### Status Reply Values

<details markdown><summary>List of Status Replies</summary>

| ID   | Name                                      | Meaning                                                        |
| ---: | ----------------------------------------- | -------------------------------------------------------------- |
| 0x00 | UNKNOWN_STATUS_REPLY                      | unknown reply                                                  |
| 0x01 | COMMAND_COMPLETED_OK                      | no errors detected                                             |
| 0x02 | NO_CONTACT                                | no communication to node                                       |
| 0x03 | MANUALLY_OPERATED                         | manually operated by a user                                    |
| 0x04 | BLOCKED                                   | node has been blocked by an object                             |
| 0x05 | WRONG_SYSTEMKEY                           | the node contains a wrong system key                           |
| 0x06 | PRIORITY_LEVEL_LOCKED                     | the node is locked on this priority level                      |
| 0x07 | REACHED_WRONG_POSITION                    | node has stopped in another position than expected             |
| 0x08 | ERROR_DURING_EXECUTION                    | an error has occurred during execution of command              |
| 0x09 | NO_EXECUTION                              | no movement of the node parameter                              |
| 0x0A | CALIBRATING                               | the node is calibrating the parameters                         |
| 0x0B | POWER_CONSUMPTION_TOO_HIGH                | the node power consumption is too high                         |
| 0x0C | POWER_CONSUMPTION_TOO_LOW                 | the node power consumption is too low                          |
| 0x0D | LOCK_POSITION_OPEN                        | door lock errors. (Door open during lock command)              |
| 0x0E | MOTION_TIME_TOO_LONG__COMMUNICATION_ENDED | the target was not reached in time                             |
| 0x0F | THERMAL_PROTECTION                        | the node has gone into thermal protection mode                 |
| 0x10 | PRODUCT_NOT_OPERATIONAL                   | the node is not currently operational                          |
| 0x11 | FILTER_MAINTENANCE_NEEDED                 | the filter needs maintenance                                   |
| 0x12 | BATTERY_LEVEL                             | the battery level is low                                       |
| 0x13 | TARGET_MODIFIED                           | the node has modified the target value of the command          |
| 0x14 | MODE_NOT_IMPLEMENTED                      | this node does not support the mode received                   |
| 0x15 | COMMAND_INCOMPATIBLE_TO_MOVEMENT          | the node is unable to move in the right direction              |
| 0x16 | USER_ACTION                               | dead bolt is manually locked during unlock command             |
| 0x17 | DEAD_BOLT_ERROR                           | dead bolt error                                                |
| 0x18 | AUTOMATIC_CYCLE_ENGAGED                   | the node has gone into automatic cycle mode                    |
| 0x19 | WRONG_LOAD_CONNECTED                      | wrong load on node                                             |
| 0x1A | COLOUR_NOT_REACHABLE                      | that node is unable to reach received colour code              |
| 0x1B | TARGET_NOT_REACHABLE                      | the node is unable to reach received target position           |
| 0x1C | BAD_INDEX_RECEIVED                        | io-protocol has received an invalid index                      |
| 0x1D | COMMAND_OVERRULED                         | that the command was overruled by a new command                |
| 0x1E | NODE_WAITING_FOR_POWER                    | that the node reported waiting for power                       |
| 0x20 | NODE_LOCKED                               | Node is Locked                                                 |
| 0x21 | Wrong Position                            | Wrong Position                                                 |
| 0x22 | Limits not set                            | Limits not set                                                 |
| 0x23 | IP not set                                | IP not set                                                     |
| 0x24 | Out of Range                              | Out of Range                                                   |
| 0xDF | INFORMATION_CODE                          | an unknown error code received                                 |
| 0xE0 | PARAMETER_LIMITED                         | the parameter was limited by an unknown device                 |
| 0xE1 | LIMITATION_BY_LOCAL_USER                  | the parameter was limited by local button                      |
| 0xE2 | LIMITATION_BY_USER                        | the parameter was limited by a remote control                  |
| 0xE3 | LIMITATION_BY_RAIN                        | the parameter was limited by a rain sensor                     |
| 0xE4 | LIMITATION_BY_TIMER                       | the parameter was limited by a timer                           |
| 0xE5 | LIMITATION_BY_SCD                         | the parameter was limited by a security controlling actuator   |
| 0xE6 | LIMITATION_BY_UPS                         | the parameter was limited by a power supply                    |
| 0xE7 | LIMITATION_BY_UNKNOWN_DEVICE              | the parameter was limited by an unknown device                 |
| 0xEA | LIMITATION_BY_SAAC                        | the parameter was limited by a standalone automatic controller |
| 0xEB | LIMITATION_BY_WIND                        | the parameter was limited by a wind sensor                     |
| 0xEC | LIMITATION_BY_MYSELF                      | the parameter was limited by the node itself                   |
| 0xED | LIMITATION_BY_AUTOMATIC_CYCLE             | the parameter was limited by an automatic cycle                |
| 0xEE | LIMITATION_BY_EMERGENCY                   | the parameter was limited by an emergency                      |

</details>

<!--
```CPP
CutBasicInformation(uint param_2) {
  switch(param_2 >> 3) {
    case 0x00   : "Command Accepted"; break;
    case 0x01   : "Command Unknown"; break;
    case 0x02   : "Mode Or State Number Unknown"; break;
    case 0x03   : "Bad Mac"; break;
    case 0x04   : "Setup Required"; break;
    case 0x05   : "Parameter(s), Alias(es), Access Method(s)\n Lifestyle Scenario Unknown"; break;
    case 0x06   : "Command Originator Disabled"; break;
    case 0x07   : "Priority Locked"; break;
    case 0x08   : "Priority Service Not Supported"; break;
    case 0x09   : "Parameter Limitation Adjustement"; break;
    case 0x0A   : "Parameter Incoherence Adjustement"; break;
    case 0x0b   : "Total Incoherence"; break;
    case 0x0c   : "Service Full"; break;
    case 0x0d   : "Alias Incoherence"; break;
    case 0x0e   : "Session Interrupted"; break;
    case 0x0f   : "Not Implemented"; break;
    case 0x10   : "Command Rejected"; break;
    case 0x11   : "Already Configured"; break;
    default     : "Unknown (param_2 >> 3)"; break;
  }
  switch(param_2 & 7) {
    case 0x0: "Non Executing";break;
    case 0x1: "Error While Execution";break;
    case 0x2: "Waiting For Executing";break;
    case 0x3: "Waiting For Power";break;
    case 0x4: "Executing";break;
    case 0x5: "Done";break;
    default : "Unknown (param_2 & 7)");
  }
}
```
-->

## Command IDs

### 00: Activate/Execute Function

- Command ID: 0x00 (1 byte)
- Command Originator (1 byte)
- ACEI (1 byte)
- Main Parameter (2 bytes)
- Functional Parameter 1 (1 byte)
- Functional Parameter 2 (1 byte)

- Example
  - `00 01 43 D200 00 00`
  - |Command ID=0x00|Originator=0x01 (User)|ACEI=0x43|MainParam=0xD200 (Current)|FP1=0|FP2=0|
- 2W Example
  - 2W S 1 E 0       FROM 842E3      TO FE90EE       CMD 0   DATA(6)03 e7 6400 0000
  - Command ID=0x00, Originator=0x03, ACEI=0xe7, MainParam=0x6400, FP1=0, FP2=0
- 1W Example
  - 1W S 1 E 1 B 0 R 0 LPM 0 V 0 U1 0 U2 0 U3 0      FROM 28DB36     TO 3F   CMD 0   DATA(14)0167d2000000    SEQ 247B        MAC 3cd2ad870771

### 01: Activate Mode

- Command ID: 0x01 (1 byte)
- Command originator (1 byte)
- ACEI (1 byte)
- Mode number (1 byte)
- Mode parameter (1 byte)
- Unknown (1 byte)
- Unknown (1 byte)

- Exmaple
  - 1W Example: `1W S 1 E 1 B 0 R 0 LPM 1 V 0 U1 0 U2 0 U3 0      FROM 9A5CA0     TO 3F   CMD 1   DATA(13)0143000131      SEQ 1848        MAC 13f3e59def08`

### 02: Direct Command / Manual Order

| **NAME**  | CMD | OID | PID | ... |
| --------: | :-: | :-: | :-: | :-: |
| **BYTES** |  1  |  n  |  n  | ... |

- Command ID: 0x02 (1 Byte)
- ASCII (n Bytes): See Manual Order
  - Template: `02 OID 09 PID ... 03 CKS`
    - OID = Order ID = 0xXX: see Manual Order IDs
    - PID = Parameter ID = 1 ... n Bytes: See Manual Order IDs
    - CKS = ChecKSum

- Example
  - `02 474857` =  02 GHW = Get Hardware Version

> ![NOTE]
> Only applicable via serial console!

### 03: Private Command

- Command ID: 0x03 (1 byte)
- Data? (3-6 bytes)
- Example
  - 2W S 1 E 0       FROM 0xBox      TO 0xDevice       CMD 3   DATA(3)030000
  - 2W S 1 E 0       FROM 842E3      TO 315824       CMD 3   DATA(3)030000

### 04: Private Command Answer

- Command ID: 0x04 (1 byte)
- Data? (6-20 bytes)
- Example
  - 2W S 0 E 1       FROM 0xDevice      TO 0xBox/Gateway        CMD 4   DATA(14)05 800000000000009a5065010000
  - First byte of DATA is the same as CMD 0xFE: The Error Code. 0x05 is OK

### 0C: Unknown (IoPrepareDataSession?)

- Command ID: 0x0c (1 byte)
- Data? (4 bytes)
- Example
  - 2W S 1 E 0       FROM 0xBox      TO 0xDevice       CMD C   DATA(4)d8000000

### 0D: Unknown/Answer to 0C

- Command ID: 0x0d (1 byte)
- Data? (5 bytes)
- Examples
  - 2W S 0 E 1       FROM 0xDevice     TO 0xBox        CMD D   DATA(5)05aa0a0000
  - 2W S 1 E 0       FROM 842E3      TO 904C09       CMD C   DATA(4)d8000000
  - 2W S 1 E 0      FROM 842E3      TO DA2EE6       CMD C   DATA(4)d8000000

### 0D: Unknown (Answer to 0x0C)

- Command ID: 0x0c (1 byte)
- Data? (5 bytes)
- Example
  - 2W S 0 E 1      FROM DA2EE6     TO 842E3        CMD D   DATA(5)05aa0d0000

### 19: Unknown (Followed by 0xFE)

- Command ID: 0x19 (1 byte)
- Data? (1 byte)
- Example
  - 2W S 1 E 0       FROM 0xBox      TO 0xDevice       CMD 19  DATA(1)02 or 03 or 04 or 07

### 1A: Answer: Set Sensor Value

### 20: Private Protocol ("Write Private")

- Command ID: 0x20 (1 byte)
- Manufacturer ID (1 byte)
- Manufacturer Data (n Bytes)

- Example: `20 02 FF0143000C0000`
  - Command ID = 0x20
  - Manufacturer = 0x02 (Somfy)
  - Data = FF 0143000C0000

> ![IMPORTANT]
> Manufacture Specific Private Commands. These get defined and interpreted differently for every OEM.
>
> Using private commands can brick your device!

- Example: Thermor I2G = `20 0C 61 0103 C300`
  - `AC MaPa F1 F1`
  - `61 0103 C3 00`: `C3` (dec: 195) is 19.5°C set with button
  - `61 0103 D2 00`: `D2` (dec: 210) is 21.0°C set with button

### 20 - Base Command: WritePrivate

- Parameter:
  - 02 - Main Parameter
  - Function Parameter:
    - 4 more FP
      - 02 - stop_after_save_limit
      - 04 - enter_settings_mode
      - 05 - save_lower_end_limit
      - 06 - save_upper_end_limit
      - .. - ???
      - DF save_settings

### 21: Private Protocol Response

- Command ID: 0x21 (1 byte)
- Manufacturer ID (1 byte)
- Data

- PrivateCommand-ACK Response:
  - Man    = 1 Byte
  - Cmd    = 1 Byte
  - Ses    = 1 Byte
  - Status = 1 Byte

### 28: Discover

- Command ID: 0x28 (1 byte)

- Example
  - Velux KLR100 Pairing Process

```PYTHON
# It seems the old Velux remotes handle the discovery in another way?
C8 10 00FFFB 44457C 28 D88C
C8 10 0002FB 44457C 28 A479
C8 10 00003B 44457C 28 853A
```

> ![NOTE]
> No Authentication.

### 29: Discover Answer

- Command ID: 0x29 (1 byte)
- Node type and subtype (2 bytes): type on 10 bits and subtype on the remainer
  - Node type = (field >> 6) & 1023
  - Node subtype = field & 63
- Node address (3 bytes)
- Manufacturer ID (1 byte)
- Multi info byte (1 byte)
- Timestamp (2 bytes)

> ![NOTE]
> No Authentication.

- Example
  - `29 FFC0 XXXXXX 0C CC 0000`
  - Command ID = 0x29, node type = 1023 (REMOTE_CONTROLLER?), node subtype = 0, node address = XXXXXX, manufacturer = Atlantic, multi info byte = 0xcc, timestamp = 0

- Masks:
- id:      0x4
- Type:    0x8
- SubType: 0xC
- IsValid: 0xD

### 2A: Discover Remote

- Command ID: 0x2a (1 byte)
- Challenge Key (12 bytes)

- Example
  - `D4 30 00003B 44457C 2A 01CCD93AE0EADA9AEDF98344 A862 # Velux Kux 100`

> ![NOTE]
> Observed after launching the box in discover mode
>
> Observed after launching a discover via remote (see example)

### 2B: Discover Remote Answer

- Parameters are similar to 0x29

- Command ID: 0x2b (1 byte)
- Node type and subtype (2 bytes)
  - Node type = (field >> 6) & 1023
  - Node subtype = field & 63
- Node address (3 bytes)
- Manufacturer ID (1 byte)
- Multi info byte (1 byte)
- Timestamp (2 bytes)

- Example
  - `2B 0D01 XXXXXX 0C CC 0FB8`
  - Command ID = 0x2b, node type = 52 (ELECTRICAL_HEATER), node subtype = 1, node address = XXXXXX, manufacturer = Atlantic, multi info byte = 0xcc, timestamp = 4024

### 2C: Discover Actuator Confirmation

- Command ID = 0x2c

No parameter. Some sort of discover ack?

> ![NOTE]
> Requires no Authentication

### 2D: Discover Confirmation Ack (Answer to 2C)

- Command ID = 0x2d

No parameter.

> ![NOTE]
> Requires no Authentication.

### 2E: Unknown

- Command ID: 0x2e (1 byte)
- ?? (1 byte), 00 (TaHoma sent) and 02 (Sauter heater) observed

> ![NOTE]
> observed after launching the box in discover mode

> ![NOTE]
> Not Authenticated?

- Example
  - `2E 00`

### 2F: Unknown, answer to 2e?

- Command ID: 0x2f (1 byte)
- ?? (1 byte), mirrors what is sent by 2e

> ![NOTE]
> Not authenticated?

### 30: Send 1W Key

- Command ID: 0x30 (1 byte)
- Encrypted key (16 bytes)
- Manufacturer ID (1 byte)
- ?? (1 byte)
- Sequence number (2 bytes)

- Example
  - `30 7E60491F976ADF653DB0ED785E49A201 02 01 0C25`
  - Command ID=0x30, key?: 7E60491F976ADF653DB0ED785E49A201, Manufacturer ID=0x02, ??=0x01, Sequence Number=0x0c25

### 31: Ask Challenge

- Command ID: 0x31 (1 byte)

No parameter. Destination device answers with 0x3C.

> ![NOTE]
> Requires no authentication.

### 32: Key Transfer

- Command ID: 0x32 (1 byte)
- Encrypted 2-Way Key (16 bytes)

> ![NOTE]
> The Key is encrypted and depends on a challenge submitted before using 0x38 or 0x3C, see [LinkLayer](linklayer.md)

### 33: Find Actuator Ack = Key Transfer Ack

- Command ID: 0x33 (1 byte)

No parameter. Is sent after each 0x32 request.

### 36: Address Request

- Command ID: 0x36 (1 byte)

No parameter.

### 37: Address Answer (Answer to 36)

- Command ID: 0x37 (1 byte)
- Address (3 bytes)

### 38: Launch Key Transfer

- Command ID: 0x38 (1 byte)
- Challenge (6 bytes)

### 39: Remove 1W Controller

- Command ID: 0x39 (1 byte)
- ??: (1 byte): 0x00 observed

### 3C: Challenge Request

- Command ID: 0x3c (1 byte)
- Challenge data (6 bytes)

- Example
  - `3C 4D3E778460F1`
  - Command ID=0x3c, challenge=4d3e778460f1

### 3D: Challenge Response

- Command ID: 0x3d (1 byte)
- Response data (6 bytes)

- Example
  - `3D 3EF8C09565F4`
  - Command ID=0x3d, response=3EF8C09565F4

### 46: Script: Register/Upload

- Command ID: 0x46 (1 byte)
- Config Data (9 bytes)

### 47: Download Config (Answer to 46)

- Command ID: 0x47 (1 byte)
- Config (5 bytes)

### 48: File: Upload to "Running"(?)

- Command ID: 0x48 (1 byte)
- Data? (9 bytes)

> ![NOTE]
> Not authenticated?

### 49: File: Upload to "Running"(?) (ACK to 48)

- Command ID: 0x49 (1 byte)
- File Name Pointer (4 bytes)

> ![NOTE]
> Not authenticated?

### 4A: Delete File (Large Data Transfer Request? ("ioblob"))

- Command ID: 0x4a (1 byte)
- File Name = Data (3-13 bytes)

### 4B: File Info (Large Data Answer?)

- Command ID: 0x4b (1 byte)
- ?? (1 byte)
- Sequence number of data (1 byte)
- Data (1-18 bytes)

> ![NOTE]
> This command is chained to send large numbers of bytes. Maybe used for updates?

### 4A: Rename File

- Command ID: 0x4B (1 byte)
- File Name = Data (3-13 bytes)

### 50: Get Name

- Command ID: 0x50 (1 byte)
- Example
  - 2W S 1 E 0       FROM 842E3      TO DA2EE6       CMD 50  DATA(0)

> ![NOTE]
> No Parameter. Not Authenticated.

### 51: Get Name Answer

- Command ID: 0x51 (1 byte)
- Name (16 bytes ASCII)

> ![NOTE]
> Not authenticated.

### 52: Write Name

- Command ID: 0x52 (1 byte)
- Data: ASCII String (16 bytes)

- Example
  - `52 54657374000000000000000000000000`

Command ID=0x52, Data="Test"

### 53: Write Name Ack

- Command ID: 0x53 (1 byte)

No parameter.

### 54: Get General Info 1

- Command ID: 0x54 (1 byte)

### 55: General Info 1 Answer

- Command ID: 0x55 (1 byte)
- Value (14 bytes)

> ![TIP]
> See General Info 1 for decoding

### 56: Get General Info 2

- Command ID: 0x56 (1 byte)

### 57: General Info 2 Answer

- Command ID: 0x57 (1 byte)
- Value (16 bytes)

> ![TIP]
> See General Info 2 for decoding

### E0: Bootloader Command ("Proxy Frame")

- TBD

### E1: Bootloader Device / Bootloader ACK

- TBD

### Fx: Service Commands

#### F0: Send Raw Message / Find Hardware ("Service")

- Command ID: 0xF0 (1 byte)
- Parameter 1 (1 byte)
- Parameter 2 (1 byte)

#### F1: Actuator: Read Groups / "ActuatorAnyConfigIsLocal" (?) / "Service ACK"

- Command ID: 0xF1 (1 byte)
- Parameter 1 (1 byte)
- Parameter 2 (1 byte)

#### F2: Reboot / Service Status

- Command ID: 0xF2 (1 byte)
- Parameter 1 (1 byte)
- Parameter 2 (1 byte)

#### F3: Service Status ACK

- TBD

#### FE: Unknown

- Command ID: 0xFE (1 byte)
- ?? (1 byte)

- Example
  - `11:14:41.320 > 2W S 0 E 1       FROM 0xBox      TO 0xDevice       CMD FE  DATA(1)08`

> ![NOTE]
> Some kind of Confirmation? I would assume a NACK + ErrorCode
>
> When DATA == 0x05, then this is NOERROR, when answering to CMD 0x19

- Example
  - `11:14:41.320 > 2W S 0 E 1       FROM 842E3      TO D58341       CMD FE  DATA(1)08`
  - `05` is NO ERROR

#### FF: Unknown

- TBD
