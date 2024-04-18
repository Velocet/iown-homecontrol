local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = require("bit")
local var_0_3 = {
	__index = function(arg_1_0, arg_1_1)
		if type(arg_1_1) ~= "number" or arg_1_1 < 1 or arg_1_1 > 256 then
			return nil
		end

		local var_1_0 = {
			startup = true,
			oncommand = true,
			info = {
				parameter = 234946567,
				value = {
					type = "y",
					data = arg_1_1 - 1
				}
			}
		}
		local var_1_1 = var_0_0(var_0_2.bor(234946568, var_0_2.lshift(arg_1_1 - 1, 8)), var_0_1.access.READ, var_1_0)

		arg_1_0[arg_1_1] = var_1_1

		return var_1_1
	end
}
local var_0_4 = {}

setmetatable(var_0_4, var_0_3)

return var_0_4
