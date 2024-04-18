local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.Time")
local var_0_2 = require("Overkiz.Timer")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_4 = 86400
local var_0_5 = 1800
local var_0_6 = var_0_0()

function var_0_6.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.action = arg_1_1
	arg_1_0.description = arg_1_2 or "Action"
	arg_1_0.failureDelay = arg_1_3 or var_0_5
	arg_1_0.executionHour = math.random(var_0_4) - 1
	arg_1_0.running = true
	arg_1_0.dailyTimer = var_0_2.Monotonic()

	function arg_1_0.dailyTimer.expired()
		arg_1_0:run()
	end

	var_0_3:debug(arg_1_0.description .. " will be executed every day at " .. os.date("!%H:%M:%S", arg_1_0.executionHour))
end

function var_0_6.calculateDelayUntilNext(arg_3_0)
	local var_3_0 = os.date("*t")
	local var_3_1 = os.time({
		hour = 0,
		min = 0,
		year = var_3_0.year,
		month = var_3_0.month,
		day = var_3_0.day,
		sec = arg_3_0.executionHour,
		isdst = var_3_0.isdst
	})

	while var_3_1 < os.time() do
		var_3_1 = var_3_1 + var_0_4
	end

	return var_3_1 - os.time()
end

function var_0_6.run(arg_4_0)
	if arg_4_0.running then
		arg_4_0.action():next(function()
			return {
				message = "succeeded, next execution",
				delay = arg_4_0:calculateDelayUntilNext(),
				logFunction = var_0_3.info
			}
		end):catch(function()
			return {
				message = "failed, will retry",
				delay = arg_4_0.failureDelay,
				logFunction = var_0_3.error
			}
		end):next(function(arg_7_0)
			arg_7_0.logFunction(var_0_3, arg_4_0.description .. " " .. arg_7_0.message .. " in " .. arg_7_0.delay .. " seconds")
			arg_4_0.dailyTimer:setTime(var_0_1.Monotonic(var_0_1.Elapsed(arg_7_0.delay, 0)), true)
			arg_4_0.dailyTimer:start()
		end)
	end
end

function var_0_6.start(arg_8_0)
	arg_8_0.running = true

	var_0_3:debug(arg_8_0.description .. " started")
	arg_8_0:run()
end

function var_0_6.stop(arg_9_0)
	arg_9_0.running = false

	var_0_3:debug(arg_9_0.description .. " stopped")
end

return var_0_6
