local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter16")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasTargetOnMP")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.EtatCapteurs")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.EtatVentilation")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.MinMaxCapteurs")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.GetProg")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.Atlantic.EconomiesEnergie")
local var_0_9 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.Atlantic.HistoriqueCO2")
local var_0_10 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_11 = {}

var_0_11.name = "AutomaticControlledHeatRecoveringVentilation"

function var_0_11.create(arg_1_0)
	var_0_10:create(var_0_1, arg_1_0)
	var_0_10:create(var_0_2, arg_1_0, var_0_2.discreteRefresh)
	var_0_10:create(var_0_3, arg_1_0)
	var_0_10:create(var_0_4, arg_1_0)
	var_0_10:create(var_0_5, arg_1_0)
	var_0_10:create(var_0_6, arg_1_0)
	var_0_10:create(var_0_7, arg_1_0)

	if arg_1_0.manufacturer == var_0_0.manufacturers.Atlantic then
		var_0_10:create(var_0_8, arg_1_0)
		var_0_10:create(var_0_9, arg_1_0)
	end
end

return var_0_11
