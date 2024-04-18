local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.timeUtils")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3

var_0_3.nonEventDrivenRefresh, var_0_3 = {
	startup = true,
	oncommand = true,
	interval = var_0_0.hoursInterval(1)
}, var_0_1(2415919106, var_0_2.access.READ)

return var_0_3
