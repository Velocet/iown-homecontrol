local var_0_0 = require("Overkiz.Time")

return {
	refresh = {
		startup = true,
		interval = var_0_0.Monotonic(var_0_0.Elapsed(900, 0))
	},
	read = function(arg_1_0, arg_1_1)
		local var_1_0 = io.popen("cat /proc/loadavg | cut -d\\  -f3")
		local var_1_1 = tonumber(var_1_0:read("*a"))

		var_1_0:close()
		arg_1_0(tostring(var_1_1))
	end
}
