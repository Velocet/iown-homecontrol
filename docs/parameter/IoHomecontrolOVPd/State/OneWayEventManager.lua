local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_1 = require("Overkiz.Time")
local var_0_2 = require("Overkiz.OOP.Class")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Manager")
local var_0_4
local var_0_5 = var_0_2()

function var_0_5.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	arg_1_0.protocol = arg_1_1

	if not arg_1_5 then
		var_0_4 = require("Overkiz.TableStorage")
	else
		var_0_4 = arg_1_5
	end

	arg_1_0.storage = var_0_4(arg_1_1 .. "OneWayControllersBindings")
	arg_1_0.controllerBlacklist = var_0_4.subStorage(arg_1_0.storage, "controllerBlacklist")
	arg_1_0.nodesPerControllerBindings = var_0_4.subStorage(arg_1_0.storage, "nodesPerControllerBindings")
	arg_1_0.refreshManager = arg_1_3
	arg_1_0.log = arg_1_4
	arg_1_0.nodeManager = arg_1_2

	arg_1_2:on(var_0_3.Events.Node, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:onNodeEvent(arg_2_0.address, arg_2_1)
	end)
	arg_1_0:displayBindings()
end

function var_0_5.cleanStorage(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in var_0_4.pairs(arg_3_1) do
		arg_3_1[iter_3_0] = nil
	end
end

function var_0_5.onNodeEvent(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_2 == var_0_0.event.COMPLETED then
		arg_4_0.log:notice("[OneWayEventManager " .. arg_4_0.protocol .. "] New node " .. arg_4_1 .. " : reseting blacklist and bindings")
		arg_4_0:cleanStorage(arg_4_0.controllerBlacklist)
		arg_4_0:cleanStorage(arg_4_0.nodesPerControllerBindings)
		arg_4_0:displayBindings()
	elseif arg_4_2 == var_0_0.event.DELETED then
		for iter_4_0, iter_4_1 in var_0_4.pairs(arg_4_0.nodesPerControllerBindings) do
			if iter_4_1[arg_4_1] ~= nil then
				arg_4_0.log:notice("[OneWayEventManager " .. arg_4_0.protocol .. "] Cleaning binding on node " .. arg_4_1 .. " with controller " .. iter_4_0 .. " (node deleted)")

				iter_4_1[arg_4_1] = nil
				arg_4_0.nodesPerControllerBindings[iter_4_0] = iter_4_1

				if not next(iter_4_1) then
					arg_4_0.nodesPerControllerBindings[iter_4_0] = nil

					arg_4_0.log:notice("[OneWayEventManager " .. arg_4_0.protocol .. "] Adding controller " .. iter_4_0 .. " to blacklist : no more bindings")

					arg_4_0.controllerBlacklist[iter_4_0] = {}
				end
			end
		end

		arg_4_0:displayBindings()
	end
end

function var_0_5.displayBindings(arg_5_0)
	arg_5_0.log:debug("[OneWayEventManager " .. arg_5_0.protocol .. "] One way links details :")
	arg_5_0.log:debug("Blacklist")

	for iter_5_0, iter_5_1 in var_0_4.pairs(arg_5_0.controllerBlacklist) do
		arg_5_0.log:debug("     ==> " .. iter_5_0)
	end

	arg_5_0.log:debug("Bindings")

	for iter_5_2, iter_5_3 in var_0_4.pairs(arg_5_0.nodesPerControllerBindings) do
		arg_5_0.log:debug("     ==> " .. iter_5_2)

		for iter_5_4, iter_5_5 in pairs(iter_5_3) do
			arg_5_0.log:debug("         - " .. iter_5_4)
		end
	end
end

function var_0_5.oneWayActivateFuncIntercepted(arg_6_0, arg_6_1)
	if arg_6_0.controllerBlacklist[arg_6_1] ~= nil then
		arg_6_0.log:debug("[OneWayEventManager " .. arg_6_0.protocol .. "] Ignoring one-way frame from controller " .. arg_6_1 .. " : blacklisted")

		return
	end

	local var_6_0 = var_0_1.Monotonic.now()
	local var_6_1 = math.random(500, 1500)
	local var_6_2 = var_6_0 + var_0_1.Elapsed(0, var_6_1 * 1000000)

	if arg_6_0.nodesPerControllerBindings[arg_6_1] ~= nil then
		arg_6_0.log:info("[OneWayEventManager " .. arg_6_0.protocol .. "] Refreshing nodes bound to one-way controller " .. arg_6_1)

		for iter_6_0, iter_6_1 in pairs(arg_6_0.nodesPerControllerBindings[arg_6_1]) do
			arg_6_0.refreshManager:refreshStates(iter_6_0, var_6_2)
		end
	else
		arg_6_0.log:notice("[OneWayEventManager " .. arg_6_0.protocol .. "] New one-way controller " .. arg_6_1 .. " : refreshing nodes bindings")
		arg_6_0.log:notice("[OneWayEventManager " .. arg_6_0.protocol .. "] Adding controller " .. arg_6_1 .. " to blacklist : init bindings")

		arg_6_0.controllerBlacklist[arg_6_1] = {}

		for iter_6_2, iter_6_3 in pairs(arg_6_0.nodeManager:getNodesByClass(var_0_0.class.ACTUATOR)) do
			arg_6_0.refreshManager:refreshStates(iter_6_3.address, var_6_2)
		end
	end
end

function var_0_5.externalControllerActivateAck(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_1 == arg_7_2 then
		arg_7_0.log:debug("[OneWayEventManager " .. arg_7_0.protocol .. "] Ignoring binding on node " .. arg_7_1 .. " : last controller is itself")

		return
	end

	local var_7_0 = arg_7_0.nodesPerControllerBindings[arg_7_2]

	if var_7_0 == nil then
		if arg_7_0.controllerBlacklist[arg_7_2] == nil then
			arg_7_0.log:debug("[OneWayEventManager " .. arg_7_0.protocol .. "] Ignoring binding between controller " .. arg_7_2 .. " and node " .. arg_7_1 .. " : requires full refresh")

			return
		else
			arg_7_0.log:notice("[OneWayEventManager " .. arg_7_0.protocol .. "] Removing controller " .. arg_7_2 .. " from blacklist")

			arg_7_0.controllerBlacklist[arg_7_2] = nil
		end

		var_7_0 = {}
	end

	if var_7_0[arg_7_1] == nil then
		arg_7_0.log:notice("[OneWayEventManager " .. arg_7_0.protocol .. "] Binding controller " .. arg_7_2 .. " with node " .. arg_7_1)

		var_7_0[arg_7_1] = {}
		arg_7_0.nodesPerControllerBindings[arg_7_2] = var_7_0

		arg_7_0:displayBindings()
	end
end

function var_0_5.oneWayConfigIntercepted(arg_8_0, arg_8_1)
	arg_8_0.log:notice("[OneWayEventManager " .. arg_8_0.protocol .. "] Reseting mappings on one-way controller " .. arg_8_1)

	arg_8_0.controllerBlacklist[arg_8_1] = nil
	arg_8_0.nodesPerControllerBindings[arg_8_1] = nil

	arg_8_0:displayBindings()
end

return var_0_5
