local var_0_0 = require("Overkiz.HomeAutomation.Local.Model.Remote.State.StateDelegate")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Local.State.stateManager")
local var_0_3 = var_0_0("io", var_0_2, var_0_1)

var_0_2.stateDelegate = var_0_3

return var_0_3
