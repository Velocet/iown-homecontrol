local var_0_0 = {}
local var_0_1 = {}

function var_0_0.__call(arg_1_0, arg_1_1)
	local var_1_0 = {
		parameters = {},
		hooks = {}
	}
	local var_1_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.Parameter")
	local var_1_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.modemName")

	var_1_0.parameters.name = var_1_1(var_1_2)

	local var_1_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.modemSector")

	var_1_0.parameters.batteryPowered = var_1_1(var_1_3)

	local var_1_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.rssi")

	var_1_0.parameters.rssi = var_1_1(var_1_4)

	local var_1_5 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.gsm")

	var_1_0.parameters.gsm = var_1_1(var_1_5)

	local var_1_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.gprs")

	var_1_0.parameters.gprs = var_1_1(var_1_6)

	local var_1_7 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.sim")

	var_1_0.parameters.sim = var_1_1(var_1_7)

	local var_1_8 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.operator")

	var_1_0.parameters.operator = var_1_1(var_1_8)

	local var_1_9 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.siren")

	var_1_0.parameters.siren = var_1_1(var_1_9)

	local var_1_10 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.buzz")

	var_1_0.parameters.buzz = var_1_1(var_1_10)

	local var_1_11 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.batteryLevel")

	var_1_0.parameters.batteryLevel = var_1_1(var_1_11)

	local var_1_12 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.modemLed2")

	var_1_0.parameters.statusLed = var_1_1(var_1_12)

	local var_1_13 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.modemLed1")

	var_1_0.parameters.modemLed = var_1_1(var_1_13)

	local var_1_14 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.modemVersion")

	var_1_0.parameters.version = var_1_1(var_1_14)

	local var_1_15 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.airplane")

	var_1_0.parameters.airplane = var_1_1(var_1_15)

	local var_1_16 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.rawAT")

	var_1_0.parameters.rawATcommand = var_1_1(var_1_16)

	local var_1_17 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.lightingLedModemMode")

	var_1_0.parameters.lightingLedModemMode = var_1_1(var_1_17)

	local var_1_18 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.increasingFrequencyBip")

	var_1_0.parameters.increasingFrequencyBip = var_1_1(var_1_18)

	local var_1_19 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.reboot")

	var_1_0.parameters.reboot = var_1_1(var_1_19)

	local var_1_20 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.imsi")

	var_1_0.parameters.imsi = var_1_1(var_1_20)

	local var_1_21 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.iccid")

	var_1_0.parameters.iccid = var_1_1(var_1_21)

	local var_1_22 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.imei")

	var_1_0.parameters.imei = var_1_1(var_1_22)

	local var_1_23 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.activation")

	var_1_0.parameters.activation = var_1_1(var_1_23)

	function var_1_0.hooks.batteryPowered(arg_2_0, arg_2_1)
		if arg_2_0 ~= "pod/0" then
			return
		end

		local function var_2_0()
			return
		end

		if arg_2_1 == "yes" then
			var_1_0.parameters.statusLed.write("0", var_2_0, var_2_0)
			var_1_0.parameters.modemLed.write("1000;800", var_2_0, var_2_0)
		else
			var_1_0.parameters.statusLed.write("ok", var_2_0, var_2_0)
			var_1_0.parameters.modemLed.write("0", var_2_0, var_2_0)
		end
	end

	function var_1_0.hooks.lightingLedModemMode(arg_4_0, arg_4_1)
		if arg_4_0 ~= "modem/0" then
			return
		end

		local function var_4_0()
			return
		end

		var_1_0.parameters.statusLed.write("update", var_4_0, var_4_0)
	end

	function var_1_0.hooks.connected(arg_6_0, arg_6_1)
		if arg_6_0 ~= "modem/0" then
			return
		end

		local function var_6_0()
			return
		end

		if arg_6_1 == true then
			var_1_0.parameters.statusLed.write("ok", var_6_0, var_6_0)
			var_1_0.parameters.modemLed.write("0", var_6_0, var_6_0)
		end
	end

	return var_1_0
end

setmetatable(var_0_1, var_0_0)

return var_0_1
