local var_0_0 = require("bit")
local var_0_1 = require("Overkiz.Time")
local var_0_2 = require("Overkiz.Type.ByteArray")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Misc")
local var_0_5 = {}
local var_0_6 = {
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0
}
local var_0_7 = {
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0
}
local var_0_8 = {
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	1
}

local function var_0_9(arg_1_0)
	local var_1_0 = {}

	for iter_1_0 = 1, #arg_1_0 do
		var_1_0[iter_1_0] = arg_1_0[iter_1_0]
	end

	return var_1_0
end

function var_0_5.getEmptyGeneralInfo1()
	return var_0_2(var_0_6)
end

function var_0_5.getEmptyGeneralInfo2()
	return var_0_2(var_0_7)
end

function var_0_5.emptyKey()
	return var_0_2(var_0_8)
end

function var_0_5.nullCreationTime()
	return {
		nanoseconds = 0,
		seconds = var_0_1.Real.now().seconds
	}
end

function var_0_5.getEmptyBusTemplate()
	return {
		manufacturer = 0,
		type = 0,
		master = 0,
		backbone = 0,
		multiInfo = 0,
		address = 0,
		timestamp = 0,
		class = 0,
		extends = false,
		generalInfo1 = var_0_5.getEmptyGeneralInfo1(),
		generalInfo2 = var_0_5.getEmptyGeneralInfo2(),
		key = var_0_5.emptyKey(),
		creationTime = var_0_5.nullCreationTime(),
		status = var_0_4.statusToNumber("done")
	}
end

function var_0_5.buildEmptyStackTemplate(arg_7_0)
	return {
		master = 0,
		backbone = 0,
		settings = "",
		extends = false,
		class = var_0_3.class.STACK,
		address = arg_7_0,
		type = var_0_3.type.STACK_MASTER,
		manufacturer = var_0_3.manufacturers.Somfy,
		generalInfo1 = var_0_5.getEmptyGeneralInfo1(),
		generalInfo2 = var_0_5.getEmptyGeneralInfo2(),
		creationTime = {
			seconds = 0
		},
		status = var_0_4.statusToNumber("done"),
		revision = {
			hardware = {
				0,
				0,
				0
			},
			software = {
				0,
				0,
				0,
				0
			}
		},
		key = var_0_5.emptyKey(),
		oldKey = var_0_5.emptyKey()
	}
end

function var_0_5.buildNodeType(arg_8_0, arg_8_1)
	return var_0_0.lshift(arg_8_0, 6) + arg_8_1
end

function var_0_5.buildSensorNodeType(arg_9_0)
	return var_0_0.lshift(arg_9_0, 6)
end

function var_0_5.getNodeTypeAndNodeSubType(arg_10_0)
	local var_10_0 = var_0_0.band(var_0_0.rshift(arg_10_0, 6), 1023)
	local var_10_1 = var_0_0.band(arg_10_0, 63)

	return var_10_0, var_10_1
end

function var_0_5.generalInfoToByteTable(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_1
	local var_11_1 = arg_11_2

	if arg_11_0 == var_0_3.class.STACK or arg_11_0 == var_0_3.class.CONTROLLER then
		var_11_0 = var_0_5.getEmptyGeneralInfo1()
		var_11_1 = var_0_5.getEmptyGeneralInfo2()
	end

	if not var_11_0 or not var_11_1 then
		error("generalInfo1 & generalInfo2 must be set for class: " .. tostring(arg_11_0))
	end

	return {
		var_0_9(var_11_0),
		var_0_9(var_11_1)
	}
end

return var_0_5
