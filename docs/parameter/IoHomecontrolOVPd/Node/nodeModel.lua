local bit = require("bit")
local nodeModel = {
	event = {
		CREATED                      = 0,
		UPDATED                      = 1,
		DELETED                      = 2,
		COMPLETED                    = 3,
		STACK_MASTER_KEY_CHANGED     = 4,
		STACK_MASTER_OLD_KEY_CHANGED = 5
	},
	nodeGenericEvent = {
		CREATED = "CREATED",
		UPDATED = "UPDATED",
		DELETED = "DELETED"
	},
	action = {
		CREATE           = 0,
		COMPLETE         = 1,
		UPDATE           = 2,
		UPDATE_STATUS    = 3,
		UPDATE_GEN_INFO  = 4,
		UPDATE_KEY       = 5,
		DELETE           = 6,
		UPDATE_OR_CREATE = 7,
	},
	status = {
		Done                         = 1,
		Intermediate_Paired          = 2,
		Intermediate_Discovered      = 3,
		Intermediate_Discover        = 4,
		Destroyed                    = 5,
		Intermediate_GeneralInfo1Got = 6,
		Intermediate_GeneralInfo2Got = 7,
		Existing                     = 8,
		Intermediate_Unpaired        = 9,
		Unavailable                  = 10,
		Partial                      = 11,
		Unpaired                     = 12,
	}
}

function nodeModel.isIntermediateNodeStatus(status)
	return
    status == nodeModel.status.Intermediate_Discover        or
    status == nodeModel.status.Intermediate_Discovered      or
    status == nodeModel.status.Intermediate_Paired          or
    status == nodeModel.status.Intermediate_Unpaired        or
    status == nodeModel.status.Intermediate_GeneralInfo1Got or
    status == nodeModel.status.Intermediate_GeneralInfo2Got
end
function nodeModel.isAvailable(arg_2_0, node) return node.status ~= nodeModel.status.Unavailable end

nodeModel.profile = {
	1    = INTERIOR_VENETIAN_BLIND,
	2    = ROLLING_SHUTTER,
	2    = TEMPERATURE_INSIDE_SENSOR,
	3    = TEMPERATURE_OUTSIDE_SENSOR,
	3    = VERTICAL_EXTERIOR_AWNING,
	4    = WINDOW_OPENER,
	5    = GARAGE_DOOR_OPENER,
	5    = PRESSURE_SENSOR,
	6    = LIGHT,
	7    = GATE_OPENER,
	8    = ROLLING_DOOR_OPENER,
	9    = DOOR_LOCK,
	10   = INTERIOR_VERTICAL_BLIND,
	11   = LIGHT_OUTSIDE_SENSOR,
	11   = SCD,
	12   = BEACON,
	12   = CUMULATED_GAS,
	13   = DUAL_ROLLING_SHUTTER
	13   = WATER_CONSUMPTION_SENSOR,
	14   = TEMPERATURE_CONTROL_INTERFACE,
	14   = THERMAL_CONSUMPTION_SENSOR,
	15   = ELECTRIC_CONSUMPTION_SENSOR,
	15   = ON_OFF_SWITCH,
	16   = HORIZONTAL_AWNING,
	17   = EXTERIOR_VENETIAN_BLIND,
	18   = LOUVRE_BLIND,
	19   = CURTAIN_TRACK,
	20   = VENTILATION_POINT,
	21   = EXTERIOR_HEATING,
	22   = HEAT_PUMP,
	23   = INTRUSION_ALARM_SYSTEM,
	24   = SWINGING_SHUTTER,
	27   = SLIDING_WINDOW,
	28   = ZONE_CONTROL_GENERATOR,
	29   = BIOCLIMATIC_PERGOLA,
	30   = INDOOR_SIREN,
	51   = DOMESTIC_HOT_WATER,
	52   = ELECTRICAL_HEATER,
	53   = HEAT_RECOVERY_VENTILATION,
	128  = SMOKE_SENSOR,
	133  = OPENING_DETECTOR,
	134  = MOTION_SENSOR,
	254  = MULTITYPE_SENSOR,
	255  = CENTRAL_HOUSE_CONTROL,
	1008 = TEST_AND_EVALUATION,
	1023 = REMOTE_CONTROLLER,
}
nodeModel.systemLink = {
	Unknown                = -1,
	ActuatorControllerLink = 0,
	CoexistenceIdLink      = 1
}
nodeModel.type = { STACK_MASTER = 0xFFC4 }
nodeModel.class = {
	ACTUATOR   = 0,
	SENSOR     = 1
	STACK      = 2,
	SLAVE      = 3,
	MASTER     = 4,
	BEACON     = 5,
	CONTROLLER = 6,
}
nodeModel.manufacturers = {
	Somfy    = 2,
	Overkiz  = 11
	Atlantic = 12,
}
nodeModel.profileShift          = 6
nodeModel.subProfileMask        = 0x3F
nodeModel.unusedBackboneAddress = 0
nodeModel.keySize               = 16
nodeModel.stackAddressRange = {
	Low  = 0x010000,
	High = 0xFFFFFF
}

function nodeModel.getProfile(node)    return bit.rshift(node.type, nodeModel.profileShift = 0x06) end
function nodeModel.getSubProfile(node) return bit.band(node.type, nodeModel.subProfileMask = 0x3F) end
function nodeModel.isValid(arg_5_0, node)
	if node.address ~= nil and node.address >= 0x010000 and node.address <= 0xFFFFFF then return true end
	return false
end



nodeModel.sensors = {
	Mask = {
		LPM                  = 2,
		GeneralOperatingMode = 3,
		EventDriven          = 32,
	},
	OperatingMode = {
		["3SomOr2SomNormalAsleep"] = 0,
		Normal                     = 1
		Lpm                        = 2,
		["2SomLpmAsleep"]          = 3,
	},
	ListeningStatusMask = {
		CurrentListening     = 1,
		OnNextEventListening = 2,
	}
}
function nodeModel.sensors.getGeneralOperatingMode(sensor) return sensor.operatingMode and bit.band(sensor.operatingMode, nodeModel.sensors.Mask.GeneralOperatingMode) end
function nodeModel.sensors.isEventDriven(sensor)           return sensor.operatingMode and bit.band(sensor.operatingMode, nodeModel.sensors.Mask.EventDriven) ~= 0 end
function nodeModel.sensors.isLPM(sensor)                   return sensor.operatingMode and bit.band(sensor.operatingMode, nodeModel.sensors.Mask.LPM) ~= 0 end
function nodeModel.sensors.isListening(sensor)             return sensor.listeningStatus and bit.band(sensor.listeningStatus, nodeModel.sensors.ListeningStatusMask.CurrentListening) ~= 0 end
function nodeModel.sensors.isReachableOnlyOnEvent(OperatingMode)
	local  OperatingMode  = nodeModel.sensors.getGeneralOperatingMode(OperatingMode)
	return OperatingMode == nodeModel.sensors.OperatingMode["3SomOr2SomNormalAsleep"] or OperatingMode == nodeModel.sensors.OperatingMode["2SomLpmAsleep"]
end

return nodeModel
