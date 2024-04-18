local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = require("Overkiz.Type.ByteArray")
local var_0_3 = var_0_0(2146631686, var_0_1.access.WRITE)

var_0_3.MIN_SCALE = 1e-07
var_0_3.MAX_SCALE = 10000000

local function var_0_4(arg_1_0)
	local var_1_0

	if arg_1_0 == "1" or arg_1_0 == "electricity" then
		var_1_0 = 15
	elseif arg_1_0 == "2" or arg_1_0 == "gas" then
		var_1_0 = 12
	elseif arg_1_0 == "4" or arg_1_0 == "water" then
		var_1_0 = 13
	elseif arg_1_0 == "5" or arg_1_0 == "thermalenergy" or arg_1_0 == "thermal_energy" then
		var_1_0 = 14
	end

	return var_1_0
end

local function var_0_5(arg_2_0)
	if arg_2_0 == 1 then
		return 0
	elseif arg_2_0 == 10 then
		return 1
	elseif arg_2_0 == 100 then
		return 2
	elseif arg_2_0 == 1000 then
		return 3
	elseif arg_2_0 == 10000 then
		return 4
	elseif arg_2_0 == 100000 then
		return 5
	elseif arg_2_0 == 1000000 then
		return 6
	elseif arg_2_0 == var_0_3.MAX_SCALE then
		return 7
	elseif arg_2_0 == 1e-07 then
		return 249
	elseif arg_2_0 == 1e-06 then
		return 250
	elseif arg_2_0 == 1e-05 then
		return 251
	elseif arg_2_0 == 0.0001 then
		return 252
	elseif arg_2_0 == 0.001 then
		return 253
	elseif arg_2_0 == 0.01 then
		return 254
	elseif arg_2_0 == var_0_3.MIN_SCALE then
		return 255
	end
end

local function var_0_6(arg_3_0)
	local var_3_0 = 1
	local var_3_1

	if arg_3_0 >= 1 and arg_3_0 <= 10 and arg_3_0 == math.floor(arg_3_0) then
		var_3_1 = arg_3_0
	elseif arg_3_0 ~= math.floor(arg_3_0) then
		var_3_1 = arg_3_0

		while var_3_1 ~= math.floor(var_3_1) do
			var_3_1 = var_3_1 * 10
			var_3_0 = var_3_0 * 10

			if var_3_0 > var_0_3.MAX_SCALE then
				return nil, nil, "{\"errorCode\":\"UNSPECIFIED_ERROR\",\"error\":\"Scale factor too big \"}"
			end
		end
	elseif arg_3_0 >= 10 then
		var_3_1 = arg_3_0

		while var_3_1 >= 10 do
			local var_3_2 = var_3_1 / 10

			if var_3_2 ~= math.floor(var_3_2) then
				break
			else
				var_3_1 = var_3_2
				var_3_0 = var_3_0 / 10
			end

			print("")

			if var_3_0 < var_0_3.MIN_SCALE then
				return nil, nil, "{\"errorCode\":\"UNSPECIFIED_ERROR\",\"error\":\"Scale factor too small \"}"
			end
		end
	end

	return var_3_1, var_0_5(var_3_0)
end

function var_0_3.buildData(arg_4_0, arg_4_1)
	local var_4_0 = {}
	local var_4_1 = tonumber(arg_4_1) or 1
	local var_4_2 = var_0_4(arg_4_0)

	if not var_4_2 then
		return nil, "{\"errorCode\":\"FIELD_NOT_SET\",\"error\":\"energyType should not be null\"}"
	end

	local var_4_3, var_4_4, var_4_5 = var_0_6(var_4_1)

	if var_4_3 == nil or var_4_4 == nil then
		return nil, var_4_5
	end

	var_4_0[1] = var_4_2
	var_4_0[2] = var_4_3
	var_4_0[3] = var_4_4
	var_4_0[4] = 0
	var_4_0[5] = 0
	var_4_0[6] = 0
	var_4_0[7] = 0

	return var_0_2(var_4_0)
end

var_0_3.name = "DiscoverPulseSensor"

return var_0_3
