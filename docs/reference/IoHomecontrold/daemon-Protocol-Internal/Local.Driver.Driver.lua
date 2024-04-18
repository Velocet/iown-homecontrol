local var_0_0 = require("Overkiz.HomeAutomation.Local.Model.Remote.Driver.Driver")
local var_0_1 = require("Overkiz.HomeAutomation.Local.Model.reference")
local var_0_2 = require("Overkiz.Cloudlink.si")
local var_0_3 = {}
local var_0_4 = {}

function var_0_3.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = var_0_0(arg_1_1, arg_1_2)

	function var_1_0.buildCommands(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
		local var_2_0 = {}
		local var_2_1 = {
			index = 0,
			node = arg_2_1.rawAddress,
			value = arg_2_3,
			access = arg_2_2.extraDefinition.access,
			param = arg_2_2.extraDefinition.parameterId
		}

		if arg_2_4 then
			if type(arg_2_4) ~= "table" then
				arg_1_3:debug("no extraFields on second part")
			else
				for iter_2_0, iter_2_1 in pairs(arg_2_4) do
					var_2_1[iter_2_0] = iter_2_1
				end
			end
		end

		table.insert(var_2_0, var_2_1)

		return var_2_0
	end

	function var_1_0.getHighLevelState(arg_3_0, arg_3_1)
		if arg_3_1.status < 0 or arg_3_1.status == var_0_2.status.DEPRECATED then
			return var_0_1.state.FAILED
		elseif arg_3_1.status == var_0_2.status.QUEUED then
			return var_0_1.state.QUEUED
		elseif arg_3_1.status == var_0_2.status.DONE then
			return var_0_1.state.COMPLETED
		else
			return var_0_1.state.IN_PROGRESS
		end
	end

	function var_1_0.getFailureType(arg_4_0, arg_4_1)
		if arg_4_1.status == var_0_2.status.APPLICATION_ERROR then
			return "APPLICATION_ERROR"
		elseif arg_4_1.status == var_0_2.status.PROTOCOL_ERROR then
			return "PROTOCOL_ERROR"
		elseif arg_4_1.status == var_0_2.status.DEPRECATED then
			return "CMDDEPRECATED"
		elseif arg_4_1.status == var_0_2.status.CANCELLED then
			return "CMDCANCELLED"
		elseif arg_4_1.status < 0 then
			return "UNKNOWN_ERROR", {
				detail = "not specified",
				result = arg_4_1.status
			}
		else
			return "NO_FAILURE"
		end
	end

	return var_1_0
end

setmetatable(var_0_4, var_0_3)

return var_0_4
