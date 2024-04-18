local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")
local var_0_1 = {
	refresh = {
		startup = true
	}
}
local var_0_2
local var_0_3

function var_0_1.read(arg_1_0, arg_1_1)
	local function var_1_0(arg_2_0, arg_2_1)
		if arg_2_0 then
			arg_1_1(arg_2_1)

			return
		end

		if not var_0_2 then
			var_0_2 = arg_2_1

			var_0_0:send("+GMM", var_1_0)

			return
		end

		if not var_0_3 then
			var_0_3 = arg_2_1

			arg_1_0(var_0_2 .. " " .. var_0_3)
		end
	end

	var_0_2 = nil
	var_0_3 = nil

	var_0_0:send("+GMI", var_1_0)
end

return var_0_1
