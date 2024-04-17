import("Overkiz.HomeAutomation.Protocol.RTDS.Profile.LowBatteryState")

return {
	update = function(arg_1_0, arg_1_1)
		if bit.band(192, arg_1_1[1]) == 0 then
			arg_1_0:update("rtds", "ControllerOrderTypeState", "longOFF")
		elseif bit.band(192, arg_1_1[1]) == 64 then
			arg_1_0:update("rtds", "ControllerOrderTypeState", "supervision")
		elseif bit.band(192, arg_1_1[1]) == 128 then
			local var_1_0 = bit.band(15, arg_1_1[1])
			local var_1_1 = ""

			if var_1_0 == 0 then
				var_1_1 = "off"
			elseif var_1_0 == 1 then
				var_1_1 = "onZ1"
			elseif var_1_0 == 2 then
				var_1_1 = "onZ2"
			elseif var_1_0 == 3 then
				var_1_1 = "onZ3"
			elseif var_1_0 == 4 then
				var_1_1 = "onZ1-2"
			elseif var_1_0 == 5 then
				var_1_1 = "onZ2-3"
			elseif var_1_0 == 6 then
				var_1_1 = "onZ1-3"
			elseif var_1_0 == 7 then
				var_1_1 = "onZ1-2-3"
			elseif var_1_0 == 8 then
				var_1_1 = "SOS"
			elseif var_1_0 == 9 then
				var_1_1 = "SOS"
			elseif var_1_0 == 10 then
				var_1_1 = "autowatch"
			elseif var_1_0 == 11 then
				var_1_1 = "unknown"
			elseif var_1_0 == 12 then
				var_1_1 = "offcode"
			elseif var_1_0 == 13 then
				var_1_1 = "offZ1"
			elseif var_1_0 == 14 then
				var_1_1 = "offZ2"
			elseif var_1_0 == 14 then
				var_1_1 = "offZ3"
			end

			arg_1_0:update("rtds", "ControllerOrderTypeState", var_1_1)
		elseif bit.band(192, arg_1_1[1]) == 192 then
			arg_1_0:update("rtds", "ControllerOrderTypeState", "code")
		elseif bit.band(240, arg_1_1[1]) == 240 then
			arg_1_0:update("rtds", "ControllerOrderTypeState", "sound")
		end

		LowBatteryState.update(arg_1_0, arg_1_1)
	end
}
