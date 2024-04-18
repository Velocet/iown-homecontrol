local var_0_0 = require("Overkiz.Log")()
local var_0_1 = {}
local var_0_2 = {}

function var_0_1.__call(arg_1_0, arg_1_1)
	local var_1_0 = {
		parameters = {},
		hooks = {}
	}
	local var_1_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.Parameter")
	local var_1_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.podName")

	var_1_0.parameters.name = var_1_1(var_1_2)

	local var_1_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.podState")

	var_1_0.parameters.stateTrigger = var_1_1(var_1_3)

	local var_1_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.podCalendar")

	var_1_0.parameters.calendarTrigger = var_1_1(var_1_4)

	local var_1_5 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.podMode")

	var_1_0.parameters.mode = var_1_1(var_1_5)

	local var_1_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.podUI")

	var_1_0.parameters.UI = var_1_1(var_1_6)

	local var_1_7 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.supportedUI")

	var_1_0.parameters.supportedUI = var_1_1(var_1_7)

	local var_1_8 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.uiEvent")

	var_1_0.parameters.uiEvent = var_1_1(var_1_8)

	local var_1_9 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.podMemoryUsed")

	var_1_0.parameters.usedMemory = var_1_1(var_1_9)

	local var_1_10 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.podCommitedMemoryUsed")

	var_1_0.parameters.commitedMemory = var_1_1(var_1_10)

	local var_1_11 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.podLoad")

	var_1_0.parameters.load = var_1_1(var_1_11)

	local var_1_12 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.ipv4")

	var_1_0.parameters.ip = var_1_1(var_1_12)

	if arg_1_1 ~= "podV1" then
		local var_1_13 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.download")

		var_1_0.parameters.download = var_1_1(var_1_13)

		local var_1_14 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.update")

		var_1_0.parameters.update = var_1_1(var_1_14)

		local var_1_15 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.updateStatus")

		var_1_0.parameters.updateStatus = var_1_1(var_1_15)

		local var_1_16 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.countryCode")

		var_1_0.parameters.countryCode = var_1_1(var_1_16)

		local var_1_17 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.networkConnectivity")

		var_1_0.parameters.networkConnectivity = var_1_1(var_1_17)

		local var_1_18 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.lightingLedPodMode")

		var_1_0.parameters.lightingLedPodMode = var_1_1(var_1_18)
	end

	if arg_1_1 == "podMini" then
		local var_1_19 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.configButton")

		var_1_0.parameters.configButton = var_1_1(var_1_19)

		function var_1_0.hooks.UI(arg_2_0, arg_2_1)
			if arg_2_0 ~= "pod/0" then
				return
			end

			local function var_2_0()
				return
			end

			var_1_0.parameters.lightingLedPodMode.read(function(arg_4_0)
				var_1_0.parameters.lightingLedPodMode.write(arg_4_0, var_2_0, var_2_0)
			end, var_2_0)
		end
	elseif arg_1_1 == "podV2" then
		local var_1_20 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.tv2TouchButton")

		var_1_0.parameters.touchButton = var_1_1(var_1_20)

		local var_1_21 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.podSector")

		var_1_0.parameters.batteryPowered = var_1_1(var_1_21)

		local var_1_22 = -1

		function var_1_0.hooks.targetMode(arg_5_0, arg_5_1, arg_5_2)
			if arg_5_2 ~= "alarm" or var_1_22 == tonumber(arg_5_1) then
				return
			end

			var_1_22 = tonumber(arg_5_1)

			local function var_5_0()
				return
			end

			if tonumber(arg_5_1) ~= 0 then
				var_1_0.parameters.uiEvent.write("arming", var_5_0, var_5_0)
			end
		end

		function var_1_0.hooks.currentMode(arg_7_0, arg_7_1, arg_7_2)
			if arg_7_2 ~= "alarm" then
				return
			end

			local function var_7_0()
				return
			end

			if tonumber(arg_7_1) ~= 0 then
				var_1_0.parameters.uiEvent.write("armed", var_7_0, var_7_0)
			else
				var_1_0.parameters.uiEvent.write("disarmed", var_7_0, var_7_0)
			end
		end

		function var_1_0.hooks.intrusion(arg_9_0, arg_9_1, arg_9_2)
			if arg_9_2 ~= "alarm" then
				return
			end

			local function var_9_0()
				return
			end

			if tostring(arg_9_1) ~= "notDetected" then
				var_1_0.parameters.uiEvent.write("SOS", var_9_0, var_9_0)
			else
				var_1_0.parameters.uiEvent.write("endOfSOS", var_9_0, var_9_0)
			end
		end

		function var_1_0.hooks.stateTrigger(arg_11_0, arg_11_1)
			if arg_11_0 ~= "pod/0" then
				return
			end

			var_1_0.parameters.calendarTrigger.ready = true
			var_1_0.parameters.mode.ready = true
		end

		function var_1_0.hooks.calendarTrigger(arg_12_0, arg_12_1)
			if arg_12_0 ~= "pod/0" then
				return
			end

			var_1_0.parameters.stateTrigger.ready = true
			var_1_0.parameters.mode.ready = true
		end

		function var_1_0.hooks.mode(arg_13_0, arg_13_1)
			if arg_13_0 ~= "pod/0" then
				return
			end

			var_1_0.parameters.stateTrigger.ready = true
			var_1_0.parameters.calendarTrigger.ready = true
		end

		function var_1_0.hooks.UI(arg_14_0, arg_14_1)
			if arg_14_0 ~= "pod/0" then
				return
			end

			local function var_14_0()
				return
			end

			var_1_0.parameters.batteryPowered.read(var_14_0, var_14_0)
			var_1_0.parameters.lightingLedPodMode.read(function(arg_16_0)
				var_1_0.parameters.lightingLedPodMode.write(arg_16_0, var_14_0, var_14_0)
			end, var_14_0)
		end
	elseif arg_1_1 == "podV3" then
		local var_1_23 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.buttonSwitch1")

		var_1_0.parameters.button1 = var_1_1(var_1_23)

		local var_1_24 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.buttonSwitch2")

		var_1_0.parameters.button2 = var_1_1(var_1_24)

		local var_1_25 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.buttonSwitch3")

		var_1_0.parameters.button3 = var_1_1(var_1_25)

		function var_1_0.hooks.stateTrigger(arg_17_0, arg_17_1)
			if arg_17_0 ~= "pod/0" then
				return
			end

			var_1_0.parameters.calendarTrigger.ready = true
			var_1_0.parameters.mode.ready = true
		end

		function var_1_0.hooks.calendarTrigger(arg_18_0, arg_18_1)
			if arg_18_0 ~= "pod/0" then
				return
			end

			var_1_0.parameters.stateTrigger.ready = true
			var_1_0.parameters.mode.ready = true
		end

		function var_1_0.hooks.mode(arg_19_0, arg_19_1)
			if arg_19_0 ~= "pod/0" then
				return
			end

			var_1_0.parameters.stateTrigger.ready = true
			var_1_0.parameters.calendarTrigger.ready = true
		end

		function var_1_0.hooks.UI(arg_20_0, arg_20_1)
			if arg_20_0 ~= "pod/0" then
				return
			end

			local function var_20_0()
				return
			end

			var_1_0.parameters.lightingLedPodMode.read(function(arg_22_0)
				var_1_0.parameters.lightingLedPodMode.write(arg_22_0, var_20_0, var_20_0)
			end, var_20_0)
		end
	elseif arg_1_1 ~= "podV1" then
		var_0_0:warning("pod: " .. arg_1_1)
	end

	return var_1_0
end

setmetatable(var_0_2, var_0_1)

return var_0_2
