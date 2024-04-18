local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Transport.Objects.Stack")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Transport.Objects.AbstractNode")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Transport.Objects.RemoteController")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Transport.Objects.Sensor")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_6 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Transport.Utils.Node")
local var_0_7 = require("tableshape").types
local var_0_8 = require("Overkiz.Type.ByteArray")
local var_0_9 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Manager")
local var_0_10 = var_0_0()
local var_0_11 = var_0_7.shape({
	stack = var_0_7.number,
	key = var_0_7.string,
	syncId = var_0_7.string
})
local var_0_12 = var_0_7.shape({
	node = var_0_7.number,
	syncId = var_0_7.string
})
local var_0_13 = var_0_7.shape({
	node = var_0_7.number,
	syncId = var_0_7.string
})

function var_0_10.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.nodeManager = arg_1_2
	arg_1_0.log = arg_1_4
	arg_1_0.stack = var_0_1(arg_1_1, arg_1_2, arg_1_4)
	arg_1_0.master = var_0_2(arg_1_1, "master", var_0_5.class.MASTER, arg_1_2, arg_1_4)
	arg_1_0.actuator = var_0_2(arg_1_1, "actuator", var_0_5.class.ACTUATOR, arg_1_2, arg_1_4)
	arg_1_0.beacon = var_0_2(arg_1_1, "beacon", var_0_5.class.BEACON, arg_1_2, arg_1_4)
	arg_1_0.remoteController = var_0_3(arg_1_1, arg_1_2, arg_1_4)
	arg_1_0.sensor = var_0_4(arg_1_1, arg_1_2, arg_1_4)

	arg_1_2:on(var_0_9.Events.Node, function(arg_2_0, arg_2_1)
		arg_1_0:toCloudlink(arg_2_0, arg_2_1)
	end)

	function arg_1_1.getNodes(arg_3_0, arg_3_1)
		local var_3_0 = arg_1_2:getNodes()

		for iter_3_0, iter_3_1 in pairs(var_3_0) do
			arg_1_0:toCloudlink(iter_3_1, true)
		end

		return true
	end

	function arg_1_1.changeKey(arg_4_0, arg_4_1)
		local var_4_0, var_4_1 = var_0_11:check_value(arg_4_0)

		if not var_4_0 then
			return false, var_4_1
		end

		local var_4_2 = arg_4_0.stack
		local var_4_3 = var_0_8(arg_4_0.key, "base64")

		arg_1_2:changeStackNodeKey(var_4_2, var_4_3)

		return true
	end

	function arg_1_1.deleteNode(arg_5_0, arg_5_1)
		local var_5_0, var_5_1 = var_0_12:check_value(arg_5_0)

		if not var_5_0 then
			return false, var_5_1
		end

		local var_5_2 = var_0_6.getEmptyBusTemplate()

		var_5_2.address = arg_5_0.node

		local var_5_3 = arg_1_3:getStackMaster()

		if var_5_3 and var_5_3.address == var_5_2.address then
			var_5_2 = var_0_6.buildEmptyStackTemplate(var_5_2.address)
		end

		arg_1_2:modifyNode(var_5_2, var_0_5.action.DELETE)

		return true
	end

	function arg_1_1.deleteChildNodes(arg_6_0, arg_6_1)
		local var_6_0, var_6_1 = var_0_13:check_value(arg_6_0)

		if not var_6_0 then
			return false, var_6_1
		end

		arg_1_2:deleteNodesByParentAddress(arg_6_0.node)

		return true
	end
end

function var_0_10.toCloudlink(arg_7_0, arg_7_1)
	if arg_7_1.class == var_0_5.class.STACK then
		arg_7_0.stack:modified(arg_7_1)

		return
	end

	local var_7_0

	if arg_7_1.class == var_0_5.class.ACTUATOR then
		var_7_0 = arg_7_0.actuator
	elseif arg_7_1.class == var_0_5.class.MASTER then
		var_7_0 = arg_7_0.master
	elseif arg_7_1.class == var_0_5.class.BEACON then
		var_7_0 = arg_7_0.beacon
	elseif arg_7_1.class == var_0_5.class.CONTROLLER then
		var_7_0 = arg_7_0.remoteController
	elseif arg_7_1.class == var_0_5.class.SENSOR then
		var_7_0 = arg_7_0.sensor
	end

	if var_7_0 then
		var_7_0:modified(arg_7_1)
	end
end

return var_0_10
