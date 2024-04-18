local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasTargetOnMP")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter10")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter11")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DefaultValueMin")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DefaultValueMax")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.Class.C0.P52")
local var_0_8 = {}

var_0_8.name = "ElectricalHeater"

function var_0_8.create(arg_1_0)
	var_0_6:create(var_0_0, arg_1_0)
	var_0_6:create(var_0_1, arg_1_0)
	var_0_6:create(var_0_2, arg_1_0)
	var_0_6:create(var_0_3, arg_1_0)
	var_0_6:create(var_0_4, arg_1_0)

	local var_1_0 = var_0_7[tostring(var_0_5.getSubProfile(arg_1_0))]

	if var_1_0 then
		var_1_0.create(arg_1_0)
	end
end

return var_0_8
