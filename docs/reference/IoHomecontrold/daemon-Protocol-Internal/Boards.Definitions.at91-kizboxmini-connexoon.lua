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
		prog = var_0_0("/dev/input/event0", 2),
		reset = var_0_0("/dev/input/event0", 0)
	}
	var_1_0.leds = {
		connection = {
			green = var_0_1("pwm:green:user"),
			red = var_0_1("pwm:red:user")
		}
	}

	local var_1_1 = "255\n1\n"
	local var_1_2
	local var_1_3 = 0

	local function var_1_4()
		var_1_2:stop()
		var_1_0.leds.connection.green:cleanup()
		var_1_0.leds.connection.green:setBrightness(1)
		var_1_0.leds.connection.red:cleanup()
		var_1_0.leds.connection.red:setBrightness(1)
	end

	local function var_1_5()
		var_1_2:stop()
		var_1_0.leds.connection.green:cleanup()
		var_1_0.leds.connection.green:setBrightness(255)
		var_1_0.leds.connection.red:cleanup()
		var_1_0.leds.connection.red:setBrightness(255)
	end

	local function var_1_6()
		function var_1_2.expired(arg_5_0)
			if var_1_3 % 2 > 0 then
				var_1_0.leds.connection.red:setBrightness(255)
				var_1_0.leds.connection.green:setBrightness(255)
			else
				var_1_0.leds.connection.red:setBrightness(1)
				var_1_0.leds.connection.green:setBrightness(1)
			end

			var_1_3 = var_1_3 + 1

			var_1_2:start()
		end

		var_1_2:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 333333333.3333333)), true)
		var_1_0.leds.connection.red:cleanup()
		var_1_0.leds.connection.red:setBrightness(255)
		var_1_0.leds.connection.green:cleanup()
		var_1_0.leds.connection.green:setBrightness(255)
		var_1_2:start()
	end

	local function var_1_7()
		var_1_2:stop()
		var_1_0.leds.connection.red:cleanup()
		var_1_0.leds.connection.red:setBrightness(1)
		var_1_0.leds.connection.green:cleanup()
		var_1_0.leds.connection.green:setTrigger("cycle")
		var_1_0.leds.connection.green:setPlot(var_1_1)
		var_1_0.leds.connection.green:setInterval("111")
		var_1_0.leds.connection.green:setControl("start")
	end

	local function var_1_8()
		var_1_2:stop()
		var_1_0.leds.connection.green:cleanup()
		var_1_0.leds.connection.green:setBrightness(1)
		var_1_0.leds.connection.red:cleanup()
		var_1_0.leds.connection.red:setTrigger("cycle")
		var_1_0.leds.connection.red:setPlot(var_1_1)
		var_1_0.leds.connection.red:setInterval("111")
		var_1_0.leds.connection.red:setControl("start")
	end

	local var_1_9 = {}
	local var_1_10 = {
		time = 0,
		status = "unknown"
	}
	local var_1_11
	local var_1_12
	local var_1_13 = 2
	local var_1_14 = 3
	local var_1_15 = 8

	function var_1_9.modified(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
		if arg_8_2 ~= "status" then
			return
		end

		local var_8_0 = var_1_0.buttons.prog.time.microSeconds + var_1_0.buttons.prog.time.seconds * 1000000

		if arg_8_3 == 1 then
			if var_1_10.status ~= "pressed" then
				var_0_5:debug("Prog progButton pressed")

				var_1_10.status = "pressed"
				var_1_10.time = var_8_0

				var_1_11:stop()
				var_1_11:setTime(var_0_2.Monotonic(var_0_2.Elapsed(var_1_13, 0)), true)
				var_1_11:start()
				var_1_12:stop()
				var_1_12:setTime(var_0_2.Monotonic(var_0_2.Elapsed(var_1_15, 0)), true)
				var_1_12:start()
				var_1_0.setFunction("actionStarted")
			end
		elseif arg_8_3 == 0 then
			var_0_5:debug("Mode progButton released")

			if var_1_10.status ~= "released" then
				if var_1_10.status == "pressed" then
					if var_8_0 > var_1_10.time + var_1_15 * 1000000 - 1 then
						var_0_5:notice("Start wink products")
						var_1_0.notify("winkIO")
						var_1_0.setFunction("actionPending")
					elseif var_8_0 > var_1_10.time + var_1_13 * 1000000 - 1 then
						var_0_5:notice("Start sensor discover")
						var_1_0.notify("discoverSensorSimpleIO")
						var_1_0.setFunction("actionPending")
						var_1_12:stop()
					else
						var_0_5:notice("Start actuator discover")
						var_1_11:stop()
						var_1_12:stop()
						var_1_0.notify("discoverActuatorSimpleWithWinkIO")
						var_1_0.setFunction("actionPending")
					end
				end

				var_1_10.status = "released"
				var_1_10.time = var_8_0
			end
		else
			var_0_5:warning("Mode progButton unknown value " .. arg_8_3)

			var_1_10.status = "unknown"
			var_1_10.time = var_8_0
		end
	end

	local var_1_16 = {}
	local var_1_17 = {
		time = 0,
		status = "unknown"
	}
	local var_1_18 = 12

	function var_1_16.modified(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
		if arg_9_2 ~= "status" then
			return
		end

		local var_9_0 = var_1_0.buttons.reset.time.microSeconds + var_1_0.buttons.reset.time.seconds * 1000000

		if arg_9_3 == 1 then
			if var_1_17.status ~= "pressed" then
				var_0_5:debug("Reset Button pressed")

				var_1_17.status = "pressed"
				var_1_17.time = var_9_0

				var_1_11:stop()
				var_1_11:setTime(var_0_2.Monotonic(var_0_2.Elapsed(var_1_13, 0)), true)
				var_1_11:start()
				var_1_12:stop()
				var_1_12:setTime(var_0_2.Monotonic(var_0_2.Elapsed(var_1_18, 0)), true)
				var_1_12:start()
				var_1_0.setFunction("actionStarted")
			end
		elseif arg_9_3 == 0 then
			var_0_5:debug("Reset Button released")

			if var_1_17.status ~= "released" then
				if var_1_17.status == "pressed" then
					if var_9_0 > var_1_17.time + var_1_18 * 1000000 - 1 then
						var_0_5:notice("Delete All IO devices")
					elseif var_9_0 > var_1_17.time + var_1_13 * 1000000 - 1 then
						var_1_0.setFunction("actionPending")
						var_1_0.setFunction("actionNoEffects")
						var_1_12:stop()
					else
						var_1_11:stop()
						var_1_12:stop()
						var_1_0.setFunction("actionPending")
						var_1_0.setFunction("actionNoEffects")
					end
				end

				var_1_17.status = "released"
				var_1_17.time = var_9_0
			end
		else
			var_0_5:warning("Mode progButton unknown value " .. arg_9_3)

			var_1_17.status = "unknown"
			var_1_17.time = var_9_0
		end
	end

	local var_1_19 = var_0_3.Monotonic()

	var_1_19:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

	function var_1_19.expired(arg_10_0, arg_10_1)
		var_1_0.setFunction("disconnected")
	end

	local var_1_20 = {
		connected = {
			disconnected = true,
			actionStarted = true,
			connected = true
		},
		disconnected = {
			actionStarted = true,
			connectionPending = true,
			localMode = true,
			connected = true
		},
		connectionPending = {
			disconnected = true,
			localMode = true,
			connected = true
		},
		localMode = {
			disconnected = true,
			connectionPending = true,
			connected = true
		},
		actionStarted = {
			actionPending = true
		},
		actionPending = {
			actionKO = true,
			actionNoEffects = true,
			actionOK = true
		},
		actionOK = {
			actionFinished = true
		},
		actionKO = {
			actionStarted = true,
			actionPending = true,
			actionFinished = true
		},
		actionFinished = {
			disconnected = true,
			connectionPending = true,
			connected = true
		},
		actionNoEffects = {
			actionFinished = true
		},
		Unknown = {
			disconnected = true,
			connectionPending = true,
			localMode = true,
			connected = true,
			actionStarted = true
		}
	}
	local var_1_21 = {
		connected = function(arg_11_0)
			if var_1_0.currentMode ~= "connected" or arg_11_0 then
				var_1_0.leds.connection.green:setOn()
				var_1_0.leds.connection.red:setOn()
				var_1_0.leds.connection.red:setBrightness(1)
			end

			var_1_19:start()
		end,
		connectionPending = function()
			var_1_0.leds.connection.red:setOn()
			var_1_0.leds.connection.red:setBrightness(1)
			var_1_0.leds.connection.green:setCycleSmoothBlink()
			var_1_19:start()
		end,
		disconnected = function(arg_13_0)
			if var_1_0.currentMode ~= "disconnected" or arg_13_0 then
				var_1_0.leds.connection.green:setOn()
				var_1_0.leds.connection.green:setBrightness(1)
				var_1_0.leds.connection.red:setOn()
			end

			var_1_19:stop()
		end,
		localMode = function()
			var_1_0.leds.connection.green:setOff()
			var_1_0.leds.connection.red:setOn()
			var_1_19:stop()
		end
	}
	local var_1_22

	function var_1_21.actionPending()
		var_1_6()
		var_1_19:stop()
		var_0_4.remove(var_1_0.buttons.prog, var_1_9)
	end

	local var_1_23

	function var_1_21.actionOK()
		var_1_7()
		var_1_19:stop()
		var_1_23:setTime(var_0_2.Monotonic(var_0_2.Elapsed(var_1_14, 0)), true)
		var_1_23:start()
	end

	function var_1_21.actionKO()
		var_1_8()
		var_1_19:stop()
		var_1_23:setTime(var_0_2.Monotonic(var_0_2.Elapsed(var_1_14, 0)), true)
		var_1_23:start()
	end

	function var_1_21.actionStarted()
		var_1_22 = var_1_0.currentMode

		var_1_4()
	end

	function var_1_21.actionFinished()
		var_1_19:stop()

		if var_1_0.buttons.prog then
			var_0_4.add(var_1_0.buttons.prog, var_1_9)
		end
	end

	function var_1_21.actionNoEffects()
		var_1_23:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
		var_1_23:start()
	end

	local var_1_24 = 0
	local var_1_25

	function var_1_0.setFunction(arg_21_0)
		var_0_5:info("Set function requested: " .. arg_21_0)

		if arg_21_0 == "ethDisconnected" then
			arg_21_0 = "disconnected"
		elseif arg_21_0 == "ethConnected" then
			arg_21_0 = "connectionPending"
		end

		if var_1_0.allowedConnectionStatusChanges[arg_21_0] then
			var_1_0.lastConnectionStatus = arg_21_0
		end

		if arg_21_0 == "stm32StartUpgrade" or arg_21_0 == "stm32StartUpdate" then
			var_1_24 = var_1_24 + 1

			if var_1_24 == 1 then
				var_1_0.leds.connection.green:setOff()
				var_1_0.leds.connection.red:setOff()
				var_1_0.leds.connection.red:setTrigger("timer")
				var_1_0.leds.connection.green:setTrigger("timer")
			end

			var_1_25:setTime(var_0_2.Monotonic(var_0_2.Elapsed(120, 0)), true)
			var_1_25:start()
		elseif arg_21_0 == "stm32StopUpgrade" or arg_21_0 == "stm32StopUpdate" then
			var_1_24 = var_1_24 - 1

			if var_1_24 == 0 then
				var_1_25:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
				var_1_25:start()
			end

			return
		end

		if var_1_24 > 0 then
			return
		end

		if var_1_21[arg_21_0] then
			if var_1_0.checkIfAllowed(var_1_0.currentMode, arg_21_0, var_1_20) then
				var_1_21[arg_21_0]()

				var_1_0.currentMode = arg_21_0
			else
				var_0_5:notice("No transition available to " .. arg_21_0)
			end
		else
			var_0_5:notice("Try to set unknown mode " .. tostring(arg_21_0))
		end
	end

	function var_1_0.setEvent(arg_22_0)
		return
	end

	var_1_0.name = "at91-kizboxmini-connexoon"

	function var_1_0.load()
		var_1_19 = var_0_3.Monotonic()

		var_1_19:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

		function var_1_19.expired(arg_24_0, arg_24_1)
			var_1_0.setFunction("disconnected")
		end

		var_1_11 = var_0_3.Monotonic()

		function var_1_11.expired(arg_25_0, arg_25_1)
			var_0_5:notice("Set tmp orange")
			var_1_5()
		end

		var_1_12 = var_0_3.Monotonic()

		function var_1_12.expired(arg_26_0, arg_26_1)
			var_0_5:notice("Set tmp off")
			var_1_4()
		end

		var_1_23 = var_0_3.Monotonic()

		function var_1_23.expired(arg_27_0, arg_27_1)
			var_0_5:notice("End Timer")
			var_1_2:stop()
			var_1_0.setFunction("actionFinished")

			if var_1_22 and var_1_22 == "connected" then
				var_1_0.setFunction(var_1_22)

				var_1_22 = nil
			else
				var_1_0.setFunction("disconnected")

				var_1_22 = nil
			end
		end

		var_1_2 = var_0_3.Monotonic()

		if var_1_0.buttons.prog then
			var_0_4.add(var_1_0.buttons.prog, var_1_9)
		end

		if var_1_0.buttons.reset then
			var_0_4.add(var_1_0.buttons.reset, var_1_16)
		end

		var_1_25 = var_0_3.Monotonic()

		function var_1_25.expired(arg_28_0, arg_28_1)
			var_1_24 = 0

			var_1_0.setFunction(var_1_0.lastConnectionStatus)

			if var_1_21[var_1_0.lastConnectionStatus] then
				var_1_21[var_1_0.lastConnectionStatus](true)
			end
		end
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_19 then
			var_1_19:stop()

			var_1_19 = nil
		end

		if var_1_11 then
			var_1_11:stop()

			var_1_11 = nil
		end

		if var_1_12 then
			var_1_12:stop()

			var_1_12 = nil
		end

		if var_1_23 then
			var_1_23:stop()

			var_1_23 = nil
		end

		if var_1_2 then
			var_1_2:stop()

			var_1_2 = nil
		end

		if var_1_25 then
			var_1_25:stop()

			var_1_25 = nil
		end

		var_0_4.remove(var_1_0.buttons.prog, var_1_9)
		var_0_4.remove(var_1_0.buttons.reset, var_1_16)
	end

	return var_1_0
end

setmetatable(var_0_8, var_0_7)

return var_0_8
