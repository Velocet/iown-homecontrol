return {
	cutGarbageAfterFirstZero = function (slot0)
		for slot4 = 1, #slot0, 1 do
			if slot0[slot4] == 0 then
				slot0 = slot0:sub(1, slot4 - 1)

				break
			end
		end

		return slot0
	end,
	filterIso8859Dash1InvalidChars = function (slot0)
		for slot4 = 1, #slot0, 1 do
			if slot0[slot4] < 32 or (slot0[slot4] >= 127 and slot0[slot4] <= 159) then
				slot0[slot4] = 63
			end
		end
	end,
	extractBitRange = function (slot0, slot1, slot2)
		if slot2 > 8 then
			error("Unsupported bitSize : " .. slot2)
		end

		if slot0 == nil or slot1 >= #slot0 * 8 or slot2 == 0 then
			return 0
		end

		slot6 = bit.rshift(bit.band(slot6, 255), slot1 % 8)

		if slot1 % 8 + math.min(#slot0 * 8 - slot1, slot2) <= 8 then
			return bit.rshift(bit.band(slot6, 255), 8 - (slot5 + slot3))
		else
			return bit.bor(bit.rshift(bit.band(slot0[slot4 + 1], 255), 16 - (slot5 + slot3)), bit.lshift(bit.band(slot6, 255), (slot5 + slot3) - 8))
		end
	end,
	writeBitRange = function (slot0, slot1, slot2, slot3)
		if slot2 > 8 then
			error("Unsupported bitSize : " .. slot2)
		end

		if slot0 == nil or slot1 >= #slot0 * 8 or slot2 <= 0 then
			return
		end

		if slot1 % 8 + math.min(#slot0 * 8 - slot1, slot2) <= 8 then
			slot0[math.floor(slot1 / 8) + 1] = bit.bor(bit.band(slot0[math.floor(slot1 / 8) + 1], bit.bnot(bit.lshift(bit.lshift(1, slot4) - 1, 8 - (slot5 + slot4)))), bit.lshift(slot7, 8 - (slot5 + slot4)))
		else
			writeBitRange(slot0, slot1, 8 - slot5, bit.rshift(slot3, (slot5 + slot4) - 8))
			writeBitRange(slot0, (slot1 + 8) - slot5, (slot5 + slot4) - 8, slot3)
		end
	end,
	setBit = function (slot0, slot1, slot2)
		if slot1 >= #slot0 * 8 then
			return
		end

		slot0[slot3] = (slot2 <= 0 or bit.bor(slot0[math.floor(slot1 / 8) + 1], bit.lshift(1, 7 - slot1 % 8))) and bit.band(slot0[math.floor(slot1 / 8) + 1], bit.bnot(bit.lshift(1, 7 - slot1 % 8)))
	end
}
