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
	generalInfo1 = var_0_5.string,
	generalInfo2 = var_0_5.string,
	mib = var_0_5.number,
	powerUpTimestamp = var_0_5.number,
	systemLink = var_0_5.string:is_optional(),
	syncId = var_0_5.string
})

local function var_0_8(arg_1_0, arg_1_1)
	return {
		address = arg_1_0.id,
		class = arg_1_1,
		type = var_0_3.buildNodeType(arg_1_0.type, arg_1_0.subType),
		manufacturer = arg_1_0.manufacturer,
		generalInfo1 = var_0_1(arg_1_0.generalInfo1, "base64"),
		generalInfo2 = var_0_1(arg_1_0.generalInfo2, "base64"),
		key = var_0_3.emptyKey(),
		creationTime = {
			seconds = 0
		},
		status = var_0_4.statusToNumber("done"),
		master = arg_1_0.parentId,
		backbone = arg_1_0.backboneId,
		multiInfo = arg_1_0.mib,
		timestamp = arg_1_0.powerUpTimestamp,
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
		mib = arg_2_0.multiInfo,
		generalInfo1 = arg_2_0.generalInfo1:tostring("base64"),
		generalInfo2 = arg_2_0.generalInfo2:tostring("base64"),
		powerUpTimestamp = arg_2_0.timestamp,
		systemLink = arg_2_0.status ~= var_0_2.status.Destroyed and arg_2_0.systemLink ~= "" and arg_2_0.systemLink or nil
	}
end

function var_0_6.new(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
	arg_3_0.dispatcher = arg_3_1
	arg_3_0.nodeManager = arg_3_4
	arg_3_0.log = arg_3_5
	arg_3_0.name = arg_3_2
	arg_3_0.nodeClass = arg_3_3
	arg_3_1[arg_3_0.name] = function(arg_4_0, arg_4_1)
		local var_4_0, var_4_1 = var_0_7:check_value(arg_4_0)

		if not var_4_0 then
			return false, var_4_1
		end

		arg_3_4:modifyNode(var_0_8(arg_4_0, arg_3_0.nodeClass), var_0_2.action.UPDATE_OR_CREATE)

		return true
	end
end

function var_0_6.modified(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.dispatcher:push(arg_5_0.name, var_0_9(arg_5_1, arg_5_2))
end

return var_0_6
