import("Overkiz.HomeAutomation.Protocol.RTDS.Profile.LowBatteryState")
import("Overkiz.HomeAutomation.Protocol.RTDS.log")

local var_0_0 = {
	SenseValue = {}
}

var_0_0.SenseValue[0] = "SmokeState"
var_0_0.SenseValue[1] = "CODetectionState"
var_0_0.SenseValue[2] = "GasDetectionState"
var_0_0.SenseValue[3] = "WaterDetectionState"
var_0_0.SenseValue[4] = "TemperatureOutOfRangeDetectionState"
var_0_0.SenseValue[5] = "PowerCutDetectionState"
var_0_0.SenseValue[6] = "Technical7State"
var_0_0.SenseValue[7] = "Technical8State"
var_0_0.Status = {}
var_0_0.Status[0] = "detected"
var_0_0.Status[1] = "notDetected"

function var_0_0.search(arg_1_0, arg_1_1)
	for iter_1_0, iter_1_1 in pairs(arg_1_1) do
		if iter_1_0 == arg_1_0 then
			return iter_1_1
		end
	end

	return nil
end

var_0_0.offsetUpdateTimeSmokeState = 35

function var_0_0.updateSmokeState(arg_2_0, arg_2_1, arg_2_2)
	local function var_2_0(arg_3_0)
		if arg_3_0 ~= arg_2_2 then
			arg_2_0:update("core", arg_2_1, arg_2_2)
			arg_2_0:update("rtds", arg_2_1 .. "_UT", os.clock())
		else
			local function var_3_0(arg_4_0)
				if arg_4_0 and tonumber(arg_4_0) > os.time() + var_0_0.offsetUpdateTimeSmokeState then
					arg_2_0:update("core", arg_2_1, arg_2_2)
				end

				arg_2_0:update("rtds", arg_2_1 .. "_UT", os.time())
			end

			arg_2_0:get("rtds", arg_2_1 .. "_UT", var_3_0)
		end
	end

	arg_2_0:get("core", arg_2_1, var_2_0)
end

function var_0_0.update(arg_5_0, arg_5_1)
	local var_5_0 = var_0_0.search(bit.band(7, arg_5_1[1]), var_0_0.SenseValue)
	local var_5_1 = var_0_0.search(bit.rshift(bit.band(8, arg_5_1[1]), 3), var_0_0.Status)

	if var_5_0 ~= nil then
		if var_5_0 == "SmokeState" then
			var_0_0.updateSmokeState(arg_5_0, var_5_0, var_5_1)
		else
			arg_5_0:update("core", var_5_0, var_5_1)
		end
	else
		log:warning("sensedValue: " .. tostring(var_5_0) .. " doesn't exist")
		arg_5_0:update("core", "SensingState", var_5_1)
	end

	LowBatteryState.update(arg_5_0, arg_5_1)
end

return var_0_0
