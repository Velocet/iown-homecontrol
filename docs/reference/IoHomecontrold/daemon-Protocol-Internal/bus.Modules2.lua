local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.OOP.Class")
local var_0_2 = require("Overkiz.Bus.DBusFactory")
local var_0_3 = require("Overkiz.Kizbox.modulesDefinitions")
local var_0_4 = var_0_1()

function var_0_4.new(arg_1_0, arg_1_1)
	arg_1_0._options = arg_1_1
	arg_1_0._server = var_0_2.createServer(var_0_3.INTERFACE_NAME, "/" .. var_0_3.INTERFACE_NAME:gsub("%.", "/"), {
		[var_0_3.INTERFACE_NAME] = {
			methods = var_0_3.METHODS,
			signals = var_0_3.SIGNALS
		}
	}, {
		[var_0_3.INTERFACE_NAME] = {
			[next(var_0_3.METHODS)] = function(arg_2_0, arg_2_1)
				return arg_1_0:getOptions(arg_2_1)
			end
		}
	})
end

function var_0_4.getOptions(arg_3_0, arg_3_1)
	return arg_3_0._options:get(arg_3_1)
end

function var_0_4.optionsUpdated(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._server:optionsUpdated(arg_4_1, var_0_0.encode(arg_4_2))
end

return var_0_4
