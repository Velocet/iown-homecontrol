local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasMemorizedPositionOnMP")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.PriorityLock")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.Sunea40Object")
local var_0_7 = require("Overkiz.utilities")
local var_0_8 = {}

var_0_8.name = "VerticalExteriorAwning"
var_0_8.sunea40SoftwareVersion = {
	("5"):byte(),
	("1"):byte(),
	("1"):byte(),
	("8"):byte(),
	("1"):byte(),
	("2"):byte(),
	("6"):byte()
}

function var_0_8.create(arg_1_0)
	var_0_5:create(var_0_0, arg_1_0)
	var_0_5:create(var_0_1, arg_1_0)
	var_0_5:create(var_0_2, arg_1_0)

	if arg_1_0.manufacturer == var_0_4.manufacturers.Somfy then
		var_0_3.createFactoryParameters(arg_1_0)
	end

	local var_1_0 = var_0_7.tableExtract(arg_1_0.generalinfo[1], 1, 7)

	if var_0_7.tableCompare(var_1_0, var_0_8.sunea40SoftwareVersion) and arg_1_0.manufacturer == var_0_4.manufacturers.Somfy then
		var_0_5:create(var_0_6, arg_1_0, nil)
	end
end

return var_0_8
