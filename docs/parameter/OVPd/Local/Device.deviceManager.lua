local var_0_0 = require("Overkiz.HomeAutomation.Protocol.OVP.Local.Device.OVPDeviceManager")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.OVP.log")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.Local.Driver.driver")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.OVP.Node.manager")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.OVP.Node.refreshManager")
local var_0_5 = var_0_0(var_0_2, var_0_3, var_0_4, var_0_1)

var_0_5:loadDevices()

return var_0_5
