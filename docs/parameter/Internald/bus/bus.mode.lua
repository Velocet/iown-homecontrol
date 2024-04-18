local var_0_0 = require("Overkiz.Bus.Object")
local var_0_1 = require("Overkiz.Bus.Connection")
local var_0_2 = require("Overkiz.Bus.Message")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Mode.mode")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_5 = var_0_0.Server("/com/overkiz/Application/Mode/Manager")

var_0_5.notifier = var_0_0.Server("/com/overkiz/Application/Mode/Notifier")

local var_0_6 = var_0_1.get()

var_0_6:bind("com.overkiz.Application.Mode")
var_0_6:bind("com.overkiz.Application.Mode.Notifier")
var_0_6:bind("com.overkiz.Application.Mode.Manager")

function var_0_5.method(arg_1_0, arg_1_1)
	if arg_1_1:getInterface() == "com.overkiz.Application.Mode" then
		if arg_1_1:getMember() == "set" then
			if arg_1_1:getSignature() == "ib" then
				local var_1_0 = arg_1_1:constbegin()
				local var_1_1 = var_1_0:get("int32")
				local var_1_2 = var_1_0:get("boolean")

				var_0_3.setIB(var_1_1, var_1_2)
			elseif arg_1_1:getSignature() == "ub" then
				local var_1_3 = arg_1_1:constbegin()
				local var_1_4 = var_1_3:get("uint32")
				local var_1_5 = var_1_3:get("boolean")

				var_0_3.setUB(var_1_4, var_1_5)
			elseif arg_1_1:getSignature() == "u" then
				local var_1_6 = arg_1_1:constbegin():get("uint32")

				var_0_3.setU(var_1_6)
			elseif arg_1_1:getSignature() == "i" then
				local var_1_7 = arg_1_1:constbegin():get("int32")

				var_0_3.setI(var_1_7)
			else
				return false
			end

			local var_1_8 = var_0_2.Method.Return(arg_1_1)

			arg_1_0:send(var_1_8)

			return true
		elseif arg_1_1:getMember() == "get" then
			local var_1_9 = var_0_2.Method.Return(arg_1_1)
			local var_1_10 = var_1_9:begin()
			local var_1_11 = var_0_3.get()

			var_1_10:push("int32", var_1_11.id)
			var_1_10:push("uint32", var_1_11.flags)
			arg_1_0:send(var_1_9)

			return true
		elseif arg_1_1:getMember() == "checktime" then
			var_0_4:info("Check time received")

			local var_1_12 = var_0_2.Method.Return(arg_1_1)

			arg_1_0:send(var_1_12)
			var_0_3.checktime()

			return true
		end
	end

	return false
end

function var_0_5.changed(arg_2_0)
	local var_2_0 = var_0_2.Signal()
	local var_2_1 = var_2_0:begin()

	var_2_0:setMember("modeHasChangedNotification")
	var_2_0:setInterface("com.overkiz.Application.Mode")

	local var_2_2 = var_0_3.get()

	var_2_1:push("int32", var_2_2.id)
	var_2_1:push("uint32", var_2_2.flags)
	var_0_5.notifier:send(var_2_0)
end

var_0_3.addListener(var_0_5)
var_0_5:start()
var_0_5.notifier:start()

return var_0_5
