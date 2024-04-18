local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.State.Manager")
local var_0_1 = require("Overkiz.OOP.Class")

local function var_0_2(arg_1_0)
	local var_1_0 = arg_1_0.value.data

	if type(var_1_0) == "userdata" then
		var_1_0 = var_1_0:tostring("base64")
	end

	return {
		node = arg_1_0.address,
		type = arg_1_0.parameter,
		value = var_1_0,
		updateTime = arg_1_0.time.seconds
	}
end

local var_0_3 = var_0_1()

function var_0_3.new(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.dispatcher = arg_2_1
	arg_2_0.log = arg_2_3

	arg_2_2:on(var_0_0.events.RAW_DATA, function(arg_3_0)
		arg_2_0.dispatcher:push("state", var_0_2(arg_3_0))
	end)

	function arg_2_1.getStates(arg_4_0)
		local var_4_0 = arg_2_2:getStates()

		for iter_4_0, iter_4_1 in ipairs(var_4_0) do
			arg_2_0.dispatcher:push("state", var_0_2(iter_4_1))
		end

		return true
	end

	function arg_2_1.refreshAll(arg_5_0)
		arg_2_2:refreshAll()

		return true
	end
end

return var_0_3
