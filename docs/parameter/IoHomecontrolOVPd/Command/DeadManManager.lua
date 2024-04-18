local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.Timer")
local var_0_2 = require("Overkiz.Time")
local var_0_3 = var_0_0()
local var_0_4 = 1000000

function var_0_3.new(arg_1_0, arg_1_1, arg_1_2)
	if not arg_1_1 or not arg_1_2 then
		error("Node manager: invalid or missing arguments")
	end

	arg_1_0._log = arg_1_2
	arg_1_0._commandManager = arg_1_1
	arg_1_0._timer = var_0_1.Monotonic()

	function arg_1_0._timer.expired(arg_2_0)
		arg_1_1:setDeadManStatus(false)
	end

	arg_1_0._delayMs = 0
end

function var_0_3.validateDelay(arg_3_0, arg_3_1)
	return arg_3_1 and type(arg_3_1) == "number" and arg_3_1 > 0
end

function var_0_3.start(arg_4_0, arg_4_1)
	if arg_4_0._timer:isRunning() then
		arg_4_0._log:error("[DeadManManager] A deadman is already running. Only one at a time can be launched.")

		return false
	end

	if not arg_4_0:validateDelay(arg_4_1) then
		arg_4_0._log:error("[DeadManManager] Invalid delay: " .. tostring(arg_4_1))

		return false
	end

	arg_4_0._delayMs = arg_4_1

	arg_4_0._timer:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, arg_4_1 * var_0_4)), true)
	arg_4_0._timer:start()
	arg_4_0._commandManager:setDeadManStatus(true)

	return true
end

function var_0_3.isRunning(arg_5_0)
	return arg_5_0._timer:isRunning()
end

function var_0_3.ping(arg_6_0)
	if arg_6_0._timer:isRunning() then
		if not arg_6_0:validateDelay(arg_6_0._delayMs) then
			arg_6_0._log:error("[DeadManManager] Invalid delay: " .. tostring(arg_6_0._delayMs))
		else
			arg_6_0._timer:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, arg_6_0._delayMs * var_0_4)), true)
		end
	end
end

return var_0_3
