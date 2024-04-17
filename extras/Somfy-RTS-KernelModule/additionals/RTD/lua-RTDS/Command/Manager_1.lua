import("Overkiz.Bus")
import("Overkiz.HomeAutomation.Protocol.RTDS.log")

local var_0_0 = {}
local var_0_1 = {}

function var_0_0.__call(arg_1_0)
	local var_1_0 = Bus.Object.Proxy("/com/overkiz/Application/RTDS/Manager/Command", "com.overkiz.Application.RTDS")

	function var_1_0.add(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		local var_2_0 = Bus.Message.Method.Call()

		var_2_0:setInterface("com.overkiz.Application.RTDS.Manager.Command")
		var_2_0:setMember("add")

		local var_2_1 = var_2_0:begin()

		var_2_1:push("path", arg_2_1:getPath())
		var_2_1:push("string", arg_2_1:getHost())

		subIter = var_2_1:begin("struct", subIter)

		subIter:push("string", arg_2_2.id)
		var_2_1:close(subIter)
		log:debug("Adding group " .. arg_2_2.id)

		local var_2_2

		subIter = var_2_1:begin("array", "(uutbayi)", subIter)

		for iter_2_0, iter_2_1 in ipairs(arg_2_3) do
			var_2_2 = subIter:begin("struct", var_2_2)

			var_2_2:push("uint32", iter_2_1.address)
			var_2_2:push("uint32", iter_2_1.priority)
			var_2_2:push("uint64", iter_2_1.parameter)
			var_2_2:push("boolean", iter_2_1.access)

			local var_2_3 = var_2_2:begin("array", "y")

			if iter_2_1.data ~= nil then
				local var_2_4 = 1

				for iter_2_2 = 1, #iter_2_1.data do
					var_2_3:push("byte", iter_2_1.data[iter_2_2])
				end
			end

			var_2_2:close(var_2_3)
			var_2_2:push("int32", iter_2_1.detailledStatus)
			subIter:close(var_2_2)
		end

		var_2_1:close(subIter)
		arg_2_0:send(var_2_0)
	end

	function var_1_0.cancel(arg_3_0, arg_3_1)
		local var_3_0 = Bus.Message.Method.Call()

		var_3_0:setInterface("com.overkiz.Application.RTDS.Manager.Command")
		var_3_0:setMember("cancel")

		local var_3_1 = var_3_0:begin()
		local var_3_2 = var_3_1:begin("struct")

		var_3_2:push("string", arg_3_1.id)
		var_3_1:close(var_3_2)
		arg_3_0:send(var_3_0)
	end

	return var_1_0
end

setmetatable(var_0_1, var_0_0)

return var_0_1
