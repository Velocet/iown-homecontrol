local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.timeUtils")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorStatus")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorDefect")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Object.CoexistenceIdentifierObject")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Imhotep.SystemSensor.Mode")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.factory")
local var_0_7 = require("Overkiz.utilities")
local var_0_8 = {}

var_0_8.name = "TemperatureInsideSensor"
var_0_8.pilotWireSoftVersion = {
	string.byte("5"),
	string.byte("1"),
	string.byte("2"),
	string.byte("0"),
	string.byte("1"),
	string.byte("0"),
	string.byte("0")
}

function var_0_8.create(arg_1_0)
	local var_1_0 = {
		startup = true,
		oncommand = true,
		interval = var_0_0.hoursInterval(1)
	}
	local var_1_1 = var_0_7.tableExtract(arg_1_0.generalinfo[1], 1, 7)

	if var_0_7.tableCompare(var_0_8.pilotWireSoftVersion, var_1_1) == true then
		var_0_6:create(var_0_2, arg_1_0, var_1_0)
		var_0_6:create(var_0_4, arg_1_0)
		var_0_6:create(var_0_5, arg_1_0)
	elseif var_0_1.sensors.isEventDriven(arg_1_0) then
		var_0_6:create(var_0_2, arg_1_0)
	else
		var_0_6:create(var_0_2, arg_1_0, var_0_2.nonEventDrivenRefresh)
	end

	var_0_6:create(var_0_3, arg_1_0)
end

return var_0_8
