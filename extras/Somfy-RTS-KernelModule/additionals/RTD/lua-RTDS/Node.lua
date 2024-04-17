import("Overkiz.HomeAutomation.Protocol.RTDS.Node.Type")
import("Overkiz.HomeAutomation.Protocol.RTDS.nodes")
import("Overkiz.HomeAutomation.Trigger.Proxy.Device")
import("Overkiz.Kizbox.id")
import("Overkiz.HomeAutomation.Protocol.RTDS.log")

local var_0_0 = {}

function var_0_0.create(arg_1_0)
	local var_1_0 = Type[tostring(arg_1_0.field)]

	if var_1_0 == nil then
		return nil
	end

	local var_1_1 = {}
	local var_1_2 = arg_1_0

	var_1_2.states = {}

	local var_1_3 = "rtds://" .. Overkiz.Kizbox.id() .. "/" .. tostring(var_1_2.address)

	log:info("Create node " .. var_1_3)

	var_1_2.device = Device(var_1_3)

	setmetatable(var_1_2, var_0_0)

	nodes[tostring(var_1_2.address)] = var_1_2

	var_1_0.create(var_1_3, var_1_2)

	return var_1_2
end

function var_0_0.update(arg_2_0)
	return var_0_0.create(arg_2_0)
end

function var_0_0.delete(arg_3_0)
	local var_3_0 = nodes[tostring(arg_3_0.address)]

	log:info("Delete node " .. arg_3_0.address)

	nodes[tostring(arg_3_0.address)] = nil

	if var_3_0 == nil then
		return
	end

	local var_3_1 = Type[tostring(arg_3_0.field)]

	if var_3_1 == nil then
		return
	end

	var_3_1.delete(var_3_0, arg_3_0)
end

function var_0_0.find(arg_4_0)
	return nodes[tostring(arg_4_0)]
end

return var_0_0
