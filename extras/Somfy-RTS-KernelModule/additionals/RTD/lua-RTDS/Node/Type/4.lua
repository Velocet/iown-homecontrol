return {
	create = function(arg_1_0, arg_1_1)
		table.insert(arg_1_1.states, "15795204")
		table.insert(arg_1_1.states, "80")
	end,
	delete = function(arg_2_0)
		arg_2_0.device:delete("core")
	end
}
