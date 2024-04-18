local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")
local var_0_2 = {
	refresh = {
		startup = true,
		interval = var_0_0.Monotonic(var_0_0.Elapsed(600, 0))
	},
	read = function(arg_1_0, arg_1_1)
		var_0_1:getSIMStatus(arg_1_0, arg_1_1)
	end
}

function var_0_2.write(arg_2_0, arg_2_1, arg_2_2)
	local function var_2_0(arg_3_0, arg_3_1)
		if arg_3_0 then
			arg_2_2(arg_3_1)
		else
			var_0_2.read(arg_2_1, arg_2_2)
		end
	end

	if not arg_2_0 then
		arg_2_2("Bad value.")

		return
	end

	var_0_1:send("+CPIN=" .. tostring(arg_2_0), var_2_0)
end

return var_0_2
