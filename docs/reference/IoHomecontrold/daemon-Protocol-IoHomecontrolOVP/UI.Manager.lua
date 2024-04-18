local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.Timer")
local var_0_2 = {}
local var_0_3 = {}

function var_0_2.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	if arg_1_1 == nil or arg_1_2 == nil or arg_1_3 == nil or arg_1_4 == nil then
		arg_1_4:warning("UI manager: invalid or missing arguments")
	end

	local var_1_0 = 90
	local var_1_1 = {
		transportOriginator = {},
		timeout = var_0_1.Monotonic()
	}

	var_1_1.timeout:setTime(var_0_0.Monotonic(var_0_0.Elapsed(var_1_0, 0)), true)

	var_1_1.actions = {}
	var_1_1.currentAction = nil
	var_1_1.waitingCommand = {}
	var_1_1.actions = {}

	local function var_1_2()
		if var_1_1.currentAction ~= nil then
			arg_1_4:notice("UI manager: end of " .. var_1_1.currentAction.name .. " action")

			var_1_1.currentAction.running = false
			var_1_1.currentAction = nil
		end

		var_1_1.timeout:stop()

		var_1_1.waitingCommand = {}
	end

	function var_1_1.startAction(arg_3_0, arg_3_1)
		arg_1_4:debug("UI manager: event " .. arg_3_1 .. " received")

		if var_1_1.currentAction == nil then
			if var_1_1.transportOriginator == nil then
				arg_1_4:warning("UI manager: undefined transport delegate, can't start action for event " .. arg_3_1)

				return
			end

			local var_3_0 = var_1_1.actions[arg_3_1]

			if var_3_0 ~= nil then
				arg_1_3:actionProgress()

				var_1_1.currentAction = var_3_0

				arg_1_4:notice("UI manager: starting " .. var_3_0.name .. " action")

				var_1_1.currentAction.running = true
				var_1_1.waitingCommand = var_3_0:launch()

				if var_1_1.waitingCommand == nil then
					var_1_2()
				else
					arg_1_4:debug("UI manager: waiting for group " .. var_1_1.waitingCommand.group .. ", command #" .. var_1_1.waitingCommand.id)
					var_1_1.timeout:start()
				end
			else
				arg_1_4:warning("UI manager: can't start new action for event " .. arg_3_1 .. " (unknown event)")
			end
		else
			arg_1_4:warning("UI manager: action " .. var_1_1.currentAction.name .. " already active, can't start new action for event " .. arg_3_1)
		end
	end

	function var_1_1.registerAction(arg_4_0, arg_4_1, arg_4_2)
		arg_1_4:debug("UI manager: registering action for event " .. arg_4_1)

		if var_1_1.actions[arg_4_1] == nil then
			var_1_1.actions[arg_4_1] = arg_4_2
		else
			arg_1_4:warning("UI manager: duplicate action for event " .. arg_4_1)
		end
	end

	local function var_1_3(arg_5_0, arg_5_1)
		if arg_5_0 == var_1_1.waitingCommand.group and arg_5_1 == var_1_1.waitingCommand.id then
			return true
		end

		return false
	end

	function var_1_1.progressing(arg_6_0, arg_6_1, arg_6_2)
		if var_1_1.currentAction ~= nil then
			var_1_1.currentAction:onProgress()
			var_1_1:restartTimeout()
		end
	end

	function var_1_1.done(arg_7_0, arg_7_1, arg_7_2)
		if var_1_1.currentAction ~= nil and var_1_3(arg_7_1, arg_7_2) then
			var_1_1.currentAction:onDone()
			var_1_2()
		end
	end

	function var_1_1.error(arg_8_0, arg_8_1, arg_8_2)
		if var_1_1.currentAction ~= nil and var_1_3(arg_8_1, arg_8_2) then
			var_1_1.currentAction:onError()
			var_1_2()
		end
	end

	function var_1_1.cancelled(arg_9_0, arg_9_1, arg_9_2)
		if var_1_1.currentAction ~= nil and var_1_3(arg_9_1, arg_9_2) then
			var_1_1.currentAction:onCancel()
			var_1_2()
		end
	end

	function var_1_1.restartTimeout(arg_10_0)
		var_1_1.timeout:stop()
		var_1_1.timeout:start()
	end

	function var_1_1.timeout.expired(arg_11_0)
		arg_1_4:warning("UI manager: action timeout")

		if var_1_1.currentAction ~= nil then
			arg_1_4:warning("     action was " .. var_1_1.currentAction.name .. " (waiting group was " .. tostring(var_1_1.waitingCommand.group) .. ", command #" .. tostring(var_1_1.waitingCommand.id) .. ")")
			var_1_1.currentAction:onTimeout()
		end

		var_1_2()
	end

	return var_1_1
end

setmetatable(var_0_3, var_0_2)

return var_0_3
