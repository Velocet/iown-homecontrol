local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Rsoverkiz.RSOverkizAllParameter")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Rsoverkiz.RSOverkizFlowCounter")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Rsoverkiz.RSOverkizMD5Parameter")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Rsoverkiz.RSOverkizRebootCounter")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Rsoverkiz.RSOverkizSensorPressure")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Rsoverkiz.RSOverkizSerialNumber")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_8 = {}

var_0_8.name = "RSOverkiz"

function var_0_8.create(arg_1_0)
	if arg_1_0.manufacturer == var_0_0.manufacturers.Overkiz then
		var_0_7:create(var_0_1, arg_1_0, nil)
		var_0_7:create(var_0_2, arg_1_0, nil)
		var_0_7:create(var_0_3, arg_1_0, nil)
		var_0_7:create(var_0_4, arg_1_0, nil)
		var_0_7:create(var_0_5, arg_1_0, nil)
		var_0_7:create(var_0_6, arg_1_0, nil)
	end
end

return var_0_8
