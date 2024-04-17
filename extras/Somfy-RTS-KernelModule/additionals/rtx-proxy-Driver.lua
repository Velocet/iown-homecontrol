local var_0_0 = require("Overkiz.Bus.Object")
local var_0_1 = require("Overkiz.Bus.Message")
local var_0_2 = require("Overkiz.Type.ByteArray")
local var_0_3 = {}
local var_0_4 = {
	Status = {
		DONE = 2,
		TRANSMITTING = 1,
		ERROR = 3,
		PENDING = 0
	}
}

function var_0_3.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = var_0_0.Proxy(arg_1_1, arg_1_2)

	var_1_0.delegate = nil

	function var_1_0.signal(arg_2_0, arg_2_1)
		if not var_1_0.delegate then
			return
		end

		if arg_2_1:getInterface() == "com.overkiz.Application.RTx.Driver" then
			if arg_2_1:getMember() == "receive" then
				local var_2_0 = arg_2_1:constbegin():begin()
				local var_2_1 = {}

				while var_2_0:valid() do
					var_2_1[#var_2_1 + 1] = var_2_0:get("byte")
				end

				if var_1_0.delegate.receive then
					var_1_0.delegate.receive(var_0_2(var_2_1))
				end
			elseif arg_2_1:getMember() == "progress" then
				local var_2_2 = arg_2_1:constbegin()
				local var_2_3 = var_2_2:get("string")
				local var_2_4 = var_2_2:get("int32")

				if var_1_0.delegate.progress then
					var_1_0.delegate.progress(var_2_3, var_2_4)
				end
			elseif arg_2_1:getMember() == "stackinfo" then
				if arg_2_1:getSignature() == "say" then
					local var_2_5 = arg_2_1:constbegin()
					local var_2_6 = var_2_5:get("string")
					local var_2_7 = {}
					local var_2_8 = var_2_5:begin()

					while var_2_8:valid() do
						var_2_7[#var_2_7 + 1] = var_2_8:get("byte")
					end

					if var_1_0.delegate.stackinfo then
						var_1_0.delegate.stackinfo(var_2_6, var_0_2(var_2_7))
					end
				else
					arg_1_3:error("RTX: Bad signature for driver:signal stack info reply : " .. arg_2_1:getSignature())
				end
			end
		end
	end

	function var_1_0.sendData(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = var_0_1.Method.Call()

		var_3_0:setInterface("com.overkiz.Application.RTx.Driver")
		var_3_0:setMember("send")

		local var_3_1 = var_3_0:begin()

		var_3_1:push("string", tostring(arg_3_2))

		local var_3_2 = var_3_1:begin("array", "y")

		if arg_3_1 ~= nil then
			for iter_3_0 = 1, #arg_3_1 do
				var_3_2:push("byte", arg_3_1[iter_3_0])
			end
		end

		var_3_1:close(var_3_2)

		local function var_3_3(arg_4_0, arg_4_1)
			local var_4_0 = var_0_4.Status.PENDING

			if arg_4_1:isException() then
				var_4_0 = var_0_4.Status.ERROR
			end

			if var_1_0.delegate then
				var_1_0.delegate.progress(arg_3_2, var_4_0)
			end
		end

		arg_3_0:send(var_3_0, var_3_3)
	end

	function var_1_0.setDelegate(arg_5_0, arg_5_1)
		arg_5_0.delegate = arg_5_1
	end

	var_1_0:start()

	return var_1_0
end

setmetatable(var_0_4, var_0_3)

return var_0_4
