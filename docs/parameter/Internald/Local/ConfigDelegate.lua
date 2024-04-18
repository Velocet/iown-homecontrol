local var_0_0 = require("Overkiz.HomeAutomation.Local.Model.Protocol.Delegation.DelegationServer")
local var_0_1 = {}
local var_0_2 = {}

function var_0_1.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	if not arg_1_4 then
		return
	end

	if arg_1_1 == nil or arg_1_2 == nil or arg_1_3 == nil then
		arg_1_4:warning("Config protocol delegate: invalid or missing arguments")

		return
	end

	local var_1_0 = var_0_0(arg_1_1, "config")

	var_1_0.nodeManager = arg_1_3
	var_1_0.deviceManager = arg_1_2

	local var_1_1 = {
		supportedModels = {
			device = true,
			action = true,
			state = true
		},
		toSeekList = {
			"com.overkiz.Application.Internal"
		}
	}

	function var_1_0.init()
		return var_1_1
	end

	return var_1_0
end

setmetatable(var_0_2, var_0_1)

return var_0_2
