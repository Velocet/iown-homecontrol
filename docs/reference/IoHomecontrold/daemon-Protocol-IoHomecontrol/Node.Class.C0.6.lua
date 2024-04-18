local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasMemorizedPositionOnMP")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter1")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter9")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.Class.C0.P6")
local var_0_8 = {}

var_0_8.name = "LightActuator"

function var_0_8.create(arg_1_0)
	var_0_5:create(var_0_0, arg_1_0)
	var_0_5:create(var_0_1, arg_1_0)

	if arg_1_0.manufacturer == var_0_4.manufacturers.Somfy then
		var_0_6.createFactoryParameters(arg_1_0)
	end

	local var_1_0 = var_0_7[tostring(var_0_4.getSubProfile(arg_1_0))]

	if var_1_0 ~= nil then
		var_1_0.create(arg_1_0)

		if var_1_0.doNotInheritsFps then
			return
		end

		var_0_5:create(var_0_2, arg_1_0)
		var_0_5:create(var_0_3, arg_1_0)
	end
end

return var_0_8
