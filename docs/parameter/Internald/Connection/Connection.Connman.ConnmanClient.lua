local var_0_0 = require("pl.tablex")
local var_0_1 = require("Overkiz.utilities")
local var_0_2 = require("Overkiz.OOP.Class")
local var_0_3 = require("Overkiz.EventEmitter")
local var_0_4 = require("Overkiz.Log")()
local var_0_5 = require("Overkiz.Promise")
local var_0_6 = require("Overkiz.timeUtils")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Connman.ConnmanAgent")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Connman.ConnmanManager")
local var_0_9 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Connman.ConnmanTechnology")
local var_0_10 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Connman.ConnmanService")
local var_0_11 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Connman.TechnologyTypes")
local var_0_12 = require("Overkiz.Bus.Manager")
local var_0_13 = {
	WiFiAdded = "WiFiAdded",
	SignalStrength = "SignalStrength",
	ServiceChange = "ServiceChange",
	TechnologyAdded = "TechnologyAdded",
	EthernetDisconnected = "EthernetDisconnected",
	WiFiDisconnected = "WiFiDisconnected",
	WiFiRemoved = "WiFiRemoved",
	IPChange = "IPChange",
	WiFiWrongPassphrase = "WiFiWrongPassphrase",
	EthernetConnected = "EthernetConnected",
	WiFiConnected = "WiFiConnected"
}
local var_0_14 = {
	Disconnected = "Disconnected",
	Connecting = "Connecting",
	Connected = "Connecting"
}
local var_0_15 = {
	idle = var_0_14.Disconnected,
	failure = var_0_14.Disconnected,
	association = var_0_14.Connecting,
	configuration = var_0_14.Connecting,
	ready = var_0_14.Connected,
	disconnect = var_0_14.Disconnected,
	online = var_0_14.Connected
}

local function var_0_16(arg_1_0)
	return var_0_15[arg_1_0] or var_0_14.Disconnected
end

local var_0_17 = var_0_2(var_0_3)

var_0_17.Events = var_0_13

function var_0_17.new(arg_2_0)
	var_0_3.new(arg_2_0)
end

function var_0_17.getTechnology(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in pairs(arg_3_0.knownTechnologies) do
		if iter_3_1.properties.Type == arg_3_1 then
			return iter_3_1
		end
	end

	return nil
end

function var_0_17.setTechnologyEnabled(arg_4_0, arg_4_1, arg_4_2)
	var_0_4:debug("[ConnmanClient] Trying to set " .. arg_4_1 .. " enabled to " .. tostring(arg_4_2))

	local var_4_0 = arg_4_0:getTechnology(arg_4_1)

	if var_4_0 then
		if var_4_0.properties.Powered == arg_4_2 then
			return var_0_5.resolve()
		else
			var_4_0.properties.Powered = arg_4_2

			return var_4_0.service:setProperty("Powered", arg_4_2)
		end
	end

	var_0_4:debug("[ConnmanClient] ... not ready yet, deferring ...")

	local var_4_1 = var_0_5()

	local function var_4_2()
		arg_4_0:removeListener(var_0_13.TechnologyAdded, var_4_2)
		var_4_1:resolve(arg_4_0:setTechnologyEnabled(arg_4_1, arg_4_2))
	end

	arg_4_0:on(var_0_13.TechnologyAdded, var_4_2)

	return var_4_1
end

function var_0_17.enableTechnology(arg_6_0, arg_6_1)
	return arg_6_0:setTechnologyEnabled(arg_6_1, true)
end

function var_0_17.disableTechnology(arg_7_0, arg_7_1)
	return arg_7_0:setTechnologyEnabled(arg_7_1, false)
end

function var_0_17.hasEthernet(arg_8_0)
	local var_8_0 = arg_8_0:getTechnology(var_0_11.ETHERNET)

	return var_8_0 and var_8_0.properties.Connected
end

function var_0_17.hasWiFi(arg_9_0)
	return not not arg_9_0:getTechnology(var_0_11.WIFI)
end

function var_0_17.isWiFiConfigured(arg_10_0)
	return arg_10_0.wifiConfig.ssid ~= nil and arg_10_0.wifiConfig.ssid ~= ""
end

function var_0_17.getWiFiSignalStrength(arg_11_0)
	local var_11_0 = arg_11_0:findWiFiService(arg_11_0.wifiConfig.ssid)

	if var_11_0 and var_0_16(var_11_0.properties.State) == var_0_14.Connected then
		return var_11_0.properties.Strength
	end

	return nil
end

function var_0_17.getWiFiConfig(arg_12_0)
	return var_0_1.tableShallowCopy(arg_12_0.wifiConfig)
end

function var_0_17.setWiFiConfig(arg_13_0, arg_13_1)
	arg_13_1 = var_0_1.tableShallowCopy(arg_13_1 or {})

	var_0_4:info("ConnmanClient:setWiFiConfig: ", arg_13_1.ssid)

	for iter_13_0, iter_13_1 in pairs(arg_13_0.knownServices or {}) do
		if iter_13_1.properties.Type == var_0_11.WIFI and (iter_13_1.properties.Name ~= arg_13_1.ssid or arg_13_0.wifiConfig.passphrase ~= arg_13_1.passphrase) then
			if iter_13_1.properties.Immutable then
				var_0_4:warning("Connman service '", iter_13_1.properties.Name, "' is immutable, can't remove it.")

				if var_0_16(iter_13_1.properties.State) == var_0_14.Connected then
					var_0_4:debug("ConnmanClient disconnect service:", iter_13_1.properties.Name)
					iter_13_1.service:disconnect()
				end
			else
				var_0_4:debug("ConnmanClient remove service:", iter_13_1.properties.Name)
				iter_13_1.service:remove()
			end
		end
	end

	arg_13_0.wifiConfig = arg_13_1
end

function var_0_17.findWiFiService(arg_14_0, arg_14_1)
	for iter_14_0, iter_14_1 in pairs(arg_14_0.knownServices) do
		if iter_14_1.properties.Name == arg_14_1 and iter_14_1.properties.Type == var_0_11.WIFI then
			return iter_14_1
		end
	end

	return nil
end

function var_0_17.listWiFi(arg_15_0)
	local var_15_0 = {}

	for iter_15_0, iter_15_1 in pairs(arg_15_0.knownServices) do
		if iter_15_1.properties.Name ~= nil and iter_15_1.properties.Type == var_0_11.WIFI then
			table.insert(var_15_0, iter_15_1.properties)
		end
	end

	table.sort(var_15_0, function(arg_16_0, arg_16_1)
		return arg_16_0.Strength > arg_16_1.Strength
	end)

	return var_15_0
end

function var_0_17.isConnectedToTargetWiFi(arg_17_0)
	local var_17_0 = arg_17_0:findWiFiService(arg_17_0.wifiConfig.ssid)

	if var_17_0 then
		return var_0_16(var_17_0.properties.State) == var_0_14.Connected
	end

	return false
end

function var_0_17.tryToConnectWiFi(arg_18_0)
	local var_18_0 = arg_18_0:findWiFiService(arg_18_0.wifiConfig.ssid)

	if var_18_0 then
		if var_0_16(var_18_0.properties.State) == var_0_14.Disconnected then
			var_18_0.service:connect()
		end

		return true
	else
		for iter_18_0, iter_18_1 in pairs(arg_18_0.knownServices) do
			if not iter_18_1.properties.Name and iter_18_1.properties.Type == var_0_11.WIFI then
				if var_0_16(iter_18_1.properties.State) == var_0_14.Disconnected then
					iter_18_1.service:connect()
				end

				return true
			end
		end
	end

	return false
end

function var_0_17.addTechnology(arg_19_0, arg_19_1, arg_19_2)
	if arg_19_2.Type ~= var_0_11.WIFI and arg_19_2.Type ~= var_0_11.ETHERNET and arg_19_2.Type ~= var_0_11.BLUETOOTH then
		return
	end

	local var_19_0 = var_0_9(arg_19_1)

	arg_19_0.knownTechnologies[arg_19_1] = {
		properties = arg_19_2,
		service = var_19_0
	}

	if arg_19_2.Type == var_0_11.WIFI then
		arg_19_0:emit(var_0_13.WiFiAdded)
		var_19_0:on(var_0_9.Events.PropertyChanged, function(arg_20_0, arg_20_1)
			arg_19_0.knownTechnologies[arg_19_1].properties[arg_20_0] = arg_20_1

			if arg_20_0 == "Connected" then
				if arg_20_1 then
					arg_19_0:emit(var_0_13.WiFiConnected)
				else
					arg_19_0:emit(var_0_13.WiFiDisconnected)
				end
			end
		end)
	elseif arg_19_2.Type == var_0_11.ETHERNET then
		if arg_19_2.Connected then
			arg_19_0:emit(var_0_13.EthernetConnected)
		end

		var_19_0:on(var_0_9.Events.PropertyChanged, function(arg_21_0, arg_21_1)
			arg_19_0.knownTechnologies[arg_19_1].properties[arg_21_0] = arg_21_1

			if arg_21_0 == "Connected" then
				if arg_21_1 then
					arg_19_0:emit(var_0_13.EthernetConnected)
				else
					arg_19_0:emit(var_0_13.EthernetDisconnected)
				end
			end
		end)
	end

	arg_19_0:emit(var_0_13.TechnologyAdded)
end

function var_0_17.removeTechnology(arg_22_0, arg_22_1)
	if not arg_22_0.knownTechnologies[arg_22_1] then
		return
	end

	if arg_22_0.knownTechnologies[arg_22_1].properties.Type == var_0_11.WIFI then
		arg_22_0:emit(var_0_13.WiFiRemoved)
	end

	if arg_22_0.knownTechnologies[arg_22_1].properties.Type == var_0_11.ETHERNET then
		arg_22_0:emit(var_0_13.EthernetDisconnected)
	end

	arg_22_0.knownTechnologies[arg_22_1].service:removeAllListeners()

	arg_22_0.knownTechnologies[arg_22_1] = nil
end

function var_0_17.addService(arg_23_0, arg_23_1, arg_23_2)
	var_0_4:debug("ConnmanClient:addService: ", arg_23_1)

	local var_23_0 = var_0_10(arg_23_1)

	arg_23_0.knownServices[arg_23_1] = {
		properties = arg_23_2,
		service = var_23_0
	}

	if arg_23_2.Type == var_0_11.WIFI and arg_23_2.Name ~= arg_23_0.wifiConfig.ssid and (arg_23_2.Favorite or arg_23_2.AutoConnect) and not arg_23_2.Immutable then
		var_0_4:info("Remove wrong configured service: ", arg_23_2.Name)
		var_23_0:remove()
	end

	var_23_0:on(var_0_10.Events.PropertyChanged, function(arg_24_0, arg_24_1)
		local var_24_0 = arg_23_0.knownServices[arg_23_1].properties.Name
		local var_24_1 = arg_23_0.knownServices[arg_23_1].properties[arg_24_0]

		var_0_4:debug("ConnmanClient: service:", var_24_0, ". Property[", arg_24_0, "] changed:", var_24_1, "->", arg_24_1)

		arg_23_0.knownServices[arg_23_1].properties[arg_24_0] = arg_24_1

		if arg_24_0 == "State" then
			arg_23_0:emit(var_0_13.ServiceChange)
		elseif arg_24_0 == "Strength" then
			arg_23_0:emit(var_0_13.SignalStrength)
		elseif arg_24_0 == "IPv4" then
			arg_23_0:emit(var_0_13.IPChange)
		end
	end)
end

function var_0_17.removeService(arg_25_0, arg_25_1)
	var_0_4:debug("ConnmanClient:removeService: ", arg_25_1)

	if arg_25_0.knownServices[arg_25_1] then
		arg_25_0.knownServices[arg_25_1].service:removeAllListeners()

		arg_25_0.knownServices[arg_25_1] = nil
	end
end

function var_0_17.scanWiFi(arg_26_0, arg_26_1)
	arg_26_1 = arg_26_1 or 4

	local function var_26_0(arg_27_0, arg_27_1)
		if arg_26_1 > 0 then
			return var_0_6.asyncSleep(arg_27_1):next(function()
				return arg_26_0:scanWiFi(arg_26_1 - 1)
			end)
		else
			return var_0_5.reject(arg_27_0)
		end
	end

	local var_26_1 = arg_26_0:getTechnology(var_0_11.WIFI)

	if var_26_1 then
		return var_26_1.service:scan():next(function()
			return var_0_6.asyncSleep(500)
		end):next(function()
			return arg_26_0:listWiFi()
		end):catch(function()
			return var_26_0("Scan failed", 100)
		end)
	else
		return var_26_0("No wifi", 100)
	end
end

function var_0_17.getLocalIPAddress(arg_32_0)
	local var_32_0

	for iter_32_0, iter_32_1 in pairs(arg_32_0.knownServices) do
		if var_0_16(iter_32_1.properties.State) == var_0_14.Connected then
			local var_32_1 = iter_32_1.properties.IPv4

			if var_32_1 and var_32_1.Address and var_32_1.Address ~= "" then
				var_32_0 = var_32_1.Address

				break
			end
		end
	end

	return var_32_0 or "N/A"
end

function var_0_17.init(arg_33_0)
	arg_33_0.connmanManager = var_0_8()
	arg_33_0.wifiConfig = {}
	arg_33_0.knownServices = {}

	local var_33_0 = "/overkiz/connman/agent"

	arg_33_0.connmanAgent = var_0_7(var_33_0)

	function arg_33_0.connmanAgent.getName(arg_34_0, arg_34_1)
		if arg_33_0.knownServices[arg_34_1] and not arg_33_0.knownServices[arg_34_1].properties.Name then
			return arg_33_0.wifiConfig.ssid
		end
	end

	function arg_33_0.connmanAgent.getPassphrase(arg_35_0, arg_35_1)
		if arg_33_0.knownServices[arg_35_1] then
			local var_35_0 = arg_33_0.knownServices[arg_35_1].properties.Name

			if not var_35_0 or var_35_0 == arg_33_0.wifiConfig.ssid then
				return arg_33_0.wifiConfig.passphrase
			end
		end
	end

	arg_33_0.connmanAgent:on(var_0_7.Events.WrongPassphrase, function()
		arg_33_0:emit(var_0_13.WiFiWrongPassphrase)
	end)
	arg_33_0.connmanManager:registerAgent(var_33_0)

	arg_33_0.appSeeker = var_0_12()

	function arg_33_0.appSeeker.nameOwnerChanged(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
		if arg_37_1 == "net.connman" and arg_37_3 ~= "" then
			var_0_4:debug("ConnmanClient : Connman restarted, register connman agent")
			arg_33_0.connmanManager:registerAgent(var_33_0)
		elseif arg_37_1 == "net.connman" and arg_37_3 == "" then
			var_0_4:warning("ConnmanClient : Connman stopped, waiting for restart...")
		end
	end

	arg_33_0.appSeeker:start()

	arg_33_0.knownTechnologies = {}

	arg_33_0.connmanManager:getTechnologies():next(function(arg_38_0)
		for iter_38_0, iter_38_1 in ipairs(arg_38_0) do
			local var_38_0 = iter_38_1[1]
			local var_38_1 = iter_38_1[2]

			arg_33_0:addTechnology(var_38_0, var_38_1)
		end
	end)
	arg_33_0.connmanManager:on(var_0_8.Events.TechnologyAdded, function(arg_39_0, arg_39_1)
		arg_33_0:addTechnology(arg_39_0, arg_39_1)
	end)
	arg_33_0.connmanManager:on(var_0_8.Events.TechnologyRemoved, function(arg_40_0)
		arg_33_0:removeTechnology(arg_40_0)
	end)
	arg_33_0.connmanManager:getServices():next(function(arg_41_0)
		for iter_41_0, iter_41_1 in ipairs(arg_41_0) do
			local var_41_0 = iter_41_1[1]
			local var_41_1 = iter_41_1[2]

			arg_33_0:addService(var_41_0, var_41_1)
		end

		arg_33_0:emit(var_0_13.ServiceChange)
	end)
	arg_33_0.connmanManager:on(var_0_8.Events.ServicesChanged, function(arg_42_0, arg_42_1)
		for iter_42_0, iter_42_1 in ipairs(arg_42_0) do
			local var_42_0 = iter_42_1[1]
			local var_42_1 = iter_42_1[2]

			if arg_33_0.knownServices[var_42_0] then
				arg_33_0.knownServices[var_42_0].properties = var_0_0.union(arg_33_0.knownServices[var_42_0].properties, var_42_1)
			else
				arg_33_0:addService(var_42_0, var_42_1)
			end
		end

		for iter_42_2, iter_42_3 in ipairs(arg_42_1) do
			arg_33_0:removeService(iter_42_3)
		end

		arg_33_0:emit(var_0_13.ServiceChange)
	end)
end

return var_0_17
