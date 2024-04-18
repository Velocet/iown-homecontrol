local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.Class.C0.P27")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasMemorizedPositionOnMP")
local var_0_6 = {}

var_0_6.name = "SlidingWindow"

function var_0_6.create(arg_1_0)
	local var_1_0 = var_0_4[tostring(var_0_2.getSubProfile(arg_1_0))]

	if var_1_0 ~= nil then
		var_1_0.create(arg_1_0)
	end

	var_0_3:createIfParameterDoesNotExist(var_0_0, arg_1_0)
	var_0_3:create(var_0_5, arg_1_0)

	if arg_1_0.manufacturer == var_0_2.manufacturers.Somfy then
		var_0_1.createFactoryParameters(arg_1_0)
	end
end

return var_0_6
