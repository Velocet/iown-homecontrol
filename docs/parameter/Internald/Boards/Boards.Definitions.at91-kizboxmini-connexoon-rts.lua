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
		sel = var_0_0("/dev/input/event0", 2),
		prog = var_0_0("/dev/input/event0", 0)
	}
	var_1_0.leds = {
		connection = {
			green = var_0_1("pwm:green:user"),
			red = var_0_1("pwm:red:user")
		}
	}

	local var_1_1
	local var_1_2 = 0

	local function var_1_3()
		var_1_0.leds.connection.red:setOff()
		var_1_0.leds.connection.green:setOff()
	end

	local function var_1_4()
		var_1_0.leds.connection.red:setOn()
		var_1_0.leds.connection.green:setOn()
	end

	local function var_1_5(arg_4_0)
		var_1_1:stop()
		var_1_3()
		arg_4_0:setOn()
		arg_4_0:setTrigger("timer")
		arg_4_0:setdelayOn("500")
		arg_4_0:setdelayOff("500")
	end

	local function var_1_6()
		var_1_5(var_1_0.leds.connection.red)
	end

	local function var_1_7()
		var_1_5(var_1_0.leds.connection.green)
	end

	local function var_1_8()
		var_1_1:stop()

		function var_1_1.expired(arg_8_0)
			if var_1_2 % 2 > 0 then
				var_1_4()
			else
				var_1_3()
			end

			var_1_2 = var_1_2 + 1

			var_1_1:start()
		end

		var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 500000000)), true)
		var_1_4()
		var_1_1:start()
	end

	local function var_1_9(arg_9_0)
		var_1_1:stop()
		var_1_3()

		function var_1_1.expired(arg_10_0)
			if var_1_2 % 4 == 0 then
				arg_9_0:setBrightness(255)
				var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 200000000)), true)
			elseif var_1_2 % 4 == 1 then
				arg_9_0:setBrightness(0)
				var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 100000000)), true)
			elseif var_1_2 % 4 == 2 then
				arg_9_0:setBrightness(255)
				var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 200000000)), true)
			else
				arg_9_0:setBrightness(0)
				var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 500000000)), true)
			end

			var_1_2 = var_1_2 + 1

			var_1_1:start()
		end

		var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
		arg_9_0:setOn()
		var_1_1:start()
	end

	local function var_1_10()
		var_1_9(var_1_0.leds.connection.red)
	end

	local function var_1_11()
		var_1_9(var_1_0.leds.connection.green)
	end

	local function var_1_12()
		var_1_1:stop()

		function var_1_1.expired(arg_14_0)
			if var_1_2 % 4 == 0 then
				var_1_4()
				var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 200000000)), true)
			elseif var_1_2 % 4 == 1 then
				var_1_3()
				var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 100000000)), true)
			elseif var_1_2 % 4 == 2 then
				var_1_4()
				var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 200000000)), true)
			else
				var_1_3()
				var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 500000000)), true)
			end

			var_1_2 = var_1_2 + 1

			var_1_1:start()
		end

		var_1_1:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
		var_1_4()
		var_1_1:start()
	end

	local function var_1_13(arg_15_0)
		var_1_1:stop()
		var_1_3()
		arg_15_0:setOn()
		arg_15_0:setTrigger("timer")
		arg_15_0:setdelayOn("140")
		arg_15_0:setdelayOff("110")
	end

	local function var_1_14()
		var_1_13(var_1_0.leds.connection.red)
	end

	local var_1_15 = 300
	local var_1_16 = 30
	local var_1_17 = 61
	local var_1_18 = 5
	local var_1_19 = 0
	local var_1_20 = 0
	local var_1_21 = 60
	local var_1_22
	local var_1_23 = {
		time = 0,
		status = "unknown"
	}
	local var_1_24 = {
		time = 0,
		status = "unknown"
	}
	local var_1_25 = 0
	local var_1_26
	local var_1_27
	local var_1_28 = 0
	local var_1_29 = 0

	local function var_1_30()
		var_1_28 = 0
		var_1_29 = 0
	end

	local function var_1_31()
		if var_1_22 == "C1" then
			var_1_0.setFunction("C2")
		elseif var_1_22 == "C2" then
			var_1_0.setFunction("C3")
		elseif var_1_22 == "C3" then
			var_1_0.setFunction("C4")
		elseif var_1_22 == "C4" then
			var_1_0.setFunction("C5")
		elseif var_1_22 == "C5" then
			var_1_0.setFunction("C6")
		elseif var_1_22 == "C6" then
			var_1_0.setFunction("C1")
		else
			var_0_5:warning("Invalid currentChannel: " .. var_1_22)
		end
	end

	local var_1_32 = {}
	local var_1_33 = {}
	local var_1_34 = {
		time = 0,
		status = 0
	}
	local var_1_35 = {
		time = 0,
		status = 0
	}

	local function var_1_36()
		if var_1_34.status == 1 and var_1_35.status == 1 then
			var_1_26:stop()
			var_1_27:stop()
			var_1_0.setFunction("test")

			return true
		end

		return false
	end

	function var_1_32.modified(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
		if arg_20_2 ~= "status" then
			return
		end

		local var_20_0 = var_1_0.buttons.prog.time.microSeconds + var_1_0.buttons.prog.time.seconds * 1000000

		var_1_34.status = arg_20_3

		if arg_20_3 == 1 then
			function var_1_26.expired(arg_21_0)
				if not var_1_36() then
					var_1_0.setFunction("emission")
				end
			end

			if not var_1_36() then
				var_1_26:start()
			end
		elseif arg_20_3 == 0 then
			if var_20_0 > var_1_34.time + var_1_16 * 1000 - 1 and var_1_26:isRunning() then
				var_1_26:expired()
			end

			var_1_26:stop()
		end

		var_1_34.time = var_20_0
	end

	function var_1_33.modified(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
		if arg_22_2 ~= "status" then
			return
		end

		local var_22_0 = var_1_0.buttons.sel.time.microSeconds + var_1_0.buttons.sel.time.seconds * 1000000

		var_1_35.status = arg_22_3

		if arg_22_3 == 1 then
			function var_1_27.expired(arg_23_0)
				if not var_1_36() then
					if var_1_0.currentMode == "connected" or var_1_0.currentMode == "disconnected" or var_1_0.currentMode == "Unknown" then
						var_1_0.setFunction("progStarted")
						var_1_0.setFunction("C1")
					else
						var_1_31()
					end
				end
			end

			if not var_1_36() then
				var_1_27:start()
			end
		elseif arg_22_3 == 0 then
			if var_22_0 > var_1_35.time + var_1_16 * 1000 - 1 and var_1_27:isRunning() then
				var_1_27:expired()
			end

			var_1_27:stop()
		end

		var_1_35.time = var_22_0
	end

	local var_1_37 = {
		C2 = true,
		C5 = true,
		C6 = true,
		C3 = true,
		C1 = true,
		C4 = true
	}
	local var_1_38 = {
		connected = {
			disconnected = true,
			progStarted = true,
			connected = true
		},
		disconnected = {
			disconnected = true,
			progStarted = true,
			connected = true
		},
		progStarted = {
			C1 = true
		},
		progEnded = {
			disconnected = true,
			connected = true
		},
		C1 = {
			emission = true,
			test = true,
			progEnded = true,
			C2 = true
		},
		C2 = {
			emission = true,
			test = true,
			progEnded = true,
			C3 = true
		},
		C3 = {
			emission = true,
			test = true,
			C4 = true,
			progEnded = true
		},
		C4 = {
			emission = true,
			test = true,
			progEnded = true,
			C5 = true
		},
		C5 = {
			emission = true,
			test = true,
			progEnded = true,
			C6 = true
		},
		C6 = {
			emission = true,
			test = true,
			progEnded = true,
			C1 = true
		},
		emission = {
			TestOK = true,
			TestKO = true
		},
		test = {
			TestOK = true,
			TestKO = true
		},
		TestOK = var_1_37,
		TestKO = var_1_37,
		Unknown = {
			disconnected = true,
			progStarted = true,
			connected = true
		}
	}
	local var_1_39 = "disconnected"
	local var_1_40
	local var_1_41
	local var_1_42 = {}
	local var_1_43

	function var_1_42.connected(arg_24_0)
		if var_1_0.currentMode ~= "connected" or arg_24_0 then
			var_1_0.leds.connection.green:setOn()
			var_1_0.leds.connection.red:setOff()
		end

		var_1_40:start()
	end

	function var_1_42.disconnected(arg_25_0)
		if var_1_0.currentMode ~= "disconnected" or arg_25_0 then
			var_1_0.leds.connection.green:setOff()
			var_1_0.leds.connection.red:setOn()
		end

		var_1_40:stop()
	end

	function var_1_42.progStarted()
		var_1_40:stop()

		var_1_43 = "Up"

		if var_1_0.buttons.prog then
			var_0_4.add(var_1_0.buttons.prog, var_1_32)
		end
	end

	local var_1_44

	function var_1_42.progEnded()
		var_1_44:start()
	end

	function var_1_42.C1()
		var_1_22 = "C1"

		var_1_8()
		var_1_41:start()
	end

	function var_1_42.C2()
		var_1_22 = "C2"

		var_1_6()
		var_1_41:start()
	end

	function var_1_42.C3()
		var_1_22 = "C3"

		var_1_7()
		var_1_41:start()
	end

	function var_1_42.C4()
		var_1_22 = "C4"

		var_1_12()
		var_1_41:start()
	end

	function var_1_42.C5()
		var_1_22 = "C5"

		var_1_10()
		var_1_41:start()
	end

	function var_1_42.C6()
		var_1_22 = "C6"

		var_1_11()
		var_1_41:start()
	end

	local var_1_45

	function var_1_42.emission()
		var_1_41:stop()
		var_1_14()

		var_1_25 = 1

		var_1_0.notify("RTS_Discover" .. var_1_22)
		var_1_45:start()
	end

	local var_1_46

	function var_1_42.test()
		var_1_41:stop()
		var_1_14()

		var_1_25 = 1

		if var_1_46 ~= var_1_22 then
			var_1_46 = var_1_22
			var_1_43 = "Up"
		end

		if var_1_43 == "Up" then
			var_1_43 = "StopUp"

			var_1_0.notify("TestUp" .. var_1_22)
			var_1_45:start()
		elseif var_1_43 == "StopUp" then
			var_1_43 = "Down"

			var_1_0.notify("TestStop" .. var_1_22)
			var_1_45:start()
		elseif var_1_43 == "Down" then
			var_1_43 = "StopDown"

			var_1_0.notify("TestDown" .. var_1_22)
			var_1_45:start()
		elseif var_1_43 == "StopDown" then
			var_1_43 = "Up"

			var_1_0.notify("TestStop" .. var_1_22)
			var_1_45:start()
		else
			var_0_5:warning("Invalid nextOrder: " .. var_1_43)
		end
	end

	local var_1_47

	function var_1_42.TestOK()
		var_1_47:start()
		var_1_45:stop()
	end

	function var_1_42.TestKO()
		var_1_47:start()
		var_1_45:stop()
	end

	local var_1_48 = 0
	local var_1_49

	function var_1_0.setFunction(arg_38_0)
		var_0_5:info("Set function requested: " .. arg_38_0)

		if arg_38_0 == "ethDisconnected" then
			arg_38_0 = "disconnected"
		elseif arg_38_0 == "ethConnected" then
			arg_38_0 = "connected"
		end

		if var_1_0.allowedConnectionStatusChanges[arg_38_0] then
			var_1_0.lastConnectionStatus = arg_38_0
		end

		if arg_38_0 == "stm32StartUpgrade" or arg_38_0 == "stm32StartUpdate" then
			var_1_48 = var_1_48 + 1

			if var_1_48 == 1 then
				var_1_0.leds.connection.green:setOff()
				var_1_0.leds.connection.red:setOff()
				var_1_0.leds.connection.red:setTrigger("timer")
				var_1_0.leds.connection.green:setTrigger("timer")
			end

			var_1_49:setTime(var_0_2.Monotonic(var_0_2.Elapsed(120, 0)), true)
			var_1_49:start()
		elseif arg_38_0 == "stm32StopUpgrade" or arg_38_0 == "stm32StopUpdate" then
			var_1_48 = var_1_48 - 1

			if var_1_48 == 0 then
				var_1_49:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, 0)), true)
				var_1_49:start()
			end

			return
		end

		if var_1_48 > 0 then
			return
		end

		if var_1_42[arg_38_0] then
			if var_1_0.checkIfAllowed(var_1_0.currentMode, arg_38_0, var_1_38) then
				var_1_42[arg_38_0]()

				var_1_0.currentMode = arg_38_0
			else
				var_0_5:notice("No transition available to " .. arg_38_0)
			end
		else
			var_0_5:notice("Try to set unknown mode " .. tostring(arg_38_0))
		end
	end

	function var_1_0.setEvent(arg_39_0)
		return
	end

	var_1_0.name = "at91-kizboxmini"

	function var_1_0.load()
		var_1_1 = var_0_3.Monotonic()
		var_1_26 = var_0_3.Monotonic()
		var_1_27 = var_0_3.Monotonic()
		var_1_40 = var_0_3.Monotonic()
		var_1_41 = var_0_3.Monotonic()
		var_1_47 = var_0_3.Monotonic()
		var_1_44 = var_0_3.Monotonic()
		var_1_45 = var_0_3.Monotonic()

		var_1_26:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, var_1_15 * 1000000)), true)
		var_1_27:setTime(var_0_2.Monotonic(var_0_2.Elapsed(0, var_1_15 * 1000000)), true)
		var_1_40:setTime(var_0_2.Monotonic(var_0_2.Elapsed(var_1_17, 0)), true)
		var_1_41:setTime(var_0_2.Monotonic(var_0_2.Elapsed(var_1_18, 0)), true)
		var_1_47:setTime(var_0_2.Monotonic(var_0_2.Elapsed(var_1_19, 0)), true)
		var_1_44:setTime(var_0_2.Monotonic(var_0_2.Elapsed(var_1_20, 0)), true)
		var_1_45:setTime(var_0_2.Monotonic(var_0_2.Elapsed(var_1_21, 0)), true)

		function var_1_40.expired(arg_41_0)
			var_0_5:notice("connectionTimer expired")
			var_1_0.setFunction("disconnected")
		end

		function var_1_41.expired(arg_42_0)
			var_0_5:notice("idleTimer expired")
			var_1_1:stop()

			var_1_34.status = 0

			var_0_4.remove(var_1_0.buttons.prog, var_1_32)
			var_1_0.setFunction("progEnded")
		end

		function var_1_47.expired(arg_43_0)
			var_0_5:notice("endActionTimer expired")

			var_1_25 = 0

			var_1_0.setFunction(var_1_22)
		end

		if var_1_0.buttons.sel then
			var_0_4.add(var_1_0.buttons.sel, var_1_33)
		end

		function var_1_44.expired(arg_44_0)
			var_0_5:notice("EndProgTimer expired")

			if var_1_0.lastConnectionStatus == "connected" then
				var_1_0.setFunction("connected")
			else
				var_1_0.setFunction("disconnected")
			end
		end

		function var_1_45.expired(arg_45_0)
			var_1_0.setFunction("TestKO")
		end

		if var_1_0.buttons.prog then
			var_0_4.add(var_1_0.buttons.prog, var_1_32)
		end

		var_1_49 = var_0_3.Monotonic()

		function var_1_49.expired(arg_46_0, arg_46_1)
			var_1_48 = 0

			var_1_0.setFunction(var_1_0.lastConnectionStatus)

			if var_1_42[var_1_0.lastConnectionStatus] then
				var_1_42[var_1_0.lastConnectionStatus](true)
			end
		end
	end

	function var_1_0.unload()
		var_1_0.listeners = {}

		if var_1_1 then
			var_1_1:stop()

			var_1_1 = nil
		end

		if var_1_26 then
			var_1_26:stop()

			var_1_26 = nil
		end

		if var_1_27 then
			var_1_27:stop()

			var_1_27 = nil
		end

		if var_1_40 then
			var_1_40:stop()

			var_1_40 = nil
		end

		if var_1_41 then
			var_1_41:stop()

			var_1_41 = nil
		end

		if var_1_47 then
			var_1_47:stop()

			var_1_47 = nil
		end

		if var_1_44 then
			var_1_44:stop()

			var_1_44 = nil
		end

		var_0_4.remove(var_1_0.buttons.prog, var_1_32)
		var_0_4.remove(var_1_0.buttons.sel, var_1_33)

		if var_1_49 then
			var_1_49:stop()

			var_1_49 = nil
		end
	end

	return var_1_0
end

setmetatable(var_0_8, var_0_7)

return var_0_8
