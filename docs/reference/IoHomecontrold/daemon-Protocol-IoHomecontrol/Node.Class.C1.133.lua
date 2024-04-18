local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorName")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorSubscribeInfo")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorStatus")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorDefect")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_5 = {}

var_0_5.name = "GenericClosureSensor"

function var_0_5.create(arg_1_0, arg_1_1)
	var_0_4:create(var_0_0, arg_1_0)
	var_0_4:create(var_0_1, arg_1_0)
	var_0_4:create(var_0_2, arg_1_0)
	var_0_4:create(var_0_3, arg_1_0)
end

return var_0_5
