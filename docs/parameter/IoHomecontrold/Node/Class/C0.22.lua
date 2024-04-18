local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter15")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter16")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasEcoModeOnMP")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasComfortOnMP")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasHaltedOnMP")
local var_0_6 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.Class.C0.P22")
local var_0_9 = {}

var_0_9.name = "HeatingAndCoolingGenerator"

function var_0_9.create(arg_1_0)
	local var_1_0 = var_0_8[tostring(var_0_6.getSubProfile(arg_1_0))]

	if var_1_0 ~= nil then
		var_1_0.create(arg_1_0)
	end

	if arg_1_0.manufacturer ~= var_0_6.manufacturers.Atlantic then
		var_0_7:create(var_0_0, arg_1_0)
		var_0_7:create(var_0_1, arg_1_0)
		var_0_7:create(var_0_2, arg_1_0)
		var_0_7:create(var_0_3, arg_1_0)
		var_0_7:create(var_0_4, arg_1_0)
		var_0_7:create(var_0_5, arg_1_0)
	end
end

return var_0_9
