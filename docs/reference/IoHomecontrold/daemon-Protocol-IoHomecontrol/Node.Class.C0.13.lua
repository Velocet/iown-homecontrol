local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter1")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter2")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_4 = {}

var_0_4.name = "DualRollingShutter"

function var_0_4.create(arg_1_0)
	var_0_3:create(var_0_0, arg_1_0)
	var_0_3:create(var_0_1, arg_1_0)
	var_0_3:create(var_0_2, arg_1_0)
end

return var_0_4
