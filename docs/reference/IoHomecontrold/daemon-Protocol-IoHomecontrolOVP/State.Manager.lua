local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.State.stateModel")
local var_0_2 = require("Overkiz.Subject")
local var_0_3 = require("Overkiz.utilities")
local var_0_4 = require("Overkiz.OOP.Class")
local var_0_5 = require("Overkiz.EventEmitter")
local var_0_6 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Manager")
local var_0_7 = var_0_4(var_0_5, var_0_2)

var_0_7.events = {
	RAW_DATA = "RAW_DATA"
}

function var_0_7.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	var_0_2.new(arg_1_0)
	var_0_5.new(arg_1_0)

	if arg_1_1 == nil or arg_1_2 == nil or arg_1_4 == nil then
		arg_1_4:warning("State Manager: invalid or missing arguments")
	end

	arg_1_0._nodeManager = arg_1_1
	arg_1_0._refreshManager = arg_1_2
	arg_1_0._oneWayEventManager = arg_1_3
	arg_1_0._log = arg_1_4
	arg_1_0.rawStates = {}

	arg_1_0._nodeManager:on(var_0_6.Events.Node, function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_1 == var_0_0.event.DELETED then
			for iter_2_0, iter_2_1 in pairs(arg_1_0.rawStates) do
				if iter_2_1.nodeAddress == arg_2_0.address then
					arg_1_0.rawStates[iter_2_0] = nil
				end
			end
		end
	end)
	arg_1_0:loadStatesFromKeyValueStore()
end

function var_0_7.loadStatesFromKeyValueStore(arg_3_0)
	local var_3_0 = arg_3_0._nodeManager:getNodesByStatus(var_0_0.status.Unpaired)

	for iter_3_0, iter_3_1 in pairs(var_3_0) do
		for iter_3_2, iter_3_3 in pairs(iter_3_1.keyValueStore or {}) do
			local var_3_1 = var_0_1.getParameterIdFromKey(iter_3_2)

			if var_3_1 then
				arg_3_0._log:debug("Load state " .. var_3_1 .. " from node " .. iter_3_1.address .. " keyvalue store")
				arg_3_0:modified({
					address = iter_3_1.address,
					value = iter_3_3,
					parameter = var_3_1
				})
			else
				arg_3_0._log:warning("keyValueStore: unknown key " .. iter_3_2)
			end
		end
	end
end

function var_0_7.refreshNodeStates(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._refreshManager:refreshStates(arg_4_1, arg_4_2)
end

function var_0_7.refreshAll(arg_5_0)
	arg_5_0._refreshManager:refreshAll()
end

function var_0_7.oneWayActivateFuncIntercepted(arg_6_0, arg_6_1)
	if arg_6_0._oneWayEventManager == nil then
		arg_6_0._log:error("[StateManager] undefined self._oneWayEventManager")

		return
	end

	arg_6_0._oneWayEventManager:oneWayActivateFuncIntercepted(arg_6_1)
end

function var_0_7.externalControllerActivateAck(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_0._oneWayEventManager == nil then
		arg_7_0._log:error("[StateManager] undefined self._oneWayEventManager")

		return
	end

	arg_7_0._oneWayEventManager:externalControllerActivateAck(arg_7_1, arg_7_2)
end

function var_0_7.oneWayConfigIntercepted(arg_8_0, arg_8_1)
	if arg_8_0._oneWayEventManager == nil then
		arg_8_0._log:error("[StateManager] undefined oneWayEventManager")

		return
	end

	arg_8_0._oneWayEventManager:oneWayConfigIntercepted(arg_8_1)
end

function var_0_7.getRawStates(arg_9_0)
	return var_0_3.tableDeepCopy(arg_9_0.rawStates)
end

function var_0_7.getStates(arg_10_0)
	return arg_10_0.rawStates
end

function var_0_7.getRawStatesValues(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = {}

	for iter_11_0 in pairs(arg_11_2) do
		local var_11_1 = arg_11_0.rawStates[tostring(arg_11_1) .. "#" .. tostring(iter_11_0)]

		if var_11_1 then
			var_11_0[iter_11_0] = var_11_1.value.data
		end
	end

	return var_11_0
end

function var_0_7.modified(arg_12_0, arg_12_1)
	arg_12_0._log:debug("New state " .. arg_12_1.parameter .. " received for node " .. arg_12_1.address .. " type " .. tostring(arg_12_1.value.type) .. " value " .. tostring(arg_12_1.value.data))

	local var_12_0 = arg_12_0._nodeManager:getNodeWithExtraDefinition(arg_12_1.address)

	if var_12_0 == nil then
		arg_12_0._log:debug("Ignoring state (unknown node)")

		return
	end

	arg_12_0._refreshManager:resumePeriodicTimer(var_12_0, arg_12_1.parameter, arg_12_1.value.data)

	local var_12_1 = tostring(arg_12_1.address) .. "#" .. tostring(arg_12_1.parameter)
	local var_12_2 = arg_12_0.rawStates[var_12_1]
	local var_12_3
	local var_12_4 = false

	if not var_12_2 then
		var_12_4 = true
	elseif var_12_2.value.type ~= arg_12_1.value.type or var_12_2.value.data ~= arg_12_1.value.data then
		var_12_4 = true
	elseif arg_12_1.time.seconds > var_12_2.lastRefresh.seconds + 2 then
		if arg_12_1.time.seconds == var_12_2.lastRefresh.seconds + 3 then
			if arg_12_1.time.nanoseconds > var_12_2.lastRefresh.nanoseconds then
				var_12_4 = true
			end
		else
			var_12_4 = true
		end
	end

	if var_12_4 then
		arg_12_0:emit(var_0_7.events.RAW_DATA, arg_12_1)

		local var_12_5 = arg_12_0._nodeManager:getNodeParameterInfo(var_12_0.address)

		if not var_12_5 then
			arg_12_0._log:debug("Node " .. tostring(var_12_0.address) .. " doesn't contain parameterInfos")

			return
		end

		local var_12_6 = var_12_5:lookupParameterByStateIdAndData(arg_12_1.parameter, arg_12_1.value.data)

		if var_12_6 and var_12_6.refreshDef and var_12_6.refreshDef.resync and var_12_6.refreshDef.resync.refreshTriggers then
			if var_12_2 then
				var_12_3 = var_12_2.value
			end

			arg_12_0._log:info("Launching refresh triggers on parameter " .. arg_12_1.parameter .. " for node " .. arg_12_1.address)
			var_12_6.refreshDef.resync.refreshTriggers(var_12_3, arg_12_1.value, var_12_5)
		end

		local var_12_7 = var_0_1.keyValueStoreEntries[arg_12_1.parameter]

		if var_12_7 then
			if not var_12_0.keyValueStore then
				var_12_0.keyValueStore = {}
			end

			if var_12_0.keyValueStore[var_12_7] ~= arg_12_1.value then
				var_12_0.keyValueStore[var_12_7] = arg_12_1.value

				arg_12_0._log:debug("Save state " .. arg_12_1.parameter .. " to node " .. var_12_0.address .. " keyvaluestore.")
				arg_12_0._nodeManager:modifyNode(var_12_0, var_0_0.action.UPDATE_OR_CREATE)
			end
		end

		if not var_12_2 then
			arg_12_0.rawStates[var_12_1] = {}
			var_12_2 = arg_12_0.rawStates[var_12_1]
		end

		var_12_2.value = arg_12_1.value
		var_12_2.lastRefresh = arg_12_1.time
		var_12_2.nodeAddress = arg_12_1.address
		var_12_2.rawStateId = arg_12_1.parameter

		local var_12_8 = {
			nodeAddress = arg_12_1.address,
			rawStateId = arg_12_1.parameter,
			rawStatevalue = arg_12_1.value.data
		}

		arg_12_0._log:debug("State " .. arg_12_1.parameter .. " of node " .. arg_12_1.address .. " updated")
		arg_12_0:notify(var_12_8)
	else
		arg_12_0._log:debug("Ignoring state (recent value already saved)")
	end
end

return var_0_7
