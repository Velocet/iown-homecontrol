local var_0_0 = {}
local var_0_1 = {}

function var_0_0.__call(arg_1_0, arg_1_1)
	local var_1_0 = {
		parameters = {},
		hooks = {}
	}
	local var_1_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.wifiMode")
	local var_1_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.wifiTargetInfraConfig")
	local var_1_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.wifiCurrentInfraConfig")
	local var_1_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.wifiSignalStrength")
	local var_1_5 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.wifiCredentials")
	local var_1_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.Parameter")

	var_1_0.parameters.mode = var_1_6(var_1_1)
	var_1_0.parameters.targetInfraConfig = var_1_6(var_1_2)
	var_1_0.parameters.currentInfraConfig = var_1_6(var_1_3)
	var_1_0.parameters.signalStrength = var_1_6(var_1_4)
	var_1_0.parameters.credentials = var_1_6(var_1_5)

	return var_1_0
end

setmetatable(var_0_1, var_0_0)

return var_0_1
