local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("tableshape").types
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.daemon"):getDaughterBoardManager()
local var_0_3 = var_0_0()
local var_0_4 = var_0_1.shape({
	syncId = var_0_1.string
})

function var_0_3.new(arg_1_0, arg_1_1, arg_1_2)
	function arg_1_1.hardReset(arg_2_0, arg_2_1)
		local var_2_0, var_2_1 = var_0_4:check_value(arg_2_0)

		if not var_2_0 then
			arg_1_2:error("hardReset malformed : " .. var_2_1)

			return false, var_2_1
		end

		arg_1_2:info("Adding hardReset")
		var_0_2:hardReset("Hard reset by server call", false)

		return true
	end
end

return var_0_3
