local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_1 = {
	refresh = {
		startup = true
	},
	watchers = {}
}

local function var_0_2(arg_1_0)
	for iter_1_0, iter_1_1 in pairs(var_0_1.watchers) do
		iter_1_1(arg_1_0)
	end
end

local function var_0_3()
	local var_2_0 = var_0_0.instance.gpios.powerSupply:get()
	local var_2_1 = "yes"

	if tonumber(var_2_0) == 1 then
		var_2_1 = "no"
	end

	var_0_2(var_2_1)
end

function var_0_1.read(arg_3_0, arg_3_1)
	local var_3_0 = "no"

	if var_0_0.instance and var_0_0.instance.gpios then
		local var_3_1 = var_0_0.instance.gpios.powerSupply:get()

		if tonumber(var_3_1) ~= 1 then
			var_3_0 = "yes"
		end

		var_0_0.instance.gpios.powerSupply:watch(var_0_3)
	end

	arg_3_0(var_3_0)
end

function var_0_1.listen(arg_4_0)
	var_0_1.watchers[arg_4_0] = arg_4_0

	if var_0_0.instance and var_0_0.instance.gpios then
		var_0_0.instance.gpios.powerSupply:watch(var_0_3)
	end
end

return var_0_1
