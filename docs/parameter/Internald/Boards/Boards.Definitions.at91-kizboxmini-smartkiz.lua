local var_0_0 = require("Overkiz.Kernel.Button")
local var_0_1 = require("Overkiz.Kernel.Leds")
local var_0_2 = require("Overkiz.Time")
local var_0_3 = require("Overkiz.Timer")
local var_0_4 = require("Overkiz.Tracker")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.common")
local var_0_7 = {}
local var_0_8 = {}

function var_0_7.__call(arg_1_0, arg_1_1)
	local var_1_0 = var_0_6()

	var_1_0.leds = var_0_1({
		green = "pwm:green:user",
		blue = "pwm:blue:user",
		red = "pwm:red:user"
	})

	local var_1_1

	var_1_0.buttons = {
		mode = var_0_0("/dev/input/event0", 2),
		reset = var_0_0("/dev/input/event0", 0)
	}

	local var_1_2 = false

	local function var_1_3()
		var_0_5:notice("Disabling AP WiFi and local API pairing")
		var_1_0.notify("wifiInfraMode")
		var_1_0.setFunction("endLocalAPI")
	end

	local var_1_4
	local var_1_5 = {}
	local var_1_6 = {
		duration = "none",
		status = "unknown"
	}
	local var_1_7 = var_0_2.Monotonic(var_0_2.Elapsed(2, 0))
	local var_1_8 = var_0_2.Monotonic(var_0_2.Elapsed(6, 0))
	local var_1_9 = var_0_2.Monotonic(var_0_2.Elapsed(600, 0))
	local var_1_10 = var_0_2.Monotonic(var_0_2.Elapsed(120, 0))
	local var_1_11 = var_0_2.Monotonic(var_0_2.Elapsed(900, 0))

	function var_1_5.modified(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		if arg_3_2 ~= "status" then
			return
		end

		if arg_3_3 == 1 then
			if var_1_6.status ~= "pressed" then
				var_0_5:debug("Prog Button pressed")

				var_1_6.status = "pressed"
				var_1_6.duration = "short"

				var_1_0.leds:cleanup()
				var_1_0.leds:off()
				var_1_4:setTime(var_1_7, true)

				function var_1_4.expired()
					var_1_6.duration = "medium"

					var_1_0.leds:setCycleSmoothBlink("blue")
					var_1_4:setTime(var_1_8, true)

					function var_1_4.expired()
						var_1_6.duration = "long"

						var_1_0.leds:setCycleSmoothBlink("green")
					end

					var_1_4:start()
				end

				var_1_4:start()
			end
		elseif arg_3_3 == 0 then
			if var_1_6.status ~= "released" then
				var_0_5:debug("Detected a " .. var_1_6.duration .. " press")
				var_1_4:stop()

				if var_1_6.duration == "short" then
					var_1_3()
				elseif var_1_6.duration == "medium" then
					var_0_5:notice("Trying to enable AP Wifi and Opening local mode for pairing")
					var_1_0.setFunction("APWifiWithLocalAPIPairing")
				elseif var_1_6.duration == "long" then
					var_0_5:notice("Trying to enable WAC to configure Wifi")

					var_1_2 = true

					var_1_0.notify("wacStart")
					var_1_0.setFunction(var_1_0.lastConnectionStatus)
				end

				var_0_5:debug("Prog Button released")

				var_1_6.status = "released"
				var_1_6.duration = "none"
			else
				var_0_5:warning("Mode progButton unknown value " .. tostring(arg_3_3))

				var_1_6.status = "unknown"
				var_1_6.duration = "none"
			end
		end
	end

	local var_1_12 = {}
	local var_1_13 = {
		duration = "none",
		status = "unknown"
	}
	local var_1_14 = var_0_2.Monotonic(var_0_2.Elapsed(8, 0))
	local var_1_15 = var_0_2.Monotonic(var_0_2.Elapsed(3, 0))

	function var_1_12.modified(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
		if arg_6_2 ~= "status" then
			return
		end

		if arg_6_3 == 1 then
			if var_1_13.status ~= "pressed" then
				var_0_5:debug("Reset Button pressed")

				var_1_13.status = "pressed"
				var_1_13.duration = "short"

				var_1_4:setTime(var_1_14, true)

				function var_1_4.expired()
					var_1_0.notify("wifiReset")
					var_1_0.notify("resetHK")

					var_1_0.lastConnectionStatus = "disconnected"
					var_1_13.duration = "long"

					var_1_0.leds:setHardBlink("red", 500)
					var_1_4:setTime(var_1_15, true)

					function var_1_4.expired()
						var_1_0.leds:cleanup()
						var_1_0.leds:off()
						var_1_0.setFunction(var_1_0.lastConnectionStatus)
					end

					var_1_4:start()
				end

				var_1_4:start()
			end
		elseif arg_6_3 == 0 then
			if var_1_13.status ~= "released" then
				var_0_5:debug("Detected a " .. var_1_13.duration .. " press")

				if var_1_13.duration ~= "long" then
					var_1_4:stop()

					var_1_2 = true

					var_1_0.notify("wacStart")
					var_1_0.setFunction(var_1_0.lastConnectionStatus)
				end

				var_0_5:debug("Reset Button released")

				var_1_13.status = "released"
				var_1_13.duration = "none"
			end
		else
			var_0_5:warning("Mode resetButton unknown value " .. arg_6_3)

			var_1_13.status = "unknown"
			var_1_13.duration = "none"
		end
	end

	local var_1_16 = var_0_3.Monotonic()

	var_1_16:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

	function var_1_16.expired(arg_9_0)
		var_1_0.setFunction("disconnected")
	end

	local var_1_17 = {
		connected = {
			disconnected = true,
			configureWifiMode = true,
			APWifiWithLocalAPIPairing = true,
			connected = true
		},
		disconnected = {
			APWifiWithLocalAPIPairing = true,
			configureWifiMode = true,
			connectionPending = true,
			connected = true
		},
		connectionPending = {
			disconnected = true,
			configureWifiMode = true,
			APWifiWithLocalAPIPairing = true,
			connected = true
		},
		configureWifiMode = {
			APWifiWithLocalAPIPairing = true,
			endLocalAPI = true
		},
		localAPI = {
			APWifiWithLocalAPIPairing = true,
			configureWifiMode = true,
			endLocalAPI = true
		},
		APWifiWithLocalAPIPairing = {
			localAPI = true,
			endPairingSuccess = true,
			APWifiWithLocalAPIPairing = true,
			configureWifiMode = true,
			endLocalAPI = true
		},
		endLocalAPI = {
			disconnected = true,
			connectionPending = true,
			connected = true
		},
		endPairingSuccess = {
			disconnected = true,
			localAPI = true,
			connectionPending = true,
			connected = true
		},
		Unknown = {
			disconnected = true,
			connectionPending = true,
			connected = true,
			APWifiWithLocalAPIPairing = true,
			configureWifiMode = true
		}
	}
	local var_1_18 = false
	local var_1_19 = {
		connected = function(arg_10_0)
			if var_1_0.currentMode ~= "connected" or arg_10_0 then
				var_1_0.leds:setColor("green", var_1_1)
			end

			var_1_16:start()
		end,
		connectionPending = function()
			var_1_0.leds:setColor("red", var_1_1)
			var_1_16:start()
		end,
		disconnected = function()
			var_1_0.leds:setColor("red", var_1_1)
			var_1_16:stop()
		end
	}
	local var_1_20

	function var_1_19.localAPI()
		var_1_0.leds:setColor("blue", var_1_1)
		var_1_16:stop()
		var_1_20:stop()

		var_1_20.expired = var_1_3

		var_1_20:setTime(var_1_9, true)
		var_1_20:start()
	end

	function var_1_19.localAPIPairing()
		return
	end

	function var_1_19.APWifiWithLocalAPIPairing()
		var_1_0.leds:setCycleSmoothBlink("blue")
		var_1_16:stop()
		var_1_0.notify("localAPIRequired")
		var_1_0.notify("wifiAPMode")

		var_1_0.lastConnectionStatus = "disconnected"
		var_1_20.expired = var_1_3

		var_1_20:setTime(var_1_10, true)
		var_1_20:start()
	end

	function var_1_19.configureWifiMode()
		var_1_0.leds:setCycleSmoothBlink("green")
		var_1_16:stop()
		var_1_0.notify("wifiWACMode")

		var_1_0.lastConnectionStatus = "disconnected"
		var_1_20.expired = var_1_3

		var_1_20:setTime(var_1_11, true)
		var_1_20:start()
	end

	function var_1_19.endPairingSuccess()
		function var_1_20.expired()
			var_1_0.setFunction("localAPI")
		end

		var_1_20:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
		var_1_20:start()
	end

	function var_1_19.endLocalAPI()
		var_1_18 = false

		var_1_0.notify("endPairingRequired")

		function var_1_20.expired()
			var_1_0.setFunction(var_1_0.lastConnectionStatus)
		end

		var_1_20:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
		var_1_20:start()
	end

	local function var_1_21(arg_21_0)
		var_1_0.leds:setSmoothBlink("magenta")
		var_0_3.Timeout(var_0_2.Elapsed(arg_21_0, 0), function()
			if var_1_0.currentMode and var_1_19[var_1_0.currentMode] then
				var_1_19[var_1_0.currentMode](true)
			end
		end)
	end

	local var_1_22 = 0
	local var_1_23

	function var_1_0.setFunction(arg_23_0)
		var_0_5:info("Set function requested: " .. arg_23_0)

		if arg_23_0 == "ethDisconnected" then
			arg_23_0 = "disconnected"
		elseif arg_23_0 == "ethConnected" then
			arg_23_0 = "connectionPending"
		end

		if var_1_0.allowedConnectionStatusChanges[arg_23_0] then
			var_1_0.lastConnectionStatus = arg_23_0
		end

		if arg_23_0 == "stm32StartUpgrade" or arg_23_0 == "stm32StartUpdate" then
			var_1_22 = var_1_22 + 1

			if var_1_22 == 1 then
				var_1_0.leds:setHardBlink("yellow")
			end

			var_1_23:setTime(var_0_2.Monotonic(var_0_2.Elapsed(120, 0)), true)
			var_1_23:start()
		elseif arg_23_0 == "stm32StopUpgrade" or arg_23_0 == "stm32StopUpdate" then
			var_1_22 = var_1_22 - 1

			if var_1_22 == 0 then
				var_1_23:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
				var_1_23:start()
			end

			return
		end

		if var_1_22 > 0 then
			return
		end

		if var_1_19[arg_23_0] then
			if var_1_0.checkIfAllowed(var_1_0.currentMode, arg_23_0, var_1_17) then
				var_1_19[arg_23_0]()

				var_1_0.currentMode = arg_23_0
			else
				var_0_5:notice("No transition available to " .. arg_23_0)
			end
		else
			var_0_5:notice("Try to set unknown mode " .. tostring(arg_23_0))
		end
	end

	function var_1_0.setEvent(arg_24_0, arg_24_1)
		if arg_24_0 == "APIClientStillActive" then
			if not var_1_18 then
				var_1_18 = true

				var_1_0.setFunction("localAPI")
			end

			var_1_20.expired = var_1_3

			var_1_20:setTime(var_1_9, true)
			var_1_20:start()
		elseif arg_24_0 == "wifi" then
			if arg_24_1 == "hkReady" then
				if var_1_2 then
					var_1_0.setFunction("configureWifiMode")

					var_1_2 = false
				end
			elseif arg_24_1 == "stopAP" then
				var_1_3()
			elseif arg_24_1 == "noConfig" then
				var_1_2 = true

				var_1_0.notify("wacStart")
			end
		elseif arg_24_0 == "wac" and arg_24_1 == "stop" and var_1_0.currentMode == "configureWifiMode" then
			var_1_3()
		elseif arg_24_0 == "identify" then
			var_1_21(tonumber(arg_24_1))
		elseif arg_24_0 == "setDefaultOn" or arg_24_0 == "setDefaultOff" then
			if arg_24_0 == "setDefaultOn" then
				var_1_1 = 1
			else
				var_1_1 = arg_24_1
			end

			if var_1_19[var_1_0.currentMode] then
				var_1_19[var_1_0.currentMode](true)
			end
		end
	end

	var_1_0.name = "at91-kizboxmini-smartkiz"

	function var_1_0.load()
		var_1_16 = var_0_3.Monotonic()

		var_1_16:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

		function var_1_16.expired(arg_26_0)
			var_1_0.setFunction("disconnected")
		end

		var_1_23 = var_0_3.Monotonic()

		function var_1_23.expired(arg_27_0)
			var_1_22 = 0

			var_1_0.setFunction(var_1_0.lastConnectionStatus)

			if var_1_19[var_1_0.lastConnectionStatus] then
				var_1_19[var_1_0.lastConnectionStatus](true)
			end
		end

		var_1_4 = var_0_3.Monotonic()

		if var_1_0.buttons.mode then
			var_0_4.add(var_1_0.buttons.mode, var_1_5)
		end

		var_1_20 = var_0_3.Monotonic()

		if var_1_0.buttons.reset then
			var_0_4.add(var_1_0.buttons.reset, var_1_12)
		end
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_16 then
			var_1_16:stop()

			var_1_16 = nil
		end

		if var_1_20 then
			var_1_20:stop()

			var_1_20 = nil
		end

		var_0_4.remove(var_1_0.buttons.mode, var_1_5)
		var_0_4.remove(var_1_0.buttons.reset, var_1_12)
	end

	return var_1_0
end

setmetatable(var_0_8, var_0_7)

return var_0_8
