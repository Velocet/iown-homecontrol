# IoHomecontrold -

This document is the entry point for understanding and navigating through the IoHc daemon (IoHomecontrold) files. To understand these files the tl;dr is:

The backbone of the iohomeCTRL gateway (TaHoma, Cozytouch, etc.) is a LUAjit daemon receiving packets from the MCU responsible for parsing/sending the radio signal. The MCU can work on its own but more advanced functionality is handled with the help of this daemon. Other daemons also provide the local API many open source projects rely on.

Since the daemons are written i LUAjit it is possible to decompile them. With this whole system comes a SQLite database with all devices and how to use them. Only one of the basic commands is really responsible for triggering device actions. Because of this the parameter list for this command is HUGE. Different datatypes, functions, device specifics, etc... everything is dealt with.

## Folder Structure

```
  .
  ├── Internald            <-- internal daemon
  ├── IoHomecontrolOVPd    <-- iohomeCTRL shared daemon (with OVP support)
  ├── IoHomecontrold       <-- iohomeCTRL daemon
  ├── OVPd                 <-- OVP daemon (only for reference. not needed)
  └── database             <-- iohomeCTRL device database to be used as device lookup
      └── JSON             <-- iohomeCTRL device database tables exported as JSON
```

Combined with the database and the firmware these sources are absolute essential when researching, undstanding and implementing devices.

## LuaJIT

Normally each deamon resides in is it's own file with some additional support files.. The LUAjit inside is nested which means you need to first extract and then decompile it. Because of size restraints every module got it's own file. There is a LOT of stuff to cover.

> [!NOTE]
> There are not normally ~500 io-homecontrol files on a KizOS (TaHoma/Cozytouch/etc.) installation. But this was the best und easiest way to spread this information.

- io-homecontrold: The ioHome lua daemon
  - Thi
- internald: The internal Overkiz daemon
- lib: The Overkiz library glueing it all together

## History

After trying every LuaJIT decompiler out there i was happy with the files i had. They had at least some information in it.
