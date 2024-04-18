local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.Mode.mode")
local var_0_1 = {
	refresh = {
		startup = true,
		ignoreRecovered = true
	}
}
local var_0_2 = {
	"UNDEFINED",
	"ACTIVE",
	"NO_AUTO",
	"DISCONNECT",
	"LOCAL"
}

local function var_0_3(arg_1_0)
	local var_1_0 = var_0_2[1]

	if arg_1_0.id >= 0 and arg_1_0.id < 5 then
		var_1_0 = var_0_2[arg_1_0.id + 2]
	end

	return var_1_0
end

function var_0_1.read(arg_2_0, arg_2_1)
	arg_2_0(var_0_3(var_0_0.get()))
end

function var_0_1.write(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = tonumber(arg_3_0)
	local var_3_1

	for iter_3_0, iter_3_1 in ipairs(var_0_2) do
		if iter_3_1 == arg_3_0 then
			var_3_1 = iter_3_0 - 2
		end
	end

	if var_3_1 then
		var_0_0.setI(var_3_1)
		arg_3_1()
	else
		arg_3_2("Unknown mode.")
	end
end

var_0_1.watchers = {}

function var_0_1.listen(arg_4_0)
	var_0_1.watchers[arg_4_0] = arg_4_0
end

local function var_0_4(arg_5_0)
	for iter_5_0, iter_5_1 in pairs(var_0_1.watchers) do
		iter_5_1(arg_5_0, true)
	end
end

function var_0_1.changed(arg_6_0)
	var_0_4(var_0_3(var_0_0.get()))
end

var_0_0.addListener(var_0_1)

return var_0_1
