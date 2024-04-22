local var_0_0 = {}
local var_0_1 = {}

function var_0_0.__call(arg_1_0, arg_1_1)
	local var_1_0 = {
		parameters = {},
		hooks = {}
	}
	local var_1_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.alarmName")
	local var_1_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.mode")
	local var_1_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.currentMode")
	local var_1_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.delay")
	local var_1_5 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.intrusion")
	local var_1_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.Parameter")

	var_1_0.parameters.name = var_1_6(var_1_1)
	var_1_0.parameters.targetMode = var_1_6(var_1_2)
	var_1_0.parameters.currentMode = var_1_6(var_1_3)
	var_1_0.parameters.delay = var_1_6(var_1_4)
	var_1_0.parameters.intrusion = var_1_6(var_1_5)

	function var_1_0.hooks.targetMode(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_2 ~= "alarm" then
			return
		end

		local function var_2_0()
			return
		end

		local function var_2_1(arg_4_0)
			var_1_0:updated("intrusion", arg_4_0)
		end

		if tonumber(arg_2_1) == 0 then
			var_1_0.parameters.intrusion.write("notDetected", var_2_1, var_2_0)
		end
	end

	return var_1_0
end

setmetatable(var_0_1, var_0_0)

return var_0_1
