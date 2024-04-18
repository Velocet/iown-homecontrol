local var_0_0 = require("Overkiz.Bus.DBusFactory")
local var_0_1 = require("Overkiz.OOP.Class")()
local var_0_2 = "org.bluez"
local var_0_3 = "org.bluez.LEAdvertisingManager1"

function var_0_1.new(arg_1_0, arg_1_1)
	local var_1_0 = {
		[var_0_3] = {
			methods = {
				RegisterAdvertisement = {
					args = {
						{
							name = "advertisement",
							direction = "in",
							type = "o"
						},
						{
							name = "options",
							direction = "in",
							type = "a{sv}"
						}
					}
				},
				UnregisterAdvertisement = {
					args = {
						{
							name = "advertisement",
							direction = "in",
							type = "o"
						}
					}
				}
			}
		}
	}

	arg_1_0._proxy = var_0_0.createProxy(var_0_2, arg_1_1, var_1_0, {
		[var_0_3] = arg_1_0
	})
end

function var_0_1.RegisterAdvertisement(arg_2_0, arg_2_1)
	return arg_2_0._proxy:RegisterAdvertisement(arg_2_1, {})
end

function var_0_1.UnregisterAdvertisement(arg_3_0, arg_3_1)
	return arg_3_0._proxy:UnregisterAdvertisement(arg_3_1)
end

return var_0_1
