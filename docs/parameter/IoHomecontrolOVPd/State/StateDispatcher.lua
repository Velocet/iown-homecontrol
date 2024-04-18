local var_0_0 = require("Overkiz.HomeAutomation.Trigger.Proxy.DevicesProxy")
local var_0_1 = require("Overkiz.utilities")
local var_0_2 = {}
local var_0_3 = {}

function var_0_2.__call(arg_1_0, arg_1_1)
	local var_1_0 = var_0_0()

	function var_1_0.newStates(arg_2_0, arg_2_1, arg_2_2)
		for iter_2_0, iter_2_1 in ipairs(arg_2_2) do
			local var_2_0 = var_0_1.stringSimpleSplit(iter_2_1.name, ":")

			arg_2_0:updateGeneric(arg_2_1, var_2_0[1], var_2_0[2], iter_2_1.value)
		end
	end

	return var_1_0
end

setmetatable(var_0_3, var_0_2)

return var_0_3
