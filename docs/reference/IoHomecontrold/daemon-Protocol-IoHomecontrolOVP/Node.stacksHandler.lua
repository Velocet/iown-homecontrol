local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.daemon")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")

return {
	_nodeManagers = {},
	register = function(arg_1_0, arg_1_1, arg_1_2)
		arg_1_0._nodeManagers[arg_1_1] = arg_1_2
	end,
	getAvailableBackboneAddress = function(arg_2_0)
		local var_2_0 = var_0_1.unusedBackboneAddress

		for iter_2_0, iter_2_1 in pairs(arg_2_0._nodeManagers or {}) do
			var_2_0 = iter_2_1:getAvailableBackboneAddress()

			if var_2_0 ~= var_0_1.unusedBackboneAddress then
				break
			end
		end

		return var_2_0
	end,
	stackCreated = function(arg_3_0)
		local var_3_0 = 0

		for iter_3_0, iter_3_1 in pairs(arg_3_0._nodeManagers) do
			var_3_0 = var_3_0 + iter_3_1:getNumberOfStacks()
		end

		if var_3_0 == 1 then
			var_0_0:getDaughterBoardManager():hardReset("First stack node created", false)
		end
	end
}
