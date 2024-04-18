local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_1 = require("Overkiz.HomeAutomation.Local.Model.Remote.Action.ActionDelegate")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Local.Action.executionManager")
local var_0_3 = var_0_1("io", var_0_2, var_0_0)

var_0_2.actionDelegate = var_0_3

return var_0_3
