slot0 = depends("common", "utils")

function slot2(slot0)
	if slot0 == nil or #slot0 ~= 1 then
		return nil
	end

	return bit.band(slot0[1], 1) ~= 0
end

function slot3(slot0)
	if slot0 == nil then
		return nil
	end

	slot1 = bytearray(1)

	if slot0 then
		slot1[1] = 1
	end

	return slot1
end

function slot4(slot0)
	if slot0 == nil or #slot0 ~= 1 then
		return nil
	end

	return {
		bit.band(slot0[1], 8) ~= 0,
		bit.band(slot0[1], 7)
	}
end

function slot5(slot0)
	if slot0 == nil or type(slot0) ~= "table" or #slot0 ~= 2 then
		return nil
	end

	slot1 = bytearray(1)

	if slot0[1] then
		slot1[1] = 8
	end

	slot1[1] = slot1[1] + bit.band(slot0[2], 7)

	return slot1
end

function slot6(slot0)
	if slot0 == nil or #slot0 ~= 1 then
		return nil
	end

	return slot0:readUInt8(1)
end

function slot7(slot0)
	if slot0 == nil then
		return nil
	end

	slot1 = bytearray(1)

	slot1:writeUInt8(1, slot0)

	return slot1
end

function slot8(slot0)
	if slot0 == nil or #slot0 ~= 1 then
		return nil
	end

	return slot0:readInt8(1)
end

function slot9(slot0)
	if slot0 == nil then
		return nil
	end

	slot1 = bytearray(1)

	slot1:writeInt8(1, slot0)

	return slot1
end

function slot10(slot0)
	if slot0 == nil or #slot0 ~= 2 then
		return nil
	end

	return slot0:readUInt16(1)
end

function slot11(slot0)
	if slot0 == nil then
		return nil
	end

	slot1 = bytearray(2)

	slot1:writeUInt16(1, slot0)

	return slot1
end

function slot12(slot0)
	if slot0 == nil or #slot0 ~= 2 then
		return nil
	end

	return slot0:readInt16(1)
end

function slot13(slot0)
	if slot0 == nil then
		return nil
	end

	slot1 = bytearray(2)

	slot1:writeInt16(1, slot0)

	return slot1
end

function slot14(slot0)
	if slot0 == nil or #slot0 ~= 4 then
		return nil
	end

	return slot0:readUInt32(1)
end

function slot15(slot0)
	if slot0 == nil then
		return nil
	end

	slot1 = bytearray(4)

	slot1:writeUInt32(1, slot0)

	return slot1
end

function slot16(slot0)
	if slot0 == nil or #slot0 ~= 4 then
		return nil
	end

	return slot0:readInt32(1)
end

function slot17(slot0)
	if slot0 == nil then
		return nil
	end

	slot1 = bytearray(4)

	slot1:writeInt32(1, slot0)

	return slot1
end

function slot18(slot0)
	if not slot0 or #slot0 < 2 then
		error("invalid input data")
	end

	slot1 = bit.bor(bit.lshift(slot0[1], 8), slot0[2])

	return tonumber(string.format("%.2f", 0.01 * slot0.readSignedRawValue(slot3, 12) * math.pow(2, bit.rshift(bit.band(slot1, 30720), 11))))
end

function slot19(slot0)
	if slot0 == nil then
		return nil
	end

	if slot0 < -671088.64 or slot0 > 670760.96 then
		error("Value is out of supported max range [-671088.64;670760.96]")
	end

	slot1 = slot0 / 0.01
	slot2 = 0

	while slot1 < -2048 do
		slot1 = slot1 / 2
		slot2 = slot2 + 1
	end

	while slot1 > 2047 do
		slot1 = slot1 / 2
		slot2 = slot2 + 1
	end

	slot3 = slot0.writeSignedRawValue(slot1, 12)
	slot5 = bytearray(2)
	slot5[1] = bit.rshift(bit.band(slot3, 2048), 4) + bit.lshift(slot2, 3) + bit.rshift(bit.band(slot3, 1792), 8)
	slot5[2] = bit.band(slot3, 255)

	return slot5
end

function slot20(slot0)
	if slot0 == nil or #slot0 ~= 1 then
		return nil
	end

	return {
		bit.band(slot0[1], 128) == 0,
		bit.band(slot0[1], 64) == 0,
		bit.band(slot0[1], 32) == 0,
		bit.band(slot0[1], 16) == 0,
		bit.band(slot0[1], 8) == 0,
		bit.band(slot0[1], 7)
	}
end

function slot21(slot0)
	if slot0 == nil or type(slot0) ~= "table" or #slot0 ~= 6 then
		return nil
	end

	slot1 = bytearray(1)
	slot2 = 128

	for slot6 = 1, 5, 1 do
		if not slot0[slot6] then
			slot1[1] = slot1[1] + slot2
		end

		slot2 = slot2 / 2
	end

	slot1[1] = slot1[1] + bit.band(slot0[6], 7)

	return slot1
end

function slot22(slot0)
	if slot0 == nil or #slot0 ~= 3 then
		return nil
	end

	return {
		bit.rshift(slot0[1], 5),
		bit.band(slot0[1], 31),
		bit.band(slot0[2], 63),
		bit.band(slot0[3], 63)
	}
end

function slot23(slot0)
	if slot0 == nil or type(slot0) ~= "table" or #slot0 ~= 4 then
		return nil
	end

	slot1 = bytearray(3)
	slot1[1] = bit.lshift(slot0[1], 5) + slot0[2]
	slot1[2] = slot0[3]
	slot1[3] = slot0[4]

	return slot1
end

function slot24(slot0)
	if slot0 == nil or #slot0 ~= 3 then
		return nil
	end

	return {
		bit.band(slot0[1], 31),
		bit.band(slot0[2], 15),
		(bit.band(slot0[3], 127) < 90 and slot1 + 2000) or slot1 + 1900
	}
end

function slot25(slot0)
	if slot0 == nil or type(slot0) ~= "table" or #slot0 ~= 3 then
		return nil
	end

	bytearray(3)[1] = slot0[1]
	bytearray(3)[2] = slot0[2]
	slot1[3] = (slot0[3] < 2000 and slot2 - 1900) or slot2 - 2000

	return slot1
end

function slot26(slot0)
	if slot0 == nil or #slot0 ~= 4 then
		return nil
	end

	return slot0:readFloat(1)
end

function slot27(slot0)
	if slot0 == nil then
		return nil
	end

	slot1 = bytearray(4)

	slot1:writeFloat(1, slot0)

	return slot1
end

function slot28(slot0)
	if slot0 == nil or #slot0 ~= 1 then
		return nil
	end

	slot1 = nil

	return {
		(bit.band(slot0[1], 128) == 0 and "activate") or "learn",
		bit.band(slot0[1], 63)
	}
end

function slot29(slot0)
	if slot0 == nil or type(slot0) ~= "table" or #slot0 ~= 2 then
		return nil
	end

	slot1 = bytearray(1)

	if slot0[1] == "learn" then
		slot1[1] = 128
	end

	slot1[1] = slot1[1] + bit.band(slot0[2], 63)

	return slot1
end

function slot30(slot0)
	if slot0 == nil or #slot0 ~= 3 then
		return nil
	end

	return {
		slot0[1],
		slot0[2],
		slot0[3]
	}
end

function slot31(slot0)
	if slot0 == nil or type(slot0) ~= "table" or #slot0 ~= 3 then
		return nil
	end

	slot1 = bytearray(3)
	slot1[1] = slot0[1]
	slot1[2] = slot0[2]
	slot1[3] = slot0[3]

	return slot1
end

function slot32(slot0)
	if slot0 == nil or #slot0 ~= 3 then
		return nil
	end

	return {
		slot0:readUInt16(1),
		slot0[3]
	}
end

function slot33(slot0)
	if slot0 == nil or type(slot0) ~= "table" or #slot0 ~= 2 then
		return nil
	end

	slot1 = bytearray(3)

	slot1:writeUInt16(1, slot0[1])

	slot1[3] = slot0[2]

	return slot1
end

function slot34(slot0)
	if slot0 == nil or #slot0 ~= 2 then
		return nil
	end

	return {
		actualValue = slot0.round((100 * slot0:readUInt8(1)) / 255),
		attributes = {
			validActualValue = bit.band(1, slot0:readUInt8(2)) == 1,
			locked = bit.band(2, slot2) == 2,
			forced = bit.band(4, slot2) == 4,
			nightModeActive = bit.band(8, slot2) == 8,
			staircaseLightingFunction = bit.band(16, slot2) == 16,
			dimming = bit.band(32, slot2) == 32,
			localOverride = bit.band(64, slot2) == 64,
			failure = bit.band(128, slot2) == 128
		}
	}
end

function slot35(slot0)
	if slot0 == nil or #slot0 ~= 6 then
		return nil
	end

	return slot0:readInt32(1)
end

function slot36(slot0)
	if slot0 then
		slot1 = 1

		while slot1 < 15 and slot0[slot1] ~= 0 do
			slot1 = slot1 + 1
		end

		return slot0:sub(1, slot1 - 1):tostring("iso-8859-1")
	end
end

slot37 = {
	000 = {
		true,
		false
	},
	001 = {
		"on",
		"off"
	},
	002 = {
		true,
		false
	},
	003 = {
		"enable",
		"disable"
	},
	004 = {
		"ramp",
		"noRamp"
	},
	005 = {
		"alarm",
		"noAlarm"
	},
	006 = {
		"high",
		"low"
	},
	007 = {
		"increase",
		"decrease"
	},
	008 = {
		"down",
		"up"
	},
	009 = {
		"close",
		"open"
	},
	010 = {
		"start",
		"stop"
	},
	011 = {
		"active",
		"inactive"
	},
	012 = {
		"inverted",
		"notInverted"
	},
	013 = {
		"cyclically",
		"startStop"
	},
	014 = {
		"calculated",
		"fixed"
	},
	015 = {
		"reset",
		"noAction"
	},
	016 = {
		"ack",
		"noAction"
	},
	017 = {
		"trigger",
		"trigger"
	},
	018 = {
		"occupied",
		"notOccupied"
	},
	019 = {
		"open",
		"close"
	},
	021 = {
		"and",
		"or"
	},
	022 = {
		"sceneB",
		"sceneA"
	},
	023 = {
		"upDownAndStepStop",
		"upDownOnly"
	},
	100 = {
		"heating",
		"cooling"
	}
}
slot38 = {
	["5.001"] = {
		2.55,
		true
	},
	["5.003"] = {
		0.7083333333333334,
		true
	},
	["8.010"] = {
		100,
		false
	},
	["8.003"] = {
		100,
		false
	},
	["8.003"] = {
		10,
		false
	}
}
slot39 = {
	"auto",
	"comfort",
	"standby",
	"economy",
	"buildingProtection"
}

function slot40(slot0)
	for slot4 = 1, #slot0, 1 do
		if slot0[slot4] == slot0 then
			return slot4 - 1
		end
	end

	return nil
end

slot41 = {
	"auto",
	"heat",
	"morningWarmup",
	"cool",
	"nightPurge",
	"precool",
	"off",
	"test",
	"emergencyHeat",
	"fanOnly",
	"freeCool",
	"ice",
	"maximumHeatingMode",
	"economicHeatCoolMode",
	"dehumidification",
	"calibrationMode",
	"emergencyCoolMode",
	"emergencySteamMode",
	nil,
	"noDem"
}

function slot42(slot0)
	for slot4 = 1, #slot0, 1 do
		if slot0[slot4] == slot0 then
			return slot4 - 1
		end
	end

	return nil
end

function slot43(slot0, slot1)
	if slot0(slot0) == nil then
		return nil
	end

	if slot1[slot1] == nil then
		slot3 = slot1.000
	end

	if slot2 then
		return slot3[1]
	end

	return slot3[2]
end

function slot44(slot0, slot1)
	slot2 = bytearray(1)

	if slot0[slot1] == nil then
		slot3 = slot0.000
	end

	if slot0 == slot3[1] then
		slot2[1] = 1
	elseif slot0 == slot3[2] then
		slot2[1] = 0
	else
		return nil
	end

	return slot2
end

function slot45(slot0, slot1)
	if slot1 == nil then
		return nil
	end

	if slot0[slot0] ~= nil then
		if slot2[2] then
			return slot1.round(slot1 * slot2[1])
		else
			return slot1 * slot2[1]
		end
	else
		return slot1
	end
end

function slot46(slot0, slot1)
	if slot1 == nil then
		return nil
	end

	if slot0[slot0] ~= nil then
		if slot2[2] then
			return slot1.round(slot1 / slot2[1])
		else
			return slot1 / slot2[1]
		end
	else
		return slot1
	end
end

slot47 = {
	"auto",
	"legionellaprotection",
	"normal",
	"reduced",
	"frostprotection"
}

function slot48(slot0)
	for slot4 = 1, #slot0, 1 do
		if slot0[slot4] == slot0 then
			return slot4 - 1
		end
	end

	return nil
end

return {
	fromData = function (slot0, slot1)
		if slot1 == nil then
			return nil
		end

		slot3 = tonumber(slot0:split("[0-9]+")[1])
		slot4 = 0

		if #slot0.split("[0-9]+") > 1 then
			slot4 = slot2[2]
		end

		if slot3 == 1 then
			return slot1(slot1, slot4)
		elseif slot3 == 2 then
			if slot1(slot1, slot4) == nil then
				return nil
			end

			return {
				bit.band(slot1[1], 2) ~= 0,
				slot5
			}
		elseif slot3 == 3 then
			return slot2(slot1)
		elseif slot3 == 5 then
			return slot4(slot0, slot3(slot1))
		elseif slot3 == 6 then
			if slot4 == "020" then
				return slot5(slot1)
			end

			return slot6(slot1)
		elseif slot3 == 7 then
			return slot7(slot1)
		elseif slot3 == 8 then
			return slot4(slot0, slot8(slot1))
		elseif slot3 == 9 then
			return slot9(slot1)
		elseif slot3 == 10 then
			return slot10(slot1)
		elseif slot3 == 11 then
			return slot11(slot1)
		elseif slot3 == 12 then
			return slot12(slot1)
		elseif slot3 == 13 then
			if slot4 == "002" then
				return slot13(slot1) / 10000
			end

			return slot13(slot1)
		elseif slot3 == 14 then
			return slot14(slot1)
		elseif slot3 == 16 then
			return slot15(slot1)
		elseif slot3 == 18 then
			return slot16(slot1)
		elseif slot3 == 20 then
			if slot4 == "102" then
				return slot17[slot3(slot1) + 1]
			end

			if slot4 == "103" then
				return slot18[slot3(slot1) + 1]
			end

			if slot4 == "105" then
				return slot19[slot3(slot1) + 1]
			end

			return slot3(slot1)
		elseif slot3 == 207 then
			if slot4 == "600" then
				return slot20(slot1)
			end
		elseif slot3 == 225 then
			if slot4 == "003" then
				return slot21(slot1)
			end
		elseif slot3 == 232 then
			return slot22(slot1)
		elseif slot3 == 235 then
			return slot23(slot1)
		end

		print("Unsupported DPT : " .. slot0)

		return nil
	end,
	toData = function (slot0, slot1)
		if slot1 == nil then
			return nil
		end

		slot3 = tonumber(slot0:split("[0-9]+")[1])
		slot4 = 0

		if #slot0.split("[0-9]+") > 1 then
			slot4 = slot2[2]
		end

		if slot3 == 1 then
			return slot1(slot1, slot4)
		elseif slot3 == 2 then
			if type(slot1) ~= "table" or #slot1 ~= 2 then
				print("Expected a table with two values for DPT 2.x")

				return nil
			end

			slot5 = slot1(slot1[2], slot4)

			if slot1[1] then
				slot5[1] = slot5[1] + 2
			end

			return slot5
		elseif slot3 == 3 then
			return slot2(slot1)
		elseif slot3 == 5 then
			if slot3(slot0, slot1) ~= nil and (slot5 < 0 or slot5 > 255) then
				print("Value out of range for DPT [" .. slot0 .. "] : " .. slot1)

				return nil
			end

			return slot4(slot5)
		elseif slot3 == 6 then
			if slot4 == "020" then
				return slot5(slot1)
			end

			return slot6(slot1)
		elseif slot3 == 7 then
			return slot7(slot1)
		elseif slot3 == 8 then
			return slot8(slot3(slot0, slot1))
		elseif slot3 == 9 then
			return slot9(slot1)
		elseif slot3 == 10 then
			return slot10(slot1)
		elseif slot3 == 11 then
			return slot11(slot1)
		elseif slot3 == 12 then
			return slot12(slot1)
		elseif slot3 == 13 then
			if slot4 == "002" then
				return slot13(slot0.round(slot1 * 10000))
			end

			return slot13(slot1)
		elseif slot3 == 14 then
			return slot14(slot1)
		elseif slot3 == 18 then
			return slot15(slot1)
		elseif slot3 == 20 then
			if slot4 == "102" then
				return slot4(slot16(slot1))
			end

			if slot4 == "103" then
				return slot4(slot17(slot1))
			end

			if slot4 == "105" then
				return slot4(slot18(slot1))
			end

			return slot4(slot1)
		elseif slot3 == 225 then
			if slot4 == "003" then
				return slot19(slot1)
			end
		elseif slot3 == 232 then
			return slot20(slot1)
		end

		print("Unsupported DPT : " .. slot0)

		return nil
	end
}
