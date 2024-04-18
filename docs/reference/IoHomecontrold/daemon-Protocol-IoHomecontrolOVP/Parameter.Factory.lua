local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = require("Overkiz.utilities")
local var_0_3 = require("Overkiz.OOP.Class")()

function var_0_3.new(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1 == nil or arg_1_2 == nil then
		arg_1_2:warning("Parameter factory: invalid or missing arguments")
	end

	arg_1_0.commandManager = arg_1_1
	arg_1_0.log = arg_1_2
	arg_1_0.transportOriginator = {}
	arg_1_0.nodeManager = nil
end

function var_0_3.setNodeManager(arg_2_0, arg_2_1)
	arg_2_0.nodeManager = arg_2_1
end

function var_0_3.createIfParameterDoesNotExist(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = arg_3_0.nodeManager:getNodeParameterInfo(arg_3_2.address)

	if var_3_0 and not var_3_0:lookupParameterById(arg_3_1.id) then
		arg_3_0:create(arg_3_1, arg_3_2, arg_3_3)
	end
end

function var_0_3.create(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if arg_4_1 == nil then
		arg_4_0.log:warning("Parameter factory: nil parameter given on node " .. arg_4_2.address .. " (profile " .. var_0_0.getProfile(arg_4_2) .. ", subProfile " .. var_0_0.getSubProfile(arg_4_2) .. ")")

		return
	end

	local var_4_0 = {
		refreshDef = {}
	}

	if arg_4_3 == nil then
		arg_4_3 = arg_4_1.resync
	else
		arg_4_0.log:info("  extend default converter on parameter " .. arg_4_1.id .. " for node " .. arg_4_2.address)
	end

	if arg_4_3 ~= nil and arg_4_3.dynamicRefresh then
		var_4_0.refreshDef.resync = var_0_2.tableDeepCopy(arg_4_3)

		arg_4_0.log:info("  use dynamic refresh on parameter " .. arg_4_1.id .. " for node " .. arg_4_2.address)
	else
		var_4_0.refreshDef.resync = arg_4_3
	end

	if arg_4_3 ~= nil and arg_4_3.refreshTriggers ~= nil then
		arg_4_0.log:info("  use refresh triggers on parameter " .. arg_4_1.id .. " for node " .. arg_4_2.address)

		arg_4_1.log = arg_4_0.log
	end

	function var_4_0.refreshDef.getRefreshCommands(arg_5_0)
		local var_5_0 = {}

		if var_4_0.refreshDef.resync.infos ~= nil then
			local var_5_1 = #var_5_0

			for iter_5_0, iter_5_1 in pairs(var_4_0.refreshDef.resync.infos) do
				local var_5_2 = var_0_1:buildParameterCommand(arg_4_1, arg_4_2.address, iter_5_1)

				var_5_2.id = var_5_1
				var_5_1 = var_5_1 + 1
				var_5_0[var_5_1] = var_5_2

				arg_4_0.log:info("Refresh parameterInfo " .. var_5_2.parameter .. " of node " .. var_5_2.address)
			end
		else
			local var_5_3 = var_0_1:buildParameterCommand(arg_4_1, arg_4_2.address, var_4_0.refreshDef.resync.info)

			table.insert(var_5_0, var_5_3)
			arg_4_0.log:info("Refresh parameterInfo " .. var_5_3.parameter .. " of node " .. var_5_3.address)
		end

		return var_5_0
	end

	function var_4_0.refreshDef.refresh(arg_6_0)
		local var_6_0 = var_4_0.refreshDef.getRefreshCommands()

		if var_4_0.refreshDef.resync.noBuffer == true then
			arg_4_0.commandManager:add(arg_4_0.transportOriginator, arg_4_0.commandManager:generateGroup(), var_6_0)
		else
			arg_4_0.commandManager:addBufferedCommands(arg_4_0.transportOriginator, var_6_0)
		end
	end

	arg_4_0.log:info("ParameterInfo " .. arg_4_1.id .. " added for node " .. arg_4_2.address)

	var_4_0.id = arg_4_1.id

	if not arg_4_0.nodeManager then
		arg_4_0.log:warning("ParameterInfo nodeManager isn't set")

		return
	end

	local var_4_1 = arg_4_0.nodeManager:getNodeParameterInfo(arg_4_2.address)

	if var_4_1 then
		var_4_1:append(var_4_0)
	end
end

return var_0_3
