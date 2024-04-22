local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")

return {
	write = function(arg_1_0, arg_1_1, arg_1_2)
		local var_1_0 = arg_1_0:match("(%d+)")
		local var_1_1, var_1_2 = arg_1_0:match("(%d+);(%d+)")
		local var_1_3 = "0"

		if var_1_0 and not var_1_2 then
			var_1_3 = var_1_0 % 2
		elseif var_1_0 and var_1_2 then
			var_1_3 = "3," .. tostring(var_1_0 / 100) .. "," .. tostring(var_1_2 / 100)
		else
			arg_1_2("Bad Parameter.")

			return
		end

		local function var_1_4(arg_2_0, arg_2_1)
			if arg_2_0 then
				arg_1_2(arg_2_1)
			else
				arg_1_1()
			end
		end

		var_0_0:send("#SLED=" .. var_1_3, var_1_4)
	end
}
