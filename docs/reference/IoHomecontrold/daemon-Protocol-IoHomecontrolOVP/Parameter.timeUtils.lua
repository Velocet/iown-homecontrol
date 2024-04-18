local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_2 = {
	isTimeUptodate = function()
		local var_1_0 = var_0_0.isUptodate()

		if var_1_0 == false then
			var_0_1:debug("Time is currently not up to date")
		end

		return var_1_0
	end,
	minutesInterval = function(arg_2_0)
		return var_0_0.Monotonic(var_0_0.Elapsed(arg_2_0 * 60, 0))
	end
}

function var_0_2.hoursInterval(arg_3_0)
	return var_0_2.minutesInterval(arg_3_0 * 60)
end

function var_0_2.daysInterval(arg_4_0)
	return var_0_2.hoursInterval(arg_4_0 * 24)
end

var_0_2.recurrent = {
	oncePerDayRandom = {
		hour = 0,
		randomRange = 1440
	}
}

return var_0_2
