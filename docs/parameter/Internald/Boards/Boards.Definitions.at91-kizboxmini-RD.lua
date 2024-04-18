local var_0_0 = require("Overkiz.Kernel.Button")
local var_0_1 = require("Overkiz.Kernel.Led")
local var_0_2 = require("Overkiz.Time")
local var_0_3 = require("Overkiz.Timer")
local var_0_4 = require("Overkiz.Tracker")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.common")
local var_0_7 = {}
local var_0_8 = {}

function var_0_7.__call(arg_1_0, arg_1_1)
	local var_1_0 = var_0_6()

	var_1_0.buttons = {
		mode = var_0_0("/dev/input/event0", 2),
		reset = var_0_0("/dev/input/event0", 0)
	}
	var_1_0.leds = {
		connection = {
			green = var_0_1("pwm:green:user"),
			red = var_0_1("pwm:red:user"),
			blue = var_0_1("pwm:blue:user")
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
				var_0_5:debug("Prog progButton pressed")

				var_1_2.status = "pressed"
				var_1_2.time = var_2_0

				function var_1_6.expired(arg_3_0)
					var_0_5:notice("Open local mode for pairing")
					var_1_0.setFunction("localAPIPairing")
				end

				var_1_6:start()
			end
		elseif arg_2_3 == 0 then
			var_0_5:debug("Mode progButton released")

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
			var_0_5:warning("Mode progButton unknown value " .. arg_2_3)

			var_1_2.status = "unknown"
			var_1_2.time = var_2_0
		end
	end

	local var_1_7 = var_0_3.Monotonic()

	var_1_7:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

	function var_1_7.expired(arg_4_0, arg_4_1)
		var_1_0.setFunction("disconnected")
	end

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
			localAPIPairing = true,
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
	local var_1_9 = "disconnected"
	local var_1_10 = {}
	local var_1_11 = var_0_3.Monotonic()

	function var_1_11.expired(arg_5_0)
		var_1_10.endPairing()
	end

	function var_1_10.connected()
		if var_1_0.currentMode ~= "connected" then
			var_1_0.leds.connection.green:cleanup()
			var_1_0.leds.connection.green:setBrightness(100)
			var_1_0.leds.connection.red:setOff()
			var_1_0.leds.connection.blue:setOff()
		end

		var_1_7:start()
	end

	function var_1_10.connectionPending()
		var_1_0.leds.connection.blue:setOff()
		var_1_0.leds.connection.green:setOff()
		var_1_0.leds.connection.red:cleanup()
		var_1_0.leds.connection.red:setBrightness(200)
		var_1_7:start()
	end

	function var_1_10.disconnected()
		if var_1_0.currentMode ~= "disconnected" then
			var_1_0.leds.connection.blue:setOff()
			var_1_0.leds.connection.green:setOff()
			var_1_0.leds.connection.red:cleanup()
			var_1_0.leds.connection.red:setBrightness(200)
		end

		var_1_7:stop()
	end

	function var_1_10.localMode()
		var_1_0.leds.connection.blue:setOff()
		var_1_0.leds.connection.green:setOff()
		var_1_0.leds.connection.red:setOn()
		var_1_7:stop()
	end

	function var_1_10.localAPI()
		var_1_0.leds.connection.green:setOff()
		var_1_0.leds.connection.red:setOff()
		var_1_0.leds.connection.blue:setOn()
		var_1_7:stop()
	end

	local var_1_12

	function var_1_10.localAPIPairing()
		var_1_0.leds.connection.green:setOff()
		var_1_0.leds.connection.red:setOff()
		var_1_0.leds.connection.blue:setCycleSmoothBlink()
		var_1_7:stop()
		var_1_0.notify("localAPIRequired")
		var_1_0.notify("wifiAPMode")

		function var_1_12.expired(arg_12_0)
			var_0_5:notice("Pairing timeout expired")
			var_1_0.setFunction("endPairing")
		end

		var_1_12:setTime(var_0_2.Monotonic(var_0_2.Elapsed(60, 0)), true)
		var_1_12:start()
	end

	function var_1_10.endPairing()
		var_1_0.notify("endPairingRequired")

		function var_1_12.expired(arg_14_0)
			var_1_0.leds.connection.green:cleanup()
			var_1_0.leds.connection.red:cleanup()
			var_1_0.leds.connection.blue:cleanup()
			var_1_0.setFunction(var_1_9)
		end

		var_1_12:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
		var_1_12:start()
	end

	function var_1_10.endPairingSuccess()
		var_1_0.leds.connection.blue:setTrigger("timer")
		var_1_0.leds.connection.blue:setdelayOn("100")
		var_1_0.leds.connection.blue:setdelayOff("100")
		var_1_11:setTime(var_0_2.Monotonic(var_0_2.Elapsed(2, 0)), true)
		var_1_11:start()
	end

	function var_1_0.setFunction(arg_16_0)
		var_0_5:info("Set function requested: " .. arg_16_0)

		if arg_16_0 == "ethDisconnected" then
			arg_16_0 = "disconnected"
		elseif arg_16_0 == "ethConnected" then
			arg_16_0 = "connectionPending"
		end

		if var_1_0.allowedConnectionStatusChanges[arg_16_0] then
			var_1_0.lastConnectionStatus = arg_16_0
		end

		if arg_16_0 == "connected" or arg_16_0 == "disconnected" then
			var_1_9 = arg_16_0
		end

		if arg_16_0 == "disconnected" or arg_16_0 == "connected" or arg_16_0 == "connectionPending" or arg_16_0 == "localMode" then
			var_1_9 = arg_16_0
		end

		if var_1_10[arg_16_0] then
			if var_1_0.checkIfAllowed(var_1_0.currentMode, arg_16_0, var_1_8) then
				var_1_10[arg_16_0]()

				var_1_0.currentMode = arg_16_0
			else
				var_0_5:notice("No transition available to " .. arg_16_0)
			end
		else
			var_0_5:notice("Try to set unknown mode " .. tostring(arg_16_0))
		end
	end

	function var_1_0.setEvent(arg_17_0)
		return
	end

	var_1_0.name = "at91-kizboxmini-RD"

	function var_1_0.load()
		var_1_7 = var_0_3.Monotonic()

		var_1_7:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

		function var_1_7.expired(arg_19_0, arg_19_1)
			var_1_0.setFunction("disconnected")
		end

		if var_1_0.buttons.mode then
			var_0_4.add(var_1_0.buttons.mode, var_1_1)
		end

		var_1_6 = var_0_3.Monotonic()

		var_1_6:setTime(var_0_2.Monotonic(var_0_2.Elapsed(var_1_3, 0)), true)

		var_1_12 = var_0_3.Monotonic()
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_7 then
			var_1_7:stop()

			var_1_7 = nil
		end

		if var_1_12 then
			var_1_12:stop()

			var_1_12 = nil
		end

		var_0_4.remove(var_1_0.buttons.mode, var_1_1)

		if var_1_6 then
			var_1_6:stop()

			var_1_6 = nil
		end
	end

	return var_1_0
end

setmetatable(var_0_8, var_0_7)

return var_0_8
