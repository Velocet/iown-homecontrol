local var_0_0 = require("Overkiz.Storage")
local var_0_1 = {}
local var_0_2 = var_0_0("lightingLedModemMode", 1, "Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.storage")

var_0_1.refresh = {
	startup = true,
	ignoreRecovered = true
}

function var_0_1.read(arg_1_0, arg_1_1)
	arg_1_0(var_0_2:get())
end

function var_0_1.write(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = tonumber(arg_2_0)

	if var_2_0 then
		var_0_2:push(var_2_0)
		arg_2_1(var_0_2:get())
	else
		arg_2_2("Bad value type.")
	end
end

function var_0_1.get()
	return var_0_2:get()
end

return var_0_1
