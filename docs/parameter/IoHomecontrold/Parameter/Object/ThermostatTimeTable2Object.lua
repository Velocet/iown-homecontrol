local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = {
	startup = true,
	info = {
		parameter = 5,
		priority = var_0_1.priority.HIGH,
		value = {
			type = "ay",
			data = {
				2,
				166,
				39
			}
		}
	}
}

return (var_0_0(84059687, var_0_1.access.READ, var_0_2))
