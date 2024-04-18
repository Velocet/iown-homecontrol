local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_1 = {}
local var_0_2 = {}

function var_0_1.__call(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1 == nil or arg_1_2 == nil then
		arg_1_2:warning("UI: invalid or missing arguments")
	end

	return {
		progress = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
			arg_1_2:info("UI originator: progress received on group " .. tostring(arg_2_1.id))
			arg_1_2:debug("    command: parameter=" .. tostring(arg_2_2.parameter) .. " node=" .. tostring(arg_2_2.address) .. " id=" .. tostring(arg_2_2.id) .. " status=" .. tostring(arg_2_3))

			if arg_2_3 == var_0_0.progressEvent.PENDING or arg_2_3 == var_0_0.progressEvent.TRANSMITTING or arg_2_3 == var_0_0.progressEvent.TRANSMITTED or arg_2_3 == var_0_0.progressEvent.EXECUTING or arg_2_3 == var_0_0.progressEvent.QUEUED then
				arg_1_1:progressing(arg_2_1.id, arg_2_2.id)
			elseif arg_2_3 == var_0_0.progressEvent.DONE then
				arg_1_1:done(arg_2_1.id, arg_2_2.id)
			elseif arg_2_3 == var_0_0.progressEvent.ERROR then
				arg_1_1:error(arg_2_1.id, arg_2_2.id)
			elseif arg_2_3 == var_0_0.progressEvent.CANCELLED or arg_2_3 == var_0_0.progressEvent.DEPRECATED then
				arg_1_1:cancelled(arg_2_1.id, arg_2_2.id)
			else
				arg_1_2:warning("UI originator: undefined action for status " .. tostring(arg_2_3))
			end
		end
	}
end

setmetatable(var_0_2, var_0_1)

return var_0_2
