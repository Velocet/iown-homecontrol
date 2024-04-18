local var_0_0 = require("Overkiz.Persistence")
local var_0_1 = require("Overkiz.Promise")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.conf")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.Common.systemex")
local var_0_6 = require("Overkiz.Kizbox.Constants.WifiModes")
local var_0_7 = require("Overkiz.Kizbox.Constants.WifiStatus")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Connman.ConnmanClient")
local var_0_9 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Connman.TechnologyTypes")
local var_0_10 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.NetworkStates")
local var_0_11 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.NoNetworkState")
local var_0_12 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.EthernetNetworkState")
local var_0_13 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.WiFiAPNetworkState")
local var_0_14 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.WiFiWACNetworkState")
local var_0_15 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.WiFiScanNetworkState")
local var_0_16 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkState.WiFiStationNetworkState")
local var_0_17 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.NetworkStatus")
local var_0_18 = require("Overkiz.HomeAutomation.Protocol.Internal.bus.NetworkService")
local var_0_19 = require("Overkiz.OOP.Singleton")
local var_0_20 = require("Overkiz.EventEmitter")
local var_0_21 = require("Overkiz.asyncFs")
local var_0_22 = "wifi/0"
local var_0_23 = {
	PASSPHRASE = "passphrase",
	SSID = "ssid"
}
local var_0_24 = {
	[var_0_10.NO_NETWORK] = var_0_6.Disconnected,
	[var_0_10.ETHERNET] = var_0_6.Disconnected,
	[var_0_10.WIFI_WAC] = var_0_6.AP,
	[var_0_10.WIFI_AP] = var_0_6.AP,
	[var_0_10.WIFI_SCAN] = var_0_6.Disconnected,
	[var_0_10.WIFI_STA] = var_0_6.Infra
}
local var_0_25 = {
	[var_0_10.NO_NETWORK] = var_0_17.DOWN,
	[var_0_10.ETHERNET] = var_0_17.UP,
	[var_0_10.WIFI_WAC] = var_0_17.UP,
	[var_0_10.WIFI_AP] = var_0_17.UP,
	[var_0_10.WIFI_SCAN] = var_0_17.DOWN,
	[var_0_10.WIFI_STA] = var_0_17.UP
}
local var_0_26 = {
	SignalStrengthChange = "SignalStrengthChange",
	ModeChange = "ModeChange",
	StatusChange = "StatusChange",
	IPv4AddressChange = "IPv4AddressChange"
}
local var_0_27 = var_0_19(var_0_20)

var_0_27.Events = var_0_26

local var_0_28
local var_0_29
local var_0_30
local var_0_31
local var_0_32
local var_0_33 = ""

function var_0_27.getConfig(arg_1_0)
	local var_1_0 = var_0_28:getWiFiConfig()

	var_1_0.countryCode = var_0_33

	return var_1_0
end

function var_0_27.clearConfig(arg_2_0)
	return arg_2_0:tryConfig(nil)
end

function var_0_27.tryConfig(arg_3_0, arg_3_1)
	return var_0_21.deleteExistingFile(var_0_3.connmanAutoConfigFile):catch(function(arg_4_0)
		var_0_2:warning("Could not remove", var_0_3.connmanAutoConfigFile, ":", arg_4_0)
	end):finally(function()
		arg_3_0:applyConfig(arg_3_1)
	end)
end

function var_0_27.applyConfig(arg_6_0, arg_6_1)
	var_0_28:setWiFiConfig(arg_6_1)
	arg_6_0:setCountryCode(arg_6_1 and arg_6_1.countryCode)
	arg_6_0:handleEvent("onWiFiConfigured")
	arg_6_0:setStatus(var_0_7.RECEIVED_CONFIG)
end

function var_0_27.getSavedConfig(arg_7_0)
	return {
		ssid = var_0_32:get(var_0_23.SSID),
		passphrase = var_0_32:get(var_0_23.PASSPHRASE),
		countryCode = var_0_33
	}
end

function var_0_27.hasSavedConfig(arg_8_0)
	local var_8_0 = var_0_32:get(var_0_23.SSID)

	return var_8_0 ~= nil and var_8_0 ~= ""
end

function var_0_27.saveConfig(arg_9_0)
	arg_9_0:setConfig(arg_9_0:getConfig())
end

function var_0_27.revertSavedConfig(arg_10_0)
	arg_10_0:tryConfig(arg_10_0:getSavedConfig())
end

function var_0_27.clearSavedConfig(arg_11_0)
	return arg_11_0:clearConfig():finally(function()
		var_0_32:clear()
		arg_11_0:handleEvent("onWiFiCleared")
	end)
end

function var_0_27.setConfig(arg_13_0, arg_13_1)
	var_0_32:put(var_0_23.SSID, arg_13_1 and arg_13_1.ssid or "")
	var_0_32:put(var_0_23.PASSPHRASE, arg_13_1 and arg_13_1.passphrase or "")
	arg_13_0:tryConfig(arg_13_1)

	if not arg_13_1 or not arg_13_1.ssid or arg_13_1.ssid == "" then
		var_0_4:setEvent("wifi", "noConfig")
	end
end

function var_0_27.setAPVendorElements(arg_14_0, arg_14_1)
	var_0_29[var_0_10.WIFI_WAC].apVendorElements = arg_14_1

	var_0_4:setEvent("wifi", "hkReady")
end

function var_0_27.getMode(arg_15_0)
	return var_0_24[var_0_30.name]
end

function var_0_27.getStatus(arg_16_0)
	return var_0_25[var_0_30.name]
end

function var_0_27.setMode(arg_17_0, arg_17_1)
	if arg_17_1 == var_0_6.AP then
		return arg_17_0:handleEvent("onStartAP")
	else
		return arg_17_0:handleEvent("onStopAP")
	end
end

function var_0_27.setStatus(arg_18_0, arg_18_1)
	arg_18_0:emit(var_0_26.StatusChange, arg_18_1)
end

function var_0_27.getSignalStrength(arg_19_0)
	return var_0_28:getWiFiSignalStrength()
end

function var_0_27.setCountryCode(arg_20_0, arg_20_1)
	if not arg_20_1 or arg_20_1 == "" or arg_20_1 == var_0_33 then
		return
	end

	var_0_33 = arg_20_1

	if var_0_28:hasWiFi() then
		arg_20_0:updateCountryCode()
	end
end

function var_0_27.updateCountryCode(arg_21_0)
	if not var_0_33 or var_0_33 == "" then
		var_0_2:warning("Country code is not yet known, cannot configure WiFi country code.")

		return
	end

	if not var_0_3.wificountryFile or var_0_3.wificountryFile == "" then
		var_0_2:warning("WiFi country file is not configured.")

		return
	end

	if not var_0_5.executeWithResult("sh " .. var_0_3.wificountryFile .. " " .. var_0_33) then
		var_0_2:error("error when calling wifi script ")
	end
end

function var_0_27.updateWifiNode(arg_22_0, arg_22_1)
	if not arg_22_0.nodeManager:getNode(var_0_22) then
		arg_22_0.nodeManager:saveAndReload({
			type = "wifi",
			id = var_0_22
		})
	end

	arg_22_0.nodeManager:updateNodeStatus(var_0_22, arg_22_1 and "done" or "unavailable")
end

function var_0_27.handleEvent(arg_23_0, arg_23_1)
	var_0_2:debug("[WifiManager] receive event " .. arg_23_1)

	if var_0_31 then
		return var_0_31:next(function()
			return arg_23_0:handleEvent(arg_23_1)
		end)
	end

	var_0_2:debug("[WifiManager] handle event " .. arg_23_1)

	local var_23_0 = var_0_30[arg_23_1](var_0_30)

	if not var_23_0 then
		var_0_2:debug("[WifiManager][handleEvent] no new state set ; current state unchanged: " .. var_0_30.name)
	elseif var_0_29[var_23_0] == var_0_30 then
		var_0_2:debug("[WifiManager][handleEvent] new state is same as current one: " .. var_0_30.name)
	end

	if var_23_0 ~= nil and var_0_29[var_23_0] ~= var_0_30 then
		local var_23_1

		var_0_31 = arg_23_0:changeState(var_23_0):next(nil, function(arg_25_0)
			var_0_2:error("Error while changing state to ", var_23_0, arg_25_0)
		end):next(function()
			var_0_2:debug("Transition done ", var_23_0)

			var_23_1 = true
			var_0_31 = nil
		end)

		if var_23_1 then
			var_0_31 = nil
		end

		return var_0_31
	end

	return var_0_1.resolve()
end

function var_0_27.getLocalIPAddress(arg_27_0)
	return var_0_28:getLocalIPAddress()
end

function var_0_27.changeState(arg_28_0, arg_28_1)
	var_0_2:info("[WifiManager] state change to " .. arg_28_1)

	return var_0_30:leave():next(function()
		var_0_30 = var_0_29[arg_28_1]

		return var_0_30:enter()
	end):next(function(arg_30_0)
		var_0_2:debug("WifiManager:changeState currentState is " .. var_0_30.name)
		arg_28_0:emit(var_0_26.ModeChange, arg_28_0:getMode())
		var_0_4:setEvent("network", arg_28_0:getStatus())

		if arg_30_0 ~= nil and var_0_29[arg_30_0] ~= var_0_30 then
			return arg_28_0:changeState(arg_30_0)
		end
	end)
end

function var_0_27.scan(arg_31_0)
	arg_31_0:setStatus(var_0_7.SCANNING_WIFI)

	return var_0_28:enableTechnology(var_0_9.WIFI):next(function()
		return var_0_28:scanWiFi()
	end)
end

function var_0_27.init(arg_33_0, arg_33_1, arg_33_2)
	var_0_20.new(arg_33_0)

	arg_33_0.nodeManager = arg_33_1
	var_0_28 = var_0_8()

	local var_33_0, var_33_1 = var_0_0.Layer("wifi", var_0_0.Type.UPDATE)

	if var_33_1 then
		var_0_2:error("Cannot open WiFi persistence: " .. tostring(var_33_1))
	end

	var_0_32 = var_33_0
	var_0_33 = ""

	arg_33_2:addListener(function(arg_34_0)
		if arg_34_0.rawStateId == "countryCode" and var_0_33 ~= arg_34_0.rawStatevalue then
			arg_33_0:setCountryCode(arg_34_0.rawStatevalue)
		end
	end)

	var_0_29 = {
		[var_0_10.NO_NETWORK] = var_0_11(var_0_28),
		[var_0_10.ETHERNET] = var_0_12(var_0_28),
		[var_0_10.WIFI_WAC] = var_0_14(var_0_28),
		[var_0_10.WIFI_AP] = var_0_13(var_0_28),
		[var_0_10.WIFI_SCAN] = var_0_15(var_0_28, arg_33_0),
		[var_0_10.WIFI_STA] = var_0_16(var_0_28, function(arg_35_0)
			arg_33_0:emit(var_0_26.SignalStrengthChange, arg_35_0)
		end)
	}
	var_0_30 = var_0_29[var_0_10.NO_NETWORK]

	var_0_4:addFunctionsListener({
		modified = function(arg_36_0, arg_36_1)
			var_0_2:debug("[WifiManager] ui event " .. arg_36_1)

			if arg_36_1 == "wifiWACMode" then
				arg_33_0:handleEvent("onStartWAC")
			elseif arg_36_1 == "wifiAPMode" then
				arg_33_0:setMode(var_0_6.AP)
			elseif arg_36_1 == "wifiInfraMode" then
				arg_33_0:setMode(var_0_6.Infra)
			elseif arg_36_1 == "bluetoothStart" then
				var_0_28:enableTechnology(var_0_9.BLUETOOTH)
			elseif arg_36_1 == "bluetoothStop" then
				var_0_28:disableTechnology(var_0_9.BLUETOOTH)
			elseif arg_36_1 == "wifiReset" then
				arg_33_0:clearSavedConfig()
			end
		end
	})

	local function var_33_2()
		arg_33_0:emit(var_0_26.IPv4AddressChange, var_0_28:getLocalIPAddress())
	end

	var_0_28:on(var_0_8.Events.EthernetConnected, function()
		arg_33_0:handleEvent("onEthernetConnected")
		var_0_4:setEvent("wifi", "ready")
		var_33_2()
	end)
	var_0_28:on(var_0_8.Events.EthernetDisconnected, function()
		arg_33_0:handleEvent("onEthernetDisconnected")
		var_33_2()
	end)
	var_0_28:on(var_0_8.Events.WiFiAdded, function()
		arg_33_0:updateWifiNode(true)
		arg_33_0:updateCountryCode()
		arg_33_0:handleEvent("onWiFiAdded")
		arg_33_0:applyConfig(arg_33_0:getSavedConfig())

		if arg_33_0:hasSavedConfig() then
			var_0_4:setEvent("wifi", "ready")
		else
			var_0_4:setEvent("wifi", "noConfig")
		end
	end)
	var_0_28:on(var_0_8.Events.WiFiRemoved, function()
		arg_33_0:updateWifiNode(false)
		arg_33_0:handleEvent("onWiFiRemoved")
	end)
	var_0_28:on(var_0_8.Events.ServiceChange, function()
		arg_33_0:setStatus(var_0_7.CONNECTING_WIFI)
		arg_33_0:handleEvent("onServiceChange")
	end)
	var_0_28:on(var_0_8.Events.SignalStrength, function()
		arg_33_0:handleEvent("onSignalStrength")
	end)
	var_0_28:on(var_0_8.Events.WiFiConnected, function()
		arg_33_0:setStatus(var_0_7.CONNECTED_WIFI)
		arg_33_0:handleEvent("onWiFiConnected")
		var_33_2()
	end)
	var_0_28:on(var_0_8.Events.WiFiDisconnected, function()
		arg_33_0:handleEvent("onWiFiDisconnected")
		var_33_2()
	end)
	var_0_28:on(var_0_8.Events.WiFiWrongPassphrase, function()
		arg_33_0:setStatus(var_0_7.WRONG_WIFI_PASSPHRASE)
		arg_33_0:handleEvent("onWiFiWrongPassphrase")
	end)
	var_0_28:on(var_0_8.Events.IPChange, var_33_2)

	local var_33_3 = var_0_18(arg_33_0)

	for iter_33_0 in pairs(var_0_26) do
		arg_33_0:on(iter_33_0, function(...)
			return var_33_3["notify" .. iter_33_0](var_33_3, ...)
		end)
	end

	var_0_28:init()
end

return var_0_27
