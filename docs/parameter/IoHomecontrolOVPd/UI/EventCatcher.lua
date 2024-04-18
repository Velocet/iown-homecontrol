local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.interface")
local var_0_1 = {}
local var_0_2 = {}

function var_0_1.__call(arg_1_0)
	local var_1_0 = {
		newEvent = function(arg_2_0, arg_2_1)
			return
		end
	}

	function var_1_0.start(arg_3_0)
		var_0_0:addListener(var_1_0)
	end

	return var_1_0
end

setmetatable(var_0_2, var_0_1)

return var_0_2
