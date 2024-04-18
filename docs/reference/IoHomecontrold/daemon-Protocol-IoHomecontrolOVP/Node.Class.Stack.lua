local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Class.Abstract")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Misc")
local var_0_4 = require("Overkiz.Type.ByteArray")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.stacksHandler")
local var_0_6 = require("Overkiz.utilities")
local var_0_7 = var_0_0(var_0_1)
local var_0_8 = 16
local var_0_9 = var_0_4(var_0_8)
local var_0_10 = {
	"address",
	"backbone",
	"class",
	"type",
	"manufacturer"
}

local function var_0_11(arg_1_0)
	return arg_1_0 == var_0_9
end

function var_0_7.new(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	var_0_1.new(arg_2_0, arg_2_1, "stack", arg_2_2, arg_2_3)

	arg_2_0.Events.StackMasterKeyChanged = "StackMasterKeyChanged"
	arg_2_0.Events.StackMasterOldKeyChanged = "StackMasterOldKeyChanged"
end

function var_0_7.format(arg_3_0)
	return {
		address = arg_3_0.address,
		backbone = arg_3_0.backbone,
		class = arg_3_0.class,
		type = arg_3_0.type,
		manufacturer = arg_3_0.manufacturer,
		key = arg_3_0.key,
		oldKey = arg_3_0.oldKey,
		settings = arg_3_0.settings,
		systemLink = arg_3_0.systemLink,
		status = arg_3_0.status
	}
end

function var_0_7.fromStorage(arg_4_0, arg_4_1)
	return {
		address = arg_4_1.address,
		backbone = arg_4_1.backbone,
		class = arg_4_1.class,
		type = arg_4_1.type,
		manufacturer = arg_4_1.manufacturer,
		key = arg_4_1.key,
		oldKey = arg_4_1.oldKey,
		status = arg_4_1.status,
		systemLink = arg_4_1.systemLink,
		settings = arg_4_1.settings
	}
end

function var_0_7.getUnchangedAttributes(arg_5_0)
	return var_0_10
end

function var_0_7.nodeCreate(arg_6_0, arg_6_1)
	if arg_6_0:getStack() then
		arg_6_0._log:error("[Stack] we can only have one stack")

		return false
	end

	local var_6_0 = arg_6_1.backbone

	if var_6_0 == 0 then
		var_6_0 = var_0_5:getAvailableBackboneAddress()

		if var_6_0 == 0 then
			var_6_0 = arg_6_1.address
		end
	end

	if var_6_0 ~= arg_6_1.backbone then
		arg_6_1.backbone = var_6_0

		arg_6_0._log:notice("[Stack] Update backbone address of " .. tostring(arg_6_1.address) .. " with " .. tostring(arg_6_1.backbone))
	end

	arg_6_0:saveNode(arg_6_1)
	arg_6_0._log:notice("[Stack] Create " .. tostring(arg_6_1.address) .. " with status " .. var_0_3.statusToVerbose(arg_6_1.status))
	arg_6_0:emit(arg_6_0.Events.Create, arg_6_0:fromStorage(arg_6_1), true)
	arg_6_0:modifyNode(arg_6_1, var_0_2.action.COMPLETE)
	var_0_5:stackCreated()

	return true
end

function var_0_7.nodeUpdate(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0:getStack()

	if not var_7_0 then
		arg_7_0._log:notice("[Stack] " .. tostring(var_7_0.address) .. " isn't a stack")

		return false
	end

	local var_7_1 = false

	if arg_7_1.key and arg_7_1.key == var_7_0.key or var_0_11(arg_7_1.key) then
		arg_7_0._log:notice("[Stack] key  of (" .. tostring(var_7_0.address) .. ") is the same or is nil")
	else
		arg_7_0._log:notice("[Stack] key  of (" .. tostring(var_7_0.address) .. ") is updated to " .. tostring(var_7_0.key))

		var_7_0.key = arg_7_1.key
		var_7_1 = true
	end

	if arg_7_1.oldKey and arg_7_1.oldKey == var_7_0.oldKey or var_0_11(arg_7_1.oldKey) then
		arg_7_0._log:notice("[Stack] oldKey  of (" .. tostring(var_7_0.address) .. ") is the same or is nil")
	else
		arg_7_0._log:notice("[Stack] oldKey  of (" .. tostring(var_7_0.address) .. ") is updated to " .. tostring(var_7_0.oldKey))

		var_7_0.oldKey = arg_7_1.oldKey
		var_7_1 = true
	end

	local var_7_2 = arg_7_1.settings and arg_7_1.settings.refresh and arg_7_1.settings.refresh.technical
	local var_7_3 = var_7_0.settings and var_7_0.settings.refresh and var_7_0.settings.refresh.technical

	if var_0_6.tableCompare(var_7_2, var_7_3) == false then
		var_7_0.settings.refresh.technical = arg_7_1.settings.refresh.technical
		var_7_1 = true
	end

	if var_0_6.tableCompare(arg_7_0._nodes[var_7_0.address].settings, arg_7_1.settings) == false then
		arg_7_0._nodes[var_7_0.address].settings = arg_7_1.settings
	end

	if var_7_1 == false then
		return var_7_1
	end

	arg_7_0:saveNode(var_7_0)
	arg_7_0:emit(arg_7_0.Events.Update, arg_7_0:fromStorage(var_7_0), false)

	return true
end

function var_0_7.nodeUpdateOrCreate(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0:getNode(arg_8_1.address)

	if not var_8_0 then
		return arg_8_0:modifyNode(arg_8_1, var_0_2.action.CREATE)
	elseif var_8_0.address == arg_8_1.address then
		local var_8_1 = arg_8_0.format(arg_8_1)

		if arg_8_0:canBeUpdated(var_8_0, var_8_1) then
			return arg_8_0:nodeUpdate(arg_8_1)
		end
	end

	return false
end

function var_0_7.changeStackNodeKey(arg_9_0, arg_9_1, arg_9_2)
	if var_0_11(arg_9_2) then
		arg_9_0._log:error("key is empty, ignore change")

		return
	end

	local var_9_0 = arg_9_0:getNode(arg_9_1)

	if not var_9_0 then
		arg_9_0._log:error("stack is invalid " .. tostring(arg_9_1))

		return
	end

	if arg_9_2 == var_9_0.key then
		arg_9_0._log:notice("[Stack] key  of (" .. tostring(arg_9_1) .. ") is already activated " .. tostring(arg_9_2))
		arg_9_0:emit(var_0_7.Events.StackMasterKeyChanged, arg_9_0:fromStorage(var_9_0), false)
	else
		var_9_0.oldKey = var_9_0.key
		var_9_0.key = arg_9_2

		if arg_9_0:modifyNode(var_9_0, var_0_2.action.UPDATE) then
			arg_9_0._log:notice("[Stack] key  of (" .. tostring(arg_9_1) .. ") is activated " .. tostring(var_9_0.key))
			arg_9_0:emit(var_0_7.Events.StackMasterKeyChanged, arg_9_0:fromStorage(var_9_0), false)
			arg_9_0._log:notice("[Stack] old key  of (" .. tostring(arg_9_1) .. ") is activated " .. tostring(var_9_0.oldKey))
			arg_9_0:emit(var_0_7.Events.StackMasterOldKeyChanged, arg_9_0:fromStorage(var_9_0), false)
		end
	end
end

function var_0_7.updateStackNodeOldKey(arg_10_0, arg_10_1, arg_10_2)
	if var_0_11(arg_10_2) then
		arg_10_0._log:error("old key is empty, ignore change")

		return
	end

	local var_10_0 = arg_10_0:getNode(arg_10_1)

	if not var_10_0 then
		arg_10_0._log:error("stack is invalid " .. tostring(arg_10_1))

		return
	end

	if arg_10_2 == var_10_0.oldKey then
		arg_10_0._log:notice("[Stack] old key  of (" .. tostring(arg_10_1) .. ") is already activated " .. tostring(arg_10_2))
	else
		var_10_0.oldKey = arg_10_2

		arg_10_0:modifyNode(var_10_0, var_0_2.action.UPDATE)
		arg_10_0._log:notice("[Stack] old key  of (" .. tostring(arg_10_1) .. ") is already activated " .. tostring(var_10_0.oldKey))
		arg_10_0:emit(var_0_7.Events.StackMasterOldKeyChanged, arg_10_0:fromStorage(var_10_0), false)
	end
end

function var_0_7.getAvailableBackboneAddress(arg_11_0)
	local var_11_0, var_11_1 = next(arg_11_0:getNodes())

	return var_11_1 and var_11_1.backbone or 0
end

function var_0_7.getNodes(arg_12_0)
	local var_12_0 = arg_12_0:getStack()

	if not var_12_0 then
		arg_12_0._log:notice("[Stack] no stack")
	end

	return {
		var_12_0 and arg_12_0:fromStorage(var_12_0)
	}
end

function var_0_7.getStack(arg_13_0)
	local var_13_0, var_13_1 = next(arg_13_0._nodes)

	return var_13_1 and arg_13_0:fromStorage(var_13_1)
end

return var_0_7
