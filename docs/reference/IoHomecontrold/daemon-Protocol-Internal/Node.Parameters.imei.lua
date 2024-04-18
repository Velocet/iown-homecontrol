local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")

return {
	refresh = {
		startup = true
	},
	read = function(arg_1_0, arg_1_1)
		local function var_1_0(arg_2_0, arg_2_1)
			if arg_2_0 then
				arg_1_1(arg_2_1)

				return
			end

			local var_2_0 = arg_2_1:match("#CGSN: (%d+)") or "Unknown"

			arg_1_0(var_2_0)
		end

		var_0_0:send("#CGSN", var_1_0)
	end
}
