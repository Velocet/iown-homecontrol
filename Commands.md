# io-homecontrol commands

## Commands

A command is built as follow:

* A command ID (1 byte) identifying the desired action
* Command parameters

## Command parameter types

### ACEI

According to the io-homecontrol shared library, it is composed of one byte as following (bit positions in header):

|            7-5  |                4-3      |                    2-1      |   0 |
| :-------------: | :---------------------: | :-------------------------: | :-: |
|  Priority level | Priority Service Number | Extended information number |   1 |

The LSB must be 1, it is not considered valid if this bit is set to 0.

### Originator

The originator parameter specifies what fired the command:

* 00: Local user?
* 01: User
* 02: Rain
* 03: Timer
* 04: Security
* 05: UPS?
* 06: SFC?
* 07: LSC?
* 08: SAAC? (looks like to be the default originator)
* 09: Wind
* 0B: External access
* C8: Unknown
* FF: Emergency
* Other?

### Main parameter

TARGET = 53504 = 0xD100
CURRENT = 53760 = 0xD200
DEFAULT = 54016 = 0xD300
IGNORE = 54272 = 0xD400

### Manufacturer

Manufacturers have their own ID:

* Public: 00
* Velux: 01
* Somfy: 02
* Honeywell: 03
* Hörmann: 04
* ASSA ABLOY: 05
* Niko: 06
* Window Master: 07
* Renson: 08
* CIAT: 09
* Secuyou: 0A
* OVERKIZ: 0B
* Atlantic Group: 0C
* Zehnder Group: 0D

### Node type

#### Actuators

* INTERIOR_VENETIAN_BLIND = 1
* ROLLING_SHUTTER = 2
* VERTICAL_EXTERIOR_AWNING = 3
* WINDOW_OPENER = 4
* GARAGE_DOOR_OPENER = 5
* LIGHT = 6
* GATE_OPENER = 7
* ROLLING_DOOR_OPENER = 8
* DOOR_LOCK = 9
* INTERIOR_VERTICAL_BLIND = 10
* SCD = 11,
* BEACON = 12
* DUAL_ROLLING_SHUTTER = 13
* TEMPERATURE_CONTROL_INTERFACE = 14
* ON_OFF_SWITCH = 15
* HORIZONTAL_AWNING = 16
* EXTERIOR_VENETIAN_BLIND = 17
* LOUVRE_BLIND = 18
* CURTAIN_TRACK = 19
* VENTILATION_POINT = 20
* EXTERIOR_HEATING = 21
* HEAT_PUMP = 22
* INTRUSION_ALARM_SYSTEM = 23
* SWINGING_SHUTTER = 24
* SLIDING_WINDOW = 27
* ZONE_CONTROL_GENERATOR = 28
* BIOCLIMATIC_PERGOLA = 29
* INDOOR_SIREN = 30
* DOMESTIC_HOT_WATER = 51
* ELECTRICAL_HEATER = 52
* HEAT_RECOVERY_VENTILATION = 53
* CENTRAL_HOUSE_CONTROL = 255
* REMOTE_CONTROLLER = 1023

#### Sensors


* TEMPERATURE_INSIDE_SENSOR = 2
* TEMPERATURE_OUTSIDE_SENSOR = 3
* PRESSURE_SENSOR = 5
* LIGHT_OUTSIDE_SENSOR = 11
* CUMULATED_GAS = 12
* WATER_CONSUMPTION_SENSOR = 13
* THERMAL_CONSUMPTION_SENSOR = 14
* ELECTRIC_CONSUMPTION_SENSOR = 15
* SMOKE_SENSOR = 128
* OPENING_DETECTOR = 133
* MOTION_SENSOR = 134
* MULTITYPE_SENSOR = 254

#### Device classes

* ACTUATOR = 0
* SENSOR = 1
* STACK = 2
* SLAVE = 3
* MASTER = 4
* BEACON = 5
* CONTROLLER = 6

## Command IDs

### 00: Activate func

Command ID: 0x00 (1 byte)
Command originator (1 byte)
ACEI (1 byte)
Main parameter (2 bytes)
Functional parameter 1 (1 byte)
Functional parameter 2 (1 byte)

Example:
```
00 01 43 d2 00 00 00
```
Command ID=0, Originator=1 (User), ACEI=0x43, MainParam=0xd200 (Current), FP1=0, FP2=0

### 01: Activate mode

Command ID: 0x01 (1 byte)
Command originator (1 byte)
ACEI (1 byte)
Mode number (1 byte)
Mode parameter (1 byte)
Unknown (1 byte)
Unknown (1 byte)

### 03: Unknown

Command ID: 0x03 (1 byte)
Data? (3-6 bytes)

### 04: Unknown

Command ID: 0x04 (1 byte)
Data? (6-20 bytes)

**Note:** this frame does not have any HMAC

### 0c: Unknown

Command ID: 0x0c (1 byte)
Data? (4 bytes)

**Note:** this frame does not have any HMAC

### 20: Private protocol

Command ID: 0x20 (1 byte)
Manufacturer ID (1 byte)
Data

Example:
```
20 02 ff0143000c0000
```
Command ID=0x20, Manufacturer=0x02 (SOMFY), Data=ff0143000c0000

### 21: Private protocol answer

Command ID: 0x21 (1 byte)
Manufacturer ID (1 byte)
Data

### 28: Discover

Command ID: 0x28 (1 byte)

**Note:** this frame does not have any HMAC

### 29: Discover answer

Command ID: 0x29 (1 byte)
Node type and subtype (2 bytes): type on 10 bits and subtype on the remainer
    Node type = (field >> 6) & 1023
    Node subtype = field & 63
Node address (3 bytes)
Manufacturer ID (1 byte)
Multi info byte (1 byte)
Timestamp (2 bytes)

**Note:** the frame does not have any HMAC

Example:
```
29 ffc0 XXXXXX 0c cc 0000
```
Command ID = 0x29, node type = 1023 (REMOTE_CONTROLLER?), node subtype = 0, node address = XXXXXX, manufacturer = Atlantic, multi info byte = 0xcc, timestamp = 0


### 2a: Possible specialized discover

Command ID: 0x2a (1 byte)
?? (12 bytes)

**Note 1:** observed after launching the box in discover mode
**Note 2:** the frame does not have any HMAC

### 2b: Possible specialized discover answer

Parameters are similar to 0x29

Command ID: 0x2b (1 byte)
Node type and subtype (2 bytes)
    Node type = (field >> 6) & 1023
    Node subtype = field & 63
Node address (3 bytes)
Manufacturer ID (1 byte)
Multi info byte (1 byte)
Timestamp (2 bytes)

**Note:** the frame does not have any HMAC

```
2b 0d01 XXXXXX 0c cc 0fb8
```
Command ID = 0x2b, node type = 52 (ELECTRICAL_HEATER), node subtype = 1, node address = XXXXXX, manufacturer = Atlantic, multi info byte = 0xcc, timestamp = 4024

### 2c: Unknown

Command ID = 0x2c

No parameter. Some sort of discover ack? Sent by device, not box.

**Note:** the frame does not have any HMAC

### 2e: Unknown

Command ID: 0x2e (1 byte)
?? (1 byte), 00 (TaHoma sent) and 02 (Sauter heater) observed

**Note 1:** observed after launching the box in discover mode
**Note 2:** the frame does not have any HMAC

Example:
```
2e 00
```

### 30: Send 1W key?

Command ID: 0x30 (1 byte)
16-byte random data (encrypted key?)
Manufacturer ID (1 byte)
?? (1 byte)
Sequence number (2 bytes)

**Note 1:** this frame does not have any HMAC
**Note 2:** the address seems to be derived from the last 3 bytes of the encrypted key. The encrypted key is specified in the QR code printed on the 1W controller label.

Example:
```
30 e79410dcb5dcb9f2d4c0d13c2f485b37 02 01 0c25
```
Command ID=0x30, key?: e79410dcb5dcb9f2d4c0d13c2f485b37, manufacturer ID=0x02, ??=0x01, Sequence number=0x0c25

### 31: Unknown

Command ID: 0x31 (1 byte)

No parameter.
**Note:** this frame does not have any HMAC


### 36: Unknown

Command ID: 0x36 (1 byte)

No parameter.

**Note:** this frame does not have any HMAC

### 38: Launch key transfer

Command ID: 0x38 (1 byte)
Data (6 bytes) same length as HMAC?


### 39: Remove 1W controller

Command ID: 0x39 (1 byte)
??: (1 byte): 0x00 observed

### 3d: Unknown

Command ID: 0x3d (1 byte)
Data? (6 bytes)

### 46: Unknown

Command ID: 0x46 (1 byte)
Data? (9 bytes)

### 47: Unknown

Command ID: 0x47 (1 byte)
?? (1 byte)
Data (4 bytes)

### 48: Unknown

Command ID: 0x48 (1 byte)
Data? (9 bytes)

### 4a: Unknown

Command ID: 0x4a (1 byte)
Data? (3-13 bytes)

### 4b: Large data answer?

Command ID: 0x4b (1 byte)
?? (1 byte)
Sequence number of data (1 byte)
Data (1-18 bytes)

This command is chained to send large numbers of bytes.

### 50: Get name

Command ID: 0x50 (1 byte)

No parameter.

**Note:** this frame does not have any HMAC

### 51: Get name answer

Command ID: 0x51 (1 byte)
Name (16 bytes ASCII)

**Note:** this frame does not have any HMAC

### 52: Write name

Command ID: 0x52 (1 byte)
Data (16 bytes) ASCII

**Note:** this frame does not have any HMAC

Example:
```
52 54657374000000000000000000000000
```
Command ID=0x52, Data="Test"

### 54: Get general info 1

Command ID: 0x54 (1 byte)

### 56: Get general info 2

Command ID: 0x56 (1 byte)

### fe: Unknown

Command ID: 0xfe (1 byte)
?? (1 byte)
