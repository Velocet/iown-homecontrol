local var_0_0 = {}
local var_0_1 = {}

function var_0_0.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6, arg_1_7)
	if arg_1_1 == nil or arg_1_2 == nil or arg_1_3 == nil or arg_1_4 == nil or arg_1_5 == nil or arg_1_6 == nil or arg_1_7 == nil then
		arg_1_7:warning("UI action: invalid or missing arguments")
	end

	local var_1_0 = {
		name = arg_1_1,
		transportOriginator = arg_1_2,
		nodeManager = arg_1_3,
		commandManager = arg_1_4,
		uiDelegate = arg_1_5,
		resyncModule = arg_1_6,
		log = arg_1_7
	}

	var_1_0.running = false

	function var_1_0.launch(arg_2_0)
		return
	end

	function var_1_0.onDone(arg_3_0)
		arg_1_5:actionEnd(true)
	end

	function var_1_0.onError(arg_4_0)
		arg_1_5:actionEnd(false)
	end

	function var_1_0.onCancel(arg_5_0)
		arg_1_5:actionEnd(false)
	end

	function var_1_0.onProgress(arg_6_0)
		arg_1_5:actionProgress()
	end

	function var_1_0.onTimeout(arg_7_0)
		arg_1_5:actionProgress()
		arg_1_5:actionEnd(false)
	end

	return var_1_0
end

setmetatable(var_0_1, var_0_0)

return var_0_1
