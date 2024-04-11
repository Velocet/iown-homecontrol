return function (slot0)
	slot1 = depends("common", "utils")

	slot0.fromRawName = function (slot0)
		if slot0 == nil or #slot0 == 0 then
			return ""
		end

		for slot4 = 1, #slot0, 1 do
			if slot0[slot4] == 0 then
				slot0 = slot0:sub(1, slot4 - 1)

				break
			end
		end

		return slot0:tostring("iso-8859-1")
	end

	slot0.fromRawVersion = function (slot0)
		slot1 = ""

		for slot5 = 1, #slot0, 1 do
			slot1 = slot1 .. string.format("%02x", slot0[slot5])
		end

		return slot1
	end

	slot0.getUsageTotalFor = function (slot0, slot1, slot2)
		if slot0 == nil or slot1 == nil then
			return nil
		end

		slot3 = nil

		for slot7 = 1, #slot0, 1 do
			if bit.rshift(slot0[slot7], 4) == slot2 then
				slot3 = slot7

				break
			end
		end

		if slot3 == nil then
			return nil
		end

		return slot0.getUsageTotal(slot1, slot3)
	end

	slot0.getUsageTotal = function (slot0, slot1)
		if slot0 == nil or #slot0 < 5 then
			return nil
		end

		if math.floor((#slot0 / (bit.band(slot0[1], 15) + 1) - 1) / 4) < slot1 then
			return nil
		end

		slot4 = 0

		for slot8 = 1, slot2, 1 do
			slot4 = slot4 + slot0:readUInt32((slot8 - 1) * (1 + 4 * slot3) + 2 + (slot1 - 1) * 4)
		end

		return slot4
	end

	slot0.getUsageByRateFor = function (slot0, slot1, slot2, slot3)
		if slot0 == nil or slot1 == nil then
			return nil
		end

		slot4 = nil

		for slot8 = 1, #slot0, 1 do
			if bit.rshift(slot0[slot8], 4) == slot2 then
				slot4 = slot8

				break
			end
		end

		if slot4 == nil then
			return nil
		end

		return slot0.getUsageByRate(slot1, slot3, slot4)
	end

	slot0.getUsageByRate = function (slot0, slot1, slot2)
		if slot0 == nil or #slot0 < 5 then
			return nil
		end

		if slot1 > bit.band(slot0[1], 15) + 1 then
			return nil
		end

		if math.floor((#slot0 / slot3 - 1) / 4) < slot2 then
			return nil
		end

		return slot0:readUInt32((slot1 - 1) * (1 + 4 * slot4) + 2 + (slot2 - 1) * 4)
	end

	slot0.usageName = {
		[0] = "Heating",
		"DHW",
		"Cooling",
		"Plugs",
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
		"Other"
	}

	slot0.getUsageName = function (slot0, slot1)
		if slot0 == nil or slot1 > #slot0 then
			return nil
		end

		if slot0.usageName[bit.rshift(slot0[slot1], 4)] == nil then
			return "?"
		end

		return slot3
	end

	slot0.getTotal = function (slot0)
		if slot0 == nil or #slot0 < 5 then
			return nil
		end

		slot3 = 0

		for slot7 = 1, math.floor((#slot0 / (bit.band(slot0[1], 15) + 1) - 1) / 4), 1 do
			for slot11 = 1, slot1, 1 do
				slot3 = slot3 + slot0:readUInt32((slot11 - 1) * (1 + 4 * slot2) + 2 + (slot7 - 1) * 4)
			end
		end

		return slot3
	end

	slot0.setTimeProgram = function (slot0)
		if slot0 == nil then
			return nil
		end

		slot1 = bytearray(16)

		for slot5 = 1, 16, 1 do
			slot1[slot5] = 0
		end

		if slot0.lastRequest == "gui" then
			slot1[1] = 0
		else
			slot1[1] = 1
		end

		if slot0.daymode ~= nil then
			slot1[2] = bit.bor(bit.lshift(slot0.getDayModeProgramAsInt(slot0.daymode.tuesday), 4), slot0.getDayModeProgramAsInt(slot0.daymode.monday))
			slot1[3] = bit.bor(bit.lshift(slot0.getDayModeProgramAsInt(slot0.daymode.thursday), 4), slot0.getDayModeProgramAsInt(slot0.daymode.wednesday))
			slot1[4] = bit.bor(bit.lshift(slot0.getDayModeProgramAsInt(slot0.daymode.saturday), 4), slot0.getDayModeProgramAsInt(slot0.daymode.friday))
			slot1[5] = slot0.getDayModeProgramAsInt(slot0.daymode.sunday)
		end

		if slot0.programs ~= nil and #slot0.programs > 0 then
			for slot5 = 1, #slot0.programs, 1 do
				if slot0.programs[slot5].slots ~= nil then
					slot1[4 + 6 * (slot5 - 1) + 1] = bit.bor(slot1[4 + 6 * (slot5 - 1) + 1], bit.lshift(slot0.programs[slot5].slots.count, slot5 % 2 * 4))

					if slot0.programs[slot5].slots.definitions ~= nil and #slot0.programs[slot5].slots.definitions > 0 then
						for slot10 = 1, #slot0.programs[slot5].slots.definitions, 1 do
							if slot0.programs[slot5].slots.definitions[slot10] ~= nil then
								slot1[slot6 + slot10] = bit.bor(bit.lshift(slot0.getSlotStartTimeAsInt(slot0.programs[slot5].slots.definitions[slot10].start), 2), slot0.getSlotModeAsInt(slot0.programs[slot5].slots.definitions[slot10].mode))
							else
								slot1[index2] = 195
							end
						end
					end
				end
			end
		end

		return slot1
	end

	slot0.getTimeProgram = function (slot0)
		if slot0 == nil or #slot0 ~= 16 then
			return {}
		end

		slot1 = {}

		if slot0:readInt8(1) == 0 then
			slot1.lastRequest = "gui"
		else
			slot1.lastRequest = "box"
		end

		slot1.daymode = {
			monday = slot0.getDayModeProgramAsString(bit.band(slot0[2], 15)),
			tuesday = slot0.getDayModeProgramAsString(bit.rshift(slot0[2], 4)),
			wednesday = slot0.getDayModeProgramAsString(bit.band(slot0[3], 15)),
			thursday = slot0.getDayModeProgramAsString(bit.rshift(slot0[3], 4)),
			friday = slot0.getDayModeProgramAsString(bit.band(slot0[4], 15)),
			saturday = slot0.getDayModeProgramAsString(bit.rshift(slot0[4], 4)),
			sunday = slot0.getDayModeProgramAsString(bit.band(slot0[5], 15))
		}
		slot1.programs = {}

		for slot5 = 1, 2, 1 do
			slot1.programs[slot5] = {}
			slot6 = {}

			if slot5 == 1 then
				slot6.count = bit.rshift(slot0[5], 4)
			elseif slot5 == 2 then
				slot6.count = bit.band(slot0[11], 15)
			end

			slot6.definitions = {}

			if slot6.count > 0 then
				for slot10 = 1, slot6.count, 1 do
					slot6.definitions[slot10] = {
						mode = slot0.getSlotModeAsString(bit.band(slot0[(6 * slot5 + slot10) - 1], 3)),
						start = slot0.getSlotStartTimeAsString(bit.rshift(slot0[(6 * slot5 + slot10) - 1], 2))
					}
				end
			end

			slot1.programs[slot5].slots = slot6
		end

		return slot1
	end

	slot0.getDayModeProgramAsString = function (slot0)
		if slot0 == nil then
			return nil
		end

		if slot0 == 0 then
			return "day-presence"
		elseif slot0 == 1 then
			return "day-presence-plus"
		elseif slot0 == 2 then
			return "day-away"
		elseif slot0 == 3 then
			return "morning-away"
		elseif slot0 == 4 then
			return "afternoon-away"
		elseif slot0 == 5 then
			return "prog1"
		elseif slot0 == 6 then
			return "prog2"
		else
			return "day-presence"
		end
	end

	slot0.getSlotModeAsString = function (slot0)
		if slot0 == nil then
			return nil
		end

		if slot0 == 0 then
			return "away"
		elseif slot0 == 1 then
			return "presence"
		elseif slot0 == 2 then
			return "presence-plus"
		else
			return "presence"
		end
	end

	slot0.getSlotStartTimeAsString = function (slot0)
		slot1 = math.floor(slot0 / 2)
		slot2 = 0

		if slot0 % 2 == 1 then
			slot2 = 30
		end

		return string.format("%02d", slot1) .. ":" .. string.format("%02d", slot2)
	end

	slot0.getDayModeProgramAsInt = function (slot0)
		if slot0 == nil then
			return nil
		end

		if slot0 == "day-presence" then
			return 0
		elseif slot0 == "day-presence-plus" then
			return 1
		elseif slot0 == "day-away" then
			return 2
		elseif slot0 == "morning-away" then
			return 3
		elseif slot0 == "afternoon-away" then
			return 4
		elseif slot0 == "prog1" then
			return 5
		elseif slot0 == "prog2" then
			return 6
		else
			return 0
		end
	end

	slot0.getSlotModeAsInt = function (slot0)
		if slot0 == nil then
			return nil
		end

		if slot0 == "presence" then
			return 1
		elseif slot0 == "presence-plus" then
			return 2
		elseif slot0 == "away" then
			return 0
		else
			return 0
		end
	end

	slot0.getSlotStartTimeAsInt = function (slot0)
		slot1, slot2 = slot0:match("([0-9]+):([0-9]*)")
		slot3 = slot1 * 2

		if slot2 ~= nil and slot2 == "30" then
			slot3 = slot3 + 1
		end

		return slot3
	end

	slot0.setVentilationMode = function (slot0)
		slot1 = bytearray(8)

		if slot0.dayNight == "day" then
			slot1[1] = 0
		else
			slot1[1] = 1
		end

		if slot0.cooling == "on" then
			slot1[2] = 1
		else
			slot1[2] = 0
		end

		if slot0.prog == "on" then
			slot1[3] = 1
		else
			slot1[3] = 0
		end

		if slot0.test == "on" then
			slot1[4] = 1
		else
			slot1[4] = 0
		end

		if slot0.endOfLineTest == "on" then
			slot1[5] = 1
		else
			slot1[5] = 0
		end

		if slot0.leapYear == "on" then
			slot1[6] = 1
		else
			slot1[6] = 0
		end

		slot1[7] = slot0.month
		slot1[8] = slot0.day

		return slot1
	end

	slot0.getVentilationMode = function (slot0)
		if slot0 == nil or #slot0 ~= 8 then
			return {}
		end

		slot1 = {}

		if slot0:readInt8(1) == 0 then
			slot1.dayNight = "day"
		else
			slot1.dayNight = "night"
		end

		if slot0:readInt8(2) == 0 then
			slot1.cooling = "off"
		else
			slot1.cooling = "on"
		end

		if slot0:readInt8(3) == 0 then
			slot1.prog = "off"
		else
			slot1.prog = "on"
		end

		if slot0:readInt8(4) == 0 then
			slot1.test = "off"
		else
			slot1.test = "on"
		end

		if slot0:readInt8(5) == 0 then
			slot1.endOfLineTest = "off"
		else
			slot1.endOfLineTest = "on"
		end

		if slot0:readInt8(6) == 0 then
			slot1.leapYear = "off"
		else
			slot1.leapYear = "on"
		end

		slot1.month = slot0:readInt8(7)
		slot1.day = slot0:readInt8(8)

		return slot1
	end

	slot0.getEnergySaving = function (slot0)
		if slot0 == nil or #slot0 ~= 32 then
			return {}
		end

		return {
			["month-13"] = slot0:readInt16(1),
			["month-12"] = slot0:readInt16(3),
			["month-11"] = slot0:readInt16(5),
			["month-10"] = slot0:readInt16(7),
			["month-9"] = slot0:readInt16(9),
			["month-8"] = slot0:readInt16(11),
			["month-7"] = slot0:readInt16(13),
			["month-6"] = slot0:readInt16(15),
			["month-5"] = slot0:readInt16(17),
			["month-4"] = slot0:readInt16(19),
			["month-3"] = slot0:readInt16(21),
			["month-2"] = slot0:readInt16(23),
			["month-1"] = slot0:readInt16(25),
			currentMonth = slot0:readInt16(27),
			total = bit.lshift(slot0:readInt16(29), 16) + slot0:readInt16(31)
		}
	end

	slot0.getCO2History = function (slot0)
		if slot0 == nil or #slot0 ~= 145 then
			return {}
		end

		slot1 = {}

		for slot5 = 1, #slot0, 1 do
			slot1[slot5] = slot0:readUInt8(slot5)
		end

		return slot1
	end

	slot0.getDateTime = function (slot0)
		if slot0 == nil or #slot0 ~= 8 then
			return {}
		end

		return {
			hour = slot0[1],
			minute = slot0[2],
			second = slot0[3],
			day = slot0[4],
			month = slot0[5],
			year = slot0:readUInt16(6, false),
			weekday = slot0[8]
		}
	end

	slot0.setDateTime = function (slot0)
		slot1 = bytearray(8)
		slot1[1] = slot0.hour
		slot1[2] = slot0.minute
		slot1[3] = slot0.second
		slot1[4] = slot0.day
		slot1[5] = slot0.month

		slot1:writeUInt16(6, slot0.year, false)

		slot1[8] = slot0.weekday

		return slot1
	end

	slot0.getSensorsErrorState = function (slot0)
		if slot0 == nil or #slot0 < 13 then
			return {}
		end

		({
			co2 = bit.band(slot0[13], 1) == 1,
			outlet = {},
			inlet = {},
			outside = bit.rshift(bit.band(slot0[13], 32), 5) == 1
		})["outlet"].newAir = bit.rshift(bit.band(slot0[13], 2), 1) == 1
		()["outlet"].exhaustAir = bit.rshift(bit.band(slot0[13], 4), 2) == 1
		()["inlet"].newAir = bit.rshift(bit.band(slot0[13], 8), 3) == 1
		()["inlet"].exhaustAir = bit.rshift(bit.band(slot0[13], 16), 4) == 1

		return 
	end

	slot0.getElecHeaterSlotTimeAsString = function (slot0)
		slot1 = math.floor(slot0 / 2)
		slot2 = 0

		if slot0 % 2 == 1 then
			slot2 = 30
		end

		return string.format("%02d", slot1) .. ":" .. string.format("%02d", slot2)
	end

	slot0.getElecHeaterSlotTimeFromString = function (slot0)
		if #slot0:split("[0-9]+") ~= 2 then
			error("Invalid parameter, time program should match {'start':'HH:mm','end':'HH:mm'}")
		end

		return tonumber(slot1[1]) * 2 + ((slot1[2] == "30" and 1) or 0)
	end

	slot0.setElecHeaterTimeProgram = function (slot0)
		slot1 = bytearray(7)
		slot2 = {}
		slot3 = 1

		if slot0.monday ~= nil then
			slot2 = slot0.monday
			slot1[slot3] = 0
			slot3 = slot3 + 1
		elseif slot0.tuesday ~= nil then
			slot2 = slot0.tuesday
			slot1[slot3] = 1
			slot3 = slot3 + 1
		elseif slot0.wednesday ~= nil then
			slot2 = slot0.wednesday
			slot1[slot3] = 2
			slot3 = slot3 + 1
		elseif slot0.thursday ~= nil then
			slot2 = slot0.thursday
			slot1[slot3] = 3
			slot3 = slot3 + 1
		elseif slot0.friday ~= nil then
			slot2 = slot0.friday
			slot1[slot3] = 4
			slot3 = slot3 + 1
		elseif slot0.saturday ~= nil then
			slot2 = slot0.saturday
			slot1[slot3] = 5
			slot3 = slot3 + 1
		elseif slot0.sunday ~= nil then
			slot2 = slot0.sunday
			slot1[slot3] = 6
			slot3 = slot3 + 1
		end

		for slot7 = 1, #slot2, 1 do
			slot1[slot3] = slot0.getElecHeaterSlotTimeFromString(slot8)
			slot1[slot3 + 1] = slot0.getElecHeaterSlotTimeFromString(slot2[slot7].end)
			slot3 = slot3 + 2
		end

		return slot1
	end

	slot0.getElecHeaterDailyTimeProgram = function (slot0)
		if slot0 == nil or #slot0 ~= 7 then
			return {}
		end

		slot1 = {}
		slot2 = {}

		for slot6 = 1, 3, 1 do
			if slot0[slot6 * 2] ~= 255 and slot0[slot6 * 2 + 1] ~= 255 then
				slot2[slot6] = {
					start = slot0.getElecHeaterSlotTimeAsString(slot0[slot6 * 2]),
					end = slot0.getElecHeaterSlotTimeAsString(slot0[slot6 * 2 + 1])
				}
			end
		end

		if slot0[1] == 0 then
			slot1.monday = slot2
		elseif slot0[1] == 1 then
			slot1.tuesday = slot2
		elseif slot0[1] == 2 then
			slot1.wednesday = slot2
		elseif slot0[1] == 3 then
			slot1.thursday = slot2
		elseif slot0[1] == 4 then
			slot1.friday = slot2
		elseif slot0[1] == 5 then
			slot1.saturday = slot2
		elseif slot0[1] == 6 then
			slot1.sunday = slot2
		end

		return slot1
	end

	slot0.getElecHeaterTimeProgram = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		slot7 = {}
		slot8 = 1

		if slot0 ~= nil then
			slot7[slot8] = slot0
			slot8 = slot8 + 1
		end

		if slot1 ~= nil then
			slot7[slot8] = slot1
			slot8 = slot8 + 1
		end

		if slot2 ~= nil then
			slot7[slot8] = slot2
			slot8 = slot8 + 1
		end

		if slot3 ~= nil then
			slot7[slot8] = slot3
			slot8 = slot8 + 1
		end

		if slot4 ~= nil then
			slot7[slot8] = slot4
			slot8 = slot8 + 1
		end

		if slot5 ~= nil then
			slot7[slot8] = slot5
			slot8 = slot8 + 1
		end

		if slot6 ~= nil then
			slot7[slot8] = slot6
			slot8 = slot8 + 1
		end

		return slot7
	end

	slot0.getAutoProgram = function (slot0)
		if #slot0 ~= 339 then
			return nil
		end

		slot1 = {}
		slot2 = {}

		for slot6 = 1, 48, 1 do
			slot2[slot6] = slot0.getSetpoint(slot0:readUInt8(slot6))
		end

		slot1.monday = slot2
		slot3 = {}

		for slot7 = 49, 96, 1 do
			slot3[slot7 - 48] = slot0.getSetpoint(slot0:readUInt8(slot7))
		end

		slot1.tuesday = slot3
		slot4 = {}

		for slot8 = 97, 144, 1 do
			slot4[slot8 - 96] = slot0.getSetpoint(slot0:readUInt8(slot8))
		end

		slot1.wednesday = slot4
		slot5 = {}

		for slot9 = 145, 192, 1 do
			slot5[slot9 - 144] = slot0.getSetpoint(slot0:readUInt8(slot9))
		end

		slot1.thursday = slot5
		slot6 = {}

		for slot10 = 193, 240, 1 do
			slot6[slot10 - 192] = slot0.getSetpoint(slot0:readUInt8(slot10))
		end

		slot1.friday = slot6
		slot7 = {}

		for slot11 = 241, 288, 1 do
			slot7[slot11 - 240] = slot0.getSetpoint(slot0:readUInt8(slot11))
		end

		slot1.saturday = slot7
		slot8 = {}

		for slot12 = 289, 336, 1 do
			slot8[slot12 - 288] = slot0.getSetpoint(slot0:readUInt8(slot12))
		end

		slot1.sunday = slot8
		slot1.anticipTime = slot0:readUInt16(337, false)
		slot1.anticipNb = slot0:readUInt8(339)

		return slot1
	end

	slot0.getSetpoint = function (slot0)
		if slot0 == 0 then
			return "CONF_3_NIV1"
		elseif slot0 == 1 then
			return "CONF_3_NIV2"
		elseif slot0 == 2 then
			return "CONF_2"
		elseif slot0 == 3 then
			return "CONF_1"
		elseif slot0 == 4 then
			return "CONF_NIV1"
		elseif slot0 == 5 then
			return "CONF_NIV2"
		elseif slot0 == 6 then
			return "CONF_NIV3"
		else
			return nil
		end
	end

	slot0.getElecHeaterDateTime = function (slot0)
		if slot0 == nil or #slot0 ~= 8 then
			return {}
		end

		return {
			second = slot0[1],
			minute = slot0[2],
			hour = slot0[3],
			day = slot0[4],
			weekday = slot0[5],
			year = slot0:readUInt16(7, false),
			month = slot0[6]
		}
	end

	slot0.setElecHeaterDateTime = function (slot0)
		slot1 = bytearray(8)
		slot1[1] = slot0.second
		slot1[2] = slot0.minute
		slot1[3] = slot0.hour
		slot1[4] = slot0.day
		slot1[5] = slot0.weekday

		slot1:writeUInt16(7, slot0.year, false)

		slot1[6] = slot0.month

		return slot1
	end

	slot0.getExpectedPresence = function (slot0)
		if slot0 == nil or #slot0 ~= 2 then
			return {}
		end

		slot2 = slot0:readUInt8(2, false) .. ""

		if #(slot0:readUInt8(1, false) .. "") == 1 then
			slot1 = "0" .. slot1
		end

		if #slot2 == 1 then
			slot2 = "0" .. slot2
		end

		return slot1 .. ":" .. slot2
	end

	slot0.setExpectedPresence = function (slot0)
		slot1 = bytearray(2)
		slot1[1], slot1[2] = slot0:match("(%d+):(%d+)")

		return slot1
	end

	slot0.setElectricalHeaterTargetTemperature = function (slot0, slot1, slot2)
		slot3 = 15
		slot4 = bytearray(2)

		if slot0 == "previous" then
			if slot2 ~= nil and slot2.groupDef then
				return slot0
			else
				slot5 = nil

				if slot1 == nil then
					error("\"previous\" temperature is null")
				elseif type(slot1) ~= "number" then
					error("\"previous\" temperature is not a number")
				end

				return slot4:writeUInt16(1, slot1 * 10, false)
			end
		else
			if slot0 == nil or type(slot0) ~= "number" then
				error("value is null or not a number")
			end

			return slot4:writeUInt16(1, slot0 * 10, false)
		end
	end

	slot0.setElectricalTowelDryerTargetTemperature = function (slot0, slot1, slot2)
		slot3 = 15
		slot4 = bytearray(2)

		if slot0 == "previous" then
			if slot2 ~= nil and slot2.groupDef then
				return slot0
			else
				slot5 = nil

				if slot1 == nil then
					error("\"previous\" temperature is null")
				elseif type(slot1) ~= "string" then
					error("\"previous\" temperature is not a string")
				else
					slot5 = tonumber(slot1)
				end

				return slot4:writeUInt16(1, slot5 * 10, false)
			end
		else
			if slot0 == nil or type(slot0) ~= "number" then
				error("value is null or not a number")
			end

			return slot4:writeUInt16(1, slot0 * 10, false)
		end
	end

	slot0.setPreviousComfortTargetTemperature = function (slot0, slot1, slot2)
		if slot0 == "comfort" then
			if slot2 ~= nil and slot2.groupDef then
				return slot0
			elseif slot1 == nil then
				return 15
			else
				return slot1
			end
		else
			return slot0
		end
	end

	slot0.getManufacturerName = function (slot0)
		if slot0[1] == 65 then
			return "Atlantic"
		elseif slot0[1] == 83 then
			return "Sauter"
		elseif slot0[1] == 84 then
			return "Thermor"
		elseif slot0[1] == 78 then
			return "Neutre"
		end
	end

	slot0.getDHWError = function (slot0)
		if slot0 == nil or #slot0 < 3 then
			return {}
		end

		slot1 = {
			type = slot0:readUInt8(1),
			code = slot0:readUInt8(2)
		}

		if slot0:readUInt8(3) >= 32 and slot2 <= 126 then
			slot1.family = string.char(slot0:readUInt8(3))
		else
			slot1.family = "?"
		end

		if #slot0 >= 4 then
			slot1.minor = slot0:readUInt8(4)
		end

		return slot1
	end

	slot0.getRateManagement = function (slot0)
		if slot0 == nil then
			return {}
		end

		if slot0 == 64512 then
			return "no"
		end

		if slot0 == 64513 then
			return "wanted"
		end

		if slot0 == 64514 then
			return "recommended"
		end

		if slot0 == 64516 then
			return "unsuitable"
		end

		if slot0 == 64517 then
			return "forbidden"
		end

		return "?"
	end

	slot0.getOperatingModeCapabilities = function (slot0)
		if slot0 == nil then
			return {}
		end

		return {
			rateManagement = bit.band(slot0, 1),
			absence = bit.band(bit.rshift(slot0, 2), 1),
			relaunch = bit.band(bit.rshift(slot0, 3), 1),
			energyDemandStatus = bit.band(bit.rshift(slot0, 15), 1)
		}
	end

	slot0.getCurrentOperatingMode = function (slot0)
		if slot0 == nil then
			return {}
		end

		slot1 = {}

		if bit.band(bit.rshift(slot0, 8), 3) == 0 then
			slot1.relaunch = "Keep_Current_Value "
		end

		if bit.band(bit.rshift(slot0, 8), 3) == 1 then
			slot1.relaunch = "on"
		end

		if bit.band(bit.rshift(slot0, 8), 3) == 2 then
			slot1.relaunch = "off"
		end

		if bit.band(bit.rshift(slot0, 8), 3) == 3 then
			slot1.relaunch = "Not_Used"
		end

		if bit.band(bit.rshift(slot0, 10), 3) == 0 then
			slot1.absence = "Keep_Current_Value"
		end

		if bit.band(bit.rshift(slot0, 10), 3) == 1 then
			slot1.absence = "on"
		end

		if bit.band(bit.rshift(slot0, 10), 3) == 2 then
			slot1.absence = "off"
		end

		if bit.band(bit.rshift(slot0, 10), 3) == 3 then
			slot1.absence = "Not_Used"
		end

		return slot1
	end

	slot0.getUserProgSlotsDHW = function (slot0)
		slot1 = {}

		return {
			slot1 = {
				start = slot0.getValidHour(slot0:readUInt8(1)) .. ":" .. slot0.getValidHour(slot0:readUInt8(2)),
				end = slot0.getValidHour(slot0:readUInt8(3)) .. ":" .. slot0.getValidHour(slot0:readUInt8(4))
			},
			slot2 = {
				start = slot0.getValidHour(slot0:readUInt8(5)) .. ":" .. slot0.getValidHour(slot0:readUInt8(6)),
				end = slot0.getValidHour(slot0:readUInt8(7)) .. ":" .. slot0.getValidHour(slot0:readUInt8(8))
			}
		}
	end

	slot0.getValidHour = function (slot0)
		if slot0 < 10 then
			return 0 .. slot0
		end

		return slot0
	end

	slot0.setUserProgSlotsDHW = function (slot0)
		return bytearray({
			tonumber(slot0.split(slot0.slot1.start, "%d%d")[1]),
			tonumber(slot0.split(slot0.slot1.start, "%d%d")[2]),
			tonumber(slot0.split(slot0.slot1.end, "%d%d")[1]),
			tonumber(slot0.split(slot0.slot1.end, "%d%d")[2]),
			tonumber(slot0.split(slot0.slot2.start, "%d%d")[1]),
			tonumber(slot0.split(slot0.slot2.start, "%d%d")[2]),
			tonumber(slot0.split(slot0.slot2.end, "%d%d")[1]),
			tonumber(slot0.split(slot0.slot2.end, "%d%d")[2])
		})
	end

	slot0.getOperatingRange = function (slot0)
		slot1 = nil

		return (slot0 == 0 and "pacHC_elecHC") or (slot0 == 1 and "pacProg_elecProg") or (slot0 == 2 and "pac24h_elecHC") or (slot0 == 3 and "pac24h_elecProg") or "pac24h_elec24h"
	end

	slot0.setOperatingRange = function (slot0)
		slot1 = nil

		return (slot0 == "pacHC_elecHC" and 0) or (slot0 == "pacProg_elecProg" and 1) or (slot0 == "pac24h_elecHC" and 2) or (slot0 == "pac24h_elecProg" and 3) or 4
	end

	slot0.getElectricalExtraManagement = function (slot0)
		slot1 = nil

		return (slot0 == 0 and "auto") or "deactive"
	end

	slot0.getInstallation = function (slot0)
		slot1 = nil

		return (slot0 == 0 and "onlyThermodynamic") or (slot0 == 1 and "extraBoiler") or "extraSolar"
	end

	slot0.getBoilerInstallationOption = function (slot0)
		slot1 = nil

		return (slot0 == 0 and "heatPumpPriority") or (slot0 == 1 and "heatPumpOptimising") or (slot0 == 2 and "boilerOptimising") or "boilerPriority"
	end

	slot0.getSmartGridOption = function (slot0)
		if slot0 == 0 then
			return "deactive"
		else
			return "active"
		end
	end

	slot0.setSmartGridOption = function (slot0)
		slot1 = nil

		if slot0 == "active" then
			return 1
		else
			return 0
		end
	end

	slot0.getExtractionOption = function (slot0)
		slot1 = nil

		return (slot0 == 0 and "noExtraction") or (slot0 == 1 and "lowExtractionSpeed") or "fastExtractionSpeed"
	end

	slot0.getTowelDryerOpertingMode = function (slot0)
		slot1 = nil

		return (slot0 == 0 and "standby") or (slot0 == 1 and "auto") or (slot0 == 2 and "internal") or "external"
	end

	slot0.setTowelDryerOperatingMode = function (slot0)
		slot1 = bytearray(1)

		if slot0 == "standby" then
			slot1[1] = 0
		elseif slot0 == "auto" then
			slot1[1] = 1
		elseif slot0 == "internal" then
			slot1[1] = 2
		elseif slot0 == "external" then
			slot1[1] = 3
		end

		return slot1
	end

	slot0.getTowelDryerTemporaryState = function (slot0)
		slot1 = nil

		if slot0 == 0 then
			slot1 = "permanentHeating"
		elseif slot0 == 1 then
			slot1 = "boost"
		elseif slot0 == 2 then
			slot1 = "drying"
		end

		return slot1
	end

	slot0.setTowelDryerTemporaryState = function (slot0)
		slot1 = bytearray(1)

		if slot0 == "permanentHeating" then
			slot1[1] = 0
		elseif slot0 == "boost" then
			slot1[1] = 1
		elseif slot0 == "drying" then
			slot1[1] = 2
		end

		return slot1
	end

	slot0.getTowelDryerDailyTimeProgram = function (slot0)
		if slot0 == nil or #slot0 ~= 7 then
			return {}
		end

		slot1 = {}
		slot2 = {}

		for slot6 = 1, 3, 1 do
			if slot0[slot6 * 2] ~= 255 and slot0[slot6 * 2 + 1] ~= 255 then
				slot2[slot6] = {
					start = slot0.getTowelDryerSlotTimeAsString(slot0[slot6 * 2]),
					end = slot0.getTowelDryerSlotTimeAsString(slot0[slot6 * 2 + 1])
				}
			end
		end

		if slot0[1] == 0 then
			slot1.monday = slot2
		elseif slot0[1] == 1 then
			slot1.tuesday = slot2
		elseif slot0[1] == 2 then
			slot1.wednesday = slot2
		elseif slot0[1] == 3 then
			slot1.thursday = slot2
		elseif slot0[1] == 4 then
			slot1.friday = slot2
		elseif slot0[1] == 5 then
			slot1.saturday = slot2
		elseif slot0[1] == 6 then
			slot1.sunday = slot2
		end

		return slot1
	end

	slot0.getTowelDryerSlotTimeAsString = function (slot0)
		return string.format("%02d", slot1) .. ":" .. string.format("%02d", slot0 % 4 * 15)
	end

	slot0.getTowelDryerSlotTimeFromString = function (slot0)
		if #slot0:split("[0-9]+") ~= 2 then
			error("Invalid parameter, time program should match {'start':'HH:mm','end':'HH:mm'}")
		end

		return tonumber(slot1[1]) * 4 + ((slot1[2] == "15" and 1) or (slot3 == "30" and 2) or (slot3 == "45" and 3) or 0)
	end

	slot0.setTowelDryerTimeProgram = function (slot0)
		slot1 = bytearray(7)
		slot2 = {}
		slot3 = 1

		if slot0.monday ~= nil then
			slot2 = slot0.monday
			slot1[slot3] = 0
			slot3 = slot3 + 1
		elseif slot0.tuesday ~= nil then
			slot2 = slot0.tuesday
			slot1[slot3] = 1
			slot3 = slot3 + 1
		elseif slot0.wednesday ~= nil then
			slot2 = slot0.wednesday
			slot1[slot3] = 2
			slot3 = slot3 + 1
		elseif slot0.thursday ~= nil then
			slot2 = slot0.thursday
			slot1[slot3] = 3
			slot3 = slot3 + 1
		elseif slot0.friday ~= nil then
			slot2 = slot0.friday
			slot1[slot3] = 4
			slot3 = slot3 + 1
		elseif slot0.saturday ~= nil then
			slot2 = slot0.saturday
			slot1[slot3] = 5
			slot3 = slot3 + 1
		elseif slot0.sunday ~= nil then
			slot2 = slot0.sunday
			slot1[slot3] = 6
			slot3 = slot3 + 1
		end

		for slot7 = 1, #slot2, 1 do
			slot1[slot3] = slot0.getTowelDryerSlotTimeFromString(slot8)
			slot1[slot3 + 1] = slot0.getTowelDryerSlotTimeFromString(slot2[slot7].end)
			slot3 = slot3 + 2
		end

		return slot1
	end

	slot0.forceRCM = function (slot0)
		slot1 = 0

		if slot0 == "active" then
			slot1 = 1
		end

		return bytearray({
			slot1
		})
	end

	slot0.getRCMMode = function (slot0)
		if slot0:readInt8(1) == 1 then
			return "active"
		else
			return "deactive"
		end
	end

	slot0.getLocalAmbienteTemperature = function (slot0)
		if slot0:readInt16(1) == -1 then
			return "Sensor out of order"
		else
			return slot1 / 100
		end
	end

	slot0.getTowelDryerAutoProgram = function (slot0)
		if #slot0 ~= 675 then
			return nil
		end

		slot1 = {}
		slot2 = {}

		for slot6 = 1, 96, 1 do
			slot2[slot6] = slot0.getSetpoint(slot0:readUInt8(slot6))
		end

		slot1.monday = slot2
		slot3 = {}

		for slot7 = 97, 192, 1 do
			slot3[slot7 - 96] = slot0.getSetpoint(slot0:readUInt8(slot7))
		end

		slot1.tuesday = slot3
		slot4 = {}

		for slot8 = 193, 288, 1 do
			slot4[slot8 - 192] = slot0.getSetpoint(slot0:readUInt8(slot8))
		end

		slot1.wednesday = slot4
		slot5 = {}

		for slot9 = 289, 384, 1 do
			slot5[slot9 - 288] = slot0.getSetpoint(slot0:readUInt8(slot9))
		end

		slot1.thursday = slot5
		slot6 = {}

		for slot10 = 385, 480, 1 do
			slot6[slot10 - 384] = slot0.getSetpoint(slot0:readUInt8(slot10))
		end

		slot1.friday = slot6
		slot7 = {}

		for slot11 = 481, 576, 1 do
			slot7[slot11 - 480] = slot0.getSetpoint(slot0:readUInt8(slot11))
		end

		slot1.saturday = slot7
		slot8 = {}

		for slot12 = 577, 672, 1 do
			slot8[slot12 - 576] = slot0.getSetpoint(slot0:readUInt8(slot12))
		end

		slot1.sunday = slot8
		slot1.anticipTime = slot0:readUInt16(673, false)
		slot1.anticipNb = slot0:readUInt8(675)

		return slot1
	end

	slot0.dayOfWeekAsString = {
		"monday",
		"tuesday",
		"wednesday",
		"thursday",
		"friday",
		"saturday",
		"sunday"
	}

	slot0.getWeekTimeProgram = function (slot0, slot1, slot2, slot3)
		if #slot0 ~= 7 * slot1 * slot2 or type(slot3) ~= "function" then
			return nil
		end

		slot4 = {}

		for slot8, slot9 in ipairs(slot0.dayOfWeekAsString) do
			slot4[slot8] = {
				[slot9] = slot0:getWeekTimeProgramDailySlots(slot1, slot2, (slot8 - 1) * slot1 * slot2 + 1, slot3)
			}
		end

		return slot4
	end

	slot0.getWeekTimeProgramDailySlots = function (slot0, slot1, slot2, slot3, slot4)
		slot5 = {}

		for slot9 = 1, slot1, 1 do
			slot5[slot9] = slot4(slot0, slot3 + (slot9 - 1) * slot2)
		end

		return slot5
	end

	slot0.setWeekTimeProgram = function (slot0, slot1, slot2, slot3)
		if #slot0 ~= 7 or type(slot3) ~= "function" then
			return nil
		end

		slot4 = bytearray(7 * slot1 * slot2)
		slot5 = 1

		for slot9, slot10 in ipairs(slot0.dayOfWeekAsString) do
			slot11 = nil
			slot12 = 1

			while slot11 == nil and slot12 <= #slot0 do
				slot11 = slot0[slot12][slot10]
				slot12 = slot12 + 1
			end

			if slot11 == nil then
				error("Invalid parameter, missing program of day " .. slot10)
			end

			slot4 = slot1.copyElements(slot0.setWeekTimeProgramDailySlots(slot11, slot1, slot2, slot3), slot4, slot5)
			slot5 = slot5 + #slot0.setWeekTimeProgramDailySlots(slot11, slot1, slot2, slot3)
		end

		return slot4
	end

	slot0.setWeekTimeProgramDailySlots = function (slot0, slot1, slot2, slot3)
		if slot0 == nil or #slot0 ~= slot1 then
			error("Invalid day slot number, " .. slot1 .. " slots per day should be included (valid format is [{slot1},{slot2} ...])")
		end

		slot4 = 1
		slot5 = bytearray(slot1 * slot2)

		for slot9 = 1, slot1, 1 do
			slot5 = slot0.copyElements(slot3(slot0[slot9]), slot5, slot4)
			slot4 = slot4 + #slot3(slot0[slot9])
		end

		return slot5
	end

	slot0.getPassAPCProductType = function (slot0)
		if slot0 == nil or #slot0 ~= 1 then
			return nil
		end

		if slot0:readInt8(1) == 0 then
			return "heatPump"
		elseif slot1 == 1 then
			return "hybrid"
		elseif slot1 == 2 then
			return "boiler"
		elseif slot1 == 3 then
			return "zoneController"
		elseif slot1 == 4 then
			return "airConditioning"
		elseif slot1 == 5 then
			return "heater"
		elseif slot1 == 6 then
			return "convector"
		elseif slot1 == 7 then
			return "accumulationDomesticHotWater"
		elseif slot1 == 8 then
			return "thermodynamicDomesticHotWater"
		elseif slot1 == 9 then
			return "singleFlowControlledMechanicalVentilation"
		elseif slot1 == 10 then
			return "doubleFlowControlledMechanicalVentilation"
		end
	end

	slot0.getPassAPCZoneConfiguration = function (slot0)
		if slot0 == 1 then
			return "heating"
		elseif slot0 == 2 then
			return "cooling"
		elseif slot0 == 3 then
			return "heatingAndCooling"
		else
			return nil
		end
	end

	slot0.getPassAPCServiceAvailability = function (slot0)
		if slot0 == 0 then
			return "unavailable"
		end

		return "available"
	end

	slot0.getPassAPCZoneElementAvailability = function (slot0, slot1)
		if slot0 == nil or slot1 == nil or slot1 < 1 or slot1 > 16 then
			return nil
		end

		return slot0.getPassAPCServiceAvailability(bit.band(slot0, bit.lshift(1, slot1 - 1)))
	end

	slot0.getPassAPCZoneElementOnOffState = function (slot0, slot1)
		if slot0 == nil or slot1 == nil or slot1 < 1 or slot1 > 16 then
			return nil
		end

		return slot0.getPassAPCServiceOnOffState(bit.band(slot0, bit.lshift(1, slot1 - 1)))
	end

	slot0.setPassAPCZoneElementOnOffState = function (slot0, slot1, slot2)
		if slot0 == nil or slot1 == nil or slot2 == nil or slot2 < 1 or slot2 > 16 then
			return nil
		end

		slot3 = slot1:readUInt16(1)

		if slot0 == "off" then
			slot3 = bit.band(slot3, bit.bnot(bit.lshift(1, slot2 - 1)))
		elseif slot0 == "on" then
			slot3 = bit.bor(slot3, bit.lshift(1, slot2 - 1))
		else
			return nil
		end

		slot1[1] = bit.rshift(bit.band(slot3, 65280), 8)
		slot1[2] = bit.band(slot3, 255)

		return slot1
	end

	slot0.getPassAPCThermalSchedulingMode = function (slot0)
		if slot0 == 1 then
			return "heatingAndCoolingSeparatedScheduling"
		elseif slot0 == 2 then
			return "heatingAndCoolingCommonScheduling"
		end

		return nil
	end

	slot0.getPassAPCAbsenceSchedulingMode = function (slot0)
		if slot0 == 1 then
			return "numberOfDaysScheduling"
		elseif slot0 == 2 then
			return "dateScheduling"
		end

		return nil
	end

	slot0.getPassAPCDHWConfiguration = function (slot0)
		if slot0 == 1 then
			return "cumulated"
		elseif slot0 == 2 then
			return "snapshot"
		else
			return nil
		end
	end

	slot0.getPassAPCServiceOnOffState = function (slot0)
		if slot0 == 0 then
			return "off"
		end

		return "on"
	end

	slot0.setPassAPCServiceOnOffState = function (slot0, slot1, slot2)
		if slot2 == nil then
			slot1 = bytearray(1)
			slot2 = 1
		elseif slot1 == nil then
			error("Missing required state related to values of other zones, try a refresh all")
		elseif slot2 > #slot1 then
			error("Invalid zoneId " .. slot2 .. " regarding global state length " .. #slot1)
		end

		slot3 = nil

		if slot0 == "off" then
			slot3 = 0
		elseif slot0 == "on" then
			slot3 = 1
		end

		if slot3 ~= nil then
			slot1[slot2] = slot3

			return slot1
		end

		return nil
	end

	slot0.fromPassAPCThermalRawMode = function (slot0)
		if slot0 == 0 then
			return "manu"
		elseif slot0 == 1 then
			return "comfort"
		elseif slot0 == 2 then
			return "eco"
		elseif slot0 == 3 then
			return "internalScheduling"
		elseif slot0 == 4 then
			return "externalScheduling"
		elseif slot0 == 5 then
			return "auto"
		elseif slot0 == 6 then
			return "absence"
		elseif slot0 == 7 then
			return "stop"
		else
			return nil
		end
	end

	slot0.toPassAPCThermalRawMode = function (slot0, slot1, slot2)
		if slot2 == nil then
			slot1 = bytearray(1)
			slot2 = 1
		elseif slot1 == nil then
			error("Missing required state related to values of other zones, try a refresh all")
		elseif slot2 > #slot1 then
			error("Invalid zoneId " .. slot2 .. " regarding global state length " .. #slot1)
		end

		slot3 = nil

		if slot0 == "manu" then
			slot3 = 0
		elseif slot0 == "comfort" then
			slot3 = 1
		elseif slot0 == "eco" then
			slot3 = 2
		elseif slot0 == "internalScheduling" then
			slot3 = 3
		elseif slot0 == "externalScheduling" then
			slot3 = 4
		elseif slot0 == "auto" then
			slot3 = 5
		elseif slot0 == "absence" then
			slot3 = 6
		elseif slot0 == "stop" then
			slot3 = 7
		end

		if slot3 ~= nil then
			slot1[slot2] = slot3

			return slot1
		else
			return nil
		end
	end

	slot0.fromPassAPCThermalRawProfile = function (slot0)
		if slot0 == 0 then
			return "stop"
		elseif slot0 == 1 then
			return "comfort"
		elseif slot0 == 2 then
			return "eco"
		elseif slot0 == 3 then
			return "externalSetpoint"
		elseif slot0 == 4 then
			return "absence"
		elseif slot0 == 5 then
			return "manu"
		elseif slot0 == 6 then
			return "frostprotection"
		elseif slot0 == 7 then
			return "derogation"
		elseif slot0 == 8 then
			return "other"
		else
			return nil
		end
	end

	slot0.fromPassAPCDHWRawMode = function (slot0)
		if slot0 == 0 then
			return "manu"
		elseif slot0 == 1 then
			return "comfort"
		elseif slot0 == 2 then
			return "peakAndOffPeakTimes"
		elseif slot0 == 3 then
			return "internalScheduling"
		elseif slot0 == 4 then
			return "externalScheduling"
		elseif slot0 == 5 then
			return "peakAndOffPeakScheduling"
		elseif slot0 == 6 then
			return "stop"
		elseif slot0 == 7 then
			return "eco"
		else
			return nil
		end
	end

	slot0.toPassAPCDHWRawMode = function (slot0)
		if slot0 == "manu" then
			return bytearray({
				0
			})
		elseif slot0 == "comfort" then
			return bytearray({
				1
			})
		elseif slot0 == "peakAndOffPeakTimes" then
			return bytearray({
				2
			})
		elseif slot0 == "internalScheduling" then
			return bytearray({
				3
			})
		elseif slot0 == "externalScheduling" then
			return bytearray({
				4
			})
		elseif slot0 == "peakAndOffPeakScheduling" then
			return bytearray({
				5
			})
		elseif slot0 == "stop" then
			return bytearray({
				6
			})
		elseif slot0 == "eco" then
			return bytearray({
				7
			})
		else
			return nil
		end
	end

	slot0.PASS_APC_SERVICE_NO_REMAPPING_MODE = 240
	slot0.PASS_APC_SERVICE_CONTINIOUS_REMAPPING_MODE = 241
	slot0.PASS_APC_SERVICE_NO_REMAPPING_CORRELATE_MODE = 242
	slot0.PASS_APC_SERVICE_UNLIMITED_REMAPPING_LENGTH = 65535

	slot0.writeDataPassApc = function (slot0, slot1, slot2)
		if slot0 == nil or #slot0 ~= 2 then
			error("Invalid service structure")
		elseif slot1 == nil or #slot1 <= 0 then
			error("Trying to write nil or empty value")
		end

		if slot2 == nil then
			slot2 = bytearray({
				slot0.PASS_APC_SERVICE_NO_REMAPPING_MODE
			})
		end

		return slot2:append(slot0):append(slot1)
	end

	slot0.readDataPassApc = function (slot0, slot1)
		if slot0 == nil or #slot0 ~= 2 then
			error("Invalid service structure")
		end

		if slot1 == nil then
			return slot0
		else
			return slot0:append(slot1)
		end
	end

	slot0.continiousRemapping = function (slot0, slot1, slot2)
		if slot0 == nil or slot0 < 0 or slot0 > 65535 then
			error("Invalid remapping service " + tostring(slot0))
		end

		if slot1 == nil then
			slot1 = 1
			slot2 = slot0.PASS_APC_SERVICE_UNLIMITED_REMAPPING_LENGTH
		elseif slot1 <= 0 or slot1 > 65535 then
			error("Invalid remapping number of services " + tostring(slot1))
		elseif slot2 <= 0 or slot0.PASS_APC_SERVICE_UNLIMITED_REMAPPING_LENGTH <= slot2 then
			error("Invalid remapping length of single service " + tostring(slot2))
		end

		slot3 = bytearray(7)
		slot3[1] = slot0.PASS_APC_SERVICE_CONTINIOUS_REMAPPING_MODE
		slot3[2] = bit.rshift(bit.band(slot0, 65280), 8)
		slot3[3] = bit.band(slot0, 255)
		slot3[4] = bit.rshift(bit.band(slot1, 65280), 8)
		slot3[5] = bit.band(slot1, 255)
		slot3[6] = bit.rshift(bit.band(slot2, 65280), 8)
		slot3[7] = bit.band(slot2, 255)

		return slot3
	end

	slot0.getPassAPCOperatingMode = function (slot0)
		if slot0 == 0 then
			return "stop"
		elseif slot0 == 1 then
			return "heating"
		elseif slot0 == 2 then
			return "cooling"
		elseif slot0 == 3 then
			return "drying"
		else
			return nil
		end
	end

	slot0.setPassAPCOperatingMode = function (slot0)
		if slot0 == "stop" then
			return bytearray({
				0
			})
		elseif slot0 == "heating" then
			return bytearray({
				1
			})
		elseif slot0 == "cooling" then
			return bytearray({
				2
			})
		elseif slot0 == "drying" then
			return bytearray({
				3
			})
		else
			return nil
		end
	end

	slot0.fromPassAPCRawTemperature = function (slot0)
		if type(slot0) == "number" and slot0 ~= 65535 then
			return slot0.round(slot0 / 10, 1)
		end

		return nil
	end

	slot0.toPassAPCRawMinimumTemperature = function (slot0, slot1)
		if slot1 < slot0 then
			error("The minimum temperature must be lower than the maximal temperature (" .. tostring(slot1) .. ") but got " .. tostring(slot0))
		end

		return slot0:toPassAPCRawTemperature()
	end

	slot0.toPassAPCRawMaximumTemperature = function (slot0, slot1)
		if slot0 < slot1 then
			error("The maximal temperature must be upper than the minimum temperature (" .. tostring(slot1) .. ") but got " .. tostring(slot0))
		end

		return slot0:toPassAPCRawTemperature()
	end

	slot0.toPassAPCRawTemperature = function (slot0, slot1, slot2)
		if slot2 == nil then
			slot1 = bytearray(2)
			slot2 = 1
		elseif slot1 == nil then
			error("Missing required state related to values of other zones, try a refresh all")
		elseif slot2 > #slot1 then
			error("Invalid zoneId " .. slot2 .. " regarding global state length " .. #slot1)
		end

		slot1[slot2 * 2 - 1] = bit.rshift(bit.band(slot3, 65280), 8)
		slot1[slot2 * 2] = bit.band(slot0.round(slot0 * 10), 255)

		return slot1
	end

	slot0.initDeactivatedGlobalZonesObject = function (slot0)
		if slot0 > #bytearray(32) then
			error("Invalid zoneId " .. slot0 .. " regarding global state length " .. #slot1)
		end

		for slot5 = 1, #slot1, 1 do
			slot1[slot5] = 255
		end

		return slot1
	end

	slot0.toPassAPCRawDerogationTemperature = function (slot0, slot1)
		slot2 = nil

		if slot1 ~= nil then
			slot2 = slot0.initDeactivatedGlobalZonesObject(slot1)
		end

		return slot0:toPassAPCRawTemperature(slot2, slot1)
	end

	slot0.toPassAPCRawDerogationTime = function (slot0, slot1)
		slot2 = nil

		if slot1 ~= nil then
			slot2 = slot0.initDeactivatedGlobalZonesObject(slot1)
		else
			slot1 = 1
			slot2 = bytearray(2)
		end

		slot2[slot1 * 2 - 1] = bit.rshift(bit.band(slot0, 65280), 8)
		slot2[slot1 * 2] = bit.band(slot0, 255)

		return slot2
	end

	slot0.passAPCNumberOfSlotsPerDay = 3
	slot0.passAPCDaySlotLength = 4
	slot0.passAPCTimeSeparator = ":"
	slot0.passAPCInvalidTimeField = "??"
	slot0.passAPCInvalidTime = slot0.passAPCInvalidTimeField .. slot0.passAPCTimeSeparator .. slot0.passAPCInvalidTimeField
	slot0.passAPCDeactivatedTimeField = "00"
	slot0.passAPCDeactivatedTimeFieldNumber = 0
	slot0.passAPCDeactivatedTime = slot0.passAPCDeactivatedTimeField .. slot0.passAPCTimeSeparator .. slot0.passAPCDeactivatedTimeField
	slot0.passAPCDeactivatedTimeFieldRawValue = 255
	slot0.passAPCDeactivatedTimeRawValue = bit.lshift(slot0.passAPCDeactivatedTimeFieldRawValue, 8) + slot0.passAPCDeactivatedTimeFieldRawValue

	slot0.getPassAPCProgService = function (slot0)
		if slot0.checkPassAPCProgramId(tonumber(slot0)) then
			return bytearray({
				1,
				62 + slot1
			})
		else
			error("Unknown time program " .. slot1 .. ", available program ids are 1,2,3 and 4")
		end
	end

	slot0.getPassAPCWeekTimeProgram = function (slot0)
		return slot0:getWeekTimeProgram(slot0.passAPCNumberOfSlotsPerDay, slot0.passAPCDaySlotLength, slot0.getPassAPCProgramSlot)
	end

	slot0.getPassAPCProgramSlot = function (slot0, slot1)
		slot2 = {
			start = slot0.minutesToDayTimeString(slot3)
		}

		if slot0:readUInt16(slot1 + 2) == 15300 then
			slot2.end = "24" .. slot0.passAPCTimeSeparator .. "00"
		else
			slot2.end = slot0.minutesToDayTimeString(slot4)
		end

		return slot2
	end

	slot0.minutesToDayTimeString = function (slot0)
		if slot0 > 1440 then
			if slot0 == slot0.passAPCDeactivatedTimeRawValue then
				return slot0.passAPCDeactivatedTime
			else
				return slot0.passAPCInvalidTime
			end
		end

		return string.format("%02d", slot1) .. slot0.passAPCTimeSeparator .. string.format("%02d", slot0 % 60)
	end

	slot0.setPassAPCWeekTimeProgram = function (slot0)
		return slot0:setWeekTimeProgram(slot0.passAPCNumberOfSlotsPerDay, slot0.passAPCDaySlotLength, slot0.setPassAPCProgramSlot)
	end

	slot0.setPassAPCProgramSlot = function (slot0)
		if slot0.start == nil or slot0.end == nil then
			error("Invalid day slot detected, missing start or end time (valid format is {'start':'HH" .. slot0.passAPCTimeSeparator .. "mm','end':'HH" .. slot0.passAPCTimeSeparator .. "mm'})")
		end

		slot3 = bytearray(4)

		if slot0.dayTimeStringToMinutes(slot0.end) < slot0.dayTimeStringToMinutes(slot0.start) then
			error("Invalid day slot detected, start time " .. slot0.start .. " is after end time " .. slot0.end)
		elseif slot1 == slot2 then
			for slot7 = 1, #slot3, 1 do
				slot3[slot7] = slot0.passAPCDeactivatedTimeFieldRawValue
			end
		else
			slot3[1] = bit.rshift(bit.band(slot1, 65280), 8)
			slot3[2] = bit.band(slot1, 255)
			slot3[3] = bit.rshift(bit.band(slot2, 65280), 8)
			slot3[4] = bit.band(slot2, 255)
		end

		return slot3
	end

	slot0.dayTimeStringToMinutes = function (slot0)
		if type(slot0) ~= "string" then
			error("Invalid day time " .. tostring(slot0) .. ", should be formatted as HH" .. slot0.passAPCTimeSeparator .. "mm")
		end

		if slot0:split("[0-9]+") == nil or #slot1 ~= 2 then
			error("Invalid day time " .. slot0 .. ", should be formatted as HH" .. slot0.passAPCTimeSeparator .. "mm")
		end

		if tonumber(slot1[1]) < 0 or slot2 > 24 then
			error("Invalid hours number " .. slot2 .. " in day time " .. slot0)
		end

		if tonumber(slot1[2]) < 0 or slot3 > 59 then
			error("Invalid minutes number " .. slot3 .. " in day time " .. slot0)
		end

		if slot2 == 24 and slot3 ~= 0 then
			error("Invalid minutes number " .. slot3 .. " in day time " .. slot0 .. " max value is 24" .. slot0.passAPCTimeSeparator .. "00")
		end

		return slot2 * 60 + slot3
	end

	slot0.setPassAPCActiveTimeProgram = function (slot0, slot1, slot2)
		if slot2 == nil then
			slot1 = bytearray(1)
			slot2 = 1
		elseif slot1 == nil then
			error("Missing required state related to values of other zones, try a refresh all")
		elseif slot2 > #slot1 then
			error("Invalid zoneId " .. slot2 .. " regarding global state length " .. #slot1)
		end

		if slot0:checkPassAPCProgramId() then
			slot1[slot2] = tonumber(slot0)

			return slot1
		else
			error("Unknown time program " .. slot0 .. ", available program ids are 1,2,3 and 4")
		end
	end

	slot0.checkPassAPCProgramId = function (slot0)
		if slot0 ~= nil then
			if type(slot0) == "string" then
				slot0 = tonumber(slot0)
			end

			if type(slot0) == "number" and slot0 >= 1 and slot0 <= 4 then
				return true
			end
		end

		return false
	end

	slot0.fromPassAPCRawDateTime = function (slot0)
		if slot0 == nil or #slot0 < 6 then
			return nil
		end

		slot1 = {}
		slot2 = true
		slot3 = 1

		while slot2 and slot3 <= #slot0 do
			if slot0[slot3] ~= slot0.passAPCDeactivatedTimeFieldRawValue then
				slot2 = false
			end

			slot3 = slot3 + 1
		end

		if slot2 then
			return nil
		end

		if slot0[1] == slot0.passAPCDeactivatedTimeFieldRawValue then
			slot1.hour = slot0.passAPCDeactivatedTimeFieldNumber
		elseif slot0[1] > 23 then
			slot1.hour = slot0.passAPCInvalidTimeField
		else
			slot1.hour = slot0[1]
		end

		if slot0[2] == slot0.passAPCDeactivatedTimeFieldRawValue then
			slot1.minute = slot0.passAPCDeactivatedTimeFieldNumber
		elseif slot0[2] > 59 then
			slot1.minute = slot0.passAPCInvalidTimeField
		else
			slot1.minute = slot0[2]
		end

		if slot0[3] == slot0.passAPCDeactivatedTimeFieldRawValue then
			slot1.day = slot0.passAPCDeactivatedTimeFieldNumber
		elseif slot0[3] > 31 then
			slot1.day = slot0.passAPCInvalidTimeField
		else
			slot1.day = slot0[3]
		end

		if slot0[4] == slot0.passAPCDeactivatedTimeFieldRawValue then
			slot1.month = slot0.passAPCDeactivatedTimeFieldNumber
		elseif slot0[4] > 12 then
			slot1.month = slot0.passAPCInvalidTimeField
		else
			slot1.month = slot0[4]
		end

		if slot0[5] == slot0.passAPCDeactivatedTimeFieldRawValue and slot0[6] == slot0.passAPCDeactivatedTimeFieldRawValue then
			slot1.year = slot0.passAPCDeactivatedTimeFieldNumber
		else
			slot1.year = slot0:readUInt16(5)
		end

		return slot1
	end

	slot0.getPassAPCDeactivatedRawDateTime = function ()
		for slot4 = 1, #bytearray(6), 1 do
			slot0[slot4] = slot0.passAPCDeactivatedTimeFieldRawValue
		end

		return slot0
	end

	slot0.getPassAPCFixedPastDateTime = function ()
		return bytearray({
			0,
			0,
			1,
			1,
			bit.rshift(bit.band(2016, 65280), 8),
			bit.band(2016, 255)
		})
	end

	slot0.toPassAPCRawDateTime = function (slot0)
		slot1 = bytearray(6)

		if slot0.hour == slot0.passAPCDeactivatedTimeFieldNumber and slot0.minute == slot0.passAPCDeactivatedTimeFieldNumber and slot0.day == slot0.passAPCDeactivatedTimeFieldNumber and slot0.month == slot0.passAPCDeactivatedTimeFieldNumber and slot0.year == slot0.passAPCDeactivatedTimeFieldNumber then
			return slot0.getPassAPCDeactivatedRawDateTime()
		end

		if slot0.hour ~= nil and type(slot0.hour) == "number" and slot0.hour >= 0 and slot0.hour <= 23 then
			slot1[1] = slot0.hour
		else
			error("Invalid or missing field hour")
		end

		if slot0.minute ~= nil and type(slot0.minute) == "number" and slot0.minute >= 0 and slot0.minute <= 59 then
			slot1[2] = slot0.minute
		else
			error("Invalid or missing field minute")
		end

		if slot0.day ~= nil and type(slot0.day) == "number" and slot0.day >= 1 and slot0.day <= 31 then
			slot1[3] = slot0.day
		else
			error("Invalid or missing field day")
		end

		if slot0.month ~= nil and type(slot0.month) == "number" and slot0.month >= 1 and slot0.month <= 12 then
			slot1[4] = slot0.month
		else
			error("Invalid or missing field month")
		end

		if slot0.year ~= nil and type(slot0.year) == "number" and slot0.year >= 2016 then
			slot1[5] = bit.rshift(bit.band(slot0.year, 65280), 8)
			slot1[6] = bit.band(slot0.year, 255)
		else
			error("Invalid or missing field year")
		end

		return slot1
	end

	slot0.passAPCProductModelNameLength = 20
	slot0.passAPCSerialNumberLength = 12
	slot0.passAPCZoneNameLength = 12
	slot0.passAPCRegulationNameLength = 5
	slot0.passAPCRegulationSoftVersionLength = 12

	slot0.getPassAPCText = function (slot0, slot1, slot2)
		if slot2 == nil then
			slot2 = 0
		end

		slot3 = bytearray(slot1)
		slot4 = false

		for slot8 = slot1, 1, -1 do
			if slot0[slot8 + slot2] ~= nil and (slot0[slot8 + slot2] ~= string.byte(" ") or slot4) then
				if not slot4 then
					slot4 = true
					slot3 = bytearray(slot8)
				end

				slot3[slot8] = slot0[slot8 + slot2]
			end
		end

		return slot3:tostring("iso-8859-1")
	end

	slot0.setPassAPCText = function (slot0, slot1)
		if slot1 > #bytearray(string.sub(slot0, 1, slot1), "iso-8859-1") then
			for slot7 = 1, #bytearray(slot1), 1 do
				slot3[slot7] = string.byte(" ")
			end

			slot2 = slot0.copyElements(slot2, slot3)
		end

		return slot2
	end

	slot0.getPassAPCZoneName = function (slot0, slot1)
		if slot1 == nil then
			slot1 = 1
		end

		if slot1 <= 0 or slot1 > 16 or slot0 == nil or #slot0 < slot1 * slot0.passAPCZoneNameLength then
			return nil
		end

		return slot0:getPassAPCText(slot0.passAPCZoneNameLength, (slot1 - 1) * slot0.passAPCZoneNameLength)
	end

	slot0.setPassAPCZoneName = function (slot0, slot1, slot2)
		if slot2 == nil then
			slot1 = bytearray(slot0.passAPCZoneNameLength)
			slot2 = 1
		elseif slot1 == nil then
			error("Missing required state related to values of other zones, try a refresh all")
		elseif #slot1 < slot2 * slot0.passAPCZoneNameLength then
			error("Invalid zoneId " .. slot2 .. " regarding global state length " .. #slot1)
		end

		return slot1.copyElements(slot0:setPassAPCText(slot0.passAPCZoneNameLength), slot1, (slot2 - 1) * slot0.passAPCZoneNameLength + 1)
	end

	slot0.passAPCDHWNumberOfSlotsPerDay = 3
	slot0.passAPCDHWDaySlotLength = 4

	slot0.fromDHWRawDateTime = function (slot0)
		if slot0 == nil or #slot0 < 8 then
			return nil
		end

		slot1 = {}
		slot2 = "??"

		if slot0[1] < 0 or slot0[1] > 59 then
			slot1.second = slot2
		else
			slot1.second = slot0[1]
		end

		if slot0[2] < 0 or slot0[2] > 59 then
			slot1.minute = slot2
		else
			slot1.minute = slot0[2]
		end

		if slot0[3] < 0 or slot0[3] > 23 then
			slot1.hour = slot2
		else
			slot1.hour = slot0[3]
		end

		if slot0[4] < 1 or slot0[4] > 31 then
			slot1.day = slot2
		else
			slot1.day = slot0[4]
		end

		if slot0[5] < 0 or slot0[5] > 6 then
			slot1.weekday = slot2
		else
			slot1.weekday = slot0:readUInt8(5)
		end

		if slot0[6] < 1 or slot0[6] > 12 then
			slot1.month = slot2
		else
			slot1.month = slot0[6]
		end

		slot1.year = slot0:readUInt16(7, false)

		return slot1
	end

	slot0.toDHWRawDateTime = function (slot0)
		slot1 = bytearray(8)

		if slot0.second ~= nil and type(slot0.second) == "number" and slot0.second >= 0 and slot0.second <= 59 then
			slot1[1] = slot0.second
		else
			error("Invalid or missing field second")
		end

		if slot0.minute ~= nil and type(slot0.minute) == "number" and slot0.minute >= 0 and slot0.minute <= 59 then
			slot1[2] = slot0.minute
		else
			error("Invalid or missing field minute")
		end

		if slot0.hour ~= nil and type(slot0.hour) == "number" and slot0.hour >= 0 and slot0.hour <= 23 then
			slot1[3] = slot0.hour
		else
			error("Invalid or missing field hour")
		end

		if slot0.day ~= nil and type(slot0.day) == "number" and slot0.day >= 1 and slot0.day <= 31 then
			slot1[4] = slot0.day
		else
			error("Invalid or missing field day")
		end

		if slot0.weekday ~= nil and type(slot0.weekday) == "number" and slot0.weekday >= 0 and slot0.weekday <= 6 then
			slot1[5] = slot0.weekday
		else
			error("Invalid or missing field weekday")
		end

		if slot0.month ~= nil and type(slot0.month) == "number" and slot0.month >= 1 and slot0.month <= 12 then
			slot1[6] = slot0.month
		else
			error("Invalid or missing field month")
		end

		if slot0.year ~= nil and type(slot0.year) == "number" and slot0.year >= 2016 then
			slot1[8] = bit.rshift(bit.band(slot0.year, 65280), 8)
			slot1[7] = bit.band(slot0.year, 255)
		else
			error("Invalid or missing field year")
		end

		return slot1
	end

	slot0.readBit = function (slot0, slot1)
		if slot0 == nil then
			return nil
		end

		if bit.band(slot0, bit.lshift(1, slot1 - 1)) > 0 then
			return 1
		else
			return 0
		end
	end

	slot0.bytesToString = function (slot0)
		if slot0 == nil then
			return nil
		end

		if #slot0:rawTrim():tostring("iso-8859-1") == 0 then
			return nil
		end

		return slot1
	end

	slot0.getPassAPCDHWWeekTimeProgram = function (slot0)
		return slot0:getWeekTimeProgram(slot0.passAPCDHWNumberOfSlotsPerDay, slot0.passAPCDHWDaySlotLength, slot0.getPassAPCDHWProgramSlot)
	end

	slot0.getPassAPCDHWProgramSlot = function (slot0, slot1)
		return slot0:getPassAPCProgramSlot(slot1)
	end

	slot0.error = function (slot0)
		error("[AtlanticUtils] " .. slot0)
	end

	slot0.Converter = {
		Light = {}
	}
	slot0.Converter.Light.Intensity = "Light/Intensity"
	slot0.Converter.Light.OnOffStatus = "Light/OnOffStatus"
	slot0.Converter.Light.TurnOffDelay = "Light/TurnOffDelay"
	slot0.Converter.Light.ActiveStatus = "Light/ActiveStatus"
	slot0.Converter.RawValueToValue = {
		[slot0.Converter.Light.Intensity] = function (slot0)
			if slot0 == nil then
				slot0.error("unknown (nil)")
			elseif slot0 == 100 then
				return 1
			elseif slot0 == 1000 then
				return 10
			elseif slot0 == 2000 then
				return 20
			elseif slot0 == 3000 then
				return 30
			elseif slot0 == 10000 then
				return 100
			end

			slot0.error("unknown (" .. slot0 .. ")")
		end,
		[slot0.Converter.Light.OnOffStatus] = function (slot0)
			if slot0 == nil then
				slot0.error("unknown (nil)")
			elseif slot0 == 0 then
				return "off"
			elseif slot0 == 1 then
				return "on"
			end

			slot0.error("unknown (" .. slot0 .. ")")
		end,
		[slot0.Converter.Light.TurnOffDelay] = function (slot0)
			if slot0 == 0 then
				return "disabled"
			else
				return slot0
			end
		end
	}
	slot0.Converter.ValueToRawValue = {
		[slot0.Converter.Light.Intensity] = function (slot0)
			slot1 = bytearray(2)

			if slot0 == 100 then
				return slot1:writeUInt16(1, 10000, false)
			elseif slot0 == 30 then
				return slot1:writeUInt16(1, 3000, false)
			elseif slot0 == 20 then
				return slot1:writeUInt16(1, 2000, false)
			elseif slot0 == 10 then
				return slot1:writeUInt16(1, 1000, false)
			elseif slot0 == 1 then
				return slot1:writeUInt16(1, 100, false)
			end

			slot0.error("Light-Level: unknown value: " .. slot0)
		end,
		[slot0.Converter.Light.OnOffStatus] = function (slot0)
			slot1 = bytearray(1)

			if slot0 == "off" then
				slot1[1] = 0
			elseif slot0 == "on" then
				slot1[1] = 1
			else
				slot0.error("Light-OnOffStatus: unknown value: " .. slot0)
			end

			return slot1
		end,
		[slot0.Converter.Light.TurnOffDelay] = function (slot0)
			slot1 = bytearray(2)

			if slot0 == "disabled" then
				return slot1:writeUInt16(1, 0, false)
			else
				return slot1:writeUInt16(1, slot0, false)
			end
		end
	}

	slot0.Converter.RawValueToValue[slot0.Converter.Light.ActiveStatus] = function (slot0)
		if slot0 == nil then
			slot0.error("unknown (nil)")
		elseif slot0 == 0 then
			return "inactive"
		elseif slot0 == 1 then
			return "active"
		end

		slot0.error("unknown (" .. slot0 .. ")")
	end

	slot0.Converter.ValueToRawValue[slot0.Converter.Light.ActiveStatus] = function (slot0)
		slot1 = bytearray(1)

		if slot0 == "inactive" then
			slot1[1] = 0
		elseif slot0 == "active" then
			slot1[1] = 1
		else
			slot0.error("Light-ActiveStatus: unknown value: " .. slot0)
		end

		return slot1
	end

	slot0.setClosestValidIntensity = function (slot0)
		slot1 = {}

		if slot0:normalizeAtlanticIntensity() > 0 then
			slot1[1] = slot0.Converter.ValueToRawValue[slot0.Converter.Light.Intensity](slot0)
			slot1[2] = {
				category = "lighting"
			}
			slot1[3] = slot0.Converter.ValueToRawValue[slot0.Converter.Light.OnOffStatus]("on")
			slot1[4] = {
				type = 201409537,
				category = "lighting"
			}
		else
			slot1[1] = slot0.Converter.ValueToRawValue[slot0.Converter.Light.OnOffStatus]("off")
			slot1[2] = {
				type = 201409537,
				category = "lighting"
			}
		end

		return slot1
	end

	slot0.setClosestValidIntensityWithTimer = function (slot0, slot1, slot2)
		slot3 = slot0:setClosestValidIntensity()
		slot2 = slot0.normalizeAtlanticIntensity(slot2)

		if slot0 == 0 and slot2 > 0 then
			slot3[#slot3 + 1] = slot0.Converter.ValueToRawValue[slot0.Converter.Light.Intensity](slot2)
			slot3[#slot3 + 1] = {
				category = "lighting"
			}
			slot3[#slot3 + 1] = slot0.Converter.ValueToRawValue[slot0.Converter.Light.OnOffStatus]("on")
			slot3[#slot3 + 1] = {
				type = 201409537,
				category = "lighting",
				delay = slot1
			}
		elseif slot0 > 0 and slot2 > 0 then
			slot3[#slot3 + 1] = slot0.Converter.ValueToRawValue[slot0.Converter.Light.Intensity](slot2)
			slot3[#slot3 + 1] = {
				category = "lighting",
				delay = slot1
			}
		elseif slot0 > 0 and slot2 == 0 then
			slot3[#slot3 + 1] = slot0.Converter.ValueToRawValue[slot0.Converter.Light.OnOffStatus]("off")
			slot3[#slot3 + 1] = {
				type = 201409537,
				category = "lighting",
				delay = slot1
			}
		end

		return table.unpack(slot3)
	end

	slot0.normalizeAtlanticIntensity = function (slot0)
		if slot0 > 1 and slot0 <= 10 then
			return 10
		elseif slot0 > 10 and slot0 <= 30 then
			return 30
		elseif slot0 > 30 then
			return 100
		end

		return slot0
	end

	return slot0
end
