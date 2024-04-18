local var_0_0 = require("Overkiz.HomeAutomation.Local.Model.Remote.KeepAlive.KeepAliveInterface")
local var_0_1 = require("Overkiz.OOP.Class")(var_0_0)

function var_0_1.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.protocol = arg_1_1
	arg_1_0.log = arg_1_2
	arg_1_0.keepAliveManager = arg_1_3
end

function var_0_1.keepAlive(arg_2_0)
	if arg_2_0.keepAliveManager:isRunning() then
		arg_2_0.keepAliveManager:ping()
	else
		arg_2_0.log:info("[KeepAliveManager][keepAlive] isn't running, ping is rejected")
	end
end

return var_0_1
