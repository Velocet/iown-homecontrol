local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = {
	startup = true,
	oncommand = true,
	info = {
		parameter = 186712065,
		value = {
			data = 0,
			type = "u"
		}
	}
}

return (var_0_0(186712065, var_0_1.access.WRITE, var_0_2))
