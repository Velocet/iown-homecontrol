local var_0_0 = require("Overkiz.Type.ByteArray")
local var_0_1 = require("bit")
local var_0_2 = {}

var_0_2.PASS_APC_SERVICE_CONTINIOUS_REMAPPING_MODE = 241
var_0_2.PASS_APC_SERVICE_CORRELATION_REMAPPING_MODE = 242

function var_0_2.buildDataWithContiniousRemapping(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	return {
		var_0_1.rshift(var_0_1.band(65280, arg_1_1), 8),
		var_0_1.band(255, arg_1_1),
		var_0_2.PASS_APC_SERVICE_CONTINIOUS_REMAPPING_MODE,
		var_0_1.rshift(var_0_1.band(65280, arg_1_1 + 1), 8),
		var_0_1.band(255, arg_1_1 + 1),
		var_0_1.rshift(var_0_1.band(65280, arg_1_2), 8),
		var_0_1.band(255, arg_1_2),
		var_0_1.rshift(var_0_1.band(65280, arg_1_3), 8),
		var_0_1.band(255, arg_1_3)
	}
end

function var_0_2.buildDataWithCorrelationRemapping(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	return var_0_0(5):writeUInt8(1, var_0_2.PASS_APC_SERVICE_CORRELATION_REMAPPING_MODE):writeUInt16(2, arg_2_2):writeUInt16(4, arg_2_1):append(arg_2_3)
end

return var_0_2
