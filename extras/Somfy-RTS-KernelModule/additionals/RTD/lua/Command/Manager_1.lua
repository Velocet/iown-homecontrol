import("Overkiz.Bus")

local var_0_0 = {}
local var_0_1 = {}

function var_0_0.__call(arg_1_0)
	local var_1_0 = Bus.Object.Proxy("/com/overkiz/Application/RTD/Command/Manager", "com.overkiz.Application.RTD")

	function var_1_0.add(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		local var_2_0 = Bus.Message.Method.Call()

		var_2_0:setInterface("com.overkiz.Application.RTD.Command.Manager")
		var_2_0:setMember("add")

		local var_2_1 = var_2_0:begin()
		local var_2_2 = var_2_1:begin("struct")

		var_2_2:push("path", arg_2_1:getPath())
		var_2_2:push("string", arg_2_1:getHost())
		var_2_1:close(var_2_2)

		local var_2_3 = var_2_1:begin("struct", var_2_2)

		var_2_3:push("string", arg_2_2)
		var_2_1:close(var_2_3)

		local var_2_4 = var_2_1:begin("array", "(uuby)", var_2_3)
		local var_2_5

		for iter_2_0, iter_2_1 in ipairs(arg_2_3) do
			var_2_5 = var_2_4:begin("struct", var_2_5)

			var_2_5:push("uint32", iter_2_1.address)
			var_2_5:push("uint32", iter_2_1.data)
			var_2_5:push("boolean", iter_2_1.extended)
			var_2_5:push("byte", iter_2_1.extension)
			var_2_4:close(var_2_5)
		end

		var_2_1:close(var_2_4)
		arg_2_0:send(var_2_0)
	end

	return var_1_0
end

setmetatable(var_0_1, var_0_0)

return var_0_1
