local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.Timer")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")
local var_0_3 = require("Overkiz.Storage")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_5 = {
	refresh = {
		startup = true,
		ignoreRecovered = true
	}
}
local var_0_6 = var_0_3("siren", "off", "Overkiz.HomeAutomation.Protocol.Internal.Node.Parameters.storage")

var_0_5.watchers = {}

function var_0_5.listen(arg_1_0)
	var_0_5.watchers[arg_1_0] = arg_1_0
end

local function var_0_7(arg_2_0)
	for iter_2_0, iter_2_1 in pairs(var_0_5.watchers) do
		iter_2_1(arg_2_0)
	end
end

local var_0_8 = false

local function var_0_9()
	if not var_0_8 then
		var_0_2:send("#gpio=6,0,1,1")

		var_0_8 = true
	end
end

local var_0_10 = var_0_1.Monotonic()

function var_0_5.update(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0, arg_5_1)
		if arg_5_0 then
			arg_4_1(arg_5_1)
		else
			var_0_5.read(arg_4_0, arg_4_1)
		end
	end

	local function var_4_1()
		return
	end

	var_0_9()

	local var_4_2 = 0
	local var_4_3, var_4_4 = var_0_6:get():match("cyclic;(%d+);(%d+)")

	if var_4_3 and var_4_4 and tonumber(var_4_3) and tonumber(var_4_4) then
		var_4_2 = 0

		var_0_2:send("#gpio=6,1", var_4_0)
		var_0_10:setTime(var_0_0.Monotonic(var_0_0.Elapsed(tonumber(var_4_3), 0)), true)
		var_0_10:start()

		function var_0_10.expired(arg_7_0)
			if var_4_2 % 2 == 0 then
				var_0_2:send("#gpio=6,0", var_4_1)
				arg_7_0:setTime(var_0_0.Monotonic(var_0_0.Elapsed(tonumber(var_4_4), 0)), true)

				if var_4_2 < 4 then
					arg_7_0:start()
				else
					var_0_6:push("off")
					var_0_7("off")
				end
			else
				var_0_2:send("#gpio=6,1", var_4_1)
				arg_7_0:setTime(var_0_0.Monotonic(var_0_0.Elapsed(tonumber(var_4_3), 0)), true)
				arg_7_0:start()
			end

			var_4_2 = var_4_2 + 1
		end
	elseif var_0_6:get() == "off" then
		var_0_2:send("#gpio=6,0", var_4_0)
		var_0_10:stop()
	else
		var_0_2:send("#gpio=6,1", var_4_0)
		var_0_10:stop()
	end
end

function var_0_5.read(arg_8_0, arg_8_1)
	local function var_8_0(arg_9_0, arg_9_1)
		if arg_9_0 then
			arg_8_1(arg_9_1)

			return
		end

		local var_9_0, var_9_1 = arg_9_1:match("#GPIO: (%d),(%d)")
		local var_9_2 = "off"

		if tonumber(var_9_1) == 1 then
			var_9_2 = "on"
		end

		if var_0_6:get():match("cyclic;(%d+);(%d+)") then
			var_9_2 = var_0_6:get()
		end

		if var_9_2 ~= var_0_6:get() then
			var_0_4:warning("Siren status doesn't match ! (" .. var_9_2 .. "," .. var_0_6:get() .. ")")
			var_0_5.update(arg_8_0, arg_8_1)
		else
			arg_8_0(var_9_2)
		end
	end

	var_0_9()
	var_0_2:send("#gpio=6,2", var_8_0)
end

function var_0_5.write(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_0 == 1 or arg_10_0 == "on" or arg_10_0 == "1" then
		arg_10_0 = "on"
	elseif arg_10_0:match("cyclic;(%d+);(%d+)") then
		-- block empty
	else
		arg_10_0 = "off"
	end

	var_0_6:push(arg_10_0)
	var_0_5.update(arg_10_1, arg_10_2)
end

return var_0_5
