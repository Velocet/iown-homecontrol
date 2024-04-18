local var_0_0 = require("Overkiz.HomeAutomation.Local.Model.Remote.Driver.Driver")
local var_0_1 = require("Overkiz.HomeAutomation.Local.Model.reference")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3 = {}
local var_0_4 = {}

function var_0_3.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local function var_1_0(arg_2_0)
		if arg_2_0 == "r" then
			return var_0_2.access.READ
		elseif arg_2_0 == "w" then
			return var_0_2.access.WRITE
		end

		arg_1_3:warning("IO/OVP Driver : invalid command access " .. tostring(arg_2_0) .. ", should be 'r' or 'w'")

		return nil
	end

	local var_1_1 = {
		[var_0_2.progressEvent.CANCELLED] = "CMDCANCELLED",
		[var_0_2.progressEvent.DEPRECATED] = "CMDDEPRECATED",
		[var_0_2.progressEvent.NO_ANSWER] = "ACTUATORNOANSWER",
		[var_0_2.progressEvent.BUSY_RADIO_ERROR] = "BUSY_RADIO_ERROR",
		[var_0_2.progressEvent.SETUP_REQUIRED] = "SETUP_REQUIRED"
	}
	local var_1_2 = var_0_0(arg_1_1, arg_1_2)

	function var_1_2.buildCommands(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
		local var_3_0 = {}
		local var_3_1 = {}

		if arg_3_2.extraDefinition.parameterId == nil then
			arg_1_3:warning("IO/OVP Driver : missing parameter id on command extra definition")

			return nil
		end

		var_3_0.id = tonumber(arg_3_2.extraDefinition.parameterId)
		var_3_0.defaultAccess = var_1_0(arg_3_2.extraDefinition.access)

		if var_3_0.defaultAccess == nil then
			return nil
		end

		if var_3_0.defaultAccess == var_0_2.access.WRITE then
			var_3_1.priority = var_0_2.priority.HIGH
		end

		var_3_1.parameter = arg_3_4 and arg_3_4.type
		var_3_1.value = {}

		if arg_3_3 == nil then
			var_3_1.value.data = {}
			var_3_1.value.type = "ay"
		else
			var_3_1.value.data = arg_3_3

			if type(arg_3_3) == "number" then
				var_3_1.value.type = "u"
			elseif type(arg_3_3) == "userdata" then
				var_3_1.value.type = "ay"
			else
				arg_1_3:warning("IO/OVP Driver : unable to build command from the given value (type " .. type(arg_3_3) .. ")")

				return nil
			end
		end

		var_3_1.originator = var_0_2.originator.USER

		local var_3_2 = var_0_2:buildParameterCommand(var_3_0, arg_3_1.rawAddress, var_3_1)

		if arg_3_4 then
			if type(arg_3_4) ~= "table" then
				arg_1_3:debug("no commandExtraFields on second part")
			else
				for iter_3_0, iter_3_1 in pairs(arg_3_4) do
					if iter_3_0 == "access" then
						var_3_2[iter_3_0] = var_1_0(iter_3_1)

						if var_3_2[iter_3_0] == nil then
							return nil
						end
					else
						if iter_3_0 == "delay" and type(iter_3_1) ~= "number" then
							arg_1_3:warning("wrong format for delay " .. type(iter_3_1))

							return nil
						end

						var_3_2[iter_3_0] = iter_3_1
					end
				end
			end
		end

		if var_3_2.type then
			var_3_2.parameter = var_3_2.type
		end

		return {
			var_3_2
		}
	end

	function var_1_2.getHighLevelState(arg_4_0, arg_4_1)
		if arg_4_1.status == var_0_2.status.PENDING then
			return var_0_1.state.INITIALIZED
		elseif arg_4_1.status == var_0_2.status.QUEUED then
			return var_0_1.state.QUEUED
		elseif arg_4_1.status == var_0_2.status.DONE then
			return var_0_1.state.COMPLETED
		elseif arg_4_1.status < 0 or arg_4_1.status == var_0_2.status.DEPRECATED then
			return var_0_1.state.FAILED
		else
			return var_0_1.state.IN_PROGRESS
		end
	end

	function var_1_2.getFailureType(arg_5_0, arg_5_1)
		local var_5_0 = var_1_1[arg_5_1.status]

		if var_5_0 then
			return var_5_0
		elseif arg_5_1.status < 0 or arg_5_1.status == var_0_2.progressEvent.ERROR then
			return "UNKNOWN_ERROR", {
				result = arg_5_1.status,
				detailedError = arg_5_1.detailedError
			}
		else
			return "NO_FAILURE"
		end
	end

	return var_1_2
end

setmetatable(var_0_4, var_0_3)

return var_0_4
