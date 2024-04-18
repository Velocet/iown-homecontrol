local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Class.Abstract")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_3 = var_0_0(var_0_1)

function var_0_3.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_1.new(arg_1_0, arg_1_1, "beacon", arg_1_2, arg_1_3)
end

function var_0_3.nodeDelete(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0._nodes[arg_2_1.address]

	if not var_2_0 then
		arg_2_0._log:notice("[" .. arg_2_0._name .. "] DELETED BEACON FAILED " .. tostring(arg_2_1.address))

		return false
	else
		var_2_0 = arg_2_0.format(var_2_0)
	end

	if var_2_0.status ~= var_0_2.status.Destroyed then
		var_2_0.status = var_0_2.status.Destroyed

		arg_2_0:nodeUpdateStatus(var_2_0, false)
	else
		arg_2_0:emit(arg_2_0.Events.Delete, var_2_0, false)
		arg_2_0:deleteNode(var_2_0)
	end

	return true
end

return var_0_3
