local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")

return {
	refresh = {
		startup = true
	},
	read = function(arg_1_0, arg_1_1)
		arg_1_0(tostring(var_0_0.current))
	end,
	write = function(arg_2_0, arg_2_1, arg_2_2)
		if var_0_0:createOrUpdate(arg_2_0) then
			arg_2_1(tostring(var_0_0.current))
		else
			arg_2_2("Unknown UI name")
		end
	end
}
