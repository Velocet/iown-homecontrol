return {
	update = function(arg_1_0, arg_1_1)
		if bit.band(1, arg_1_1[1]) == 0 then
			arg_1_0:update("core", "OutOfOrder", "alive")
		else
			arg_1_0:update("core", "OutOfOrder", "dead")
		end
	end
}
