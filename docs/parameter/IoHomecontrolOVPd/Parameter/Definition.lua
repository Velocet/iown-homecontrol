local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_1 = {}
local var_0_2 = {
	__call = function(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
		local var_1_0 = {
			id = arg_1_1
		}

		if arg_1_2 ~= nil and type(arg_1_2) == "boolean" then
			var_1_0.defaultAccess = arg_1_2
		else
			var_1_0.defaultAccess = var_0_0.access.READ
		end

		var_1_0.resync = arg_1_3

		return var_1_0
	end
}

setmetatable(var_0_1, var_0_2)

return var_0_1
