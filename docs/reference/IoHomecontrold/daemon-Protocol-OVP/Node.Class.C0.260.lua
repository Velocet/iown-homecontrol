local var_0_0 = require("bit")
local var_0_1 = {}

var_0_1.name = "CothermGenericGateway"

function var_0_1.getHandler(arg_1_0)
	local var_1_0 = var_0_0.band(var_0_0.rshift(arg_1_0.type, 6), 1023)
	local var_1_1 = var_0_0.band(arg_1_0.type, 63)
	local var_1_2 = require("Overkiz.HomeAutomation.Protocol.OVP.Node.Class.C" .. tostring(arg_1_0.class) .. ".P" .. tostring(var_1_0))

	if var_1_2 ~= nil then
		var_1_2 = var_1_2[tostring(var_1_1)]
	end

	return var_1_2
end

function var_0_1.create(arg_2_0)
	local var_2_0
	local var_2_1 = var_0_1.getHandler(arg_2_0)

	if var_2_1 ~= nil then
		var_2_1.create(arg_2_0)
	end
end

return var_0_1
