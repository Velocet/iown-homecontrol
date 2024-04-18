local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.PassAPC.RefreshUtils")
local var_0_3 = require("Overkiz.utilities")
local var_0_4 = {
	startup = true,
	oncommand = true,
	info = {
		parameter = 202116097,
		value = {
			type = "ay",
			data = var_0_2:buildDataWithContiniousRemapping(422, 2, 12)
		}
	}
}
local var_0_5 = var_0_0(202113446, var_0_1.access.READ, var_0_4)

var_0_5.eightZonesRefresh = var_0_3.tableDeepCopy(var_0_4)
var_0_5.eightZonesRefresh.info.value.data = var_0_2:buildDataWithContiniousRemapping(422, 8, 12)

return var_0_5
