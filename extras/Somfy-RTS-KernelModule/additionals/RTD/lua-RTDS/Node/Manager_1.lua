import("Overkiz.Bus")
import("Overkiz.HomeAutomation.Protocol.RTDS.log")

local var_0_0 = {}
local var_0_1 = {}

function var_0_0.__call(arg_1_0)
	local var_1_0 = Bus.Object.Proxy("/com/overkiz/Application/RTDS/Manager/Node", "com.overkiz.Application.RTDS")

	function var_1_0.getNodes(arg_2_0)
		local var_2_0 = Bus.Message.Method.Call()

		var_2_0:setInterface("com.overkiz.Application.RTDS.Manager.Node")
		var_2_0:setMember("getNodes")

		local var_2_1 = {}
		local var_2_2 = var_1_0:send(var_2_0)

		if var_2_2:isException() == false then
			local var_2_3 = var_2_2:constbegin()
			local var_2_4
			local var_2_5

			while var_2_3:valid() do
				if var_2_3:signature() == "a(uy)" then
					var_2_4 = var_2_3:begin(var_2_4)

					while var_2_4 ~= nil and var_2_4:valid() == true do
						local var_2_6 = {}

						var_2_5 = var_2_4:begin(var_2_5)
						var_2_6.address = var_2_5:get("uint32")
						var_2_6.field = var_2_5:get("byte")

						table.insert(var_2_1, var_2_6)
					end
				else
					log:error("Invalid signature for rtds node !!!")
				end
			end
		else
			log:error("Get nodes exception. Devices may desync. Trigger will not work")
		end

		return var_2_1
	end

	function var_1_0.modify(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = Bus.Message.Method.Call()

		var_3_0:setInterface("com.overkiz.Application.RTDS.Manager.Node")
		var_3_0:setMember("modify")

		local var_3_1 = var_3_0:begin()
		local var_3_2 = var_3_1:begin("struct")

		var_3_2:push("uint32", arg_3_1.address)
		var_3_2:push("byte", arg_3_1.field)
		var_3_1:close(var_3_2)
		var_3_1:push("int32", arg_3_2)

		if var_1_0:send(var_3_0):isException() then
			log:error("modify doesn't work")
		end
	end

	return var_1_0
end

setmetatable(var_0_1, var_0_0)

return var_0_1
