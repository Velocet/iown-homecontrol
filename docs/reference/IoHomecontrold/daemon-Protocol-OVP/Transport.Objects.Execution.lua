local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Transport.Objects.Execution")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.Command.manager")
local var_0_3 = var_0_0(var_0_1)

function var_0_3.new(arg_1_0, arg_1_1, arg_1_2)
	var_0_1.new(arg_1_0, arg_1_1, var_0_2, "Ovp", arg_1_2)
end

return var_0_3
