local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.Timer")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.common")
local var_0_4 = require("Overkiz.Kernel.Button")
local var_0_5 = require("Overkiz.Kernel.Leds")
local var_0_6 = require("Overkiz.Tracker")
local var_0_7 = {}
local var_0_8 = {}

function var_0_7.__call(arg_1_0, arg_1_1)
	local var_1_0 = var_0_3()

	var_1_0.buttons = {
		mode = var_0_4("/dev/input/event0", 2),
		reset = var_0_4("/dev/input/event0", 0)
	}
	var_1_0.leds = var_0_5({
		green = "pwm:green:user",
		blue = "pwm:blue:user",
		red = "pwm:red:user"
	})

	local var_1_1 = {}
	local var_1_2 = {
		time = 0,
		status = "unknown"
	}
	local var_1_3 = 2
	local var_1_4 = 3
	local var_1_5 = 8
	local var_1_6

	function var_1_1.modified(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		if arg_2_2 ~= "status" then
			return
		end

		local var_2_0 = var_1_0.buttons.mode.time.microSeconds + var_1_0.buttons.mode.time.seconds * 1000000

		if arg_2_3 == 1 then
			if var_1_2.status ~= "pressed" then
				var_0_2:debug("Prog progButton pressed")

				var_1_2.status = "pressed"
				var_1_2.time = var_2_0

				function var_1_6.expired(arg_3_0)
					var_0_2:notice("Open local mode for pairing")
					var_1_0.setFunction("localAPIPairing")
				end

				var_1_6:start()
			end
		elseif arg_2_3 == 0 then
			var_0_2:debug("Mode progButton released")

			if var_1_2.status ~= "released" then
				if var_1_2.status ~= "pressed" or var_2_0 > var_1_2.time + var_1_5 * 1000000 - 1 then
					-- block empty
				elseif var_2_0 > var_1_2.time + var_1_3 * 1000000 - 1 then
					-- block empty
				else
					var_1_0.setFunction("endPairing")
					var_1_6:stop()
				end

				var_1_2.status = "released"
				var_1_2.time = var_2_0
			end
		else
			var_0_2:warning("Mode progButton unknown value " .. arg_2_3)

			var_1_2.status = "unknown"
			var_1_2.time = var_2_0
		end
	end

	local var_1_7
	local var_1_8 = {
		connected = {
			disconnected = true,
			localAPIPairing = true,
			connected = true
		},
		disconnected = {
			connectionPending = true,
			localAPIPairing = true,
			localMode = true,
			connected = true
		},
		connectionPending = {
			disconnected = true,
			localAPIPairing = true,
			localMode = true,
			connected = true
		},
		localMode = {
			disconnected = true,
			connectionPending = true,
			connected = true
		},
		localAPIPairing = {
			endPairingSuccess = true,
			endPairing = true
		},
		endPairing = {
			disconnected = true,
			connectionPending = true,
			localMode = true,
			connected = true
		},
		endPairingSuccess = {
			disconnected = true,
			connectionPending = true,
			localMode = true,
			connected = true
		},
		Unknown = {
			disconnected = true,
			connectionPending = true,
			localMode = true,
			connected = true,
			localAPIPairing = true
		}
	}
	local var_1_9 = {}
	local var_1_10 = var_0_1.Monotonic()

	function var_1_10.expired(arg_4_0)
		var_1_9.endPairing()
	end

	local function var_1_11()
		var_1_0.leds:setColor("green")
	end

	local function var_1_12()
		var_1_0.leds:off()
	end

	local function var_1_13()
		var_1_0.leds:setColor("red")
	end

	local var_1_14 = var_1_11

	function var_1_9.connected(arg_8_0)
		if var_1_0.currentMode ~= "connected" or arg_8_0 then
			var_1_14()
		end

		var_1_7:start()
	end

	function var_1_9.connectionPending(arg_9_0)
		if var_1_0.currentMode ~= "connectionPending" or arg_9_0 then
			var_1_13()
		end

		var_1_7:stop()
	end

	function var_1_9.disconnected(arg_10_0)
		if var_1_0.currentMode ~= "disconnected" or arg_10_0 then
			var_1_13()
		end

		var_1_7:stop()
	end

	function var_1_9.localMode(arg_11_0)
		if var_1_0.currentMode ~= "localMode" or arg_11_0 then
			var_1_0.leds:setColor("red")
		end

		var_1_7:stop()
	end

	function var_1_9.localAPI()
		var_1_0.leds:setColor("green")
		var_1_7:stop()
	end

	local var_1_15

	function var_1_9.localAPIPairing()
		var_1_0.leds:setHardBlink("white_moon", 1000)
		var_1_7:stop()
		var_1_0.notify("localAPIRequired")
		var_1_0.notify("wifiAPMode")

		function var_1_15.expired(arg_14_0)
			var_0_2:notice("Pairing timeout expired")
			var_1_0.setFunction("endPairing")
		end

		var_1_15:setTime(var_0_0.Monotonic(var_0_0.Elapsed(180, 0)), true)
		var_1_15:start()
	end

	function var_1_9.endPairing()
		var_1_0.notify("endPairingRequired")

		function var_1_15.expired(arg_16_0)
			var_1_0.leds:cleanup()
			var_1_0.setFunction(var_1_0.lastConnectionStatus)
		end

		var_1_15:setTime(var_0_0.Monotonic(var_0_0.Elapsed(0, 0)), true)
		var_1_15:start()
	end

	function var_1_9.endPairingSuccess()
		var_1_0.leds:setHardBlink("white_moon", 100)
		var_1_10:setTime(var_0_0.Monotonic(var_0_0.Elapsed(2, 0)), true)
		var_1_10:start()
	end

	local var_1_16 = 1
	local var_1_17 = var_0_1.Monotonic()

	local function var_1_18(arg_18_0)
		var_1_16 = 1

		function var_1_17.expired(arg_19_0)
			if var_1_16 < 2 then
				var_1_12()
				var_1_17:setTime(var_0_0.Monotonic(var_0_0.Elapsed(0, 500000000)), true)
				var_1_17:start()
			elseif var_1_16 < 7 then
				if var_1_16 % 2 == 0 then
					arg_18_0()
				else
					var_1_12()
				end

				var_1_17:setTime(var_0_0.Monotonic(var_0_0.Elapsed(0, 100000000)), true)
				var_1_17:start()
			elseif var_1_16 == 7 then
				var_1_12()
				var_1_17:setTime(var_0_0.Monotonic(var_0_0.Elapsed(0, 500000000)), true)
				var_1_17:start()
			elseif var_1_9[var_1_0.currentMode] then
				var_1_9[var_1_0.currentMode](true)
			end

			var_1_16 = var_1_16 + 1
		end

		var_1_17:expired()
	end

	local var_1_19 = 0
	local var_1_20

	function var_1_0.setFunction(arg_20_0)
		var_0_2:info("Set function requested: " .. arg_20_0)

		if arg_20_0 == "ethDisconnected" then
			arg_20_0 = "disconnected"
		elseif arg_20_0 == "ethConnected" then
			arg_20_0 = "connectionPending"
		end

		if var_1_0.allowedConnectionStatusChanges[arg_20_0] then
			var_1_0.lastConnectionStatus = arg_20_0
		end

		if arg_20_0 == "stm32StartUpgrade" or arg_20_0 == "stm32StartUpdate" then
			var_1_19 = var_1_19 + 1

			if var_1_19 == 1 then
				var_1_0.leds:setTimerHardBlink("yellow")
			end

			var_1_20:setTime(var_0_0.Monotonic(var_0_0.Elapsed(120, 0)), true)
			var_1_20:start()
		elseif arg_20_0 == "stm32StopUpgrade" or arg_20_0 == "stm32StopUpdate" then
			var_1_19 = var_1_19 - 1

			if var_1_19 == 0 then
				var_1_20:setTime(var_0_0.Monotonic(var_0_0.Elapsed(0, 0)), true)
				var_1_20:start()
			end

			return
		end

		if var_1_19 > 0 then
			return
		end

		if var_1_9[arg_20_0] then
			if var_1_0.checkIfAllowed(var_1_0.currentMode, arg_20_0, var_1_8) then
				var_1_9[arg_20_0]()

				var_1_0.currentMode = arg_20_0
			else
				var_0_2:notice("No transition available to " .. arg_20_0)
			end
		else
			var_0_2:notice("Try to set unknown mode " .. tostring(arg_20_0))
		end
	end

	function var_1_0.setEvent(arg_21_0, arg_21_1)
		if arg_21_0 == "setDefaultOn" then
			var_1_14 = var_1_11

			var_1_14()
		elseif arg_21_0 == "setDefaultOff" then
			var_1_14 = var_1_12

			var_1_14()
		elseif arg_21_0 == "play" then
			var_1_18(var_1_11)
		elseif arg_21_0 == "stop" then
			var_1_18(var_1_13)
		end
	end

	var_1_0.name = "at91-kizbox2"

	function var_1_0.load()
		var_1_7 = var_0_1.Monotonic()

		var_1_7:setTime(var_0_0.Monotonic(var_0_0.Elapsed(61, 0)), true)

		function var_1_7.expired(arg_23_0, arg_23_1)
			var_1_0.setFunction("disconnected")
		end

		var_1_20 = var_0_1.Monotonic()

		function var_1_20.expired(arg_24_0, arg_24_1)
			var_1_19 = 0

			var_1_0.setFunction(var_1_0.lastConnectionStatus)

			if var_1_9[var_1_0.lastConnectionStatus] then
				var_1_9[var_1_0.lastConnectionStatus](true)
			end
		end

		if var_1_0.buttons.mode then
			var_0_6.add(var_1_0.buttons.mode, var_1_1)
		end

		var_1_6 = var_0_1.Monotonic()

		var_1_6:setTime(var_0_0.Monotonic(var_0_0.Elapsed(var_1_3, 0)), true)

		var_1_15 = var_0_1.Monotonic()
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_7 then
			var_1_7:stop()

			var_1_7 = nil
		end

		if var_1_20 then
			var_1_20:stop()

			var_1_20 = nil
		end

		if var_1_15 then
			var_1_15:stop()

			var_1_15 = nil
		end

		var_0_6.remove(var_1_0.buttons.mode, var_1_1)

		if var_1_6 then
			var_1_6:stop()

			var_1_6 = nil
		end
	end

	return var_1_0
end

setmetatable(var_0_8, var_0_7)

return var_0_8
