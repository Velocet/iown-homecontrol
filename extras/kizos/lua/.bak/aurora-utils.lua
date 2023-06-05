slot0 = {}
slot1 = depends
slot2 = "common"
slot3 = "utils"
slot1 = slot1(slot2, slot3)
slot2 = {}
slot0.memorizedPositionNamesMap = slot2
slot2 = slot0.memorizedPositionNamesMap
slot3 = "Memorized1PositionState"
slot2.memorized1 = slot3
slot2 = slot0.memorizedPositionNamesMap
slot3 = "Memorized2PositionState"
slot2.memorized2 = slot3
slot2 = slot0.memorizedPositionNamesMap
slot3 = "Memorized3PositionState"
slot2.memorized3 = slot3

function slot2(slot0)
	slot1 = bytearray
	slot2 = {
		nil,
		0,
		0,
		0
	}
	slot3 = slot0
	slot3 = slot3.round
	slot4 = slot0 * 255
	slot4 = slot4 / 100
	slot3 = slot3(slot4)
	slot2[1] = slot3

	return slot1(slot2)
end

slot0.dimming = slot2

function slot2()
	slot0 = bytearray
	slot1 = {
		255,
		0,
		0,
		0
	}
	slot0 = slot0(slot1)
	slot1 = {
		category = "lighting"
	}

	return slot0, slot1
end

slot0.on = slot2

function slot2()
	slot0 = bytearray
	slot1 = {
		0,
		0,
		0,
		0
	}
	slot0 = slot0(slot1)
	slot1 = {
		category = "lighting"
	}

	return slot0, slot1
end

slot0.off = slot2

function slot2(slot0)
	slot1 = slot0
	slot1 = slot1.round
	slot3 = slot0
	slot2 = slot0.readUInt8
	slot4 = 1
	slot2 = slot2(slot3, slot4)
	slot2 = slot2 / 255
	slot2 = slot2 * 100

	return slot1(slot2)
end

slot0.toDimming = slot2

function slot2()
	slot0 = slot0
	slot0 = slot0.on
	slot0, slot1 = slot0()
	slot2 = slot0
	slot2 = slot2.off
	slot2, slot3 = slot2()
	slot4 = 1
	slot3.delay = slot4
	slot4 = slot0
	slot5 = slot1
	slot6 = slot2
	slot7 = slot3

	return slot4, slot5, slot6, slot7
end

slot0.identify = slot2

function slot2(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7, slot8, slot9, slot10 = nil
	slot11 = slot0
	slot11 = slot11.setIntensityOrPosition
	slot12 = slot0
	slot13 = slot3
	slot14 = slot4
	slot15 = slot5
	slot16 = slot6
	slot11, slot12 = slot11(slot12, slot13, slot14, slot15, slot16)
	slot8 = slot12
	slot7 = slot11

	if slot2 == nil or slot2 == 0 then
		slot11 = slot0
		slot11 = slot11.off
		slot11, slot12 = slot11()
		slot10 = slot12
		slot9 = slot11
	else
		slot11 = slot0
		slot11 = slot11.setIntensityOrPosition
		slot12 = slot2
		slot13 = slot3
		slot14 = slot4
		slot15 = slot5
		slot16 = slot6
		slot11, slot12 = slot11(slot12, slot13, slot14, slot15, slot16)
		slot10 = slot12
		slot9 = slot11
	end

	slot10.delay = slot1
	slot11 = slot7
	slot12 = slot8
	slot13 = slot9
	slot14 = slot10

	return slot11, slot12, slot13, slot14
end

slot0.setIntensityWithTimer = slot2

function slot2(slot0, slot1, slot2, slot3, slot4)
	if slot0 == nil then
		slot5 = nil

		return slot5
	end

	slot5 = {}
	slot6 = "lighting"
	slot5.category = slot6

	if slot1 ~= nil then
		slot6 = slot1.groupDef

		if slot6 and (slot0 == "memorized1" or slot0 == "memorized2" or slot0 == "memorized3") then
			slot6 = "LUA_EXPRESSION"
			slot5.type = slot6
			slot6 = "local AuroraUtils = depends('aurora-utils'); return AuroraUtils.dimming(getStateValueGeneric('"
			slot7 = slot1.deviceURL
			slot8 = "', 'core', '"
			slot9 = slot0
			slot9 = slot9.memorizedPositionNamesMap
			slot9 = slot9[slot0]
			slot10 = "'))"
			slot6 = slot6 .. slot7 .. slot8 .. slot9 .. slot10
			slot7 = slot5

			return slot6, slot7
		end
	end

	if slot0 == "memorized1" then
		if slot2 == nil then
			slot0 = 50
		else
			slot0 = slot2
		end
	elseif slot0 == "memorized2" then
		if slot3 == nil then
			slot0 = 50
		else
			slot0 = slot3
		end
	elseif slot0 == "memorized3" then
		return slot0:dimming(), slot5
	end
end

slot0.setIntensityOrPosition = slot2

return slot0
