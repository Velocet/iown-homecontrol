local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")

return {
	refresh = {
		startup = true,
		interval = var_0_0.Monotonic(var_0_0.Elapsed(600, 0))
	},
	read = function(arg_1_0, arg_1_1)
		local function var_1_0(arg_2_0, arg_2_1)
			if arg_2_0 then
				arg_1_1(arg_2_1)

				return
			end

			local var_2_0, var_2_1, var_2_2 = arg_2_1:match("+COPS: (%d),(%d),\"(.+)\"")

			var_2_2 = var_2_2 or "Unknown"

			arg_1_0(var_2_2)
		end

		var_0_1:send("+COPS?", var_1_0)
	end
}
