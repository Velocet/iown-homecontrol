local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.Manager")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.interface")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.Actions.Discover")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.Actions.WinkAll")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.Actions.ResetSetup")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DiscoverActuatorSimple")
local var_0_6 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DiscoverSensorSimple")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.manager")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Command.manager")
local var_0_9 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.resyncModule")
local var_0_10 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_11 = var_0_0(var_0_7, var_0_8, var_0_1, var_0_10)

function var_0_11.start(arg_1_0)
	var_0_11:registerAction(var_0_1.events.io.DISCOVER_ACTUATOR_SIMPLE_WITH_WINK, var_0_2(var_0_11.transportOriginator, var_0_7, var_0_8, var_0_1, var_0_9, var_0_10, var_0_5, true))
	var_0_11:registerAction(var_0_1.events.io.DISCOVER_SENSOR_SIMPLE, var_0_2(var_0_11.transportOriginator, var_0_7, var_0_8, var_0_1, var_0_9, var_0_10, var_0_6))
	var_0_11:registerAction(var_0_1.events.io.WINK_ALL, var_0_3(var_0_11.transportOriginator, var_0_7, var_0_8, var_0_1, var_0_9, var_0_10))
	var_0_11:registerAction(var_0_1.events.io.RESET_SETUP, var_0_4(var_0_11.transportOriginator, var_0_7, var_0_8, var_0_1, var_0_9, var_0_10))
end

return var_0_11
