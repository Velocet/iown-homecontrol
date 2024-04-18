local var_0_0 = require("Overkiz.Bus.DBusFactory")
local var_0_1 = require("Overkiz.Kizbox.Proxy.NetworkManagerDefinition")

return function(arg_1_0)
	return var_0_0.createServer(var_0_1.service, var_0_1.path, var_0_1.definition, {
		[var_0_1.interface] = arg_1_0
	})
end
