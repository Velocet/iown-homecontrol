import("Overkiz.Bus")

local var_0_0 = {}
local var_0_1 = {}

function var_0_0.__call(arg_1_0)
	local var_1_0 = Bus.Object.Proxy("/com/overkiz/Application/RTDS/Notifier/Node", "com.overkiz.Application.RTDS")

	var_1_0.Node = {}
	var_1_0.Watcher = {}
	var_1_0.watchers = {}

	local var_1_1 = {}

	function var_1_0.Watcher.modified(arg_2_0, arg_2_1, arg_2_2)
		for iter_2_0, iter_2_1 in pairs(var_1_0.watchers) do
			iter_2_1:modified(arg_2_1, arg_2_2)
		end
	end

	function var_1_0.Watcher.add(arg_3_0, arg_3_1)
		var_1_0.watchers[arg_3_1] = arg_3_1
	end

	function var_1_0.Watcher.remove(arg_4_0, arg_4_1)
		var_1_0.watchers[arg_4_1] = nil
	end

	function var_1_0.signal(arg_5_0, arg_5_1)
		if arg_5_1:getInterface() == "com.overkiz.Application.RTDS.Notifier.Node" and arg_5_1:getMember() == "modified" and arg_5_1:getSignature() == "(uy)y" then
			local var_5_0 = {}
			local var_5_1 = arg_5_1:constbegin()
			local var_5_2 = var_5_1:begin()
			local var_5_3

			var_5_0.address = var_5_2:get("uint32")
			var_5_0.field = var_5_2:get("byte")

			local var_5_4 = var_5_1:get("byte")

			var_1_0.Watcher:modified(var_5_0, var_5_4)
		end
	end

	return var_1_0
end

setmetatable(var_0_1, var_0_0)

return var_0_1
