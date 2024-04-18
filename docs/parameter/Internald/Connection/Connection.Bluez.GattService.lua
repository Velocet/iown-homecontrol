local var_0_0 = require("Overkiz.Bus.DBusPropertiesServer")
local var_0_1 = require("Overkiz.Bus.Variant")
local var_0_2 = require("Overkiz.OOP.Class")()
local var_0_3 = "org.bluez.GattService1"

function var_0_2.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._subpath = 1
	arg_1_0._properties = {
		UUID = var_0_1("s", arg_1_2),
		Primary = var_0_1("b", arg_1_3),
		Characteristics = var_0_1("ao", {})
	}
	arg_1_0._characteristics = {}

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

	arg_1_0._objectManager = var_0_0("com.overkiz.bluez", arg_1_1, var_0_3, {}, var_1_0, var_1_1)
	arg_1_0._path = arg_1_1
	arg_1_0._getter = var_1_0
	arg_1_0._setter = var_1_1
end

function var_0_2.addCharacteristic(arg_4_0, arg_4_1)
	table.insert(arg_4_0._characteristics, arg_4_1)
	table.insert(arg_4_0._properties.Characteristics:getValue(), arg_4_1:getPath())
end

function var_0_2.getPath(arg_5_0)
	return arg_5_0._path
end

function var_0_2.getNewSubPath(arg_6_0)
	local var_6_0 = arg_6_0:getPath() .. "/" .. tostring(arg_6_0._subpath)

	arg_6_0._subpath = arg_6_0._subpath + 1

	return var_6_0
end

function var_0_2.getCharacteristics(arg_7_0)
	return arg_7_0._characteristics
end

function var_0_2.getProperties(arg_8_0)
	return {
		[var_0_3] = arg_8_0._getter(nil)
	}
end

return var_0_2
