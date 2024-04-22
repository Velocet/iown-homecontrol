local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")

return {
	write = function(arg_1_0, arg_1_1, arg_1_2)
		var_0_0:setEvent(arg_1_0)
		arg_1_1()
	end
}
