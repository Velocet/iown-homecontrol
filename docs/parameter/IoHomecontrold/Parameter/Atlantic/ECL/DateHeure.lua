local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.timeUtils")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.DynamicValue")
local var_0_4 = {
	startup = true,
	onRecurrence = var_0_1.recurrent.oncePerDayRandom,
	isRefreshable = var_0_1.isTimeUptodate,
	info = {
		getDynamicValue = var_0_3.getTime
	}
}

return (var_0_0(201395969, var_0_2.access.WRITE, var_0_4))
