local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter15")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter16")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasEcoModeOnMP")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasComfortOnMP")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasHaltedOnMP")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.factory")
local var_0_7 = {}

var_0_7.name = "HeatPump"

function var_0_7.create(arg_1_0)
	var_0_6:create(var_0_0, arg_1_0)
	var_0_6:create(var_0_1, arg_1_0)
	var_0_6:create(var_0_2, arg_1_0)
	var_0_6:create(var_0_3, arg_1_0)
	var_0_6:create(var_0_4, arg_1_0)
	var_0_6:create(var_0_5, arg_1_0)
end

return var_0_7
