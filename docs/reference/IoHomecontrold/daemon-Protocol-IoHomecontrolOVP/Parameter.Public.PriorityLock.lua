local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.timeUtils")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3 = require("Overkiz.utilities")
local var_0_4 = 12
local var_0_5 = {}

local function var_0_6(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_2:lookupParameterById(var_0_4).refreshDef

	if var_1_0 == nil then
		return
	end

	if arg_1_1.data ~= "time=0" then
		if var_1_0.intervalTimer and var_1_0.intervalTimer:isRunning() == false then
			if var_0_5.log ~= nil then
				var_0_5.log:info("   priority lock: starting periodic refresh")
			end

			var_1_0.intervalTimer:start()
		end
	elseif var_1_0.intervalTimer and var_1_0.intervalTimer:isRunning() == true then
		if var_0_5.log ~= nil then
			var_0_5.log:info("   priority lock: stopping periodic refresh")
		end

		var_1_0.intervalTimer:stop()
	end
end

local var_0_7 = {
	dynamicRefresh = true,
	startup = true,
	oncommand = true,
	interval = var_0_0.hoursInterval(1),
	info = {
		acei = 71
	},
	refreshTriggers = var_0_6
}

var_0_5 = var_0_1(var_0_4, var_0_2.access.READ, var_0_7)
var_0_5.id = var_0_4

local function var_0_8(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_2:lookupParameterById(var_0_4).refreshDef

	if var_2_0 == nil then
		return
	end

	if arg_2_1.data ~= "time=0" then
		if var_2_0.intervalTimer and var_2_0.intervalTimer:isRunning() == false then
			if var_0_5.log ~= nil then
				var_0_5.log:info("   priority lock: starting periodic and command refresh")
			end

			var_2_0.intervalTimer:start()

			var_2_0.resync.oncommand = true
		end
	elseif var_2_0.intervalTimer and var_2_0.intervalTimer:isRunning() == true then
		if var_0_5.log ~= nil then
			var_0_5.log:info("   priority lock: stopping periodic and command refresh")
		end

		var_2_0.intervalTimer:stop()

		var_2_0.resync.oncommand = false
	end
end

var_0_5.refreshWithCompleteTrigger = var_0_3.tableDeepCopy(var_0_7)
var_0_5.refreshWithCompleteTrigger.refreshTriggers = var_0_8

return var_0_5
