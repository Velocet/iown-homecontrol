local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.Timer")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_3 = require("Overkiz.Storage")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.delay")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.currentMode")
local var_0_6 = {}
local var_0_7 = var_0_3("alarmTargetMode", 0, "Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.storage")

var_0_6.refresh = {
	startup = true,
	ignoreRecovered = true
}

local var_0_8 = var_0_1.Monotonic()

function var_0_8.expired(arg_1_0)
	var_0_2:info("Set current mode to " .. var_0_7:get())
	var_0_5.set(var_0_7:get())
end

local function var_0_9()
	var_0_2:info("Update next alarm mode")

	if var_0_7:get() ~= 0 and var_0_7:get() ~= 2147483648 then
		var_0_2:debug("Delay is " .. tostring(var_0_4.get()))
		var_0_8:setTime(var_0_0.Monotonic(var_0_0.Elapsed(var_0_4.get(), 0)), true)
	else
		var_0_2:debug("Delay is 0")
		var_0_8:setTime(var_0_0.Monotonic(var_0_0.Elapsed(0, 0)), true)
	end

	var_0_8:start()
end

function var_0_6.read(arg_3_0, arg_3_1)
	arg_3_0(var_0_7:get())
end

function var_0_6.write(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = tonumber(arg_4_0)

	if var_4_0 then
		var_0_7:push(var_4_0)
		arg_4_1(var_0_7:get())
		var_0_9()
	else
		arg_4_2("Bad value type.")
	end
end

var_0_9()

return var_0_6
