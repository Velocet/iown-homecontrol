slot0 = depends("common_utils")
slot1 = depends("zigbee-utils")

return {
	extractSpecificClusters = function (slot0)
		slot1 = {}

		for slot5, slot6 in pairs(slot0) do
			slot12 = 0

			if slot1.extractZCL(slot10, tonumber(tostring(slot0.split(slot7, "[%d]+")[1]))).header.manufacturerId ~= nil then
				slot12 = slot11.header.manufacturerId
			end

			if slot1[slot9] == nil then
				slot1[slot9] = {}
			end

			if slot1[slot9][slot12] == nil then
				slot1[slot9][slot12] = {}
			end

			if slot11.payload ~= overkiz.magic.IGNORE then
				for slot16, slot17 in pairs(slot11.payload) do
					slot1[slot9][slot12][slot16] = slot17
				end
			end
		end

		return slot1
	end
}
