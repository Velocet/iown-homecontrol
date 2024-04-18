local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.recovery")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.Definitions")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.conf")
local var_0_5 = require("Overkiz.Persistence")
local var_0_6 = require("Overkiz.Subject")
local var_0_7 = require("Overkiz.Timer")
local var_0_8 = require("Overkiz.Time")
local var_0_9 = "uiname"
local var_0_10 = var_0_6()
local var_0_11 = {}
local var_0_12 = var_0_0.getBoardModelInfo()
local var_0_13, var_0_14 = var_0_5.Layer("board", var_0_4.persistenceType)
local var_0_15 = var_0_13:get(var_0_9)

if var_0_15 == nil or var_0_15 == "" then
	var_0_13:put(var_0_9, var_0_12.MACHINE)
end

local var_0_16

function var_0_10.refresh(arg_1_0)
	arg_1_0:createOrUpdate(var_0_13:get(var_0_9))
end

local var_0_17 = var_0_7.Monotonic()

function var_0_17.expired(arg_2_0)
	var_0_1:notice("[UI] Board UI recover refresh timeout expired.")
	var_0_10:refresh()
end

function var_0_10.createOrUpdate(arg_3_0, arg_3_1)
	var_0_1:info("[UI] Updating board UI, using " .. tostring(arg_3_1))

	if var_0_17:isRunning() then
		var_0_17:stop()
	end

	local var_3_0 = var_0_3[arg_3_1]

	if not var_3_0 then
		var_0_1:error("[UI] Unknown UI asked: " .. tostring(arg_3_1))

		return
	end

	local var_3_1

	if arg_3_0.instance then
		var_3_1 = arg_3_0.instance.currentMode

		arg_3_0.instance.unload()

		arg_3_0.instance = "unknown"
		arg_3_0.current = nil
	end

	arg_3_0.instance = var_3_0()

	for iter_3_0, iter_3_1 in pairs(var_0_11) do
		arg_3_0.instance.addFunctionsListener(iter_3_1)
	end

	arg_3_0.instance.load()

	arg_3_0.current = arg_3_1

	var_0_13:put(var_0_9, arg_3_1)

	if var_0_16 then
		arg_3_0.instance.setFunction(var_0_16)
		var_0_10:notify(var_0_16)

		var_0_16 = nil
	elseif var_3_1 then
		var_0_1:debug("apply oldMode to new ui : " .. var_3_1)
		arg_3_0.instance.setFunction(var_3_1)
		var_0_10:notify(var_3_1)
	end

	return true
end

function var_0_10.addFunctionsListener(arg_4_0, arg_4_1)
	if arg_4_0.instance then
		arg_4_0.instance.addFunctionsListener(arg_4_1)
	end

	var_0_11[arg_4_1] = arg_4_1
end

function var_0_10.setFunction(arg_5_0, arg_5_1)
	if arg_5_0.instance then
		arg_5_0.instance.setFunction(arg_5_1)
		var_0_10:notify(arg_5_1)
	else
		var_0_1:notice("[UI] Try to set function while ui instance is nil")

		var_0_16 = arg_5_1
	end
end

function var_0_10.setEvent(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0.instance then
		arg_6_0.instance.setEvent(arg_6_1, arg_6_2)
	else
		var_0_1:notice("[UI] Try to set event while ui instance is nil")
	end
end

function var_0_10.listUI(arg_7_0)
	local var_7_0 = {}

	for iter_7_0, iter_7_1 in pairs(var_0_3) do
		var_7_0[#var_7_0 + 1] = iter_7_0
	end

	return var_7_0
end

function var_0_10.getBoardName(arg_8_0)
	return var_0_12.MACHINE
end

if var_0_13:get(var_0_9) == var_0_10:getBoardName() and var_0_2.get() then
	var_0_17:setTime(var_0_8.Monotonic(var_0_8.Elapsed(30, 0)), true)
	var_0_17:start()
else
	var_0_10:refresh()
end

return var_0_10
