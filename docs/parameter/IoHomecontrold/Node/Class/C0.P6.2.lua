local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasMemorizedPositionOnMP")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter14")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DefaultValueMin")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DefaultValueMax")
local var_0_5 = {}

var_0_5.name = "LightActuatorWithColourTemperatureHandling"

function var_0_5.create(arg_1_0, arg_1_1)
	var_0_2:create(var_0_3, arg_1_0)
	var_0_2:create(var_0_4, arg_1_0)
	var_0_2:create(var_0_0, arg_1_0)
	var_0_2:create(var_0_1, arg_1_0)
end

return var_0_5
