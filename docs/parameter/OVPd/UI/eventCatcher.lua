local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.EventCatcher")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.interface")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.UI.manager")
local var_0_3 = var_0_0()

function var_0_3.newEvent(arg_1_0, arg_1_1)
	if arg_1_1 == var_0_1.events.ovp.DISCOVER_ACTUATOR then
		var_0_2:startAction(arg_1_1)
	end
end

return var_0_3
