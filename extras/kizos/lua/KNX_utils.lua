function slot1(slot0, slot1)
	if #slot1 > 254 then
		error("Data length exceeds maximum of 254 bytes")
	end

	bytearray(2 + #slot1)[1] = bit.band(bit.rshift(slot0, 8), 3)
	bytearray(2 + #slot1)[2] = slot0

	for slot6 = 1, #slot1, 1 do
		slot2[slot6 + 2] = slot1[slot6]
	end

	return slot2
end

function slot2(slot0, slot1)
	slot2 = nil

	if (((slot1 == nil or #slot1 == 0) and 2) or #slot1 + 1) > 255 then
		error("APDU length exceeds maximum of 255 bytes")
	end

	bytearray(slot2)[1] = bit.band(bit.rshift(slot0, 8), 3)
	bytearray(slot2)[2] = slot0

	if slot1 ~= nil and #slot1 > 0 then
		if slot1[1] > 63 then
			error("Compact APDU cannot use more than 6 bits in the first byte")
		end

		slot3[2] = bit.bor(slot3[2], bit.band(slot1[1], 63))

		for slot7 = 2, #slot1, 1 do
			slot3[slot7 + 1] = slot1[slot7]
		end
	end

	return slot3
end

function slot3(slot0, slot1)
	if slot0 == nil and slot1 == nil then
		return 0
	elseif slot0 == nil then
		return slot1
	elseif slot1 == nil then
		return slot0
	else
		return slot0 + slot1
	end
end

return {
	APCIEnum = {
		["A_ADC_Read-PDU"] = 384,
		["A_IndividualAddress_Read-PDU"] = 256,
		["A_Memory_Response-PDU"] = 576,
		["A_Memory_Write-PDU"] = 640,
		["A_IndividualAddress_Write-PDU"] = 192,
		["A_GroupValue_Read-PDU"] = 0,
		["A_DeviceDescriptor_Response-PDU"] = 832,
		["A_Memory_Read-PDU"] = 512,
		["A_Restart-PDU"] = 896,
		["A_DeviceDescriptor_Read-PDU"] = 768,
		["A_GroupValue_Response-PDU"] = 64,
		["A_GroupValue_Write-PDU"] = 128,
		["A_IndividualAddress_Response-PDU"] = 320
	},
	createNPDU = function (slot0)
		bytearray(#slot0 + 1)[1] = #slot0 - 1

		for slot5 = 1, #slot0, 1 do
			slot1[slot5 + 1] = slot0[slot5]
		end

		return slot1
	end,
	READ_DD0_NPDU = bytearray({
		1,
		3,
		0
	}),
	GROUP_READ_NPDU = bytearray({
		1,
		0,
		0
	}),
	createGroupWriteNPDU = function (slot0, slot1)
		if slot0 == nil then
			return nil
		end

		if slot1 then
			return slot0.createNPDU(slot1(128, slot0))
		else
			return slot0.createNPDU(slot0.createNPDU(128, slot0))
		end
	end,
	getData = function (slot0)
		slot2 = nil

		if slot0[1] + 1 == 2 then
			bytearray(1)[1] = bit.band(slot0[3], 63)
		else
			slot2 = bytearray(slot1 - 2)

			for slot6 = 1, slot1 - 2, 1 do
				slot2[slot6] = slot0[slot6 + 3]
			end
		end

		return slot2
	end,
	extractNPDU = function (slot0)
		return {
			apci = bit.band(bit.bor(bit.lshift(slot0[2], 8), slot0[3]), 960),
			data = slot0:getData()
		}
	end,
	sumAllTariff = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
		return slot0(slot0, slot0(slot1, slot0(slot2, slot0(slot3, slot0(slot4, slot0(slot5, slot0(slot6, slot0(slot7, slot0(slot8, slot0(slot9, slot10))))))))))
	end
}
