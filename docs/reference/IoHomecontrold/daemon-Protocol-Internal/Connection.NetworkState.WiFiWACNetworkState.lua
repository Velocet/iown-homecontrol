local var_0_0 = require("pl.config")
local var_0_1 = require("Overkiz.OOP.Class")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.AbstractNetworkState")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.NetworkStates")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Connman.TechnologyTypes")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.Internal.conf")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.Internal.modules")
local var_0_9 = require("Overkiz.timeUtils")
local var_0_10 = require("Overkiz.Promise")
local var_0_11 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.WPASupplicant.Service")
local var_0_12 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.WPASupplicant.Interface")
local var_0_13 = require("Overkiz.Bus.Variant")
local var_0_14 = 5
local var_0_15 = var_0_13("i", 2)
local var_0_16 = var_0_1(var_0_4)

function var_0_16.new(arg_1_0, arg_1_1)
	var_0_4.new(arg_1_0, var_0_5.WIFI_WAC, arg_1_1)

	arg_1_0.apConfig = var_0_0.read(var_0_7.wifiAPConfigFile)
	arg_1_0.apVendorElements = nil
end

function var_0_16.onStartWAC(arg_2_0)
	return arg_2_0:disableWAC():next(function()
		return arg_2_0:enableWAC(0)
	end)
end

function var_0_16.onStartAP(arg_4_0)
	return var_0_5.WIFI_AP
end

function var_0_16.onStopAP(arg_5_0)
	return var_0_5.NO_NETWORK
end

function var_0_16.enableWAC(arg_6_0, arg_6_1)
	if not arg_6_0.apConfig or not arg_6_0.apConfig.SSID then
		return var_0_10.reject("Cannot enter WIFI_WAC mode, ap configuration is incomplete or missing")
	end

	return arg_6_0.connmanClient:enableTechnology(var_0_6.WIFI):next(function()
		return var_0_11:Get("fi.w1.wpa_supplicant1", "Interfaces")
	end):next(function(arg_8_0)
		if not arg_8_0[1] then
			error("No interfaces")
		end

		arg_6_0.interface = var_0_12(arg_8_0[1])

		if arg_6_0.apVendorElements then
			return arg_6_0.interface:Set("fi.w1.wpa_supplicant1.Interface", "ApVendorElements", arg_6_0.apVendorElements)
		else
			return var_0_10.resolve()
		end
	end):next(function()
		return arg_6_0.interface:AddNetwork({
			key_mgmt = "NONE",
			ssid = arg_6_0.apConfig.SSID .. "_WAC",
			mode = var_0_15
		})
	end):next(function(arg_10_0)
		arg_6_0.apNetworkPath = arg_10_0

		return arg_6_0.interface:SelectNetwork(arg_10_0)
	end):next(nil, function(arg_11_0)
		if arg_6_1 < var_0_14 then
			var_0_2:warning("Retry after failing to create interface: ", arg_11_0)

			return var_0_9.asyncSleep(500):next(function()
				return arg_6_0:enableWAC(arg_6_1 + 1)
			end)
		else
			return var_0_10.reject(arg_11_0)
		end
	end)
end

function var_0_16.disableWAC(arg_13_0)
	local var_13_0 = arg_13_0.interface
	local var_13_1 = arg_13_0.apNetworkPath

	if not var_13_1 then
		return var_0_10.resolve()
	end

	arg_13_0.interface = nil
	arg_13_0.apNetworkPath = nil

	return var_13_0:RemoveNetwork(var_13_1):next(function()
		return arg_13_0.connmanClient:disableTechnology(var_0_6.WIFI)
	end)
end

function var_0_16.enter(arg_15_0)
	var_0_8.removeService("webserver", true)

	return arg_15_0:enableWAC(0)
end

function var_0_16.leave(arg_16_0)
	return arg_16_0:disableWAC():next(function()
		var_0_8.addService("webserver")
		var_0_3:setEvent("wifi", "stopAP")
	end)
end

return var_0_16
