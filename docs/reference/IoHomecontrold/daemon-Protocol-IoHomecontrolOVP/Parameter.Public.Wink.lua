local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = {
	info = {
		value = {
			type = "ay",
			data = {
				1,
				2
			}
		}
	}
}

return (var_0_0(4, var_0_1.access.WRITE, var_0_2))
