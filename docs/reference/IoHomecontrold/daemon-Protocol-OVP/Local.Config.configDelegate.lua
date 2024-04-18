local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Local.Config.ConfigDelegate")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.OVP.log")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.Node.manager")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.OVP.Local.Action.executionManager")
local var_0_4 = var_0_0("ovp", var_0_3, var_0_2, var_0_1)
local var_0_5 = {
	supportedModels = {
		device = true,
		action = true,
		state = true
	},
	toSeekList = {
		"com.overkiz.Application.Ovp"
	}
}

function var_0_4.init()
	return var_0_5
end

return var_0_4
