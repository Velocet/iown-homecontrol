import("Overkiz.HomeAutomation.Protocol.RTD.Command")

local var_0_0 = {}
local var_0_1 = {
	__call = function(arg_1_0, arg_1_1)
		return {
			commands = arg_1_1,
			launch = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
				Command.manager:add(Command.originator, arg_2_1, arg_2_0.commands)
			end
		}
	end
}

setmetatable(var_0_0, var_0_1)

return var_0_0
