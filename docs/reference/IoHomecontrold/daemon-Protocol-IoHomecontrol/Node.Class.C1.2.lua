local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.Private.Somfy.somfySoftwareVersions")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorStatus")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorSubscribeInfo")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.ThermostatStatusObject")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.ThermostatDerogationObject")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.ThermostatDiagnosisObject")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.ThermostatModeTempObject")
local var_0_9 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.ThermostatSettingsObject")
local var_0_10 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.ThermostatSynchroObject")
local var_0_11 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.ThermostatTimeTable1Object")
local var_0_12 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.ThermostatTimeTable2Object")
local var_0_13 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_14 = {}

var_0_14.name = "TemperatureInsideSensor"

local var_0_15 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")

function var_0_14.create(arg_1_0)
	if arg_1_0.manufacturer == var_0_3.manufacturers.Somfy and (var_0_0.isValve(arg_1_0.generalinfo) or var_0_0.isThermostat(arg_1_0.generalinfo)) then
		local var_1_0 = {
			startup = true,
			info = {
				priority = var_0_13.priority.HIGH
			}
		}

		var_0_4:create(var_0_2, arg_1_0, var_1_0)
		var_0_4:create(var_0_5, arg_1_0)
		var_0_4:create(var_0_6, arg_1_0)
		var_0_4:create(var_0_7, arg_1_0)
		var_0_4:create(var_0_8, arg_1_0)
		var_0_4:create(var_0_9, arg_1_0)
		var_0_4:create(var_0_10, arg_1_0)
		var_0_4:create(var_0_11, arg_1_0)
		var_0_4:create(var_0_12, arg_1_0)

		local function var_1_1(arg_2_0, arg_2_1, arg_2_2)
			var_0_15:debug("[Somfy Thermostat] refresh commands are queued.")
			arg_2_2:lookupParameterById(var_0_6.id).refreshDef:refresh()
			arg_2_2:lookupParameterById(var_0_7.id).refreshDef:refresh()
			arg_2_2:lookupParameterById(var_0_5.id).refreshDef:refresh()
		end

		local var_1_2 = {
			refreshTriggers = var_1_1
		}

		var_0_4:create(var_0_1, arg_1_0, var_1_2)

		return
	end

	if var_0_3.sensors.isEventDriven(arg_1_0) then
		var_0_4:create(var_0_1, arg_1_0)
		var_0_4:create(var_0_2, arg_1_0)
	else
		var_0_4:create(var_0_1, arg_1_0, var_0_1.nonEventDrivenRefresh)
	end
end

return var_0_14
