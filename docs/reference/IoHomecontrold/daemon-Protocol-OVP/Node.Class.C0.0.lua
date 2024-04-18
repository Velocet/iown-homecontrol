local var_0_0 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Kizotherm.PrivateKizoThermObjects")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Kizotherm.KizothermSubscribeEventGateway")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Kizotherm.PrivateKizoThermDebug")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Kizotherm.PrivateGatewayMd5Kizotherm")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Kizotherm.KizothermModeManagement")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.factory")
local var_0_6 = {}

var_0_6.name = "OverkizPrivateKizoTherm"

function var_0_6.create(arg_1_0)
	var_0_5:create(var_0_3, arg_1_0)
	var_0_5:create(var_0_1, arg_1_0)
	var_0_5:create(var_0_0, arg_1_0)
	var_0_5:create(var_0_2, arg_1_0)
	var_0_5:create(var_0_4, arg_1_0)
end

return var_0_6
