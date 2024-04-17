import("Overkiz.HomeAutomation.Trigger.Proxy.Launcher")
import("Overkiz.HomeAutomation.Protocol.RTD.groups")

local var_0_0 = Launcher("rtd")

function var_0_0.launched(arg_1_0, arg_1_1)
	local var_1_0 = groups[arg_1_1.groupid]

	if var_1_0 then
		var_1_0:launch(arg_1_1.launchid, arg_1_1.t, nil)
	end
end

function var_0_0.canceled(arg_2_0, arg_2_1)
	local var_2_0 = groups[arg_2_1.groupid]

	if var_2_0 then
		var_2_0:launch(arg_2_1.launchid, arg_2_1.t, arg_2_1.tag)
	end
end

return var_0_0
