local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Local.Config.ConfigDelegate")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.manager")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Local.Action.executionManager")
local var_0_4 = var_0_0("io", var_0_3, var_0_2, var_0_1)
local var_0_5 = {
	supportedModels = {
		device = true,
		keepAlive = true,
		action = true,
		state = true
	},
	toSeekList = {
		"com.overkiz.Application.IoHomecontrol"
	}
}

function var_0_4.init()
	return var_0_5
end

return var_0_4
