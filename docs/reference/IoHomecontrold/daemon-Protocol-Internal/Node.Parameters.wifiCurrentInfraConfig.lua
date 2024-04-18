local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.WifiManager")
local var_0_1 = {
	refresh = {
		startup = true
	},
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
	local var_3_0 = var_0_0:getSavedConfig().ssid

	arg_3_0({
		ssid = var_3_0
	})
end

function var_0_1.set(arg_4_0)
	var_0_2(arg_4_0)
end

return var_0_1
