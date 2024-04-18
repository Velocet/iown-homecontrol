local var_0_0 = require("Overkiz.Timer")
local var_0_1 = require("Overkiz.Time")
local var_0_2 = require("Overkiz.utilities")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_4 = {}
local var_0_5 = {}

function var_0_4.__call(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}

	var_1_0.defaultTimeout = 50
	var_1_0.internalCommandIsShift = 10000
	var_1_0.transportDelegate = {}

	local var_1_1 = {}
	local var_1_2 = {}

	if arg_1_1 == nil or arg_1_2 == nil then
		arg_1_2:error("Monitor: invalid or missing arguments")

		return
	end

	var_1_0.commandManger = arg_1_1

	local function var_1_3(arg_2_0, arg_2_1)
		return tostring(arg_2_0) .. "-" .. tostring(arg_2_1)
	end

	local function var_1_4(arg_3_0)
		local var_3_0 = var_1_1[arg_3_0]

		if var_3_0 == nil then
			arg_1_2:error("Monitor: unknown monitor element key " .. arg_3_0)

			return
		end

		var_3_0.group = nil
		var_3_0.command = nil
		var_3_0.internal = nil

		var_3_0.intervalTimer:stop()

		var_3_0.intervalTimer = nil
		var_1_1[arg_3_0] = nil

		for iter_3_0, iter_3_1 in pairs(var_1_2) do
			if iter_3_1.monitorElementKey == arg_3_0 then
				var_1_2[iter_3_0].monitorElementKey = nil
				var_1_2[iter_3_0] = nil
			end
		end

		arg_1_2:debug("Monitor: monitor element with key " .. arg_3_0 .. " deleted")
	end

	local function var_1_5(arg_4_0)
		local var_4_0 = var_1_2[arg_4_0]

		if var_4_0 == nil then
			arg_1_2:error("Monitor: unknown internal matching key " .. arg_4_0)

			return
		end

		arg_1_2:info("Monitor: delete internal key  \"" .. tostring(var_4_0.monitorElementKey) .. "\"")

		var_4_0.monitorElementKey = nil
		var_1_2[arg_4_0] = nil
	end

	local function var_1_6(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
		local var_5_0 = var_1_3(arg_5_0.id, arg_5_1.id)
		local var_5_1 = {
			group = arg_5_0,
			command = arg_5_1,
			onProgress = arg_5_2,
			internal = {}
		}

		var_5_1.internal.remaining = 0
		var_5_1.internal.number = 0
		var_5_1.internal.progressStatus = var_0_3.progressEvent.DONE
		var_5_1.internal.commandStatus = var_0_3.status.DONE

		if arg_5_3 == nil then
			arg_5_3 = var_1_0.defaultTimeout
		end

		arg_1_2:debug("Monitor server command timeout : " .. arg_5_3 .. " seconds ")

		local var_5_2 = var_0_0.Monotonic()

		var_5_2:setTime(var_0_1.Monotonic(var_0_1.Elapsed(arg_5_3, 0)), true)

		function var_5_2.expired(arg_6_0, arg_6_1)
			arg_1_2:warning("Monitor: timer expired for server command " .. arg_5_1.id .. " of group " .. arg_5_0.id)

			var_5_1.command.status = var_0_3.status.DETAILED_ERROR

			var_5_1:onProgress(var_5_1.group, var_5_1.command, var_0_3.progressEvent.ERROR)
			var_1_4(var_5_0)
		end

		var_5_1.intervalTimer = var_5_2

		var_5_2:start()
		arg_1_2:info("Monitor: add server command with key " .. var_5_0)

		var_1_1[var_5_0] = var_5_1

		return var_1_1[var_5_0]
	end

	function var_1_0.add(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5)
		local var_7_0 = var_1_3(arg_7_1.id, arg_7_2.id)
		local var_7_1 = var_1_1[var_7_0]

		if var_7_1 == nil then
			var_7_1 = var_1_6(arg_7_1, arg_7_2, arg_7_3, arg_7_4)
		else
			arg_1_2:error("Monitor: try to add server command with key " .. var_7_0 .. " (already inserted)")

			arg_7_2.status = var_0_3.status.DETAILED_ERROR

			var_7_1:onProgress(arg_7_1, arg_7_2, var_0_3.progressEvent.ERROR)

			return
		end

		for iter_7_0, iter_7_1 in pairs(arg_7_5) do
			iter_7_1.id = (arg_7_2.id + 1) * var_1_0.internalCommandIsShift + (var_7_1.internal.number + 1)
			var_7_1.internal.number = var_7_1.internal.number + 1
			var_7_1.internal.remaining = var_7_1.internal.remaining + 1

			local var_7_2 = {
				monitorElementKey = var_7_0
			}
			local var_7_3 = var_1_3(arg_7_1.id, iter_7_1.id)

			arg_1_2:debug("   add internal command, key : \"" .. var_7_3 .. "\"")

			var_1_2[var_7_3] = var_7_2
		end

		var_1_0.commandManger:add(var_1_0.transportOriginator, arg_7_1, arg_7_5)
	end

	function var_1_0.dump(arg_8_0)
		for iter_8_0, iter_8_1 in pairs(var_1_1) do
			print("main     : " .. iter_8_0 .. " " .. tostring(iter_8_1))
			print(var_0_2.tableDump(iter_8_1))
		end

		for iter_8_2, iter_8_3 in pairs(var_1_2) do
			print("internal : " .. iter_8_2 .. "---------" .. tostring(iter_8_3))
			print(var_0_2.tableDump(iter_8_3))
		end
	end

	function var_1_0.progress(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
		local var_9_0 = var_1_3(arg_9_1.id, arg_9_2.id)
		local var_9_1 = var_1_2[var_9_0]

		if var_9_1 == nil then
			arg_1_2:error("Monitor: internal command progress, but unable to find internal command Key : \"" .. var_9_0 .. "\"")

			return
		end

		local var_9_2 = var_1_1[var_9_1.monitorElementKey]

		if var_9_2 == nil then
			arg_1_2:error("Monitor: internal command progress, but unable to find server command Key : \"" .. var_9_1.monitorElementKey .. "\"")

			return
		end

		if arg_9_3 == var_0_3.progressEvent.ERROR then
			var_9_2.internal.progressStatus = var_0_3.progressEvent.ERROR
		end

		if arg_9_2.status < var_0_3.status.PENDING then
			var_9_2.internal.commandStatus = arg_9_2.status
		end

		arg_1_2:info("Monitor: internal command progress id=" .. arg_9_2.id .. " (command status=" .. arg_9_2.status .. ")  status=" .. arg_9_3 .. " on group id=" .. arg_9_1.id)

		if arg_9_3 == var_0_3.progressEvent.DONE or arg_9_3 == var_0_3.progressEvent.ERROR or arg_9_3 == var_0_3.progressEvent.DEPRECATED or arg_9_3 == var_0_3.progressEvent.CANCELLED then
			var_9_2.internal.remaining = var_9_2.internal.remaining - 1

			arg_1_2:debug("   remaining " .. var_9_2.internal.remaining .. "/" .. var_9_2.internal.number)

			if var_9_2.internal.remaining > 0 then
				var_9_2.command.status = var_0_3.status.EXECUTING

				var_9_2:onProgress(arg_9_1, var_9_2.command, var_0_3.progressEvent.EXECUTING)
			else
				if var_9_2.internal.progressStatus == var_0_3.progressEvent.ERROR or var_9_2.internal.commandStatus < var_0_3.status.PENDING then
					var_9_2.command.status = var_9_2.internal.commandStatus

					var_9_2:onProgress(arg_9_1, var_9_2.command, var_9_2.internal.progressStatus)
				else
					var_9_2.command.status = arg_9_2.status

					var_9_2:onProgress(arg_9_1, var_9_2.command, arg_9_3)
				end

				var_1_4(var_9_1.monitorElementKey)

				return
			end

			var_1_5(var_9_0)
		else
			var_9_2.command.status = arg_9_2.status

			var_9_2:onProgress(arg_9_1, var_9_2.command, arg_9_3)
			var_9_2.intervalTimer:start()
		end
	end

	return var_1_0
end

setmetatable(var_0_5, var_0_4)

return var_0_5
