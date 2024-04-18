local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.AbstractNetworkState")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.NetworkStates")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Connman.TechnologyTypes")
local var_0_4 = require("Overkiz.Kizbox.Constants.WifiStatus")
local var_0_5 = var_0_0(var_0_1)

function var_0_5.new(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.wifiManager = arg_1_2

	var_0_1.new(arg_1_0, var_0_2.WIFI_SCAN, arg_1_1)
end

function var_0_5.tryToConnect(arg_2_0, arg_2_1)
	if arg_2_0.connmanClient:isConnectedToTargetWiFi() then
		return var_0_2.WIFI_STA
	end

	local var_2_0 = arg_2_0.connmanClient:getTechnology(var_0_3.WIFI)

	if var_2_0 then
		if arg_2_0.connmanClient:tryToConnectWiFi() then
			return
		end

		if arg_2_1 then
			var_2_0.service:scan()
		end
	else
		arg_2_0.wifiManager:setStatus(var_0_4.WAN_DOWN)
	end
end

function var_0_5.onStartWAC(arg_3_0)
	return var_0_2.WIFI_WAC
end

function var_0_5.onStartAP(arg_4_0)
	return var_0_2.WIFI_AP
end

function var_0_5.onWiFiConfigured(arg_5_0)
	return arg_5_0:tryToConnect(true)
end

function var_0_5.onServiceChange(arg_6_0)
	return arg_6_0:tryToConnect()
end

function var_0_5.onWiFiConnected(arg_7_0)
	return var_0_2.WIFI_STA
end

function var_0_5.enter(arg_8_0)
	return arg_8_0.connmanClient:enableTechnology(var_0_3.WIFI):next(function()
		return arg_8_0:tryToConnect(true)
	end)
end

return var_0_5
