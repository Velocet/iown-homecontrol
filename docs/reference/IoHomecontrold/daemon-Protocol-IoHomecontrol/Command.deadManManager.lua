local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.DeadManManager")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Command.manager")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_3 = var_0_0(var_0_1, var_0_2)

var_0_1:setDeadManManager(var_0_3)

return var_0_3
