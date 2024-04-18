local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("pl.List")
local var_0_2 = {
	versions = {
		valve = var_0_1({
			5,
			1,
			4,
			5,
			1,
			9,
			8
		}):map(string.byte),
		wiredThermostat = var_0_1({
			5,
			1,
			5,
			3,
			1,
			0,
			7
		}):map(string.byte),
		radioThermostat = var_0_1({
			5,
			1,
			5,
			5,
			0,
			0,
			3
		}):map(string.byte),
		evbUno = var_0_1({
			5,
			1,
			2,
			5,
			9,
			3,
			6
		}):map(string.byte),
		rollerShutterUno = var_0_1({
			5,
			1,
			2,
			5,
			9,
			3,
			6
		}):map(string.byte),
		rollerShutterRSUno = var_0_1({
			5,
			1,
			3,
			7,
			4,
			5,
			9
		}):map(string.byte),
		rollerShutterMicroModule = var_0_1({
			5,
			1,
			4,
			1,
			1,
			4,
			6
		}):map(string.byte),
		rollerShutterWithBatterySimu = var_0_1({
			5,
			1,
			5,
			8,
			7,
			5,
			9
		}):map(string.byte),
		rollerShutterWithBatterySomfy3Nm = var_0_1({
			5,
			1,
			5,
			1,
			2,
			9,
			7
		}):map(string.byte),
		rollerShutterWithBatterySomfy6Nm = var_0_1({
			5,
			1,
			5,
			1,
			2,
			9,
			8
		}):map(string.byte),
		rollerShutterWithBatterySomfy10Nm = var_0_1({
			5,
			1,
			5,
			1,
			2,
			9,
			9
		}):map(string.byte),
		awningUno = var_0_1({
			5,
			1,
			2,
			5,
			9,
			3,
			6
		}):map(string.byte),
		awningReceiverUno = var_0_1({
			5,
			1,
			3,
			7,
			1,
			3,
			4
		}):map(string.byte),
		awningPergolaUno = var_0_1({
			5,
			1,
			3,
			1,
			5,
			7,
			2
		}):map(string.byte),
		verticalExtAwningUno = var_0_1({
			5,
			1,
			2,
			5,
			9,
			3,
			6
		}):map(string.byte),
		screenReceiverUno = var_0_1({
			5,
			1,
			3,
			7,
			1,
			3,
			6
		}):map(string.byte),
		ideoiOB = var_0_1({
			5,
			1,
			5,
			1,
			4,
			1,
			5
		}):map(string.byte),
		ideoiSliding = var_0_1({
			5,
			1,
			5,
			5,
			0,
			1,
			1
		}):map(string.byte)
	},
	extractVersionFromGeneralInfo = function(arg_1_0)
		return var_0_0.tableExtract(arg_1_0[1], 1, 7)
	end
}

function var_0_2.isValve(arg_2_0)
	return var_0_0.tableCompare(var_0_2.extractVersionFromGeneralInfo(arg_2_0), var_0_2.versions.valve)
end

function var_0_2.isThermostat(arg_3_0)
	local var_3_0 = var_0_2.extractVersionFromGeneralInfo(arg_3_0)

	return var_0_0.tableCompare(var_3_0, var_0_2.versions.wiredThermostat) or var_0_0.tableCompare(var_3_0, var_0_2.versions.radioThermostat)
end

function var_0_2.isIdeoiOB(arg_4_0)
	local var_4_0 = var_0_2.extractVersionFromGeneralInfo(arg_4_0)

	return var_0_0.tableCompare(var_4_0, var_0_2.versions.ideoiOB)
end

function var_0_2.isUnoEVB(arg_5_0)
	local var_5_0 = var_0_2.extractVersionFromGeneralInfo(arg_5_0)

	return var_0_0.tableCompare(var_5_0, var_0_2.versions.evbUno)
end

function var_0_2.isUnoRollerShutter(arg_6_0)
	local var_6_0 = var_0_2.extractVersionFromGeneralInfo(arg_6_0)

	return var_0_0.tableCompare(var_6_0, var_0_2.versions.rollerShutterUno)
end

function var_0_2.isRSUnoRollerShutter(arg_7_0)
	local var_7_0 = var_0_2.extractVersionFromGeneralInfo(arg_7_0)

	return var_0_0.tableCompare(var_7_0, var_0_2.versions.rollerShutterRSUno)
end

function var_0_2.isMicroModuleRollerShutter(arg_8_0)
	local var_8_0 = var_0_2.extractVersionFromGeneralInfo(arg_8_0)

	return var_0_0.tableCompare(var_8_0, var_0_2.versions.rollerShutterMicroModule)
end

function var_0_2.isUnoHorizontalAwning(arg_9_0)
	local var_9_0 = var_0_2.extractVersionFromGeneralInfo(arg_9_0)

	return var_0_0.tableCompare(var_9_0, var_0_2.versions.awningUno)
end

function var_0_2.isReceiverUnoAwning(arg_10_0)
	local var_10_0 = var_0_2.extractVersionFromGeneralInfo(arg_10_0)

	return var_0_0.tableCompare(var_10_0, var_0_2.versions.awningReceiverUno)
end

function var_0_2.isPergolaHorizontalUnoAwning(arg_11_0)
	local var_11_0 = var_0_2.extractVersionFromGeneralInfo(arg_11_0)

	return var_0_0.tableCompare(var_11_0, var_0_2.versions.awningPergolaUno)
end

function var_0_2.isVerticalExtUnoAwning(arg_12_0)
	local var_12_0 = var_0_2.extractVersionFromGeneralInfo(arg_12_0)

	return var_0_0.tableCompare(var_12_0, var_0_2.versions.verticalExtAwningUno)
end

function var_0_2.isScreenReceiverUnoAwning(arg_13_0)
	local var_13_0 = var_0_2.extractVersionFromGeneralInfo(arg_13_0)

	return var_0_0.tableCompare(var_13_0, var_0_2.versions.screenReceiverUno)
end

function var_0_2.isRollerShutterWithBattery(arg_14_0)
	local var_14_0 = var_0_2.extractVersionFromGeneralInfo(arg_14_0)

	return var_0_0.tableCompare(var_14_0, var_0_2.versions.rollerShutterWithBatterySimu) or var_0_0.tableCompare(var_14_0, var_0_2.versions.rollerShutterWithBatterySomfy3Nm) or var_0_0.tableCompare(var_14_0, var_0_2.versions.rollerShutterWithBatterySomfy6Nm) or var_0_0.tableCompare(var_14_0, var_0_2.versions.rollerShutterWithBatterySomfy10Nm)
end

function var_0_2.isIdeoiSliding(arg_15_0)
	local var_15_0 = var_0_2.extractVersionFromGeneralInfo(arg_15_0)

	return var_0_0.tableCompare(var_15_0, var_0_2.versions.ideoiSliding)
end

return var_0_2
