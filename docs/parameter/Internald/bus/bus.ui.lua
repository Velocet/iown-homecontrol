local var_0_0 = require("Overkiz.Bus.Object")
local var_0_1 = require("Overkiz.Bus.Connection")
local var_0_2 = require("Overkiz.Bus.Message")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_4 = var_0_0.Server("/com/overkiz/Application/UI/Manager")

var_0_1.get():bind("com.overkiz.Application.UI")

function var_0_4.method(arg_1_0, arg_1_1)
	if arg_1_1:getInterface() == "com.overkiz.Application.UI" then
		if arg_1_1:getMember() == "setFunction" then
			if arg_1_1:getSignature() == "s" then
				local var_1_0 = arg_1_1:constbegin():get("string")

				var_0_3:setFunction(var_1_0)

				local var_1_1 = var_0_2.Method.Return(arg_1_1)

				arg_1_0:send(var_1_1)

				return true
			end
		elseif arg_1_1:getMember() == "setEvent" and arg_1_1:getSignature() == "ss" then
			local var_1_2 = arg_1_1:constbegin()
			local var_1_3 = var_1_2:get("string")
			local var_1_4 = var_1_2:get("string")

			var_0_3:setEvent(var_1_3, var_1_4)

			local var_1_5 = var_0_2.Method.Return(arg_1_1)

			arg_1_0:send(var_1_5)

			return true
		end
	end

	return false
end

function var_0_4.modified(arg_2_0, arg_2_1)
	local var_2_0 = var_0_2.Signal()
	local var_2_1 = var_2_0:begin()

	var_2_0:setMember("newEvent")
	var_2_0:setInterface("com.overkiz.Application.UI")
	var_2_1:push("string", arg_2_1)
	var_0_4:send(var_2_0)
end

var_0_3:addFunctionsListener(var_0_4)
var_0_4:start()

return var_0_4
