local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.lightingLedModemMode")
local var_0_2 = {}
local var_0_3 = false
local var_0_4 = false

local function var_0_5()
	if not var_0_4 then
		var_0_0:send("#gpio=2,0,1,1")

		var_0_4 = true
	end
end

function var_0_2.write(arg_2_0, arg_2_1, arg_2_2)
	local function var_2_0(arg_3_0, arg_3_1)
		if arg_3_0 then
			arg_2_2(arg_3_1)
		else
			arg_2_1(arg_3_1)
		end
	end

	var_0_5()

	if arg_2_0 == "0" then
		var_0_0:send("#gpio=2,0", var_2_0)

		var_0_3 = false
	elseif arg_2_0 == "ok" then
		local var_2_1 = tostring(var_0_1.get())

		var_0_0:send("#gpio=2," .. var_2_1, var_2_0)

		var_0_3 = true
	elseif arg_2_0 == "update" then
		if var_0_3 then
			local var_2_2 = tostring(var_0_1.get())

			var_0_0:send("#gpio=2," .. var_2_2, var_2_0)
		end
	else
		var_0_0:send("#gpio=2,1", var_2_0)

		var_0_3 = false
	end
end

return var_0_2
