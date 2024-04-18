local var_0_0 = require("Overkiz.Bus.DBusPropertiesServer")
local var_0_1 = require("Overkiz.Bus.Variant")
local var_0_2 = require("Overkiz.OOP.Class")()
local var_0_3 = "org.bluez.LEAdvertisement1"

function var_0_2.new(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._properties = {
		Type = var_0_1("s", "peripheral"),
		LocalName = var_0_1("s", arg_1_2),
		ServiceUUIDs = var_0_1("as", {}),
		ManufacturerData = var_0_1("a{qv}", {}),
		SolicitUUIDs = var_0_1("as", {}),
		ServiceData = var_0_1("a{sv}", {}),
		IncludeTxPower = var_0_1("b", false)
	}

	local function var_1_0(arg_2_0)
		if arg_2_0 == nil then
			return arg_1_0._properties
		end

		return arg_1_0._properties[arg_2_0]
	end

	local function var_1_1(arg_3_0, arg_3_1)
		arg_1_0._properties[arg_3_0]:setValue(arg_3_1)
		arg_1_0._objectManager:PropertiesChanged(arg_3_0)
	end

	arg_1_0._objectManager = var_0_0("com.overkiz.bluez", arg_1_1, var_0_3, {
		methods = {
			Release = {}
		}
	}, var_1_0, var_1_1)

	function arg_1_0._objectManager.Release(arg_4_0)
		print("Advertisement Release")
	end
end

function var_0_2.setLocalName(arg_5_0, arg_5_1)
	arg_5_0._properties.LocalName:setValue(arg_5_1)
	arg_5_0._objectManager:PropertiesChanged("LocalName")
end

function var_0_2.addServiceUuid(arg_6_0, arg_6_1)
	table.insert(arg_6_0._properties.ServiceUUIDs:getValue(), arg_6_1)
	arg_6_0._objectManager:PropertiesChanged("ServiceUUIDs")
end

function var_0_2.addSolicitUuid(arg_7_0, arg_7_1)
	table.insert(arg_7_0._properties.SolicitUUIDs:getValue(), arg_7_1)
	arg_7_0._objectManager:PropertiesChanged("SolicitUUIDs")
end

function var_0_2.addManufacturerData(arg_8_0, arg_8_1, arg_8_2)
	if type(arg_8_2) ~= "table" then
		error("Only table is supported as manufacturer data")
	end

	arg_8_0._properties.ManufacturerData:getValue()[arg_8_1] = var_0_1("ay", arg_8_2)

	arg_8_0._objectManager:PropertiesChanged("ManufacturerData")
end

function var_0_2.addServiceData(arg_9_0, arg_9_1, arg_9_2)
	if type(arg_9_2) ~= "table" then
		error("Only table is supported as service data")
	end

	arg_9_0._properties.ServiceData:getValue()[arg_9_1] = var_0_1("ay", arg_9_2)

	arg_9_0._objectManager:PropertiesChanged("ServiceData")
end

return var_0_2
