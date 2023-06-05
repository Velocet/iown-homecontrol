slot0 = depends("BinaryUtils")
slot1 = depends("io-utils")
slot3 = 16
slot4 = 32

return {
	createActivateFunc = slot1.createActivateFunc,
	fromRawTemperatureValue = slot1.fromRawTemperatureValue,
	toRawTemperatureValue = slot1.toRawTemperatureValue,
	extractNumericFPPart = slot1.extractNumericFPPart,
	sensedUnit = slot1.sensedUnit,
	daughterboard = slot1.daughterboard,
	getDaughterboardHardResetDescription = slot1.getDaughterboardHardResetDescription,
	getSensorDefect = slot1.getSensorDefect,
	createWinkValue = slot1.createWinkValue,
	fromRawName = function (slot0)
		return slot0:fromRawName()
	end,
	toRawName = function (slot0)
		return slot0:toRawName()
	end,
	toRawModeChange = function (slot0)
		if slot0 == nil or #slot0 == 0 then
			return bytearray(2)
		end

		if string.lower(slot0) == "auto" then
			return bytearray({
				128,
				0
			})
		elseif slot0 == "heating" then
			return bytearray({
				0,
				16
			})
		elseif slot0 == "dehumidify" then
			return bytearray({
				0,
				32
			})
		elseif slot0 == "cooling" then
			return bytearray({
				0,
				64
			})
		elseif slot0 == "fan" then
			return bytearray({
				0,
				80
			})
		elseif slot0 == "circulator" then
			return bytearray({
				0,
				96
			})
		else
			return bytearray(2)
		end
	end,
	toRawMainOperation = function (slot0)
		slot1 = bytearray({
			0,
			255
		})

		if string.lower(slot0) == "off" then
			slot1[2] = 0
		elseif slot0 == "on" then
			slot1[2] = 1
		end

		return slot1
	end,
	fromRawOperationState = function (slot0)
		if slot0 == 0 then
			return "Off"
		elseif slot0 == 1 then
			return "On"
		else
			return nil
		end
	end,
	fromRawModeChange = function (slot0)
		if slot0 == 16 then
			return "Heating"
		elseif slot0 == 32 then
			return "Dehumidify"
		elseif slot0 == 64 then
			return "Cooling"
		elseif slot0 == 80 then
			return "Fan"
		elseif slot0 == 96 then
			return "Circulator"
		elseif slot0 == 32784 then
			return "Auto heating"
		elseif slot0 == 8020 or slot0 == 32832 then
			return "Auto cooling"
		else
			return nil
		end
	end,
	toRawThermoStatus = function (slot0)
		if slot0 == 0 then
			return "Off"
		elseif slot0 == 65535 then
			return "On"
		else
			return nil
		end
	end,
	toTemperatureChange = function (slot0)
		if slot0 == 126 then
			return nil
		elseif slot0 > 127 then
			return slot0 - 256
		else
			return slot0
		end
	end,
	toTargetTemperature = function (slot0, slot1)
		if slot1 == nil then
			return nil
		end

		if slot0 == "Auto heating" then
			if slot0 <= 23 + slot1 and 23 + slot1 <= slot1 then
				return 23 + slot1
			else
				return nil
			end
		elseif slot0 == "Auto cooling" then
			if slot0 <= 27 + slot1 and 27 + slot1 <= slot1 then
				return 27 + slot1
			else
				return nil
			end
		elseif slot0 <= slot1 and slot1 <= slot1 then
			return slot1
		else
			return nil
		end
	end,
	toRawTemperature = function (slot0)
		if slot0 == nil or slot0 == 126 then
			return nil
		else
			return slot0
		end
	end,
	toRawFanSpeed = function (slot0)
		slot1 = bytearray({
			0,
			255
		})

		if string.lower(slot0) == "auto" then
			slot1[2] = 0
		elseif slot0 == "hi" then
			slot1[2] = 1
		elseif slot0 == "med" then
			slot1[2] = 2
		elseif slot0 == "lo" then
			slot1[2] = 3
		elseif slot0 == "silent" then
			slot1[2] = 4
		end

		return slot1
	end,
	toRawGlobalControl = function (slot0, slot1, slot2, slot3)
		slot4 = slot0:toRawMainOperation()
		slot5 = bytearray(2)

		if string.lower(slot3) == "auto" then
			slot5[1] = 255
		end

		slot5[2] = tonumber(slot1)

		return bytearray({
			slot0.toRawModeChange(slot3)[1],
			slot0.toRawModeChange(slot3)[2],
			slot5[1],
			slot5[2],
			slot0.toRawFanSpeed(slot2)[2],
			slot4[2]
		})
	end,
	fromRawStatusState = function (slot0)
		if slot0 == 1 then
			return "available"
		else
			return "unavailable"
		end
	end,
	writeCMDCotherm = function (slot0, slot1, slot2)
		slot3 = bytearray(5 + slot2 / 8)

		slot3:writeInt8(1, 2)
		slot3:writeInt8(2, 2)
		slot3:writeInt8(3, slot2 / 8 + 2)
		slot3:writeInt16(4, slot0)

		if slot2 == 8 then
			slot3:writeInt8(6, slot1)
		elseif slot2 == 16 then
			slot3:writeInt16(6, slot1)
		elseif slot2 == 32 then
			slot3:writeInt32(6, slot1)
		else
			return nil
		end

		return slot3
	end,
	cothermCurrentStates = {
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
	},
	cothermThermostatMode = {
		[0] = "NO_PROGRAM",
		"COMFORT",
		"ECO",
		"ANTIFROST"
	},
	setCothermThermostatMode = function (slot0)
		if slot0 == "NO_PROGRAM" then
			return 0
		elseif slot0 == "COMFORT" then
			return 1
		elseif slot0 == "ECO" then
			return 2
		elseif slot0 == "ANTIFROST" then
			return 3
		end
	end,
	getCurrentStateIdThermostatCotherm = function (slot0)
		for slot4 = 0, #slot0.cothermCurrentStates, 1 do
			if slot0.cothermCurrentStates[slot4] == slot0 then
				return slot4
			end
		end
	end,
	getModeThermostatCotherm = function (slot0)
		for slot4 = 0, #slot0.cothermCurrentStates, 1 do
			if slot0.cothermCurrentStates[slot4] == slot0 then
				return slot4
			end
		end
	end,
	getErrorComRFThermostatCotherm = function (slot0)
		return {
			formatError = slot0:readInt16(1),
			crcError = slot0:readInt16(3)
		}
	end,
	getComRFThermostatCotherm = function (slot0)
		slot1 = {
			last_response = slot0:readInt8(1),
			last_status = slot0:readInt8(2),
			last_ack = slot0:readInt8(3)
		}
		slot2 = nil

		if bit.band(slot0[4], 1) == 1 then
			slot2 = "response receive"
		elseif bit.band(bit.rshift(slot0[4], 1), 1) == 1 then
			slot2 = "radio status receive"
		elseif bit.band(bit.rshift(slot0[4], 2), 1) == 1 then
			slot2 = "ack receive"
		end

		slot1.flag = slot2

		return slot1
	end,
	getRfStatusThermostatCotherm = function (slot0)
		if slot0:readInt8(1) == 0 then
			return "INCONNU"
		elseif slot0:readInt8(1) == 1 then
			return "PASSERELLE_MUETTE"
		elseif slot0:readInt8(1) == 2 then
			return "OK"
		elseif slot0:readInt8(1) == 3 then
			return "ERREUR"
		end
	end,
	getErrorsThermostatCotherm = function (slot0)
		if bit.band(slot0[1], 1) == 1 then
			return "EEPROM ERROR"
		elseif bit.band(bit.rshift(slot0[1], 1), 1) == 1 then
			return "Room temperature < -15°C"
		elseif bit.band(bit.rshift(slot0[1], 2), 1) == 1 then
			return "Room temperature > 50°C"
		elseif bit.band(bit.rshift(slot0[1], 3), 1) == 1 then
			return "Overheated Thermostat > 65°C"
		else
			return "No Error"
		end
	end,
	setErrorsThermostatCotherm = function (slot0)
		if slot0 == "EEPROM_ERROR" then
			return 1
		elseif slot0 == "INF_15" then
			return 2
		elseif slot0 == "SUP_50" then
			return 4
		elseif slot0 == "SUP_65" then
			return 8
		end
	end,
	getUserProgModeThermostatCotherm = function (slot0, slot1)
		if bit.band(bit.rshift(slot0, slot1), 3) == 0 then
			return "ANTIFROST"
		elseif bit.band(bit.rshift(slot0, slot1), 3) == 1 then
			return "ECO"
		elseif bit.band(bit.rshift(slot0, slot1), 3) == 2 then
			return "COMFORT"
		elseif bit.band(bit.rshift(slot0, slot1), 3) == 3 then
			return "OFF"
		end
	end,
	getUserProgModeValueThermostatCotherm = function (slot0)
		if slot0 == "ANTIFROST" then
			return 0
		elseif slot0 == "ECO" then
			return 1
		elseif slot0 == "COMFORT" then
			return 2
		elseif slot0 == "OFF" then
			return 3
		end
	end,
	convertUserProgTimeCotherm = function (slot0)
		return slot1 .. "h" .. slot0 % 60 .. "min"
	end,
	getUserProgTimeThermostatCotherm = function (slot0)
		slot1 = {}
		slot2 = 1

		for slot6 = 1, #slot0, 1 do
			slot7 = 0

			for slot11 = 1, 4, 1 do
				slot1[slot2] = {
					timeOctet = (slot6 - 1) * 2,
					timeBit = slot11,
					value = slot0.getUserProgModeThermostatCotherm(slot0[slot6], slot7)
				}
				slot2 = slot2 + 1
				slot7 = slot7 + 2
			end
		end

		slot3 = 1
		slot4 = {}
		slot5 = 1

		while slot1[slot3] do
			if slot3 == 1 or (slot4[slot5 - 1] ~= nil and slot4[slot5 - 1].value ~= slot1[slot3].value) then
				slot4[slot5] = slot1[slot3]
				slot5 = slot5 + 1
			end

			slot3 = slot3 + 1
		end

		slot6 = {}

		for slot10 = 1, #slot4, 1 do
			slot6[slot10] = {
				mode = slot4[slot10].value,
				startTime = slot0.convertUserProgTimeCotherm(slot4[slot10].timeOctet * 60 + 30 * (slot4[slot10].timeBit - 1))
			}
		end

		return slot6
	end,
	getByteValuatedThermostatCotherm = function (slot0, slot1, slot2)
		slot3 = 0

		if slot0 == 0 then
			slot3 = bit.bor(bit.bor(bit.bor(bit.bor(slot3, bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot1.mode), 6)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot1.mode), 4)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot1.mode), 2)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot1.mode), 0))
		elseif slot0 == 2 then
			slot3 = bit.bor(bit.bor(bit.bor(bit.bor(slot3, bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot1.mode), 6)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot1.mode), 4)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot1.mode), 2)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot2.mode), 0))
		elseif slot0 == 4 then
			slot3 = bit.bor(bit.bor(bit.bor(bit.bor(slot3, bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot1.mode), 6)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot1.mode), 4)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot2.mode), 2)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot2.mode), 0))
		elseif slot0 == 6 then
			slot3 = bit.bor(bit.bor(bit.bor(bit.bor(slot3, bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot1.mode), 6)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot2.mode), 4)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot2.mode), 2)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot2.mode), 0))
		end

		return slot3
	end,
	setUserProgTimeThermostatCotherm = function (slot0)
		slot2 = 1
		slot3 = 0

		for slot7 = 1, #bytearray(12), 1 do
			slot8 = slot0[slot2]

			if slot0[slot2 + 1] ~= nil then
				slot13 = ((math.floor(slot9.startTime / 60) - ((math.floor(math.floor(slot9.startTime / 60) / 2) + 1) - 1) * 2) * 60 + slot9.startTime % 60) / 30 * 2

				if math.floor(math.floor(slot9.startTime / 60) / 2) + 1 == slot7 then
					slot1[slot7] = slot0.getByteValuatedThermostatCotherm(slot13, slot9, slot8)
					slot3 = 1
					slot2 = slot2 + 1
				end
			end

			if slot3 == 0 then
				slot1[slot7] = bit.bor(bit.bor(bit.bor(bit.bor(0, bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot8.mode), 6)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot8.mode), 4)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot8.mode), 2)), bit.lshift(slot0.getUserProgModeValueThermostatCotherm(slot8.mode), 0))
			end

			slot3 = 0
		end

		return slot1
	end,
	writeCmdUserProg = function (slot0, slot1)
		slot2 = bytearray(5)

		slot2:writeInt8(1, 2)
		slot2:writeInt8(2, 2)
		slot2:writeInt8(3, 14)
		slot2:writeInt16(4, slot0)

		return slot2:append(slot1)
	end,
	getActiveInactiveStateCotherm = function (slot0)
		if slot0 == 1 then
			return "active"
		elseif slot0 == 0 then
			return "inactive"
		else
			return "invalid"
		end
	end,
	setActiveInactiveStateCotherm = function (slot0)
		if slot0 == "active" then
			return 1
		elseif slot0 == "inactive" then
			return 0
		end
	end,
	getLockedUnlockedButton = function (slot0)
		if slot0 == 1 then
			return "locked"
		elseif slot0 == 0 then
			return "unlocked"
		end
	end,
	setLockedUnlockedButton = function (slot0)
		if slot0 == "locked" then
			return 1
		elseif slot0 == "unlocked" then
			return 0
		end
	end,
	getRTCThermostatCotherm = function (slot0)
		if slot0 == nil or #slot0 ~= 4 then
			return ""
		else
			slot2 = slot0:readUInt8(2)
			slot3 = slot0:readUInt8(3)
			slot4 = slot0:readUInt8(4)
			slot5 = nil

			if slot0:readUInt8(1) == 1 then
				slot5 = "monday"
			elseif slot1 == 2 then
				slot5 = "tuesday"
			elseif slot1 == 3 then
				slot5 = "wednesday"
			elseif slot1 == 4 then
				slot5 = "thursday"
			elseif slot1 == 5 then
				slot5 = "friday"
			elseif slot1 == 6 then
				slot5 = "saturday"
			elseif slot1 == 7 then
				slot5 = "sunday"
			end

			return slot5 .. " " .. slot2 .. "h" .. slot3 .. "min" .. slot4 .. "s"
		end
	end
}
