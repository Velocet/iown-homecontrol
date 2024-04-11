slot0 = depends
slot1 = "common_utils"
slot0 = slot0(slot1)
slot1 = {}

function slot2(slot0, ...)
	slot1 = debug

	if slot1 ~= nil then
		slot1 = print
		slot2 = "[Zigbee] Log: "
		slot3 = slot0
		slot2 = slot2 .. slot3

		slot1(slot2, ...)
	end
end

slot1.log = slot2

function slot2(slot0)
	slot1 = error
	slot2 = "[Zigbee] error: "
	slot3 = slot0
	slot2 = slot2 .. slot3

	slot1(slot2)
end

slot1.error = slot2

function slot2(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 255
	slot3 = slot0
	slot1 = slot1(slot2, slot3)
	slot2 = bit
	slot2 = slot2.rshift
	slot3 = bit
	slot3 = slot3.band
	slot4 = 65280
	slot5 = slot0
	slot3 = slot3(slot4, slot5)
	slot4 = 8
	slot2 = slot2(slot3, slot4)
	slot3 = bytearray
	slot4 = {
		slot1,
		slot2
	}

	return slot3(slot4)
end

function slot3(slot0)
	slot1 = string
	slot1 = slot1.sub
	slot2 = "0000000000000000"
	slot3 = slot0
	slot2 = slot2 .. slot3
	slot4 = slot0
	slot3 = slot0.len
	slot3 = slot3(slot4)
	slot3 = slot3 + 1
	slot4 = -1
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = bytearray
	slot3 = slot1
	slot4 = "hexadecimal"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot2 = slot2.reverse

	return slot2(slot3)
end

function slot4(slot0, slot1)
	slot2 = bit
	slot2 = slot2.lshift
	slot3 = slot1
	slot4 = 8
	slot2 = slot2(slot3, slot4)
	slot2 = slot2 + slot0

	return slot2
end

function slot5(slot0, ...)
	slot1 = ipairs
	slot2 = {
		...
	}
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = slot0[slot4]

		if slot6 == nil then
			slot6 = slot0
			slot6 = slot6.error
			slot7 = slot5

			slot6(slot7)
		end
	end
end

slot6 = {}
slot1.Attribute = slot6
slot6 = slot1.Attribute
slot7 = {}
slot6.Basic = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/0"
slot6.ZCLVersion = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/1"
slot6.ApplicationVersion = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/2"
slot6.StackVersion = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/3"
slot6.HWVersion = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/4"
slot6.ManufacturerName = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/5"
slot6.ModelIdentifier = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/6"
slot6.DateCode = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/7"
slot6.PowerSource = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/8"
slot6.GenericDeviceClass = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/9"
slot6.GenericDeviceType = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/10"
slot6.ProductCode = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/11"
slot6.ProductURL = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/12"
slot6.ManufacturerVersionDetails = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/13"
slot6.SerialNumber = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/14"
slot6.ProductLabel = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/16"
slot6.LocationDescription = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/17"
slot6.PhysicalEnvironment = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/18"
slot6.DeviceEnabled = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/19"
slot6.AlarmMask = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/20"
slot6.DisableLocalConfig = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = "0/16384"
slot6.SWBuildId = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = {}
slot6.Schneider = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot6 = slot6.Schneider
slot7 = "0/57345/4190"
slot6.ApplicationFWVersion = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot6 = slot6.Schneider
slot7 = "0/57346/4190"
slot6.ApplicationHWVersion = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot6 = slot6.Schneider
slot7 = "0/57348/4190"
slot6.SerialNumber = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot6 = slot6.Schneider
slot7 = "0/57351/4190"
slot6.ProductIdentifier = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot6 = slot6.Schneider
slot7 = "0/57352/4190"
slot6.ProductRange = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot6 = slot6.Schneider
slot7 = "0/57353/4190"
slot6.ProductModel = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot6 = slot6.Schneider
slot7 = "0/57354/4190"
slot6.ProductFamily = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot6 = slot6.Schneider
slot7 = "0/57355/4190"
slot6.VendorURL = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot7 = {}
slot6.Somfy = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot6 = slot6.Somfy
slot7 = "0/0/4640"
slot6.SomfyProductSoft = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot6 = slot6.Somfy
slot7 = "0/1/4640"
slot6.SomfyProductHard = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot6 = slot6.Somfy
slot7 = "0/2/4640"
slot6.MotorBoardSWBuildID = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot6 = slot6.Somfy
slot7 = "0/3/4640"
slot6.MotorBoardProductSoft = slot7
slot6 = slot1.Attribute
slot6 = slot6.Basic
slot6 = slot6.Somfy
slot7 = "0/4/4640"
slot6.MotorBoardProductHard = slot7
slot6 = slot1.Attribute
slot7 = {}
slot6.Groups = slot7
slot6 = slot1.Attribute
slot6 = slot6.Groups
slot7 = "4/0"
slot6.NameSupport = slot7
slot6 = slot1.Attribute
slot7 = {}
slot6.Scenes = slot7
slot6 = slot1.Attribute
slot6 = slot6.Scenes
slot7 = "5/0"
slot6.SceneCount = slot7
slot6 = slot1.Attribute
slot6 = slot6.Scenes
slot7 = "5/1"
slot6.CurrentScene = slot7
slot6 = slot1.Attribute
slot6 = slot6.Scenes
slot7 = "5/2"
slot6.CurrentGroup = slot7
slot6 = slot1.Attribute
slot6 = slot6.Scenes
slot7 = "5/3"
slot6.SceneValid = slot7
slot6 = slot1.Attribute
slot6 = slot6.Scenes
slot7 = "5/4"
slot6.NameSupport = slot7
slot6 = slot1.Attribute
slot6 = slot6.Scenes
slot7 = "5/5"
slot6.LastConfiguredBy = slot7
slot6 = slot1.Attribute
slot7 = {}
slot6.PowerConfiguration = slot7
slot6 = slot1.Attribute
slot6 = slot6.PowerConfiguration
slot7 = "1/33"
slot6.BatteryPercentage = slot7
slot6 = slot1.Attribute
slot6 = slot6.PowerConfiguration
slot7 = "1/62"
slot6.BatteryAlarmState = slot7
slot6 = slot1.Attribute
slot7 = {}
slot6.Identify = slot7
slot6 = slot1.Attribute
slot6 = slot6.Identify
slot7 = "3/0"
slot6.IdentifyTime = slot7
slot6 = slot1.Attribute
slot6 = slot6.Identify
slot7 = {}
slot6.Danfoss = slot7
slot6 = slot1.Attribute
slot6 = slot6.Identify
slot6 = slot6.Danfoss
slot7 = "3/16384/4678"
slot6.IdentificationButton = slot7
slot6 = slot1.Attribute
slot7 = {}
slot6.OnOff = slot7
slot6 = slot1.Attribute
slot6 = slot6.OnOff
slot7 = "6/0"
slot6.OnOff = slot7
slot6 = slot1.Attribute
slot6 = slot6.OnOff
slot7 = "6/16386"
slot6.OffWaitTime = slot7
slot6 = slot1.Attribute
slot6 = slot6.OnOff
slot7 = "6/16387"
slot6.StartUpOnOff = slot7
slot6 = slot1.Attribute
slot6 = slot6.OnOff
slot7 = {}
slot6.Schneider = slot7
slot6 = slot1.Attribute
slot6 = slot6.OnOff
slot6 = slot6.Schneider
slot7 = "6/57344/4190"
slot6.PreWarningTime = slot7
slot6 = slot1.Attribute
slot6 = slot6.OnOff
slot6 = slot6.Schneider
slot7 = "6/57345/4190"
slot6.OnTimeReload = slot7
slot6 = slot1.Attribute
slot6 = slot6.OnOff
slot6 = slot6.Schneider
slot7 = "6/57346/4190"
slot6.OnTimeReloadOptions = slot7
slot6 = slot1.Attribute
slot7 = {}
slot6.LevelControl = slot7
slot6 = slot1.Attribute
slot6 = slot6.LevelControl
slot7 = "8/0"
slot6.CurrentLevel = slot7
slot6 = slot1.Attribute
slot6 = slot6.LevelControl
slot7 = "8/17"
slot6.OnLevel = slot7
slot6 = slot1.Attribute
slot6 = slot6.LevelControl
slot7 = "8/16384"
slot6.StartUpCurrentLevel = slot7
slot6 = slot1.Attribute
slot7 = {}
slot6.Time = slot7
slot6 = slot1.Attribute
slot6 = slot6.Time
slot7 = "10/0"
slot6.Time = slot7
slot6 = slot1.Attribute
slot6 = slot6.Time
slot7 = "10/1"
slot6.TimeStatus = slot7
slot6 = slot1.Attribute
slot7 = {}
slot6.PollControl = slot7
slot6 = slot1.Attribute
slot6 = slot6.PollControl
slot7 = "32/0"
slot6.CheckInInterval = slot7
slot6 = slot1.Attribute
slot6 = slot6.PollControl
slot7 = "32/1"
slot6.LongPollInterval = slot7
slot6 = slot1.Attribute
slot6 = slot6.PollControl
slot7 = "32/2"
slot6.ShortPollInterval = slot7
slot6 = slot1.Attribute
slot6 = slot6.PollControl
slot7 = "32/3"
slot6.FastPollTimeout = slot7
slot6 = slot1.Attribute
slot6 = slot6.PollControl
slot7 = "32/4"
slot6.CheckInIntervalMin = slot7
slot6 = slot1.Attribute
slot6 = slot6.PollControl
slot7 = "32/5"
slot6.LongPollIntervalMin = slot7
slot6 = slot1.Attribute
slot6 = slot6.PollControl
slot7 = "32/6"
slot6.FastPollTimeoutMax = slot7
slot6 = slot1.Attribute
slot7 = {}
slot6.WindowCovering = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot7 = "258/0"
slot6.WindowCoveringType = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot7 = "258/7"
slot6.ConfigStatusCoordinates = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot7 = {}
slot6.ConfigStatus = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.ConfigStatus
slot7 = "258/7/0/0"
slot6.Operational = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.ConfigStatus
slot7 = "258/7/0/1"
slot6.Online = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.ConfigStatus
slot7 = "258/7/0/2"
slot6.ReversalLiftCommands = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.ConfigStatus
slot7 = "258/7/0/3"
slot6.ControlLift = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.ConfigStatus
slot7 = "258/7/0/4"
slot6.ControlTilt = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.ConfigStatus
slot7 = "258/7/0/5"
slot6.EncoderLift = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.ConfigStatus
slot7 = "258/7/0/6"
slot6.EncoderTilt = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot7 = "258/8"
slot6.CurrentPositionLiftPercentage = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot7 = "258/9"
slot6.CurrentPositionTiltPercentage = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot7 = "258/16"
slot6.InstalledOpenLimitLift = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot7 = "258/17"
slot6.InstalledClosedLimitLift = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot7 = "258/18"
slot6.InstalledOpenLimitTilt = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot7 = "258/19"
slot6.InstalledClosedLimitTilt = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot7 = "258/23"
slot6.ModeCoordinates = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot7 = {}
slot6.Mode = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Mode
slot7 = "258/23/0/0"
slot6.MotorDirection = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Mode
slot7 = "258/23/0/1"
slot6.MotorRun = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Mode
slot7 = "258/23/0/2"
slot6.MotorRunning = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Mode
slot7 = "258/23/0/3"
slot6.LED = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot7 = {}
slot6.Schneider = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Schneider
slot7 = "258/57344/4190"
slot6.DriveCloseDuration = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Schneider
slot7 = "258/57360/4190"
slot6.ProtectionStatus = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Schneider
slot7 = "258/57363/4190"
slot6.ProtectionSensor = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Schneider
slot7 = "258/57362/4190"
slot6.SunProtectionIlluminanceThreshold = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Schneider
slot7 = "258/57364/4190"
slot6.LiftDriveUpTime = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Schneider
slot7 = "258/57365/4190"
slot6.LiftDriveDownTime = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Schneider
slot7 = "258/57366/4190"
slot6.TiltOpenCloseAndStepTime = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Schneider
slot7 = "258/57367/4190"
slot6.TiltPositionPercentageAfterMoveToLevel = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot7 = {}
slot6.Somfy = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = "258/1/4640"
slot6.Error = slot7
slot6 = slot1.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = "258/0/4640"
slot6.SomfyOperationalStatus = slot7
slot6 = slot1.Attribute
slot7 = {}
slot6.Thermostat = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/0"
slot6.LocalTemperature = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/1"
slot6.OutdoorTemperature = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/2"
slot6.Occupancy = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/3"
slot6.AbsMinHeatSetpointLimit = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/4"
slot6.AbsMaxHeatSetpointLimit = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/5"
slot6.AbsMinCoolSetpointLimit = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/6"
slot6.AbsMaxCoolSetpointLimit = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/7"
slot6.PICoolingDemand = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/8"
slot6.PIHeatingDemand = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/9/0/1"
slot6.HVACCoolingSystemStage = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/9/0/2"
slot6.HVACHeatingSystemStage = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/9/0/3"
slot6.HVACHeatingSystemType = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/9/0/4"
slot6.HVACHeatingFuelType = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/16"
slot6.LocalTemperatureCalibration = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/17"
slot6.OccupiedCoolingSetpoint = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/18"
slot6.OccupiedHeatingSetpoint = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/19"
slot6.UnoccupiedCoolingSetpoint = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/20"
slot6.UnoccupiedHeatingSetpoint = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/21"
slot6.MinHeatSetpointLimit = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/22"
slot6.MaxHeatSetpointLimit = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/23"
slot6.MinCoolSetpointLimit = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/24"
slot6.MaxCoolSetpointLimit = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/25"
slot6.MinSetpointDeadBand = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "513/26/0/1"
slot6.LocalTemperatureSensedSource = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "OutdoorTemperatureSensedSource"
slot8 = "513/26/0/2"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "OccupancySensedSource"
slot8 = "513/26/0/3"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ControlSequenceOfOperation"
slot8 = "513/27"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "SystemMode"
slot8 = "513/28"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "AlarmInitializationFailure"
slot8 = "513/29/0/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "AlarmHardwareFailure"
slot8 = "513/29/0/2"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "AlarmSelfCalibrationFailure"
slot8 = "513/29/0/3"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ThermostatRunningMode"
slot8 = "513/30"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "StartOfWeek"
slot8 = "513/32"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "NumberOfWeeklyTransitions"
slot8 = "513/33"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "NumberOfDailyTransitions"
slot8 = "513/34"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "TemperatureSetpointHold"
slot8 = "513/35"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "TemperatureSetpointHoldDuration"
slot8 = "513/36"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "AbstractThermostatProgrammingOperationMode"
slot8 = "513/37"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ThermostatProgrammingOperationMode"
slot8 = "513/37/0/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "AutoRecoveryModeEnabled"
slot8 = "513/37/0/2"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "EconomyEnergyStarModeEnabled"
slot8 = "513/37/0/3"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ThermostatRunningHeatState"
slot8 = "513/41/0/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ThermostatRunningCoolState"
slot8 = "513/41/0/2"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ThermostatRunningFanState"
slot8 = "513/41/0/3"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ThermostatRunningHeat2StageState"
slot8 = "513/41/0/4"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ThermostatRunningCool2StageState"
slot8 = "513/41/0/5"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ThermostatRunningFan2StageState"
slot8 = "513/41/0/6"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ThermostatRunningFan3StageState"
slot8 = "513/41/0/7"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "SetpointChangeSource"
slot8 = "513/48"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "SetpointChangeAmount"
slot8 = "513/49"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "SetpointChangeSourceTimestamp"
slot8 = "513/50"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "OccupiedSetback"
slot8 = "513/52"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "OccupiedSetbackMin"
slot8 = "513/53"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "OccupiedSetbackMax"
slot8 = "513/54"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "UnoccupiedSetback"
slot8 = "513/55"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "UnoccupiedSetbackMin"
slot8 = "513/56"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "UnoccupiedSetbackMax"
slot8 = "513/57"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "EmergencyHeatDelta"
slot8 = "513/58"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ACType"
slot8 = "513/64"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ACCapacity"
slot8 = "513/65"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ACRefrigerantType"
slot8 = "513/66"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ACCompressorType"
slot8 = "513/67"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ACCompressorFailure"
slot8 = "513/68/0/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ACRoomTemperatureSensorFailure"
slot8 = "513/68/0/2"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ACOutdoorTemperatureSensorFailure"
slot8 = "513/68/0/3"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ACIndoorCoilTemperatureSensorFailure"
slot8 = "513/68/0/4"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ACFanFailure"
slot8 = "513/68/0/5"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ACLouverPosition"
slot8 = "513/69"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ACCoilTemperature"
slot8 = "513/70"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ACCapacityFormat"
slot8 = "513/71"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "ClusterRevision"
slot8 = "513/65533"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = {}
slot6.Danfoss = slot7
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "ETRVOpenWindowDetection"
slot8 = "513/16384/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "ExternalOpenWindowDetected"
slot8 = "513/16387/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "ExerciseDayOfWeek"
slot8 = "513/16400/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "ExerciseTriggerTime"
slot8 = "513/16401/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "MountingModeActive"
slot8 = "513/16402/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "MountingModeControl"
slot8 = "513/16403/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "ETRVOrientation"
slot8 = "513/16404/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "ExternalMeasuredRoomSensor"
slot8 = "513/16405/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "ControlAlgorithmScaleFactor"
slot8 = "513/16416/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "HeatAvailable"
slot8 = "513/16432/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "HeatSupplyRequest"
slot8 = "513/16433/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "LoadBalancingEnable"
slot8 = "513/16434/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "LoadRadiatorRoomMean"
slot8 = "513/16448/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "LoadEstimateOnThisRadiator"
slot8 = "513/16458/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "RegulationSetPointOffset"
slot8 = "513/16459/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "AdaptationRunControl"
slot8 = "513/16460/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "AdaptationRunInProgress"
slot8 = "513/16461/4678/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "AdaptationOPFound"
slot8 = "513/16461/4678/2"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "AdaptationOPLost"
slot8 = "513/16461/4678/3"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "AdaptationRunSettings"
slot8 = "513/16462/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "RoomStatusCode"
slot8 = "513/16640/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "OutputStatus"
slot8 = "513/16656/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "RoomFloorSensorMode"
slot8 = "513/16672/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "FloorMinSetpoint"
slot8 = "513/16673/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "FloorMaxSetpoint"
slot8 = "513/16674/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot6 = slot6.Danfoss
slot7 = "ScheduleTypeUsed"
slot8 = "513/16688/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "Imhotep"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "Imhotep"
slot6 = slot6[slot7]
slot7 = "CurrentMode"
slot8 = "513/16384/4765"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "Imhotep"
slot6 = slot6[slot7]
slot7 = "WindowsStatus"
slot8 = "513/16385/4765"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "Imhotep"
slot6 = slot6[slot7]
slot7 = "ScheduleMonday"
slot8 = "513/16386/4765"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "Imhotep"
slot6 = slot6[slot7]
slot7 = "ScheduleTuesday"
slot8 = "513/16387/4765"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "Imhotep"
slot6 = slot6[slot7]
slot7 = "ScheduleWednesday"
slot8 = "513/16388/4765"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "Imhotep"
slot6 = slot6[slot7]
slot7 = "ScheduleThursday"
slot8 = "513/16389/4765"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "Imhotep"
slot6 = slot6[slot7]
slot7 = "ScheduleFriday"
slot8 = "513/16390/4765"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "Imhotep"
slot6 = slot6[slot7]
slot7 = "ScheduleSaturday"
slot8 = "513/16391/4765"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "Imhotep"
slot6 = slot6[slot7]
slot7 = "ScheduleSunday"
slot8 = "513/16392/4765"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Thermostat
slot7 = "Imhotep"
slot6 = slot6[slot7]
slot7 = "Selflearning"
slot8 = "513/16393/4765"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ThermostatUIConfiguration"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ThermostatUIConfiguration"
slot6 = slot6[slot7]
slot7 = "TemperatureDisplayMode"
slot8 = "516/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ThermostatUIConfiguration"
slot6 = slot6[slot7]
slot7 = "KeypadLockout"
slot8 = "516/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ThermostatUIConfiguration"
slot6 = slot6[slot7]
slot7 = {}
slot6.Danfoss = slot7
slot6 = slot1.Attribute
slot7 = "ThermostatUIConfiguration"
slot6 = slot6[slot7]
slot6 = slot6.Danfoss
slot7 = "ViewingDirection"
slot8 = "516/16384/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "CurrentHue"
slot8 = "768/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "CurrentSaturation"
slot8 = "768/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "CurrentX"
slot8 = "768/3"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "CurrentY"
slot8 = "768/4"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "ColorMode"
slot8 = "768/8"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "EnhancedCurrentHue"
slot8 = "768/16384"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "ColorLoopActive"
slot8 = "768/16386"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "ColorLoopDirection"
slot8 = "768/16387"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "ColorLoopTime"
slot8 = "768/16388"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "ColorLoopStartEnhancedHue"
slot8 = "768/16389"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "ColorLoopStoredEnhancedHue"
slot8 = "768/16390"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "ColorTemperatureMireds"
slot8 = "768/7"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "ColorCapabilities"
slot8 = "768/16394"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "ColorTempPhysicalMinMireds"
slot8 = "768/16395"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "ColorTempPhysicalMaxMireds"
slot8 = "768/16396"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "TemperatureMeasurement"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "TemperatureMeasurement"
slot6 = slot6[slot7]
slot7 = "MeasuredValue"
slot8 = "1026/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "TemperatureMeasurement"
slot6 = slot6[slot7]
slot7 = "MinMeasuredValue"
slot8 = "1026/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "TemperatureMeasurement"
slot6 = slot6[slot7]
slot7 = "MaxMeasuredValue"
slot8 = "1026/2"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "TemperatureMeasurement"
slot6 = slot6[slot7]
slot7 = "Tolerance"
slot8 = "1026/3"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "RelativeHumidity"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "RelativeHumidity"
slot6 = slot6[slot7]
slot7 = "MeasuredValue"
slot8 = "1029/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "RelativeHumidity"
slot6 = slot6[slot7]
slot7 = "MinMeasuredValue"
slot8 = "1029/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "RelativeHumidity"
slot6 = slot6[slot7]
slot7 = "MaxMeasuredValue"
slot8 = "1029/2"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "RelativeHumidity"
slot6 = slot6[slot7]
slot7 = "Tolerance"
slot8 = "1029/3"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IlluminanceMeasurement"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IlluminanceMeasurement"
slot6 = slot6[slot7]
slot7 = "MeasuredValue"
slot8 = "1024/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IlluminanceMeasurement"
slot6 = slot6[slot7]
slot7 = "MinMeasuredValue"
slot8 = "1024/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IlluminanceMeasurement"
slot6 = slot6[slot7]
slot7 = "MaxMeasuredValue"
slot8 = "1024/2"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IlluminanceMeasurement"
slot6 = slot6[slot7]
slot7 = "Tolerance"
slot8 = "1024/3"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IlluminanceMeasurement"
slot6 = slot6[slot7]
slot7 = "LightSensorType"
slot8 = "1024/4"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "OccupancySensing"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "OccupancySensing"
slot6 = slot6[slot7]
slot7 = "1030/0/0/0"
slot6.Occupancy = slot7
slot6 = slot1.Attribute
slot7 = "OccupancySensing"
slot6 = slot6[slot7]
slot7 = "OccupancySensorType"
slot8 = "1030/1/0/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "OccupancySensing"
slot6 = slot6[slot7]
slot7 = "OccupancySensorTypeBitmap"
slot8 = "1030/2/0/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ElectricalMeasurement"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "ElectricalMeasurement"
slot6 = slot6[slot7]
slot7 = "ActivePower"
slot8 = "2820/1291"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Metering"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Metering"
slot6 = slot6[slot7]
slot7 = "Formatting"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Metering"
slot6 = slot6[slot7]
slot7 = "Formatting"
slot6 = slot6[slot7]
slot7 = "Multiplier"
slot8 = "1794/769"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Metering"
slot6 = slot6[slot7]
slot7 = "Formatting"
slot6 = slot6[slot7]
slot7 = "Divisor"
slot8 = "1794/770"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Metering"
slot6 = slot6[slot7]
slot7 = "HistoricalConsumption"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Metering"
slot6 = slot6[slot7]
slot7 = "HistoricalConsumption"
slot6 = slot6[slot7]
slot7 = "InstantaneousDemand"
slot8 = "1794/1024"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IasZone"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IasZone"
slot6 = slot6[slot7]
slot7 = "ZoneInformation"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IasZone"
slot6 = slot6[slot7]
slot7 = "ZoneInformation"
slot6 = slot6[slot7]
slot7 = "ZoneStatus"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IasZone"
slot6 = slot6[slot7]
slot7 = "ZoneInformation"
slot6 = slot6[slot7]
slot7 = "ZoneStatus"
slot6 = slot6[slot7]
slot7 = "Alarm1"
slot8 = "1280/2/0/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IasZone"
slot6 = slot6[slot7]
slot7 = "ZoneInformation"
slot6 = slot6[slot7]
slot7 = "ZoneStatus"
slot6 = slot6[slot7]
slot7 = "Alarm2"
slot8 = "1280/2/0/2"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IasZone"
slot6 = slot6[slot7]
slot7 = "ZoneInformation"
slot6 = slot6[slot7]
slot7 = "ZoneStatus"
slot6 = slot6[slot7]
slot7 = "Tamper"
slot8 = "1280/2/0/3"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IasZone"
slot6 = slot6[slot7]
slot7 = "ZoneInformation"
slot6 = slot6[slot7]
slot7 = "ZoneStatus"
slot6 = slot6[slot7]
slot7 = "Battery"
slot8 = "1280/2/0/4"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IasZone"
slot6 = slot6[slot7]
slot7 = "ZoneInformation"
slot6 = slot6[slot7]
slot7 = "ZoneStatus"
slot6 = slot6[slot7]
slot7 = "SupervisionReports"
slot8 = "1280/2/0/5"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IasZone"
slot6 = slot6[slot7]
slot7 = "ZoneInformation"
slot6 = slot6[slot7]
slot7 = "ZoneStatus"
slot6 = slot6[slot7]
slot7 = "RestoreReports"
slot8 = "1280/2/0/6"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IasZone"
slot6 = slot6[slot7]
slot7 = "ZoneInformation"
slot6 = slot6[slot7]
slot7 = "ZoneStatus"
slot6 = slot6[slot7]
slot7 = "Trouble"
slot8 = "1280/2/0/7"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IasZone"
slot6 = slot6[slot7]
slot7 = "ZoneInformation"
slot6 = slot6[slot7]
slot7 = "ZoneStatus"
slot6 = slot6[slot7]
slot7 = "AC"
slot8 = "1280/2/0/8"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IasZone"
slot6 = slot6[slot7]
slot7 = "ZoneInformation"
slot6 = slot6[slot7]
slot7 = "ZoneStatus"
slot6 = slot6[slot7]
slot7 = "Test"
slot8 = "1280/2/0/9"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "IasZone"
slot6 = slot6[slot7]
slot7 = "ZoneInformation"
slot6 = slot6[slot7]
slot7 = "ZoneStatus"
slot6 = slot6[slot7]
slot7 = "BatteryDefect"
slot8 = "1280/2/0/10"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "NumberOfResets"
slot8 = "2821/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "PersistentMemoryWrites"
slot8 = "2821/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "MacRxBcast"
slot8 = "2821/256"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "MacTxBcast"
slot8 = "2821/257"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "MacRxUcast"
slot8 = "2821/258"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "MacTxUcast"
slot8 = "2821/259"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "MacTxUcastRetry"
slot8 = "2821/260"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "MacTxUcastFail"
slot8 = "2821/261"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "APSRxBcast"
slot8 = "2821/262"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "APSTxBcast"
slot8 = "2821/263"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "APSRxUcast"
slot8 = "2821/264"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "APSTxUcastSuccess"
slot8 = "2821/265"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "APSTxUcastRetry"
slot8 = "2821/266"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "APSTxUcastFail"
slot8 = "2821/267"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "RouteDiscInitiated"
slot8 = "2821/268"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "NeighborAdded"
slot8 = "2821/269"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "NeighborRemoved"
slot8 = "2821/270"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "NeighborStale"
slot8 = "2821/271"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "JoinIndication"
slot8 = "2821/272"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "ChildMoved"
slot8 = "2821/273"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "NWKFCFailure"
slot8 = "2821/274"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "APSFCFailure"
slot8 = "2821/275"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "APSUnauthorizedKey"
slot8 = "2821/276"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "NWKDecryptFailures"
slot8 = "2821/277"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "APSDecryptFailures"
slot8 = "2821/278"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "PacketBufferAllocateFailures"
slot8 = "2821/279"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "RelayedUcast"
slot8 = "2821/280"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "PhytoMACqueuelimitreached"
slot8 = "2821/281"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "PacketValidatedropcount"
slot8 = "2821/282"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "AverageMACRetryPerAPSMessageSent"
slot8 = "2821/283"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "LastMessageLQI"
slot8 = "2821/284"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "LastMessageRSSI"
slot8 = "2821/285"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = {}
slot6.Danfoss = slot7
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot6 = slot6.Danfoss
slot7 = "DanfossSystemStatusCode"
slot8 = "2821/16384/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot6 = slot6.Danfoss
slot7 = "DanfossSystemStatusWater"
slot8 = "2821/16896/4678"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Neighbor"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Neighbor"
slot6 = slot6[slot7]
slot7 = "Table"
slot8 = "32817/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Routing"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Routing"
slot6 = slot6[slot7]
slot7 = "Table"
slot8 = "32818/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Binding"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Binding"
slot6 = slot6[slot7]
slot7 = "Table"
slot8 = "32819/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Profalux"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Profalux"
slot6 = slot6[slot7]
slot7 = "SetPositionAndOrientation"
slot8 = "64545/1/4368"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Cleode"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Cleode"
slot6 = slot6[slot7]
slot7 = "64513/0"
slot6.Mode = slot7
slot6 = slot1.Attribute
slot7 = "Nexelec"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "EnhancedSmokeAlarm"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "EnhancedSmokeAlarm"
slot6 = slot6[slot7]
slot7 = "ConditionAnalysis"
slot8 = "64784/0/4681"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "EnhancedSmokeAlarm"
slot6 = slot6[slot7]
slot7 = "TimeSinceLastMaintenance"
slot8 = "64784/1/4681"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "EnhancedSmokeAlarm"
slot6 = slot6[slot7]
slot7 = "RemainingProductLifeTime"
slot8 = "64784/2/4681"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "EnhancedSmokeAlarm"
slot6 = slot6[slot7]
slot7 = "EnergyStatus"
slot8 = "64784/3/4681"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "IndoorAirQuality"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "IndoorAirQuality"
slot6 = slot6[slot7]
slot7 = "AirQuality"
slot8 = "64785/0/4681"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "IndoorAirQuality"
slot6 = slot6[slot7]
slot7 = "HygrothermalComfort"
slot8 = "64785/1/4681"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "IndoorAirQuality"
slot6 = slot6[slot7]
slot7 = "Global"
slot8 = "64785/2/4681"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "IndoorAirQuality"
slot6 = slot6[slot7]
slot7 = "Current"
slot8 = "64785/3/4681"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "SomfyIRBlaster"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "DBR"
slot8 = "65025/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "DBL"
slot8 = "65025/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Ballast"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Ballast"
slot6 = slot6[slot7]
slot7 = "PhysicalMinLevel"
slot8 = "769/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Ballast"
slot6 = slot6[slot7]
slot7 = "PhysicalMaxLevel"
slot8 = "769/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Ballast"
slot6 = slot6[slot7]
slot7 = "Status"
slot8 = {}
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Ballast"
slot6 = slot6[slot7]
slot7 = "Status"
slot6 = slot6[slot7]
slot7 = "Ballast"
slot8 = "769/2/0/0"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Ballast"
slot6 = slot6[slot7]
slot7 = "Status"
slot6 = slot6[slot7]
slot7 = "Lamp"
slot8 = "769/2/0/1"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Ballast"
slot6 = slot6[slot7]
slot7 = "MinLevel"
slot8 = "769/16"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Ballast"
slot6 = slot6[slot7]
slot7 = "MaxLevel"
slot8 = "769/17"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = "Ballast"
slot6 = slot6[slot7]
slot7 = {}
slot6.Schneider = slot7
slot6 = slot1.Attribute
slot7 = "Ballast"
slot6 = slot6[slot7]
slot6 = slot6.Schneider
slot7 = "ControlMode"
slot8 = "769/57344/4190"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot7 = {}
slot6.Schneider = slot7
slot6 = slot1.Attribute
slot6 = slot6.Schneider
slot7 = "SwitchIndication"
slot8 = "65303/0/4190"
slot6[slot7] = slot8
slot6 = slot1.Attribute
slot6 = slot6.Schneider
slot7 = "SwitchActions"
slot8 = "65303/1/4190"
slot6[slot7] = slot8
slot6 = "Command"
slot7 = {}
slot1[slot6] = slot7
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = {}
slot6.Basic = slot7
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Basic
slot7 = {}
slot6.Somfy = slot7
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Basic
slot6 = slot6.Somfy
slot7 = "ResetFactoryDefaultsSomfy"
slot8 = "0/0/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Basic
slot6 = slot6.Somfy
slot7 = "SomfyLeaveNetwork"
slot8 = "0/1/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = {}
slot6.Identify = slot7
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Identify
slot7 = "3/0"
slot6.Identify = slot7
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Identify
slot7 = "IdentifyQuery"
slot8 = "3/1"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Identify
slot7 = "TriggerEffect"
slot8 = "3/64"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = {}
slot6.Groups = slot7
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Groups
slot7 = "AddGroup"
slot8 = "4/0"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Groups
slot7 = "ViewGroup"
slot8 = "4/1"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Groups
slot7 = "GetGroupMembership"
slot8 = "4/2"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Groups
slot7 = "RemoveGroup"
slot8 = "4/3"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Groups
slot7 = "RemoveAllGroups"
slot8 = "4/4"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Groups
slot7 = "AddGroupIfIdentifying"
slot8 = "4/5"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = {}
slot6.Scenes = slot7
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Scenes
slot7 = "AddScene"
slot8 = "5/0"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Scenes
slot7 = "ViewScene"
slot8 = "5/1"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Scenes
slot7 = "RemoveScene"
slot8 = "5/2"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Scenes
slot7 = "RemoveAllScene"
slot8 = "5/3"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Scenes
slot7 = "StoreScene"
slot8 = "5/4"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Scenes
slot7 = "RecallScene"
slot8 = "5/5"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Scenes
slot7 = "GetSceneMembership"
slot8 = "5/6"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Scenes
slot7 = "EnhancedAddScene"
slot8 = "5/7"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Scenes
slot7 = "EnhancedViewScene"
slot8 = "5/8"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Scenes
slot7 = "CopyScene"
slot8 = "5/9"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = {}
slot6.OnOff = slot7
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.OnOff
slot7 = "Off"
slot8 = "6/0"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.OnOff
slot7 = "On"
slot8 = "6/1"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.OnOff
slot7 = "Toggle"
slot8 = "6/2"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = {}
slot6.LevelControl = slot7
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "MoveToLevel"
slot8 = "8/0"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "Move"
slot8 = "8/1"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "Step"
slot8 = "8/2"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "Stop"
slot8 = "8/3"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "StopWithOnOff"
slot8 = "8/7"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "MoveToLevelWithOnOff"
slot8 = "8/4"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "MoveWithOnOff"
slot8 = "8/5"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "StepWithOnOff"
slot8 = "8/6"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "MoveToClosestFrequency"
slot8 = "8/8"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = {}
slot6.WindowCovering = slot7
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot7 = "UpOrOpen"
slot8 = "258/0"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot7 = "DownOrClose"
slot8 = "258/1"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot7 = "Stop"
slot8 = "258/2"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot7 = "GoToLiftValue"
slot8 = "258/4"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot7 = "GoToLiftPercent"
slot8 = "258/5"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot7 = "GoToTiltValue"
slot8 = "258/7"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot7 = "GoToTiltPercent"
slot8 = "258/8"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot7 = {}
slot6.Schneider = slot7
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot6 = slot6.Schneider
slot7 = "StopOrStepLiftPercentage"
slot8 = "258/128/4190"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot7 = {}
slot6.Somfy = slot7
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = "SomfyStep"
slot8 = "258/0/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = "SomfyStoreLimit"
slot8 = "258/1/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = "SomfyStepOutLimit"
slot8 = "258/2/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = "ReverseMotorDirection"
slot8 = "258/3/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = "SomfyConfigureRange"
slot8 = "258/4/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = {}
slot6.Thermostat = slot7
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "SetpointRaiseLower"
slot8 = "513/0"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "SetWeeklySchedule"
slot8 = "513/1"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "GetWeeklySchedule"
slot8 = "513/2"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "ClearWeeklySchedule"
slot8 = "513/3"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "GetRelayStatusLog"
slot8 = "513/4"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "MoveToHUE"
slot8 = "768/0"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "MoveHUE"
slot8 = "768/1"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "StepHUE"
slot8 = "768/2"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "MoveToSaturation"
slot8 = "768/3"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "MoveSaturation"
slot8 = "768/4"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "StepSaturation"
slot8 = "768/5"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "MoveToHUEAndSaturation"
slot8 = "768/6"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "MoveToColorXY"
slot8 = "768/7"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "MoveColorXY"
slot8 = "768/8"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "StepColorXY"
slot8 = "768/9"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "MoveToColorTemperature"
slot8 = "768/10"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "EnhancedMoveToHUE"
slot8 = "768/64"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "EnhancedMoveHUE"
slot8 = "768/65"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "EnhancedStepHUE"
slot8 = "768/66"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "EnhancedMoveToHUEAndSaturation"
slot8 = "768/67"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "ColorLoopSet"
slot8 = "768/68"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "StopMoveStep"
slot8 = "768/71"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "StepColorTemperature"
slot8 = "768/76"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "Profalux"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "Profalux"
slot6 = slot6[slot7]
slot7 = "SetPositionAndOrientation"
slot8 = "8/16"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "Cleode"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "Cleode"
slot6 = slot6[slot7]
slot7 = "SetMode"
slot8 = "64513/0"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "TransmitIRData"
slot8 = "65025/0/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "LearnIRData"
slot8 = "65025/4/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "TransmitLearnedIRData"
slot8 = "65025/6/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "StoreLearnedIRData"
slot8 = "65025/8/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "AddExecutionSetEntry"
slot8 = "65025/10/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "RemoveExecutionSet"
slot8 = "65025/11/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "RunExecutionSet"
slot8 = "65025/13/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "SetButtonBehavior"
slot8 = "65025/14/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "StopIROperation"
slot8 = "65025/15/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "DeleteAllIRCodes"
slot8 = "65025/16/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "DeleteAllLearnedIRCodes"
slot8 = "65025/17/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "GetButtonBehavior"
slot8 = "65025/18/4640"
slot6[slot7] = slot8
slot6 = "Command"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "GetRemainingAvailableMemory"
slot8 = "65025/20/4640"
slot6[slot7] = slot8
slot6 = "CommandStatus"
slot7 = {}
slot1[slot6] = slot7
slot6 = "CommandStatus"
slot6 = slot1[slot6]
slot7 = "SUCCESS"
slot8 = 0
slot6[slot7] = slot8
slot6 = "CommandIdentifier"
slot7 = {}
slot1[slot6] = slot7
slot6 = "CommandIdentifier"
slot6 = slot1[slot6]
slot7 = "ReadAttributesResponse"
slot8 = 1
slot6[slot7] = slot8
slot6 = "CommandIdentifier"
slot6 = slot1[slot6]
slot7 = "ReportAttributes"
slot8 = 10
slot6[slot7] = slot8
slot6 = "CommandIdentifier"
slot6 = slot1[slot6]
slot7 = "WriteAttributeReponses"
slot8 = 4
slot6[slot7] = slot8
slot6 = "CommandIdentifier"
slot6 = slot1[slot6]
slot7 = "Ias"
slot8 = {}
slot6[slot7] = slot8
slot6 = "CommandIdentifier"
slot6 = slot1[slot6]
slot7 = "Ias"
slot6 = slot6[slot7]
slot7 = "ZoneStatusChangeNotification"
slot8 = "1280/0"
slot6[slot7] = slot8
slot6 = "CommandIdentifier"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot8 = {}
slot6[slot7] = slot8
slot6 = "CommandIdentifier"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "ResponseGetRemainingAvailableMemory"
slot8 = "65025/21/4640"
slot6[slot7] = slot8
slot6 = "CommandIdentifier"
slot6 = slot1[slot6]
slot7 = "OTA"
slot8 = {}
slot6[slot7] = slot8
slot6 = "CommandIdentifier"
slot6 = slot1[slot6]
slot7 = "OTA"
slot6 = slot6[slot7]
slot7 = "QueryNextImageRequestCommand"
slot8 = "25/1"
slot6[slot7] = slot8
slot6 = "CommandIdentifier"
slot6 = slot1[slot6]
slot7 = "OTA"
slot6 = slot6[slot7]
slot7 = "UpgradeEndRequestCommand"
slot8 = "25/6"
slot6[slot7] = slot8
slot6 = "CommandIdentifier"
slot6 = slot1[slot6]
slot7 = {}
slot6.Thermostat = slot7
slot6 = "CommandIdentifier"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "GetWeeklySchedule"
slot8 = "513/0"
slot6[slot7] = slot8
slot6 = "Enum"
slot7 = {}
slot1[slot6] = slot7
slot6 = "Enum"
slot6 = slot1[slot6]
slot7 = {}
slot6.LevelControl = slot7
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "Move"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "Move"
slot6 = slot6[slot7]
slot7 = "Up"
slot8 = 0
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "Move"
slot6 = slot6[slot7]
slot7 = "Down"
slot8 = 1
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "Step"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "Step"
slot6 = slot6[slot7]
slot7 = "Up"
slot8 = 0
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "Step"
slot6 = slot6[slot7]
slot7 = "Down"
slot8 = 1
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot7 = "LibEmber"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot7 = "LibEmber"
slot6 = slot6[slot7]
slot7 = "OutgoingMulticast"
slot8 = 3
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot7 = "ControllableType"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot7 = "ControllableType"
slot6 = slot6[slot7]
slot7 = "Group"
slot8 = 7
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot7 = {}
slot6.Thermostat = slot7
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "SetpointLimits"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "SetpointLimits"
slot6 = slot6[slot7]
slot7 = "MinHeat"
slot8 = "7"
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "SetpointLimits"
slot6 = slot6[slot7]
slot7 = "MaxHeat"
slot8 = "30"
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "SetpointLimits"
slot6 = slot6[slot7]
slot7 = "MinCool"
slot8 = "16"
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "SetpointLimits"
slot6 = slot6[slot7]
slot7 = "MaxCool"
slot8 = "32"
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "ModesMasks"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "ModesMasks"
slot6 = slot6[slot7]
slot7 = "Cooling"
slot8 = 969
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "ModesMasks"
slot6 = slot6[slot7]
slot7 = "Heating"
slot8 = 689
slot6[slot7] = slot8
slot6 = "Enum"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "ModesMasks"
slot6 = slot6[slot7]
slot7 = "CoolingAndHeating"
slot8 = 1019
slot6[slot7] = slot8
slot6 = {
	[0] = "Unknown",
	"Mains (single phase)",
	"Mains (3 phase)",
	"Battery",
	"DC source",
	"Emergency mains constantly powered",
	"Emergency mains and transfer switch"
}
slot1.PowerSource = slot6
slot6 = "CleodeZPilotModeToHeatingStatusState"
slot7 = {
	[0] = "comfort",
	"comfort-1",
	"comfort-2",
	"eco",
	"frostprotection",
	"offloading"
}
slot1[slot6] = slot7
slot6 = "NexelecDaafToEnergyStatusState"
slot7 = {
	[0] = "full",
	"normal",
	"low",
	"verylow"
}
slot1[slot6] = slot7
slot6 = "NexelecDaafHygrothermalComfortToAirQualityState"
slot7 = {
	[0] = "good",
	"medium",
	"bad",
	"error"
}
slot1[slot6] = slot7
slot6 = "NexelecDaafIndoorAirAnalysiToHygrothermalComfortState"
slot7 = {
	[0] = "optimalAirRange",
	"slightlyDryAirRange",
	"slightlyHumidRange",
	"slightlyHotAndHumidRange",
	"dryAirRange",
	"highHumidityRange",
	"highTemperatureAndHumidityRange",
	"excessivelyDryAirRange",
	"mouldsRisk",
	"mouldsAndDustMitesRisk",
	nil,
	nil,
	nil,
	nil,
	"temperatureOrHumidityOutOfAnalysisRange",
	"error"
}
slot1[slot6] = slot7
slot6 = "NexelecDaafIndoorAirAnalysiToGlobalState"
slot7 = {
	[0] = "excellent",
	"good",
	"fair",
	"poor",
	"bad",
	nil,
	nil,
	"error"
}
slot1[slot6] = slot7
slot6 = "NexelecDaafIndoorAirAnalysiToCurrentState"
slot7 = {
	[0] = "all",
	"drynessIndicator",
	"mouldIndicator",
	"dustMitesIndicator",
	"CO",
	"CO2",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"error"
}
slot1[slot6] = slot7
slot6 = "nodeStatus"
slot7 = {}
slot1[slot6] = slot7
slot6 = "nodeStatus"
slot6 = slot1[slot6]
slot7 = "DONE"
slot8 = 0
slot6[slot7] = slot8
slot6 = "nodeStatus"
slot6 = slot1[slot6]
slot7 = "UNAVAILABLE"
slot8 = 10
slot6[slot7] = slot8
slot6 = "nodeStatus"
slot6 = slot1[slot6]
slot7 = "DELETED"
slot8 = 2
slot6[slot7] = slot8
slot6 = "Mapping"
slot7 = {}
slot1[slot6] = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = {}
slot6.Attribute = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = {}
slot6.Basic = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot6 = slot6.Basic
slot7 = "SchneiderProductIdentifier"
slot8 = {
	[17424.0] = "NH motion relay",
	[17425.0] = "NH motion dimmer",
	[17450.0] = "Freelocatable switch",
	[17422.0] = "NH push button shutter",
	[17406.0] = "shutter puck",
	[17501.0] = "2 gang",
	[17421.0] = "NH push button dimmer",
	[17405.0] = "dimmer puck",
	[17500.0] = "1 gang",
	[17420.0] = "NH push button relay",
	[17404.0] = "switch puck",
	[17423.0] = "NH rotary dimmer"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "ColorCluster"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "ColorCluster"
slot6 = slot6[slot7]
slot7 = "ColorMode"
slot8 = {
	[0] = "hueAndStaturation",
	"cieXYZ",
	"temperature"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "ColorCluster"
slot6 = slot6[slot7]
slot7 = "ColorLoopActive"
slot8 = {
	[0] = "disabled",
	"enabled"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "Ballast"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "Ballast"
slot6 = slot6[slot7]
slot7 = {}
slot6.Schneider = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "Ballast"
slot6 = slot6[slot7]
slot6 = slot6.Schneider
slot7 = "ControlMode"
slot8 = {
	[0] = "automatic",
	"RC mode",
	"RL mode",
	"RL-LED"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = {}
slot6.WindowCovering = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot6 = slot6.WindowCovering
slot7 = {}
slot6.Mode = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Mode
slot7 = {
	[0] = "counterClockwise",
	"clockwise"
}
slot6.MotorDirection = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Mode
slot7 = {
	[0] = "run in normal mode",
	nil,
	"run in calibration mode"
}
slot6.MotorRun = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Mode
slot7 = {
	[0] = "motor is running normally",
	nil,
	nil,
	nil,
	"motor is running in maintenance mode"
}
slot6.MotorRunning = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Mode
slot7 = {
	[0] = "LEDs are off",
	[8.0] = "LEDs will display feedback"
}
slot6.LED = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot6 = slot6.WindowCovering
slot7 = "SchneiderProtectionStatus"
slot8 = {
	[0] = "sun protection not active",
	"sun protection active"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot6 = slot6.WindowCovering
slot7 = "SchneiderProtectionSensor"
slot8 = {
	[0] = "sun protection sensor not cennected",
	"sun protection sensor connected"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot6 = slot6.WindowCovering
slot7 = {}
slot6.Somfy = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = {
	[0] = "no error",
	"received user command when disabled",
	"motor is blocked by obstacle",
	"motor overheat"
}
slot6.Error = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = {
	[0] = "not moving",
	"opening",
	"closing"
}
slot6.SomfyOperationalStatus = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "IlluminanceMeasurement"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "IlluminanceMeasurement"
slot6 = slot6[slot7]
slot7 = "LightSensorType"
slot8 = {
	[0] = "Photodiode",
	"CMOS"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "OccupancySensor"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "OccupancySensor"
slot6 = slot6[slot7]
slot7 = "OccupancySensorType"
slot8 = {
	[0] = "PIR",
	"ultrasonic",
	"PIR and utlrasonic",
	"physical contact"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "ColorCluster"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "ColorCluster"
slot6 = slot6[slot7]
slot7 = "MoveHUE"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "ColorCluster"
slot6 = slot6[slot7]
slot7 = "MoveHUE"
slot6 = slot6[slot7]
slot7 = "MoveMode"
slot8 = {
	[0] = "stop",
	"up",
	"reserved",
	"down"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "ColorCluster"
slot6 = slot6[slot7]
slot7 = "StopMoveStep"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "ColorCluster"
slot6 = slot6[slot7]
slot7 = "StopMoveStep"
slot6 = slot6[slot7]
slot7 = "StepMode"
slot8 = {
	[0] = "reserved",
	"up",
	"reserved",
	"down"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "ColorCluster"
slot6 = slot6[slot7]
slot7 = "MoveToHUE"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "ColorCluster"
slot6 = slot6[slot7]
slot7 = "MoveToHUE"
slot6 = slot6[slot7]
slot7 = "FadeMode"
slot8 = {
	[0] = "shortest",
	"longest",
	"up",
	"down"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "ColorCluster"
slot6 = slot6[slot7]
slot7 = "ColorLoop"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "ColorCluster"
slot6 = slot6[slot7]
slot7 = "ColorLoop"
slot6 = slot6[slot7]
slot7 = "Direction"
slot8 = {
	[0] = "decremented",
	"incremented"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "ColorCluster"
slot6 = slot6[slot7]
slot7 = "ColorLoop"
slot6 = slot6[slot7]
slot7 = "Action"
slot8 = {
	[0] = "deactivated",
	"activatedStartFromColorLoopStartEnhancedHue",
	"activatedStartFromEnhancedCurrentHue"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = {}
slot6.WindowCovering = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot6 = slot6.WindowCovering
slot7 = {}
slot6.Somfy = slot7
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = "SomfyStep"
slot8 = {
	["tilt up"] = 2,
	["lift down"] = 1,
	["lift up"] = 0,
	["tilt down"] = 3
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = "SomfyStoreLimit"
slot8 = {
	["limit down"] = 1,
	["limit up"] = 0
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = "SomfyStepOutLimit"
slot8 = {
	down = 1,
	up = 0
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = "SomfyConfigureRange"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = "SomfyConfigureRange"
slot6 = slot6[slot7]
slot7 = "RangeId"
slot8 = {
	tilt = 0,
	backslash = 1
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot6 = slot6.WindowCovering
slot6 = slot6.Somfy
slot7 = "SomfyConfigureRange"
slot6 = slot6[slot7]
slot7 = "CommandId"
slot8 = {
	["full range"] = 1,
	["half range"] = 2,
	["start range"] = 0
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "SwitchIndicationStatusState"
slot8 = {
	[0] = "indicatorOnWhenLoadOn",
	"indicatorAlwaysOn",
	"indicatorOnWhenLoadOff",
	"indicatorAlwaysOff"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "SwitchActionsStatusState"
slot8 = {
	[0] = "light",
	"dimmer",
	"standardShutter",
	"schneiderShutter",
	nil,
	"toggleLight",
	"toggleDimmer",
	[254.0] = "dimmerOpp",
	[252.0] = "schneiderShutterOpp",
	[253.0] = "standardShutterOpp",
	[255.0] = "lightOpp"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "ControlSequenceOfOperationState"
slot8 = {
	[0] = "coolingOnly",
	"coolingWithReheat",
	"heatingOnly",
	"heatingWithReheat",
	"coolingHeating",
	"coolingHeatingWithReheat"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "SystemModeState"
slot8 = {
	[0] = "off",
	"auto",
	nil,
	"cool",
	"heat",
	"emergencyHeating",
	"precooling",
	"fanOnly",
	"dry",
	"sleep"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot7 = "Command"
slot6 = slot6[slot7]
slot7 = "DayOfWeek"
slot8 = {
	[0] = "sunday",
	"monday",
	"tuesday",
	"wednesday",
	"thursday",
	"friday",
	"saturday",
	"vacation"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "Imhotep"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "Imhotep"
slot6 = slot6[slot7]
slot7 = "DerogatedMode"
slot8 = {
	[0] = "auto",
	"comfort",
	"eco",
	"frostprotection",
	"reserved",
	"reserved",
	"reserved",
	"reserved",
	"reserved",
	"reserved",
	"reserved",
	"reserved",
	"reserved",
	"reserved",
	"reserved",
	"reserved",
	"reserved",
	"reserved",
	"reserved",
	"reserved",
	"comfort+",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"auto_comfort",
	"auto_eco",
	"auto_frostprotection",
	"auto_comfort+"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "Imhotep"
slot6 = slot6[slot7]
slot7 = "Selflearning"
slot8 = {
	[0] = "off",
	"on"
}
slot6[slot7] = slot8
slot6 = "Mapping"
slot6 = slot1[slot6]
slot6 = slot6.Attribute
slot7 = "Imhotep"
slot6 = slot6[slot7]
slot7 = "WindowsStatus"
slot8 = {
	[0] = "close",
	"open"
}
slot6[slot7] = slot8
slot6 = "Cluster"
slot7 = {}
slot1[slot6] = slot7
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Identifier"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Identifier"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 3
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "levelControl"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "levelControl"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 8
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Profalux"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Profalux"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 64545
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = {}
slot6.OnOff = slot7
slot6 = "Cluster"
slot6 = slot1[slot6]
slot6 = slot6.OnOff
slot7 = "Id"
slot8 = 6
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = {}
slot6.WindowCovering = slot7
slot6 = "Cluster"
slot6 = slot1[slot6]
slot6 = slot6.WindowCovering
slot7 = "Id"
slot8 = 258
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Cleode"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Cleode"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 64513
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "IasZone"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "IasZone"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 1280
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = {}
slot6.PowerConfiguration = slot7
slot6 = "Cluster"
slot6 = slot1[slot6]
slot6 = slot6.PowerConfiguration
slot7 = "Id"
slot8 = 1
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = {}
slot6.Basic = slot7
slot6 = "Cluster"
slot6 = slot1[slot6]
slot6 = slot6.Basic
slot7 = "Id"
slot8 = 0
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Metering"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Metering"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 1794
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = {}
slot6.PollControl = slot7
slot6 = "Cluster"
slot6 = slot1[slot6]
slot6 = slot6.PollControl
slot7 = "Id"
slot8 = 32
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "TemperatureMeasurement"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "TemperatureMeasurement"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 1026
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "RelativeHumidity"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "RelativeHumidity"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 1029
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "ElectricalMeasurement"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "ElectricalMeasurement"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 2820
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Nexelec"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "IndoorAirQuality"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "IndoorAirQuality"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 64785
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "EnhancedSmokeAlarm"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Nexelec"
slot6 = slot6[slot7]
slot7 = "EnhancedSmokeAlarm"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 64784
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "SomfyIRBlaster"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 65025
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "ColorControl"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 768
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = {}
slot6.Schneider = slot7
slot6 = "Cluster"
slot6 = slot1[slot6]
slot6 = slot6.Schneider
slot7 = "Id"
slot8 = 65303
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Ballast"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Ballast"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 769
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "OTA"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "OTA"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 25
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Scene"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Scene"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 5
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = {}
slot6.Thermostat = slot7
slot6 = "Cluster"
slot6 = slot1[slot6]
slot6 = slot6.Thermostat
slot7 = "Id"
slot8 = 513
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "ThermostatUIConfiguration"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "ThermostatUIConfiguration"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 516
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "IlluminanceMeasurement"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "IlluminanceMeasurement"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 1024
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "OccupancySensing"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "OccupancySensing"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 1030
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Diagnostic"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = "Diagnostic"
slot6 = slot6[slot7]
slot7 = "Id"
slot8 = 2821
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = {}
slot6.LevelControl = slot7
slot6 = "Cluster"
slot6 = slot1[slot6]
slot6 = slot6.LevelControl
slot7 = "Id"
slot8 = 8
slot6[slot7] = slot8
slot6 = "Cluster"
slot6 = slot1[slot6]
slot7 = {}
slot6.Time = slot7
slot6 = "Cluster"
slot6 = slot1[slot6]
slot6 = slot6.Time
slot7 = "Id"
slot8 = 10
slot6[slot7] = slot8
slot6 = "ExtractZCLPayloadValue"

function slot7(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.Converter
	slot2 = slot2.DataType
	slot2 = slot2[slot0]

	if slot2 == nil then
		slot2 = overkiz
		slot2 = slot2.magic
		slot2 = slot2.IGNORE
		slot3 = 0

		return slot2, slot3
	else
		slot2 = slot0
		slot2 = slot2.Converter
		slot2 = slot2.DataType
		slot2 = slot2[slot0]
		slot3 = slot1

		return slot2(slot3)
	end
end

slot1[slot6] = slot7
slot6 = "ExtractZCLPayload"
slot7 = {}
slot1[slot6] = slot7
slot6 = "ExtractZCLPayload"
slot6 = slot1[slot6]
slot7 = "CommandIdentifier"
slot7 = slot1[slot7]
slot8 = "ReadAttributesResponse"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = {}
	slot2 = #slot0
	slot2 = slot2 + 1
	slot3 = slot0
	slot3 = slot3.log
	slot4 = "ReadAttributesResponse payload"
	slot5 = slot0

	slot3(slot4, slot5)

	slot3 = 1

	while slot2 > slot3 do
		slot4 = {}
		slot5 = slot1
		slot6 = slot0[slot3]
		slot7 = slot3 + 1
		slot7 = slot0[slot7]
		slot5 = slot5(slot6, slot7)
		slot4.attributeIdentifier = slot5
		slot3 = slot3 + 2
		slot5 = slot0[slot3]
		slot4.status = slot5
		slot3 = slot3 + 1
		slot5 = slot4.status
		slot6 = slot0
		slot6 = slot6.CommandStatus
		slot6 = slot6.SUCCESS

		if slot5 == slot6 then
			slot5 = slot0[slot3]
			slot4.attributeDataType = slot5
			slot3 = slot3 + 1
			slot5 = slot0
			slot5 = slot5.ExtractZCLPayloadValue
			slot6 = slot4.attributeDataType
			slot8 = slot0
			slot7 = slot0.sub
			slot9 = slot3
			slot10 = slot2 - 1
			slot5, slot6 = slot5(slot6, slot7(slot8, slot9, slot10))
			slot4.value = slot5
			slot3 = slot3 + slot6
		else
			slot5 = overkiz
			slot5 = slot5.magic
			slot5 = slot5.IGNORE
			slot4.value = slot5
		end

		slot5 = tostring
		slot6 = slot4.attributeIdentifier
		slot5 = slot5(slot6)
		slot1[slot5] = slot4
	end

	return slot1
end

slot6[slot7] = slot8
slot6 = "ExtractZCLPayload"
slot6 = slot1[slot6]
slot7 = "CommandIdentifier"
slot7 = slot1[slot7]
slot8 = "ReportAttributes"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = {}
	slot2 = #slot0
	slot2 = slot2 + 1
	slot3 = slot0
	slot3 = slot3.log
	slot4 = "ReportAttributes payload"
	slot5 = slot0

	slot3(slot4, slot5)

	slot3 = 1
	slot4 = slot2 - 3

	while slot3 < slot4 do
		slot4 = {}
		slot5 = slot1
		slot6 = slot0[slot3]
		slot7 = slot3 + 1
		slot7 = slot0[slot7]
		slot5 = slot5(slot6, slot7)
		slot4.attributeIdentifier = slot5
		slot3 = slot3 + 2
		slot5 = slot0[slot3]
		slot4.attributeDataType = slot5
		slot3 = slot3 + 1
		slot5 = slot0
		slot5 = slot5.ExtractZCLPayloadValue
		slot6 = slot4.attributeDataType
		slot8 = slot0
		slot7 = slot0.sub
		slot9 = slot3
		slot10 = slot2 - 1
		slot5, slot6 = slot5(slot6, slot7(slot8, slot9, slot10))
		slot4.value = slot5
		slot7 = tostring
		slot8 = slot4.attributeIdentifier
		slot7 = slot7(slot8)
		slot1[slot7] = slot4

		if slot6 ~= nil and slot6 ~= 0 then
			slot3 = slot3 + slot6
		else
			break
		end
	end

	return slot1
end

slot6[slot7] = slot8
slot6 = "ExtractZCLPayload"
slot6 = slot1[slot6]
slot7 = "CommandIdentifier"
slot7 = slot1[slot7]
slot8 = "Ias"
slot7 = slot7[slot8]
slot8 = "ZoneStatusChangeNotification"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = {}
	slot2 = slot0
	slot3 = slot0[1]
	slot4 = slot0[2]
	slot2 = slot2(slot3, slot4)
	slot3 = slot0[3]
	slot4 = slot0[4]
	slot5 = slot0
	slot6 = slot0[5]
	slot7 = slot0[6]
	slot5 = slot5(slot6, slot7)
	slot6 = slot1
	slot6 = slot6.log
	slot7 = "ZoneStatusChangeNotification payload"
	slot8 = slot0

	slot6(slot7, slot8)

	slot6 = {}
	slot7 = 2
	slot6.attributeIdentifier = slot7
	slot6.attributeValue = slot2
	slot7 = {
		zoneStatus = slot2,
		extentedStatus = slot3,
		zoneId = slot4,
		delay = slot5
	}
	slot6.value = slot7
	slot8 = tostring
	slot9 = slot6.attributeIdentifier
	slot8 = slot8(slot9)
	slot1[slot8] = slot6

	return slot1
end

slot6[slot7] = slot8
slot6 = "ExtractZCLPayload"
slot6 = slot1[slot6]
slot7 = "CommandIdentifier"
slot7 = slot1[slot7]
slot8 = "OTA"
slot7 = slot7[slot8]
slot8 = "QueryNextImageRequestCommand"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = tonumber
	slot2 = slot0[1]
	slot1 = slot1(slot2)
	slot2 = {}
	slot4 = slot0
	slot3 = slot0.readUInt16
	slot5 = 2
	slot6 = false
	slot3 = slot3(slot4, slot5, slot6)
	slot2.manufacturerCode = slot3
	slot4 = slot0
	slot3 = slot0.readUInt16
	slot5 = 4
	slot6 = false
	slot3 = slot3(slot4, slot5, slot6)
	slot2.imageType = slot3
	slot4 = slot0
	slot3 = slot0.readUInt32
	slot5 = 6
	slot6 = false
	slot3 = slot3(slot4, slot5, slot6)
	slot2.fileVersion = slot3
	slot3 = bit
	slot3 = slot3.band
	slot4 = slot1
	slot5 = 1
	slot3 = slot3(slot4, slot5)

	if slot3 == 1 then
		slot4 = slot0
		slot3 = slot0.readUInt16
		slot5 = 10
		slot6 = false
		slot3 = slot3(slot4, slot5, slot6)
		slot2.hardwareVersion = slot3
	end

	return slot2
end

slot6[slot7] = slot8
slot6 = "ExtractZCLPayload"
slot6 = slot1[slot6]
slot7 = "CommandIdentifier"
slot7 = slot1[slot7]
slot8 = "OTA"
slot7 = slot7[slot8]
slot8 = "UpgradeEndRequestCommand"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = slot0[1]

	if slot1 ~= 0 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {}
	slot3 = slot0
	slot2 = slot0.readUInt16
	slot4 = 2
	slot5 = false
	slot2 = slot2(slot3, slot4, slot5)
	slot1.manufacturerCode = slot2
	slot3 = slot0
	slot2 = slot0.readUInt16
	slot4 = 4
	slot5 = false
	slot2 = slot2(slot3, slot4, slot5)
	slot1.imageType = slot2
	slot3 = slot0
	slot2 = slot0.readUInt32
	slot4 = 6
	slot5 = false
	slot2 = slot2(slot3, slot4, slot5)
	slot1.fileVersion = slot2

	return slot1
end

slot6[slot7] = slot8
slot6 = "ExtractZCLPayload"
slot6 = slot1[slot6]
slot7 = "CommandIdentifier"
slot7 = slot1[slot7]
slot7 = slot7.Thermostat
slot8 = "GetWeeklySchedule"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = tonumber(slot0[1])
	slot2 = tonumber(slot0[2])
	slot4 = bit.band(slot3, 1) ~= 0
	slot5 = bit.band(tonumber(slot0[3]), 2) ~= 0
	slot6 = 4
	slot7 = {}

	if slot4 then
		slot8 = {}
		slot7.heat = slot8
	end

	if slot5 then
		slot8 = {}
		slot7.cool = slot8
	end

	if not slot4 and not slot5 then
		slot8 = {}
		slot9 = {}
		slot8.daysOfWeek = slot9
		slot9 = {}
		slot8.transitions = slot9

		return slot8
	end

	while (not slot4 or slot1 > slot8) and (not slot5 or slot1 > slot8) do
		slot9 = slot0
		slot8 = slot0.readUInt16
		slot10 = slot6
		slot11 = false
		slot8 = slot8(slot9, slot10, slot11)
		slot6 = slot6 + 2

		if slot4 then
			slot9 = slot7.heat
			slot10 = slot7.heat
			slot10 = #slot10
			slot10 = slot10 + 1
			slot11 = {
				transitionTime = slot8
			}
			slot13 = slot0
			slot12 = slot0.readUInt16
			slot14 = slot6
			slot15 = false
			slot12 = slot12(slot13, slot14, slot15)
			slot12 = slot12 / 100
			slot11.setPoint = slot12
			slot9[slot10] = slot11
			slot6 = slot6 + 2
		end

		if slot5 then
			slot9 = slot7.cool
			slot10 = slot7.cool
			slot10 = #slot10
			slot10 = slot10 + 1
			slot11 = {
				transitionTime = slot8
			}
			slot13 = slot0
			slot12 = slot0.readUInt16
			slot14 = slot6
			slot15 = false
			slot12 = slot12(slot13, slot14, slot15)
			slot12 = slot12 / 100
			slot11.setPoint = slot12
			slot9[slot10] = slot11
			slot6 = slot6 + 2
		end
	end

	slot8 = {}
	slot9 = slot0
	slot9 = slot9.Converter
	slot9 = slot9.dayMaskToDaysOfWeek
	slot10 = slot2
	slot9 = slot9(slot10)
	slot8.daysOfWeek = slot9
	slot8.transitions = slot7

	return slot8
end

slot6[slot7] = slot8
slot6 = "ExtractZCLPayload"
slot6 = slot1[slot6]
slot7 = "CommandIdentifier"
slot7 = slot1[slot7]
slot8 = "SomfyIRBlaster"
slot7 = slot7[slot8]
slot8 = "ResponseGetRemainingAvailableMemory"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = {}
	slot2 = slot0[1]
	slot1.learnCodefreeMemory = slot2
	slot2 = slot0[2]
	slot1.dbCodefreeMemory = slot2

	return slot1
end

slot6[slot7] = slot8
slot6 = "Mask"
slot7 = {}
slot1[slot6] = slot7
slot6 = "Mask"
slot6 = slot1[slot6]
slot7 = "ZCL"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Mask"
slot6 = slot1[slot6]
slot7 = "ZCL"
slot6 = slot6[slot7]
slot7 = "FRAME_TYPE"
slot8 = 3
slot6[slot7] = slot8
slot6 = "Mask"
slot6 = slot1[slot6]
slot7 = "ZCL"
slot6 = slot6[slot7]
slot7 = "SPECIFIC"
slot8 = 4
slot6[slot7] = slot8
slot6 = "Mask"
slot6 = slot1[slot6]
slot7 = "ZCL"
slot6 = slot6[slot7]
slot7 = "DIRECTION"
slot8 = 8
slot6[slot7] = slot8
slot6 = "Mask"
slot6 = slot1[slot6]
slot7 = "ZCL"
slot6 = slot6[slot7]
slot7 = "DEFAULT_RES"
slot8 = 16
slot6[slot7] = slot8
slot6 = "DataType"
slot7 = {}
slot1[slot6] = slot7
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot8 = {}
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "data8"
slot8 = 8
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "data16"
slot8 = 9
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "data24"
slot8 = 10
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "data32"
slot8 = 11
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "data40"
slot8 = 12
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "data48"
slot8 = 13
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "data56"
slot8 = 14
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "data64"
slot8 = 15
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "bool"
slot8 = 16
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "map8"
slot8 = 24
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "map16"
slot8 = 25
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "map24"
slot8 = 26
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "map32"
slot8 = 27
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "map40"
slot8 = 28
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "map48"
slot8 = 29
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "map56"
slot8 = 30
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "map64"
slot8 = 31
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "enum8"
slot8 = 48
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "enum16"
slot8 = 49
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "uint8"
slot8 = 32
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "uint16"
slot8 = 33
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "uint24"
slot8 = 34
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "uint32"
slot8 = 35
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "uint40"
slot8 = 36
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "uint48"
slot8 = 37
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "uint56"
slot8 = 38
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "uint64"
slot8 = 39
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "int8"
slot8 = 40
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "int16"
slot8 = 41
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "int24"
slot8 = 42
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "int32"
slot8 = 43
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "int40"
slot8 = 44
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "int48"
slot8 = 45
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "int56"
slot8 = 46
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "int64"
slot8 = 47
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "UTC"
slot8 = 226
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "eui64"
slot8 = 240
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "octstr"
slot8 = 65
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "string"
slot8 = 66
slot6[slot7] = slot8
slot6 = "DataType"
slot6 = slot1[slot6]
slot7 = "Type"
slot6 = slot6[slot7]
slot7 = "array"
slot8 = 72
slot6[slot7] = slot8
slot6 = "Converter"
slot7 = {}
slot1[slot6] = slot7
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "computeSpecificDaySchedule"

function slot8(slot0, slot1, slot2)
	slot3 = slot0
	slot3 = slot3.toSpecificDaySchedule
	slot4 = slot0
	slot5 = slot1
	slot6 = slot2

	return slot3(slot4, slot5, slot6)
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "ObjectMapper"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "ObjectMapper"
slot6 = slot6[slot7]

function slot7(slot0, slot1)
	slot2 = {}
	slot3 = slot0
	slot3 = slot3.isClusterCommand
	slot2.filter = slot3
	slot3 = slot0
	slot3 = slot3.CommandIdentifier
	slot3 = slot3.Thermostat
	slot3 = slot3.GetWeeklySchedule
	slot2.command = slot3

	function slot3(slot0)
		slot1 = slot0
		slot1 = slot1.Converter
		slot1 = slot1.computeSpecificDaySchedule
		slot2 = slot0
		slot3 = slot1
		slot4 = slot2

		return slot1(slot2, slot3, slot4)
	end

	slot2.postProcess = slot3

	return slot2
end

slot6.Thermostat = slot7
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot8 = {}
slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "data8"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = slot0[1]
	slot2 = 1

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "uint8"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = tonumber
	slot2 = slot0[1]
	slot1 = slot1(slot2)
	slot2 = 1

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "uint16"
slot7 = slot7[slot8]

function slot8(slot0)
	slot2 = slot0
	slot1 = slot0.readUInt16
	slot3 = 1
	slot4 = false
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = 2

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "uint24"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = tonumber
	slot2 = slot0[1]
	slot3 = bit
	slot3 = slot3.lshift
	slot4 = slot0[2]
	slot5 = 8
	slot3 = slot3(slot4, slot5)
	slot2 = slot2 + slot3
	slot3 = bit
	slot3 = slot3.lshift
	slot4 = slot0[3]
	slot5 = 16
	slot3 = slot3(slot4, slot5)
	slot2 = slot2 + slot3
	slot1 = slot1(slot2)
	slot2 = 3

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "uint32"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = tonumber
	slot3 = slot0
	slot2 = slot0.readUInt32
	slot4 = 1
	slot5 = false
	slot1 = slot1(slot2(slot3, slot4, slot5))
	slot2 = 4

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "uint64"
slot7 = slot7[slot8]

function slot8(slot0)
	slot2 = slot0
	slot1 = slot0.sub
	slot3 = 1
	slot4 = 8
	slot5 = true
	slot1 = slot1(slot2, slot3, slot4, slot5)
	slot2 = 8

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "eui64"
slot7 = slot7[slot8]

function slot8(slot0)
	slot2 = slot0
	slot1 = slot0.sub
	slot3 = 1
	slot4 = 8
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = 8

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "int8"
slot7 = slot7[slot8]

function slot8(slot0)
	slot2 = slot0
	slot1 = slot0.readInt8
	slot3 = 1
	slot4 = false
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = 1

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "int16"
slot7 = slot7[slot8]

function slot8(slot0)
	slot2 = slot0
	slot1 = slot0.readInt16
	slot3 = 1
	slot4 = false
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = 2

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "int24"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = bytearray
	slot2 = {
		0
	}
	slot3 = slot0[3]
	slot2[2] = slot3
	slot3 = slot0[2]
	slot2[3] = slot3
	slot3 = slot0[1]
	slot2[4] = slot3
	slot1 = slot1(slot2)
	slot2 = slot1[2]
	slot3 = 128

	if slot2 >= slot3 then
		slot2 = 255
		slot1[1] = slot2
	end

	slot3 = slot1
	slot2 = slot1.readInt32
	slot4 = 1
	slot2 = slot2(slot3, slot4)
	slot3 = 3

	return slot2, slot3
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "int32"
slot7 = slot7[slot8]

function slot8(slot0)
	slot2 = slot0
	slot1 = slot0.readInt32
	slot3 = 1
	slot4 = false
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = 4

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "map8"
slot7 = slot7[slot8]

function slot8(slot0)
	slot2 = slot0
	slot1 = slot0.readUInt8
	slot3 = 1
	slot4 = false
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = 1

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "map16"
slot7 = slot7[slot8]

function slot8(slot0)
	slot2 = slot0
	slot1 = slot0.readUInt16
	slot3 = 1
	slot4 = false
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = 2

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "map32"
slot7 = slot7[slot8]

function slot8(slot0)
	slot2 = slot0
	slot1 = slot0.readUInt32
	slot3 = 1
	slot4 = false
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = 4

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "octstr"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = slot0[1]

	if slot1 == 255 then
		slot2 = overkiz
		slot2 = slot2.magic
		slot2 = slot2.IGNORE
		slot3 = 1

		return slot2, slot3
	end

	slot3 = slot0
	slot2 = slot0.sub
	slot4 = 2
	slot5 = 1 + slot1
	slot2 = slot2(slot3, slot4, slot5)
	slot3 = 1 + slot1

	return slot2, slot3
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "string"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = slot0[1]
	slot2 = 0

	if slot1 > slot2 then
		slot2 = slot0[2]

		if slot2 == 255 then
			slot2 = slot0
			slot2 = slot2.error
			slot3 = "Invalid value : type string can't be start 0xFF. "

			slot2(slot3)
		end
	end

	slot3 = slot0
	slot2 = slot0.sub
	slot4 = 2
	slot5 = 1 + slot1
	slot2 = slot2(slot3, slot4, slot5)
	slot3 = slot2
	slot2 = slot2.tostring
	slot4 = "iso-8859-1"
	slot2 = slot2(slot3, slot4)
	slot3 = 1 + slot1

	return slot2, slot3
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "array"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = slot0[1]
	slot3 = slot0
	slot2 = slot0.readUInt16
	slot4 = 2
	slot5 = false
	slot2 = slot2(slot3, slot4, slot5)

	if slot2 == 65535 then
		slot3 = slot0
		slot3 = slot3.error
		slot4 = "Invalid value : element count for type array can't be 0xFFFF. "

		slot3(slot4)
	end

	slot3 = {}
	slot4 = 3
	slot5 = 1
	slot6 = slot2
	slot7 = 1

	for slot8 = slot5, slot6, slot7 do
		slot9 = slot0
		slot9 = slot9.Converter
		slot9 = slot9.DataType
		slot9 = slot9[slot1]
		slot11 = slot0
		slot10 = slot0.sub
		slot12 = slot4 + 1
		slot9, slot10 = slot9(slot10(slot11, slot12))
		slot3[slot8] = slot9
		slot4 = slot4 + slot10
	end

	slot5 = slot3
	slot6 = slot4

	return slot5, slot6
end

slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "bool"
slot7 = slot7[slot8]
slot8 = "Converter"
slot8 = slot1[slot8]
slot9 = "DataType"
slot8 = slot8[slot9]
slot9 = "DataType"
slot9 = slot1[slot9]
slot10 = "Type"
slot9 = slot9[slot10]
slot10 = "uint8"
slot9 = slot9[slot10]
slot8 = slot8[slot9]
slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "enum8"
slot7 = slot7[slot8]
slot8 = "Converter"
slot8 = slot1[slot8]
slot9 = "DataType"
slot8 = slot8[slot9]
slot9 = "DataType"
slot9 = slot1[slot9]
slot10 = "Type"
slot9 = slot9[slot10]
slot10 = "uint8"
slot9 = slot9[slot10]
slot8 = slot8[slot9]
slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "enum16"
slot7 = slot7[slot8]
slot8 = "Converter"
slot8 = slot1[slot8]
slot9 = "DataType"
slot8 = slot8[slot9]
slot9 = "DataType"
slot9 = slot1[slot9]
slot10 = "Type"
slot9 = slot9[slot10]
slot10 = "uint16"
slot9 = slot9[slot10]
slot8 = slot8[slot9]
slot6[slot7] = slot8
slot6 = "Converter"
slot6 = slot1[slot6]
slot7 = "DataType"
slot6 = slot6[slot7]
slot7 = "DataType"
slot7 = slot1[slot7]
slot8 = "Type"
slot7 = slot7[slot8]
slot8 = "UTC"
slot7 = slot7[slot8]

function slot8(slot0)
	slot1 = tonumber
	slot3 = slot0
	slot2 = slot0.readUInt32
	slot4 = 1
	slot5 = false
	slot1 = slot1(slot2(slot3, slot4, slot5))
	slot2 = 4

	return slot1, slot2
end

slot6[slot7] = slot8
slot6 = "extractZCLHeader"

function slot7(slot0)
	return {
		frameType = bit.band(slot0, slot0.Mask.ZCL.FRAME_TYPE),
		specific = bit.band(slot0, slot0.Mask.ZCL.SPECIFIC) == slot0.Mask.ZCL.SPECIFIC,
		direction = bit.band(slot0, slot0.Mask.ZCL.DIRECTION) == slot0.Mask.ZCL.DIRECTION,
		defaultRes = bit.band(slot0, slot0.Mask.ZCL.DEFAULT_RES) ~= slot0.Mask.ZCL.DEFAULT_RES
	}
end

slot1[slot6] = slot7
slot6 = "getZCLPayload"

function slot7(slot0, slot1, slot2)
	slot3 = nil
	slot4 = slot1.frameType

	if slot4 ~= 0 then
		slot4 = slot1.frameType

		if slot4 == 2 then
			slot3 = slot1.commandIdentifier
		else
			slot4 = slot1.specific

			if slot4 then
				if slot0 == nil then
					slot4 = error
					slot5 = "clusterId is null"

					slot4(slot5)
				end

				slot4 = slot0
				slot5 = "/"
				slot6 = slot1.commandIdentifier
				slot7 = "/"
				slot8 = slot1.manufacturerId
				slot3 = slot4 .. slot5 .. slot6 .. slot7 .. slot8
			else
				if slot0 == nil then
					slot4 = error
					slot5 = "clusterId is null"

					slot4(slot5)
				end

				slot4 = slot0
				slot5 = "/"
				slot6 = slot1.commandIdentifier
				slot3 = slot4 .. slot5 .. slot6
			end
		end
	end

	slot4 = slot0
	slot4 = slot4.ExtractZCLPayload
	slot4 = slot4[slot3]

	if slot4 == nil then
		slot4 = overkiz
		slot4 = slot4.magic
		slot4 = slot4.IGNORE

		return slot4
	else
		slot4 = slot0
		slot4 = slot4.ExtractZCLPayload
		slot4 = slot4[slot3]
		slot5 = slot2

		return slot4(slot5)
	end
end

slot1[slot6] = slot7

function slot6(slot0)
	slot1 = {}
	slot2 = pairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = table
		slot7 = slot7.insert
		slot8 = slot1
		slot9 = slot6

		slot7(slot8, slot9)
	end

	return slot1
end

slot7 = "flatZCLPayloadOnZclStructure"

function slot8(slot0)
	slot1 = {}
	slot2 = slot0.header
	slot1.header = slot2
	slot2 = slot0
	slot3 = slot0.payload
	slot2 = slot2(slot3)
	slot1.payloads = slot2

	return slot1
end

slot1[slot7] = slot8
slot7 = "extractZCL"

function slot8(slot0, slot1)
	slot2 = 1
	slot3 = slot0
	slot3 = slot3.extractZCLHeader
	slot4 = slot0[slot2]
	slot3 = slot3(slot4)
	slot2 = slot2 + 1
	slot4 = nil
	slot5 = slot3.specific

	if slot5 then
		slot4 = slot0[slot2]
		slot2 = slot2 + 1
		slot5 = bit
		slot5 = slot5.lshift
		slot6 = slot0[slot2]
		slot7 = 8
		slot5 = slot5(slot6, slot7)
		slot4 = slot4 + slot5
		slot2 = slot2 + 1
	end

	slot5 = slot0[slot2]
	slot2 = slot2 + 1
	slot6 = slot0[slot2]
	slot2 = slot2 + 1
	slot7 = {}
	slot8 = slot3.frameType
	slot7.frameType = slot8
	slot8 = slot3.specific
	slot7.specific = slot8
	slot8 = slot3.direction
	slot7.direction = slot8
	slot8 = slot3.defaultRes
	slot7.defaultRes = slot8
	slot7.manufacturerId = slot4
	slot7.transactionSequenceNumber = slot5
	slot7.commandIdentifier = slot6
	slot8 = {
		header = slot7
	}
	slot9 = slot0
	slot9 = slot9.getZCLPayload
	slot10 = slot1
	slot11 = slot7
	slot13 = slot0
	slot12 = slot0.sub
	slot14 = slot2
	slot15 = #slot0
	slot9 = slot9(slot10, slot11, slot12(slot13, slot14, slot15))
	slot8.payload = slot9

	return slot8
end

slot1[slot7] = slot8

function slot7(slot0)
	slot1 = nil

	return slot1
end

function slot8(slot0)
	slot1 = bytearray
	slot2 = {
		slot0
	}

	return slot1(slot2)
end

function slot9(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 255
	slot3 = slot0
	slot1 = slot1(slot2, slot3)
	slot2 = bit
	slot2 = slot2.rshift
	slot3 = bit
	slot3 = slot3.band
	slot4 = 65280
	slot5 = slot0
	slot3 = slot3(slot4, slot5)
	slot4 = 8
	slot2 = slot2(slot3, slot4)
	slot3 = slot1
	slot4 = slot2

	return slot3, slot4
end

slot10 = "writeDBAttributeForSomfyIRBlaster"

function slot11(slot0, slot1)
	slot2 = slot0
	slot3 = slot0[2]
	slot2, slot3 = slot2(slot3)
	slot4 = string
	slot4 = slot4.find
	slot5 = slot1
	slot6 = "0x"
	slot4 = slot4(slot5, slot6)

	if slot4 then
		slot4 = string
		slot4 = slot4.sub
		slot5 = slot1
		slot6 = 3
		slot4 = slot4(slot5, slot6)
		slot1 = slot4
	else
		slot4 = string
		slot4 = slot4.match
		slot5 = slot1
		slot6 = "%d+"
		slot4 = slot4(slot5, slot6)
		slot5 = slot4
		slot4 = slot4.len
		slot4 = slot4(slot5)
		slot6 = slot1
		slot5 = slot1.len
		slot5 = slot5(slot6)

		if slot4 ~= slot5 then
			slot4 = slot1
			slot4 = slot4.error
			slot5 = "Value: "
			slot6 = slot1
			slot7 = " is not a integer"
			slot5 = slot5 .. slot6 .. slot7

			slot4(slot5)
		end

		slot4 = string
		slot4 = slot4.format
		slot5 = "%x"
		slot6 = slot1
		slot4 = slot4(slot5, slot6)
		slot1 = slot4
	end

	slot4 = bytearray
	slot5 = {
		slot2,
		slot3
	}
	slot6 = slot1
	slot6 = slot6.DataType
	slot6 = slot6.Type
	slot6 = slot6.uint64
	slot5[3] = slot6
	slot4 = slot4(slot5)
	slot5 = slot4
	slot4 = slot4.append
	slot6 = slot2
	slot7 = slot1

	return slot4(slot5, slot6(slot7))
end

slot1[slot10] = slot11
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot12 = {}
slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot12 = "SomfyIRBlaster"
slot11 = slot11[slot12]
slot12 = "DBR"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.SomfyIRBlaster
	slot2 = slot2.DBR
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot2 = slot2.writeDBAttributeForSomfyIRBlaster
	slot3 = slot1
	slot4 = slot0

	return slot2(slot3, slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot12 = "SomfyIRBlaster"
slot11 = slot11[slot12]
slot12 = "DBL"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.SomfyIRBlaster
	slot2 = slot2.DBL
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot2 = slot2.writeDBAttributeForSomfyIRBlaster
	slot3 = slot1
	slot4 = slot0

	return slot2(slot3, slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Identify
slot11 = slot11.IdentifyTime

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.Identify
	slot2 = slot2.IdentifyTime
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = slot2
	slot3 = slot1[2]
	slot2, slot3 = slot2(slot3)
	slot4 = bytearray
	slot5 = {
		slot2,
		slot3
	}
	slot6 = slot1
	slot6 = slot6.DataType
	slot6 = slot6.Type
	slot6 = slot6.uint16
	slot5[3] = slot6
	slot5[4] = slot0
	slot6 = bit
	slot6 = slot6.rshift
	slot7 = slot0
	slot8 = 8
	slot5[MULTRES] = slot6(slot7, slot8)

	return slot4(slot5)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot12 = "Ballast"
slot11 = slot11[slot12]
slot11 = slot11.Schneider
slot12 = "ControlMode"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.enumValueToEnumIndex
	slot2 = slot1
	slot2 = slot2.Mapping
	slot2 = slot2.Attribute
	slot2 = slot2.Ballast
	slot2 = slot2.Schneider
	slot2 = slot2.ControlMode
	slot3 = slot0
	slot1 = slot1(slot2, slot3)
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.Ballast
	slot3 = slot3.Schneider
	slot3 = slot3.ControlMode
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.enum8
	slot6[3] = slot7
	slot6[4] = slot1

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot12 = "Ballast"
slot11 = slot11[slot12]
slot12 = "MinLevel"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = math
	slot1 = slot1.floor
	slot2 = 254 * slot0
	slot2 = slot2 / 100
	slot1 = slot1(slot2)
	slot0 = slot1
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.Ballast
	slot2 = slot2.MinLevel
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = bytearray
	slot3 = {
		nil,
		0
	}
	slot4 = slot1[2]
	slot3[1] = slot4
	slot4 = slot1
	slot4 = slot4.DataType
	slot4 = slot4.Type
	slot4 = slot4.uint8
	slot3[3] = slot4
	slot3[4] = slot0

	return slot2(slot3)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot12 = "Ballast"
slot11 = slot11[slot12]
slot12 = "MaxLevel"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = math
	slot1 = slot1.floor
	slot2 = 254 * slot0
	slot2 = slot2 / 100
	slot1 = slot1(slot2)
	slot0 = slot1
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.Ballast
	slot2 = slot2.MaxLevel
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = bytearray
	slot3 = {
		nil,
		0
	}
	slot4 = slot1[2]
	slot3[1] = slot4
	slot4 = slot1
	slot4 = slot4.DataType
	slot4 = slot4.Type
	slot4 = slot4.uint8
	slot3[3] = slot4
	slot3[4] = slot0

	return slot2(slot3)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Schneider
slot12 = "SwitchIndication"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.enumValueToEnumIndex
	slot2 = slot1
	slot2 = slot2.Mapping
	slot2 = slot2.Command
	slot2 = slot2.SwitchIndicationStatusState
	slot3 = slot0
	slot1 = slot1(slot2, slot3)
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.Schneider
	slot3 = slot3.SwitchIndication
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.enum8
	slot6[3] = slot7
	slot6[4] = slot1

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Schneider
slot12 = "SwitchActions"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.enumValueToEnumIndex
	slot2 = slot1
	slot2 = slot2.Mapping
	slot2 = slot2.Command
	slot2 = slot2.SwitchActionsStatusState
	slot3 = slot0
	slot1 = slot1(slot2, slot3)
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.Schneider
	slot3 = slot3.SwitchActions
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.enum8
	slot6[3] = slot7
	slot6[4] = slot1

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.OccupiedHeatingSetpoint

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.Thermostat
	slot1 = slot1.valueToWriteSetpoint
	slot2 = slot0
	slot2 = slot2.Attribute
	slot2 = slot2.Thermostat
	slot2 = slot2.OccupiedHeatingSetpoint
	slot3 = slot0

	return slot1(slot2, slot3)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.OccupiedCoolingSetpoint

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.Thermostat
	slot1 = slot1.valueToWriteSetpoint
	slot2 = slot0
	slot2 = slot2.Attribute
	slot2 = slot2.Thermostat
	slot2 = slot2.OccupiedCoolingSetpoint
	slot3 = slot0

	return slot1(slot2, slot3)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.UnoccupiedHeatingSetpoint

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.Thermostat
	slot1 = slot1.valueToWriteSetpoint
	slot2 = slot0
	slot2 = slot2.Attribute
	slot2 = slot2.Thermostat
	slot2 = slot2.UnoccupiedHeatingSetpoint
	slot3 = slot0

	return slot1(slot2, slot3)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.MaxHeatSetpointLimit

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.Thermostat
	slot1 = slot1.valueToWriteSetpoint
	slot2 = slot0
	slot2 = slot2.Attribute
	slot2 = slot2.Thermostat
	slot2 = slot2.MaxHeatSetpointLimit
	slot3 = slot0

	return slot1(slot2, slot3)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.MinHeatSetpointLimit

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.Thermostat
	slot1 = slot1.valueToWriteSetpoint
	slot2 = slot0
	slot2 = slot2.Attribute
	slot2 = slot2.Thermostat
	slot2 = slot2.MinHeatSetpointLimit
	slot3 = slot0

	return slot1(slot2, slot3)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot12 = "ControlSequenceOfOperation"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.enumValueToEnumIndex
	slot2 = slot1
	slot2 = slot2.Mapping
	slot2 = slot2.Command
	slot2 = slot2.ControlSequenceOfOperationState
	slot3 = slot0
	slot1 = slot1(slot2, slot3)
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.Thermostat
	slot3 = slot3.ControlSequenceOfOperation
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.enum8
	slot6[3] = slot7
	slot6[4] = slot1

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot12 = "SystemMode"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.enumValueToEnumIndex
	slot2 = slot1
	slot2 = slot2.Mapping
	slot2 = slot2.Command
	slot2 = slot2.SystemModeState
	slot3 = slot0
	slot1 = slot1(slot2, slot3)
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.Thermostat
	slot3 = slot3.SystemMode
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.enum8
	slot6[3] = slot7
	slot6[4] = slot1

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot12 = "AbstractThermostatProgrammingOperationMode"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = 7
	slot2 = slot0[1]

	if slot2 == "setpoint" then
		slot2 = bit
		slot2 = slot2.band
		slot3 = slot1
		slot4 = 6
		slot2 = slot2(slot3, slot4)
		slot1 = slot2
	end

	slot2 = slot0[2]

	if slot2 == "disable" then
		slot2 = bit
		slot2 = slot2.band
		slot3 = slot1
		slot4 = 5
		slot2 = slot2(slot3, slot4)
		slot1 = slot2
	end

	slot2 = slot0[3]

	if slot2 == "disable" then
		slot2 = bit
		slot2 = slot2.band
		slot3 = slot1
		slot4 = 3
		slot2 = slot2(slot3, slot4)
		slot1 = slot2
	end

	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.Thermostat
	slot3 = slot3.AbstractThermostatProgrammingOperationMode
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.map8
	slot6[3] = slot7
	slot6[4] = slot1

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.Danfoss
slot12 = "ExerciseDayOfWeek"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = {
		saturday = 6,
		wednesday = 3,
		tuesday = 2,
		thursday = 4,
		sunday = 0,
		friday = 5,
		monday = 1
	}
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.Thermostat
	slot3 = slot3.Danfoss
	slot3 = slot3.ExerciseDayOfWeek
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.enum8
	slot6[3] = slot7
	slot7 = slot1[slot0]
	slot6[4] = slot7

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.Danfoss
slot12 = "ExerciseTriggerTime"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.Thermostat
	slot2 = slot2.Danfoss
	slot2 = slot2.ExerciseTriggerTime
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = slot2
	slot3 = slot1[2]
	slot2, slot3 = slot2(slot3)
	slot4 = bytearray
	slot5 = {
		slot2,
		slot3,
		nil,
		0,
		0
	}
	slot6 = slot1
	slot6 = slot6.DataType
	slot6 = slot6.Type
	slot6 = slot6.uint16
	slot5[3] = slot6
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.writeUInt16
	slot7 = 4
	slot8 = slot0
	slot9 = false
	slot5 = slot5(slot6, slot7, slot8, slot9)
	slot4 = slot5

	return slot4
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.Danfoss
slot12 = "ETRVOrientation"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = {
		horizontal = 0,
		vertical = 1
	}
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.Thermostat
	slot3 = slot3.Danfoss
	slot3 = slot3.ETRVOrientation
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.bool
	slot6[3] = slot7
	slot7 = slot1[slot0]
	slot6[4] = slot7

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.Danfoss
slot12 = "ControlAlgorithmScaleFactor"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.Thermostat
	slot2 = slot2.Danfoss
	slot2 = slot2.ControlAlgorithmScaleFactor
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = slot2
	slot3 = slot1[2]
	slot2, slot3 = slot2(slot3)
	slot4 = bytearray
	slot5 = {
		slot2,
		slot3
	}
	slot6 = slot1
	slot6 = slot6.DataType
	slot6 = slot6.Type
	slot6 = slot6.uint8
	slot5[3] = slot6
	slot5[4] = slot0

	return slot4(slot5)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.Danfoss
slot12 = "RegulationSetPointOffset"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.Thermostat
	slot2 = slot2.Danfoss
	slot2 = slot2.RegulationSetPointOffset
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = slot2
	slot3 = slot1[2]
	slot2, slot3 = slot2(slot3)
	slot4 = bytearray
	slot5 = {
		slot2,
		slot3
	}
	slot6 = slot1
	slot6 = slot6.DataType
	slot6 = slot6.Type
	slot6 = slot6.int8
	slot5[3] = slot6
	slot6 = slot0 * 10
	slot5[4] = slot6

	return slot4(slot5)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.Danfoss
slot12 = "AdaptationRunSettings"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = {
		enable = 1,
		disable = 0
	}
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.Thermostat
	slot3 = slot3.Danfoss
	slot3 = slot3.AdaptationRunSettings
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.map8
	slot6[3] = slot7
	slot7 = slot1[slot0]
	slot6[4] = slot7

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.Danfoss
slot12 = "AdaptationRunControl"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = {
		initiate = 1,
		cancel = 2,
		noAdaptation = 0
	}
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.Thermostat
	slot3 = slot3.Danfoss
	slot3 = slot3.AdaptationRunControl
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.enum8
	slot6[3] = slot7
	slot7 = slot1[slot0]
	slot6[4] = slot7

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.Danfoss
slot12 = "FloorMinSetpoint"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.Thermostat
	slot1 = slot1.valueToWriteSetpoint
	slot2 = slot0
	slot2 = slot2.Attribute
	slot2 = slot2.Thermostat
	slot2 = slot2.Danfoss
	slot2 = slot2.FloorMinSetpoint
	slot3 = slot0

	return slot1(slot2, slot3)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.Danfoss
slot12 = "FloorMaxSetpoint"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.Thermostat
	slot1 = slot1.valueToWriteSetpoint
	slot2 = slot0
	slot2 = slot2.Attribute
	slot2 = slot2.Thermostat
	slot2 = slot2.Danfoss
	slot2 = slot2.FloorMaxSetpoint
	slot3 = slot0

	return slot1(slot2, slot3)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot11 = slot11.Danfoss
slot12 = "ScheduleTypeUsed"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = 0

	if slot0 == "vacation" then
		slot1 = 1
	end

	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.Thermostat
	slot3 = slot3.Danfoss
	slot3 = slot3.ScheduleTypeUsed
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.enum8
	slot6[3] = slot7
	slot6[4] = slot1

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot12 = "Imhotep"
slot11 = slot11[slot12]
slot12 = "CurrentMode"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.enumValueToEnumIndex
	slot2 = slot1
	slot2 = slot2.Mapping
	slot2 = slot2.Attribute
	slot2 = slot2.Imhotep
	slot2 = slot2.DerogatedMode
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == nil then
		slot2 = slot1
		slot2 = slot2.error
		slot3 = "You should set a valid derogated mode in parameter"

		return slot2(slot3)
	end

	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.Thermostat
	slot3 = slot3.Imhotep
	slot3 = slot3.CurrentMode
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.enum16
	slot6[3] = slot7
	slot5 = slot5(slot6)
	slot6 = slot5
	slot5 = slot5.append
	slot7 = slot3
	slot8 = slot1

	return slot5(slot6, slot7(slot8))
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot12 = "Imhotep"
slot11 = slot11[slot12]
slot12 = "Selflearning"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.enumValueToEnumIndex
	slot2 = slot1
	slot2 = slot2.Mapping
	slot2 = slot2.Attribute
	slot2 = slot2.Imhotep
	slot2 = slot2.Selflearning
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == nil then
		slot2 = slot1
		slot2 = slot2.error
		slot3 = "You should only set values 'on|off' in parameter"

		return slot2(slot3)
	end

	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.Thermostat
	slot3 = slot3.Imhotep
	slot3 = slot3.Selflearning
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.bool
	slot6[3] = slot7
	slot6[4] = slot1

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "imhotepCompleteScheduleValueToWriteAttribute"

function slot11(slot0)
	slot1 = slot0
	slot2 = slot1.monday

	if slot2 == nil then
		slot2 = {}
		slot1.monday = slot2
	end

	slot2 = slot1.tuesday

	if slot2 == nil then
		slot2 = {}
		slot1.tuesday = slot2
	end

	slot2 = slot1.wednesday

	if slot2 == nil then
		slot2 = {}
		slot1.wednesday = slot2
	end

	slot2 = slot1.thursday

	if slot2 == nil then
		slot2 = {}
		slot1.thursday = slot2
	end

	slot2 = slot1.friday

	if slot2 == nil then
		slot2 = {}
		slot1.friday = slot2
	end

	slot2 = slot1.saturday

	if slot2 == nil then
		slot2 = {}
		slot1.saturday = slot2
	end

	slot2 = slot1.sunday

	if slot2 == nil then
		slot2 = {}
		slot1.sunday = slot2
	end

	return slot1
end

slot1[slot10] = slot11
slot10 = "imhotepSchedulePeriodValueToWriteAttribute"

function slot11(slot0)
	slot1 = slot0.enable

	if slot1 == nil then
		slot1 = slot0
		slot1 = slot1.error
		slot2 = "Schedule period does not have the expected format"

		return slot1(slot2)
	end

	slot1 = slot0.enable

	if slot1 == true then
		slot1 = slot0.startAt

		if slot1 ~= nil then
			slot1 = slot0.endAt

			if slot1 ~= nil then
				slot1 = slot0.mode

				if slot1 == nil then
					slot1 = slot0
					slot1 = slot1.error
					slot2 = "Schedule period does not have the expected format"

					return slot1(slot2)
				end
			end
		end
	end

	slot1 = bytearray
	slot2 = 8
	slot1 = slot1(slot2)
	slot2 = slot0.enable

	if slot2 == true then
		slot3 = slot1
		slot2 = slot1.writeUInt8
		slot4 = 1
		slot5 = 1

		slot2(slot3, slot4, slot5)

		slot3 = slot1
		slot2 = slot1.writeUInt16
		slot4 = 2
		slot5 = slot0.startAt
		slot6 = false

		slot2(slot3, slot4, slot5, slot6)

		slot3 = slot1
		slot2 = slot1.writeUInt16
		slot4 = 4
		slot5 = slot0.endAt
		slot6 = false

		slot2(slot3, slot4, slot5, slot6)

		slot3 = slot1
		slot2 = slot1.writeUInt8
		slot4 = 6
		slot5 = slot0.mode

		slot2(slot3, slot4, slot5)
	else
		slot3 = slot1
		slot2 = slot1.writeUInt8
		slot4 = 1
		slot5 = 0

		slot2(slot3, slot4, slot5)

		slot3 = slot1
		slot2 = slot1.writeUInt16
		slot4 = 2
		slot5 = 0
		slot6 = false

		slot2(slot3, slot4, slot5, slot6)

		slot3 = slot1
		slot2 = slot1.writeUInt16
		slot4 = 4
		slot5 = 0
		slot6 = false

		slot2(slot3, slot4, slot5, slot6)

		slot3 = slot1
		slot2 = slot1.writeUInt8
		slot4 = 6
		slot5 = 0

		slot2(slot3, slot4, slot5)
	end

	return slot1
end

slot1[slot10] = slot11
slot10 = "imhotepScheduleDayValueToWriteAttribute"

function slot11(slot0)
	if slot0 == nil then
		slot1 = bytearray
		slot2 = 32

		return slot1(slot2)
	end

	slot1 = bytearray
	slot2 = 8
	slot1 = slot1(slot2)
	slot2 = slot0[1]

	if slot2 ~= nil then
		slot2 = slot0
		slot2 = slot2.imhotepSchedulePeriodValueToWriteAttribute
		slot3 = slot0[1]
		slot2 = slot2(slot3)
		slot1 = slot2
	end

	slot2 = bytearray
	slot3 = 8
	slot2 = slot2(slot3)
	slot3 = slot0[2]

	if slot3 ~= nil then
		slot3 = slot0
		slot3 = slot3.imhotepSchedulePeriodValueToWriteAttribute
		slot4 = slot0[2]
		slot3 = slot3(slot4)
		slot2 = slot3
	end

	slot3 = bytearray
	slot4 = 8
	slot3 = slot3(slot4)
	slot4 = slot0[3]

	if slot4 ~= nil then
		slot4 = slot0
		slot4 = slot4.imhotepSchedulePeriodValueToWriteAttribute
		slot5 = slot0[3]
		slot4 = slot4(slot5)
		slot3 = slot4
	end

	slot4 = bytearray
	slot5 = 8
	slot4 = slot4(slot5)
	slot5 = slot0[4]

	if slot5 ~= nil then
		slot5 = slot0
		slot5 = slot5.imhotepSchedulePeriodValueToWriteAttribute
		slot6 = slot0[4]
		slot5 = slot5(slot6)
		slot4 = slot5
	end

	slot6 = slot1
	slot5 = slot1.append
	slot7 = slot2
	slot5 = slot5(slot6, slot7)
	slot6 = slot5
	slot5 = slot5.append
	slot7 = slot3
	slot5 = slot5(slot6, slot7)
	slot6 = slot5
	slot5 = slot5.append
	slot7 = slot4

	return slot5(slot6, slot7)
end

slot1[slot10] = slot11
slot10 = "imhotepScheduleDayValueToWriteAttributeInStringFormat"

function slot11(slot0, slot1, slot2)
	slot3 = bytearray
	slot4 = 32
	slot3 = slot3(slot4)

	if slot2 ~= nil then
		slot4 = slot0
		slot4 = slot4.imhotepScheduleDayValueToWriteAttribute
		slot5 = slot2
		slot4 = slot4(slot5)
		slot3 = slot4
	end

	slot4 = bytearray
	slot6 = slot3
	slot5 = slot3.tostring
	slot7 = "base64"
	slot5 = slot5(slot6, slot7)
	slot6 = "iso-8859-1"
	slot4 = slot4(slot5, slot6)
	slot5 = bytearray
	slot6 = {
		slot1,
		slot0
	}
	slot7 = slot0
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.string
	slot6[3] = slot7
	slot7 = #slot4
	slot6[4] = slot7
	slot5 = slot5(slot6)
	slot6 = slot5
	slot5 = slot5.append
	slot7 = slot4

	return slot5(slot6, slot7)
end

slot1[slot10] = slot11
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot12 = "Imhotep"
slot11 = slot11[slot12]
slot12 = "ScheduleMonday"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.imhotepScheduleDayValueToWriteAttributeInStringFormat
	slot2 = 64
	slot3 = 2
	slot4 = slot0

	return slot1(slot2, slot3, slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot12 = "Imhotep"
slot11 = slot11[slot12]
slot12 = "ScheduleTuesday"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.imhotepScheduleDayValueToWriteAttributeInStringFormat
	slot2 = 64
	slot3 = 3
	slot4 = slot0

	return slot1(slot2, slot3, slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot12 = "Imhotep"
slot11 = slot11[slot12]
slot12 = "ScheduleWednesday"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.imhotepScheduleDayValueToWriteAttributeInStringFormat
	slot2 = 64
	slot3 = 4
	slot4 = slot0

	return slot1(slot2, slot3, slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot12 = "Imhotep"
slot11 = slot11[slot12]
slot12 = "ScheduleThursday"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.imhotepScheduleDayValueToWriteAttributeInStringFormat
	slot2 = 64
	slot3 = 5
	slot4 = slot0

	return slot1(slot2, slot3, slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot12 = "Imhotep"
slot11 = slot11[slot12]
slot12 = "ScheduleFriday"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.imhotepScheduleDayValueToWriteAttributeInStringFormat
	slot2 = 64
	slot3 = 6
	slot4 = slot0

	return slot1(slot2, slot3, slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot12 = "Imhotep"
slot11 = slot11[slot12]
slot12 = "ScheduleSaturday"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.imhotepScheduleDayValueToWriteAttributeInStringFormat
	slot2 = 64
	slot3 = 7
	slot4 = slot0

	return slot1(slot2, slot3, slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Thermostat
slot12 = "Imhotep"
slot11 = slot11[slot12]
slot12 = "ScheduleSunday"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.imhotepScheduleDayValueToWriteAttributeInStringFormat
	slot2 = 64
	slot3 = 8
	slot4 = slot0

	return slot1(slot2, slot3, slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot12 = "ThermostatUIConfiguration"
slot11 = slot11[slot12]
slot12 = "TemperatureDisplayMode"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = {
		celsius = 0,
		fahrenheit = 1
	}
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.ThermostatUIConfiguration
	slot3 = slot3.TemperatureDisplayMode
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.enum8
	slot6[3] = slot7
	slot7 = slot1[slot0]
	slot6[4] = slot7

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot12 = "ThermostatUIConfiguration"
slot11 = slot11[slot12]
slot12 = "KeypadLockout"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = {
		lockout4 = 4,
		lockout3 = 3,
		noLockout = 0,
		lockout2 = 2,
		lockout5 = 5,
		lockout1 = 1
	}
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.ThermostatUIConfiguration
	slot3 = slot3.KeypadLockout
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.enum8
	slot6[3] = slot7
	slot7 = slot1[slot0]
	slot6[4] = slot7

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot12 = "ThermostatUIConfiguration"
slot11 = slot11[slot12]
slot11 = slot11.Danfoss
slot12 = "ViewingDirection"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = {
		direction2 = 1,
		direction1 = 0
	}
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.ThermostatUIConfiguration
	slot3 = slot3.Danfoss
	slot3 = slot3.ViewingDirection
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.enum8
	slot6[3] = slot7
	slot7 = slot1[slot0]
	slot6[4] = slot7

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.LevelControl
slot11 = slot11.OnLevel

function slot12(slot0)
	if slot0 == "previous" then
		slot0 = 255
	else
		slot1 = math
		slot1 = slot1.floor
		slot2 = 254 * slot0
		slot2 = slot2 / 100
		slot1 = slot1(slot2)
		slot0 = slot1
	end

	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.LevelControl
	slot2 = slot2.OnLevel
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = bytearray
	slot3 = {
		nil,
		0
	}
	slot4 = slot1[2]
	slot3[1] = slot4
	slot4 = slot1
	slot4 = slot4.DataType
	slot4 = slot4.Type
	slot4 = slot4.uint8
	slot3[3] = slot4
	slot3[4] = slot0

	return slot2(slot3)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.LevelControl
slot11 = slot11.StartUpCurrentLevel

function slot12(slot0)
	slot1 = slot0

	if slot0 == "min" then
		slot1 = 0
	elseif slot0 == "previous" then
		slot1 = 255
	else
		slot2 = math
		slot2 = slot2.floor
		slot3 = 254 * slot0
		slot3 = slot3 / 100
		slot2 = slot2(slot3)
		slot1 = slot2
	end

	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.LevelControl
	slot3 = slot3.StartUpCurrentLevel
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.uint8
	slot6[3] = slot7
	slot6[4] = slot1

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.OnOff
slot11 = slot11.OffWaitTime

function slot12(slot0)
	slot1 = math
	slot1 = slot1.floor
	slot2 = slot0 * 10
	slot1 = slot1(slot2)
	slot0 = slot1
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.OnOff
	slot2 = slot2.OffWaitTime
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = slot2
	slot3 = slot1[2]
	slot2, slot3 = slot2(slot3)
	slot4 = bytearray
	slot5 = {
		slot2,
		slot3,
		nil,
		0,
		0
	}
	slot6 = slot1
	slot6 = slot6.DataType
	slot6 = slot6.Type
	slot6 = slot6.uint16
	slot5[3] = slot6
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.writeUInt16
	slot7 = 4
	slot8 = slot0
	slot9 = false
	slot5 = slot5(slot6, slot7, slot8, slot9)
	slot4 = slot5

	return slot4
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.OnOff
slot11 = slot11.StartUpOnOff

function slot12(slot0)
	slot1 = 0

	if slot0 == "on" then
		slot1 = 1
	elseif slot0 == "togglePrevious" then
		slot1 = 2
	elseif slot0 == "previous" then
		slot1 = 255
	elseif slot0 ~= "off" then
		slot2 = error
		slot3 = "Invalid startUpOnOff value. Expected on, off, togglePrevious or previous but got "
		slot4 = slot0
		slot3 = slot3 .. slot4

		slot2(slot3)
	end

	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.OnOff
	slot3 = slot3.StartUpOnOff
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.enum8
	slot6[3] = slot7
	slot6[4] = slot1

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.OnOff
slot11 = slot11.Schneider
slot11 = slot11.PreWarningTime

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.OnOff
	slot2 = slot2.Schneider
	slot2 = slot2.PreWarningTime
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = slot2
	slot3 = slot1[2]
	slot2, slot3 = slot2(slot3)
	slot4 = bytearray
	slot5 = {
		slot2,
		slot3
	}
	slot6 = slot1
	slot6 = slot6.DataType
	slot6 = slot6.Type
	slot6 = slot6.uint16
	slot5[3] = slot6
	slot5[4] = slot0
	slot6 = bit
	slot6 = slot6.rshift
	slot7 = slot0
	slot8 = 8
	slot5[MULTRES] = slot6(slot7, slot8)

	return slot4(slot5)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.OnOff
slot11 = slot11.Schneider
slot11 = slot11.OnTimeReload

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.OnOff
	slot2 = slot2.Schneider
	slot2 = slot2.OnTimeReload
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = slot2
	slot3 = slot1[2]
	slot2, slot3 = slot2(slot3)
	slot4 = bytearray
	slot5 = {
		slot2,
		slot3
	}
	slot6 = slot1
	slot6 = slot6.DataType
	slot6 = slot6.Type
	slot6 = slot6.uint32
	slot5[3] = slot6
	slot5[4] = slot0
	slot6 = bit
	slot6 = slot6.rshift
	slot7 = slot0
	slot8 = 8
	slot6 = slot6(slot7, slot8)
	slot5[5] = slot6
	slot6 = bit
	slot6 = slot6.rshift
	slot7 = slot0
	slot8 = 16
	slot6 = slot6(slot7, slot8)
	slot5[6] = slot6
	slot6 = bit
	slot6 = slot6.rshift
	slot7 = slot0
	slot8 = 24
	slot5[MULTRES] = slot6(slot7, slot8)

	return slot4(slot5)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.OnOff
slot11 = slot11.Schneider
slot11 = slot11.OnTimeReloadOptions

function slot12(slot0)
	slot1 = 0

	if slot0 == "enable" then
		slot1 = 1
	end

	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot1
	slot3 = slot3.Attribute
	slot3 = slot3.OnOff
	slot3 = slot3.Schneider
	slot3 = slot3.OnTimeReloadOptions
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot4 = slot2[2]
	slot3, slot4 = slot3(slot4)
	slot5 = bytearray
	slot6 = {
		slot3,
		slot4
	}
	slot7 = slot1
	slot7 = slot7.DataType
	slot7 = slot7.Type
	slot7 = slot7.map8
	slot6[3] = slot7
	slot6[4] = slot1

	return slot5(slot6)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.WindowCovering
slot11 = slot11.ModeCoordinates

function slot12(slot0)
	slot1 = bytearray
	slot2 = {
		23,
		0
	}
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.map8
	slot2[3] = slot3
	slot2[4] = slot0

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.WindowCovering
slot11 = slot11.Schneider
slot11 = slot11.DriveCloseDuration

function slot12(slot0)
	slot1 = bytearray
	slot2 = {
		0,
		224
	}
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.uint16
	slot2[3] = slot3
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.append
	slot3 = slot1
	slot4 = slot0

	return slot1(slot2, slot3(slot4))
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.WindowCovering
slot11 = slot11.Schneider
slot11 = slot11.SunProtectionIlluminanceThreshold

function slot12(slot0)
	slot1 = math
	slot1 = slot1.floor
	slot2 = slot0
	slot2 = slot2.mathLog10
	slot3 = slot0
	slot2 = slot2(slot3)
	slot2 = 10000 * slot2
	slot1 = slot1(slot2)
	slot2 = bytearray
	slot3 = {
		18,
		224
	}
	slot4 = slot1
	slot4 = slot4.DataType
	slot4 = slot4.Type
	slot4 = slot4.uint16
	slot3[3] = slot4
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.append
	slot4 = slot2
	slot5 = slot1

	return slot2(slot3, slot4(slot5))
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.WindowCovering
slot11 = slot11.Schneider
slot11 = slot11.LiftDriveUpTime

function slot12(slot0)
	slot1 = bytearray
	slot2 = {
		20,
		224
	}
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.uint16
	slot2[3] = slot3
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.append
	slot3 = slot1
	slot4 = slot0 * 10

	return slot1(slot2, slot3(slot4))
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.WindowCovering
slot11 = slot11.Schneider
slot11 = slot11.LiftDriveDownTime

function slot12(slot0)
	slot1 = bytearray
	slot2 = {
		21,
		224
	}
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.uint16
	slot2[3] = slot3
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.append
	slot3 = slot1
	slot4 = slot0 * 10

	return slot1(slot2, slot3(slot4))
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.WindowCovering
slot11 = slot11.Schneider
slot11 = slot11.TiltOpenCloseAndStepTime

function slot12(slot0)
	slot1 = math
	slot1 = slot1.floor
	slot2 = slot0 * 1000
	slot2 = slot2 / 10
	slot1 = slot1(slot2)
	slot2 = bytearray
	slot3 = {
		22,
		224
	}
	slot4 = slot0
	slot4 = slot4.DataType
	slot4 = slot4.Type
	slot4 = slot4.uint16
	slot3[3] = slot4
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.append
	slot4 = slot1
	slot5 = slot1

	return slot2(slot3, slot4(slot5))
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot12 = {}
slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Basic
slot11 = slot11.Somfy
slot12 = "ResetFactoryDefaultsSomfy"
slot11 = slot11[slot12]
slot10[slot11] = slot7
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Basic
slot11 = slot11.Somfy
slot12 = "SomfyLeaveNetwork"
slot11 = slot11[slot12]
slot10[slot11] = slot7
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.OnOff
slot12 = "Off"
slot11 = slot11[slot12]
slot10[slot11] = slot7
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.OnOff
slot12 = "On"
slot11 = slot11[slot12]
slot10[slot11] = slot7
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.OnOff
slot12 = "Toggle"
slot11 = slot11[slot12]
slot10[slot11] = slot7
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.WindowCovering
slot12 = "UpOrOpen"
slot11 = slot11[slot12]
slot10[slot11] = slot7
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.WindowCovering
slot12 = "DownOrClose"
slot11 = slot11[slot12]
slot10[slot11] = slot7
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.WindowCovering
slot12 = "Stop"
slot11 = slot11[slot12]
slot10[slot11] = slot7
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.WindowCovering
slot12 = "GoToLiftPercent"
slot11 = slot11[slot12]
slot10[slot11] = slot8
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.WindowCovering
slot12 = "GoToTiltPercent"
slot11 = slot11[slot12]
slot10[slot11] = slot8
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.WindowCovering
slot11 = slot11.Schneider
slot12 = "StopOrStepLiftPercentage"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = bytearray
	slot2 = 2
	slot1 = slot1(slot2)
	slot2 = slot0[2]
	slot1[2] = slot2
	slot2 = slot0[1]

	if slot2 == "down" then
		slot2 = 1
		slot1[1] = slot2
	else
		slot2 = 0
		slot1[1] = slot2
	end

	return slot1
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.WindowCovering
slot11 = slot11.Somfy
slot12 = "SomfyStep"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0[2]
	slot1 = slot1 * 65535
	slot1 = slot1 / 100
	slot2 = math
	slot2 = slot2.floor
	slot3 = slot1 + 0.5
	slot2 = slot2(slot3)
	slot1 = slot2
	slot2 = slot0
	slot3 = slot1
	slot2 = slot2(slot3)
	slot3 = bytearray
	slot4 = {}
	slot5 = slot1
	slot5 = slot5.Mapping
	slot5 = slot5.Command
	slot5 = slot5.WindowCovering
	slot5 = slot5.Somfy
	slot5 = slot5.SomfyStep
	slot6 = slot0[1]
	slot5 = slot5[slot6]
	slot4[1] = slot5
	slot5 = slot2[1]
	slot4[2] = slot5
	slot5 = slot2[2]
	slot4[3] = slot5

	return slot3(slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.WindowCovering
slot11 = slot11.Somfy
slot12 = "SomfyStoreLimit"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = bytearray
	slot2 = {}
	slot3 = slot0
	slot3 = slot3.Mapping
	slot3 = slot3.Command
	slot3 = slot3.WindowCovering
	slot3 = slot3.Somfy
	slot3 = slot3.SomfyStoreLimit
	slot3 = slot3[slot0]
	slot2[1] = slot3

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.WindowCovering
slot11 = slot11.Somfy
slot12 = "SomfyStepOutLimit"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0[2]
	slot1 = slot1(slot2)
	slot2 = bytearray
	slot3 = {}
	slot4 = slot1
	slot4 = slot4.Mapping
	slot4 = slot4.Command
	slot4 = slot4.WindowCovering
	slot4 = slot4.Somfy
	slot4 = slot4.SomfyStepOutLimit
	slot5 = slot0[1]
	slot4 = slot4[slot5]
	slot3[1] = slot4
	slot4 = slot1[1]
	slot3[2] = slot4
	slot4 = slot1[2]
	slot3[3] = slot4

	return slot2(slot3)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.WindowCovering
slot11 = slot11.Somfy
slot12 = "ReverseMotorDirection"
slot11 = slot11[slot12]
slot10[slot11] = slot7
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.WindowCovering
slot11 = slot11.Somfy
slot12 = "SomfyConfigureRange"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = bytearray
	slot2 = {}
	slot3 = slot0
	slot3 = slot3.Mapping
	slot3 = slot3.Command
	slot3 = slot3.WindowCovering
	slot3 = slot3.Somfy
	slot3 = slot3.SomfyConfigureRange
	slot3 = slot3.RangeId
	slot4 = slot0[1]
	slot3 = slot3[slot4]
	slot2[1] = slot3
	slot3 = slot0
	slot3 = slot3.Mapping
	slot3 = slot3.Command
	slot3 = slot3.WindowCovering
	slot3 = slot3.Somfy
	slot3 = slot3.SomfyConfigureRange
	slot3 = slot3.CommandId
	slot4 = slot0[2]
	slot3 = slot3[slot4]
	slot2[2] = slot3

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "Cleode"
slot11 = slot11[slot12]
slot12 = "SetMode"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = pairs
	slot2 = slot0
	slot2 = slot2.CleodeZPilotModeToHeatingStatusState
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		if slot5 == slot0 then
			slot6 = bytearray
			slot7 = {
				slot4
			}

			return slot6(slot7)
		end
	end

	slot1 = slot0
	slot1 = slot1.error
	slot2 = "No id found for HeatingStatusState "
	slot3 = slot0
	slot2 = slot2 .. slot3

	slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Identify
slot11 = slot11.Identify

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Groups
slot12 = "AddGroup"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = bytearray
	slot2 = 3
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.writeUInt16
	slot4 = 1
	slot5 = slot0
	slot6 = false

	slot2(slot3, slot4, slot5, slot6)

	slot3 = slot1
	slot2 = slot1.writeUInt8
	slot4 = 3
	slot5 = 0

	slot2(slot3, slot4, slot5)

	return slot1
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Groups
slot12 = "ViewGroup"
slot11 = slot11[slot12]
slot10[slot11] = slot2
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Groups
slot12 = "GetGroupMembership"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = bytearray
	slot2 = #slot0
	slot2 = slot2 * 2
	slot2 = 1 + slot2
	slot1 = slot1(slot2)
	slot2 = #slot0
	slot1[1] = slot2
	slot2 = pairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot1
		slot7 = slot1.writeUInt16
		slot9 = slot5 - 1
		slot9 = slot9 * 2
		slot9 = 2 + slot9
		slot10 = slot6
		slot11 = false

		slot7(slot8, slot9, slot10, slot11)
	end

	return slot1
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Groups
slot12 = "RemoveGroup"
slot11 = slot11[slot12]
slot10[slot11] = slot2
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Groups
slot12 = "RemoveAllGroups"
slot11 = slot11[slot12]
slot10[slot11] = slot7
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Groups
slot12 = "AddGroupIfIdentifying"
slot11 = slot11[slot12]
slot12 = "Converter"
slot12 = slot1[slot12]
slot13 = "ValueToRawValue"
slot12 = slot12[slot13]
slot13 = "Command"
slot13 = slot1[slot13]
slot13 = slot13.Groups
slot14 = "AddGroup"
slot13 = slot13[slot14]
slot12 = slot12[slot13]
slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Scenes
slot12 = "AddScene"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0.groupId

	if slot1 == nil then
		slot1 = slot0
		slot1 = slot1.error
		slot2 = "groupId is required by ZigbeeUtils.Command.Scenes.AddScene"

		slot1(slot2)
	end

	slot1 = slot0.sceneId

	if slot1 == nil then
		slot1 = slot0
		slot1 = slot1.error
		slot2 = "sceneId is required by ZigbeeUtils.Command.Scenes.AddScene"

		slot1(slot2)
	end

	slot1 = slot0.transitionTime

	if slot1 == nil then
		slot1 = 0
		slot0.transitionTime = slot1
	end

	slot1 = slot0.extentionFields

	if slot1 == nil then
		slot1 = {}
		slot0.extentionFields = slot1
	end

	slot1 = bytearray
	slot2 = 6
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.writeUInt16
	slot4 = 1
	slot5 = slot0.groupId
	slot6 = false

	slot2(slot3, slot4, slot5, slot6)

	slot3 = slot1
	slot2 = slot1.writeUInt8
	slot4 = 3
	slot5 = slot0.sceneId

	slot2(slot3, slot4, slot5)

	slot3 = slot1
	slot2 = slot1.writeUInt16
	slot4 = 4
	slot5 = slot0.transitionTime
	slot6 = false

	slot2(slot3, slot4, slot5, slot6)

	slot3 = slot1
	slot2 = slot1.writeUInt8
	slot4 = 5
	slot5 = 0

	slot2(slot3, slot4, slot5)

	slot2 = ipairs
	slot3 = slot0.extentionFields
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = bytearray
		slot8 = slot6.fields
		slot8 = #slot8
		slot8 = 3 + slot8
		slot7 = slot7(slot8)
		slot9 = slot7
		slot8 = slot7.writeUInt16
		slot10 = 1
		slot11 = slot6.clusterId
		slot12 = false

		slot8(slot9, slot10, slot11, slot12)

		slot9 = slot7
		slot8 = slot7.writeUInt8
		slot10 = 3
		slot11 = slot6.fields
		slot11 = #slot11

		slot8(slot9, slot10, slot11)

		slot8 = ipairs
		slot9 = slot6.fields
		slot8, slot9, slot10 = slot8(slot9)

		for slot11, slot12 in slot8, slot9, slot10 do
			slot14 = slot7
			slot13 = slot7.writeUInt8
			slot15 = 4 + slot11
			slot15 = slot15 - 1
			slot16 = slot12

			slot13(slot14, slot15, slot16)
		end

		slot9 = slot1
		slot8 = slot1.append
		slot10 = slot7
		slot8 = slot8(slot9, slot10)
		slot1 = slot8
	end

	return slot1
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Scenes
slot12 = "ViewScene"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = bytearray
	slot2 = 3
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.writeUInt16
	slot4 = 1
	slot5 = slot0[1]
	slot6 = false

	slot2(slot3, slot4, slot5, slot6)

	slot3 = slot1
	slot2 = slot1.writeUInt8
	slot4 = 3
	slot5 = slot0[2]

	slot2(slot3, slot4, slot5)

	return slot1
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Scenes
slot12 = "RemoveScene"
slot11 = slot11[slot12]
slot12 = "Converter"
slot12 = slot1[slot12]
slot13 = "ValueToRawValue"
slot12 = slot12[slot13]
slot13 = "Command"
slot13 = slot1[slot13]
slot13 = slot13.Scenes
slot14 = "ViewScene"
slot13 = slot13[slot14]
slot12 = slot12[slot13]
slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Scenes
slot12 = "RemoveAllScene"
slot11 = slot11[slot12]
slot10[slot11] = slot2
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Scenes
slot12 = "StoreScene"
slot11 = slot11[slot12]
slot12 = "Converter"
slot12 = slot1[slot12]
slot13 = "ValueToRawValue"
slot12 = slot12[slot13]
slot13 = "Command"
slot13 = slot1[slot13]
slot13 = slot13.Scenes
slot14 = "ViewScene"
slot13 = slot13[slot14]
slot12 = slot12[slot13]
slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Scenes
slot12 = "RecallScene"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = bytearray
	slot2 = 5
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.writeUInt16
	slot4 = 1
	slot5 = slot0[1]
	slot6 = false

	slot2(slot3, slot4, slot5, slot6)

	slot3 = slot1
	slot2 = slot1.writeUInt8
	slot4 = 3
	slot5 = slot0[2]

	slot2(slot3, slot4, slot5)

	slot2 = slot0[3]

	if slot2 ~= nil then
		slot3 = slot1
		slot2 = slot1.writeUInt16
		slot4 = 4
		slot5 = slot0[3]
		slot5 = slot5 * 10
		slot6 = false

		slot2(slot3, slot4, slot5, slot6)
	else
		slot3 = slot1
		slot2 = slot1.writeUInt16
		slot4 = 4
		slot5 = 0

		slot2(slot3, slot4, slot5)
	end

	return slot1
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Scenes
slot12 = "GetSceneMembership"
slot11 = slot11[slot12]
slot10[slot11] = slot2
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Scenes
slot12 = "EnhancedAddScene"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0.transitionTime

	if slot1 ~= nil then
		slot1 = slot0.transitionTime
		slot1 = slot1 * 10
		slot0.transitionTime = slot1
	end

	slot1 = slot0
	slot1 = slot1.Converter
	slot1 = slot1.ValueToRawValue
	slot2 = slot0
	slot2 = slot2.Command
	slot2 = slot2.Scenes
	slot2 = slot2.AddScene
	slot1 = slot1[slot2]
	slot2 = slot0

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Scenes
slot12 = "EnhancedViewScene"
slot11 = slot11[slot12]
slot12 = "Converter"
slot12 = slot1[slot12]
slot13 = "ValueToRawValue"
slot12 = slot12[slot13]
slot13 = "Command"
slot13 = slot1[slot13]
slot13 = slot13.Scenes
slot14 = "ViewScene"
slot13 = slot13[slot14]
slot12 = slot12[slot13]
slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Scenes
slot12 = "CopyScene"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = bytearray
	slot2 = 7
	slot1 = slot1(slot2)
	slot2 = slot0.mode

	if slot2 == nil then
		slot2 = slot0
		slot2 = slot2.error
		slot3 = "mode is required by ZigbeeUtils.Command.Scenes.CopyScene"

		slot2(slot3)
	end

	slot2 = slot0.groupIdFrom

	if slot2 == nil then
		slot2 = slot0
		slot2 = slot2.error
		slot3 = "groupIdFrom is required by ZigbeeUtils.Command.Scenes.CopyScene"

		slot2(slot3)
	end

	slot2 = slot0.sceneIdFrom

	if slot2 == nil then
		slot2 = slot0
		slot2 = slot2.error
		slot3 = "sceneIdFrom is required by ZigbeeUtils.Command.Scenes.CopyScene"

		slot2(slot3)
	end

	slot2 = slot0.groupIdTo

	if slot2 == nil then
		slot2 = slot0
		slot2 = slot2.error
		slot3 = "groupIdTo is required by ZigbeeUtils.Command.Scenes.CopyScene"

		slot2(slot3)
	end

	slot2 = slot0.sceneIdTo

	if slot2 == nil then
		slot2 = slot0
		slot2 = slot2.error
		slot3 = "sceneIdTo is required by ZigbeeUtils.Command.Scenes.CopyScene"

		slot2(slot3)
	end

	slot3 = slot1
	slot2 = slot1.writeUInt8
	slot4 = 1
	slot5 = slot0.mode

	slot2(slot3, slot4, slot5)

	slot3 = slot1
	slot2 = slot1.writeUInt16
	slot4 = 2
	slot5 = slot0.groupIdFrom
	slot6 = false

	slot2(slot3, slot4, slot5, slot6)

	slot3 = slot1
	slot2 = slot1.writeUInt8
	slot4 = 4
	slot5 = slot0.sceneIdFrom

	slot2(slot3, slot4, slot5)

	slot3 = slot1
	slot2 = slot1.writeUInt16
	slot4 = 5
	slot5 = slot0.groupIdTo
	slot6 = false

	slot2(slot3, slot4, slot5, slot6)

	slot3 = slot1
	slot2 = slot1.writeUInt8
	slot4 = 7
	slot5 = slot0.sceneIdTo

	slot2(slot3, slot4, slot5)

	return slot1
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.LevelControl
slot12 = "MoveToLevel"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = bytearray
	slot2 = {
		nil,
		0,
		0
	}
	slot3 = math
	slot3 = slot3.floor
	slot4 = slot0 * 2.54
	slot3 = slot3(slot4)
	slot2[1] = slot3

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.LevelControl
slot12 = "Move"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = bytearray
	slot2 = {
		nil,
		255
	}
	slot3 = tonumber
	slot4 = slot0
	slot3 = slot3(slot4)
	slot2[1] = slot3

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.LevelControl
slot12 = "Step"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = bytearray
	slot2 = {
		nil,
		nil,
		255,
		255
	}
	slot3 = tonumber
	slot4 = slot0[1]
	slot3 = slot3(slot4)
	slot2[1] = slot3
	slot3 = math
	slot3 = slot3.floor
	slot4 = tonumber
	slot5 = slot0[2]
	slot4 = slot4(slot5)
	slot4 = slot4 * 2.54
	slot3 = slot3(slot4)
	slot2[2] = slot3

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.LevelControl
slot12 = "Stop"
slot11 = slot11[slot12]

function slot12()
	slot0 = bytearray
	slot1 = {}

	return slot0(slot1)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.LevelControl
slot12 = "StopWithOnOff"
slot11 = slot11[slot12]
slot12 = "Converter"
slot12 = slot1[slot12]
slot13 = "ValueToRawValue"
slot12 = slot12[slot13]
slot13 = "Command"
slot13 = slot1[slot13]
slot13 = slot13.LevelControl
slot14 = "Stop"
slot13 = slot13[slot14]
slot12 = slot12[slot13]
slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.LevelControl
slot12 = "MoveToLevelWithOnOff"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.Converter
	slot1 = slot1.ValueToRawValue
	slot2 = slot0
	slot2 = slot2.Command
	slot2 = slot2.LevelControl
	slot2 = slot2.MoveToLevel
	slot1 = slot1[slot2]
	slot2 = slot0

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.LevelControl
slot12 = "MoveWithOnOff"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.Converter
	slot1 = slot1.ValueToRawValue
	slot2 = slot0
	slot2 = slot2.Command
	slot2 = slot2.LevelControl
	slot2 = slot2.Move
	slot1 = slot1[slot2]
	slot2 = slot0

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.LevelControl
slot12 = "StepWithOnOff"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.Converter
	slot1 = slot1.ValueToRawValue
	slot2 = slot0
	slot2 = slot2.Command
	slot2 = slot2.LevelControl
	slot2 = slot2.Step
	slot1 = slot1[slot2]
	slot2 = slot0

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.LevelControl
slot12 = "MoveToClosestFrequency"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = bytearray
	slot2 = 2
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.writeUInt16
	slot4 = 1
	slot5 = slot0
	slot6 = false

	slot2(slot3, slot4, slot5, slot6)

	return slot1
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "Profalux"
slot11 = slot11[slot12]
slot12 = "SetPositionAndOrientation"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0[1]
	slot2 = slot0[2]
	slot3 = 3

	if slot1 == nil then
		slot3 = slot3 - 1
		slot1 = 0
	else
		slot4 = slot0
		slot4 = slot4.Converter
		slot4 = slot4.ValueToRawValue
		slot5 = slot0
		slot5 = slot5.Command
		slot5 = slot5.LevelControl
		slot5 = slot5.MoveToLevel
		slot4 = slot4[slot5]
		slot5 = 100 - slot1
		slot4 = slot4(slot5)
		slot1 = slot4[1]
	end

	if slot2 == nil then
		slot3 = slot3 - 2
		slot2 = 0
	else
		slot4 = math
		slot4 = slot4.floor
		slot5 = 100 - slot2
		slot5 = slot5 * 0.9
		slot4 = slot4(slot5)
		slot2 = slot4
	end

	slot4 = bytearray
	slot5 = {
		slot3,
		slot1,
		slot2,
		255,
		255
	}

	return slot4(slot5)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "MoveToHUE"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the Hue field"
	slot4 = "You should set direction field"

	slot1(slot2, slot3, slot4)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.transitionTimeToRawState
	slot2 = slot0[3]
	slot1 = slot1(slot2)
	slot2 = bytearray
	slot3 = 4
	slot2 = slot2(slot3)
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.hueToRawState
	slot4 = slot0[1]
	slot3 = slot3(slot4)
	slot2[1] = slot3
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.fadeMode
	slot4 = slot0[2]
	slot3 = slot3(slot4)
	slot2[2] = slot3
	slot4 = slot2
	slot3 = slot2.writeUInt16
	slot5 = 3
	slot6 = slot1
	slot7 = false

	slot3(slot4, slot5, slot6, slot7)

	return slot2
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "MoveHUE"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the direction field"
	slot4 = "You should set Hue field"

	slot1(slot2, slot3, slot4)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.moveMode
	slot2 = slot0[1]
	slot1 = slot1(slot2)
	slot2 = slot1
	slot2 = slot2.Converter
	slot2 = slot2.hueToRawState
	slot3 = slot0[2]
	slot2 = slot2(slot3)
	slot3 = bytearray
	slot4 = {
		slot1,
		slot2
	}

	return slot3(slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "StepHUE"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the direction field"
	slot4 = "You should set Hue field"

	slot1(slot2, slot3, slot4)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.stepMode
	slot2 = slot0[1]
	slot1 = slot1(slot2)
	slot2 = slot1
	slot2 = slot2.Converter
	slot2 = slot2.hueToRawState
	slot3 = slot0[2]
	slot2 = slot2(slot3)
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.transitionTimeToRawState
	slot4 = slot0[3]
	slot3 = slot3(slot4)
	slot4 = bytearray
	slot5 = {
		slot1,
		slot2,
		slot3
	}

	return slot4(slot5)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "MoveToSaturation"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the saturation field"

	slot1(slot2, slot3)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.transitionTimeToRawState
	slot2 = slot0[2]
	slot1 = slot1(slot2)
	slot2 = bytearray
	slot3 = 3
	slot2 = slot2(slot3)
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.saturationToRawState
	slot4 = slot0[1]
	slot3 = slot3(slot4)
	slot2[1] = slot3
	slot4 = slot2
	slot3 = slot2.writeUInt16
	slot5 = 2
	slot6 = slot1
	slot7 = false

	slot3(slot4, slot5, slot6, slot7)

	return slot2
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "MoveSaturation"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the direction field"
	slot4 = "You should set saturation field"

	slot1(slot2, slot3, slot4)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.moveMode
	slot2 = slot0[1]
	slot1 = slot1(slot2)

	if slot1 == nil then
		slot2 = slot1
		slot2 = slot2.error
		slot3 = "The fade mode "
		slot4 = slot0[1]
		slot5 = " is not recognized for direction"
		slot3 = slot3 .. slot4 .. slot5

		slot2(slot3)
	end

	slot2 = slot1
	slot2 = slot2.Converter
	slot2 = slot2.saturationToRawState
	slot3 = slot0[2]
	slot2 = slot2(slot3)
	slot3 = bytearray
	slot4 = {
		slot1,
		slot2
	}

	return slot3(slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "StepSaturation"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the direction field"
	slot4 = "You should set saturation field"

	slot1(slot2, slot3, slot4)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.stepMode
	slot2 = slot0[1]
	slot1 = slot1(slot2)
	slot2 = slot1
	slot2 = slot2.Converter
	slot2 = slot2.saturationToRawState
	slot3 = slot0[2]
	slot2 = slot2(slot3)
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.transitionTimeToRawState
	slot4 = slot0[3]
	slot3 = slot3(slot4)
	slot4 = bytearray
	slot5 = {
		slot1,
		slot2,
		slot3
	}

	return slot4(slot5)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "MoveToHUEAndSaturation"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the Hue field"
	slot4 = "You should set saturation field"

	slot1(slot2, slot3, slot4)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.transitionTimeToRawState
	slot2 = slot0[3]
	slot1 = slot1(slot2)
	slot2 = bytearray
	slot3 = 4
	slot2 = slot2(slot3)
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.hueToRawState
	slot4 = slot0[1]
	slot3 = slot3(slot4)
	slot2[1] = slot3
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.saturationToRawState
	slot4 = slot0[2]
	slot3 = slot3(slot4)
	slot2[2] = slot3
	slot4 = slot2
	slot3 = slot2.writeUInt16
	slot5 = 3
	slot6 = slot1
	slot7 = false

	slot3(slot4, slot5, slot6, slot7)

	return slot2
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "EnhancedMoveToHUE"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the Hue field"
	slot4 = "You should set direction field"

	slot1(slot2, slot3, slot4)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.transitionTimeToRawState
	slot2 = slot0[3]
	slot1 = slot1(slot2)
	slot2 = bytearray
	slot3 = 5
	slot2 = slot2(slot3)
	slot3 = 0
	slot2[1] = slot3
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.hueToRawState
	slot4 = slot0[1]
	slot3 = slot3(slot4)
	slot2[2] = slot3
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.fadeMode
	slot4 = slot0[2]
	slot3 = slot3(slot4)
	slot2[3] = slot3
	slot4 = slot2
	slot3 = slot2.writeUInt16
	slot5 = 4
	slot6 = slot1
	slot7 = false

	slot3(slot4, slot5, slot6, slot7)

	return slot2
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "EnhancedMoveHUE"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the direction field"
	slot4 = "You should set Hue field"

	slot1(slot2, slot3, slot4)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.moveMode
	slot2 = slot0[1]
	slot1 = slot1(slot2)
	slot2 = slot1
	slot2 = slot2.Converter
	slot2 = slot2.hueToRawState
	slot3 = slot0[2]
	slot2 = slot2(slot3)
	slot3 = bytearray
	slot4 = {
		slot1,
		0,
		slot2
	}

	return slot3(slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "EnhancedStepHUE"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the direction field"
	slot4 = "You should set Hue field"

	slot1(slot2, slot3, slot4)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.transitionTimeToRawState
	slot2 = slot0[3]
	slot1 = slot1(slot2)
	slot2 = bytearray
	slot3 = 5
	slot2 = slot2(slot3)
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.stepMode
	slot4 = slot0[1]
	slot3 = slot3(slot4)
	slot2[1] = slot3
	slot3 = 0
	slot2[2] = slot3
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.hueToRawState
	slot4 = slot0[2]
	slot3 = slot3(slot4)
	slot2[3] = slot3
	slot4 = slot2
	slot3 = slot2.writeUInt16
	slot5 = 4
	slot6 = slot1
	slot7 = false

	slot3(slot4, slot5, slot6, slot7)

	return slot2
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "EnhancedMoveToHUEAndSaturation"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the Hue field"
	slot4 = "You should set saturation field"

	slot1(slot2, slot3, slot4)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.transitionTimeToRawState
	slot2 = slot0[3]
	slot1 = slot1(slot2)
	slot2 = bytearray
	slot3 = 5
	slot2 = slot2(slot3)
	slot3 = 0
	slot2[1] = slot3
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.hueToRawState
	slot4 = slot0[1]
	slot3 = slot3(slot4)
	slot2[2] = slot3
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.saturationToRawState
	slot4 = slot0[2]
	slot3 = slot3(slot4)
	slot2[3] = slot3
	slot4 = slot2
	slot3 = slot2.writeUInt16
	slot5 = 4
	slot6 = slot1
	slot7 = false

	slot3(slot4, slot5, slot6, slot7)

	return slot2
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "ColorLoopSet"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.enumValueToEnumIndex
	slot2 = slot1
	slot2 = slot2.Mapping
	slot2 = slot2.Command
	slot2 = slot2.ColorCluster
	slot2 = slot2.ColorLoop
	slot2 = slot2.Action
	slot3 = slot0[1]
	slot1 = slot1(slot2, slot3)
	slot2 = slot0
	slot2 = slot2.enumValueToEnumIndex
	slot3 = slot1
	slot3 = slot3.Mapping
	slot3 = slot3.Command
	slot3 = slot3.ColorCluster
	slot3 = slot3.ColorLoop
	slot3 = slot3.Direction
	slot4 = slot0[2]
	slot2 = slot2(slot3, slot4)
	slot3 = slot0[3]
	slot4 = slot1
	slot4 = slot4.Converter
	slot4 = slot4.hueToRawState
	slot5 = slot0[4]
	slot4 = slot4(slot5)
	slot5 = 0
	slot6 = slot4
	slot7 = bit
	slot7 = slot7.band
	slot8 = 255
	slot9 = slot3
	slot7 = slot7(slot8, slot9)
	slot8 = bit
	slot8 = slot8.rshift
	slot9 = bit
	slot9 = slot9.band
	slot10 = 65280
	slot11 = slot3
	slot9 = slot9(slot10, slot11)
	slot10 = 8
	slot8 = slot8(slot9, slot10)
	slot9 = bytearray
	slot10 = {
		15,
		slot1,
		slot2,
		slot7,
		slot8,
		slot5,
		slot6
	}

	return slot9(slot10)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "MoveToColorXY"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the ColorX field"
	slot4 = "You should set ColorY field"

	slot1(slot2, slot3, slot4)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.colorXYToRawState
	slot2 = slot0[1]
	slot1 = slot1(slot2)
	slot2 = slot1
	slot2 = slot2.Converter
	slot2 = slot2.colorXYToRawState
	slot3 = slot0[2]
	slot2 = slot2(slot3)
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.transitionTimeToRawState
	slot4 = slot0[3]
	slot3 = slot3(slot4)
	slot4 = bytearray
	slot5 = 6
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.writeUInt16
	slot7 = 1
	slot8 = slot1
	slot9 = false

	slot5(slot6, slot7, slot8, slot9)

	slot6 = slot4
	slot5 = slot4.writeUInt16
	slot7 = 3
	slot8 = slot2
	slot9 = false

	slot5(slot6, slot7, slot8, slot9)

	slot6 = slot4
	slot5 = slot4.writeUInt16
	slot7 = 5
	slot8 = slot3
	slot9 = false

	slot5(slot6, slot7, slot8, slot9)

	return slot4
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "MoveColorXY"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the ColorX field"
	slot4 = "You should set ColorY field"

	slot1(slot2, slot3, slot4)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.colorXYToRawState
	slot2 = slot0[1]
	slot1 = slot1(slot2)
	slot2 = slot1
	slot2 = slot2.Converter
	slot2 = slot2.colorXYToRawState
	slot3 = slot0[2]
	slot2 = slot2(slot3)
	slot3 = bytearray
	slot4 = 4
	slot3 = slot3(slot4)
	slot5 = slot3
	slot4 = slot3.writeUInt16
	slot6 = 1
	slot7 = slot1
	slot8 = false

	slot4(slot5, slot6, slot7, slot8)

	slot5 = slot3
	slot4 = slot3.writeUInt16
	slot6 = 3
	slot7 = slot2
	slot8 = false

	slot4(slot5, slot6, slot7, slot8)

	return slot3
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "StepColorXY"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the ColorX field"
	slot4 = "You should set ColorY field"

	slot1(slot2, slot3, slot4)

	slot1 = slot1
	slot1 = slot1.Converter
	slot1 = slot1.colorXYToRawState
	slot2 = slot0[1]
	slot1 = slot1(slot2)
	slot2 = slot1
	slot2 = slot2.Converter
	slot2 = slot2.colorXYToRawState
	slot3 = slot0[2]
	slot2 = slot2(slot3)
	slot3 = slot1
	slot3 = slot3.Converter
	slot3 = slot3.transitionTimeToRawState
	slot4 = slot0[3]
	slot3 = slot3(slot4)
	slot4 = bytearray
	slot5 = 6
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.writeUInt16
	slot7 = 1
	slot8 = slot1
	slot9 = false

	slot5(slot6, slot7, slot8, slot9)

	slot6 = slot4
	slot5 = slot4.writeUInt16
	slot7 = 3
	slot8 = slot2
	slot9 = false

	slot5(slot6, slot7, slot8, slot9)

	slot6 = slot4
	slot5 = slot4.writeUInt16
	slot7 = 5
	slot8 = slot3
	slot9 = false

	slot5(slot6, slot7, slot8, slot9)

	return slot4
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "MoveToColorTemperature"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = "You should set the temperature field"

	slot1(slot2, slot3)

	slot1 = slot0[1]
	slot2 = slot1
	slot2 = slot2.Converter
	slot2 = slot2.transitionTimeToRawState
	slot3 = slot0[2]
	slot2 = slot2(slot3)
	slot3 = 0

	if slot1 ~= 0 then
		slot4 = math
		slot4 = slot4.floor
		slot5 = 1000000 / slot1
		slot4 = slot4(slot5)
		slot3 = slot4
	end

	slot4 = bytearray
	slot5 = 4
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.writeUInt16
	slot7 = 1
	slot8 = slot3
	slot9 = false

	slot5(slot6, slot7, slot8, slot9)

	slot6 = slot4
	slot5 = slot4.writeUInt16
	slot7 = 3
	slot8 = slot2
	slot9 = false

	slot5(slot6, slot7, slot8, slot9)

	return slot4
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "StopMoveStep"
slot11 = slot11[slot12]
slot10[slot11] = slot7
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot12 = "ColorControl"
slot11 = slot11[slot12]
slot12 = "StepColorTemperature"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0[1]
	slot2 = slot0[2]
	slot3 = slot0
	slot3 = slot3.Converter
	slot3 = slot3.transitionTimeToRawState
	slot4 = slot0[3]
	slot3 = slot3(slot4)
	slot4 = slot0
	slot4 = slot4.Converter
	slot4 = slot4.stepMode
	slot5 = slot1
	slot4 = slot4(slot5)
	slot5 = 0

	if slot2 ~= 0 then
		slot6 = math
		slot6 = slot6.floor
		slot7 = 1000000 / slot2
		slot6 = slot6(slot7)
		slot5 = slot6
	end

	slot6 = bytearray
	slot7 = 7
	slot6 = slot6(slot7)
	slot6[1] = slot4
	slot8 = slot6
	slot7 = slot6.writeUInt16
	slot9 = 2
	slot10 = slot5
	slot11 = false

	slot7(slot8, slot9, slot10, slot11)

	slot8 = slot6
	slot7 = slot6.writeUInt16
	slot9 = 4
	slot10 = slot3
	slot11 = false

	slot7(slot8, slot9, slot10, slot11)

	slot7 = 0
	slot6[6] = slot7
	slot7 = 0
	slot6[7] = slot7

	return slot6
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Thermostat
slot12 = "SetpointRaiseLower"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = {
		heat = 0,
		both = 2,
		cool = 1
	}
	slot2 = math
	slot2 = slot2.ceil
	slot3 = slot0[2]
	slot3 = slot3 * 10
	slot2 = slot2(slot3)
	slot3 = bytearray
	slot4 = {}
	slot5 = slot0[1]
	slot5 = slot1[slot5]
	slot4[1] = slot5
	slot4[2] = slot2

	return slot3(slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Thermostat
slot12 = "GetWeeklySchedule"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.Converter
	slot1 = slot1.daysOfWeekToDayMask
	slot2 = slot0[1]
	slot1 = slot1(slot2)
	slot2 = {
		heat = 1,
		both = 3,
		cool = 2
	}
	slot3 = bytearray
	slot4 = {
		slot1
	}
	slot5 = slot0[2]
	slot5 = slot2[slot5]
	slot4[2] = slot5

	return slot3(slot4)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToRawValue"
slot10 = slot10[slot11]
slot11 = "Command"
slot11 = slot1[slot11]
slot11 = slot11.Thermostat
slot12 = "SetWeeklySchedule"
slot11 = slot11[slot12]

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.Converter
	slot1 = slot1.daysOfWeekToDayMask
	slot2 = slot0[1]
	slot1 = slot1(slot2)
	slot2 = slot0[2]
	slot2 = #slot2

	if slot2 == 0 then
		slot2 = bytearray
		slot3 = {
			0,
			slot1,
			0
		}

		return slot2(slot3)
	end

	slot2 = slot0[2][1].heatSetpoint ~= nil
	slot3 = slot0[2][1].coolSetpoint ~= nil

	if not slot2 and not slot3 then
		slot4 = error
		slot5 = "At least a heating or cooling setpoint should be set"

		slot4(slot5)
	end

	slot4 = 0

	if slot2 then
		slot5 = bit
		slot5 = slot5.bor
		slot6 = slot4
		slot7 = 1
		slot5 = slot5(slot6, slot7)
		slot4 = slot5
	end

	if slot3 then
		slot5 = bit
		slot5 = slot5.bor
		slot6 = slot4
		slot7 = 2
		slot5 = slot5(slot6, slot7)
		slot4 = slot5
	end

	slot5 = 4

	if slot2 and slot3 then
		slot5 = 6
	end

	slot6 = bytearray
	slot7 = {}
	slot8 = slot0[2]
	slot8 = #slot8
	slot7[1] = slot8
	slot7[2] = slot1
	slot7[3] = slot4
	slot6 = slot6(slot7)
	slot7 = pairs
	slot8 = slot0[2]
	slot7, slot8, slot9 = slot7(slot8)

	for slot10 in slot7, slot8, slot9 do
		slot11 = slot0[2]
		slot11 = slot11[slot10]
		slot11 = slot11.heatSetpoint
		slot12 = slot0[2]
		slot12 = slot12[slot10]
		slot12 = slot12.coolSetpoint
		slot13 = slot0[2]
		slot13 = slot13[slot10]
		slot13 = slot13.transitionTime
		slot14 = bytearray
		slot15 = slot5
		slot14 = slot14(slot15)
		slot16 = slot14
		slot15 = slot14.writeUInt16
		slot17 = 1
		slot18 = slot13
		slot19 = false

		slot15(slot16, slot17, slot18, slot19)

		slot15 = 3

		if slot2 then
			if slot11 == nil then
				slot16 = error
				slot17 = "Missing heating setpoint"

				slot16(slot17)
			end

			slot17 = slot14
			slot16 = slot14.writeUInt16
			slot18 = slot15
			slot19 = slot11 * 100
			slot20 = false

			slot16(slot17, slot18, slot19, slot20)

			slot15 = slot15 + 2
		end

		if slot3 then
			if slot12 == nil then
				slot16 = error
				slot17 = "Missing cooling setpoint"

				slot16(slot17)
			end

			slot17 = slot14
			slot16 = slot14.writeUInt16
			slot18 = slot15
			slot19 = slot12 * 100
			slot20 = false

			slot16(slot17, slot18, slot19, slot20)
		end

		slot17 = slot6
		slot16 = slot6.append
		slot18 = slot14
		slot16 = slot16(slot17, slot18)
		slot6 = slot16
	end

	return slot6
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Time
slot11 = slot11.Time

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.Time
	slot2 = slot2.Time
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = slot2
	slot3 = slot1[2]
	slot2, slot3 = slot2(slot3)
	slot4 = bytearray
	slot5 = {
		slot2,
		slot3
	}
	slot6 = slot1
	slot6 = slot6.DataType
	slot6 = slot6.Type
	slot6 = slot6.UTC
	slot5[3] = slot6
	slot5[4] = slot0
	slot6 = bit
	slot6 = slot6.rshift
	slot7 = slot0
	slot8 = 8
	slot6 = slot6(slot7, slot8)
	slot5[5] = slot6
	slot6 = bit
	slot6 = slot6.rshift
	slot7 = slot0
	slot8 = 16
	slot6 = slot6(slot7, slot8)
	slot5[6] = slot6
	slot6 = bit
	slot6 = slot6.rshift
	slot7 = slot0
	slot8 = 24
	slot5[MULTRES] = slot6(slot7, slot8)

	return slot4(slot5)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "ValueToWriteAttribute"
slot10 = slot10[slot11]
slot11 = slot1.Attribute
slot11 = slot11.Time
slot11 = slot11.TimeStatus

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot1
	slot2 = slot2.Attribute
	slot2 = slot2.Time
	slot2 = slot2.TimeStatus
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = slot2
	slot3 = slot1[2]
	slot2, slot3 = slot2(slot3)
	slot4 = bytearray
	slot5 = {
		slot2,
		slot3
	}
	slot6 = slot1
	slot6 = slot6.DataType
	slot6 = slot6.Type
	slot6 = slot6.map8
	slot5[3] = slot6
	slot5[4] = slot0

	return slot4(slot5)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "dayOfWeekMasks"
slot12 = {
	saturday = 64,
	wednesday = 8,
	tuesday = 4,
	thursday = 16,
	sunday = 1,
	friday = 32,
	monday = 2,
	vacation = 128
}
slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "daysOfWeekToDayMask"

function slot12(slot0)
	slot1 = slot0
	slot1 = slot1.stringSimpleSplit
	slot2 = slot0
	slot3 = ","
	slot1 = slot1(slot2, slot3)
	slot2 = 0
	slot3 = pairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)

	for slot6 in slot3, slot4, slot5 do
		slot7 = slot1
		slot7 = slot7.Converter
		slot7 = slot7.dayOfWeekMasks
		slot8 = slot1[slot6]
		slot7 = slot7[slot8]

		if slot7 == nil then
			slot7 = error
			slot8 = "Unknown day : "
			slot9 = slot1[slot6]
			slot8 = slot8 + slot9
			slot9 = ". Expected monday, tuesday, wednesday, thursday, friday, saturday or vacation."
			slot8 = slot8 + slot9

			slot7(slot8)
		end

		slot7 = bit
		slot7 = slot7.bor
		slot8 = slot2
		slot9 = slot1
		slot9 = slot9.Converter
		slot9 = slot9.dayOfWeekMasks
		slot10 = slot1[slot6]
		slot9 = slot9[slot10]
		slot7 = slot7(slot8, slot9)
		slot2 = slot7
	end

	return slot2
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "dayMaskToDaysOfWeek"

function slot12(slot0)
	slot1 = {}
	slot2 = pairs
	slot3 = slot0
	slot3 = slot3.Converter
	slot3 = slot3.dayOfWeekMasks
	slot2, slot3, slot4 = slot2(slot3)

	for slot5 in slot2, slot3, slot4 do
		slot6 = bit
		slot6 = slot6.band
		slot7 = slot0
		slot8 = slot0
		slot8 = slot8.Converter
		slot8 = slot8.dayOfWeekMasks
		slot8 = slot8[slot5]
		slot6 = slot6(slot7, slot8)

		if slot6 ~= 0 then
			slot6 = #slot1
			slot6 = slot6 + 1
			slot1[slot6] = slot5
		end
	end

	return slot1
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "colorXYToRawState"

function slot12(slot0)
	slot1 = slot0 * 65536

	return slot1
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "saturationToRawState"

function slot12(slot0)
	slot1 = math
	slot1 = slot1.floor
	slot2 = slot0 / 100
	slot2 = slot2 * 254

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "transitionTimeToRawState"

function slot12(slot0)
	if slot0 == nil then
		slot1 = 0

		return slot1
	end

	slot1 = math
	slot1 = slot1.floor
	slot2 = slot0 * 10

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "hueToRawState"

function slot12(slot0)
	slot1 = math
	slot1 = slot1.floor
	slot2 = slot0 * 254
	slot2 = slot2 / 360

	return slot1(slot2)
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "moveMode"

function slot12(slot0)
	if slot0 == nil then
		slot1 = slot0
		slot1 = slot1.error
		slot2 = "You should set the move mode"

		slot1(slot2)
	end

	slot1 = slot1
	slot1 = slot1.enumValueToEnumIndex
	slot2 = slot0
	slot2 = slot2.Mapping
	slot2 = slot2.Command
	slot2 = slot2.ColorCluster
	slot2 = slot2.MoveHUE
	slot2 = slot2.MoveMode
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot2 = slot0
		slot2 = slot2.error
		slot3 = "The move mode "
		slot4 = slot0
		slot5 = " is not recognized"
		slot3 = slot3 .. slot4 .. slot5
		slot2 = slot2(slot3)
	end

	return slot2
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "fadeMode"

function slot12(slot0)
	if slot0 == nil then
		slot1 = slot0
		slot1 = slot1.error
		slot2 = "You should set the fade mode"

		slot1(slot2)
	end

	slot1 = slot1
	slot1 = slot1.enumValueToEnumIndex
	slot2 = slot0
	slot2 = slot2.Mapping
	slot2 = slot2.Command
	slot2 = slot2.ColorCluster
	slot2 = slot2.MoveToHUE
	slot2 = slot2.FadeMode
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot2 = slot0
		slot2 = slot2.error
		slot3 = "The fade mode "
		slot4 = slot0
		slot5 = " is not recognized"
		slot3 = slot3 .. slot4 .. slot5
		slot2 = slot2(slot3)
	end

	return slot2
end

slot10[slot11] = slot12
slot10 = "Converter"
slot10 = slot1[slot10]
slot11 = "stepMode"

function slot12(slot0)
	if slot0 == nil then
		slot1 = slot0
		slot1 = slot1.error
		slot2 = "You should set the step mode"

		slot1(slot2)
	end

	slot1 = slot1
	slot1 = slot1.enumValueToEnumIndex
	slot2 = slot0
	slot2 = slot2.Mapping
	slot2 = slot2.Command
	slot2 = slot2.ColorCluster
	slot2 = slot2.StopMoveStep
	slot2 = slot2.StepMode
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot2 = slot0
		slot2 = slot2.error
		slot3 = "The step mode "
		slot4 = slot0
		slot5 = " is not recognized"
		slot3 = slot3 .. slot4 .. slot5
		slot2 = slot2(slot3)
	end

	return slot2
end

slot10[slot11] = slot12

function slot10(slot0)
	return slot0
end

function slot11(slot0)
	function slot1(slot0)
		slot1 = slot0
		slot1 = slot1.isValidRawValue
		slot2 = slot0
		slot3 = slot1
		slot1 = slot1(slot2, slot3)

		if not slot1 then
			slot1 = overkiz
			slot1 = slot1.magic
			slot1 = slot1.IGNORE

			return slot1
		end

		slot1 = slot2
		slot2 = slot0

		return slot1(slot2)
	end

	return slot1
end

function slot12(slot0)
	function slot1(slot0)
		slot1 = slot0
		slot1 = slot1.isValidRawValue
		slot2 = slot0
		slot3 = slot1
		slot1 = slot1(slot2, slot3)

		if not slot1 then
			slot1 = overkiz
			slot1 = slot1.magic
			slot1 = slot1.IGNORE

			return slot1
		end

		slot2 = slot0
		slot1 = slot0.tostring
		slot3 = "base64"

		return slot1(slot2, slot3)
	end

	return slot1
end

function slot13(slot0, slot1)
	function slot2(slot0)
		slot1 = bit
		slot1 = slot1.band
		slot2 = 1
		slot3 = slot0
		slot1 = slot1(slot2, slot3)

		if slot1 == 1 then
			slot1 = slot0

			return slot1
		else
			slot1 = slot1

			return slot1
		end
	end

	return slot2
end

function slot14(slot0)
	slot1 = slot0 / 4

	return slot1
end

function slot15(slot0)
	function slot1(slot0)
		slot1 = slot0
		slot1 = slot1.isValidRawValue
		slot2 = slot0
		slot3 = slot1
		slot1 = slot1(slot2, slot3)

		if not slot1 then
			slot1 = overkiz
			slot1 = slot1.magic
			slot1 = slot1.IGNORE

			return slot1
		end

		slot1 = slot2
		slot2 = slot0

		return slot1(slot2)
	end

	return slot1
end

function slot16(slot0)
	slot1 = slot0 / 10

	return slot1
end

function slot17(slot0)
	function slot1(slot0)
		slot1 = slot0
		slot1 = slot1.isValidRawValue
		slot2 = slot0
		slot3 = slot1
		slot1 = slot1(slot2, slot3)

		if not slot1 then
			slot1 = overkiz
			slot1 = slot1.magic
			slot1 = slot1.IGNORE

			return slot1
		end

		slot1 = slot2
		slot2 = slot0

		return slot1(slot2)
	end

	return slot1
end

function slot18(slot0)
	slot1 = slot0 / 100

	return slot1
end

function slot19(slot0)
	function slot1(slot0)
		slot1 = slot0
		slot1 = slot1.isValidRawValue
		slot2 = slot0
		slot3 = slot1
		slot1 = slot1(slot2, slot3)

		if not slot1 then
			slot1 = overkiz
			slot1 = slot1.magic
			slot1 = slot1.IGNORE

			return slot1
		end

		slot1 = slot2
		slot2 = slot0

		return slot1(slot2)
	end

	return slot1
end

function slot20(slot0, slot1)
	function slot2(slot0)
		slot1 = slot0
		slot1 = slot1.isValidRawValue
		slot2 = slot0
		slot3 = slot1
		slot1 = slot1(slot2, slot3)

		if not slot1 then
			slot1 = overkiz
			slot1 = slot1.magic
			slot1 = slot1.IGNORE

			return slot1
		end

		slot1 = slot2
		slot2 = tonumber
		slot3 = slot0
		slot2 = slot2(slot3)
		slot1 = slot1[slot2]

		return slot1
	end

	return slot2
end

function slot21(slot0)
	function slot1(slot0)
		slot1 = slot0
		slot1 = slot1.isValidRawValue
		slot2 = slot0
		slot3 = slot1
		slot1 = slot1(slot2, slot3)

		if not slot1 then
			slot1 = overkiz
			slot1 = slot1.magic
			slot1 = slot1.IGNORE

			return slot1
		end

		slot1 = tonumber
		slot2 = slot0

		return slot1(slot2)
	end

	return slot1
end

slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot24 = {}
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.OnOff
slot23 = slot23.OnOff

function slot24(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.bool
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = tonumber
	slot2 = slot0
	slot1 = slot1(slot2)

	if slot1 == 0 then
		slot1 = "off"

		return slot1
	else
		slot1 = "on"

		return slot1
	end
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.OnOff
slot23 = slot23.OffWaitTime
slot22[slot23] = slot16
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.OnOff
slot23 = slot23.StartUpOnOff

function slot24(slot0)
	slot1 = tonumber
	slot2 = slot0
	slot1 = slot1(slot2)

	if slot1 == 0 then
		slot1 = "off"

		return slot1
	else
		slot1 = tonumber
		slot2 = slot0
		slot1 = slot1(slot2)

		if slot1 == 1 then
			slot1 = "on"

			return slot1
		else
			slot1 = tonumber
			slot2 = slot0
			slot1 = slot1(slot2)

			if slot1 == 2 then
				slot1 = "togglePrevious"

				return slot1
			else
				slot1 = tonumber
				slot2 = slot0
				slot1 = slot1(slot2)

				if slot1 == 255 then
					slot1 = "previous"

					return slot1
				else
					slot1 = "unknown"

					return slot1
				end
			end
		end
	end
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.OnOff
slot23 = slot23.Schneider
slot23 = slot23.PreWarningTime
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.OnOff
slot23 = slot23.Schneider
slot23 = slot23.OnTimeReload
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.OnOff
slot23 = slot23.Schneider
slot23 = slot23.OnTimeReloadOptions

function slot24(slot0)
	slot1 = tonumber
	slot2 = slot0
	slot1 = slot1(slot2)

	if slot1 == 1 then
		slot1 = "enable"

		return slot1
	end

	slot1 = "disable"

	return slot1
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.ZCLVersion
slot24 = slot21
slot25 = "DataType"
slot25 = slot1[slot25]
slot26 = "Type"
slot25 = slot25[slot26]
slot26 = "uint8"
slot25 = slot25[slot26]
slot24 = slot24(slot25)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.ApplicationVersion
slot24 = tonumber
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.StackVersion
slot24 = tonumber
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.HWVersion
slot24 = tonumber
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.PowerSource

function slot24(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.PowerSource
	slot1 = slot1[slot0]

	if slot1 == nil then
		slot2 = slot0
		slot2 = slot2.PowerSource
		slot1 = slot2[0]
	end

	return slot1
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.ManufacturerName
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.ModelIdentifier
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.DateCode
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.LocationDescription
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.SWBuildId
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.Schneider
slot23 = slot23.ApplicationFWVersion
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.Schneider
slot23 = slot23.ApplicationHWVersion
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.Schneider
slot23 = slot23.SerialNumber
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.Schneider
slot23 = slot23.ProductIdentifier
slot24 = slot20
slot25 = "Mapping"
slot25 = slot1[slot25]
slot25 = slot25.Attribute
slot25 = slot25.Basic
slot26 = "SchneiderProductIdentifier"
slot25 = slot25[slot26]
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "enum16"
slot26 = slot26[slot27]
slot24 = slot24(slot25, slot26)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.Schneider
slot23 = slot23.ProductRange
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.Schneider
slot23 = slot23.ProductModel
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.Schneider
slot23 = slot23.ProductFamily
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Basic
slot23 = slot23.Schneider
slot23 = slot23.VendorURL
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Identify
slot23 = slot23.IdentifyTime
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Identify
slot23 = slot23.Danfoss
slot23 = slot23.IdentificationButton
slot24 = slot13
slot25 = "pressed"
slot26 = "released"
slot24 = slot24(slot25, slot26)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Scenes
slot23 = slot23.SceneCount
slot24 = slot11
slot25 = "DataType"
slot25 = slot1[slot25]
slot26 = "Type"
slot25 = slot25[slot26]
slot26 = "uint8"
slot25 = slot25[slot26]
slot24 = slot24(slot25)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Scenes
slot23 = slot23.CurrentScene
slot24 = slot11
slot25 = "DataType"
slot25 = slot1[slot25]
slot26 = "Type"
slot25 = slot25[slot26]
slot26 = "uint8"
slot25 = slot25[slot26]
slot24 = slot24(slot25)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Scenes
slot23 = slot23.CurrentGroup
slot24 = slot11
slot25 = "DataType"
slot25 = slot1[slot25]
slot26 = "Type"
slot25 = slot25[slot26]
slot26 = "uint16"
slot25 = slot25[slot26]
slot24 = slot24(slot25)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Scenes
slot23 = slot23.SceneValid

function slot24(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.bool
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	return slot0 == 1
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Scenes
slot23 = slot23.NameSupport

function slot24(slot0)
	return bit.band(128, slot0) == 128
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.Scenes
slot23 = slot23.LastConfiguredBy
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.PollControl
slot23 = slot23.CheckInInterval
slot24 = slot15
slot25 = "DataType"
slot25 = slot1[slot25]
slot26 = "Type"
slot25 = slot25[slot26]
slot26 = "uint32"
slot25 = slot25[slot26]
slot24 = slot24(slot25)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.PollControl
slot23 = slot23.LongPollInterval
slot24 = slot15
slot25 = "DataType"
slot25 = slot1[slot25]
slot26 = "Type"
slot25 = slot25[slot26]
slot26 = "uint32"
slot25 = slot25[slot26]
slot24 = slot24(slot25)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.PollControl
slot23 = slot23.ShortPollInterval
slot24 = slot15
slot25 = "DataType"
slot25 = slot1[slot25]
slot26 = "Type"
slot25 = slot25[slot26]
slot26 = "uint16"
slot25 = slot25[slot26]
slot24 = slot24(slot25)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.PollControl
slot23 = slot23.FastPollTimeout
slot24 = slot15
slot25 = "DataType"
slot25 = slot1[slot25]
slot26 = "Type"
slot25 = slot25[slot26]
slot26 = "uint16"
slot25 = slot25[slot26]
slot24 = slot24(slot25)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot24 = "ElectricalMeasurement"
slot23 = slot23[slot24]
slot24 = "ActivePower"
slot23 = slot23[slot24]
slot24 = slot11
slot25 = "DataType"
slot25 = slot1[slot25]
slot26 = "Type"
slot25 = slot25[slot26]
slot26 = "int16"
slot25 = slot25[slot26]
slot24 = slot24(slot25)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot24 = "Metering"
slot23 = slot23[slot24]
slot24 = "HistoricalConsumption"
slot23 = slot23[slot24]
slot24 = "InstantaneousDemand"
slot23 = slot23[slot24]
slot24 = slot11
slot25 = "DataType"
slot25 = slot1[slot25]
slot26 = "Type"
slot25 = slot25[slot26]
slot26 = "int24"
slot25 = slot25[slot26]
slot24 = slot24(slot25)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot24 = "Metering"
slot23 = slot23[slot24]
slot24 = "Formatting"
slot23 = slot23[slot24]
slot24 = "Multiplier"
slot23 = slot23[slot24]
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot24 = "Metering"
slot23 = slot23[slot24]
slot24 = "Formatting"
slot23 = slot23[slot24]
slot24 = "Divisor"
slot23 = slot23[slot24]
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.LevelControl
slot23 = slot23.CurrentLevel

function slot24(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.uint8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = math
	slot1 = slot1.floor
	slot2 = 254 - slot0
	slot2 = slot2 / 2.54

	return slot1(slot2)
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.LevelControl
slot23 = slot23.OnLevel

function slot24(slot0)
	slot1 = tonumber
	slot2 = slot0
	slot1 = slot1(slot2)

	if slot1 == 255 then
		slot1 = "previous"

		return slot1
	else
		slot1 = math
		slot1 = slot1.floor
		slot2 = 254 - slot0
		slot2 = slot2 / 2.54

		return slot1(slot2)
	end
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.LevelControl
slot23 = slot23.StartUpCurrentLevel

function slot24(slot0)
	slot1 = tonumber
	slot2 = slot0
	slot1 = slot1(slot2)

	if slot1 == 0 then
		slot1 = "min"

		return slot1
	else
		slot1 = tonumber
		slot2 = slot0
		slot1 = slot1(slot2)

		if slot1 == 255 then
			slot1 = "previous"

			return slot1
		else
			slot1 = math
			slot1 = slot1.ceil
			slot2 = slot0 / 254
			slot2 = slot2 * 100

			return slot1(slot2)
		end
	end
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot24 = "Profalux"
slot23 = slot23[slot24]
slot24 = "SetPositionAndOrientation"
slot23 = slot23[slot24]

function slot24(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.uint8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = math
	slot1 = slot1.floor
	slot2 = 90 - slot0
	slot2 = slot2 / 0.9

	return slot1(slot2)
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.WindowCoveringType
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.ConfigStatus
slot23 = slot23.Operational

function slot24(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 1
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 1 then
		slot1 = "operational"

		return slot1
	else
		slot1 = "not operational"

		return slot1
	end
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.ConfigStatus
slot23 = slot23.Online

function slot24(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 2
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 2 then
		slot1 = "online"

		return slot1
	else
		slot1 = "not online"

		return slot1
	end
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.ConfigStatus
slot23 = slot23.ReversalLiftCommands

function slot24(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 4
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 4 then
		slot1 = "reversal lift commands"

		return slot1
	else
		slot1 = "not reversal lift commands"

		return slot1
	end
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.ConfigStatus
slot23 = slot23.ControlLift

function slot24(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 8
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 8 then
		slot1 = "lift control is closed loop"

		return slot1
	else
		slot1 = "lift control is open loop"

		return slot1
	end
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.ConfigStatus
slot23 = slot23.ControlTilt

function slot24(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 16
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 16 then
		slot1 = "tilt control is closed loop"

		return slot1
	else
		slot1 = "tilt control is open loop"

		return slot1
	end
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.ConfigStatus
slot23 = slot23.EncoderLift

function slot24(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 32
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 32 then
		slot1 = "encoder controlled"

		return slot1
	else
		slot1 = "timer controlled"

		return slot1
	end
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.ConfigStatus
slot23 = slot23.EncoderTilt

function slot24(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 64
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 64 then
		slot1 = "encoder controlled"

		return slot1
	else
		slot1 = "timer controlled"

		return slot1
	end
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.CurrentPositionLiftPercentage
slot24 = slot11
slot25 = "DataType"
slot25 = slot1[slot25]
slot26 = "Type"
slot25 = slot25[slot26]
slot26 = "uint8"
slot25 = slot25[slot26]
slot24 = slot24(slot25)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.CurrentPositionTiltPercentage
slot24 = slot11
slot25 = "DataType"
slot25 = slot1[slot25]
slot26 = "Type"
slot25 = slot25[slot26]
slot26 = "uint8"
slot25 = slot25[slot26]
slot24 = slot24(slot25)
slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.InstalledOpenLimitLift
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.InstalledClosedLimitLift
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.Mode
slot23 = slot23.MotorDirection

function slot24(slot0)
	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Attribute
	slot1 = slot1.WindowCovering
	slot1 = slot1.Mode
	slot1 = slot1.MotorDirection
	slot2 = bit
	slot2 = slot2.band
	slot3 = 1
	slot4 = slot0
	slot2 = slot2(slot3, slot4)
	slot1 = slot1[slot2]

	return slot1
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.Mode
slot23 = slot23.MotorRun

function slot24(slot0)
	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Attribute
	slot1 = slot1.WindowCovering
	slot1 = slot1.Mode
	slot1 = slot1.MotorRun
	slot2 = bit
	slot2 = slot2.band
	slot3 = 2
	slot4 = slot0
	slot2 = slot2(slot3, slot4)
	slot1 = slot1[slot2]

	return slot1
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.Mode
slot23 = slot23.MotorRunning

function slot24(slot0)
	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Attribute
	slot1 = slot1.WindowCovering
	slot1 = slot1.Mode
	slot1 = slot1.MotorRunning
	slot2 = bit
	slot2 = slot2.band
	slot3 = 4
	slot4 = slot0
	slot2 = slot2(slot3, slot4)
	slot1 = slot1[slot2]

	return slot1
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.Mode
slot23 = slot23.LED

function slot24(slot0)
	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Attribute
	slot1 = slot1.WindowCovering
	slot1 = slot1.Mode
	slot1 = slot1.LED
	slot2 = bit
	slot2 = slot2.band
	slot3 = 8
	slot4 = slot0
	slot2 = slot2(slot3, slot4)
	slot1 = slot1[slot2]

	return slot1
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.InstalledOpenLimitTilt
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.InstalledClosedLimitTilt
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.Schneider
slot23 = slot23.DriveCloseDuration
slot22[slot23] = slot10
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.Schneider
slot23 = slot23.ProtectionStatus

function slot24(slot0)
	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Attribute
	slot1 = slot1.WindowCovering
	slot1 = slot1.SchneiderProtectionStatus
	slot2 = bit
	slot2 = slot2.band
	slot3 = 1
	slot4 = slot0
	slot2 = slot2(slot3, slot4)
	slot1 = slot1[slot2]

	return slot1
end

slot22[slot23] = slot24
slot22 = "Converter"
slot22 = slot1[slot22]
slot23 = "RawValueToValue"
slot22 = slot22[slot23]
slot23 = slot1.Attribute
slot23 = slot23.WindowCovering
slot23 = slot23.Schneider
slot23 = slot23.ProtectionSensor

function slot24(slot0)
	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Attribute
	slot1 = slot1.WindowCovering
	slot1 = slot1.SchneiderProtectionSensor
	slot2 = bit
	slot2 = slot2.band
	slot3 = 1
	slot4 = slot0
	slot2 = slot2(slot3, slot4)
	slot1 = slot1[slot2]

	return slot1
end

slot22[slot23] = slot24

function slot22(slot0)
	slot1 = math
	slot1 = slot1.floor
	slot2 = math
	slot2 = slot2.pow
	slot3 = 10
	slot4 = slot0 / 10000

	return slot1(slot2(slot3, slot4))
end

slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.WindowCovering
slot24 = slot24.Schneider
slot24 = slot24.SunProtectionIlluminanceThreshold
slot23[slot24] = slot22
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.WindowCovering
slot24 = slot24.Schneider
slot24 = slot24.LiftDriveUpTime
slot23[slot24] = slot16
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.WindowCovering
slot24 = slot24.Schneider
slot24 = slot24.LiftDriveDownTime
slot23[slot24] = slot16
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.WindowCovering
slot24 = slot24.Schneider
slot24 = slot24.TiltOpenCloseAndStepTime
slot23[slot24] = slot18
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.WindowCovering
slot24 = slot24.Schneider
slot24 = slot24.TiltPositionPercentageAfterMoveToLevel
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "TemperatureMeasurement"
slot24 = slot24[slot25]
slot25 = "MeasuredValue"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "TemperatureMeasurement"
slot24 = slot24[slot25]
slot25 = "MinMeasuredValue"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "TemperatureMeasurement"
slot24 = slot24[slot25]
slot25 = "MaxMeasuredValue"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "TemperatureMeasurement"
slot24 = slot24[slot25]
slot25 = "Tolerance"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "RelativeHumidity"
slot24 = slot24[slot25]
slot25 = "MeasuredValue"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "RelativeHumidity"
slot24 = slot24[slot25]
slot25 = "MinMeasuredValue"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "RelativeHumidity"
slot24 = slot24[slot25]
slot25 = "MaxMeasuredValue"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IlluminanceMeasurement"
slot24 = slot24[slot25]
slot25 = "MeasuredValue"
slot24 = slot24[slot25]
slot23[slot24] = slot22
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IlluminanceMeasurement"
slot24 = slot24[slot25]
slot25 = "MinMeasuredValue"
slot24 = slot24[slot25]
slot23[slot24] = slot22
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IlluminanceMeasurement"
slot24 = slot24[slot25]
slot25 = "MaxMeasuredValue"
slot24 = slot24[slot25]
slot23[slot24] = slot22
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IlluminanceMeasurement"
slot24 = slot24[slot25]
slot25 = "Tolerance"
slot24 = slot24[slot25]
slot23[slot24] = slot22
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IlluminanceMeasurement"
slot24 = slot24[slot25]
slot25 = "LightSensorType"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = 64

	if slot0 >= slot1 then
		slot1 = 254

		if slot0 <= slot1 then
			slot1 = "Manufacturer-specific"

			return slot1
		end
	end

	return slot0.Mapping.Attribute.IlluminanceMeasurement.LightSensorType[slot0] or "Unknown"
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "OccupancySensing"
slot24 = slot24[slot25]
slot24 = slot24.Occupancy

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = slot0
	slot3 = 1
	slot1 = slot1(slot2, slot3)

	if slot1 == 1 then
		slot1 = "personInside"

		return slot1
	else
		slot1 = "noPersonInside"

		return slot1
	end
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "OccupancySensing"
slot24 = slot24[slot25]
slot25 = "OccupancySensorType"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Attribute
	slot1 = slot1.OccupancySensor
	slot1 = slot1.OccupancySensorType
	slot1 = slot1[slot0]

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "OccupancySensing"
slot24 = slot24[slot25]
slot25 = "OccupancySensorTypeBitmap"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = {}
	slot2 = bit
	slot2 = slot2.band
	slot3 = slot0
	slot4 = 1
	slot2 = slot2(slot3, slot4)

	if slot2 == 1 then
		slot2 = table
		slot2 = slot2.insert
		slot3 = slot1
		slot4 = "PIR"

		slot2(slot3, slot4)
	end

	slot2 = bit
	slot2 = slot2.band
	slot3 = bit
	slot3 = slot3.rshift
	slot4 = slot0
	slot5 = 1
	slot3 = slot3(slot4, slot5)
	slot4 = 1
	slot2 = slot2(slot3, slot4)

	if slot2 == 1 then
		slot2 = table
		slot2 = slot2.insert
		slot3 = slot1
		slot4 = "ultrasonic"

		slot2(slot3, slot4)
	end

	slot2 = bit
	slot2 = slot2.band
	slot3 = bit
	slot3 = slot3.rshift
	slot4 = slot0
	slot5 = 2
	slot3 = slot3(slot4, slot5)
	slot4 = 1
	slot2 = slot2(slot3, slot4)

	if slot2 == 1 then
		slot2 = table
		slot2 = slot2.insert
		slot3 = slot1
		slot4 = "physical contact"

		slot2(slot3, slot4)
	end

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "RelativeHumidity"
slot24 = slot24[slot25]
slot25 = "Tolerance"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Nexelec"
slot24 = slot24[slot25]
slot25 = "EnhancedSmokeAlarm"
slot24 = slot24[slot25]
slot25 = "ConditionAnalysis"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Nexelec"
slot24 = slot24[slot25]
slot25 = "EnhancedSmokeAlarm"
slot24 = slot24[slot25]
slot25 = "TimeSinceLastMaintenance"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Nexelec"
slot24 = slot24[slot25]
slot25 = "EnhancedSmokeAlarm"
slot24 = slot24[slot25]
slot25 = "RemainingProductLifeTime"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.PowerConfiguration
slot24 = slot24.BatteryPercentage

function slot25(slot0)
	slot1 = 200

	if slot0 > slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0 / 2

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.PowerConfiguration
slot24 = slot24.BatteryAlarmState

function slot25(slot0)
	slot1 = tonumber
	slot2 = slot0
	slot1 = slot1(slot2)
	slot0 = slot1

	if not slot0 then
		slot1 = -1

		return slot1
	end

	slot1 = 0
	slot2 = 3
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = bit
		slot5 = slot5.band
		slot6 = bit
		slot6 = slot6.rshift
		slot7 = slot0
		slot8 = slot4
		slot6 = slot6(slot7, slot8)
		slot7 = 1049601
		slot5 = slot5(slot6, slot7)

		if slot5 ~= 0 then
			return slot4
		end
	end

	slot1 = -1

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "CurrentHue"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.uint8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = math
	slot1 = slot1.floor
	slot2 = 360 * slot0
	slot2 = slot2 / 254

	return slot1(slot2)
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "CurrentSaturation"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.uint8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = math
	slot1 = slot1.floor
	slot2 = slot0 / 254
	slot2 = slot2 * 100

	return slot1(slot2)
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "CurrentX"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.uint16
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = math
	slot1 = slot1.floor
	slot2 = slot0 / 65536
	slot2 = slot2 * 1000
	slot1 = slot1(slot2)
	slot1 = slot1 / 1000

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "CurrentY"
slot24 = slot24[slot25]
slot25 = "Converter"
slot25 = slot1[slot25]
slot26 = "RawValueToValue"
slot25 = slot25[slot26]
slot26 = slot1.Attribute
slot27 = "ColorControl"
slot26 = slot26[slot27]
slot27 = "CurrentX"
slot26 = slot26[slot27]
slot25 = slot25[slot26]
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "ColorTemperatureMireds"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.uint16
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = math
	slot1 = slot1.floor
	slot2 = 1000000 / slot0

	return slot1(slot2)
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "EnhancedCurrentHue"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "ColorCapabilities"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "ColorTempPhysicalMinMireds"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "ColorTempPhysicalMaxMireds"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "ColorLoopActive"
slot24 = slot24[slot25]
slot25 = slot20
slot26 = "Mapping"
slot26 = slot1[slot26]
slot26 = slot26.Attribute
slot27 = "ColorCluster"
slot26 = slot26[slot27]
slot27 = "ColorLoopActive"
slot26 = slot26[slot27]
slot27 = "DataType"
slot27 = slot1[slot27]
slot28 = "Type"
slot27 = slot27[slot28]
slot28 = "uint8"
slot27 = slot27[slot28]
slot25 = slot25(slot26, slot27)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "ColorLoopDirection"
slot24 = slot24[slot25]
slot25 = slot20
slot26 = "Mapping"
slot26 = slot1[slot26]
slot27 = "Command"
slot26 = slot26[slot27]
slot27 = "ColorCluster"
slot26 = slot26[slot27]
slot27 = "ColorLoop"
slot26 = slot26[slot27]
slot27 = "Direction"
slot26 = slot26[slot27]
slot27 = "DataType"
slot27 = slot1[slot27]
slot28 = "Type"
slot27 = slot27[slot28]
slot28 = "uint8"
slot27 = slot27[slot28]
slot25 = slot25(slot26, slot27)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "ColorMode"
slot24 = slot24[slot25]
slot25 = slot20
slot26 = "Mapping"
slot26 = slot1[slot26]
slot26 = slot26.Attribute
slot27 = "ColorCluster"
slot26 = slot26[slot27]
slot27 = "ColorMode"
slot26 = slot26[slot27]
slot27 = "DataType"
slot27 = slot1[slot27]
slot28 = "Type"
slot27 = slot27[slot28]
slot28 = "enum8"
slot27 = slot27[slot28]
slot25 = slot25(slot26, slot27)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "ColorLoopTime"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "ColorLoopStartEnhancedHue"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ColorControl"
slot24 = slot24[slot25]
slot25 = "ColorLoopStoredEnhancedHue"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Cleode"
slot24 = slot24[slot25]
slot24 = slot24.Mode

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.CleodeZPilotModeToHeatingStatusState
	slot2 = tonumber
	slot3 = slot0
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Nexelec"
slot24 = slot24[slot25]
slot25 = "EnhancedSmokeAlarm"
slot24 = slot24[slot25]
slot25 = "EnergyStatus"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.NexelecDaafToEnergyStatusState
	slot2 = tonumber
	slot3 = slot0
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]

	if slot1 == nil then
		slot1 = error
		slot2 = "[Zigbee] error: the value : "
		slot3 = slot0
		slot4 = " is not recognized"
		slot2 = slot2 .. slot3 .. slot4

		slot1(slot2)
	end

	slot1 = slot0
	slot1 = slot1.NexelecDaafToEnergyStatusState
	slot2 = tonumber
	slot3 = slot0
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Nexelec"
slot24 = slot24[slot25]
slot25 = "IndoorAirQuality"
slot24 = slot24[slot25]
slot25 = "AirQuality"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.NexelecDaafHygrothermalComfortToAirQualityState
	slot2 = tonumber
	slot3 = slot0
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]

	if slot1 == nil then
		slot1 = error
		slot2 = "[Zigbee] error: the value : "
		slot3 = slot0
		slot4 = " is not recognized"
		slot2 = slot2 .. slot3 .. slot4

		slot1(slot2)
	end

	slot1 = slot0
	slot1 = slot1.NexelecDaafHygrothermalComfortToAirQualityState
	slot2 = tonumber
	slot3 = slot0
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Nexelec"
slot24 = slot24[slot25]
slot25 = "IndoorAirQuality"
slot24 = slot24[slot25]
slot25 = "HygrothermalComfort"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.NexelecDaafIndoorAirAnalysiToHygrothermalComfortState
	slot2 = tonumber
	slot3 = slot0
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]

	if slot1 == nil then
		slot1 = error
		slot2 = "[Zigbee] error: the value : "
		slot3 = slot0
		slot4 = " is not recognized"
		slot2 = slot2 .. slot3 .. slot4

		slot1(slot2)
	end

	slot1 = slot0
	slot1 = slot1.NexelecDaafIndoorAirAnalysiToHygrothermalComfortState
	slot2 = tonumber
	slot3 = slot0
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Nexelec"
slot24 = slot24[slot25]
slot25 = "IndoorAirQuality"
slot24 = slot24[slot25]
slot25 = "Global"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.NexelecDaafIndoorAirAnalysiToGlobalState
	slot2 = tonumber
	slot3 = slot0
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]

	if slot1 == nil then
		slot2 = error
		slot3 = "[Zigbee] error: the value : "
		slot4 = slot0
		slot5 = " is not recognized"
		slot3 = slot3 .. slot4 .. slot5

		slot2(slot3)
	end

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Nexelec"
slot24 = slot24[slot25]
slot25 = "IndoorAirQuality"
slot24 = slot24[slot25]
slot25 = "Current"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.NexelecDaafIndoorAirAnalysiToCurrentState
	slot2 = tonumber
	slot3 = slot0
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]

	if slot1 == nil then
		slot2 = error
		slot3 = "[Zigbee] error: the value : "
		slot4 = slot0
		slot5 = " is not recognized"
		slot3 = slot3 .. slot4 .. slot5

		slot2(slot3)
	end

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IasZone"
slot24 = slot24[slot25]
slot25 = "ZoneInformation"
slot24 = slot24[slot25]
slot25 = "ZoneStatus"
slot24 = slot24[slot25]
slot25 = "Alarm1"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 1
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "closed"

		return slot2
	end

	slot2 = "open"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IasZone"
slot24 = slot24[slot25]
slot25 = "ZoneInformation"
slot24 = slot24[slot25]
slot25 = "ZoneStatus"
slot24 = slot24[slot25]
slot25 = "Alarm2"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 2
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "closed"

		return slot2
	end

	slot2 = "open"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IasZone"
slot24 = slot24[slot25]
slot25 = "ZoneInformation"
slot24 = slot24[slot25]
slot25 = "ZoneStatus"
slot24 = slot24[slot25]
slot25 = "Tamper"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 4
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "notTampered"

		return slot2
	end

	slot2 = "tampered"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IasZone"
slot24 = slot24[slot25]
slot25 = "ZoneInformation"
slot24 = slot24[slot25]
slot25 = "ZoneStatus"
slot24 = slot24[slot25]
slot25 = "Battery"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 8
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "normal"

		return slot2
	end

	slot2 = "low"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IasZone"
slot24 = slot24[slot25]
slot25 = "ZoneInformation"
slot24 = slot24[slot25]
slot25 = "ZoneStatus"
slot24 = slot24[slot25]
slot25 = "SupervisionReports"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 16
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "reportsDisabled"

		return slot2
	end

	slot2 = "reportsEnabled"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IasZone"
slot24 = slot24[slot25]
slot25 = "ZoneInformation"
slot24 = slot24[slot25]
slot25 = "ZoneStatus"
slot24 = slot24[slot25]
slot25 = "RestoreReports"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 32
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "restoreReportsDisabled"

		return slot2
	end

	slot2 = "restoreReportsEnabled"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IasZone"
slot24 = slot24[slot25]
slot25 = "ZoneInformation"
slot24 = slot24[slot25]
slot25 = "ZoneStatus"
slot24 = slot24[slot25]
slot25 = "Trouble"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 64
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "noFault"

		return slot2
	end

	slot2 = "fault"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IasZone"
slot24 = slot24[slot25]
slot25 = "ZoneInformation"
slot24 = slot24[slot25]
slot25 = "ZoneStatus"
slot24 = slot24[slot25]
slot25 = "AC"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 128
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "noFault"

		return slot2
	end

	slot2 = "fault"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IasZone"
slot24 = slot24[slot25]
slot25 = "ZoneInformation"
slot24 = slot24[slot25]
slot25 = "ZoneStatus"
slot24 = slot24[slot25]
slot25 = "Test"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 256
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "operationMode"

		return slot2
	end

	slot2 = "testMode"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "IasZone"
slot24 = slot24[slot25]
slot25 = "ZoneInformation"
slot24 = slot24[slot25]
slot25 = "ZoneStatus"
slot24 = slot24[slot25]
slot25 = "BatteryDefect"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 512
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "normalBattery"

		return slot2
	end

	slot2 = "defectiveBattery"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "NumberOfResets"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "PersistentMemoryWrites"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "MacRxBcast"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint32"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "MacTxBcast"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint32"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "MacRxUcast"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint32"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "MacTxUcast"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint32"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "MacTxUcastRetry"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "MacTxUcastFail"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "APSRxBcast"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "APSTxBcast"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "APSRxUcast"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "APSTxUcastSuccess"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "APSTxUcastRetry"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "APSTxUcastFail"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "RouteDiscInitiated"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "NeighborAdded"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "NeighborRemoved"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "NeighborStale"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "JoinIndication"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "ChildMoved"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "NWKFCFailure"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "APSFCFailure"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "APSUnauthorizedKey"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "NWKDecryptFailures"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "APSDecryptFailures"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "PacketBufferAllocateFailures"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "RelayedUcast"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "PhytoMACqueuelimitreached"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "PacketValidatedropcount"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "AverageMACRetryPerAPSMessageSent"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "LastMessageLQI"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot25 = "LastMessageRSSI"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot24 = slot24.Danfoss
slot25 = "DanfossSystemStatusCode"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Diagnostic"
slot24 = slot24[slot25]
slot24 = slot24.Danfoss
slot25 = "DanfossSystemStatusWater"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	if slot0 == 0 then
		slot1 = "hot"

		return slot1
	end

	slot1 = "cool"

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.LocalTemperature
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.OutdoorTemperature
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Occupancy

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 1
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "noPersonInside"

		return slot2
	end

	slot2 = "personInside"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.AbsMinHeatSetpointLimit
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.AbsMaxHeatSetpointLimit
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.AbsMinCoolSetpointLimit
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.AbsMaxCoolSetpointLimit
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.PICoolingDemand
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.PIHeatingDemand
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.HVACCoolingSystemStage

function slot25(slot0)
	slot1 = {
		[0] = "coolStage1",
		"coolStage2",
		"coolStage3",
		"unknown"
	}
	slot2 = bit
	slot2 = slot2.band
	slot3 = 3
	slot4 = slot0
	slot2 = slot2(slot3, slot4)
	slot3 = slot1[slot2]

	return slot3
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.HVACHeatingSystemStage

function slot25(slot0)
	slot1 = {
		[0] = "heatStage1",
		"heatStage2",
		"heatStage3",
		"unknown"
	}
	slot2 = bit
	slot2 = slot2.band
	slot3 = 3
	slot4 = bit
	slot4 = slot4.rshift
	slot5 = slot0
	slot6 = 2
	slot2 = slot2(slot3, slot4(slot5, slot6))
	slot3 = slot1[slot2]

	return slot3
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.HVACHeatingSystemType

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 16
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "conventional"

		return slot2
	end

	slot2 = "heatPump"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.HVACHeatingFuelType

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 32
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "gas"

		return slot2
	end

	slot2 = "electric"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.LocalTemperatureCalibration
slot25 = slot17
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.OccupiedCoolingSetpoint
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.OccupiedHeatingSetpoint
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.UnoccupiedCoolingSetpoint
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.UnoccupiedHeatingSetpoint
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.MinHeatSetpointLimit
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.MaxHeatSetpointLimit
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.MinCoolSetpointLimit
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.MaxCoolSetpointLimit
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.MinSetpointDeadBand
slot25 = slot17
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.LocalTemperatureSensedSource

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 1
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "internal"

		return slot2
	end

	slot2 = "remote"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "OutdoorTemperatureSensedSource"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 2
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "internal"

		return slot2
	end

	slot2 = "remote"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "OccupancySensedSource"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 4
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "internal"

		return slot2
	end

	slot2 = "remote"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ControlSequenceOfOperation"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Command
	slot1 = slot1.ControlSequenceOfOperationState
	slot1 = slot1[slot0]

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "SystemMode"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Command
	slot1 = slot1.SystemModeState
	slot1 = slot1[slot0]

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "AlarmInitializationFailure"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 1
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "noError"

		return slot2
	end

	slot2 = "error"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "AlarmHardwareFailure"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 2
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "noError"

		return slot2
	end

	slot2 = "error"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "AlarmSelfCalibrationFailure"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 4
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "noError"

		return slot2
	end

	slot2 = "error"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ThermostatRunningMode"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {
		[3.0] = "cooling",
		[4.0] = "heating"
	}
	slot2 = slot1[slot0]

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "StartOfWeek"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {
		[0] = "sunday",
		"monday",
		"tuesday",
		"wednesday",
		"thursday",
		"friday",
		"saturday"
	}
	slot2 = slot1[slot0]

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "NumberOfWeeklyTransitions"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "NumberOfDailyTransitions"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "TemperatureSetpointHold"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	if slot0 == 0 then
		slot1 = "disable"

		return slot1
	end

	slot1 = "enable"

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "TemperatureSetpointHoldDuration"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ThermostatProgrammingOperationMode"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 1
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "setpoint"

		return slot2
	end

	slot2 = "schedule"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "AutoRecoveryModeEnabled"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 2
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "disable"

		return slot2
	end

	slot2 = "enable"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "EconomyEnergyStarModeEnabled"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 4
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "disable"

		return slot2
	end

	slot2 = "enable"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ThermostatRunningHeatState"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 1
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "deactivate"

		return slot2
	end

	slot2 = "activate"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ThermostatRunningCoolState"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 2
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "deactivate"

		return slot2
	end

	slot2 = "activate"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ThermostatRunningFanState"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 4
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "deactivate"

		return slot2
	end

	slot2 = "activate"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ThermostatRunningHeat2StageState"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 8
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "deactivate"

		return slot2
	end

	slot2 = "activate"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ThermostatRunningCool2StageState"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 16
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "deactivate"

		return slot2
	end

	slot2 = "activate"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ThermostatRunningFan2StageState"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 32
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "deactivate"

		return slot2
	end

	slot2 = "activate"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ThermostatRunningFan3StageState"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 64
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "deactivate"

		return slot2
	end

	slot2 = "activate"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "SetpointChangeSource"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {
		[0] = "manual",
		"schedule",
		"external"
	}
	slot2 = slot1[slot0]

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "SetpointChangeAmount"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "SetpointChangeSourceTimestamp"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int32"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "OccupiedSetback"
slot24 = slot24[slot25]
slot25 = slot17
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "OccupiedSetbackMin"
slot24 = slot24[slot25]
slot25 = slot17
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "OccupiedSetbackMax"
slot24 = slot24[slot25]
slot25 = slot17
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "UnoccupiedSetback"
slot24 = slot24[slot25]
slot25 = slot17
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "UnoccupiedSetbackMin"
slot24 = slot24[slot25]
slot25 = slot17
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "UnoccupiedSetbackMax"
slot24 = slot24[slot25]
slot25 = slot17
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "EmergencyHeatDelta"
slot24 = slot24[slot25]
slot25 = slot17
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ACType"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {
		"coolingAndFixedSpeed",
		"heatPumpAndFixedSpeed",
		"coolingAndInverter",
		"heatPumpAndInverter"
	}
	slot2 = slot1[slot0]

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ACCapacity"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ACRefrigerantType"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {
		"R22",
		"R410a",
		"R407c"
	}
	slot2 = slot1[slot0]

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ACCompressorType"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {
		"T1",
		"T2",
		"T3"
	}
	slot2 = slot1[slot0]

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ACCompressorFailure"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 1
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "noError"

		return slot2
	end

	slot2 = "error"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ACRoomTemperatureSensorFailure"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 2
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "noError"

		return slot2
	end

	slot2 = "error"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ACOutdoorTemperatureSensorFailure"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 4
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "noError"

		return slot2
	end

	slot2 = "error"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ACIndoorCoilTemperatureSensorFailure"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 8
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "noError"

		return slot2
	end

	slot2 = "error"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ACFanFailure"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 16
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "noError"

		return slot2
	end

	slot2 = "error"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ACLouverPosition"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {
		"fullyClosed",
		"fullyOpen",
		"quarterOpen",
		"halfOpen",
		"threeQuarterOpen"
	}
	slot2 = slot1[slot0]

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ACCoilTemperature"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ACCapacityFormat"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {
		[0] = "BTUh"
	}
	slot2 = slot1[slot0]

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "ClusterRevision"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "ETRVOpenWindowDetection"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {
		[0] = "quarantine",
		"windowsClosed",
		"hold",
		"windowOpenDetected",
		"externalWindowOpenDetected"
	}
	slot2 = slot1[slot0]

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "ExternalOpenWindowDetected"
slot24 = slot24[slot25]
slot25 = slot13
slot26 = "detected"
slot27 = "notDetected"
slot25 = slot25(slot26, slot27)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "ExerciseDayOfWeek"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {
		[0] = "sunday",
		"monday",
		"tuesday",
		"wednesday",
		"thursday",
		"friday",
		"saturday",
		"unknown"
	}
	slot2 = slot1[slot0]

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "ExerciseTriggerTime"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "MountingModeActive"
slot24 = slot24[slot25]
slot25 = slot13
slot26 = "notMounted"
slot27 = "mounted"
slot25 = slot25(slot26, slot27)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "MountingModeControl"
slot24 = slot24[slot25]
slot25 = slot13
slot26 = "mountingMode"
slot27 = "mountedPosition"
slot25 = slot25(slot26, slot27)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "ETRVOrientation"
slot24 = slot24[slot25]
slot25 = slot13
slot26 = "vertical"
slot27 = "horizontal"
slot25 = slot25(slot26, slot27)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "ExternalMeasuredRoomSensor"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "ControlAlgorithmScaleFactor"
slot24 = slot24[slot25]
slot25 = slot11
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "HeatAvailable"
slot24 = slot24[slot25]
slot25 = slot13
slot26 = "available"
slot27 = "notAvailable"
slot25 = slot25(slot26, slot27)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "HeatSupplyRequest"
slot24 = slot24[slot25]
slot25 = slot13
slot26 = "requested"
slot27 = "notRequested"
slot25 = slot25(slot26, slot27)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "LoadBalancingEnable"
slot24 = slot24[slot25]
slot25 = slot13
slot26 = "enable"
slot27 = "disable"
slot25 = slot25(slot26, slot27)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "LoadRadiatorRoomMean"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "LoadEstimateOnThisRadiator"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "RegulationSetPointOffset"
slot24 = slot24[slot25]
slot25 = slot17
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "AdaptationRunControl"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {
		[0] = "noAdaptation",
		"initiate",
		"cancel"
	}
	slot2 = slot1[slot0]

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "AdaptationRunInProgress"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 1
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "notInProgress"

		return slot2
	end

	slot2 = "inProgress"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "AdaptationOPFound"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 2
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "notFound"

		return slot2
	end

	slot2 = "found"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "AdaptationOPLost"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = 4
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "notLost"

		return slot2
	end

	slot2 = "lost"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "AdaptationRunSettings"
slot24 = slot24[slot25]
slot25 = slot13
slot26 = "enable"
slot27 = "disable"
slot25 = slot25(slot26, slot27)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "RoomStatusCode"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "OutputStatus"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = bit
	slot1 = slot1.band
	slot2 = 1
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "inactive"

		return slot2
	end

	slot2 = "active"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "RoomFloorSensorMode"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {
		[0] = "roomAndFloor",
		"floorOnly",
		"dualEmitter"
	}
	slot2 = slot1[slot0]

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "FloorMinSetpoint"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "FloorMaxSetpoint"
slot24 = slot24[slot25]
slot25 = slot19
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "int16"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot24 = slot24.Danfoss
slot25 = "ScheduleTypeUsed"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = bit
	slot1 = slot1.band
	slot2 = 1
	slot3 = slot0
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "regular"

		return slot2
	end

	slot2 = "vacation"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "Imhotep"
slot24 = slot24[slot25]
slot25 = "CurrentMode"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum16
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Attribute
	slot1 = slot1.Imhotep
	slot1 = slot1.DerogatedMode
	slot1 = slot1[slot0]

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "Imhotep"
slot24 = slot24[slot25]
slot25 = "WindowsStatus"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.bool
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Attribute
	slot1 = slot1.Imhotep
	slot1 = slot1.WindowsStatus
	slot1 = slot1[slot0]

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "Imhotep"
slot24 = slot24[slot25]
slot25 = "Selflearning"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.bool
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Attribute
	slot1 = slot1.Imhotep
	slot1 = slot1.Selflearning
	slot1 = slot1[slot0]

	return slot1
end

slot23[slot24] = slot25
slot23 = "imhotepScheduleWeek"

function slot24(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = {
		monday = slot0,
		tuesday = slot1,
		wednesday = slot2,
		thursday = slot3,
		friday = slot4,
		saturday = slot5,
		sunday = slot6
	}

	return slot7
end

slot1[slot23] = slot24
slot23 = "imhotepScheduleDay"

function slot24(slot0)
	slot1 = bytearray
	slot2 = slot0
	slot3 = "base64"
	slot1 = slot1(slot2, slot3)
	slot3 = slot1
	slot2 = slot1.sub
	slot4 = 1
	slot5 = 8
	slot2 = slot2(slot3, slot4, slot5)
	slot4 = slot1
	slot3 = slot1.sub
	slot5 = 9
	slot6 = 16
	slot3 = slot3(slot4, slot5, slot6)
	slot5 = slot1
	slot4 = slot1.sub
	slot6 = 17
	slot7 = 24
	slot4 = slot4(slot5, slot6, slot7)
	slot6 = slot1
	slot5 = slot1.sub
	slot7 = 25
	slot8 = 32
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = {}
	slot7 = slot0
	slot7 = slot7.imhotepSchedulePeriod
	slot8 = slot2
	slot7 = slot7(slot8)
	slot6[1] = slot7
	slot7 = slot0
	slot7 = slot7.imhotepSchedulePeriod
	slot8 = slot3
	slot7 = slot7(slot8)
	slot6[2] = slot7
	slot7 = slot0
	slot7 = slot7.imhotepSchedulePeriod
	slot8 = slot4
	slot7 = slot7(slot8)
	slot6[3] = slot7
	slot7 = slot0
	slot7 = slot7.imhotepSchedulePeriod
	slot8 = slot5
	slot6[MULTRES] = slot7(slot8)

	return slot6
end

slot1[slot23] = slot24
slot23 = "imhotepSchedulePeriod"

function slot24(slot0)
	slot2 = slot0
	slot1 = slot0.readUInt8
	slot3 = 1
	slot1 = slot1(slot2, slot3)
	slot3 = slot0
	slot2 = slot0.readUInt16
	slot4 = 2
	slot5 = false
	slot2 = slot2(slot3, slot4, slot5)
	slot4 = slot0
	slot3 = slot0.readUInt16
	slot5 = 4
	slot6 = false
	slot3 = slot3(slot4, slot5, slot6)
	slot5 = slot0
	slot4 = slot0.readUInt8
	slot6 = 6
	slot4 = slot4(slot5, slot6)
	slot5 = {}
	slot6 = false
	slot5.enable = slot6

	if slot1 == 1 then
		slot6 = true
		slot5.enable = slot6
		slot5.startAt = slot2
		slot5.endAt = slot3
		slot5.mode = slot4
	end

	return slot5
end

slot1[slot23] = slot24
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "Imhotep"
slot24 = slot24[slot25]
slot25 = "ScheduleMonday"
slot24 = slot24[slot25]
slot25 = "imhotepScheduleDay"
slot25 = slot1[slot25]
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "Imhotep"
slot24 = slot24[slot25]
slot25 = "ScheduleTuesday"
slot24 = slot24[slot25]
slot25 = "imhotepScheduleDay"
slot25 = slot1[slot25]
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "Imhotep"
slot24 = slot24[slot25]
slot25 = "ScheduleWednesday"
slot24 = slot24[slot25]
slot25 = "imhotepScheduleDay"
slot25 = slot1[slot25]
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "Imhotep"
slot24 = slot24[slot25]
slot25 = "ScheduleThursday"
slot24 = slot24[slot25]
slot25 = "imhotepScheduleDay"
slot25 = slot1[slot25]
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "Imhotep"
slot24 = slot24[slot25]
slot25 = "ScheduleFriday"
slot24 = slot24[slot25]
slot25 = "imhotepScheduleDay"
slot25 = slot1[slot25]
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "Imhotep"
slot24 = slot24[slot25]
slot25 = "ScheduleSaturday"
slot24 = slot24[slot25]
slot25 = "imhotepScheduleDay"
slot25 = slot1[slot25]
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Thermostat
slot25 = "Imhotep"
slot24 = slot24[slot25]
slot25 = "ScheduleSunday"
slot24 = slot24[slot25]
slot25 = "imhotepScheduleDay"
slot25 = slot1[slot25]
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ThermostatUIConfiguration"
slot24 = slot24[slot25]
slot25 = "TemperatureDisplayMode"
slot24 = slot24[slot25]
slot25 = slot13
slot26 = "fahrenheit"
slot27 = "celsius"
slot25 = slot25(slot26, slot27)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ThermostatUIConfiguration"
slot24 = slot24[slot25]
slot25 = "KeypadLockout"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = {
		[0] = "noLockout",
		"lockout1",
		"lockout2",
		"lockout3",
		"lockout4",
		"lockout5"
	}
	slot2 = slot1[slot0]

	if slot2 == nil then
		slot2 = overkiz
		slot2 = slot2.magic
		slot2 = slot2.IGNORE

		return slot2
	end

	slot2 = slot1[slot0]

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "ThermostatUIConfiguration"
slot24 = slot24[slot25]
slot24 = slot24.Danfoss
slot25 = "ViewingDirection"
slot24 = slot24[slot25]
slot25 = slot13
slot26 = "direction2"
slot27 = "direction1"
slot25 = slot25(slot26, slot27)
slot23[slot24] = slot25
slot23 = "fromRawStatusState"

function slot24(slot0)
	slot1 = slot0
	slot1 = slot1.nodeStatus
	slot1 = slot1.DONE

	if slot0 == slot1 then
		slot1 = "available"

		return slot1
	else
		slot1 = "unavailable"

		return slot1
	end
end

slot1[slot23] = slot24
slot23 = "toSmokeAlarmMaintenanceState"

function slot24(slot0)
	slot1 = type
	slot2 = slot0
	slot1 = slot1(slot2)

	if slot1 ~= "number" then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = bit
	slot1 = slot1.band
	slot2 = slot0
	slot3 = 1
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot1 = "noDefect"

		return slot1
	else
		slot1 = "maintenanceRequired"

		return slot1
	end
end

slot1[slot23] = slot24
slot23 = "toSmokeAlarmHumidityRangeAnalysisState"

function slot24(slot0)
	slot1 = type
	slot2 = slot0
	slot1 = slot1(slot2)

	if slot1 ~= "number" then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = bit
	slot1 = slot1.band
	slot2 = slot0
	slot3 = 2
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot1 = "notDetected"

		return slot1
	else
		slot1 = "detected"

		return slot1
	end
end

slot1[slot23] = slot24
slot23 = "toSmokeAlarmTemperatureRangeAnalysisState"

function slot24(slot0)
	slot1 = type
	slot2 = slot0
	slot1 = slot1(slot2)

	if slot1 ~= "number" then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = bit
	slot1 = slot1.band
	slot2 = slot0
	slot3 = 4
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot1 = "notDetected"

		return slot1
	else
		slot1 = "detected"

		return slot1
	end
end

slot1[slot23] = slot24
slot23 = "toSpecificDaySchedule"

function slot24(slot0, slot1, slot2)
	slot3 = slot0.daysOfWeek

	if slot3 ~= nil then
		slot3 = pairs
		slot4 = slot0.daysOfWeek
		slot3, slot4, slot5 = slot3(slot4)

		for slot6 in slot3, slot4, slot5 do
			slot7 = slot0.daysOfWeek
			slot7 = slot7[slot6]

			if slot7 == slot2 then
				slot7 = slot0.transitions
				slot7 = slot7[slot1]

				if slot7 == nil then
					slot7 = overkiz
					slot7 = slot7.magic
					slot7 = slot7.IGNORE

					return slot7
				end

				slot7 = {}
				slot8 = slot0.transitions
				slot8 = slot8[slot1]
				slot7.transitions = slot8

				return slot7
			end
		end
	end

	slot3 = overkiz
	slot3 = slot3.magic
	slot3 = slot3.IGNORE

	return slot3
end

slot1[slot23] = slot24
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.WindowCovering
slot24 = slot24.Somfy
slot24 = slot24.Error

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Attribute
	slot1 = slot1.WindowCovering
	slot1 = slot1.Somfy
	slot1 = slot1.Error
	slot1 = slot1[slot0]

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.WindowCovering
slot24 = slot24.Somfy
slot24 = slot24.SomfyOperationalStatus

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Attribute
	slot1 = slot1.WindowCovering
	slot1 = slot1.Somfy
	slot1 = slot1.SomfyOperationalStatus
	slot1 = slot1[slot0]

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Basic
slot24 = slot24.Somfy
slot24 = slot24.SomfyProductSoft
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Basic
slot24 = slot24.Somfy
slot24 = slot24.SomfyProductHard
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Basic
slot24 = slot24.Somfy
slot24 = slot24.MotorBoardSWBuildID
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Basic
slot24 = slot24.Somfy
slot24 = slot24.MotorBoardProductSoft
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Basic
slot24 = slot24.Somfy
slot24 = slot24.MotorBoardProductHard
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "DBR"
slot24 = slot24[slot25]
slot25 = slot12
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint64"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "DBL"
slot24 = slot24[slot25]
slot25 = slot12
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint64"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "ValueToRawValue"
slot23 = slot23[slot24]
slot24 = "Command"
slot24 = slot1[slot24]
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "TransmitIRData"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "ValueToRawValue"
slot23 = slot23[slot24]
slot24 = "Command"
slot24 = slot1[slot24]
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "LearnIRData"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "ValueToRawValue"
slot23 = slot23[slot24]
slot24 = "Command"
slot24 = slot1[slot24]
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "StoreLearnedIRData"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "ValueToRawValue"
slot23 = slot23[slot24]
slot24 = "Command"
slot24 = slot1[slot24]
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "AddExecutionSetEntry"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "ValueToRawValue"
slot23 = slot23[slot24]
slot24 = "Command"
slot24 = slot1[slot24]
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "RemoveExecutionSet"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "ValueToRawValue"
slot23 = slot23[slot24]
slot24 = "Command"
slot24 = slot1[slot24]
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "RunExecutionSet"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "ValueToRawValue"
slot23 = slot23[slot24]
slot24 = "Command"
slot24 = slot1[slot24]
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "SetButtonBehavior"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "ValueToRawValue"
slot23 = slot23[slot24]
slot24 = "Command"
slot24 = slot1[slot24]
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "TransmitLearnedIRData"
slot24 = slot24[slot25]
slot23[slot24] = slot7
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "ValueToRawValue"
slot23 = slot23[slot24]
slot24 = "Command"
slot24 = slot1[slot24]
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "StopIROperation"
slot24 = slot24[slot25]
slot23[slot24] = slot7
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "ValueToRawValue"
slot23 = slot23[slot24]
slot24 = "Command"
slot24 = slot1[slot24]
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "DeleteAllIRCodes"
slot24 = slot24[slot25]
slot23[slot24] = slot7
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "ValueToRawValue"
slot23 = slot23[slot24]
slot24 = "Command"
slot24 = slot1[slot24]
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "DeleteAllLearnedIRCodes"
slot24 = slot24[slot25]
slot23[slot24] = slot7
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "ValueToRawValue"
slot23 = slot23[slot24]
slot24 = "Command"
slot24 = slot1[slot24]
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "GetButtonBehavior"
slot24 = slot24[slot25]
slot23[slot24] = slot7
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "ValueToRawValue"
slot23 = slot23[slot24]
slot24 = "Command"
slot24 = slot1[slot24]
slot25 = "SomfyIRBlaster"
slot24 = slot24[slot25]
slot25 = "GetRemainingAvailableMemory"
slot24 = slot24[slot25]
slot23[slot24] = slot7
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Ballast"
slot24 = slot24[slot25]
slot25 = "Status"
slot24 = slot24[slot25]
slot25 = "Ballast"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = slot0
	slot3 = 1
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "fullyOperational"

		return slot2
	end

	slot2 = "notFullyOperational"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Ballast"
slot24 = slot24[slot25]
slot25 = "Status"
slot24 = slot24[slot25]
slot25 = "Lamp"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = bit
	slot1 = slot1.band
	slot2 = slot0
	slot3 = 2
	slot1 = slot1(slot2, slot3)

	if slot1 == 0 then
		slot2 = "lampInSocket"

		return slot2
	end

	slot2 = "lampNotInSocket"

	return slot2
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Ballast"
slot24 = slot24[slot25]
slot25 = "PhysicalMinLevel"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Ballast"
slot24 = slot24[slot25]
slot25 = "PhysicalMaxLevel"
slot24 = slot24[slot25]
slot23[slot24] = slot10
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Ballast"
slot24 = slot24[slot25]
slot25 = "MinLevel"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.uint8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = math
	slot1 = slot1.ceil
	slot2 = slot0 / 2.54

	return slot1(slot2)
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Ballast"
slot24 = slot24[slot25]
slot25 = "MaxLevel"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.uint8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = math
	slot1 = slot1.ceil
	slot2 = slot0 / 2.54

	return slot1(slot2)
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Ballast"
slot24 = slot24[slot25]
slot24 = slot24.Schneider
slot25 = "ControlMode"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Attribute
	slot1 = slot1.Ballast
	slot1 = slot1.Schneider
	slot1 = slot1.ControlMode
	slot1 = slot1[slot0]

	if not slot1 then
		slot2 = overkiz
		slot2 = slot2.magic
		slot2 = slot2.IGNORE

		return slot2
	end

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Schneider
slot25 = "SwitchIndication"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Command
	slot1 = slot1.SwitchIndicationStatusState
	slot2 = tonumber
	slot3 = slot0
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Schneider
slot25 = "SwitchActions"
slot24 = slot24[slot25]

function slot25(slot0)
	slot1 = slot0
	slot1 = slot1.isValidRawValue
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.DataType
	slot3 = slot3.Type
	slot3 = slot3.enum8
	slot1 = slot1(slot2, slot3)

	if not slot1 then
		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.Mapping
	slot1 = slot1.Command
	slot1 = slot1.SwitchActionsStatusState
	slot2 = tonumber
	slot3 = slot0
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Neighbor"
slot24 = slot24[slot25]
slot25 = "Table"
slot24 = slot24[slot25]

function slot25(slot0)
	if slot0 then
		slot2 = slot0
		slot1 = slot0.sub
		slot3 = 2
		slot1 = slot1(slot2, slot3)

		if not slot1 then
			slot1 = bytearray
			slot2 = 0
			slot1 = slot1(slot2)
			slot0 = slot1
		end
	end

	slot1 = #slot0
	slot2 = 22

	if slot1 < slot2 then
		slot1 = slot0
		slot1 = slot1.log
		slot2 = "[Neighbor Table] invalid length, returning IGNORE"

		slot1(slot2)

		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {}
	slot2 = #slot0
	slot3 = 22

	while slot2 >= slot3 do
		slot2 = tostring
		slot4 = slot0
		slot3 = slot0.readUInt16
		slot5 = 17
		slot6 = false
		slot2 = slot2(slot3(slot4, slot5, slot6))
		slot3 = slot1[slot2]

		if not slot3 then
			slot3 = {}
			slot1[slot2] = slot3
		end

		slot3 = slot1[slot2]
		slot5 = slot0
		slot4 = slot0.sub
		slot6 = 9
		slot7 = 16
		slot4 = slot4(slot5, slot6, slot7)
		slot5 = slot4
		slot4 = slot4.tostring
		slot6 = "base64"
		slot4 = slot4(slot5, slot6)
		slot3.eui64 = slot4
		slot3 = slot1[slot2]
		slot4 = bit
		slot4 = slot4.rshift
		slot5 = bit
		slot5 = slot5.band
		slot6 = slot0[19]
		slot7 = 112
		slot5 = slot5(slot6, slot7)
		slot6 = 4
		slot4 = slot4(slot5, slot6)
		slot3.rel = slot4
		slot3 = slot1[slot2]
		slot4 = slot0[22]
		slot3.lqi = slot4
		slot3 = slot0
		slot3 = slot3.log
		slot4 = "[Neighbor Table] Parsing neighbor table list. id = "
		slot5 = slot2
		slot6 = " ; eui64 = "
		slot7 = slot1[slot2]
		slot7 = slot7.eui64
		slot8 = " ; rel = "
		slot9 = slot1[slot2]
		slot9 = slot9.rel
		slot10 = " ; lqi = "
		slot11 = slot1[slot2]
		slot11 = slot11.lqi
		slot4 = slot4 .. slot5 .. slot6 .. slot7 .. slot8 .. slot9 .. slot10 .. slot11

		slot3(slot4)

		slot4 = slot0
		slot3 = slot0.sub
		slot5 = 23
		slot3 = slot3(slot4, slot5)
		slot0 = slot3
	end

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot25 = "Routing"
slot24 = slot24[slot25]
slot25 = "Table"
slot24 = slot24[slot25]

function slot25(slot0)
	if slot0 then
		slot2 = slot0
		slot1 = slot0.sub
		slot3 = 2
		slot1 = slot1(slot2, slot3)

		if not slot1 then
			slot1 = bytearray
			slot2 = 0
			slot1 = slot1(slot2)
			slot0 = slot1
		end
	end

	slot1 = #slot0
	slot2 = 5

	if slot1 < slot2 then
		slot1 = slot0
		slot1 = slot1.log
		slot2 = "[Routing Table] invalid length, returning IGNORE"

		slot1(slot2)

		slot1 = overkiz
		slot1 = slot1.magic
		slot1 = slot1.IGNORE

		return slot1
	end

	slot1 = {}
	slot2 = #slot0
	slot3 = 5

	while slot2 >= slot3 do
		slot2 = bit
		slot2 = slot2.band
		slot3 = 7
		slot4 = slot0[3]
		slot2 = slot2(slot3, slot4)

		if slot2 ~= 3 and slot2 ~= 2 then
			slot4 = slot0
			slot3 = slot0.sub
			slot5 = 1
			slot6 = 2
			slot3 = slot3(slot4, slot5, slot6)
			slot4 = slot3
			slot3 = slot3.readUInt16
			slot5 = 1
			slot6 = false
			slot3 = slot3(slot4, slot5, slot6)
			slot5 = slot0
			slot4 = slot0.sub
			slot6 = 4
			slot7 = 5
			slot4 = slot4(slot5, slot6, slot7)
			slot5 = slot4
			slot4 = slot4.readUInt16
			slot6 = 1
			slot7 = false
			slot4 = slot4(slot5, slot6, slot7)
			slot5 = tostring
			slot6 = slot3
			slot5 = slot5(slot6)
			slot6 = slot1[slot5]

			if not slot6 then
				slot6 = {}
				slot7 = {}
				slot6.nextHops = slot7
				slot1[slot5] = slot6
			end

			if slot4 ~= slot3 then
				slot6 = table
				slot6 = slot6.insert
				slot7 = slot1[slot5]
				slot7 = slot7.nextHops
				slot8 = slot4

				slot6(slot7, slot8)
			end

			slot6 = slot0
			slot6 = slot6.log
			slot7 = "[Routing Table] Parsing routing table list. destID = "
			slot8 = slot3
			slot9 = " ; nextHop = "
			slot10 = slot4
			slot7 = slot7 .. slot8 .. slot9 .. slot10

			slot6(slot7)
		end

		slot4 = slot0
		slot3 = slot0.sub
		slot5 = 6
		slot3 = slot3(slot4, slot5)
		slot0 = slot3
	end

	return slot1
end

slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Time
slot24 = slot24.Time
slot25 = slot21
slot26 = "DataType"
slot26 = slot1[slot26]
slot27 = "Type"
slot26 = slot26[slot27]
slot27 = "uint8"
slot26 = slot26[slot27]
slot25 = slot25(slot26)
slot23[slot24] = slot25
slot23 = "Converter"
slot23 = slot1[slot23]
slot24 = "RawValueToValue"
slot23 = slot23[slot24]
slot24 = slot1.Attribute
slot24 = slot24.Time
slot24 = slot24.TimeStatus
slot23[slot24] = slot10

function slot23(slot0, slot1, slot2)
	slot3 = {
		command = 0,
		frameControl = 0
	}
	slot4 = tonumber
	slot5 = slot0
	slot4 = slot4(slot5)
	slot3.nodeId = slot4
	slot4 = tonumber
	slot5 = slot2
	slot4 = slot4(slot5)
	slot3.eEp = slot4
	slot4 = tonumber
	slot5 = slot1
	slot4 = slot4(slot5)
	slot3.dEp = slot4
	slot4 = bytearray
	slot5 = {}
	slot4 = slot4(slot5)
	slot3.payload = slot4

	return slot3
end

function slot24(slot0)
	slot1 = slot0
	slot1 = slot1.split
	slot2 = slot0
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot2 = 0
	slot3 = 0
	slot4 = #slot1
	slot5 = 3

	if slot4 >= slot5 then
		slot2 = slot1[3]
	end

	slot4 = #slot1
	slot5 = 4

	if slot4 >= slot5 then
		slot3 = slot1[4]
	end

	slot4 = {}
	slot5 = tonumber
	slot6 = slot1[1]
	slot5 = slot5(slot6)
	slot4.cluster = slot5
	slot5 = tonumber
	slot6 = slot1[2]
	slot5 = slot5(slot6)
	slot4.id = slot5
	slot5 = tonumber
	slot6 = slot2
	slot5 = slot5(slot6)
	slot4.manufacturer = slot5
	slot5 = tonumber
	slot6 = slot3
	slot5 = slot5(slot6)
	slot4.extra = slot5

	return slot4
end

function slot25(slot0, slot1)
	slot2 = slot0.cluster
	slot3 = slot0.manufacturer
	slot4 = slot0
	slot4 = slot4.split
	slot5 = slot1
	slot6 = "[%d]+"
	slot4 = slot4(slot5, slot6)
	slot5 = tonumber
	slot6 = slot4[1]
	slot5 = slot5(slot6)
	slot6 = tonumber
	slot7 = slot2
	slot6 = slot6(slot7)

	if slot5 ~= slot6 then
		slot5 = false
		slot6 = "This attribut "
		slot7 = tostring
		slot8 = slot1
		slot7 = slot7(slot8)
		slot8 = " does not belong to the first attribute cluster "
		slot9 = tostring
		slot10 = slot2
		slot9 = slot9(slot10)
		slot6 = slot6 .. slot7 .. slot8 .. slot9

		return slot5, slot6
	end

	slot5 = #slot4
	slot6 = 3

	if slot5 >= slot6 then
		slot5 = tonumber
		slot6 = slot4[3]
		slot5 = slot5(slot6)
		slot6 = tonumber
		slot7 = slot3
		slot6 = slot6(slot7)

		if slot5 ~= slot6 then
			slot5 = false
			slot6 = "This attribut "
			slot7 = tostring
			slot8 = slot1
			slot7 = slot7(slot8)
			slot8 = " does not belong to the first attribute manufacturer "
			slot9 = tostring
			slot10 = slot3
			slot9 = slot9(slot10)
			slot6 = slot6 .. slot7 .. slot8 .. slot9

			return slot5, slot6
		end
	end

	slot5 = true

	return slot5
end

slot26 = "WriteAttribute"

function slot27(slot0, slot1, slot2, slot3)
	if slot0 then
		slot4 = {}

		if slot0 == slot4 then
			slot4 = slot0
			slot4 = slot4.error
			slot5 = "WriteAttribute: list of attributes is empty or nil"

			return slot4(slot5)
		end
	end

	slot4 = nil
	slot5 = pairs
	slot6 = slot0
	slot5, slot6, slot7 = slot5(slot6)

	for slot8, slot9 in slot5, slot6, slot7 do
		slot10 = slot1
		slot11 = slot8
		slot10 = slot10(slot11)
		slot4 = slot10

		break
	end

	slot5 = slot2
	slot6 = slot1
	slot7 = slot2
	slot8 = slot3
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = 2
	slot5.command = slot6
	slot6 = slot4.cluster
	slot5.cluster = slot6
	slot6 = slot4.manufacturer

	if slot6 ~= 0 then
		slot6 = slot4.manufacturer
		slot5.manufacturer = slot6
		slot6 = 4
		slot5.frameControl = slot6
	end

	slot6 = pairs
	slot7 = slot0
	slot6, slot7, slot8 = slot6(slot7)

	for slot9, slot10 in slot6, slot7, slot8 do
		slot11 = slot3
		slot12 = slot4
		slot13 = slot9
		slot11, slot12 = slot11(slot12, slot13)

		if slot11 == false then
			slot13 = slot0
			slot13 = slot13.error
			slot14 = "WriteAttribute: "
			slot15 = slot12
			slot14 = slot14 .. slot15

			slot13(slot14)
		end

		slot13 = slot5.payload
		slot14 = slot13
		slot13 = slot13.append
		slot15 = slot0
		slot15 = slot15.Converter
		slot15 = slot15.ValueToWriteAttribute
		slot15 = slot15[slot9]
		slot16 = slot10
		slot13 = slot13(slot14, slot15(slot16))
		slot5.payload = slot13
	end

	return slot5
end

slot1[slot26] = slot27
slot26 = "ReadAttribute"

function slot27(slot0, slot1, slot2, slot3)
	if slot0 then
		slot4 = {}

		if slot0 == slot4 then
			slot4 = slot0
			slot4 = slot4.error
			slot5 = "ReadAttribute: list of attributes is empty or nil"

			return slot4(slot5)
		end
	end

	slot4 = slot1
	slot5 = slot0[1]
	slot4 = slot4(slot5)
	slot5 = slot2
	slot6 = slot1
	slot7 = slot2
	slot8 = slot3
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = 0
	slot5.command = slot6
	slot6 = slot4.cluster
	slot5.cluster = slot6
	slot6 = slot4.manufacturer

	if slot6 ~= 0 then
		slot6 = slot4.manufacturer
		slot5.manufacturer = slot6
		slot6 = 4
		slot5.frameControl = slot6
	end

	slot6 = pairs
	slot7 = slot0
	slot6, slot7, slot8 = slot6(slot7)

	for slot9, slot10 in slot6, slot7, slot8 do
		slot11 = slot3
		slot12 = slot4
		slot13 = slot10
		slot11, slot12 = slot11(slot12, slot13)

		if slot11 == false then
			slot13 = slot0
			slot13 = slot13.error
			slot14 = "ReadAttribute: "
			slot15 = slot12
			slot14 = slot14 .. slot15

			slot13(slot14)
		end

		slot13 = slot1
		slot14 = slot10
		slot13 = slot13(slot14)
		slot14 = slot13.id
		slot15 = slot4
		slot16 = slot14
		slot15, slot16 = slot15(slot16)
		slot17 = slot5.payload
		slot18 = slot17
		slot17 = slot17.append
		slot19 = bytearray
		slot20 = {
			slot15,
			slot16
		}
		slot17 = slot17(slot18, slot19(slot20))
		slot5.payload = slot17
	end

	return slot5
end

slot1[slot26] = slot27
slot26 = "ReadMultiAttributes"

function slot27(slot0, slot1, slot2, slot3)
	slot4 = {}
	slot5 = {}
	slot6 = pairs
	slot7 = slot0
	slot6, slot7, slot8 = slot6(slot7)

	for slot9, slot10 in slot6, slot7, slot8 do
		slot11 = slot0
		slot12 = slot10
		slot11 = slot11(slot12)
		slot12 = tostring
		slot13 = slot11.cluster
		slot12 = slot12(slot13)
		slot13 = "/"
		slot14 = tostring
		slot15 = slot11.manufacturer
		slot14 = slot14(slot15)
		slot12 = slot12 .. slot13 .. slot14
		slot13 = slot5[slot12]

		if slot13 == nil then
			slot13 = 1
			slot5[slot12] = slot13
		end

		slot13 = slot12
		slot14 = "/"
		slot15 = slot5[slot12]
		slot13 = slot13 .. slot14 .. slot15
		slot14 = slot4[slot13]

		if slot14 == nil then
			slot14 = {}
			slot4[slot13] = slot14
		end

		slot14 = table
		slot14 = slot14.insert
		slot15 = slot4[slot13]
		slot16 = slot10

		slot14(slot15, slot16)

		slot14 = slot4[slot13]
		slot14 = #slot14
		slot15 = 10

		if slot14 >= slot15 then
			slot14 = slot5[slot12]
			slot14 = slot14 + 1
			slot5[slot12] = slot14
		end
	end

	slot6 = {}
	slot7 = 1
	slot8 = #slot4
	slot8 = 2 * slot8
	slot9 = 1

	for slot10 = slot7, slot8, slot9 do
		slot11 = nil
		slot6[slot10] = slot11
	end

	slot7 = 1
	slot8 = pairs
	slot9 = slot4
	slot8, slot9, slot10 = slot8(slot9)

	for slot11, slot12 in slot8, slot9, slot10 do
		slot13 = 2 * slot7
		slot13 = slot13 - 1
		slot14 = slot1
		slot14 = slot14.ReadAttribute
		slot15 = slot12
		slot16 = slot1
		slot17 = slot2
		slot18 = slot3
		slot14 = slot14(slot15, slot16, slot17, slot18)
		slot6[slot13] = slot14
		slot7 = slot7 + 1
	end

	slot8 = slot7 - 1
	slot8 = 2 * slot8
	slot9 = table
	slot9 = slot9.unpack
	slot10 = slot6
	slot11 = 1
	slot12 = slot8

	return slot9(slot10, slot11, slot12)
end

slot1[slot26] = slot27
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "RawValueToValue"
slot26 = slot26[slot27]
slot27 = slot1.Attribute
slot28 = "Binding"
slot27 = slot27[slot28]
slot28 = "Table"
slot27 = slot27[slot28]

function slot28(slot0)
	slot1 = #slot0
	slot2 = {}
	slot3 = 2
	slot4 = slot1 - slot3
	slot5 = 13

	while slot4 >= slot5 do
		slot4 = {}
		slot6 = slot0
		slot5 = slot0.sub
		slot7 = slot3
		slot8 = slot3 + 7
		slot5 = slot5(slot6, slot7, slot8)
		slot6 = slot5
		slot5 = slot5.tostring
		slot7 = "base64"
		slot5 = slot5(slot6, slot7)
		slot4.src_addr = slot5
		slot3 = slot3 + 8
		slot6 = slot0
		slot5 = slot0.readUInt8
		slot7 = slot3
		slot5 = slot5(slot6, slot7)
		slot4.src_ep = slot5
		slot3 = slot3 + 1
		slot6 = slot0
		slot5 = slot0.readUInt16
		slot7 = slot3
		slot8 = false
		slot5 = slot5(slot6, slot7, slot8)
		slot4.cluster = slot5
		slot3 = slot3 + 2
		slot6 = slot0
		slot5 = slot0.readUInt8
		slot7 = slot3
		slot5 = slot5(slot6, slot7)
		slot4.dest_addr_mode = slot5
		slot3 = slot3 + 1
		slot5 = slot4.dest_addr_mode

		if slot5 == 1 then
			slot6 = slot0
			slot5 = slot0.sub
			slot7 = slot3
			slot8 = slot3 + 1
			slot9 = true
			slot5 = slot5(slot6, slot7, slot8, slot9)
			slot6 = slot5
			slot5 = slot5.tostring
			slot7 = "base64"
			slot5 = slot5(slot6, slot7)
			slot4.dest_addr = slot5
			slot3 = slot3 + 2
		else
			slot5 = slot4.dest_addr_mode

			if slot5 == 3 then
				slot6 = slot0
				slot5 = slot0.sub
				slot7 = slot3
				slot8 = slot3 + 7
				slot5 = slot5(slot6, slot7, slot8)
				slot6 = slot5
				slot5 = slot5.tostring
				slot7 = "base64"
				slot5 = slot5(slot6, slot7)
				slot4.dest_addr = slot5
				slot3 = slot3 + 8
				slot6 = slot0
				slot5 = slot0.readUInt8
				slot7 = slot3
				slot5 = slot5(slot6, slot7)
				slot4.dest_ep = slot5
				slot3 = slot3 + 1
			else
				slot5 = slot0
				slot5 = slot5.error
				slot6 = "Unknow destination address mode: "
				slot7 = tostring
				slot8 = slot4.dest_addr_mode
				slot7 = slot7(slot8)
				slot6 = slot6 .. slot7

				slot5(slot6)

				break
			end
		end

		slot5 = #slot2
		slot5 = slot5 + 1
		slot2[slot5] = slot4
	end

	return slot2
end

slot26[slot27] = slot28
slot26 = "Role"
slot27 = {
	Coordinator = "coordinator",
	Router = "router",
	EndDevice = "endDevice"
}
slot1[slot26] = slot27
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "RawDeviceTypeToRole"

function slot28(slot0)
	slot1 = tonumber
	slot2 = slot0
	slot1 = slot1(slot2)
	slot2 = nil

	if slot1 == 0 then
		slot3 = slot0
		slot3 = slot3.Role
		slot2 = slot3.Coordinator
	elseif slot1 == 1 then
		slot3 = slot0
		slot3 = slot3.Role
		slot2 = slot3.Router
	elseif slot1 == 2 then
		slot3 = slot0
		slot3 = slot3.Role
		slot2 = slot3.EndDevice
	end

	return slot2
end

slot26[slot27] = slot28
slot26 = "Mapping"
slot26 = slot1[slot26]
slot27 = "ClusterNames"
slot28 = {
	[6.0] = "onOff",
	[258.0] = "windowCovering",
	[257.0] = "doorLock",
	[768.0] = "colorControl",
	[8.0] = "levelControl"
}
slot26[slot27] = slot28
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "ClusterNamesFromRawDeviceClusterIds"

function slot28(slot0)
	slot1 = {}
	slot2 = ipairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = slot0
		slot7 = slot7.Mapping
		slot7 = slot7.ClusterNames
		slot7 = slot7[slot6]

		if slot7 ~= nil then
			slot7 = table
			slot7 = slot7.insert
			slot8 = slot1
			slot9 = slot0
			slot9 = slot9.Mapping
			slot9 = slot9.ClusterNames
			slot9 = slot9[slot6]

			slot7(slot8, slot9)
		end
	end

	slot2 = #slot1
	slot3 = 0

	if slot2 > slot3 then
		return slot1
	else
		slot2 = nil

		return slot2
	end
end

slot26[slot27] = slot28
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "ModesByControlSequenceOfOperation"
slot28 = {}
slot26[slot27] = slot28
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "ModesByControlSequenceOfOperation"
slot26 = slot26[slot27]
slot27 = "Mapping"
slot27 = slot1[slot27]
slot28 = "Command"
slot27 = slot27[slot28]
slot28 = "ControlSequenceOfOperationState"
slot27 = slot27[slot28]
slot27 = slot27[0]
slot28 = "Enum"
slot28 = slot1[slot28]
slot28 = slot28.Thermostat
slot29 = "ModesMasks"
slot28 = slot28[slot29]
slot29 = "Cooling"
slot28 = slot28[slot29]
slot26[slot27] = slot28
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "ModesByControlSequenceOfOperation"
slot26 = slot26[slot27]
slot27 = "Mapping"
slot27 = slot1[slot27]
slot28 = "Command"
slot27 = slot27[slot28]
slot28 = "ControlSequenceOfOperationState"
slot27 = slot27[slot28]
slot27 = slot27[1]
slot28 = "Enum"
slot28 = slot1[slot28]
slot28 = slot28.Thermostat
slot29 = "ModesMasks"
slot28 = slot28[slot29]
slot29 = "Cooling"
slot28 = slot28[slot29]
slot26[slot27] = slot28
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "ModesByControlSequenceOfOperation"
slot26 = slot26[slot27]
slot27 = "Mapping"
slot27 = slot1[slot27]
slot28 = "Command"
slot27 = slot27[slot28]
slot28 = "ControlSequenceOfOperationState"
slot27 = slot27[slot28]
slot27 = slot27[2]
slot28 = "Enum"
slot28 = slot1[slot28]
slot28 = slot28.Thermostat
slot29 = "ModesMasks"
slot28 = slot28[slot29]
slot29 = "Heating"
slot28 = slot28[slot29]
slot26[slot27] = slot28
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "ModesByControlSequenceOfOperation"
slot26 = slot26[slot27]
slot27 = "Mapping"
slot27 = slot1[slot27]
slot28 = "Command"
slot27 = slot27[slot28]
slot28 = "ControlSequenceOfOperationState"
slot27 = slot27[slot28]
slot27 = slot27[3]
slot28 = "Enum"
slot28 = slot1[slot28]
slot28 = slot28.Thermostat
slot29 = "ModesMasks"
slot28 = slot28[slot29]
slot29 = "Heating"
slot28 = slot28[slot29]
slot26[slot27] = slot28
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "ModesByControlSequenceOfOperation"
slot26 = slot26[slot27]
slot27 = "Mapping"
slot27 = slot1[slot27]
slot28 = "Command"
slot27 = slot27[slot28]
slot28 = "ControlSequenceOfOperationState"
slot27 = slot27[slot28]
slot27 = slot27[4]
slot28 = "Enum"
slot28 = slot1[slot28]
slot28 = slot28.Thermostat
slot29 = "ModesMasks"
slot28 = slot28[slot29]
slot29 = "CoolingAndHeating"
slot28 = slot28[slot29]
slot26[slot27] = slot28
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "ModesByControlSequenceOfOperation"
slot26 = slot26[slot27]
slot27 = "Mapping"
slot27 = slot1[slot27]
slot28 = "Command"
slot27 = slot27[slot28]
slot28 = "ControlSequenceOfOperationState"
slot27 = slot27[slot28]
slot27 = slot27[5]
slot28 = "Enum"
slot28 = slot1[slot28]
slot28 = slot28.Thermostat
slot29 = "ModesMasks"
slot28 = slot28[slot29]
slot29 = "CoolingAndHeating"
slot28 = slot28[slot29]
slot26[slot27] = slot28
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "SupportedModes"

function slot28(slot0)
	slot1 = {}
	slot2 = 0
	slot3 = 9
	slot4 = 1

	for slot5 = slot2, slot3, slot4 do
		slot6 = bit
		slot6 = slot6.lshift
		slot7 = 1
		slot8 = slot5
		slot6 = slot6(slot7, slot8)
		slot7 = bit
		slot7 = slot7.band
		slot8 = slot6
		slot9 = slot0
		slot7 = slot7(slot8, slot9)
		slot8 = 0

		if slot7 > slot8 then
			slot7 = table
			slot7 = slot7.insert
			slot8 = slot1
			slot9 = slot0
			slot9 = slot9.Converter
			slot9 = slot9.RawValueToValue
			slot10 = slot0
			slot10 = slot10.Attribute
			slot10 = slot10.Thermostat
			slot10 = slot10.SystemMode
			slot9 = slot9[slot10]
			slot10 = slot5

			slot7(slot8, slot9(slot10))
		end
	end

	slot2 = slot1
	slot2 = slot2.toJsonArrayString
	slot3 = slot1

	return slot2(slot3)
end

slot26[slot27] = slot28
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "AvailableModes"

function slot28(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.Converter
	slot2 = slot2.ModesByControlSequenceOfOperation
	slot2 = slot2[slot0]

	if slot2 ~= nil then
		slot3 = bit
		slot3 = slot3.band
		slot4 = slot2
		slot5 = slot1
		slot3 = slot3(slot4, slot5)
		slot4 = slot0
		slot4 = slot4.Converter
		slot4 = slot4.SupportedModes
		slot5 = slot3

		return slot4(slot5)
	end

	slot3 = {}

	return slot3
end

slot26[slot27] = slot28
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "FrameControl"
slot28 = {}
slot26[slot27] = slot28
slot26 = "Converter"
slot26 = slot1[slot26]
slot27 = "FrameControl"
slot26 = slot26[slot27]
slot27 = "Command"
slot27 = slot1[slot27]
slot28 = "Profalux"
slot27 = slot27[slot28]
slot28 = "SetPositionAndOrientation"
slot27 = slot27[slot28]
slot28 = 5
slot26[slot27] = slot28
slot26 = "extractValueFromRawValueBasedOnAttributeCommandFrame"

function slot27(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 13-21, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 22-25, warpins: 2 ---
	slot3 = slot0
	slot3 = slot3.Converter
	slot3 = slot3.RawValueToValue
	slot3 = slot3[slot1]

	if slot3 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-12, warpins: 1 ---
		slot3 = slot0
		slot3 = slot3.error
		slot4 = "Any RawValueToValue converter for command : "
		slot5 = slot1
		slot4 = slot4 .. slot5

		slot3(slot4)
		--- END OF BLOCK #1 ---



	end

	slot3 = slot1
	slot3 = slot3.split
	slot4 = slot1
	slot5 = "[%d]+"
	slot3 = slot3(slot4, slot5)
	slot4 = tonumber
	slot5 = slot3[2]
	slot4 = slot4(slot5)
	slot5 = false
	slot6 = slot0.payload
	slot6 = slot6.nextAttribute
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 26-27, warpins: 1 ---
	slot5 = false

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #5 28-28, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #5 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 29-32, warpins: 2 ---
	slot6 = slot0.payload
	slot6 = slot6.attributeIdentifier

	if slot6 ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #7 33-36, warpins: 1 ---
		slot6 = slot0.payload
		slot6 = slot6.attributeIdentifier

		if slot4 ~= slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #8 37-38, warpins: 2 ---
			if slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #9 39-42, warpins: 1 ---
				slot6 = slot0.payload
				slot6 = slot6.loadNextAttribute

				if slot6 == nil then

					-- Decompilation error in this vicinity:
					--- BLOCK #10 43-47, warpins: 1 ---
					slot6 = slot0
					slot6 = slot6.error
					slot7 = "Payload has next attribute data but any function 'loadNextAttribute' for load this"

					slot6(slot7)

					--- END OF BLOCK #10 ---

					FLOW; TARGET BLOCK #11



					-- Decompilation error in this vicinity:
					--- BLOCK #11 48-55, warpins: 1 ---
					slot6 = slot0
					slot6 = slot6.log
					slot7 = "attribute not matching, loadNextAttribute and retry"

					slot6(slot7)

					slot6 = slot0.payload
					slot6 = slot6.loadNextAttribute

					slot6()
					--- END OF BLOCK #11 ---

					FLOW; TARGET BLOCK #12



					-- Decompilation error in this vicinity:
					--- BLOCK #12 56-56, warpins: 0 ---
					--- END OF BLOCK #12 ---



				end
				--- END OF BLOCK #9 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #13 57-80, warpins: 1 ---
				slot6 = slot0
				slot6 = slot6.log
				slot7 = "attribute not matching for "
				slot8 = slot1
				slot9 = ", IGNORE"
				slot7 = slot7 .. slot8 .. slot9

				slot6(slot7)

				slot6 = slot0
				slot6 = slot6.log
				slot7 = "attributeIdentifierExpected = "
				slot8 = slot4
				slot7 = slot7 .. slot8

				slot6(slot7)

				slot6 = slot0
				slot6 = slot6.log
				slot7 = "ZCL.payload.attributeIdentifier = "
				slot8 = slot0.payload
				slot8 = slot8.attributeIdentifier
				slot7 = slot7 .. slot8

				slot6(slot7)

				slot6 = overkiz
				slot6 = slot6.magic
				slot6 = slot6.IGNORE

				return slot6
				--- END OF BLOCK #13 ---



			end
			--- END OF BLOCK #8 ---



		end
		--- END OF BLOCK #7 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 81-84, warpins: 4 ---
	slot6 = slot0.header
	slot6 = slot6.manufacturerId

	if slot6 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #15 85-88, warpins: 1 ---
		slot6 = #slot3
		slot7 = 2

		if slot6 > slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #16 89-95, warpins: 2 ---
			slot6 = slot0
			slot6 = slot6.log
			slot7 = "Manufacturer used for extract value from raw value"

			slot6(slot7)

			slot6 = slot0.header

			if slot6 ~= nil then

				-- Decompilation error in this vicinity:
				--- BLOCK #17 96-99, warpins: 1 ---
				slot6 = slot0.header
				slot6 = slot6.manufacturerId

				if slot6 ~= nil then

					-- Decompilation error in this vicinity:
					--- BLOCK #18 100-107, warpins: 1 ---
					slot6 = slot0
					slot6 = slot6.log
					slot7 = "manufacturerId from ZCL.header.manufacturerId: "
					slot8 = slot0.header
					slot8 = slot8.manufacturerId
					slot7 = slot7 .. slot8

					slot6(slot7)
					--- END OF BLOCK #18 ---



				end
				--- END OF BLOCK #17 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #19 108-111, warpins: 2 ---
				slot6 = slot0
				slot6 = slot6.log
				slot7 = "Any manufacturerId from ZCL.header"

				slot6(slot7)
				--- END OF BLOCK #19 ---



			end

			--- END OF BLOCK #16 ---

			FLOW; TARGET BLOCK #20



			-- Decompilation error in this vicinity:
			--- BLOCK #20 112-115, warpins: 2 ---
			slot6 = #slot3
			slot7 = 2

			if slot6 > slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #21 116-122, warpins: 1 ---
				slot6 = slot0
				slot6 = slot6.log
				slot7 = "manufacturerId from attribute: "
				slot8 = slot3[3]
				slot7 = slot7 .. slot8

				slot6(slot7)
				--- END OF BLOCK #21 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #22 123-128, warpins: 1 ---
				slot6 = slot0
				slot6 = slot6.log
				slot7 = "Any manufacturerId from "
				slot8 = slot1
				slot7 = slot7 .. slot8

				slot6(slot7)
				--- END OF BLOCK #22 ---



			end

			--- END OF BLOCK #20 ---

			FLOW; TARGET BLOCK #23



			-- Decompilation error in this vicinity:
			--- BLOCK #23 129-133, warpins: 2 ---
			slot6 = tonumber
			slot7 = slot3[3]
			slot6 = slot6(slot7)

			if slot6 ~= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #24 134-137, warpins: 1 ---
				slot7 = #slot3
				slot8 = 3

				if slot7 >= slot8 then

					-- Decompilation error in this vicinity:
					--- BLOCK #25 138-141, warpins: 1 ---
					slot7 = slot0.header
					slot7 = slot7.manufacturerId

					if slot6 ~= slot7 then

						-- Decompilation error in this vicinity:
						--- BLOCK #26 142-149, warpins: 2 ---
						slot7 = slot0
						slot7 = slot7.log
						slot8 = "wrong manufacturer, IGNORE"

						slot7(slot8)

						slot7 = overkiz
						slot7 = slot7.magic
						slot7 = slot7.IGNORE

						return slot7
						--- END OF BLOCK #26 ---



					end
					--- END OF BLOCK #25 ---



				end
				--- END OF BLOCK #24 ---



			end
			--- END OF BLOCK #23 ---



		end
		--- END OF BLOCK #15 ---



	end

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #27



	-- Decompilation error in this vicinity:
	--- BLOCK #27 150-156, warpins: 4 ---
	slot6 = slot0.payload
	slot6 = slot6.value
	slot7 = overkiz
	slot7 = slot7.magic
	slot7 = slot7.IGNORE

	if slot6 == slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #28 157-165, warpins: 1 ---
		slot6 = slot0
		slot6 = slot6.log
		slot7 = "payload has IGNORE value"

		slot6(slot7)

		slot6 = overkiz
		slot6 = slot6.magic
		slot6 = slot6.IGNORE

		return slot6
		--- END OF BLOCK #28 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #29 166-169, warpins: 1 ---
		slot6 = slot0.payload
		slot6 = slot6.attributeValue

		if not slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #30 170-171, warpins: 1 ---
			slot6 = slot0.payload
			slot6 = slot6.value
			--- END OF BLOCK #30 ---



		end

		--- END OF BLOCK #29 ---

		FLOW; TARGET BLOCK #31



		-- Decompilation error in this vicinity:
		--- BLOCK #31 172-177, warpins: 2 ---
		slot7 = slot0
		slot7 = slot7.Converter
		slot7 = slot7.RawValueToValue
		slot7 = slot7[slot1]
		slot8 = slot6

		return slot7(slot8)
		--- END OF BLOCK #31 ---



	end

	--- END OF BLOCK #27 ---

	FLOW; TARGET BLOCK #32



	-- Decompilation error in this vicinity:
	--- BLOCK #32 178-178, warpins: 2 ---
	return
	--- END OF BLOCK #32 ---



end

slot1[slot26] = slot27
slot26 = "extractValueFromRawValueWithFilter"

function slot27(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = slot0
	slot4 = slot2
	slot3 = slot3(slot4)

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-9, warpins: 1 ---
		slot3 = overkiz
		slot3 = slot3.magic
		slot3 = slot3.IGNORE

		return slot3
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-14, warpins: 2 ---
	slot3 = slot0
	slot3 = slot3.extractValueFromRawValue
	slot4 = slot1
	slot5 = slot2

	return slot3(slot4, slot5)
	--- END OF BLOCK #2 ---



end

slot1[slot26] = slot27
slot26 = "isClusterCommand"

function slot27(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	return bit.band(slot0[1], 3) == 1
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 11-11, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

slot1[slot26] = slot27
slot26 = "isGlobalCommand"

function slot27(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	return bit.band(slot0[1], 3) == 0
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 11-11, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

slot1[slot26] = slot27
slot26 = "extractValuesFromRawValue"

function slot27(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2.extractZCL
	slot3 = slot1
	slot4 = slot0
	slot2 = slot2(slot3, slot4)
	slot3 = slot2.payload
	slot4 = overkiz
	slot4 = slot4.magic
	slot4 = slot4.IGNORE

	if slot3 == slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-13, warpins: 1 ---
		slot3 = {}

		return slot3
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-16, warpins: 2 ---
	slot3 = slot1
	slot4 = slot2.payload

	return slot3(slot4)
	--- END OF BLOCK #2 ---



end

slot1[slot26] = slot27

function slot26(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = slot0.header
	slot3 = slot3.manufacturerId

	if slot3 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-8, warpins: 1 ---
		slot3 = #slot2
		slot4 = 2

		if slot3 > slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #2 9-15, warpins: 2 ---
			slot3 = slot0
			slot3 = slot3.log
			slot4 = "Manufacturer used for extract value from raw value"

			slot3(slot4)

			slot3 = slot0.header

			if slot3 ~= nil then

				-- Decompilation error in this vicinity:
				--- BLOCK #3 16-19, warpins: 1 ---
				slot3 = slot0.header
				slot3 = slot3.manufacturerId

				if slot3 ~= nil then

					-- Decompilation error in this vicinity:
					--- BLOCK #4 20-27, warpins: 1 ---
					slot3 = slot0
					slot3 = slot3.log
					slot4 = "manufacturerId from ZCL.header.manufacturerId: "
					slot5 = slot0.header
					slot5 = slot5.manufacturerId
					slot4 = slot4 .. slot5

					slot3(slot4)
					--- END OF BLOCK #4 ---



				end
				--- END OF BLOCK #3 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #5 28-31, warpins: 2 ---
				slot3 = slot0
				slot3 = slot3.log
				slot4 = "Any manufacturerId from ZCL.header"

				slot3(slot4)
				--- END OF BLOCK #5 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #6



			-- Decompilation error in this vicinity:
			--- BLOCK #6 32-35, warpins: 2 ---
			slot3 = #slot2
			slot4 = 2

			if slot3 > slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #7 36-42, warpins: 1 ---
				slot3 = slot0
				slot3 = slot3.log
				slot4 = "manufacturerId from attribute: "
				slot5 = slot2[3]
				slot4 = slot4 .. slot5

				slot3(slot4)
				--- END OF BLOCK #7 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #8 43-48, warpins: 1 ---
				slot3 = slot0
				slot3 = slot3.log
				slot4 = "Any manufacturerId from "
				slot5 = slot1
				slot4 = slot4 .. slot5

				slot3(slot4)
				--- END OF BLOCK #8 ---



			end

			--- END OF BLOCK #6 ---

			FLOW; TARGET BLOCK #9



			-- Decompilation error in this vicinity:
			--- BLOCK #9 49-53, warpins: 2 ---
			slot3 = tonumber
			slot4 = slot2[3]
			slot3 = slot3(slot4)

			if slot3 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #10 54-57, warpins: 1 ---
				slot4 = slot0.header
				slot4 = slot4.manufacturerId

				if slot4 ~= 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #11 58-61, warpins: 1 ---
					slot4 = slot0.header
					slot4 = slot4.manufacturerId

					if slot4 == nil and slot3 ~= 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #13 64-67, warpins: 1 ---
						slot4 = #slot2
						slot5 = 3

						if slot4 >= slot5 then

							-- Decompilation error in this vicinity:
							--- BLOCK #14 68-71, warpins: 1 ---
							slot4 = slot0.header
							slot4 = slot4.manufacturerId

							if slot3 ~= slot4 then

								-- Decompilation error in this vicinity:
								--- BLOCK #15 72-77, warpins: 3 ---
								slot4 = slot0
								slot4 = slot4.log
								slot5 = "wrong manufacturer, IGNORE"

								slot4(slot5)

								slot4 = false

								return slot4
								--- END OF BLOCK #15 ---



							end
							--- END OF BLOCK #14 ---



						end
						--- END OF BLOCK #13 ---



					end
					--- END OF BLOCK #11 ---



				end
				--- END OF BLOCK #10 ---



			end
			--- END OF BLOCK #9 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 78-79, warpins: 4 ---
	slot3 = true

	return slot3
	--- END OF BLOCK #16 ---



end

slot27 = "extractValueFromRawValue"

function slot28(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot0
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2[1]
	slot4 = slot1
	slot4 = slot4.extractZCL
	slot5 = slot1
	slot6 = slot3
	slot4 = slot4(slot5, slot6)
	slot5 = slot1
	slot5 = slot5.extractValueFromZCL
	slot6 = slot0
	slot7 = slot4

	return slot5(slot6, slot7)
	--- END OF BLOCK #0 ---



end

slot1[slot27] = slot28
slot27 = "extractValueFromZCL"

function slot28(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2.split
	slot3 = slot0
	slot4 = "[%d]+"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2[1]
	slot4 = slot2[2]
	slot5 = slot1.payload

	if slot5 ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-17, warpins: 1 ---
		slot6 = slot1
		slot7 = slot1
		slot8 = slot0
		slot9 = slot2
		slot6 = slot6(slot7, slot8, slot9)

		if not slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #2 18-21, warpins: 2 ---
			slot6 = overkiz
			slot6 = slot6.magic
			slot6 = slot6.IGNORE

			return slot6
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 22-26, warpins: 2 ---
	slot6 = nil
	slot7 = slot1.header
	slot7 = slot7.frameType

	if slot7 ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #4 27-30, warpins: 1 ---
		slot7 = slot1.header
		slot7 = slot7.frameType

		if slot7 == 2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #5 31-33, warpins: 2 ---
			slot7 = slot1.header
			slot6 = slot7.commandIdentifier
			--- END OF BLOCK #5 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #6 34-37, warpins: 1 ---
			slot7 = slot1.header
			slot7 = slot7.specific

			if slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #7 38-39, warpins: 1 ---
				if slot3 == nil then

					-- Decompilation error in this vicinity:
					--- BLOCK #8 40-42, warpins: 1 ---
					slot7 = error
					slot8 = "clusterId is null"

					slot7(slot8)
					--- END OF BLOCK #8 ---



				end

				--- END OF BLOCK #7 ---

				FLOW; TARGET BLOCK #9



				-- Decompilation error in this vicinity:
				--- BLOCK #9 43-51, warpins: 2 ---
				slot7 = slot3
				slot8 = "/"
				slot9 = slot1.header
				slot9 = slot9.commandIdentifier
				slot10 = "/"
				slot11 = slot1.header
				slot11 = slot11.manufacturerId
				slot6 = slot7 .. slot8 .. slot9 .. slot10 .. slot11
				--- END OF BLOCK #9 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #10 52-53, warpins: 1 ---
				if slot3 == nil then

					-- Decompilation error in this vicinity:
					--- BLOCK #11 54-56, warpins: 1 ---
					slot7 = error
					slot8 = "clusterId is null"

					slot7(slot8)
					--- END OF BLOCK #11 ---



				end

				--- END OF BLOCK #10 ---

				FLOW; TARGET BLOCK #12



				-- Decompilation error in this vicinity:
				--- BLOCK #12 57-61, warpins: 2 ---
				slot7 = slot3
				slot8 = "/"
				slot9 = slot1.header
				slot9 = slot9.commandIdentifier
				slot6 = slot7 .. slot8 .. slot9
				--- END OF BLOCK #12 ---



			end
			--- END OF BLOCK #6 ---



		end
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 62-65, warpins: 3 ---
	slot7 = #slot2
	slot8 = 1

	if slot7 > slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #14 66-72, warpins: 1 ---
		slot7 = tonumber
		slot8 = slot2[2]
		slot7 = slot7(slot8)
		slot8 = slot1.header
		slot8 = slot8.commandIdentifier

		if slot7 == slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #15 73-76, warpins: 1 ---
			slot7 = slot1.header
			slot7 = slot7.frameType

			if slot7 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #16 77-83, warpins: 1 ---
				slot7 = slot1.header
				slot7 = slot7.commandIdentifier
				slot8 = slot2
				slot8 = slot8.CommandIdentifier
				slot8 = slot8.ReadAttributesResponse

				if slot7 ~= slot8 then

					-- Decompilation error in this vicinity:
					--- BLOCK #17 84-90, warpins: 1 ---
					slot7 = slot1.header
					slot7 = slot7.commandIdentifier
					slot8 = slot2
					slot8 = slot8.CommandIdentifier
					slot8 = slot8.ReportAttributes

					if slot7 ~= slot8 then

						-- Decompilation error in this vicinity:
						--- BLOCK #18 91-94, warpins: 2 ---
						slot7 = slot1.header
						slot7 = slot7.frameType

						if slot7 == 1 then

							-- Decompilation error in this vicinity:
							--- BLOCK #19 95-100, warpins: 1 ---
							slot7 = slot2
							slot7 = slot7.CommandIdentifier
							slot7 = slot7.Ias
							slot7 = slot7.ZoneStatusChangeNotification

							if slot6 ~= slot7 then

								-- Decompilation error in this vicinity:
								--- BLOCK #20 101-101, warpins: 2 ---
								return slot5
								--- END OF BLOCK #20 ---



							end
							--- END OF BLOCK #19 ---



						end
						--- END OF BLOCK #18 ---



					end
					--- END OF BLOCK #17 ---



				end
				--- END OF BLOCK #16 ---



			end
			--- END OF BLOCK #15 ---



		end
		--- END OF BLOCK #14 ---



	end

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #21



	-- Decompilation error in this vicinity:
	--- BLOCK #21 102-104, warpins: 6 ---
	slot7 = slot5[slot4]

	if slot7 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #22 105-108, warpins: 1 ---
		slot8 = overkiz
		slot8 = slot8.magic
		slot8 = slot8.IGNORE

		return slot8
		--- END OF BLOCK #22 ---



	end

	--- END OF BLOCK #21 ---

	FLOW; TARGET BLOCK #23



	-- Decompilation error in this vicinity:
	--- BLOCK #23 109-114, warpins: 2 ---
	slot8 = slot7.attributeIdentifier
	slot9 = tonumber
	slot10 = slot4
	slot9 = slot9(slot10)

	if slot8 == slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #26 119-123, warpins: 2 ---
		if (slot7.attributeValue or slot7.value) == overkiz.magic.IGNORE then

			-- Decompilation error in this vicinity:
			--- BLOCK #27 124-131, warpins: 1 ---
			slot9 = slot2
			slot9 = slot9.log
			slot10 = "payload has IGNORE value"

			slot9(slot10)

			slot9 = overkiz
			slot9 = slot9.magic
			slot9 = slot9.IGNORE

			return slot9
			--- END OF BLOCK #27 ---



		end

		--- END OF BLOCK #26 ---

		FLOW; TARGET BLOCK #28



		-- Decompilation error in this vicinity:
		--- BLOCK #28 132-138, warpins: 2 ---
		return slot2.Converter.RawValueToValue[slot0](slot7.attributeValue or slot7.value)
		--- END OF BLOCK #28 ---

		FLOW; TARGET BLOCK #30



		-- Decompilation error in this vicinity:
		--- BLOCK #30 140-140, warpins: 2 ---
		--- END OF BLOCK #30 ---



	end

	--- END OF BLOCK #23 ---

	FLOW; TARGET BLOCK #31



	-- Decompilation error in this vicinity:
	--- BLOCK #31 141-144, warpins: 2 ---
	slot8 = overkiz
	slot8 = slot8.magic
	slot8 = slot8.IGNORE

	return slot8
	--- END OF BLOCK #31 ---



end

slot1[slot27] = slot28
slot27 = "extractAllValuesFromRawValue"

function slot28(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3 = slot0
	slot3 = slot3.extractZCL
	slot4 = slot1
	slot5 = slot0
	slot3 = slot3(slot4, slot5)
	slot4 = {}
	slot5 = pairs
	slot6 = slot2
	slot5, slot6, slot7 = slot5(slot6)
	--- END OF BLOCK #0 ---

	for slot8, slot9 in slot5, slot6, slot7
	LOOP BLOCK #1
	GO OUT TO BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-17, warpins: 1 ---
	slot10 = slot9.attribute
	slot11 = slot9.filter
	slot12 = slot9.command
	slot13 = slot9.postProcess
	slot14 = nil
	--- END OF BLOCK #1 ---

	if slot11 ~= nil then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-22, warpins: 1 ---
	slot15 = slot11
	slot16 = slot1
	slot15 = slot15(slot16)
	--- END OF BLOCK #2 ---

	slot15 = if slot15 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 23-24, warpins: 2 ---
	--- END OF BLOCK #3 ---

	if slot10 ~= nil then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 25-25, warpins: 1 ---
	slot12 = slot10
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 26-35, warpins: 2 ---
	slot15 = slot0
	slot15 = slot15.extractValueFromZCL
	slot16 = slot12
	slot17 = slot3
	slot15 = slot15(slot16, slot17)
	slot16 = overkiz
	slot16 = slot16.magic
	slot16 = slot16.IGNORE
	--- END OF BLOCK #5 ---

	if slot15 ~= slot16 then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 36-36, warpins: 1 ---
	slot14 = slot15
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 37-38, warpins: 3 ---
	--- END OF BLOCK #7 ---

	if slot14 ~= nil then
	JUMP TO BLOCK #8
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #8 39-40, warpins: 1 ---
	--- END OF BLOCK #8 ---

	if slot13 ~= nil then
	JUMP TO BLOCK #9
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #9 41-49, warpins: 1 ---
	slot15 = slot13
	slot16 = slot14
	slot15 = slot15(slot16)
	slot14 = slot15
	slot15 = overkiz
	slot15 = slot15.magic
	slot15 = slot15.IGNORE
	--- END OF BLOCK #9 ---

	if slot14 ~= slot15 then
	JUMP TO BLOCK #10
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #10 50-53, warpins: 1 ---
	slot15 = {}
	slot15.value = slot14
	slot4[slot8] = slot15
	--- END OF BLOCK #10 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #11 54-56, warpins: 1 ---
	slot15 = {}
	slot15.value = slot14
	slot4[slot8] = slot15

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 57-58, warpins: 5 ---
	--- END OF BLOCK #12 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #0



	-- Decompilation error in this vicinity:
	--- BLOCK #13 59-59, warpins: 1 ---
	return slot4
	--- END OF BLOCK #13 ---



end

slot1[slot27] = slot28
slot27 = "getFrameControlFromcommand"

function slot28(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1.Converter
	slot1 = slot1.FrameControl
	slot1 = slot1[slot0]
	--- END OF BLOCK #0 ---

	if slot1 == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-14, warpins: 1 ---
	slot1 = slot1
	slot1 = slot1.split
	slot2 = slot0
	slot3 = "[%d]+"
	slot1 = slot1(slot2, slot3)
	slot1 = #slot1
	--- END OF BLOCK #1 ---

	if slot1 == 3 then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-17, warpins: 1 ---
	slot1 = 5

	return slot1

	--- END OF BLOCK #2 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #3 18-23, warpins: 2 ---
	slot1 = slot0
	slot1 = slot1.Converter
	slot1 = slot1.FrameControl
	slot1 = slot1[slot0]
	--- END OF BLOCK #3 ---

	if slot1 == nil then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 24-26, warpins: 1 ---
	slot1 = 1

	return slot1

	--- END OF BLOCK #4 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #5 27-31, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1.Converter
	slot1 = slot1.FrameControl
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 32-32, warpins: 3 ---
	return
	--- END OF BLOCK #6 ---



end

slot1[slot27] = slot28
slot27 = "CreateRemoteOverrideFromContext"

function slot28(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if slot0 == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-4, warpins: 1 ---
	slot2 = nil

	return slot2

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-12, warpins: 2 ---
	slot2 = {}
	slot3 = slot0.controllableType
	slot4 = slot0
	slot4 = slot4.Enum
	slot4 = slot4.ControllableType
	slot4 = slot4.Group
	--- END OF BLOCK #2 ---

	if slot3 == slot4 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 13-17, warpins: 1 ---
	slot3 = slot0
	slot3 = slot3.Enum
	slot3 = slot3.LibEmber
	slot3 = slot3.OutgoingMulticast
	slot2.type = slot3
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 18-19, warpins: 2 ---
	--- END OF BLOCK #4 ---

	if slot1 ~= nil then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 20-23, warpins: 1 ---
	slot3 = pairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)
	--- END OF BLOCK #5 ---

	for slot6, slot7 in slot3, slot4, slot5
	LOOP BLOCK #6
	GO OUT TO BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #6 24-25, warpins: 1 ---
	slot8 = slot1[slot6]
	slot2[slot6] = slot8

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 26-27, warpins: 2 ---
	--- END OF BLOCK #7 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #8 28-28, warpins: 2 ---
	return slot2
	--- END OF BLOCK #8 ---



end

slot1[slot27] = slot28
slot27 = "Remote"

function slot28(slot0, slot1, slot2, slot3, slot4, slot5)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-34, warpins: 1 ---
	slot6 = slot0
	slot6 = slot6.split
	slot7 = slot0
	slot8 = "[%d]+"
	slot6 = slot6(slot7, slot8)
	slot7 = {}
	slot8 = slot1
	slot8 = slot8.getFrameControlFromcommand
	slot9 = slot0
	slot8 = slot8(slot9)
	slot7.frameControl = slot8
	slot8 = tonumber
	slot9 = slot1
	slot8 = slot8(slot9)
	slot7.nodeId = slot8
	slot8 = tonumber
	slot9 = slot3
	slot8 = slot8(slot9)
	slot7.eEp = slot8
	slot8 = tonumber
	slot9 = slot2
	slot8 = slot8(slot9)
	slot7.dEp = slot8
	slot8 = tonumber
	slot9 = slot6[1]
	slot8 = slot8(slot9)
	slot7.cluster = slot8
	slot8 = tonumber
	slot9 = slot6[2]
	slot8 = slot8(slot9)
	slot7.command = slot8
	slot8 = #slot6
	--- END OF BLOCK #0 ---

	if slot8 == 3 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 35-38, warpins: 1 ---
	slot8 = tonumber
	slot9 = slot6[3]
	slot8 = slot8(slot9)
	slot7.manufacturer = slot8
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 39-44, warpins: 2 ---
	slot8 = slot1
	slot8 = slot8.Converter
	slot8 = slot8.ValueToRawValue
	slot8 = slot8[slot0]
	--- END OF BLOCK #2 ---

	if slot8 == nil then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 45-46, warpins: 1 ---
	slot7.payload = slot4
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #4 47-53, warpins: 1 ---
	slot8 = slot1
	slot8 = slot8.Converter
	slot8 = slot8.ValueToRawValue
	slot8 = slot8[slot0]
	slot9 = slot4
	slot8 = slot8(slot9)
	slot7.payload = slot8
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 54-60, warpins: 2 ---
	slot8 = slot1
	slot8 = slot8.RemotePostProcessing
	slot9 = slot0
	slot10 = slot7
	slot8 = slot8(slot9, slot10)
	--- END OF BLOCK #5 ---

	if slot5 ~= nil then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #9
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 61-64, warpins: 1 ---
	slot9 = pairs
	slot10 = slot5
	slot9, slot10, slot11 = slot9(slot10)
	--- END OF BLOCK #6 ---

	for slot12, slot13 in slot9, slot10, slot11
	LOOP BLOCK #7
	GO OUT TO BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #7 65-66, warpins: 1 ---
	slot14 = slot5[slot12]
	slot8[slot12] = slot14

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 67-68, warpins: 2 ---
	--- END OF BLOCK #8 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #9 69-69, warpins: 2 ---
	return slot8
	--- END OF BLOCK #9 ---



end

slot1[slot27] = slot28
slot27 = "PostCommand"
slot28 = {}
slot1[slot27] = slot28
slot27 = "PostCommand"
slot27 = slot1[slot27]
slot28 = "Command"
slot28 = slot1[slot28]
slot29 = "Profalux"
slot28 = slot28[slot29]
slot29 = "SetPositionAndOrientation"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = 4368
	slot0.manufacturer = slot1

	return slot0
	--- END OF BLOCK #0 ---



end

slot27[slot28] = slot29
slot27 = "PostCommand"
slot27 = slot1[slot27]
slot28 = "Command"
slot28 = slot1[slot28]
slot29 = "Cleode"
slot28 = slot28[slot29]
slot29 = "SetMode"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = 4281
	slot0.manufacturer = slot1

	return slot0
	--- END OF BLOCK #0 ---



end

slot27[slot28] = slot29
slot27 = "RemotePostProcessing"

function slot28(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2.PostCommand
	slot2 = slot2[slot0]

	--- END OF BLOCK #0 ---

	if slot2 == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-7, warpins: 1 ---
	return slot1

	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-12, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2.PostCommand
	slot2 = slot2[slot0]
	slot3 = slot1

	return slot2(slot3)
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 13-13, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

slot1[slot27] = slot28
slot27 = "Bind"

function slot28(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot8 = slot0
	slot8 = slot8.stringSimpleSplit
	slot9 = tostring
	slot10 = slot5
	slot9 = slot9(slot10)
	slot10 = ","
	slot8 = slot8(slot9, slot10)
	slot9 = {}
	slot10 = 1
	slot11 = 1
	slot12 = #slot8
	slot12 = 2 * slot12
	slot13 = 1
	--- END OF BLOCK #0 ---

	for slot14=slot11, slot12, slot13
	LOOP BLOCK #1
	GO OUT TO BLOCK #20


	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-17, warpins: 2 ---
	slot15 = slot14 % 2
	--- END OF BLOCK #1 ---

	if slot15 ~= 0 then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #18
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-23, warpins: 1 ---
	slot15 = nil
	slot16 = tonumber
	slot17 = slot8[slot10]
	slot16 = slot16(slot17)
	--- END OF BLOCK #2 ---

	slot16 = if slot16 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 24-28, warpins: 1 ---
	slot16 = tonumber
	slot17 = slot8[slot10]
	slot16 = slot16(slot17)
	slot15 = slot16
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #4 29-34, warpins: 1 ---
	slot16 = pairs
	slot17 = slot1
	slot17 = slot17.Mapping
	slot17 = slot17.ClusterNames
	slot16, slot17, slot18 = slot16(slot17)
	--- END OF BLOCK #4 ---

	for slot19, slot20 in slot16, slot17, slot18
	LOOP BLOCK #5
	GO OUT TO BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #5 35-40, warpins: 1 ---
	slot21 = slot0
	slot21 = slot21.trim
	slot22 = slot8[slot10]
	slot21 = slot21(slot22)
	--- END OF BLOCK #5 ---

	if slot20 == slot21 then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 41-41, warpins: 1 ---
	slot15 = slot19
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 42-43, warpins: 3 ---
	--- END OF BLOCK #7 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #8 44-45, warpins: 1 ---
	--- END OF BLOCK #8 ---

	if slot15 == nil then
	JUMP TO BLOCK #9
	else
	JUMP TO BLOCK #10
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #9 46-54, warpins: 1 ---
	slot16 = error
	slot17 = "Cluster name "
	slot18 = slot0
	slot18 = slot18.trim
	slot19 = slot8[slot10]
	slot18 = slot18(slot19)
	slot19 = " not supported"
	slot17 = slot17 .. slot18 .. slot19

	slot16(slot17)

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 55-72, warpins: 3 ---
	slot16 = {
		command = 33
	}
	slot17 = tonumber
	slot18 = slot0
	slot17 = slot17(slot18)
	slot16.id = slot17
	slot17 = tonumber
	slot18 = slot1
	slot17 = slot17(slot18)
	slot16.eEp = slot17
	slot17 = tonumber
	slot18 = slot3
	slot17 = slot17(slot18)
	slot16.dEp = slot17
	slot16.eui64 = slot2
	slot16.cluster = slot15
	slot16.type = slot6
	--- END OF BLOCK #10 ---

	if slot6 == 1 then
	JUMP TO BLOCK #11
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #11 73-77, warpins: 1 ---
	slot17 = tonumber
	slot18 = slot4
	slot17 = slot17(slot18)
	slot16.groupId = slot17
	--- END OF BLOCK #11 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #12 78-78, warpins: 1 ---
	slot16.dEui64 = slot4
	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 79-80, warpins: 2 ---
	--- END OF BLOCK #13 ---

	if slot7 ~= nil then
	JUMP TO BLOCK #14
	else
	JUMP TO BLOCK #17
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #14 81-84, warpins: 1 ---
	slot17 = pairs
	slot18 = slot7
	slot17, slot18, slot19 = slot17(slot18)
	--- END OF BLOCK #14 ---

	for slot20 in slot17, slot18, slot19
	LOOP BLOCK #15
	GO OUT TO BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #15 85-86, warpins: 1 ---
	slot21 = slot7[slot20]
	slot16[slot20] = slot21
	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 87-88, warpins: 2 ---
	--- END OF BLOCK #16 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #17 89-91, warpins: 2 ---
	slot9[slot14] = slot16
	slot10 = slot10 + 1
	--- END OF BLOCK #17 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #19



	-- Decompilation error in this vicinity:
	--- BLOCK #18 92-93, warpins: 1 ---
	slot15 = nil
	slot9[slot14] = slot15
	--- END OF BLOCK #18 ---

	FLOW; TARGET BLOCK #19



	-- Decompilation error in this vicinity:
	--- BLOCK #19 94-94, warpins: 2 ---
	--- END OF BLOCK #19 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #0



	-- Decompilation error in this vicinity:
	--- BLOCK #20 95-115, warpins: 1 ---
	slot11 = #slot8
	slot11 = 2 * slot11
	slot11 = slot11 + 1
	slot12 = slot1
	slot12 = slot12.DeviceRequestForBindingTable
	slot13 = slot0
	slot12 = slot12(slot13)
	slot9[slot11] = slot12
	slot11 = #slot8
	slot11 = 2 * slot11
	slot11 = slot11 + 2
	slot12 = {
		type = "DeviceRequest"
	}
	slot9[slot11] = slot12
	slot11 = table
	slot11 = slot11.unpack
	slot12 = slot9
	slot13 = 1
	slot14 = #slot8
	slot14 = 2 * slot14
	slot14 = slot14 + 2

	return slot11(slot12, slot13, slot14)
	--- END OF BLOCK #20 ---



end

slot1[slot27] = slot28
slot27 = "Unbind"

function slot28(slot0, slot1, slot2, slot3, slot4, slot5, slot6)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot7 = slot0
	slot7 = slot7.Bind
	slot8 = slot0
	slot9 = slot1
	slot10 = slot2
	slot11 = slot3
	slot12 = slot4
	slot13 = slot5
	slot14 = slot6
	slot15 = {
		command = 34
	}

	return slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)
	--- END OF BLOCK #0 ---



end

slot1[slot27] = slot28
slot27 = "DeviceRequest"

function slot28(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot4 = {}
	slot5 = tonumber
	slot6 = slot0
	slot5 = slot5(slot6)
	slot4.id = slot5
	slot5 = tonumber
	slot6 = slot1
	slot5 = slot5(slot6)
	slot4.cluster = slot5
	slot5 = tonumber
	slot6 = slot2
	slot5 = slot5(slot6)
	slot4.option = slot5
	slot4.payload = slot3

	return slot4
	--- END OF BLOCK #0 ---



end

slot1[slot27] = slot28
slot27 = "DeviceRequestForBindingTable"

function slot28(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1.DeviceRequest
	slot2 = slot0
	slot3 = 51
	slot4 = 4416
	slot5 = bytearray
	slot6 = {
		0,
		0
	}

	return slot1(slot2, slot3, slot4, slot5(slot6))
	--- END OF BLOCK #0 ---



end

slot1[slot27] = slot28
slot27 = "DeviceRequestForRoutingTable"

function slot28(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1.DeviceRequest
	slot2 = slot0
	slot3 = 50
	slot4 = 4416
	slot5 = bytearray
	slot6 = {
		0,
		0
	}

	return slot1(slot2, slot3, slot4, slot5(slot6))
	--- END OF BLOCK #0 ---



end

slot1[slot27] = slot28
slot27 = "DeviceRequestForNeighborTable"

function slot28(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1.DeviceRequest
	slot2 = slot0
	slot3 = 49
	slot4 = 4416
	slot5 = bytearray
	slot6 = {
		0,
		0
	}

	return slot1(slot2, slot3, slot4, slot5(slot6))
	--- END OF BLOCK #0 ---



end

slot1[slot27] = slot28
slot27 = "DeviceRequestLeaveNetwork"

function slot28(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = bytearray
	slot3 = slot1
	slot4 = "base64"
	slot2 = slot2(slot3, slot4)
	--- END OF BLOCK #0 ---

	slot2 = if not slot2 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-9, warpins: 1 ---
	slot2 = bytearray
	slot3 = 8
	slot2 = slot2(slot3)
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-28, warpins: 2 ---
	slot3 = slot0
	slot3 = slot3.DeviceRequest
	slot4 = slot0
	slot5 = 52
	slot6 = 4416
	slot7 = bytearray
	slot8 = {
		0
	}
	slot7 = slot7(slot8)
	slot8 = slot7
	slot7 = slot7.append
	slot9 = slot2
	slot7 = slot7(slot8, slot9)
	slot8 = slot7
	slot7 = slot7.append
	slot9 = bytearray
	slot10 = {
		0
	}

	return slot3(slot4, slot5, slot6, slot7(slot8, slot9(slot10)))
	--- END OF BLOCK #2 ---



end

slot1[slot27] = slot28
slot27 = "setIntensityWithTimer"

function slot28(slot0, slot1, slot2, slot3, slot4, slot5, slot6)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if slot5 == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 1 ---
	slot5 = 0
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-31, warpins: 2 ---
	slot7 = slot0
	slot7 = slot7.Remote
	slot8 = slot0
	slot8 = slot8.Command
	slot8 = slot8.LevelControl
	slot8 = slot8.MoveToLevelWithOnOff
	slot9 = slot0
	slot10 = slot1
	slot11 = slot2
	slot12 = slot3
	slot13 = slot6
	slot7 = slot7(slot8, slot9, slot10, slot11, slot12, slot13)
	slot8 = nil
	slot9 = slot0
	slot9 = slot9.Remote
	slot10 = slot0
	slot10 = slot10.Command
	slot10 = slot10.LevelControl
	slot10 = slot10.MoveToLevelWithOnOff
	slot11 = slot0
	slot12 = slot1
	slot13 = slot2
	slot14 = slot5
	slot15 = slot6
	slot9 = slot9(slot10, slot11, slot12, slot13, slot14, slot15)
	slot10 = {
		category = "lighting"
	}
	slot10.delay = slot4

	return slot7, slot8, slot9, slot10
	--- END OF BLOCK #2 ---



end

slot1[slot27] = slot28
slot27 = "HighLevelValueOperator"
slot28 = {}
slot1[slot27] = slot28
slot27 = "HighLevelValueOperator"
slot27 = slot1[slot27]
slot28 = "add"

function slot29(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = overkiz
	slot2 = slot2.magic
	slot2 = slot2.IGNORE
	--- END OF BLOCK #0 ---

	if slot0 ~= slot2 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-10, warpins: 1 ---
	slot2 = overkiz
	slot2 = slot2.magic
	slot2 = slot2.IGNORE
	--- END OF BLOCK #1 ---

	if slot1 == slot2 then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-14, warpins: 2 ---
	slot2 = overkiz
	slot2 = slot2.magic
	slot2 = slot2.IGNORE

	return slot2

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 15-22, warpins: 2 ---
	slot2 = tonumber
	slot3 = slot0
	slot2 = slot2(slot3)
	slot3 = tonumber
	slot4 = slot1
	slot3 = slot3(slot4)
	slot2 = slot2 + slot3

	return slot2
	--- END OF BLOCK #3 ---



end

slot27[slot28] = slot29
slot27 = "HighLevelValueOperator"
slot27 = slot1[slot27]
slot28 = "sub"

function slot29(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = overkiz
	slot2 = slot2.magic
	slot2 = slot2.IGNORE
	--- END OF BLOCK #0 ---

	if slot0 ~= slot2 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-10, warpins: 1 ---
	slot2 = overkiz
	slot2 = slot2.magic
	slot2 = slot2.IGNORE
	--- END OF BLOCK #1 ---

	if slot1 == slot2 then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-14, warpins: 2 ---
	slot2 = overkiz
	slot2 = slot2.magic
	slot2 = slot2.IGNORE

	return slot2

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 15-22, warpins: 2 ---
	slot2 = tonumber
	slot3 = slot0
	slot2 = slot2(slot3)
	slot3 = tonumber
	slot4 = slot1
	slot3 = slot3(slot4)
	slot2 = slot2 - slot3

	return slot2
	--- END OF BLOCK #3 ---



end

slot27[slot28] = slot29
slot27 = "Converter"
slot27 = slot1[slot27]
slot28 = "MeteringInstantaneousDemand"

function slot29(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if slot0 ~= nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-4, warpins: 1 ---
	--- END OF BLOCK #1 ---

	if slot1 ~= nil then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-6, warpins: 1 ---
	--- END OF BLOCK #2 ---

	if slot2 ~= nil then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 7-10, warpins: 1 ---
	slot3 = slot0 * slot1
	slot3 = slot3 / slot2

	return slot3

	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #4 11-14, warpins: 3 ---
	slot3 = overkiz
	slot3 = slot3.magic
	slot3 = slot3.IGNORE

	return slot3
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 15-15, warpins: 2 ---
	return
	--- END OF BLOCK #5 ---



end

slot27[slot28] = slot29
slot27 = "Converter"
slot27 = slot1[slot27]
slot28 = "IasStatusToReadableState"

function slot29(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if slot0 == slot3 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 1 ---
	return slot1
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-4, warpins: 2 ---
	return slot2
	--- END OF BLOCK #2 ---



end

slot27[slot28] = slot29
slot27 = "OTAPolicy"
slot28 = {
	Downgrade = 1,
	Update = 0,
	Reinstall = 2
}
slot1[slot27] = slot28
slot27 = "OTAImageType"
slot28 = {
	database = 20,
	single = 19
}
slot1[slot27] = slot28
slot27 = "OTAForSomfyIRBlaster"

function slot28(slot0, slot1, slot2, slot3, slot4, slot5)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot6 = {}
	slot6.url = slot0
	slot6.hash = slot1
	slot6.otaImageType = slot5
	slot7 = nil
	--- END OF BLOCK #0 ---

	if slot2 == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 1 ---
	slot8 = {}
	slot8[1] = slot4
	slot7 = slot8
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-18, warpins: 1 ---
	slot8 = {}
	slot9 = slot2
	slot10 = "/"
	slot11 = slot3
	slot9 = slot9 .. slot10 .. slot11
	slot8[1] = slot9
	slot7 = slot8
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 19-36, warpins: 2 ---
	slot8 = slot0
	slot8 = slot8.OTACheckCommand
	slot9 = slot6
	slot8 = slot8(slot9)
	slot9 = slot0
	slot9 = slot9.OTA
	slot10 = slot8.url
	slot11 = slot8.filename
	slot12 = slot8.hash
	slot13 = slot7
	slot14 = 3
	slot15 = 4640
	slot16 = slot8.imageType
	slot17 = 16777216
	slot18 = slot0
	slot18 = slot18.OTAPolicy
	slot18 = slot18.Update

	return slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18)
	--- END OF BLOCK #3 ---



end

slot1[slot27] = slot28
slot27 = "OTACheckCommand"

function slot28(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = {}
	slot2 = assert
	--- END OF BLOCK #0 ---

	if slot0 == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-6, warpins: 1 ---
	slot3 = false
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 7-7, warpins: 1 ---
	slot3 = true
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 8-13, warpins: 2 ---
	slot4 = "commmandOtaFile should not be nil"

	slot2(slot3, slot4)

	slot2 = assert
	slot3 = slot0.url
	--- END OF BLOCK #3 ---

	if slot3 == nil then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 14-15, warpins: 1 ---
	slot3 = false
	--- END OF BLOCK #4 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #5 16-16, warpins: 1 ---
	slot3 = true
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 17-22, warpins: 2 ---
	slot4 = "url should not be nil"

	slot2(slot3, slot4)

	slot2 = assert
	slot3 = slot0.hash
	--- END OF BLOCK #6 ---

	if slot3 == nil then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 23-24, warpins: 1 ---
	slot3 = false
	--- END OF BLOCK #7 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #8 25-25, warpins: 1 ---
	slot3 = true
	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 26-32, warpins: 2 ---
	slot4 = "hash should not be nil"

	slot2(slot3, slot4)

	slot2 = slot0.url
	slot1.url = slot2
	slot2 = slot0.otaImageType
	--- END OF BLOCK #9 ---

	if slot2 == "single" then
	JUMP TO BLOCK #10
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #10 33-34, warpins: 1 ---
	slot2 = "irSingle.ota"
	--- END OF BLOCK #10 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #11 35-35, warpins: 1 ---
	slot2 = "irDatabase.ota"
	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 36-44, warpins: 2 ---
	slot1.filename = slot2
	slot2 = slot0.hash
	slot1.hash = slot2
	slot2 = slot0
	slot2 = slot2.OTAImageType
	slot3 = slot0.otaImageType
	slot2 = slot2[slot3]
	--- END OF BLOCK #12 ---

	slot2 = if not slot2 then
	JUMP TO BLOCK #13
	else
	JUMP TO BLOCK #14
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #13 45-47, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2.OTAImageType
	slot2 = slot2.database
	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 48-49, warpins: 2 ---
	slot1.imageType = slot2

	return slot1
	--- END OF BLOCK #14 ---



end

slot1[slot27] = slot28
slot27 = "OTA"

function slot28(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-30, warpins: 1 ---
	slot9 = {}
	slot9.url = slot0
	slot9.filename = slot1
	slot9.hash = slot2
	slot9.nodes = slot3
	slot10 = {}
	slot11 = tonumber
	slot12 = slot4
	slot11 = slot11(slot12)
	slot10.payloadType = slot11
	slot11 = tonumber
	slot12 = slot8
	slot11 = slot11(slot12)
	slot10.policy = slot11
	slot11 = {}
	slot12 = tonumber
	slot13 = slot5
	slot12 = slot12(slot13)
	slot11.manufacturerId = slot12
	slot12 = tonumber
	slot13 = slot6
	slot12 = slot12(slot13)
	slot11.imageTypeId = slot12
	slot12 = tonumber
	slot13 = slot7
	slot12 = slot12(slot13)
	slot11.firmwareVersion = slot12
	slot10.otaImageId = slot11
	slot9.imageOptions = slot10

	return slot9
	--- END OF BLOCK #0 ---



end

slot1[slot27] = slot28
slot27 = "CommissioningCodeType"
slot28 = {}
slot1[slot27] = slot28
slot27 = "CommissioningCodeType"
slot27 = slot1[slot27]
slot28 = "And"
slot29 = "&"
slot27[slot28] = slot29
slot27 = "CommissioningCodeType"
slot27 = slot1[slot27]
slot28 = "Pipe"
slot29 = "|"
slot27[slot28] = slot29
slot27 = "CommissioningCodeType"
slot27 = slot1[slot27]
slot28 = "Dollar"
slot29 = "$"
slot27[slot28] = slot29
slot27 = "formatDeviceCommissioningCode"

function slot28(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = nil
	slot2 = type
	slot3 = slot0
	slot2 = slot2(slot3)
	--- END OF BLOCK #0 ---

	if slot2 ~= "string" then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-13, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2.functionalException
	slot3 = slot0
	slot3 = slot3.E
	slot3 = slot3.INVALID_FIELD_VALUE
	slot4 = "Invalid Zigbee device commissioning code: code null or wrong type"

	slot2(slot3, slot4)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-21, warpins: 2 ---
	slot2 = slot0
	slot3 = string
	slot3 = slot3.match
	slot4 = slot2
	slot5 = "%%"
	slot3 = slot3(slot4, slot5)
	--- END OF BLOCK #2 ---

	slot3 = if slot3 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 22-31, warpins: 1 ---
	slot3 = slot0
	slot3 = slot3.splitWithSpecialCharacter
	slot4 = slot2
	slot5 = "%"
	slot6 = "*"
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = 1
	slot5 = #slot3
	slot6 = 1
	--- END OF BLOCK #3 ---

	for slot7=slot4, slot5, slot6
	LOOP BLOCK #4
	GO OUT TO BLOCK #8


	-- Decompilation error in this vicinity:
	--- BLOCK #4 32-38, warpins: 2 ---
	slot8 = string
	slot8 = slot8.match
	slot9 = slot3[slot7]
	slot10 = "Z:"
	slot8 = slot8(slot9, slot10)
	--- END OF BLOCK #4 ---

	slot8 = if not slot8 then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 39-45, warpins: 1 ---
	slot8 = string
	slot8 = slot8.match
	slot9 = slot3[slot7]
	slot10 = "Z%$"
	slot8 = slot8(slot9, slot10)
	--- END OF BLOCK #5 ---

	slot8 = if slot8 then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 46-47, warpins: 2 ---
	slot2 = slot3[slot7]
	--- END OF BLOCK #6 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #7 48-48, warpins: 1 ---
	--- END OF BLOCK #7 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #8 49-53, warpins: 3 ---
	slot3 = pairs
	slot4 = slot1
	slot4 = slot4.CommissioningCodeType
	slot3, slot4, slot5 = slot3(slot4)
	--- END OF BLOCK #8 ---

	for slot6 in slot3, slot4, slot5
	LOOP BLOCK #9
	GO OUT TO BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #9 54-64, warpins: 1 ---
	slot7 = slot0
	slot7 = slot7.stringSimpleSplit
	slot8 = slot2
	slot9 = slot1
	slot9 = slot9.CommissioningCodeType
	slot9 = slot9[slot6]
	slot7 = slot7(slot8, slot9)
	slot8 = #slot7
	slot9 = 1
	--- END OF BLOCK #9 ---

	if slot8 > slot9 then
	JUMP TO BLOCK #10
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #10 65-75, warpins: 1 ---
	slot8 = slot1
	slot8 = slot8.Converter
	slot8 = slot8.RawCodeToCommissioningCodeFields
	slot9 = slot1
	slot9 = slot9.CommissioningCodeType
	slot9 = slot9[slot6]
	slot8 = slot8[slot9]
	slot9 = slot7
	slot8 = slot8(slot9)
	slot1 = slot8
	--- END OF BLOCK #10 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #11 76-77, warpins: 2 ---
	--- END OF BLOCK #11 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #12 78-79, warpins: 2 ---
	--- END OF BLOCK #12 ---

	slot1 = if not slot1 then
	JUMP TO BLOCK #13
	else
	JUMP TO BLOCK #14
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #13 80-86, warpins: 1 ---
	slot3 = slot0
	slot3 = slot3.functionalException
	slot4 = slot0
	slot4 = slot4.E
	slot4 = slot4.INVALID_FIELD_VALUE
	slot5 = "Invalid Zigbee device commissioning code: missing either zic or eui64"

	slot3(slot4, slot5)

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 87-109, warpins: 2 ---
	slot3 = {}
	slot4 = bytearray
	slot5 = slot1[1]
	slot6 = "hexadecimal"
	slot4 = slot4(slot5, slot6)
	slot5 = slot4
	slot4 = slot4.tostring
	slot6 = "base64"
	slot4 = slot4(slot5, slot6)
	slot3.installCode = slot4
	slot4 = bytearray
	slot5 = slot1[2]
	slot6 = "hexadecimal"
	slot4 = slot4(slot5, slot6)
	slot5 = slot4
	slot4 = slot4.reverse
	slot4 = slot4(slot5)
	slot5 = slot4
	slot4 = slot4.tostring
	slot6 = "base64"
	slot4 = slot4(slot5, slot6)
	slot3.eui64 = slot4

	return slot3
	--- END OF BLOCK #14 ---



end

slot1[slot27] = slot28
slot27 = "Converter"
slot27 = slot1[slot27]
slot28 = "RawCodeToCommissioningCodeFields"
slot29 = {}
slot27[slot28] = slot29
slot27 = "Converter"
slot27 = slot1[slot27]
slot28 = "RawCodeToCommissioningCodeFields"
slot27 = slot27[slot28]
slot28 = "CommissioningCodeType"
slot28 = slot1[slot28]
slot29 = "And"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1.getCodeFieldsFromRawCode
	slot2 = slot0
	slot3 = "eui="
	slot4 = "zic="

	return slot1(slot2, slot3, slot4)
	--- END OF BLOCK #0 ---



end

slot27[slot28] = slot29
slot27 = "Converter"
slot27 = slot1[slot27]
slot28 = "RawCodeToCommissioningCodeFields"
slot27 = slot27[slot28]
slot28 = "CommissioningCodeType"
slot28 = slot1[slot28]
slot29 = "Pipe"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = {}
	slot2 = slot0[2]
	slot1[1] = slot2
	slot2 = slot0[1]
	slot1[2] = slot2

	return slot1
	--- END OF BLOCK #0 ---



end

slot27[slot28] = slot29
slot27 = "Converter"
slot27 = slot1[slot27]
slot28 = "RawCodeToCommissioningCodeFields"
slot27 = slot27[slot28]
slot28 = "CommissioningCodeType"
slot28 = slot1[slot28]
slot29 = "Dollar"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = false
	slot2 = "A:"
	slot3 = 1
	slot4 = #slot0
	slot5 = 1
	--- END OF BLOCK #0 ---

	for slot6=slot3, slot4, slot5
	LOOP BLOCK #1
	GO OUT TO BLOCK #4


	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-13, warpins: 2 ---
	slot7 = string
	slot7 = slot7.match
	slot8 = slot0[slot6]
	slot9 = "Z:"
	slot7 = slot7(slot8, slot9)
	--- END OF BLOCK #1 ---

	slot7 = if slot7 then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-14, warpins: 1 ---
	slot2 = "Z:"
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 15-15, warpins: 2 ---
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #0



	-- Decompilation error in this vicinity:
	--- BLOCK #4 16-21, warpins: 1 ---
	slot3 = slot0
	slot3 = slot3.getCodeFieldsFromRawCode
	slot4 = slot0
	slot5 = slot2
	slot6 = "I:"

	return slot3(slot4, slot5, slot6)
	--- END OF BLOCK #4 ---



end

slot27[slot28] = slot29
slot27 = "getCodeFieldsFromRawCode"

function slot28(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3, slot4 = nil
	slot5 = 1
	slot6 = #slot0
	slot7 = 1
	--- END OF BLOCK #0 ---

	for slot8=slot5, slot6, slot7
	LOOP BLOCK #1
	GO OUT TO BLOCK #6


	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-12, warpins: 2 ---
	slot9 = string
	slot9 = slot9.match
	slot10 = slot0[slot8]
	slot11 = slot1
	slot9 = slot9(slot10, slot11)
	--- END OF BLOCK #1 ---

	slot9 = if slot9 then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 13-19, warpins: 1 ---
	slot9 = string
	slot9 = slot9.gsub
	slot10 = slot0[slot8]
	slot11 = slot1
	slot12 = ""
	slot9 = slot9(slot10, slot11, slot12)
	slot3 = slot9
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-26, warpins: 2 ---
	slot9 = string
	slot9 = slot9.match
	slot10 = slot0[slot8]
	slot11 = slot2
	slot9 = slot9(slot10, slot11)
	--- END OF BLOCK #3 ---

	slot9 = if slot9 then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 27-33, warpins: 1 ---
	slot9 = string
	slot9 = slot9.gsub
	slot10 = slot0[slot8]
	slot11 = slot2
	slot12 = ""
	slot9 = slot9(slot10, slot11, slot12)
	slot4 = slot9
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 34-34, warpins: 2 ---
	--- END OF BLOCK #5 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #0



	-- Decompilation error in this vicinity:
	--- BLOCK #6 35-36, warpins: 1 ---
	--- END OF BLOCK #6 ---

	if slot4 ~= nil then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 37-38, warpins: 1 ---
	--- END OF BLOCK #7 ---

	if slot3 == nil then
	JUMP TO BLOCK #8
	else
	JUMP TO BLOCK #9
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #8 39-45, warpins: 2 ---
	slot5 = slot0
	slot5 = slot5.functionalException
	slot6 = slot0
	slot6 = slot6.E
	slot6 = slot6.INVALID_FIELD_VALUE
	slot7 = "Invalid Zigbee device commissioning code: missing either zic or eui64"

	slot5(slot6, slot7)

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 46-49, warpins: 2 ---
	slot5 = {}
	slot5[1] = slot4
	slot5[2] = slot3

	return slot5
	--- END OF BLOCK #9 ---



end

slot1[slot27] = slot28
slot27 = "Group"
slot28 = {}
slot1[slot27] = slot28
slot27 = "Group"
slot27 = slot1[slot27]
slot28 = "AddNodeEntry"

function slot29(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.parseDeviceURL
	slot6 = slot1
	slot5 = slot5(slot6)
	slot6 = slot5.protocolType
	--- END OF BLOCK #0 ---

	if slot6 ~= "zigbee" then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 1 ---
	slot6 = slot1
	slot6 = slot6.error
	slot7 = "Can only add a zigbee node entry in zigbee group"

	slot6(slot7)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-31, warpins: 2 ---
	slot6 = {
		action = "add"
	}
	slot6.group = slot0
	slot7 = {}
	slot7.id = slot1
	slot8 = {}
	slot9 = tonumber
	slot10 = slot2
	slot9 = slot9(slot10)
	slot8.nodeId = slot9
	slot9 = tonumber
	slot10 = slot4
	slot9 = slot9(slot10)
	slot8.eEp = slot9
	slot9 = tonumber
	slot10 = slot3
	slot9 = slot9(slot10)
	slot8.dEp = slot9
	slot7.attributes = slot8
	slot6.node = slot7

	return slot6
	--- END OF BLOCK #2 ---



end

slot27[slot28] = slot29
slot27 = "Group"
slot27 = slot1[slot27]
slot28 = "DeleteNodeEntry"

function slot29(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.Group
	slot5 = slot5.AddNodeEntry
	slot6 = slot0
	slot7 = slot1
	slot8 = slot2
	slot9 = slot3
	slot10 = slot4
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)
	slot6 = "remove"
	slot5.action = slot6

	return slot5
	--- END OF BLOCK #0 ---



end

slot27[slot28] = slot29
slot27 = "Group"
slot27 = slot1[slot27]
slot28 = "DeleteUnavailableNodeEntry"

function slot29(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.Group
	slot5 = slot5.AddNodeEntry
	slot6 = slot0
	slot7 = slot1
	slot8 = slot2
	slot9 = slot3
	slot10 = slot4
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)
	slot6 = "removeUnavailable"
	slot5.action = slot6

	return slot5
	--- END OF BLOCK #0 ---



end

slot27[slot28] = slot29
slot27 = "Group"
slot27 = slot1[slot27]
slot28 = "DeleteAllEntriesCommand"

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = {
		action = "removeAll"
	}
	slot1.group = slot0

	return slot1
	--- END OF BLOCK #0 ---



end

slot27[slot28] = slot29
slot27 = {}
slot1.Thermostat = slot27
slot27 = slot1.Thermostat
slot28 = "valueToWriteSetpoint"

function slot29(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-35, warpins: 1 ---
	slot2 = slot1 * 100
	slot3 = slot0
	slot3 = slot3.split
	slot4 = slot0
	slot5 = "[%d]+"
	slot3 = slot3(slot4, slot5)
	slot4 = slot1
	slot5 = slot3[2]
	slot4, slot5 = slot4(slot5)
	slot6 = bytearray
	slot7 = {}
	slot7[1] = slot4
	slot7[2] = slot5
	slot8 = slot2
	slot8 = slot8.DataType
	slot8 = slot8.Type
	slot8 = slot8.int16
	slot7[3] = slot8
	slot8 = bit
	slot8 = slot8.band
	slot9 = slot2
	slot10 = 255
	slot8 = slot8(slot9, slot10)
	slot7[4] = slot8
	slot8 = bit
	slot8 = slot8.band
	slot9 = bit
	slot9 = slot9.rshift
	slot10 = slot2
	slot11 = 8
	slot9 = slot9(slot10, slot11)
	slot10 = 255
	slot7[MULTRES] = slot8(slot9, slot10)

	return slot6(slot7)
	--- END OF BLOCK #0 ---



end

slot27[slot28] = slot29
slot27 = slot1.Thermostat
slot28 = "mergeSchedules"

function slot29(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-50, warpins: 1 ---
	slot8 = {}
	slot9 = slot0
	slot9 = slot9.Thermostat
	slot9 = slot9.extractTransitions
	slot10 = slot0
	slot9 = slot9(slot10)
	slot8.sunday = slot9
	slot9 = slot0
	slot9 = slot9.Thermostat
	slot9 = slot9.extractTransitions
	slot10 = slot1
	slot9 = slot9(slot10)
	slot8.monday = slot9
	slot9 = slot0
	slot9 = slot9.Thermostat
	slot9 = slot9.extractTransitions
	slot10 = slot2
	slot9 = slot9(slot10)
	slot8.tuesday = slot9
	slot9 = slot0
	slot9 = slot9.Thermostat
	slot9 = slot9.extractTransitions
	slot10 = slot3
	slot9 = slot9(slot10)
	slot8.wednesday = slot9
	slot9 = slot0
	slot9 = slot9.Thermostat
	slot9 = slot9.extractTransitions
	slot10 = slot4
	slot9 = slot9(slot10)
	slot8.thursday = slot9
	slot9 = slot0
	slot9 = slot9.Thermostat
	slot9 = slot9.extractTransitions
	slot10 = slot5
	slot9 = slot9(slot10)
	slot8.friday = slot9
	slot9 = slot0
	slot9 = slot9.Thermostat
	slot9 = slot9.extractTransitions
	slot10 = slot6
	slot9 = slot9(slot10)
	slot8.saturday = slot9
	slot9 = slot0
	slot9 = slot9.Thermostat
	slot9 = slot9.extractTransitions
	slot10 = slot7
	slot9 = slot9(slot10)
	slot8.vacation = slot9

	return slot8
	--- END OF BLOCK #0 ---



end

slot27[slot28] = slot29
slot27 = slot1.Thermostat
slot28 = "extractTransitions"

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if slot0 == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-4, warpins: 1 ---
	slot1 = {}

	return slot1

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-6, warpins: 2 ---
	slot1 = slot0.transitions

	return slot1
	--- END OF BLOCK #2 ---



end

slot27[slot28] = slot29
slot27 = slot1.Thermostat
slot28 = "splitSchedulesByDayAndMode"

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.payload

	--- END OF BLOCK #0 ---

	if slot1 == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-4, warpins: 1 ---
	return slot0

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-14, warpins: 2 ---
	slot1 = slot0.payload
	slot1 = slot1[1]
	slot2 = slot0.payload
	slot2 = slot2[2]
	slot3 = {}
	slot4 = 1
	slot5 = 0
	slot6 = 1
	slot7 = 1
	--- END OF BLOCK #2 ---

	for slot8=slot5, slot6, slot7
	LOOP BLOCK #3
	GO OUT TO BLOCK #12


	-- Decompilation error in this vicinity:
	--- BLOCK #3 15-26, warpins: 2 ---
	slot9 = bit
	slot9 = slot9.lshift
	slot10 = 1
	slot11 = slot8
	slot9 = slot9(slot10, slot11)
	slot10 = bit
	slot10 = slot10.band
	slot11 = slot2
	slot12 = slot9
	slot10 = slot10(slot11, slot12)
	--- END OF BLOCK #3 ---

	if slot10 ~= 0 then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 27-30, warpins: 1 ---
	slot10 = 0
	slot11 = 7
	slot12 = 1
	--- END OF BLOCK #4 ---

	for slot13=slot10, slot11, slot12
	LOOP BLOCK #5
	GO OUT TO BLOCK #11


	-- Decompilation error in this vicinity:
	--- BLOCK #5 31-42, warpins: 2 ---
	slot14 = bit
	slot14 = slot14.lshift
	slot15 = 1
	slot16 = slot13
	slot14 = slot14(slot15, slot16)
	slot15 = bit
	slot15 = slot15.band
	slot16 = slot1
	slot17 = slot14
	slot15 = slot15(slot16, slot17)
	--- END OF BLOCK #5 ---

	if slot15 ~= 0 then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #10
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 43-47, warpins: 1 ---
	slot15 = {}
	slot16 = pairs
	slot17 = slot0
	slot16, slot17, slot18 = slot16(slot17)
	--- END OF BLOCK #6 ---

	for slot19, slot20 in slot16, slot17, slot18
	LOOP BLOCK #7
	GO OUT TO BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #7 48-48, warpins: 1 ---
	slot15[slot19] = slot20
	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 49-50, warpins: 2 ---
	--- END OF BLOCK #8 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #9 51-61, warpins: 1 ---
	slot16 = bytearray
	slot17 = {}
	slot17[1] = slot14
	slot17[2] = slot9
	slot16 = slot16(slot17)
	slot15.payload = slot16
	slot3[slot4] = slot15
	slot16 = slot4 + 1
	slot17 = {}
	slot3[slot16] = slot17
	slot4 = slot4 + 2
	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 62-62, warpins: 2 ---
	--- END OF BLOCK #10 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #11 63-63, warpins: 2 ---
	--- END OF BLOCK #11 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #12 64-67, warpins: 1 ---
	slot5 = table
	slot5 = slot5.unpack
	slot6 = slot3

	return slot5(slot6)
	--- END OF BLOCK #12 ---



end

slot27[slot28] = slot29
slot27 = slot1.Thermostat
slot28 = "thermostatSetpointLimit"

function slot29(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if slot0 == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-4, warpins: 1 ---
	slot4 = nil

	return slot4
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-6, warpins: 2 ---
	--- END OF BLOCK #2 ---

	if slot2 ~= nil then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 7-7, warpins: 1 ---
	return slot2
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 8-9, warpins: 2 ---
	--- END OF BLOCK #4 ---

	if slot1 ~= nil then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 10-10, warpins: 1 ---
	return slot1
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 11-11, warpins: 2 ---
	return slot3
	--- END OF BLOCK #6 ---



end

slot27[slot28] = slot29
slot27 = "Converter"
slot27 = slot1[slot27]
slot28 = "computeDiscreteRSSILevel"

function slot29(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot2 = 1
	slot3 = 235
	--- END OF BLOCK #0 ---

	if slot1 >= slot3 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-6, warpins: 1 ---
	slot2 = 4
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #2 7-9, warpins: 1 ---
	slot3 = 215
	--- END OF BLOCK #2 ---

	if slot1 >= slot3 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-11, warpins: 1 ---
	slot2 = 3
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #4 12-14, warpins: 1 ---
	slot3 = 195
	--- END OF BLOCK #4 ---

	if slot1 >= slot3 then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 15-15, warpins: 1 ---
	slot2 = 2
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 16-18, warpins: 4 ---
	slot3 = -70
	--- END OF BLOCK #6 ---

	if slot0 < slot3 then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #9
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 19-22, warpins: 1 ---
	slot2 = slot2 - 1
	slot3 = 1
	--- END OF BLOCK #7 ---

	if slot2 < slot3 then
	JUMP TO BLOCK #8
	else
	JUMP TO BLOCK #9
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #8 23-23, warpins: 1 ---
	slot2 = 1
	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 24-26, warpins: 3 ---
	slot3 = {
		"verylow",
		"low",
		"normal",
		"good"
	}
	slot4 = slot3[slot2]

	return slot4
	--- END OF BLOCK #9 ---



end

slot27[slot28] = slot29
slot27 = "Validation"
slot28 = {}
slot1[slot27] = slot28
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "uint8"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if slot0 == 255 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-4, warpins: 1 ---
	slot1 = false
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-5, warpins: 1 ---
	slot1 = true

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 6-6, warpins: 2 ---
	return slot1
	--- END OF BLOCK #3 ---



end

slot27[slot28] = slot29
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "uint16"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if slot0 == 65535 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-4, warpins: 1 ---
	slot1 = false
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-5, warpins: 1 ---
	slot1 = true

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 6-6, warpins: 2 ---
	return slot1
	--- END OF BLOCK #3 ---



end

slot27[slot28] = slot29
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "uint24"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if slot0 == 16777215 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-4, warpins: 1 ---
	slot1 = false
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-5, warpins: 1 ---
	slot1 = true

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 6-6, warpins: 2 ---
	return slot1
	--- END OF BLOCK #3 ---



end

slot27[slot28] = slot29
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "uint32"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if slot0 == 4294967295.0 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-4, warpins: 1 ---
	slot1 = false
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-5, warpins: 1 ---
	slot1 = true

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 6-6, warpins: 2 ---
	return slot1
	--- END OF BLOCK #3 ---



end

slot27[slot28] = slot29
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "uint64"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = 1
	slot2 = 8
	slot3 = 1
	--- END OF BLOCK #0 ---

	for slot4=slot1, slot2, slot3
	LOOP BLOCK #1
	GO OUT TO BLOCK #4


	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-7, warpins: 2 ---
	slot5 = slot0[slot4]
	--- END OF BLOCK #1 ---

	if slot5 ~= 255 then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-9, warpins: 1 ---
	slot5 = true

	return slot5

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-10, warpins: 2 ---
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #0



	-- Decompilation error in this vicinity:
	--- BLOCK #4 11-12, warpins: 1 ---
	slot1 = false

	return slot1
	--- END OF BLOCK #4 ---



end

slot27[slot28] = slot29
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "eui64"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = 1
	slot2 = 8
	slot3 = 1
	--- END OF BLOCK #0 ---

	for slot4=slot1, slot2, slot3
	LOOP BLOCK #1
	GO OUT TO BLOCK #4


	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-7, warpins: 2 ---
	slot5 = slot0[slot4]
	--- END OF BLOCK #1 ---

	if slot5 ~= 255 then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-9, warpins: 1 ---
	slot5 = true

	return slot5

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-10, warpins: 2 ---
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #0



	-- Decompilation error in this vicinity:
	--- BLOCK #4 11-12, warpins: 1 ---
	slot1 = false

	return slot1
	--- END OF BLOCK #4 ---



end

slot27[slot28] = slot29
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "int8"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = bit
	slot1 = slot1.band
	slot2 = 255
	slot3 = slot0
	slot1 = slot1(slot2, slot3)
	--- END OF BLOCK #0 ---

	if slot1 == 128 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-9, warpins: 1 ---
	slot1 = false
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-10, warpins: 1 ---
	slot1 = true

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 11-11, warpins: 2 ---
	return slot1
	--- END OF BLOCK #3 ---



end

slot27[slot28] = slot29
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "int16"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = bit
	slot1 = slot1.band
	slot2 = 65535
	slot3 = slot0
	slot1 = slot1(slot2, slot3)
	--- END OF BLOCK #0 ---

	if slot1 == 32768 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-9, warpins: 1 ---
	slot1 = false
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-10, warpins: 1 ---
	slot1 = true

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 11-11, warpins: 2 ---
	return slot1
	--- END OF BLOCK #3 ---



end

slot27[slot28] = slot29
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "int24"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = bit
	slot1 = slot1.band
	slot2 = 16777215
	slot3 = slot0
	slot1 = slot1(slot2, slot3)
	--- END OF BLOCK #0 ---

	if slot1 == 8388608 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-9, warpins: 1 ---
	slot1 = false
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-10, warpins: 1 ---
	slot1 = true

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 11-11, warpins: 2 ---
	return slot1
	--- END OF BLOCK #3 ---



end

slot27[slot28] = slot29
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "int32"
slot28 = slot28[slot29]

function slot29(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = bit
	slot1 = slot1.band
	slot2 = 4294967295.0
	slot3 = slot0
	slot1 = slot1(slot2, slot3)
	--- END OF BLOCK #0 ---

	if slot1 == -2147483648 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-9, warpins: 1 ---
	slot1 = false
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-10, warpins: 1 ---
	slot1 = true

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 11-11, warpins: 2 ---
	return slot1
	--- END OF BLOCK #3 ---



end

slot27[slot28] = slot29
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "bool"
slot28 = slot28[slot29]
slot29 = "Validation"
slot29 = slot1[slot29]
slot30 = "DataType"
slot30 = slot1[slot30]
slot31 = "Type"
slot30 = slot30[slot31]
slot31 = "uint8"
slot30 = slot30[slot31]
slot29 = slot29[slot30]
slot27[slot28] = slot29
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "enum8"
slot28 = slot28[slot29]
slot29 = "Validation"
slot29 = slot1[slot29]
slot30 = "DataType"
slot30 = slot1[slot30]
slot31 = "Type"
slot30 = slot30[slot31]
slot31 = "uint8"
slot30 = slot30[slot31]
slot29 = slot29[slot30]
slot27[slot28] = slot29
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "enum16"
slot28 = slot28[slot29]
slot29 = "Validation"
slot29 = slot1[slot29]
slot30 = "DataType"
slot30 = slot1[slot30]
slot31 = "Type"
slot30 = slot30[slot31]
slot31 = "uint16"
slot30 = slot30[slot31]
slot29 = slot29[slot30]
slot27[slot28] = slot29
slot27 = "Validation"
slot27 = slot1[slot27]
slot28 = "DataType"
slot28 = slot1[slot28]
slot29 = "Type"
slot28 = slot28[slot29]
slot29 = "UTC"
slot28 = slot28[slot29]
slot29 = "Validation"
slot29 = slot1[slot29]
slot30 = "DataType"
slot30 = slot1[slot30]
slot31 = "Type"
slot30 = slot30[slot31]
slot31 = "uint32"
slot30 = slot30[slot31]
slot29 = slot29[slot30]
slot27[slot28] = slot29
slot27 = "isValidRawValue"

function slot28(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2.Validation
	slot2 = slot2[slot1]
	--- END OF BLOCK #0 ---

	if slot2 ~= nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-10, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2.Validation
	slot2 = slot2[slot1]
	slot3 = slot0

	return slot2(slot3)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-12, warpins: 2 ---
	slot2 = true

	return slot2
	--- END OF BLOCK #2 ---



end

slot1[slot27] = slot28
slot27 = "ReadMultiAttributesForClusters"

function slot28(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot4 = {}
	slot5 = ipairs
	slot6 = slot2
	slot5, slot6, slot7 = slot5(slot6)
	--- END OF BLOCK #0 ---

	for slot8, slot9 in slot5, slot6, slot7
	LOOP BLOCK #1
	GO OUT TO BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-10, warpins: 1 ---
	slot10 = type
	slot11 = slot9
	slot10 = slot10(slot11)
	--- END OF BLOCK #1 ---

	if slot10 == "table" then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #14
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-14, warpins: 1 ---
	slot10 = pairs
	slot11 = slot9
	slot10, slot11, slot12 = slot10(slot11)
	--- END OF BLOCK #2 ---

	for slot13, slot14 in slot10, slot11, slot12
	LOOP BLOCK #3
	GO OUT TO BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #3 15-19, warpins: 1 ---
	slot15 = type
	slot16 = slot14
	slot15 = slot15(slot16)
	--- END OF BLOCK #3 ---

	if slot15 == "string" then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 20-23, warpins: 1 ---
	slot15 = #slot4
	slot15 = slot15 + 1
	slot4[slot15] = slot14
	--- END OF BLOCK #4 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #5 24-25, warpins: 1 ---
	--- END OF BLOCK #5 ---

	if slot3 ~= nil then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 26-30, warpins: 1 ---
	slot15 = type
	slot16 = slot14
	slot15 = slot15(slot16)
	--- END OF BLOCK #6 ---

	if slot15 == "table" then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 31-32, warpins: 1 ---
	--- END OF BLOCK #7 ---

	if slot1 == "advanced" then
	JUMP TO BLOCK #8
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #8 33-34, warpins: 1 ---
	--- END OF BLOCK #8 ---

	if slot13 == slot3 then
	JUMP TO BLOCK #9
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #9 35-38, warpins: 1 ---
	slot15 = pairs
	slot16 = slot14
	slot15, slot16, slot17 = slot15(slot16)
	--- END OF BLOCK #9 ---

	for slot18, slot19 in slot15, slot16, slot17
	LOOP BLOCK #10
	GO OUT TO BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #10 39-41, warpins: 1 ---
	slot20 = #slot4
	slot20 = slot20 + 1
	slot4[slot20] = slot19
	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 42-43, warpins: 2 ---
	--- END OF BLOCK #11 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #12 44-45, warpins: 7 ---
	--- END OF BLOCK #12 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #13 46-46, warpins: 1 ---
	--- END OF BLOCK #13 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #14 47-51, warpins: 1 ---
	slot10 = type
	slot11 = slot9
	slot10 = slot10(slot11)
	--- END OF BLOCK #14 ---

	if slot10 == "string" then
	JUMP TO BLOCK #15
	else
	JUMP TO BLOCK #16
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #15 52-54, warpins: 1 ---
	slot10 = #slot4
	slot10 = slot10 + 1
	slot4[slot10] = slot9
	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 55-56, warpins: 4 ---
	--- END OF BLOCK #16 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #0



	-- Decompilation error in this vicinity:
	--- BLOCK #17 57-69, warpins: 1 ---
	slot5 = table
	slot5 = slot5.sort
	slot6 = slot4

	function slot7(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		slot2 = slot0
		slot2 = slot2.split
		slot3 = slot0
		slot4 = "[%d]+"
		slot2 = slot2(slot3, slot4)
		slot3 = slot0
		slot3 = slot3.split
		slot4 = slot1
		slot5 = "[%d]+"
		slot3 = slot3(slot4, slot5)
		slot4 = slot2[1]
		slot5 = slot3[1]
		--- END OF BLOCK #0 ---

		if slot4 ~= slot5 then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #5
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-22, warpins: 1 ---
		slot4 = tonumber
		slot5 = slot2[1]
		slot4 = slot4(slot5)
		slot5 = tonumber
		slot6 = slot3[1]
		slot5 = slot5(slot6)
		--- END OF BLOCK #1 ---

		if slot4 >= slot5 then
		JUMP TO BLOCK #2
		else
		JUMP TO BLOCK #3
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #2 23-24, warpins: 1 ---
		slot4 = false
		--- END OF BLOCK #2 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #3 25-25, warpins: 1 ---
		slot4 = true

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 26-26, warpins: 2 ---
		return slot4

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 27-34, warpins: 2 ---
		slot4 = tonumber
		slot5 = slot2[2]
		slot4 = slot4(slot5)
		slot5 = tonumber
		slot6 = slot3[2]
		slot5 = slot5(slot6)
		--- END OF BLOCK #5 ---

		if slot4 >= slot5 then
		JUMP TO BLOCK #6
		else
		JUMP TO BLOCK #7
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #6 35-36, warpins: 1 ---
		slot4 = false
		--- END OF BLOCK #6 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #8



		-- Decompilation error in this vicinity:
		--- BLOCK #7 37-37, warpins: 1 ---
		slot4 = true

		--- END OF BLOCK #7 ---

		FLOW; TARGET BLOCK #8



		-- Decompilation error in this vicinity:
		--- BLOCK #8 38-38, warpins: 2 ---
		return slot4
		--- END OF BLOCK #8 ---



	end

	slot5(slot6, slot7)

	slot5 = slot1
	slot5 = slot5.ReadMultiAttributes
	slot6 = slot4
	slot7 = slot0.nodeId
	slot8 = slot0.dEp
	slot9 = slot0.eEp

	return slot5(slot6, slot7, slot8, slot9)
	--- END OF BLOCK #17 ---



end

slot1[slot27] = slot28
slot27 = "WriteAndReadAttribute"

function slot28(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.WriteAttribute
	slot6 = {}
	slot6[slot0] = slot1
	slot7 = slot2
	slot8 = slot3
	slot9 = slot4
	slot5 = slot5(slot6, slot7, slot8, slot9)
	slot6 = nil
	slot7 = slot0
	slot7 = slot7.ReadAttribute
	slot8 = {}
	slot8[1] = slot0
	slot9 = slot2
	slot10 = slot3
	slot11 = slot4

	return slot5, slot6, slot7(slot8, slot9, slot10, slot11)
	--- END OF BLOCK #0 ---



end

slot1[slot27] = slot28
slot27 = "setWindowCoveringModes"

function slot28(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot4 = 0
	slot5 = slot0.motorDirection
	--- END OF BLOCK #0 ---

	if slot5 == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.error
	slot6 = "motorDirection is required."

	slot5(slot6)

	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-12, warpins: 1 ---
	slot5 = slot0.motorDirection
	--- END OF BLOCK #2 ---

	if slot5 == "reversed" then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 13-14, warpins: 1 ---
	slot4 = slot4 + 1
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #4 15-17, warpins: 1 ---
	slot5 = slot0.motorDirection
	--- END OF BLOCK #4 ---

	if slot5 ~= "normal" then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 18-24, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.error
	slot6 = "motorDirection must be string(\"normal\";\"reversed\") but \""
	slot7 = slot0.motorDirection
	slot8 = "\" provided."
	slot6 = slot6 .. slot7 .. slot8

	slot5(slot6)

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 25-27, warpins: 4 ---
	slot5 = slot0.motorRunMode
	--- END OF BLOCK #6 ---

	if slot5 == nil then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 28-32, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.error
	slot6 = "motorRunMode is required."

	slot5(slot6)

	--- END OF BLOCK #7 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #8 33-35, warpins: 1 ---
	slot5 = slot0.motorRunMode
	--- END OF BLOCK #8 ---

	if slot5 == "calibration" then
	JUMP TO BLOCK #9
	else
	JUMP TO BLOCK #10
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #9 36-37, warpins: 1 ---
	slot4 = slot4 + 2
	--- END OF BLOCK #9 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #10 38-40, warpins: 1 ---
	slot5 = slot0.motorRunMode
	--- END OF BLOCK #10 ---

	if slot5 ~= "normal" then
	JUMP TO BLOCK #11
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #11 41-47, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.error
	slot6 = "motorRunMode must be string(\"normal\";\"calibration\") but \""
	slot7 = slot0.motorRunMode
	slot8 = "\" provided."
	slot6 = slot6 .. slot7 .. slot8

	slot5(slot6)

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 48-50, warpins: 4 ---
	slot5 = slot0.motorRunningMode
	--- END OF BLOCK #12 ---

	if slot5 == nil then
	JUMP TO BLOCK #13
	else
	JUMP TO BLOCK #14
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #13 51-55, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.error
	slot6 = "motorRunningMode is required."

	slot5(slot6)

	--- END OF BLOCK #13 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #14 56-58, warpins: 1 ---
	slot5 = slot0.motorRunningMode
	--- END OF BLOCK #14 ---

	if slot5 == "maintenance" then
	JUMP TO BLOCK #15
	else
	JUMP TO BLOCK #16
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #15 59-60, warpins: 1 ---
	slot4 = slot4 + 4
	--- END OF BLOCK #15 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #16 61-63, warpins: 1 ---
	slot5 = slot0.motorRunningMode
	--- END OF BLOCK #16 ---

	if slot5 ~= "normal" then
	JUMP TO BLOCK #17
	else
	JUMP TO BLOCK #18
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #17 64-70, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.error
	slot6 = "motorRunningMode must be string(\"normal\";\"maintenance\") but \""
	slot7 = slot0.motorRunningMode
	slot8 = "\" provided."
	slot6 = slot6 .. slot7 .. slot8

	slot5(slot6)

	--- END OF BLOCK #17 ---

	FLOW; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #18 71-73, warpins: 4 ---
	slot5 = slot0.motorLedFeedback
	--- END OF BLOCK #18 ---

	if slot5 == nil then
	JUMP TO BLOCK #19
	else
	JUMP TO BLOCK #20
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #19 74-78, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.error
	slot6 = "motorLedFeedback is required."

	slot5(slot6)

	--- END OF BLOCK #19 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #24



	-- Decompilation error in this vicinity:
	--- BLOCK #20 79-81, warpins: 1 ---
	slot5 = slot0.motorLedFeedback
	--- END OF BLOCK #20 ---

	if slot5 == "enable" then
	JUMP TO BLOCK #21
	else
	JUMP TO BLOCK #22
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #21 82-83, warpins: 1 ---
	slot4 = slot4 + 8
	--- END OF BLOCK #21 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #24



	-- Decompilation error in this vicinity:
	--- BLOCK #22 84-86, warpins: 1 ---
	slot5 = slot0.motorLedFeedback
	--- END OF BLOCK #22 ---

	if slot5 ~= "disable" then
	JUMP TO BLOCK #23
	else
	JUMP TO BLOCK #24
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #23 87-93, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.error
	slot6 = "motorLedFeedback must be string(\"enable\";\"disable\") but \""
	slot7 = slot0.motorLedFeedback
	slot8 = "\" provided."
	slot6 = slot6 .. slot7 .. slot8

	slot5(slot6)

	--- END OF BLOCK #23 ---

	FLOW; TARGET BLOCK #24



	-- Decompilation error in this vicinity:
	--- BLOCK #24 94-124, warpins: 4 ---
	slot5 = slot0
	slot5 = slot5.WriteAttribute
	slot6 = {}
	slot7 = slot0
	slot7 = slot7.Attribute
	slot7 = slot7.WindowCovering
	slot7 = slot7.ModeCoordinates
	slot6[slot7] = slot4
	slot7 = slot1
	slot8 = slot2
	slot9 = slot3
	slot5 = slot5(slot6, slot7, slot8, slot9)
	slot6 = nil
	slot7 = slot0
	slot7 = slot7.ReadAttribute
	slot8 = {}
	slot9 = slot0
	slot9 = slot9.Attribute
	slot9 = slot9.WindowCovering
	slot9 = slot9.ModeCoordinates
	slot8[1] = slot9
	slot9 = slot0
	slot9 = slot9.Attribute
	slot9 = slot9.WindowCovering
	slot9 = slot9.ConfigStatusCoordinates
	slot8[2] = slot9
	slot9 = slot1
	slot10 = slot2
	slot11 = slot3

	return slot5, slot6, slot7(slot8, slot9, slot10, slot11)
	--- END OF BLOCK #24 ---



end

slot1[slot27] = slot28
slot27 = "toZigbeeRawDataTime"

function slot28(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = os
	slot1 = slot1.time
	slot2 = {
		hour = 0,
		month = 1,
		year = 2000,
		sec = 0,
		day = 1
	}
	slot1 = slot1(slot2)
	slot2 = slot0.second
	--- END OF BLOCK #0 ---

	if slot2 ~= nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-12, warpins: 1 ---
	slot2 = type
	slot3 = slot0.second
	slot2 = slot2(slot3)
	--- END OF BLOCK #1 ---

	if slot2 == "number" then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 13-16, warpins: 1 ---
	slot2 = slot0.second
	slot3 = 0
	--- END OF BLOCK #2 ---

	if slot2 >= slot3 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 17-20, warpins: 1 ---
	slot2 = slot0.second
	slot3 = 59
	--- END OF BLOCK #3 ---

	if slot2 > slot3 then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 21-23, warpins: 4 ---
	slot2 = error
	slot3 = "Invalid or missing field second"

	slot2(slot3)

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 24-26, warpins: 2 ---
	slot2 = slot0.minute
	--- END OF BLOCK #5 ---

	if slot2 ~= nil then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #9
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 27-31, warpins: 1 ---
	slot2 = type
	slot3 = slot0.minute
	slot2 = slot2(slot3)
	--- END OF BLOCK #6 ---

	if slot2 == "number" then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #9
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 32-35, warpins: 1 ---
	slot2 = slot0.minute
	slot3 = 0
	--- END OF BLOCK #7 ---

	if slot2 >= slot3 then
	JUMP TO BLOCK #8
	else
	JUMP TO BLOCK #9
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #8 36-39, warpins: 1 ---
	slot2 = slot0.minute
	slot3 = 59
	--- END OF BLOCK #8 ---

	if slot2 > slot3 then
	JUMP TO BLOCK #9
	else
	JUMP TO BLOCK #10
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #9 40-42, warpins: 4 ---
	slot2 = error
	slot3 = "Invalid or missing field minute"

	slot2(slot3)

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 43-45, warpins: 2 ---
	slot2 = slot0.hour
	--- END OF BLOCK #10 ---

	if slot2 ~= nil then
	JUMP TO BLOCK #11
	else
	JUMP TO BLOCK #14
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #11 46-50, warpins: 1 ---
	slot2 = type
	slot3 = slot0.hour
	slot2 = slot2(slot3)
	--- END OF BLOCK #11 ---

	if slot2 == "number" then
	JUMP TO BLOCK #12
	else
	JUMP TO BLOCK #14
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #12 51-54, warpins: 1 ---
	slot2 = slot0.hour
	slot3 = 0
	--- END OF BLOCK #12 ---

	if slot2 >= slot3 then
	JUMP TO BLOCK #13
	else
	JUMP TO BLOCK #14
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #13 55-58, warpins: 1 ---
	slot2 = slot0.hour
	slot3 = 23
	--- END OF BLOCK #13 ---

	if slot2 > slot3 then
	JUMP TO BLOCK #14
	else
	JUMP TO BLOCK #15
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #14 59-61, warpins: 4 ---
	slot2 = error
	slot3 = "Invalid or missing field hour"

	slot2(slot3)

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 62-64, warpins: 2 ---
	slot2 = slot0.day
	--- END OF BLOCK #15 ---

	if slot2 ~= nil then
	JUMP TO BLOCK #16
	else
	JUMP TO BLOCK #19
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #16 65-69, warpins: 1 ---
	slot2 = type
	slot3 = slot0.day
	slot2 = slot2(slot3)
	--- END OF BLOCK #16 ---

	if slot2 == "number" then
	JUMP TO BLOCK #17
	else
	JUMP TO BLOCK #19
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #17 70-73, warpins: 1 ---
	slot2 = slot0.day
	slot3 = 1
	--- END OF BLOCK #17 ---

	if slot2 >= slot3 then
	JUMP TO BLOCK #18
	else
	JUMP TO BLOCK #19
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #18 74-77, warpins: 1 ---
	slot2 = slot0.day
	slot3 = 31
	--- END OF BLOCK #18 ---

	if slot2 > slot3 then
	JUMP TO BLOCK #19
	else
	JUMP TO BLOCK #20
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #19 78-80, warpins: 4 ---
	slot2 = error
	slot3 = "Invalid or missing field day"

	slot2(slot3)

	--- END OF BLOCK #19 ---

	FLOW; TARGET BLOCK #20



	-- Decompilation error in this vicinity:
	--- BLOCK #20 81-83, warpins: 2 ---
	slot2 = slot0.month
	--- END OF BLOCK #20 ---

	if slot2 ~= nil then
	JUMP TO BLOCK #21
	else
	JUMP TO BLOCK #24
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #21 84-88, warpins: 1 ---
	slot2 = type
	slot3 = slot0.month
	slot2 = slot2(slot3)
	--- END OF BLOCK #21 ---

	if slot2 == "number" then
	JUMP TO BLOCK #22
	else
	JUMP TO BLOCK #24
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #22 89-92, warpins: 1 ---
	slot2 = slot0.month
	slot3 = 1
	--- END OF BLOCK #22 ---

	if slot2 >= slot3 then
	JUMP TO BLOCK #23
	else
	JUMP TO BLOCK #24
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #23 93-96, warpins: 1 ---
	slot2 = slot0.month
	slot3 = 12
	--- END OF BLOCK #23 ---

	if slot2 > slot3 then
	JUMP TO BLOCK #24
	else
	JUMP TO BLOCK #25
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #24 97-99, warpins: 4 ---
	slot2 = error
	slot3 = "Invalid or missing field month"

	slot2(slot3)

	--- END OF BLOCK #24 ---

	FLOW; TARGET BLOCK #25



	-- Decompilation error in this vicinity:
	--- BLOCK #25 100-102, warpins: 2 ---
	slot2 = slot0.year
	--- END OF BLOCK #25 ---

	if slot2 ~= nil then
	JUMP TO BLOCK #26
	else
	JUMP TO BLOCK #28
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #26 103-107, warpins: 1 ---
	slot2 = type
	slot3 = slot0.year
	slot2 = slot2(slot3)
	--- END OF BLOCK #26 ---

	if slot2 == "number" then
	JUMP TO BLOCK #27
	else
	JUMP TO BLOCK #28
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #27 108-111, warpins: 1 ---
	slot2 = slot0.year
	slot3 = 2018
	--- END OF BLOCK #27 ---

	if slot2 < slot3 then
	JUMP TO BLOCK #28
	else
	JUMP TO BLOCK #29
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #28 112-114, warpins: 3 ---
	slot2 = error
	slot3 = "Invalid or missing field year"

	slot2(slot3)

	--- END OF BLOCK #28 ---

	FLOW; TARGET BLOCK #29



	-- Decompilation error in this vicinity:
	--- BLOCK #29 115-132, warpins: 2 ---
	slot2 = os
	slot2 = slot2.time
	slot3 = {}
	slot4 = slot0.year
	slot3.year = slot4
	slot4 = slot0.month
	slot3.month = slot4
	slot4 = slot0.day
	slot3.day = slot4
	slot4 = slot0.hour
	slot3.hour = slot4
	slot4 = slot0.minute
	slot3.minute = slot4
	slot4 = slot0.second
	slot3.sec = slot4
	slot2 = slot2(slot3)
	slot3 = slot2 - slot1

	return slot3
	--- END OF BLOCK #29 ---



end

slot1[slot27] = slot28
slot27 = "Group"
slot27 = slot1[slot27]
slot28 = "isDeviceSupported"

function slot29(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot4 = slot0
	slot4 = slot4.containedInTable
	slot5 = slot0
	slot6 = slot2
	slot4 = slot4(slot5, slot6)
	--- END OF BLOCK #0 ---

	slot4 = if not slot4 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-10, warpins: 1 ---
	slot4 = false
	slot5 = "All of the input clusters of the group are not supported by the device"

	return slot4, slot5

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-17, warpins: 2 ---
	slot4 = slot0
	slot4 = slot4.containedInTable
	slot5 = slot1
	slot6 = slot3
	slot4 = slot4(slot5, slot6)
	--- END OF BLOCK #2 ---

	slot4 = if not slot4 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 18-20, warpins: 1 ---
	slot4 = false
	slot5 = "All of the commands of the group are not supported by the device"

	return slot4, slot5

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 21-22, warpins: 2 ---
	slot4 = true

	return slot4
	--- END OF BLOCK #4 ---



end

slot27[slot28] = slot29
slot27 = "containedInTable"

function slot28(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot2 = ipairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)
	--- END OF BLOCK #0 ---

	for slot5, slot6 in slot2, slot3, slot4
	LOOP BLOCK #1
	GO OUT TO BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 1 ---
	slot7 = false
	slot8 = ipairs
	slot9 = slot1
	slot8, slot9, slot10 = slot8(slot9)
	--- END OF BLOCK #1 ---

	for slot11, slot12 in slot8, slot9, slot10
	LOOP BLOCK #2
	GO OUT TO BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-11, warpins: 1 ---
	--- END OF BLOCK #2 ---

	if slot6 == slot12 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 12-13, warpins: 1 ---
	slot7 = true
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #4 14-15, warpins: 2 ---
	--- END OF BLOCK #4 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #5 16-17, warpins: 2 ---
	--- END OF BLOCK #5 ---

	slot7 = if not slot7 then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 18-19, warpins: 1 ---
	slot8 = false

	return slot8

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 20-21, warpins: 3 ---
	--- END OF BLOCK #7 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #0



	-- Decompilation error in this vicinity:
	--- BLOCK #8 22-23, warpins: 1 ---
	slot2 = true

	return slot2
	--- END OF BLOCK #8 ---



end

slot1[slot27] = slot28

return slot1
