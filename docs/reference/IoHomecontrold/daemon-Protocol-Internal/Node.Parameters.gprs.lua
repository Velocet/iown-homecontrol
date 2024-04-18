local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.log")

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

			local var_2_0, var_2_1 = arg_2_1:match("+CGREG: (%d+),(%d+)")
			local var_2_2 = tonumber(var_2_0)
			local var_2_3 = tonumber(var_2_1)
			local var_2_4 = "disabled"
			local var_2_5 = false

			if var_2_2 == 0 then
				if var_2_3 == 0 then
					var_2_4 = "not registered"
				elseif var_2_3 == 1 then
					var_2_4 = "registered"
					var_2_5 = true
				elseif var_2_3 == 2 then
					var_2_4 = "not registered, searching for gsm"
				elseif var_2_3 == 3 then
					var_2_4 = "registration denied"
				elseif var_2_3 == 4 then
					var_2_4 = "unknown"
				elseif var_2_3 == 5 then
					var_2_4 = "registered, roaming"
					var_2_5 = true
				end
			end

			arg_1_0(tostring(var_2_5))
			var_0_2:info("gprs registration: " .. var_2_4)
		end

		var_0_1:send("+CGREG?", var_1_0)
	end
}
