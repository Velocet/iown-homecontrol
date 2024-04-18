local var_0_0 = require("Overkiz.Kernel.Button")
local var_0_1 = require("Overkiz.Kernel.MultifunctionButton")
local var_0_2 = require("Overkiz.Kernel.Leds")
local var_0_3 = require("Overkiz.Time")
local var_0_4 = require("Overkiz.Timer")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.common")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkStatus")
local var_0_8 = {}
local var_0_9 = {}

function var_0_8.__call(arg_1_0, arg_1_1)
	local var_1_0 = var_0_6()

	var_1_0.buttons = {
		stop = var_0_0("/dev/input/event0", 2),
		reset = var_0_0("/dev/input/event0", 7),
		prog = var_0_0("/dev/input/event0", 8)
	}
	var_1_0.topLeds = var_0_2({
		green = "pwm:green:user",
		red = "pwm:red:user",
		blue = "pwm:blue:user",
		white = "pwm:white:user"
	})
	var_1_0.networkStatus = var_0_7.DOWN

	local function var_1_1()
		var_0_5:notice("Disabling AP WiFi and local API pairing")
		var_1_0.notify("wifiInfraMode")
		var_1_0.setFunction("endLocalAPI")
	end

	local var_1_2
	local var_1_3
	local var_1_4
	local var_1_5 = {}
	local var_1_6 = 0
	local var_1_7 = false
	local var_1_8 = 600
	local var_1_9 = 3
	local var_1_10

	if var_1_0.buttons.stop then
		local var_1_11

		var_1_10 = var_0_1(var_1_0.buttons.stop, {
			[0] = "tiny",
			[750] = "short",
			[3000] = "long"
		}, "Stop button"):on(var_0_1.Events.MODIFIED, function()
			var_1_3:stop()
		end):on(var_0_1.Events.PRESSED("tiny"), function()
			var_1_11 = false

			var_1_0.topLeds:setColor("red")
			var_1_0.setFunction("buttonFeedback")
			var_0_4.Timeout(760, function()
				if var_1_11 then
					var_1_0.topLeds:cleanup()
					var_1_0.topLeds:off()
					var_1_0.setFunction("resumeConnectionStatus")
				end
			end)
		end):on(var_0_1.Events.PRESSED("short"), function()
			var_1_0.topLeds:cleanup()
			var_1_0.topLeds:off()
		end):on(var_0_1.Events.PRESSED("long"), function()
			var_1_0.topLeds:setSmoothBlink("yellow", 131)
		end):on(var_0_1.Events.RELEASED, function(arg_8_0)
			if arg_8_0 ~= "long" then
				var_1_1()
			end
		end):on(var_0_1.Events.RELEASED("tiny"), function()
			var_1_11 = true
		end):on(var_0_1.Events.RELEASED("short"), function()
			var_1_0.setFunction("resumeConnectionStatus")
		end):on(var_0_1.Events.RELEASED("long"), function()
			var_0_5:notice("Trying to enable AP Wifi and Opening local mode for pairing")
			var_1_0.notify("wifiAPMode")
		end)
	end

	local var_1_12

	if var_1_0.buttons.prog then
		var_1_12 = var_0_1(var_1_0.buttons.prog, {
			[0] = "short",
			[8000] = "long",
			[2000] = "medium"
		}, "Prog button"):on(var_0_1.Events.MODIFIED, function()
			var_1_3:stop()
		end):on(var_0_1.Events.PRESSED("short"), function()
			var_1_0.topLeds:cleanup()
			var_1_0.topLeds:off()
			var_1_0.setFunction("buttonFeedback")
		end):on(var_0_1.Events.PRESSED("medium"), function()
			var_1_0.topLeds:setColor("somfy_yellow")
		end):on(var_0_1.Events.PRESSED("long"), function()
			var_1_0.topLeds:cleanup()
			var_1_0.topLeds:off()
		end):on(var_0_1.Events.RELEASED, function(arg_16_0)
			if arg_16_0 == "short" then
				var_1_0.notify("discoverActuatorSimpleWithWinkIO")
			elseif arg_16_0 == "medium" then
				var_1_0.notify("discoverSensorSimpleIO")
			elseif arg_16_0 == "long" then
				var_1_0.notify("winkIO")
			end

			var_1_0.setFunction("actionStarted")
		end)
	end

	local var_1_13

	if var_1_0.buttons.reset then
		var_1_13 = var_0_1(var_1_0.buttons.reset, {
			[0] = "short",
			[10000] = "long"
		}, "Reset button"):on(var_0_1.Events.PRESSED("short"), function()
			var_1_0.setFunction("buttonFeedback")
		end):on(var_0_1.Events.PRESSED("long"), function()
			var_1_0.notify("wifiReset")
			var_1_0.notify("resetHK")

			var_1_0.lastConnectionStatus = "disconnected"

			if var_1_6 == 0 then
				var_1_0.topLeds:setHardBlink("red", 500)
			end

			var_0_4.Timeout(3000, function()
				if var_1_6 == 0 then
					var_1_0.topLeds:cleanup()
					var_1_0.topLeds:off()
				end

				var_1_0.setFunction("resumeConnectionStatus")
			end)
		end):on(var_0_1.Events.RELEASED("short"), function()
			var_1_0.setFunction("resumeConnectionStatus")
		end)
	end

	local var_1_14 = {
		Unknown = {
			disconnected = true,
			actionStarted = true,
			buttonFeedback = true,
			connected = true
		},
		disconnected = {
			actionStarted = true,
			buttonFeedback = true,
			connected = true
		},
		connected = {
			disconnected = true,
			actionStarted = true,
			buttonFeedback = true,
			connected = true
		},
		buttonFeedback = {
			actionStarted = true,
			APWifiWithLocalAPIPairing = true,
			resumeConnectionStatus = true
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
		localAPI = {
			buttonFeedback = true,
			endLocalAPI = true
		},
		APWifiWithLocalAPIPairing = {
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
	local var_1_15 = var_0_4.Monotonic()
	local var_1_16 = var_0_4.Monotonic()
	local var_1_17 = false
	local var_1_18 = true

	local function var_1_19()
		if var_1_6 == 0 and not var_1_18 then
			if var_1_0.networkStatus == var_0_7.UP then
				var_1_0.topLeds:setColor("yellow")
			else
				var_1_0.topLeds:setColor("red")
			end
		end
	end

	local var_1_20 = var_0_4.Monotonic()

	var_1_20:setTime(var_0_3.Monotonic(var_0_3.Elapsed(61, 0)), true)

	function var_1_20.expired()
		var_1_18 = false

		if var_1_0.currentMode == "disconnected" then
			var_1_19()
		end
	end

	local function var_1_21()
		var_1_0.lastConnectionStatus = "disconnected"
		var_1_18 = true

		var_1_20:start()
	end

	function var_1_5.connected(arg_24_0)
		var_1_0.lastConnectionStatus = "connected"

		if var_1_0.currentMode == "disconnected" then
			var_1_2:start()
		end

		if arg_24_0 or var_1_0.currentMode ~= "connected" then
			var_1_3:stop()

			if var_1_6 == 0 then
				var_1_0.topLeds:setColor("white")
			end
		end

		var_1_4:start()
	end

	function var_1_5.disconnected(arg_25_0)
		var_1_0.lastConnectionStatus = "disconnected"

		if arg_25_0 or var_1_0.currentMode ~= "disconnected" then
			var_1_3:stop()
			var_1_19()
		end

		var_1_4:stop()
	end

	function var_1_5.buttonFeedback()
		return
	end

	function var_1_5.actionStarted()
		var_1_3:setTime(var_0_3.Monotonic(var_0_3.Elapsed(30, 0)), true)
		var_1_3:start()
	end

	function var_1_5.actionPending()
		var_1_0.topLeds:setHardBlink("somfy_yellow", 150)
	end

	function var_1_5.actionOK()
		var_1_0.topLeds:setHardBlink("green", 300, 10)
		var_1_3:setTime(var_0_3.Monotonic(var_0_3.Elapsed(3, 0)), true)
		var_1_3:start()
	end

	function var_1_5.actionKO()
		var_1_0.topLeds:setHardBlink("red", 300, 10)
		var_1_3:setTime(var_0_3.Monotonic(var_0_3.Elapsed(3, 0)), true)
		var_1_3:start()
	end

	function var_1_5.actionNoEffects()
		local var_31_0 = 3

		var_1_0.topLeds:setHardBlink("somfy_yellow", 150)
		var_1_3:setTime(var_0_3.Monotonic(var_0_3.Elapsed(0, var_31_0 * 3 * 2 * 150 * 1000 * 1000)), true)
		var_1_3:start()
	end

	local var_1_22 = var_0_4.Monotonic()

	function var_1_5.resumeConnectionStatus()
		var_1_0.notify("endPairingRequired")
		var_1_0.notify("wifiInfraMode")

		function var_1_22.expired()
			var_1_0.setFunction(var_1_0.lastConnectionStatus)

			if var_1_5[var_1_0.lastConnectionStatus] then
				var_1_5[var_1_0.lastConnectionStatus](true)
			end
		end

		var_1_22:setTime(var_0_3.Monotonic(var_0_3.Elapsed(0, 250000000)), true)
		var_1_22:start()
	end

	function var_1_5.localAPI()
		var_1_0.topLeds:setColor("yellow")
		var_1_4:stop()
		var_1_3:stop()
	end

	function var_1_5.localAPIPairing()
		return
	end

	function var_1_5.APWifiWithLocalAPIPairing()
		var_1_0.topLeds:setSmoothBlink("yellow", 131)
		var_1_4:stop()
		var_1_0.notify("localAPIRequired")

		var_1_0.lastConnectionStatus = "disconnected"
	end

	function var_1_5.endPairing()
		var_1_15.expired = var_1_1

		var_1_15:setTime(var_0_3.Monotonic(var_0_3.Elapsed(0, 0)), true)
		var_1_15:start()
	end

	function var_1_5.endPairingSuccess()
		function var_1_15.expired()
			var_1_0.setFunction("localAPI")
		end

		var_1_15:setTime(var_0_3.Monotonic(var_0_3.Elapsed(0, 0)), true)
		var_1_15:start()
	end

	function var_1_5.endLocalAPI()
		var_1_17 = false

		var_1_0.notify("endPairingRequired")

		function var_1_15.expired()
			var_1_0.setFunction(var_1_0.lastConnectionStatus)
		end

		var_1_15:setTime(var_0_3.Monotonic(var_0_3.Elapsed(0, 0)), true)
		var_1_15:start()
	end

	local function var_1_23(arg_42_0)
		local var_42_0 = var_1_0.currentMode

		var_1_0.currentMode = "identify"

		if var_1_6 == 0 then
			var_1_0.topLeds:setHardAlternateBlink("red", "white", 500, 2 * arg_42_0)
		end

		var_0_4.Timeout(var_0_3.Elapsed(arg_42_0, 0), function()
			var_1_0.currentMode = var_42_0

			if var_42_0 and var_1_5[var_42_0] then
				var_1_5[var_42_0](true)
			end
		end)
	end

	local var_1_24

	function var_1_0.setFunction(arg_44_0)
		var_0_5:info("Set function requested: " .. arg_44_0)

		if arg_44_0 == "stm32StartUpgrade" or arg_44_0 == "stm32StartUpdate" then
			var_1_6 = var_1_6 + 1

			if var_1_6 == 1 then
				var_1_0.topLeds:setSmoothBlink("red")
			end

			var_1_24:setTime(var_0_3.Monotonic(var_0_3.Elapsed(120, 0)), true)
			var_1_24:start()
		elseif arg_44_0 == "stm32ApplyUpgrade" or arg_44_0 == "stm32ApplyUpdate" then
			var_1_0.topLeds:setCycleHardBlink("red", 250)
		elseif (arg_44_0 == "stm32StopUpgrade" or arg_44_0 == "stm32StopUpdate") and var_1_6 > 0 then
			var_1_6 = var_1_6 - 1

			if var_1_6 == 0 then
				var_1_24:setTime(var_0_3.Monotonic(var_0_3.Elapsed(0, 0)), true)
				var_1_24:start()
			end
		end

		if var_1_5[arg_44_0] then
			if var_1_0.checkIfAllowed(var_1_0.currentMode, arg_44_0, var_1_14) then
				var_1_5[arg_44_0]()

				var_1_0.currentMode = arg_44_0
			else
				var_0_5:notice("No transition available to " .. arg_44_0)
			end
		else
			var_0_5:notice("Try to set unknown mode " .. tostring(arg_44_0))
		end
	end

	function var_1_0.setEvent(arg_45_0, arg_45_1)
		if arg_45_0 == "APIClientStillActive" then
			if not var_1_17 then
				var_1_17 = true

				var_1_0.setFunction("localAPI")
			end

			var_1_16.expired = var_1_1

			var_1_16:setTime(var_0_3.Monotonic(var_0_3.Elapsed(var_1_8, 0)), true)
			var_1_16:start()
		elseif arg_45_0 == "wifi" then
			if arg_45_1 == "startAP" then
				var_1_0.setFunction("APWifiWithLocalAPIPairing")
			elseif arg_45_1 == "stopAP" then
				var_1_0.setFunction("endLocalAPI")
			elseif (arg_45_1 == "ready" or arg_45_1 == "noConfig") and var_1_0.currentMode == "Unknown" then
				var_1_0.setFunction("disconnected")
			end
		elseif arg_45_0 == "identify" then
			var_1_23(var_1_9)
		elseif arg_45_0 == "aliveTimeout" then
			if arg_45_1 == "active" then
				var_1_7 = true
			elseif arg_45_1 == "inactive" then
				var_1_7 = false
			end
		elseif arg_45_0 == "network" then
			var_1_0.networkStatus = arg_45_1

			if var_1_0.currentMode == "disconnected" then
				var_1_5.disconnected(true)
			end
		end
	end

	var_1_0.name = "at91-kizbox3-cozytouchV2"

	function var_1_0.load()
		var_1_0.topLeds:cleanup()
		var_1_0.topLeds:off()

		var_1_2 = var_0_4.Monotonic()

		var_1_2:setTime(var_0_3.Monotonic(var_0_3.Elapsed(30, 0)), true)

		function var_1_2.expired()
			if var_1_6 == 0 and var_1_7 then
				var_1_0.topLeds:cleanup()
				var_1_0.topLeds:off()
			end
		end

		var_1_3 = var_0_4.Monotonic()

		function var_1_3.expired()
			var_1_0.topLeds:cleanup()
			var_1_0.topLeds:off()
			var_1_0.setFunction("resumeConnectionStatus")
		end

		var_1_4 = var_0_4.Monotonic()

		var_1_4:setTime(var_0_3.Monotonic(var_0_3.Elapsed(61, 0)), true)

		function var_1_4.expired()
			var_1_0.setFunction("disconnected")
		end

		if var_1_10 then
			var_1_10:register()
		end

		if var_1_12 then
			var_1_12:register()
		end

		if var_1_13 then
			var_1_13:register()
		end

		var_1_24 = var_0_4.Monotonic()

		function var_1_24.expired()
			var_1_6 = 0

			var_1_0.topLeds:cleanup()
			var_1_0.topLeds:off()

			if var_1_0.currentMode == "disconnected" or var_1_0.currentMode == "connected" then
				var_1_5[var_1_0.currentMode](true)
			end
		end

		var_1_0.topLeds:setColor("yellow")
		var_1_21()
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_24 then
			var_1_24:stop()

			var_1_24 = nil
		end

		if var_1_3 then
			var_1_3:stop()

			var_1_3 = nil
		end

		if var_1_4 then
			var_1_4:stop()

			var_1_4 = nil
		end

		if var_1_22 then
			var_1_22:stop()

			var_1_22 = nil
		end

		if var_1_15 then
			var_1_15:stop()

			var_1_15 = nil
		end

		if var_1_16 then
			var_1_16:stop()

			var_1_16 = nil
		end

		if var_1_10 then
			var_1_10:deregister()
		end

		if var_1_12 then
			var_1_12:deregister()
		end

		if var_1_13 then
			var_1_13:deregister()
		end
	end

	return var_1_0
end

setmetatable(var_0_9, var_0_8)

return var_0_9
