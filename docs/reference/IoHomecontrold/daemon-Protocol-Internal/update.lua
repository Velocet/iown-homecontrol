local var_0_0 = require("Overkiz.Bus.Object")
local var_0_1 = require("Overkiz.utilities")
local var_0_2 = require("Overkiz.TableStorage")
local var_0_3 = require("Overkiz.Subject")
local var_0_4 = require("Overkiz.Timer")
local var_0_5 = require("Overkiz.Time")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.Internal.modules")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.Internal.conf")
local var_0_9 = require("pl.path")
local var_0_10 = var_0_2("status")
local var_0_11 = var_0_0.Server("/com/overkiz/Application/Internal/Update")

var_0_11.updateStatusNotifier = var_0_3()
var_0_11.callbacks = {}

local function var_0_12()
	local var_1_0 = var_0_8.updateStatusPath

	if not var_0_9.exists(var_1_0) or not var_0_9.isfile(var_1_0) then
		var_0_6:warning("Path '", var_1_0, "' does not exist or is not a file.")

		return false
	end

	for iter_1_0 in io.lines(var_1_0) do
		local var_1_1 = var_0_1.stringSimpleSplit(iter_1_0, ":")

		var_0_10[var_1_1[1]] = {
			id = var_1_1[1],
			status = var_1_1[2],
			version = var_1_1[3],
			hash = var_1_1[4]
		}
	end

	return true
end

function var_0_11.getFile(arg_2_0)
	if not var_0_12() then
		return
	end

	local var_2_0 = {}

	for iter_2_0, iter_2_1 in var_0_2.pairs(var_0_10) do
		table.insert(var_2_0, iter_2_1)
	end

	return var_2_0
end

local function var_0_13(arg_3_0, arg_3_1)
	if var_0_11.callbacks[arg_3_0] then
		if arg_3_1 == 0 and type(var_0_11.callbacks[arg_3_0].onSuccess) == "function" then
			var_0_6:info("Calling onSuccess() for '" .. arg_3_0 .. "'")
			var_0_11.callbacks[arg_3_0].onSuccess()
		elseif arg_3_1 ~= 0 and type(var_0_11.callbacks[arg_3_0].onError) == "function" then
			var_0_6:info("Calling onError() for '" .. arg_3_0 .. "'")
			var_0_11.callbacks[arg_3_0].onError("Error for '" .. arg_3_0 .. "', script return '" .. arg_3_1 .. "'")
		end

		if var_0_11.callbacks[arg_3_0].onExit then
			var_0_11.callbacks[arg_3_0].onExit()
		end
	end

	var_0_11.callbacks = {}
end

function var_0_11.method(arg_4_0, arg_4_1)
	if arg_4_1:getInterface() == "com.overkiz.Application.Internal.Update" then
		if arg_4_1:getMember() == "harakiri" and arg_4_1:getSignature() == "s" then
			local var_4_0 = arg_4_1:constbegin():get("string")

			var_0_13(var_4_0, 0)

			function var_0_7.StrandExpiration()
				local var_5_0 = var_0_4.Monotonic()

				function var_5_0.expired(arg_6_0)
					var_0_6:info("Bye bye world! I'm internal and I'm doing harakiri. Let's see in next world!")
					os.exit(0)
				end

				var_5_0:setTime(var_0_5.Monotonic(var_0_5.Elapsed(1, 0)), true)
				var_5_0:start()
			end

			var_0_7.stopAllServices()
		elseif arg_4_1:getMember() == "harakiri" and arg_4_1:getSignature() == "" then
			function var_0_7.StrandExpiration()
				local var_7_0 = var_0_4.Monotonic()

				function var_7_0.expired(arg_8_0)
					var_0_6:info("Bye bye world! I'm internal and I'm doing harakiri. Let's see in next world!")
					os.exit(0)
				end

				var_7_0:setTime(var_0_5.Monotonic(var_0_5.Elapsed(1, 0)), true)
				var_7_0:start()
			end

			var_0_7.stopAllServices()
		elseif arg_4_1:getMember() == "updateStatus" and arg_4_1:getSignature() == "" then
			local var_4_1 = arg_4_0:getFile()

			if var_4_1 then
				arg_4_0.updateStatusNotifier:notify(var_4_1)
			end
		elseif arg_4_1:getMember() == "exitStatus" and arg_4_1:getSignature() == "si" then
			local var_4_2 = arg_4_1:constbegin()
			local var_4_3 = var_4_2:get("string")
			local var_4_4 = var_4_2:get("int32")

			var_0_13(var_4_3, var_4_4)
		end
	end
end

return var_0_11
