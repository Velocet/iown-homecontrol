local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.Time")

return {
	refresh = {
		startup = true,
		interval = var_0_1.Monotonic(var_0_1.Elapsed(900, 0))
	},
	read = function(arg_1_0, arg_1_1)
		local var_1_0 = io.popen("cat /proc/meminfo | sed 's/ \\{1,\\}/ /g;' | grep '^MemTotal:' | cut -d\\  -f2")
		local var_1_1 = tonumber(var_1_0:read("*a"))

		var_1_0:close()

		local var_1_2 = io.popen("cat /proc/meminfo | sed 's/ \\{1,\\}/ /g;' | grep '^Committed_AS:' | cut -d\\  -f2")
		local var_1_3 = tonumber(var_1_2:read("*a"))

		var_1_2:close()

		local var_1_4 = var_1_3 / var_1_1 * 100

		arg_1_0(tostring(var_0_0.round(var_1_4)))
	end
}
