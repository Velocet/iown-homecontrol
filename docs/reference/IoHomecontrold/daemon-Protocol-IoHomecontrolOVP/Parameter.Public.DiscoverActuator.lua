local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = {
	info = {
		value = {
			data = 1,
			type = "y"
		}
	}
}
local var_0_3 = var_0_0(2146566149, var_0_1.access.WRITE, var_0_2)

var_0_3.name = "DiscoverActuator"

return var_0_3
