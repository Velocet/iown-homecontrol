local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.Actions.Action")
local var_0_1 = {}
local var_0_2 = {}

function var_0_1.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6)
	local var_1_0 = var_0_0("resetSetup", arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6)

	function var_1_0.launch(arg_2_0)
		local var_2_0 = arg_1_2:getStackMaster()

		if var_2_0 ~= nil then
			arg_1_2:deleteNodesByParentAddress(var_2_0.address)

			local var_2_1 = arg_1_2:generateStackKey()

			arg_1_2:changeStackNodeKey(var_2_0.address, var_2_1)
			var_1_0.resyncModule:update()
		else
			arg_1_6:debug("UI Reset Setup: no existing stack node")
		end

		arg_1_4:actionEnd(true)
	end

	return var_1_0
end

setmetatable(var_0_2, var_0_1)

return var_0_2
