local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.timeUtils")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3 = {
	onRecurrence = var_0_0.recurrent.oncePerDayRandom,
	info = {
		parameter = 202116097,
		value = {
			type = "ay",
			data = {
				1,
				102
			}
		}
	}
}

return (var_0_1(202113382, var_0_2.access.READ, var_0_3))
