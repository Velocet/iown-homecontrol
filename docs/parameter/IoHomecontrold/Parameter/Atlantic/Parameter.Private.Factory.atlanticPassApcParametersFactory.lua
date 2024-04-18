local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Factory.ManufacturerObjectsFactory")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_2 = require("Overkiz.OOP.Class")
local var_0_3 = require("bit")
local var_0_4 = var_0_2(var_0_0)

function var_0_4.new(arg_1_0)
	var_0_0.new(arg_1_0, var_0_1)
end

function var_0_4.getParameterId(arg_2_0, arg_2_1, arg_2_2)
	return var_0_3.bigBAnd(arg_2_1, 4294901760) + arg_2_2[1] * var_0_3.shiftByte(1) + arg_2_2[2]
end

return (var_0_4())
