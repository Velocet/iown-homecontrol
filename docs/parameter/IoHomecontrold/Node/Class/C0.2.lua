local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasMemorizedPositionOnMP")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.PriorityLock")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.OneWayPairingObject")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.Class.C0.P2")
local var_0_8 = require("Overkiz.utilities")
local var_0_9 = {}

var_0_9.name = "RollerShutter"

function var_0_9.create(arg_1_0)
	var_0_4:create(var_0_0, arg_1_0)
	var_0_4:create(var_0_1, arg_1_0)
	var_0_4:create(var_0_2, arg_1_0, var_0_2.refreshWithCompleteTrigger)

	local var_1_0 = {
		("5"):byte(),
		("1"):byte(),
		("4"):byte(),
		("1"):byte(),
		("1"):byte(),
		("4"):byte(),
		("6"):byte()
	}
	local var_1_1 = var_0_8.tableExtract(arg_1_0.generalinfo[1], 1, 7)

	if var_0_8.tableCompare(var_1_1, var_1_0) and arg_1_0.manufacturer == var_0_3.manufacturers.Somfy then
		var_0_4:create(var_0_6, arg_1_0, nil)
	end

	if arg_1_0.manufacturer == var_0_3.manufacturers.Somfy then
		var_0_5.createFactoryParameters(arg_1_0)
	end

	local var_1_2 = var_0_7[tostring(var_0_3.getSubProfile(arg_1_0))]

	if var_1_2 ~= nil then
		var_1_2.create(arg_1_0)
	end
end

return var_0_9
