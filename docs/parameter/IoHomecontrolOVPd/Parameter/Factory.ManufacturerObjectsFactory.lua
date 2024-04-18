local var_0_0 = require("bit")
local var_0_1 = require("Overkiz.OOP.Class")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_4 = var_0_1()

function var_0_4.new(arg_1_0, arg_1_1)
	if arg_1_1 == nil then
		error()

		return
	end

	arg_1_0._log = arg_1_1
end

function var_0_4.getParameterId(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = 0

	for iter_2_0 = 1, #arg_2_2 do
		var_2_0 = var_2_0 * var_0_0.shiftByte(1) + arg_2_2[iter_2_0]
	end

	return arg_2_1 * var_0_0.shiftByte(3) + var_2_0
end

function var_0_4.create(arg_3_0, arg_3_1)
	if arg_3_1 == nil then
		arg_3_0._log:warning("Objects factory: nil profileObjects given, ignoring")

		return
	end

	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1.objects) do
		if iter_3_1.access == nil then
			iter_3_1.access = var_0_3.access.READ
		end

		local var_3_1 = iter_3_1.refresh

		if var_3_1.info == nil then
			var_3_1.info = {
				parameter = iter_3_1.parameter,
				access = iter_3_1.access,
				value = {
					type = "ay",
					data = iter_3_1.data
				}
			}
		end

		local var_3_2 = arg_3_0:getParameterId(iter_3_1.parameter, iter_3_1.data)

		var_3_0[iter_3_0] = var_0_2(var_3_2, iter_3_1.access, var_3_1)
		var_3_0[iter_3_0].name = iter_3_1.name
	end

	return var_3_0
end

return var_0_4
