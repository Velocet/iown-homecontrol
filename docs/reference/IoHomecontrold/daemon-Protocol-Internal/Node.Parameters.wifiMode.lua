local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.WifiManager")
local var_0_1 = {
	refresh = {},
	watchers = {}
}

function var_0_1.listen(arg_1_0)
	var_0_1.watchers[arg_1_0] = arg_1_0
end

local function var_0_2(arg_2_0)
	for iter_2_0, iter_2_1 in pairs(var_0_1.watchers) do
		iter_2_1(arg_2_0)
	end
end

function var_0_1.read(arg_3_0, arg_3_1)
	arg_3_0(var_0_0:getMode())
end

function var_0_1.write(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0

	local function var_4_1()
		arg_4_1(var_4_0)
	end

	var_0_0:setMode(var_4_0):next(var_4_1, arg_4_2)
end

var_0_0:on(var_0_0.Events.ModeChange, var_0_2)

return var_0_1
