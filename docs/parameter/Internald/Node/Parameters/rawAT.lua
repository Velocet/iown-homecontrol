local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")

return {
	write = function(arg_1_0, arg_1_1, arg_1_2)
		local function var_1_0(arg_2_0, arg_2_1)
			if arg_2_0 then
				arg_1_2(arg_2_1)

				return
			else
				arg_1_1(arg_2_1)
			end
		end

		var_0_0:send(arg_1_0, var_1_0)
	end
}
