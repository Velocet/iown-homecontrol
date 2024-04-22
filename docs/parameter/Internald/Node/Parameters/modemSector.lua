local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")
local var_0_2 = {
	refresh = {
		startup = true,
		interval = var_0_0.Monotonic(var_0_0.Elapsed(60, 0))
	}
}
local var_0_3 = false

local function var_0_4()
	if not var_0_3 then
		var_0_1:send("#gpio=9,0,0,1")

		var_0_3 = true
	end
end

function var_0_2.read(arg_2_0, arg_2_1)
	local function var_2_0(arg_3_0, arg_3_1)
		if arg_3_0 then
			arg_2_1(arg_3_1)

			return
		end

		local var_3_0, var_3_1 = arg_3_1:match("#GPIO: (%d),(%d)")
		local var_3_2 = "yes"

		if tonumber(var_3_1) == 0 then
			var_3_2 = "no"
		end

		arg_2_0(var_3_2)
	end

	var_0_4()
	var_0_1:send("#gpio=9,2", var_2_0)
end

return var_0_2
