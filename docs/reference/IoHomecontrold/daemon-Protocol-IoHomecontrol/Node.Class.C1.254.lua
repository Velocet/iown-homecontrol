local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorName")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorSubscribeInfo")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorDefect")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.MultitypeSensorSettingsObject")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.PrivateSomfyParameters")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_7 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SensorStatusMulti")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_9 = {}

var_0_9.name = "MultitypeSensor"

function var_0_9.create(arg_1_0, arg_1_1)
	if arg_1_0.manufacturer == var_0_4.manufacturers.Somfy then
		var_0_5.createFactoryParameters(arg_1_0)
	end

	local var_1_0 = #arg_1_0.configuration - 1

	if var_1_0 <= 0 then
		var_0_8:error("Multitype sensor creation " .. arg_1_0.address .. ": configuration is empty or subsystems are missing.")

		return
	end

	var_0_8:debug("Multitype sensor created " .. arg_1_0.address .. " with " .. tostring(var_1_0) .. " subsystems.")
	var_0_6:create(var_0_0, arg_1_0)
	var_0_6:create(var_0_1, arg_1_0)
	var_0_6:create(var_0_2, arg_1_0)
	var_0_6:create(var_0_3, arg_1_0)
	var_0_7.createParameters(arg_1_0, var_1_0)
end

return var_0_9
