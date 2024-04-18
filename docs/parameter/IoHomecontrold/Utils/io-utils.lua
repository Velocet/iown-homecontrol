-- chunkname: @./gateway/io-utils.module

local BinaryUtils = depends("BinaryUtils")
local CommonUtils = depends("common", "utils")
local IOUtils = {}

IOUtils.extendedInformationType = {}
IOUtils.extendedInformationType.CURRENT_USING_A_RELATIVE_VALUE = 1
IOUtils.extendedInformationType.CURRENT_USING_DISCRETE_VALUE = 16
IOUtils.value = {}
IOUtils.value.TARGET = 53504
IOUtils.value.CURRENT = 53760
IOUtils.value.DEFAULT = 54016
IOUtils.value.IGNORE = 54272
IOUtils.priority = {}
IOUtils.priority.LOWEST = 0
IOUtils.priority.VERYLOW = 256
IOUtils.priority.LOW = 4096
IOUtils.priority.MEDIUM = 65536
IOUtils.priority.HIGH = 1048576
IOUtils.priority.VERYHIGH = 16777216
IOUtils.priority.HIGHEST = 4294967295
IOUtils.nodeStatus = {}
IOUtils.nodeStatus.DONE = 1
IOUtils.nodeStatus.EXISTING = 8
IOUtils.nodeStatus.UNAVAILABLE = 10
IOUtils.nodeStatus.UNPAIRED = 12

function IOUtils.fromRawName(b)
	if b == nil or #b == 0 then
		return ""
	end

	if #b > 2 and b[1] == 0 and b[2] ~= 0 then
		b = b:sub(2, #b)
	end

	for i = 1, #b do
		if b[i] == 0 then
			b = b:sub(1, i - 1)

			break
		end
	end

	b = CommonUtils.rawTrim(b)

	return b:tostring("iso-8859-1")
end

function IOUtils.toRawName(n)
	local b = bytearray(n, "iso-8859-1")

	if #b > 16 then
		b = b:sub(1, 16)
	end

	BinaryUtils.filterIso8859Dash1InvalidChars(b)

	if #b < 16 then
		b = b:append(bytearray(16 - #b))
	end

	return b
end

function IOUtils.fromRawStatusState(s)
	if s == IOUtils.nodeStatus.DONE or s == IOUtils.nodeStatus.EXISTING or s == IOUtils.nodeStatus.UNPAIRED then
		return "available"
	else
		return "unavailable"
	end
end

function IOUtils.createActivateFunc(mpValue, fpValues)
	if mpValue == nil then
		mpValue = IOUtils.value.IGNORE
	end

	if fpValues == nil then
		return bytearray({
			bit.rshift(bit.band(mpValue, 65280), 8),
			bit.band(mpValue, 255),
			0,
			0
		})
	else
		local bm1 = 0
		local bm2 = 0

		for i = 1, #fpValues do
			local fpDef = fpValues[i]

			if fpDef[1] <= 8 then
				bm1 = bit.bor(bm1, bit.lshift(1, 8 - fpDef[1]))
			else
				bm2 = bit.bor(bm2, bit.lshift(1, 8 - (fpDef[1] - 8)))
			end
		end

		local af = bytearray(4 + #fpValues * 2)

		af[1] = bit.rshift(bit.band(mpValue, 65280), 8)
		af[2] = bit.band(mpValue, 255)
		af[3] = bm1

		local p = 4

		for i = 1, #fpValues do
			local fpDef = fpValues[i]

			if fpDef[1] <= 8 then
				if fpDef[2] == nil or type(fpDef[2]) ~= "number" then
					error("Bad conversion : trying to write invalid value '" .. tostring(fpDef[2]) .. "' on FP" .. fpDef[1])
				end

				af[p] = bit.rshift(bit.band(fpDef[2], 65280), 8)
				p = p + 1
				af[p] = bit.band(fpDef[2], 255)
				p = p + 1
			end
		end

		af[p] = bm2
		p = p + 1

		for i = 1, #fpValues do
			local fpDef = fpValues[i]

			if fpDef[1] > 8 then
				if fpDef[2] == nil or type(fpDef[2]) ~= "number" then
					error("Bad conversion : trying to write invalid value '" .. tostring(fpDef[2]) .. "' on FP" .. fpDef[1])
				end

				af[p] = bit.rshift(bit.band(fpDef[2], 65280), 8)
				p = p + 1
				af[p] = bit.band(fpDef[2], 255)
				p = p + 1
			end
		end

		return af
	end
end

function IOUtils.readActivateFunc(fpIndexes)
	if fpIndexes == nil then
		fpIndexes = {}
	end

	local bm1 = 0
	local fpDef1 = {}
	local bm2 = 0
	local fpDef2 = {}

	if #fpIndexes > 0 then
		for i = 1, #fpIndexes do
			local fpIndex = fpIndexes[i]

			if fpIndex <= 8 then
				bm1 = bit.bor(bm1, bit.lshift(1, 8 - fpIndex))
				fpDef1[#fpDef1 + 1] = 1
			else
				bm2 = bit.bor(bm2, bit.lshift(1, 8 - (fpIndex - 8)))
				fpDef2[#fpDef2 + 1] = 1
			end
		end
	end

	local payload = bytearray({
		bm1
	})

	if #fpDef1 > 0 then
		payload = payload:append(bytearray(fpDef1))
	end

	payload = payload:append(bytearray({
		bm2
	}))

	if #fpDef2 > 0 then
		payload = payload:append(bytearray(fpDef2))
	end

	return payload
end

IOUtils.standardReceiver = {}
IOUtils.standardReceiver.switchActivationMode = 0
IOUtils.standardReceiver.temporizedOnModeParameter = 0

function IOUtils.createActivateMode(modeNumber, modeParameter)
	CommonUtils.assertByteValue(modeNumber, "modeNumber")
	CommonUtils.assertByteValue(modeParameter, "modeParameter")

	local modeSessionNumber = 0

	return bytearray({
		modeNumber,
		modeParameter,
		modeSessionNumber
	})
end

IOUtils.winkStateDisabled = 0
IOUtils.winkStateEnabled = 1
IOUtils.winkTimeManufacturerSpecific = 254
IOUtils.winkTimeForever = 255

function IOUtils.createWinkValue(enable, winkTime)
	local commandValue = bytearray(2)

	if enable == nil or type(enable) ~= "boolean" then
		error("Invalid wink state " .. tostring(enable))
	elseif enable then
		commandValue[1] = IOUtils.winkStateEnabled
	else
		commandValue[1] = IOUtils.winkStateDisabled
	end

	if winkTime ~= nil then
		if type(winkTime) == "number" then
			if winkTime < 1 or winkTime > 254 then
				error("Invalid wink time " .. tostring(winkTime) .. ", should be a number of seconds between 1 and 254 or one of particular values : 'manufacturerSpecific', 'forever'")
			else
				commandValue[2] = winkTime - 1
			end
		elseif type(winkTime) == "string" then
			if winkTime == "forever" then
				commandValue[2] = IOUtils.winkTimeForever
			elseif winkTime == "manufacturerSpecific" then
				commandValue[2] = IOUtils.winkTimeManufacturerSpecific
			else
				error("Invalid wink time " .. tostring(winkTime) .. ", should be a number of seconds between 1 and 254 or one of particular values : manufacturerSpecific, forever")
			end
		end
	else
		commandValue[2] = 0
	end

	return commandValue
end

IOUtils.sensedUnit = {
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
IOUtils.energyTypes = {
	[0] = "Unknown",
	"Electricity",
	"Gas",
	"Oil",
	"Water",
	"Thermal Energy"
}
IOUtils.scaleFactors = {
	[0] = 1,
	10,
	100,
	1000,
	10000,
	100000,
	1000000,
	10000000,
	[253] = 0.001,
	[252] = 0.0001,
	[254] = 0.01,
	[251] = 1e-05,
	[255] = 0.1,
	[250] = 1e-06,
	[249] = 1e-07
}

function IOUtils.fromRawTemperatureValue(rawValue, lowerBound, upperBound)
	if rawValue == nil or lowerBound == nil or upperBound == nil then
		return nil
	end

	if rawValue >= 0 and rawValue <= 51200 then
		return CommonUtils.round((rawValue * (upperBound - lowerBound) / 51200 + lowerBound) / 100 - 273.15, 1)
	else
		return nil
	end
end

function IOUtils.toRawTemperatureValue(value, lowerBound, upperBound)
	if value == nil then
		return nil
	end

	if lowerBound == nil or upperBound == nil then
		error("Missing lower and/or upper temperature bounds states")
	end

	return CommonUtils.round(((value + 273.15) * 100 - lowerBound) * 51200 / (upperBound - lowerBound), 0)
end

function IOUtils.extractNumericFPPart(value, bitOffset, bitSize)
	if value == nil then
		return nil
	end

	local data = bytearray(2)

	data:writeUInt16(1, value)

	return BinaryUtils.extractBitRange(data, bitOffset, bitSize)
end

function IOUtils.getSOFOPUValue(value, index)
	if value == nil or type(value) ~= "userdata" then
		return nil
	end

	if index > 127 then
		error("this function is not able to read parameter after index 127, use io-somfy-utils.getParamValue instead")
	end

	local i = 1
	local taille = 1

	while i + 2 <= #value do
		taille = value[i + 1] + 1

		if value[i] == index then
			local data = bytearray(taille)
			local j = 1

			while j <= taille do
				data[j] = value[i + 1 + j]
				j = j + 1
			end

			if #data == 1 then
				return data:readInt8(1)
			elseif #data == 2 then
				return data:readInt16(1)
			else
				return data
			end
		end

		i = i + 2 + taille
	end

	return nil
end

function IOUtils.getRefreshMethod(value)
	return bytearray({
		value
	})
end

IOUtils.daughterboard = {}
IOUtils.daughterboard.hardwareVersion = {}
IOUtils.daughterboard.hardwareVersion.AVR32UC3B = 1
IOUtils.daughterboard.hardwareVersion.STM32F1xx = 2
IOUtils.daughterboard.hardwareVersion.toStr = {}
IOUtils.daughterboard.hardwareVersion.toStr[IOUtils.daughterboard.hardwareVersion.AVR32UC3B] = "AVR32UC3B"
IOUtils.daughterboard.hardwareVersion.toStr[IOUtils.daughterboard.hardwareVersion.STM32F1xx] = "STM32F1xx"
IOUtils.daughterboard.resetCauses = {}
IOUtils.daughterboard.resetCauses.AVR32UC3B = {}
IOUtils.daughterboard.resetCauses.AVR32UC3B[1] = "Cpu Err-Illegal Error"
IOUtils.daughterboard.resetCauses.AVR32UC3B[2] = "Power On Reset"
IOUtils.daughterboard.resetCauses.AVR32UC3B[3] = "External Pin Reset"
IOUtils.daughterboard.resetCauses.AVR32UC3B[4] = "Watchdog Reset"
IOUtils.daughterboard.resetCauses.AVR32UC3B[5] = "Unknown"
IOUtils.daughterboard.resetCauses.AVR32UC3B[6] = "Brown out detection"
IOUtils.daughterboard.resetCauses.STM32F1xx = {}
IOUtils.daughterboard.resetCauses.STM32F1xx[1] = "Software Reset"
IOUtils.daughterboard.resetCauses.STM32F1xx[2] = "Power On Reset"
IOUtils.daughterboard.resetCauses.STM32F1xx[3] = "External Pin Reset"
IOUtils.daughterboard.resetCauses.STM32F1xx[4] = "Watchdog Reset"
IOUtils.daughterboard.resetCauses.STM32F1xx[5] = "Window Watchdog Reset"
IOUtils.daughterboard.resetCauses.STM32F1xx[6] = "Low Power Reset"

function IOUtils.getDaughterboardHardResetDescription(rawValue, hardwareVersion)
	if rawValue == nil or type(rawValue) ~= "userdata" and type(rawValue) ~= "table" or hardwareVersion == nil then
		return nil
	end

	local resetCauseID = rawValue[1]
	local resetCauseStr

	if hardwareVersion == IOUtils.daughterboard.hardwareVersion.AVR32UC3B then
		resetCauseStr = IOUtils.daughterboard.resetCauses.AVR32UC3B[resetCauseID]
	elseif hardwareVersion == IOUtils.daughterboard.hardwareVersion.STM32F1xx then
		resetCauseStr = IOUtils.daughterboard.resetCauses.STM32F1xx[resetCauseID]
	end

	if resetCauseStr == nil then
		resetCauseStr = "unknown"
	end

	return resetCauseStr
end

function IOUtils.toRawHeatingLevel(value)
	local level = 64512

	if type(value) == "string" then
		if value == "off" then
			level = 64512
		elseif value == "frostprotection" then
			level = 64513
		elseif value == "eco" then
			level = 64514
		elseif value == "comfort-2" then
			level = 64515
		elseif value == "comfort-1" then
			level = 64516
		elseif value == "comfort" then
			level = 64517
		elseif value == "boost" then
			level = 64519
		elseif value == "secured" then
			level = 64575
		end
	end

	return level
end

IOUtils.sensorDefect = {}
IOUtils.sensorDefect.MAINTENANCE_REQUIRED = 1
IOUtils.sensorDefect.ENERGY_PROBLEM = 2
IOUtils.sensorDefect.MEASURE_VALUE = 4
IOUtils.sensorDefect.DEAD_SENSOR = 16

function IOUtils.getSensorDefect(rawValue)
	if type(rawValue) == "number" then
		if bit.band(rawValue, IOUtils.sensorDefect.MAINTENANCE_REQUIRED) ~= 0 then
			return "maintenanceRequired"
		elseif bit.band(rawValue, IOUtils.sensorDefect.ENERGY_PROBLEM) ~= 0 then
			return "lowBattery"
		elseif bit.band(rawValue, IOUtils.sensorDefect.DEAD_SENSOR) ~= 0 then
			return "dead"
		end
	end
end

function IOUtils.getDirtyRoomDefect(rawValue)
	if type(rawValue) == "number" and bit.band(rawValue, IOUtils.sensorDefect.MEASURE_VALUE) ~= 0 then
		return "dirty"
	end

	return nil
end

function IOUtils.createFPsForIndoorSiren(durationSeq, dutyCycleSeq, repetitionSeq, sonorousVolumeSeq, visualEffectSeq)
	local sirenDuration = IOUtils.getIndoorSirenDurationToNumber(durationSeq)
	local sirenRepetition = IOUtils.getIndoorSirenRepetitionToNumber(repetitionSeq)
	local sirenSonorousVolume = IOUtils.getIndoorSirenSonorousVolumeToNumber(sonorousVolumeSeq)
	local sirenVisualEffect = IOUtils.getIndoorSirenVisualEffectToNumber(visualEffectSeq)

	if sirenDuration == 0 and dutyCycleSeq ~= 0 then
		error("Unsupported Value: duration = 0 allowed only with 0 value for Duty cycle")
	end

	assert(sirenSonorousVolume ~= nil, "sirenSonorousVolume is nil")

	local sirenDutyCycle = CommonUtils.scaleChange(dutyCycleSeq, 0, 100, 0, 31)
	local fpSoundDuration = sirenDuration + bit.lshift(sirenDutyCycle, 11)
	local fpOptions = sirenRepetition + bit.lshift(sirenSonorousVolume, 10) + bit.lshift(sirenVisualEffect, 13)

	return fpSoundDuration, fpOptions
end

function IOUtils.getIndoorSirenDurationToNumber(durationSeq)
	if durationSeq == nil then
		return nil
	end

	if type(durationSeq) == "number" then
		return CommonUtils.round(durationSeq / 100)
	elseif type(durationSeq) == "string" then
		if durationSeq == "defaultDuration" then
			return 2047
		elseif durationSeq == "defaultSoundPattern" then
			return 0
		else
			error("Unsupported Value for duration : " .. durationSeq)
		end
	else
		return nil
	end
end

function IOUtils.getIndoorSirenRepetitionToNumber(repetitionSeq)
	if repetitionSeq == nil then
		return nil
	end

	if type(repetitionSeq) == "number" then
		return repetitionSeq
	elseif type(repetitionSeq) == "string" then
		if repetitionSeq == "noRepetition" then
			return 0
		elseif repetitionSeq == "unlimited" then
			return 1023
		else
			error("Unsupported Value for repetitions : " .. repetitionSeq)
		end
	else
		return nil
	end
end

function IOUtils.getIndoorSirenSonorousVolumeToNumber(sonorousVolumeSeq)
	if sonorousVolumeSeq == nil then
		return nil
	end

	if type(sonorousVolumeSeq) == "string" then
		if sonorousVolumeSeq == "highest" then
			return 0
		elseif sonorousVolumeSeq == "standard" then
			return 3
		elseif sonorousVolumeSeq == "lowest" then
			return 5
		elseif sonorousVolumeSeq == "noSound" then
			return 6
		elseif sonorousVolumeSeq == "default" then
			return 7
		else
			error("Unsupported Value for sonorous volume: " .. sonorousVolumeSeq)
		end
	else
		return nil
	end
end

function IOUtils.getIndoorSirenVisualEffectToNumber(visualEffectSeq)
	if visualEffectSeq == nil then
		return nil
	end

	if type(visualEffectSeq) == "string" then
		if visualEffectSeq == "noVisualEffect" then
			return 0
		elseif visualEffectSeq == "slowBlinking" then
			return 1
		elseif visualEffectSeq == "quickBlinking" then
			return 2
		elseif visualEffectSeq == "linkedSonorousSequence" then
			return 3
		elseif visualEffectSeq == "default" then
			return 7
		else
			error("Unsupported Value for visual effect: " .. visualEffectSeq)
		end
	else
		return nil
	end
end

function IOUtils.ringWithSingleSequence(duration, dutyCycle, repetition, sonorousVolume, visualEffect, memorizedVolume)
	if visualEffect == nil then
		visualEffect = "noVisualEffect"
	end

	if duration == nil or dutyCycle == nil or repetition == nil or sonorousVolume == nil or visualEffect == nil then
		return nil
	end

	if memorizedVolume == nil then
		memorizedVolume = "highest"
	end

	if sonorousVolume == "memorizedVolume" then
		sonorousVolume = memorizedVolume
	end

	local valueFP9, valueFP10 = IOUtils.createFPsForIndoorSiren(duration, dutyCycle, repetition, sonorousVolume, visualEffect)

	return IOUtils.createActivateFunc(0, {
		{
			9,
			valueFP9
		},
		{
			10,
			valueFP10
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

function IOUtils.ringWithDoubleSequence(durationSeq1, dutyCycleSeq1, repetitionSeq1, sonorousVolumeSeq1, visualEffectSeq1, durationSeq2, dutyCycleSeq2, repetitionSeq2, sonorousVolumeSeq2, visualEffectSeq2, memorizedVolume)
	if visualEffectSeq1 == nil then
		visualEffectSeq1 = "noVisualEffect"
	end

	if visualEffectSeq2 == nil then
		visualEffectSeq2 = "noVisualEffect"
	end

	if durationSeq1 == nil or dutyCycleSeq1 == nil or repetitionSeq1 == nil or sonorousVolumeSeq1 == nil or visualEffectSeq1 == nil then
		return nil
	end

	if durationSeq2 == nil or dutyCycleSeq2 == nil or repetitionSeq2 == nil or sonorousVolumeSeq2 == nil or visualEffectSeq2 == nil then
		return nil
	end

	if memorizedVolume == nil then
		memorizedVolume = "highest"
	end

	if sonorousVolumeSeq1 == "memorizedVolume" then
		sonorousVolumeSeq1 = memorizedVolume
	end

	if sonorousVolumeSeq2 == "memorizedVolume" then
		sonorousVolumeSeq2 = memorizedVolume
	end

	local valueFP9, valueFP10 = IOUtils.createFPsForIndoorSiren(durationSeq1, dutyCycleSeq1, repetitionSeq1, sonorousVolumeSeq1, visualEffectSeq1)
	local valueFP11, valueFP12 = IOUtils.createFPsForIndoorSiren(durationSeq2, dutyCycleSeq2, repetitionSeq2, sonorousVolumeSeq2, visualEffectSeq2)

	return IOUtils.createActivateFunc(0, {
		{
			9,
			valueFP9
		},
		{
			10,
			valueFP10
		},
		{
			11,
			valueFP11
		},
		{
			12,
			valueFP12
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

function IOUtils.ringWithThreeSequence(durationSeq1, dutyCycleSeq1, repetitionSeq1, sonorousVolumeSeq1, visualEffectSeq1, durationSeq2, dutyCycleSeq2, repetitionSeq2, sonorousVolumeSeq2, visualEffectSeq2, durationSeq3, dutyCycleSeq3, repetitionSeq3, sonorousVolumeSeq3, visualEffectSeq3, memorizedVolume)
	if visualEffectSeq1 == nil then
		visualEffectSeq1 = "noVisualEffect"
	end

	if visualEffectSeq2 == nil then
		visualEffectSeq2 = "noVisualEffect"
	end

	if visualEffectSeq3 == nil then
		visualEffectSeq3 = "noVisualEffect"
	end

	if durationSeq1 == nil or dutyCycleSeq1 == nil or repetitionSeq1 == nil or sonorousVolumeSeq1 == nil or visualEffectSeq1 == nil then
		return nil
	end

	if durationSeq2 == nil or dutyCycleSeq2 == nil or repetitionSeq2 == nil or sonorousVolumeSeq2 == nil or visualEffectSeq2 == nil then
		return nil
	end

	if durationSeq3 == nil or dutyCycleSeq3 == nil or repetitionSeq3 == nil or sonorousVolumeSeq3 == nil or visualEffectSeq3 == nil then
		return nil
	end

	if memorizedVolume == nil then
		memorizedVolume = "highest"
	end

	if sonorousVolumeSeq1 == "memorizedVolume" then
		sonorousVolumeSeq1 = memorizedVolume
	end

	if sonorousVolumeSeq2 == "memorizedVolume" then
		sonorousVolumeSeq2 = memorizedVolume
	end

	if sonorousVolumeSeq3 == "memorizedVolume" then
		sonorousVolumeSeq3 = memorizedVolume
	end

	local valueFP9, valueFP10 = IOUtils.createFPsForIndoorSiren(durationSeq1, dutyCycleSeq1, repetitionSeq1, sonorousVolumeSeq1, visualEffectSeq1)
	local valueFP11, valueFP12 = IOUtils.createFPsForIndoorSiren(durationSeq2, dutyCycleSeq2, repetitionSeq2, sonorousVolumeSeq2, visualEffectSeq2)
	local valueFP13, valueFP14 = IOUtils.createFPsForIndoorSiren(durationSeq3, dutyCycleSeq3, repetitionSeq3, sonorousVolumeSeq3, visualEffectSeq3)

	return IOUtils.createActivateFunc(0, {
		{
			9,
			valueFP9
		},
		{
			10,
			valueFP10
		},
		{
			11,
			valueFP11
		},
		{
			12,
			valueFP12
		},
		{
			13,
			valueFP13
		},
		{
			14,
			valueFP14
		}
	})
end

function IOUtils.getBatteryLevel(executeStatus, offset)
	if executeStatus == nil then
		return nil
	end

	return bit.rshift(bit.band(executeStatus, 96), offset)
end

function IOUtils.getBatteryLevelValue(executeStatus, offset)
	local batteryLevel = IOUtils.getBatteryLevel(executeStatus, offset)

	if batteryLevel == nil or batteryLevel == 0 then
		return nil
	elseif batteryLevel == 1 then
		return "low"
	elseif batteryLevel == 2 then
		return "normal"
	elseif batteryLevel == 3 then
		return "full"
	else
		return nil
	end
end

function IOUtils.RGBToVector(red, green, blue)
	assert(type(red) == "number", "invalid type for red value")
	assert(type(green) == "number", "invalid type for green value")
	assert(type(blue) == "number", "invalid type for blue value")

	if red < 0 or red > 255 then
		error("red value (" .. red .. ") is out of range, should be between 0 and 255. ")
	end

	if green < 0 or green > 255 then
		error("green value (" .. green .. ") is out of range, should be between 0 and 255. ")
	end

	if blue < 0 or blue > 255 then
		error("blue value (" .. blue .. ") is out of range, should be between 0 and 255. ")
	end

	local r, g, b, X, Y, Z, u, v

	r = red / 255
	g = green / 255
	b = blue / 255
	X = 2.7689 * r + 1.7517 * g + 1.1302 * b
	Y = 1 * r + 4.5907 * g + 0.0601 * b
	Z = 0.056508 * g + 5.5943 * b
	u = 4 * X / (X + 15 * Y + 3 * Z)
	v = 9 * Y / (X + 15 * Y + 3 * Z)

	local intensity = math.max(r, g, b) * 100

	return u, v, intensity
end

function IOUtils.vectorToRGB(u, v, intensity)
	assert(type(u) == "number", "invalid type for 'u' value")
	assert(type(v) == "number", "invalid type for 'v' value")
	assert(type(intensity) == "number", "invalid type for 'intensity' value")

	local r, g, b, X, Z, R, G, B

	if v == 0 or u == 0 then
		return 0, 0, 0
	end

	X = 2.25 * u / v
	Z = (-3 * u - 20 * v + 12) / (4 * v)
	r = 0.41847 * X - 0.15866 - 0.082835 * Z
	g = -0.091169 * X + 0.25243 + 0.015708 * Z
	b = 0.0009209 * X - 0.0025498 + 0.1786 * Z

	if r < 0 then
		r = 0
	elseif r > 1 then
		r = 1
	end

	if g < 0 then
		g = 0
	elseif g > 1 then
		g = 1
	end

	if b < 0 then
		b = 0
	elseif b > 1 then
		b = 1
	end

	local scaleFactor = 255 / (100 * math.max(r, g, b))

	R = math.round(scaleFactor * r * intensity)
	G = math.round(scaleFactor * g * intensity)
	B = math.round(scaleFactor * b * intensity)

	return R, G, B
end

IOUtils.microModule = {}
IOUtils.microModule.controllerType = {}
IOUtils.microModule.controllerType.micromodule = 0
IOUtils.microModule.controllerType.oneWayController = 1
IOUtils.microModule.controllerType.standAloneController = 2
IOUtils.microModule.batteryState = {}
IOUtils.microModule.batteryState.critical = 0
IOUtils.microModule.batteryState.low = 1
IOUtils.microModule.batteryState.medium = 2
IOUtils.microModule.batteryState.high = 3
IOUtils.microModule.batteryState.unknown = 4
IOUtils.microModule.batteryState.notSupported = 5

function IOUtils.getMicroModuleLowBattery(p1)
	local microModuleWithLowBattery = 0
	local pairedOneWayDescription = {}
	local lastIndex = 1
	local size = 1
	local i = 1

	while i < #p1 do
		local parameterIndex = 1

		if p1[i] == 255 then
			pairedOneWayDescription[#pairedOneWayDescription + 1] = p1:sub(lastIndex, i - 1)
			lastIndex = i + 1
			i = i + 1
		else
			size = p1[i + 1] + 1
			i = i + size + 2
		end
	end

	pairedOneWayDescription[#pairedOneWayDescription + 1] = p1:sub(lastIndex, #p1)

	local controllerType

	for j = 1, #pairedOneWayDescription do
		controllerType = IOUtils.getSOFOPUValue(pairedOneWayDescription[j], 7)

		local batteryState = IOUtils.getSOFOPUValue(pairedOneWayDescription[j], 8)

		if controllerType == IOUtils.microModule.controllerType.micromodule and batteryState <= IOUtils.microModule.batteryState.low then
			microModuleWithLowBattery = microModuleWithLowBattery + 1
		end
	end

	return microModuleWithLowBattery
end

function IOUtils.getSOFOPUParamSize(value, index)
	if value == nil or type(value) ~= "userdata" then
		return nil
	end

	local i = 1
	local size = 1

	while i + 2 < #value do
		if value[i] < 128 then
			size = value[i + 1] + 1

			if value[i] == index then
				return size
			end

			i = i + 2 + size
		else
			size = value[i + 2] + 1

			if value[i] == index then
				return size
			end

			i = i + 3 + size
		end
	end

	error("parameter " .. tostring(index) .. "does not exist")
end

function IOUtils.updateSOFOPUParam(stateValue, parameterValue, index)
	assert(index ~= nil, "index should not be null")
	assert(stateValue ~= nil, "state Value is nil")
	assert(type(stateValue) == "userdata", "wrong stateValue type : " .. type(stateValue) .. ", should be 'userdata'")

	local parameterSize = IOUtils.getSOFOPUParamSize(stateValue, index)

	if parameterSize ~= #parameterValue then
		error("parameter lenght is " .. tostring(#parameterValue) .. " - should be: " .. tostring(parameterSize))
	end

	local i = 1
	local size = 1

	while i + 2 <= #stateValue do
		if stateValue[i] < 128 then
			size = stateValue[i + 1] + 1

			if stateValue[i] == index then
				local j = 1

				while j <= size do
					stateValue[i + 1 + j] = parameterValue[j]
					j = j + 1
				end

				return stateValue
			end

			i = i + 2 + size
		else
			size = stateValue[i + 2] + 1

			if stateValue[i] == index then
				local j = 1

				while j <= size do
					stateValue[i + 2 + j] = parameterValue[j]
					j = j + 1
				end

				return stateValue
			end

			i = i + 3 + size
		end
	end

	error("parameter " .. tostring(index) .. "does not exist")
end

function IOUtils.updatePublicState(stateValue, stateId, manufactureId)
	assert(type(stateValue) == "userdata", "wrong stateValue type : " .. type(stateValue) .. ", should be 'userdata'")

	local stateIdArray = bytearray(2)
	local manufactureIdArray = bytearray(1)

	stateIdArray:writeInt16(1, stateId)
	manufactureIdArray:writeInt8(1, manufactureId)

	return manufactureIdArray:append(stateIdArray):append(bytearray(2)):append(stateValue)
end

IOUtils.SomfyHeatingSystem = {}
IOUtils.SomfyHeatingSystem.days = {
	"monday",
	"tuesday",
	"wednesday",
	"thursday",
	"friday",
	"saturday",
	"sunday"
}
IOUtils.SomfyHeatingSystem.modes = {
	[0] = "comfort",
	"away",
	"eco",
	"geofencingMode",
	"manual",
	"frostprotection",
	"suddenDropMode"
}
IOUtils.SomfyHeatingSystem.reverseModes = {
	frostprotection = 5,
	comfort = 0,
	eco = 2,
	geofencingMode = 3,
	suddenDropMode = 6,
	manual = 4,
	away = 1
}
IOUtils.SomfyHeatingSystem.indexModeTemp = {
	frostprotection = 5,
	comfort = 1,
	eco = 3,
	geofencingMode = 4,
	suddenDropMode = 6,
	away = 2
}
IOUtils.SomfyHeatingSystem.derogationModes = {
	further_notice = 1,
	next_mode = 2,
	derog = 3,
	date = 0
}
IOUtils.SomfyHeatingSystem.indexSettingMask = {
	ByPass = 4,
	SummerProtection = 8,
	HeatingAnticipation = 16,
	OpenWindow = 1,
	PermanentDisplay = 4,
	LockKey = 2
}

function IOUtils.SomfyHeatingSystem.getCalendar(p1)
	local timetable = {
		{},
		{},
		{},
		{},
		{},
		{},
		{}
	}
	local index = 0
	local nbTimeSlot = 0
	local timeslots

	while index < #p1 do
		nbTimeSlot = p1[index + 2]
		timeslots = {}

		for j = 1, nbTimeSlot do
			timeslots[j] = {}
			timeslots[j].m = p1[index + 3 + (j - 1) * 3]
			timeslots[j].f = IOUtils.SomfyHeatingSystem.convertTime(p1[index + 4 + (j - 1) * 3])
			timeslots[j].t = IOUtils.SomfyHeatingSystem.convertTime(p1[index + 5 + (j - 1) * 3])
		end

		for k = 0, 6 do
			if bit.band(bit.rshift(p1[index + 1], k), 1) == 1 then
				timetable[k + 1] = timeslots
			end
		end

		index = index + nbTimeSlot * 3 + 2
	end

	return timetable
end

function IOUtils.SomfyHeatingSystem.expandCalendar(rawValue)
	local value = {}

	for dayIdx, timeslots in pairs(rawValue) do
		local day = IOUtils.SomfyHeatingSystem.days[dayIdx]

		value[day] = {}
		value[day].timeslots = {}

		for timeslotIdx, timeslot in pairs(timeslots) do
			value[day].timeslots[timeslotIdx] = {
				mode = IOUtils.SomfyHeatingSystem.modes[timeslot.m],
				from = {
					hour = timeslot.f[1],
					minute = timeslot.f[2]
				},
				to = {
					hour = timeslot.t[1],
					minute = timeslot.t[2]
				}
			}
		end
	end

	return value
end

function IOUtils.SomfyHeatingSystem.setCalendar(p1)
	local mergedDays = {}

	for dayIdx, day in pairs(p1) do
		if day.timeslots == nil or #day.timeslots == 0 then
			error("Missing timeslots")
		end

		if #day.timeslots > 7 then
			error("Max 7 timeslots allowed")
		end

		local sameTimeslotExists = false

		for mergedDayIdx, mergedDay in pairs(mergedDays) do
			if IOUtils.SomfyHeatingSystem.equalsTimeslots(mergedDay.timeslots, day.timeslots) then
				local newDayIdx = #mergedDays[mergedDayIdx].days + 1

				mergedDays[mergedDayIdx].days[newDayIdx] = dayIdx
				sameTimeslotExists = true

				break
			end
		end

		if sameTimeslotExists == false then
			mergedDays[#mergedDays + 1] = {
				days = {
					dayIdx
				},
				timeslots = day.timeslots
			}
		end
	end

	local timetable = bytearray(0)

	for mergedDayIdx, mergedDay in pairs(mergedDays) do
		local byteDay = 0

		for dayIdx, day in pairs(mergedDay.days) do
			byteDay = byteDay + IOUtils.SomfyHeatingSystem.invertDay(day)
		end

		local header = bytearray(2)

		header[1] = byteDay
		header[2] = #mergedDay.timeslots
		timetable = timetable:append(header)

		for timeslotIdx, timeslot in ipairs(mergedDay.timeslots) do
			if IOUtils.SomfyHeatingSystem.reverseModes[timeslot.mode] == nil then
				error("Unknown mode value : " .. timeslot.mode .. ". Available modes : comfort, away, eco, geofencingMode, manual, frostprotection, suddenDropMode")
			end

			local slot = bytearray(3)

			slot[1] = IOUtils.SomfyHeatingSystem.reverseModes[timeslot.mode]
			slot[2] = IOUtils.SomfyHeatingSystem.invertTime(timeslot.from)
			slot[3] = IOUtils.SomfyHeatingSystem.invertTime(timeslot.to)
			timetable = timetable:append(slot)
		end
	end

	return timetable
end

function IOUtils.SomfyHeatingSystem.equalsTimeslots(timeslots1, timeslots2)
	if #timeslots1 ~= #timeslots2 then
		return false
	end

	for idx, timeslot in ipairs(timeslots1) do
		if timeslot.from.hour ~= timeslots2[idx].from.hour then
			return false
		end

		if timeslot.from.minute ~= timeslots2[idx].from.minute then
			return false
		end

		if timeslot.to.hour ~= timeslots2[idx].to.hour then
			return false
		end

		if timeslot.to.minute ~= timeslots2[idx].to.minute then
			return false
		end

		if timeslot.mode ~= timeslots2[idx].mode then
			return false
		end
	end

	return true
end

function IOUtils.SomfyHeatingSystem.convertTime(timeslot)
	local time = {}

	time[1] = math.floor(timeslot * 15 / 60)
	time[2] = timeslot * 15 % 60

	return time
end

function IOUtils.SomfyHeatingSystem.invertDay(day)
	for dayIdx, dayValue in ipairs(IOUtils.SomfyHeatingSystem.days) do
		if dayValue == day then
			return bit.lshift(1, dayIdx - 1)
		end
	end

	error("Unknown day : " .. day)
end

function IOUtils.SomfyHeatingSystem.invertTime(time)
	if time == nil or type(time) ~= "table" or type(time.hour) ~= "number" or type(time.minute) ~= "number" then
		error("Time value must be an array with 2 number values")
	end

	return time.hour * 4 + math.floor(time.minute / 15)
end

function IOUtils.SomfyHeatingSystem.getCalendarStateId(rawProgId)
	local progId = tonumber(rawProgId)

	if progId == 1 then
		return 42534
	elseif progId == 2 then
		return 42535
	else
		error("Unknown time program " .. progId .. ", available program ids are 1 and 2")
	end
end

function IOUtils.SomfyHeatingSystem.updateAllModeTemperatures(comfortTemperature, ecoTemperature, awayTemp, frostprotectionTemperature, virtualStateValue, realStateValue)
	if comfortTemperature == nil or type(comfortTemperature) ~= "number" or comfortTemperature < 5 or comfortTemperature > 26 then
		error("Comfort temperature value must be an integer between 5 and 26")
	end

	if ecoTemperature == nil or type(ecoTemperature) ~= "number" or ecoTemperature < 5 or ecoTemperature > 26 then
		error("ecoTemperature value must be an integer between 5 and 26")
	end

	if awayTemp == nil or type(awayTemp) ~= "number" or awayTemp < 5 or awayTemp > 26 then
		error("Axway temperature value must be an integer between 5 and 26")
	end

	if frostprotectionTemperature == nil or type(frostprotectionTemperature) ~= "number" or frostprotectionTemperature < 5 or frostprotectionTemperature > 26 then
		error("Frost protection temperature value must be an integer between 5 and 26")
	end

	local stateValue = IOUtils.SomfyHeatingSystem.guessBestStateValue(virtualStateValue, realStateValue, 6)

	stateValue[1] = comfortTemperature * 2
	stateValue[2] = awayTemp * 2
	stateValue[3] = ecoTemperature * 2
	stateValue[5] = frostprotectionTemperature * 2

	return stateValue
end

function IOUtils.SomfyHeatingSystem.updateOffsetValveConfiguration(offSetValue, stateValue)
	if offSetValue == nil or type(offSetValue) ~= "number" or offSetValue < -20 or offSetValue > 20 then
		error("Valve settings state not exists")
	end

	if offSetValue < 0 then
		stateValue[4] = 128
	else
		stateValue[4] = 0
	end

	stateValue[5] = math.abs(offSetValue) * 10

	return stateValue
end

function IOUtils.SomfyHeatingSystem.updateThermostatConfiguration(value, stateValue, position)
	if value == nil or type(value) ~= "number" then
		error("Thermostat settings state not exists")
	end

	if value < -5 or value > 5 then
		error("Out of range value.")
	end

	if value < 0 then
		stateValue[position] = 128 + math.abs(value) * 10
	else
		stateValue[position] = 0 + math.abs(value) * 10
	end

	return stateValue
end

function IOUtils.SomfyHeatingSystem.updateMinSetpoint(minSetPointValue, stateValue)
	stateValue[3] = math.floor(minSetPointValue * 2)

	return stateValue
end

function IOUtils.SomfyHeatingSystem.updateMaxSetpoint(maxSetPointValue, stateValue)
	stateValue[2] = math.floor(maxSetPointValue * 2)

	return stateValue
end

function IOUtils.SomfyHeatingSystem.updateValveSettings(settingValues, virtualStateValue, realStateValue)
	local stateValue = IOUtils.SomfyHeatingSystem.guessBestStateValue(virtualStateValue, realStateValue, 5)

	if settingValues.minSetpoint ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateMinSetpoint(settingValues.minSetpoint, stateValue)
	end

	if settingValues.maxSetpoint ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateMaxSetpoint(settingValues.maxSetpoint, stateValue)
	end

	if settingValues.temperatureOffset ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateOffsetValveConfiguration(settingValues.temperatureOffset, stateValue)
	end

	if settingValues.openWindow ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateConfiguration("OpenWindow", settingValues.openWindow, stateValue)
	end

	if settingValues.lockKey ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateConfiguration("LockKey", settingValues.lockKey, stateValue)
	end

	if settingValues.byPass ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateConfiguration("ByPass", settingValues.byPass, stateValue)
	end

	if settingValues.activeTimeProgram ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateActiveCalendar(settingValues.activeTimeProgram, stateValue)
	end

	return stateValue
end

function IOUtils.SomfyHeatingSystem.updateThermostatSettings(settingValues, virtualStateValue, realStateValue)
	local stateValue = IOUtils.SomfyHeatingSystem.guessBestStateValue(virtualStateValue, realStateValue, 5)

	if settingValues.minSetpoint ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateMinSetpoint(settingValues.minSetpoint, stateValue)
	end

	if settingValues.maxSetpoint ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateMaxSetpoint(settingValues.maxSetpoint, stateValue)
	end

	if settingValues.temperatureOffset ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateThermostatConfiguration(settingValues.temperatureOffset, stateValue, 4)
	end

	if settingValues.hysteresis ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateThermostatConfiguration(settingValues.hysteresis, stateValue, 5)
	end

	if settingValues.openWindow ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateConfiguration("OpenWindow", settingValues.openWindow, stateValue)
	end

	if settingValues.lockKey ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateConfiguration("LockKey", settingValues.lockKey, stateValue)
	end

	if settingValues.summerProtection ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateConfiguration("SummerProtection", settingValues.summerProtection, stateValue)
	end

	if settingValues.permanentDisplay ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateConfiguration("PermanentDisplay", settingValues.permanentDisplay, stateValue)
	end

	if settingValues.heatingAnticipation ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateConfiguration("HeatingAnticipation", settingValues.heatingAnticipation, stateValue)
	end

	if settingValues.activeTimeProgram ~= nil then
		stateValue = IOUtils.SomfyHeatingSystem.updateActiveCalendar(settingValues.activeTimeProgram, stateValue)
	end

	return stateValue
end

function IOUtils.SomfyHeatingSystem.updateActiveCalendar(progId, stateValue)
	local programValue = 0

	if progId == 1 or progId == 2 then
		programValue = progId
	elseif progId ~= "none" then
		error("Unknown time program " .. progId .. ", available program ids are 1, 2 and 'none'")
	end

	local newValue = bit.band(stateValue[1], 63)

	newValue = bit.bor(newValue, bit.lshift(programValue, 6))
	stateValue[1] = newValue

	return stateValue
end

function IOUtils.SomfyHeatingSystem.updateConfiguration(settingName, settingValue, stateValue)
	if settingValue == true then
		stateValue[1] = bit.bor(stateValue[1], IOUtils.SomfyHeatingSystem.indexSettingMask[settingName])
	else
		stateValue[1] = bit.band(stateValue[1], 255 - IOUtils.SomfyHeatingSystem.indexSettingMask[settingName])
	end

	return stateValue
end

function IOUtils.SomfyHeatingSystem.updateDerogation(heatingModeOrTemperature, derogationModeOrDuration, temperatureMin, temperatureMax)
	if type(heatingModeOrTemperature) == "string" then
		assert(IOUtils.SomfyHeatingSystem.reverseModes[heatingModeOrTemperature] ~= nil and heatingModeOrTemperature ~= "manual", "wrong value for heating mode : " .. heatingModeOrTemperature)
	elseif type(heatingModeOrTemperature) == "number" then
		assert(heatingModeOrTemperature ~= 0 and heatingModeOrTemperature >= 5 and heatingModeOrTemperature <= 26, "heatingMode should be a value between 5 and 26")
	else
		error("wrong type for heatingMode : " .. type(heatingModeOrTemperature) .. " should be string or number")
	end

	if type(derogationModeOrDuration) == "string" then
		assert(IOUtils.SomfyHeatingSystem.derogationModes[derogationModeOrDuration] ~= nil and derogationModeOrDuration ~= "date", "wrong value for derogation type")
	elseif type(derogationModeOrDuration) == "number" then
		assert(derogationModeOrDuration >= 0, "derogation duration must be positive or equal to 0")
	else
		error("wrong type for derogationModeOrDuration : " .. type(derogationModeOrDuration) .. " should be string or number")
	end

	return IOUtils.SomfyHeatingSystem.setDerogation(heatingModeOrTemperature, derogationModeOrDuration, temperatureMin, temperatureMax)
end

function IOUtils.SomfyHeatingSystem.setDerogation(heatingModeOrTemperature, derogationModeOrDuration, temperatureMin, temperatureMax)
	local startDate = os.time()
	local endDate = startDate
	local manualTemp = math.ceil(temperatureMax + temperatureMin) / 2
	local heatingMode, derogationType

	if type(heatingModeOrTemperature) == "string" then
		heatingMode = IOUtils.SomfyHeatingSystem.reverseModes[heatingModeOrTemperature]
	elseif type(heatingModeOrTemperature) == "number" then
		heatingMode = IOUtils.SomfyHeatingSystem.reverseModes.manual
		manualTemp = heatingModeOrTemperature
	else
		error("wrong type for heatingMode : " .. type(heatingModeOrTemperature) .. " should be string or number")
	end

	if type(derogationModeOrDuration) == "string" then
		assert(IOUtils.SomfyHeatingSystem.derogationModes[derogationModeOrDuration] ~= nil, "wrong value for derogation type")

		derogationType = IOUtils.SomfyHeatingSystem.derogationModes[derogationModeOrDuration]
	elseif type(derogationModeOrDuration) == "number" then
		derogationType = IOUtils.SomfyHeatingSystem.derogationModes.date
		endDate = startDate + derogationModeOrDuration
	else
		error("wrong type for derogationModeOrDuration : " .. type(derogationModeOrDuration) .. " should be string or number")
	end

	return bytearray({
		bit.lshift(heatingMode, 3) + derogationType,
		manualTemp * 2,
		bit.band(bit.rshift(startDate, 24), 255),
		bit.band(bit.rshift(startDate, 16), 255),
		bit.band(bit.rshift(startDate, 8), 255),
		bit.band(startDate, 255),
		bit.band(bit.rshift(endDate, 24), 255),
		bit.band(bit.rshift(endDate, 16), 255),
		bit.band(bit.rshift(endDate, 8), 255),
		bit.band(endDate, 255)
	})
end

function IOUtils.SomfyHeatingSystem.guessBestStateValue(virtualStateValue, realStateValue, requiredSize)
	if virtualStateValue ~= nil and type(virtualStateValue) == "userdata" and #virtualStateValue == requiredSize then
		return virtualStateValue
	end

	if realStateValue == nil or type(realStateValue) ~= "userdata" or #realStateValue ~= requiredSize then
		error("Valve state not exists")
	end

	return realStateValue
end

function IOUtils.updateAndRefreshPublicState(stateValue, stateId, manufactureId)
	local manufactureIdArray = bytearray(1)

	manufactureIdArray:writeInt8(1, manufactureId)

	local stateIdArray = bytearray(2)

	stateIdArray:writeInt16(1, stateId)

	return IOUtils.updatePublicState(stateValue, stateId, manufactureId), nil, manufactureIdArray:append(stateIdArray), {
		access = "r"
	}
end

function IOUtils.toOpenClosedPedestrianState(p1, p2, p3)
	if p1 == 51200 then
		return "closed"
	elseif p1 == p2 or p3 == 55303 then
		return "pedestrian"
	elseif p1 == 54272 then
		return "unknown"
	else
		return "open"
	end
end

function IOUtils.getTypeFromSetAndGO(data)
	if data == nil then
		error("Data from SetAndGo is nil!")
	end

	if type(data) ~= "number" then
		error("Data from SetAndGo is not a number!")
	end

	local data1 = bit.band(data, 255)
	local data2 = bit.rshift(bit.band(data, 65280), 8)

	if data1 == 255 and data2 ~= 0 and data2 ~= 255 then
		return data2
	elseif data1 ~= 0 and data1 ~= 255 and data2 == 0 then
		return data1
	end

	error("Cannot parse and extract Data from Set & Go. Unexpected format for : " .. data)
end

function IOUtils.toPercentValue(relativeValue)
	return CommonUtils.round(relativeValue / 512)
end

local function isRelativeValue(value)
	if value ~= nil and value >= 0 and value <= 51200 then
		return true
	end

	return false
end

function IOUtils.toPercentTargetValue(targetValue, currentValue, aliases)
	local relativeValue = currentValue

	if isRelativeValue(targetValue) then
		relativeValue = targetValue
	elseif aliases ~= nil and isRelativeValue(aliases[targetValue]) then
		relativeValue = aliases[targetValue]
	end

	return IOUtils.toPercentValue(relativeValue)
end

function IOUtils.toMultiTypeSensorTiltedValue(data)
	if data == nil then
		error("Data from sensor is nil!")
	end

	if bit.band(data, IOUtils.multiTypeSensor.TiltAxis.OpenMask) == IOUtils.multiTypeSensor.TiltAxis.Open or bit.band(data, IOUtils.multiTypeSensor.TiltAxis.OpenMask) == IOUtils.multiTypeSensor.TiltAxis.Ventilation or bit.band(data, IOUtils.multiTypeSensor.TiltAxis.LockMask) == IOUtils.multiTypeSensor.TiltAxis.Unlock then
		return true
	elseif bit.band(data, IOUtils.multiTypeSensor.TiltAxis.OpenMask) == IOUtils.multiTypeSensor.TiltAxis.Close or bit.band(data, IOUtils.multiTypeSensor.TiltAxis.LockMask) == IOUtils.multiTypeSensor.TiltAxis.Lock then
		return false
	end

	return nil
end

function IOUtils.getMultiTypeSensorAxisOpenClosed(data, axis)
	local openCloseValue = bit.band(data, axis.OpenMask)
	local lockCloseValue = bit.band(data, axis.LockMask)

	if openCloseValue ~= axis.Unknown then
		if openCloseValue == axis.Close then
			return "closed"
		end

		return "open"
	end

	if lockCloseValue ~= axis.Unknown then
		if lockCloseValue == axis.Lock then
			return "closed"
		end

		return "open"
	end

	return nil
end

function IOUtils.toMultiTypeSensorOpenClosedValue(data)
	if data == nil then
		error("Data from sensor is nil!")
	end

	local turnAxis = IOUtils.getMultiTypeSensorAxisOpenClosed(data, IOUtils.multiTypeSensor.TurnAxis)
	local slideAxis = IOUtils.getMultiTypeSensorAxisOpenClosed(data, IOUtils.multiTypeSensor.SlidingAxis)

	if turnAxis == "open" or slideAxis == "open" then
		return "open"
	end

	if turnAxis == nil and slideAxis == nil then
		return nil
	end

	return "closed"
end

function IOUtils.toMultiTypeSensorLockedUnlockedValue(data)
	local tiltAxisLockMask = IOUtils.multiTypeSensor.TiltAxis.LockMask
	local turnAxisLockMask = IOUtils.multiTypeSensor.TurnAxis.LockMask
	local slidingAxisLockMask = IOUtils.multiTypeSensor.SlidingAxis.LockMask

	if data == nil then
		error("Data from sensor is nil!")
	end

	if bit.band(data, tiltAxisLockMask) == IOUtils.multiTypeSensor.TiltAxis.Unlock or bit.band(data, turnAxisLockMask) == IOUtils.multiTypeSensor.TurnAxis.Unlock or bit.band(data, slidingAxisLockMask) == IOUtils.multiTypeSensor.SlidingAxis.Unlock then
		return "unlocked"
	elseif bit.band(data, tiltAxisLockMask) == IOUtils.multiTypeSensor.TiltAxis.Lock or bit.band(data, turnAxisLockMask) == IOUtils.multiTypeSensor.TurnAxis.Lock or bit.band(data, slidingAxisLockMask) == IOUtils.multiTypeSensor.SlidingAxis.Lock then
		return "locked"
	elseif bit.band(data, IOUtils.multiTypeSensor.GeneralInfo.OpenMask) == 32768 then
		return "locked"
	else
		return "unlocked"
	end
end

IOUtils.multiTypeSensor = {}
IOUtils.multiTypeSensor.GeneralInfo = {}
IOUtils.multiTypeSensor.GeneralInfo.OpenMask = 32768
IOUtils.multiTypeSensor.GeneralInfo.Open = 0
IOUtils.multiTypeSensor.GeneralInfo.Close = 32768
IOUtils.multiTypeSensor.TiltAxis = {}
IOUtils.multiTypeSensor.TiltAxis.LockMask = 768
IOUtils.multiTypeSensor.TiltAxis.OpenMask = 3072
IOUtils.multiTypeSensor.TiltAxis.Close = 3072
IOUtils.multiTypeSensor.TiltAxis.Ventilation = 2048
IOUtils.multiTypeSensor.TiltAxis.Open = 1024
IOUtils.multiTypeSensor.TiltAxis.Lock = 768
IOUtils.multiTypeSensor.TiltAxis.Unlock = 256
IOUtils.multiTypeSensor.TiltAxis.Unknown = 0
IOUtils.multiTypeSensor.TurnAxis = {}
IOUtils.multiTypeSensor.TurnAxis.LockMask = 48
IOUtils.multiTypeSensor.TurnAxis.OpenMask = 192
IOUtils.multiTypeSensor.TurnAxis.Close = 192
IOUtils.multiTypeSensor.TurnAxis.Ventilation = 128
IOUtils.multiTypeSensor.TurnAxis.Open = 64
IOUtils.multiTypeSensor.TurnAxis.Lock = 48
IOUtils.multiTypeSensor.TurnAxis.Unlock = 16
IOUtils.multiTypeSensor.TurnAxis.Unknown = 0
IOUtils.multiTypeSensor.SlidingAxis = {}
IOUtils.multiTypeSensor.SlidingAxis.LockMask = 3
IOUtils.multiTypeSensor.SlidingAxis.OpenMask = 12
IOUtils.multiTypeSensor.SlidingAxis.Close = 12
IOUtils.multiTypeSensor.SlidingAxis.Ventilation = 8
IOUtils.multiTypeSensor.SlidingAxis.Open = 4
IOUtils.multiTypeSensor.SlidingAxis.Lock = 3
IOUtils.multiTypeSensor.SlidingAxis.Unlock = 1
IOUtils.multiTypeSensor.SlidingAxis.Unknown = 0

function IOUtils.handleOneWayController(qrPayload, channel, addOrRemove)
	if channel == nil then
		channel = 1
	end

	local address, productKey = IOUtils.parseOneWayControllerQRPayload(qrPayload)
	local channelAddress = IOUtils.computeOneWayControllerAddress(address, channel)
	local payload = bytearray(0)

	payload = payload:append(bytearray({
		addOrRemove
	}))
	payload = payload:append(channelAddress)
	payload = payload:append(bytearray({
		0,
		0,
		63
	}))
	payload = payload:append(productKey)
	payload = payload:append(bytearray({
		0,
		0
	}))
	payload = payload:append(bytearray({
		0
	}))
	payload = payload:append(bytearray({
		3
	}))

	return payload
end

function IOUtils.parseOneWayControllerQRPayload(qrPayload)
	if qrPayload == nil then
		error("QR Payload is required")
	elseif #qrPayload < 40 then
		error("Invalid QR Code sent")
	end

	return bytearray(qrPayload:sub(3, 8), "hexadecimal"), bytearray(qrPayload:sub(9, 40), "hexadecimal")
end

function IOUtils.computeOneWayControllerAddress(controllerAddress, channel)
	local channelAddress = controllerAddress:readUInt24(1, true) + channel - 1

	return bytearray(3):writeUInt24(1, channelAddress, true)
end

function IOUtils.computeDiscreteRSSILevel(rssi)
	if rssi > -60 then
		return "good"
	elseif rssi > -80 then
		return "normal"
	elseif rssi > -95 then
		return "low"
	else
		return "verylow"
	end
end

function IOUtils.generateIOKey()
	local lengthArray = math.random(90, 100)
	local randomValues, keyValues = {}, bytearray(16)
	local key = 0

	for i = 1, lengthArray do
		randomValues[i] = math.random(0, 255)
	end

	for j = 1, 16 do
		key = math.random(1, lengthArray)
		keyValues[j] = randomValues[key]
	end

	return keyValues
end

function IOUtils.saveBoundValue(boundType)
	local commandValue = bytearray(2)

	if boundType == "lower" then
		commandValue[2] = 0
	elseif boundType == "upper" then
		commandValue[2] = 1
	else
		error("The type of bound is required")
	end

	return commandValue
end

function IOUtils.updateAdditionalStatusState(noKeyTransferSetupRequired)
	local states = {}

	if noKeyTransferSetupRequired ~= nil and noKeyTransferSetupRequired ~= false then
		states.noKeyTransferSetupRequired = noKeyTransferSetupRequired
	end

	if CommonUtils.mapLength(states) == 0 then
		return nil
	end

	return states
end

return IOUtils
