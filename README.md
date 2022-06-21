# io-homecontrol

This project should document every bit of information about io-homecontrol and make it a freely available protocol for everyone to use. Matter is right around the corner and still there are some companies that insist on using this proprietary crapload. It seems that at least Velux knows how shitty io-homecontrol is cause they are the only once who have implemented their own "KizBox".

I want no extra box sitting around and waiting to catch fire. I want to run io-homecontrol with a 1€ SDR plugged in the back of my server.

Goal:
- Freely available documentation of the io-homecontrol protocol
- Freely available and portable library to implement io-homecontrol on every MCU/SoC thats out there
- Freely available and portable high level API

Open Points:
- Layer 1/Layer 2 > See Patents
- Layer 3 and higher

Testing needed:
- Possible to flash Velux/Somfy firmware onto Ikea remotes?


## Basic Information

There is a low level lib thats accessable to members of the io-homecontrol board.

### Layer 3
CRC, Preamble, Start Byte insertion/check
UART data encoding as per io-homecontrol

### Layer 1/2

Channel 1: 868.25 MHz
Channel 2: 868.95 MHz
Channel 3: 869.85 MHz
Modes: Master, Slave, Beacon



### Other tidbits

Older versions of the Velux blinds could be configured to bypass the io homecontrol features to allow direct control of the motors. I had planned to use Hunter Douglas DBMZ Z-Wave controllers to drive the blinds. However, the blinds I purchased (Velux FMK 24 Volt) had the bypass feature removed, so I am left with blinds that don’t work.

## Links

### TaHoma:
https://github.com/Aldohrs/tahoma-jailbreak

### OverKiz
https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/at91-kizbox.dts

### Online Discussions

https://github.com/merbanan/rtl_433/issues/1376
https://community.openhab.org/t/io-homecontrol-velux-somethings-in-the-bush/11413

## Official Hardware and Vendors

