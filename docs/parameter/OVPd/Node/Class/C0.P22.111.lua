local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.Name")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.GatewayMd5")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.SerialNumber")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.DiagnosticCode")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.FanSpeed")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.FilterCondition")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.MainOperation")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.ModeChange")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.OutdoorTemperature")
local var_0_9 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.RemoconControl")
local var_0_10 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.RoomTemperature")
local var_0_11 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.SubscribeEvent")
local var_0_12 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.TemperatureChange")
local var_0_13 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.ThermoStatus")
local var_0_14 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Hlink.ModelName")
local var_0_15 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.factory")
local var_0_16 = {}

var_0_16.name = "PacHlink"

function var_0_16.create(arg_1_0)
	var_0_15:create(var_0_1, arg_1_0)
	var_0_15:create(var_0_2, arg_1_0)
	var_0_15:create(var_0_0, arg_1_0)
	var_0_15:create(var_0_3, arg_1_0)
	var_0_15:create(var_0_4, arg_1_0)
	var_0_15:create(var_0_5, arg_1_0)
	var_0_15:create(var_0_6, arg_1_0)
	var_0_15:create(var_0_7, arg_1_0)
	var_0_15:create(var_0_8, arg_1_0)
	var_0_15:create(var_0_9, arg_1_0)
	var_0_15:create(var_0_10, arg_1_0)
	var_0_15:create(var_0_11, arg_1_0)
	var_0_15:create(var_0_12, arg_1_0)
	var_0_15:create(var_0_13, arg_1_0)
	var_0_15:create(var_0_14, arg_1_0)
end

return var_0_16
