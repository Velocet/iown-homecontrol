return {
	update = function(arg_1_0, arg_1_1)
		local var_1_0
		local var_1_1 = bit.band(arg_1_1[1], 32) == 0 and "low" or "normal"

		arg_1_0:update("core", "BatteryState", var_1_1)

		local var_1_2 = bit.band(arg_1_1[1], 16) == 0 and "open" or "closed"

		arg_1_0:update("core", "AssemblyState", var_1_2)
	end
}
