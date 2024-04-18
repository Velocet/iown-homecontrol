local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.timeUtils")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_4 = {
	startup = true,
	oncommand = true,
	interval = var_0_0.hoursInterval(1),
	info = {
		parameter = 5,
		value = {
			type = "ay",
			data = {
				var_0_3.manufacturers.Somfy,
				166,
				3
			}
		}
	}
}

return (var_0_1(84059651, var_0_2.access.READ, var_0_4))
