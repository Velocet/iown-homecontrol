# Non io-homecontrol firmware

This folder contains additional firmware files which help to understand the io-homecontrol firmware.

## Ideal RF

A debug/test firmware from Overkiz for the *Ideal* RF protocol. This protocol also uses the 868MHz band and seems to closely resemble ioHC.

Based on *uCOS-II* and *ContikiOS*. Uses the *STM32 Standard Peripheral Library*. Should be possible to parse those header files with *IDA Pro* or *Ghidra*.

<!-- TODO RTS luajit and linux driver -->

## RTx: Somfy RTS and its different versions

While researching KizOS and the ioHC firmware i came across a lot of RTS stuff. And who would have guessed .. it's the same implementation and protocol shit show. Just remember: There is only one RTS protocol ;>

If you encounter the term RTx then it refers to all of the different RT protocols. A firmware is called "all stack" by OVK/Sfy if it supports the RTx protocols.

- Radio Technology Somfy (RTS)
  - RTS U56 (<2006) = Protocol Version 1
  - RTS U80 (>2006) = Protocol Version 2
  - RTA = RTS_AUS = Somfy RTS Australia
  - RTJ = RTS_JP = Somfy RTS Japan
  - RTW = RTS_W = Somfy RTS World
  - RTN = Somfy RTN = Unknown (references IRBlaster)
  - RTD = Domis RTD - Actuator
    - RTDS = Domis RTD - Sensor / Siren
  - RTx Region Defaults US/Canada: Tilt Repeat Number = 4

- Protocol: Somfy RTS U80
  - Maximum RTS Transmitter: 12 (memory or protocol limitation?)
  - Channels: up to 16 channels with "Modes" (each channel has it's own mode):
    - Central Europe (CE) Rolling or Tilting: Modulis or Normal
    - United States (US) Rolling or Tilting: Modulis or Normal
  - Frequency & Modulation: ASK Type A1
    - RTS EMEA 433.42 MHz ±100kHz (433.05 - 434.79 MHz)
    - RTS EMEA 433 MHz WMI (?)
    - RTS US 433 MHz
    - RTS Pacific 409.9875 Mhz - Modulation: FSK
    - RTS EMEA/Pacific 426,0625 MHz ±0,001 - Modulation: FSK
    - RTS EMEA/Pacific 447,7 MHz ±0,001 - Modulation: FSK
    - RTD(S) 433.42 - 433.92 MHz - Modulation: OOK
  - Pluses
    - Train: 139.62 ms (Total)
    - Short (Delimiter) / Mid / Long: 640 us / 2.5 ms / 4.8 ms
    - 12 Pre-Sync (Hardware): Low / High = 2.25 ms / 2.75 ms
    - Sync (Software): High = 4.80 ms
  - Data rate: ~ 1200 baud (data bit = 1.28 ms == 1280 us) > 56 == 71.68 ms
  - Typical Receiver Sensitivity: -103 dBm (with 20 dB SINAD)
  - Circuit Description (Transmitter):
    - The oscillator is a standard Colpitts config using SAW resonator to set the frequency
    - The ASK (on-off) modulation bit pattern comes from a MCU pin
    - Timings are based on software timing from the instruction sequences
    - An EEPROM stores the unique serial number for each module
    - Activation via receipt of carrier command or button press on module/remote

### RTx Frame

- 1 Byte Random
- 1 Byte CKSTR
  - 4 Bit CDE
  - 4 Bit CKS1
- 2 Byte CPT
  - 1 Byte CPTH
  - 1 Byte CPTL
- 3 Byte NodeID
  - 1 Byte NodeID3
  - 1 Byte NodeID2
  - 1 Byte NodeID1
- Additional Info 3 Byte
  - 1 Bit de Relais
  - 23 Bit Autres bits utilisables > 23 bits dont CKS2 (4 Bits)
- Inter-Frame Interval
  - 39 Bit End of Frame (Blank Space)
  - Hardware Sync
  - Software Sync
  - ...

> [RTS Patent](https://patentimages.storage.googleapis.com/e4/d0/e0/54c2b4c16b7eab/EP1696402B1.pdf)

#### NodeID ranges

<div align="center" width="100%">

|  Start   |   End    | Description            |
| :------: | :------: | :--------------------- |
| 00:00:00 | 00:00:00 | GroupCast Mode     |
| 00:00:01 | 00:00:FF | R&D Prototypes         |
| 00:01:00 | FF:FE:FF | **Available for devices**  |
| 00:01:00 | 00:FF:FF | Somfy Master Nodes  |
| 02:00:00 | 02:FF:FF | RS485 DC ST30  |
| 03:00:00 | 03:FF:FF | RS485 MoCo  |
| 04:00:00 | 04:FF:FF | RS485 4ILT Interface  |
| 05:80:00 | 05:FE:FF | RS485 RTS Transmitter  |
| 06:00:00 | 06:FF:FF | RS485 Glydea              |
| 07:00:00 | 07:FF:FF | RS485 AC ST50 (LSU 50)     |
| 08:00:00 | 08:FF:FF | RS485 DC ST50              |
| 09:00:00 | 09:FF:FF | RS485 AC ST40              |
| 0A:00:00 | 0A:FF:FF | RS485 DC ST40              |
| FA:00:00 | FA:FF:FF | IB+ MoCo              |
| FF:FF:00 | FF:FF:FE | 3rd Party Master Node (Non Somfy, use only for Source NodeID)  |
| FF:FF:00 | FF:FF:FE | Crestron control system  |
| FF:FF:FF | FF:FF:FF | BroadCast Mode |

</div>

#### NodeType (AppID)

<div align="center" width="100%">

The NodeType (or AppID) is a built-in 4-bit value to identify the product famil and can be used to send messages to selected products range (see *Addressing Modes*) or to access application-specific messages (see *NodeType Filtering*).

``` ascii title="Node Type"

  ┌───────────────────────────────┐
  │     Node Type - 1 Byte        │
  ├───────────────┬───────────────┤
  │    b7 - b4    │    b3 - b0    │
  ├───────────────┼───────────────┤
  │ SRC Node Type │ END Node Type │
  └───────────────┴───────────────┘

```

| Product          | # |
| :-------------------- | --------: |
| ???                   |       00h |
| ???                   |       01h |
| RS485 DC ST30         |       02h |
| MOCO RS485            |       03h |
| RS485 4ILT interface  |       04h |
| RS485 RTS transmitter |       05h |
| Glydea RS485 |       06h |
| LSU 50 RS485 |       07h |
| IB+ MoCo |       FAh |

</div>

### RTx LuaJIT Functions

Some decompiled RTx functions for all you RTS guys out there still having problems with those different implementations.

#### RTx

``` lua title="RTx-utils.lua"
-- filename: @./RTx-utils.lua

function RTxConstructor()
  defaultTimeBreak                        = 470
  testTimeBreak                           = 5000
  defaultTimeStop                         = 30

  RTxType                                 = {}
  RTxType.type                            = "type"
  RTxType.vendor                          = "vendor"

  RTxVersion                              = {}
  RTxVersion.u56                          = "u56"
  RTxVersion.u80                          = "u80"

  type                                    = {}
  type.RTD                                = "rtd"  -- value unknown
  type.RTDS                               = "rtds" -- value unknown
  type.RTS                                = "rts"  -- value unknown
  type.RTN                                = "rtn"  -- value unknown
  type.RTW                                = "rtw"  -- value unknown

  vendor                                  = {}
  vendor.somfy                            = 2

  baseCommand                             = {}
  baseCommand.command                     = 0
  baseCommand.u80function                 = 2
  baseCommand.u80parameter                = 0

  u80function                             = {}
  u80function["Frame Counter"]            = 0
  u80function.Goto                        = 2
  u80function.MoveOf                      = 3

  u80GotoParameters                       = {}
  u80GotoParameters.up                    = 0
  u80GotoParameters.down                  = 200
  u80GotoParameters.stop                  = 255
  u80GotoParameters.my                    = 201

  commands                                = {}

  commands.up                             = {}
  commands.up.command                     = 2
  commands.up.u80function                 = u80function.Goto
  commands.up.u80parameter                = u80GotoParameters.up

  commands.down                           = {}
  commands.down.command                   = 4
  commands.down.u80function               = u80function.Goto
  commands.down.u80parameter              = u80GotoParameters.down

  commands.stop                           = {}
  commands.stop.command                   = 1
  commands.stop.u80function               = u80function.Goto
  commands.stop.u80parameter              = u80GotoParameters.stop

  commands.my                             = {}
  commands.my.command                     = 1
  commands.my.u80function                 = u80function.Goto
  commands.my.u80parameter                = u80GotoParameters.my

  commands.moveOf                         = {}
  commands.moveOf.command                 = 11
  commands.moveOf.u80function             = u80function.MoveOf
  commands.moveOf.u80parameter            = 0
  commands.moveOf.timebreak               = 0

  commands.autoMode                       = {}
  commands.autoMode.command               = 5
  commands.autoMode.u80function           = u80function["Frame Counter"]
  commands.autoMode.u80parameter          = 0

  commands.cycle                          = {}
  commands.cycle.command                  = 15
  commands.cycle.u80function              = u80function.MoveOf
  commands.cycle.u80parameter             = u80GotoParameters.stop

  commands.openConfiguration              = {}
  commands.openConfiguration.command      = 8
  commands.openConfigurationFor4T         = {}
  commands.openConfigurationFor4T.command = 15

  commands.heatingTest                    = {}
  commands.heatingTest.command            = 3
  commands.heatingTest.u80function        = u80function.Goto
  commands.heatingTest.u80parameter       = u80GotoParameters.my

  commands.goto                           = {}
  commands.goto.command                   = 1
  commands.goto.u80function               = u80function.Goto
  commands.goto.u80parameter              = 0
end

function RTWsetProtocolSpecificCommandParameters(command)
  command.type     = "vendor"
  command.vendor   = 128 + command.command + 4
  command.command  = 15
end

function checkCommandData(command)
  checkTimeArg(command.timestop)
  checkTimeArg(command.timebreak)
  assert(      command.command  ~=      nil, "command value is nil")
  assert( type(command.command) == "number", "command value should be a number")
end

function checkTimeArg(time)
  assert(     time  ~=      nil, "given time value is nil")
  assert(type(time) == "number", "given time should be a number")
  assert(     time  >=        0, "given time should be a positive value")
end

function createBaseCommand(command, repeatCount)
  checkCommandData(command)

  local parameters
  parameters              = command
  parameters.type         = RTxType.RTS    -- change for other RTx type
  parameters.version      = RTxVersion.u80 -- change for other RTx version (RTS only!)
  parameters.repeatseq    = 3
  parameters.repeatcmd    = repeatCount
  parameters.rcautoinc    = true
  parameters.u80key       = 0
  parameters.u80extension = 0

  -- RTWsetProtocolSpecificCommandParameters(command) -- uncomment for RTW

  return parameters
end

function createCycleCommand(command, repeatCount)
  checkCommandData(command)

  local parameters
  parameters              = command
  parameters.type         = RTxType.RTS
  parameters.vendor       = vendor.somfy   -- somfy = 2
  parameters.version      = RTxVersion.u56
  parameters.rcautoinc    = true
  parameters.repeatseq    = 3
  parameters.repeatcmd    = repeatCount
  parameters.u80key       = 0
  parameters.u80extension = 0
  parameters.u80function  = 0
  parameters.u80parameter = 0
  parameters.random       = 164

  -- RTWsetProtocolSpecificCommandParameters(command) -- uncomment for RTW

  return parameters
end

function createOpenConfigurationCommand(command)
  checkCommandData(command)

  local parameters
  parameters              = command
  parameters.type         = RTxType.RTS
  parameters.version      = RTxVersion.u56
  parameters.rcautoinc    = true
  parameters.repeatseq    = 15
  parameters.repeatcmd    = 15
  parameters.u80key       = 0
  parameters.u80extension = 0
  parameters.u80function  = 0
  parameters.u80parameter = 0
  parameters.random       = 164

  return parameters
end

function getParametersForCommand(commandName, deviceType, timestop)
  local  command  = CommonUtils.deepCopy(commands[commandName])

  assert(command ~= nil, "unknown command name for :" .. commandName)

  if timestop == nil then
    command.timestop = getTimeStop(deviceType)
  else
    assert(type(timestop) == "number" and timestop >= 0 and timestop <= 30, "timestop should be a number between 0 and 30")
    command.timestop = timestop
  end

  if command.timebreak == nil then command.timebreak = defaultTimeBreak end

  return command
end

function getTimeStop(deviceType)
  assert(type(deviceType) == "number", "deviceType is not a number")
  assert(     deviceType  >= 0,        "deviceType is negative")
  local             type   = bit.band(deviceType, 255)

  if    type == 13 or type == 7 or type == 9 or type == 23 then return 0
  else return defaultTimeStop end
end

function getSimpleCommand(commandName, context, timestop)
  assert(context ~= nil, "context is nil!!")

  if context.deviceType == nil then print("context.deviceType is nil") end

  local      deviceType  = tonumber(context.deviceType)
  local     repeatCount  = tonumber(context.repeatCount)
  local         command  = getParametersForCommand(commandName, deviceType, timestop)

  if     commandName == "cycle" then
    return nil, createCycleCommand(command, repeatCount)
  elseif commandName == "openConfiguration" or commandName == "openConfigurationFor4T" then
    return nil, createOpenConfigurationCommand(command)
  else
    return nil, createBaseCommand(command, repeatCount) end
end

function on(context)
  local r, commandOn          = getSimpleCommand("up", context, 0)
           commandOn.category = "onoff"

  return nil, commandOn
end

function off(context)
  local r, commandOff          = getSimpleCommand("down", context, 0)
           commandOff.category = "onoff"

  return nil, commandOff
end

function onWithTimer(delay, context)
  checkTimeArg(delay)

  local deviceType          = tonumber(context.deviceType)
  local repeatCount         = tonumber(context.repeatCount)
  local commandOn           = getParametersForCommand("up", deviceType, 0)
  local commandOff          = getParametersForCommand("down", deviceType, 0)
        commandOn.category  = "onoff"
        commandOff.category = "onoff"
        commandOff.delay    = delay

  return nil, createBaseCommand(commandOn, repeatCount), nil, createBaseCommand(commandOff, repeatCount)
end

function myWithTimer(delay, context)
  checkTimeArg(delay)

  local deviceType          = tonumber(context.deviceType)
  local repeatCount         = tonumber(context.repeatCount)
  local commandMy           = getParametersForCommand("my", deviceType)
  local commandOff          = getParametersForCommand("down", deviceType)
        commandMy.category  = "onoff"
        commandOff.category = "onoff"
        commandOff.delay    = delay

  return nil, createBaseCommand(commandMy, repeatCount), nil, createBaseCommand(commandOff, repeatCount)
end

function moveOfWithTimeStop(arg, timestop, context)
  assert(arg < 128 and arg > -128, "wrong value for parameter, should be between ]-128;128[ value :" .. arg)

  local deviceType  = tonumber(context.deviceType)
  local repeatCount = 2
  local command     = getParametersForCommand("moveOf", deviceType)
  local parameters  = createBaseCommand(command, repeatCount)

  if timestop == nil then parameters.timestop = getTimeStop(deviceType)
  else
    assert(type(timestop) == "number" and timestop >= 0 and timestop <= 30, "timestop should be a number between 0 and 30")
    parameters.timestop = timestop
  end
  if arg < 0 then arg = 128 - arg end
  parameters.u80parameter = arg

  return nil, parameters
end

function moveOf(arg, context) return moveOfWithTimeStop(arg, defaultTimeStop, context) end

function gotoPosition(arg, context)
  local deviceType              = tonumber(context.deviceType)
  local repeatCount             = 2
  local command                 = getParametersForCommand("goto", deviceType)
        command.category        = "onoff"
  local parameters              = createBaseCommand(command, repeatCount)
        parameters.u80parameter = 200 - arg * 2

  return nil, parameters
end

function testTwoCommands(command1, command2, timestop1, timestop2, context)
  local deviceType             = tonumber(context.deviceType)
  local repeatCount            = tonumber(context.repeatCount)
  local firstCommand           = getParametersForCommand(command1, deviceType)
        firstCommand.timestop  = timestop1
        firstCommand.timebreak = testTimeBreak
  local secondCommand          = getParametersForCommand(command2, deviceType)
        secondCommand.timestop = timestop2
  local firstParameters        = createBaseCommand(firstCommand, repeatCount)
  local secondParameters       = createBaseCommand(secondCommand, repeatCount)

  return nil, firstParameters, nil, secondParameters
end
```

#### RTD(S)

``` lua title="rtds-utils.lua"
-- filename: @./rtds-utils.lua

function getSensing(v) return bit.band(bit.rshift(v, 3), 1) == 1 end
function getBattery(v) return bit.band(bit.rshift(v, 5), 1) == 1 end
function getOrder(v) return bit.band(v, 7) end
function getOriginator(v) return bit.rshift(v, 6) end

function getControllerOriginator(v)
  if bit.rshift(v, 6) < 3 then return bit.rshift(v, 6)
  else                         return bit.rshift(v, 4) end
end
function getControllerSensing(v)
  if bit.rshift(v, 6) < 3 then
    if bit.band(bit.rshift(v, 3), 1) == 1 then return "OK"
    else return "KO" end
  else   return nil  end
end
function getControllerBattery(v)
  if bit.rshift(v, 6) < 3 then
    if bit.band(bit.rshift(v, 5), 1) == 1 then return "OK"
    else return "KO" end
  else   return nil  end
end
function getControllerOrder(v)
  local originator = getControllerOriginator(v)
  local      order = bit.band(v, 15)

  if     originator == 0  then
  if         order == 0  then return "Common init code"
  else                        return "Init code with last adress deletion" end
  elseif originator == 1  then return "0000"
  elseif originator == 2  then
  if         order == 0  then return "off"
  elseif     order == 1  then return "onZ1"
  elseif     order == 2  then return "onZ2"
  elseif     order == 3  then return "onZ3"
  elseif     order == 4  then return "onZ1-2"
  elseif     order == 5  then return "onZ2-3"
  elseif     order == 6  then return "onZ1-3"
  elseif     order == 7  then return "onZ1-2-3"
  elseif     order == 8  then return "SOS"
  elseif     order == 9  then return "SOS (transmitter)"
  elseif     order == 10 then return "autowatch"
  elseif     order == 11 then return "unknown"
  elseif     order == 12 then return "offcode"
  elseif     order == 13 then return "offZ1"
  elseif     order == 14 then return "offZ2"
  elseif     order == 15 then return "offZ3" end
  elseif originator == 12 then
  if         order == 0  then return "access code 1 - stop"
  elseif     order == 1  then return "access code 1 - run"
  elseif     order == 2  then return "access code 2 - stop"
  elseif     order == 3  then return "access code 2 - run" end
  else                         return nil end
end
function getControllerBipAndSirenLevel(v)
  local originator = getControllerOriginator(v)
  local      level = bit.band(bit.rshift(v, 2), 1)

  if originator ~= 15 then return nil
  else
    if     level == 0 then return "low"
    elseif level == 1 then return "medium"
    elseif level == 2 then return "high"
    else                   return "unaltered level" end
  end
end

function getSirenEventType(rawValue)
  local rawEventType = bit.rshift(bit.band(rawValue, 192), 6)

  if     rawEventType == 0 then return "buttonPushed"
  elseif rawEventType == 1 then return "periodical"
  elseif rawEventType == 2 then return "autoDetection"
  else                          return "unknown" end
end
function getSirenBatteryState(rawValue) if bit.band(rawValue, 32) == 0 then return "low" else return "normal" end end
function getSirenASState(rawValue) if bit.band(rawValue, 16) == 0 then return "open" else return "closed" end end
```

#### RTN

``` lua title="rtn-utils.lua"
-- chunkname: @./rtn-utils.lua

function RTNConstructor()
  on       = 250
  off      = 251
  toogle   = 252
  identify = 253
  ignore   = 254
end

function lastButtonPressedState(value)
  if     value == 0 then return "Scenario #1"
  elseif value == 1 then return "Scenario #2"
  elseif value == 2 then return "Local #1"
  elseif value == 3 then return "Local #2"
  else                   return nil end
end

function onOffCommand(value)
  if     value == "on"  then return on,  { category = "onoff" }
  elseif value == "off" then return off, { category = "onoff" }
  else                       return nil
  end
end
function onOffChan1Command(value)
  if     value == "on"  then return bytearray({ on,ignore}), { category = "onoff" }
  elseif value == "off" then return bytearray({off,ignore}), { category = "onoff" }
  end
end
function onOffChan2Command(value)
  if     value == "on"  then return bytearray({ignore, on}), { category = "onoff" }
  elseif value == "off" then return bytearray({ignore,off}), { category = "onoff" } end
end
function onOffState(value)
  if     value == off or value == 0 then return "off"
  elseif value == ignore            then return nil
  else                                   return "on" end
end

function toogleCommand()      return            toogle,          { category = "onoff" } end
function toogleChan1Command() return bytearray({toogle,ignore}), { category = "onoff" } end
function toogleChan2Command() return bytearray({ignore,toogle}), { category = "onoff" } end
function toogleCommandForDimmer(value)
  if value == nil then return toogle, { category = "onoff" }
  else                 return math.floor((100 - value) * 249 / 100), { category = "onoff" } end
end

function intensityCommand(value) return math.floor(value * 249 / 100), { category = "onoff" } end
function intensityChan1Command(value) return bytearray({value * 249 / 100,ignore}), { category = "onoff" } end
function intensityChan2Command(value) return bytearray({ignore,value * 249 / 100}), { category = "onoff" } end
function intensityCommandWithTimer(value) return 249, { category = "onoff" }, 0, { category = "onoff", delay = value } end
function intensityState(value)
  if     value == 0   or value == off then return 0
  elseif value == 249 or value == on  then return 100
  elseif value == ignore              then return nil
  else                                     return math.floor(value * 100 / 249) + 1 end
end

function identifyCommand() return identify, { category = "onoff" } end
function identifyChan1Command() return bytearray({identify,ignore}), { category = "onoff" } end
function identifyChan2Command() return bytearray({ignore,identify}), { category = "onoff" } end

function onWithTimerCommand(value) return on, { category = "onoff" }, off, { category = "onoff", delay = value } end
function onWithTimerChan1Command(value) return bytearray({on,ignore}), { category = "onoff" }, bytearray({off,ignore}), { category = "onoff", delay = value} end
function onWithTimerChan2Command(value) return bytearray({ignore,on}), { category = "onoff" }, bytearray({ignore,off}), {category = "onoff",delay = value} end

function assertNotNilInPosition(object, objectName, position) assert(object ~= nil, objectName .. " in the command with " .. tostring(position) .. " position is nil") end
function assertTypeInPosition(object, objectType, objectName, position) assert(type(object) == objectType, objectName .. " in the command with " .. tostring(position) .. " position is not a " .. objectType) end
```
