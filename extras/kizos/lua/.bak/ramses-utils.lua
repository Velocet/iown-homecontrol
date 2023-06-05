slot0 = depends("BinaryUtils")

return {
	fromRawName = function (slot0)
		if slot0 == nil or #slot0 == 0 then
			return ""
		end

		slot0:filterIso8859Dash1InvalidChars()

		return slot0:cutGarbageAfterFirstZero():tostring("iso-8859-1")
	end,
	toRawName = function (slot0)
		if #bytearray(slot0, "iso-8859-1") > 20 then
			slot1 = slot1:sub(1, 20)
		end

		slot0.filterIso8859Dash1InvalidChars(slot1)

		if #slot1 < 20 then
			slot1 = slot1:append(bytearray(20 - #slot1))
		end

		return slot1
	end,
	toOperatingMode = function (slot0)
		if #slot0 < 7 then
			return nil
		end

		if slot0[1] == 0 then
			return "auto"
		end

		if slot0[1] == 1 then
			return "off"
		end

		if slot0[1] == 2 then
			return "eco"
		end

		if slot0[1] == 3 then
			return "holidays"
		end

		if slot0[1] == 4 then
			return "day-off"
		end

		return nil
	end,
	toOperatingModeTimeout = function (slot0)
		if #slot0 < 7 then
			return nil
		end

		if slot0[1] ~= 3 and slot0[1] ~= 4 then
			return nil
		end

		slot2 = slot0[3]
		slot3 = slot0[4]
		slot4 = slot0[5]
		slot5 = bit.lshift(slot0[6], 8) + slot0[7]

		if slot0[2] < 0 then
			slot1 = 0
		end

		if slot1 >= 60 then
			slot1 = 59
		end

		if slot2 < 0 then
			slot2 = 0
		end

		if slot2 >= 23 then
			slot2 = 23
		end

		if slot3 < 1 then
			slot3 = 1
		end

		if slot3 > 31 then
			slot3 = 31
		end

		if slot4 < 1 then
			slot4 = 1
		end

		if slot4 > 12 then
			slot4 = 12
		end

		if slot5 < 1 then
			slot5 = 1
		end

		if slot5 >= 9999 then
			slot5 = 9999
		end

		return string.format("%04d", slot5) .. "/" .. string.format("%02d", slot4) .. "/" .. string.format("%02d", slot3) .. " " .. string.format("%02d", slot2) .. ":" .. string.format("%02d", slot1)
	end,
	toMinSettableValue = function (slot0)
		if #slot0 == 5 then
			return (slot0[2] * 256 + slot0[3]) / 100
		end

		return nil
	end,
	toMaxSettableValue = function (slot0)
		if #slot0 == 5 then
			return (slot0[4] * 256 + slot0[5]) / 100
		end

		return nil
	end,
	toSetpointOverrideMode = function (slot0)
		if slot0[3] == 0 then
			return "NoOverride"
		end

		if slot0[3] == 1 then
			return "OverrideUntilNextTimeProgram"
		end

		if slot0[3] == 2 then
			return "PermanentOverride"
		end

		if slot0[3] == 3 then
			return "DelayedOverride"
		end

		if slot0[3] == 4 then
			return "PeriodicOverride"
		end

		return nil
	end,
	toSetpointOverrideDuration = function (slot0)
		if slot0[3] == 3 then
			return slot0[4] * 4096 + slot0[5] * 256 + slot0[6]
		end

		if slot0[3] == 4 then
			return slot0[9] .. "/" .. slot0[10] .. "/" .. slot0[11] * 256 + slot0[12] .. " -- " .. slot0[8] .. ":" .. slot0[7]
		end

		return nil
	end,
	createRawOperatingMode = function (slot0, slot1)
		slot2 = bytearray(8)

		if slot0 == "auto" then
			slot2[1] = 0
		elseif slot0 == "off" then
			slot2[1] = 1
		elseif slot0 == "eco" then
			slot2[1] = 2
		elseif slot0 == "holidays" then
			slot2[1] = 3
		elseif slot0 == "day-off" then
			slot2[1] = 4
		elseif slot0 == "day-off+eco" then
			slot2[1] = 5
		else
			error("Unsupported operating mode : " .. slot0)
		end

		if slot1 ~= nil then
			slot3 = {}

			for slot7 in slot1:gmatch("%w+") do
				table.insert(slot3, slot7)
			end

			slot2[2] = slot3[5]
			slot2[3] = slot3[4]
			slot2[4] = slot3[3]
			slot2[5] = slot3[2]
			slot2[6] = bit.band(bit.rshift(slot3[1], 8), 255)
			slot2[7] = bit.band(bit.rshift(slot3[1], 0), 255)
			slot2[8] = 1
		else
			slot2[2] = 255
			slot2[3] = 255
			slot2[4] = 255
			slot2[5] = 255
			slot2[6] = 255
			slot2[7] = 255
			slot2[8] = 0
		end

		return slot2
	end,
	createSetpointOverride = function (slot0, slot1, slot2)
		if slot0 == nil or slot1 == nil then
			return nil
		end

		slot3 = bytearray(6)
		slot3[1] = bit.rshift(bit.band(slot0 * 100, 65280), 8)
		slot3[2] = bit.rshift(bit.band(slot0 * 100, 255), 0)
		slot3[4] = 255
		slot3[5] = 255
		slot3[6] = 255

		if slot1 == "NoOverride" then
			slot3[3] = 0
		elseif slot1 == "OverrideUntilNextTimeProgram" then
			slot3[3] = 1
		elseif slot1 == "PermanentOverride" then
			slot3[3] = 2
		elseif slot1 == "DelayedOverride" then
			if slot2 == nil then
				return nil
			end

			slot3[3] = 3
			slot3[4] = bit.rshift(bit.band(slot2, 16711680), 16)
			slot3[5] = bit.rshift(bit.band(slot2, 65280), 8)
			slot3[6] = bit.rshift(bit.band(slot2, 255), 0)
		elseif slot1 == "PeriodicOverride" then
			if slot2 == nil then
				return nil
			end

			slot3[3] = 4
			slot4 = {}

			for slot8 in slot2:gmatch("%w+") do
				table.insert(slot4, slot8)
			end

			slot3[7] = slot4[5]
			slot3[8] = slot4[4]
			slot3[9] = slot4[1]
			slot3[10] = slot4[2]
			slot3[11] = bit.rshift(bit.band(slot4[3], 65280), 8)
			slot3[12] = bit.rshift(bit.band(slot4[3], 255), 0)
		else
			return nil
		end

		return slot3
	end,
	parseZoneTimeProgram = function (slot0)
		if slot0 == nil or #slot0 < 20 or #slot0 % 20 ~= 0 then
			return nil
		end

		slot1 = {}

		if slot0:readUInt32(1, false) ~= 0 then
			return nil
		end

		slot1.appType = "temperature"

		if slot0:readUInt32(5, false) < 0 or slot3 > 11 then
			return nil
		end

		slot1.zone = slot3
		slot1.scheduling = {}
		slot4 = 1

		while slot4 <= #slot0 do
			if slot0:readUInt32(slot4 + 8, false) < 0 or slot5 > 6 then
				return nil
			end

			if slot0:readUInt32(slot4 + 12, false) < 0 or slot6 > 1439 then
				return nil
			end

			if slot0:readUInt16(slot4 + 16, false) ~= 0 and (slot7 < 500 or slot7 > 3500) then
				return nil
			end

			if slot0:readUInt16(slot4 + 18, false) ~= 0 and (slot8 < 500 or slot8 > 3500) then
				return nil
			end

			if slot7 ~= 0 then
				slot9.heating = slot7 / 100
			end

			if slot8 ~= 0 then
				slot9.cooling = slot8 / 100
			end

			slot1.scheduling[#slot1.scheduling + 1] = slot9
			slot4 = slot4 + 20
		end

		return slot1
	end,
	toDayRank = function (slot0)
		if slot0 == 6 then
			return 0
		end

		return slot0 + 1
	end,
	fromDayRank = function (slot0)
		if slot0 == 0 then
			return 6
		end

		return slot0 - 1
	end,
	sortScheduling = function (slot0, slot1)
		if slot0.fromDayRank(slot0.day) - slot0.fromDayRank(slot1.day) > 0 then
			return false
		end

		if slot2 < 0 then
			return true
		end

		if (slot0.hours * 60 + slot0.minutes) - (slot1.hours * 60 + slot1.minutes) > 0 then
			return false
		end

		return true
	end,
	toRawZoneTimeProgram = function (slot0)
		if slot0 == nil or slot0.zone == nil or slot0.scheduling == nil or #slot0.scheduling == 0 then
			return nil
		end

		for slot5 = 1, #slot0.scheduling, 1 do
			if slot0.scheduling[slot5].day == nil or slot6.hours == nil or slot6.minutes == nil or (slot6.heating == nil and slot6.cooling == nil) then
				return nil
			end
		end

		if slot0.zone < 0 or slot0.zone > 11 then
			error("Invalid zone : " .. slot0.zone)
		end

		table.sort(slot0.scheduling, slot0.sortScheduling)

		slot2 = bytearray(slot1 * 20)

		for slot6 = 1, slot1, 1 do
			if slot0.scheduling[slot6].hours * 60 + slot0.scheduling[slot6].minutes < 0 or slot8 > 1439 then
				error("Invalid scheduling time : " .. slot7.hours .. ":" .. slot7.minutes)
			end

			if slot0.fromDayRank(slot7.day) < 0 or slot9 > 6 then
				error("Invalid day rank : " .. slot7.day)
			end

			slot2:writeUInt32((slot6 - 1) * 20 + 1 + 4, slot0.zone, false)
			slot2:writeUInt32((slot6 - 1) * 20 + 1 + 8, slot9, false)
			slot2:writeUInt32((slot6 - 1) * 20 + 1 + 12, slot8, false)

			if slot7.heating then
				if math.floor(slot7.heating * 100) < 500 or slot10 > 3500 then
					error("Invalid heating value : " .. slot7.heating)
				end

				slot2:writeUInt16((slot6 - 1) * 20 + 1 + 16, slot10, false)
			end

			if slot7.cooling then
				if math.floor(slot7.cooling * 100) < 500 or slot10 > 3500 then
					error("Invalid cooling value : " .. slot7.cooling)
				end

				slot2:writeUInt16((slot6 - 1) * 20 + 1 + 18, slot10, false)
			end
		end

		return slot2
	end,
	parseDHWTimeProgram = function (slot0)
		if slot0 == nil or #slot0 < 20 or #slot0 % 20 ~= 0 then
			return nil
		end

		slot1 = {}

		if slot0:readUInt32(1, false) ~= 1 then
			return nil
		end

		slot1.appType = "DHW"

		if slot0:readUInt32(5, false) ~= 0 then
			return nil
		end

		slot1.zone = slot3
		slot1.scheduling = {}
		slot4 = 1

		while slot4 <= #slot0 do
			if slot0:readUInt32(slot4 + 8, false) < 0 or slot5 > 6 then
				return nil
			end

			if slot0:readUInt32(slot4 + 12, false) < 0 or slot6 > 1439 then
				return nil
			end

			if slot0:readUInt16(slot4 + 16, false) < 0 or slot7 > 1 then
				return nil
			end

			slot8.enabled = slot7 > 0
			slot1.scheduling[#slot1.scheduling + 1] = slot8
			slot4 = slot4 + 20
		end

		return slot1
	end,
	toRawDHWTimeProgram = function (slot0)
		if slot0 == nil or slot0.scheduling == nil or #slot0.scheduling == 0 then
			return nil
		end

		for slot5 = 1, #slot0.scheduling, 1 do
			if slot0.scheduling[slot5].day == nil or slot6.hours == nil or slot6.minutes == nil or slot6.enabled == nil then
				return nil
			end
		end

		table.sort(slot0.scheduling, slot0.sortScheduling)

		slot2 = bytearray(slot1 * 20)

		for slot6 = 1, slot1, 1 do
			if slot0.scheduling[slot6].hours * 60 + slot0.scheduling[slot6].minutes < 0 or slot8 > 1439 then
				error("Invalid scheduling time : " .. slot7.hours .. ":" .. slot7.minutes)
			end

			if slot0.fromDayRank(slot7.day) < 0 or slot9 > 6 then
				error("Invalid day rank : " .. slot7.day)
			end

			slot2:writeUInt32((slot6 - 1) * 20 + 1 + 4, 0, false)
			slot2:writeUInt32((slot6 - 1) * 20 + 1 + 8, slot9, false)
			slot2:writeUInt32((slot6 - 1) * 20 + 1 + 12, slot8, false)

			if slot7.enabled then
				slot2:writeUInt32((slot6 - 1) * 20 + 1 + 16, 1, false)
				slot2:writeUInt32((slot6 - 1) * 20 + 1 + 18, 1, false)
			end
		end

		return slot2
	end,
	toSensorDefect = function (slot0)
		if slot0 == nil or #slot0 < 3 then
			return nil
		end

		if slot0[1] == 0 then
			if slot0[2] == 1 or slot0[2] == 3 or slot0[2] == 5 then
				if slot0[3] == 4 then
					return "lowBattery"
				elseif slot0[3] == 5 then
					return "dead"
				else
					return "maintenanceRequired"
				end
			else
				return "maintenanceRequired"
			end
		else
			return nil
		end
	end,
	getEventTypeFromRawSensorDefect = function (slot0)
		if slot0 == nil or #slot0 < 3 then
			return nil
		elseif slot0[1] == 0 then
			return "default"
		elseif slot0[1] == 1 then
			return "normal"
		else
			return nil
		end
	end,
	getTypeFromRawSensorDefect = function (slot0)
		if slot0 == nil or #slot0 < 3 then
			return nil
		elseif slot0[2] == 0 then
			return "controller"
		elseif slot0[2] == 1 then
			return "ambiant temperature sensor"
		elseif slot0[2] == 2 then
			return "setpoint offset"
		elseif slot0[2] == 3 then
			return "generic sensor"
		elseif slot0[2] == 4 then
			return "actuator"
		elseif slot0[2] == 5 then
			return "hot water sensor"
		else
			return nil
		end
	end,
	getCauseFromRawSensorDefect = function (slot0)
		if slot0 == nil or #slot0 < 3 then
			return nil
		elseif slot0[3] == 0 then
			return "no fault logbook entry"
		elseif slot0[3] == 1 then
			return "system fault"
		elseif slot0[3] == 2 then
			return "mainpower wiring fault"
		elseif slot0[3] == 3 then
			return "main power low warning"
		elseif slot0[3] == 4 then
			return "battery low warning"
		elseif slot0[3] == 5 then
			return "battery fault"
		elseif slot0[3] == 6 then
			return "communications fault"
		elseif slot0[3] == 5 then
			return "invalid value"
		else
			return nil
		end
	end
}
