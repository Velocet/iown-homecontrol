local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.Timer")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.siren")
local var_0_4 = {}
local var_0_5 = {}
local var_0_6 = {}

local function var_0_7()
	for iter_1_0, iter_1_1 in ipairs(var_0_5) do
		iter_1_1()
	end

	for iter_1_2, iter_1_3 in pairs(var_0_6) do
		if iter_1_3.timer then
			iter_1_3.timer:stop()

			iter_1_3.timer.expired = nil
			var_0_6[iter_1_2] = nil
		end
	end
end

local var_0_8 = false

local function var_0_9()
	if not var_0_8 then
		var_0_2:send("#gpio=6,0,1,1")

		var_0_8 = true
	end
end

local function var_0_10(arg_3_0)
	if tonumber(arg_3_0) > 0 then
		var_0_2:send("#gpio=6,1")
	else
		var_0_2:send("#gpio=6,0")
	end
end

local function var_0_11(arg_4_0)
	arg_4_0.current = 1
	arg_4_0.cycle = 1
	arg_4_0.timer = var_0_1.Monotonic()

	function arg_4_0.timer.expired(arg_5_0, arg_5_1)
		var_0_10(arg_4_0.seq:sub(arg_4_0.current, arg_4_0.current))

		if arg_4_0.current >= arg_4_0.seq:len() then
			arg_4_0.cycle = arg_4_0.cycle + 1
			arg_4_0.current = 0
		end

		if arg_4_0.cycle > arg_4_0.rep then
			arg_5_0:stop()
			arg_4_0.succ()

			var_0_6[arg_4_0] = nil

			local function var_5_0()
				return
			end

			var_0_3.update(var_5_0, var_5_0)
		else
			arg_5_0:setTime(var_0_0.Monotonic(arg_4_0.delay), true)
			arg_5_0:start()

			arg_4_0.current = arg_4_0.current + 1
		end
	end

	arg_4_0.timer:start()

	var_0_6[arg_4_0] = arg_4_0
end

function var_0_4.localWrite(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0, var_7_1, var_7_2 = arg_7_0:match("(.+);(.+);(.+)")

	if not var_7_0 or not var_7_1 or not var_7_2 then
		arg_7_2("missing args")

		return
	end

	local var_7_3 = {
		seq = var_7_0 .. "0"
	}
	local var_7_4 = tonumber(var_7_1) / 1000
	local var_7_5 = tonumber(var_7_1) % 1000 * 1000000

	var_7_3.delay = var_0_0.Elapsed(var_7_4, var_7_5)
	var_7_3.rep = tonumber(var_7_2) or 1
	var_7_3.succ = arg_7_1
	var_7_3.err = arg_7_2

	var_0_11(var_7_3)
	var_0_9()
end

function var_0_4.write(arg_8_0, arg_8_1, arg_8_2)
	var_0_7()
	var_0_4.localWrite(arg_8_0, arg_8_1, arg_8_2)
end

function var_0_4.setCancel(arg_9_0)
	table.insert(var_0_5, arg_9_0)
end

return var_0_4
