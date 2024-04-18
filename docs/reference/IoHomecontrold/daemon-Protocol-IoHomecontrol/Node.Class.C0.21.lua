local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter1")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.Class.C0.P21")
local var_0_6 = require("Overkiz.utilities")
local var_0_7 = {}

var_0_7.name = "ExteriorHeating"
var_0_7.mpOnlyDeviceSoftwareVersions = {
	{
		("5"):byte(),
		("1"):byte(),
		("3"):byte(),
		("2"):byte(),
		("7"):byte(),
		("7"):byte(),
		("7"):byte()
	}
}

function var_0_7.create(arg_1_0)
	var_0_3:create(var_0_0, arg_1_0)

	local var_1_0 = var_0_5[tostring(var_0_2.getSubProfile(arg_1_0))]

	if var_1_0 ~= nil then
		var_1_0.create(arg_1_0)
	else
		local var_1_1 = var_0_6.tableExtract(arg_1_0.generalinfo[1], 1, 7)

		for iter_1_0, iter_1_1 in pairs(var_0_7.mpOnlyDeviceSoftwareVersions) do
			if var_0_6.tableCompare(var_1_1, iter_1_1) then
				return
			end
		end

		var_0_3:create(var_0_1, arg_1_0)
	end

	if arg_1_0.manufacturer == var_0_2.manufacturers.Somfy then
		var_0_4.createFactoryParameters(arg_1_0)
	end
end

return var_0_7
