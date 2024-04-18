local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.constants")
local var_0_2 = {
	name = "Heating Receiver io ON/OFF",
	objects = {
		var_0_0.objects[var_0_1.object6100],
		var_0_0.objects[var_0_1.object6101],
		var_0_0.objects[var_0_1.object6102],
		var_0_0.objects[var_0_1.object6103],
		var_0_0.objects[var_0_1.objectA601],
		var_0_0.objects[var_0_1.objectA603],
		var_0_0.objects[var_0_1.objectA607],
		var_0_0.objects[var_0_1.objectA60C],
		var_0_0.objects[var_0_1.objectA60D],
		var_0_0.objects[var_0_1.objectA60F],
		var_0_0.objects[var_0_1.objectA613],
		var_0_0.objects[var_0_1.objectA614],
		var_0_0.objects[var_0_1.objectA615],
		var_0_0.objects[var_0_1.objectA618],
		var_0_0.objects[var_0_1.objectFFFF]
	}
}
local var_0_3 = {
	name = "Heating Receiver io Dimming",
	objects = {
		var_0_0.objects[var_0_1.object6100],
		var_0_0.objects[var_0_1.object6103],
		var_0_0.objects[var_0_1.objectA601],
		var_0_0.objects[var_0_1.objectA603],
		var_0_0.objects[var_0_1.objectA607],
		var_0_0.objects[var_0_1.objectA60C],
		var_0_0.objects[var_0_1.objectA60D],
		var_0_0.objects[var_0_1.objectA60F],
		var_0_0.objects[var_0_1.objectA613],
		var_0_0.objects[var_0_1.objectA614],
		var_0_0.objects[var_0_1.objectA618],
		var_0_0.objects[var_0_1.objectFFFF]
	}
}

return {
	["5124182"] = var_0_2,
	["5132777"] = var_0_3
}
