local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.AbstractNetworkState")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.NetworkStates")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Connman.TechnologyTypes")
local var_0_4 = var_0_0(var_0_1)

function var_0_4.new(arg_1_0, arg_1_1)
	var_0_1.new(arg_1_0, var_0_2.ETHERNET, arg_1_1)
end

function var_0_4.onEthernetDisconnected(arg_2_0)
	return var_0_2.NO_NETWORK
end

function var_0_4.enter(arg_3_0)
	return arg_3_0.connmanClient:disableTechnology(var_0_3.WIFI)
end

function var_0_4.leave(arg_4_0)
	return arg_4_0.connmanClient:enableTechnology(var_0_3.WIFI)
end

return var_0_4
