local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Manager")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.OVP.Node.Class")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.factory")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.OVP.log")
local var_0_4 = var_0_0(var_0_1, var_0_3, "ovp")

var_0_2:setNodeManager(var_0_4)
var_0_4:init()

return var_0_4
