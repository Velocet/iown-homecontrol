local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.Manager")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.interface")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.Actions.Discover")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DiscoverActuator")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.OVP.Node.manager")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.OVP.Command.manager")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.OVP.resyncModule")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.OVP.log")
local var_0_8 = var_0_0(var_0_4, var_0_5, var_0_1, var_0_7)

function var_0_8.start(arg_1_0)
	var_0_8:registerAction(var_0_1.events.ovp.DISCOVER_ACTUATOR, var_0_2(var_0_8.transportOriginator, var_0_4, var_0_5, var_0_1, var_0_6, var_0_7, var_0_3))
end

return var_0_8
