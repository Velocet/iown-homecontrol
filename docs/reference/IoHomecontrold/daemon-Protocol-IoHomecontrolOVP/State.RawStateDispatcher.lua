local var_0_0 = require("Overkiz.HomeAutomation.Trigger.Proxy.DevicesProxy")
local var_0_1 = require("Overkiz.Kizbox.id")
local var_0_2 = {}
local var_0_3 = {}

function var_0_2.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = var_0_0()

	function var_1_0.notified(arg_2_0, arg_2_1)
		if arg_2_1.rawStateId ~= nil and arg_2_1.nodeAddress ~= nil and arg_2_1.rawStatevalue ~= nil then
			local var_2_0 = arg_1_1 .. "://" .. var_0_1() .. "/" .. arg_2_1.nodeAddress

			var_1_0:remoteUpdate(var_2_0, arg_1_1, "DataState/" .. arg_2_1.rawStateId, arg_2_1.rawStatevalue)
		end
	end

	arg_1_2:addListener(var_1_0)

	return var_1_0
end

setmetatable(var_0_3, var_0_2)

return var_0_3
