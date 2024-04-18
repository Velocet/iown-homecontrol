local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasMemorizedPositionOnMP")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter3")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasMemorizedTiltPositionOnFP3")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasSecuredPositionOnMP")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.PriorityLock")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.SofopuObject")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_8 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_9 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_10 = {}

var_0_10.name = "ExteriorVenitianBlind"

function var_0_10.create(arg_1_0)
	var_0_9:create(var_0_0, arg_1_0)
	var_0_9:create(var_0_1, arg_1_0)
	var_0_9:create(var_0_3, arg_1_0)
	var_0_9:create(var_0_4, arg_1_0)
	var_0_9:create(var_0_5, arg_1_0)
	var_0_9:create(var_0_2, arg_1_0)
	var_0_9:create(var_0_6, arg_1_0)

	if arg_1_0.manufacturer == var_0_8.manufacturers.Somfy then
		var_0_7.createFactoryParameters(arg_1_0)
	end
end

return var_0_10
