local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.timeUtils")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Manager.mpFpModel")
local var_0_4 = require("Overkiz.utilities")
local var_0_5 = {
	onRefreshNode = true,
	startup = true,
	oncommand = true,
	supportMpFp = true,
	interval = var_0_0.hoursInterval(1)
}
local var_0_6 = var_0_4.tableDeepCopy(var_0_5)

var_0_6.info = {
	parameter = 65553,
	value = {
		type = "y",
		data = var_0_3.extendedInformationType.CURRENT_USING_DISCRETE_VALUE
	}
}

local var_0_7 = var_0_1(65553, var_0_2.access.READ, var_0_5)

var_0_7.discreteRefresh = var_0_6

return var_0_7
