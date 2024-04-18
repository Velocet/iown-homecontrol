local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.Type.ByteArray")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Transport.Utils.Node")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Misc")
local var_0_5 = require("tableshape").types
local var_0_6 = var_0_0()
local var_0_7 = var_0_5.shape({
	id = var_0_5.number,
	status = var_0_5.string:is_optional(),
	type = var_0_5.number,
	subType = var_0_5.number,
	manufacturer = var_0_5.number,
	parentId = var_0_5.number,
	backboneId = var_0_5.number,
	key = var_0_5.string,
	systemLink = var_0_5.string:is_optional(),
	syncId = var_0_5.string
})

local function var_0_8(arg_1_0)
	return {
		timestamp = 0,
		multiInfo = 0,
		address = arg_1_0.id,
		class = var_0_2.class.CONTROLLER,
		type = var_0_3.buildNodeType(arg_1_0.type, arg_1_0.subType),
		manufacturer = arg_1_0.manufacturer,
		generalInfo1 = var_0_3.getEmptyGeneralInfo1(),
		generalInfo2 = var_0_3.getEmptyGeneralInfo2(),
		key = var_0_1(arg_1_0.key, "base64"),
		creationTime = {
			seconds = 0
		},
		status = var_0_4.statusToNumber("done"),
		master = arg_1_0.parentId,
		backbone = arg_1_0.backboneId,
		systemLink = arg_1_0.systemLink or ""
	}
end

local function var_0_9(arg_2_0, arg_2_1)
	return {
		id = arg_2_0.address,
		status = var_0_4.statusToVerbose(arg_2_0.status),
		type = var_0_2.getProfile(arg_2_0),
		subType = var_0_2.getSubProfile(arg_2_0),
		manufacturer = arg_2_0.manufacturer,
		parentId = arg_2_0.master,
		backboneId = arg_2_0.backbone,
		key = var_0_1(arg_2_0.key):tostring("base64"),
		systemLink = arg_2_0.status ~= var_0_2.status.Destroyed and arg_2_0.systemLink ~= "" and arg_2_0.systemLink or nil
	}
end

function var_0_6.new(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_0.dispatcher = arg_3_1
	arg_3_0.nodeManager = arg_3_2
	arg_3_0.log = arg_3_3

	function arg_3_1.remoteController(arg_4_0, arg_4_1)
		local var_4_0, var_4_1 = var_0_7:check_value(arg_4_0)

		if not var_4_0 then
			return false, var_4_1
		end

		arg_3_2:modifyNode(var_0_8(arg_4_0), var_0_2.action.UPDATE_OR_CREATE)

		return true
	end
end

function var_0_6.modified(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.dispatcher:push("remoteController", var_0_9(arg_5_1, arg_5_2))
end

return var_0_6
