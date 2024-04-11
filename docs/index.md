---
hide:
  - navigation
  - toc
  - path
---
#

![iown-homecontrol logo](assets/repository-open-graph.png)

[![Join the iown-homecontrol Telegram Group](https://img.shields.io/badge/Telegram-Join-5865F2?style=for-the-badge&logo=telegram)](https://t.me/iownHomecontrol) [![Join the iown-homecontrol Discord Server](https://img.shields.io/badge/Discord-Join-5865F2?style=for-the-badge&logo=discord)](https://discord.gg/MPEb7dTNdN)
---

You will find the protocol documentation in the header.

Other interesting pieces were also found on this long journey. Feel free to travel around and have a look at all the private keys that got extracted...

## Misc

* [Devices](devices.md) Devices - A list containing mostly Somfy/Velux hardware
* [QEMU Emulation](emulation-qemu-static.md) - Notes on how to simply run KizOS images via *chroot*
* [Firmware](firmware.md) - STM32 ioHome Cozytouch Firmware Notes
* KizOS - Custom Linux from Overkiz for Customers like Somfy
  * [KizOS Images](kizos_images.md) - Unsorted Notes
  * [KizOS Linux](kizos_linux.md) - Unsorted Notes...
  * [KizOS RE](kizos_re.md) - Even more unsorted notes...
* [MicroPython](MicroPython.md) - Tests for a rapid testing framework based on MicroPython
  * It is doable but only with a SX1276
* [Atlantic Thermor 2W Commands](ThermorAtlantic_2W_Commands.md) - Sniffed Protocol info for Heater

## Project Layout

```
    renode    # ioHome STM32 Emulation!!! (Thanks Pascal!)
    scripts   # Random scripts and code snippets
```
