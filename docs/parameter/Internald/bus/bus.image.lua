local var_0_0 = require("Overkiz.Bus.Object")
local var_0_1 = require("Overkiz.Subject")
local var_0_2 = var_0_0.Server("/com/overkiz/Application/Internal/Image/Manager")

var_0_2.notifier = var_0_1()

function var_0_2.method(arg_1_0, arg_1_1)
	if arg_1_1:getInterface() == "com.overkiz.Application.Internal.Image.Manager" and arg_1_1:getMember() == "updatedNotification" and arg_1_1:getSignature() == "" then
		var_0_2.notifier:notify()

		return true
	end

	return false
end

var_0_2:start()

return var_0_2
