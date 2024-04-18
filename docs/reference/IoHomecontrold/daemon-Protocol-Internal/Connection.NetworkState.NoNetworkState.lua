local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.Promise")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.AbstractNetworkState")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.NetworkStates")
local var_0_4 = var_0_0(var_0_2)

function var_0_4.new(arg_1_0, arg_1_1)
	var_0_2.new(arg_1_0, var_0_3.NO_NETWORK, arg_1_1)
end

function var_0_4.onStartWAC(arg_2_0)
	if arg_2_0.connmanClient:hasWiFi() then
		return var_0_3.WIFI_WAC
	end
end

function var_0_4.onStartAP(arg_3_0)
	if arg_3_0.connmanClient:hasWiFi() then
		return var_0_3.WIFI_AP
	end
end

function var_0_4.gotoWiFi(arg_4_0)
	if arg_4_0.connmanClient:hasWiFi() and arg_4_0.connmanClient:isWiFiConfigured() then
		return var_0_3.WIFI_SCAN
	end
end

function var_0_4.onWiFiConfigured(arg_5_0)
	return arg_5_0:gotoWiFi()
end

function var_0_4.onServiceChange(arg_6_0)
	return arg_6_0:gotoWiFi()
end

function var_0_4.enter(arg_7_0)
	if arg_7_0.connmanClient:hasEthernet() then
		return var_0_1.resolve(var_0_3.ETHERNET)
	end

	return var_0_1.resolve(arg_7_0:gotoWiFi())
end

return var_0_4
