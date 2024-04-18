local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter13")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.SofopuObject")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.OneWayPairingObject")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.timeUtils")
local var_0_6 = require("Overkiz.utilities")
local var_0_7 = {}

var_0_7.name = "MicroModuleOnOff"

function var_0_7.create(arg_1_0)
	var_0_0:create(var_0_1, arg_1_0)

	local var_1_0 = {
		("5"):byte(),
		("1"):byte(),
		("4"):byte(),
		("1"):byte(),
		("9"):byte(),
		("4"):byte(),
		("1"):byte()
	}
	local var_1_1 = var_0_6.tableExtract(arg_1_0.generalinfo[1], 1, 7)

	if var_0_6.tableCompare(var_1_1, var_1_0) and arg_1_0.manufacturer == var_0_2.manufacturers.Somfy then
		local var_1_2 = var_0_6.tableDeepCopy(var_0_3.refresh)

		var_1_2.startup = true
		var_1_2.interval = var_0_5.hoursInterval(1)
		var_1_2.oncommand = true

		var_0_0:create(var_0_3, arg_1_0, var_1_2)
		var_0_0:create(var_0_4, arg_1_0, nil)
	end
end

return var_0_7
