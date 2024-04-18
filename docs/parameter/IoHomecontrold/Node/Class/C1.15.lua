local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorSubscribeInfo")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.EnergyConsumptionObject")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.ElectricalContractObject")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.IndexConsumptionObject")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.ElectricalUsageObject")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.UsageConsumptionObject")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.RateInProgressDescriptionObject")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.ElectricalStateChangeObject")
local var_0_9 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.ConsumptionMeasurementMultiUsageGeneratorObject")
local var_0_10 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.GMDE.RelanceAutoriseeECS")
local var_0_11 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_12 = {}

var_0_12.name = "CumulatedElectricalEnergyConsumptionSensor"

function var_0_12.create(arg_1_0)
	if var_0_0.sensors.isEventDriven(arg_1_0) then
		var_0_11:create(var_0_1, arg_1_0)
	end

	if arg_1_0.manufacturer == var_0_0.manufacturers.Atlantic then
		var_0_11:create(var_0_3, arg_1_0)
		var_0_11:create(var_0_4, arg_1_0)
		var_0_11:create(var_0_5, arg_1_0)
		var_0_11:create(var_0_6, arg_1_0)
		var_0_11:create(var_0_7, arg_1_0)
		var_0_11:create(var_0_8, arg_1_0)
		var_0_11:create(var_0_9, arg_1_0)
		var_0_11:create(var_0_10, arg_1_0)
	else
		var_0_11:create(var_0_2, arg_1_0)
	end
end

return var_0_12
