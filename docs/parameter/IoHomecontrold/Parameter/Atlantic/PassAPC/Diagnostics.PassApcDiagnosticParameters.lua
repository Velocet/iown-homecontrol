local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.PassAPC.Diagnostics.PrivatePassApcDiagnosticParameters")
local var_0_1 = {
	name = "HeatingAndCoolingGeneratorHeatPump",
	objects = {
		var_0_0["200"],
		var_0_0["400"],
		var_0_0["405"],
		var_0_0["406"],
		var_0_0["415"],
		var_0_0["416"],
		var_0_0["417"],
		var_0_0["418"],
		var_0_0["600"],
		var_0_0["601"],
		var_0_0["602"],
		var_0_0["603"],
		var_0_0["800"]
	}
}
local var_0_2 = {
	name = "HeatingAndCoolingGeneratorBoiler",
	objects = {
		var_0_0["100"],
		var_0_0["300"],
		var_0_0["303"],
		var_0_0["304"],
		var_0_0["306"],
		var_0_0["500"],
		var_0_0["501"],
		var_0_0["502"],
		var_0_0["503"],
		var_0_0["510"],
		var_0_0["701"],
		var_0_0["702"],
		var_0_0["703"],
		var_0_0["704"],
		var_0_0["705"],
		var_0_0["706"]
	}
}

return {
	PassAPCHeatPump = var_0_1,
	PassAPCBoiler = var_0_2
}
