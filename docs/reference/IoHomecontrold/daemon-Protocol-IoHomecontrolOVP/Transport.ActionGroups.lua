local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.HomeAutomation.Trigger.Proxy.Launcher")
local var_0_2 = require("Overkiz.moduleUtils")
local var_0_3 = require("Overkiz.HomeAutomation.Utils.OVP.modbusUtils")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_5 = require("Overkiz.HomeAutomation.Trigger.Proxy.DevicesProxy")
local var_0_6 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Transport.Utils.Execution")
local var_0_7 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Bus.Command.Originator")
local var_0_8 = require("Overkiz.Evaluator")
local var_0_9 = require("tableshape").types
local var_0_10 = var_0_0(var_0_1)
local var_0_11 = var_0_9.array_of(var_0_9.shape({
	id = var_0_9.number,
	delay = var_0_9.number:is_optional(),
	category = var_0_9.string:is_optional(),
	value = var_0_9.any,
	valueType = var_0_9.one_of({
		"RAW_VALUE",
		"LUA_EXPRESSION"
	}):is_optional(),
	access = var_0_9.one_of({
		"r",
		"w"
	}),
	type = var_0_9.number,
	node = var_0_9.number,
	ioSpecific = var_0_9.array_of():is_optional(),
	priority = var_0_9.number:is_optional()
}))

local function var_0_12(arg_1_0)
	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_0) do
		table.insert(var_1_0, {
			errorType = 0,
			errorId = 0,
			detailedError = "",
			id = iter_1_1.id,
			address = iter_1_1.node,
			parameter = iter_1_1.type,
			access = var_0_6.Access[iter_1_1.access],
			priority = iter_1_1.priority or var_0_6.CommandPriorities.HIGH,
			value = {
				type = "s",
				data = tostring(iter_1_1.value)
			},
			valueType = iter_1_1.valueType and var_0_6.ValueTypes[iter_1_1.valueType] or var_0_6.ValueTypes.RAW_VALUE,
			originator = var_0_6.Originators[iter_1_1.ioSpecific.originator] or var_0_6.Originators.UNKNOWN,
			acei = iter_1_1.ioSpecific.acei or 0,
			delay = iter_1_1.delay or 0,
			category = iter_1_1.category or "",
			status = var_0_4.status.PENDING
		})
	end

	return var_1_0
end

function var_0_10.new(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5, arg_2_6)
	local var_2_0 = var_0_5()
	local var_2_1 = var_0_1(arg_2_2)

	local function var_2_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		if arg_3_1.originator == var_0_4.originator.UNKNOWN then
			arg_3_1.originator = arg_3_2
		else
			arg_2_6:notice("[ActionGroups]groupdef #" .. arg_3_0 .. ": launch using custom command originator " .. arg_3_1.originator)
		end

		if arg_3_1.acei == var_0_4.acei.UNKNOWN then
			arg_3_1.acei = arg_3_3
		else
			arg_2_6:notice("[ActionGroups]groupdef #" .. arg_3_0 .. ": launch using custom command acei " .. arg_3_1.acei)
		end
	end

	local function var_2_3(arg_4_0)
		local var_4_0 = var_0_2.getDefaultEnvironment()

		var_4_0.testMode = tostring(arg_4_0.testmode)

		function var_4_0.getStateValueGeneric(arg_5_0, arg_5_1, arg_5_2)
			return var_2_0:remoteGet(arg_5_0, arg_5_1, arg_5_2)
		end

		var_4_0.IOAUtils = var_0_2.loadModule("io-atlantic-utils", nil, arg_2_6)
		var_4_0.ModbusUtils = var_0_3

		return var_4_0
	end

	local var_2_4 = var_0_7("/com/overkiz/Application/Group/" .. arg_2_3 .. "/Originator", "com.overkiz.Application.IoHomecontrolOvp.Originator.Command", arg_2_6)

	var_2_4.functionalDelegate = arg_2_0

	function arg_2_0.progress(arg_6_0, arg_6_1, arg_6_2)
		arg_2_1:push("commandResult", {
			execution = arg_6_1.id,
			command = arg_6_2.id,
			result = arg_6_2.status,
			detail = arg_6_2.status <= var_0_4.status.DETAILED_ERROR and arg_6_2.detailedError or nil
		})
	end

	function var_2_1.newActionGroup(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0, var_7_1 = var_0_11:check_value(arg_7_2.commands)

		if not var_7_0 then
			arg_2_6:error(arg_2_3 .. " command is invalid: " .. var_7_1)

			return
		end

		local var_7_2 = {
			id = arg_7_1.launchid
		}
		local var_7_3 = true

		if arg_7_1.options and arg_7_1.options.testmode then
			var_7_3 = arg_7_1.options.testmode
		end

		local var_7_4 = var_0_4.acei.DEFAULT_WITH_COMFORT_LEVEL_4
		local var_7_5 = var_0_4.originator.SAAC

		if arg_7_1.t == "state" then
			if var_7_3 == false then
				var_7_5 = var_0_4.originator.USER
			end
		elseif arg_7_1.t == "week" or arg_7_1.t == "delayed" or arg_7_1.t == "twilight:dawn" or arg_7_1.t == "twilight:dusk" or arg_7_1.t == "calendar" then
			var_7_5 = var_0_4.originator.TIMER
		end

		local var_7_6
		local var_7_7 = {}
		local var_7_8 = var_0_12(arg_7_2.commands)

		for iter_7_0, iter_7_1 in ipairs(var_7_8) do
			if iter_7_1.valueType == var_0_4.valueType.LUA_EXPRESSION then
				var_7_6 = var_7_6 or var_2_3({
					testmode = var_7_3
				})

				local var_7_9 = var_0_8.evaluateString(iter_7_1.value.data, var_7_6, arg_2_0.log)

				if var_7_9.success == true and var_7_9.ret then
					if type(var_7_9.ret) == "table" then
						local var_7_10 = {}

						for iter_7_2, iter_7_3 in pairs(var_7_9.ret) do
							iter_7_1.value = {
								type = "ay",
								data = iter_7_3
							}
							iter_7_1.valueType = var_0_4.valueType.RAW_VALUE

							var_2_2(var_7_2.id, iter_7_1, var_7_5, var_7_4)
							table.insert(var_7_10, iter_7_1)
						end

						arg_2_5:add(var_7_2, iter_7_1, var_2_4.progress, nil, var_7_10)
					else
						iter_7_1.value = {
							type = "ay",
							data = var_7_9.ret
						}
						iter_7_1.valueType = var_0_4.valueType.RAW_VALUE

						var_2_2(var_7_2.id, iter_7_1, var_7_5, var_7_4)
						table.insert(var_7_7, iter_7_1)
					end
				elseif var_7_9.success == true and not var_7_9.ret then
					arg_2_6:warning("[ActionGroups] unable to get value from expression " .. iter_7_1.value.data .. " on command #" .. iter_7_1.id .. " " .. var_7_2.id .. ": " .. tostring(var_7_9.ret))

					iter_7_1.status = var_0_4.status.INVALID_VALUE

					var_2_4.functionalDelegate:progress(var_7_2, iter_7_1, var_0_4.progressEvent.ERROR)
				else
					arg_2_6:warning("[ActionGroups] unable to evaluate expression " .. iter_7_1.value.data .. " on command #" .. iter_7_1.id .. " " .. var_7_2.id .. ": " .. tostring(var_7_9.ret))

					iter_7_1.status = var_0_4.status.INVALID_VALUE

					var_2_4.functionalDelegate:progress(var_7_2, iter_7_1, var_0_4.progressEvent.ERROR)
				end
			else
				var_2_2(var_7_2.id, iter_7_1, var_7_5, var_7_4)
				table.insert(var_7_7, iter_7_1)
			end
		end

		arg_2_4:add(var_2_4, var_7_2, var_7_7)
		arg_7_0:addCanceler(arg_7_1.launchid, arg_7_1.tag)
	end

	function var_2_1.canceled(arg_8_0, arg_8_1)
		arg_2_6:notice("[ActionGroups] cancel groupdef with id " .. arg_8_1)
		arg_2_4:cancel(arg_8_1)
	end
end

return var_0_10
