local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.EventEmitter")
local var_0_2 = require("Overkiz.TableStorage")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Misc")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Transport.Utils.Node")
local var_0_6 = require("Overkiz.Type.ByteArray")
local var_0_7 = require("pl.tablex")
local var_0_8 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.ParamInfoCollection")
local var_0_9 = require("Overkiz.Kizbox.id")
local var_0_10 = require("Overkiz.HomeAutomation.Trigger.Proxy.Device")
local var_0_11 = var_0_0(var_0_1)

var_0_11.Events = {
	Delete = "Delete",
	Create = "Create",
	Update = "Update",
	Complete = "Complete"
}

local var_0_12 = {
	"address",
	"master",
	"backbone",
	"class",
	"type",
	"manufacturer",
	"generalInfo1",
	"generalInfo2",
	"key"
}
local var_0_13 = 9
local var_0_14 = {
	TimeStamp = 8,
	NodeType = 1,
	BackboneAddress = 3,
	MultiInfoByte = 7,
	ManufacturerId = 6
}

local function var_0_15(arg_1_0)
	local var_1_0 = var_0_6(var_0_13)

	var_1_0:writeUInt16(var_0_14.NodeType, arg_1_0.type)
	var_1_0:writeUInt24(var_0_14.BackboneAddress, arg_1_0.backbone)
	var_1_0:writeUInt8(var_0_14.ManufacturerId, arg_1_0.manufacturer)
	var_1_0:writeUInt8(var_0_14.MultiInfoByte, arg_1_0.multiInfo)
	var_1_0:writeUInt16(var_0_14.TimeStamp, arg_1_0.timestamp)

	return var_1_0
end

function var_0_11.new(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	var_0_1.new(arg_2_0)

	arg_2_0._storage = var_0_2.subStorage(arg_2_1, arg_2_2)
	arg_2_0._log = arg_2_4
	arg_2_0._name = arg_2_2
	arg_2_0._nodes = {}
	arg_2_0._class = arg_2_3
	arg_2_0._action2Behavior = {
		[var_0_3.action.CREATE] = arg_2_0.nodeCreate,
		[var_0_3.action.COMPLETE] = arg_2_0.nodeComplete,
		[var_0_3.action.UPDATE] = arg_2_0.nodeUpdate,
		[var_0_3.action.UPDATE_STATUS] = arg_2_0.nodeUpdateStatus,
		[var_0_3.action.UPDATE_GEN_INFO] = arg_2_0.nodeUpdateGeneralInfo,
		[var_0_3.action.UPDATE_KEY] = arg_2_0.nodeUpdateKey,
		[var_0_3.action.DELETE] = arg_2_0.nodeDelete,
		[var_0_3.action.UPDATE_OR_CREATE] = arg_2_0.nodeUpdateOrCreate
	}
end

function var_0_11.init(arg_3_0)
	for iter_3_0, iter_3_1 in var_0_2.pairs(arg_3_0._storage) do
		arg_3_0._nodes[iter_3_1.address] = arg_3_0.format(iter_3_1)

		arg_3_0:initializeNode(iter_3_1)
	end
end

function var_0_11.saveNode(arg_4_0, arg_4_1)
	arg_4_0._storage[arg_4_1.address] = arg_4_0.format(arg_4_1)

	if arg_4_0._nodes[arg_4_1.address] then
		arg_4_0._nodes[arg_4_1.address] = var_0_7.merge(arg_4_0._nodes[arg_4_1.address], arg_4_0.format(arg_4_1), true)
	else
		arg_4_0._nodes[arg_4_1.address] = arg_4_0.format(arg_4_1)
	end
end

function var_0_11.deleteNode(arg_5_0, arg_5_1)
	arg_5_0._storage[arg_5_1.address] = nil
	arg_5_0._nodes[arg_5_1.address] = nil
end

function var_0_11.initializeNode(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0._nodes[arg_6_1.address]

	var_6_0.paramInfoCollection = var_0_8()

	local var_6_1 = tostring(arg_6_0._protocol) .. "://" .. var_0_9() .. "/" .. tostring(arg_6_1.address)

	var_6_0.device = var_0_10(var_6_1)
	var_6_0.generalinfo = var_0_5.generalInfoToByteTable(arg_6_1.class, arg_6_1.generalInfo1, arg_6_1.generalInfo2)
	var_6_0.periodicTimersInitialized = false

	local var_6_2 = arg_6_0._class[tostring(arg_6_1.class)]

	if not var_6_2 then
		arg_6_0._log:warning("Create node: unknown class " .. tostring(arg_6_1.class) .. " on node " .. tostring(arg_6_1.address))

		return {}
	end

	var_6_2.create(var_6_0)
	arg_6_0._log:notice("Node " .. tostring(arg_6_1.address) .. " initialized (class " .. tostring(arg_6_1.class) .. ", profile " .. var_0_3.getProfile(arg_6_1) .. ", subProfile " .. var_0_3.getSubProfile(arg_6_1) .. ", status " .. var_0_4.statusToVerbose(arg_6_1.status) .. ")")
end

function var_0_11.format(arg_7_0)
	return {
		address = arg_7_0.address,
		backbone = arg_7_0.backbone,
		master = arg_7_0.master,
		class = arg_7_0.class,
		type = arg_7_0.type,
		manufacturer = arg_7_0.manufacturer,
		generalInfo1 = arg_7_0.generalInfo1,
		generalInfo2 = arg_7_0.generalInfo2,
		key = arg_7_0.key,
		status = arg_7_0.status,
		systemLink = arg_7_0.systemLink,
		info = arg_7_0.info or var_0_15(arg_7_0),
		keyValueStore = arg_7_0.keyValueStore,
		timestamp = arg_7_0.info and arg_7_0.info:readUInt16(var_0_14.TimeStamp) or arg_7_0.timestamp,
		multiInfo = arg_7_0.info and arg_7_0.info:readUInt8(var_0_14.MultiInfoByte) or arg_7_0.multiInfo
	}
end

function var_0_11.fromStorage(arg_8_0, arg_8_1)
	return {
		address = arg_8_1.address,
		backbone = arg_8_1.backbone,
		master = arg_8_1.master,
		class = arg_8_1.class,
		type = arg_8_1.type,
		manufacturer = arg_8_1.manufacturer,
		generalInfo1 = arg_8_1.generalInfo1,
		generalInfo2 = arg_8_1.generalInfo2,
		key = arg_8_1.key,
		keyValueStore = arg_8_1.keyValueStore,
		info = arg_8_1.info,
		status = arg_8_1.status,
		systemLink = arg_8_1.systemLink,
		timestamp = arg_8_1.info and arg_8_1.info:readUInt16(var_0_14.TimeStamp),
		multiInfo = arg_8_1.info and arg_8_1.info:readUInt8(var_0_14.MultiInfoByte)
	}
end

function var_0_11.canBeUpdated(arg_9_0, arg_9_1, arg_9_2)
	return var_0_4.nodeCanBeUpdated(arg_9_1, arg_9_2, arg_9_0:getUnchangedAttributes())
end

function var_0_11.getUnchangedAttributes(arg_10_0)
	return var_0_12
end

function var_0_11.getNodes(arg_11_0)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in pairs(arg_11_0._nodes) do
		table.insert(var_11_0, arg_11_0.format(iter_11_1))
	end

	return var_11_0
end

function var_0_11.getNodesByClass(arg_12_0)
	return arg_12_0:getNodes()
end

function var_0_11.getNodesByClassAndType(arg_13_0, arg_13_1)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in pairs(arg_13_0._nodes) do
		if iter_13_1.type == arg_13_1 then
			table.insert(var_13_0, arg_13_0.format(iter_13_1))
		end
	end

	return var_13_0
end

function var_0_11.getNodesByParentAddress(arg_14_0, arg_14_1)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in pairs(arg_14_0._nodes) do
		if iter_14_1.master == arg_14_1 then
			table.insert(var_14_0, arg_14_0.format(iter_14_1))
		end
	end

	return var_14_0
end

function var_0_11.getNodesByStatus(arg_15_0, arg_15_1)
	local var_15_0 = {}

	for iter_15_0, iter_15_1 in pairs(arg_15_0._nodes) do
		if iter_15_1.status == arg_15_1 then
			table.insert(var_15_0, arg_15_0.format(iter_15_1))
		end
	end

	return var_15_0
end

function var_0_11.getNodesByClassAndStatus(arg_16_0, arg_16_1)
	return arg_16_0:getNodesByStatus(arg_16_1)
end

function var_0_11.getLinkedNodes(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = {}

	for iter_17_0, iter_17_1 in pairs(arg_17_0._nodes) do
		if iter_17_1.systemLink == arg_17_1 and (arg_17_2 and iter_17_1.address ~= arg_17_2 or not arg_17_2) then
			table.insert(var_17_0, arg_17_0.format(iter_17_1))
		end
	end

	return var_17_0
end

function var_0_11.getNode(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0._nodes[arg_18_1]

	return var_18_0 and arg_18_0:fromStorage(var_18_0)
end

function var_0_11.getNodeNumber(arg_19_0)
	local var_19_0 = 0

	for iter_19_0 in pairs(arg_19_0._nodes) do
		var_19_0 = var_19_0 + 1
	end

	return var_19_0
end

function var_0_11.modifyNode(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0._action2Behavior[arg_20_2]

	return var_20_0 and var_20_0(arg_20_0, arg_20_1)
end

function var_0_11.getNodeByAddress(arg_21_0, arg_21_1)
	return arg_21_0:getNode(arg_21_1)
end

function var_0_11.getNodeByAddressUnformatted(arg_22_0, arg_22_1)
	return arg_22_0._nodes[arg_22_1]
end

function var_0_11.nodeCreate(arg_23_0, arg_23_1)
	if arg_23_0._nodes[arg_23_1.address] then
		arg_23_0._log:error("[" .. arg_23_0._name .. "] CREATED FAILED: " .. tostring(arg_23_1.address) .. " already exists")

		return false
	end

	if not var_0_3:isValid(arg_23_1) then
		arg_23_0._log:error("Try to create invalid node " .. tostring(arg_23_1.address) .. " (class " .. tostring(arg_23_1.class) .. ", profile " .. var_0_3.getProfile(arg_23_1) .. ", subProfile " .. var_0_3.getSubProfile(arg_23_1) .. ", status " .. var_0_4.statusToVerbose(arg_23_1.status) .. ")")

		return false
	end

	arg_23_0:saveNode(arg_23_1)
	arg_23_0:emit(arg_23_0.Events.Create, arg_23_1, true)
	arg_23_0._log:notice("[" .. arg_23_0._name .. "] CREATED " .. tostring(arg_23_1.address) .. " with status " .. var_0_4.statusToVerbose(arg_23_1.status))

	return true
end

function var_0_11.nodeComplete(arg_24_0, arg_24_1)
	local var_24_0, var_24_1 = var_0_4.checkNodeStatusTransition(arg_24_0:getNodeByAddress(arg_24_1.address), arg_24_1)

	if var_24_0 == false then
		return var_24_0
	end

	arg_24_0:saveNode(arg_24_1)
	arg_24_0:initializeNode(arg_24_1)
	arg_24_0._log:notice("[" .. arg_24_0._name .. "] COMPLETED " .. tostring(arg_24_1.address) .. " with status " .. var_0_4.statusToVerbose(arg_24_1.status))
	arg_24_0:emit(arg_24_0.Events.Complete, arg_24_1, var_24_1)

	return true
end

function var_0_11.nodeUpdate(arg_25_0, arg_25_1)
	return false
end

function var_0_11.nodeDelete(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0._nodes[arg_26_1.address]

	if not var_26_0 then
		arg_26_0._log:notice("[" .. arg_26_0._name .. "] DELETED FAILED " .. tostring(arg_26_1.address))

		return false
	end

	var_26_0.status = var_0_3.status.Destroyed

	arg_26_0:emit(arg_26_0.Events.Delete, arg_26_0:fromStorage(var_26_0), false)
	arg_26_0:deleteNode(arg_26_1)
	arg_26_0._log:notice("[" .. arg_26_0._name .. "] DELETED " .. tostring(var_26_0.address))

	return true
end

function var_0_11.nodeUpdateStatus(arg_27_0, arg_27_1)
	local var_27_0, var_27_1 = var_0_4.checkNodeStatusTransition(arg_27_0:getNodeByAddress(arg_27_1.address), arg_27_1)

	if var_27_0 == false then
		return var_27_0
	end

	arg_27_0:saveNode(arg_27_1)
	arg_27_0._log:notice("[" .. arg_27_0._name .. "] UPDATE STATUS " .. tostring(arg_27_1.address) .. " with status " .. var_0_4.statusToVerbose(arg_27_1.status))
	arg_27_0:emit(arg_27_0.Events.Update, arg_27_1, var_27_1)

	return true
end

function var_0_11.nodeUpdateGeneralInfo(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0._nodes[arg_28_1.address]

	if var_28_0 then
		local var_28_1 = false

		if arg_28_1.generalInfo1 then
			var_28_0.generalInfo1 = arg_28_1.generalInfo1
			var_28_1 = true

			arg_28_0._log:notice("[" .. arg_28_0._name .. "] UPDATE GENERAL INFO " .. tostring(arg_28_1.address) .. " with gi1: " .. tostring(var_28_0.generalInfo1))
		end

		if arg_28_1.generalInfo2 then
			var_28_0.generalInfo2 = arg_28_1.generalInfo2
			var_28_1 = true

			arg_28_0._log:notice("[" .. arg_28_0._name .. "] UPDATE GENERAL INFO " .. tostring(arg_28_1.address) .. " with gi2: " .. tostring(var_28_0.generalInfo2))
		end

		if arg_28_1.status then
			var_28_0.status = arg_28_1.status
			var_28_1 = true

			arg_28_0._log:notice("[" .. arg_28_0._name .. "] UPDATE GENERAL INFO " .. tostring(arg_28_1.address) .. " with status: " .. var_0_4.statusToVerbose(arg_28_1.status))
		end

		if var_28_1 == true then
			arg_28_0:saveNode(var_28_0)
			arg_28_0:emit(arg_28_0.Events.Update, arg_28_1, false)

			return true
		end

		return false
	end

	arg_28_0._log:warning("[" .. arg_28_0._name .. "] UPDATE GENERAL INFO FAILED " .. tostring(arg_28_1.address))

	return false
end

function var_0_11.nodeUpdateKey(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0._nodes[arg_29_1.address]

	if not var_29_0 or not arg_29_1.key then
		arg_29_0._log:warning("[" .. arg_29_0._name .. "] UPDATE KEY FAILED " .. tostring(arg_29_1.address))

		return false
	end

	var_29_0.key = arg_29_1.key

	arg_29_0:saveNode(var_29_0)
	arg_29_0._log:notice("[" .. arg_29_0._name .. "] UPDATE KEY " .. tostring(arg_29_1.address) .. " with key: " .. tostring(var_29_0.key))
	arg_29_0:emit(arg_29_0.Events.Update, arg_29_1, false)

	return true
end

function var_0_11.nodeUpdateOrCreate(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:getNode(arg_30_1.address)

	arg_30_1 = arg_30_0.format(arg_30_1)

	if not var_30_0 then
		arg_30_0:modifyNode(arg_30_1, var_0_3.action.CREATE)

		if not var_0_3.isIntermediateNodeStatus(arg_30_1.status) then
			arg_30_0:modifyNode(arg_30_1, var_0_3.action.COMPLETE)
			arg_30_0._log:notice("[" .. arg_30_0._name .. "] COMPLETED " .. tostring(arg_30_1.address) .. " with status " .. var_0_4.statusToVerbose(arg_30_1.status))
		else
			arg_30_0._log:error("[" .. arg_30_0._name .. "] COMPLETED WARNING " .. tostring(arg_30_1.address) .. " with status " .. var_0_4.statusToVerbose(arg_30_1.status))
		end

		return true
	else
		local var_30_1 = arg_30_0.format(arg_30_1)

		if arg_30_0:canBeUpdated(var_30_0, var_30_1) == true then
			arg_30_0:saveNode(var_30_1)
			arg_30_0._log:notice("[" .. arg_30_0._name .. "] UPDATED " .. tostring(arg_30_1.address) .. " with status " .. var_0_4.statusToVerbose(arg_30_1.status))
			arg_30_0:emit(arg_30_0.Events.Update, arg_30_1, false)

			return true
		end
	end

	return false
end

function var_0_11.deleteNodesByStatus(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0:getNodesByStatus(arg_31_1)

	for iter_31_0, iter_31_1 in ipairs(var_31_0) do
		arg_31_0:modifyNode(iter_31_1, var_0_3.action.DELETE)
	end
end

function var_0_11.deleteAll(arg_32_0)
	local var_32_0 = arg_32_0:getNodes()

	for iter_32_0, iter_32_1 in ipairs(var_32_0) do
		arg_32_0:modifyNode(iter_32_1, var_0_3.action.DELETE)
	end
end

return var_0_11
