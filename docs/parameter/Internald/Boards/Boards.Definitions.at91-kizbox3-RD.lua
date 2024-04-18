local var_0_0 = require("Overkiz.Kernel.Button")
local var_0_1 = require("Overkiz.Kernel.MultifunctionButton")
local var_0_2 = require("Overkiz.Kernel.DoubleMultifunctionButton")
local var_0_3 = require("Overkiz.Kernel.Leds")
local var_0_4 = require("Overkiz.Time")
local var_0_5 = require("Overkiz.Timer")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.common")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkStatus")
local var_0_9 = {}
local var_0_10 = {}

function var_0_9.__call(arg_1_0, arg_1_1)
	local var_1_0 = var_0_7()

	var_1_0.buttons = {
		reset = var_0_0("/dev/input/event0", 7),
		prog = var_0_0("/dev/input/event0", 8)
	}
	var_1_0.topLeds = var_0_3({
		green = "pwm:green:user",
		red = "pwm:red:user",
		blue = "pwm:blue:user",
		white = "pwm:white:user"
	})
	var_1_0.networkStatus = var_0_8.DOWN

	local function var_1_1()
		var_0_6:notice("Disabling AP WiFi and local API pairing")
		var_1_0.notify("wifiInfraMode")
		var_1_0.setFunction("endLocalAPI")
	end

	local var_1_2
	local var_1_3
	local var_1_4
	local var_1_5
	local var_1_6 = {}
	local var_1_7 = 0
	local var_1_8 = false
	local var_1_9 = 600
	local var_1_10 = 3
	local var_1_11 = var_0_2.buttonDefinition(var_1_0.buttons.prog, {
		[0] = "short",
		[8000] = "long",
		[2000] = "medium"
	}, "Prog button")
	local var_1_12 = var_0_2.buttonDefinition(var_1_0.buttons.reset, {
		[0] = "short",
		[10000] = "long",
		[7000] = "medium"
	}, "Reset button")
	local var_1_13 = var_0_2(var_1_11, var_1_12, {
		[8000] = "double"
	})
	local var_1_14, var_1_15 = var_1_13:getSingleButtons()

	var_1_14:on(var_0_1.Events.MODIFIED, function()
		var_1_4:stop()
	end):on(var_0_1.Events.PRESSED("short"), function()
		var_1_0.topLeds:cleanup()
		var_1_0.topLeds:off()
	end):on(var_0_1.Events.PRESSED("medium"), function()
		var_1_0.topLeds:setColor("somfy_yellow")
	end):on(var_0_1.Events.PRESSED("long"), function()
		var_1_0.topLeds:cleanup()
		var_1_0.topLeds:off()
	end):on(var_0_1.Events.RELEASED, function(arg_7_0)
		if arg_7_0 == "short" then
			var_1_0.notify("discoverActuatorSimpleWithWinkIO")
		elseif arg_7_0 == "medium" then
			var_1_0.notify("discoverSensorSimpleIO")
		elseif arg_7_0 == "long" then
			var_1_0.notify("winkIO")
		end

		var_1_0.setFunction("actionStarted")
	end)
	var_1_15:on(var_0_1.Events.PRESSED("short"), function()
		var_1_0.topLeds:setColor("red")
		var_1_0.setFunction("buttonFeedback")
		var_0_5.Timeout(500, function()
			var_1_0.topLeds:cleanup()
			var_1_0.topLeds:off()
		end)
	end):on(var_0_1.Events.PRESSED("medium"), function()
		var_1_0.topLeds:setCycleHeartbeatBlink("blue", 200, 1, 2000, 0)
	end):on(var_0_1.Events.PRESSED("long"), function()
		var_0_6:notice("Trying to enable AP Wifi and Opening local mode for pairing")
		var_1_0.setFunction("localAPIPairing")
	end):on(var_0_1.Events.RELEASED("short"), function()
		var_1_0.setFunction("resumeConnectionStatus")
	end):on(var_0_1.Events.RELEASED("medium"), function()
		var_0_6:warning("GOing to configure wifi")
		var_1_0.setFunction("configureWifiMode")
	end)
	var_1_13:on(var_0_1.Events.PRESSED("double"), function()
		var_1_0.notify("wifiReset")
		var_1_0.notify("resetHK")

		var_1_0.lastConnectionStatus = "disconnected"

		if var_1_7 == 0 then
			var_1_0.topLeds:setHardBlink("red", 500)
		end

		var_0_5.Timeout(3000, function()
			if var_1_7 == 0 then
				var_1_0.topLeds:cleanup()
				var_1_0.topLeds:off()
			end

			var_1_0.setFunction("resumeConnectionStatus")
		end)
	end)

	local var_1_16 = {
		Unknown = {
			buttonFeedback = true,
			actionStarted = true,
			disconnected = true,
			connected = true,
			configureWifiMode = true
		},
		disconnected = {
			actionStarted = true,
			configureWifiMode = true,
			buttonFeedback = true,
			connected = true
		},
		connected = {
			buttonFeedback = true,
			actionStarted = true,
			disconnected = true,
			connected = true,
			configureWifiMode = true
		},
		buttonFeedback = {
			actionStarted = true,
			configureWifiMode = true,
			resumeConnectionStatus = true,
			localAPIPairing = true
		},
		actionStarted = {
			buttonFeedback = true,
			actionPending = true,
			resumeConnectionStatus = true
		},
		actionPending = {
			buttonFeedback = true,
			actionNoEffects = true,
			actionKO = true,
			actionOK = true
		},
		actionOK = {
			resumeConnectionStatus = true
		},
		actionKO = {
			resumeConnectionStatus = true,
			actionPending = true
		},
		actionNoEffects = {
			resumeConnectionStatus = true
		},
		configureWifiMode = {
			resumeConnectionStatus = true,
			buttonFeedback = true,
			connected = true
		},
		localAPI = {
			buttonFeedback = true,
			endLocalAPI = true
		},
		localAPIPairing = {
			buttonFeedback = true,
			endPairing = true,
			resumeConnectionStatus = true,
			endPairingSuccess = true,
			localAPI = true,
			endLocalAPI = true
		},
		endLocalAPI = {
			disconnected = true,
			connected = true
		},
		endPairing = {
			resumeConnectionStatus = true,
			endLocalAPI = true
		},
		endPairingSuccess = {
			disconnected = true,
			localAPI = true,
			resumeConnectionStatus = true,
			connected = true
		},
		resumeConnectionStatus = {
			disconnected = true,
			connected = true
		}
	}
	local var_1_17 = var_0_5.Monotonic()
	local var_1_18 = var_0_5.Monotonic()
	local var_1_19 = false
	local var_1_20 = true
	local var_1_21 = var_0_5.Monotonic()

	var_1_21:setTime(var_0_4.Monotonic(var_0_4.Elapsed(61, 0)), true)

	function var_1_21.expired()
		var_1_20 = false

		if var_1_7 == 0 and var_1_0.currentMode == "disconnected" then
			if var_1_20 then
				var_1_0.topLeds:cleanup()
				var_1_0.topLeds:off()
			elseif var_1_0.networkStatus == var_0_8.UP then
				var_1_0.topLeds:setColor("yellow")
			else
				var_1_0.topLeds:setColor("red")
			end
		end
	end

	local function var_1_22()
		var_1_0.lastConnectionStatus = "disconnected"
		var_1_20 = true

		var_1_21:start()
	end

	function var_1_6.connected(arg_18_0)
		var_1_0.lastConnectionStatus = "connected"

		if var_1_0.currentMode == "disconnected" then
			var_1_2:start()
		end

		if arg_18_0 or var_1_0.currentMode ~= "connected" then
			var_1_4:stop()

			if var_1_7 == 0 then
				var_1_0.topLeds:setColor(var_1_0.okColor)
			end
		end

		var_1_5:start()
	end

	function var_1_6.disconnected(arg_19_0)
		var_1_0.lastConnectionStatus = "disconnected"

		if arg_19_0 or var_1_0.currentMode ~= "disconnected" then
			var_1_4:stop()

			if var_1_0.networkStatus == var_0_8.UP then
				var_1_0.topLeds:setCycleHeartbeatBlink("white", 200, 1, 2000, 0)
			else
				var_1_0.topLeds:setCycleHeartbeatBlink("white", 200, 2, 2000, 0)
			end
		end

		var_1_5:stop()
	end

	function var_1_6.buttonFeedback()
		return
	end

	function var_1_6.actionStarted()
		var_1_4:setTime(var_0_4.Monotonic(var_0_4.Elapsed(30, 0)), true)
		var_1_4:start()
	end

	function var_1_6.actionPending()
		var_1_0.topLeds:setHardBlink("somfy_yellow", 150)
	end

	function var_1_6.actionOK()
		var_1_0.topLeds:setHardBlink("green", 300, 10)
		var_1_4:setTime(var_0_4.Monotonic(var_0_4.Elapsed(3, 0)), true)
		var_1_4:start()
	end

	function var_1_6.actionKO()
		var_1_0.topLeds:setHardBlink("red", 300, 10)
		var_1_4:setTime(var_0_4.Monotonic(var_0_4.Elapsed(3, 0)), true)
		var_1_4:start()
	end

	function var_1_6.actionNoEffects()
		local var_25_0 = 3

		var_1_0.topLeds:setHardBlink("somfy_yellow", 150)
		var_1_4:setTime(var_0_4.Monotonic(var_0_4.Elapsed(0, var_25_0 * 3 * 2 * 150 * 1000 * 1000)), true)
		var_1_4:start()
	end

	function var_1_6.configureWifiMode()
		var_1_0.topLeds:setSmoothBlink("blue", 131)
		var_1_4:setTime(var_0_4.Monotonic(var_0_4.Elapsed(900, 0)), true)
		var_1_4:start()
		var_1_0.notify("bluetoothStart")
		var_1_0.notify("wacStart")
	end

	local var_1_23 = var_0_5.Monotonic()

	function var_1_6.resumeConnectionStatus()
		var_1_0.notify("endPairingRequired")
		var_1_0.notify("bluetoothStop")
		var_1_0.notify("wifiInfraMode")

		function var_1_23.expired()
			var_1_0.setFunction(var_1_0.lastConnectionStatus)

			if var_1_6[var_1_0.lastConnectionStatus] then
				var_1_6[var_1_0.lastConnectionStatus](true)
			end
		end

		var_1_23:setTime(var_0_4.Monotonic(var_0_4.Elapsed(0, 250000000)), true)
		var_1_23:start()
	end

	function var_1_6.localAPI()
		var_1_0.topLeds:setColor("green")
		var_1_5:stop()
		var_1_4:stop()
	end

	function var_1_6.localAPIPairing()
		var_1_0.topLeds:setSmoothBlink("green", 131)
		var_1_5:stop()
		var_1_0.notify("localAPIRequired")
		var_1_0.notify("wifiAPMode")

		var_1_0.lastConnectionStatus = "disconnected"
	end

	function var_1_6.endPairing()
		var_1_17.expired = var_1_1

		var_1_17:setTime(var_0_4.Monotonic(var_0_4.Elapsed(0, 0)), true)
		var_1_17:start()
	end

	function var_1_6.endPairingSuccess()
		function var_1_17.expired()
			var_1_0.setFunction("localAPI")
		end

		var_1_17:setTime(var_0_4.Monotonic(var_0_4.Elapsed(0, 0)), true)
		var_1_17:start()
	end

	function var_1_6.endLocalAPI()
		var_1_19 = false

		var_1_0.notify("endPairingRequired")

		function var_1_17.expired()
			var_1_0.setFunction(var_1_0.lastConnectionStatus)
		end

		var_1_17:setTime(var_0_4.Monotonic(var_0_4.Elapsed(0, 0)), true)
		var_1_17:start()
	end

	local function var_1_24(arg_36_0)
		local var_36_0 = var_1_0.currentMode

		var_1_0.currentMode = "identify"

		if var_1_7 == 0 then
			var_1_0.topLeds:setHardAlternateBlink("orange", "white", 500, 2 * arg_36_0)
		end

		var_0_5.Timeout(var_0_4.Elapsed(arg_36_0, 0), function()
			var_1_0.currentMode = var_36_0

			if var_36_0 and var_1_6[var_36_0] then
				var_1_6[var_36_0](true)
			end
		end)
	end

	local var_1_25

	function var_1_0.setFunction(arg_38_0)
		var_0_6:info("Set function requested: " .. var_1_0.currentMode .. " -> " .. arg_38_0)

		if arg_38_0 == "stm32StartUpgrade" or arg_38_0 == "stm32StartUpdate" then
			var_1_7 = var_1_7 + 1

			if var_1_7 == 1 then
				var_1_0.topLeds:setSmoothBlink("red")
			end

			var_1_25:setTime(var_0_4.Monotonic(var_0_4.Elapsed(120, 0)), true)
			var_1_25:start()
		elseif arg_38_0 == "stm32ApplyUpgrade" or arg_38_0 == "stm32ApplyUpdate" then
			var_1_0.topLeds:setCycleHardBlink("red", 250)
		elseif (arg_38_0 == "stm32StopUpgrade" or arg_38_0 == "stm32StopUpdate") and var_1_7 > 0 then
			var_1_7 = var_1_7 - 1

			if var_1_7 == 0 then
				var_1_25:setTime(var_0_4.Monotonic(var_0_4.Elapsed(0, 0)), true)
				var_1_25:start()
			end
		end

		if var_1_6[arg_38_0] then
			if var_1_0.checkIfAllowed(var_1_0.currentMode, arg_38_0, var_1_16) then
				var_1_6[arg_38_0]()

				var_1_0.currentMode = arg_38_0
			else
				var_0_6:notice("No transition available to " .. arg_38_0)
			end
		else
			var_0_6:notice("Try to set unknown mode " .. tostring(arg_38_0))
		end
	end

	function var_1_0.setEvent(arg_39_0, arg_39_1)
		if arg_39_0 == "APIClientStillActive" then
			if not var_1_19 then
				var_1_19 = true

				var_1_0.setFunction("localAPI")
			end

			var_1_18.expired = var_1_1

			var_1_18:setTime(var_0_4.Monotonic(var_0_4.Elapsed(var_1_9, 0)), true)
			var_1_18:start()
		elseif arg_39_0 == "wifi" then
			if arg_39_1 == "startWAC" then
				var_1_0.setFunction("configureWifiMode")
			elseif arg_39_1 == "startAP" then
				var_1_0.setFunction("localAPIPairing")
			elseif arg_39_1 == "stopAP" then
				var_1_0.setFunction("endLocalAPI")
			elseif arg_39_1 == "ready" then
				if var_1_0.currentMode == "Unknown" then
					var_1_0.setFunction("disconnected")
				end
			elseif arg_39_1 == "noConfig" then
				var_0_5.Timeout(0, function()
					var_0_6:warning("wifi not configured. if ethernet is already connected, then not configuring it.")

					if var_1_0.networkStatus == var_0_8.DOWN then
						var_0_6:warning("yes, no ethernet. configuring wifi")
						var_1_0.setFunction("configureWifiMode")
					end
				end)
			end
		elseif arg_39_0 == "identify" then
			var_1_24(var_1_10)
		elseif arg_39_0 == "aliveTimeout" then
			if arg_39_1 == "active" then
				var_1_8 = true
			elseif arg_39_1 == "inactive" then
				var_1_8 = false
			end
		elseif arg_39_0 == "network" then
			var_1_0.networkStatus = arg_39_1

			if var_1_0.currentMode == "disconnected" then
				var_1_6.disconnected(true)
			end
		elseif (arg_39_0 == "bluetooth" or arg_39_0 == "wac") and arg_39_1 == "stop" and var_1_0.currentMode == "configureWifiMode" then
			var_1_22()
			var_1_0.setFunction("resumeConnectionStatus")
		end
	end

	var_1_0.okColor = "green"
	var_1_0.name = "at91-kizbox3-RD"

	function var_1_0.load()
		var_1_0.topLeds:cleanup()
		var_1_0.topLeds:off()

		var_1_2 = var_0_5.Monotonic()

		var_1_2:setTime(var_0_4.Monotonic(var_0_4.Elapsed(30, 0)), true)

		function var_1_2.expired()
			if var_1_7 == 0 and var_1_8 then
				var_1_0.topLeds:cleanup()
				var_1_0.topLeds:off()
			end
		end

		var_1_3 = var_0_5.Monotonic()
		var_1_4 = var_0_5.Monotonic()

		function var_1_4.expired()
			var_1_0.topLeds:cleanup()
			var_1_0.topLeds:off()
			var_1_0.setFunction("resumeConnectionStatus")
		end

		var_1_5 = var_0_5.Monotonic()

		var_1_5:setTime(var_0_4.Monotonic(var_0_4.Elapsed(61, 0)), true)

		function var_1_5.expired()
			var_1_0.setFunction("disconnected")
		end

		if var_1_14 then
			var_1_14:register()
		end

		if var_1_15 then
			var_1_15:register()
		end

		var_1_25 = var_0_5.Monotonic()

		function var_1_25.expired()
			var_1_7 = 0

			var_1_0.topLeds:cleanup()
			var_1_0.topLeds:off()

			if var_1_0.currentMode == "disconnected" or var_1_0.currentMode == "connected" then
				var_1_6[var_1_0.currentMode](true)
			end
		end

		var_1_0.topLeds:setColor("yellow")
		var_1_22()
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_25 then
			var_1_25:stop()

			var_1_25 = nil
		end

		if var_1_3 then
			var_1_3:stop()

			var_1_3 = nil
		end

		if var_1_4 then
			var_1_4:stop()

			var_1_4 = nil
		end

		if var_1_5 then
			var_1_5:stop()

			var_1_5 = nil
		end

		if var_1_23 then
			var_1_23:stop()

			var_1_23 = nil
		end

		if var_1_17 then
			var_1_17:stop()

			var_1_17 = nil
		end

		if var_1_18 then
			var_1_18:stop()

			var_1_18 = nil
		end

		if var_1_14 then
			var_1_14:deregister()
		end

		if var_1_15 then
			var_1_15:deregister()
		end
	end

	return var_1_0
end

setmetatable(var_0_10, var_0_9)

return var_0_10
