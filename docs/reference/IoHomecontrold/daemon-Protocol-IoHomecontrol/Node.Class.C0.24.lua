local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.PriorityLock")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasMemorizedPositionOnMP")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasSecuredPositionOnMP")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter1")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_6 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_7 = {}

var_0_7.name = "SwingingShutter"

function var_0_7.create(arg_1_0)
	var_0_5:create(var_0_0, arg_1_0)
	var_0_5:create(var_0_1, arg_1_0)
	var_0_5:create(var_0_2, arg_1_0)
	var_0_5:create(var_0_3, arg_1_0)

	if arg_1_0.manufacturer ~= var_0_6.manufacturers.Somfy then
		var_0_5:create(var_0_4, arg_1_0)
	end
end

return var_0_7
