local var_0_0 = require("Overkiz.TableStorage")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_2 = require("Overkiz.Subject")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.NodeProfile")
local var_0_4 = require("Overkiz.Event")
local var_0_5 = require("Overkiz.Kizbox.Proxy.Resync")
local var_0_6 = var_0_0("nodes")
local var_0_7 = {}
local var_0_8 = {}

function var_0_7.__call(arg_1_0)
	local var_1_0 = var_0_2()
	local var_1_1 = {}
	local var_1_2 = var_0_5("internal")

	local function var_1_3(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		for iter_2_0, iter_2_1 in pairs(var_1_1) do
			if iter_2_1.hooks and iter_2_1.hooks[arg_2_0] then
				iter_2_1.hooks[arg_2_0](arg_2_1, arg_2_2, arg_2_3)
			end
		end
	end

	local function var_1_4(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
		var_1_3(arg_3_1, arg_3_0, arg_3_2, arg_3_3)

		local var_3_0 = {
			eventType = "SPECIFIC_INTERNAL",
			id = arg_3_0,
			parameterName = arg_3_1,
			value = arg_3_2,
			force = arg_3_4
		}

		var_1_0:notify(var_3_0)
	end

	function var_1_0.reload(arg_4_0, arg_4_1)
		var_0_1:info("Node manager reload " .. tostring(arg_4_1))

		if arg_4_1 and var_0_6[arg_4_1] then
			if var_1_1[arg_4_1] then
				var_1_1[arg_4_1]:update(var_0_6[arg_4_1])
			else
				var_1_1[arg_4_1] = var_0_3(var_0_6[arg_4_1], var_1_4)
			end
		else
			for iter_4_0, iter_4_1 in var_0_0.pairs(var_0_6) do
				if var_1_1[iter_4_0] then
					var_1_1[iter_4_0]:update(iter_4_1)
				else
					var_1_1[iter_4_0] = var_0_3(iter_4_1, var_1_4)
				end
			end
		end
	end

	function var_1_0.keyAdded(arg_5_0)
		local var_5_0 = var_1_0:getNode("modem/0")

		if not var_5_0 then
			local var_5_1 = {}

			var_5_1.type = "modem"
			var_5_1.id = "modem/0"
			var_5_1.status = "done"

			arg_5_0:saveAndReload(var_5_1)

			var_5_0 = var_1_0:getNode("modem/0")

			var_5_0:updated("connectivity", "offline")
			var_1_3("connected", var_5_1.id, true)
		else
			arg_5_0:updateNodeStatus(var_5_0.id, "done")
			var_1_3("connected", var_5_0.id, true)
		end

		var_5_0:refreshAll()
	end

	function var_1_0.keyRemoved(arg_6_0)
		for iter_6_0, iter_6_1 in var_0_0.pairs(var_0_6) do
			if iter_6_1.type == "modem" then
				arg_6_0:updateNodeStatus(iter_6_1.id, "unavailable")
				var_1_3("connected", iter_6_1.id, false)
			end
		end
	end

	function var_1_0.updateNodeStatus(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = var_0_6[arg_7_1]

		if var_7_0 and arg_7_2 ~= var_7_0.status then
			var_0_1:info("Update Node " .. tostring(arg_7_1) .. " status to " .. tostring(arg_7_2))

			var_7_0.status = arg_7_2

			local var_7_1 = {
				eventType = "UPDATED",
				node = {
					address = arg_7_1,
					type = var_7_0.type,
					status = var_7_0.status
				}
			}

			var_1_0:notify(var_7_1)
			arg_7_0:saveAndReload(var_7_0)
		end
	end

	function var_1_0.saveAndReload(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1.id

		if not arg_8_1.status or arg_8_1.status == "" then
			if var_0_6[var_8_0] and (var_0_6[var_8_0].status == "done" or var_0_6[var_8_0].status == "unavailable") then
				arg_8_1.status = var_0_6[var_8_0].status
			else
				arg_8_1.status = "unavailable"
			end
		end

		if not var_0_6[var_8_0] then
			if arg_8_1.type == "alarm" then
				arg_8_1.status = "done"
			end

			local var_8_1 = var_0_4()

			function var_8_1.receive(arg_9_0)
				var_0_1:debug("resyncEvent received")
				var_1_2:update()
			end

			var_8_1:send()

			local var_8_2 = {
				eventType = "CREATED",
				node = {
					address = var_8_0,
					type = arg_8_1.type,
					status = arg_8_1.status
				}
			}

			var_1_0:notify(var_8_2)
		end

		var_0_6[var_8_0] = arg_8_1

		arg_8_0:reload(var_8_0)
	end

	function var_1_0.deleteAndReload(arg_10_0, arg_10_1)
		local var_10_0 = arg_10_1.id
		local var_10_1 = {
			eventType = "DELETED",
			node = {
				address = var_10_0,
				status = var_0_6[var_10_0].status,
				type = var_0_6[var_10_0].type
			}
		}

		var_0_6[var_10_0] = nil
		var_1_1[var_10_0] = nil

		var_1_0:notify(var_10_1)
	end

	function var_1_0.getNodes(arg_11_0)
		return var_1_1
	end

	function var_1_0.getNode(arg_12_0, arg_12_1)
		return var_1_1[arg_12_1]
	end

	function var_1_0.getDef(arg_13_0, arg_13_1)
		return var_0_6[arg_13_1]
	end

	return var_1_0
end

setmetatable(var_0_8, var_0_7)

return var_0_8
