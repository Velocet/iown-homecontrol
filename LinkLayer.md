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

̀`00 00 3f` is broadcast

### Sender address

Addresses are 3 bytes long.

## Command ID

Standard io-homecontrol command id. See [Commands](Commands.md) for command id reference.

## Data

Depending on the frame type it can correspond to raw data, io-homecontrol command parameters or manufacturer-specific data.

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
