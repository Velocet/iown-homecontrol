import("Overkiz.HomeAutomation.Protocol.RTDS.Command.Originator")

local var_0_0 = Originator("/com/overkiz/Application/Lua/HomeAutomation/Protocol/RTDS/Command/Originator")

function var_0_0.progress(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	for iter_1_0, iter_1_1 in pairs(arg_1_0.listeners) do
		iter_1_1:progress(arg_1_1, arg_1_2, arg_1_3)
	end
end

function var_0_0.add(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.listeners[arg_2_1] = arg_2_2
end

function var_0_0.remove(arg_3_0, arg_3_1)
	arg_3_0.listeners[arg_3_1] = nil
end

var_0_0:start()

var_0_0.listeners = {}

return var_0_0
