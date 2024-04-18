local var_0_0 = require("Overkiz.Timer")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Connection.WifiManager")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_3 = 2000

return {
	write = function(arg_1_0, arg_1_1, arg_1_2)
		local var_1_0 = arg_1_0

		if var_1_0 ~= "remove" then
			var_0_2:error("Unsupported value " .. var_1_0)

			return arg_1_2("Unsupported value " .. var_1_0)
		end

		arg_1_1()
		var_0_2:debug("Asked to clear credentials...")
		var_0_0.Timeout(var_0_3, function()
			var_0_1:clearSavedConfig():next(function()
				var_0_2:debug("Credentials cleared")
			end)
		end)
	end
}
