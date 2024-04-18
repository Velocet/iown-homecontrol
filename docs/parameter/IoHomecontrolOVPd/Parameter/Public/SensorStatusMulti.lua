local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")

return {
	createParameters = function(arg_1_0, arg_1_1)
		local var_1_0 = 4294967296
		local var_1_1 = 17594601963522

		if arg_1_1 > 16 then
			var_0_0:error("Multitype sensor: Sensor status states can't be created, maximally 16 subsystems are supported ")

			return
		end

		for iter_1_0 = 1, arg_1_1 do
			local var_1_2 = iter_1_0 + 1

			if arg_1_0.configuration[var_1_2] == nil then
				var_0_0:error("Configuration missing for subsystem " .. iter_1_0)

				return
			end

			if arg_1_0.configuration[var_1_2].type == nil then
				var_0_0:error("Type is nil for subsystem " .. iter_1_0)

				return
			end

			local var_1_3 = var_1_1 + arg_1_0.configuration[var_1_2].type * var_1_0

			var_0_0:info("Factory : Create object parameter " .. string.format("0x%X", var_1_3) .. " (" .. var_1_3 .. ") for node " .. arg_1_0.address)
			var_0_1:create(var_0_3(var_1_3, var_0_2.access.READ), arg_1_0)
		end
	end
}
