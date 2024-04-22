local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.Timer")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.buzz")
local var_0_3 = {}
local var_0_4
local var_0_5 = var_0_1.Monotonic()

local function var_0_6(arg_1_0, arg_1_1)
	local function var_1_0()
		return
	end

	var_0_5:stop()

	var_0_4 = var_0_0.Real.now()

	local var_1_1 = 1000000000

	function var_0_5.expired(arg_3_0, arg_3_1)
		local var_3_0 = var_0_0.Real.now()

		var_0_2.localWrite("01;50;1", var_1_0, var_1_0)

		local var_3_1 = (arg_1_0.seconds * var_1_1 + arg_1_0.nanoseconds - (var_3_0.seconds * var_1_1 + var_3_0.nanoseconds - (var_0_4.seconds * var_1_1 + var_0_4.nanoseconds))) / (arg_1_0.seconds * var_1_1 + arg_1_0.nanoseconds) * (arg_1_1.seconds * var_1_1 + arg_1_1.nanoseconds)

		if var_3_1 > 0.2 * var_1_1 then
			arg_3_0:setTime(var_0_0.Monotonic(var_0_0.Elapsed(var_3_1 / var_1_1, var_3_1 % var_1_1)), true)
			arg_3_0:start()
		else
			var_0_2.localWrite("01;1000;1", var_1_0, var_1_0)
		end
	end

	var_0_2.localWrite("01;50;1", var_1_0, var_1_0)
	var_0_5:setTime(var_0_0.Monotonic(arg_1_1), true)
	var_0_5:start()
end

function var_0_3.write(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0, var_4_1 = arg_4_0:match("(.+);(.+)")

	if arg_4_0 == "stop" then
		var_0_5:stop()
		arg_4_1()

		return
	else
		var_4_1 = var_4_1 or 2
	end

	if not var_4_0 or not var_4_1 then
		arg_4_2("missing args")

		return
	end

	var_0_6(var_0_0.Elapsed(tonumber(var_4_0), 0), var_0_0.Elapsed(tonumber(var_4_1), 0))
	arg_4_1()
end

var_0_2.setCancel(function()
	var_0_5:stop()
end)

return var_0_3
