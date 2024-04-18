local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_4 = {}

var_0_4.name = "BioClimaticPergola"

function var_0_4.create(arg_1_0)
	var_0_1:create(var_0_0, arg_1_0)

	if arg_1_0.manufacturer == var_0_2.manufacturers.Somfy then
		var_0_3.createFactoryParameters(arg_1_0)
	end
end

return var_0_4
