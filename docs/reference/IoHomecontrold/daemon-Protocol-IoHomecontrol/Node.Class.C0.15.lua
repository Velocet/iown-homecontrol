local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.Class.C0.P15")
local var_0_5 = {}

var_0_5.name = "SwitchOnOff"

function var_0_5.create(arg_1_0)
	var_0_2:create(var_0_0, arg_1_0)

	local var_1_0 = var_0_4[tostring(var_0_1.getSubProfile(arg_1_0))]

	if var_1_0 ~= nil then
		var_1_0.create(arg_1_0)
	end

	if arg_1_0.manufacturer == var_0_1.manufacturers.Somfy then
		var_0_3.createFactoryParameters(arg_1_0)
	end
end

return var_0_5
