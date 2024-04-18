-- chunkname: @./common-atlantic-utils.module

return function(AtlanticUtils)
	local CommonUtils = depends("common", "utils")

	function AtlanticUtils.fromRawName(b)
		if b == nil or #b == 0 then
			return ""
		end

		for i = 1, #b do
			if b[i] == 0 then
				b = b:sub(1, i - 1)

				break
			end
		end

		return b:tostring("iso-8859-1")
	end

	function AtlanticUtils.fromRawVersion(b)
		local version = ""

		for i = 1, #b do
			version = version .. string.format("%02x", b[i])
		end

		return version
	end

	function AtlanticUtils.getUsageTotalFor(usageObject, usageConsumptionObject, usageId)
		if usageObject == nil or usageConsumptionObject == nil then
			return nil
		end

		local usageRank

		for j = 1, #usageObject do
			local id = bit.rshift(usageObject[j], 4)

			if id == usageId then
				usageRank = j

				break
			end
		end

		if usageRank == nil then
			return nil
		end

		return AtlanticUtils.getUsageTotal(usageConsumptionObject, usageRank)
	end

	function AtlanticUtils.getUsageTotal(usageConsumptionObject, usageRank)
		if usageConsumptionObject == nil or #usageConsumptionObject < 5 then
			return nil
		end

		local idxCount = bit.band(usageConsumptionObject[1], 15) + 1
		local usageCount = math.floor((#usageConsumptionObject / idxCount - 1) / 4)

		if usageCount < usageRank then
			return nil
		end

		local total = 0

		for j = 1, idxCount do
			total = total + usageConsumptionObject:readUInt32((j - 1) * (1 + 4 * usageCount) + 2 + (usageRank - 1) * 4)
		end

		return total
	end

	function AtlanticUtils.getUsageByRateFor(usageObject, usageConsumptionObject, usageId, rate)
		if usageObject == nil or usageConsumptionObject == nil then
			return nil
		end

		local usageRank

		for j = 1, #usageObject do
			local id = bit.rshift(usageObject[j], 4)

			if id == usageId then
				usageRank = j

				break
			end
		end

		if usageRank == nil then
			return nil
		end

		return AtlanticUtils.getUsageByRate(usageConsumptionObject, rate, usageRank)
	end

	function AtlanticUtils.getUsageByRate(usageConsumptionObject, rate, usageRank)
		if usageConsumptionObject == nil or #usageConsumptionObject < 5 then
			return nil
		end

		local idxCount = bit.band(usageConsumptionObject[1], 15) + 1

		if idxCount < rate then
			return nil
		end

		local usageCount = math.floor((#usageConsumptionObject / idxCount - 1) / 4)

		if usageCount < usageRank then
			return nil
		end

		return usageConsumptionObject:readUInt32((rate - 1) * (1 + 4 * usageCount) + 2 + (usageRank - 1) * 4)
	end

	AtlanticUtils.usageName = {
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

	function AtlanticUtils.getUsageName(usageObject, usageRank)
		if usageObject == nil or usageRank > #usageObject then
			return nil
		end

		local v = bit.rshift(usageObject[usageRank], 4)
		local name = AtlanticUtils.usageName[v]

		if name == nil then
			return "?"
		end

		return name
	end

	function AtlanticUtils.getTotal(usageConsumptionObject)
		if usageConsumptionObject == nil or #usageConsumptionObject < 5 then
			return nil
		end

		local idxCount = bit.band(usageConsumptionObject[1], 15) + 1
		local usageCount = math.floor((#usageConsumptionObject / idxCount - 1) / 4)
		local total = 0

		for i = 1, usageCount do
			for j = 1, idxCount do
				total = total + usageConsumptionObject:readUInt32((j - 1) * (1 + 4 * usageCount) + 2 + (i - 1) * 4)
			end
		end

		return total
	end

	function AtlanticUtils.setTimeProgram(p1)
		if p1 == nil then
			return nil
		end

		local b = bytearray(16)

		for loop = 1, 16 do
			b[loop] = 0
		end

		if p1.lastRequest == "gui" then
			b[1] = 0
		else
			b[1] = 1
		end

		if p1.daymode ~= nil then
			b[2] = bit.bor(bit.lshift(AtlanticUtils.getDayModeProgramAsInt(p1.daymode.tuesday), 4), AtlanticUtils.getDayModeProgramAsInt(p1.daymode.monday))
			b[3] = bit.bor(bit.lshift(AtlanticUtils.getDayModeProgramAsInt(p1.daymode.thursday), 4), AtlanticUtils.getDayModeProgramAsInt(p1.daymode.wednesday))
			b[4] = bit.bor(bit.lshift(AtlanticUtils.getDayModeProgramAsInt(p1.daymode.saturday), 4), AtlanticUtils.getDayModeProgramAsInt(p1.daymode.friday))
			b[5] = AtlanticUtils.getDayModeProgramAsInt(p1.daymode.sunday)
		end

		if p1.programs ~= nil and #p1.programs > 0 then
			for loop = 1, #p1.programs do
				if p1.programs[loop].slots ~= nil then
					local index = 4 + 6 * (loop - 1) + 1

					b[index] = bit.bor(b[index], bit.lshift(p1.programs[loop].slots.count, loop % 2 * 4))

					if p1.programs[loop].slots.definitions ~= nil and #p1.programs[loop].slots.definitions > 0 then
						for loop2 = 1, #p1.programs[loop].slots.definitions do
							if p1.programs[loop].slots.definitions[loop2] ~= nil then
								local index2 = index + loop2

								b[index2] = bit.bor(bit.lshift(AtlanticUtils.getSlotStartTimeAsInt(p1.programs[loop].slots.definitions[loop2].start), 2), AtlanticUtils.getSlotModeAsInt(p1.programs[loop].slots.definitions[loop2].mode))
							else
								b[index2] = 195
							end
						end
					end
				end
			end
		end

		return b
	end

	function AtlanticUtils.getTimeProgram(b)
		if b == nil or #b ~= 16 then
			return {}
		end

		local program = {}

		if b:readInt8(1) == 0 then
			program.lastRequest = "gui"
		else
			program.lastRequest = "box"
		end

		program.daymode = {}
		program.daymode.monday = AtlanticUtils.getDayModeProgramAsString(bit.band(b[2], 15))
		program.daymode.tuesday = AtlanticUtils.getDayModeProgramAsString(bit.rshift(b[2], 4))
		program.daymode.wednesday = AtlanticUtils.getDayModeProgramAsString(bit.band(b[3], 15))
		program.daymode.thursday = AtlanticUtils.getDayModeProgramAsString(bit.rshift(b[3], 4))
		program.daymode.friday = AtlanticUtils.getDayModeProgramAsString(bit.band(b[4], 15))
		program.daymode.saturday = AtlanticUtils.getDayModeProgramAsString(bit.rshift(b[4], 4))
		program.daymode.sunday = AtlanticUtils.getDayModeProgramAsString(bit.band(b[5], 15))
		program.programs = {}

		for loop = 1, 2 do
			program.programs[loop] = {}

			local slots = {}

			if loop == 1 then
				slots.count = bit.rshift(b[5], 4)
			elseif loop == 2 then
				slots.count = bit.band(b[11], 15)
			end

			slots.definitions = {}

			if slots.count > 0 then
				for loop2 = 1, slots.count do
					slots.definitions[loop2] = {}

					local index = 6 * loop + loop2 - 1

					slots.definitions[loop2].mode = AtlanticUtils.getSlotModeAsString(bit.band(b[index], 3))
					slots.definitions[loop2].start = AtlanticUtils.getSlotStartTimeAsString(bit.rshift(b[index], 2))
				end
			end

			program.programs[loop].slots = slots
		end

		return program
	end

	function AtlanticUtils.getDayModeProgramAsString(value)
		if value == nil then
			return nil
		end

		if value == 0 then
			return "day-presence"
		elseif value == 1 then
			return "day-presence-plus"
		elseif value == 2 then
			return "day-away"
		elseif value == 3 then
			return "morning-away"
		elseif value == 4 then
			return "afternoon-away"
		elseif value == 5 then
			return "prog1"
		elseif value == 6 then
			return "prog2"
		else
			return "day-presence"
		end
	end

	function AtlanticUtils.getSlotModeAsString(value)
		if value == nil then
			return nil
		end

		if value == 0 then
			return "away"
		elseif value == 1 then
			return "presence"
		elseif value == 2 then
			return "presence-plus"
		else
			return "presence"
		end
	end

	function AtlanticUtils.getSlotStartTimeAsString(value)
		local hours = math.floor(value / 2)
		local minutes = 0

		if value % 2 == 1 then
			minutes = 30
		end

		return string.format("%02d", hours) .. ":" .. string.format("%02d", minutes)
	end

	function AtlanticUtils.getDayModeProgramAsInt(value)
		if value == nil then
			return nil
		end

		if value == "day-presence" then
			return 0
		elseif value == "day-presence-plus" then
			return 1
		elseif value == "day-away" then
			return 2
		elseif value == "morning-away" then
			return 3
		elseif value == "afternoon-away" then
			return 4
		elseif value == "prog1" then
			return 5
		elseif value == "prog2" then
			return 6
		else
			return 0
		end
	end

	function AtlanticUtils.getSlotModeAsInt(value)
		if value == nil then
			return nil
		end

		if value == "presence" then
			return 1
		elseif value == "presence-plus" then
			return 2
		elseif value == "away" then
			return 0
		else
			return 0
		end
	end

	function AtlanticUtils.getSlotStartTimeAsInt(value)
		local hour, minute = value:match("([0-9]+):([0-9]*)")
		local start = hour * 2

		if minute ~= nil and minute == "30" then
			start = start + 1
		end

		return start
	end

	function AtlanticUtils.setVentilationMode(p1)
		local b = bytearray(8)

		if p1.dayNight == "day" then
			b[1] = 0
		else
			b[1] = 1
		end

		if p1.cooling == "on" then
			b[2] = 1
		else
			b[2] = 0
		end

		if p1.prog == "on" then
			b[3] = 1
		else
			b[3] = 0
		end

		if p1.test == "on" then
			b[4] = 1
		else
			b[4] = 0
		end

		if p1.endOfLineTest == "on" then
			b[5] = 1
		else
			b[5] = 0
		end

		if p1.leapYear == "on" then
			b[6] = 1
		else
			b[6] = 0
		end

		b[7] = p1.month
		b[8] = p1.day

		return b
	end

	function AtlanticUtils.getVentilationMode(b)
		if b == nil or #b ~= 8 then
			return {}
		end

		local mode = {}

		if b:readInt8(1) == 0 then
			mode.dayNight = "day"
		else
			mode.dayNight = "night"
		end

		if b:readInt8(2) == 0 then
			mode.cooling = "off"
		else
			mode.cooling = "on"
		end

		if b:readInt8(3) == 0 then
			mode.prog = "off"
		else
			mode.prog = "on"
		end

		if b:readInt8(4) == 0 then
			mode.test = "off"
		else
			mode.test = "on"
		end

		if b:readInt8(5) == 0 then
			mode.endOfLineTest = "off"
		else
			mode.endOfLineTest = "on"
		end

		if b:readInt8(6) == 0 then
			mode.leapYear = "off"
		else
			mode.leapYear = "on"
		end

		mode.month = b:readInt8(7)
		mode.day = b:readInt8(8)

		return mode
	end

	function AtlanticUtils.getEnergySaving(b)
		if b == nil or #b ~= 32 then
			return {}
		end

		local energySaving = {}

		energySaving["month-13"] = b:readInt16(1)
		energySaving["month-12"] = b:readInt16(3)
		energySaving["month-11"] = b:readInt16(5)
		energySaving["month-10"] = b:readInt16(7)
		energySaving["month-9"] = b:readInt16(9)
		energySaving["month-8"] = b:readInt16(11)
		energySaving["month-7"] = b:readInt16(13)
		energySaving["month-6"] = b:readInt16(15)
		energySaving["month-5"] = b:readInt16(17)
		energySaving["month-4"] = b:readInt16(19)
		energySaving["month-3"] = b:readInt16(21)
		energySaving["month-2"] = b:readInt16(23)
		energySaving["month-1"] = b:readInt16(25)
		energySaving.currentMonth = b:readInt16(27)
		energySaving.total = bit.lshift(b:readInt16(29), 16) + b:readInt16(31)

		return energySaving
	end

	function AtlanticUtils.getCO2History(b)
		if b == nil or #b ~= 145 then
			return {}
		end

		local co2History = {}

		for i = 1, #b do
			co2History[i] = b:readUInt8(i)
		end

		return co2History
	end

	function AtlanticUtils.getDateTime(b)
		if b == nil or #b ~= 8 then
			return {}
		end

		local time = {}

		time.hour = b[1]
		time.minute = b[2]
		time.second = b[3]
		time.day = b[4]
		time.month = b[5]
		time.year = b:readUInt16(6, false)
		time.weekday = b[8]

		return time
	end

	function AtlanticUtils.setDateTime(p1)
		local b = bytearray(8)

		b[1] = p1.hour
		b[2] = p1.minute
		b[3] = p1.second
		b[4] = p1.day
		b[5] = p1.month

		b:writeUInt16(6, p1.year, false)

		b[8] = p1.weekday

		return b
	end

	function AtlanticUtils.getSensorsErrorState(b)
		if b == nil or #b < 13 then
			return {}
		end

		local error = {}

		error.co2 = bit.band(b[13], 1) == 1
		error.outlet = {}
		error.outlet.newAir = bit.rshift(bit.band(b[13], 2), 1) == 1
		error.outlet.exhaustAir = bit.rshift(bit.band(b[13], 4), 2) == 1
		error.inlet = {}
		error.inlet.newAir = bit.rshift(bit.band(b[13], 8), 3) == 1
		error.inlet.exhaustAir = bit.rshift(bit.band(b[13], 16), 4) == 1
		error.outside = bit.rshift(bit.band(b[13], 32), 5) == 1

		return error
	end

	function AtlanticUtils.getElecHeaterSlotTimeAsString(value)
		local hours = math.floor(value / 2)
		local minutes = 0

		if value % 2 == 1 then
			minutes = 30
		end

		return string.format("%02d", hours) .. ":" .. string.format("%02d", minutes)
	end

	function AtlanticUtils.getElecHeaterSlotTimeFromString(value)
		local parts = value:split("[0-9]+")

		if #parts ~= 2 then
			error("Invalid parameter, time program should match {'start':'HH:mm','end':'HH:mm'}")
		end

		local hours = parts[1]
		local minutes = parts[2]

		minutes = minutes == "30" and 1 or 0

		return tonumber(hours) * 2 + minutes
	end

	function AtlanticUtils.setElecHeaterTimeProgram(p1)
		local b = bytearray(7)
		local timeProgram = {}
		local j = 1

		if p1.monday ~= nil then
			timeProgram = p1.monday
			b[j] = 0
			j = j + 1
		elseif p1.tuesday ~= nil then
			timeProgram = p1.tuesday
			b[j] = 1
			j = j + 1
		elseif p1.wednesday ~= nil then
			timeProgram = p1.wednesday
			b[j] = 2
			j = j + 1
		elseif p1.thursday ~= nil then
			timeProgram = p1.thursday
			b[j] = 3
			j = j + 1
		elseif p1.friday ~= nil then
			timeProgram = p1.friday
			b[j] = 4
			j = j + 1
		elseif p1.saturday ~= nil then
			timeProgram = p1.saturday
			b[j] = 5
			j = j + 1
		elseif p1.sunday ~= nil then
			timeProgram = p1.sunday
			b[j] = 6
			j = j + 1
		end

		for i = 1, #timeProgram do
			local startTime = timeProgram[i].start
			local endTime = timeProgram[i]["end"]

			b[j] = AtlanticUtils.getElecHeaterSlotTimeFromString(startTime)
			b[j + 1] = AtlanticUtils.getElecHeaterSlotTimeFromString(endTime)
			j = j + 2
		end

		return b
	end

	function AtlanticUtils.getElecHeaterDailyTimeProgram(b)
		if b == nil or #b ~= 7 then
			return {}
		end

		local dailyTimeProgram = {}
		local day = {}

		for loop = 1, 3 do
			if b[loop * 2] ~= 255 and b[loop * 2 + 1] ~= 255 then
				day[loop] = {}
				day[loop].start = AtlanticUtils.getElecHeaterSlotTimeAsString(b[loop * 2])
				day[loop]["end"] = AtlanticUtils.getElecHeaterSlotTimeAsString(b[loop * 2 + 1])
			end
		end

		if b[1] == 0 then
			dailyTimeProgram.monday = day
		elseif b[1] == 1 then
			dailyTimeProgram.tuesday = day
		elseif b[1] == 2 then
			dailyTimeProgram.wednesday = day
		elseif b[1] == 3 then
			dailyTimeProgram.thursday = day
		elseif b[1] == 4 then
			dailyTimeProgram.friday = day
		elseif b[1] == 5 then
			dailyTimeProgram.saturday = day
		elseif b[1] == 6 then
			dailyTimeProgram.sunday = day
		end

		return dailyTimeProgram
	end

	function AtlanticUtils.getElecHeaterTimeProgram(p1, p2, p3, p4, p5, p6, p7)
		local timeProgram = {}
		local index = 1

		if p1 ~= nil then
			timeProgram[index] = p1
			index = index + 1
		end

		if p2 ~= nil then
			timeProgram[index] = p2
			index = index + 1
		end

		if p3 ~= nil then
			timeProgram[index] = p3
			index = index + 1
		end

		if p4 ~= nil then
			timeProgram[index] = p4
			index = index + 1
		end

		if p5 ~= nil then
			timeProgram[index] = p5
			index = index + 1
		end

		if p6 ~= nil then
			timeProgram[index] = p6
			index = index + 1
		end

		if p7 ~= nil then
			timeProgram[index] = p7
			index = index + 1
		end

		return timeProgram
	end

	function AtlanticUtils.getAutoProgram(p1)
		if #p1 ~= 339 then
			return nil
		end

		local autoProgram = {}
		local monday = {}

		for loop = 1, 48 do
			monday[loop] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.monday = monday

		local tuesday = {}

		for loop = 49, 96 do
			tuesday[loop - 48] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.tuesday = tuesday

		local wednesday = {}

		for loop = 97, 144 do
			wednesday[loop - 96] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.wednesday = wednesday

		local thursday = {}

		for loop = 145, 192 do
			thursday[loop - 144] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.thursday = thursday

		local friday = {}

		for loop = 193, 240 do
			friday[loop - 192] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.friday = friday

		local saturday = {}

		for loop = 241, 288 do
			saturday[loop - 240] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.saturday = saturday

		local sunday = {}

		for loop = 289, 336 do
			sunday[loop - 288] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.sunday = sunday
		autoProgram.anticipTime = p1:readUInt16(337, false)
		autoProgram.anticipNb = p1:readUInt8(339)

		return autoProgram
	end

	function AtlanticUtils.getSetpoint(v)
		if v == 0 then
			return "CONF_3_NIV1"
		elseif v == 1 then
			return "CONF_3_NIV2"
		elseif v == 2 then
			return "CONF_2"
		elseif v == 3 then
			return "CONF_1"
		elseif v == 4 then
			return "CONF_NIV1"
		elseif v == 5 then
			return "CONF_NIV2"
		elseif v == 6 then
			return "CONF_NIV3"
		else
			return nil
		end
	end

	function AtlanticUtils.getElecHeaterDateTime(b)
		if b == nil or #b ~= 8 then
			return {}
		end

		local time = {}

		time.second = b[1]
		time.minute = b[2]
		time.hour = b[3]
		time.day = b[4]
		time.weekday = b[5]
		time.year = b:readUInt16(7, false)
		time.month = b[6]

		return time
	end

	function AtlanticUtils.setElecHeaterDateTime(p1)
		local b = bytearray(8)

		b[1] = p1.second
		b[2] = p1.minute
		b[3] = p1.hour
		b[4] = p1.day
		b[5] = p1.weekday

		b:writeUInt16(7, p1.year, false)

		b[6] = p1.month

		return b
	end

	function AtlanticUtils.getExpectedPresence(b)
		if b == nil or #b ~= 2 then
			return {}
		end

		local hour = b:readUInt8(1, false) .. ""
		local min = b:readUInt8(2, false) .. ""

		if #hour == 1 then
			hour = "0" .. hour
		end

		if #min == 1 then
			min = "0" .. min
		end

		return hour .. ":" .. min
	end

	function AtlanticUtils.setExpectedPresence(p1)
		local b = bytearray(2)
		local hour, min = p1:match("(%d+):(%d+)")

		b[1] = hour
		b[2] = min

		return b
	end

	function AtlanticUtils.setElectricalHeaterTargetTemperature(value, previousValue, context)
		local defaultValue = 15
		local b = bytearray(2)

		if value == "previous" then
			if context ~= nil and context.groupDef then
				return value
			else
				local v

				if previousValue == nil then
					error("\"previous\" temperature is null")
				elseif type(previousValue) ~= "string" then
					error("\"previous\" temperature is not a string")
				else
					v = tonumber(previousValue)
				end

				return b:writeUInt16(1, v * 10, false)
			end
		else
			if value == nil or type(value) ~= "number" then
				error("value is null or not a number")
			end

			return b:writeUInt16(1, value * 10, false)
		end
	end

	function AtlanticUtils.setPreviousComfortTargetTemperature(value, targetTemperature, context)
		if value == "comfort" then
			if context ~= nil and context.groupDef then
				return value
			elseif targetTemperature == nil then
				return 15
			else
				return targetTemperature
			end
		else
			return value
		end
	end

	function AtlanticUtils.getManufacturerName(p1)
		if p1[1] == 65 then
			return "Atlantic"
		elseif p1[1] == 83 then
			return "Sauter"
		elseif p1[1] == 84 then
			return "Thermor"
		elseif p1[1] == 78 then
			return "Neutre"
		end
	end

	function AtlanticUtils.getDHWError(b)
		if b == nil or #b < 3 then
			return {}
		end

		local error = {}

		error.type = b:readUInt8(1)
		error.code = b:readUInt8(2)

		local f = b:readUInt8(3)

		if f >= 32 and f <= 126 then
			error.family = string.char(b:readUInt8(3))
		else
			error.family = "?"
		end

		if #b >= 4 then
			error.minor = b:readUInt8(4)
		end

		return error
	end

	function AtlanticUtils.getRateManagement(value)
		if value == nil then
			return {}
		end

		if value == 64512 then
			return "no"
		end

		if value == 64513 then
			return "wanted"
		end

		if value == 64514 then
			return "recommended"
		end

		if value == 64516 then
			return "unsuitable"
		end

		if value == 64517 then
			return "forbidden"
		end

		return "?"
	end

	function AtlanticUtils.getOperatingModeCapabilities(value)
		if value == nil then
			return {}
		end

		local operatingMode = {}

		operatingMode.rateManagement = bit.band(value, 1)
		operatingMode.absence = bit.band(bit.rshift(value, 2), 1)
		operatingMode.relaunch = bit.band(bit.rshift(value, 3), 1)
		operatingMode.energyDemandStatus = bit.band(bit.rshift(value, 15), 1)

		return operatingMode
	end

	function AtlanticUtils.getCurrentOperatingMode(value)
		if value == nil then
			return {}
		end

		local currentOperatingMode = {}

		if bit.band(bit.rshift(value, 8), 3) == 0 then
			currentOperatingMode.relaunch = "Keep_Current_Value "
		end

		if bit.band(bit.rshift(value, 8), 3) == 1 then
			currentOperatingMode.relaunch = "on"
		end

		if bit.band(bit.rshift(value, 8), 3) == 2 then
			currentOperatingMode.relaunch = "off"
		end

		if bit.band(bit.rshift(value, 8), 3) == 3 then
			currentOperatingMode.relaunch = "Not_Used"
		end

		if bit.band(bit.rshift(value, 10), 3) == 0 then
			currentOperatingMode.absence = "Keep_Current_Value"
		end

		if bit.band(bit.rshift(value, 10), 3) == 1 then
			currentOperatingMode.absence = "on"
		end

		if bit.band(bit.rshift(value, 10), 3) == 2 then
			currentOperatingMode.absence = "off"
		end

		if bit.band(bit.rshift(value, 10), 3) == 3 then
			currentOperatingMode.absence = "Not_Used"
		end

		return currentOperatingMode
	end

	function AtlanticUtils.getUserProgSlotsDHW(p1)
		local slots = {}
		local firstSlot = {}
		local secondSlot = {}

		firstSlot.start = AtlanticUtils.getValidHour(p1:readUInt8(1)) .. ":" .. AtlanticUtils.getValidHour(p1:readUInt8(2))
		firstSlot["end"] = AtlanticUtils.getValidHour(p1:readUInt8(3)) .. ":" .. AtlanticUtils.getValidHour(p1:readUInt8(4))
		secondSlot.start = AtlanticUtils.getValidHour(p1:readUInt8(5)) .. ":" .. AtlanticUtils.getValidHour(p1:readUInt8(6))
		secondSlot["end"] = AtlanticUtils.getValidHour(p1:readUInt8(7)) .. ":" .. AtlanticUtils.getValidHour(p1:readUInt8(8))
		slots = {
			slot1 = firstSlot,
			slot2 = secondSlot
		}

		return slots
	end

	function AtlanticUtils.getValidHour(value)
		if value < 10 then
			return 0 .. value
		end

		return value
	end

	function AtlanticUtils.setUserProgSlotsDHW(p1)
		local firstSlot = p1.slot1
		local secondSlot = p1.slot2
		local fss = CommonUtils.split(firstSlot.start, "%d%d")
		local fse = CommonUtils.split(firstSlot["end"], "%d%d")
		local sss = CommonUtils.split(secondSlot.start, "%d%d")
		local sse = CommonUtils.split(secondSlot["end"], "%d%d")

		return bytearray({
			tonumber(fss[1]),
			tonumber(fss[2]),
			tonumber(fse[1]),
			tonumber(fse[2]),
			tonumber(sss[1]),
			tonumber(sss[2]),
			tonumber(sse[1]),
			tonumber(sse[2])
		})
	end

	function AtlanticUtils.getOperatingRange(p1)
		local value

		value = p1 == 0 and "pacHC_elecHC" or p1 == 1 and "pacProg_elecProg" or p1 == 2 and "pac24h_elecHC" or p1 == 3 and "pac24h_elecProg" or "pac24h_elec24h"

		return value
	end

	function AtlanticUtils.setOperatingRange(p1)
		local value

		value = p1 == "pacHC_elecHC" and 0 or p1 == "pacProg_elecProg" and 1 or p1 == "pac24h_elecHC" and 2 or p1 == "pac24h_elecProg" and 3 or 4

		return value
	end

	function AtlanticUtils.getElectricalExtraManagement(p1)
		local value

		value = p1 == 0 and "auto" or "deactive"

		return value
	end

	function AtlanticUtils.getInstallation(p1)
		local value

		value = p1 == 0 and "onlyThermodynamic" or p1 == 1 and "extraBoiler" or "extraSolar"

		return value
	end

	function AtlanticUtils.getBoilerInstallationOption(p1)
		local value

		value = p1 == 0 and "heatPumpPriority" or p1 == 1 and "heatPumpOptimising" or p1 == 2 and "boilerOptimising" or "boilerPriority"

		return value
	end

	function AtlanticUtils.getSmartGridOption(p1)
		if p1 == 0 then
			return "deactive"
		else
			return "active"
		end
	end

	function AtlanticUtils.setSmartGridOption(p1)
		local value

		if p1 == "active" then
			return 1
		else
			return 0
		end
	end

	function AtlanticUtils.getExtractionOption(p1)
		local value

		value = p1 == 0 and "noExtraction" or p1 == 1 and "lowExtractionSpeed" or "fastExtractionSpeed"

		return value
	end

	function AtlanticUtils.getTowelDryerOpertingMode(p1)
		local operatingMode

		operatingMode = p1 == 0 and "standby" or p1 == 1 and "auto" or p1 == 2 and "internal" or "external"

		return operatingMode
	end

	function AtlanticUtils.setTowelDryerOperatingMode(p1)
		local b = bytearray(1)

		if p1 == "standby" then
			b[1] = 0
		elseif p1 == "auto" then
			b[1] = 1
		elseif p1 == "internal" then
			b[1] = 2
		elseif p1 == "external" then
			b[1] = 3
		end

		return b
	end

	function AtlanticUtils.getTowelDryerTemporaryState(p1)
		local temporaryState

		if p1 == 0 then
			temporaryState = "permanentHeating"
		elseif p1 == 1 then
			temporaryState = "boost"
		elseif p1 == 2 then
			temporaryState = "drying"
		end

		return temporaryState
	end

	function AtlanticUtils.setTowelDryerTemporaryState(p1)
		local b = bytearray(1)

		if p1 == "permanentHeating" then
			b[1] = 0
		elseif p1 == "boost" then
			b[1] = 1
		elseif p1 == "drying" then
			b[1] = 2
		end

		return b
	end

	function AtlanticUtils.getTowelDryerDailyTimeProgram(b)
		if b == nil or #b ~= 7 then
			return {}
		end

		local dailyTimeProgram = {}
		local day = {}

		for loop = 1, 3 do
			if b[loop * 2] ~= 255 and b[loop * 2 + 1] ~= 255 then
				day[loop] = {}
				day[loop].start = AtlanticUtils.getTowelDryerSlotTimeAsString(b[loop * 2])
				day[loop]["end"] = AtlanticUtils.getTowelDryerSlotTimeAsString(b[loop * 2 + 1])
			end
		end

		if b[1] == 0 then
			dailyTimeProgram.monday = day
		elseif b[1] == 1 then
			dailyTimeProgram.tuesday = day
		elseif b[1] == 2 then
			dailyTimeProgram.wednesday = day
		elseif b[1] == 3 then
			dailyTimeProgram.thursday = day
		elseif b[1] == 4 then
			dailyTimeProgram.friday = day
		elseif b[1] == 5 then
			dailyTimeProgram.saturday = day
		elseif b[1] == 6 then
			dailyTimeProgram.sunday = day
		end

		return dailyTimeProgram
	end

	function AtlanticUtils.getTowelDryerSlotTimeAsString(value)
		local hours = math.floor(value / 4)
		local minutes = value % 4 * 15

		return string.format("%02d", hours) .. ":" .. string.format("%02d", minutes)
	end

	function AtlanticUtils.getTowelDryerSlotTimeFromString(value)
		local parts = value:split("[0-9]+")

		if #parts ~= 2 then
			error("Invalid parameter, time program should match {'start':'HH:mm','end':'HH:mm'}")
		end

		local hours = parts[1]
		local minutes = parts[2]

		minutes = minutes == "15" and 1 or minutes == "30" and 2 or minutes == "45" and 3 or 0

		return tonumber(hours) * 4 + minutes
	end

	function AtlanticUtils.setTowelDryerTimeProgram(p1)
		local b = bytearray(7)
		local timeProgram = {}
		local j = 1

		if p1.monday ~= nil then
			timeProgram = p1.monday
			b[j] = 0
			j = j + 1
		elseif p1.tuesday ~= nil then
			timeProgram = p1.tuesday
			b[j] = 1
			j = j + 1
		elseif p1.wednesday ~= nil then
			timeProgram = p1.wednesday
			b[j] = 2
			j = j + 1
		elseif p1.thursday ~= nil then
			timeProgram = p1.thursday
			b[j] = 3
			j = j + 1
		elseif p1.friday ~= nil then
			timeProgram = p1.friday
			b[j] = 4
			j = j + 1
		elseif p1.saturday ~= nil then
			timeProgram = p1.saturday
			b[j] = 5
			j = j + 1
		elseif p1.sunday ~= nil then
			timeProgram = p1.sunday
			b[j] = 6
			j = j + 1
		end

		for i = 1, #timeProgram do
			local startTime = timeProgram[i].start
			local endTime = timeProgram[i]["end"]

			b[j] = AtlanticUtils.getTowelDryerSlotTimeFromString(startTime)
			b[j + 1] = AtlanticUtils.getTowelDryerSlotTimeFromString(endTime)
			j = j + 2
		end

		return b
	end

	function AtlanticUtils.forceRCM(p1)
		local value = 0

		if p1 == "active" then
			value = 1
		end

		return bytearray({
			value
		})
	end

	function AtlanticUtils.getRCMMode(p1)
		if p1:readInt8(1) == 1 then
			return "active"
		else
			return "deactive"
		end
	end

	function AtlanticUtils.getLocalAmbienteTemperature(p1)
		local value = p1:readInt16(1)

		if value == -1 then
			return "Sensor out of order"
		else
			return value / 100
		end
	end

	function AtlanticUtils.getTowelDryerAutoProgram(p1)
		if #p1 ~= 675 then
			return nil
		end

		local autoProgram = {}
		local monday = {}

		for loop = 1, 96 do
			monday[loop] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.monday = monday

		local tuesday = {}

		for loop = 97, 192 do
			tuesday[loop - 96] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.tuesday = tuesday

		local wednesday = {}

		for loop = 193, 288 do
			wednesday[loop - 192] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.wednesday = wednesday

		local thursday = {}

		for loop = 289, 384 do
			thursday[loop - 288] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.thursday = thursday

		local friday = {}

		for loop = 385, 480 do
			friday[loop - 384] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.friday = friday

		local saturday = {}

		for loop = 481, 576 do
			saturday[loop - 480] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.saturday = saturday

		local sunday = {}

		for loop = 577, 672 do
			sunday[loop - 576] = AtlanticUtils.getSetpoint(p1:readUInt8(loop))
		end

		autoProgram.sunday = sunday
		autoProgram.anticipTime = p1:readUInt16(673, false)
		autoProgram.anticipNb = p1:readUInt8(675)

		return autoProgram
	end

	AtlanticUtils.dayOfWeekAsString = {}
	AtlanticUtils.dayOfWeekAsString[1] = "monday"
	AtlanticUtils.dayOfWeekAsString[2] = "tuesday"
	AtlanticUtils.dayOfWeekAsString[3] = "wednesday"
	AtlanticUtils.dayOfWeekAsString[4] = "thursday"
	AtlanticUtils.dayOfWeekAsString[5] = "friday"
	AtlanticUtils.dayOfWeekAsString[6] = "saturday"
	AtlanticUtils.dayOfWeekAsString[7] = "sunday"

	function AtlanticUtils.getWeekTimeProgram(rawData, numberOfSlotsPerDay, slotLength, convertRawSlotFunction)
		if #rawData ~= 7 * numberOfSlotsPerDay * slotLength or type(convertRawSlotFunction) ~= "function" then
			return nil
		end

		local timeProgram = {}

		for idx, day in ipairs(AtlanticUtils.dayOfWeekAsString) do
			local indexShift = (idx - 1) * numberOfSlotsPerDay * slotLength
			local currentDay = {}

			currentDay[day] = AtlanticUtils.getWeekTimeProgramDailySlots(rawData, numberOfSlotsPerDay, slotLength, indexShift + 1, convertRawSlotFunction)
			timeProgram[idx] = currentDay
		end

		return timeProgram
	end

	function AtlanticUtils.getWeekTimeProgramDailySlots(rawData, numberOfSlotsPerDay, slotLength, beginIndex, convertRawSlotFunction)
		local dailySlots = {}

		for i = 1, numberOfSlotsPerDay do
			local indexShift = (i - 1) * slotLength

			dailySlots[i] = convertRawSlotFunction(rawData, beginIndex + indexShift)
		end

		return dailySlots
	end

	function AtlanticUtils.setWeekTimeProgram(data, numberOfSlotsPerDay, slotLength, convertToRawSlotFunction)
		if #data ~= 7 or type(convertToRawSlotFunction) ~= "function" then
			return nil
		end

		local rawProgram = bytearray(7 * numberOfSlotsPerDay * slotLength)
		local position = 1

		for idx, day in ipairs(AtlanticUtils.dayOfWeekAsString) do
			local dailySlots
			local dataIndex = 1

			while dailySlots == nil and dataIndex <= #data do
				local dayElement = data[dataIndex]

				dailySlots = dayElement[day]
				dataIndex = dataIndex + 1
			end

			if dailySlots == nil then
				error("Invalid parameter, missing program of day " .. day)
			end

			local rawDailySlots = AtlanticUtils.setWeekTimeProgramDailySlots(dailySlots, numberOfSlotsPerDay, slotLength, convertToRawSlotFunction)

			rawProgram = CommonUtils.copyElements(rawDailySlots, rawProgram, position)
			position = position + #rawDailySlots
		end

		return rawProgram
	end

	function AtlanticUtils.setWeekTimeProgramDailySlots(dailySlots, numberOfSlotsPerDay, slotLength, convertToRawSlotFunction)
		if dailySlots == nil or #dailySlots ~= numberOfSlotsPerDay then
			error("Invalid day slot number, " .. numberOfSlotsPerDay .. " slots per day should be included (valid format is [{slot1},{slot2} ...])")
		end

		local position = 1
		local rawDailySlots = bytearray(numberOfSlotsPerDay * slotLength)

		for i = 1, numberOfSlotsPerDay do
			local rawSlot = convertToRawSlotFunction(dailySlots[i])

			rawDailySlots = CommonUtils.copyElements(rawSlot, rawDailySlots, position)
			position = position + #rawSlot
		end

		return rawDailySlots
	end

	function AtlanticUtils.getPassAPCProductType(b)
		if b == nil or #b ~= 1 then
			return nil
		end

		local pt = b:readInt8(1)

		if pt == 0 then
			return "heatPump"
		elseif pt == 1 then
			return "hybrid"
		elseif pt == 2 then
			return "boiler"
		elseif pt == 3 then
			return "zoneController"
		elseif pt == 4 then
			return "airConditioning"
		elseif pt == 5 then
			return "heater"
		elseif pt == 6 then
			return "convector"
		elseif pt == 7 then
			return "accumulationDomesticHotWater"
		elseif pt == 8 then
			return "thermodynamicDomesticHotWater"
		elseif pt == 9 then
			return "singleFlowControlledMechanicalVentilation"
		elseif pt == 10 then
			return "doubleFlowControlledMechanicalVentilation"
		end
	end

	function AtlanticUtils.getPassAPCZoneConfiguration(b)
		if b == 1 then
			return "heating"
		elseif b == 2 then
			return "cooling"
		elseif b == 3 then
			return "heatingAndCooling"
		else
			return nil
		end
	end

	function AtlanticUtils.getPassAPCServiceAvailability(value)
		if value == 0 then
			return "unavailable"
		end

		return "available"
	end

	function AtlanticUtils.getPassAPCZoneElementAvailability(rawValue, zoneId)
		if rawValue == nil or zoneId == nil or zoneId < 1 or zoneId > 16 then
			return nil
		end

		return AtlanticUtils.getPassAPCServiceAvailability(bit.band(rawValue, bit.lshift(1, zoneId - 1)))
	end

	function AtlanticUtils.getPassAPCZoneElementOnOffState(rawValue, zoneId)
		if rawValue == nil or zoneId == nil or zoneId < 1 or zoneId > 16 then
			return nil
		end

		return AtlanticUtils.getPassAPCServiceOnOffState(bit.band(rawValue, bit.lshift(1, zoneId - 1)))
	end

	function AtlanticUtils.setPassAPCZoneElementOnOffState(value, currentGlobalZonesObject, zoneId)
		if value == nil or currentGlobalZonesObject == nil or zoneId == nil or zoneId < 1 or zoneId > 16 then
			return nil
		end

		local globalBitField = currentGlobalZonesObject:readUInt16(1)

		if value == "off" then
			globalBitField = bit.band(globalBitField, bit.bnot(bit.lshift(1, zoneId - 1)))
		elseif value == "on" then
			globalBitField = bit.bor(globalBitField, bit.lshift(1, zoneId - 1))
		else
			return nil
		end

		currentGlobalZonesObject[1] = bit.rshift(bit.band(globalBitField, 65280), 8)
		currentGlobalZonesObject[2] = bit.band(globalBitField, 255)

		return currentGlobalZonesObject
	end

	function AtlanticUtils.getPassAPCThermalSchedulingMode(value)
		if value == 1 then
			return "heatingAndCoolingSeparatedScheduling"
		elseif value == 2 then
			return "heatingAndCoolingCommonScheduling"
		end

		return nil
	end

	function AtlanticUtils.getPassAPCAbsenceSchedulingMode(value)
		if value == 1 then
			return "numberOfDaysScheduling"
		elseif value == 2 then
			return "dateScheduling"
		end

		return nil
	end

	function AtlanticUtils.getPassAPCDHWConfiguration(b)
		if b == 1 then
			return "cumulated"
		elseif b == 2 then
			return "snapshot"
		else
			return nil
		end
	end

	function AtlanticUtils.getPassAPCServiceOnOffState(rawValue)
		if rawValue == 0 then
			return "off"
		end

		return "on"
	end

	function AtlanticUtils.setPassAPCServiceOnOffState(value, currentGlobalZonesObject, zoneId)
		if zoneId == nil then
			currentGlobalZonesObject = bytearray(1)
			zoneId = 1
		elseif currentGlobalZonesObject == nil then
			error("Missing required state related to values of other zones, try a refresh all")
		elseif zoneId > #currentGlobalZonesObject then
			error("Invalid zoneId " .. zoneId .. " regarding global state length " .. #currentGlobalZonesObject)
		end

		local rawValue

		if value == "off" then
			rawValue = 0
		elseif value == "on" then
			rawValue = 1
		end

		if rawValue ~= nil then
			currentGlobalZonesObject[zoneId] = rawValue

			return currentGlobalZonesObject
		end

		return nil
	end

	function AtlanticUtils.fromPassAPCThermalRawMode(b)
		if b == 0 then
			return "manu"
		elseif b == 1 then
			return "comfort"
		elseif b == 2 then
			return "eco"
		elseif b == 3 then
			return "internalScheduling"
		elseif b == 4 then
			return "externalScheduling"
		elseif b == 5 then
			return "auto"
		elseif b == 6 then
			return "absence"
		elseif b == 7 then
			return "stop"
		else
			return nil
		end
	end

	function AtlanticUtils.toPassAPCThermalRawMode(mode, currentGlobalZonesObject, zoneId)
		if zoneId == nil then
			currentGlobalZonesObject = bytearray(1)
			zoneId = 1
		elseif currentGlobalZonesObject == nil then
			error("Missing required state related to values of other zones, try a refresh all")
		elseif zoneId > #currentGlobalZonesObject then
			error("Invalid zoneId " .. zoneId .. " regarding global state length " .. #currentGlobalZonesObject)
		end

		local rawMode

		if mode == "manu" then
			rawMode = 0
		elseif mode == "comfort" then
			rawMode = 1
		elseif mode == "eco" then
			rawMode = 2
		elseif mode == "internalScheduling" then
			rawMode = 3
		elseif mode == "externalScheduling" then
			rawMode = 4
		elseif mode == "auto" then
			rawMode = 5
		elseif mode == "absence" then
			rawMode = 6
		elseif mode == "stop" then
			rawMode = 7
		end

		if rawMode ~= nil then
			currentGlobalZonesObject[zoneId] = rawMode

			return currentGlobalZonesObject
		else
			return nil
		end
	end

	function AtlanticUtils.fromPassAPCThermalRawProfile(rawValue)
		if rawValue == 0 then
			return "stop"
		elseif rawValue == 1 then
			return "comfort"
		elseif rawValue == 2 then
			return "eco"
		elseif rawValue == 3 then
			return "externalSetpoint"
		elseif rawValue == 4 then
			return "absence"
		elseif rawValue == 5 then
			return "manu"
		elseif rawValue == 6 then
			return "frostprotection"
		elseif rawValue == 7 then
			return "derogation"
		elseif rawValue == 8 then
			return "other"
		else
			return nil
		end
	end

	function AtlanticUtils.fromPassAPCDHWRawMode(rawValue)
		if rawValue == 0 then
			return "manu"
		elseif rawValue == 1 then
			return "comfort"
		elseif rawValue == 2 then
			return "peakAndOffPeakTimes"
		elseif rawValue == 3 then
			return "internalScheduling"
		elseif rawValue == 4 then
			return "externalScheduling"
		elseif rawValue == 5 then
			return "peakAndOffPeakScheduling"
		elseif rawValue == 6 then
			return "stop"
		elseif rawValue == 7 then
			return "eco"
		else
			return nil
		end
	end

	function AtlanticUtils.toPassAPCDHWRawMode(value)
		if value == "manu" then
			return bytearray({
				0
			})
		elseif value == "comfort" then
			return bytearray({
				1
			})
		elseif value == "peakAndOffPeakTimes" then
			return bytearray({
				2
			})
		elseif value == "internalScheduling" then
			return bytearray({
				3
			})
		elseif value == "externalScheduling" then
			return bytearray({
				4
			})
		elseif value == "peakAndOffPeakScheduling" then
			return bytearray({
				5
			})
		elseif value == "stop" then
			return bytearray({
				6
			})
		elseif value == "eco" then
			return bytearray({
				7
			})
		else
			return nil
		end
	end

	AtlanticUtils.PASS_APC_SERVICE_NO_REMAPPING_MODE = 240
	AtlanticUtils.PASS_APC_SERVICE_CONTINIOUS_REMAPPING_MODE = 241
	AtlanticUtils.PASS_APC_SERVICE_NO_REMAPPING_CORRELATE_MODE = 242
	AtlanticUtils.PASS_APC_SERVICE_UNLIMITED_REMAPPING_LENGTH = 65535

	function AtlanticUtils.writeDataPassApc(serviceId, dataToWrite, remapping)
		if serviceId == nil or #serviceId ~= 2 then
			error("Invalid service structure")
		elseif dataToWrite == nil or #dataToWrite <= 0 then
			error("Trying to write nil or empty value")
		end

		if remapping == nil then
			remapping = bytearray({
				AtlanticUtils.PASS_APC_SERVICE_NO_REMAPPING_MODE
			})
		end

		return remapping:append(serviceId):append(dataToWrite)
	end

	function AtlanticUtils.readDataPassApc(serviceId, remapping)
		if serviceId == nil or #serviceId ~= 2 then
			error("Invalid service structure")
		end

		if remapping == nil then
			return serviceId
		else
			return serviceId:append(remapping)
		end
	end

	function AtlanticUtils.continiousRemapping(firstSingleServiceId, totalNumberOfSingleServices, dataLengthOfEachSingleService)
		if firstSingleServiceId == nil or firstSingleServiceId < 0 or firstSingleServiceId > 65535 then
			error("Invalid remapping service " + tostring(firstSingleServiceId))
		end

		if totalNumberOfSingleServices == nil then
			totalNumberOfSingleServices = 1
			dataLengthOfEachSingleService = AtlanticUtils.PASS_APC_SERVICE_UNLIMITED_REMAPPING_LENGTH
		elseif totalNumberOfSingleServices <= 0 or totalNumberOfSingleServices > 65535 then
			error("Invalid remapping number of services " + tostring(totalNumberOfSingleServices))
		elseif dataLengthOfEachSingleService <= 0 or dataLengthOfEachSingleService >= AtlanticUtils.PASS_APC_SERVICE_UNLIMITED_REMAPPING_LENGTH then
			error("Invalid remapping length of single service " + tostring(dataLengthOfEachSingleService))
		end

		local value = bytearray(7)

		value[1] = AtlanticUtils.PASS_APC_SERVICE_CONTINIOUS_REMAPPING_MODE
		value[2] = bit.rshift(bit.band(firstSingleServiceId, 65280), 8)
		value[3] = bit.band(firstSingleServiceId, 255)
		value[4] = bit.rshift(bit.band(totalNumberOfSingleServices, 65280), 8)
		value[5] = bit.band(totalNumberOfSingleServices, 255)
		value[6] = bit.rshift(bit.band(dataLengthOfEachSingleService, 65280), 8)
		value[7] = bit.band(dataLengthOfEachSingleService, 255)

		return value
	end

	function AtlanticUtils.getPassAPCOperatingMode(b)
		if b == 0 then
			return "stop"
		elseif b == 1 then
			return "heating"
		elseif b == 2 then
			return "cooling"
		elseif b == 3 then
			return "drying"
		else
			return nil
		end
	end

	function AtlanticUtils.setPassAPCOperatingMode(v)
		if v == "stop" then
			return bytearray({
				0
			})
		elseif v == "heating" then
			return bytearray({
				1
			})
		elseif v == "cooling" then
			return bytearray({
				2
			})
		elseif v == "drying" then
			return bytearray({
				3
			})
		else
			return nil
		end
	end

	function AtlanticUtils.fromPassAPCRawTemperature(rawTemperature)
		if type(rawTemperature) == "number" and rawTemperature ~= 65535 then
			return CommonUtils.round(rawTemperature / 10, 1)
		end

		return nil
	end

	function AtlanticUtils.toPassAPCRawMinimumTemperature(temperature, maxTemperature)
		if maxTemperature < temperature then
			error("The minimum temperature must be lower than the maximal temperature (" .. tostring(maxTemperature) .. ") but got " .. tostring(temperature))
		end

		return AtlanticUtils.toPassAPCRawTemperature(temperature)
	end

	function AtlanticUtils.toPassAPCRawMaximumTemperature(temperature, minTemperature)
		if temperature < minTemperature then
			error("The maximal temperature must be upper than the minimum temperature (" .. tostring(minTemperature) .. ") but got " .. tostring(temperature))
		end

		return AtlanticUtils.toPassAPCRawTemperature(temperature)
	end

	function AtlanticUtils.toPassAPCRawTemperature(temperature, currentGlobalZonesObject, zoneId)
		if zoneId == nil then
			currentGlobalZonesObject = bytearray(2)
			zoneId = 1
		elseif currentGlobalZonesObject == nil then
			error("Missing required state related to values of other zones, try a refresh all")
		elseif zoneId > #currentGlobalZonesObject then
			error("Invalid zoneId " .. zoneId .. " regarding global state length " .. #currentGlobalZonesObject)
		end

		local rawTemperature = CommonUtils.round(temperature * 10)

		currentGlobalZonesObject[zoneId * 2 - 1] = bit.rshift(bit.band(rawTemperature, 65280), 8)
		currentGlobalZonesObject[zoneId * 2] = bit.band(rawTemperature, 255)

		return currentGlobalZonesObject
	end

	function AtlanticUtils.initDeactivatedGlobalZonesObject(zoneId)
		local globalZonesObject = bytearray(32)

		if zoneId > #globalZonesObject then
			error("Invalid zoneId " .. zoneId .. " regarding global state length " .. #globalZonesObject)
		end

		for i = 1, #globalZonesObject do
			globalZonesObject[i] = 255
		end

		return globalZonesObject
	end

	function AtlanticUtils.toPassAPCRawDerogationTemperature(temperature, zoneId)
		local globalZonesObject

		if zoneId ~= nil then
			globalZonesObject = AtlanticUtils.initDeactivatedGlobalZonesObject(zoneId)
		end

		return AtlanticUtils.toPassAPCRawTemperature(temperature, globalZonesObject, zoneId)
	end

	function AtlanticUtils.toPassAPCRawDerogationTime(time, zoneId)
		local globalZonesObject

		if zoneId ~= nil then
			globalZonesObject = AtlanticUtils.initDeactivatedGlobalZonesObject(zoneId)
		else
			zoneId = 1
			globalZonesObject = bytearray(2)
		end

		globalZonesObject[zoneId * 2 - 1] = bit.rshift(bit.band(time, 65280), 8)
		globalZonesObject[zoneId * 2] = bit.band(time, 255)

		return globalZonesObject
	end

	AtlanticUtils.passAPCNumberOfSlotsPerDay = 3
	AtlanticUtils.passAPCDaySlotLength = 4
	AtlanticUtils.passAPCTimeSeparator = ":"
	AtlanticUtils.passAPCInvalidTimeField = "??"
	AtlanticUtils.passAPCInvalidTime = AtlanticUtils.passAPCInvalidTimeField .. AtlanticUtils.passAPCTimeSeparator .. AtlanticUtils.passAPCInvalidTimeField
	AtlanticUtils.passAPCDeactivatedTimeField = "00"
	AtlanticUtils.passAPCDeactivatedTimeFieldNumber = 0
	AtlanticUtils.passAPCDeactivatedTime = AtlanticUtils.passAPCDeactivatedTimeField .. AtlanticUtils.passAPCTimeSeparator .. AtlanticUtils.passAPCDeactivatedTimeField
	AtlanticUtils.passAPCDeactivatedTimeFieldRawValue = 255
	AtlanticUtils.passAPCDeactivatedTimeRawValue = bit.lshift(AtlanticUtils.passAPCDeactivatedTimeFieldRawValue, 8) + AtlanticUtils.passAPCDeactivatedTimeFieldRawValue

	function AtlanticUtils.getPassAPCProgService(rawProgId)
		local progId = tonumber(rawProgId)

		if AtlanticUtils.checkPassAPCProgramId(progId) then
			return bytearray({
				1,
				62 + progId
			})
		else
			error("Unknown time program " .. progId .. ", available program ids are 1,2,3 and 4")
		end
	end

	function AtlanticUtils.getPassAPCWeekTimeProgram(rawData)
		return AtlanticUtils.getWeekTimeProgram(rawData, AtlanticUtils.passAPCNumberOfSlotsPerDay, AtlanticUtils.passAPCDaySlotLength, AtlanticUtils.getPassAPCProgramSlot)
	end

	function AtlanticUtils.getPassAPCProgramSlot(rawData, beginIndex)
		local programSlot = {}
		local startTimeInMinutes = rawData:readUInt16(beginIndex)

		programSlot.start = AtlanticUtils.minutesToDayTimeString(startTimeInMinutes)

		local endTimeInMinutes = rawData:readUInt16(beginIndex + 2)

		if endTimeInMinutes == 15300 then
			programSlot["end"] = "24" .. AtlanticUtils.passAPCTimeSeparator .. "00"
		else
			programSlot["end"] = AtlanticUtils.minutesToDayTimeString(endTimeInMinutes)
		end

		return programSlot
	end

	function AtlanticUtils.minutesToDayTimeString(totalMinutes)
		if totalMinutes > 1440 then
			if totalMinutes == AtlanticUtils.passAPCDeactivatedTimeRawValue then
				return AtlanticUtils.passAPCDeactivatedTime
			else
				return AtlanticUtils.passAPCInvalidTime
			end
		end

		local hours = totalMinutes / 60
		local minutes = totalMinutes % 60

		return string.format("%02d", hours) .. AtlanticUtils.passAPCTimeSeparator .. string.format("%02d", minutes)
	end

	function AtlanticUtils.setPassAPCWeekTimeProgram(data)
		return AtlanticUtils.setWeekTimeProgram(data, AtlanticUtils.passAPCNumberOfSlotsPerDay, AtlanticUtils.passAPCDaySlotLength, AtlanticUtils.setPassAPCProgramSlot)
	end

	function AtlanticUtils.setPassAPCProgramSlot(slot)
		if slot.start == nil or slot["end"] == nil then
			error("Invalid day slot detected, missing start or end time (valid format is {'start':'HH" .. AtlanticUtils.passAPCTimeSeparator .. "mm','end':'HH" .. AtlanticUtils.passAPCTimeSeparator .. "mm'})")
		end

		local startMinutes = AtlanticUtils.dayTimeStringToMinutes(slot.start)
		local endMinutes = AtlanticUtils.dayTimeStringToMinutes(slot["end"])
		local rawSlot = bytearray(4)

		if endMinutes < startMinutes then
			error("Invalid day slot detected, start time " .. slot.start .. " is after end time " .. slot["end"])
		elseif startMinutes == endMinutes then
			for i = 1, #rawSlot do
				rawSlot[i] = AtlanticUtils.passAPCDeactivatedTimeFieldRawValue
			end
		else
			rawSlot[1] = bit.rshift(bit.band(startMinutes, 65280), 8)
			rawSlot[2] = bit.band(startMinutes, 255)
			rawSlot[3] = bit.rshift(bit.band(endMinutes, 65280), 8)
			rawSlot[4] = bit.band(endMinutes, 255)
		end

		return rawSlot
	end

	function AtlanticUtils.dayTimeStringToMinutes(dayTime)
		if type(dayTime) ~= "string" then
			error("Invalid day time " .. tostring(dayTime) .. ", should be formatted as HH" .. AtlanticUtils.passAPCTimeSeparator .. "mm")
		end

		local splittedDayTime = dayTime:split("[0-9]+")

		if splittedDayTime == nil or #splittedDayTime ~= 2 then
			error("Invalid day time " .. dayTime .. ", should be formatted as HH" .. AtlanticUtils.passAPCTimeSeparator .. "mm")
		end

		local hours = tonumber(splittedDayTime[1])

		if hours < 0 or hours > 24 then
			error("Invalid hours number " .. hours .. " in day time " .. dayTime)
		end

		local minutes = tonumber(splittedDayTime[2])

		if minutes < 0 or minutes > 59 then
			error("Invalid minutes number " .. minutes .. " in day time " .. dayTime)
		end

		if hours == 24 and minutes ~= 0 then
			error("Invalid minutes number " .. minutes .. " in day time " .. dayTime .. " max value is 24" .. AtlanticUtils.passAPCTimeSeparator .. "00")
		end

		return hours * 60 + minutes
	end

	function AtlanticUtils.setPassAPCActiveTimeProgram(value, currentGlobalZonesObject, zoneId)
		if zoneId == nil then
			currentGlobalZonesObject = bytearray(1)
			zoneId = 1
		elseif currentGlobalZonesObject == nil then
			error("Missing required state related to values of other zones, try a refresh all")
		elseif zoneId > #currentGlobalZonesObject then
			error("Invalid zoneId " .. zoneId .. " regarding global state length " .. #currentGlobalZonesObject)
		end

		if AtlanticUtils.checkPassAPCProgramId(value) then
			currentGlobalZonesObject[zoneId] = tonumber(value)

			return currentGlobalZonesObject
		else
			error("Unknown time program " .. value .. ", available program ids are 1,2,3 and 4")
		end
	end

	function AtlanticUtils.checkPassAPCProgramId(value)
		if value ~= nil then
			if type(value) == "string" then
				value = tonumber(value)
			end

			if type(value) == "number" and value >= 1 and value <= 4 then
				return true
			end
		end

		return false
	end

	function AtlanticUtils.fromPassAPCRawDateTime(rawValue)
		if rawValue == nil or #rawValue < 6 then
			return nil
		end

		local date = {}
		local deactivated = true
		local index = 1

		while deactivated and index <= #rawValue do
			if rawValue[index] ~= AtlanticUtils.passAPCDeactivatedTimeFieldRawValue then
				deactivated = false
			end

			index = index + 1
		end

		if deactivated then
			return nil
		end

		if rawValue[1] == AtlanticUtils.passAPCDeactivatedTimeFieldRawValue then
			date.hour = AtlanticUtils.passAPCDeactivatedTimeFieldNumber
		elseif rawValue[1] > 23 then
			date.hour = AtlanticUtils.passAPCInvalidTimeField
		else
			date.hour = rawValue[1]
		end

		if rawValue[2] == AtlanticUtils.passAPCDeactivatedTimeFieldRawValue then
			date.minute = AtlanticUtils.passAPCDeactivatedTimeFieldNumber
		elseif rawValue[2] > 59 then
			date.minute = AtlanticUtils.passAPCInvalidTimeField
		else
			date.minute = rawValue[2]
		end

		if rawValue[3] == AtlanticUtils.passAPCDeactivatedTimeFieldRawValue then
			date.day = AtlanticUtils.passAPCDeactivatedTimeFieldNumber
		elseif rawValue[3] > 31 then
			date.day = AtlanticUtils.passAPCInvalidTimeField
		else
			date.day = rawValue[3]
		end

		if rawValue[4] == AtlanticUtils.passAPCDeactivatedTimeFieldRawValue then
			date.month = AtlanticUtils.passAPCDeactivatedTimeFieldNumber
		elseif rawValue[4] > 12 then
			date.month = AtlanticUtils.passAPCInvalidTimeField
		else
			date.month = rawValue[4]
		end

		if rawValue[5] == AtlanticUtils.passAPCDeactivatedTimeFieldRawValue and rawValue[6] == AtlanticUtils.passAPCDeactivatedTimeFieldRawValue then
			date.year = AtlanticUtils.passAPCDeactivatedTimeFieldNumber
		else
			date.year = rawValue:readUInt16(5)
		end

		return date
	end

	function AtlanticUtils.getPassAPCDeactivatedRawDateTime()
		local rawValue = bytearray(6)

		for i = 1, #rawValue do
			rawValue[i] = AtlanticUtils.passAPCDeactivatedTimeFieldRawValue
		end

		return rawValue
	end

	function AtlanticUtils.getPassAPCFixedPastDateTime()
		local rawValue = bytearray({
			0,
			0,
			1,
			1,
			bit.rshift(bit.band(2016, 65280), 8),
			bit.band(2016, 255)
		})

		return rawValue
	end

	function AtlanticUtils.toPassAPCRawDateTime(date)
		local rawValue = bytearray(6)

		if date.hour == AtlanticUtils.passAPCDeactivatedTimeFieldNumber and date.minute == AtlanticUtils.passAPCDeactivatedTimeFieldNumber and date.day == AtlanticUtils.passAPCDeactivatedTimeFieldNumber and date.month == AtlanticUtils.passAPCDeactivatedTimeFieldNumber and date.year == AtlanticUtils.passAPCDeactivatedTimeFieldNumber then
			return AtlanticUtils.getPassAPCDeactivatedRawDateTime()
		end

		if date.hour ~= nil and type(date.hour) == "number" and date.hour >= 0 and date.hour <= 23 then
			rawValue[1] = date.hour
		else
			error("Invalid or missing field hour")
		end

		if date.minute ~= nil and type(date.minute) == "number" and date.minute >= 0 and date.minute <= 59 then
			rawValue[2] = date.minute
		else
			error("Invalid or missing field minute")
		end

		if date.day ~= nil and type(date.day) == "number" and date.day >= 1 and date.day <= 31 then
			rawValue[3] = date.day
		else
			error("Invalid or missing field day")
		end

		if date.month ~= nil and type(date.month) == "number" and date.month >= 1 and date.month <= 12 then
			rawValue[4] = date.month
		else
			error("Invalid or missing field month")
		end

		if date.year ~= nil and type(date.year) == "number" and date.year >= 2016 then
			rawValue[5] = bit.rshift(bit.band(date.year, 65280), 8)
			rawValue[6] = bit.band(date.year, 255)
		else
			error("Invalid or missing field year")
		end

		return rawValue
	end

	AtlanticUtils.passAPCProductModelNameLength = 20
	AtlanticUtils.passAPCSerialNumberLength = 12
	AtlanticUtils.passAPCZoneNameLength = 12
	AtlanticUtils.passAPCRegulationNameLength = 5
	AtlanticUtils.passAPCRegulationSoftVersionLength = 12

	function AtlanticUtils.getPassAPCText(rawValue, maxNameLength, offset)
		if offset == nil then
			offset = 0
		end

		local nameRawValue = bytearray(maxNameLength)
		local firstCharacterReached = false

		for i = maxNameLength, 1, -1 do
			if rawValue[i + offset] ~= string.byte(" ") or firstCharacterReached then
				if not firstCharacterReached then
					firstCharacterReached = true
					nameRawValue = bytearray(i)
				end

				nameRawValue[i] = rawValue[i + offset]
			end
		end

		return nameRawValue:tostring("iso-8859-1")
	end

	function AtlanticUtils.setPassAPCText(name, maxNameLength)
		local rawValue = bytearray(string.sub(name, 1, maxNameLength), "iso-8859-1")

		if maxNameLength > #rawValue then
			local tmp = bytearray(maxNameLength)

			for i = 1, #tmp do
				tmp[i] = string.byte(" ")
			end

			tmp = CommonUtils.copyElements(rawValue, tmp)
			rawValue = tmp
		end

		return rawValue
	end

	function AtlanticUtils.getPassAPCZoneName(rawValue, zoneId)
		if zoneId == nil then
			zoneId = 1
		end

		if zoneId <= 0 or zoneId > 16 or rawValue == nil or #rawValue < zoneId * AtlanticUtils.passAPCZoneNameLength then
			return nil
		end

		local zoneOffset = (zoneId - 1) * AtlanticUtils.passAPCZoneNameLength

		return AtlanticUtils.getPassAPCText(rawValue, AtlanticUtils.passAPCZoneNameLength, zoneOffset)
	end

	function AtlanticUtils.setPassAPCZoneName(name, currentGlobalZonesObject, zoneId)
		if zoneId == nil then
			currentGlobalZonesObject = bytearray(AtlanticUtils.passAPCZoneNameLength)
			zoneId = 1
		elseif currentGlobalZonesObject == nil then
			error("Missing required state related to values of other zones, try a refresh all")
		elseif #currentGlobalZonesObject < zoneId * AtlanticUtils.passAPCZoneNameLength then
			error("Invalid zoneId " .. zoneId .. " regarding global state length " .. #currentGlobalZonesObject)
		end

		local zoneRawValue = AtlanticUtils.setPassAPCText(name, AtlanticUtils.passAPCZoneNameLength)
		local zoneOffset = (zoneId - 1) * AtlanticUtils.passAPCZoneNameLength

		currentGlobalZonesObject = CommonUtils.copyElements(zoneRawValue, currentGlobalZonesObject, zoneOffset + 1)

		return currentGlobalZonesObject
	end

	AtlanticUtils.passAPCDHWNumberOfSlotsPerDay = 3
	AtlanticUtils.passAPCDHWDaySlotLength = 4

	function AtlanticUtils.fromDHWRawDateTime(rawData)
		if rawData == nil or #rawData < 8 then
			return nil
		end

		local date = {}
		local invalidTimeField = "??"

		if rawData[1] < 0 or rawData[1] > 59 then
			date.second = invalidTimeField
		else
			date.second = rawData[1]
		end

		if rawData[2] < 0 or rawData[2] > 59 then
			date.minute = invalidTimeField
		else
			date.minute = rawData[2]
		end

		if rawData[3] < 0 or rawData[3] > 23 then
			date.hour = invalidTimeField
		else
			date.hour = rawData[3]
		end

		if rawData[4] < 1 or rawData[4] > 31 then
			date.day = invalidTimeField
		else
			date.day = rawData[4]
		end

		if rawData[5] < 0 or rawData[5] > 6 then
			date.weekday = invalidTimeField
		else
			date.weekday = rawData:readUInt8(5)
		end

		if rawData[6] < 1 or rawData[6] > 12 then
			date.month = invalidTimeField
		else
			date.month = rawData[6]
		end

		date.year = rawData:readUInt16(7, false)

		return date
	end

	function AtlanticUtils.toDHWRawDateTime(date)
		local rawValue = bytearray(8)

		if date.second ~= nil and type(date.second) == "number" and date.second >= 0 and date.second <= 59 then
			rawValue[1] = date.second
		else
			error("Invalid or missing field second")
		end

		if date.minute ~= nil and type(date.minute) == "number" and date.minute >= 0 and date.minute <= 59 then
			rawValue[2] = date.minute
		else
			error("Invalid or missing field minute")
		end

		if date.hour ~= nil and type(date.hour) == "number" and date.hour >= 0 and date.hour <= 23 then
			rawValue[3] = date.hour
		else
			error("Invalid or missing field hour")
		end

		if date.day ~= nil and type(date.day) == "number" and date.day >= 1 and date.day <= 31 then
			rawValue[4] = date.day
		else
			error("Invalid or missing field day")
		end

		if date.weekday ~= nil and type(date.weekday) == "number" and date.weekday >= 0 and date.weekday <= 6 then
			rawValue[5] = date.weekday
		else
			error("Invalid or missing field weekday")
		end

		if date.month ~= nil and type(date.month) == "number" and date.month >= 1 and date.month <= 12 then
			rawValue[6] = date.month
		else
			error("Invalid or missing field month")
		end

		if date.year ~= nil and type(date.year) == "number" and date.year >= 2016 then
			rawValue[8] = bit.rshift(bit.band(date.year, 65280), 8)
			rawValue[7] = bit.band(date.year, 255)
		else
			error("Invalid or missing field year")
		end

		return rawValue
	end

	function AtlanticUtils.readBit(rawValue, bitIndex)
		if rawValue == nil then
			return nil
		end

		if bit.band(rawValue, bit.lshift(1, bitIndex - 1)) > 0 then
			return 1
		else
			return 0
		end
	end

	function AtlanticUtils.bytesToString(bytes)
		if bytes == nil then
			return nil
		end

		local string = CommonUtils.rawTrim(bytes):tostring("iso-8859-1")

		if #string == 0 then
			return nil
		end

		return string
	end

	function AtlanticUtils.getPassAPCDHWWeekTimeProgram(rawData)
		return AtlanticUtils.getWeekTimeProgram(rawData, AtlanticUtils.passAPCDHWNumberOfSlotsPerDay, AtlanticUtils.passAPCDHWDaySlotLength, AtlanticUtils.getPassAPCDHWProgramSlot)
	end

	function AtlanticUtils.getPassAPCDHWProgramSlot(rawData, beginIndex)
		return AtlanticUtils.getPassAPCProgramSlot(rawData, beginIndex)
	end

	function AtlanticUtils.error(message)
		error("[AtlanticUtils] " .. message)
	end

	AtlanticUtils.Converter = {}
	AtlanticUtils.Converter.Light = {}
	AtlanticUtils.Converter.Light.Intensity = "Light/Intensity"
	AtlanticUtils.Converter.Light.OnOffStatus = "Light/OnOffStatus"
	AtlanticUtils.Converter.Light.TurnOffDelay = "Light/TurnOffDelay"
	AtlanticUtils.Converter.Light.ActiveStatus = "Light/ActiveStatus"
	AtlanticUtils.Converter.RawValueToValue = {}
	AtlanticUtils.Converter.RawValueToValue[AtlanticUtils.Converter.Light.Intensity] = function(p1)
		if p1 == nil then
			AtlanticUtils.error("unknown (nil)")
		elseif p1 == 100 then
			return 1
		elseif p1 == 1000 then
			return 10
		elseif p1 == 3000 then
			return 30
		elseif p1 == 10000 then
			return 100
		end

		AtlanticUtils.error("unknown (" .. p1 .. ")")
	end
	AtlanticUtils.Converter.RawValueToValue[AtlanticUtils.Converter.Light.OnOffStatus] = function(p1)
		if p1 == nil then
			AtlanticUtils.error("unknown (nil)")
		elseif p1 == 0 then
			return "off"
		elseif p1 == 1 then
			return "on"
		end

		AtlanticUtils.error("unknown (" .. p1 .. ")")
	end
	AtlanticUtils.Converter.RawValueToValue[AtlanticUtils.Converter.Light.TurnOffDelay] = function(p1)
		if p1 == 0 then
			return "disabled"
		else
			return p1
		end
	end
	AtlanticUtils.Converter.ValueToRawValue = {}
	AtlanticUtils.Converter.ValueToRawValue[AtlanticUtils.Converter.Light.Intensity] = function(value)
		local ret = bytearray(2)

		if value == 100 then
			return ret:writeUInt16(1, 10000, false)
		elseif value == 30 then
			return ret:writeUInt16(1, 3000, false)
		elseif value == 10 then
			return ret:writeUInt16(1, 1000, false)
		elseif value == 1 then
			return ret:writeUInt16(1, 100, false)
		end

		AtlanticUtils.error("Light-Level: unknown value: " .. value)
	end
	AtlanticUtils.Converter.ValueToRawValue[AtlanticUtils.Converter.Light.OnOffStatus] = function(value)
		local ret = bytearray(1)

		if value == "off" then
			ret[1] = 0
		elseif value == "on" then
			ret[1] = 1
		else
			AtlanticUtils.error("Light-OnOffStatus: unknown value: " .. value)
		end

		return ret
	end
	AtlanticUtils.Converter.ValueToRawValue[AtlanticUtils.Converter.Light.TurnOffDelay] = function(value)
		local ret = bytearray(2)

		if value == "disabled" then
			return ret:writeUInt16(1, 0, false)
		else
			return ret:writeUInt16(1, value, false)
		end
	end
	AtlanticUtils.Converter.RawValueToValue[AtlanticUtils.Converter.Light.ActiveStatus] = function(p1)
		if p1 == nil then
			AtlanticUtils.error("unknown (nil)")
		elseif p1 == 0 then
			return "inactive"
		elseif p1 == 1 then
			return "active"
		end

		AtlanticUtils.error("unknown (" .. p1 .. ")")
	end
	AtlanticUtils.Converter.ValueToRawValue[AtlanticUtils.Converter.Light.ActiveStatus] = function(value)
		local ret = bytearray(1)

		if value == "inactive" then
			ret[1] = 0
		elseif value == "active" then
			ret[1] = 1
		else
			AtlanticUtils.error("Light-ActiveStatus: unknown value: " .. value)
		end

		return ret
	end

	function AtlanticUtils.setClosestValidIntensity(intensity)
		local payloads = {}

		intensity = AtlanticUtils.normalizeAtlanticIntensity(intensity)

		if intensity > 0 then
			payloads[1] = AtlanticUtils.Converter.ValueToRawValue[AtlanticUtils.Converter.Light.Intensity](intensity)
			payloads[2] = {
				category = "lighting"
			}
			payloads[3] = AtlanticUtils.Converter.ValueToRawValue[AtlanticUtils.Converter.Light.OnOffStatus]("on")
			payloads[4] = {
				type = 201409537,
				category = "lighting"
			}
		else
			payloads[1] = AtlanticUtils.Converter.ValueToRawValue[AtlanticUtils.Converter.Light.OnOffStatus]("off")
			payloads[2] = {
				type = 201409537,
				category = "lighting"
			}
		end

		return payloads
	end

	function AtlanticUtils.setClosestValidIntensityWithTimer(intensity, delay, intensityAfterDelay)
		local payloads = AtlanticUtils.setClosestValidIntensity(intensity)

		intensityAfterDelay = AtlanticUtils.normalizeAtlanticIntensity(intensityAfterDelay)

		if intensity == 0 and intensityAfterDelay > 0 then
			payloads[#payloads + 1] = AtlanticUtils.Converter.ValueToRawValue[AtlanticUtils.Converter.Light.Intensity](intensityAfterDelay)
			payloads[#payloads + 1] = {
				category = "lighting"
			}
			payloads[#payloads + 1] = AtlanticUtils.Converter.ValueToRawValue[AtlanticUtils.Converter.Light.OnOffStatus]("on")
			payloads[#payloads + 1] = {
				type = 201409537,
				category = "lighting",
				delay = delay
			}
		elseif intensity > 0 and intensityAfterDelay > 0 then
			payloads[#payloads + 1] = AtlanticUtils.Converter.ValueToRawValue[AtlanticUtils.Converter.Light.Intensity](intensityAfterDelay)
			payloads[#payloads + 1] = {
				category = "lighting",
				delay = delay
			}
		elseif intensity > 0 and intensityAfterDelay == 0 then
			payloads[#payloads + 1] = AtlanticUtils.Converter.ValueToRawValue[AtlanticUtils.Converter.Light.OnOffStatus]("off")
			payloads[#payloads + 1] = {
				type = 201409537,
				category = "lighting",
				delay = delay
			}
		end

		return table.unpack(payloads)
	end

	function AtlanticUtils.normalizeAtlanticIntensity(intensity)
		if intensity > 1 and intensity <= 10 then
			return 10
		elseif intensity > 10 and intensity <= 30 then
			return 30
		elseif intensity > 30 then
			return 100
		end

		return intensity
	end

	return AtlanticUtils
end
