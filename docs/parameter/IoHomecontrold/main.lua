local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.mapping")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Transport.Transport")
local var_0_2 = "com.overkiz.Application.IoHomecontrol"

var_0_0:init()
var_0_0:start()

return {
	transport = var_0_1(var_0_2)
}
