local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Class.Abstract")
local var_0_2 = require("Overkiz.Type.ByteArray")
local var_0_3 = require("bit")
local var_0_4 = var_0_0(var_0_1)
local var_0_5 = 17
local var_0_6 = 1
local var_0_7 = {
	"address",
	"master",
	"backbone",
	"class",
	"type",
	"manufacturer",
	"generalInfo1",
	"generalInfo2",
	"key",
	"info"
}
local var_0_8 = {
	NodeType = 2,
	MaximalSensedValue = 6,
	ManufacturerId = 1,
	BackboneAddress = 15,
	ResolutionScaleFactor = 10,
	ResolutionValue = 9,
	MeasuredValueParameterType = 3,
	MinimalSensedValue = 4,
	MaxEventHandled = 12,
	ScaleFactor = 8,
	MinRefreshTimePeriod = 13,
	OperatingMode = 11
}

local function var_0_9(arg_1_0)
	local var_1_0 = var_0_2(var_0_5)

	var_1_0:writeUInt8(var_0_8.ManufacturerId, arg_1_0.manufacturer)
	var_1_0:writeUInt8(var_0_8.NodeType, var_0_3.rshift(arg_1_0.type, 6))
	var_1_0:writeUInt8(var_0_8.MeasuredValueParameterType, arg_1_0.configuration[var_0_6].measuredValueType)
	var_1_0:writeUInt16(var_0_8.MinimalSensedValue, arg_1_0.configuration[var_0_6].minSensedValue)
	var_1_0:writeUInt16(var_0_8.MaximalSensedValue, arg_1_0.configuration[var_0_6].maxSensedValue)
	var_1_0:writeUInt8(var_0_8.ScaleFactor, arg_1_0.configuration[var_0_6].scaleFactor)
	var_1_0:writeUInt8(var_0_8.ResolutionValue, arg_1_0.configuration[var_0_6].resolutionValue)
	var_1_0:writeUInt8(var_0_8.ResolutionScaleFactor, arg_1_0.configuration[var_0_6].resolutionScaleFactor)
	var_1_0:writeUInt8(var_0_8.OperatingMode, arg_1_0.operatingMode)
	var_1_0:writeUInt8(var_0_8.MaxEventHandled, arg_1_0.maxNumberOfEventHandled)
	var_1_0:writeUInt16(var_0_8.MinRefreshTimePeriod, arg_1_0.minRefreshTimePeriod)
	var_1_0:writeUInt24(var_0_8.BackboneAddress, arg_1_0.backbone)

	return var_1_0
end

function var_0_4.new(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	var_0_1.new(arg_2_0, arg_2_1, "sensor", arg_2_2, arg_2_3)
end

function var_0_4.format(arg_3_0)
	return {
		address = arg_3_0.address,
		backbone = arg_3_0.backbone,
		master = arg_3_0.master,
		class = arg_3_0.class,
		type = arg_3_0.type,
		manufacturer = arg_3_0.manufacturer,
		generalInfo1 = arg_3_0.generalInfo1,
		generalInfo2 = arg_3_0.generalInfo2,
		key = arg_3_0.key,
		info = arg_3_0.info or var_0_9(arg_3_0),
		status = arg_3_0.status,
		systemLink = arg_3_0.systemLink,
		listening = arg_3_0.listening,
		listeningStatus = arg_3_0.listeningStatus,
		configuration = arg_3_0.configuration,
		operatingMode = arg_3_0.operatingMode,
		maxNumberOfEventHandled = arg_3_0.maxNumberOfEventHandled,
		minRefreshTimePeriod = arg_3_0.minRefreshTimePeriod
	}
end

function var_0_4.fromStorage(arg_4_0, arg_4_1)
	return {
		address = arg_4_1.address,
		backbone = arg_4_1.backbone,
		master = arg_4_1.master,
		class = arg_4_1.class,
		type = arg_4_1.type,
		manufacturer = arg_4_1.manufacturer,
		generalInfo1 = arg_4_1.generalInfo1,
		generalInfo2 = arg_4_1.generalInfo2,
		key = arg_4_1.key,
		info = arg_4_1.info,
		status = arg_4_1.status,
		systemLink = arg_4_1.systemLink,
		listening = arg_4_1.listening,
		listeningStatus = arg_4_1.listeningStatus,
		configuration = arg_4_1.configuration,
		operatingMode = arg_4_1.operatingMode,
		maxNumberOfEventHandled = arg_4_1.maxNumberOfEventHandled,
		minRefreshTimePeriod = arg_4_1.minRefreshTimePeriod
	}
end

function var_0_4.getUnchangedAttributes(arg_5_0)
	return var_0_7
end

function var_0_4.nodeUpdate(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0._nodes[arg_6_1.address]

	if not var_6_0 or arg_6_1.listeningStatus == nil then
		arg_6_0._log:notice("[Sensor] Update " .. tostring(arg_6_1.address) .. " doesn't exist or listening status isn't set")

		return false
	end

	var_6_0.listeningStatus = arg_6_1.listeningStatus

	if #var_6_0.configuration ~= #arg_6_1.configuration then
		var_6_0.configuration = arg_6_1.configuration

		arg_6_0._log:notice("[Sensor] Update " .. tostring(arg_6_1.address) .. " configuration.")
	else
		arg_6_0._log:notice("[Sensor] Update " .. tostring(arg_6_1.address) .. " with listening " .. tostring(var_6_0.listeningStatus))
	end

	arg_6_0:saveNode(var_6_0)
	arg_6_0:emit(arg_6_0.Events.Update, arg_6_1, false)

	return true
end

return var_0_4
