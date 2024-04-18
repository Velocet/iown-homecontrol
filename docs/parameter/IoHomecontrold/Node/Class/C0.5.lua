local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasPartialPositionOnMp")
local var_0_5 = require("Overkiz.utilities")
local var_0_6 = {}

var_0_6.name = "GarageDoorOpener"
var_0_6.DexxoSmartSoftwareVersion = {
	("5"):byte(),
	("1"):byte(),
	("3"):byte(),
	("4"):byte(),
	("0"):byte(),
	("8"):byte(),
	("6"):byte()
}

function var_0_6.create(arg_1_0)
	var_0_0:create(var_0_2, arg_1_0)

	if arg_1_0.manufacturer == var_0_1.manufacturers.Somfy then
		var_0_3.createFactoryParameters(arg_1_0)
	end

	local var_1_0 = var_0_5.tableExtract(arg_1_0.generalinfo[1], 1, 7)

	if var_0_5.tableCompare(var_1_0, var_0_6.DexxoSmartSoftwareVersion) and arg_1_0.manufacturer == var_0_1.manufacturers.Somfy then
		var_0_0:create(var_0_4, arg_1_0, nil)
	end
end

return var_0_6
