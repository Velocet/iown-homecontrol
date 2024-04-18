local var_0_0 = require("Overkiz.Bus.DBusFactory")
local var_0_1 = require("Overkiz.Bus.OrgFreedesktopDBus").Properties
local var_0_2 = "fi.w1.wpa_supplicant1"
local var_0_3 = {
	[var_0_1.interface] = var_0_1.definition,
	[var_0_2 .. ".Network"] = {}
}

return function(arg_1_0)
	return var_0_0.createProxy(var_0_2, arg_1_0, var_0_3, {})
end
