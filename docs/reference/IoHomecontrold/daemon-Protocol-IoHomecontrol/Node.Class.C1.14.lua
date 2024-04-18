local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorSubscribeInfo")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.EnergyConsumptionObject")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_4 = {}

var_0_4.name = "CumulatedThermalEnergyConsumptionSensor"

function var_0_4.create(arg_1_0)
	if var_0_1.sensors.isEventDriven(arg_1_0) then
		var_0_3:create(var_0_0, arg_1_0)
	end

	var_0_3:create(var_0_2, arg_1_0)
end

return var_0_4
