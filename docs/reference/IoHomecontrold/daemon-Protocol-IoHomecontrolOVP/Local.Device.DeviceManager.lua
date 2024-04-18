local var_0_0 = require("bit")
local var_0_1 = require("Overkiz.HomeAutomation.Local.Model.Remote.Device.DeviceManager")
local var_0_2 = require("Overkiz.HomeAutomation.Local.Model.Remote.Device.deviceUtils")
local var_0_3 = require("Overkiz.HomeAutomation.Local.Model.reference")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Local.attributeConverters")
local var_0_6 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Transport.Utils.Node")
local var_0_7 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Manager")
local var_0_8 = {}
local var_0_9 = {}
local var_0_10 = 8656978944

function var_0_8.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = var_0_1(arg_1_1, arg_1_2, arg_1_4)

	var_1_0.nodeManager = arg_1_2

	arg_1_2:on(var_0_7.Events.Node, function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0

		if arg_2_1 == var_0_4.event.COMPLETED then
			var_2_0 = var_0_4.nodeGenericEvent.CREATED
		elseif arg_2_1 == var_0_4.event.UPDATED then
			if arg_2_0.status == var_0_4.status.Done then
				var_2_0 = var_0_4.nodeGenericEvent.UPDATED
			end
		elseif arg_2_1 == var_0_4.event.DELETED then
			var_2_0 = var_0_4.nodeGenericEvent.DELETED
		end

		if not var_2_0 then
			return
		end

		var_1_0:notified({
			node = arg_2_0,
			eventType = var_2_0
		})
	end)

	function var_1_0.checkImplementation(arg_3_0)
		if type(var_1_0.guessManufacturerSubType) ~= "function" then
			arg_1_4:error("IO/OVP Device manager: guessManufacturerSubType method should be implemented")

			return false
		end

		return true
	end

	function var_1_0.getNodeTypeId(arg_4_0, arg_4_1)
		if arg_4_1.class == var_0_4.class.STACK then
			if var_1_0.protocol == "io" then
				return var_0_10
			else
				return var_0_2.undefinedTypeId
			end
		end

		arg_4_1.generalinfo = arg_4_1.generalinfo or var_0_6.generalInfoToByteTable(arg_4_1.class, arg_4_1.generalInfo1, arg_4_1.generalInfo2)

		local var_4_0 = var_1_0:guessManufacturerSubType(arg_4_1)
		local var_4_1 = var_0_0.lshift(var_4_0, 8) + arg_4_1.class
		local var_4_2 = var_0_0.lshift(var_0_4.getProfile(arg_4_1), 16) + var_0_0.lshift(var_0_4.getSubProfile(arg_4_1), 8) + arg_4_1.manufacturer

		if not arg_1_1:isExistingReferenceTypeId(var_4_1 * 4294967296 + var_4_2) then
			var_4_1 = arg_4_1.class

			if not arg_1_1:isExistingReferenceTypeId(var_4_1 * 4294967296 + var_4_2) then
				var_4_2 = var_0_0.lshift(var_0_4.getProfile(arg_4_1), 16) + var_0_0.lshift(var_0_4.getSubProfile(arg_4_1), 8)
			end
		end

		return var_4_1 * 4294967296 + var_4_2
	end

	function var_1_0.additionalAttributes(arg_5_0, arg_5_1, arg_5_2)
		for iter_5_0, iter_5_1 in ipairs(var_0_5) do
			local var_5_0 = iter_5_1.converter(arg_5_2[iter_5_1.input])

			if var_5_0 then
				table.insert(arg_5_1.attributes, {
					name = iter_5_1.output,
					type = iter_5_1.type,
					value = var_5_0
				})
			end
		end
	end

	function var_1_0.getGenericTypeId(arg_6_0, arg_6_1)
		return 0
	end

	function var_1_0.isAvailable(arg_7_0, arg_7_1)
		return var_0_4:isAvailable(arg_7_1)
	end

	function var_1_0.getSelectedProduct(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
		for iter_8_0, iter_8_1 in pairs(arg_8_3) do
			return iter_8_1
		end

		return nil
	end

	function var_1_0.deleteNode(arg_9_0, arg_9_1)
		local var_9_0 = arg_1_2:getNodeByAddress(tonumber(arg_9_1))

		if not var_9_0 then
			arg_1_4:warning("Cannot delete inexistant node '" .. arg_9_1 .. "'.")

			return
		end

		arg_1_2:modifyNode(var_9_0, var_0_4.action.DELETE)
	end

	function var_1_0.refreshNodeStates(arg_10_0, arg_10_1, arg_10_2)
		arg_1_3:refreshStatesWithFeedback(arg_10_1, function(arg_11_0)
			if arg_11_0 == true then
				arg_10_2(var_0_3.state.COMPLETED)
			else
				arg_10_2(var_0_3.state.FAILED)
			end
		end)
	end

	var_1_0.checkNodeAvailability = var_1_0.refreshNodeStates

	function var_1_0.getCreationTime(arg_12_0, arg_12_1)
		return nil
	end

	return var_1_0
end

setmetatable(var_0_9, var_0_8)

return var_0_9
