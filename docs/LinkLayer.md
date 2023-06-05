# io-homecontrol link layer specification

## io protocol frame

This is the standard io-homecontrol frame (byte positions in the header).

|              1 |              2 |                 3-5 |            6-8 |          9 | variable | (N-1)-N |
| :------------: | :------------: | :-----------------: | :------------: | :--------: | :------: | :-----: |
| Control byte 1 | Control byte 2 | Destination address | Sender address | Command ID |   DATA   |     CRC |

## Control byte 1

The control byte 1 gives basic information about the frame (bit positions in the header):

|  7  |   6   |       5       |                        4-0  |
| :-: | :---: | :-----------: | :-------------------------: |
| End | Start | Protocol mode |         Frame length        |

End:

* 0 this is not the last frame of the session
* 1 this is the last frame of the session

Start:

* 0 this is not the first frame of the session
* 1 this is the first frame of the session

Protocol mode:

* 0 Two-way
* 1 One-way

Frame length:

Length of the frame in bytes, not including the first control byte and the CRC

## Control byte 2

This control byte gives more information on the frame and the device themselves (bit positions in the header):

|     7      |   6    |       5        |  4  |  3  |  2  |           1-0    |
| :--------: | :----: | :------------: | :-: | :-: | :-: | :--------------: |
| Use beacon | Routed | Low power mode |  ?  |  ?  |  ?  | Protocol version |

Use beacon (allow routing the frame through the mesh network):

* 0 do not use beacon
* 1 use beacon

Routed indicates if the frame has already been routed through a beacon:

* 0 frame has not been routed so far
* 1 frame has been routed

Low power mode indicates if a frame is sent to a device operating in low power mode:

* 0 the destination device is not in low power mode
* 1 the destination device is in low power mode

Bits 4, 5 and 6 are unknown

## Addresses

Addresses are 3 bytes long and can range from `01 00 00` to ̀`ff ff ff`.

### Destination address

Addresses are 3 bytes long.

* ̀`00 00 3f` is broadcast
* `00 00 3b` ??

### Sender address

Addresses are 3 bytes long.

## Command ID

Standard io-homecontrol command id. See [Commands](Commands.md) for command id reference.

## Data

Depending on the frame type it can correspond to raw data, io-homecontrol command parameters or manufacturer-specific data.

Note that in authenticated 1-Way frames, a 2-bytes sequence number and a 6-byte long message authentication code are appended:

|  X - Y |   (Y + 1) - (Y + 2)    |   (Y + 3) - (Y + 9)  |
| :----: | :--------------------: | :------------------: |
|  Data  |     Sequence number    |          MAC         |

## CRC

After the payload, there is a 16-bit CRC with polynomial 0x(1)8408 over the data packet (i.e. length byte + payload). The CRC's initial value is 0 and it does not employ an XOR/NOT. The least significant byte of the CRC is transmitted first.

## Stack system key

Each two-ways controller has a stack or system key. This is an AES-128 key used to sign io frames with the trailing MAC. The key generation on Kizboxes is insecure because it relies on the lua math.random :

```lua
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

There seem to be several discover types.

### 1-way discover

In 1-way mode, the controller does not get any answer. So this is the simplest discovery mode, it asks for exclusion using 0x39 and then sends its 1-W encrypted key using 0x30.

### Simple 2-way discover

Actions:

* Controller sends command 0x28 (discover) when entering discover mode
* Device in pairing mode answers with command 0x29 (discover answer) and gives metadata to identify itself to the controller
* Controller confirms having received discovery information from device
* Devices acks confirmation

```
// Discover request
c8 00 00003b f00f00 28 1234
// Discover answer: node type REMOTE_CONTROLLER, subtype 0, node address feefee, manufacturer Atlantic
// multi info byte 0xcc, timestamp 0000
d1 00 f00f00 feefee 29 ffc0 feefee 0c cc 0000 1234
// Discover confirmation
48 00 feefee f00f00 2c 1234
// Discover confirmation ack
88 00 f00f00 feefee 2d 1234
```

### Specialized 2-way discover

Actions:

* Controller sends command 0x2a (specialized discover) with specific data not identified to this day
* Device in pairing mode answers with 0x2b and same information fields as in 0x29
* Controller and device exchange 0x2c and 0x2d just like in the general discover
* Controller sends command 0x36, authenticates and expects an address in 0x37 answer (see 2-way key exchange push below)

## Pairing process and authentication

Before being able to communicate with authentication, io-homecontrol nodes must share a common secret as the security of the protocol relies on a symmetric encryption algorithm.

The pairing process consists in transmitting the key. Authentication in adding and verifying challenges.

In both modes (1-way/2-ways), the transferred key is obfuscated using different methods. But both methods imply a shared key probably specified in the protocol documentation. This key is refferred to as **transfer key** and has the following value, probably hardcoded in the specification:

```
34c3466ed88f4e8e16aa473949884373
```

**Note:** all crypto functions are available in [ioCrypto.py](scripts/ioCrypto.py).

### Initial Vector and AES-128 encryption

In all cases implying encryption, an initial vector is required to feed the AES algorithm using a mode similar to OFB or CFB. In fact, as all payloads are 128-bit long, there is no block chaining and the encryption process is the following:

* Generate an initial vector
* Encrypt it using AES-128 and either the transfer key of the system key depending on the data encrypted
* XOR the encrypted IV with the secret to transmit

How to create the initial vector:

|  Mode      |                             0-7 |                        8-9 |           10-11 |          12-15 |
| :--------: | :-----------------------------: | :------------------------: | :-------------: | :------------: |
| **1-way**  | First 8 data bytes of the frame | Checksum of the whole data | Sequence number | Padding (0x55) |
| **2-ways** | First 8 data bytes of the frame | Checksum of the whole data | Challenge sent beforehand        |

If the data frame is less than 8 bytes, it is also padded with 0x55.

The checksum is computed the following way for each frame byte (Python, return value is a tuple of byte 0 and byte 1 of the checksum, initialization values are 0 for both bytes):

```python
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

Check the initial value generation function for better understanding of how to use the checksum function.

For example, for the following frame:

```
f6 00 00003f 385762 000143d2000000 0599 123456789abc 5fb0
```

Where data = 000143d2000000 and sequence number = 0x0599.

The initial vector will be:
```
000143d2000000550500059955555555
```

In 2-way mode, for the following exchange:

```
480012195fd35c18 31 28e3 // Ask challenge
0e00d35c1812195f 3c 123456789abc a9c7 // Challenge request
```

The initial vector will be:

```
31555555555555550062123456789abc
```

Encryption with AES-128 follows the below course:

* IV is generated as described above
* IV is encrypted using AES-128 and either the transfer key or the stack key (depending on the use case)
* If encrypting a secret, the secret is xored with the output of the previous step. If creating a MAC, the output of the previous step is truncated to 6 bytes.

### Key exchange process

#### 1-Way

In 1-way mode, the controller will send several times the command 0x30 with its key encrypted with the transfer key listed above and an initial value that consists in its address repeated several times to build a 16-byte long value.

For node with address `abcdef`, the initial value will be:

```
abcdefabcdefabcdefabcdefabcdefab
```

Furthermore, the 0x30 message is authenticated using a 1-way MAC embedded in the command itself. For the node `abcdef` with key `01020304050607080910111213141516` and sequence number 0x1234 the 0x30 message will be:

```
fc 00 00003f abcdef 30 7e60491f976adf653db0ed785e49a201 02 01 1234 19e81ec43d5e 9bf2
```

#### 2-Way

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

Example (device key is `abcdef01020304050607080910111213`):

```
// Controller ask for key transfer using challenge 123456789abc
4e 04 feefee f00f00 38 123456789abc 23b6
// Device creates an initial value based on last frame and the specified challenge
// and use this initial value to encrypt its key before transmission
18 04 f00f00 feefee 32 ea425a7a182885d4eaeefd416d625e01 6379
// Controller challenges the device for command 0x32 (see authentication below)
// Note: in real life, challenge will be different to the one specified in 0x38
0e 00 feefee f00f00 3c 123456789abc 5eb1
4e 00 feefee f00f00 3c 123456789abc ec2a
// Device creates an initial value based on the 0x32 frame and challenge specified in 0x3c
// It will use its own key to authenticate as it has not received one from the controller
8e 00 f00f00 feefee 3d 0ae519a73c99 2400
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

```
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

#### 1-Way

In 1-way mode, a signature of the frame is made using the stack key burned into the 1-way controller during manufacturing. This signature is appended to the frame along with a sequence number to prevent replay attacks.

The data and sequence number are handled separately in the initial vector generation (i.e. the sequence number is not handled as frame data and not taken into account in the first part of the IV).

#### 2-Way

In 2-way mode, a node will issue a 0x3C command frame with a 6-byte long challenge to commands received from other nodes. The asking node must provide a 0x3D command with the answer to the 6-byte long challenge (the answer is also 6-byte long). 2-way frames do not have any MAC or sequence number incorporated in the frame itself.

For example, here is a 2-way sequence of request/answer type:

```
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
