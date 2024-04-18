local var_0_0 = require("Overkiz.Kernel.Button")
local var_0_1 = require("Overkiz.Kernel.Leds")
local var_0_2 = require("Overkiz.Time")
local var_0_3 = require("Overkiz.Timer")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.common")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.constants")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.ButtonHandler")
local var_0_8 = {}
local var_0_9 = {}

function var_0_8.__call(arg_1_0, arg_1_1)
	local var_1_0 = var_0_5()

	var_1_0.buttons = {
		config = var_0_0("/dev/input/event0", 2),
		reset = var_0_0("/dev/input/event0", 0)
	}
	var_1_0.leds = var_0_1({
		green = "pwm:green:user",
		blue = "pwm:blue:user",
		red = "pwm:red:user"
	})

	local function var_1_1(arg_2_0)
		if arg_2_0 == "shortPress" then
			var_1_0.setFunction("endPairing")
		elseif arg_2_0 == "simplePress" then
			var_1_0.notify("configButton:simplePress")
		elseif arg_2_0 == "doublePress" then
			var_1_0.notify("configButton:doublePress")
		elseif arg_2_0 == "triplePress" then
			var_1_0.notify("configButton:triplePress")
			var_1_0.setFunction("userInteractionConfirmation")
		elseif arg_2_0 == "longPress" then
			var_1_0.notify("configButton:longPress")
		elseif arg_2_0 == "veryLongPress" then
			var_1_0.notify("configButton:veryLongPress")
		elseif arg_2_0 == "longHold" then
			var_1_0.setFunction("localAPIPairing")
		elseif arg_2_0 == "veryLongHold" then
			-- block empty
		else
			var_0_4:debug("unknown button event: " .. arg_2_0)
		end
	end

	var_1_0.configButtonHandler = var_0_7(var_1_0.buttons.config, var_1_1)

	local var_1_2 = var_0_6.defaultRailDinAllowedTransitions

	var_1_2.connected.userInteractionConfirmation = true
	var_1_2.disconnected.userInteractionConfirmation = true
	var_1_2.connectionPending.userInteractionConfirmation = true
	var_1_2.Unknown.userInteractionConfirmation = true
	var_1_2.userInteractionConfirmation = {
		disconnected = true,
		connectionPending = true,
		connected = true
	}

	local var_1_3 = var_0_3.Monotonic()

	var_1_3:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

	function var_1_3.expired(arg_3_0, arg_3_1)
		var_1_0.setFunction("disconnected")
	end

	local var_1_4 = "disconnected"
	local var_1_5 = {}
	local var_1_6 = var_0_3.Monotonic()

	function var_1_6.expired(arg_4_0)
		var_1_5.endPairing()
	end

	local function var_1_7()
		var_1_0.leds:setColor("green")
	end

	local function var_1_8()
		var_1_0.leds:setColor("red")
	end

	function var_1_5.connected()
		if var_1_0.currentMode ~= "connected" then
			var_1_7()
		end

		var_1_3:start()
	end

	function var_1_5.connectionPending()
		var_1_8()
		var_1_3:start()
	end

	function var_1_5.disconnected()
		if var_1_0.currentMode ~= "disconnected" then
			var_1_8()
		end

		var_1_3:stop()
	end

	function var_1_5.localAPI()
		var_1_0.leds:setColor("blue")
		var_1_3:stop()
	end

	local var_1_9

	function var_1_5.localAPIPairing()
		var_1_0.leds:setCycleSmoothBlink("blue")
		var_1_3:stop()
		var_1_0.notify("localAPIRequired")
		var_1_0.notify("wifiAPMode")

		function var_1_9.expired(arg_12_0)
			var_0_4:notice("Pairing timeout expired")
			var_1_0.setFunction("endPairing")
		end

		var_1_9:setTime(var_0_2.Monotonic(var_0_2.Elapsed(60, 0)), true)
		var_1_9:start()
	end

	function var_1_5.endPairing()
		var_1_0.notify("endPairingRequired")

		function var_1_9.expired(arg_14_0)
			var_1_0.leds:cleanup()
			var_1_0.setFunction(var_1_4)
		end

		var_1_9:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
		var_1_9:start()
	end

	function var_1_5.endPairingSuccess()
		var_1_0.leds:setTimerHardBlink("blue", 100)
		var_1_6:setTime(var_0_2.Monotonic(var_0_2.Elapsed(2, 0)), true)
		var_1_6:start()
	end

	function var_1_5.userInteractionConfirmation()
		var_1_0.leds:setCycleSmoothBlink("magenta")
		var_1_3:stop()

		function var_1_9.expired(arg_17_0)
			var_1_0.leds:cleanup()
			var_1_0.setFunction(var_1_4)
		end

		var_1_9:setTime(var_0_2.Monotonic(var_0_2.Elapsed(20, 0)), true)
		var_1_9:start()
	end

	function var_1_0.setFunction(arg_18_0)
		var_0_4:info("Set function requested: " .. arg_18_0)

		if arg_18_0 == "ethDisconnected" then
			arg_18_0 = "disconnected"
		elseif arg_18_0 == "ethConnected" then
			arg_18_0 = "connectionPending"
		end

		if var_1_0.allowedConnectionStatusChanges[arg_18_0] then
			var_1_0.lastConnectionStatus = arg_18_0
		end

		if arg_18_0 == "disconnected" or arg_18_0 == "connected" or arg_18_0 == "connectionPending" then
			var_1_4 = arg_18_0
		end

		if var_1_5[arg_18_0] then
			if var_1_0.checkIfAllowed(var_1_0.currentMode, arg_18_0, var_1_2) then
				var_1_5[arg_18_0]()

				var_1_0.currentMode = arg_18_0
			else
				var_0_4:notice("No transition available to " .. arg_18_0)
			end
		else
			var_0_4:notice("Try to set unknown mode " .. tostring(arg_18_0))
		end
	end

	function var_1_0.setEvent(arg_19_0)
		return
	end

	var_1_0.name = "at91-kizboxmini-RD-nexity"

	function var_1_0.load()
		var_1_3 = var_0_3.Monotonic()

		var_1_3:setTime(var_0_2.Monotonic(var_0_2.Elapsed(61, 0)), true)

		function var_1_3.expired(arg_21_0, arg_21_1)
			var_1_0.setFunction("disconnected")
		end

		if var_1_0.buttons.config then
			var_1_0.configButtonHandler:start()
		end

		var_1_9 = var_0_3.Monotonic()
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_3 then
			var_1_3:stop()

			var_1_3.expired = nil
			var_1_3 = nil
		end

		if var_1_9 then
			var_1_9:stop()

			var_1_9.expired = nil
			var_1_9 = nil
		end

		var_1_0.configButtonHandler:stop()
	end

	return var_1_0
end

setmetatable(var_0_9, var_0_8)

return var_0_9
