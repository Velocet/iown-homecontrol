ProxyFrame {
  0 = COMMAND_SERVICE_ID__GIVE_VERSION
  1 = COMMAND_SERVICE_ID__SUBSCRIBE_PRODUCT
  2 = COMMAND_SERVICE_ID__GIVE_CONNECTED_DEVICES

  0 = COMMAND_SERVICE_STATUS_ID__DEVICE_CONNECTED
  1 = COMMAND_SERVICE_STATUS_ID__DEVICE_DISCONNECTED
  2 = COMMAND_SERVICE_STATUS_ID__DEVICES_DETECTION_FINISHED

  0 = COMMAND_TYPE__START_UC              1 = COMMAND_TYPE__START_UC_ACK
  2 = COMMAND_TYPE__UC_STATUS             3 = COMMAND_TYPE__UC_STATUS_ACK
  4 = COMMAND_TYPE__ABORT_UC              5 = COMMAND_TYPE__ABORT_UC_ACK
  6 = COMMAND_TYPE__SYNCHRONIZATION       7 = COMMAND_TYPE__SYNCHRONIZATION_ACK
 69 = COMMAND_UPGRADE__ERASE_PAGE        70 = COMMAND_UPGRADE__ERASE_PAGE_ACK
 73 = COMMAND_UPGRADE__IDENTIFY          74 = COMMAND_UPGRADE__IDENTIFY_ACK
 81 = COMMAND_UPGRADE__START_APPLICATION 84 = COMMAND_UPGRADE__START_APPLICATION_ACK
 87 = COMMAND_UPGRADE__WRITE_PAGE        88 = COMMAND_UPGRADE__WRITE_PAGE_ACK
224 = COMMAND_TYPE__BOOT_LOADER         225 = COMMAND_TYPE__BOOT_LOADER_ACK
240 = COMMAND_TYPE__SERVICE             241 = COMMAND_TYPE__SERVICE_ACK
242 = COMMAND_TYPE__SERVICE_STATUS      243 = COMMAND_TYPE__SERVICE_STATUS_ACK

  0 = COMMAND_UC_ID__START_BOOTLOADER
  1 = COMMAND_UC_ID__GET_2W_KEY_FROM_CONTROLLER
  2 = COMMAND_UC_ID__GENERATE_NEW_KEY
  3 = COMMAND_UC_ID__GIVE_KEY_TO_ANOTHER_2W_CONTROLLER
  4 = COMMAND_UC_ID__PAIR_EQUIPMENT_IN_SYSTEM
  5 = COMMAND_UC_ID__PAIR_NEW_EQUIPMENT
  6 = COMMAND_UC_ID__PAIR_EQUIPMENT_STIMULATED_BY_1W
  7 = COMMAND_UC_ID__GET_ACTUATOR_NAME
  8 = COMMAND_UC_ID__SET_ACTUATOR_NAME
  9 = COMMAND_UC_ID__GET_ACTUATOR_POSITION
 10 = COMMAND_UC_ID__IDENTIFY_ACTUATOR
 11 = COMMAND_UC_ID__START_THIS_SCENARIO
 12 = COMMAND_UC_ID__STOP_ALL_ACTUATORS_MOVEMENT
 13 = COMMAND_UC_ID__RESTORE_FACTORY_SETTINGS
  0 = COMMAND_ABORT_UC_ID__USER_ABORT
  1 = COMMAND_ABORT_UC_ID__TIMEOUT_ABORT

  0 = COMMAND_UPGRADE__START_FIRMWARE_UPGRADER
  0 = COMMAND_UPGRADE__STATUS_KO
255 = COMMAND_UPGRADE__STATUS_OK

  0 = FRAME__HEADER_POSITION
  1 = FRAME__SIZE_POSITION
  3 = FRAME__ENCRYPTION_POSITION
  4 = FRAME__DATA_FORMAT_POSITION
  5 = FRAME__ERROR_STATUS_POSITION
  6 = FRAME__COMMAND_TYPE_POSITION
  7 = FRAME__COMMAND_ID_POSITION
  8 = FRAME__COMMAND_DATA_POSITION

  0 = START_UC_STATUS__OK
  1 = START_UC_STATUS__ERROR
  0 = UC_STATUS__STATUS_POSITION
  1 = UC_STATUS__INTERMEDIATE_DATA_TYPE_POSITION
  2 = UC_STATUS__INTERMEDIATE_DATA_POSITION
  0 = UC_STATUS__STATUS_ENDED
  1 = UC_STATUS__STATUS_INTERMEDIATE
  2 = UC_STATUS__STATUS_ERROR
  3 = UC_STATUS__STATUS_TIMEOUT
  4 = UC_STATUS__STATUS_USER_ABORT
  0 = UC_STATUS__INTERMEDIATE_DATA_SKITTER   = SYNC_OBJ__SKITTER
  1 = UC_STATUS__INTERMEDIATE_DATA_SCENARIO  = SYNC_OBJ__SCENARIO
  2 = UC_STATUS__INTERMEDIATE_DATA_SITUATION = SYNC_OBJ__SITUATION
  3 = UC_STATUS__INTERMEDIATE_DATA_KEY_2W    = SYNC_OBJ__KEY_2W
  4 = UC_STATUS__INTERMEDIATE_DATA_ACTUATOR  = SYNC_OBJ__ACTUATOR
  5 = UC_STATUS__INTERMEDIATE_DATA_BEACON    = SYNC_OBJ__BEACON
  6 = UC_STATUS__INTERMEDIATE_DATA_SCD       = SYNC_OBJ__SCD
255 = UC_STATUS__INTERMEDIATE_DATA_NONE      = SYNC_OBJ__NONE

  0 = COMMAND_SYNC_ID__READ_SYSTEM_DESCRIPTION
  1 = COMMAND_SYNC_ID__READ_OBJECT
  2 = COMMAND_SYNC_ID__WRITE_OBJECT
  3 = COMMAND_SYNC_ID__ERASE_ALL_OBJECTS
  4 = COMMAND_SYNC_ID__END_OF_READ_OBJECTS
  5 = COMMAND_SYNC_ID__END_OF_WRITE_OBJECTS

  0 = DATA_FORMAT__BINARY  1 = DATA_FORMAT__BINARY_XML  2 = DATA_FORMAT__XML
  0 = ENCRYPTION__NO       1 = ENCRYPTION__RIJNDAEL     2 = ENCRYPTION__ALREADY_ENCRYPTED
  0 = ERROR_STATUS__ERROR  0 = ERROR_STATUS__NO_ERROR
  0 = _DataFormat  0 = _Encryption  0 = _CommandType  0 = _CommandId  0 = _ErrorStatus
}

runManufacturerSettingsCommand(p1,p2,p3,p4)
  local IOSettingsUtils = depends("io-devices-settings-utils");
  return IOSettingsUtils.runConfig(
    p1, p2, {
    ["dead_man_up"]             = {{["commands"] = {{["baseCommand"] = "deadMan", ["params"] = {0, "APIParam:duration"}}}}},
    ["dead_man_down"]           = {{["commands"] = {{["baseCommand"] = "deadMan", ["params"] = {1, "APIParam:duration"}}}}},
    ["dead_man_stop"]           = {{["commands"] = {{["baseCommand"] = "deadMan", ["params"] = {2, 250}}}}},
    ["dead_man_impulse_up"]     = {{["commands"] = {{["baseCommand"] = "writePrivateWithoutPolling", ["params"] = {{"0x02", "0x00", "0x01", "0x03", "0x01", "0x00"}}},
                                                    {["baseCommand"] = "writePrivateWithoutPolling", ["params"] = {{"0x02", "0x00", "0x02", "0x03", "0xFF", "0x00"}}}}}},
    ["dead_man_impulse_down"]   = {{["commands"] = {{["baseCommand"] = "writePrivateWithoutPolling", ["params"] = {{"0x02", "0x01", "0x01", "0x03", "0x01", "0x00"}}},
                                                    {["baseCommand"] = "writePrivateWithoutPolling", ["params"] = {{"0x02", "0x01", "0x02", "0x03", "0xFF", "0x00"}}}}}},
    ["enter_settings_mode"]     = {{["commands"] = {{["baseCommand"] = "writePrivate", ["params"] = {{"0x02", "0xDF", "0x16"}}}}}},
    ["save_upper_end_limit"]    = {{["context"]  = {["state:setting_state"] = {"Not set"}},         ["commands"] = {{["baseCommand"] = "writePrivate", ["params"] = {{"0x02", "0x06", "0x00", "0x05", "0x00", "0x00"}}}}},
                                   {["context"]  = {["state:setting_state"] = {"Set", "User mode"}},["commands"] = {{["baseCommand"] = "writePrivate", ["params"] = {{"0x02", "0xDF", "0x14"}}}}}},
    ["save_lower_end_limit"]    = {{["context"]  = {["state:setting_state"] = {"Not set"}},         ["commands"] = {{["baseCommand"] = "writePrivate", ["params"] = {{"0x02", "0x05", "0x00", "0x05", "0x00", "0x00"}}}}},
                                   {["context"]  = {["state:setting_state"] = {"Set", "User mode"}},["commands"] = {{["baseCommand"] = "writePrivate", ["params"] = {{"0x02", "0xDF", "0x13"}}}}}},
    ["stop_after_save_limit"]   = {{["context"]  = {["state:setting_state"] = {"Not set"}},         ["commands"] = {{["baseCommand"] = "writePrivate", ["params"] = {{"0x02", "0x02", "0x00", "0x05", "0x00", "0x00"}}}}},
                                   {["context"]  = {["state:setting_state"] = {"Set", "User mode"}},["commands"] = {{["baseCommand"] = "writePrivate", ["params"] = {{"0x02", "0xDF", "0x0E"}}}}}},
    ["save_settings"]           = {{["commands"] = {{["baseCommand"] = "writePrivate", ["params"] = {{"0x02", "0xDF", "0x0E"}}}}, ["trigger"] = {["function"] = "refreshState", ["params"] = {"setting_state", "roll_end_limit_state", "unroll_end_limit_state"}}}},
    ["invert_rotation"]         = {{["commands"] = {{["baseCommand"] = "writePrivate", ["params"] = {{"0x02", "0xDF", "0x15"}}}}}},
    ["save_my_position"]        = {{["commands"] = {{["baseCommand"] = "writeAlias",   ["params"] = {{"0x01", "0x47", "0xD8", "0x00", "0xFF", "0xFF", "0x00", "0x00"}},["conversions"] = {{["function"]    = "replaceBytes",["params"] = {4, 2, "state:current_position"}, ["index"] = 0}}}}}},
    ["delete_my_position"]      = {{["commands"] = {{["baseCommand"] = "writeAlias",   ["params"] = {{"0x01", "0x47", "0xD8", "0x00", "0xD1", "0x00", "0x20", "0xD8", "0x00", "0xD1", "0x00", "0x00"}}}}}},
    ["reset_actuator"]          = {{["commands"] = {{["baseCommand"] = "writePrivate", ["params"] = {{"0x02", "0xEE", "0x00"}}}}}},
    ["double_power_cut"]        = {{["commands"] = {{["baseCommand"] = "writePrivate", ["params"] = {{"0x02", "0xDF", "0x0C"}}}}}},
    ["eject_from_setting_mode"] = {{["commands"] = {{["baseCommand"] = "writePrivate", ["params"] = {{"0x02", "0xDF", "0x0D"}}}}, ["trigger"] = {["function"] = "refreshState", ["params"] = {"setting_state"}}}}},{
    ["roll_end_limit_state"]   = {["type"] = "string",["value"] = p3,["baseCommand"] = "readObject",["stateId"] = 84082687,["refreshAll"] = true, ["params"] = {[1] = "0xFFFF"},["conversions"] = {{["function"] = "extractBytesFromAck",["params"] = {[1] = 239,[2] = 1}},{["function"] = "simpleMatching",
      ["params"] = {[1] = {["0"] = "Not_set", ["1"] = "Manual", ["2"] = "Manual", ["3"] = "Auto", ["4"] = "Auto", ["5"] = "Assisted", ["6"] = "Assisted"}}}}},
    ["setting_state"]          = {["type"] = "string",["value"] = p3,["baseCommand"] = "readObject",["stateId"] = 84082687,["refreshAll"] = true, ["params"] = {[1] = "0xFFFF"},["conversions"] = {{["function"] = "extractBytesFromAck",["params"] = {[1] = 246,[2] = 1}},{["function"] = "simpleMatching",
      ["params"] = {[1] = {["0"] = "Not set", ["1"] = "Setting in progress", ["2"] = "Set", ["3"] = "User mode", ["4"] = "Re-setting in progress"}}}}},
    ["current_position"]       = {["type"] = "int",   ["value"] = p4,["baseCommand"] = "readMP",    ["stateId"] = 65537,   ["refreshAll"] = false,["params"] = {}},
    ["unroll_end_limit_state"] = {["type"] = "string",["value"] = p3,["baseCommand"] = "readObject",["stateId"] = 84082687,["refreshAll"] = true, ["params"] = {[1] = "0xFFFF"},["conversions"] = {{["function"] = "extractBytesFromAck",["params"] = {[1] = 241,[2] = 1}},{["function"] = "simpleMatching",
      ["params"] = {[1] = {["0"] = "Not_set", ["1"] = "Manual", ["2"] = "Manual", ["3"] = "Auto", ["4"] = "Auto", ["5"] = "Assisted", ["6"] = "Assisted"}}}}}}, context); end

ActuatorAlias {constructor(AliasType: number, AliasValue: number) {}}

splitActuatorType(value: number):
           { ActuatorType:  ActuatorType,              ActuatorSubType: number }
  { return { ActuatorType: <ActuatorType>(value >>> 6),ActuatorSubType: value & 0x3F};}

SystemTableDataEntry {
  constructor(data: Buffer) {
      Data = data;
      ActuatorAddress = data.readUInt8(1) * 0x10000 /* 65536 */
                      + data.readUInt8(2) * 0x100   /*   256 */
                      + data.readUInt8(3);
      ActuatorType    = data.readUInt16BE(4) >>> 6;
      ActuatorSubType = data.readUInt8(5) & 0x3F;
      const byte6     = data.readUInt8(6);
      PowerSaveMode   =  byte6 & 0x03;
      ioMembership    = (byte6 & 0x04) === 0x04;
      RFSupport       = (byte6 & 0x08) === 0x08;
      switch (byte6 >>> 6) {
          case 0: ActuatorTurnaroundTime = 5;
          case 1: ActuatorTurnaroundTime = 10;
          case 2: ActuatorTurnaroundTime = 20;
          case 3: ActuatorTurnaroundTime = 40;
          default: throw new Error("Invalid actuator turn-around time.");
      }
      Manufacturer     = data.readUInt8(7);
      BackboneReferenceNumber = data.readUInt8(8) * 65536 + data.readUInt8(9) * 256 + data.readUInt8(10);
  }

  Data                   : Buffer;
  SystemTableIndex       : number;
  ActuatorAddress        : number;
  ActuatorType           : ActuatorType;
  ActuatorSubType        : number;
  PowerSaveMode          : PowerSaveMode;
  ioMembership           : boolean;
  RFSupport              : boolean;
  ActuatorTurnaroundTime : number;
  Manufacturer           : Manufacturer;
  BackboneReferenceNumber: number;
}

Manufacturer {
  VELUX          = 1,
  Somfy          = 2,
  Honeywell      = 3,
  Hoermann       = 4,
  ASSA_ABLOY     = 5,
  Niko           = 6,
  WINDOW_MASTER  = 7,
  Renson         = 8,
  CIAT           = 9,
  Secuyou        = 10,
  OVERKIZ        = 11,
  Atlantic_Group = 12
}

ActuatorType {
  NO_TYPE                     = 0,
  VenetianBlind               = 1,
  RollerShutter               = 2,
  Awning                      = 3,
  WindowOpener                = 4,
  GarageOpener                = 5,
  Light                       = 6,
  GateOpener                  = 7,
  RollingDoorOpener           = 8,
  Lock                        = 9,
  Blind                       = 10,
  Beacon                      = 12,
  DualShutter                 = 13,
  HeatingTemperatureInterface = 14,
  OnOffSwitch                 = 15,
  HorizontalAwning            = 16,
  ExternalVentianBlind        = 17,
  LouvreBlind                 = 18,
  CurtainTrack                = 19,
  VentilationPoint            = 20,
  ExteriorHeating             = 21,
  HeatPump                    = 22,
  IntrusionAlarm              = 23,
  SwingingShutter             = 24
}

PowerSaveMode {
  AlwaysAlive  = 0,
  LowPowerMode = 1
}

Velocity {
    Default      = 0,
    Silent       = 1,
    Fast         = 2,
    NotAvailable = 255
}

NodeVariation {
    NotSet   = 0,
    TopHung  = 1,
    Kip      = 2,
    FlatRoof = 3,
    SkyLight = 4
}

NodeOperatingState {
    NonExecuting    = 0,
    Error           = 1,
    NotUsed         = 2,
    WaitingForPower = 3,
    Executing       = 4,
    Done            = 5,
    Unknown         = 255
}

ControllerCopyMode {
    TransmittingConfigurationMode = 0,
    ReceivingConfigurationMode    = 1
}

ChangeKeyStatus {
    OK_KeyChangeClientController   = 0,
    OK_AllNodesUpdated             = 2,
    OK_PartialNodesUpdated         = 3,
    OK_ClientControllerReceivedKey = 5,
    Failed_LocalStimuliNotDisabled = 7,
    Failed_NoControllerFound       = 9,
    Failed_DTSNotReady             = 10,
    Failed_DTSError                = 11,
    Failed_CSNotReady              = 16
}
