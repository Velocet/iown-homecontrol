# Somfy Set&Go io

## Emulator

### [Original post by ennergei](https://community.openhab.org/t/io-homecontrol-velux-somethings-in-the-bush/11413/223)

> Hi,
>
> Is anyone still interested in the protocol used by Set&Go io? I reverse engineered the encryption. It is AES-128 encrypted with a custom block mode and padding scheme. The key for incoming and outgoing packages is the same, but the supposedly random iv used for the incoming messages seems to always be the same (a bug/poor “random” generator?). I can decrypt the messages from the logs in earlier threads and find strings such as the names and serial numbers and 16-byte keys that are likely the device/system keys. The decrypted packets also contain a CRC-16 with polynomial 8408. I wrote a small emulator to demonstrate it and uploaded it here: https://www.dropbox.com/s/laal9ylyj2n6lxe/set_go_emu.zip?dl=1
>
> The sample data is from the packet logs posted long ago by [leutholl and others](https://groups.google.com/forum/#!category-topic/openhab/AinJdyyDtG0). I was reading through their old topic on reverse engineering the protocol and felt like giving it a try. I am actually considering to buy screens and was looking for information on whether to get the RTS or io motor. I do not actually own any io devices nor the set&go mouse at the moment, so I cannot test it with actual hardware. Instead, I wrote an emulator that makes set&go io think a device is connected. To that end, I injected a .dll (VS2019) into the executable that bypasses the USB detection and reports that a device is connected on COM3. Then I wrote a Python (3.8) script to communicate on COM4 and used com0com to pipe one to the other. Now Set&Go thinks a device is connected. It finds 4 io devices from leutholl’s logs, and one made-up device that seems to show a bit more UI. I don’t get many settings to change (I thought that was the purpose of the set&go?) but maybe that is due to the devices that were used for the original logs.
>
> I do not know much about the content of the messages, except that it seems to be organized in sessions and that most messages contain some kind of optional sub messages. Not all messages seem to follow this format however, this is specific to the message type.
>
> I also had a look at the firmware. The firmware was embedded in the executable as a Qt resource. It is actually stored as 950 pre-generated and pre-encrypted protocol messages of 550 bytes, each encrypted with the same key as before. I decrypted the messages and concatenated them to get a raw firmware dump (950*512 bytes), but I do not know what instruction set is used. It looks like it is big-endian judging from a few address offsets in the beginning of the file, but that could be misleading. I can find the encryption key bytes, the firmware version, and a few text strings in the firmware image, so the dump itself looks good. From the message headers I deduced that the firmware is likely written at address 0x80008000. I’d be interested in hearing if someone knows what instruction set it is or can make any sense of it.
>
> I did this mostly for fun, as the original topic was interesting to read and felt like a challenge. Even though quite a few years have passed, I hope it is useful to someone who wants to reverse it further. It should not be too hard to get it to a usable state if you have the corresponding hardware. :wink:
>
> Regards

### Original Readme

- aes.py is a modified version of an existing aes implementation by [Bo Zhu](http://about.bozhu.me). The block mode and padding scheme used by Somfy io is nonstandard.
- test.py is a script to test the encryption and to decrypt packages in batch
- emu.py is an emulator that pretends to be a Somfy Set&Go device, it implements the most basic messages, mostly those that were available in packet logs online (in particular here: [what's the status of io-homecontrol (velux)](https://groups.google.com/forum/#!category-topic/openhab/AinJdyyDtG0)).
- The .exe is only modified to include the Set_Go_io_emu.dll in its import section, so that the dll gets loaded.
- The dll source is included in the .cpp directory. It bypasses the USB device detection and dictates that the device is available on the COM3 port on startup. Reconnection is not supported. The source is quite messy as it reproduces the Qt types to avoid a full dependency on Qt, but it gets the job done.
- packet_types.txt contains most likely the full list of session id's used by the set&go software and a few notes on the protocol.
- qt_type_info.txt is added for reference and contains extract Qt typeinfo, showing for example the classes, signals and slots used by Set&Go.
- The firmware directory contains the encrypted firmware as extracted from the Qt embedded resource and the decrypted version. I don't know the instruction set used.

### How To run the emulator

- install Set&Go 4.3.1.1 (even minor other versions will not work!)
- place the Set_Go_io_emu.dll & .exe next to the original executables.
- install com0com and pair the COM3 and COM4 ports.
- Run the Python emu.py script (I use python 3.8) (e.g. python emulator.py from the command line).
- run Set_Go_io_emu.exe

## Sniffed Data

9A00721E3EE29A7BF1B4A6086C1452EB <> 1E72009A7B9AE23E08A6B4F1EB52146C
StackKey=E994BACFE6BED7667630EAE475BAAE95

## Word Document

| Software        | Hardware        |
| :-------------: | :-------------: |
| ``5102404A035`` | ``5067501A003`` |

PC -> SOMFY (WRITE) / SOMFY -> PC (READ)

- `0204FA`
- `4305FFB9`
  > (NOTE: Only after first connection)

- PC -> SOMFY (WRITE) / SOMFY -> PC (READ)
  - `C0 PI LE CMD  SESS DATA C0`
  - `C0 00 25 0100 0006 A9F6 5100A64A070C31F03FF0C3E060EA5F8F6EB360FA85C265443643EF6 777 C0`
  - `0006A9F65100A64A070C31F03FF0C3E060EA5F8F6EB360FA85C26544364 3EF6`
  - `C0 00 95 0100 0004 6FF8 7F480750F7A0E78EBD2675BE4D 96F232596E9BDC25351ED400EB25C209BF25862FC6B53525BE033C125D69249770669ACCE678CAB4CEEE2CE33D069B4A9D09E177051AB1BF37058361E77EE8F947BB53DD0E7A22A8DEE14260F4E63172FBF144177FFD0D9DC88134CE7045EB349D09E177051AB1BF37058361E77EE8079D09E177051AB1BF3705C2E04DD442ADC0`

- PC -> SOMFY (WRITE) / SOMFY -> PC (READ)
  - `C0 00 25 0100 000C 0FED BB15374EF96973C48982F8474F 1E41889E19290743437893A24F00F6C2 C0`
  - `C0 00 25 0100 000B 6FF8 7F480750F7A0E78EBD2675BE4D EFFE582D5E9158774735047A431D46F3 C0`

- PC -> SOMFY (WRITE) / SOMFY -> PC (READ)
  - `C0 00 25 0100 000C C9C9 8B67C350E592658282BC2AB96B A59D2DFE5A939325FB67AC5E9B539EE0 C0`
  - `C0 00 25 0100 000B 6FF8 7F480750F7A0E78EBD2675BE4D EF1E5BF65C9158774735047A431D46F3 C0`

**Roller Shutter Discovery**

- PC -> SOMFY (Replay: Never Accepted) / SOMFY -> PC (READ)
  - `C0 00 35 0100 000F 6D86 982532800DFAFF70717CA856E9 DBFF13728DB93D5AA4DBB38D626B760AEB22E037CB8D4FB5815B9A8963E26CBF C0`
  - `C0 00 25 0100 000B 6FF8 7F480750F7A0E78EBD2675BE4D EFF85B4B159158774735047A431D46F3 C0`<br>
  - `C0 00 25 0100 0006 6FF8 7F480750F7A0E78EBD2675BE4D D41FC640291B86813C0719CF46A77500 C0`

- PC -> SOMFY (WRITE) - Replay: Always Accepted
  - `C0 00 25 0100 000B 3EDA 678B6B561C499D93D81BF18732 921617BE18E4B56E4849ABF674A99EB3 C0`
