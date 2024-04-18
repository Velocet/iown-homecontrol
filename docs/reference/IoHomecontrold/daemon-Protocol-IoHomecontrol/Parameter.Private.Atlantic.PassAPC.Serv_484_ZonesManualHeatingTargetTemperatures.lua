local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.PassAPC.RefreshUtils")
local var_0_3 = {
	startup = true,
	oncommand = true,
	info = {
		parameter = 202116097,
		value = {
			type = "ay",
			data = var_0_2:buildDataWithContiniousRemapping(484, 8, 2)
		}
	}
}

return (var_0_0(202113508, var_0_1.access.READ, var_0_3))
