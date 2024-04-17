import("Overkiz.Bus")
import("Overkiz.HomeAutomation.Protocol.RTDS.log")

local var_0_0 = {}
local var_0_1 = {}

function var_0_0.__call(arg_1_0)
	local var_1_0 = Bus.Object.Proxy("/com/overkiz/Application/RTDS/Notifier/State", "com.overkiz.Application.RTDS")

	var_1_0.Watcher = {}
	var_1_0.watchers = {}

	local var_1_1 = {}

	function var_1_0.Watcher.modified(arg_2_0, arg_2_1)
		for iter_2_0, iter_2_1 in pairs(var_1_0.watchers) do
			iter_2_1:modified(arg_2_1)
		end
	end

	function var_1_0.Watcher.add(arg_3_0, arg_3_1)
		var_1_0.watchers[arg_3_1] = arg_3_1
	end

	function var_1_0.Watcher.remove(arg_4_0, arg_4_1)
		var_1_0.watchers[arg_4_1] = nil
	end

	function var_1_0.signal(arg_5_0, arg_5_1)
		if arg_5_1:getInterface() == "com.overkiz.Application.RTDS.Notifier.State" and arg_5_1:getMember() == "modified" and arg_5_1:getSignature() == "(utuay(ii))" then
			local var_5_0 = {}
			local var_5_1 = arg_5_1:constbegin():begin()

			var_5_0.address = var_5_1:get("uint32")
			var_5_0.parameterId = var_5_1:get("uint64")
			var_5_0.status = var_5_1:get("uint32")

			local var_5_2 = var_5_1:begin()

			var_5_0.value = {}

			while var_5_2 ~= nil and var_5_2:valid() == true do
				local var_5_3 = var_5_2:get("byte")

				table.insert(var_5_0.value, var_5_3)
			end

			var_5_0.time = {}

			local var_5_4 = var_5_1:begin(var_5_2)

			var_5_0.time.seconds = var_5_4:get("int32")
			var_5_0.time.nanoseconds = var_5_4:get("int32")

			var_1_0.Watcher:modified(var_5_0)
			log:debug("State " .. var_5_0.parameterId .. " modified")
		end
	end

	return var_1_0
end

setmetatable(var_0_1, var_0_0)

return var_0_1
