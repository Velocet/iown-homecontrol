# io-homecontrol Decompiled LUAjit Sources

For the first time this structure holds a complete decompiled package of the system running on the KizOS devices.

Combined with the database and the firmware these sources are absolute essential when doing research, implementing new devices or just looking for information.

... more to come. Need some sleep ;>

Normally each deamon is it's own file. The LUAjit inside is nested which means you need to first extract and then decompile it. Because of size restraints every module got it's own file. There is a LOT of stuff to cover.

> [!NOTE]
> There are not normally ~500 io-homecontrol files on a KizOS (TaHoma/Cozytouch/etc.) installation. But this was the best und easiest way to spread this information.

- io-homecontrold: The ioHome lua daemon
  - Thi
- internald: The internal Overkiz daemon
- lib: The Overkiz library glueing it all together