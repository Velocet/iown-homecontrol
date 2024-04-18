local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")

return {
	refresh = {
		startup = true,
		interval = var_0_0.Monotonic(var_0_0.Elapsed(60, 0))
	},
	read = function(arg_1_0, arg_1_1)
		local function var_1_0(arg_2_0, arg_2_1)
			if arg_2_0 then
				arg_1_1(arg_2_1)

				return
			end

			local var_2_0, var_2_1 = arg_2_1:match("+CBC: (%d+),(%d+)")
			local var_2_2 = tonumber(var_2_0)
			local var_2_3

			if var_2_2 == 0 then
				local var_2_4 = tonumber(var_2_1)

				var_2_3 = tostring(var_2_4) .. "%"
			else
				var_2_3 = var_2_2 == 1 and "on charger" or var_2_2 == 2 and "no battery" or var_2_2 == 3 and "power fault" or "unknown"
			end

			arg_1_0(var_2_3)
		end

		var_0_1:send("+CBC", var_1_0)
	end
}
