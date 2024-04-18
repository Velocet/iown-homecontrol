local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = {
	startup = true,
	oncommand = true,
	info = {
		parameter = 1878000903,
		value = {
			type = "ay",
			data = {
				0,
				0
			}
		}
	}
}

return (var_0_0(1878000903, var_0_1.access.WRITE, var_0_2))
