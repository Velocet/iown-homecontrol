local var_0_0 = require("bit")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Mode.mode")
local var_0_2 = {
	refresh = {
		startup = true
	}
}

local function var_0_3(arg_1_0)
	local var_1_0 = var_0_0.band(arg_1_0.target, 64) ~= 0
	local var_1_1 = var_0_0.band(arg_1_0.flags, 64) ~= 0

	if var_1_0 then
		if var_1_1 then
			return "yes"
		else
			return "unavailable"
		end
	else
		return "no"
	end
end

function var_0_2.read(arg_2_0, arg_2_1)
	local var_2_0 = var_0_3(var_0_1.get())

	arg_2_0(tostring(var_2_0))
end

function var_0_2.write(arg_3_0, arg_3_1, arg_3_2)
	var_0_1.setUB(64, arg_3_0 == "yes")
	arg_3_1()
end

var_0_2.watchers = {}

function var_0_2.listen(arg_4_0)
	var_0_2.watchers[arg_4_0] = arg_4_0
end

local function var_0_4(arg_5_0)
	for iter_5_0, iter_5_1 in pairs(var_0_2.watchers) do
		iter_5_1(arg_5_0, true)
	end
end

function var_0_2.changed(arg_6_0)
	local var_6_0 = var_0_3(var_0_1.get())

	var_0_4(tostring(var_6_0))
end

var_0_1.addListener(var_0_2)

return var_0_2
