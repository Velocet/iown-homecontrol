local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.Name")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.factory")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.OVP.Node.Class.C0")
local var_0_5 = {}

var_0_5.name = "RemoteActuator"

function var_0_5.create(arg_1_0)
	var_0_3:create(var_0_0, arg_1_0)

	local var_1_0 = var_0_4[tostring(var_0_2.getProfile(arg_1_0))]

	if var_1_0 ~= nil then
		var_1_0.create(arg_1_0)
	else
		var_0_3:create(var_0_1, arg_1_0)
	end
end

return var_0_5
