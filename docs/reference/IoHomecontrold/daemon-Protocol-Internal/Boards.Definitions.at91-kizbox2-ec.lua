local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.Time")
local var_0_2 = require("Overkiz.Timer")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.common")
local var_0_5 = require("Overkiz.Kernel.Button")
local var_0_6 = require("Overkiz.Kernel.Led")
local var_0_7 = require("Overkiz.Tracker")
local var_0_8 = {}
local var_0_9 = {}

function var_0_8.__call(arg_1_0, arg_1_1)
	local var_1_0 = var_0_4()

	var_1_0.buttons = {
		mode = var_0_5("/dev/input/event0", 2),
		reset = var_0_5("/dev/input/event0", 0)
	}
	var_1_0.leds = {
		connection = {
			green = var_0_6("pwm:green:user"),
			red = var_0_6("pwm:red:user"),
			blue = var_0_6("pwm:blue:user")
		}
	}

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
				var_0_3:debug("Prog progButton pressed")

				var_1_2.status = "pressed"
				var_1_2.time = var_2_0

				function var_1_6.expired(arg_3_0)
					var_0_3:notice("Open local mode for pairing")
					var_1_0.setFunction("localAPIPairing")
				end

				var_1_6:start()
			end
		elseif arg_2_3 == 0 then
			var_0_3:debug("Mode progButton released")

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
			var_0_3:warning("Mode progButton unknown value " .. arg_2_3)

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
	local var_1_10 = var_0_2.Monotonic()

	function var_1_10.expired(arg_4_0)
		var_1_9.endPairing()
	end

	local function var_1_11()
		var_1_0.leds.connection.green:setOff()
		var_1_0.leds.connection.blue:setOn()
		var_1_0.leds.connection.red:setOff()
	end

	local var_1_12 = 1

	local function var_1_13()
		var_1_0.leds.connection.green:setOff()
		var_1_0.leds.connection.blue:setBrightness(var_1_12)
		var_1_0.leds.connection.red:setOff()
	end

	local function var_1_14()
		var_1_0.leds.connection.green:setOff()
		var_1_0.leds.connection.blue:setOff()
		var_1_0.leds.connection.red:setOn()
	end

	local var_1_15 = var_1_11

	function var_1_9.connected(arg_8_0)
		if var_1_0.currentMode ~= "connected" or arg_8_0 then
			var_1_15()
		end

		var_1_7:start()
	end

	function var_1_9.connectionPending(arg_9_0)
		if var_1_0.currentMode ~= "connectionPending" or arg_9_0 then
			var_1_14()
		end

		var_1_7:stop()
	end

	function var_1_9.disconnected(arg_10_0)
		if var_1_0.currentMode ~= "disconnected" or arg_10_0 then
			var_1_14()
		end

		var_1_7:stop()
	end

	function var_1_9.localMode(arg_11_0)
		if var_1_0.currentMode ~= "localMode" or arg_11_0 then
			var_1_0.leds.connection.green:setOff()
			var_1_0.leds.connection.blue:setOff()
			var_1_0.leds.connection.red:setOn()
		end

		var_1_7:stop()
	end

	function var_1_9.localAPI()
		var_1_0.leds.connection.green:setOff()
		var_1_0.leds.connection.red:setOff()
		var_1_0.leds.connection.blue:setOn()
		var_1_7:stop()
	end

	local var_1_16

	function var_1_9.localAPIPairing()
		var_1_0.leds.connection.green:setCycleSmoothBlink()
		var_1_0.leds.connection.red:setCycleSmoothBlink()
		var_1_0.leds.connection.blue:setOff()
		var_1_7:stop()
		var_1_0.notify("localAPIRequired")
		var_1_0.notify("wifiAPMode")

		function var_1_16.expired(arg_14_0)
			var_0_3:notice("Pairing timeout expired")
			var_1_0.setFunction("endPairing")
		end

		var_1_16:setTime(var_0_1.Monotonic(var_0_1.Elapsed(60, 0)), true)
		var_1_16:start()
	end

	function var_1_9.endPairing()
		var_1_0.notify("endPairingRequired")

		function var_1_16.expired(arg_16_0)
			var_1_0.leds.connection.green:cleanup()
			var_1_0.leds.connection.red:cleanup()
			var_1_0.leds.connection.blue:cleanup()
			var_1_0.setFunction(var_1_0.lastConnectionStatus)
		end

		var_1_16:setTime(var_0_1.Monotonic(var_0_1.Elapsed(0, 0)), true)
		var_1_16:start()
	end

	function var_1_9.endPairingSuccess()
		var_1_0.leds.connection.green:setTrigger("timer")
		var_1_0.leds.connection.red:setTrigger("timer")
		var_1_0.leds.connection.green:setdelayOn("100")
		var_1_0.leds.connection.red:setdelayOn("100")
		var_1_0.leds.connection.green:setdelayOff("100")
		var_1_0.leds.connection.red:setdelayOff("100")
		var_1_10:setTime(var_0_1.Monotonic(var_0_1.Elapsed(2, 0)), true)
		var_1_10:start()
	end

	local var_1_17 = 1
	local var_1_18 = var_0_2.Monotonic()

	local function var_1_19(arg_18_0)
		var_1_17 = 1

		function var_1_18.expired(arg_19_0)
			if var_1_17 < 2 then
				var_1_13()
				var_1_18:setTime(var_0_1.Monotonic(var_0_1.Elapsed(0, 500000000)), true)
				var_1_18:start()
			elseif var_1_17 < 7 then
				if var_1_17 % 2 == 0 then
					arg_18_0()
				else
					var_1_13()
				end

				var_1_18:setTime(var_0_1.Monotonic(var_0_1.Elapsed(0, 100000000)), true)
				var_1_18:start()
			elseif var_1_17 == 7 then
				var_1_13()
				var_1_18:setTime(var_0_1.Monotonic(var_0_1.Elapsed(0, 500000000)), true)
				var_1_18:start()
			elseif var_1_9[var_1_0.currentMode] then
				var_1_9[var_1_0.currentMode](true)
			end

			var_1_17 = var_1_17 + 1
		end

		var_1_18:expired()
	end

	local var_1_20 = 0
	local var_1_21

	function var_1_0.setFunction(arg_20_0)
		var_0_3:info("Set function requested: " .. arg_20_0)

		if arg_20_0 == "ethDisconnected" then
			arg_20_0 = "disconnected"
		elseif arg_20_0 == "ethConnected" then
			arg_20_0 = "connectionPending"
		end

		if var_1_0.allowedConnectionStatusChanges[arg_20_0] then
			var_1_0.lastConnectionStatus = arg_20_0
		end

		if arg_20_0 == "stm32StartUpgrade" or arg_20_0 == "stm32StartUpdate" then
			var_1_20 = var_1_20 + 1

			if var_1_20 == 1 then
				var_1_0.leds.connection.green:setOff()
				var_1_0.leds.connection.blue:setOff()
				var_1_0.leds.connection.red:setOff()
				var_1_0.leds.connection.red:setTrigger("timer")
				var_1_0.leds.connection.green:setTrigger("timer")
			end

			var_1_21:setTime(var_0_1.Monotonic(var_0_1.Elapsed(120, 0)), true)
			var_1_21:start()
		elseif arg_20_0 == "stm32StopUpgrade" or arg_20_0 == "stm32StopUpdate" then
			var_1_20 = var_1_20 - 1

			if var_1_20 == 0 then
				var_1_21:setTime(var_0_1.Monotonic(var_0_1.Elapsed(0, 0)), true)
				var_1_21:start()
			end

			return
		end

		if var_1_20 > 0 then
			return
		end

		if var_1_9[arg_20_0] then
			if var_1_0.checkIfAllowed(var_1_0.currentMode, arg_20_0, var_1_8) then
				var_1_9[arg_20_0]()

				var_1_0.currentMode = arg_20_0
			else
				var_0_3:notice("No transition available to " .. arg_20_0)
			end
		else
			var_0_3:notice("Try to set unknown mode " .. tostring(arg_20_0))
		end
	end

	function var_1_0.setEvent(arg_21_0, arg_21_1)
		if arg_21_0 == "setDefaultOn" then
			var_1_15 = var_1_11

			var_1_15()
		elseif arg_21_0 == "setDefaultOff" then
			var_1_15 = var_1_13
			var_1_12 = var_0_0.round(255 * tonumber(arg_21_1 or 0) % 256)

			var_1_15()
		elseif arg_21_0 == "play" then
			var_1_19(var_1_11)
		elseif arg_21_0 == "stop" then
			var_1_19(var_1_14)
		end
	end

	var_1_0.name = "at91-kizbox2-ec"

	function var_1_0.load()
		var_1_7 = var_0_2.Monotonic()

		var_1_7:setTime(var_0_1.Monotonic(var_0_1.Elapsed(61, 0)), true)

		function var_1_7.expired(arg_23_0, arg_23_1)
			var_1_0.setFunction("disconnected")
		end

		var_1_21 = var_0_2.Monotonic()

		function var_1_21.expired(arg_24_0, arg_24_1)
			var_1_20 = 0

			var_1_0.setFunction(var_1_0.lastConnectionStatus)

			if var_1_9[var_1_0.lastConnectionStatus] then
				var_1_9[var_1_0.lastConnectionStatus](true)
			end
		end

		if var_1_0.buttons.mode then
			var_0_7.add(var_1_0.buttons.mode, var_1_1)
		end

		var_1_6 = var_0_2.Monotonic()

		var_1_6:setTime(var_0_1.Monotonic(var_0_1.Elapsed(var_1_3, 0)), true)

		var_1_16 = var_0_2.Monotonic()
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_7 then
			var_1_7:stop()

			var_1_7 = nil
		end

		if var_1_21 then
			var_1_21:stop()

			var_1_21 = nil
		end

		if var_1_16 then
			var_1_16:stop()

			var_1_16 = nil
		end

		var_0_7.remove(var_1_0.buttons.mode, var_1_1)

		if var_1_6 then
			var_1_6:stop()

			var_1_6 = nil
		end
	end

	return var_1_0
end

setmetatable(var_0_9, var_0_8)

return var_0_9
