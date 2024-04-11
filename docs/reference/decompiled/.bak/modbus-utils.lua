({
	Type = {
		Int = {},
		Float = {},
		TimeProgram = {}
	},
	Command = {},
	getStopRunStateValue = function (slot0)
		if slot0:asint(true) == 0 then
			return "stop"
		elseif slot1 == 1 then
			return "run"
		else
			return nil
		end
	end,
	getStopRunCommandValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "stop" then
			return bytearray({
				0,
				0
			})
		elseif slot0:lower() == "run" then
			return bytearray({
				0,
				1
			})
		else
			return nil
		end
	end,
	getOnOffCommandValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "on" then
			return bytearray({
				255,
				0
			})
		elseif slot0:lower() == "off" then
			return bytearray({
				0,
				0
			})
		else
			return nil
		end
	end,
	getYesNoCommandValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "yes" then
			return bytearray({
				255,
				0
			})
		elseif slot0:lower() == "no" then
			return bytearray({
				0,
				0
			})
		else
			return nil
		end
	end,
	getFilterFanCommandValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "fan" then
			return slot0.toByteArray(0)
		elseif slot0:lower() == "filter" then
			return slot0.toByteArray(1)
		else
			return nil
		end
	end,
	getSummerWinterCommandValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "winter" then
			return slot0.toByteArray(0)
		elseif slot0:lower() == "summer" then
			return slot0.toByteArray(1)
		else
			return nil
		end
	end,
	getBasicHMISpeedValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "trickle" then
			return slot0.toByteArray(0)
		elseif slot0:lower() == "home" then
			return slot0.toByteArray(1)
		elseif slot0:lower() == "boost" then
			return slot0.toByteArray(2)
		else
			return nil
		end
	end,
	getMainSwitchValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "off" then
			return slot0.toByteArray(0)
		elseif slot0:lower() == "auto" then
			return slot0.toByteArray(1)
		elseif slot0:lower() == "hand" then
			return slot0.toByteArray(2)
		elseif slot0:lower() == "fireplace" then
			return slot0.toByteArray(3)
		else
			return nil
		end
	end,
	getOnOffStateValue = function (slot0)
		if slot0:asint(true) == 1 then
			return "on"
		elseif slot1 == 0 then
			return "off"
		else
			return nil
		end
	end,
	getSummerWinterStateValue = function (slot0)
		if slot0:asint(true) == 1 then
			return "summer"
		elseif slot1 == 0 then
			return "winter"
		else
			return nil
		end
	end,
	getYesNoStateValue = function (slot0)
		if slot0:asint(true) == 1 then
			return "yes"
		elseif slot1 == 0 then
			return "no"
		else
			return nil
		end
	end,
	getFilterFanStateValue = function (slot0)
		if slot0:asint(true) == 1 then
			return "filter"
		elseif slot1 == 0 then
			return "fan"
		else
			return nil
		end
	end,
	getCoolHeatStateValue = function (slot0)
		if slot0:asint(true) == 0 then
			return "cool"
		elseif slot1 == 1 then
			return "heat"
		else
			return nil
		end
	end,
	getCoolHeatCommandValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "cool" then
			return bytearray({
				0,
				0
			})
		elseif slot0:lower() == "heat" then
			return bytearray({
				0,
				1
			})
		else
			return nil
		end
	end,
	getNoBlockStateValue = function (slot0)
		if slot0:asint(true) == 0 then
			return "no"
		elseif slot1 == 1 then
			return "block"
		else
			return nil
		end
	end,
	getNoBlockCommandValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "no" then
			return bytearray({
				0,
				0
			})
		elseif slot0:lower() == "block" then
			return bytearray({
				0,
				1
			})
		else
			return nil
		end
	end,
	getNoAlarmStateValue = function (slot0)
		if slot0:asint(true) == 0 then
			return "no"
		elseif slot1 == 1 then
			return "alarm"
		else
			return nil
		end
	end,
	getNoAlarmCommandValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "no" then
			return bytearray({
				0,
				0
			})
		elseif slot0:lower() == "alarm" then
			return bytearray({
				0,
				1
			})
		else
			return nil
		end
	end,
	getComfortEcoStateValue = function (slot0)
		if slot0:asint(true) == 0 then
			return "comfort"
		elseif slot1 == 1 then
			return "eco"
		else
			return nil
		end
	end,
	getComfortEcoCommandValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "comfort" then
			return bytearray({
				0,
				0
			})
		elseif slot0:lower() == "eco" then
			return bytearray({
				0,
				1
			})
		else
			return nil
		end
	end,
	getHeatingOTCStateValue = function (slot0)
		if slot0:asint(true) == 0 then
			return "no"
		elseif slot1 == 1 then
			return "points"
		elseif slot1 == 2 then
			return "gradient"
		elseif slot1 == 3 then
			return "fix"
		else
			return nil
		end
	end,
	getHeatingOTCCommandValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "no" then
			return bytearray({
				0,
				0
			})
		elseif slot0:lower() == "points" then
			return bytearray({
				0,
				1
			})
		elseif slot0:lower() == "gradient" then
			return bytearray({
				0,
				2
			})
		elseif slot0:lower() == "fix" then
			return bytearray({
				0,
				3
			})
		else
			return nil
		end
	end,
	getCoolingOTCStateValue = function (slot0)
		if slot0:asint(true) == 0 then
			return "no"
		elseif slot1 == 1 then
			return "points"
		elseif slot1 == 2 then
			return "fix"
		else
			return nil
		end
	end,
	getCoolingOTCCommandValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "no" then
			return bytearray({
				0,
				0
			})
		elseif slot0:lower() == "points" then
			return bytearray({
				0,
				1
			})
		elseif slot0:lower() == "fix" then
			return bytearray({
				0,
				2
			})
		else
			return nil
		end
	end,
	getDHWModeStateValue = function (slot0)
		if slot0:asint(true) == 0 then
			return "standard"
		elseif slot1 == 1 then
			return "high demand"
		else
			return nil
		end
	end,
	getDHWModeCommandValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "standard" then
			return bytearray({
				0,
				0
			})
		elseif slot0:lower() == "high demand" then
			return bytearray({
				0,
				1
			})
		else
			return nil
		end
	end,
	getOperationStateValue = function (slot0)
		if slot0:asint(true) == 0 then
			return "off"
		elseif slot1 == 1 then
			return "cool demand-off"
		elseif slot1 == 2 then
			return "cool thermo-off"
		elseif slot1 == 3 then
			return "cool thermo-on"
		elseif slot1 == 4 then
			return "heat demand-off"
		elseif slot1 == 5 then
			return "heat thermo-off"
		elseif slot1 == 6 then
			return "heat thermo-on"
		elseif slot1 == 7 then
			return "dhw-off"
		elseif slot1 == 8 then
			return "dhw-on"
		elseif slot1 == 9 then
			return "swp-off"
		elseif slot1 == 10 then
			return "swp-on"
		elseif slot1 == 11 then
			return "alarm"
		else
			return nil
		end
	end,
	getHlinkCommunicationAlarmStateValue = function (slot0)
		if slot0:asint(true) == 0 then
			return "noAlarm"
		elseif slot1 == 1 then
			return "alarm"
		else
			return nil
		end
	end,
	getTahomaRoomThermostatAvailableStateValue = function (slot0)
		if slot0:asint(true) == 0 then
			return "not available"
		elseif slot1 == 1 then
			return "available"
		else
			return nil
		end
	end,
	getTahomaRoomThermostatAvailableCommandValue = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 2 then
			return slot0
		end

		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "not available" then
			return bytearray({
				0,
				0
			})
		elseif slot0:lower() == "available" then
			return bytearray({
				0,
				1
			})
		else
			return nil
		end
	end,
	getCentralSetting1 = function (slot0)
		if slot0 == nil or #slot0 ~= 2 then
			return nil
		else
			slot1 = "stop"
			slot2 = "cool"
			slot3 = "stop"
			slot4 = "stop"
			slot5 = "false"
			slot6 = "false"
			slot7 = "false"
			slot8 = "false"

			if bit.band(slot0[2], 1) ~= 0 then
				slot1 = "run"
			end

			if bit.band(slot0[2], 2) ~= 0 then
				slot2 = "heat"
			end

			if bit.band(slot0[2], 4) ~= 0 then
				slot3 = "run"
			end

			if bit.band(slot0[2], 8) ~= 0 then
				slot4 = "run"
			end

			if bit.band(slot0[2], 16) ~= 0 then
				slot5 = "true"
			end

			if bit.band(slot0[2], 32) ~= 0 then
				slot6 = "true"
			end

			if bit.band(slot0[2], 64) ~= 0 then
				slot7 = "true"
			end

			if bit.band(slot0[2], 128) ~= 0 then
				slot8 = "true"
			end

			return "Unit run/stop : " .. slot1 .. " -- " .. "Unit mode : " .. slot2 .. " -- " .. "Circuit 1 run/stop : " .. slot3 .. " -- " .. "Circuit 2 run/stop : " .. slot4 .. " -- " .. "Circuit 1 room ambient change : " .. slot5 .. " -- " .. "Circuit 2 room ambient change : " .. slot6 .. " -- " .. "Circuit 1 thermostat setting change : " .. slot7 .. " -- " .. "Circuit 2 thermostat setting change : " .. slot8
		end
	end,
	getCentralSetting2 = function (slot0)
		if slot0 == nil or #slot0 ~= 2 then
			return nil
		else
			slot1 = "false"
			slot2 = "false"
			slot3 = "false"
			slot4 = "false"
			slot5 = "off"
			slot6 = "off"
			slot7 = "off"

			if bit.band(slot0[2], 1) ~= 0 then
				slot1 = "true"
			end

			if bit.band(slot0[2], 2) ~= 0 then
				slot2 = "true"
			end

			if bit.band(slot0[2], 4) ~= 0 then
				slot3 = "true"
			end

			if bit.band(slot0[2], 8) ~= 0 then
				slot4 = "true"
			end

			if bit.band(slot0[2], 16) ~= 0 then
				slot5 = "on"
			end

			if bit.band(slot0[2], 32) ~= 0 then
				slot6 = "on"
			end

			if bit.band(slot0[2], 64) ~= 0 then
				slot7 = "on"
			end

			return "Circuit 1 Water setting heat : " .. slot1 .. " -- " .. "Circuit 2 Water setting heat : " .. slot2 .. " -- " .. "Circuit 1 Water setting cool : " .. slot3 .. " -- " .. "Circuit 2 Water setting cool : " .. slot4 .. " -- " .. "DHWT : " .. slot5 .. " -- " .. "Swimming pool : " .. slot6 .. " -- " .. "Anti legionella : " .. slot7
		end
	end,
	getCentralSetting3 = function (slot0)
		if slot0 == nil or #slot0 ~= 2 then
			return nil
		else
			slot1 = "off"
			slot2 = "off"
			slot3 = "off"
			slot4 = "off"
			slot5 = "comfort"
			slot6 = "standard"

			if bit.band(slot0[2], 1) ~= 0 then
				slot1 = "on"
			end

			if bit.band(slot0[2], 2) ~= 0 then
				slot2 = "on"
			end

			if bit.band(slot0[2], 4) ~= 0 then
				slot3 = "on"
			end

			if bit.band(slot0[2], 8) ~= 0 then
				slot4 = "on"
			end

			if bit.band(slot0[2], 16) ~= 0 then
				slot5 = "eco"
			end

			if bit.band(slot0[2], 32) ~= 0 then
				slot6 = "high demand"
			end

			return "Heating OTC 1 : " .. slot1 .. " -- " .. "Heating OTC 2 : " .. slot2 .. " -- " .. "Cooling OTC 1 : " .. slot3 .. " -- " .. "Cooling OTC 2 : " .. slot4 .. " -- " .. "DHWT : " .. slot5 .. " -- " .. "Space mode : " .. slot6
		end
	end,
	getSystemConfigurationState = function (slot0)
		if slot0 == nil or #slot0 ~= 2 then
			return nil
		else
			slot1 = "unavailable"
			slot2 = "unavailable"
			slot3 = "unavailable"
			slot4 = "unavailable"
			slot5 = "unavailable"
			slot6 = "unavailable"
			slot7 = "unavailable"
			slot8 = "unavailable"

			if bit.band(slot0[2], 1) ~= 0 then
				slot1 = "available"
			end

			if bit.band(slot0[2], 2) ~= 0 then
				slot2 = "available"
			end

			if bit.band(slot0[2], 4) ~= 0 then
				slot3 = "available"
			end

			if bit.band(slot0[2], 8) ~= 0 then
				slot4 = "available"
			end

			if bit.band(slot0[2], 16) ~= 0 then
				slot5 = "available"
			end

			if bit.band(slot0[2], 32) ~= 0 then
				slot6 = "available"
			end

			if bit.band(slot0[2], 64) ~= 0 then
				slot7 = "available"
			end

			if bit.band(slot0[2], 128) ~= 0 then
				slot8 = "available"
			end

			return "Zone 1 heating : " .. slot1 .. " -- " .. "Zone 2 heating : " .. slot2 .. " -- " .. "Zone 1 cooling : " .. slot3 .. " -- " .. "Zone 2 cooling : " .. slot4 .. " -- " .. "DHWT : " .. slot5 .. " -- " .. "Swimming pool : " .. slot6 .. " -- " .. "Room thermostat zone 1 : " .. slot7 .. " -- " .. "Room thermostat zone 2 : " .. slot8
		end
	end,
	toByteArray = function (slot0)
		if type(slot0) == "string" then
			return bytearray(slot0, "base64")
		elseif type(slot0) == "userdata" then
			return slot0
		else
			slot1 = bytearray(2)

			slot1:writeInt16(1, slot0)

			return slot1
		end
	end,
	getEcoModeStateValue = function (slot0)
		if slot0:asint(true) == 1 then
			return "comfort"
		elseif slot1 == 0 then
			return "eco"
		else
			return nil
		end
	end,
	getControlDHWBoostRequestStateValue = function (slot0)
		if slot0:asint(true) == 0 then
			return "no request"
		elseif slot1 == 1 then
			return "request"
		else
			return nil
		end
	end,
	getControlDHWBoostRequestCommandValue = function (slot0)
		if type(slot0) ~= "string" then
			return nil
		elseif slot0:lower() == "no request" then
			return bytearray({
				0,
				0
			})
		elseif slot0:lower() == "request" then
			return bytearray({
				0,
				1
			})
		else
			return nil
		end
	end,
	getControlDHWBoostStatusStateValue = function (slot0)
		if slot0:asint(true) == 0 then
			return "disabled"
		elseif slot1 == 1 then
			return "enabled"
		else
			return nil
		end
	end
})["Type"].Int.state = function (slot0)
	if slot0 == nil or #slot0 ~= 2 then
		return nil
	end

	if slot0:asint(true) == 65535 then
		return nil
	else
		return slot1
	end
end

()["Type"].Int.cmd = function (slot0)
	slot1 = bytearray(2)

	slot1:writeUInt16(1, slot0)

	return slot1
end

()["Type"].Float.state = function (slot0)
	if slot0 == nil or #slot0 ~= 2 then
		return nil
	elseif slot0:asint(true) == 65535 then
		return nil
	else
		slot1 = slot0:asint(true)
		slot1 = bit.band(slot0:asint(true), 32767)

		if bit.band(slot0[1], 128) == 128 then
			slot1 = -slot1
		end

		return slot1 / 10
	end
end

()["Type"].Float.cmd = function (slot0)
	slot1 = bytearray(2)

	if slot0 < 0 then
		slot1:writeUInt16(1, -slot0 * 10)

		slot1[1] = bit.bor(slot1[1], 128)
	else
		slot1:writeUInt16(1, slot0 * 10)
	end

	return slot1
end

()["Type"].TimeProgram.state = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20)
	if slot0 and slot1 and slot2 and slot3 and slot4 and slot5 and slot6 and slot7 and slot8 and slot9 and slot10 and slot11 and slot12 and slot13 and slot14 and slot15 and slot16 and slot17 and slot18 and slot19 and slot20 then
		return {
			monday = slot0.Type.TimeProgram.dailystate(slot0:append(slot1):append(slot2)),
			tuesday = slot0.Type.TimeProgram.dailystate(slot3:append(slot4):append(slot5)),
			wednesday = slot0.Type.TimeProgram.dailystate(slot6:append(slot7):append(slot8)),
			thursday = slot0.Type.TimeProgram.dailystate(slot9:append(slot10):append(slot11)),
			friday = slot0.Type.TimeProgram.dailystate(slot12:append(slot13):append(slot14)),
			saturday = slot0.Type.TimeProgram.dailystate(slot15:append(slot16):append(slot17)),
			sunday = slot0.Type.TimeProgram.dailystate(slot18:append(slot19):append(slot20))
		}
	end
end

()["Type"].TimeProgram.dailystate = function (slot0)
	if slot0 == nil or #slot0 ~= 6 then
		return {}
	end

	slot1 = {
		active = {},
		inactive = {}
	}
	slot2 = {
		from = {
			hour = 0,
			minute = 0
		}
	}

	if bit.band(slot0[1], 128) == 128 then
		slot1.active[1] = slot2
	else
		slot1.inactive[1] = slot2
	end

	slot3, slot4 = nil

	for slot8 = 1, #slot0, 1 do
		for slot12 = 8, 1, -1 do
			if slot8 == 1 and slot12 == 8 then
			else
				slot4 = (slot12 >= 8 or bit.rshift(bit.band(slot0[slot8], slot13), slot12)) and bit.band(slot0[slot8 - 1], 1)
				slot3 = bit.rshift(bit.band(slot0[slot8], slot13), slot12 - 1)
			end

			if slot3 ~= slot4 then
				slot13 = math.floor((8 * slot8 - slot12) / 2)
				slot14 = nil
				slot14 = (slot12 % 2 > 0 and 30) or 0

				if slot4 == 1 then
					slot1.active[#slot1.active].to = {
						hour = slot13,
						minute = slot14
					}
					slot1.inactive[#slot1.inactive + 1] = {}
					slot1.inactive[#slot1.inactive].from = {
						hour = slot13,
						minute = slot14
					}
				else
					slot1.inactive[#slot1.inactive].to = {
						hour = slot13,
						minute = slot14
					}
					slot1.active[#slot1.active + 1] = {}
					slot1.active[#slot1.active].from = {
						hour = slot13,
						minute = slot14
					}
				end
			end
		end
	end

	if slot3 == 1 then
		slot1.active[#slot1.active].to = {
			hour = 0,
			minute = 0
		}
	else
		slot1.inactive[#slot1.inactive].to = {
			hour = 0,
			minute = 0
		}
	end

	return slot1
end

()["Type"].TimeProgram.cmd = function (slot0, slot1)
	slot3 = slot0.Type.TimeProgram.getDayTimeProgram(slot0, "tuesday")
	slot4 = slot0.Type.TimeProgram.getDayTimeProgram(slot0, "wednesday")
	slot5 = slot0.Type.TimeProgram.getDayTimeProgram(slot0, "thursday")
	slot6 = slot0.Type.TimeProgram.getDayTimeProgram(slot0, "friday")
	slot7 = slot0.Type.TimeProgram.getDayTimeProgram(slot0, "saturday")
	slot8 = slot0.Type.TimeProgram.getDayTimeProgram(slot0, "sunday")
	slot9 = bytearray(42)

	for slot13 = 1, #slot0.Type.TimeProgram.getDayTimeProgram(slot0, "monday"), 1 do
		slot9[slot13] = slot2[slot13]
	end

	for slot13 = 1, #slot3, 1 do
		slot9[slot13 + 6] = slot3[slot13]
	end

	for slot13 = 1, #slot4, 1 do
		slot9[slot13 + 12] = slot4[slot13]
	end

	for slot13 = 1, #slot5, 1 do
		slot9[slot13 + 18] = slot5[slot13]
	end

	for slot13 = 1, #slot6, 1 do
		slot9[slot13 + 24] = slot6[slot13]
	end

	for slot13 = 1, #slot7, 1 do
		slot9[slot13 + 30] = slot7[slot13]
	end

	for slot13 = 1, #slot8, 1 do
		slot9[slot13 + 36] = slot8[slot13]
	end

	slot10 = bytearray(7)

	if slot1 >= 800 then
		slot10[1] = 60
	else
		slot10[1] = 10
	end

	slot10[2] = 16

	slot10:writeUInt16(3, slot1)
	slot10:writeUInt16(5, #slot9 / 2)
	slot10:writeUInt8(7, #slot9)

	return slot10:append(slot9)
end

()["Type"].TimeProgram.getDayTimeProgram = function (slot0, slot1)
	slot2 = {
		0,
		0,
		0,
		0,
		0,
		0
	}

	if slot0[slot1] ~= nil and slot0[slot1].active ~= nil then
		for slot6 = 1, #slot0[slot1].active, 1 do
			slot9 = slot0[slot1].active[slot6].to
			slot10 = slot0[slot1].active[slot6].from.hour * 2 + 1

			if slot0[slot1].active[slot6].from.minute ~= 0 then
				slot10 = slot10 + 1
			end

			slot11 = slot9.hour * 2

			if slot9.minute ~= 0 then
				slot11 = slot11 + 1
			end

			slot12 = 0

			for slot16, slot17 in ipairs(slot2) do
				for slot21 = 0, 7, 1 do
					slot22 = 7 - slot21

					if slot10 <= slot12 + 1 and slot12 <= slot11 then
						slot2[slot16] = bit.bor(slot2[slot16], bit.lshift(1, slot22))
					end
				end
			end
		end
	end

	return slot2
end

()["Command"].write = function (slot0, slot1, slot2)
	if slot0.Type[slot0] == nil then
		return nil
	end

	if slot3.cmd(slot2) == nil then
		return nil
	end

	slot5 = bytearray(7)

	if slot1 >= 800 then
		slot5[1] = 60
	else
		slot5[1] = 10
	end

	slot5[2] = 16

	slot5:writeUInt16(3, slot1)
	slot5:writeUInt16(5, #slot4 / 2)
	slot5:writeUInt8(7, #slot4)

	return slot5:append(slot4)
end

()["Command"].refresh = function (slot0, slot1)
	if slot1 == nil or slot1 < 1 then
		slot1 = 1
	end

	slot2 = bytearray(6)

	if slot0 >= 800 then
		slot2[1] = 60
	else
		slot2[1] = 10
	end

	slot2[2] = 3

	slot2:writeUInt16(3, slot0)
	slot2:writeUInt16(5, slot1)

	return slot2
end

()["Command"].setCircuitDerogationDDModbusGateway = function (slot0, slot1, slot2, slot3)
	if getStateValue(slot0, slot1, slot2) == nil then
		return nil
	end

	slot5 = {}
	slot6 = nil

	if slot2 == "DeDietrichDerogationA" then
		slot6 = bytearray({
			2,
			141
		})
	elseif slot2 == "DeDietrichDerogationB" then
		slot6 = bytearray({
			2,
			147
		})
	elseif slot2 == "DeDietrichDerogationC" then
		slot6 = bytearray({
			2,
			155
		})
	end

	slot7 = bit.band(slot4:readUInt16(1), 65296)
	slot8 = nil

	if slot3 == "holidays" then
		slot8 = bit.bor(slot7, 1)
	elseif slot3 == "eco" then
		slot8 = bit.bor(slot7, 2)
	elseif slot3 == "comfort" then
		slot8 = bit.bor(slot7, 4)
	elseif slot3 == "auto" then
		slot8 = bit.bor(slot7, 8)
	end

	if slot2 == "DeDietrichDerogationA" then
		slot5.DeDietrichDerogationA = slot0.Command.write("Int", slot6:asint(true), slot8)
	elseif slot2 == "DeDietrichDerogationB" then
		slot5.DeDietrichDerogationB = slot0.Command.write("Int", slot6:asint(true), slot8)
	elseif slot2 == "DeDietrichDerogationC" then
		slot5.DeDietrichDerogationC = slot0.Command.write("Int", slot6:asint(true), slot8)
	end

	return slot5
end

()["Command"].setECSDerogationDDModbusGateway = function (slot0, slot1, slot2)
	slot3 = {}
	slot5 = getStateValue(slot0, slot1, "DeDietrichDerogationB")
	slot6 = getStateValue(slot0, slot1, "DeDietrichDerogationC")

	if getStateValue(slot0, slot1, "DeDietrichDerogationA") == nil or slot5 == nil or slot6 == nil then
		return nil
	end

	slot7 = bit.band(slot4:readUInt16(1), 65295)
	slot8 = bit.band(slot5:readUInt16(1), 65295)
	slot9 = bit.band(slot6:readUInt16(1), 65295)
	slot10, slot11, slot12 = nil

	if slot2 == "comfort" then
		slot10 = bit.bor(slot7, 16)
		slot11 = bit.bor(slot8, 16)
		slot12 = bit.bor(slot9, 16)
	elseif slot2 == "auto" then
		slot10 = slot7
		slot11 = slot8
		slot12 = slot9
	end

	slot3.DeDietrichDerogationA = slot0.Command.write("Int", 653, slot10)
	slot3.DeDietrichDerogationB = slot0.Command.write("Int", 659, slot11)
	slot3.DeDietrichDerogationC = slot0.Command.write("Int", 667, slot12)

	return slot3
end

()["Command"].applyDerogationDDModbusGateway = function (slot0, slot1)
	slot2 = bit.band(slot1:readUInt16(1), 65295)
	slot3 = nil

	if slot0 == "comfort" then
		slot3 = bit.bor(slot2, 16)
	elseif slot0 == "auto" then
		slot3 = slot2
	end

	return slot3
end

return 
