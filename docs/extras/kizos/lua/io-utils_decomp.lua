slot0 = depends("BinaryUtils")
slot1 = depends("common", "utils")
slot2 = {
	extendedInformationType = {}
}
slot2.extendedInformationType.CURRENT_USING_A_RELATIVE_VALUE = 1
slot2.extendedInformationType.CURRENT_USING_DISCRETE_VALUE = 16
slot2.value = {
	TARGET = 53504,
	CURRENT = 53760,
	DEFAULT = 54016,
	IGNORE = 54272
}
slot2.priority = {
	LOWEST = 0,
	VERYLOW = 256,
	LOW = 4096,
	MEDIUM = 65536,
	HIGH = 1048576,
	VERYHIGH = 16777216,
	HIGHEST = 4294967295.0
}
slot2.nodeStatus = {
	DONE = 1,
	EXISTING = 8,
	UNAVAILABLE = 10,
	UNPAIRED = 12
}
slot2.nodeClass = {
	ACTUATOR = 0,
	SENSOR = 1
}

function slot2.fromRawName(slot0)
	if slot0 == nil or #slot0 == 0 then
		return ""
	end

	if #slot0 > 2 and slot0[1] == 0 and slot0[2] ~= 0 then
		slot0 = slot0:sub(2, #slot0)
	end

	for slot4 = 1, #slot0 do
		if slot0[slot4] == 0 then
			slot0 = slot0:sub(1, slot4 - 1)

			break
		end
	end

	return uv0.rawTrim(slot0):tostring("iso-8859-1")
end

function slot2.toRawName(slot0)
	if #bytearray(slot0, "iso-8859-1") > 16 then
		slot1 = slot1:sub(1, 16)
	end

	uv0.filterIso8859Dash1InvalidChars(slot1)

	if #slot1 < 16 then
		slot1 = slot1:append(bytearray(16 - #slot1))
	end

	return slot1
end

function slot2.getSoftwareVersionFromRawGeneralInfo(slot0)
	if slot0 == nil or #slot0 < 10 then
		return nil
	end

	if #uv0.removeTrailingValues(slot0:sub(1, 10), 0) == 0 then
		return nil
	end

	slot3 = true

	for slot7 = 1, #slot2 do
		if slot2[slot7] < 32 or slot2[slot7] >= 127 then
			slot3 = false

			break
		end
	end

	if slot3 then
		return uv0.rawTrim(slot2):tostring("iso-8859-1")
	else
		return slot1:tostring("hex")
	end
end

function slot2.fromRawStatusState(slot0)
	if slot0 == uv0.nodeStatus.DONE or slot0 == uv0.nodeStatus.EXISTING or slot0 == uv0.nodeStatus.UNPAIRED then
		return "available"
	else
		return "unavailable"
	end
end

function slot2.createActivateFunc(slot0, slot1)
	if slot0 == nil then
		slot0 = uv0.value.IGNORE
	end

	if slot1 == nil then
		return bytearray({
			bit.rshift(bit.band(slot0, 65280), 8),
			bit.band(slot0, 255),
			0,
			0
		})
	else
		slot3 = 0

		for slot7 = 1, #slot1 do
			if slot1[slot7][1] <= 8 then
				slot2 = bit.bor(0, bit.lshift(1, 8 - slot8[1]))
			else
				slot3 = bit.bor(slot3, bit.lshift(1, 8 - (slot8[1] - 8)))
			end
		end

		slot4 = bytearray(4 + #slot1 * 2)
		slot4[1] = bit.rshift(bit.band(slot0, 65280), 8)
		slot4[2] = bit.band(slot0, 255)
		slot4[3] = slot2
		slot5 = 4

		for slot9 = 1, #slot1 do
			if slot1[slot9][1] <= 8 then
				if slot10[2] == nil or type(slot10[2]) ~= "number" then
					error("Bad conversion : trying to write invalid value '" .. tostring(slot10[2]) .. "' on FP" .. slot10[1])
				end

				slot4[slot5] = bit.rshift(bit.band(slot10[2], 65280), 8)
				slot5 = slot5 + 1
				slot4[slot5] = bit.band(slot10[2], 255)
				slot5 = slot5 + 1
			end
		end

		slot4[slot5] = slot3
		slot5 = slot5 + 1

		for slot9 = 1, #slot1 do
			if slot1[slot9][1] > 8 then
				if slot10[2] == nil or type(slot10[2]) ~= "number" then
					error("Bad conversion : trying to write invalid value '" .. tostring(slot10[2]) .. "' on FP" .. slot10[1])
				end

				slot4[slot5] = bit.rshift(bit.band(slot10[2], 65280), 8)
				slot5 = slot5 + 1
				slot4[slot5] = bit.band(slot10[2], 255)
				slot5 = slot5 + 1
			end
		end

		return slot4
	end
end

function slot2.readActivateFunc(slot0)
	if slot0 == nil then
		slot0 = {}
	end

	slot1 = 0
	slot2 = {}
	slot3 = 0
	slot4 = {}

	if #slot0 > 0 then
		for slot8 = 1, #slot0 do
			if slot0[slot8] <= 8 then
				slot1 = bit.bor(slot1, bit.lshift(1, 8 - slot9))
				slot2[#slot2 + 1] = 1
			else
				slot3 = bit.bor(slot3, bit.lshift(1, 8 - (slot9 - 8)))
				slot4[#slot4 + 1] = 1
			end
		end
	end

	if #slot2 > 0 then
		slot5 = bytearray({
			slot1
		}):append(bytearray(slot2))
	end

	if #slot4 > 0 then
		slot5 = slot5:append(bytearray({
			slot3
		})):append(bytearray(slot4))
	end

	return slot5
end

slot2.standardReceiver = {
	switchActivationMode = 0,
	temporizedOnModeParameter = 0
}

function slot2.createActivateMode(slot0, slot1)
	uv0.assertByteValue(slot0, "modeNumber")
	uv0.assertByteValue(slot1, "modeParameter")

	return bytearray({
		slot0,
		slot1,
		0
	})
end

slot2.winkStateDisabled = 0
slot2.winkStateEnabled = 1
slot2.winkTimeManufacturerSpecific = 254
slot2.winkTimeForever = 255

function slot2.createWinkValue(slot0, slot1)
	slot2 = bytearray(2)

	if slot0 == nil or type(slot0) ~= "boolean" then
		error("Invalid wink state " .. tostring(slot0))
	elseif slot0 then
		slot2[1] = uv0.winkStateEnabled
	else
		slot2[1] = uv0.winkStateDisabled
	end

	if slot1 ~= nil then
		if type(slot1) == "number" then
			if slot1 < 1 or slot1 > 254 then
				error("Invalid wink time " .. tostring(slot1) .. ", should be a number of seconds between 1 and 254 or one of particular values : 'manufacturerSpecific', 'forever'")
			else
				slot2[2] = slot1 - 1
			end
		elseif type(slot1) == "string" then
			if slot1 == "forever" then
				slot2[2] = uv0.winkTimeForever
			elseif slot1 == "manufacturerSpecific" then
				slot2[2] = uv0.winkTimeManufacturerSpecific
			else
				error("Invalid wink time " .. tostring(slot1) .. ", should be a number of seconds between 1 and 254 or one of particular values : manufacturerSpecific, forever")
			end
		end
	else
		slot2[2] = 0
	end

	return slot2
end

slot2.sensedUnit = {
	[0] = "core:AbsoluteValue",
	"core:LengthInMeter",
	"core:LinearSpeedInMeterPerSecond",
	"core:AngleInDegrees",
	"core:AngularSpeedInDegreesPerSecond",
	"core:RelativeValueInPercentage",
	"core:ElectricCurrentInAmpere",
	"core:TemperatureInKelvin",
	"core:ElectricalEnergyInWh",
	"core:FlowInLitrePerSecond",
	"core:GradientInPercentagePerSecond",
	"core:TimeInSecond",
	"core:VectorCoordinate",
	"core:LuminanceInLux",
	"core:PressureInHpa",
	"core:ElectricalPowerInW",
	"core:PowerPerSquareMeter",
	"core:VolumeInCubicMeter"
}
slot2.energyTypes = {
	[0] = "Unknown",
	"Electricity",
	"Gas",
	"Oil",
	"Water",
	"Thermal Energy"
}
slot2.scaleFactors = {
	[0] = 1,
	10,
	100,
	1000,
	10000,
	100000,
	1000000,
	10000000,
	[253.0] = 0.001,
	[252.0] = 0.0001,
	[254.0] = 0.01,
	[251.0] = 1e-05,
	[255.0] = 0.1,
	[250.0] = 1e-06,
	[249.0] = 1e-07
}

function slot2.fromRawTemperatureValue(slot0, slot1, slot2)
	if slot0 == nil or slot1 == nil or slot2 == nil then
		return nil
	end

	if slot0 >= 0 and slot0 <= 51200 then
		return uv0.round((slot0 * (slot2 - slot1) / 51200 + slot1) / 100 - 273.15, 1)
	else
		return nil
	end
end

function slot2.toRawTemperatureValue(slot0, slot1, slot2)
	if slot0 == nil then
		return nil
	end

	if slot1 == nil or slot2 == nil then
		error("Missing lower and/or upper temperature bounds states")
	end

	return uv0.round(((slot0 + 273.15) * 100 - slot1) * 51200 / (slot2 - slot1), 0)
end

function slot2.extractNumericFPPart(slot0, slot1, slot2)
	if slot0 == nil then
		return nil
	end

	slot3 = bytearray(2)

	slot3:writeUInt16(1, slot0)

	return uv0.extractBitRange(slot3, slot1, slot2)
end

function slot2.getSOFOPUValue(slot0, slot1)
	if slot0 == nil or type(slot0) ~= "userdata" then
		return nil
	end

	if slot1 > 127 then
		error("this function is not able to read parameter after index 127, use io-somfy-utils.getParamValue instead")
	end

	slot2 = 1
	slot3 = 1

	while slot2 + 2 <= #slot0 do
		slot3 = slot0[slot2 + 1] + 1

		if slot0[slot2] == slot1 then
			slot4 = bytearray(slot3)
			slot5 = 1

			while slot3 >= slot5 do
				slot4[slot5] = slot0[slot2 + 1 + slot5]
				slot5 = slot5 + 1
			end

			if #slot4 == 1 then
				return slot4:readInt8(1)
			elseif #slot4 == 2 then
				return slot4:readInt16(1)
			else
				return slot4
			end
		end

		slot2 = slot2 + 2 + slot3
	end

	return nil
end

function slot2.getRefreshMethod(slot0)
	return bytearray({
		slot0
	})
end

slot2.daughterboard = {
	hardwareVersion = {}
}
slot2.daughterboard.hardwareVersion.AVR32UC3B = 1
slot2.daughterboard.hardwareVersion.STM32F1xx = 2
slot2.daughterboard.hardwareVersion.toStr = {
	[slot2.daughterboard.hardwareVersion.AVR32UC3B] = "AVR32UC3B",
	[slot2.daughterboard.hardwareVersion.STM32F1xx] = "STM32F1xx"
}
slot2.daughterboard.resetCauses = {
	AVR32UC3B = {}
}
slot2.daughterboard.resetCauses.AVR32UC3B[1] = "Cpu Err-Illegal Error"
slot2.daughterboard.resetCauses.AVR32UC3B[2] = "Power On Reset"
slot2.daughterboard.resetCauses.AVR32UC3B[3] = "External Pin Reset"
slot2.daughterboard.resetCauses.AVR32UC3B[4] = "Watchdog Reset"
slot2.daughterboard.resetCauses.AVR32UC3B[5] = "Unknown"
slot2.daughterboard.resetCauses.AVR32UC3B[6] = "Brown out detection"
slot2.daughterboard.resetCauses.STM32F1xx = {
	"Software Reset",
	"Power On Reset",
	"External Pin Reset",
	"Watchdog Reset",
	"Window Watchdog Reset",
	"Low Power Reset"
}

function slot2.getDaughterboardHardResetDescription(slot0, slot1)
	if slot0 == nil or type(slot0) ~= "userdata" and type(slot0) ~= "table" or slot1 == nil then
		return nil
	end

	slot3 = nil

	if slot1 == uv0.daughterboard.hardwareVersion.AVR32UC3B then
		slot3 = uv0.daughterboard.resetCauses.AVR32UC3B[slot0[1]]
	elseif slot1 == uv0.daughterboard.hardwareVersion.STM32F1xx then
		slot3 = uv0.daughterboard.resetCauses.STM32F1xx[slot2]
	end

	if slot3 == nil then
		slot3 = "unknown"
	end

	return slot3
end

function slot2.toRawHeatingLevel(slot0)
	slot1 = 64512

	if type(slot0) == "string" then
		if slot0 == "off" then
			slot1 = 64512
		elseif slot0 == "frostprotection" then
			slot1 = 64513
		elseif slot0 == "eco" then
			slot1 = 64514
		elseif slot0 == "comfort-2" then
			slot1 = 64515
		elseif slot0 == "comfort-1" then
			slot1 = 64516
		elseif slot0 == "comfort" then
			slot1 = 64517
		elseif slot0 == "boost" then
			slot1 = 64519
		elseif slot0 == "secured" then
			slot1 = 64575
		end
	end

	return slot1
end

slot2.sensorDefect = {
	MAINTENANCE_REQUIRED = 1,
	ENERGY_PROBLEM = 2,
	MEASURE_VALUE = 4,
	DEAD_SENSOR = 16
}

function slot2.getSensorDefect(slot0)
	if type(slot0) == "number" then
		if bit.band(slot0, uv0.sensorDefect.MAINTENANCE_REQUIRED) ~= 0 then
			return "maintenanceRequired"
		elseif bit.band(slot0, uv0.sensorDefect.ENERGY_PROBLEM) ~= 0 then
			return "lowBattery"
		elseif bit.band(slot0, uv0.sensorDefect.DEAD_SENSOR) ~= 0 then
			return "dead"
		end
	end
end

function slot2.getDirtyRoomDefect(slot0)
	if type(slot0) == "number" and bit.band(slot0, uv0.sensorDefect.MEASURE_VALUE) ~= 0 then
		return "dirty"
	end

	return nil
end

function slot2.createFPsForIndoorSiren(slot0, slot1, slot2, slot3, slot4)
	slot6 = uv0.getIndoorSirenRepetitionToNumber(slot2)
	slot7 = uv0.getIndoorSirenSonorousVolumeToNumber(slot3)
	slot8 = uv0.getIndoorSirenVisualEffectToNumber(slot4)

	if uv0.getIndoorSirenDurationToNumber(slot0) == 0 and slot1 ~= 0 then
		error("Unsupported Value: duration = 0 allowed only with 0 value for Duty cycle")
	end

	assert(slot7 ~= nil, "sirenSonorousVolume is nil")

	return slot5 + bit.lshift(uv1.scaleChange(slot1, 0, 100, 0, 31), 11), slot6 + bit.lshift(slot7, 10) + bit.lshift(slot8, 13)
end

function slot2.getIndoorSirenDurationToNumber(slot0)
	if slot0 == nil then
		return nil
	end

	if type(slot0) == "number" then
		return uv0.round(slot0 / 100)
	elseif type(slot0) == "string" then
		if slot0 == "defaultDuration" then
			return 2047
		elseif slot0 == "defaultSoundPattern" then
			return 0
		else
			error("Unsupported Value for duration : " .. slot0)
		end
	else
		return nil
	end
end

function slot2.getIndoorSirenRepetitionToNumber(slot0)
	if slot0 == nil then
		return nil
	end

	if type(slot0) == "number" then
		return slot0
	elseif type(slot0) == "string" then
		if slot0 == "noRepetition" then
			return 0
		elseif slot0 == "unlimited" then
			return 1023
		else
			error("Unsupported Value for repetitions : " .. slot0)
		end
	else
		return nil
	end
end

function slot2.getIndoorSirenSonorousVolumeToNumber(slot0)
	if slot0 == nil then
		return nil
	end

	if type(slot0) == "string" then
		if slot0 == "highest" then
			return 0
		elseif slot0 == "standard" then
			return 3
		elseif slot0 == "lowest" then
			return 5
		elseif slot0 == "noSound" then
			return 6
		elseif slot0 == "default" then
			return 7
		else
			error("Unsupported Value for sonorous volume: " .. slot0)
		end
	else
		return nil
	end
end

function slot2.getIndoorSirenVisualEffectToNumber(slot0)
	if slot0 == nil then
		return nil
	end

	if type(slot0) == "string" then
		if slot0 == "noVisualEffect" then
			return 0
		elseif slot0 == "slowBlinking" then
			return 1
		elseif slot0 == "quickBlinking" then
			return 2
		elseif slot0 == "linkedSonorousSequence" then
			return 3
		elseif slot0 == "default" then
			return 7
		else
			error("Unsupported Value for visual effect: " .. slot0)
		end
	else
		return nil
	end
end

function slot2.ringWithSingleSequence(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot4 == nil then
		slot4 = "noVisualEffect"
	end

	if slot0 == nil or slot1 == nil or slot2 == nil or slot3 == nil or slot4 == nil then
		return nil
	end

	if slot5 == nil then
		slot5 = "highest"
	end

	if slot3 == "memorizedVolume" then
		slot3 = slot5
	end

	slot6, slot7 = uv0.createFPsForIndoorSiren(slot0, slot1, slot2, slot3, slot4)

	return uv0.createActivateFunc(0, {
		{
			9,
			slot6
		},
		{
			10,
			slot7
		},
		{
			11,
			0
		},
		{
			12,
			0
		},
		{
			13,
			0
		},
		{
			14,
			0
		}
	})
end

function slot2.ringWithDoubleSequence(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
	if slot4 == nil then
		slot4 = "noVisualEffect"
	end

	if slot9 == nil then
		slot9 = "noVisualEffect"
	end

	if slot0 == nil or slot1 == nil or slot2 == nil or slot3 == nil or slot4 == nil then
		return nil
	end

	if slot5 == nil or slot6 == nil or slot7 == nil or slot8 == nil or slot9 == nil then
		return nil
	end

	if slot10 == nil then
		slot10 = "highest"
	end

	if slot3 == "memorizedVolume" then
		slot3 = slot10
	end

	if slot8 == "memorizedVolume" then
		slot8 = slot10
	end

	slot11, slot12 = uv0.createFPsForIndoorSiren(slot0, slot1, slot2, slot3, slot4)
	slot13, slot14 = uv0.createFPsForIndoorSiren(slot5, slot6, slot7, slot8, slot9)

	return uv0.createActivateFunc(0, {
		{
			9,
			slot11
		},
		{
			10,
			slot12
		},
		{
			11,
			slot13
		},
		{
			12,
			slot14
		},
		{
			13,
			0
		},
		{
			14,
			0
		}
	})
end

function slot2.ringWithThreeSequence(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)
	if slot4 == nil then
		slot4 = "noVisualEffect"
	end

	if slot9 == nil then
		slot9 = "noVisualEffect"
	end

	if slot14 == nil then
		slot14 = "noVisualEffect"
	end

	if slot0 == nil or slot1 == nil or slot2 == nil or slot3 == nil or slot4 == nil then
		return nil
	end

	if slot5 == nil or slot6 == nil or slot7 == nil or slot8 == nil or slot9 == nil then
		return nil
	end

	if slot10 == nil or slot11 == nil or slot12 == nil or slot13 == nil or slot14 == nil then
		return nil
	end

	if slot15 == nil then
		slot15 = "highest"
	end

	if slot3 == "memorizedVolume" then
		slot3 = slot15
	end

	if slot8 == "memorizedVolume" then
		slot8 = slot15
	end

	if slot13 == "memorizedVolume" then
		slot13 = slot15
	end

	slot16, slot17 = uv0.createFPsForIndoorSiren(slot0, slot1, slot2, slot3, slot4)
	slot18, slot19 = uv0.createFPsForIndoorSiren(slot5, slot6, slot7, slot8, slot9)
	slot20, slot21 = uv0.createFPsForIndoorSiren(slot10, slot11, slot12, slot13, slot14)

	return uv0.createActivateFunc(0, {
		{
			9,
			slot16
		},
		{
			10,
			slot17
		},
		{
			11,
			slot18
		},
		{
			12,
			slot19
		},
		{
			13,
			slot20
		},
		{
			14,
			slot21
		}
	})
end

function slot2.getBatteryLevel(slot0, slot1)
	if slot0 == nil then
		return nil
	end

	return bit.rshift(bit.band(slot0, 96), slot1)
end

function slot2.getBatteryLevelValue(slot0, slot1)
	if uv0.getBatteryLevel(slot0, slot1) == nil or slot2 == 0 then
		return nil
	elseif slot2 == 1 then
		return "low"
	elseif slot2 == 2 then
		return "normal"
	elseif slot2 == 3 then
		return "full"
	else
		return nil
	end
end

function slot2.RGBToVector(slot0, slot1, slot2)
	assert(type(slot0) == "number", "invalid type for red value")
	assert(type(slot1) == "number", "invalid type for green value")
	assert(type(slot2) == "number", "invalid type for blue value")

	if slot0 < 0 or slot0 > 255 then
		error("red value (" .. slot0 .. ") is out of range, should be between 0 and 255. ")
	end

	if slot1 < 0 or slot1 > 255 then
		error("green value (" .. slot1 .. ") is out of range, should be between 0 and 255. ")
	end

	if slot2 < 0 or slot2 > 255 then
		error("blue value (" .. slot2 .. ") is out of range, should be between 0 and 255. ")
	end

	slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10 = nil
	slot3 = slot0 / 255
	slot4 = slot1 / 255
	slot5 = slot2 / 255
	slot6 = 2.7689 * slot3 + 1.7517 * slot4 + 1.1302 * slot5
	slot7 = 1 * slot3 + 4.5907 * slot4 + 0.0601 * slot5
	slot8 = 0.056508 * slot4 + 5.5943 * slot5

	return 4 * slot6 / (slot6 + 15 * slot7 + 3 * slot8), 9 * slot7 / (slot6 + 15 * slot7 + 3 * slot8), math.max(slot3, slot4, slot5) * 100
end

function slot2.vectorToRGB(slot0, slot1, slot2)
	assert(type(slot0) == "number", "invalid type for 'u' value")
	assert(type(slot1) == "number", "invalid type for 'v' value")
	assert(type(slot2) == "number", "invalid type for 'intensity' value")

	slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10 = nil

	if slot1 == 0 or slot0 == 0 then
		return 0, 0, 0
	end

	slot6 = 2.25 * slot0 / slot1
	slot7 = (-3 * slot0 - 20 * slot1 + 12) / (4 * slot1)
	slot4 = -0.091169 * slot6 + 0.25243 + 0.015708 * slot7
	slot5 = 0.0009209 * slot6 - 0.0025498 + 0.1786 * slot7

	if 0.41847 * slot6 - 0.15866 - 0.082835 * slot7 < 0 then
		slot3 = 0
	elseif slot3 > 1 then
		slot3 = 1
	end

	if slot4 < 0 then
		slot4 = 0
	elseif slot4 > 1 then
		slot4 = 1
	end

	if slot5 < 0 then
		slot5 = 0
	elseif slot5 > 1 then
		slot5 = 1
	end

	slot11 = 255 / (100 * math.max(slot3, slot4, slot5))

	return math.round(slot11 * slot3 * slot2), math.round(slot11 * slot4 * slot2), math.round(slot11 * slot5 * slot2)
end

slot2.microModule = {
	controllerType = {}
}
slot2.microModule.controllerType.micromodule = 0
slot2.microModule.controllerType.oneWayController = 1
slot2.microModule.controllerType.standAloneController = 2
slot2.microModule.batteryState = {
	critical = 0,
	low = 1,
	medium = 2,
	high = 3,
	unknown = 4,
	notSupported = 5
}

function slot2.getMicroModuleLowBattery(slot0)
	slot1 = 0
	slot2 = {}
	slot3 = 1
	slot4 = 1
	slot5 = 1

	while slot5 < #slot0 do
		slot6 = 1

		if slot0[slot5] == 255 then
			slot2[#slot2 + 1] = slot0:sub(slot3, slot5 - 1)
			slot3 = slot5 + 1
			slot5 = slot5 + 1
		else
			slot5 = slot5 + slot0[slot5 + 1] + 1 + 2
		end
	end

	slot10 = #slot0
	slot2[#slot2 + 1] = slot0:sub(slot3, slot10)
	slot6 = nil

	for slot10 = 1, #slot2 do
		if uv0.getSOFOPUValue(slot2[slot10], 7) == uv0.microModule.controllerType.micromodule and uv0.getSOFOPUValue(slot2[slot10], 8) <= uv0.microModule.batteryState.low then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

function slot2.getSOFOPUParamSize(slot0, slot1)
	if slot0 == nil or type(slot0) ~= "userdata" then
		return nil
	end

	slot2 = 1
	slot3 = 1

	while slot2 + 2 < #slot0 do
		if slot0[slot2] < 128 then
			slot3 = slot0[slot2 + 1] + 1

			if slot0[slot2] == slot1 then
				return slot3
			end

			slot2 = slot2 + 2 + slot3
		else
			slot3 = slot0[slot2 + 2] + 1

			if slot0[slot2] == slot1 then
				return slot3
			end

			slot2 = slot2 + 3 + slot3
		end
	end

	error("parameter " .. tostring(slot1) .. "does not exist")
end

function slot2.updateSOFOPUParamSize(slot0, slot1, slot2)
	if slot2 > 256 then
		error("new parameters length cannot be more than 256 bytes")
	end

	slot4 = slot0:sub(1, slot1)

	slot4:writeInt8(slot1, slot2 - 1)

	return slot4:append(bytearray(slot2 - 1)):append(slot0:sub(slot1 + slot0[slot1] + 1, #slot0))
end

function slot2.updateSOFOPUParam(slot0, slot1, slot2, slot3)
	assert(slot2 ~= nil, "index should not be null")
	assert(slot0 ~= nil, "state Value is nil")
	assert(type(slot0) == "userdata", "wrong stateValue type : " .. type(slot0) .. ", should be 'userdata'")

	if type(slot3) ~= "boolean" then
		slot3 = false
	end

	if uv0.getSOFOPUParamSize(slot0, slot2) ~= #slot1 and not slot3 then
		error("parameter length is " .. tostring(#slot1) .. " - should be: " .. tostring(slot4))
	end

	slot5 = 1
	slot6 = 1

	while slot5 + 2 <= #slot0 do
		if slot0[slot5] < 128 then
			if slot0[slot5] == slot2 then
				if slot3 and slot0[slot5 + 1] + 1 ~= #slot1 then
					slot0 = uv0.updateSOFOPUParamSize(slot0, slot5 + 1, #slot1)
					slot6 = #slot1
				end

				slot7 = 1

				while slot6 >= slot7 do
					slot0[slot5 + 1 + slot7] = slot1[slot7]
					slot7 = slot7 + 1
				end

				return slot0
			end

			slot5 = slot5 + 2 + slot6
		else
			if slot0[slot5] == slot2 then
				if slot3 and slot0[slot5 + 2] + 1 ~= #slot1 then
					slot0 = uv0.updateSOFOPUParamSize(slot0, slot5 + 2, #slot1)
					slot6 = #slot1
				end

				slot7 = 1

				while slot6 >= slot7 do
					slot0[slot5 + 2 + slot7] = slot1[slot7]
					slot7 = slot7 + 1
				end

				return slot0
			end

			slot5 = slot5 + 3 + slot6
		end
	end

	error("parameter " .. tostring(slot2) .. "does not exist")
end

function slot2.updatePublicState(slot0, slot1, slot2)
	assert(type(slot0) == "userdata", "wrong stateValue type : " .. type(slot0) .. ", should be 'userdata'")

	slot3 = bytearray(2)
	slot4 = bytearray(1)

	slot3:writeInt16(1, slot1)
	slot4:writeInt8(1, slot2)

	return slot4:append(slot3):append(bytearray(2)):append(slot0)
end

slot2.SomfyHeatingSystem = {
	days = {
		"monday",
		"tuesday",
		"wednesday",
		"thursday",
		"friday",
		"saturday",
		"sunday"
	},
	modes = {
		[0] = "comfort",
		"away",
		"eco",
		"geofencingMode",
		"manual",
		"frostprotection",
		"suddenDropMode"
	},
	reverseModes = {
		frostprotection = 5,
		comfort = 0,
		eco = 2,
		geofencingMode = 3,
		suddenDropMode = 6,
		manual = 4,
		away = 1
	},
	indexModeTemp = {
		frostprotection = 5,
		comfort = 1,
		eco = 3,
		geofencingMode = 4,
		suddenDropMode = 6,
		away = 2
	},
	derogationModes = {
		further_notice = 1,
		next_mode = 2,
		derog = 3,
		date = 0
	},
	indexSettingMask = {
		ByPass = 4,
		HeatingAnticipation = 16,
		ThermalConfiguration = 8,
		OpenWindow = 1,
		PermanentDisplay = 4,
		LockKey = 2
	},
	getCalendar = function (slot0)
		slot1 = {
			{},
			{},
			{},
			{},
			{},
			{},
			{}
		}
		slot2 = 0
		slot3 = 0
		slot4 = nil

		while slot2 < #slot0 do
			slot4 = {
				[slot8] = {}
			}

			for slot8 = 1, slot0[slot2 + 2] do
				slot4[slot8].m = slot0[slot2 + 3 + (slot8 - 1) * 3]
				slot4[slot8].f = uv0.SomfyHeatingSystem.convertTime(slot0[slot2 + 4 + (slot8 - 1) * 3])
				slot4[slot8].t = uv0.SomfyHeatingSystem.convertTime(slot0[slot2 + 5 + (slot8 - 1) * 3])
			end

			for slot8 = 0, 6 do
				if bit.band(bit.rshift(slot0[slot2 + 1], slot8), 1) == 1 then
					slot1[slot8 + 1] = slot4
				end
			end

			slot2 = slot2 + slot3 * 3 + 2
		end

		return slot1
	end,
	expandCalendar = function (slot0)
		slot1 = {
			[slot7] = {}
		}

		for slot5, slot6 in pairs(slot0) do
			slot7 = uv0.SomfyHeatingSystem.days[slot5]
			slot1[slot7].timeslots = {}

			for slot11, slot12 in pairs(slot6) do
				slot1[slot7].timeslots[slot11] = {
					mode = uv0.SomfyHeatingSystem.modes[slot12.m],
					from = {
						hour = slot12.f[1],
						minute = slot12.f[2]
					},
					to = {
						hour = slot12.t[1],
						minute = slot12.t[2]
					}
				}
			end
		end

		return slot1
	end,
	setCalendar = function (slot0)
		slot1 = {}

		for slot5, slot6 in pairs(slot0) do
			if slot6.timeslots == nil or #slot6.timeslots == 0 then
				error("Missing timeslots")
			end

			if #slot6.timeslots > 7 then
				error("Max 7 timeslots allowed")
			end

			slot7 = false

			for slot11, slot12 in pairs(slot1) do
				if uv0.SomfyHeatingSystem.equalsTimeslots(slot12.timeslots, slot6.timeslots) then
					slot1[slot11].days[#slot1[slot11].days + 1] = slot5
					slot7 = true

					break
				end
			end

			if slot7 == false then
				slot1[#slot1 + 1] = {
					days = {
						slot5
					},
					timeslots = slot6.timeslots
				}
			end
		end

		slot2 = bytearray(0)

		for slot6, slot7 in pairs(slot1) do
			for slot12, slot13 in pairs(slot7.days) do
				slot8 = 0 + uv0.SomfyHeatingSystem.invertDay(slot13)
			end

			slot9 = bytearray(2)
			slot9[1] = slot8
			slot9[2] = #slot7.timeslots
			slot2 = slot2:append(slot9)

			for slot13, slot14 in ipairs(slot7.timeslots) do
				if uv0.SomfyHeatingSystem.reverseModes[slot14.mode] == nil then
					error("Unknown mode value : " .. slot14.mode .. ". Available modes : comfort, away, eco, geofencingMode, manual, frostprotection, suddenDropMode")
				end

				slot15 = bytearray(3)
				slot15[1] = uv0.SomfyHeatingSystem.reverseModes[slot14.mode]
				slot15[2] = uv0.SomfyHeatingSystem.invertTime(slot14.from)
				slot15[3] = uv0.SomfyHeatingSystem.invertTime(slot14.to)
				slot2 = slot2:append(slot15)
			end
		end

		return slot2
	end,
	equalsTimeslots = function (slot0, slot1)
		if #slot0 ~= #slot1 then
			return false
		end

		for slot5, slot6 in ipairs(slot0) do
			if slot6.from.hour ~= slot1[slot5].from.hour then
				return false
			end

			if slot6.from.minute ~= slot1[slot5].from.minute then
				return false
			end

			if slot6.to.hour ~= slot1[slot5].to.hour then
				return false
			end

			if slot6.to.minute ~= slot1[slot5].to.minute then
				return false
			end

			if slot6.mode ~= slot1[slot5].mode then
				return false
			end
		end

		return true
	end,
	convertTime = function (slot0)
		return {
			math.floor(slot0 * 15 / 60),
			slot0 * 15 % 60
		}
	end,
	invertDay = function (slot0)
		for slot4, slot5 in ipairs(uv0.SomfyHeatingSystem.days) do
			if slot5 == slot0 then
				return bit.lshift(1, slot4 - 1)
			end
		end

		error("Unknown day : " .. slot0)
	end,
	invertTime = function (slot0)
		if slot0 == nil or type(slot0) ~= "table" or type(slot0.hour) ~= "number" or type(slot0.minute) ~= "number" then
			error("Time value must be an array with 2 number values")
		end

		return slot0.hour * 4 + math.floor(slot0.minute / 15)
	end,
	getCalendarStateId = function (slot0)
		if tonumber(slot0) == 1 then
			return 42534
		elseif slot1 == 2 then
			return 42535
		else
			error("Unknown time program " .. slot1 .. ", available program ids are 1 and 2")
		end
	end,
	updateAllModeTemperatures = function (slot0, slot1, slot2, slot3, slot4, slot5)
		if slot0 == nil or type(slot0) ~= "number" or slot0 < 5 or slot0 > 26 then
			error("Comfort temperature value must be an integer between 5 and 26")
		end

		if slot1 == nil or type(slot1) ~= "number" or slot1 < 5 or slot1 > 26 then
			error("ecoTemperature value must be an integer between 5 and 26")
		end

		if slot2 == nil or type(slot2) ~= "number" or slot2 < 5 or slot2 > 26 then
			error("Axway temperature value must be an integer between 5 and 26")
		end

		if slot3 == nil or type(slot3) ~= "number" or slot3 < 5 or slot3 > 26 then
			error("Frost protection temperature value must be an integer between 5 and 26")
		end

		slot6 = uv0.SomfyHeatingSystem.guessBestStateValue(slot4, slot5, 6)
		slot6[1] = slot0 * 2
		slot6[2] = slot2 * 2
		slot6[3] = slot1 * 2
		slot6[5] = slot3 * 2

		return slot6
	end,
	updateOffsetValveConfiguration = function (slot0, slot1)
		if slot0 == nil or type(slot0) ~= "number" or slot0 < -20 or slot0 > 20 then
			error("Valve settings state not exists")
		end

		if slot0 < 0 then
			slot1[4] = 128
		else
			slot1[4] = 0
		end

		slot1[5] = math.abs(slot0) * 10

		return slot1
	end,
	updateThermostatConfiguration = function (slot0, slot1, slot2)
		if slot0 == nil or type(slot0) ~= "number" then
			error("Thermostat settings state not exists")
		end

		if slot0 < -5 or slot0 > 5 then
			error("Out of range value.")
		end

		if slot0 < 0 then
			slot1[slot2] = 128 + math.abs(slot0) * 10
		else
			slot1[slot2] = 0 + math.abs(slot0) * 10
		end

		return slot1
	end,
	updateMinSetpoint = function (slot0, slot1)
		slot1[3] = math.floor(slot0 * 2)

		return slot1
	end,
	updateMaxSetpoint = function (slot0, slot1)
		slot1[2] = math.floor(slot0 * 2)

		return slot1
	end,
	updateValveSettings = function (slot0, slot1, slot2)
		if slot0.minSetpoint ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateMinSetpoint(slot0.minSetpoint, uv0.SomfyHeatingSystem.guessBestStateValue(slot1, slot2, 5))
		end

		if slot0.maxSetpoint ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateMaxSetpoint(slot0.maxSetpoint, slot3)
		end

		if slot0.temperatureOffset ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateOffsetValveConfiguration(slot0.temperatureOffset, slot3)
		end

		if slot0.openWindow ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateConfiguration("OpenWindow", slot0.openWindow, slot3)
		end

		if slot0.lockKey ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateConfiguration("LockKey", slot0.lockKey, slot3)
		end

		if slot0.byPass ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateConfiguration("ByPass", slot0.byPass, slot3)
		end

		if slot0.activeTimeProgram ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateActiveCalendar(slot0.activeTimeProgram, slot3)
		end

		return slot3
	end,
	updateThermostatSettings = function (slot0, slot1, slot2)
		if slot0.minSetpoint ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateMinSetpoint(slot0.minSetpoint, uv0.SomfyHeatingSystem.guessBestStateValue(slot1, slot2, 5))
		end

		if slot0.maxSetpoint ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateMaxSetpoint(slot0.maxSetpoint, slot3)
		end

		if slot0.temperatureOffset ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateThermostatConfiguration(slot0.temperatureOffset, slot3, 4)
		end

		if slot0.hysteresis ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateThermostatConfiguration(slot0.hysteresis, slot3, 5)
		end

		if slot0.openWindow ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateConfiguration("OpenWindow", slot0.openWindow, slot3)
		end

		if slot0.lockKey ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateConfiguration("LockKey", slot0.lockKey, slot3)
		end

		if slot0.thermalConfiguration ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateThermalConfiguration("ThermalConfiguration", slot0.thermalConfiguration, slot3)
		end

		if slot0.permanentDisplay ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateConfiguration("PermanentDisplay", slot0.permanentDisplay, slot3)
		end

		if slot0.heatingAnticipation ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateConfiguration("HeatingAnticipation", slot0.heatingAnticipation, slot3)
		end

		if slot0.activeTimeProgram ~= nil then
			slot3 = uv0.SomfyHeatingSystem.updateActiveCalendar(slot0.activeTimeProgram, slot3)
		end

		return slot3
	end,
	updateActiveCalendar = function (slot0, slot1)
		slot2 = 0

		if slot0 == 1 or slot0 == 2 then
			slot2 = slot0
		elseif slot0 ~= "none" then
			error("Unknown time program " .. slot0 .. ", available program ids are 1, 2 and 'none'")
		end

		slot1[1] = bit.bor(bit.band(slot1[1], 63), bit.lshift(slot2, 6))

		return slot1
	end,
	updateThermalConfiguration = function (slot0, slot1, slot2)
		if slot1 == "cooling" then
			slot2[1] = bit.bor(slot2[1], uv0.SomfyHeatingSystem.indexSettingMask[slot0])
		else
			slot2[1] = bit.band(slot2[1], 255 - uv0.SomfyHeatingSystem.indexSettingMask[slot0])
		end

		return slot2
	end,
	updateConfiguration = function (slot0, slot1, slot2)
		if slot1 == true then
			slot2[1] = bit.bor(slot2[1], uv0.SomfyHeatingSystem.indexSettingMask[slot0])
		else
			slot2[1] = bit.band(slot2[1], 255 - uv0.SomfyHeatingSystem.indexSettingMask[slot0])
		end

		return slot2
	end,
	updateDerogation = function (slot0, slot1, slot2, slot3)
		if type(slot0) == "string" then
			assert(uv0.SomfyHeatingSystem.reverseModes[slot0] ~= nil and slot0 ~= "manual", "wrong value for heating mode : " .. slot0)
		elseif type(slot0) == "number" then
			assert(slot0 ~= 0 and slot0 >= 5 and slot0 <= 26, "heatingMode should be a value between 5 and 26")
		else
			error("wrong type for heatingMode : " .. type(slot0) .. " should be string or number")
		end

		if type(slot1) == "string" then
			assert(uv0.SomfyHeatingSystem.derogationModes[slot1] ~= nil and slot1 ~= "date", "wrong value for derogation type")
		elseif type(slot1) == "number" then
			assert(slot1 >= 0, "derogation duration must be positive or equal to 0")
		else
			error("wrong type for derogationModeOrDuration : " .. type(slot1) .. " should be string or number")
		end

		return uv0.SomfyHeatingSystem.setDerogation(slot0, slot1, slot2, slot3)
	end,
	setDerogation = function (slot0, slot1, slot2, slot3)
		slot5 = os.time()
		slot6 = math.ceil(slot3 + slot2) / 2
		slot7, slot8 = nil

		if type(slot0) == "string" then
			slot7 = uv0.SomfyHeatingSystem.reverseModes[slot0]
		elseif type(slot0) == "number" then
			slot7 = uv0.SomfyHeatingSystem.reverseModes.manual
			slot6 = slot0
		else
			error("wrong type for heatingMode : " .. type(slot0) .. " should be string or number")
		end

		if type(slot1) == "string" then
			assert(uv0.SomfyHeatingSystem.derogationModes[slot1] ~= nil, "wrong value for derogation type")

			slot8 = uv0.SomfyHeatingSystem.derogationModes[slot1]
		elseif type(slot1) == "number" then
			slot8 = uv0.SomfyHeatingSystem.derogationModes.date
			slot5 = slot4 + slot1
		else
			error("wrong type for derogationModeOrDuration : " .. type(slot1) .. " should be string or number")
		end

		return bytearray({
			bit.lshift(slot7, 3) + slot8,
			slot6 * 2,
			bit.band(bit.rshift(slot4, 24), 255),
			bit.band(bit.rshift(slot4, 16), 255),
			bit.band(bit.rshift(slot4, 8), 255),
			bit.band(slot4, 255),
			bit.band(bit.rshift(slot5, 24), 255),
			bit.band(bit.rshift(slot5, 16), 255),
			bit.band(bit.rshift(slot5, 8), 255),
			bit.band(slot5, 255)
		})
	end,
	guessBestStateValue = function (slot0, slot1, slot2)
		if slot0 ~= nil and type(slot0) == "userdata" and #slot0 == slot2 then
			return slot0
		end

		if slot1 == nil or type(slot1) ~= "userdata" or #slot1 ~= slot2 then
			error("Valve state not exists")
		end

		return slot1
	end
}

function slot2.updateAndRefreshPublicState(slot0, slot1, slot2)
	slot3 = bytearray(1)

	slot3:writeInt8(1, slot2)

	slot4 = bytearray(2)

	slot4:writeInt16(1, slot1)

	return uv0.updatePublicState(slot0, slot1, slot2), nil, slot3:append(slot4), {
		access = "r"
	}
end

function slot2.toOpenClosedPedestrianState(slot0, slot1, slot2)
	if slot0 == slot1 or slot2 == 55303 then
		return "pedestrian"
	elseif slot0 == 54272 then
		return "unknown"
	else
		return uv0.motorRelativePositionToDiscreteOpenClosed(slot0)
	end
end

function slot2.getTypeFromSetAndGO(slot0)
	if slot0 == nil then
		error("Data from SetAndGo is nil!")
	end

	if type(slot0) ~= "number" then
		error("Data from SetAndGo is not a number!")
	end

	slot2 = bit.rshift(bit.band(slot0, 65280), 8)

	if bit.band(slot0, 255) == 255 and slot2 ~= 0 and slot2 ~= 255 then
		return slot2
	elseif slot1 ~= 0 and slot1 ~= 255 and slot2 == 0 then
		return slot1
	end

	error("Cannot parse and extract Data from Set & Go. Unexpected format for : " .. slot0)
end

function slot2.toPercentValue(slot0)
	if slot0 == nil then
		return nil
	end

	return uv0.round(slot0 / 512)
end

function slot2.motorRelativePositionToDiscreteOpenClosed(slot0, slot1)
	if type(slot1) == "boolean" and slot1 then
		slot0 = 51200 - slot0
	end

	if uv0.toPercentValue(slot0) == 100 then
		return "closed"
	else
		return "open"
	end
end

function slot3(slot0)
	if slot0 ~= nil and slot0 >= 0 and slot0 <= 51200 then
		return true
	end

	return false
end

function slot2.toPercentTargetValue(slot0, slot1, slot2)
	slot3 = slot1

	if uv0(slot0) then
		slot3 = slot0
	elseif slot2 ~= nil and uv0(slot2[slot0]) then
		slot3 = slot2[slot0]
	end

	return uv1.toPercentValue(slot3)
end

function slot2.toMultiTypeSensorTiltedValue(slot0)
	if slot0 == nil then
		error("Data from sensor is nil!")
	end

	if bit.band(slot0, uv0.multiTypeSensor.TiltAxis.OpenMask) == uv0.multiTypeSensor.TiltAxis.Open or bit.band(slot0, uv0.multiTypeSensor.TiltAxis.OpenMask) == uv0.multiTypeSensor.TiltAxis.Ventilation or bit.band(slot0, uv0.multiTypeSensor.TiltAxis.LockMask) == uv0.multiTypeSensor.TiltAxis.Unlock then
		return true
	elseif bit.band(slot0, uv0.multiTypeSensor.TiltAxis.OpenMask) == uv0.multiTypeSensor.TiltAxis.Close or bit.band(slot0, uv0.multiTypeSensor.TiltAxis.LockMask) == uv0.multiTypeSensor.TiltAxis.Lock then
		return false
	end

	return nil
end

function slot2.getMultiTypeSensorAxisOpenClosed(slot0, slot1)
	slot3 = bit.band(slot0, slot1.LockMask)

	if bit.band(slot0, slot1.OpenMask) ~= slot1.Unknown then
		if slot2 == slot1.Close then
			return "closed"
		end

		return "open"
	end

	if slot3 ~= slot1.Unknown then
		if slot3 == slot1.Lock then
			return "closed"
		end

		return "open"
	end

	return nil
end

function slot2.toMultiTypeSensorOpenClosedValue(slot0)
	if slot0 == nil then
		error("Data from sensor is nil!")
	end

	slot2 = uv0.getMultiTypeSensorAxisOpenClosed(slot0, uv0.multiTypeSensor.SlidingAxis)

	if uv0.getMultiTypeSensorAxisOpenClosed(slot0, uv0.multiTypeSensor.TurnAxis) == "open" or slot2 == "open" then
		return "open"
	end

	if slot1 == nil and slot2 == nil then
		return nil
	end

	return "closed"
end

function slot2.toMultiTypeSensorLockedUnlockedValue(slot0)
	slot1 = uv0.multiTypeSensor.TiltAxis.LockMask
	slot2 = uv0.multiTypeSensor.TurnAxis.LockMask
	slot3 = uv0.multiTypeSensor.SlidingAxis.LockMask

	if slot0 == nil then
		error("Data from sensor is nil!")
	end

	if bit.band(slot0, slot1) == uv0.multiTypeSensor.TiltAxis.Unlock or bit.band(slot0, slot2) == uv0.multiTypeSensor.TurnAxis.Unlock or bit.band(slot0, slot3) == uv0.multiTypeSensor.SlidingAxis.Unlock then
		return "unlocked"
	elseif bit.band(slot0, slot1) == uv0.multiTypeSensor.TiltAxis.Lock or bit.band(slot0, slot2) == uv0.multiTypeSensor.TurnAxis.Lock or bit.band(slot0, slot3) == uv0.multiTypeSensor.SlidingAxis.Lock then
		return "locked"
	elseif bit.band(slot0, uv0.multiTypeSensor.GeneralInfo.OpenMask) == 32768 then
		return "locked"
	else
		return "unlocked"
	end
end

slot2.multiTypeSensor = {
	GeneralInfo = {}
}
slot2.multiTypeSensor.GeneralInfo.OpenMask = 32768
slot2.multiTypeSensor.GeneralInfo.Open = 0
slot2.multiTypeSensor.GeneralInfo.Close = 32768
slot2.multiTypeSensor.TiltAxis = {
	LockMask = 768,
	OpenMask = 3072,
	Close = 3072,
	Ventilation = 2048,
	Open = 1024,
	Lock = 768,
	Unlock = 256,
	Unknown = 0
}
slot2.multiTypeSensor.TurnAxis = {
	LockMask = 48,
	OpenMask = 192,
	Close = 192,
	Ventilation = 128,
	Open = 64,
	Lock = 48,
	Unlock = 16,
	Unknown = 0
}
slot2.multiTypeSensor.SlidingAxis = {
	LockMask = 3,
	OpenMask = 12,
	Close = 12,
	Ventilation = 8,
	Open = 4,
	Lock = 3,
	Unlock = 1,
	Unknown = 0
}

function slot2.handleOneWayController(slot0, slot1, slot2)
	if slot1 == nil then
		slot1 = 1
	end

	slot3, slot4 = uv0.parseOneWayControllerQRPayload(slot0)

	return bytearray(0):append(bytearray({
		slot2
	})):append(uv0.computeOneWayControllerAddress(slot3, slot1)):append(bytearray({
		0,
		0,
		63
	})):append(slot4):append(bytearray({
		0,
		0
	})):append(bytearray({
		0
	})):append(bytearray({
		3
	}))
end

function slot2.parseOneWayControllerQRPayload(slot0)
	if slot0 == nil then
		error("QR Payload is required")
	elseif #slot0 < 40 then
		error("Invalid QR Code sent")
	end

	return bytearray(slot0:sub(3, 8), "hexadecimal"), bytearray(slot0:sub(9, 40), "hexadecimal")
end

function slot2.computeOneWayControllerAddress(slot0, slot1)
	return bytearray(3):writeUInt24(1, slot0:readUInt24(1, true) + slot1 - 1, true)
end

function slot2.computeDiscreteRSSILevel(slot0)
	if slot0 > -60 then
		return "good"
	elseif slot0 > -80 then
		return "normal"
	elseif slot0 > -95 then
		return "low"
	else
		return "verylow"
	end
end

function slot2.generateIOKey()
	slot1 = {
		[slot7] = math.random(0, 255)
	}
	slot2 = bytearray(16)
	slot3 = 0

	for slot7 = 1, math.random(90, 100) do
	end

	for slot7 = 1, 16 do
		slot2[slot7] = slot1[math.random(1, slot0)]
	end

	return slot2
end

function slot2.saveBoundValue(slot0)
	if slot0 == "lower" then
		bytearray(2)[2] = 0
	elseif slot0 == "upper" then
		slot1[2] = 1
	else
		error("The type of bound is required")
	end

	return slot1
end

function slot2.updateAdditionalStatusState(slot0)
	slot1 = {
		noKeyTransferSetupRequired = slot0
	}

	if slot0 ~= nil then
		-- Nothing
	end

	if uv0.mapLength(slot1) == 0 then
		return nil
	end

	return slot1
end

slot2.manufacturerIdToString = {
	[0] = "Public",
	"VELUX",
	"Somfy",
	"Honeywell",
	"Hörmann",
	"ASSA ABLOY",
	"Niko",
	"Window Master",
	"Renson",
	"CIAT",
	"Secuyou",
	"OVERKIZ",
	"Atlantic Group",
	"Zehnder Group"
}

function slot2.fromRawManufacturer(slot0)
	return uv0.manufacturerIdToString[slot0]
end

return slot2
