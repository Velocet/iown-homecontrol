local var_0_0 = require("Overkiz.Timer")
local var_0_1 = require("Overkiz.Time")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.recovery")
local var_0_4 = {}
local var_0_5 = {}

function var_0_4.__call(arg_1_0, arg_1_1)
	local var_1_0 = {}

	var_1_0.ready = true

	if not arg_1_1 then
		var_0_2:warning("Attempt to insert nil parameter")

		return nil
	end

	local var_1_1

	local function var_1_2(arg_2_0)
		var_0_2:notice("Parameter update failed. (" .. tostring(arg_2_0) .. ")")
	end

	if arg_1_1.refresh and arg_1_1.refresh.ignoreRecovered and var_0_3.get() then
		var_1_0.ready = false
	end

	local function var_1_3(arg_3_0, arg_3_1, arg_3_2)
		if not arg_1_1.refresh then
			var_0_2:warning("Missing refresh table on parameter definition")

			arg_1_1.refresh = {}
		end

		if arg_3_2 and arg_1_1.refresh.ignoreRefreshAll then
			var_0_2:info("Parameter refresh ignored on refreshAll. ")
			arg_3_1("Parameter refresh ignored on refreshAll.")
		elseif var_1_0.ready then
			arg_1_1.read(arg_3_0, arg_3_1)
		else
			arg_3_1("Not ready -> Recovered")
		end
	end

	local function var_1_4(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
		local function var_4_0(arg_5_0, arg_5_1)
			var_1_0.ready = true

			arg_4_1(arg_5_0, arg_5_1)
		end

		arg_1_1.write(arg_4_0, var_4_0, arg_4_2, arg_4_3)
	end

	if arg_1_1.read then
		var_1_0.read = var_1_3
	end

	if arg_1_1.write then
		var_1_0.write = var_1_4
	end

	function var_1_0.getParameterRefreshDefinition(arg_6_0)
		return arg_1_1.refresh or {}
	end

	function var_1_0.setRefresh(arg_7_0, arg_7_1, arg_7_2)
		if arg_1_1.refresh and arg_1_1.read then
			var_1_1 = var_0_0.Monotonic()

			function var_1_1.expired()
				var_1_0.read(arg_7_1, var_1_2)

				if arg_1_1.refresh.interval then
					var_1_1:setTime(arg_1_1.refresh.interval, true)
					var_1_1:start()
				end
			end

			if arg_1_1.refresh.interval then
				var_1_1:setTime(arg_1_1.refresh.interval, true)
				var_1_1:start()
			end

			if arg_1_1.refresh.startup and arg_7_2 then
				var_0_2:info("Startup refresh")
				var_1_1:setTime(var_0_1.Monotonic(var_0_1.Elapsed(0, 0)), true)
				var_1_1:start()
			end
		end

		if arg_1_1.watchers then
			local function var_7_0(arg_9_0, arg_9_1)
				var_1_0.ready = true

				arg_7_1(arg_9_0, arg_9_1)
			end

			arg_1_1.listen(var_7_0)
		end
	end

	return var_1_0
end

setmetatable(var_0_5, var_0_4)

return var_0_5
