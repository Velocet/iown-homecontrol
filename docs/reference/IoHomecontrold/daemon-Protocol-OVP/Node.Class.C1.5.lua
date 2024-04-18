local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorStatus")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.factory")
local var_0_3 = {}

var_0_3.name = "PressureSensor"

function var_0_3.create(arg_1_0)
	if var_0_1.sensors.isEventDriven(arg_1_0) then
		var_0_2:create(var_0_0, arg_1_0)
	else
		var_0_2:create(var_0_0, arg_1_0, var_0_0.nonEventDrivenRefresh)
	end
end

return var_0_3
