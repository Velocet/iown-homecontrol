local var_0_0 = require("Overkiz.Storage")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_2 = {}
local var_0_3 = var_0_0("lightingLedPodMode", 1, "Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.storage")

var_0_2.refresh = {
	startup = true,
	ignoreRecovered = true
}

local function var_0_4()
	local var_1_0 = var_0_3:get()

	if var_1_0 == 1 then
		var_0_1:setEvent("setDefaultOn")
	else
		var_0_1:setEvent("setDefaultOff", var_1_0)
	end
end

function var_0_2.read(arg_2_0, arg_2_1)
	arg_2_0(var_0_3:get())
end

function var_0_2.write(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = tonumber(arg_3_0)

	if var_3_0 then
		var_0_3:push(var_3_0)
		var_0_4()
		arg_3_1(var_0_3:get())
	else
		arg_3_2("Bad value type.")
	end
end

var_0_4()

return var_0_2
