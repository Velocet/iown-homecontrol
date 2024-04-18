local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Local.Device.IODeviceManager")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Local.Driver.driver")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.manager")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.refreshManager")
local var_0_5 = var_0_0(var_0_2, var_0_3, var_0_4, var_0_1)

var_0_5:loadDevices()

return var_0_5
