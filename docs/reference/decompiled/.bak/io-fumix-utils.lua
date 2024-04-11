return {
	objectValueByteLength = 8,
	maintenanceRequiredIdx = 7,
	maintenanceRequiredRadioPartLowBatteryMask = 2,
	maintenanceRequiredSensorPartLowBatteryMask = 4,
	maintenanceRequiredSensorPartBatteryAbsenceMask = 8,
	maintenanceRadioPartBatteryConverter = function (slot0)
		if slot0 ~= nil and #slot0 == slot0.objectValueByteLength then
			slot2 = "normal"

			if bit.band(slot0[slot0.maintenanceRequiredIdx], slot0.maintenanceRequiredRadioPartLowBatteryMask) ~= 0 then
				slot2 = "low"
			end

			return slot2
		else
			return nil
		end
	end,
	maintenanceSensorPartBatteryConverter = function (slot0)
		if slot0 ~= nil and #slot0 == slot0.objectValueByteLength then
			slot2 = "normal"

			if bit.band(slot0[slot0.maintenanceRequiredIdx], slot0.maintenanceRequiredSensorPartLowBatteryMask) ~= 0 then
				slot2 = "low"
			end

			if bit.band(slot1, slot0.maintenanceRequiredSensorPartBatteryAbsenceMask) ~= 0 then
				slot2 = "absence"
			end

			return slot2
		else
			return nil
		end
	end
}
