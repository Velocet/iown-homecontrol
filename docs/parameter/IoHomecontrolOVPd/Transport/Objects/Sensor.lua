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
	configuration = var_0_5.array_of(var_0_5.shape({
		type = var_0_5.number,
		measuredValueType = var_0_5.number,
		minSensedValue = var_0_5.number,
		maxSensedValue = var_0_5.number,
		scaleFactor = var_0_5.number,
		resolutionValue = var_0_5.number,
		resolutionScaleFactor = var_0_5.number
	})),
	operatingMode = var_0_5.number,
	maxEventHandlers = var_0_5.number,
	minRefreshPeriod = var_0_5.number,
	generalInfo1 = var_0_5.string:is_optional(),
	generalInfo2 = var_0_5.string:is_optional(),
	mib = var_0_5.number:is_optional(),
	powerUpTimestamp = var_0_5.number:is_optional(),
	systemLink = var_0_5.string:is_optional(),
	syncId = var_0_5.string
})

local function var_0_8(arg_1_0)
	return {
		timestamp = 0,
		listeningStatus = 1,
		multiInfo = 0,
		listening = true,
		address = arg_1_0.id,
		class = var_0_2.class.SENSOR,
		type = var_0_3.buildSensorNodeType(arg_1_0.type),
		manufacturer = arg_1_0.manufacturer,
		generalInfo1 = arg_1_0.generalInfo1 and var_0_1(arg_1_0.generalInfo1, "base64") or var_0_3.getEmptyGeneralInfo1(),
		generalInfo2 = arg_1_0.generalInfo2 and var_0_1(arg_1_0.generalInfo2, "base64") or var_0_3.getEmptyGeneralInfo2(),
		key = arg_1_0.key and var_0_1(arg_1_0.key, "base64") or var_0_3.emptyKey(),
		creationTime = {
			seconds = 0
		},
		status = var_0_4.statusToNumber("done"),
		master = arg_1_0.parentId,
		backbone = arg_1_0.backboneId,
		configuration = arg_1_0.configuration,
		systemLink = arg_1_0.systemLink or "",
		operatingMode = arg_1_0.operatingMode,
		maxNumberOfEventHandled = arg_1_0.maxEventHandlers,
		minRefreshTimePeriod = arg_1_0.minRefreshPeriod
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
		configuration = arg_2_0.configuration,
		operatingMode = arg_2_0.operatingMode,
		maxEventHandlers = arg_2_0.maxNumberOfEventHandled,
		minRefreshPeriod = arg_2_0.minRefreshTimePeriod,
		key = var_0_1(arg_2_0.key):tostring("base64"),
		generalInfo1 = arg_2_0.generalInfo1:tostring("base64"),
		generalInfo2 = arg_2_0.generalInfo2:tostring("base64"),
		mib = arg_2_0.multiInfo,
		powerUpTimestamp = arg_2_0.timestamp,
		systemLink = arg_2_0.status ~= var_0_2.status.Destroyed and arg_2_0.systemLink ~= "" and arg_2_0.systemLink or nil
	}
end

function var_0_6.new(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_0.dispatcher = arg_3_1
	arg_3_0.nodeManager = arg_3_2
	arg_3_0.log = arg_3_3

	function arg_3_1.sensor(arg_4_0, arg_4_1)
		local var_4_0, var_4_1 = var_0_7:check_value(arg_4_0)

		if not var_4_0 then
			return false, var_4_1
		end

		arg_3_2:modifyNode(var_0_8(arg_4_0), var_0_2.action.UPDATE_OR_CREATE)

		return true
	end
end

function var_0_6.modified(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.dispatcher:push("sensor", var_0_9(arg_5_1, arg_5_2))
end

return var_0_6
