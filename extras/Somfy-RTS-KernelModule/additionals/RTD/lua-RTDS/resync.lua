import("Overkiz.HomeAutomation.Protocol.RTDS.Node")
import("Overkiz.HomeAutomation.Protocol.RTDS.Profile")
import("Overkiz.HomeAutomation.Protocol.RTDS.Command")
import("Overkiz.HomeAutomation.Protocol.RTDS.State.notifier")
import("Overkiz.Bus")
import("Overkiz.HomeAutomation.Protocol.RTDS.log")

local var_0_0 = {}
local var_0_1 = {}

function var_0_0.modified(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2 == 0 then
		Node.create(arg_1_1)
	elseif arg_1_2 == 1 then
		Node.create(arg_1_1)
	elseif arg_1_2 == 2 then
		Node.delete(arg_1_1)
	end
end

Node.notifier.Watcher:add(var_0_0)

local function var_0_2()
	log:info("Starting resync nodes")

	local var_2_0 = Node.manager:getNodes()

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		Node.create(iter_2_1)
	end
end

local var_0_3 = Bus.Manager()

function var_0_3.nameOwnerChanged(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_1 == Node.manager:getHost() and arg_3_3 ~= "" then
		var_0_2()
	end
end

var_0_3:start()

if var_0_3:nameHasOwner(Node.manager:getHost()) then
	var_0_2()
end

function var_0_1.modified(arg_4_0, arg_4_1)
	local var_4_0 = Node.find(arg_4_1.address)

	if var_4_0 == nil then
		return
	end

	for iter_4_0, iter_4_1 in pairs(var_4_0.states) do
		if tostring(iter_4_1) == tostring(arg_4_1.parameterId) then
			Profile[tostring(iter_4_1)].update(var_4_0.device, arg_4_1.value)
		end
	end
end

notifier.Watcher:add(var_0_1)

return {
	state = var_0_1,
	node = var_0_0,
	appManager = var_0_3
}
