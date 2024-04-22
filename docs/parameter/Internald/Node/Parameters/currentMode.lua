local var_0_0 = require("Overkiz.Storage")
local var_0_1 = {}
local var_0_2 = var_0_0("alarmCurrentMode", 0, "Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.storage")

var_0_1.refresh = {
	startup = true,
	ignoreRecovered = true
}
var_0_1.watchers = {}

function var_0_1.listen(arg_1_0)
	var_0_1.watchers[arg_1_0] = arg_1_0
end

local function var_0_3(arg_2_0)
	for iter_2_0, iter_2_1 in pairs(var_0_1.watchers) do
		iter_2_1(arg_2_0)
	end
end

function var_0_1.read(arg_3_0, arg_3_1)
	arg_3_0(var_0_2:get())
end

function var_0_1.get()
	return var_0_2:get()
end

function var_0_1.set(arg_5_0)
	var_0_2:push(arg_5_0)
	var_0_3(arg_5_0)
end

return var_0_1
