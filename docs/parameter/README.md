---
title: iown - Command Parameter Database
description: io-homecontrol command parameter database.
icon: material/radio-tower
---

# io-homecontrol Command Parameter

This document is the entry point for understanding and navigating through the ioHC command parameter and is divided into two main sections:

- [Command Parameter Database](#command-parameter-database)
- [io-homecontrol daemon](#io-homecontrol-daemon)

## Folder Structure

``` ascii
  ├── Internald            <-- Gateway daemon
  ├── IoHomecontrolOVPd    <-- ioHC shared daemon (with OVP support)
  ├── IoHomecontrold       <-- ioHC daemon
  ├── OVPd                 <-- Overkiz daemon (only for reference. not needed)
  └── database             <-- ioHC database to be used as device lookup
      └── JSON             <-- ioHC database exported as JSON
```

> **Combined with the database and firmware this is essential when researching, understanding and implementing devices.**

---

## Command Parameter Database

Please use the [Parameter Viewer](https://velocet.github.io/iown-homecontrol/parameter/database/) from the documentation or download and open [iohomecontrol.sqlite](database/iohomecontrol.sqlite) locally.

You can also use one of the other two formats:

- [Excel file](database/iohomecontrol.xlsx) with each table as seperate sheet
- [JSON files](https://github.com/Velocet/iown-homecontrol/tree/main/docs/parameter/database/JSON) with each table exported as seperate file

## io-homecontrol daemon

The parameter folder not only contains the database but also the decompiled io-homecontrol daemon LuaJIT files. To understand these files (eg. `IoHomecontrold`) the tl;dr is:

The backbone of the ioHC gateway (TaHoma, Cozytouch, etc.) is a LuaJIT daemon receiving packets from the MCU responsible for parsing/sending the radio signal.
The MCU can work on its own but more advanced functionality (parsing/interpretation) is handled with the help of this daemon. Other daemons also provide the local API many open source projects rely on.

Since the daemons are written in LuaJIT it is possible to decompile them. With this whole system comes a SQLite database with all devices and how to use them.
Only one of the basic commands is really responsible for triggering device actions. Because of this the parameter list for this command is HUGE. Different data types, functions, device specifics, etc... everything is dealt with.

But wait! There is more! Each *Set & Go io* comes with it's own set of XML files. Each XML file is for a specific device and holds the (officially) available command parameter this device supports.

> [!CAUTION]
> Help Wanted: Extracion of the *Set & Go io* files is still not fully done. If you know how to extract those files (old qt app) get in contact!

### LuaJIT

Normally each deamon resides in is it's own file with additional support files. The LuaJIT inside the daemons is nested which means you need to first extract each nested LuaJIT from the decompiled daemon and then decompile it afterwards again.

Because of size restraints every module got it's own file. There is a LOT of stuff to cover.

> [!NOTE]
> There are not normally ~500 io-homecontrol files on a KizOS (TaHoma/Cozytouch/etc.) installation. But this was the best und easiest way to spread this information.

<!-- TODO fix
- io-homecontrold: The ioHome lua daemon
  - Thi
- internald: The internal Overkiz daemon
- lib: The Overkiz library glueing it all together

## History

After trying every LuaJIT decompiler out there i was happy with the files i had. They had at least some information in it.
-->
