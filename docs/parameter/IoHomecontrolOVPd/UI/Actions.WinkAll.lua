local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.Actions.Action")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.Wink")
local var_0_4 = {}
local var_0_5 = {}

function var_0_4.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6)
	local var_1_0 = var_0_0("wink", arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6)

	function var_1_0.launch(arg_2_0)
		local var_2_0 = {}
		local var_2_1 = {}

		for iter_2_0, iter_2_1 in pairs(var_1_0.nodeManager:getNodes()) do
			if iter_2_1.class == var_0_1.class.ACTUATOR then
				local var_2_2 = var_0_2:buildParameterCommand(var_0_3, iter_2_1.address)

				var_2_2.id = #var_2_0
				var_2_1.id = var_2_2.id

				table.insert(var_2_0, var_2_2)
			end
		end

		if #var_2_0 ~= 0 then
			local var_2_3 = var_1_0.commandManager:generateGroup()

			var_2_1.group = var_2_3.id

			var_1_0.commandManager:add(var_1_0.transportOriginator, var_2_3, var_2_0)

			return var_2_1
		else
			arg_1_6:debug("UI manager: no nodes to wink")
			arg_1_4:actionNoEffects()
		end
	end

	function var_1_0.onDone(arg_3_0)
		arg_1_4:actionNoEffects()
	end

	function var_1_0.onError(arg_4_0)
		arg_1_4:actionNoEffects()
	end

	function var_1_0.onCancel(arg_5_0)
		arg_1_4:actionNoEffects()
	end

	return var_1_0
end

setmetatable(var_0_5, var_0_4)

return var_0_5
