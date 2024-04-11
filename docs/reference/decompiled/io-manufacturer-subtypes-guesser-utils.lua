slot0 = {
	manufacturerSubType = depends("io-somfy-manufacturer-subtypes-utils").getManufacturerSubTypes()
}

for slot6, slot7 in ipairs(depends("io-manufacturer-subtypes-utils").getManufacturerSubTypes()) do
	slot0.manufacturerSubType[#slot0.manufacturerSubType + 1] = slot7
end

slot0.guessManufacturerSubType = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot6 == nil then
		slot6 = {}
	end

	slot7 = slot0:getSoftwareVersion(slot1, slot2, slot3, slot4, slot5)

	for slot11, slot12 in ipairs(slot0.manufacturerSubType) do
		if slot12.class == slot0 and slot12.profile == slot1 and slot12.subProfile == slot2 and slot12.manufacturer == slot3 and slot0.compareSoftwareVersion(slot12.softwareVersion, slot7) and (slot12.additionalConstraint == nil or slot12.additionalConstraint(slot7, slot6)) then
			return slot12.manufacturerSubType
		end
	end

	return 0
end

slot0.getSoftwareVersion = function (slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0 == 0 and (slot1 == 52 or slot1 == 22) and slot2 == 1 and slot3 == 12 then
		return slot0.extractSoftVersionFromGeneralInfo(slot5)
	end

	return slot0.extractSoftVersionFromGeneralInfo(slot4)
end

slot0.extractSoftVersionFromGeneralInfo = function (slot0)
	return bytearray(slot0, "base64"):sub(1, 10)
end

slot0.compareSoftwareVersion = function (slot0, slot1)
	if #slot0 ~= #slot1 then
		return false
	end

	for slot5 = 1, #slot0, 1 do
		if slot1[slot5] ~= slot0[slot5] and slot0[slot5] ~= 63 then
			return false
		end
	end

	return true
end

slot0.lookupAdditionalCandidate = function (slot0, slot1, slot2, slot3, slot4, slot5)
	for slot11 = 1, #depends(slot0).getManufacturerSubTypes(), 1 do
		if slot7[slot11].class == slot1 and slot7[slot11].profile == slot2 and slot7[slot11].subProfile == slot3 and slot7[slot11].manufacturer == slot4 and slot7[slot11].manufacturerSubType == slot5 and slot7[slot11].additionalConstraint ~= nil then
			return slot7[slot11].additionalConstraint
		end
	end

	return function (slot0, slot1)
		return false
	end
end

return slot0
