local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.Timer")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_3 = {}
local var_0_4 = var_0_1.Monotonic()

var_0_4:setTime(var_0_0.Monotonic(var_0_0.Elapsed(30, 0)), true)

var_0_3.refresh = {}

local function var_0_5(arg_1_0)
	for iter_1_0, iter_1_1 in pairs(var_0_3.watchers) do
		iter_1_1(arg_1_0, true)
	end
end

local var_0_6 = {}
local var_0_7 = false

function var_0_6.modified(arg_2_0, arg_2_1)
	function var_0_4.expired(arg_3_0)
		var_0_7 = false
	end

	if arg_2_1 == "touchButton" then
		if var_0_4:isRunning() then
			if not var_0_7 then
				var_0_5("stopEvent")
				var_0_2:setEvent("stop")
			else
				var_0_2:setEvent("stop")
			end

			var_0_7 = true
		else
			var_0_5("pressedEvent")
			var_0_2:setEvent("play")
			var_0_4:start()
		end
	end
end

var_0_2:addFunctionsListener(var_0_6)

var_0_3.watchers = {}

function var_0_3.listen(arg_4_0)
	var_0_3.watchers[arg_4_0] = arg_4_0
end

return var_0_3
