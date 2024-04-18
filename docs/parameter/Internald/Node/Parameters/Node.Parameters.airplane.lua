local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_3 = {
	refresh = {
		startup = true,
		interval = var_0_0.Monotonic(var_0_0.Elapsed(3600, 0))
	}
}

function var_0_3.write(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1)
		if arg_2_0 then
			arg_1_2(arg_2_1)
		else
			var_0_3.read(arg_1_1, arg_1_2)
		end
	end

	local var_1_1

	if arg_1_0 == "no" then
		var_1_1 = 1
	elseif arg_1_0 == "yes" then
		var_1_1 = 4
	elseif arg_1_0 == "eco" then
		var_1_1 = 5
	elseif arg_1_0 == "half" then
		var_1_1 = 2
	else
		arg_1_2("Unknown requested airplane mode")

		return
	end

	var_0_1:send("+CFUN=" .. tostring(var_1_1), var_1_0)
end

function var_0_3.read(arg_3_0, arg_3_1)
	local function var_3_0(arg_4_0, arg_4_1)
		if arg_4_0 then
			arg_3_1(arg_4_1)

			return
		end

		local var_4_0 = arg_4_1:match("+CFUN: (%d+)")
		local var_4_1 = tonumber(var_4_0)
		local var_4_2
		local var_4_3
		local var_4_4 = "no"
		local var_4_5

		if var_4_1 == 0 then
			var_4_4 = "yes"
			var_4_5 = "minimum functionality"
		elseif var_4_1 == 1 then
			var_4_4 = "no"
			var_4_5 = "full functionality"
		elseif var_4_1 == 2 then
			var_4_4 = "half"
			var_4_5 = "TX disabled"
		elseif var_4_1 == 4 then
			var_4_4 = "yes"
			var_4_5 = "TX and RX disabled"
		elseif var_4_1 == 5 then
			var_4_4 = "eco"
			var_4_5 = "full functionality with power saving"
		elseif var_4_1 == 7 then
			var_4_4 = "eco"
			var_4_5 = "cyclic sleep"
		else
			var_4_5 = "unknown"
		end

		var_0_2:info("telit functionalities: " .. var_4_5)
		arg_3_0(var_4_4)
	end

	var_0_1:send("+CFUN?", var_3_0)
end

return var_0_3
