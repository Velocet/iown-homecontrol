local var_0_0 = require("Overkiz.Bus.DBusFactory")
local var_0_1 = require("Overkiz.Bus.Variant")
local var_0_2 = require("Overkiz.OOP.Class")
local var_0_3 = require("Overkiz.Bus.OrgFreedesktopDBus").Properties
local var_0_4 = var_0_2()
local var_0_5 = "org.bluez"
local var_0_6 = "org.bluez.Adapter1"

function var_0_4.new(arg_1_0, arg_1_1)
	local var_1_0 = {
		[var_0_6] = {
			methods = {}
		},
		[var_0_3.interface] = var_0_3.definition
	}

	arg_1_0._proxy = var_0_0.createProxy(var_0_5, arg_1_1, var_1_0, {
		[var_0_3.interface] = arg_1_0
	})
end

function var_0_4.setPowered(arg_2_0, arg_2_1)
	arg_2_0._proxy:Set(var_0_6, "Powered", arg_2_1)
end

function var_0_4.setDiscoverable(arg_3_0, arg_3_1)
	arg_3_0._proxy:Set(var_0_6, "Discoverable", arg_3_1)
end

function var_0_4.setPairable(arg_4_0, arg_4_1)
	arg_4_0._proxy:Set(var_0_6, "Pairable", arg_4_1)
end

function var_0_4.setDiscoverableTimeout(arg_5_0, arg_5_1)
	arg_5_0._proxy:Set(var_0_6, "DiscoverableTimeout", var_0_1("u", arg_5_1))
end

function var_0_4.setAlias(arg_6_0, arg_6_1)
	arg_6_0._proxy:Set(var_0_6, "Alias", var_0_1("s", arg_6_1))
end

return var_0_4
