local var_0_0 = require("Overkiz.HomeAutomation.Protocol.OVP.mapping")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.OVP.Transport.Transport")
local var_0_2 = "com.overkiz.Application.Ovp"

var_0_0:init()
var_0_0:start()

return {
	transport = var_0_1(var_0_2)
}
