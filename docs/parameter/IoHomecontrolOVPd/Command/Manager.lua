local var_0_0 = require("Overkiz.UUID")
local var_0_1 = require("Overkiz.Event")
local var_0_2 = require("Overkiz.Timer")
local var_0_3 = require("Overkiz.Time")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_5 = require("Overkiz.utilities")
local var_0_6 = require("Overkiz.Type.ByteArray")
local var_0_7 = {}
local var_0_8 = {}

function var_0_7.__call(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2 == nil then
		arg_1_2:warning("Command manager: invalid or missing arguments")
	end

	local var_1_0 = {
		cppCommandManager = arg_1_1
	}

	var_1_0.deadManManager = nil
	var_1_0.refreshOriginatorDelegate = nil
	var_1_0.lastId = 0
	var_1_0.maxCommandsNumberPerSession = 20
	var_1_0.interSessionFreeTime = 1

	local var_1_1 = {
		noOriginator = {}
	}

	var_1_1.noOriginator.commands = {}

	local var_1_2 = var_0_1()
	local var_1_3 = var_0_2.Monotonic()

	var_1_3:setTime(var_0_3.Monotonic(var_0_3.Elapsed(var_1_0.interSessionFreeTime, 0)), true)

	function var_1_0.setMaxCommandsNumberPerSession(arg_2_0, arg_2_1)
		if arg_2_1 == nil or type(arg_2_1) ~= "number" or arg_2_1 < 1 then
			arg_1_2:warning("Invalid maxCommandsNumberPerSession setting " .. tostring(arg_2_1) .. ": should be a positive integer")
		else
			var_1_0.maxCommandsNumberPerSession = arg_2_1
		end

		return var_1_0.maxCommandsNumberPerSession
	end

	function var_1_0.setInterSessionFreeTime(arg_3_0, arg_3_1)
		if arg_3_1 == nil or type(arg_3_1) ~= "number" or arg_3_1 < 1 then
			arg_1_2:warning("Invalid interSessionFreeTime setting " .. tostring(arg_3_1) .. ": should be a positive integer")
		else
			var_1_0.interSessionFreeTime = arg_3_1

			var_1_3:setTime(var_0_3.Monotonic(var_0_3.Elapsed(var_1_0.interSessionFreeTime, 0)), true)
		end

		return var_1_0.interSessionFreeTime
	end

	function var_1_0.addBufferedCommands(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = var_1_1.noOriginator.commands

		if arg_4_1 ~= nil then
			if arg_4_1.id == nil then
				arg_1_2:warning("Command manager: undefined originator id")
				arg_1_2:debug("  Add buffered commands with no originator")
			else
				if var_1_1[tostring(arg_4_1.id)] == nil then
					var_1_1[tostring(arg_4_1.id)] = {}
					var_1_1[tostring(arg_4_1.id)].transportOriginator = arg_4_1
					var_1_1[tostring(arg_4_1.id)].commands = {}
				end

				var_4_0 = var_1_1[tostring(arg_4_1.id)].commands

				arg_1_2:debug("  Add buffered commands with originator " .. tostring(arg_4_1.id))
			end
		else
			arg_1_2:debug("  Add buffered commands with no originator")
		end

		for iter_4_0, iter_4_1 in pairs(arg_4_2) do
			iter_4_1.id = var_1_0.lastId + 1
			var_1_0.lastId = var_1_0.lastId + 1

			arg_1_2:debug("    command: parameter=" .. iter_4_1.parameter .. " node=" .. iter_4_1.address .. " id=" .. iter_4_1.id)
			table.insert(var_4_0, iter_4_1)
		end

		var_1_2:send()
	end

	function var_1_2.receive(arg_5_0)
		if not var_1_3:isRunning() then
			var_1_0:sendBufferedCommands()
		end
	end

	function var_1_3.expired(arg_6_0)
		arg_1_2:debug("Buffer timer expired")
		var_1_0:sendBufferedCommands()
	end

	function var_1_0.sendBufferedCommands(arg_7_0)
		local var_7_0 = var_1_0.maxCommandsNumberPerSession
		local var_7_1 = true

		for iter_7_0, iter_7_1 in pairs(var_1_1) do
			if var_7_0 - #iter_7_1.commands >= 0 then
				var_1_0:add(iter_7_1.transportOriginator, var_1_0:generateGroup(), iter_7_1.commands)

				var_7_0 = var_7_0 - #iter_7_1.commands
				iter_7_1.commands = {}
			else
				var_1_0:add(iter_7_1.transportOriginator, var_1_0:generateGroup(), var_0_5.tableExtract(iter_7_1.commands, 1, var_7_0))

				iter_7_1.commands = var_0_5.tableExtract(iter_7_1.commands, var_7_0 + 1, #iter_7_1.commands)

				arg_1_2:info("Max number of commands per session reached (" .. var_1_0.maxCommandsNumberPerSession .. ") giving back free time...")
				var_1_3:start()

				var_7_1 = false

				break
			end
		end

		if var_7_1 then
			var_1_0.lastId = 0
		end
	end

	function var_1_0.setDeadManManager(arg_8_0, arg_8_1)
		var_1_0.deadManManager = arg_8_1
	end

	function var_1_0.add(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
		if type(arg_9_3) == "table" then
			local var_9_0 = arg_9_1
			local var_9_1 = arg_9_2
			local var_9_2 = arg_9_3

			for iter_9_0, iter_9_1 in pairs(var_9_2) do
				if iter_9_1.value then
					if iter_9_1.value.type == "ay" then
						iter_9_1.value = var_0_6(iter_9_1.value.data)
					else
						iter_9_1.value = iter_9_1.value.data
					end
				end
			end

			arg_9_1 = var_9_1.id
			arg_9_2 = var_9_2

			if var_9_0 ~= nil then
				function arg_9_3(arg_10_0, arg_10_1, arg_10_2)
					if var_9_0.functionalDelegate ~= nil and type(var_9_0.functionalDelegate.progress) == "function" then
						var_9_0.functionalDelegate:progress(var_9_1, {
							id = arg_10_0,
							status = arg_10_1,
							detailedStatus = arg_10_2
						}, arg_10_1)
					else
						arg_1_2:warning("Command originator: undefined delegate function progress")
					end
				end
			end
		end

		local var_9_3 = {}

		for iter_9_2, iter_9_3 in ipairs(arg_9_2) do
			if type(iter_9_3) == "table" and iter_9_3.id then
				local var_9_4 = true

				if var_1_0.deadManManager and iter_9_3.keepAliveTimeout then
					if not var_1_0.deadManManager:isRunning() then
						var_1_0.deadManManager:start(iter_9_3.keepAliveTimeout)
					else
						arg_9_3(iter_9_3.id, var_0_4.status.NON_EXECUTING)

						var_9_4 = false
					end
				end

				if var_9_4 then
					table.insert(var_9_3, iter_9_3)
				end
			else
				arg_1_2:warning("Received command without id inside execution " .. arg_9_1)
			end
		end

		arg_1_2:info("  send new group " .. arg_9_1 .. " (" .. tostring(#var_9_3) .. " validCommands)")
		var_1_0.cppCommandManager:add(arg_9_1, var_9_3, arg_9_3)
	end

	function var_1_0.addParameterCommand(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
		local var_11_0 = var_0_4:buildParameterCommand(arg_11_2, arg_11_3, arg_11_4)
		local var_11_1 = {}

		table.insert(var_11_1, var_11_0)

		local var_11_2 = var_1_0:generateGroup()

		var_1_0:add(arg_11_1, var_11_2, var_11_1)

		return var_11_2.id
	end

	function var_1_0.addBufferedParameterCommand(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
		local var_12_0 = var_0_4:buildParameterCommand(arg_12_2, arg_12_3, arg_12_4)

		var_1_0:addBufferedCommands(arg_12_1, {
			var_12_0
		})
	end

	function var_1_0.generateGroup(arg_13_0)
		return {
			id = var_0_0.generate()
		}
	end

	function var_1_0.cancel(arg_14_0, arg_14_1)
		arg_1_2:debug("  cancel group " .. arg_14_1)
		var_1_0.cppCommandManager:cancel(arg_14_1)
	end

	function var_1_0.setDeadManStatus(arg_15_0, arg_15_1)
		var_1_0.cppCommandManager:setDeadManStatus(arg_15_1)
	end

	return var_1_0
end

setmetatable(var_0_8, var_0_7)

return var_0_8
