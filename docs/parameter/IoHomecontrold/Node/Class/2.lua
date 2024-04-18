local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.HardwareVersion")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.SoftwareVersion")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.RadioCalibration")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.ProductionInformations")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.IoMd5")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.IoForceTransmissionManagement")
local var_0_6 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.StackSerialNumber")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_8 = {}

var_0_8.name = "Stack"

function var_0_8.create(arg_1_0)
	var_0_7:create(var_0_0, arg_1_0)
	var_0_7:create(var_0_1, arg_1_0)
	var_0_7:create(var_0_2, arg_1_0)
	var_0_7:create(var_0_3, arg_1_0)
	var_0_7:create(var_0_4, arg_1_0)
	var_0_7:create(var_0_5, arg_1_0)
	var_0_7:create(var_0_6, arg_1_0)
end

return var_0_8
