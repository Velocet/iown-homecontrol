return {
	create = function(arg_1_0, arg_1_1)
		table.insert(arg_1_1.states, "15795200")
	end,
	delete = function(arg_2_0)
		arg_2_0.device:delete("core")
		arg_2_0.device:delete("rtds")
	end
}
