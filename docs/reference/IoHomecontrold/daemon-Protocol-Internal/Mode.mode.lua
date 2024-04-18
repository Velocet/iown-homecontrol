local var_0_0 = require("Overkiz.Tracker")
local var_0_1 = require("Overkiz.Time")
local var_0_2 = require("Overkiz.Timer")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.Admin.system")
local var_0_6 = require("Overkiz.Event")
local var_0_7 = require("Overkiz.Storage")
local var_0_8 = require("bit")
local var_0_9 = var_0_7("mode", 247, "Overkiz.HomeAutomation.Protocol.Internal.storage")
local var_0_10 = 4294967103
local var_0_11 = 247
local var_0_12 = var_0_2.Real()
local var_0_13 = {
	time = 0,
	status = "unknown"
}
local var_0_14 = {
	ACTIVE = {
		id = 0,
		functions = 247,
		next = "NO-AUTO",
		setLed = function()
			var_0_4:setFunction("modeAuto")
		end
	},
	["NO-AUTO"] = {
		id = 1,
		functions = 55,
		next = "ACTIVE",
		setLed = function()
			var_0_4:setFunction("modeNoAuto")
		end
	},
	UNKNOWN = {
		id = -1,
		functions = 0,
		next = "ACTIVE",
		setLed = function()
			var_0_4:setFunction("unknown")
		end
	}
}
local var_0_15 = var_0_0({})

local function var_0_16(arg_4_0)
	if arg_4_0 == nil then
		arg_4_0 = var_0_15.flags
	end

	if type(arg_4_0) ~= "number" then
		return nil
	end

	for iter_4_0, iter_4_1 in pairs(var_0_14) do
		if arg_4_0 == iter_4_1.functions then
			return iter_4_0
		end
	end

	for iter_4_2, iter_4_3 in pairs(var_0_14) do
		if var_0_8.band(arg_4_0, iter_4_3.functions) == iter_4_3.functions then
			return iter_4_2
		end
	end
end

local function var_0_17(arg_5_0)
	if type(arg_5_0) ~= "number" then
		return
	end

	var_0_11 = arg_5_0
	var_0_15.flags = var_0_8.band(var_0_11, var_0_10)
end

local function var_0_18(arg_6_0)
	if type(arg_6_0) ~= "number" then
		return
	end

	var_0_11 = var_0_8.bor(arg_6_0, var_0_11)
	var_0_15.flags = var_0_8.band(var_0_11, var_0_10)
end

local function var_0_19(arg_7_0)
	if type(arg_7_0) ~= "number" then
		return
	end

	var_0_11 = var_0_8.band(arg_7_0, var_0_11)
	var_0_15.flags = var_0_8.band(var_0_11, var_0_10)
end

var_0_15.alias = var_0_16
var_0_15.set = var_0_17
var_0_15.enable = var_0_18
var_0_15.disable = var_0_19

function var_0_12.reschedule(arg_8_0)
	if var_0_1.Real.reliable() == false and var_0_1.isUptodate() == false then
		var_0_12:start()
		var_0_3:warning("Rescheduling, Board is not up to date, mode NO-AUTO forced")

		return
	end

	var_0_10 = 4294967295

	var_0_12:stop()

	var_0_12 = nil

	local var_8_0 = var_0_8.band(var_0_11, var_0_10)

	if var_0_15.flags ~= var_8_0 then
		var_0_15.flags = var_8_0

		var_0_14[var_0_16(var_8_0)].setLed()
	end
end

var_0_5.subscribeNtpUpdates(function()
	if var_0_12 then
		var_0_12:reschedule()
	end
end)
var_0_12:setTime(var_0_1.Real(var_0_1.Elapsed(2147483647, 0)))
var_0_12:start()

if var_0_1.Real.reliable() == true or var_0_1.isUptodate() == true then
	var_0_12:reschedule()
else
	var_0_3:warning("Board is not up to date, mode NO-AUTO forced")
end

var_0_11 = var_0_9:get()
var_0_15.flags = var_0_8.band(var_0_11, var_0_10)

var_0_14[var_0_16(var_0_15.flags)].setLed()

local var_0_20 = {
	modified = function(arg_10_0, arg_10_1)
		if arg_10_1 == "modeNext" then
			local var_10_0 = var_0_16(var_0_15.flags)
			local var_10_1 = var_10_0
			local var_10_2 = var_0_14[var_10_0]
			local var_10_3 = var_10_2
			local var_10_4

			while var_10_0 == var_10_1 do
				var_10_2 = var_0_14[var_10_2.next]
				var_10_1 = var_10_0
				var_10_4 = var_10_2.functions
				var_10_0 = var_0_16(var_0_8.band(var_10_4, var_0_10))

				if var_10_2 == var_10_3 then
					break
				end
			end

			if var_10_2 ~= var_10_3 then
				var_0_11 = var_10_4

				var_0_9:push(var_0_11)
				var_0_14[var_10_0].setLed()

				var_0_15.flags = var_10_4
			end
		elseif arg_10_1 == "modeUpdate" then
			var_0_14[var_0_16(var_0_15.flags)].setLed()
		end
	end
}

var_0_4:addFunctionsListener(var_0_20)

local function var_0_21()
	var_0_9:push(var_0_11)

	local var_11_0 = var_0_8.band(var_0_11, var_0_10)

	var_0_14[var_0_16(var_11_0)].setLed()

	var_0_15.flags = var_11_0

	if var_0_10 == 4294967295 then
		var_0_3:notice("Updating mode=" .. var_0_16(var_11_0) .. " functions=" .. tostring(var_0_11))
	else
		var_0_3:warning("Try to updating, but this setup is not up-to-date mode=" .. var_0_16(var_11_0) .. " functions=" .. tostring(var_0_11))
	end
end

function var_0_15.setIB(arg_12_0, arg_12_1)
	if arg_12_1 == true then
		var_0_11 = var_0_8.bor(arg_12_0, var_0_11)
	else
		var_0_11 = var_0_8.band(var_0_8.bnot(arg_12_0), var_0_11)
	end

	var_0_21()
end

function var_0_15.setUB(arg_13_0, arg_13_1)
	if arg_13_1 == true then
		var_0_11 = var_0_8.bor(arg_13_0, var_0_11)
	else
		var_0_11 = var_0_8.band(var_0_8.bnot(arg_13_0), var_0_11)
	end

	var_0_21()
end

function var_0_15.setU(arg_14_0)
	var_0_11 = arg_14_0

	var_0_21()
end

function var_0_15.setI(arg_15_0)
	local var_15_0

	for iter_15_0, iter_15_1 in pairs(var_0_14) do
		if arg_15_0 == iter_15_1.id then
			var_15_0 = iter_15_1

			break
		end
	end

	if var_15_0 ~= nil then
		var_0_11 = var_15_0.functions
	end

	var_0_21()
end

function var_0_15.get()
	return {
		id = var_0_14[var_0_16(var_0_15.flags)].id,
		flags = var_0_15.flags,
		target = var_0_11
	}
end

function var_0_15.checktime()
	var_0_3:info("Check time received")

	if var_0_12 then
		var_0_12:reschedule()
	end
end

local var_0_22 = {}

function var_0_15.addListener(arg_18_0)
	var_0_22[arg_18_0] = arg_18_0
end

local var_0_23 = {}
local var_0_24 = var_0_6()

function var_0_23.modified(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	if arg_19_2 ~= "flags" then
		return
	end

	var_0_24:send()
end

function var_0_24.receive(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in pairs(var_0_22) do
		iter_20_1:changed()
	end
end

var_0_0.add(var_0_15, var_0_23)

return var_0_15
