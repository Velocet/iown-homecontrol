local var_0_0 = require("bit")
local var_0_1 = {}

var_0_1.name = "HeatPump"

function var_0_1.getHandler(arg_1_0)
	local var_1_0

	if arg_1_0.manufacturer == 11 then
		local var_1_1 = tostring(arg_1_0.generalinfo[1][13]) .. tostring(arg_1_0.generalinfo[1][14])
		local var_1_2 = var_0_0.rshift(arg_1_0.type, 6)

		var_1_0 = require("Overkiz.HomeAutomation.Protocol.OVP.Node.Class.C" .. tostring(arg_1_0.class) .. ".P" .. tostring(var_1_2) .. "." .. tostring(var_1_1))
	else
		var_1_0 = require("Overkiz.HomeAutomation.Protocol.OVP.Node.Class.C" .. tostring(arg_1_0.class) .. ".P" .. tostring(arg_1_0.type) .. ".0")
	end

	return var_1_0
end

function var_0_1.create(arg_2_0)
	local var_2_0 = var_0_1.getHandler(arg_2_0)

	if var_2_0 ~= nil then
		var_2_0.create(arg_2_0)
	end
end

return var_0_1
