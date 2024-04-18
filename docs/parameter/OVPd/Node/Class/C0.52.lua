local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasTargetOnMP")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter10")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter11")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Object.CoexistenceIdentifierObject")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.factory")
local var_0_5 = require("Overkiz.utilities")
local var_0_6 = {}

var_0_6.name = "ElectricalHeater"
var_0_6.pilotWireSoftVersion = {
	string.byte("5"),
	string.byte("1"),
	string.byte("2"),
	string.byte("0"),
	string.byte("1"),
	string.byte("0"),
	string.byte("0")
}

function var_0_6.create(arg_1_0)
	local var_1_0 = var_0_5.tableExtract(arg_1_0.generalinfo[1], 1, 7)

	var_0_4:create(var_0_0, arg_1_0)
	var_0_4:create(var_0_1, arg_1_0)
	var_0_4:create(var_0_2, arg_1_0)

	if var_0_5.tableCompare(var_0_6.pilotWireSoftVersion, var_1_0) == true then
		var_0_4:create(var_0_3, arg_1_0)
	end
end

return var_0_6
