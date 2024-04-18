local var_0_0 = require("Overkiz.Timer")
local var_0_1 = require("Overkiz.Time")
local var_0_2 = require("Overkiz.Date")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_5 = require("Overkiz.utilities")
local var_0_6 = require("pl.tablex")
local var_0_7 = require("Overkiz.OOP.Class")
local var_0_8 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Manager")
local var_0_9 = var_0_7()

function var_0_9.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.pendingRefreshes = {}
	arg_1_0.log = arg_1_4
	arg_1_0.nodeManager = arg_1_1
	arg_1_0.mpFpRefreshManager = arg_1_2
	arg_1_0.commandManager = arg_1_3
	arg_1_0.refreshSettings = {
		all = true,
		maxCommandsNumberPerSession = 20,
		startup = true,
		interSessionFreeTime = 1,
		periodic = true,
		periodicMultiplier = 1,
		commandTimeShift = 0
	}
	arg_1_0.refreshNodesTimers = {}

	arg_1_1:on(var_0_8.Events.Node, function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_1 == var_0_3.event.COMPLETED then
			arg_1_0:initNodeRefresh(arg_2_0)
		elseif arg_2_1 == var_0_3.event.UPDATED then
			if arg_2_0.class == var_0_3.class.STACK then
				arg_1_0:configureRefreshSettings(arg_2_0)
			elseif arg_2_2 and not var_0_3.isIntermediateNodeStatus(arg_2_0.status) then
				local var_2_0 = arg_1_0.nodeManager:isPeriodicTimerInitialized(arg_2_0.address)

				if arg_2_0.status == var_0_3.status.Unpaired and var_2_0 then
					arg_1_0.log:notice("[Refresh] Stopping automatic refresh on node " .. arg_2_0.address .. " : invalid key / unpaired status")
					arg_1_0:stopAutomaticRefresh(arg_2_0.address)
				elseif not var_2_0 then
					arg_1_0.log:notice("[Refresh] Restarting automatic refresh on node " .. arg_2_0.address)
					arg_1_0:startAutomaticRefresh(arg_2_0.address)
				end
			end
		elseif arg_2_1 == var_0_3.event.DELETED then
			arg_1_0:stopAutomaticRefresh(arg_2_0.address, true)

			if arg_1_0.refreshNodesTimers[arg_2_0.address] then
				arg_1_0.refreshNodesTimers[arg_2_0.address]:stop()

				arg_1_0.refreshNodesTimers[arg_2_0.address] = nil
			end
		end
	end)
end

function var_0_9.initNodeRefresh(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.nodeManager:getNodeWithExtraDefinition(arg_3_1.address)

	if not var_3_0 then
		arg_3_0.log:error("[Refresh] node completed " .. tostring(arg_3_1.address) .. " is unknown. abort")

		return
	end

	if arg_3_1.class == var_0_3.class.STACK then
		arg_3_0:configureRefreshSettings(arg_3_1)
	end

	local var_3_1 = var_0_0.Monotonic()

	function var_3_1.expired(arg_4_0, arg_4_1)
		arg_3_0.log:info("[Refresh] Refreshing states on node " .. arg_3_1.address)
		arg_3_0:buildRefreshStatesCommands(var_3_0, "onRefreshNode", false)
	end

	arg_3_0.refreshNodesTimers[arg_3_1.address] = var_3_1

	if arg_3_1.status ~= var_0_3.status.Unpaired then
		arg_3_0:startAutomaticRefresh(arg_3_1.address, var_3_0)
	else
		arg_3_0.log:notice("[Refresh] Not starting automatic refresh on node " .. arg_3_1.address .. " : invalid key / unpaired status")
	end
end

function var_0_9.startAutomaticRefresh(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_2

	if not arg_5_2 then
		var_5_0 = arg_5_0.nodeManager:getNodeWithExtraDefinition(arg_5_1)

		if not var_5_0 then
			arg_5_0.log:error("[Refresh] startAutomaticRefresh - node " .. tostring(arg_5_1) .. " is unknown. abort")

			return
		end
	end

	if arg_5_0.refreshSettings.startup then
		arg_5_0.log:notice("[Refresh] Init startup states refresh on node " .. var_5_0.address)
		arg_5_0:buildRefreshStatesCommands(var_5_0, "startup", true)
		arg_5_0:buildRefreshStatesCommands(var_5_0, "onDelayedStart", false)
	else
		arg_5_0.log:info("[Refresh] No startup states refresh on node " .. var_5_0.address .. ": disabled")
	end

	if arg_5_0.refreshSettings.periodic then
		arg_5_0:initPeriodicTimers(var_5_0)
	else
		arg_5_0.log:info("[Refresh] No periodic states refresh on node " .. var_5_0.address .. ": disabled")
	end

	arg_5_0.nodeManager:setPeriodicTimerInitializedStatus(var_5_0.address, true)
end

function var_0_9.stopAutomaticRefresh(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.nodeManager:getNodeParameterInfo(arg_6_1)

	for iter_6_0, iter_6_1 in pairs(var_6_0 and var_6_0:getAll() or {}) do
		if iter_6_1.refreshDef ~= nil and iter_6_1.refreshDef.intervalTimer ~= nil then
			arg_6_0.log:debug("[Refresh] Stop timers on refreshDef " .. iter_6_1.id .. " of node " .. arg_6_1)
			iter_6_1.refreshDef.intervalTimer:stop()

			iter_6_1.refreshDef.intervalTimer = nil
		end

		if arg_6_2 then
			iter_6_1.refreshDef = nil
		end
	end

	arg_6_0.nodeManager:setPeriodicTimerInitializedStatus(arg_6_1, false)
end

function var_0_9.initNodesRefresh(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.nodeManager:getNodes()) do
		arg_7_0:initNodeRefresh(iter_7_1)
	end
end

function var_0_9.refreshAll(arg_8_0)
	if arg_8_0.refreshSettings.all then
		arg_8_0.log:notice("[Refresh] Refresh all nodes")

		for iter_8_0, iter_8_1 in pairs(arg_8_0.nodeManager:getNodes()) do
			local var_8_0 = arg_8_0.nodeManager:getNodeWithExtraDefinition(iter_8_1.address)

			arg_8_0:buildRefreshStatesCommands(var_8_0, "oncommand", true)
		end
	else
		arg_8_0.log:info("[Refresh] No refresh all: disabled")
	end
end

function var_0_9.refreshStates(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.nodeManager:getNodeWithExtraDefinition(arg_9_1)

	if var_9_0 ~= nil then
		if arg_9_2 ~= nil and arg_9_0.refreshSettings.commandTimeShift ~= nil and arg_9_0.refreshSettings.commandTimeShift > 0 then
			arg_9_0.log:debug("[Refresh] Applying command refresh time shift of " .. arg_9_0.refreshSettings.commandTimeShift .. " seconds")

			arg_9_2.seconds = arg_9_2.seconds + arg_9_0.refreshSettings.commandTimeShift
		end

		local var_9_1 = arg_9_0.refreshNodesTimers[tonumber(arg_9_1)]

		if var_9_1 and var_9_1:isRunning() then
			local var_9_2 = var_9_1:getTime()

			if arg_9_2 == nil or arg_9_2 < var_9_2 then
				var_9_1:stop()
				arg_9_0.log:debug("[Refresh] Shorter refresh asked")
			else
				return
			end
		end

		local var_9_3 = var_0_1.Monotonic.now()

		if arg_9_2 == nil or arg_9_2 <= var_9_3 then
			arg_9_0.log:info("[Refresh] Refreshing states on node " .. arg_9_1)
			arg_9_0:buildRefreshStatesCommands(var_9_0, "onRefreshNode", false)
		else
			arg_9_0.log:debug("[Refresh] Planning refresh states on node " .. arg_9_1 .. " (target time: " .. arg_9_2.seconds .. ")")

			if var_9_1 then
				var_9_1:setTime(arg_9_2, false)
				var_9_1:start()
			end
		end
	else
		arg_9_0.log:warning("[Refresh] Could not refresh states of node " .. arg_9_1 .. " (unknown node)")
	end
end

function var_0_9.buildRefreshStatesCommands(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	local var_10_0 = {}

	arg_10_0.mpFpRefreshManager:setNode(arg_10_1.address)

	local var_10_1 = {}
	local var_10_2 = arg_10_0.nodeManager:getNodeParameterInfo(arg_10_1.address)

	for iter_10_0, iter_10_1 in pairs(var_10_2 and var_10_2:getAll() or {}) do
		if arg_10_0:isRefreshActivated(iter_10_1) then
			local var_10_3 = true

			if iter_10_1.refreshDef.resync.isRefreshable ~= nil and iter_10_1.refreshDef.resync.isRefreshable() == false then
				arg_10_0.log:debug("[Refresh]  parameter '" .. iter_10_1.id .. "' of node " .. arg_10_1.address .. " has a condition which is not satisfied. Do not refresh it.")

				var_10_3 = false
			end

			if iter_10_1.refreshDef.resync[arg_10_2] and var_10_3 then
				if arg_10_2 == "onDelayedStart" then
					local function var_10_4()
						arg_10_0.log:debug("[Refresh] onDelayedStart refresh timeout expired for parameter " .. iter_10_1.id .. " of node " .. arg_10_1.address)

						if arg_10_0:isRefreshActivated(iter_10_1) then
							iter_10_1.refreshDef:refresh()
						end

						return false
					end

					local var_10_5 = math.random(iter_10_1.refreshDef.resync.onDelayedStart.randomRange * 60)

					if iter_10_1.refreshDef.periodicMultiplier ~= nil then
						var_10_5 = var_10_5 * iter_10_1.refreshDef.periodicMultiplier
					end

					arg_10_0.log:debug("[Refresh] onDelayedStart delayed of " .. tostring(var_10_5) .. "s for parameter " .. iter_10_1.id .. " of node " .. arg_10_1.address)
					var_0_0.Timeout(var_0_1.Elapsed(var_10_5, 0), var_10_4)
				elseif iter_10_1.refreshDef.resync.supportMpFp == true then
					local var_10_6 = {
						id = iter_10_1.id
					}

					if iter_10_1.refreshDef.info ~= nil then
						var_10_6.value = iter_10_1.refreshDef.resync.info.value
					end

					arg_10_0.mpFpRefreshManager:addParameter(var_10_6)
				else
					for iter_10_2, iter_10_3 in ipairs(iter_10_1.refreshDef:getRefreshCommands()) do
						iter_10_3.id = #var_10_0

						table.insert(var_10_0, iter_10_3)

						var_10_1[iter_10_3.id] = var_0_4.status.PENDING
					end
				end
			end
		end
	end

	local var_10_7 = arg_10_0.mpFpRefreshManager:send(arg_10_3, arg_10_4)
	local var_10_8

	if var_10_7 ~= nil then
		var_10_8 = {
			[var_10_7.id] = var_10_7.commands
		}
	end

	if #var_10_0 == 0 then
		return var_10_8
	end

	if arg_10_3 then
		arg_10_0.commandManager:addBufferedCommands(nil, var_10_0)
	else
		if var_10_8 == nil then
			var_10_8 = {}
		end

		local var_10_9 = arg_10_0.commandManager:generateGroup()

		var_10_8[var_10_9.id] = var_10_1

		arg_10_0.commandManager:add(arg_10_4, var_10_9, var_10_0)

		return var_10_8
	end
end

function var_0_9.refreshStatesWithFeedback(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.nodeManager:getNodeByAddress(tonumber(arg_12_1))

	if var_12_0 == nil then
		arg_12_0.log:error("[RefreshManager] Unable to refresh states on node " .. arg_12_1 .. " : unknown node")
		arg_12_2(false)

		return
	end

	local var_12_1 = arg_12_0:buildRefreshStatesCommands(var_12_0, "onRefreshNode", false, {
		functionalDelegate = arg_12_0
	})

	if var_12_1 == nil then
		arg_12_0.log:error("[RefreshManager] Nothing to refresh on node " .. arg_12_1)
		arg_12_2(false)

		return
	end

	local var_12_2 = {
		groups = var_12_1,
		callback = arg_12_2
	}

	for iter_12_0, iter_12_1 in pairs(var_12_1) do
		arg_12_0.pendingRefreshes[iter_12_0] = var_12_2
	end
end

function var_0_9.progress(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.log:debug("[RefreshManager] Progress received on group " .. arg_13_1.id .. ", command " .. arg_13_2.id .. " with status " .. arg_13_2.status)

	local var_13_0 = arg_13_0.pendingRefreshes[arg_13_1.id]

	if var_13_0 ~= nil then
		if var_13_0.groups[arg_13_1.id][arg_13_2.id] == nil then
			arg_13_0.log:warning("[RefreshManager] Invalid progress received : unknown command " .. arg_13_2.id .. " on group " .. arg_13_1.id)

			return
		end

		var_13_0.groups[arg_13_1.id][arg_13_2.id] = arg_13_2.status
	else
		arg_13_0.log:warning("[RefreshManager] Invalid progress received : unknown group " .. arg_13_1.id)

		return
	end

	local var_13_1 = true
	local var_13_2 = false

	for iter_13_0, iter_13_1 in pairs(var_13_0.groups) do
		for iter_13_2, iter_13_3 in pairs(iter_13_1) do
			if not var_0_4.isFinalStatus(iter_13_3) then
				var_13_1 = false

				break
			end

			if iter_13_3 ~= var_0_4.status.DONE and iter_13_3 ~= var_0_4.status.DETAILED_ERROR then
				var_13_2 = true
			end
		end

		if not var_13_1 then
			break
		end
	end

	if var_13_1 then
		if var_13_2 then
			arg_13_0.log:debug("[RefreshManager] Refresh error on group " .. arg_13_1.id)
			var_13_0.callback(false)
		else
			arg_13_0.log:debug("[RefreshManager] Refresh success on group " .. arg_13_1.id)
			var_13_0.callback(true)
		end

		for iter_13_4, iter_13_5 in pairs(var_13_0.groups) do
			arg_13_0.log:debug("[RefreshManager] Cleaning group " .. iter_13_4)

			arg_13_0.pendingRefreshes[iter_13_4] = nil
		end
	end
end

function var_0_9.isSameTechnicalRefresh(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_1.refreshDef and arg_14_1.refreshDef.resync then
		if not arg_14_1.refreshDef.resync.technical or not arg_14_2 then
			return false
		end

		for iter_14_0, iter_14_1 in pairs(arg_14_2) do
			for iter_14_2, iter_14_3 in pairs(arg_14_1.refreshDef.resync.technical) do
				if iter_14_1 == iter_14_3 then
					return true
				end
			end
		end
	end

	return false
end

function var_0_9.isRefreshActivated(arg_15_0, arg_15_1)
	if arg_15_1.refreshDef and arg_15_1.refreshDef.resync then
		if not arg_15_1.refreshDef.resync.technical then
			return true
		end

		if arg_15_0:isSameTechnicalRefresh(arg_15_1, arg_15_0.refreshSettings.technical) then
			return true
		end
	end

	return false
end

function var_0_9.initPeriodicTimers(arg_16_0, arg_16_1)
	arg_16_0.log:notice("[Refresh] Start periodic states refresh on node " .. arg_16_1.address)

	local var_16_0 = arg_16_0.nodeManager:getNodeParameterInfo(arg_16_1.address)

	for iter_16_0, iter_16_1 in pairs(var_16_0 and var_16_0:getAll() or {}) do
		if iter_16_1.refreshDef ~= nil and iter_16_1.refreshDef.resync ~= nil then
			if iter_16_1.refreshDef.resync.interval ~= nil and iter_16_1.refreshDef.intervalTimer == nil and arg_16_0:isRefreshActivated(iter_16_1) then
				local var_16_1 = var_0_0.Monotonic()

				var_16_1.node = arg_16_1
				var_16_1.parameter = iter_16_1.id

				if arg_16_0.refreshSettings.periodicMultiplier ~= nil and arg_16_0.refreshSettings.periodicMultiplier ~= 1 then
					local var_16_2 = iter_16_1.refreshDef.resync.interval.seconds * arg_16_0.refreshSettings.periodicMultiplier

					var_16_1:setTime(var_0_1.Monotonic(var_0_1.Elapsed(var_16_2, 0)), true)
					arg_16_0.log:debug("     Start timer on refreshDef " .. iter_16_1.id .. " of node " .. arg_16_1.address .. " with time " .. var_16_2 .. " (multiplier is " .. arg_16_0.refreshSettings.periodicMultiplier .. ")")
				else
					var_16_1:setTime(iter_16_1.refreshDef.resync.interval, true)
					arg_16_0.log:debug("     Start timer on refreshDef " .. iter_16_1.id .. " of node " .. arg_16_1.address .. " with time " .. iter_16_1.refreshDef.resync.interval.seconds)
				end

				function var_16_1.expired()
					arg_16_0.log:debug("[Refresh] Interval timer expired")

					if iter_16_1.refreshDef.resync.isRefreshable ~= nil and iter_16_1.refreshDef.resync.isRefreshable() == false then
						arg_16_0.log:warning("Periodic refreshing of parameter '" .. iter_16_1.id .. "' of node " .. arg_16_1.address .. " has a condition which is not satisfied. Not sending.")
					else
						iter_16_1.refreshDef:refresh()
					end

					if iter_16_1.refreshDef.resync.onceOnly ~= true then
						var_16_1:start()
					else
						arg_16_0.log:info("   Refresh was asked only once, stopping timer on refreshDef " .. iter_16_1.id .. " of node " .. arg_16_1.address)
					end
				end

				iter_16_1.refreshDef.intervalTimer = var_16_1

				if iter_16_1.refreshDef.resync.delayedIntervalStart ~= true then
					iter_16_1.refreshDef.intervalTimer:start()
				end
			elseif iter_16_1.refreshDef.resync.onRecurrence ~= nil and iter_16_1.refreshDef.intervalTimer == nil and arg_16_0:isRefreshActivated(iter_16_1) then
				local function var_16_3(arg_18_0, arg_18_1)
					local var_18_0 = arg_18_1.monthday or nil
					local var_18_1 = arg_18_1.weekday or nil
					local var_18_2 = arg_18_1.hour or 0
					local var_18_3 = arg_18_1.minute or 0

					if not arg_18_1.recurrenceMinute then
						local var_18_4 = arg_18_1.randomRange or 60

						arg_18_1.recurrenceMinute = var_18_2 * 60 + var_18_3 + math.random(var_18_4)
					end

					local var_18_5 = math.floor(arg_18_1.recurrenceMinute / 60)
					local var_18_6 = math.fmod(arg_18_1.recurrenceMinute, 60)
					local var_18_7 = math.random(60)
					local var_18_8 = var_0_1.Real.now()
					local var_18_9 = var_0_2.Locale(var_18_8)
					local var_18_10 = var_0_2.Absolute(var_18_9)
					local var_18_11

					if arg_18_1.monthday then
						var_18_11 = var_18_10:next(var_0_2.Relative.Month(var_18_0, var_18_5, var_18_6, var_18_7, 0))
					elseif arg_18_1.weekday then
						var_18_11 = var_18_10:next(var_0_2.Relative.Week(var_18_1, var_18_5, var_18_6, var_18_7, 0))
					else
						var_18_11 = var_18_10:next(var_0_2.Relative.Day(var_18_5, var_18_6, var_18_7, 0))
					end

					var_18_9:set(var_18_11)
					var_18_8:set(var_18_9)
					arg_18_0:setTime(var_18_8, false)
					arg_18_0:start()
					arg_16_0.log:debug("[Refresh] onRecurrence refresh scheduled in " .. var_18_8.seconds - var_0_1.Real.now().seconds .. "s for parameter " .. iter_16_1.id .. " of node " .. arg_16_1.address)
				end

				local var_16_4 = var_0_0.Real()

				function var_16_4.expired(arg_19_0, arg_19_1)
					arg_16_0.log:debug("[Refresh] onRecurrence refresh timer expired at " .. tostring(arg_19_1) .. " for parameter " .. iter_16_1.id .. " of node " .. arg_16_1.address)
					iter_16_1.refreshDef:refresh()
					var_16_3(arg_19_0, iter_16_1.refreshDef.resync.onRecurrence)
				end

				var_16_3(var_16_4, iter_16_1.refreshDef.resync.onRecurrence)

				iter_16_1.refreshDef.intervalTimer = var_16_4
			end
		end
	end
end

function var_0_9.resumePeriodicTimer(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	local var_20_0 = arg_20_0.nodeManager:getNodeParameterInfo(arg_20_1.address)

	if not var_20_0 then
		arg_20_0.log:warning("[Refresh] no parameter info associated to node " .. tostring(arg_20_1.address))

		return
	end

	local var_20_1 = var_20_0:lookupParameterByStateIdAndData(arg_20_2, arg_20_3)

	if var_20_1 and var_20_1.refreshDef then
		local var_20_2 = var_20_1.refreshDef.intervalTimer

		if var_20_2 ~= nil and var_20_2:isRunning() then
			arg_20_0.log:debug("[Refresh] New state received, restart periodic timer on refreshDef " .. var_20_1.id .. " of node " .. arg_20_1.address)
			var_20_2:stop()
			var_20_2:start()
		end
	end
end

function var_0_9.FilterSettingsActivation(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local var_21_0 = {}

	if arg_21_1.technical then
		for iter_21_0, iter_21_1 in pairs(arg_21_1.technical) do
			local var_21_1 = true

			if arg_21_2.technical then
				for iter_21_2, iter_21_3 in pairs(arg_21_2.technical) do
					if iter_21_1 == iter_21_3 then
						var_21_1 = false

						break
					end
				end
			end

			if var_21_1 then
				table.insert(var_21_0, iter_21_1)

				if arg_21_3 then
					arg_21_0.log:notice("[Refresh] Enabling " .. iter_21_1 .. " technical service.")
				else
					arg_21_0.log:notice("[Refresh] Disabling " .. iter_21_1 .. " technical service.")
				end
			end
		end
	end

	return var_21_0
end

function var_0_9.configureRefreshSettings(arg_22_0, arg_22_1)
	arg_22_0.log:info("[Refresh] New settings received")

	local var_22_0 = arg_22_0.nodeManager:getNodeWithExtraDefinition(arg_22_1.address)

	if not var_22_0 then
		arg_22_0.log:error("No stack node " .. tostring(arg_22_1.address))

		return
	end

	local var_22_1 = var_22_0.settings

	if type(var_22_1) ~= "table" then
		arg_22_0.log:warning("Invalid settings: not a table")

		return
	end

	if not var_22_1.refresh then
		arg_22_0.log:info("Settings doesn't contain refresh attribute")

		return
	end

	if var_0_5.tableCompare(var_22_1.refresh, arg_22_0.refreshSettings) then
		arg_22_0.log:info("    no change detected in settings")

		return
	end

	local var_22_2 = var_0_5.tableDeepCopy(arg_22_0.refreshSettings)

	if var_22_1.refresh.startup ~= nil then
		arg_22_0.log:notice("[Refresh] Startup refresh status: " .. tostring(var_22_1.refresh.startup))

		arg_22_0.refreshSettings.startup = var_22_1.refresh.startup
	end

	if var_22_1.refresh.all ~= nil then
		arg_22_0.log:notice("[Refresh] Refresh all status: " .. tostring(var_22_1.refresh.all))

		arg_22_0.refreshSettings.all = var_22_1.refresh.all
	end

	if var_22_1.refresh.commandTimeShift ~= nil then
		if type(var_22_1.refresh.commandTimeShift) ~= "number" or var_22_1.refresh.commandTimeShift < 0 then
			arg_22_0.log:warning("[Refresh] Invalid command refresh time shift " .. tostring(var_22_1.refresh.commandTimeShift) .. ": should be a positive number (or 0)")
		else
			arg_22_0.log:notice("[Refresh] Command refresh time shift: " .. tostring(var_22_1.refresh.commandTimeShift))

			arg_22_0.refreshSettings.commandTimeShift = var_22_1.refresh.commandTimeShift
		end
	end

	if var_22_1.refresh.periodic ~= nil and var_22_1.refresh.periodic ~= arg_22_0.refreshSettings.periodic then
		arg_22_0.refreshSettings.periodic = var_22_1.refresh.periodic

		if var_22_1.refresh.periodic then
			arg_22_0.log:notice("[Refresh] Enabling global periodic refresh")

			for iter_22_0, iter_22_1 in pairs(arg_22_0.nodeManager:getNodes()) do
				arg_22_0:startAutomaticRefresh(iter_22_1.address)
			end
		else
			arg_22_0.log:notice("[Refresh] Disabling global periodic refresh")

			for iter_22_2, iter_22_3 in pairs(arg_22_0.nodeManager:getNodes()) do
				arg_22_0:stopAutomaticRefresh(iter_22_3.address)
			end
		end
	end

	if (var_22_1.refresh.technical or arg_22_0.refreshSettings.technical) and var_22_1.refresh.technical ~= arg_22_0.refreshSettings.technical then
		local var_22_3 = arg_22_0:FilterSettingsActivation(var_22_1.refresh, arg_22_0.refreshSettings, true)
		local var_22_4 = arg_22_0:FilterSettingsActivation(arg_22_0.refreshSettings, var_22_1.refresh, false)

		arg_22_0.refreshSettings.technical = var_22_1.refresh.technical

		for iter_22_4, iter_22_5 in pairs(arg_22_0.nodeManager:getNodes()) do
			local var_22_5 = arg_22_0.nodeManager:getNodeParameterInfo(iter_22_5.address)

			if #var_22_4 > 0 then
				for iter_22_6, iter_22_7 in pairs(var_22_5 and var_22_5:getAll() or {}) do
					if arg_22_0:isSameTechnicalRefresh(iter_22_7, var_22_4) and iter_22_7.refreshDef.intervalTimer ~= nil and arg_22_0:isRefreshActivated(iter_22_7) == false then
						iter_22_7.refreshDef.intervalTimer:stop()

						iter_22_7.refreshDef.intervalTimer = nil
					end
				end
			end

			if #var_22_3 > 0 then
				for iter_22_8, iter_22_9 in pairs(var_22_5 and var_22_5:getAll() or {}) do
					if arg_22_0:isSameTechnicalRefresh(iter_22_9, var_22_3) then
						arg_22_0:startAutomaticRefresh(iter_22_5.address)

						break
					end
				end
			end
		end
	end

	if var_22_1.refresh.periodicMultiplier ~= nil and var_22_1.refresh.periodicMultiplier ~= arg_22_0.refreshSettings.periodicMultiplier then
		if type(var_22_1.refresh.periodicMultiplier) ~= "number" or var_22_1.refresh.periodicMultiplier <= 0 then
			arg_22_0.log:warning("[Refresh] Invalid periodic refresh multiplier " .. tostring(var_22_1.refresh.periodicMultiplier) .. ": should be a positive number")
		else
			arg_22_0.log:notice("[Refresh] Updating periodic refresh multiplier from " .. arg_22_0.refreshSettings.periodicMultiplier .. " to " .. var_22_1.refresh.periodicMultiplier)

			arg_22_0.refreshSettings.periodicMultiplier = var_22_1.refresh.periodicMultiplier

			for iter_22_10, iter_22_11 in pairs(arg_22_0.nodeManager:getNodes()) do
				local var_22_6 = arg_22_0.nodeManager:getNodeParameterInfo(iter_22_11.address)

				for iter_22_12, iter_22_13 in pairs(var_22_6 and var_22_6:getAll() or {}) do
					if iter_22_13.refreshDef ~= nil and iter_22_13.refreshDef.intervalTimer ~= nil then
						local var_22_7 = false

						if iter_22_13.refreshDef.intervalTimer:isRunning() then
							iter_22_13.refreshDef.intervalTimer:stop()

							var_22_7 = true
						end

						if iter_22_13.refreshDef.resync.interval then
							local var_22_8 = iter_22_13.refreshDef.resync.interval.seconds * arg_22_0.refreshSettings.periodicMultiplier

							iter_22_13.refreshDef.intervalTimer:setTime(var_0_1.Monotonic(var_0_1.Elapsed(var_22_8, 0)), true)
							arg_22_0.log:debug("      Update timer value on refreshDef " .. iter_22_13.id .. " of node " .. iter_22_11.address .. " to " .. var_22_8)
						end

						if var_22_7 then
							iter_22_13.refreshDef.intervalTimer:start()
							arg_22_0.log:debug("           restart timer")
						end
					end
				end
			end
		end
	end

	if var_22_1.refresh.maxCommandsNumberPerSession ~= nil then
		if type(var_22_1.refresh.maxCommandsNumberPerSession) ~= "number" or var_22_1.refresh.maxCommandsNumberPerSession <= 0 then
			arg_22_0.log:warning("[Refresh] Invalid maximum number of commands per session " .. tostring(var_22_1.refresh.maxCommandsNumberPerSession) .. ": should be a positive number")
		else
			arg_22_0.log:notice("[Refresh] Maximum number of commands per session : " .. tostring(var_22_1.refresh.maxCommandsNumberPerSession))

			arg_22_0.refreshSettings.maxCommandsNumberPerSession = arg_22_0.commandManager:setMaxCommandsNumberPerSession(var_22_1.refresh.maxCommandsNumberPerSession)
		end
	end

	if var_22_1.refresh.interSessionFreeTime ~= nil then
		if type(var_22_1.refresh.interSessionFreeTime) ~= "number" or var_22_1.refresh.interSessionFreeTime <= 0 then
			arg_22_0.log:warning("[Refresh] Inter session free time " .. tostring(var_22_1.refresh.interSessionFreeTime) .. ": should be a positive number")
		else
			arg_22_0.log:notice("[Refresh] Inter session free time : " .. tostring(var_22_1.refresh.interSessionFreeTime))

			arg_22_0.refreshSettings.interSessionFreeTime = arg_22_0.commandManager:setInterSessionFreeTime(var_22_1.refresh.interSessionFreeTime)
		end
	end

	if var_0_5.tableCompare(var_22_2, arg_22_0.refreshSettings) then
		arg_22_0.log:warning("[Refresh] Some settings have not been processed:")

		local var_22_9 = var_0_6.difference(var_22_2, var_22_1.refresh, true)

		for iter_22_14, iter_22_15 in pairs(var_22_9) do
			arg_22_0.log:warning("  setting " .. iter_22_14 .. " (value = " .. tostring(iter_22_15) .. ") is unsupported")
		end

		return
	end

	arg_22_1.settings = {
		refresh = arg_22_0.refreshSettings
	}

	arg_22_0.nodeManager:modifyNode(arg_22_1, var_0_3.action.UPDATE)
end

return var_0_9
