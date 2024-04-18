local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.timeUtils")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.Name")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter9")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasTargetOnMP")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasHaltedOnMP")
local var_0_6 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasSecuredPositionOnMP")
local var_0_7 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasSetbackOnMP")
local var_0_8 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasComfortOnMP")
local var_0_9 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DefaultValueMin")
local var_0_10 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DefaultValueMax")
local var_0_11 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_12 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_13 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Thermostat.Devices")
local var_0_14 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Thermostat.SerialNumber")
local var_0_15 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Thermostat.Battery")
local var_0_16 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Thermostat.Alive")
local var_0_17 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.factory")
local var_0_18 = {}

var_0_18.name = "ImhotepThermostatGateway"

function var_0_18.create(arg_1_0)
	local var_1_0 = {
		info = {
			parameter = 234946567,
			access = var_0_12.access.READ,
			value = {
				data = 0,
				type = "y"
			}
		}
	}
	local var_1_1 = {
		startup = true,
		oncommand = true,
		interval = var_0_0.hoursInterval(24),
		info = {
			parameter = 234946563,
			access = var_0_12.access.READ,
			value = {
				data = 0,
				type = "y"
			}
		}
	}
	local var_1_2 = {}
	local var_1_3 = {
		startup = true,
		oncommand = true,
		interval = var_0_0.hoursInterval(24)
	}
	local var_1_4 = {
		startup = true,
		oncommand = true
	}
	local var_1_5 = {
		onRefreshNode = true,
		startup = true,
		oncommand = true,
		supportMpFp = true,
		interval = var_0_0.hoursInterval(1)
	}

	var_0_17:create(var_0_9, arg_1_0)
	var_0_17:create(var_0_10, arg_1_0)

	if arg_1_0.manufacturer == var_0_11.manufacturers.Overkiz then
		var_0_17:create(var_0_4, arg_1_0, var_1_2)
		var_0_17:create(var_0_6, arg_1_0, var_1_3)
		var_0_17:create(var_0_7, arg_1_0, var_1_3)
		var_0_17:create(var_0_8, arg_1_0, var_1_3)
		var_0_17:create(var_0_2, arg_1_0, var_1_2)
		var_0_17:create(var_0_3, arg_1_0)
		var_0_17:create(var_0_13, arg_1_0)
		var_0_17:create(var_0_14[1], arg_1_0)
		var_0_17:create(var_0_15[1], arg_1_0, var_1_1)
		var_0_17:create(var_0_16[1], arg_1_0, var_1_0)
	elseif arg_1_0.manufacturer == var_0_11.manufacturers.Somfy then
		var_0_17:create(var_0_4, arg_1_0, var_1_2)
		var_0_17:create(var_0_5, arg_1_0, var_1_2)
		var_0_17:create(var_0_6, arg_1_0, var_1_4)
		var_0_17:create(var_0_7, arg_1_0, var_1_4)
		var_0_17:create(var_0_8, arg_1_0, var_1_4)
		var_0_17:create(var_0_3, arg_1_0, var_1_5)
	end

	var_0_17:create(var_0_1, arg_1_0)
end

return var_0_18
