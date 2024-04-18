local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.constants")
local var_0_2 = {
	objects = {
		var_0_0.objects[var_0_1.object1000],
		var_0_0.objects[var_0_1.objectA606],
		var_0_0.objects[var_0_1.objectA60C_SENSOR],
		var_0_0.objects[var_0_1.objectA614],
		var_0_0.objects[var_0_1.objectA615],
		var_0_0.objects[var_0_1.objectA618],
		var_0_0.objects[var_0_1.objectB000],
		var_0_0.objects[var_0_1.objectB001],
		var_0_0.objects[var_0_1.objectB002]
	}
}

return {
	["5155011"] = {
		name = "Ideoi sliding",
		objects = var_0_2.objects
	},
	["5151415"] = {
		name = "Ideoi TiltAndTurn",
		objects = var_0_2.objects
	}
}
