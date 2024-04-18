local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.timeUtils")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.PassAPC.RefreshUtils")
local var_0_4 = require("Overkiz.utilities")
local var_0_5 = {
	startup = true,
	oncommand = true,
	onRecurrence = var_0_0.recurrent.oncePerDayRandom,
	info = {
		parameter = 202116097,
		value = {
			type = "ay",
			data = var_0_3:buildDataWithContiniousRemapping(136, 2, 2)
		}
	}
}
local var_0_6 = var_0_1(202113160, var_0_2.access.READ, var_0_5)

var_0_6.eightZonesRefresh = var_0_4.tableDeepCopy(var_0_5)
var_0_6.eightZonesRefresh.info.value.data = var_0_3:buildDataWithContiniousRemapping(136, 8, 2)

return var_0_6
