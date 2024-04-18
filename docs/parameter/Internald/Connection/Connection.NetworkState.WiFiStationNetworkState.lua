local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.Promise")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.AbstractNetworkState")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.NetworkStates")
local var_0_5 = var_0_0(var_0_3)

function var_0_5.new(arg_1_0, arg_1_1, arg_1_2)
	var_0_3.new(arg_1_0, var_0_4.WIFI_STA, arg_1_1)

	arg_1_0.signalStrengthListener = type(arg_1_2) == "function" and arg_1_2 or function()
		return
	end
end

function var_0_5.onStartWAC(arg_3_0)
	return var_0_4.WIFI_WAC
end

function var_0_5.onStartAP(arg_4_0)
	return var_0_4.WIFI_AP
end

function var_0_5.onWiFiCleared(arg_5_0)
	var_0_2:setEvent("wifi", "noConfig")
end

function var_0_5.onServiceChange(arg_6_0)
	if not arg_6_0.connmanClient:isConnectedToTargetWiFi() then
		return var_0_4.NO_NETWORK
	end

	arg_6_0:onSignalStrength()
end

function var_0_5.onSignalStrength(arg_7_0)
	local var_7_0 = arg_7_0.connmanClient:getWiFiSignalStrength()

	if var_7_0 and (var_7_0 - arg_7_0.signalStrength > 5 or arg_7_0.signalStrength - var_7_0 > 5) then
		arg_7_0.signalStrength = var_7_0

		arg_7_0.signalStrengthListener(arg_7_0.signalStrength)
	end
end

function var_0_5.enter(arg_8_0)
	local var_8_0 = arg_8_0.connmanClient:getWiFiSignalStrength()

	if var_8_0 then
		arg_8_0.signalStrength = var_8_0

		arg_8_0.signalStrengthListener(arg_8_0.signalStrength)
	end

	return var_0_1.resolve()
end

function var_0_5.leave(arg_9_0)
	return var_0_1.resolve()
end

return var_0_5
