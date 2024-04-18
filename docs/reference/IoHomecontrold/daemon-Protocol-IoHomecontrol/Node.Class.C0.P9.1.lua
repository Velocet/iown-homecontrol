local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter1")
local var_0_2 = {}

var_0_2.name = "WindowLock"

function var_0_2.create(arg_1_0)
	var_0_0:create(var_0_1, arg_1_0)
end

function var_0_2.delete(arg_2_0)
	var_0_0:delete(var_0_1, arg_2_0)
end

return var_0_2
