require("Overkiz.utilities")

local var_0_0 = require("Overkiz.Bus.Object")
local var_0_1 = require("Overkiz.Bus.Connection")
local var_0_2 = require("Overkiz.Bus.Message")
local var_0_3 = require("Overkiz.Subject")
local var_0_4 = require("Overkiz.Storage")
local var_0_5 = var_0_0.Server("/com/overkiz/Application/Internal/Resync/Manager")

var_0_1.get():bind("com.overkiz.Application.Internal.Resync")

var_0_5.notifier = var_0_3()

local var_0_6 = var_0_4("resyncModules", {}, "Overkiz.HomeAutomation.Protocol.Internal.storage")

local function var_0_7(arg_1_0)
	local var_1_0 = var_0_6:get()

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		if iter_1_1 == arg_1_0 then
			return
		end
	end

	table.insert(var_1_0, arg_1_0)
	var_0_5.notifier:notify(var_1_0)
	var_0_6:push(var_1_0)
end

function var_0_5.cleanup(arg_2_0)
	var_0_6:push({})
end

function var_0_5.getModules(arg_3_0)
	return var_0_6:get()
end

function var_0_5.method(arg_4_0, arg_4_1)
	if arg_4_1:getInterface() == "com.overkiz.Application.Internal.Resync.Manager" and arg_4_1:getMember() == "resyncModuleNeeded" and arg_4_1:getSignature() == "s" then
		local var_4_0 = arg_4_1:constbegin():get("string")
		local var_4_1 = var_0_2.Method.Return(arg_4_1)

		arg_4_0:send(var_4_1)
		var_0_7(var_4_0)

		return true
	end

	return false
end

var_0_5:start()

return var_0_5
