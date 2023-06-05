slot1 = depends("io-dynamic-actuator-controllables-utils")
slot2 = depends("io-utils")

return {
	DynamicControllablePrefix = "Dynamic",
	SensorTypesIdentification = "sensorTypesIdentification",
	EventingSystem = "eventingSystem",
	Empty = "empty",
	getActivatedControllablesList = function (slot0, slot1, slot2, slot3)
		slot4 = {}

		if slot1 == slot0.nodeClass.ACTUATOR and slot2[1] and string.find(slot2[1], slot1.DynamicControllablePrefix) then
			slot5 = slot2.getAttributeValue(slot3, slot1.SensorTypesIdentification)
			slot7 = false

			if slot2.getAttributeValue(slot3, slot1.EventingSystem) ~= nil then
				for slot11, slot12 in ipairs(slot6) do
					if slot12 == 8197 then
						slot7 = true

						break
					end
				end
			end

			for slot11, slot12 in pairs(slot2) do
				if string.find(slot12, slot1.DynamicControllablePrefix) or (slot7 and slot1.hasSensorTypeControllable(slot5, slot12)) then
					slot4[slot11] = slot12
				else
					slot4[slot11] = slot1.Empty
				end
			end

			return slot4
		end

		if slot1 == slot0.nodeClass.SENSOR and slot1.hasNoIgnoredDeviceType(slot0) then
			slot5 = {}

			for slot9, slot10 in pairs(slot3) do
				if string.find(slot9, "configuration%-") and not string.find(slot9, "configuration%-root") then
					table.insert(slot5, slot10.type)
				end
			end

			if #slot5 > 0 then
				for slot9, slot10 in pairs(slot2) do
					if slot1.hasSensorTypeControllable(slot5, slot10) then
						slot4[slot9] = slot10
					else
						slot4[slot9] = slot1.Empty
					end
				end

				return slot4
			end
		end

		return nil
	end,
	hasSensorTypeControllable = function (slot0, slot1)
		if slot0 then
			for slot5, slot6 in pairs(slot0) do
				if slot0.sensorTypesToControllable[slot6] == slot1 then
					return true
				end
			end
		end

		return false
	end,
	hasNoIgnoredDeviceType = function (slot0)
		if slot0 then
			for slot4, slot5 in ipairs(slot0.deviceTypesToIgnore) do
				if slot5 == slot0 then
					return false
				end
			end
		end

		return true
	end
}
