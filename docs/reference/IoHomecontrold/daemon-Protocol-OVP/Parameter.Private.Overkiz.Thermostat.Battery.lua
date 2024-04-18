local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.timeUtils")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3 = require("bit")
local var_0_4 = {
	__index = function(arg_1_0, arg_1_1)
		if type(arg_1_1) ~= "number" or arg_1_1 < 1 or arg_1_1 > 256 then
			return nil
		end

		local var_1_0 = {
			startup = true,
			interval = var_0_0.hoursInterval(24),
			info = {
				parameter = 234946563,
				value = {
					type = "y",
					data = arg_1_1 - 1
				}
			}
		}
		local var_1_1 = var_0_1(var_0_3.bor(234946564, var_0_3.lshift(arg_1_1 - 1, 8)), var_0_2.access.READ, var_1_0)

		arg_1_0[arg_1_1] = var_1_1

		return var_1_1
	end
}
local var_0_5 = {}

setmetatable(var_0_5, var_0_4)

return var_0_5
