local var_0_0 = require("Overkiz.Kernel.Button")
local var_0_1 = require("Overkiz.Kernel.Led")
local var_0_2 = require("Overkiz.Time")
local var_0_3 = require("Overkiz.Timer")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.common")
local var_0_6 = {}
local var_0_7 = {}

function var_0_6.__call(arg_1_0, arg_1_1)
	local var_1_0 = var_0_5()

	var_1_0.buttons = {
		mode = var_0_0("/dev/input/event0", 1),
		reset = var_0_0("/dev/input/event0", 0)
	}
	var_1_0.leds = {
		connection = {
			green = var_0_1("pwm:green:user"),
			red = var_0_1("pwm:red:user")
		}
	}

	local var_1_1 = var_0_3.Monotonic()

	var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

	function var_1_1.expired(arg_2_0, arg_2_1)
		var_1_0.setFunction("disconnected")
	end

	local var_1_2 = {
		connected = {
			disconnected = true,
			connected = true
		},
		disconnected = {
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
		Unknown = {
			disconnected = true,
			connectionPending = true,
			localMode = true,
			connected = true
		}
	}
	local var_1_3 = {
		connected = function(arg_3_0)
			if var_1_0.currentMode ~= "connected" or arg_3_0 then
				var_1_0.leds.connection.green:setOn()
				var_1_0.leds.connection.red:setOff()
			end

			var_1_1:start()
		end,
		connectionPending = function()
			var_1_0.leds.connection.red:setOff()
			var_1_0.leds.connection.green:setCycleSmoothBlink()
			var_1_1:start()
		end,
		disconnected = function(arg_5_0)
			if var_1_0.currentMode ~= "disconnected" or arg_5_0 then
				var_1_0.leds.connection.green:setOff()
				var_1_0.leds.connection.red:setOn()
			end

			var_1_1:stop()
		end,
		localMode = function()
			var_1_0.leds.connection.green:setOff()
			var_1_0.leds.connection.red:setOn()
			var_1_1:stop()
		end
	}
	local var_1_4 = 0
	local var_1_5

	function var_1_0.setFunction(arg_7_0)
		var_0_4:info("Set function requested: " .. arg_7_0)

		if arg_7_0 == "ethDisconnected" then
			arg_7_0 = "disconnected"
		elseif arg_7_0 == "ethConnected" then
			arg_7_0 = "connectionPending"
		end

		if var_1_0.allowedConnectionStatusChanges[arg_7_0] then
			var_1_0.lastConnectionStatus = arg_7_0
		end

		if arg_7_0 == "stm32StartUpgrade" or arg_7_0 == "stm32StartUpdate" then
			var_1_4 = var_1_4 + 1

			if var_1_4 == 1 then
				var_1_0.leds.connection.green:setOff()
				var_1_0.leds.connection.red:setOff()
				var_1_0.leds.connection.red:setTrigger("timer")
				var_1_0.leds.connection.green:setTrigger("timer")
			end

			var_1_5:setTime(var_0_2.Monotonic(var_0_2.Elapsed(120, 0)), true)
			var_1_5:start()
		elseif arg_7_0 == "stm32StopUpgrade" or arg_7_0 == "stm32StopUpdate" then
			var_1_4 = var_1_4 - 1

			if var_1_4 == 0 then
				var_1_5:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
				var_1_5:start()
			end

			return
		end

		if var_1_4 > 0 then
			return
		end

		if var_1_3[arg_7_0] then
			if var_1_0.checkIfAllowed(var_1_0.currentMode, arg_7_0, var_1_2) then
				var_1_3[arg_7_0]()

				var_1_0.currentMode = arg_7_0
			else
				var_0_4:notice("No transition available to " .. arg_7_0)
			end
		else
			var_0_4:notice("Try to set unknown mode " .. tostring(arg_7_0))
		end
	end

	function var_1_0.setEvent(arg_8_0)
		return
	end

	var_1_0.name = "at91-kizboxmini"

	function var_1_0.load()
		var_1_1 = var_0_3.Monotonic()

		var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

		function var_1_1.expired(arg_10_0, arg_10_1)
			var_1_0.setFunction("disconnected")
		end

		var_1_5 = var_0_3.Monotonic()

		function var_1_5.expired(arg_11_0, arg_11_1)
			var_1_4 = 0

			var_1_0.setFunction(var_1_0.lastConnectionStatus)

			if var_1_3[var_1_0.lastConnectionStatus] then
				var_1_3[var_1_0.lastConnectionStatus](true)
			end
		end
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_1 then
			var_1_1:stop()

			var_1_1 = nil
		end

		if var_1_5 then
			var_1_5:stop()

			var_1_5 = nil
		end
	end

	return var_1_0
end

setmetatable(var_0_7, var_0_6)

return var_0_7
