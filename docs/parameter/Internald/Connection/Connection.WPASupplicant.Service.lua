local var_0_0 = require("Overkiz.Bus.DBusFactory")
local var_0_1 = require("Overkiz.Bus.OrgFreedesktopDBus").Properties
local var_0_2 = "fi.w1.wpa_supplicant1"
local var_0_3 = "/fi/w1/wpa_supplicant1"
local var_0_4 = {
	[var_0_1.interface] = var_0_1.definition,
	[var_0_2] = {
		methods = {
			CreateInterface = {
				args = {
					{
						name = "args",
						direction = "in",
						type = "a{sv}"
					},
					{
						name = "path",
						direction = "out",
						type = "o"
					}
				}
			},
			RemoveInterface = {
				args = {
					{
						name = "path",
						direction = "in",
						type = "o"
					}
				}
			},
			GetInterface = {
				args = {
					{
						name = "ifname",
						direction = "in",
						type = "s"
					},
					{
						name = "path",
						direction = "out",
						type = "o"
					}
				}
			}
		},
		signals = {
			InterfaceAdded = {
				args = {
					{
						type = "o",
						name = "path"
					},
					{
						type = "a{sv}",
						name = "properties"
					}
				}
			},
			InterfaceRemoved = {
				args = {
					{
						type = "o",
						name = "path"
					}
				}
			}
		}
	}
}

return var_0_0.createProxy(var_0_2, var_0_3, var_0_4, {})
