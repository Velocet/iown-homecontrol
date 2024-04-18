-- chunkname: @./gateway/io-fumix-utils.module

local IOFumixUtils = {}

IOFumixUtils.objectValueByteLength = 8
IOFumixUtils.maintenanceRequiredIdx = 7
IOFumixUtils.maintenanceRequiredRadioPartLowBatteryMask = 2
IOFumixUtils.maintenanceRequiredSensorPartLowBatteryMask = 4
IOFumixUtils.maintenanceRequiredSensorPartBatteryAbsenceMask = 8

function IOFumixUtils.maintenanceRadioPartBatteryConverter(rawValue)
	if rawValue ~= nil and #rawValue == IOFumixUtils.objectValueByteLength then
		local maintenanceRequiredDetails = rawValue[IOFumixUtils.maintenanceRequiredIdx]
		local maintenanceRadioPartBattery = "normal"

		if bit.band(maintenanceRequiredDetails, IOFumixUtils.maintenanceRequiredRadioPartLowBatteryMask) ~= 0 then
			maintenanceRadioPartBattery = "low"
		end

		return maintenanceRadioPartBattery
	else
		return nil
	end
end

function IOFumixUtils.maintenanceSensorPartBatteryConverter(rawValue)
	if rawValue ~= nil and #rawValue == IOFumixUtils.objectValueByteLength then
		local maintenanceRequiredDetails = rawValue[IOFumixUtils.maintenanceRequiredIdx]
		local maintenanceSensorPartBattery = "normal"

		if bit.band(maintenanceRequiredDetails, IOFumixUtils.maintenanceRequiredSensorPartLowBatteryMask) ~= 0 then
			maintenanceSensorPartBattery = "low"
		end

		if bit.band(maintenanceRequiredDetails, IOFumixUtils.maintenanceRequiredSensorPartBatteryAbsenceMask) ~= 0 then
			maintenanceSensorPartBattery = "absence"
		end

		return maintenanceSensorPartBattery
	else
		return nil
	end
end

return IOFumixUtils
