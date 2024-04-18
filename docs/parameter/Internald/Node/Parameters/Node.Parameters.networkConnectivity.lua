local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_2 = {}
local var_0_3 = "offline"

var_0_2.refresh = {
	startup = true
}

function var_0_2.read(arg_1_0, arg_1_1)
	arg_1_0(var_0_3)
end

var_0_2.watchers = {}

function var_0_2.listen(arg_2_0)
	var_0_2.watchers[arg_2_0] = arg_2_0
end

local function var_0_4(arg_3_0)
	for iter_3_0, iter_3_1 in pairs(var_0_2.watchers) do
		iter_3_1(arg_3_0, true)
	end
end

var_0_2.connectionListener = {}

var_0_1:addListener(var_0_2.connectionListener)

function var_0_2.connectionListener.notified(arg_4_0, arg_4_1)
	if arg_4_1 == "connected" then
		if var_0_3 == "offline" then
			var_0_3 = "online"

			var_0_0:debug("[networkConnectivity]" .. var_0_3)
			var_0_4(var_0_3)
		elseif var_0_3 == "online" then
			-- block empty
		end
	elseif arg_4_1 ~= "disconnected" or var_0_3 == "offline" then
		-- block empty
	elseif var_0_3 == "online" then
		var_0_3 = "offline"

		var_0_0:debug("[networkConnectivity]" .. var_0_3)
		var_0_4(var_0_3)
	end
end

return var_0_2
