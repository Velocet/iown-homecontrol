local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.constants")
local var_0_2 = {
	var_0_0.objects[var_0_1.object6100],
	var_0_0.objects[var_0_1.object6101],
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
	var_0_0.objects[var_0_1.objectA618]
}
local var_0_3 = {
	var_0_0.objects[var_0_1.object6103],
	var_0_0.objects[var_0_1.objectA602],
	var_0_0.objects[var_0_1.objectA603],
	var_0_0.objects[var_0_1.objectA607],
	var_0_0.objects[var_0_1.objectA609],
	var_0_0.objects[var_0_1.objectA60C],
	var_0_0.objects[var_0_1.objectA60D],
	var_0_0.objects[var_0_1.objectA60F],
	var_0_0.objects[var_0_1.objectA614],
	var_0_0.objects[var_0_1.objectA618]
}
local var_0_4 = {
	var_0_0.objects[var_0_1.object6103],
	var_0_0.objects[var_0_1.objectA602],
	var_0_0.objects[var_0_1.objectA603],
	var_0_0.objects[var_0_1.objectA607],
	var_0_0.objects[var_0_1.objectA608],
	var_0_0.objects[var_0_1.objectA609],
	var_0_0.objects[var_0_1.objectA60C],
	var_0_0.objects[var_0_1.objectA60D],
	var_0_0.objects[var_0_1.objectA60F],
	var_0_0.objects[var_0_1.objectA614],
	var_0_0.objects[var_0_1.objectA618]
}

return {
	["5109156"] = {
		name = "Light Receiver Dimming",
		objects = var_0_2
	},
	["5113142"] = {
		name = "Light Receiver On/Off",
		objects = var_0_2
	},
	["5133033"] = {
		name = "White LED Receiver",
		objects = var_0_2
	},
	["5135418"] = {
		name = "RGB LED receiver",
		objects = var_0_2
	},
	["5135669"] = {
		name = "Tuneable White LED Receiver",
		objects = var_0_2
	},
	["5154604"] = {
		name = "Izymo 2 Channel Micromodule",
		objects = var_0_3
	},
	["5143804"] = {
		name = "Izymo Dimmer Micromodule",
		objects = var_0_4
	}
}
