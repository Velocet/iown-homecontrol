local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.constants")
local var_0_2 = require("Overkiz.utilities")
local var_0_3 = {
	name = "RS100",
	objects = {
		var_0_0.objects[var_0_1.object6103],
		var_0_0.objects[var_0_1.object6104],
		var_0_0.objects[var_0_1.object0000],
		var_0_0.objects[var_0_1.objectFFFD],
		var_0_0.objects[var_0_1.objectA601],
		var_0_0.objects[var_0_1.objectA602],
		var_0_0.objects[var_0_1.objectA603],
		var_0_0.objects[var_0_1.objectA604],
		var_0_0.objects[var_0_1.objectA606],
		var_0_0.objects[var_0_1.objectA607],
		var_0_0.objects[var_0_1.objectA609],
		var_0_0.objects[var_0_1.objectA60B],
		var_0_0.objects[var_0_1.objectA60C],
		var_0_0.objects[var_0_1.objectA60D],
		var_0_0.objects[var_0_1.objectA60F],
		var_0_0.objects[var_0_1.objectA610],
		var_0_0.objects[var_0_1.objectA612],
		var_0_0.objects[var_0_1.objectA613],
		var_0_0.objects[var_0_1.objectA614],
		var_0_0.objects[var_0_1.objectA615],
		var_0_0.objects[var_0_1.objectA617],
		var_0_0.objects[var_0_1.objectA618],
		var_0_0.objects[var_0_1.objectA619],
		var_0_0.objects[var_0_1.objectA61A]
	}
}
local var_0_4 = {
	name = "Izymo RS micromodule",
	objects = {
		var_0_0.objects[var_0_1.object6103],
		var_0_0.objects[var_0_1.objectA601],
		var_0_0.objects[var_0_1.objectA602],
		var_0_0.objects[var_0_1.objectA603],
		var_0_0.objects[var_0_1.objectA606],
		var_0_0.objects[var_0_1.objectA607],
		var_0_0.objects[var_0_1.objectA609],
		var_0_0.objects[var_0_1.objectA60C],
		var_0_0.objects[var_0_1.objectA60D],
		var_0_0.objects[var_0_1.objectA60F],
		var_0_0.objects[var_0_1.objectA614],
		var_0_0.objects[var_0_1.objectA618]
	}
}
local var_0_5 = {
	name = "Solus P&P 50",
	objects = {
		var_0_0.objects[var_0_1.object6100],
		var_0_0.objects[var_0_1.object6103],
		var_0_0.objects[var_0_1.objectA601],
		var_0_0.objects[var_0_1.objectA602],
		var_0_0.objects[var_0_1.objectA603],
		var_0_0.objects[var_0_1.objectA607],
		var_0_0.objects[var_0_1.objectA609],
		var_0_0.objects[var_0_1.objectA60A],
		var_0_0.objects[var_0_1.objectA60C],
		var_0_0.objects[var_0_1.objectA60D],
		var_0_0.objects[var_0_1.objectA60F],
		var_0_0.objects[var_0_1.objectA613],
		var_0_0.objects[var_0_1.objectA614],
		var_0_0.objects[var_0_1.objectA615],
		var_0_0.objects[var_0_1.objectA618],
		var_0_0.objects[var_0_1.objectA61A]
	}
}
local var_0_6 = var_0_2.tableDeepCopy(var_0_5)

var_0_6.name = "Ilmo 2 50"

local var_0_7 = {
	name = "Short Motor IO",
	objects = {
		var_0_0.objects[var_0_1.object6100],
		var_0_0.objects[var_0_1.object6101]
	}
}
local var_0_8 = {
	name = "Awmio / Oximo CQFD",
	objects = {
		var_0_0.objects[var_0_1.object0000],
		var_0_0.objects[var_0_1.object6100],
		var_0_0.objects[var_0_1.object6101],
		var_0_0.objects[var_0_1.objectA60E]
	}
}
local var_0_9 = {
	name = "Oximo 40 / Altus RS IO",
	objects = {
		var_0_0.objects[var_0_1.object0000],
		var_0_0.objects[var_0_1.object6100],
		var_0_0.objects[var_0_1.object6101],
		var_0_0.objects[var_0_1.object6103],
		var_0_0.objects[var_0_1.objectA601],
		var_0_0.objects[var_0_1.objectA602],
		var_0_0.objects[var_0_1.objectA603],
		var_0_0.objects[var_0_1.objectA607],
		var_0_0.objects[var_0_1.objectA609],
		var_0_0.objects[var_0_1.objectA60A],
		var_0_0.objects[var_0_1.objectA60C],
		var_0_0.objects[var_0_1.objectA60D],
		var_0_0.objects[var_0_1.objectA60E],
		var_0_0.objects[var_0_1.objectA60F],
		var_0_0.objects[var_0_1.objectA613],
		var_0_0.objects[var_0_1.objectA614],
		var_0_0.objects[var_0_1.objectA615],
		var_0_0.objects[var_0_1.objectA618]
	}
}
local var_0_10 = {
	name = "Oximo 40 Solar IO",
	objects = {
		var_0_0.objects[var_0_1.object6103],
		var_0_0.objects[var_0_1.object6104],
		var_0_0.objects[var_0_1.object6105],
		var_0_0.objects[var_0_1.objectA601],
		var_0_0.objects[var_0_1.objectA602],
		var_0_0.objects[var_0_1.objectA603],
		var_0_0.objects[var_0_1.objectA607],
		var_0_0.objects[var_0_1.objectA609],
		var_0_0.objects[var_0_1.objectA60C],
		var_0_0.objects[var_0_1.objectA60D],
		var_0_0.objects[var_0_1.objectA60F],
		var_0_0.objects[var_0_1.objectA613],
		var_0_0.objects[var_0_1.objectA614],
		var_0_0.objects[var_0_1.objectA618]
	}
}

return {
	["5113386"] = var_0_3,
	["5113387"] = var_0_3,
	["5113388"] = var_0_3,
	["5113389"] = var_0_3,
	["5113390"] = var_0_3,
	["5113391"] = var_0_3,
	["5113392"] = var_0_3,
	["5113393"] = var_0_3,
	["5120725"] = var_0_3,
	["5120726"] = var_0_3,
	["5120727"] = var_0_3,
	["5120728"] = var_0_3,
	["5120729"] = var_0_3,
	["5120730"] = var_0_3,
	["5120731"] = var_0_3,
	["5120732"] = var_0_3,
	["5128569"] = var_0_3,
	["5128570"] = var_0_3,
	["5128571"] = var_0_3,
	["5128572"] = var_0_3,
	["5128573"] = var_0_3,
	["5128574"] = var_0_3,
	["5139319"] = var_0_3,
	["5139320"] = var_0_3,
	["5139321"] = var_0_3,
	["5139322"] = var_0_3,
	["5140200"] = var_0_5,
	["5140201"] = var_0_6,
	["5141146"] = var_0_4,
	["5067346"] = var_0_7,
	["5117737"] = var_0_7,
	["5012597"] = var_0_8,
	["5100394"] = var_0_8,
	["5120877"] = var_0_9,
	["5129486"] = var_0_9,
	["5158759"] = var_0_10,
	["5151297"] = var_0_10,
	["5151298"] = var_0_10,
	["5151299"] = var_0_10
}
