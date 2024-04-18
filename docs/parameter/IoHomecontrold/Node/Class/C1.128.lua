local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorName")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorStatus")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorDefect")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorListeningPeriod")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Object.SensorInternalTriggerDetailedStatusObject")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_6 = {}

var_0_6.name = "SmokeSensor"

function var_0_6.create(arg_1_0, arg_1_1)
	var_0_5:create(var_0_0, arg_1_0)
	var_0_5:create(var_0_1, arg_1_0)
	var_0_5:create(var_0_2, arg_1_0, var_0_2.refreshWithMaintenanceDetails)
	var_0_5:create(var_0_4, arg_1_0)
	var_0_5:create(var_0_3, arg_1_0)
end

return var_0_6
