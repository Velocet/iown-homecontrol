local var_0_0 = require("Overkiz.OOP.Class")()

function var_0_0.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	function arg_1_1.keepAlive(arg_2_0, arg_2_1)
		if arg_1_2 and arg_1_2:isRunning() then
			arg_1_2:ping()
		end

		return true
	end
end

return var_0_0
