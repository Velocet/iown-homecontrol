local var_0_0 = require("Overkiz.Cloudlink.Dispatcher")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Usb.Usb")()
local var_0_2 = {}

var_0_1.dispatcher = var_0_0("usb", {
	"com.overkiz.Application.Internal"
}, true)

function var_0_1.dispatcher.getusbkeys(arg_1_0, arg_1_1)
	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(var_0_1:list()) do
		table.insert(var_1_0, {
			device = iter_1_1
		})
	end

	var_0_1.dispatcher:push("devices", var_1_0)

	return true
end

table.insert(var_0_1.dispatcher.onStartFunctions, var_0_1.dispatcher.getusbkeys)

function var_0_1.add(arg_2_0, arg_2_1)
	var_0_1.dispatcher:push("add", arg_2_1)
end

function var_0_1.remove(arg_3_0, arg_3_1)
	var_0_1.dispatcher:push("remove", {
		devicepath = arg_3_1
	})
end

function var_0_1.update(arg_4_0, arg_4_1)
	var_0_1.dispatcher:push("update", arg_4_1)
end

return var_0_2
