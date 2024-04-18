local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.Promise")
local var_0_2 = require("Overkiz.Timer")
local var_0_3 = require("Overkiz.Time")
local var_0_4 = require("Overkiz.Kizbox.id")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.conf")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Admin.system")
local var_0_7 = require("Overkiz.OOP.Singleton")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_9 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_10 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.WifiManager")
local var_0_11 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.BluetoothCommands")
local var_0_12 = require("Overkiz.Kizbox.Constants.WifiModes")
local var_0_13 = require("Overkiz.Kizbox.Constants.WifiStatus")
local var_0_14 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Bluez.Advertisement")
local var_0_15 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Bluez.AdvertisingManager")
local var_0_16 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Bluez.GattApplication")
local var_0_17 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Bluez.GattService")
local var_0_18 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Bluez.GattCharacteristic")
local var_0_19 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Bluez.GattManager")
local var_0_20 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.Bluez.Adapter")
local var_0_21 = require("Overkiz.Bus.DBusObjectManagerClient")
local var_0_22 = require("openssl")
local var_0_23 = "org.bluez"
local var_0_24 = 500
local var_0_25 = var_0_7()
local var_0_26 = 1480
local var_0_27 = "09fc95c0-c111-11e3-9904-0002a5d5c52d"
local var_0_28 = "16fe0d80-c111-11e3-b8c8-0002a5d5c52a"
local var_0_29 = "16fe0d80-c111-11e3-b8c8-0002a5d5c52b"
local var_0_30 = "16fe0d80-c111-11e3-b8c8-0002a5d5c53%x"
local var_0_31 = "16fe0d80-c111-11e3-b8c8-0002a5d5c54%x"
local var_0_32 = "16fe0d80-c111-11e3-b8c8-0002a5d5c550"
local var_0_33 = "16fe0d80-c111-11e3-b8c8-0002a5d5c551"
local var_0_34 = "16fe0d80-c111-11e3-b8c8-0002a5d5c552"
local var_0_35 = "16fe0d80-c111-11e3-b8c8-0002a5d5c553"
local var_0_36 = "/com/overkiz/Application/Internal/Bluetooth/Advertisement"
local var_0_37 = 30
local var_0_38 = 900
local var_0_39 = 15

function var_0_25.init(arg_1_0)
	var_0_10:on(var_0_10.Events.StatusChange, function(arg_2_0)
		arg_1_0:_handleStatus(arg_2_0)
	end)

	local function var_1_0(arg_3_0)
		if arg_1_0.adapter then
			return
		end

		for iter_3_0, iter_3_1 in pairs(arg_3_0) do
			if iter_3_1["org.bluez.LEAdvertisingManager1"] then
				local var_3_0 = var_0_5.bluetoothKeyFile or os.getenv("INTERNAL_PATH_BT_KEY")

				arg_1_0.privateKey = var_0_22.pkey.read(var_0_22.bio.file(var_3_0), true)

				local function var_3_1()
					if not arg_1_0.pendingConfig then
						return var_0_1.resolve(false)
					end

					arg_1_0:setTimeout(var_0_38)

					return var_0_10:setMode(var_0_12.Infra):next(function()
						return true
					end)
				end

				local var_3_2 = "/com/Overkiz/HomeAutomation/Protocol/Internal/Connection/Bluez"
				local var_3_3 = var_0_17(var_3_2 .. "/1", "09fc95c0-c111-11e3-9904-0002a5d5c52d", true)
				local var_3_4 = var_0_18(var_0_28, {
					"write"
				}, var_3_3)

				var_3_4:onCharacteristicUpdate(function(arg_6_0)
					var_3_1():next(function(arg_7_0)
						if not arg_7_0 then
							return
						end

						arg_1_0.pendingConfig.ssid = var_0_22.base64(var_0_0.tableToRawStr(arg_6_0) .. "\n", false, false)

						var_0_10:tryConfig(arg_1_0.pendingConfig)
					end)
				end)
				var_3_3:addCharacteristic(var_3_4)

				local var_3_5 = var_0_18(var_0_29, {
					"write"
				}, var_3_3)

				var_3_5:onCharacteristicUpdate(function(arg_8_0)
					var_3_1():next(function(arg_9_0)
						if not arg_9_0 then
							return
						end

						local var_9_0 = var_0_22.base64(var_0_0.tableToRawStr(arg_8_0) .. "\n", false, false)

						arg_1_0.pendingConfig.passphrase = var_9_0 and arg_1_0.privateKey:decrypt(var_9_0, "oaep")

						if arg_1_0.pendingConfig.passphrase then
							var_0_10:tryConfig(arg_1_0.pendingConfig)
						else
							var_0_10:setStatus(var_0_13.WRONG_WIFI_PASSPHRASE)
						end
					end)
				end)
				var_3_3:addCharacteristic(var_3_5)

				arg_1_0.ssids = {}

				for iter_3_2 = 1, 14 do
					arg_1_0.ssids[iter_3_2] = var_0_18(string.format(var_0_30, iter_3_2 - 1), {
						"read"
					}, var_3_3)

					var_3_3:addCharacteristic(arg_1_0.ssids[iter_3_2])
				end

				local var_3_6 = {}
				local var_3_7 = var_0_5.bluetoothCertFile or os.getenv("INTERNAL_PATH_BT_CERT")
				local var_3_8 = var_0_22.x509.read(var_0_22.bio.file(var_3_7)):export("der", false)

				for iter_3_3 = 1, 2 do
					var_3_6[iter_3_3] = var_0_18(string.format(var_0_31, iter_3_3 - 1), {
						"read"
					}, var_3_3)

					var_3_3:addCharacteristic(var_3_6[iter_3_3])

					local var_3_9 = var_3_8:sub(var_0_24 * (iter_3_3 - 1) + 1, var_0_24 * iter_3_3)

					var_3_6[iter_3_3]:setValue(var_0_0.stringToByteArray(var_3_9))
				end

				arg_1_0.status = var_0_18(var_0_32, {
					"read",
					"notify"
				}, var_3_3)

				var_3_3:addCharacteristic(arg_1_0.status)

				arg_1_0.wifiMac = var_0_18(var_0_33, {
					"read"
				}, var_3_3)

				var_3_3:addCharacteristic(arg_1_0.wifiMac)

				local var_3_10 = var_0_18(var_0_34, {
					"read"
				}, var_3_3)

				var_3_10:setValue(var_0_6.getVersion())
				var_3_3:addCharacteristic(var_3_10)

				local var_3_11 = var_0_18(var_0_35, {
					"write"
				}, var_3_3)

				var_3_11:onCharacteristicUpdate(function(arg_10_0)
					if arg_10_0[1] == var_0_11.NO_COMMAND then
						var_3_1()
					elseif arg_10_0[1] == var_0_11.WIFI_SCAN then
						var_3_1():next(function(arg_11_0)
							if not arg_11_0 then
								return
							end

							return var_0_10:scan():next(function(arg_12_0)
								for iter_12_0, iter_12_1 in ipairs(arg_1_0.ssids) do
									if arg_12_0[iter_12_0] ~= nil and arg_12_0[iter_12_0].Strength > 0 and arg_12_0[iter_12_0].Strength <= 100 then
										local var_12_0 = arg_12_0[iter_12_0].Strength / 2 - 100
										local var_12_1 = "S"

										for iter_12_2, iter_12_3 in pairs(arg_12_0[iter_12_0].Security) do
											if iter_12_3 == "none" then
												var_12_1 = "U"

												break
											end
										end

										iter_12_1:setValue(string.format("%02d%s%s", -var_12_0, var_12_1, var_0_22.base64(arg_12_0[iter_12_0].Name)))
									else
										iter_12_1:setValue("")
									end
								end
							end):finally(function()
								var_0_10:setStatus(var_0_13.WAITING_FOR_CONFIG)
							end)
						end)
					elseif arg_10_0[1] == var_0_11.STOP_BLUETOOTH then
						var_0_2.Timeout(100, function()
							arg_1_0:stop()
						end)
					end
				end)
				var_3_3:addCharacteristic(var_3_11)

				arg_1_0.gatt = var_0_16(var_3_2, {
					var_3_3
				})
				arg_1_0.gattManager = var_0_19(iter_3_0)

				arg_1_0.gattManager:RegisterApplication(var_3_2)

				arg_1_0.adapter = var_0_20(iter_3_0)

				arg_1_0.adapter:setDiscoverableTimeout(0)
				arg_1_0.adapter:setDiscoverable(true)
				arg_1_0.adapter:setPowered(false)
				arg_1_0.adapter:setAlias("gateway-" .. var_0_4())

				arg_1_0.advertisement = var_0_14(var_0_36, "gateway-" .. var_0_4())

				arg_1_0.advertisement:addServiceUuid(var_0_27)

				arg_1_0.manager = var_0_15(iter_3_0)

				arg_1_0.manager:RegisterAdvertisement(var_0_36)

				local var_3_12 = io.open("/sys/class/net/wlan0/address", "r")

				if var_3_12 then
					local var_3_13 = var_3_12:lines()():gsub(":", "")

					arg_1_0.wifiMac:setValue(var_3_13)
					var_3_12:close()
				end

				if arg_1_0.pendingStart then
					arg_1_0:start()
				end

				break
			end
		end
	end

	local var_1_1 = var_0_21(var_0_23, "/")

	var_1_1:GetManagedObjects():next(var_1_0)
	var_1_1:onInterfacesAdded(function(arg_15_0, arg_15_1)
		var_1_0({
			[arg_15_0] = arg_15_1
		})
	end)
	var_0_9:addFunctionsListener({
		modified = function(arg_16_0, arg_16_1)
			var_0_8:debug("[BluetoothManager] ui event " .. arg_16_1)

			if arg_16_1 == "bluetoothStart" then
				arg_1_0:_startWithoutNotification()
			elseif arg_16_1 == "bluetoothStop" then
				arg_1_0:_stopWithoutNotification()
			end
		end
	})
end

function var_0_25._startWithoutNotification(arg_17_0)
	if not arg_17_0.adapter then
		arg_17_0.pendingStart = true

		return false
	end

	arg_17_0:setTimeout(var_0_38)

	arg_17_0.pendingConfig = {}

	var_0_10:clearConfig()
	var_0_10:setStatus(var_0_13.WAITING_FOR_CONFIG)
	arg_17_0.adapter:setPowered(true)

	return true
end

function var_0_25._stopWithoutNotification(arg_18_0)
	if not arg_18_0.adapter then
		arg_18_0.pendingStart = false

		return false
	end

	if arg_18_0.timeout then
		arg_18_0.timeout:cancel()
	end

	arg_18_0.pendingConfig = nil

	var_0_10:revertSavedConfig()
	arg_18_0.adapter:setPowered(false)

	return true
end

function var_0_25.setTimeout(arg_19_0, arg_19_1)
	if not arg_19_0.adapter then
		return
	end

	if arg_19_0.timeout then
		arg_19_0.timeout:cancel()
	end

	arg_19_0.timeout = var_0_2.Timeout(var_0_3.Elapsed(arg_19_1, 0), function()
		var_0_8:warning("Stop BLE after succesfull connect timeout")
		arg_19_0:stop()
	end)
end

function var_0_25._handleStatus(arg_21_0, arg_21_1)
	if not arg_21_0.adapter then
		return
	end

	if type(arg_21_1) == "number" then
		arg_21_1 = {
			arg_21_1
		}
	end

	local var_21_0 = arg_21_0.status:getValue()

	if arg_21_1[1] == var_21_0[1] then
		return
	end

	if var_21_0[1] ~= nil and var_21_0[1] >= var_0_13.CONNECTED_WIFI and arg_21_1[1] == var_0_13.CONNECTING_WIFI then
		return
	end

	if arg_21_1[1] ~= var_0_13.SCANNING_WIFI and arg_21_1[1] ~= var_0_13.WAITING_FOR_CONFIG and (not arg_21_0.pendingConfig or not arg_21_0.pendingConfig.ssid) then
		return
	end

	arg_21_0.status:setValue(arg_21_1)
	arg_21_0.advertisement:addManufacturerData(var_0_26, arg_21_1)

	if arg_21_0.connectTimeout then
		arg_21_0.connectTimeout:cancel()
	end

	arg_21_0.connectTimeout = nil

	if arg_21_1[1] == var_0_13.CONNECTING_WIFI then
		arg_21_0.connectTimeout = var_0_2.Timeout(var_0_3.Elapsed(var_0_37, 0), function()
			var_0_8:warning("SSID not found timeout")
			var_0_10:setStatus(var_0_13.WIFI_SSID_NOT_FOUND)
		end)
	elseif arg_21_1[1] == var_0_13.CONNECTED_WIFI then
		if not arg_21_0.pendingConfig or not arg_21_0.pendingConfig.ssid then
			return
		end

		arg_21_0:setTimeout(var_0_39)
		var_0_10:setConfig(arg_21_0.pendingConfig)

		arg_21_0.pendingConfig = nil
	elseif arg_21_1[1] == var_0_13.WRONG_WIFI_PASSPHRASE then
		arg_21_0.pendingConfig = {}

		var_0_10:clearConfig()
	end
end

function var_0_25.start(arg_23_0)
	if arg_23_0:_startWithoutNotification() then
		var_0_9:setEvent("bluetooth", "start")
	end
end

function var_0_25.stop(arg_24_0)
	if arg_24_0:_stopWithoutNotification() then
		var_0_9:setEvent("bluetooth", "stop")
	end
end

return var_0_25
