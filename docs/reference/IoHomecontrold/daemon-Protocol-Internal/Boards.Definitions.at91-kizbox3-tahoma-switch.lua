local var_0_0 = require("Overkiz.Kernel.Button")
local var_0_1 = require("Overkiz.Kernel.Leds")
local var_0_2 = require("Overkiz.Time")
local var_0_3 = require("Overkiz.Timer")
local var_0_4 = require("Overkiz.Tracker")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.common")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkStatus")
local var_0_8 = {}
local var_0_9 = {}

function var_0_8.__call(arg_1_0, arg_1_1)
	local var_1_0 = var_0_6()

	var_1_0.buttons = {
		scene1 = var_0_0("/dev/input/event0", 1),
		stop = var_0_0("/dev/input/event0", 2),
		scene2 = var_0_0("/dev/input/event0", 3),
		reset = var_0_0("/dev/input/event0", 7),
		prog = var_0_0("/dev/input/event0", 8)
	}
	var_1_0.topLeds = var_0_1({
		green = "pwm:green:user",
		red = "pwm:red:user",
		blue = "pwm:blue:user",
		white = "pwm:white:user"
	})
	var_1_0.bottomLeds = var_0_1({
		red = "pio:red:user",
		white = "pio:white:user"
	})

	local var_1_1

	var_1_0.networkStatus = var_0_7.DOWN

	local function var_1_2()
		var_0_5:notice("Disabling AP WiFi and local API pairing")
		var_1_0.notify("wifiInfraMode")
		var_1_0.setFunction("endLocalAPI")
	end

	local var_1_3
	local var_1_4
	local var_1_5
	local var_1_6
	local var_1_7
	local var_1_8
	local var_1_9 = {}
	local var_1_10 = 0
	local var_1_11 = true
	local var_1_12 = true
	local var_1_13 = false
	local var_1_14 = {}
	local var_1_15 = var_0_3.Monotonic()

	var_1_15:setTime(var_0_2.Monotonic(var_0_2.Elapsed(30, 0)), true)

	function var_1_14.modified(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		if arg_3_2 ~= "status" then
			return
		end

		if arg_3_3 == 1 then
			var_1_4:setTime(var_0_2.Monotonic(var_0_2.Elapsed(3, 0)), true)

			function var_1_4.expired()
				var_1_9[var_1_0.currentMode](true)
			end

			if var_1_11 then
				var_1_0.topLeds:setCyclePulse("white", 2, 6)

				if not var_1_15:isRunning() then
					var_1_15:start()
					var_1_0.notify("buttonSwitch1:pressed")
				end
			else
				var_1_0.topLeds:setTimerHardBlink("red", 100, 400, 3)
			end

			var_1_4:start()
		end
	end

	local var_1_16 = {}
	local var_1_17 = var_0_3.Monotonic()

	var_1_17:setTime(var_0_2.Monotonic(var_0_2.Elapsed(30, 0)), true)

	function var_1_16.modified(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
		if arg_5_2 ~= "status" then
			return
		end

		if arg_5_3 == 1 then
			var_1_4:setTime(var_0_2.Monotonic(var_0_2.Elapsed(3, 0)), true)

			function var_1_4.expired()
				var_1_9[var_1_0.currentMode](true)
			end

			if var_1_12 then
				var_1_0.topLeds:setCyclePulse("white", 2, 6)

				if not var_1_17:isRunning() then
					var_1_17:start()
					var_1_0.notify("buttonSwitch3:pressed")
				end
			else
				var_1_0.topLeds:setTimerHardBlink("red", 100, 400, 3)
			end

			var_1_4:start()
		end
	end

	local var_1_18 = {}
	local var_1_19 = {
		duration = "none",
		status = "unknown"
	}
	local var_1_20 = var_0_2.Monotonic(var_0_2.Elapsed(0, 750000000))
	local var_1_21 = var_0_2.Monotonic(var_0_2.Elapsed(6, 250000000))
	local var_1_22 = var_0_2.Monotonic(var_0_2.Elapsed(4, 0))
	local var_1_23 = var_0_2.Monotonic(var_0_2.Elapsed(600, 0))
	local var_1_24 = 3

	function var_1_18.modified(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
		if arg_7_2 ~= "status" then
			return
		end

		var_1_5:stop()

		if arg_7_3 == 1 then
			if var_1_19.status ~= "pressed" then
				var_0_5:debug("Stop Button pressed")

				var_1_19.status = "pressed"
				var_1_19.duration = "tiny"

				var_1_0.topLeds:setColor("red")
				var_1_0.setFunction("buttonFeedback")
				var_1_4:setTime(var_1_20, true)

				function var_1_4.expired()
					var_1_19.duration = "short"

					var_1_0.topLeds:cleanup()
					var_1_0.topLeds:off()

					if var_1_19.status ~= "pressed" then
						var_1_0.setFunction("resumeConnectionStatus")

						return
					end

					var_1_4:setTime(var_1_21, true)

					function var_1_4.expired()
						var_1_19.duration = "medium"

						var_1_0.topLeds:setSmoothBlink("blue", 131)
						var_1_4:setTime(var_1_22, true)

						function var_1_4.expired()
							var_1_19.duration = "long"

							var_1_0.topLeds:setSmoothBlink("green", 131)
						end

						var_1_4:start()
					end

					var_1_4:start()
				end

				var_1_4:start()
			end
		elseif arg_7_3 == 0 then
			if var_1_19.status ~= "released" then
				var_0_5:debug("Detected a " .. var_1_19.duration .. " press")

				if var_1_19.duration ~= "tiny" then
					var_1_4:stop()
				end

				if var_1_19.duration ~= "long" then
					var_1_2()
				end

				if var_1_19.duration == "tiny" or var_1_19.duration == "short" then
					var_1_0.notify("buttonSwitch1:stop")
					var_1_0.notify("buttonSwitch3:stop")

					if var_1_15 then
						var_1_15:stop()
					end

					if var_1_17 then
						var_1_17:stop()
					end
				end

				if var_1_19.duration == "short" then
					var_1_0.setFunction("resumeConnectionStatus")
				elseif var_1_19.duration == "medium" then
					var_0_5:notice("Trying to enable BLE and WAC to configure Wifi")
					var_1_0.setFunction("configureWifiMode")
				elseif var_1_19.duration == "long" then
					var_0_5:notice("Trying to enable AP Wifi and Opening local mode for pairing")
					var_1_0.notify("wifiAPMode")
				end

				var_0_5:debug("Stop Button released")

				var_1_19.status = "released"
				var_1_19.duration = "none"
			end
		else
			var_0_5:warning("Mode stopButton unknown value " .. tostring(arg_7_3))

			var_1_19.status = "unknown"
			var_1_19.duration = "none"
		end
	end

	local var_1_25 = {}
	local var_1_26 = {
		duration = "none",
		status = "unknown"
	}
	local var_1_27 = var_0_2.Monotonic(var_0_2.Elapsed(2, 0))
	local var_1_28 = var_0_2.Monotonic(var_0_2.Elapsed(6, 0))

	function var_1_25.modified(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
		if arg_11_2 ~= "status" then
			return
		end

		var_1_5:stop()

		if arg_11_3 == 1 then
			if var_1_26.status ~= "pressed" then
				var_0_5:debug("Prog Button pressed")

				var_1_26.status = "pressed"
				var_1_26.duration = "short"

				var_1_0.topLeds:cleanup()
				var_1_0.topLeds:off()
				var_1_0.setFunction("buttonFeedback")
				var_1_4:setTime(var_1_27, true)

				function var_1_4.expired()
					var_1_26.duration = "medium"

					var_1_0.topLeds:setColor("somfy_yellow")
					var_1_4:setTime(var_1_28, true)

					function var_1_4.expired()
						var_1_26.duration = "long"

						var_1_0.topLeds:cleanup()
						var_1_0.topLeds:off()
					end

					var_1_4:start()
				end

				var_1_4:start()
			end
		elseif arg_11_3 == 0 then
			if var_1_26.status ~= "released" then
				var_0_5:debug("Detected a " .. var_1_26.duration .. " press")
				var_1_4:stop()

				if var_1_26.duration == "short" then
					var_1_0.notify("discoverActuatorSimpleWithWinkIO")
				elseif var_1_26.duration == "medium" then
					var_1_0.notify("discoverSensorSimpleIO")
				elseif var_1_26.duration == "long" then
					var_1_0.notify("winkIO")
				end

				var_1_0.setFunction("actionStarted")
				var_0_5:debug("Prog Button released")

				var_1_26.status = "released"
				var_1_26.duration = "none"
			end
		else
			var_0_5:warning("Mode progButton unknown value " .. tostring(arg_11_3))

			var_1_26.status = "unknown"
			var_1_26.duration = "none"
		end
	end

	local var_1_29 = {}
	local var_1_30 = {
		duration = "none",
		status = "unknown"
	}
	local var_1_31 = var_0_2.Monotonic(var_0_2.Elapsed(8, 0))
	local var_1_32 = var_0_2.Monotonic(var_0_2.Elapsed(3, 0))

	function var_1_29.modified(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
		if arg_14_2 ~= "status" then
			return
		end

		if arg_14_3 == 1 then
			if var_1_30.status ~= "pressed" then
				var_0_5:debug("Reset Button pressed")

				var_1_30.status = "pressed"
				var_1_30.duration = "short"

				var_1_0.setFunction("buttonFeedback")
				var_1_4:setTime(var_1_31, true)

				function var_1_4.expired()
					var_1_0.notify("wifiReset")
					var_1_0.notify("resetHK")

					var_1_0.lastConnectionStatus = "disconnected"
					var_1_30.duration = "long"

					if var_1_10 == 0 then
						var_1_0.bottomLeds:setHardBlink("red", 500)
					end

					var_1_4:setTime(var_1_32, true)

					function var_1_4.expired()
						if var_1_10 == 0 then
							var_1_0.bottomLeds:cleanup()
							var_1_0.bottomLeds:off()
						end

						var_1_0.setFunction("configureWifiMode")
					end

					var_1_4:start()
				end

				var_1_4:start()
			end
		elseif arg_14_3 == 0 then
			if var_1_30.status ~= "released" then
				var_0_5:debug("Detected a " .. var_1_30.duration .. " press")

				if var_1_30.duration ~= "long" then
					var_1_4:stop()
					var_1_0.setFunction("resumeConnectionStatus")
				end

				var_0_5:debug("Reset Button released")

				var_1_30.status = "released"
				var_1_30.duration = "none"
			end
		else
			var_0_5:warning("Mode resetButton unknown value " .. arg_14_3)

			var_1_30.status = "unknown"
			var_1_30.duration = "none"
		end
	end

	local var_1_33 = {
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
			APWifiWithLocalAPIPairing = true,
			configureWifiMode = true,
			actionStarted = true,
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
		configureWifiMode = {
			buttonFeedback = true,
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
	local var_1_34 = var_0_3.Monotonic()
	local var_1_35 = var_0_3.Monotonic()
	local var_1_36 = false
	local var_1_37 = true
	local var_1_38 = var_0_3.Monotonic()

	var_1_38:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

	function var_1_38.expired()
		var_1_37 = false

		if var_1_10 == 0 and var_1_0.currentMode == "disconnected" then
			var_1_0.bottomLeds:setColor("red", var_1_1)
		end
	end

	local function var_1_39()
		var_1_0.lastConnectionStatus = "disconnected"
		var_1_37 = true

		var_1_38:start()
	end

	function var_1_9.connected(arg_19_0)
		var_1_0.lastConnectionStatus = "connected"

		if var_1_0.currentMode == "disconnected" then
			var_1_3:start()
		end

		if arg_19_0 or var_1_0.currentMode ~= "connected" then
			var_1_5:stop()
			var_1_0.topLeds:cleanup()
			var_1_0.topLeds:off()

			if var_1_10 == 0 then
				var_1_0.bottomLeds:setColor("white", var_1_1)
			end
		end

		var_1_6:start()
	end

	function var_1_9.disconnected(arg_20_0)
		var_1_0.lastConnectionStatus = "disconnected"

		if arg_20_0 or var_1_0.currentMode ~= "disconnected" then
			var_1_5:stop()

			if var_1_0.networkStatus == var_0_7.UP then
				var_1_0.topLeds:setCycleHeartbeatBlink("white", 200, 1, 2000, 0)
			else
				var_1_0.topLeds:setCycleHeartbeatBlink("white", 200, 2, 2000, 0)
			end

			if var_1_10 == 0 then
				if var_1_37 then
					var_1_0.bottomLeds:cleanup()
					var_1_0.bottomLeds:off()
				else
					var_1_0.bottomLeds:setColor("red", var_1_1)
				end
			end
		end

		var_1_6:stop()
	end

	function var_1_9.buttonFeedback()
		return
	end

	function var_1_9.actionStarted()
		var_1_5:setTime(var_0_2.Monotonic(var_0_2.Elapsed(30, 0)), true)
		var_1_5:start()
	end

	function var_1_9.actionPending()
		var_1_0.topLeds:setHardBlink("somfy_yellow", 150)
	end

	function var_1_9.actionOK()
		var_1_0.topLeds:setHardBlink("green", 300, 10)
		var_1_5:setTime(var_0_2.Monotonic(var_0_2.Elapsed(3, 0)), true)
		var_1_5:start()
	end

	function var_1_9.actionKO()
		var_1_0.topLeds:setHardBlink("red", 300, 10)
		var_1_5:setTime(var_0_2.Monotonic(var_0_2.Elapsed(3, 0)), true)
		var_1_5:start()
	end

	function var_1_9.actionNoEffects()
		local var_26_0 = 3

		var_1_0.topLeds:setHardBlink("somfy_yellow", 150)
		var_1_5:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, var_26_0 * 3 * 2 * 150 * 1000 * 1000)), true)
		var_1_5:start()
	end

	function var_1_9.configureWifiMode()
		if var_1_10 == 0 then
			var_1_0.bottomLeds:cleanup()
			var_1_0.bottomLeds:off()
		end

		var_1_0.topLeds:setSmoothBlink("blue", 131)
		var_1_5:setTime(var_0_2.Monotonic(var_0_2.Elapsed(900, 0)), true)
		var_1_5:start()
		var_1_0.notify("bluetoothStart")
		var_1_0.notify("wacStart")
	end

	local var_1_40 = var_0_3.Monotonic()

	function var_1_9.resumeConnectionStatus()
		var_1_0.notify("endPairingRequired")
		var_1_0.notify("bluetoothStop")
		var_1_0.notify("wifiInfraMode")

		function var_1_40.expired()
			var_1_0.setFunction(var_1_0.lastConnectionStatus)

			if var_1_9[var_1_0.lastConnectionStatus] then
				var_1_9[var_1_0.lastConnectionStatus](true)
			end
		end

		var_1_40:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 250000000)), true)
		var_1_40:start()
	end

	function var_1_9.localAPI()
		var_1_0.topLeds:setColor("green")
		var_1_6:stop()
		var_1_5:stop()
	end

	function var_1_9.localAPIPairing()
		return
	end

	function var_1_9.APWifiWithLocalAPIPairing()
		if var_1_10 == 0 then
			var_1_0.bottomLeds:cleanup()
			var_1_0.bottomLeds:off()
		end

		var_1_0.topLeds:setSmoothBlink("green", 131)
		var_1_6:stop()
		var_1_0.notify("localAPIRequired")

		var_1_0.lastConnectionStatus = "disconnected"
	end

	function var_1_9.endPairing()
		var_1_34.expired = var_1_2

		var_1_34:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
		var_1_34:start()
	end

	function var_1_9.endPairingSuccess()
		function var_1_34.expired()
			var_1_0.setFunction("localAPI")
		end

		var_1_34:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
		var_1_34:start()
	end

	function var_1_9.endLocalAPI()
		var_1_36 = false

		var_1_0.notify("endPairingRequired")

		function var_1_34.expired()
			var_1_0.setFunction(var_1_0.lastConnectionStatus)
		end

		var_1_34:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
		var_1_34:start()
	end

	local function var_1_41(arg_38_0)
		local var_38_0 = var_1_0.currentMode

		var_1_0.currentMode = "identify"

		if var_1_10 == 0 then
			var_1_0.bottomLeds:setHardAlternateBlink("red", "white", 500, 2 * arg_38_0)
		end

		var_0_3.Timeout(var_0_2.Elapsed(arg_38_0, 0), function()
			var_1_0.currentMode = var_38_0

			if var_38_0 and var_1_9[var_38_0] then
				var_1_9[var_38_0](true)
			end
		end)
	end

	local var_1_42

	function var_1_0.setFunction(arg_40_0)
		var_0_5:info("Set function requested: " .. arg_40_0)

		if arg_40_0 == "stm32StartUpgrade" or arg_40_0 == "stm32StartUpdate" then
			var_1_10 = var_1_10 + 1

			if var_1_10 == 1 then
				var_1_0.bottomLeds:setSmoothBlink("red")
			end

			var_1_42:setTime(var_0_2.Monotonic(var_0_2.Elapsed(120, 0)), true)
			var_1_42:start()
		elseif arg_40_0 == "stm32ApplyUpgrade" or arg_40_0 == "stm32ApplyUpdate" then
			var_1_0.bottomLeds:setCycleHardBlink("red", 250)
		elseif (arg_40_0 == "stm32StopUpgrade" or arg_40_0 == "stm32StopUpdate") and var_1_10 > 0 then
			var_1_10 = var_1_10 - 1

			if var_1_10 == 0 then
				var_1_42:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
				var_1_42:start()
			end
		end

		if var_1_9[arg_40_0] then
			if var_1_0.checkIfAllowed(var_1_0.currentMode, arg_40_0, var_1_33) then
				var_1_9[arg_40_0]()

				var_1_0.currentMode = arg_40_0
			else
				var_0_5:notice("No transition available to " .. arg_40_0)
			end
		else
			var_0_5:notice("Try to set unknown mode " .. tostring(arg_40_0))
		end
	end

	function var_1_0.setEvent(arg_41_0, arg_41_1)
		if arg_41_0 == "APIClientStillActive" then
			if not var_1_36 then
				var_1_36 = true

				var_1_0.setFunction("localAPI")
			end

			var_1_35.expired = var_1_2

			var_1_35:setTime(var_1_23, true)
			var_1_35:start()
		elseif arg_41_0 == "wifi" then
			if arg_41_1 == "hkReady" then
				if var_1_0.currentMode == "configureWifiMode" then
					var_1_0.notify("wifiWACMode")
				end
			elseif arg_41_1 == "startAP" then
				var_1_0.setFunction("APWifiWithLocalAPIPairing")
			elseif arg_41_1 == "stopAP" then
				var_1_0.setFunction("endLocalAPI")
			elseif arg_41_1 == "ready" then
				if var_1_0.currentMode == "Unknown" then
					var_1_0.setFunction("disconnected")
				end
			elseif arg_41_1 == "noConfig" then
				var_1_0.setFunction("buttonFeedback")
				var_0_3.Timeout(0, function()
					var_1_0.setFunction("configureWifiMode")
				end)
			end
		elseif arg_41_0 == "identify" then
			var_1_41(var_1_24)
		elseif arg_41_0 == "setDefaultOn" or arg_41_0 == "setDefaultOff" then
			if arg_41_0 == "setDefaultOff" and arg_41_1 == 0 then
				var_1_1 = 0
			else
				var_1_1 = 1
			end

			if var_1_9[var_1_0.currentMode] then
				var_1_9[var_1_0.currentMode](true)
			end
		elseif arg_41_0 == "scene1" then
			if arg_41_1 == "loaded" then
				var_1_11 = true
			elseif arg_41_1 == "unloaded" then
				var_1_11 = false
			end
		elseif arg_41_0 == "scene2" then
			if arg_41_1 == "loaded" then
				var_1_12 = true
			elseif arg_41_1 == "unloaded" then
				var_1_12 = false
			end
		elseif arg_41_0 == "aliveTimeout" then
			if arg_41_1 == "active" then
				var_1_13 = true
			elseif arg_41_1 == "inactive" then
				var_1_13 = false
			end
		elseif arg_41_0 == "network" then
			var_1_0.networkStatus = arg_41_1

			if var_1_0.currentMode == "disconnected" then
				var_1_9.disconnected(true)
			end
		elseif (arg_41_0 == "bluetooth" or arg_41_0 == "wac") and arg_41_1 == "stop" and var_1_0.currentMode == "configureWifiMode" then
			var_1_39()
			var_1_0.setFunction("resumeConnectionStatus")
		end
	end

	var_1_0.name = "at91-kizbox3-tahoma-switch"

	function var_1_0.load()
		var_1_0.topLeds:cleanup()
		var_1_0.topLeds:off()
		var_1_0.bottomLeds:cleanup()
		var_1_0.bottomLeds:off()

		var_1_3 = var_0_3.Monotonic()

		var_1_3:setTime(var_0_2.Monotonic(var_0_2.Elapsed(30, 0)), true)

		function var_1_3.expired()
			if var_1_10 == 0 and var_1_13 then
				var_1_0.bottomLeds:off()
			end
		end

		var_1_4 = var_0_3.Monotonic()
		var_1_5 = var_0_3.Monotonic()

		function var_1_5.expired()
			var_1_0.topLeds:cleanup()
			var_1_0.topLeds:off()
			var_1_0.setFunction("resumeConnectionStatus")
		end

		var_1_6 = var_0_3.Monotonic()

		var_1_6:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

		function var_1_6.expired()
			var_1_0.setFunction("disconnected")
		end

		if var_1_0.buttons.scene1 then
			var_0_4.add(var_1_0.buttons.scene1, var_1_14)
		end

		if var_1_0.buttons.stop then
			var_0_4.add(var_1_0.buttons.stop, var_1_18)
		end

		if var_1_0.buttons.scene2 then
			var_0_4.add(var_1_0.buttons.scene2, var_1_16)
		end

		if var_1_0.buttons.prog then
			var_0_4.add(var_1_0.buttons.prog, var_1_25)
		end

		if var_1_0.buttons.reset then
			var_0_4.add(var_1_0.buttons.reset, var_1_29)
		end

		var_1_42 = var_0_3.Monotonic()

		function var_1_42.expired()
			var_1_10 = 0

			var_1_0.bottomLeds:cleanup()
			var_1_0.bottomLeds:off()

			if var_1_0.currentMode == "disconnected" or var_1_0.currentMode == "connected" then
				var_1_9[var_1_0.currentMode](true)
			end
		end

		var_1_0.topLeds:setColor("yellow")
		var_1_39()
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_42 then
			var_1_42:stop()

			var_1_42 = nil
		end

		if var_1_4 then
			var_1_4:stop()

			var_1_4 = nil
		end

		if var_1_5 then
			var_1_5:stop()

			var_1_5 = nil
		end

		if var_1_6 then
			var_1_6:stop()

			var_1_6 = nil
		end

		if var_1_40 then
			var_1_40:stop()

			var_1_40 = nil
		end

		if var_1_34 then
			var_1_34:stop()

			var_1_34 = nil
		end

		if var_1_35 then
			var_1_35:stop()

			var_1_35 = nil
		end

		var_0_4.remove(var_1_0.buttons.scene1, var_1_14)
		var_0_4.remove(var_1_0.buttons.stop, var_1_18)
		var_0_4.remove(var_1_0.buttons.scene2, var_1_16)
		var_0_4.remove(var_1_0.buttons.prog, var_1_25)
		var_0_4.remove(var_1_0.buttons.reset, var_1_29)
	end

	return var_1_0
end

setmetatable(var_0_9, var_0_8)

return var_0_9
