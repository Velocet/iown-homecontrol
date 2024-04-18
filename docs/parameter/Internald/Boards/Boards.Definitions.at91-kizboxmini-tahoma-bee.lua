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

	var_1_0.buttons = {
		prog = var_0_0("/dev/input/event0", 2),
		reset = var_0_0("/dev/input/event0", 0)
	}
	var_1_0.leds = var_0_1({
		green = "pwm:green:user",
		red = "pwm:red:user"
	})

	local var_1_1 = {}
	local var_1_2 = {
		time = 0,
		status = "unknown"
	}
	local var_1_3 = 2
	local var_1_4 = 7

	function var_1_1.modified(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		if arg_2_2 ~= "status" then
			return
		end

		local var_2_0 = var_1_0.buttons.prog.time.microSeconds + var_1_0.buttons.prog.time.seconds * 1000000

		if arg_2_3 == 1 then
			if var_1_2.status ~= "pressed" then
				var_0_5:debug("Prog progButton pressed")

				var_1_2.status = "pressed"
				var_1_2.time = var_2_0
			end
		elseif arg_2_3 == 0 then
			var_0_5:debug("Mode progButton released")

			if var_1_2.status ~= "released" then
				if var_1_2.status == "pressed" and var_2_0 > var_1_2.time + var_1_4 * 1000000 - 1 then
					var_0_5:notice("Open local mode for pairing")
					var_1_0.setFunction("localAPIPairing")
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

	local var_1_5 = {}
	local var_1_6 = {
		time = 0,
		status = "unknown"
	}
	local var_1_7 = 12

	function var_1_5.modified(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		if arg_3_2 ~= "status" then
			return
		end

		local var_3_0 = var_1_0.buttons.reset.time.microSeconds + var_1_0.buttons.reset.time.seconds * 1000000

		if arg_3_3 == 1 then
			if var_1_6.status ~= "pressed" then
				var_0_5:debug("Reset Button pressed")

				var_1_6.status = "pressed"
				var_1_6.time = var_3_0
			end
		elseif arg_3_3 == 0 then
			var_0_5:debug("Reset Button released")

			if var_1_6.status ~= "released" then
				var_1_6.status = "released"
				var_1_6.time = var_3_0
			end
		else
			var_0_5:warning("Mode progButton unknown value " .. arg_3_3)

			var_1_6.status = "unknown"
			var_1_6.time = var_3_0
		end
	end

	local var_1_8 = var_0_3.Monotonic()

	var_1_8:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

	function var_1_8.expired(arg_4_0, arg_4_1)
		var_1_0.setFunction("disconnected")
	end

	local var_1_9 = {
		connected = {
			disconnected = true,
			localAPIPairing = true,
			connected = true
		},
		disconnected = {
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
			connected = true
		},
		endPairingSuccess = {
			disconnected = true,
			connectionPending = true,
			connected = true
		},
		connectionPending = {
			disconnected = true,
			localAPIPairing = true,
			connected = true
		},
		Unknown = {
			disconnected = true,
			connectionPending = true,
			localAPIPairing = true,
			connected = true
		}
	}
	local var_1_10 = {}
	local var_1_11 = var_0_3.Monotonic()

	function var_1_11.expired(arg_5_0)
		var_1_10.endPairing()
	end

	local function var_1_12()
		var_1_0.leds:setColor("green")
	end

	local function var_1_13()
		var_1_0.leds:setColor("red")
	end

	function var_1_10.connected(arg_8_0)
		if var_1_0.currentMode ~= "connected" or arg_8_0 then
			var_1_12()
		end

		var_1_8:start()
	end

	function var_1_10.connectionPending(arg_9_0)
		if var_1_0.currentMode ~= "connectionPending" or arg_9_0 then
			var_1_13()
		end

		var_1_8:start()
	end

	function var_1_10.disconnected(arg_10_0)
		if var_1_0.currentMode ~= "disconnected" or arg_10_0 then
			var_1_13()
		end

		var_1_8:stop()
	end

	local var_1_14

	function var_1_10.localAPIPairing()
		var_1_8:stop()
		var_1_0.leds:setCycleSmoothBlink("green")
		var_1_0.notify("localAPIRequired")

		function var_1_14.expired(arg_12_0)
			var_0_5:notice("Local API pairing timeout expired")
			var_1_0.setFunction("endPairing")
		end

		var_1_14:setTime(var_0_2.Monotonic(var_0_2.Elapsed(180, 0)), true)
		var_1_14:start()
	end

	function var_1_10.endPairing()
		var_1_0.notify("endPairingRequired")

		function var_1_14.expired(arg_14_0)
			var_1_0.leds:cleanup()
			var_1_0.setFunction(var_1_0.lastConnectionStatus)
		end

		var_1_14:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
		var_1_14:start()
	end

	function var_1_10.endPairingSuccess()
		var_1_14:stop()
		var_1_0.leds:setHardBlink("green", 100)
		var_1_11:setTime(var_0_2.Monotonic(var_0_2.Elapsed(2, 0)), true)
		var_1_11:start()
	end

	local var_1_15 = 0
	local var_1_16

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

		if arg_16_0 == "stm32StartUpgrade" or arg_16_0 == "stm32StartUpdate" then
			var_1_15 = var_1_15 + 1

			if var_1_15 == 1 then
				var_1_0.leds:setHardBlink("yellow")
			end

			var_1_16:setTime(var_0_2.Monotonic(var_0_2.Elapsed(120, 0)), true)
			var_1_16:start()
		elseif arg_16_0 == "stm32StopUpgrade" or arg_16_0 == "stm32StopUpdate" then
			var_1_15 = var_1_15 - 1

			if var_1_15 == 0 then
				var_1_16:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
				var_1_16:start()
			end

			return
		end

		if var_1_15 > 0 then
			return
		end

		if var_1_10[arg_16_0] then
			if var_1_0.checkIfAllowed(var_1_0.currentMode, arg_16_0, var_1_9) then
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

	var_1_0.name = "at91-kizboxmini-tahomabee"

	function var_1_0.load()
		var_1_14 = var_0_3.Monotonic()
		var_1_8 = var_0_3.Monotonic()

		var_1_8:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

		function var_1_8.expired(arg_19_0, arg_19_1)
			var_1_0.setFunction("disconnected")
		end

		if var_1_0.buttons.prog then
			var_0_4.add(var_1_0.buttons.prog, var_1_1)
		end

		if var_1_0.buttons.reset then
			var_0_4.add(var_1_0.buttons.reset, var_1_5)
		end

		var_1_16 = var_0_3.Monotonic()

		function var_1_16.expired(arg_20_0, arg_20_1)
			var_1_15 = 0

			var_1_0.setFunction(var_1_0.lastConnectionStatus)

			if var_1_10[var_1_0.lastConnectionStatus] then
				var_1_10[var_1_0.lastConnectionStatus](true)
			end
		end
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_8 then
			var_1_8:stop()

			var_1_8 = nil
		end

		if var_1_14 then
			var_1_14:stop()

			var_1_14 = nil
		end

		if var_1_16 then
			var_1_16:stop()

			var_1_16 = nil
		end

		var_0_4.remove(var_1_0.buttons.prog, var_1_1)
		var_0_4.remove(var_1_0.buttons.reset, var_1_5)
	end

	return var_1_0
end

setmetatable(var_0_8, var_0_7)

return var_0_8
