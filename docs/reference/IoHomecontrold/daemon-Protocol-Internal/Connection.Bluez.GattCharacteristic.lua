local var_0_0 = require("Overkiz.Bus.DBusPropertiesServer")
local var_0_1 = require("Overkiz.Bus.Variant")
local var_0_2 = require("Overkiz.OOP.Class")
local var_0_3 = require("Overkiz.Subject")
local var_0_4 = require("Overkiz.Type.ByteArray")
local var_0_5 = require("Overkiz.utilities")
local var_0_6 = var_0_2()
local var_0_7 = "org.bluez.GattCharacteristic1"

function var_0_6.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._path = arg_1_3:getNewSubPath()
	arg_1_0._properties = {
		Notifying = var_0_1("b", false),
		UUID = var_0_1("s", arg_1_1),
		Service = var_0_1("o", arg_1_3:getPath()),
		Value = var_0_1("ay", {}),
		Flags = var_0_1("as", arg_1_2)
	}
	arg_1_0._descriptors = {}

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

	local var_1_2 = {
		methods = {
			ReadValue = {
				args = {
					{
						name = "options",
						direction = "in",
						type = "a{sv}"
					},
					{
						name = "value",
						direction = "out",
						type = "ay"
					}
				}
			},
			WriteValue = {
				args = {
					{
						name = "value",
						direction = "in",
						type = "ay"
					},
					{
						name = "options",
						direction = "in",
						type = "a{sv}"
					}
				}
			},
			StartNotify = {},
			StopNotify = {}
		}
	}

	arg_1_0._objectManager = var_0_0("com.overkiz.bluez", arg_1_0._path, var_0_7, var_1_2, var_1_0, var_1_1)

	function arg_1_0._objectManager.ReadValue(arg_4_0, arg_4_1)
		local var_4_0 = arg_1_0._properties.Value:getValue()

		if arg_4_1.offset then
			var_4_0 = var_0_5.tableExtract(var_4_0, arg_4_1.offset + 1, #var_4_0 - arg_4_1.offset)
		end

		return var_4_0
	end

	function arg_1_0._objectManager.WriteValue(arg_5_0, arg_5_1, arg_5_2)
		var_1_1("Value", arg_5_1)
		arg_1_0._onCharUpdate:notify(arg_5_1)
	end

	function arg_1_0._objectManager.StartNotify(arg_6_0)
		var_1_1("Notifying", true)
	end

	function arg_1_0._objectManager.StopNotify(arg_7_0)
		var_1_1("Notifying", false)
	end

	arg_1_0._getter = var_1_0
	arg_1_0._onCharUpdate = var_0_3()

	function arg_1_0.getValue(arg_8_0)
		return var_1_0("Value"):getValue()
	end

	function arg_1_0.setValue(arg_9_0, arg_9_1)
		if type(arg_9_1) == "string" or type(arg_9_1) == "userdata" then
			local var_9_0 = var_0_4(arg_9_1, "utf-8")

			arg_9_1 = {}

			for iter_9_0 = 1, #var_9_0 do
				arg_9_1[iter_9_0] = var_9_0[iter_9_0]
			end
		end

		var_1_1("Value", arg_9_1)
	end
end

function var_0_6.getProperties(arg_10_0)
	return {
		[var_0_7] = arg_10_0._getter(nil)
	}
end

function var_0_6.getPath(arg_11_0)
	return arg_11_0._path
end

function var_0_6.onCharacteristicUpdate(arg_12_0, arg_12_1)
	arg_12_0._onCharUpdate:addListener(arg_12_1)
end

return var_0_6
