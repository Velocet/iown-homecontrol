local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_1 = require("Overkiz.Subject")
local var_0_2 = require("Overkiz.HomeAutomation.Trigger.Proxy.DevicesProxy")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Natif.view")
local var_0_4 = {}
local var_0_5 = {}

function var_0_4.__call(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = var_0_1()

	var_1_0.devicesProxy = var_0_2()
	var_1_0.states = {}
	var_1_0.nodeListener = {}

	arg_1_1:addListener(var_1_0.nodeListener)

	function var_1_0.nodeListener.notified(arg_2_0, arg_2_1)
		if not arg_2_1.parameterName then
			return
		end

		if not arg_2_1.force and var_1_0.states[arg_2_1.parameterName .. arg_2_1.id] and var_1_0.states[arg_2_1.parameterName .. arg_2_1.id].value == arg_2_1.value then
			return
		end

		local var_2_0 = {
			param = arg_2_1.parameterName,
			value = arg_2_1.value,
			node = arg_2_1.id
		}

		var_1_0.states[arg_2_1.parameterName .. arg_2_1.id] = var_2_0

		var_1_0:notify(var_0_3:buildNotificationState(var_2_0))
	end

	function var_1_0.getRawStates(arg_3_0)
		local var_3_0 = {}

		for iter_3_0, iter_3_1 in pairs(arg_3_0.states) do
			var_3_0[iter_3_0] = {
				nodeAddress = iter_3_1.node,
				rawStateId = iter_3_1.param,
				value = {
					data = iter_3_1.value
				}
			}
		end

		return var_3_0
	end

	function var_1_0.getRawStatesValues(arg_4_0, arg_4_1, arg_4_2)
		var_0_0:warning("Function getRawStatesValues not implemented")

		return {}
	end

	function var_1_0.refreshAll(arg_5_0)
		local var_5_0 = arg_1_1:getNodes()

		for iter_5_0, iter_5_1 in pairs(var_5_0) do
			iter_5_1:refreshAll()
		end
	end

	function var_1_0.newStates(arg_6_0, arg_6_1, arg_6_2)
		var_0_0:warning("Function newStates not implemented")
	end

	function var_1_0.getStates(arg_7_0)
		return arg_7_0.states
	end

	return var_1_0
end

setmetatable(var_0_5, var_0_4)

return var_0_5
