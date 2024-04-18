local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_1 = require("Overkiz.Bus.Object")
local var_0_2 = require("Overkiz.Bus.Connection")
local var_0_3 = require("Overkiz.Bus.Message")
local var_0_4 = var_0_1.Server("/com/overkiz/Application/Internal/Modules")

var_0_4.delegate = nil

local var_0_5 = "com.overkiz.Application.Internal.Modules"

function var_0_4.enableModule(arg_1_0, arg_1_1)
	local var_1_0 = var_0_3.Signal()
	local var_1_1 = var_1_0:begin()

	var_1_0:setMember("enableModuleRequested")
	var_1_0:setInterface(var_0_5)
	var_1_1:push("string", tostring(arg_1_1))
	var_0_4:send(var_1_0)
end

function var_0_4.disableModule(arg_2_0, arg_2_1)
	local var_2_0 = var_0_3.Signal()
	local var_2_1 = var_2_0:begin()

	var_2_0:setMember("disableModuleRequested")
	var_2_0:setInterface("com.overkiz.Application.Internal.Modules")
	var_2_1:push("string", tostring(arg_2_1))
	var_0_4:send(var_2_0)
end

function var_0_4.method(arg_3_0, arg_3_1)
	if arg_3_1:getInterface() == "com.overkiz.Application.Internal.Modules" then
		if arg_3_1:getMember() == "getModules" and arg_3_1:getSignature() == "" then
			local var_3_0 = var_0_3.Method.Return(arg_3_1)
			local var_3_1 = var_3_0:begin()
			local var_3_2 = var_3_1:begin("array", "s")
			local var_3_3 = {}

			if arg_3_0.delegate then
				var_3_3 = arg_3_0.delegate.getModules()
			end

			for iter_3_0, iter_3_1 in pairs(var_3_3) do
				var_3_2:push("string", tostring(iter_3_0))
			end

			var_3_1:close(var_3_2)
			arg_3_0:send(var_3_0)

			return true
		elseif arg_3_1:getMember() == "setRestart" and arg_3_1:getSignature() == "b" then
			local var_3_4 = arg_3_1:constbegin()

			if arg_3_0.delegate then
				arg_3_0.delegate.setRestart(var_3_4:get("boolean"))
			end

			local var_3_5 = var_0_3.Method.Return(arg_3_1)

			arg_3_0:send(var_3_5)

			return true
		end
	end

	var_0_0:warning("Modules, unknown member or signature")

	return false
end

var_0_4:start()
var_0_2.get():bind(var_0_5)

return var_0_4
