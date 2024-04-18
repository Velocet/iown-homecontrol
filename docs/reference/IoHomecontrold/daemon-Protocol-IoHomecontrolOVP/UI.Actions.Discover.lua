local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.UI.Actions.Action")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.Wink")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Manager")
local var_0_5 = {}
local var_0_6 = {}

function var_0_5.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6, arg_1_7, arg_1_8)
	if arg_1_7 == nil then
		arg_1_6:warning("UI Action Discover: missing or invalid parameters")
	end

	local var_1_0 = arg_1_7.name

	if arg_1_8 then
		var_1_0 = var_1_0 .. "WithWink"
	end

	local var_1_1 = var_0_0(var_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6)

	var_1_1.pairedNodes = {}
	var_1_1.errorNodes = {}

	arg_1_2:on(var_0_4.Events.Node, function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_1 == var_0_1.event.DELETED and var_1_1.running == true then
			var_1_1.errorNodes[arg_2_0.address] = arg_2_0.class
		end
	end)

	function var_1_1.launch(arg_3_0)
		local var_3_0 = var_1_1.nodeManager:getStackNodeOrCreate().address

		for iter_3_0, iter_3_1 in pairs(var_1_1.nodeManager:getNodes()) do
			var_1_1.pairedNodes[iter_3_1.address] = iter_3_1.class
		end

		local var_3_1 = {
			group = var_1_1.commandManager:addParameterCommand(arg_1_1, arg_1_7, var_3_0)
		}

		var_3_1.id = 0

		return var_3_1
	end

	function var_1_1.onDone(arg_4_0)
		var_1_1.log:debug("UI action: End of discover")

		local var_4_0 = 0
		local var_4_1 = {}

		for iter_4_0, iter_4_1 in pairs(var_1_1.nodeManager:getNodes()) do
			if var_1_1.pairedNodes[iter_4_1.address] == nil then
				var_1_1.log:debug("  node " .. iter_4_1.address .. " has been discovered (class " .. iter_4_1.class .. ")")

				var_4_0 = var_4_0 + 1
				var_4_1[iter_4_1.address] = iter_4_1.class
			end
		end

		local var_4_2 = false

		for iter_4_2, iter_4_3 in pairs(var_1_1.errorNodes) do
			var_1_1.log:debug("  error while discovering node " .. iter_4_2 .. " (class " .. iter_4_3 .. ")")

			var_4_2 = true
		end

		if var_4_0 == 0 then
			if var_4_2 == true then
				arg_1_4:actionEnd(false)
			else
				arg_1_4:actionNoEffects()
			end

			var_1_1.log:debug("  no new nodes have been discovered")
		else
			if var_4_2 == true then
				arg_1_4:actionEnd(false)
			else
				arg_1_4:actionEnd(true)
			end

			var_1_1.resyncModule:update()

			if arg_1_8 == true then
				local var_4_3 = {}

				for iter_4_4, iter_4_5 in pairs(var_4_1) do
					if iter_4_5 == var_0_1.class.ACTUATOR then
						local var_4_4 = var_0_2:buildParameterCommand(var_0_3, iter_4_4)

						var_4_4.id = #var_4_3

						table.insert(var_4_3, var_4_4)
					end
				end

				if #var_4_3 ~= 0 then
					local var_4_5 = var_1_1.commandManager:generateGroup()

					var_1_1.commandManager:add(var_1_1.transportOriginator, var_4_5, var_4_3)
				end
			end
		end

		var_1_1.pairedNodes = {}
		var_1_1.errorNodes = {}
	end

	return var_1_1
end

setmetatable(var_0_6, var_0_5)

return var_0_6
