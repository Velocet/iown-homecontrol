slot1 = depends("io-dynamic-actuator-controllables-utils")
slot2 = depends("common_utils")

return {
	getFilteredDefinitionElements = function (slot0, slot1)
		slot2 = {
			states = {},
			commands = {}
		}

		if not slot0.controllableFeatures[slot0] then
			return slot2
		end

		for slot7, slot8 in pairs(slot3) do
			if slot0.features[slot8] and not slot9.condition(slot1) then
				slot1.appendList(slot9.states, slot2.states)
				slot1.appendList(slot9.commands, slot2.commands)
			end
		end

		return slot2
	end,
	getFeatures = function (slot0, slot1, slot2, slot3)
		if not slot0.controllableFeatures[slot0] then
			return nil
		end

		slot5 = {
			parametersManagement = slot1,
			eventingSystem = slot2,
			autonomy = slot3
		}
		slot6 = {}

		for slot10, slot11 in pairs(slot4) do
			if slot0.features[slot11] and slot12.condition(slot5) then
				table.insert(slot6, slot11)
			end
		end

		return slot6
	end
}
