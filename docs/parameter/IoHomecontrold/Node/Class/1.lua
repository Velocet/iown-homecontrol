local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.Class.C1")
local var_0_2 = {}

var_0_2.name = "RemoteSensor"

function var_0_2.create(arg_1_0)
	local var_1_0 = var_0_1[tostring(var_0_0.getProfile(arg_1_0))]

	if var_1_0 ~= nil then
		var_1_0.create(arg_1_0)
	end
end

return var_0_2
