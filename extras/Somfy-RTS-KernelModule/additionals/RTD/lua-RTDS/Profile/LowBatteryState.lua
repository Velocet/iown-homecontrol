return {
	update = function(arg_1_0, arg_1_1)
		if bit.rshift(bit.band(32, arg_1_1[1]), 5) == 0 then
			arg_1_0:update("core", "LowBatteryState", "low")
		else
			arg_1_0:update("core", "LowBatteryState", "normal")
		end
	end
}
