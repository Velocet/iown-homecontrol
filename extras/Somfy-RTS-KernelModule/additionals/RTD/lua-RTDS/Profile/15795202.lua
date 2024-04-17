import("Overkiz.HomeAutomation.Protocol.RTDS.Profile.LowBatteryState")

return {
	update = function(arg_1_0, arg_1_1)
		if bit.rshift(bit.band(8, arg_1_1[1]), 3) == 0 then
			arg_1_0:update("core", "ContactState", "open")
		else
			arg_1_0:update("core", "ContactState", "closed")
		end

		LowBatteryState.update(arg_1_0, arg_1_1)
	end
}
