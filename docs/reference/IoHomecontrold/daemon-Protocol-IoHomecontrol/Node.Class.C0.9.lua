local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.Class.C0.P9")
local var_0_4 = {}

var_0_4.name = "DoorLock"
var_0_4.withUnknownPositionSoftVersion = {
	string.byte("5"),
	string.byte("1"),
	string.byte("1"),
	string.byte("7"),
	string.byte("8"),
	string.byte("3"),
	string.byte("4")
}

function var_0_4.create(arg_1_0)
	var_0_2:create(var_0_0, arg_1_0)

	local var_1_0 = var_0_3[tostring(var_0_1.getSubProfile(arg_1_0))]

	if var_1_0 ~= nil then
		var_1_0.create(arg_1_0)
	end
end

return var_0_4
