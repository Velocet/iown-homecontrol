return {
	create = function(arg_1_0, arg_1_1)
		table.insert(arg_1_1.states, "15795208")
		table.insert(arg_1_1.states, "80")
		arg_1_1.device:update("core", "SensingState", "notDetected")
		arg_1_1.device:update("core", "SmokeState", "notDetected")
		arg_1_1.device:update("rtds", "SmokeState_UT", os.time())
	end,
	delete = function(arg_2_0)
		arg_2_0.device:delete("core")
		arg_2_0.device:delete("rtds")
	end
}
