local var_0_0 = require("Overkiz.HomeAutomation.Local.Model.Remote.Device.DeviceManager")
local var_0_1 = {}
local var_0_2 = {}

function var_0_1.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = var_0_0(arg_1_1, arg_1_2, arg_1_3)

	var_1_0.nodeManager = arg_1_2

	var_1_0.nodeManager:addListener(var_1_0)

	function var_1_0.checkImplementation(arg_2_0)
		return true
	end

	local function var_1_1(arg_3_0)
		return ({
			podV2 = 5,
			pod = 2,
			modem = 3,
			podMini = 4,
			uPodNetwork = 7,
			uPodImage = 8,
			podV3 = 10,
			wifi = 9,
			podUnknown = 0,
			podV1 = 2,
			alarm = 1,
			uPod = 6
		})[arg_3_0] or 0
	end

	function var_1_0.getNodeTypeId(arg_4_0, arg_4_1)
		local var_4_0 = var_1_1(arg_4_1.type)

		if arg_1_1:isExistingReferenceTypeId(var_4_0) then
			return var_4_0
		end
	end

	function var_1_0.getGenericTypeId(arg_5_0, arg_5_1)
		return 0
	end

	function var_1_0.isAvailable(arg_6_0, arg_6_1)
		return true
	end

	function var_1_0.getSelectedProduct(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
		if arg_7_3 then
			return arg_7_3[1]
		end

		return nil
	end

	function var_1_0.deleteNode(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_0.nodeManager:getNode(arg_8_1)

		if not var_8_0 then
			return false
		end

		arg_8_0.nodeManager:deleteAndReload(var_8_0)

		return true
	end

	function var_1_0.getCreationTime(arg_9_0, arg_9_1)
		return arg_9_1.creationDate
	end

	return var_1_0
end

setmetatable(var_0_2, var_0_1)

return var_0_2
