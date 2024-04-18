local var_0_0 = require("Overkiz.HomeAutomation.Local.Model.Remote.Device.DeviceDelegate")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.OVP.log")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.Local.Device.deviceManager")
local var_0_3 = var_0_0("ovp", var_0_2, var_0_1)

var_0_2.deviceDelegate = var_0_3

return var_0_3
