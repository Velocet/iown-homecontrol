return {
	create = function(arg_1_0, arg_1_1)
		table.insert(arg_1_1.states, "15795201")
		table.insert(arg_1_1.states, "80")
		arg_1_1.device:update("core", "OccupancyState", "noPersonInside")
	end,
	delete = function(arg_2_0)
		arg_2_0.device:delete("core")
	end
}
