local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = 83902976
local var_0_3 = {
	info = {
		parameter = 5,
		value = {
			type = "ay",
			data = {
				0,
				66,
				0
			}
		}
	}
}
local var_0_4 = var_0_0(var_0_2, var_0_1.access.READ, var_0_3)

var_0_4.id = var_0_2

return var_0_4
