local var_0_0 = require("pl.config")
local var_0_1 = require("Overkiz.OOP.Class")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.AbstractNetworkState")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.NetworkStates")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Connman.TechnologyTypes")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.Internal.conf")
local var_0_8 = require("Overkiz.timeUtils")
local var_0_9 = require("Overkiz.Promise")
local var_0_10 = 5
local var_0_11 = var_0_1(var_0_4)

function var_0_11.new(arg_1_0, arg_1_1)
	var_0_4.new(arg_1_0, var_0_5.WIFI_AP, arg_1_1)

	arg_1_0.apConfig = var_0_0.read(var_0_7.wifiAPConfigFile)
end

function var_0_11.onStartWAC(arg_2_0)
	return var_0_5.WIFI_WAC
end

function var_0_11.onStopAP(arg_3_0)
	return var_0_5.NO_NETWORK
end

function var_0_11.enableAP(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0.connmanClient:getTechnology(var_0_6.WIFI)

	if var_4_0 then
		if var_4_0.properties.Tethering then
			return var_0_9.resolve()
		end

		return arg_4_0.connmanClient:enableTechnology(var_0_6.WIFI):next(function()
			return var_4_0.service:setProperty("TetheringIdentifier", arg_4_0.apConfig.SSID)
		end):next(function()
			return var_4_0.service:setProperty("TetheringPassphrase", arg_4_0.apConfig.PASSWORD)
		end):next(function()
			return var_4_0.service:setProperty("Tethering", true)
		end):next(nil, function(arg_8_0)
			if arg_4_1 < var_0_10 then
				var_0_2:warning("Retry after failing to enable tethering: ", arg_8_0)

				return var_0_8.asyncSleep(500):next(function()
					return arg_4_0:enableAP(arg_4_1 + 1)
				end)
			else
				return var_0_9.reject(arg_8_0)
			end
		end)
	end
end

function var_0_11.enter(arg_10_0)
	if not arg_10_0.apConfig or not arg_10_0.apConfig.SSID or not arg_10_0.apConfig.PASSWORD then
		var_0_2:error("Cannot enter WIFI_AP mode, ap configuration is incomplete or missing")

		return var_0_9.resolve()
	end

	return arg_10_0:enableAP(0):next(function()
		var_0_3:setEvent("wifi", "startAP")
	end)
end

function var_0_11.leave(arg_12_0)
	local var_12_0 = arg_12_0.connmanClient:getTechnology(var_0_6.WIFI)

	if var_12_0 then
		return var_12_0.service:setProperty("Tethering", false):next(function()
			var_0_3:setEvent("wifi", "stopAP")
		end)
	end

	return var_0_9.resolve()
end

return var_0_11
