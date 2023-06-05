slot1 = {
	[254.0] = "root",
	[137.0] = "window",
	[130.0] = "sensor"
}

return {
	sensorTypesToControllable = {
		[6.0] = "io:SunEnergyActuatorSensor",
		[137.0] = "io:WindowStateSensor",
		[130.0] = "io:IntrusionSensor"
	},
	deviceTypesToIgnore = {
		2203334868994.0,
		1103823241218.0
	},
	controllableFeatures = {
		["io:DynamicRollerShutterIOComponent"] = {
			"closureSpeed",
			"batteryLevel",
			"batteryAutonomy"
		}
	},
	features = {
		closureSpeed = {
			commands = {
				"setClosureAndLinearSpeed",
				"setPositionAndLinearSpeed"
			},
			condition = function (slot0)
				return slot0(slot0, "parametersManagement") and type(slot1) == "number" and bit.band(slot1, 32768) ~= 0
			end
		},
		batteryLevel = {
			states = {
				"core:BatteryLevelState",
				"core:BatteryState"
			},
			condition = function (slot0)
				if type(slot0(slot0, "eventingSystem")) ~= "table" then
					return false
				end

				for slot5, slot6 in ipairs(slot1) do
					if slot6 == 8193 then
						return true
					end
				end

				return false
			end
		},
		batteryAutonomy = {
			states = {
				"core:BatteryAutonomyState"
			},
			condition = function (slot0)
				return slot0(slot0, "autonomy") and type(slot1) == "boolean"
			end
		}
	},
	getAttributeValue = function (slot0, slot1)
		if slot0["io:" .. slot1] ~= nil then
			return slot0["io:" .. slot1]
		else
			return slot0[slot1]
		end
	end,
	getAttributesFromRawNode = function (slot0)
		slot1 = {
			["io:generalinfo1"] = slot0.generalInfo1,
			["io:manufacturerid"] = slot0.manufacturer
		}

		if slot0.actuatorState then
			slot1["io:autonomy"] = slot0.actuatorState.autonomy
		end

		if slot0.actuatorCapacity then
			slot1["io:parametersManagement"] = slot0.actuatorCapacity.parametersManagement
			slot1["io:sensorTypesIdentification"] = slot0.actuatorCapacity.sensorTypesIdentification
			slot1["io:eventingSystem"] = slot0.actuatorCapacity.eventingSystem
		end

		if slot0.configuration then
			for slot5, slot6 in pairs(slot0.configuration) do
				if slot0[slot6.type] then
					slot1["configuration-" .. slot0[slot6.type]] = slot6
				end
			end
		end

		return slot1
	end,
	getAllControllablesNames = function (slot0)
		slot1 = {}

		for slot5, slot6 in pairs(slot0) do
			if slot6[1] then
				slot1[tonumber(slot5)] = slot6[1].controllable
			end
		end

		return slot1
	end
}
