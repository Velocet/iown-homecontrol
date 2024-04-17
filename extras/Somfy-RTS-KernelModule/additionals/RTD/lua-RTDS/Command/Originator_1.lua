import("Overkiz.Bus")

local var_0_0 = {}
local var_0_1 = {}

function var_0_0.__call(arg_1_0, arg_1_1)
	local var_1_0 = Bus.Object.Server(arg_1_1)

	function var_1_0.method(arg_2_0, arg_2_1)
		if arg_2_1:getInterface() == "com.overkiz.Application.RTDS.Notifier.Command" and arg_2_1:getMember() == "progress" and arg_2_1:getSignature() == "(uutbayi)(s)i" then
			if type(arg_2_0.progress) == "function" then
				local var_2_0 = {}
				local var_2_1 = {}
				local var_2_2
				local var_2_3 = arg_2_1:constbegin()
				local var_2_4 = var_2_3:begin()

				var_2_1.address = var_2_4:get("uint32")
				var_2_1.priority = var_2_4:get("uint32")
				var_2_1.parameter = var_2_4:get("uint64")
				var_2_1.access = var_2_4:get("boolean")
				var_2_1.data = {}

				local var_2_5 = var_2_4:begin()

				while var_2_5:valid() do
					var_2_1.data[#var_2_1.data + 1] = var_2_5:get("byte")
				end

				var_2_1.detailedStatus = var_2_4:get("int32")
				var_2_0.id = var_2_3:begin(var_2_4):get("string")

				local var_2_6 = var_2_3:get("int32")

				arg_2_0:progress(var_2_0, var_2_1, var_2_6)
			end

			local var_2_7 = Bus.Message.Method.Return(arg_2_1)

			arg_2_0:send(var_2_7)

			return true
		end

		return false
	end

	return var_1_0
end

setmetatable(var_0_1, var_0_0)

return var_0_1
