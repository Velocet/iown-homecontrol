local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Transport.Utils.Execution")
local var_0_3 = require("tableshape").types
local var_0_4 = var_0_0()

function var_0_4.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.log = arg_1_4
	arg_1_0.dispatcher = arg_1_1
	arg_1_0.commandManager = arg_1_2

	local var_1_0 = var_0_3.shape({
		acei = var_0_3.number,
		originator = var_0_3.one_of({
			"LOCAL_USER",
			"USER",
			"RAIN",
			"TIMER",
			"SECURITY",
			"UPS",
			"SAAC",
			"WIND",
			"MYSELF",
			"LOAD_SHEDDING",
			"LOCAL_LIGHT",
			"UNSPECIFIC_ENVIRONMENT_SENSOR",
			"AUTO_CYCLE",
			"EMERGENCY"
		})
	})
	local var_1_1 = var_0_3.shape({
		id = var_0_3.number,
		delay = var_0_3.number:is_optional(),
		category = var_0_3.string:is_optional(),
		value = var_0_3.any,
		valueType = var_0_3.one_of({
			"RAW_VALUE",
			"LUA_EXPRESSION"
		}):is_optional(),
		access = var_0_3.one_of({
			"r",
			"w"
		}),
		type = var_0_3.number,
		node = var_0_3.number,
		ioSpecific = var_1_0,
		keepAliveTimeout = var_0_3.number:is_optional()
	})
	local var_1_2 = var_0_3.shape({
		id = var_0_3.string,
		commands = var_0_3.array_of(var_1_1)
	})

	local function var_1_3(arg_2_0)
		local var_2_0 = {}

		for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
			table.insert(var_2_0, {
				errorType = 0,
				errorId = 0,
				detailedError = "",
				id = iter_2_1.id,
				address = iter_2_1.node,
				parameter = iter_2_1.type,
				access = var_0_2.Access[iter_2_1.access],
				priority = var_0_2.CommandPriorities.HIGH,
				value = iter_2_1.value and tostring(iter_2_1.value) or "",
				valueType = iter_2_1.valueType and var_0_2.ValueTypes[iter_2_1.valueType] or var_0_2.ValueTypes.RAW_VALUE,
				originator = var_0_2.Originators[iter_2_1.ioSpecific.originator],
				acei = iter_2_1.ioSpecific.acei,
				delay = iter_2_1.delay or 0,
				category = iter_2_1.category or "",
				status = var_0_1.status.PENDING,
				keepAliveTimeout = iter_2_1.keepAliveTimeout
			})
		end

		return var_2_0
	end

	local function var_1_4(arg_3_0, arg_3_1)
		for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
			if iter_3_1.id then
				arg_1_0.dispatcher:push("commandResult", {
					execution = arg_3_0,
					command = iter_3_1.id,
					result = var_0_1.status.INVALID_VALUE
				})
			else
				arg_1_0.log:warning("Received command without id inside execution " .. arg_3_0)
			end
		end
	end

	function arg_1_0.dispatcher.execution(arg_4_0)
		if not arg_4_0.id then
			arg_1_4:error("received execution without id. no error can be sent to server")

			return
		end

		local var_4_0, var_4_1 = var_1_2:check_value(arg_4_0)

		if not var_4_0 then
			arg_1_4:error("malformatted execution (" .. arg_4_0.id .. "): " .. var_4_1)
			var_1_4(arg_4_0.id, arg_4_0.commands)

			return
		end

		local var_4_2 = arg_4_0.id

		arg_1_0.commandManager:add(var_4_2, var_1_3(arg_4_0.commands), function(arg_5_0, arg_5_1, arg_5_2)
			arg_1_0.dispatcher:push("commandResult", {
				execution = var_4_2,
				command = arg_5_0,
				result = arg_5_1,
				detailed = arg_5_1 <= var_0_1.status.DETAILED_ERROR and arg_5_2 or nil
			})
		end)
	end

	local var_1_5 = var_0_3.shape({
		execution = var_0_3.string,
		syncId = var_0_3.string
	})

	function arg_1_0.dispatcher.cancelExecution(arg_6_0, arg_6_1)
		local var_6_0, var_6_1 = var_1_5:check_value(arg_6_0)

		if not var_6_0 then
			return false, var_6_1
		end

		arg_1_0.commandManager:cancel(arg_6_0.execution)

		return true
	end
end

return var_0_4
