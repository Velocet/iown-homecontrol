local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.conf")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_2 = {}
local var_0_3 = {}

function var_0_2.__call(arg_1_0)
	local var_1_0 = {}
	local var_1_1 = require("Overkiz.Kernel.StartupUpdate")
	local var_1_2 = true

	var_1_0.proxy = var_1_1("", "", {
		var_0_0.tskModalias
	}, "tty")
	var_1_0.key = nil
	var_1_0.watchers = {}
	var_1_0.Watcher = {}

	local var_1_3 = false
	local var_1_4 = false

	function var_1_0.proxy.onStart(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = require("Overkiz.HomeAutomation.Protocol.Internal.Usb.AT")

		if not var_1_4 then
			local var_2_1 = var_2_0()

			var_2_1:open(arg_2_1)
			var_2_1:write("#REBOOT", function()
				os.execute("telit-usb restart ; telit-hub restart")
			end)

			var_1_4 = true

			return
		end

		var_1_3 = true

		if not var_1_0.key then
			var_1_0.key = var_2_0()

			var_1_0.key:open(arg_2_1)
			var_1_0:send("+IPR=115200")
			var_1_0:send("#SELINT=2")
			var_1_0.Watcher:keyAdded()
		end
	end

	function var_1_0.proxy.onStop(arg_4_0)
		if var_1_0.key or var_1_2 then
			var_0_1:debug("modemHandler : Key removed")
			var_1_0.Watcher:keyRemoved()

			var_1_0.key = nil
			var_1_2 = false
		end
	end

	function var_1_0.Watcher.add(arg_5_0, arg_5_1, arg_5_2)
		var_1_0.watchers[arg_5_1] = arg_5_1
		var_1_0.watchers[arg_5_1].filter = arg_5_2

		return arg_5_1
	end

	function var_1_0.Watcher.remove(arg_6_0, arg_6_1)
		var_1_0.watchers[arg_6_1] = nil
	end

	function var_1_0.Watcher.keyAdded(arg_7_0)
		var_0_1:debug("KeyHandler : Key Added")

		for iter_7_0, iter_7_1 in pairs(var_1_0.watchers) do
			var_0_1:info("watcher keyAdded found : " .. tostring(iter_7_1))

			if iter_7_1.keyAdded then
				iter_7_1:keyAdded()
			end
		end
	end

	function var_1_0.Watcher.keyRemoved(arg_8_0)
		var_0_1:debug("KeyHandler : Key Removed")

		for iter_8_0, iter_8_1 in pairs(var_1_0.watchers) do
			if iter_8_1.keyRemoved then
				iter_8_1:keyRemoved()
			end
		end
	end

	function var_1_0.send(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0.key then
			arg_9_0.key:write(arg_9_1, arg_9_2)
			var_0_1:debug("request " .. arg_9_1 .. " sent")
		else
			var_0_1:notice("request not send, key not connected")

			if arg_9_2 and type(arg_9_2) == "function" then
				arg_9_2(true, "Key not pluged")
			end
		end
	end

	function var_1_0.getSIMStatus(arg_10_0, arg_10_1, arg_10_2)
		local var_10_0

		local function var_10_1(arg_11_0, arg_11_1)
			var_10_0 = false

			if arg_11_0 then
				arg_10_1("KO")

				return
			end

			if arg_11_1:match("+CPIN: (.+)") == "READY" then
				arg_10_1("OK")
			else
				arg_10_1("KO")
			end
		end

		if not var_1_3 then
			arg_10_1("InProgress")
		elseif not var_10_0 then
			var_1_0:send("+CPIN?", var_10_1)

			var_10_0 = true
		else
			arg_10_1("Retry")
		end
	end

	return var_1_0
end

setmetatable(var_0_3, var_0_2)

return var_0_3()
