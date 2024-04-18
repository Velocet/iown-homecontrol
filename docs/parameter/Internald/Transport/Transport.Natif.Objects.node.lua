local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Natif.dispatcher")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Natif.view")
local var_0_3 = {}

function var_0_3.init(arg_1_0)
	var_0_3.nodeManager = arg_1_0

	var_0_3.nodeManager:addListener(var_0_3.nodeListener)
end

function var_0_1.node(arg_2_0)
	local var_2_0 = {
		id = "string",
		type = "string"
	}
	local var_2_1, var_2_2 = var_0_0.checkPath(arg_2_0, var_2_0)

	if not var_2_1 then
		return false, var_2_2
	end

	local var_2_3 = var_0_2:buildNodeFromTransport(arg_2_0)

	var_0_3.nodeManager:saveAndReload(var_2_3)

	return true
end

function var_0_1.deletenode(arg_3_0)
	local var_3_0 = {
		id = "string"
	}
	local var_3_1, var_3_2 = var_0_0.checkPath(arg_3_0, var_3_0)

	if not var_3_1 then
		return false, var_3_2
	end

	var_0_3.nodeManager:deleteAndReload(arg_3_0)

	return true
end

function var_0_1.getnodes(arg_4_0)
	local var_4_0 = var_0_3.nodeManager:getNodes()

	for iter_4_0, iter_4_1 in pairs(var_4_0) do
		local var_4_1 = var_0_2:buildTransportNode(iter_4_1)

		var_0_1:push("node", var_4_1)
	end

	return true
end

var_0_3.nodeListener = {}

function var_0_3.nodeListener.notified(arg_5_0, arg_5_1)
	if arg_5_1.node == nil or arg_5_1.event_type == "SPECIFIC_INTERNAL" then
		return
	end

	local var_5_0 = var_0_2:buildTransportNodeFromNotification(arg_5_1.node)

	var_0_1:push("node", var_5_0)
end

return var_0_3
