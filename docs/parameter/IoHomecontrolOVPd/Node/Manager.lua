local var_0_0 = require("Overkiz.Subject")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_2 = require("pl.tablex")
local var_0_3 = require("Overkiz.Type.ByteArray")
local var_0_4 = require("Overkiz.OOP.Class")
local var_0_5 = require("Overkiz.EventEmitter")
local var_0_6 = require("Overkiz.TableStorage")
local var_0_7 = require("Overkiz.UUID")
local var_0_8 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Class.Abstract")
local var_0_9 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Class.Actuator")
local var_0_10 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Class.Beacon")
local var_0_11 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Class.Controller")
local var_0_12 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Class.Master")
local var_0_13 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Class.Sensor")
local var_0_14 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Class.Stack")
local var_0_15 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.stacksHandler")
local var_0_16 = {
	StackResetRequired = "StackResetRequired",
	Node = "Node"
}
local var_0_17 = var_0_4(var_0_0, var_0_5)

var_0_17.Events = var_0_16

function var_0_17.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if not arg_1_1 or not arg_1_2 or not arg_1_3 then
		arg_1_2:warning("Node manager: invalid or missing arguments")
	end

	var_0_0.new(arg_1_0)
	var_0_5.new(arg_1_0)

	arg_1_0._protocol = arg_1_3
	arg_1_0._log = arg_1_2
	arg_1_0._protocolStorage = var_0_6(arg_1_3)
	arg_1_0._actuator = var_0_9(arg_1_0._protocolStorage, arg_1_1, arg_1_2)

	arg_1_0:subscribeNodeClassForEvents(arg_1_0._actuator)

	arg_1_0._beacon = var_0_10(arg_1_0._protocolStorage, arg_1_1, arg_1_2)

	arg_1_0:subscribeNodeClassForEvents(arg_1_0._beacon)

	arg_1_0._controller = var_0_11(arg_1_0._protocolStorage, arg_1_1, arg_1_2)

	arg_1_0:subscribeNodeClassForEvents(arg_1_0._controller)

	arg_1_0._master = var_0_12(arg_1_0._protocolStorage, arg_1_1, arg_1_2)

	arg_1_0:subscribeNodeClassForEvents(arg_1_0._master)

	arg_1_0._sensor = var_0_13(arg_1_0._protocolStorage, arg_1_1, arg_1_2)

	arg_1_0:subscribeNodeClassForEvents(arg_1_0._sensor)

	arg_1_0._stack = var_0_14(arg_1_0._protocolStorage, arg_1_1, arg_1_2)

	arg_1_0:subscribeNodeClassForEvents(arg_1_0._stack, true)

	arg_1_0._classIdToClass = {
		[var_0_1.class.ACTUATOR] = arg_1_0._actuator,
		[var_0_1.class.BEACON] = arg_1_0._beacon,
		[var_0_1.class.CONTROLLER] = arg_1_0._controller,
		[var_0_1.class.MASTER] = arg_1_0._master,
		[var_0_1.class.SENSOR] = arg_1_0._sensor,
		[var_0_1.class.STACK] = arg_1_0._stack
	}

	var_0_15:register(arg_1_3, arg_1_0)

	arg_1_0._action2Behavior = {
		[var_0_1.action.CREATE] = arg_1_0.checkStackConsistency,
		[var_0_1.action.DELETE] = arg_1_0.nodeDelete,
		[var_0_1.action.UPDATE_OR_CREATE] = arg_1_0.checkStackConsistency
	}
end

function var_0_17.init(arg_2_0)
	arg_2_0._actuator:init()
	arg_2_0._beacon:init()
	arg_2_0._controller:init()
	arg_2_0._master:init()
	arg_2_0._sensor:init()
	arg_2_0._stack:init()
end

function var_0_17.getNodeWithExtraDefinition(arg_3_0, arg_3_1)
	return arg_3_0:getNodeByAddressUnformatted(arg_3_1)
end

function var_0_17.isPeriodicTimerInitialized(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0:getNodeByAddressUnformatted(arg_4_1)

	return var_4_0 and var_4_0.periodicTimersInitialized or false
end

function var_0_17.setPeriodicTimerInitializedStatus(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0:getNodeByAddressUnformatted(arg_5_1)

	if not var_5_0 then
		arg_5_0.log:error("[nodeManager] can't set status to an unknown node")

		return
	end

	var_5_0.periodicTimersInitialized = arg_5_2
end

function var_0_17.getNodeParameterInfo(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0:getNodeByAddressUnformatted(arg_6_1)

	return var_6_0 and var_6_0.paramInfoCollection
end

function var_0_17.createStackNode(arg_7_0)
	local var_7_0 = {
		systemLink = "",
		address = math.random(var_0_1.stackAddressRange.Low, var_0_1.stackAddressRange.High),
		class = var_0_1.class.STACK,
		type = var_0_1.type.STACK_MASTER,
		manufacturer = var_0_1.manufacturers.Somfy,
		status = var_0_1.status.Done,
		key = arg_7_0:generateStackKey(),
		backbone = var_0_1.unusedBackboneAddress,
		settings = {
			refresh = {
				technical = {}
			}
		}
	}

	var_7_0.oldKey = var_7_0.key

	arg_7_0._log:notice("Create new stack node " .. var_7_0.address)
	arg_7_0:modifyNode(var_7_0, var_0_1.action.UPDATE_OR_CREATE)

	return var_7_0
end

function var_0_17.generateStackKey(arg_8_0)
	local var_8_0 = var_0_3(var_0_1.keySize)

	for iter_8_0 = 1, #var_8_0 do
		var_8_0[iter_8_0] = math.random(0, 255)
	end

	return var_8_0
end

function var_0_17.getStackNodeOrCreate(arg_9_0)
	return arg_9_0:getStackMaster() or arg_9_0:createStackNode()
end

function var_0_17.subscribeNodeClassForEvents(arg_10_0, arg_10_1, arg_10_2)
	arg_10_1:on(var_0_8.Events.Create, function(arg_11_0, arg_11_1)
		arg_10_0:emit(var_0_16.Node, arg_11_0, var_0_1.event.CREATED, arg_11_1)
	end)
	arg_10_1:on(var_0_8.Events.Update, function(arg_12_0, arg_12_1)
		arg_10_0:emit(var_0_16.Node, arg_12_0, var_0_1.event.UPDATED, arg_12_1)
	end)
	arg_10_1:on(var_0_8.Events.Delete, function(arg_13_0, arg_13_1)
		arg_10_0:emit(var_0_16.Node, arg_13_0, var_0_1.event.DELETED, arg_13_1)
	end)
	arg_10_1:on(var_0_8.Events.Complete, function(arg_14_0, arg_14_1)
		arg_10_0:emit(var_0_16.Node, arg_14_0, var_0_1.event.COMPLETED, arg_14_1)
	end)

	if arg_10_2 == true then
		arg_10_1:on(var_0_8.Events.StackMasterKeyChanged, function(arg_15_0, arg_15_1)
			arg_10_0:emit(var_0_16.Node, arg_15_0, var_0_1.event.STACK_MASTER_KEY_CHANGED, arg_15_1)
		end)
		arg_10_1:on(var_0_8.Events.StackMasterOldKeyChanged, function(arg_16_0, arg_16_1)
			arg_10_0:emit(var_0_16.Node, arg_16_0, var_0_1.event.STACK_MASTER_OLD_KEY_CHANGED, arg_16_1)
		end)
	end
end

function var_0_17.getNodes(arg_17_0)
	local var_17_0 = {}

	var_0_2.move(var_17_0, arg_17_0._actuator:getNodes(), #var_17_0 + 1)
	var_0_2.move(var_17_0, arg_17_0._beacon:getNodes(), #var_17_0 + 1)
	var_0_2.move(var_17_0, arg_17_0._controller:getNodes(), #var_17_0 + 1)
	var_0_2.move(var_17_0, arg_17_0._master:getNodes(), #var_17_0 + 1)
	var_0_2.move(var_17_0, arg_17_0._sensor:getNodes(), #var_17_0 + 1)
	var_0_2.move(var_17_0, arg_17_0._stack:getNodes(), #var_17_0 + 1)

	return var_17_0
end

function var_0_17.getNodesByClass(arg_18_0, arg_18_1)
	return arg_18_0._classIdToClass[arg_18_1] and arg_18_0._classIdToClass[arg_18_1]:getNodesByClass() or {}
end

function var_0_17.getNodesByClassAndType(arg_19_0, arg_19_1, arg_19_2)
	return arg_19_0._classIdToClass[arg_19_1] and arg_19_0._classIdToClass[arg_19_1]:getNodesByClassAndType(arg_19_2) or {}
end

function var_0_17.getNodesByParentAddress(arg_20_0, arg_20_1)
	local var_20_0 = {}

	var_0_2.move(var_20_0, arg_20_0._actuator:getNodesByParentAddress(arg_20_1), #var_20_0 + 1)
	var_0_2.move(var_20_0, arg_20_0._beacon:getNodesByParentAddress(arg_20_1), #var_20_0 + 1)
	var_0_2.move(var_20_0, arg_20_0._master:getNodesByParentAddress(arg_20_1), #var_20_0 + 1)
	var_0_2.move(var_20_0, arg_20_0._controller:getNodesByParentAddress(arg_20_1), #var_20_0 + 1)
	var_0_2.move(var_20_0, arg_20_0._sensor:getNodesByParentAddress(arg_20_1), #var_20_0 + 1)

	return var_20_0
end

function var_0_17.getNodesByStatus(arg_21_0, arg_21_1)
	local var_21_0 = {}

	var_0_2.move(var_21_0, arg_21_0._actuator:getNodesByStatus(arg_21_1), #var_21_0 + 1)
	var_0_2.move(var_21_0, arg_21_0._beacon:getNodesByStatus(arg_21_1), #var_21_0 + 1)
	var_0_2.move(var_21_0, arg_21_0._controller:getNodesByStatus(arg_21_1), #var_21_0 + 1)
	var_0_2.move(var_21_0, arg_21_0._master:getNodesByStatus(arg_21_1), #var_21_0 + 1)
	var_0_2.move(var_21_0, arg_21_0._sensor:getNodesByStatus(arg_21_1), #var_21_0 + 1)
	var_0_2.move(var_21_0, arg_21_0._stack:getNodesByStatus(arg_21_1), #var_21_0 + 1)

	return var_21_0
end

function var_0_17.getNodesByClassAndStatus(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0._classIdToClass[arg_22_1]

	return var_22_0 and var_22_0:getNodesByClassAndStatus(arg_22_2) or {}
end

function var_0_17.getActuatorNode(arg_23_0, arg_23_1)
	return arg_23_0._actuator:getNode(arg_23_1) or arg_23_0._beacon:getNode(arg_23_1) or arg_23_0._master:getNode(arg_23_1)
end

function var_0_17.getControllerNode(arg_24_0, arg_24_1)
	return arg_24_0._controller:getNode(arg_24_1)
end

function var_0_17.getSensorNode(arg_25_0, arg_25_1)
	return arg_25_0._sensor:getNode(arg_25_1)
end

function var_0_17.getStackNode(arg_26_0, arg_26_1)
	return arg_26_0._stack:getNode(arg_26_1)
end

function var_0_17.getStackMasterAddress(arg_27_0)
	local var_27_0 = arg_27_0:getStackMaster()

	return var_27_0 and var_27_0.address or 0
end

function var_0_17.getStackMaster(arg_28_0)
	return arg_28_0._stack:getStack()
end

function var_0_17.getNodeNumberByClass(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0._classIdToClass[arg_29_1]

	return var_29_0 and var_29_0:getNodeNumber() or 0
end

function var_0_17.deleteNodesByParentAddress(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:getNodesByParentAddress(arg_30_1)

	for iter_30_0, iter_30_1 in ipairs(var_30_0) do
		arg_30_0:modifyNode(iter_30_1, var_0_1.action.DELETE)
	end
end

function var_0_17.deleteNodesByStatus(arg_31_0, arg_31_1)
	arg_31_0._actuator:deleteNodesByStatus(arg_31_1)
	arg_31_0._controller:deleteNodesByStatus(arg_31_1)
	arg_31_0._master:deleteNodesByStatus(arg_31_1)
	arg_31_0._sensor:deleteNodesByStatus(arg_31_1)
end

function var_0_17.deleteNodesByClass(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0._classIdToClass[arg_32_1]

	return var_32_0 and var_32_0:deleteAll()
end

function var_0_17.updateStackNodeKey(arg_33_0, arg_33_1)
	arg_33_0._stack:updateStackNodeKey(arg_33_1)
end

function var_0_17.updateStackNodeOldKey(arg_34_0, arg_34_1)
	arg_34_0._stack:updateStackNodeOldKey(arg_34_1)
end

function var_0_17.generateNodeLinkId(arg_35_0)
	return var_0_7.generate()
end

function var_0_17.getLinkedNodes(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_0:getNodeLinkId(arg_36_1)
	local var_36_1 = {}

	if var_36_0 and var_36_0 ~= "" then
		var_0_2.move(var_36_1, arg_36_0._actuator:getLinkedNodes(var_36_0, arg_36_1), #var_36_1 + 1)
		var_0_2.move(var_36_1, arg_36_0._beacon:getLinkedNodes(var_36_0, arg_36_1), #var_36_1 + 1)
		var_0_2.move(var_36_1, arg_36_0._controller:getLinkedNodes(var_36_0, arg_36_1), #var_36_1 + 1)
		var_0_2.move(var_36_1, arg_36_0._master:getLinkedNodes(var_36_0, arg_36_1), #var_36_1 + 1)
		var_0_2.move(var_36_1, arg_36_0._sensor:getLinkedNodes(var_36_0, arg_36_1), #var_36_1 + 1)
		var_0_2.move(var_36_1, arg_36_0._stack:getLinkedNodes(var_36_0, arg_36_1), #var_36_1 + 1)
	end

	var_36_1[arg_36_1] = nil

	return var_36_1
end

function var_0_17.getLinkedNodesByLink(arg_37_0, arg_37_1)
	local var_37_0 = {}

	var_0_2.move(var_37_0, arg_37_0._actuator:getLinkedNodes(arg_37_1), #var_37_0 + 1)
	var_0_2.move(var_37_0, arg_37_0._beacon:getLinkedNodes(arg_37_1), #var_37_0 + 1)
	var_0_2.move(var_37_0, arg_37_0._controller:getLinkedNodes(arg_37_1), #var_37_0 + 1)
	var_0_2.move(var_37_0, arg_37_0._master:getLinkedNodes(arg_37_1), #var_37_0 + 1)
	var_0_2.move(var_37_0, arg_37_0._sensor:getLinkedNodes(arg_37_1), #var_37_0 + 1)
	var_0_2.move(var_37_0, arg_37_0._stack:getLinkedNodes(arg_37_1), #var_37_0 + 1)

	return var_37_0
end

function var_0_17.getNodeLinkId(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0:getNodeByAddress(arg_38_1)

	return var_38_0 and var_38_0.systemLink or ""
end

function var_0_17.getNodeByAddress(arg_39_0, arg_39_1)
	return arg_39_0._actuator:getNodeByAddress(arg_39_1) or arg_39_0._beacon:getNodeByAddress(arg_39_1) or arg_39_0._controller:getNodeByAddress(arg_39_1) or arg_39_0._master:getNodeByAddress(arg_39_1) or arg_39_0._sensor:getNodeByAddress(arg_39_1) or arg_39_0._stack:getNodeByAddress(arg_39_1)
end

function var_0_17.getNodeByAddressUnformatted(arg_40_0, arg_40_1)
	return arg_40_0._actuator:getNodeByAddressUnformatted(arg_40_1) or arg_40_0._beacon:getNodeByAddressUnformatted(arg_40_1) or arg_40_0._controller:getNodeByAddressUnformatted(arg_40_1) or arg_40_0._master:getNodeByAddressUnformatted(arg_40_1) or arg_40_0._sensor:getNodeByAddressUnformatted(arg_40_1) or arg_40_0._stack:getNodeByAddressUnformatted(arg_40_1)
end

function var_0_17.canNodeBeReached(arg_41_0, arg_41_1)
	if arg_41_1.class == var_0_1.class.SENSOR and var_0_1.sensors.isReachableOnlyOnEvent(arg_41_1) and var_0_1.sensors.isListening(arg_41_1) == false then
		return false
	end

	return true
end

function var_0_17.changeStackNodeKey(arg_42_0, arg_42_1, arg_42_2)
	arg_42_0._stack:changeStackNodeKey(arg_42_1, arg_42_2)
end

function var_0_17.updateStackNodeOldKey(arg_43_0, arg_43_1, arg_43_2)
	arg_43_0._stack:updateStackNodeOldKey(arg_43_1, arg_43_2)
end

function var_0_17.cleanNodes(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	arg_44_0:deleteNodesByStatus(var_0_1.status.Intermediate_Paired)
	arg_44_0:deleteNodesByStatus(var_0_1.status.Intermediate_Discover)
	arg_44_0:deleteNodesByStatus(var_0_1.status.Intermediate_GeneralInfo1Got)
	arg_44_0:deleteNodesByStatus(var_0_1.status.Intermediate_GeneralInfo2Got)
	arg_44_0:deleteNodesByStatus(var_0_1.status.Intermediate_Unpaired)

	if arg_44_1 then
		arg_44_0:deleteNodesByStatus(var_0_1.status.Intermediate_Discovered)
	end

	if arg_44_2 then
		local var_44_0 = arg_44_0._beacon:getNodesByClassAndStatus(var_0_1.status.Destroyed)

		for iter_44_0, iter_44_1 in pairs(var_44_0) do
			arg_44_0._beacon:nodeUpdateStatus(iter_44_1)
		end
	end

	local var_44_1 = arg_44_0:getNodesByStatus(var_0_1.status.Existing)

	for iter_44_2, iter_44_3 in pairs(var_44_1) do
		local var_44_2 = arg_44_0:nodeFromStorage(iter_44_3)

		if arg_44_3 == true then
			var_44_2.status = var_0_1.status.Unavailable
		else
			var_44_2.status = var_0_1.status.Done
		end

		arg_44_0:modifyNode(var_44_2, var_0_1.action.UPDATE_STATUS)
	end
end

function var_0_17.checkStackConsistency(arg_45_0, arg_45_1)
	if arg_45_1.class ~= var_0_1.class.STACK then
		local var_45_0 = arg_45_0._stack:getStack()

		if not var_45_0 then
			arg_45_0._log:error("[NodeManager] Can't create a node if no stack")

			return false
		end

		if var_45_0.address ~= arg_45_1.master then
			arg_45_0._log:error("[NodeManager] Can't create a node with a master address different from the stack saved")

			return false
		end
	end

	return true
end

function var_0_17.nodeDelete(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_0:getNodeByAddress(arg_46_1.address)

	if var_46_0 then
		arg_46_1.class = var_46_0.class
	end

	return true
end

function var_0_17.modifyNode(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = arg_47_0._action2Behavior[arg_47_2]

	if var_47_0 and var_47_0(arg_47_0, arg_47_1) == false then
		return false
	end

	local var_47_1 = arg_47_0._classIdToClass[arg_47_1.class]

	return var_47_1 and var_47_1:modifyNode(arg_47_1, arg_47_2)
end

function var_0_17.getAvailableBackboneAddress(arg_48_0)
	return arg_48_0._stack:getAvailableBackboneAddress()
end

function var_0_17.getNumberOfStacks(arg_49_0)
	return #arg_49_0._stack:getNodes()
end

function var_0_17.nodeFromStorage(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_0._classIdToClass[arg_50_1.class]

	if not var_50_0 then
		arg_50_0._log:error("[NodeManager] class (" .. tostring(arg_50_1.class) .. ") is unknown")

		return
	end

	return var_50_0:fromStorage(arg_50_1)
end

function var_0_17.clearSaving(arg_51_0)
	var_0_6.clear(arg_51_0._protocolStorage)
end

return var_0_17
