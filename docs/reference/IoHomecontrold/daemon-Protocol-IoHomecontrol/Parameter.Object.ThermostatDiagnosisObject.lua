local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.ThermostatSynchroObject")
local var_0_4 = require("bit")

local function var_0_5(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		FINISHED = 5,
		FULL_OPENED = 2,
		FULL_CLOSED = 3,
		PAIRING = 0,
		ADJUSTEMENT = 4,
		RESET = 1
	}

	if var_0_4.band(var_0_4.rshift(arg_1_1.data[1], 1), 15) == var_1_0.RESET then
		var_0_2:debug("[Somfy Thermostat] Time Synchro request")

		local var_1_1 = arg_1_2:lookupParameterById(var_0_3.id)

		if var_1_1 then
			var_1_1.refreshDef:refresh()
		else
			var_0_2:warning("[Somfy Thermostat] ThermostatSynchroObject not found")
		end
	end
end

local var_0_6 = {
	startup = true,
	info = {
		parameter = 5,
		priority = var_0_1.priority.HIGH,
		value = {
			type = "ay",
			data = {
				2,
				166,
				34
			}
		}
	},
	refreshTriggers = var_0_5
}

return (var_0_0(84059682, var_0_1.access.READ, var_0_6))
