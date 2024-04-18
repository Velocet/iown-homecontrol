local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasMemorizedPositionOnMP")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_3 = {}

var_0_3.name = "CurtainTrack"

function var_0_3.create(arg_1_0)
	var_0_2:create(var_0_0, arg_1_0)
	var_0_2:create(var_0_1, arg_1_0)
end

return var_0_3
