require("Overkiz.utilities")

local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.update")
local var_0_1 = {
	refresh = {
		ignoreRefreshAll = true,
		startup = true,
		retry = true
	}
}

var_0_1.watchers = true

function var_0_1.listen(arg_1_0)
	var_0_1.listener = arg_1_0
end

function var_0_1.read(arg_2_0, arg_2_1)
	arg_2_0(var_0_0.getFile())
end

local function var_0_2(arg_3_0)
	if var_0_1.listener then
		var_0_1.listener(arg_3_0)
	end
end

var_0_0.updateStatusNotifier:addListener(var_0_2)

return var_0_1
