local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.Name")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.SubscribeEvent")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.GatewayMd5")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.SerialNumber")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Cotherm.GetRTC")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Object.CothermController.DumpMemory")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Object.CothermController.DebugFlash")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.factory")
local var_0_8 = {}

var_0_8.name = "CothermThermostat"

function var_0_8.create(arg_1_0)
	var_0_7:create(var_0_2, arg_1_0)
	var_0_7:create(var_0_3, arg_1_0)
	var_0_7:create(var_0_0, arg_1_0)
	var_0_7:create(var_0_1, arg_1_0)
	var_0_7:create(var_0_5, arg_1_0)
	var_0_7:create(var_0_6, arg_1_0)
	var_0_7:create(var_0_4, arg_1_0)
end

return var_0_8
