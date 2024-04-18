local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.WifiManager")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.wifiCurrentInfraConfig")

return {
	write = function(arg_1_0, arg_1_1, arg_1_2)
		local var_1_0 = {
			passphrase = "string",
			ssid = "string"
		}
		local var_1_1, var_1_2 = var_0_0.checkPath(arg_1_0, var_1_0)

		if not var_1_1 then
			return arg_1_2(var_1_2)
		end

		var_0_1:setConfig(arg_1_0)

		local var_1_3 = var_0_1:getSavedConfig().ssid

		var_0_2.set({
			ssid = var_1_3
		})
		arg_1_1({
			ssid = var_1_3
		})
	end
}
