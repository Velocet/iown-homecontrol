local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.timeUtils")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3 = {
	startup = true,
	interval = var_0_0.hoursInterval(1),
	info = {
		parameter = 202116097,
		value = {
			type = "ay",
			data = {
				0,
				35
			}
		}
	}
}

return (var_0_1(202113059, var_0_2.access.READ, var_0_3))
