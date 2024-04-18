local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.Time")
local var_0_2 = require("Overkiz.Timer")
local var_0_3 = require("Overkiz.Tracker")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.common")
local var_0_6 = require("Overkiz.Kernel.Gpio")
local var_0_7 = require("Overkiz.Kernel.Button")
local var_0_8 = require("Overkiz.Kernel.Led")
local var_0_9 = {}
local var_0_10 = {}

function var_0_9.__call(arg_1_0, arg_1_1)
	local var_1_0 = var_0_5()

	var_1_0.buttons = {
		prog = var_0_7("/dev/input/event0", 2),
		touch = var_0_7("/dev/input/event0", 1),
		reset = var_0_7("/dev/input/event0", 0)
	}
	var_1_0.leds = {
		connection = {
			green = var_0_8("pwm:green:user"),
			red = var_0_8("pwm:red:user"),
			blue = var_0_8("pwm:blue:user")
		}
	}
	var_1_0.gpios = {
		powerSupply = var_0_6("pioD31")
	}

	local var_1_1 = 2
	local var_1_2 = 3
	local var_1_3 = 8
	local var_1_4 = {
		modified = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
			if arg_2_3 == 1 then
				var_1_0.notify("touchButton")
			end
		end
	}
	local var_1_5 = {}
	local var_1_6 = {
		time = 0,
		status = "unknown"
	}
	local var_1_7

	function var_1_5.modified(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		if arg_3_2 ~= "status" then
			return
		end

		local var_3_0 = var_1_0.buttons.reset.time.seconds

		if arg_3_3 == 1 then
			if var_1_6.status ~= "pressed" then
				var_0_4:debug("Reset Button pressed")

				var_1_6.status = "pressed"
				var_1_6.time = var_3_0

				var_1_7:stop()
				var_1_7:setTime(var_0_1.Monotonic(var_0_1.Elapsed(var_1_3, 0)), true)
				var_1_7:start()
				var_1_0.setFunction("resetStarted")
			end
		elseif arg_3_3 == 0 then
			var_0_4:debug("Reset Button released")

			if var_1_6.status ~= "released" then
				if var_1_6.status == "pressed" then
					if var_3_0 < var_1_6.time + var_1_3 then
						var_0_4:notice("Reset cancelled")
						var_1_7:stop()
					else
						var_0_4:notice("Start reset HK")
						var_1_0.notify("resetHK")
					end

					var_1_0.setFunction("resetDone")
				end

				var_1_6.status = "released"
				var_1_6.time = var_3_0
			end
		else
			var_0_4:warning("Reset Button unknown value " .. arg_3_3)

			var_1_6.status = "unknown"
			var_1_6.time = var_3_0
		end
	end

	local var_1_8 = {}
	local var_1_9 = {
		time = 0,
		status = "unknown"
	}
	local var_1_10
	local var_1_11

	function var_1_8.modified(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
		if arg_4_2 ~= "status" then
			return
		end

		local var_4_0 = var_1_0.buttons.prog.time.microSeconds + var_1_0.buttons.prog.time.seconds * 1000000

		if arg_4_3 == 1 then
			if var_1_9.status ~= "pressed" then
				var_0_4:debug("Prog progButton pressed")

				var_1_9.status = "pressed"
				var_1_9.time = var_4_0

				var_1_10:stop()
				var_1_10:setTime(var_0_1.Monotonic(var_0_1.Elapsed(var_1_1, 0)), true)
				var_1_10:start()
				var_1_11:stop()
				var_1_11:setTime(var_0_1.Monotonic(var_0_1.Elapsed(var_1_3, 0)), true)
				var_1_11:start()
				var_1_0.setFunction("actionStarted")
			end
		elseif arg_4_3 == 0 then
			var_0_4:debug("Mode progButton released")

			if var_1_9.status ~= "released" then
				if var_1_9.status == "pressed" then
					if var_4_0 > var_1_9.time + var_1_3 * 1000000 - 1 then
						var_0_4:notice("Start wink products")
						var_1_0.notify("winkIO")
						var_1_0.setFunction("actionPending")
					elseif var_4_0 > var_1_9.time + var_1_1 * 1000000 - 1 then
						var_0_4:notice("Start sensor discover")
						var_1_0.notify("discoverSensorSimpleIO")
						var_1_0.setFunction("actionPending")
						var_1_11:stop()
					else
						var_0_4:notice("Start actuator discover")
						var_1_10:stop()
						var_1_11:stop()
						var_1_0.notify("discoverActuatorSimpleWithWinkIO")
						var_1_0.setFunction("actionPending")
					end
				end

				var_1_9.status = "released"
				var_1_9.time = var_4_0
			end
		else
			var_0_4:warning("Mode progButton unknown value " .. arg_4_3)

			var_1_9.status = "unknown"
			var_1_9.time = var_4_0
		end
	end

	local var_1_12
	local var_1_13 = {
		connected = {
			disconnected = true,
			actionStarted = true,
			resetStarted = true,
			connected = true
		},
		disconnected = {
			actionStarted = true,
			connectionPending = true,
			localMode = true,
			connected = true,
			resetStarted = true
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
			actionNoEffects = true,
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
		resetStarted = {
			resetDone = true,
			resetPending = true
		},
		resetPending = {
			resetDone = true
		},
		resetDone = {
			disconnected = true,
			connectionPending = true,
			connected = true
		},
		Unknown = {
			disconnected = true,
			connectionPending = true,
			localMode = true,
			connected = true,
			actionStarted = true
		}
	}
	local var_1_14 = false
	local var_1_15 = false
	local var_1_16 = false
	local var_1_17 = {}

	local function var_1_18()
		var_1_0.leds.connection.green:setOn()
		var_1_0.leds.connection.blue:setOn()
		var_1_0.leds.connection.red:setOn()
	end

	local function var_1_19()
		var_1_0.leds.connection.green:setOn()
		var_1_0.leds.connection.blue:setOff()
		var_1_0.leds.connection.red:setOff()
	end

	local function var_1_20()
		var_1_0.leds.connection.red:setOff()
		var_1_0.leds.connection.blue:setOff()
		var_1_0.leds.connection.green:setTrigger("timer")
		var_1_0.leds.connection.green:setdelayOn("500")
		var_1_0.leds.connection.green:setdelayOff("500")
	end

	local function var_1_21()
		var_1_0.leds.connection.green:setOff()
		var_1_0.leds.connection.blue:setOff()
		var_1_0.leds.connection.red:setTrigger("timer")
		var_1_0.leds.connection.red:setdelayOn("300")
		var_1_0.leds.connection.red:setdelayOff("300")
	end

	local var_1_22 = 1

	local function var_1_23()
		var_1_0.leds.connection.green:setOff()
		var_1_0.leds.connection.blue:setOff()
		var_1_0.leds.connection.red:setOff()
	end

	local function var_1_24()
		var_1_23()
		var_1_0.leds.connection.green:setBrightness(var_1_22)
		var_1_0.leds.connection.blue:setBrightness(var_1_22)
		var_1_0.leds.connection.red:setBrightness(var_1_22)
	end

	local function var_1_25()
		var_1_0.leds.connection.green:setOff()
		var_1_0.leds.connection.blue:setOff()
		var_1_0.leds.connection.red:setOn()
	end

	local var_1_26 = "255\n1\n"
	local var_1_27
	local var_1_28 = 0

	local function var_1_29()
		var_1_27:stop()
		var_1_0.leds.connection.green:setOff()
		var_1_0.leds.connection.blue:setOff()
		var_1_0.leds.connection.red:setOff()
	end

	local function var_1_30()
		var_1_27:stop()
		var_1_0.leds.connection.green:cleanup()
		var_1_0.leds.connection.green:setBrightness(100)
		var_1_0.leds.connection.blue:setOff()
		var_1_0.leds.connection.red:setOn()
	end

	local function var_1_31()
		function var_1_27.expired(arg_15_0)
			if var_1_28 % 2 > 0 then
				var_1_0.leds.connection.red:setBrightness(255)
				var_1_0.leds.connection.green:setBrightness(100)
			else
				var_1_0.leds.connection.red:setBrightness(1)
				var_1_0.leds.connection.green:setBrightness(1)
			end

			var_1_28 = var_1_28 + 1

			var_1_27:start()
		end

		var_1_27:setTime(var_0_1.Monotonic(var_0_1.Elapsed(0, 333333333.3333333)), true)
		var_1_0.leds.connection.red:cleanup()
		var_1_0.leds.connection.red:setBrightness(255)
		var_1_0.leds.connection.green:cleanup()
		var_1_0.leds.connection.green:setBrightness(100)
		var_1_0.leds.connection.blue:setOff()
		var_1_27:start()
	end

	local function var_1_32()
		var_1_27:stop()
		var_1_0.leds.connection.red:cleanup()
		var_1_0.leds.connection.red:setBrightness(1)
		var_1_0.leds.connection.green:cleanup()
		var_1_0.leds.connection.green:setTrigger("cycle")
		var_1_0.leds.connection.green:setPlot(var_1_26)
		var_1_0.leds.connection.green:setInterval("111")
		var_1_0.leds.connection.green:setControl("start")
	end

	local function var_1_33()
		var_1_27:stop()
		var_1_0.leds.connection.green:cleanup()
		var_1_0.leds.connection.green:setBrightness(1)
		var_1_0.leds.connection.red:cleanup()
		var_1_0.leds.connection.red:setTrigger("cycle")
		var_1_0.leds.connection.red:setPlot(var_1_26)
		var_1_0.leds.connection.red:setInterval("111")
		var_1_0.leds.connection.red:setControl("start")
	end

	local var_1_34 = var_1_18

	function var_1_17.connected(arg_18_0)
		if var_1_14 and not var_1_16 then
			var_1_19()
		elseif var_1_15 and not var_1_16 then
			var_1_20()
		elseif var_1_0.currentMode ~= "connected" or arg_18_0 then
			var_1_34()
		end

		var_1_12:start()
	end

	function var_1_17.connectionPending(arg_19_0)
		if var_1_0.currentMode ~= "connectionPending" or arg_19_0 then
			var_1_25()
		end

		var_1_12:stop()
	end

	function var_1_17.disconnected(arg_20_0)
		if var_1_0.currentMode ~= "disconnected" or arg_20_0 then
			var_1_25()
		end

		var_1_12:stop()
	end

	function var_1_17.localMode(arg_21_0)
		if var_1_0.currentMode ~= "localMode" or arg_21_0 then
			var_1_0.leds.connection.green:setOff()
			var_1_0.leds.connection.blue:setOff()
			var_1_0.leds.connection.red:setOn()
		end

		var_1_12:stop()
	end

	local var_1_35

	function var_1_17.actionPending()
		var_1_31()
		var_1_12:stop()
		var_0_3.remove(var_1_0.buttons.prog, var_1_8)
	end

	local var_1_36

	function var_1_17.actionOK()
		var_1_32()
		var_1_12:stop()
		var_1_36:setTime(var_0_1.Monotonic(var_0_1.Elapsed(var_1_2, 0)), true)
		var_1_36:start()
	end

	function var_1_17.actionKO()
		var_1_33()
		var_1_12:stop()
		var_1_36:setTime(var_0_1.Monotonic(var_0_1.Elapsed(var_1_2, 0)), true)
		var_1_36:start()
	end

	function var_1_17.actionStarted()
		var_1_35 = var_1_0.currentMode

		var_1_29()
	end

	function var_1_17.actionFinished()
		var_1_12:stop()

		if var_1_0.buttons.prog then
			var_0_3.add(var_1_0.buttons.prog, var_1_8)
		end
	end

	function var_1_17.actionNoEffects()
		var_1_36:setTime(var_0_1.Monotonic(var_0_1.Elapsed(0, 0)), true)
		var_1_36:start()
	end

	function var_1_17.resetStarted()
		var_1_35 = var_1_0.currentMode

		var_1_12:stop()
		var_1_25()
	end

	function var_1_17.resetPending()
		var_1_33()
	end

	function var_1_17.resetDone()
		var_0_2.Timeout(0, function()
			if var_1_35 and var_1_35 == "connected" then
				var_1_0.setFunction(var_1_35)

				var_1_35 = nil
			else
				var_1_0.setFunction("disconnected")

				var_1_35 = nil
			end
		end)
	end

	local function var_1_37(arg_32_0)
		local var_32_0 = var_1_0.currentMode
		local var_32_1 = var_0_2.Monotonic()

		var_32_1:setTime(var_0_1.Monotonic(var_0_1.Elapsed(0, 500000000)), true)

		local var_32_2 = 1

		function var_32_1.expired(arg_33_0)
			if var_32_2 % 2 == 0 then
				var_1_18()
			else
				var_1_24()
			end

			if var_32_2 < tonumber(arg_32_0 * 2) then
				var_32_2 = var_32_2 + 1

				var_32_1:start()
			elseif var_32_0 and var_32_0 == "connected" then
				var_1_0.setFunction(var_32_0)

				var_32_0 = nil
			else
				var_1_0.setFunction("disconnected")

				var_32_0 = nil
			end
		end

		var_32_1:start()
	end

	local var_1_38 = 1
	local var_1_39 = var_0_2.Monotonic()

	local function var_1_40(arg_34_0)
		var_1_38 = 1

		function var_1_39.expired(arg_35_0)
			if var_1_38 < 2 then
				var_1_23()
				var_1_39:setTime(var_0_1.Monotonic(var_0_1.Elapsed(0, 500000000)), true)
				var_1_39:start()
			elseif var_1_38 < 7 then
				if var_1_38 % 2 == 0 then
					arg_34_0()
				else
					var_1_23()
				end

				var_1_39:setTime(var_0_1.Monotonic(var_0_1.Elapsed(0, 100000000)), true)
				var_1_39:start()
			elseif var_1_38 == 7 then
				var_1_23()
				var_1_39:setTime(var_0_1.Monotonic(var_0_1.Elapsed(0, 500000000)), true)
				var_1_39:start()
			elseif var_1_17[var_1_0.currentMode] then
				var_1_17[var_1_0.currentMode](true)
			end

			var_1_38 = var_1_38 + 1
		end

		var_1_39:expired()
	end

	local var_1_41 = 0
	local var_1_42

	function var_1_0.setFunction(arg_36_0)
		var_0_4:info("Set function requested: " .. arg_36_0)

		if arg_36_0 == "ethDisconnected" then
			arg_36_0 = "disconnected"
		elseif arg_36_0 == "ethConnected" then
			arg_36_0 = "connectionPending"
		end

		if var_1_0.allowedConnectionStatusChanges[arg_36_0] then
			var_1_0.lastConnectionStatus = arg_36_0
		end

		if arg_36_0 == "stm32StartUpgrade" or arg_36_0 == "stm32StartUpdate" then
			var_1_41 = var_1_41 + 1

			if var_1_41 == 1 then
				var_1_0.leds.connection.green:setOff()
				var_1_0.leds.connection.blue:setOff()
				var_1_0.leds.connection.red:setOff()
				var_1_0.leds.connection.red:setTrigger("timer")
				var_1_0.leds.connection.green:setTrigger("timer")
			end

			var_1_42:setTime(var_0_1.Monotonic(var_0_1.Elapsed(120, 0)), true)
			var_1_42:start()
		elseif arg_36_0 == "stm32StopUpgrade" or arg_36_0 == "stm32StopUpdate" then
			var_1_41 = var_1_41 - 1

			if var_1_41 == 0 then
				var_1_42:setTime(var_0_1.Monotonic(var_0_1.Elapsed(0, 0)), true)
				var_1_42:start()
			end

			return
		end

		if var_1_41 > 0 then
			return
		end

		if var_1_17[arg_36_0] then
			if var_1_0.checkIfAllowed(var_1_0.currentMode, arg_36_0, var_1_13) then
				var_1_17[arg_36_0]()

				var_1_0.currentMode = arg_36_0
			else
				var_0_4:notice("No transition available to " .. arg_36_0)
			end
		else
			var_0_4:notice("Try to set unknown mode " .. tostring(arg_36_0))
		end
	end

	function var_1_0.setEvent(arg_37_0, arg_37_1)
		var_0_4:info("Set event " .. tostring(arg_37_0) .. ". SOS(" .. tostring(var_1_16) .. ") arming(" .. tostring(var_1_15) .. ") armed(" .. tostring(var_1_14) .. ")")

		if arg_37_0 == "setDefaultOn" then
			var_1_34 = var_1_18

			if var_1_17[var_1_0.currentMode] and not var_1_16 then
				var_1_17[var_1_0.currentMode](true)
			end
		elseif arg_37_0 == "setDefaultOff" then
			var_1_34 = var_1_24
			var_1_22 = var_0_0.round(255 * tonumber(arg_37_1 or 0) % 256)

			if var_1_17[var_1_0.currentMode] and not var_1_16 then
				var_1_17[var_1_0.currentMode](true)
			end
		elseif arg_37_0 == "play" then
			var_1_40(var_1_18)
		elseif arg_37_0 == "stop" then
			var_1_40(var_1_25)
		elseif arg_37_0 == "arming" then
			var_1_14 = false
			var_1_15 = true

			if var_1_17[var_1_0.currentMode] and not var_1_16 then
				var_1_17[var_1_0.currentMode](true)
			end
		elseif arg_37_0 == "armed" then
			var_1_14 = true
			var_1_15 = false

			if var_1_17[var_1_0.currentMode] and not var_1_16 then
				var_1_17[var_1_0.currentMode](true)
			end
		elseif arg_37_0 == "disarmed" then
			var_1_14 = false
			var_1_15 = false

			if var_1_17[var_1_0.currentMode] and not var_1_16 then
				var_1_17[var_1_0.currentMode](true)
			end
		elseif arg_37_0 == "SOS" then
			var_1_16 = true

			var_1_21()
		elseif arg_37_0 == "endOfSOS" then
			if var_1_16 and var_1_17[var_1_0.currentMode] then
				var_1_17[var_1_0.currentMode](true)
			end

			var_1_16 = false
		elseif arg_37_0 == "identify" then
			var_1_37(arg_37_1)
		end
	end

	var_1_0.name = "at91-kizbox2-tahoma"

	function var_1_0.load()
		var_1_12 = var_0_2.Monotonic()

		var_1_12:setTime(var_0_1.Monotonic(var_0_1.Elapsed(61, 0)), true)

		function var_1_12.expired(arg_39_0, arg_39_1)
			var_1_0.setFunction("disconnected")
		end

		var_1_42 = var_0_2.Monotonic()

		function var_1_42.expired(arg_40_0, arg_40_1)
			var_1_41 = 0

			var_1_0.setFunction(var_1_0.lastConnectionStatus)

			if var_1_17[var_1_0.lastConnectionStatus] then
				var_1_17[var_1_0.lastConnectionStatus](true)
			end
		end

		var_1_7 = var_0_2.Monotonic()

		function var_1_7.expired(arg_41_0, arg_41_1)
			var_1_0.setFunction("resetPending")
		end

		var_1_10 = var_0_2.Monotonic()

		function var_1_10.expired(arg_42_0, arg_42_1)
			var_0_4:notice("Set tmp orange")
			var_1_30()
		end

		var_1_11 = var_0_2.Monotonic()

		function var_1_11.expired(arg_43_0, arg_43_1)
			var_0_4:notice("Set tmp off")
			var_1_29()
		end

		var_1_36 = var_0_2.Monotonic()

		function var_1_36.expired(arg_44_0, arg_44_1)
			var_0_4:notice("End Timer")
			var_1_27:stop()
			var_1_0.setFunction("actionFinished")

			if var_1_35 and var_1_35 == "connected" then
				var_1_0.setFunction(var_1_35)

				var_1_35 = nil
			else
				var_1_0.setFunction("disconnected")

				var_1_35 = nil
			end
		end

		var_1_27 = var_0_2.Monotonic()

		if var_1_0.buttons.prog then
			var_0_3.add(var_1_0.buttons.prog, var_1_8)
		end

		if var_1_0.buttons.reset then
			var_0_3.add(var_1_0.buttons.reset, var_1_5)
		end

		if var_1_0.buttons.touch then
			var_0_3.add(var_1_0.buttons.touch, var_1_4)
		end

		var_1_0.gpios.powerSupply:edge("both")
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_12 then
			var_1_12:stop()

			var_1_12 = nil
		end

		if var_1_42 then
			var_1_42:stop()

			var_1_42 = nil
		end

		if var_1_7 then
			var_1_7:stop()

			var_1_7 = nil
		end

		if var_1_10 then
			var_1_10:stop()

			var_1_10 = nil
		end

		if var_1_11 then
			var_1_11:stop()

			var_1_11 = nil
		end

		if var_1_36 then
			var_1_36:stop()

			var_1_36 = nil
		end

		if var_1_27 then
			var_1_27:stop()

			var_1_27 = nil
		end

		var_0_3.remove(var_1_0.buttons.prog, var_1_8)
		var_0_3.remove(var_1_0.buttons.touch, var_1_4)
	end

	return var_1_0
end

setmetatable(var_0_10, var_0_9)

return var_0_10
