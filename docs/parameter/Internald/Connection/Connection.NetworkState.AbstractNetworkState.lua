local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.Promise")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.NetworkStates")
local var_0_3 = var_0_0()

function var_0_3.new(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.name = arg_1_1
	arg_1_0.connmanClient = arg_1_2
end

function var_0_3.onEthernetConnected(arg_2_0)
	return var_0_2.ETHERNET
end

function var_0_3.onEthernetDisconnected(arg_3_0)
	return
end

function var_0_3.onWiFiAdded(arg_4_0)
	return
end

function var_0_3.onWiFiRemoved(arg_5_0)
	return
end

function var_0_3.onWiFiConfigured(arg_6_0)
	return
end

function var_0_3.onWiFiCleared(arg_7_0)
	return arg_7_0:onWiFiConfigured()
end

function var_0_3.onServiceChange(arg_8_0)
	return
end

function var_0_3.onSignalStrength(arg_9_0)
	return
end

function var_0_3.onWiFiConnected(arg_10_0)
	return
end

function var_0_3.onWiFiDisconnected(arg_11_0)
	return
end

function var_0_3.onWiFiWrongPassphrase(arg_12_0)
	return
end

function var_0_3.onStartWAC(arg_13_0)
	return
end

function var_0_3.onStartAP(arg_14_0)
	return
end

function var_0_3.onStopAP(arg_15_0)
	return
end

function var_0_3.enter(arg_16_0)
	return var_0_1.resolve()
end

function var_0_3.leave(arg_17_0)
	return var_0_1.resolve()
end

return var_0_3
