local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Natif.dispatcher")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Natif.view")
local var_0_2 = require("Overkiz.Timer")
local var_0_3 = {}

local function var_0_4(arg_1_0)
	local var_1_0 = var_0_2.Timeout.create(60000, function()
		var_0_4(arg_1_0)
	end)

	var_0_0:push("state", arg_1_0, function()
		var_1_0:cancel()
	end, function()
		var_1_0:cancel()
		var_0_2.Timeout.create(2000, function()
			var_0_4(arg_1_0)
		end)
	end)
end

local function var_0_5(arg_6_0)
	local var_6_0 = var_0_1:buildTransportStateFromNotification(arg_6_0)
	local var_6_1 = var_0_3.nodeManager:getNode(arg_6_0.nodeAddress).parameters[arg_6_0.rawStateId]

	if var_6_1 and var_6_1:getParameterRefreshDefinition().retry then
		var_0_4(var_6_0)

		return
	end

	var_0_0:push("state", var_6_0)
end

function var_0_3.init(arg_7_0, arg_7_1)
	var_0_3.stateManager = arg_7_0
	var_0_3.nodeManager = arg_7_1

	var_0_3.stateManager:addListener(var_0_5)
end

function var_0_0.getstates(arg_8_0)
	local var_8_0 = var_0_3.stateManager:getStates()

	for iter_8_0, iter_8_1 in pairs(var_8_0) do
		local var_8_1 = var_0_1:buildTransportState(iter_8_1)

		var_0_0:push("state", var_8_1)
	end

	return true
end

function var_0_0.refreshall(arg_9_0)
	var_0_3.stateManager:refreshAll()

	return true
end

return var_0_3
