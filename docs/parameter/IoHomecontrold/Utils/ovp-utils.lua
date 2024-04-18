-- chunkname: @./gateway/ovp-utils.module

local BinaryUtils = depends("BinaryUtils")
local IOUtils = depends("io-utils")
local OVPUtils = {}

OVPUtils.createActivateFunc = IOUtils.createActivateFunc
OVPUtils.fromRawTemperatureValue = IOUtils.fromRawTemperatureValue
OVPUtils.toRawTemperatureValue = IOUtils.toRawTemperatureValue
OVPUtils.extractNumericFPPart = IOUtils.extractNumericFPPart
OVPUtils.sensedUnit = IOUtils.sensedUnit
OVPUtils.daughterboard = IOUtils.daughterboard
OVPUtils.getDaughterboardHardResetDescription = IOUtils.getDaughterboardHardResetDescription
OVPUtils.getSensorDefect = IOUtils.getSensorDefect
OVPUtils.createWinkValue = IOUtils.createWinkValue

local temperatureLowestBorder = 16
local temperatureHighestBorder = 32

function OVPUtils.fromRawName(b)
	return IOUtils.fromRawName(b)
end

function OVPUtils.toRawName(n)
	return IOUtils.toRawName(n)
end

function OVPUtils.toRawModeChange(s)
	if s == nil or #s == 0 then
		return bytearray(2)
	end

	s = string.lower(s)

	if s == "auto" then
		return bytearray({
			128,
			0
		})
	elseif s == "heating" then
		return bytearray({
			0,
			16
		})
	elseif s == "dehumidify" then
		return bytearray({
			0,
			32
		})
	elseif s == "cooling" then
		return bytearray({
			0,
			64
		})
	elseif s == "fan" then
		return bytearray({
			0,
			80
		})
	elseif s == "circulator" then
		return bytearray({
			0,
			96
		})
	else
		return bytearray(2)
	end
end

function OVPUtils.toRawMainOperation(s)
	s = string.lower(s)

	local value = bytearray({
		0,
		255
	})

	if s == "off" then
		value[2] = 0
	elseif s == "on" then
		value[2] = 1
	end

	return value
end

function OVPUtils.fromRawOperationState(p1)
	if p1 == 0 then
		return "Off"
	elseif p1 == 1 then
		return "On"
	else
		return nil
	end
end

function OVPUtils.fromRawModeChange(p1)
	if p1 == 16 then
		return "Heating"
	elseif p1 == 32 then
		return "Dehumidify"
	elseif p1 == 64 then
		return "Cooling"
	elseif p1 == 80 then
		return "Fan"
	elseif p1 == 96 then
		return "Circulator"
	elseif p1 == 32784 then
		return "Auto heating"
	elseif p1 == 8020 or p1 == 32832 then
		return "Auto cooling"
	else
		return nil
	end
end

function OVPUtils.toRawThermoStatus(p1)
	if p1 == 0 then
		return "On"
	elseif p1 == 65535 then
		return "Off"
	else
		return nil
	end
end

function OVPUtils.toTemperatureChange(p1)
	if p1 == 126 then
		return nil
	elseif p1 > 127 then
		return p1 - 256
	else
		return p1
	end
end

function OVPUtils.toTargetTemperature(modeChange, temperature)
	if temperature == nil then
		return nil
	end

	if modeChange == "Auto heating" then
		if temperatureLowestBorder < 23 + temperature and 23 + temperature <= temperatureHighestBorder then
			return 23 + temperature
		else
			return nil
		end
	elseif modeChange == "Auto cooling" then
		if temperatureLowestBorder < 27 + temperature and 27 + temperature <= temperatureHighestBorder then
			return 27 + temperature
		else
			return nil
		end
	elseif temperature > temperatureLowestBorder and temperature <= temperatureHighestBorder then
		return temperature
	else
		return nil
	end
end

function OVPUtils.toRawTemperature(p1)
	if p1 == nil or p1 == 126 then
		return nil
	else
		return p1
	end
end

function OVPUtils.toRawFanSpeed(s)
	s = string.lower(s)

	local value = bytearray({
		0,
		255
	})

	if s == "auto" then
		value[2] = 0
	elseif s == "hi" then
		value[2] = 1
	elseif s == "med" then
		value[2] = 2
	elseif s == "lo" then
		value[2] = 3
	elseif s == "silent" then
		value[2] = 4
	end

	return value
end

function OVPUtils.toRawGlobalControl(mainOperation, temperature, fanSpeed, operationStatus)
	local rawMainOperation = OVPUtils.toRawMainOperation(mainOperation)
	local rawTemperature = bytearray(2)

	operationStatus = string.lower(operationStatus)

	if operationStatus == "auto" then
		rawTemperature[1] = 255
	end

	rawTemperature[2] = tonumber(temperature)

	local rawFanSpeed = OVPUtils.toRawFanSpeed(fanSpeed)
	local rawOperationStatus = OVPUtils.toRawModeChange(operationStatus)

	return bytearray({
		rawOperationStatus[1],
		rawOperationStatus[2],
		rawTemperature[1],
		rawTemperature[2],
		rawFanSpeed[2],
		rawMainOperation[2]
	})
end

function OVPUtils.fromRawStatusState(s)
	if s == 1 then
		return "available"
	else
		return "unavailable"
	end
end

function OVPUtils.writeCMDCotherm(paramId, value, type)
	local res = bytearray(5 + type / 8)

	res:writeInt8(1, 2)
	res:writeInt8(2, 2)
	res:writeInt8(3, type / 8 + 2)
	res:writeInt16(4, paramId)

	if type == 8 then
		res:writeInt8(6, value)
	elseif type == 16 then
		res:writeInt16(6, value)
	elseif type == 32 then
		res:writeInt32(6, value)
	else
		return nil
	end

	return res
end

OVPUtils.cothermCurrentStates = {
	[0] = "STATE_RESET",
	"STATE_COMFORT",
	"STATE_ECO",
	"STATE_ANTIFROST",
	"STATE_OFF",
	"STATE_AUTO_PROG",
	"STATE_PILOT_WIRE",
	"STATE_USER_PROGRAM",
	"STATE_MINIBOX_PROGRAM",
	"STATE_HOLIDAY_PROGRAM",
	"STATE_TIMER_2H",
	"STATE_WINDOW_OPEN",
	"STATE_ERROR_CTN",
	"SET_PAIRING_RF",
	"SET_TIME",
	"SET_PROG",
	"SET_OFFSET",
	"SET_POWER_HEATING",
	"SET_ENERGY_COUNTER",
	"SET_WINDOW_OPEN",
	"SET_PIR_ABSCENCE_TIME",
	"SET_PIR_LIGHT_MODE",
	"FACTORY_RST"
}
OVPUtils.cothermThermostatMode = {
	[0] = "NO_PROGRAM",
	"COMFORT",
	"ECO",
	"ANTIFROST"
}

function OVPUtils.setCothermThermostatMode(value)
	if value == "NO_PROGRAM" then
		return 0
	elseif value == "COMFORT" then
		return 1
	elseif value == "ECO" then
		return 2
	elseif value == "ANTIFROST" then
		return 3
	end
end

function OVPUtils.getCurrentStateIdThermostatCotherm(value)
	for i = 0, #OVPUtils.cothermCurrentStates do
		if OVPUtils.cothermCurrentStates[i] == value then
			return i
		end
	end
end

function OVPUtils.getModeThermostatCotherm(value)
	for i = 0, #OVPUtils.cothermCurrentStates do
		if OVPUtils.cothermCurrentStates[i] == value then
			return i
		end
	end
end

function OVPUtils.getErrorComRFThermostatCotherm(b)
	local com_rf = {}

	com_rf.formatError = b:readInt16(1)
	com_rf.crcError = b:readInt16(3)

	return com_rf
end

function OVPUtils.getComRFThermostatCotherm(b)
	local com_rf = {}

	com_rf.last_response = b:readInt8(1)
	com_rf.last_status = b:readInt8(2)
	com_rf.last_ack = b:readInt8(3)

	local codeReceive

	if bit.band(b[4], 1) == 1 then
		codeReceive = "response receive"
	elseif bit.band(bit.rshift(b[4], 1), 1) == 1 then
		codeReceive = "radio status receive"
	elseif bit.band(bit.rshift(b[4], 2), 1) == 1 then
		codeReceive = "ack receive"
	end

	com_rf.flag = codeReceive

	return com_rf
end

function OVPUtils.getRfStatusThermostatCotherm(b)
	if b:readInt8(1) == 0 then
		return "INCONNU"
	elseif b:readInt8(1) == 1 then
		return "PASSERELLE_MUETTE"
	elseif b:readInt8(1) == 2 then
		return "OK"
	elseif b:readInt8(1) == 3 then
		return "ERREUR"
	end
end

function OVPUtils.getErrorsThermostatCotherm(b)
	if bit.band(b[1], 1) == 1 then
		return "EEPROM ERROR"
	elseif bit.band(bit.rshift(b[1], 1), 1) == 1 then
		return "Room temperature < -15°C"
	elseif bit.band(bit.rshift(b[1], 2), 1) == 1 then
		return "Room temperature > 50°C"
	elseif bit.band(bit.rshift(b[1], 3), 1) == 1 then
		return "Overheated Thermostat > 65°C"
	else
		return "No Error"
	end
end

function OVPUtils.setErrorsThermostatCotherm(value)
	if value == "EEPROM_ERROR" then
		return 1
	elseif value == "INF_15" then
		return 2
	elseif value == "SUP_50" then
		return 4
	elseif value == "SUP_65" then
		return 8
	end
end

function OVPUtils.getUserProgModeThermostatCotherm(value, shift)
	if bit.band(bit.rshift(value, shift), 3) == 0 then
		return "ANTIFROST"
	elseif bit.band(bit.rshift(value, shift), 3) == 1 then
		return "ECO"
	elseif bit.band(bit.rshift(value, shift), 3) == 2 then
		return "COMFORT"
	elseif bit.band(bit.rshift(value, shift), 3) == 3 then
		return "OFF"
	end
end

function OVPUtils.getUserProgModeValueThermostatCotherm(value)
	if value == "ANTIFROST" then
		return 0
	elseif value == "ECO" then
		return 1
	elseif value == "COMFORT" then
		return 2
	elseif value == "OFF" then
		return 3
	end
end

function OVPUtils.convertUserProgTimeCotherm(value)
	local h = math.floor(value / 60)
	local minute = value % 60

	return h .. "h" .. minute .. "min"
end

function OVPUtils.getUserProgTimeThermostatCotherm(b)
	local tab1 = {}
	local tab1Cpt = 1

	for i = 1, #b do
		local shift = 0

		for j = 1, 4 do
			tab1[tab1Cpt] = {
				timeOctet = (i - 1) * 2,
				timeBit = j,
				value = OVPUtils.getUserProgModeThermostatCotherm(b[i], shift)
			}
			tab1Cpt = tab1Cpt + 1
			shift = shift + 2
		end
	end

	local k = 1
	local resCons = {}
	local resConsCount = 1

	while tab1[k] do
		if k == 1 or resCons[resConsCount - 1] ~= nil and resCons[resConsCount - 1].value ~= tab1[k].value then
			resCons[resConsCount] = tab1[k]
			resConsCount = resConsCount + 1
		end

		k = k + 1
	end

	local tab = {}

	for a = 1, #resCons do
		tab[a] = {
			mode = resCons[a].value,
			startTime = OVPUtils.convertUserProgTimeCotherm(resCons[a].timeOctet * 60 + 30 * (resCons[a].timeBit - 1))
		}
	end

	return tab
end

function OVPUtils.getByteValuatedThermostatCotherm(nextNbit, nextChange, initValue)
	local a = 0

	if nextNbit == 0 then
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(nextChange.mode), 6)))
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(nextChange.mode), 4)))
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(nextChange.mode), 2)))
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(nextChange.mode), 0)))
	elseif nextNbit == 2 then
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(nextChange.mode), 6)))
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(nextChange.mode), 4)))
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(nextChange.mode), 2)))
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(initValue.mode), 0)))
	elseif nextNbit == 4 then
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(nextChange.mode), 6)))
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(nextChange.mode), 4)))
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(initValue.mode), 2)))
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(initValue.mode), 0)))
	elseif nextNbit == 6 then
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(nextChange.mode), 6)))
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(initValue.mode), 4)))
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(initValue.mode), 2)))
		a = bit.bor(a, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(initValue.mode), 0)))
	end

	return a
end

function OVPUtils.setUserProgTimeThermostatCotherm(t)
	local tab = bytearray(12)
	local iValue = 1
	local isInsert = 0

	for iTab = 1, #tab do
		local initValue = t[iValue]
		local nextChange = t[iValue + 1]

		if nextChange ~= nil then
			local h = math.floor(nextChange.startTime / 60)
			local nextOctet = math.floor(h / 2) + 1
			local nextNbMin = (h - (nextOctet - 1) * 2) * 60 + nextChange.startTime % 60
			local nextNbit = nextNbMin / 30 * 2

			if nextOctet == iTab then
				tab[iTab] = OVPUtils.getByteValuatedThermostatCotherm(nextNbit, nextChange, initValue)
				isInsert = 1
				iValue = iValue + 1
			end
		end

		if isInsert == 0 then
			local b = 0

			b = bit.bor(b, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(initValue.mode), 6)))
			b = bit.bor(b, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(initValue.mode), 4)))
			b = bit.bor(b, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(initValue.mode), 2)))
			b = bit.bor(b, (bit.lshift(OVPUtils.getUserProgModeValueThermostatCotherm(initValue.mode), 0)))
			tab[iTab] = b
		end

		isInsert = 0
	end

	return tab
end

function OVPUtils.writeCmdUserProg(paramId, value)
	local res = bytearray(5)

	res:writeInt8(1, 2)
	res:writeInt8(2, 2)
	res:writeInt8(3, 14)
	res:writeInt16(4, paramId)

	local concat = res:append(value)

	return concat
end

function OVPUtils.getActiveInactiveStateCotherm(value)
	if value == 1 then
		return "active"
	elseif value == 0 then
		return "inactive"
	else
		return "invalid"
	end
end

function OVPUtils.setActiveInactiveStateCotherm(value)
	if value == "active" then
		return 1
	elseif value == "inactive" then
		return 0
	end
end

function OVPUtils.getLockedUnlockedButton(value)
	if value == 1 then
		return "locked"
	elseif value == 0 then
		return "unlocked"
	end
end

function OVPUtils.setLockedUnlockedButton(value)
	if value == "locked" then
		return 1
	elseif value == "unlocked" then
		return 0
	end
end

function OVPUtils.getRTCThermostatCotherm(b)
	if b == nil or #b ~= 4 then
		return ""
	else
		local b1 = b:readUInt8(1)
		local b2 = b:readUInt8(2)
		local b3 = b:readUInt8(3)
		local b4 = b:readUInt8(4)
		local s1

		if b1 == 1 then
			s1 = "monday"
		elseif b1 == 2 then
			s1 = "tuesday"
		elseif b1 == 3 then
			s1 = "wednesday"
		elseif b1 == 4 then
			s1 = "thursday"
		elseif b1 == 5 then
			s1 = "friday"
		elseif b1 == 6 then
			s1 = "saturday"
		elseif b1 == 7 then
			s1 = "sunday"
		end

		return s1 .. " " .. b2 .. "h" .. b3 .. "min" .. b4 .. "s"
	end
end

return OVPUtils
