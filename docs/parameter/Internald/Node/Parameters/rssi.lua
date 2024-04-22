local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")

return {
	refresh = {
		startup = true,
		interval = var_0_0.Monotonic(var_0_0.Elapsed(900, 0))
	},
	read = function(arg_1_0, arg_1_1)
		local function var_1_0(arg_2_0, arg_2_1)
			if arg_2_0 then
				arg_1_1(arg_2_1)

				return
			end

			local var_2_0, var_2_1 = arg_2_1:match("+CSQ: (%d+),(%d+)")

			if not var_2_0 or not var_2_1 then
				arg_1_1("invalid csq result.")

				return
			end

			local var_2_2 = tonumber(var_2_0)
			local var_2_3

			if var_2_2 == 0 then
				var_2_3 = "-113dBm"
			elseif var_2_2 == 1 then
				var_2_3 = "-111dBm"
			elseif var_2_2 <= 30 then
				local var_2_4 = -109 + (var_2_2 - 2) * 2

				var_2_3 = tostring(var_2_4) .. "dBm"
			else
				var_2_3 = var_2_2 == 31 and "-51dBm" or "unknown"
			end

			local var_2_5 = tonumber(var_2_1)

			if var_2_5 == 0 then
				var_2_3 = var_2_3 .. " < 0.2%"
			elseif var_2_5 == 1 then
				var_2_3 = var_2_3 .. " < 0.4%"
			elseif var_2_5 == 2 then
				var_2_3 = var_2_3 .. " < 0.8%"
			elseif var_2_5 == 3 then
				var_2_3 = var_2_3 .. " < 1.6%"
			elseif var_2_5 == 4 then
				var_2_3 = var_2_3 .. " < 3.2%"
			elseif var_2_5 == 5 then
				var_2_3 = var_2_3 .. " < 6.4%"
			elseif var_2_5 == 6 then
				var_2_3 = var_2_3 .. " < 12.8%"
			elseif var_2_5 == 7 then
				var_2_3 = var_2_3 .. " > 12.8%"
			end

			arg_1_0(var_2_3)
		end

		var_0_1:send("+CSQ", var_1_0)
	end
}
