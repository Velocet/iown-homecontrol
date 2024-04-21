# Box PIN Mapping: PINs to Devices

Mostly complete list of Overkiz Box Types and their Sub Types, Protocols and mDNS names as RegEx.

- Abbreviations
  - OGP: Online Gateway Protocol
  - OVP: Overkiz Protocol
  - IO: io-homecontrol
  - RTD(S)/RTN/RTW: RTS Protocol derivates

- Protocol Lists
  - All: Aurora, Axis, Cam, EnOcean, IO, Jaga, KNX, ModBus, OGP, OVP, ProfaLux 868, Ramses, RTD(S), RTN, RTS, RTW, Sauter, Wavenis, WmBus, xComfort, Yokis, ZigBee, zWave
  - Std: Aurora, Cam, EnOcean, IO, KNX, ModBus, OVP, Ramses, RTx, Sauter, WmBus, Yokis, zWave
    - Std 1 = Std + OGP, ProfaLux 868, RTN, xComfort, ZigBee
    - Std 2 = Std + Axis, Jaga, Wavenis
    - Std 3 = Cam, EnOcean, IO, KNX, ModBus, OVP, Ramses, ZigBee, zWave

| #   | SYS | TYPE                                | SUB TYPE        | REGEX                    | PROTOCOLS                                        |
| --: | :-: | :---------------------------------- | :-------------- | :----------------------: | :----------------------------------------------- |
| 000  |     | KizBoxV1Virtual                     |                 | `^VIRT-\d{3}$`           | See All                                          |
| 001  |     | Linkki                              |                 | `^LINKI(-\d{4}){3}$`     | IO, RTS                                          |
| 002  |     | KizBoxV1                            |                 | `^02\d{2}(-\d{4}){2}$`   | See Std 2                                       |
| 003  |     | VITTYMediaBusController             |                 |                          | MediaBus                                         |
| 006  |     | **STM32**                           |                 | `^STP\d{5}$`             | META                                             |
| 007  |     | SomfyBox                            |                 | `^02\d{2}(-\d{4}){2}$`   | See Std 2                                       |
| 008  |     | TahomaLiberty                       |                 | `^02\d{2}(-\d{4}){2}$`   | See Std 2                                       |
| 009  |     | ZenBoxControl                       |                 | `^023\d(-\d{4}){2}$`     | See Std 2                                       |
| 010 |     | BDRThermeaBox                       |                 | `^024\d(-\d{4}){2}$`     | See Std 2                                       |
| 011 |     | JagaBox                             |                 | `^02\d{2}(-\d{4}){2}$`   | Jaga                                             |
| 012 |     | EEBusGateway                        |                 | `^EEBUS*`                | EEBus                                            |
| 013 |     | ZenBoxMonitoring                    |                 | `^023\d(-\d{4}){2}$`     | Cam, EnOcean, IO, OVP, Ramses, RTx, WmBus, zWave |
| 014 |     | KizBoxTCPEAP                        |                 | `^02\d{2}(-\d{4}){2}$`   | See Std 2                                       |
| 015 |     | Tahoma                              |                 | `^02\d{2}(-\d{4}){2}$`   | See Std 2                                       |
| 015 |     | Tahoma                              | BASIC                        | `^02(00|01)(-\d{4}){2}$`    | See Std 2 |
| 015 |     | Tahoma                              | BASIC_PLUS                   | `^02(01|02)(-\d{4}){2}$`    | See Std 2 |
| 015 |     | Tahoma                              | HITACHI_BOX                  | `^02(04|05)(-\d{4}){2}$`    | See Std 2 |
| 015 |     | Tahoma                              | MAROC_TELECOM                | `^02(06|07)(-\d{4}){2}$`    | See Std 2 |
| 015 |     | Tahoma                              | MONDIAL_ASSISTANCE           | `^02(05|06)(-\d{4}){2}$`    | See Std 2 |
| 015 |     | Tahoma                              | PREMIUM                      | `^02(02|03)(-\d{4}){2}$`    | See Std 2 |
| 015 |     | Tahoma                              | PRO                          | `^02(09|14)(-\d{4}){2}$`    | See Std 2 |
| 015 |     | Tahoma                              | SECURITY_PRO                 | `^02(11|16)(-\d{4}){2}$`    | See Std 2 |
| 015 |     | Tahoma                              | SECURITY_SHORT_CHANNEL       | `^02(10|15)(-\d{4}){2}$`    | See Std 2 |
| 015 |     | Tahoma                              | SHORT_CHANNEL                | `^02(08|13)(-\d{4}){2}$`    | See Std 2 |
| 015 |     | Tahoma                              | SOMFY_BOX                    | `^02(03|04)(-\d{4}){2}$`    | See Std 2 |
| 015 |     | Tahoma                              | SOMFY_BOX_OLD                | `^02(15|102)(-\d{4}){2}$`   | See Std 2 |
| 015 |     | Tahoma                              | TAHOMA                       | `^02(13|100)(-\d{4}){2}$`   | See Std 2 |
| 015 |     | Tahoma                              | TAHOMA_LIBERTY               | `^02(14|101)(-\d{4}){2}$`   | See Std 2 |
| 015 |     | Tahoma                              | TRYBA                        | `^02(12|17)(-\d{4}){2}$`    | See Std 2 |
| 015 |     | Tahoma                              | Verisure                     | `^02(07|09)(-\d{4}){2}$`    | See Std 2 |
| 016 |     | KizBoxLC                            |                 | `^KLC\d{5}$`             | No Info                                          |
| 017 |     | KizBoxTCPAP                         |                 | `^T-02\d{2}(-\d{4}){2}$` | See Std 2                                       |
| 018 |     | TahomaHitachi                       |                 | `^02\d{2}(-\d{4}){2}$`   | See Std 2                                       |
| 019 |     | RexelEnergeasyConnect               |                 | `^02\d{2}(-\d{4}){2}$`   | See Std 2                                       |
| 020 | X   | VerisureAlarmSystem                 |                 | `^VSURE-\d{2}-*`         | Verisure                                         |
| 021 |     | KizBoxMini433Mhz                    |                 | `^04\d{2}(-\d{4}){2}$`   | Cam, EnOcean, KNX, Ramses, RTx, ZigBee, zWave    |
| 022 |     | HitachiHLinkWifiGateway             |                 | `^05\d{2}(-\d{4}){2}$`   | HLRR WiFi                                        |
| 023 |     | SWFHomeAutomationBridge             |                 | `^06\d{2}(-\d{4}){2}$`   | IO SWF                                           |
| 024 |     | KizBoxV2                            |                 | `^11\d{2}(-\d{4}){2}$`   | Cam, KNX, RTx, zWave                             |
| 025 | X   | MyFoxAlarmSystem                    |                 | `^MYFOX-*`               | MyFox                                            |
| 026 |     | Atlantic                            |                 | `^02\d{2}(-\d{4}){2}$`   | See Std 2                                       |
| 027 |     | KizBoxMiniWmBus                     |                 | `^07\d{2}(-\d{4}){2}$`   | Cam, EnOcean, KNX, Ramses, WmBus, zWave          |
| 028 |     | KizBoxMiniIO                        |                 | `^08\d{2}(-\d{4}){2}$`   | See Std 3                                       |
| 029 |     | TahomaV2                            |                 | `^12\d{2}(-\d{4}){2}$`   | See Std 1                                       |
| 029 |     | TahomaV2                            | BASIC                        | `^12(00|01)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | BASIC_PLUS                   | `^12(01|02)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | HITACHI                      | `^12(04|05)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | MAISON_AVENIR_TRADITION      | `^12(11|12)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | MAROC_TELECOM                | `^12(06|07)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | MONDIAL_ASSISTANCE           | `^12(05|06)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | MONSIEUR_STORE               | `^12(10|11)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | PREMIUM                      | `^12(02|03)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | PRO                          | `^12(13|14)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | RATIONEL                     | `^12(19|20)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | SECURITY_PRO                 | `^12(15|16)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | SECURITY_SHORT_CHANNEL       | `^12(14|15)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | SERENITY                     | `^12(07|08)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | SERENITY_PREMIUM             | `^12(09|10)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | SHORT_CHANNEL                | `^12(12|13)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | SOMFY_BOX                    | `^12(03|04)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | TRYBA                        | `^12(16|17)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | VELFAC                       | `^12(18|19)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | Verisure                     | `^12(08|09)(-\d{4}){2}$`    | See Std 1 |
| 029 |     | TahomaV2                            | WHITE_LABEL                  | `^12(17|18)(-\d{4}){2}$`    | See Std 1 |
| 030 |     | KizBoxV23Head                       |                 | `^13\d{2}(-\d{4}){2}$`   | See Std 1                                       |
| 031 |     | KizBoxV22Head                       |                 | `^12\d{2}(-\d{4}){2}$`   | See Std 1                                       |
| 032 |     | AtlanticCozyTouch                   |                 | `^08\d{2}(-\d{4}){2}$`   | See Std 3                                       |
| 033 | X   | DomisHomeSecureAlarmSystem          |                 | `^50\d{2}(-\d{4}){2}$`   | Home Secure                                      |
| 034 |     | Connexoon                           |                 | `^08\d{2}(-\d{4}){2}$`   | See Std 3 + OGP                                 |
| 034 |     | Connexoon                           | MARKILUX                     | `^08(05|06)(-\d{4}){2}$`    | See Std 3 + OGP |
| 034 |     | Connexoon                           | PRO                          | `^08(01|02)(-\d{4}){2}$`    | See Std 3 + OGP |
| 034 |     | Connexoon                           | PRO_ACCESS                   | `^08(04|05)(-\d{4}){2}$`    | See Std 3 + OGP |
| 034 |     | Connexoon                           | PRO_TERRACE                  | `^08(03|04)(-\d{4}){2}$`    | See Std 3 + OGP |
| 034 |     | Connexoon                           | PRO_WINDOW                   | `^08(02|03)(-\d{4}){2}$`    | See Std 3 + OGP |
| 034 |     | Connexoon                           | ROMA_WINDOW                  | `^08(06|07)(-\d{4}){2}$`    | See Std 3 + OGP |
| 034 |     | Connexoon                           | SELT_TWO_UNIVERSES           | `^08(08|09)(-\d{4}){2}$`    | See Std 3 + OGP |
| 034 |     | Connexoon                           | TAHOMA_BOX                   | `^08(11|12)(-\d{4}){2}$`    | See Std 3 + OGP |
| 034 |     | Connexoon                           | TWO_UNIVERSES                | `^08(00|01)(-\d{4}){2}$`    | See Std 3 + OGP |
| 034 |     | Connexoon                           | TWO_UNIVERSES_2              | `^08(09|10)(-\d{4}){2}$`    | See Std 3 + OGP |
| 034 |     | Connexoon                           | TWO_UNIVERSES_3              | `^08(10|11)(-\d{4}){2}$`    | See Std 3 + OGP |
| 034 |     | Connexoon                           | WILSNIOWSKI_ACCESS           | `^08(07|08)(-\d{4}){2}$`    | See Std 3 + OGP |
| 035 | X   | JSWVideoSystem                      |                 | `^JSW(-\d{4}){3}$`       | JSW                                              |
| 036 |     | CotherniVista                       |                 | `^08\d{2}(-\d{4}){2}$`   | See Std 3                                       |
| 037 |     | KizBoxMiniDaughterboardIO           |                 | `^09\d{2}(-\d{4}){2}$`   | IO, OVP                                          |
| 038 |     | KizBoxMiniDaughterboardZWave        |                 | `^09\d{2}(-\d{4}){2}$`   | zWave                                            |
| 039 |     | KizBoxMiniDaughterboardEnOcean      |                 | `^09\d{2}(-\d{4}){2}$`   | EnOcean                                          |
| 040 |     | KizBoxRailDin                       |                 | `^10\d{2}(-\d{4}){2}$`   | See Std 1                                       |
| 041 |     | TahomaV2RTS                         |                 | `^10\d{2}(-\d{4}){2}$`   | Cam, KNX, OGP, RTx, zWave                        |
| 041 |     | TahomaV2RTS                         | BASIC                        | `^10(00|02)(-\d{4}){2}$`    | Cam, KNX, OGP, RTx, zWave |
| 041 |     | TahomaV2RTS                         | MAROC_TELECOM                | `^10(02|07)(-\d{4}){2}$`    | Cam, KNX, OGP, RTx, zWave |
| 041 |     | TahomaV2RTS                         | PREMIUM                      | `^10(01|03)(-\d{4}){2}$`    | Cam, KNX, OGP, RTx, zWave |
| 041 |     | TahomaV2RTS                         | PRO                          | `^10(06|14)(-\d{4}){2}$`    | Cam, KNX, OGP, RTx, zWave |
| 041 |     | TahomaV2RTS                         | SECURITY_PRO                 | `^10(08|16)(-\d{4}){2}$`    | Cam, KNX, OGP, RTx, zWave |
| 041 |     | TahomaV2RTS                         | SECURITY_SHORT_CHANNEL       | `^10(07|15)(-\d{4}){2}$`    | Cam, KNX, OGP, RTx, zWave |
| 041 |     | TahomaV2RTS                         | SERENITY                     | `^10(03|08)(-\d{4}){2}$`    | Cam, KNX, OGP, RTx, zWave |
| 041 |     | TahomaV2RTS                         | SERENITY_PREMIUM             | `^10(04|10)(-\d{4}){2}$`    | Cam, KNX, OGP, RTx, zWave |
| 041 |     | TahomaV2RTS                         | SHORT_CHANNEL                | `^10(05|13)(-\d{4}){2}$`    | Cam, KNX, OGP, RTx, zWave |
| 041 |     | TahomaV2RTS                         | TRYBA                        | `^10(09|17)(-\d{4}){2}$`    | Cam, KNX, OGP, RTx, zWave |
| 041 |     | TahomaV2RTS                         | WHITE_LABEL                  | `^10(10|18)(-\d{4}){2}$`    | Cam, KNX, OGP, RTx, zWave |
| 042 |     | KizBoxMiniModbus                    |                 | `^08\d{2}(-\d{4}){2}$`   | ModBus, OVP                                      |
| 043 |     | KizBoxMiniOVP                       |                 | `^08\d{2}(-\d{4}){2}$`   | OVP                                              |
| 044 |     | HitachiHiBox                        |                 | `^08\d{2}(-\d{4}){2}$`   | ModBus, OVP                                      |
| 045 |     | DeDietrichInternetModuleV2          |                 | `^08\d{2}(-\d{4}){2}$`   | OVP                                              |
| 046 |     | VertuozMDBEnOcean                   |                 | `^09\d{2}(-\d{4}){2}$`   | EnOcean                                          |
| 047 |     | BouyguesImmobilierFlexomRailDIN     |                 | `^10\d{2}(-\d{4}){2}$`   | See Std 1                                       |
| 048 |     | RexelEnergeasyConnectMiniBoxRailDIN |                 | `^08\d{2}(-\d{4}){2}$`   | See Std 1                                       |
| 049 |     | KizBoxMiniIdealRF                   |                 | `^08\d{2}(-\d{4}){2}$`   | IdealRF                                          |
| 050 |     | FlaktwoodsCuro                      |                 | `^08\d{2}(-\d{4}){2}$`   | ModBus, OVP                                      |
| 051 |     | ComapMiniDaughterBoardZWave         |                 | `^09\d{2}(-\d{4}){2}$`   | Sauter, zWave                                    |
| 052 |     | MyUbiwizzUbiboxRailDIN              |                 | `^10\d{2}(-\d{4}){2}$`   | See Std 1                                       |
| 053 |     | ConnexoonRTS                        |                 | `^04\d{2}(-\d{4}){2}$`   | Cam, EnOcean, KNX, Ramses, RTx, ZigBee, zWave    |
| 053 |     | ConnexoonRTS                        | POLARGOS_ACCESS              | `^04(02|03)(-\d{4}){2}$`    | Cam, EnOcean, KNX, Ramses, RTx, ZigBee, zWave |
| 053 |     | ConnexoonRTS                        | RTS_ACCESS                   | `^04(01|02)(-\d{4}){2}$`    | Cam, EnOcean, KNX, Ramses, RTx, ZigBee, zWave |
| 053 |     | ConnexoonRTS                        | RTS_DEFAULT                  | `^04(03|04)(-\d{4}){2}$`    | Cam, EnOcean, KNX, Ramses, RTx, ZigBee, zWave |
| 053 |     | ConnexoonRTS                        | RTS_WINDOW                   | `^04(00|01)(-\d{4}){2}$`    | Cam, EnOcean, KNX, Ramses, RTx, ZigBee, zWave |
| 054 | X   | OpenDoorsLockSystem                 |                 | `^08\d{2}(-\d{4}){2}$`   | OpenDoors                                        |
| 055 |     | KizBoxMini426Mhz                    |                 | `^04\d{2}(-\d{4}){2}$`   | Cam, EnOcean, KNX, Ramses, RTS, ZigBee, zWave    |
| 056 |     | ConnexoonRTSJapan                   |                 | `^04\d{2}(-\d{4}){2}$`   | Cam, EnOcean, KNX, Ramses, RTS, ZigBee, zWave    |
| 057 |     | RexelEnergeasyConnectV2             |                 | `^12\d{2}(-\d{4}){2}$`   | See All plus Home Secure                         |
| 058 | X   | SomfyProtectSystem                  |                 | `^SOMFY_PROTEXT-`        | MyFox                                            |
| 059 | X   | VaillantSystem                      |                 | `^VAILLANT-*`            | Vaillant                                         |
| 060 |     | MyUbiwizzUbibox                     |                 | `^09\d{2}(-\d{4}){2}$`   | EnOcean                                          |
| 061 | X   | NetatmoCamerasSystem                |                 | `^Netatmo_CamS-*`        | Netatmo                                          |
| 062 |     | ConnexoonRTSAustralia               |                 | `^04\d{2}(-\d{4}){2}$`   | Cam, EnOcean, KNX, Ramses, RTx, ZigBee, zWave    |
| 063 | X   | SomfyThermostatSystem               |                 | `^SOMFY_THERMOSTAT-`     | Somfy Thermostat (I2G)                           |
| 064 |     | BoxUltraLowCostRTS                  |                 | `^14\d{2}(-\d{4}){2}$`   | RTS                                              |
| 065 |     | SmartlyMiniDaughterBoardZWave       |                 | `^09\d{2}(-\d{4}){2}$`   | zWave                                            |
| 066 |     | SmartlyMiniboxRailDIN               |                 | `^10\d{2}(-\d{4}){2}$`   | See Std 1                                       |
| 067 |     | TahomaBee                           |                 | `^08\d{2}(-\d{4}){2}$`   | RTx, ZigBee                                      |
| 068 | X   | NestSystem                          |                 | `^NEST-*`                | Nest                                             |
| 069 |     | ConnexoonRTN                        |                 | `^08\d{2}(-\d{4}){2}$`   | Cam, EnOcean, KNX, Ramses, RTx, ZigBee, zWave    |
| 070 | X   | UrmetSystem                         |                 | `^URMET-\d{6}$`          | Urmet                                            |
| 071 |     | ModbusWifi                          |                 | `^14\d{2}(-\d{4}){2}$`   | ModBus                                           |
| 072 |     | TahomaRailDIN                       |                 | `^10\d{2}(-\d{4}){2}$`   | See Std 1 - Cam                                 |
| 073 | X   | NetatmoThermostatSystem             |                 | `^NETATMO_THERMOSTATS-*` | Netatmo                                          |
| 074 |     | NexityBySomfyRailDin                |                 | `^10\d{2}(-\d{4}){2}$`   | IO, OVP, zWave                                   |
| 075 |     | TahomaBeecon                        |                 | `^16\d{2}(-\d{4}){2}$`   | RTS, ZigBee                                      |
| 076 |     | Smartkiz                            |                 | `^16\d{2}(-\d{4}){2}$`   | EnOcean, RTS, ZigBee, zWave                      |
| 077 | X   | EliotSystem                         |                 | `^ELIOT-*`               | Eliot                                            |
| 078 |     | SimuBox                             |                 | `^12\d{2}(-\d{4}){2}$`   | See Std 1                                       |
| 079 |     | MyHigginsASA                        |                 | `^04\d{2}(-\d{4}){2}$`   | RTW                                              |
| 080 | X   | BFTSystem                           |                 | `^BFT-*`                 | BFT                                              |
| 081 |     | BFTMiniDaughterBoardZWave           |                 | `^09\d{2}(-\d{4}){2}$`   | zWave                                            |
| 082 |     | HomeSetTommaso                      |                 | `^09\d{2}(-\d{4}){2}$`   | EnOcean                                          |
| 083 |     | AtlanticModbusWifi                  |                 | `^15\d{2}(-\d{4}){2}$`   | ModBus                                           |
| 084 | X   | AristonSystem                       |                 | `^ARISTON-*`             | Ariston                                          |
| 085 |     | RailDINPichet                       |                 | `^10\d{2}(-\d{4}){2}$`   | ZigBee, zWave                                    |
| 086 |     | SiremModbusWifi                     |                 | `^14\d{2}(-\d{4}){2}$`   | ModBus                                           |
| 087 | X   | VaillantV2System                    |                 | `^VAILLANT_V2-*`         | Vaillant                                         |
| 088 | X   | WiserSystem                         |                 | `^WISER-*`               | Wiser                                            |
| 089 | X   | SomfySAVSystem                      |                 | `^SOMFY_SAV-*`           | No Info                                          |
| 090 |     | SmartkizIO                          |                 | `^16\d{2}(-\d{4}){2}$`   | EnOcean, IO, RTS, ZigBee, zWave                  |
| 091 | X   | SauterSVCSystem                     |                 | `^SAUTER_SVC-(.*)-(.*)`  | Sauter SVC                                       |
| 092 | X   | NetatmoSystem                       |                 | `^NETATMO-*`             | Netatmo                                          |
| 093 | X   | MullerByNetatmoSystem               |                 | `^NETATMO_MULLER-.*`     | Netatmo                                          |
| 094 |     | EffiUpMiniEnOcean                   |                 | `^09\d{2}(-\d{4}){2}$`   | EnOcean                                          |
| 095 |     | SmartLivingRailDIN                  |                 | `^10\d{2}(-\d{4}){2}$`   | See Std 1                                       |
| 096 |     | SmartLivingKizBoxV2                 |                 | `^12\d{2}(-\d{4}){2}$`   | See Std 1                                       |
| 097 |     | KizBoxV3                            |                 | `^\d{4}(-\d{4}){2}$`     | IO, OGP, OVP, RTS, ZigBee                        |
| 098 |     | TahomaSwitch                        |                 | `^20\d{2}(-\d{4}){2}$`   | IO, OGP, OVP, RTS, ZigBee                        |
| 098 |     | TahomaSwitch                        | TAHOMA_SWITCH_MONSIEUR_STORE | `^20(00|03)(-\d{4}){2}$`    | IO, OGP, OVP, RTS, ZigBee |
| 099 |     | ConnectivityKit                     | ConnectivityKit              | `^21(01|02)(-\d{4}){2}$`    | OGP |
| 099 |     | ConnectivityKit                     | ConnectivityKit | `^21\d{2}(-\d{4}){2}$`   | OGP                                              |
| 099 |     | ConnectivityKit                     | CRUZE                        | `^21(02|03)(-\d{4}){2}$`    | OGP |
| 099 |     | ConnectivityKit                     | ORANGE                       | `^21(00|01)(-\d{4}){2}$`    | OGP |
| 100 |     | PurePassThoughGateway               |                 | `^17\d{2}(-\d{4}){2}$`   | No Info                                          |
| 101 |     | OGPGenericBox                       |                 |                          | OGP                                              |
| 102 |     | OGPBrandtGateway                    |                 | `^18\d{2}(-\d{4}){2}$`   | OGP                                              |
| 103 | X   | DeDietrichSmartTCSystem             |                 | `^DEDIETRICHSTC-*`       | DeDietrichSTC                                    |
| 104 |     | Wisniowski                          |                 | `^08\d{2}(-\d{4}){2}$`   | IO, UPnP                                         |
| 108 |     | TaHomaV3RailDin                     |                 | `^22\d{2}(-\d{4}){2}$`   | EnOcean, IO, OVP, RTx, ZigBee                    |
| 110 |     | TaHomaV3RailDinRts                  |                 | `^22\d{2}(-\d{4}){2}$`   | RTx, ZigBee                                      |
| 112 |     | AugustSystem                        |                 | `^AUGUST-.*`             | August                                           |

[^1]: The *SYS* column is a gateway differtiation flag: `SYSTEM` or `BOX`. The flags indication is unknown.
