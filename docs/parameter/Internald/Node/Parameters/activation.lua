local var_0_0 = require("Overkiz.Storage")
local var_0_1 = {}
local var_0_2 = var_0_0("activation", false, "Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.storage")

var_0_1.refresh = {
	startup = true,
	ignoreRecovered = true
}

function var_0_1.read(arg_1_0, arg_1_1)
	arg_1_0(var_0_2:get())
end

function var_0_1.write(arg_2_0, arg_2_1, arg_2_2)
	var_0_2:push(arg_2_0 == true)
	arg_2_1(var_0_2:get())
end

return var_0_1
