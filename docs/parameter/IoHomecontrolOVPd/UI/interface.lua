local var_0_0 = require("Overkiz.Kizbox.Proxy.ui")
local var_0_1 = {
	events = {}
}

var_0_1.events.io = {}
var_0_1.events.io.DISCOVER_ACTUATOR_SIMPLE_WITH_WINK = "discoverActuatorSimpleWithWinkIO"
var_0_1.events.io.DISCOVER_SENSOR_SIMPLE = "discoverSensorSimpleIO"
var_0_1.events.io.WINK_ALL = "winkIO"
var_0_1.events.io.RESET_SETUP = "resetIOSetup"
var_0_1.events.ovp = {}
var_0_1.events.ovp.DISCOVER_ACTUATOR = "discoverActuatorOVP"

function var_0_1.actionEnd(arg_1_0, arg_1_1)
	if arg_1_1 == true then
		var_0_0:setFunction("actionOK")
	else
		var_0_0:setFunction("actionKO")
	end
end

function var_0_1.actionProgress(arg_2_0)
	var_0_0:setFunction("actionPending")
end

function var_0_1.actionNoEffects(arg_3_0)
	var_0_0:setFunction("actionNoEffects")
end

function var_0_1.addListener(arg_4_0, arg_4_1)
	var_0_0:listenForEvents(arg_4_1)
end

return var_0_1
