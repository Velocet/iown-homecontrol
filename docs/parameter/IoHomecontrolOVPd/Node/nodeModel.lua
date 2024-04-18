local var_0_0 = require("bit")
local var_0_1 = {
	event = {
		CREATED = 0,
		STACK_MASTER_KEY_CHANGED = 4,
		DELETED = 2,
		COMPLETED = 3,
		UPDATED = 1,
		STACK_MASTER_OLD_KEY_CHANGED = 5
	},
	nodeGenericEvent = {
		CREATED = "CREATED",
		UPDATED = "UPDATED",
		DELETED = "DELETED"
	},
	action = {
		UPDATE = 2,
		UPDATE_STATUS = 3,
		CREATE = 0,
		COMPLETE = 1,
		UPDATE_GEN_INFO = 4,
		DELETE = 6,
		UPDATE_OR_CREATE = 7,
		UPDATE_KEY = 5
	},
	status = {
		Intermediate_Unpaired = 9,
		Intermediate_Discover = 4,
		Unavailable = 10,
		Intermediate_GeneralInfo2Got = 7,
		Done = 1,
		Intermediate_Discovered = 3,
		Partial = 11,
		Unpaired = 12,
		Existing = 8,
		Destroyed = 5,
		Intermediate_Paired = 2,
		Intermediate_GeneralInfo1Got = 6
	}
}

function var_0_1.isIntermediateNodeStatus(arg_1_0)
	return arg_1_0 == var_0_1.status.Intermediate_Discover or arg_1_0 == var_0_1.status.Intermediate_Discovered or arg_1_0 == var_0_1.status.Intermediate_Paired or arg_1_0 == var_0_1.status.Intermediate_Unpaired or arg_1_0 == var_0_1.status.Intermediate_GeneralInfo1Got or arg_1_0 == var_0_1.status.Intermediate_GeneralInfo2Got
end

function var_0_1.isAvailable(arg_2_0, arg_2_1)
	return arg_2_1.status ~= var_0_1.status.Unavailable
end

var_0_1.profile = {
	GATE_OPENER = 7,
	SCD = 11,
	LOUVRE_BLIND = 18,
	ROLLING_SHUTTER = 2,
	TEST_AND_EVALUATION = 1008,
	BEACON = 12,
	EXTERIOR_HEATING = 21,
	ON_OFF_SWITCH = 15,
	WATER_CONSUMPTION_SENSOR = 13,
	TEMPERATURE_OUTSIDE_SENSOR = 3,
	PRESSURE_SENSOR = 5,
	HEAT_PUMP = 22,
	LIGHT_OUTSIDE_SENSOR = 11,
	TEMPERATURE_INSIDE_SENSOR = 2,
	ROLLING_DOOR_OPENER = 8,
	THERMAL_CONSUMPTION_SENSOR = 14,
	VENTILATION_POINT = 20,
	ELECTRICAL_HEATER = 52,
	ELECTRIC_CONSUMPTION_SENSOR = 15,
	SMOKE_SENSOR = 128,
	ZONE_CONTROL_GENERATOR = 28,
	EXTERIOR_VENETIAN_BLIND = 17,
	MOTION_SENSOR = 134,
	BIOCLIMATIC_PERGOLA = 29,
	CENTRAL_HOUSE_CONTROL = 255,
	INDOOR_SIREN = 30,
	LIGHT = 6,
	REMOTE_CONTROLLER = 1023,
	HEAT_RECOVERY_VENTILATION = 53,
	INTERIOR_VENETIAN_BLIND = 1,
	WINDOW_OPENER = 4,
	MULTITYPE_SENSOR = 254,
	CURTAIN_TRACK = 19,
	VERTICAL_EXTERIOR_AWNING = 3,
	HORIZONTAL_AWNING = 16,
	TEMPERATURE_CONTROL_INTERFACE = 14,
	CUMULATED_GAS = 12,
	INTERIOR_VERTICAL_BLIND = 10,
	SWINGING_SHUTTER = 24,
	SLIDING_WINDOW = 27,
	INTRUSION_ALARM_SYSTEM = 23,
	DOMESTIC_HOT_WATER = 51,
	DOOR_LOCK = 9,
	GARAGE_DOOR_OPENER = 5,
	OPENING_DETECTOR = 133,
	DUAL_ROLLING_SHUTTER = 13
}
var_0_1.systemLink = {
	ActuatorControllerLink = 0,
	Unknown = -1,
	CoexistenceIdLink = 1
}
var_0_1.type = {
	STACK_MASTER = 65476
}
var_0_1.class = {
	MASTER = 4,
	BEACON = 5,
	CONTROLLER = 6,
	STACK = 2,
	ACTUATOR = 0,
	SLAVE = 3,
	SENSOR = 1
}
var_0_1.manufacturers = {
	Atlantic = 12,
	Somfy = 2,
	Overkiz = 11
}
var_0_1.profileShift = 6
var_0_1.subProfileMask = 63
var_0_1.unusedBackboneAddress = 0
var_0_1.keySize = 16
var_0_1.stackAddressRange = {
	Low = 65536,
	High = 16777215
}

function var_0_1.getProfile(arg_3_0)
	return var_0_0.rshift(arg_3_0.type, var_0_1.profileShift)
end

function var_0_1.getSubProfile(arg_4_0)
	return var_0_0.band(arg_4_0.type, var_0_1.subProfileMask)
end

function var_0_1.isValid(arg_5_0, arg_5_1)
	if arg_5_1.address ~= nil and arg_5_1.address >= 65536 and arg_5_1.address <= 16777215 then
		return true
	end

	return false
end

var_0_1.sensors = {
	Mask = {
		EventDriven = 32,
		LPM = 2,
		GeneralOperatingMode = 3
	},
	OperatingMode = {
		["2SomLpmAsleep"] = 3,
		["3SomOr2SomNormalAsleep"] = 0,
		Lpm = 2,
		Normal = 1
	},
	ListeningStatusMask = {
		OnNextEventListening = 2,
		CurrentListening = 1
	}
}

function var_0_1.sensors.isEventDriven(arg_6_0)
	return arg_6_0.operatingMode and var_0_0.band(arg_6_0.operatingMode, var_0_1.sensors.Mask.EventDriven) ~= 0
end

function var_0_1.sensors.isLPM(arg_7_0)
	return arg_7_0.operatingMode and var_0_0.band(arg_7_0.operatingMode, var_0_1.sensors.Mask.LPM) ~= 0
end

function var_0_1.sensors.getGeneralOperatingMode(arg_8_0)
	return arg_8_0.operatingMode and var_0_0.band(arg_8_0.operatingMode, var_0_1.sensors.Mask.GeneralOperatingMode)
end

function var_0_1.sensors.isReachableOnlyOnEvent(arg_9_0)
	local var_9_0 = var_0_1.sensors.getGeneralOperatingMode(arg_9_0)

	return var_9_0 == var_0_1.sensors.OperatingMode["3SomOr2SomNormalAsleep"] or var_9_0 == var_0_1.sensors.OperatingMode["2SomLpmAsleep"]
end

function var_0_1.sensors.isListening(arg_10_0)
	return arg_10_0.listeningStatus and var_0_0.band(arg_10_0.listeningStatus, var_0_1.sensors.ListeningStatusMask.CurrentListening) ~= 0
end

return var_0_1
