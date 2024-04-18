local var_0_0 = require("Overkiz.Kernel.Button")
local var_0_1 = require("Overkiz.Kernel.Leds")
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
	var_1_0.leds = var_0_1({
		green = "pwm:green:user",
		red = "pwm:red:user"
	})

	local var_1_1 = var_0_3.Monotonic()

	var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

	function var_1_1.expired(arg_2_0, arg_2_1)
		var_1_0.setFunction("disconnected")
	end

	local var_1_2 = {
		ideal_firmware_updating = true
	}
	local var_1_3 = {
		disconnected = true,
		connectionPending = true,
		ideal_ok_no_rf = true,
		ideal_no_more_err = true,
		ideal_firmware_updating = true,
		ideal_pairing_failed = true,
		connected = true,
		Unknown = true,
		ideal_error = true,
		ideal_ready_to_pair = true,
		ideal_ok = true
	}
	local var_1_4 = {
		Unknown = var_1_3,
		connected = var_1_3,
		connectionPending = var_1_3,
		disconnected = {
			disconnected = true,
			connectionPending = true,
			connected = true
		},
		ideal_firmware_updating = {
			ideal_ok_no_rf = true,
			ideal_ready_to_pair = true
		},
		ideal_ready_to_pair = {
			ideal_ok = true,
			ideal_pairing_failed = true,
			ideal_ok_no_rf = true,
			ideal_error = true
		},
		ideal_ok_no_rf = {
			ideal_ready_to_pair = true,
			disconnected = true,
			ideal_ok = true,
			ideal_error = true
		},
		ideal_error = {
			ideal_no_more_err = true
		},
		ideal_pairing_failed = {
			ideal_ready_to_pair = true,
			ideal_ok_no_rf = true,
			ideal_ok = true
		},
		ideal_no_more_err = var_1_3,
		ideal_ok = var_1_3
	}
	local var_1_5 = {
		connected = function()
			var_0_4:info("connected - no led change (ideal things soon)")
			var_1_1:start()
		end,
		connectionPending = function()
			var_0_4:info("connectionPending - no led change (ideal things soon)")
			var_1_1:start()
		end,
		disconnected = function()
			if var_1_0.currentMode ~= "disconnected" then
				var_1_0.leds:setColor("yellow")
			end

			var_1_1:stop()
		end,
		ideal_firmware_updating = function()
			if var_1_0.currentMode ~= "ideal_firmware_updating" then
				var_1_0.leds:setHardBlink("red")
			end

			var_1_1:stop()
		end,
		ideal_ready_to_pair = function()
			var_1_0.leds:setHardBlink("green")
			var_1_1:stop()
		end,
		ideal_ok_no_rf = function()
			var_1_0.leds:setHardBlink("yellow")
			var_1_1:stop()
		end,
		ideal_error = function()
			var_1_0.leds:setColor("red")
			var_1_1:stop()
		end,
		ideal_pairing_failed = function()
			var_1_0.leds:setColor("red")
			var_1_1:stop()
		end,
		ideal_ok = function()
			if var_1_0.currentMode ~= "ideal_ok" then
				var_1_0.leds:setColor("green")
			end

			var_1_1:stop()
		end
	}

	var_1_5.ideal_no_more_err = var_1_5.ideal_ok

	function var_1_0.setFunction(arg_12_0)
		var_0_4:info("Set function requested: " .. arg_12_0)

		if arg_12_0 == "ethDisconnected" then
			arg_12_0 = "disconnected"
		elseif arg_12_0 == "ethConnected" then
			arg_12_0 = "connectionPending"
		end

		if var_1_0.allowedConnectionStatusChanges[arg_12_0] then
			var_1_0.lastConnectionStatus = arg_12_0
		end

		if var_1_5[arg_12_0] then
			if var_1_2[arg_12_0] or var_1_0.checkIfAllowed(var_1_0.currentMode, arg_12_0, var_1_4) then
				var_1_5[arg_12_0]()

				var_1_0.currentMode = arg_12_0
			else
				var_0_4:info("No transition available to " .. arg_12_0)
			end
		else
			var_0_4:notice("Try to set unknown mode " .. tostring(arg_12_0))
		end
	end

	function var_1_0.setEvent(arg_13_0)
		return
	end

	var_1_0.name = "at91-kizboxmini-ideal"

	function var_1_0.load()
		var_1_1 = var_0_3.Monotonic()

		var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

		function var_1_1.expired(arg_15_0, arg_15_1)
			var_1_0.setFunction("disconnected")
		end
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_1 then
			var_1_1:stop()

			var_1_1 = nil
		end
	end

	return var_1_0
end

setmetatable(var_0_7, var_0_6)

return var_0_7
