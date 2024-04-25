<!--
All products and applications integrated into the system not only communicate with the remote control, but also with each other. io-homecontrol&reg; is based on radio communication and works in the frequency range from 868 to 870 megahertz.
Before the sender and receiver communicate with each other, the availability of the channel is checked.
If a bandwidth is overloaded or occupied, the application waits for the frequency to become free before communicating (Listen before Talk) or switches to one of the other channels (Adaptive Frequency Agility). io-homecontrol&reg; thus complies with the applicable European radio technology standard EN 300220.
These properties ensure that every command given arrives at the product and is executed. io-homecontrol&reg; has a range of around 20 meters and penetrates walls and furnishings.
When used for the first time, the remote control (transmitter) and product (receiver) exchange a 128-bit encryption code and combine it with a random number for each new action.
A code is calculated from this, which the transmitter and receiver compare with each other.
The product only reacts to the required action if they match. This safety mechanism prevents you from reacting to an external transmitter. The new application automatically searches for existing products and takes them into account in its promotions.
-->
# io-homecontrol Link Layer Specification

There are at least two known protocols:
- io homecontrol 1W
- io homecontrol 2W

| Baud Rate        | 4800 bps        |
| ---------------- | --------------- |
| Data Bits        | 8               |
| Parity           | Odd             |
| Start Bit        | Logical Level 0 |
| Stop Bit         | Logical Level 1 |
| Character coding | NRZ             |

Settings:
- Bitrate: 38400 bauds (baud/sec) = 38400 bits/s
  - Real Bitrate: 38400,9600 Bit/s (Bit/sec)
  - Bitrate Error: 1,0410 ppm
  - Step Bitrate(?): 26666

2FSK knows is binary which means it knows two states and tells us that the bit rate is equal the symbol rate: 1 bit (rate) = 1 symbol/modulation rate.
symbol rate = n baud (bd) = n symbols per second
symbol rate = pulse rate = pulses per second

**note** Captured frames should be stored as CSV/TSV files with the following header:

```CSV
MSG
```

```TSV
```

- Modes of Operation: 3 * 2 (Each Mode can be Low Power)
  - Master
  - Slave
  - Beacon (Repeater)
- 3 Layer
  - Layer 1: RF Transmission - Bit Representation
    - UART Encoded
    - 38.400 bps
    - 26us Symbolrate
    - Repeated Key Duration: Frame is sent every 140 milliseconds
  - Layer 2: Frame (Data Link)
    - Preamble: 256 bit of alternating 1>0>1>0 ...
    - SyncWord / Start Byte
    - PACKET
    - CRC
  - Layer 3: Packet (Network):
    - Header
    - Address
    - Payload
    - Rolling Code
    - HMAC

time lag between two successive activations: 200 ms

## Protocol Frame

IoSerialNumber: 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF

This is the standard io-homecontrol frame (byte positions in the header).

- Minimum Length = 11 bytes (i.e. without any DATA)
- Maximum Length = 32 bytes (i.e. maximum 21 bytes of DATA)

From the decompilation:
  NodeAddress   : 0x0000
  Header/CMD    : 0x0000
  ManufacturerId: 0x00
  PrivateCmd:     0x00

OWS: Handles talking to Overkiz Cloud

> `apps\var\lib\io-homecontrol\lua-storage\io\stack&646575`

  ```SHELL
  address=646575,
     type=065476,
  manufacturer=2,
  StackKey=E9 94 BA CF E6 BE D7 66 76 30 EA E4 75 BA AE 95
  ```
<!-- PLAYAEREA

  address=64 65 75,
     type=06 54 76,
  address=  64 65  75,
     type= 06   54 76,

 -->

  34C3466ED88F4E8E16AA473949884373

<kbd>Ctrl + S</kbd>

&horbar;&mdash;——————————


```YAML
[—————————————————————————— P A C K E T ——————————————————————————]
                 [—————————— F R A M E ——————————]
 [PREAMBLE] [SFD] [HEADER] [TYPE] [PAYLOAD] [CRC] [POSTAMBLE] [InterFrameGap]
                                              [    D A T A    ] [ENUM] [   H M A C  ] [ F C S ]

[55....55  FF33] [F6 00 00003F 708758] [ 00 ] [01 61 D200 00 00 [3BD2] [E6B62CEF54C8] [ A9 37 ]
 PREAMBLE  SYNC   MT LP SRCADR DSTADR CM MAIN F1 F2 ENUM MACMACMACMAC CODE

 Bit Sequence = Preamble + Sync Word (SFD): Follows Long PPDU Format (128 bits Preamble/Sync + 16 bits SFD/Sync Word)
 Preamble = Used for Synchronisation
 SFD = Start Frame Delimiter: Indicates Start of Frame
 FCS = Frame Check Sequence: CRC16-KERMIT over HEADER+TYPE+PAYLOAD
```

- Media Layers:
  - Bits: Physical (Signal and Binary Transmission)
  - Frames: Data Link (MAC = Physical Addressing)
  - Packets: Network (IP = Path and Addressing)

| NAME | Preamble | Sync Word | Header | Payload | CRC      | Postamble |
| :--: | :------: | :-------: | :----: | :-----: | :------: | :-------: |
| SIZE | 52 Byte  | 2 Byte    | 1 Byte | 1 Byte  | 3 Byte   | 3 Byte    |
| TYPE | 0-1-0 FM | UART      | UART   | 1 Byte  | 3 Byte   | 3 Byte    |
|      | 55       | FF 33     | 00     | 00      | 00:00:00 | 00:00:00  |



| Name | Preamble | Sync<br>Word | Control<br>Byte<br>0 | Control<br>Byte<br>1 | Destination<br>Node<br>ID | Source<br>Node<br>ID | Data  | CRC     |
| :--: | :------: | :----------: | :------------------: | :------------------: | :-----------------------: | :------------------: | :---: | :-----: |
| Byte |          |              | 0                    | 1                    | 2 - 4                     | 5 - 7                | 9 - n | (n-1)-n |

- Preamble
- Sync Word = Network ID (= Frame Type?)

CtrlByteManufCode
FrameType
Command
Data
DataLen
isOneWay

### Header > Frame Control Bytes

| Behavior                            | Bit 1 | Bit 0 |
| :---------------------------------- | :---: | :---: |
| Single Command                      | 0     | 0     |
| Next Command to Execute in Series   | 0     | 1     |
| Next Command to Execute in Parallel | 1     | 0     |
| End of Group of Commands            | 1     | 1     |

| Instruction                          | Bit 2 | Bit 1 | Bit 0 |
| :----------------------------------- | :---: | :---: | :---: |
| End of macro-program                 | 0     | 0     | 0     |
| Immediate Execution                  | 0     | 0     | 1     |
| Parallel Execution & Function AND    | 0     | 1     | 0     |
| Parallel Execution & Function OR     | 0     | 1     | 1     |
| Parallel Execution & Function NO AND | 1     | 0     | 0     |
| Test                                 | 1     | 0     | 1     |
| Skip                                 | 1     | 1     | 0     |
| Time Delay                           | 1     | 1     | 1     |

> FrameType Segment: Same 3bit + 5bit Format could also be used for CommandIDs, Parameter, etc.
> - 3bit (SegmentType) + 5bit (SegmentData)
> - 3bit (SegmentType) + 5bit (SegmentLength)

0b000 = 0 = "UNKNOWN"
0b001 = 1 = "ACTUATOR" isOneWay
0b010 = 2 = "SENSOR"
0b011 = 3 = "VIDEO_SYSTEM" isOneWay
0b100 = 4 = "REMOTE_CONTROLLER"
0b101 = 5 = "PROTOCOL_GATEWAY" isOneWay
0b110 = 6 = "INFRASTRUCTURE_COMPONENT"
0b111 = 7 = "GROUP" isOneWay

- First 3bit define the *Session Information* or `FrameType`
  - FrameTypes:
    - 1: 000 FrameType_Identification
    - 2: 001 FrameType_Parameter
    - 3: 010 FrameType_ParameterValue / Transaction
    - 4: 011 FrameType_Unknown / Action
    - 5: 100 TypeOfSegment
    - 6: 101 TypeOfSegment
    - 7: 110 TypeOfSegment
    - 8: 111 TypeOfSegment
  - Example for Session Information: Indicate button press/released event
  - Button Press Threshold: 140ms
  - NOTE: see [US7852765B2](https://patentimages.storage.googleapis.com/ad/fb/19/e32e0fd9ea606e/US7852765.pdf)

#### Control Byte 1

Basic Frame information.

| **BIT**  | 7-6   | 5    | 4-0  |
| :------: | :---: | :--: | :--: |
| **NAME** | Order | Mode | Size |

- `Order`: Indicate Relationship (Logical and/or Temporal) between transmitted Orders.

| #   | bit`[7]` | bit`[6]` | Command Order Relationship<br/>(First/Last Frame in Session) |
| --: | :------: | :------: | :----------------------------------------------------------- |
| 0   | 0        | 0        | Single            = Last/First Session Frame:  No/No         |
| 1   | 0        | 1        | Next in Series    = Last/First Session Frame:  No/Yes        |
| 2   | 1        | 0        | Next in Parallel  = Last/First Session Frame: Yes/No         |
| 3   | 1        | 1        | Command Group End = Last/First Session Frame: Yes/Yes        |

- [5] MODE `isOneWay`: Protocol Mode/Version
  - 0 = 2W = Two Way
  - 1 = 1W = One Way

- Size: Frame Length in bytes, not including `Control Byte 1` and the `CRC`

### Control Byte 2

Extended Frame Information.

| **BIT**  | 7          | 6      | 5              | 4   | 3   | 2   | 1-0              |
| :------: | :--------: | :----: | :------------: | :-: | :-: | :-: | :--------------: |
| **NAME** | Use Beacon | Routed | Low Power Mode | Ack | ?   | ?   | Protocol Version |

> FrameData Segment
> 7:3 = 32 codes of the signs or characters specifying the transaction or the action

- Use Beacon (`isBeacon`): Repeater Mode = Allow routing the Frame through the Network
  - 0: Do Not use Beacon
  - 1: Use Beacon
  - **Note**: Max. 1 Hop!
- Routed (`isRouted`): Indicates if Frame has already been routed through a Beacon (Repeater)
  - 0 frame has not been routed
  - 1 frame has been routed
- Low Power Mode (`PowerSaveMode`): Indicates if Frame is sent to Device in Low Power Mode (LPM):
  - 0 = Destination Device is not in Low Power Mode
  - 1 = Destination Device is in Low Power Mode
- Ack indicates if a response can be handled (2 Way Devices Only)
  - 0 = NACK: 1-Way Device
  - 1 = ACK: 2-Way Device

- io-Membership Flag
- RF Support in Node
- CtrlByteManufCode

### Addresses (NodeId)

Addresses are 3 bytes long and can range from `01 00 00` to `ff ff ff`.

Addresses are also refered to as *Node ID* which resembles the MS-B of a typical MAC-Address. The Node Type is a numerical value defines which

#### Destination Address

- `00 00 3F` is broadcast
- `00 00 3B` ??
- `00 00 00` = Group
- `FF FF FF` = Broadcast

#### Source (Sender) Address

- `FFFFFE` = SRC for P2P and BROADCAST
- `FFFDFF` = RS485 (SDN) Setting Tool

### CommandParameter

See [Commands](COMMANDS.md) for command id reference.

#### CommandParameter Types

There exist different types of Parameter:

- Main
  - Functional
- Private
  - Stimuli
    - Somfy Key & Go 1w
    - Somfy Satellite 1w

### Data

- Length
  - Minimum =  0 bytes (no DATA)
  - Maximum = 21 bytes

Depending on the frame type it can correspond to raw data, io-homecontrol command parameters or manufacturer-specific data.

Note that in authenticated 1-Way frames, a 2-bytes sequence number and a 6-byte long message authentication code are appended:

|  X - Y |   (Y + 1) - (Y + 2)    |   (Y + 3) - (Y + 9)  |
| :----: | :--------------------: | :------------------: |
|  Data  |     Sequence number    |          MAC         |

### CRC

After the payload, there is a 16-bit CRC with polynomial 0x(1)8408 over the data packet (i.e. length byte + payload). The CRC's initial value is 0 and it does not employ an XOR/NOT. The least significant byte of the CRC is transmitted first.

The C# implementation shown here can be found in the Starter Kit software from Semtech for their SX12xx line of radios. Just use a .NET decompiler (dotPeek, ILSpy, etc.) and search for it:

```CSHARP
// This is real code that changes the packet and returns 0 ... i have no clue why they implemented this
ushort ComputeCrc(byte[] packet){
for (int i = 0; i < packet.Length; i++) {
  packet[i]=(byte)((packet[i] * 0x802 & 0x22110 | packet[i] * 0x8020 & 0x88440) * 0x10101 >> 0x10);
}
return 0;
```

## System (Stack) Key

Each two-ways controller has a stack or system key.
This is an AES-128 key used to sign io frames with the trailing MAC.

Advanced Encryption Standard (AES) 128-bit block encryption/decryption with 128 bits key size.
Electronic Code Book (ECB) and Cipher Block Chaining Mode 1 (CBC Mode 1) are supported.
The AES engine is enabled on the ADF7023 by downloading the AES software module to program RAM.


The key generation on Kizboxes is insecure because it relies on the lua math.random :

```LUA
-- seed
kizbox_id = "xxxx-xxxx-xxxx" -- Kizbox serial
math.randomseed(tonumber(string.gsub("1" .. kizbox_id, "-", "")) - os.time())
-- key generation
key = {}
keySize = 16 -- 128 bits
for i = 1, keySize do
    key[i] = math.random(0, 255)
end
```

This mechanism only leaves roughly 31,536,000 keys possible if the serial number of the TaHoma and the year of setup are known (other calls to math.random are made so the actual number may be a bit above this figure but once the seed and the number of times math.random is called are figured out by an attacker, they can completly determine the key).

## Discovery

There are several discover types:

- Discover Sensor
  - Discover Sensor Simple
  - Discover Sensor Simple IO
  - Discover Sensor Generic
  - Discover Sensor Generic Pulse Sensor
- Discover Actuator
  - Discover Actuator Simple
  - Discover Actuator Simple with Wink
  - Discover Actuator OVP
  - Discover Actuator 1W
  - Discover Actuator In System
  - Discover Actuator Without Setup ("Virgin")
- Discover
  - Discover Simple
  - Discover Controller
  - Discover Controller 1W
  - Discover Intermediate
  - Discover Private Somfy

### One Way Discovery

``` mermaid
sequenceDiagram
    participant 1W as Remote
    participant 2W as Actuator
    Note over 1W,2W: 1-Way Discovery
    1W->>2W: Command ID: 0x39<br/>Remove 1-Way Remote
    activate 2W
    loop 0x39
        2W->>2W: Remove<br/>1-Way Key
    end
    deactivate 2W
    1W-->>2W: Command ID: 0x30<br/>Send Encrypted 1-Way Key
    activate 2W
    loop 0x30
        2W->>2W: Store<br/>1-Way Key
    end
    deactivate 2W
```

In 1-way mode, the controller does not get any answer. So this is the simplest discovery mode, it asks for exclusion using 0x39 and then sends its 1-W encrypted key using 0x30.

### Two Way Discovery: Simple Discover

Actions:

* Controller sends command 0x28 (discover) when entering discover mode
* Device in pairing mode answers with command 0x29 (discover answer) and gives metadata to identify itself to the controller
* Controller confirms having received discovery information from device
* Devices acks confirmation

```YAML
# Discover request
C8 00 00003B F00F00 28 1234
# Discover answer: node type REMOTE_CONTROLLER, subtype 0, node address feefee, manufacturer Atlantic
# multi info byte 0xcc, timestamp 0000
D1 00 F00F00 FEEFEE 29 FFC0 FEEFEE 0C CC 0000 1234
# Discover confirmation
48 00 FEEFEE F00F00 2C 1234
## Discover confirmation ack
88 00 F00F00 FEEFEE 2D 1234
```
Must send a 0x38 key transfer, just after the 0x2d discover confirmation ack to effectivly have the device added
```TEXT
// Controller ask for key transfer using challenge 123456789ABC
4E 04 FEEFEE F00F00 38 123456789ABC 23B6
```

### 2-way: Specialized Discover

Actions:

- Controller sends command 0x2a (specialized discover) with specific data not identified to this day
- Device in pairing mode answers with 0x2b and same information fields as in 0x29
- Controller and device exchange 0x2c and 0x2d just like in the general discover
- Controller sends command 0x36, authenticates and expects an address in 0x37 answer (see 2-way key exchange push below)

## Pairing and Authentication

Before being able to communicate with authentication, io-homecontrol nodes must share a common secret as the security of the protocol relies on a symmetric encryption algorithm.

The pairing process consists in transmitting the key. Authentication in adding and verifying challenges.

In both modes (1-way/2-ways), the transferred key is obfuscated using different methods.
But both methods imply a shared key probably specified in the protocol documentation.
This key is refferred to as **transfer key** and has the following value, probably hardcoded in the specification:

- `34C3466ED88F4E8E16AA473949884373` - As a UUID: `34C3466E-D88F-4E8E-16AA-47:39:49:88:43:73`

Other Keys found in the io Gateway:
- `SDNP io Actuator 1W Control Key = FD534F4D4659` = `0xFD SOMFY`
- `4275696C64696E6720436F6E74726F6C` = `Building Control`

**Note:** All Crypto functions are available in [ioCrypto.py](../scripts/ioCrypto.py)

### Initial Vector (IV) and AES-128 Encryption

In all cases implying encryption, an Initial Vector (IV) is required to feed the AES algorithm using a mode similar to OFB or CFB.
In fact, as all payloads are 128-bit long, there is no block chaining and the encryption process is the following:

1. Generate IV
2. Encrypt IV with Transfer or System Key (depending on data) using AES-128
3. XOR encrypted IV with the Secret for Transmission

- How To Generate IV:
  | **Mode**  | 0-7                    | 8-9             | 10-11                       | 12-15          |
  | :-------: | :--------------------: | :-------------: | :-------------------------: | :------------: |
  | **1-Way** | First 8 byte of Payload | Checksum | Sequence Number             | Padding (0x55) |
  | **2-Way** | First 8 byte of Payload | Checksum | Challenge (sent beforehand) |                |

  - Pad Payload if less than 8 byte with 0x55
  - Compute Checksum for each Frame byte:
    ```python
    # Checksum Return Value: 2 byte Tuple (byte 0 & byte 1)
    # Initialization Value for both bytes: 0
    def computeChecksum(frame_byte, chksum1, chksum2):
      tmpchksum = frame_byte ^ chksum2
      chksum2 = ((chksum1 & 0x7f) << 1) & 0xff
      if chksum1 & 0x80 == 0:
        if tmpchksum >= 128:
          chksum2 |= 1
        return (chksum2, (tmpchksum << 1) & 0xff)
      if tmpchksum >= 128:
        chksum2 |= 1

      return (chksum2 ^ 0x55, ((tmpchksum << 1) ^ 0x5b) & 0xff)
    ```
    > **note** Check the initial value generation function for better understanding on how to use the checksum function.

#### Example

> - Frame: `F6 00 00003F 385762 000143D2000000 0599 123456789ABC 5FB0`
>   - Payload: `000143D2000000` (7 byte => needs 1 byte padding with 0x55)
>   - Sequence Number: `0599`
>
> Padded Payload: `000143D200000055`
> IV will be: `000143D2000000550500059955555555`
>
> In 2-way Mode, for the following exchange:
>
> Ask Challenge: `480012195FD35C18 31 28E3`
>
> Challenge Request: `0E00D35C1812195F 3C 123456789ABC A9C7`
>

The IV will be: `31555555555555550062123456789ABC`

Encryption with AES-128 follows the below process:

- IV is generated as described above
- IV is encrypted using AES-128 and depending on the use case with either:
  - Transfer Key
  - Stack Key
- If encrypting a Secret: The Secret is XORed with the Output of the previous Step.
- If creating a MAC: The output of the previous Step is truncated to 6 bytes.

### Key Exchange

#### 1-Way Key Exchange

In 1-way mode, the controller will send several times the command 0x30 with its key encrypted with the transfer key listed above and an initial value that consists in its address repeated several times to build a 16-byte long value.

For node with address `abcdef`, the initial value will be:

```HEX
ABCDEFABCDEFABCDEFABCDEFABCDEFAB
```

Furthermore, the 0x30 message is authenticated using a 1-way MAC embedded in the command itself. For the node `abcdef` with key `01020304050607080910111213141516` and sequence number 0x1234 the 0x30 message will be:

```HEX
FC 00 00003F ABCDEF 30 7E60491F976ADF653DB0ED785E49A201 02 01 1234 19E81EC43D5E 9BF2
```

#### 2-Way Key Exchange

**Note:** in examples below, the stack key used is `01020304050607080910111213141516`

In 2-Way mode, there are 2 ways keys can be exchanged:
* By pulling the key from a remote node
* By pushing a key to a remote node

It seems that when a new device is added to a stack, both methods are used. First, the controller will collect the already set device key and then use it to authenticate requests to push its stack key to the device.

##### Pull

Actions:

* Right after initial discovery, the controller issues command 0x38 (launch key transfer). This command is not authenticated but submits a 6-byte long initial value to be used to encrypt the key used by the device
* The device answers with command 0x32 (key transfer) and sends its key encrypted using the transfer key
* The controller issues a command 0x3c (challenge request) to authenticate the previous command
* The device answers to the challenge with command 0x3d and a response encrypted using the key transmitted just before in command 0x32

Example (device key is `ABCDEF01020304050607080910111213`):

```TEXT
// Controller ask for key transfer using challenge 123456789ABC
4E 04 FEEFEE F00F00 38 123456789ABC 23B6
// Device creates an initial value based on last frame and the specified challenge
// and use this initial value to encrypt its key before transmission
18 04 F00F00 FEEFEE 32 EA425A7A182885D4EAEEFD416D625E01 6379
// Controller challenges the device for command 0x32 (see authentication below)
// Note: in real life, challenge will be different to the one specified in 0x38
0E 00 FEEFEE F00F00 3C 123456789ABC 5EB1
4E 00 FEEFEE F00F00 3C 123456789ABC EC2A
// Device creates an initial value based on the 0x32 frame and challenge specified in 0x3c
// It will use its own key to authenticate as it has not received one from the controller
8E 00 F00F00 FEEFEE 3D 0AE519A73C99 2400
```

##### Push

**Note:** stack key push to device has been observed after a bit of information exchange such as general information (0x54 and 0x56). Most of these commands are authenticated using 0x3c and 0x3d (see authentication below) and so are the push commands.

Actions:
* First, the controller asks the device a challenge using command 0x31 (ask challenge)
* The device then answers using command 0x3c (challenge request) and a 6-byte long challenge
* The controller sends the encrypted stack key to the device node with command 0x32 (key transfer) using the transfer key
* The device asks the controller for authentication using 0x3c
* The controller authenticates using its stack key (not the device key anymore) and command 0x3d
* The device answers with command 0x33 to confirm that stack key has been received
* To check if the stack key has properly been transferred, the controller sends the 0x36 command and authenticate to finally receive the address of the device in the 0x37 command

Example:

```TEXT
// Send challenge request
48 00 feefee f00f00 31 fb60
// Challenge request
0e 00 f00f00 feefee 3c 123456789abc 19db
// Controller creates an initial value based on last frame and the specified challenge
// and use this initial value to encrypt the stack key before transmission
18 00 f00f00 feefee 32 102e49a16d3b69726f3192cf17534ad9 8043
// Device challenges the controller for command 0x32 (see authentication below)
// Note: in real life, challenge will be different to the one specified in previous 0x3c
0e 00 f00f00 feefee 3c 123456789abc 19db
// Controller answers to the challenge using the stack key
0e 00 feefee f00f00 3d 8dc9d40dc7a4 f9e5
// Device saves the stack key and sends a confirmation
88 00 f00f00 feefee 33 5bfb
// Controller checks if the device received the stack key by issuing a control command
48 04 feefee f00f00 36 9a02
// Device sends a challenge to the controller
0e 00 f00f00 feefee 3c 123456789abc 19db
// Controller answers the challenge for command 0x36
0e 04 feefee f00f00 3d c7fdc0668818 b1e3
// Device sends its address as answer in 0x37
0b 04 f00f00 feefee 37 feefee 7ccf
```

### Authentication

io-homecontrol frames are authenticated using AES-128 based MACs. There are differences between 1-way and 2-way modes. In both cases, the MAC is created by truncating the output of the AES-128 algorithm down to 6 bytes.

#### 1-Way Authentication

In 1-way mode, a signature of the frame is made using the stack key burned into the 1-way controller during manufacturing. This signature is appended to the frame along with a sequence number to prevent replay attacks.

The data and sequence number are handled separately in the initial vector generation (i.e. the sequence number is not handled as frame data and not taken into account in the first part of the IV).

#### 2-Way Authentication

In 2-way mode, a node will issue a 0x3C command frame with a 6-byte long challenge to commands received from other nodes. The asking node must provide a 0x3D command with the answer to the 6-byte long challenge (the answer is also 6-byte long). 2-way frames do not have any MAC or sequence number incorporated in the frame itself.

For example, here is a 2-way sequence of request/answer type:

```TEXT
// Send address request
48 04 feefee f00f00 36 9a02
// Challenge request
0e 00 f00f00 feefee 3c 123456789abc 19db
// Challenge answer
0e 04 feefee f00f00 3d c7fdc0668818 b1e3
// Address answer
0b 04 f00f00 feefee 37 feefee 7ccf
```

**Note:** There is a race condition vulnerability. In fact, it would be possible to spoof answers by answering faster than the legitimate device after a 0x3d frame. This allows authentication of the asking node but not authentication of the answering node...

The MAC is generated using a shared key between both nodes. This is referred as Stack Key in the firmware and System Key in the user interface. The same key is shared throughout the installation (by a 2-Way controller).

Below is an extract of the MAC generation code:

```python
def create_2W_hmac(challenge, system_key, frame_data):
  iv = constructInitialValue(frame_data, challenge)
  cipher = aes.AES(system_key)
  return cipher.encrypt_block(iv)[:6]
```

The initial value is always created using data from the requesting command (see above for details on initial value generation).

## Test and EMS Frames

### EMS Frames

Sadly little is known about the EMS2 device and the protocol that is used in the factory to program io-homecontrol devices.

> EMS frames in binary, first 0 is D then frame in binary
> EMS_STOP_BECAUSE_SINE_WAVE_IS_MISSING

### Calibration Data

io Tests Terminal:  `0E5EC4 0ECD0B 0F5AD4`
ideal RF STM32 CAL: `0E4EC4 0EBD0B 0F4AD4000000`
io-homecontrol CAL: `0E4EC4 0EBD0B 0F4AD4` (default)

### Test Frames

> io Tests Terminal

<!-- maybe those used codes are either plain C0 control codes:
02 = STX = Start of Text
03 = ETX = End of Text
09 = HT  = Next Character
 -->

- Template: `MP FP1 FP2 FP3 CKS`
  - MP: `02` + Command
  - FP1 - FP3: `09` + Data
    - NOTE: It seems that only a maximum of 3 FPs is supported
  - CKS: `03` + 2 Byte CRC

- Get HW Version: `02 474857 03 3539`
- CKS Error:      `02 475357 03 3431`
- Get SW Version: `02 475357 03 3432`

- RFT TX=0 C=0: `02 524654 09 54583D30 09 433D30 03 3045`
- RFT TX=0 C=1: `02 524654 09 54583D30 09 433D31 03 3046`
- RFT TX=0 C=2: `02 524654 09 54583D30 09 433D32 03 3043`

- RFT TX=1 Channel 1: `02 524654 09 54583D31 09 433D30 03 3046`
- RFT TX=1 Channel 2: `02 524654 09 54583D31 09 433D31 03 3045`
- RFT TX=1 Channel 3: `02 524654 09 54583D31 09 433D32 03 3044`

- RFT TX=2 (Preamble) Channel 1:             `02 524654 09 54583D32 09 433D30       03 3043`
- RFT TX=2 (Preamble) Channel 2:             `02 524654 09 54583D32 09 433D31       03 3044`
- RFT TX=2 (Preamble) Channel 3:             `02 524654 09 54583D32 09 433D32       03 3045`
- RFT TX=2 (Preamble) Channel 1 Timed 1s/1s: `02 524654 09 54583D32 09 433D30 09 54 03 3531`
- RFT TX=2 (Preamble) Channel 2 Timed 1s/1s: `02 524654 09 54583D32 09 433D31 09 54 03 3530`
- RFT TX=2 (Preamble) Channel 3 Timed 1s/1s: `02 524654 09 54583D32 09 433D32 09 54 03 3533`

- RFT RX LBT  Channel 1: `02 524654 09 52583D30 09 433D30 03 3038`
- RFT RX LBT  Channel 2: `02 524654 09 52583D30 09 433D31 03 3039`
- RFT RX LBT  Channel 3: `02 524654 09 52583D30 09 433D32 03 3041`
- RFT RX Data Channel 1: `02 524654 09 52583D31 09 433D30 03 3039`
- RFT RX Data Channel 2: `02 524654 09 52583D31 09 433D31 03 3038`
- RFT RX Data Channel 3: `02 524654 09 52583D31 09 433D32 03 3042`

- RFT CAL Read:          `02 524654 09 43414C   09 5244   03 3139`
- RFT CAL Write `0E5EC4 0ECD0B 0F5AD4`:
                         `02 524654 09 43414C 09 57523D 304535454334304543443042304635414434 03 3337`
- RFT OFF:               `02 524654 09 4F4646 03 3037`
- CMD unknown:           `02 575357           03 3532`

> Manual Order

Possible Cancidates:
- CW
- CCW

- Command ID: 02 = Manual Order
  - Command Parameter IDs:
    - 03 + 2 Byte: CKS = ChecKSum
    - 09 + n Byte: MP/FP ID

- Parameter IDs for Manual Order:
  - 433D    C=  Channel=ChannelNumber (eg.: C=0)
  - 4341 4C CAL Calibrate Radio
    - Calibration Data: `FF FF FF FF FF FF FF FF FF`
  - 443D    D=
  - 4F46 46 OFF Switch Off
  - 523D    R=  Receive (??)
  - 5244    RD  Read
  - 5243 3D RC= Status
  - 5258 3D RX= Receive=ReceiveMode
    - 0 = Listen Before Talk (LBT)
    - 1 = Receive Raw Data
  - 54       T   Signal: Timed 1s/1s
  - 5458 3D TX= Transmit=TransmitMode ("Permanent Emission")
    - 0 = Transmit Test Mode: 1
    - 1 = Transmit Test Mode: 2
    - 2 = Transmit Preamble ("M55")
T=%1
T=M
S=%1
S=D
R=%1
P=1

 M=
LP=
LS=
AP=
AS=

TX=
WR=
RX=
RD=

SS=
LP=
LS=
AP=
AS=

BSY
GSW
GHW
BOM
RFT
NTK
NGV
NNB
RSS
FGT
G2A
S2A
G2K
S2K
MOC
MDV
MDI
MPA
MUP
WIN
MGO
MGS
MGL
AMK
RCM
MGN
MSN
MGD
RAV
GMA
SMA
D1C
G1C
R1C
A1C
G1K
S1K
M1P
M1U
M1G

- 57523D WR= - WRite=Data
- 413143 A1C - > A1C, D1C, G1C, R1C
- 414D4B AMK
- 424F4D BOM
- 425359 BSY - BuSY (???)
- 443143 D1C - > A1C, D1C, G1C, R1C
- 445453 DTS - Data Transport Service
- 464754 FGT
- 473143 G1C - A1C, D1C, G1C, R1C
- 47314B G1K - <> S1K
- 473241 G2A - <> S2A
- 47324B G2K - <> S2K
- 474857 GHW - Get Hardware Version
- 474D41 GMA - Get MA (???) <> SMA
- 475357 GSW - Get Software Version
- 4D3147 M1G - ???
- 4D3150 M1P - ???
- 4D3155 M1U - ???
- 4D4449 MDI - ???
- 4D4456 MDV - ???
- 4D4744 MGD - ???
- 4D474C MGL - ???
- 4D474E MGN - ???
- 4D474F MGO - ???
- 4D4753 MGS - ???
- 4D4F43 MOC - ???
- 4D5041 MPA - ???
- 4D534E MSN - ???
- 4D5550 MUP - ???
- 4E4756 NGV
- 4E4E42 NNB
- 4E544B NTK
- 523143 R1C - > A1C, D1C, G1C, R1C
- 524156 RAV
- 52434D RCM - Receive Config Mode
- 524654 RFT - Radio (RF) Test
- 525353 RSS - Read Signed Raw Value
- 53314B S1K - <> G1K
- 533241 S2A - <> G2A
- 53324B S2K - <> G2K
- 534D41 SMA - Set MA (???) <> GMA
- 57494E WIN - Wink (???)
- 575357 WSW - Write Signed Raw Value (???) > HSW?
,1W=
,2W=
,act=
,actuator=
,add=
,address=
afunc,act=
afunc,grp=
,afunc_ack=
,astate_ack=
,chan=
,cmd=
,cmd=reset,
,cmd=receiveconfigmode=
,cmd=set,autoslavemode=
,configmode=
,slavemode=
,iomode=
,fp1=
,fp2=
,fp3=
,key=
,len=
,max_discovered_nodes=
,max_paired_nodes=
,preamble,
,prot=
,req,
,req,slavemode,
,req,swversion,
,res=
,reset=startup,
,RF_busy,
,RF_ProtocolFatalError
,RSSI=
,sens=
,stack_dead,
,swversion=
,sys_id=
,tpos=
,reverse_ack=
,verify_ack
,version_ack=
,virgin_ack=

actdata=
add=
busylevel=
chan=
grp=
key=

rem,grp=

astate,act=
delete,act=
req_version,act=
rev,act=
verify,act=
virgin_sfy,act=
virgin,act=
wink,act=

actuator,
add,
all_add,
delete_all,
disc_
eof_full
key,
master,
max_discovered_nodes,
max_paired_nodes,
nack

nack_addr
nack_appli_busy
nack_auth
nack_CRC
nack_full
nack_grp
no_more
rssi_off
rssi_on

noanswer
only,actuator,
pair,actuator,
system,actuator,
random,
rssi,
sens,
set,
sid,
slave,
test,
virgin,
wink_ack
