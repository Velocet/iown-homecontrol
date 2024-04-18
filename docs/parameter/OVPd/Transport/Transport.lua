local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.Cloudlink.Dispatcher")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.log")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.OVP.Transport.Objects.Execution")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.OVP.Transport.Objects.Misc")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.OVP.Transport.Objects.State")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.OVP.Transport.Objects.Node")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.OVP.Transport.ActionGroups")
local var_0_8 = var_0_0()

function var_0_8.new(arg_1_0, arg_1_1)
	arg_1_0.dispatcher = var_0_1("ovp", {
		arg_1_1
	})

	var_0_3(arg_1_0.dispatcher, var_0_2)
	var_0_4(arg_1_0.dispatcher, var_0_2)
	var_0_5(arg_1_0.dispatcher, var_0_2)
	var_0_6(arg_1_0.dispatcher, var_0_2)
	var_0_7(arg_1_0.dispatcher, var_0_2)
end

return var_0_8
