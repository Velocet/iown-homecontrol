local var_0_0 = require("Overkiz.OrderedList")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Manager.mpFpModel")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainAndFunctionalParameter")
local var_0_4 = 65537
local var_0_5 = 3
local var_0_6 = {}
local var_0_7 = {}

function var_0_6.__call(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1 == nil or arg_1_2 == nil then
		arg_1_2:warning("MpFpRefresh manager: invalid or missing arguments")
	end

	local var_1_0 = {
		transportOriginator = {}
	}

	function var_1_0.reset(arg_2_0)
		var_1_0.nbParameters = 0
		var_1_0.parameters = {}
		var_1_0.parameters[1] = nil
		var_1_0.parameters[2] = nil
		var_1_0.parameters[3] = nil
		var_1_0.parameters[4] = nil
		var_1_0.parameters[5] = nil
		var_1_0.parameters[6] = nil
		var_1_0.parameters[7] = nil
		var_1_0.parameters[8] = nil
		var_1_0.nbFrames = 0
		var_1_0.currentNodeAddress = 0
	end

	local function var_1_1(arg_3_0, arg_3_1)
		if arg_3_0.fpId < arg_3_1.fpId then
			return true
		else
			return false
		end
	end

	function var_1_0.setNode(arg_4_0, arg_4_1)
		var_1_0.currentNodeAddress = arg_4_1
	end

	function var_1_0.addParameter(arg_5_0, arg_5_1)
		if arg_5_1 ~= nil and type(arg_5_1.id) == "number" then
			if arg_5_1.id ~= var_0_4 then
				var_1_0.nbParameters = var_1_0.nbParameters + 1

				if var_1_0.nbParameters > var_1_0.nbFrames * var_0_5 then
					var_1_0.nbFrames = var_1_0.nbFrames + 1
				end

				arg_5_1.fpId = arg_5_1.id - var_0_4

				local var_5_0 = var_1_0.parameters[var_1_0.nbFrames]

				if var_5_0 == nil then
					var_5_0 = var_0_0(var_1_1, arg_1_2)
					var_1_0.parameters[var_1_0.nbFrames] = var_5_0
				end

				var_5_0:addElement(arg_5_1)
			elseif var_1_0.nbFrames == 0 then
				var_1_0.nbFrames = 1
			end
		else
			arg_1_2:warning("mpFpRefreshManager: bad parameter given on node " .. var_1_0.currentNodeAddress)
		end
	end

	function var_1_0.send(arg_6_0, arg_6_1, arg_6_2)
		local var_6_0 = var_1_0.nbFrames
		local var_6_1 = {}

		if var_6_0 > 0 then
			arg_1_2:info("Refreshing MpFp states on node " .. var_1_0.currentNodeAddress .. " (" .. var_1_0.nbParameters + 1 .. " parameter(s) to refresh on " .. var_6_0 .. " frame(s))")

			local var_6_2 = {}

			for iter_6_0 = 1, var_6_0 do
				local var_6_3 = {
					value = {}
				}

				var_6_3.value.type = "ay"
				var_6_3.value.data = var_1_0:getDataFromParameters(var_1_0.parameters[iter_6_0])

				if not arg_6_1 then
					var_6_3.priority = var_0_1.priority.HIGH
				end

				local var_6_4 = var_0_1:buildParameterCommand(var_0_3, var_1_0.currentNodeAddress, var_6_3)

				var_6_4.id = #var_6_2
				var_6_2[var_6_4.id + 1] = var_6_4
				var_6_1[var_6_4.id] = var_0_1.status.PENDING
			end

			if arg_6_1 then
				arg_1_1:addBufferedCommands(var_1_0.transportOriginator, var_6_2)
			else
				local var_6_5 = arg_1_1:generateGroup()
				local var_6_6 = {
					id = var_6_5.id,
					commands = var_6_1
				}

				if arg_6_2 ~= nil then
					arg_1_1:add(arg_6_2, var_6_5, var_6_2)
				else
					arg_1_1:add(var_1_0.transportOriginator, var_6_5, var_6_2)
				end

				var_1_0:reset()

				return var_6_6
			end
		end

		var_1_0:reset()
	end

	function var_1_0.getDataFromParameters(arg_7_0, arg_7_1)
		local var_7_0 = 0
		local var_7_1 = 0
		local var_7_2 = 0
		local var_7_3 = {}
		local var_7_4 = 2
		local var_7_5 = false
		local var_7_6

		if arg_7_1 ~= nil then
			var_7_6 = arg_7_1:getHead()
		end

		while var_7_6 ~= nil do
			local var_7_7 = var_7_6.object

			arg_1_2:debug("   processing fp" .. var_7_7.fpId .. "...")

			if var_7_7.fpId <= 8 then
				var_7_0 = var_7_0 + 2^(8 - var_7_7.fpId)
				var_7_1 = var_7_1 + 1
			else
				if var_7_5 == false then
					var_7_4 = var_7_4 + 1
					var_7_5 = true
				end

				var_7_2 = var_7_2 + 2^(16 - var_7_7.fpId)
			end

			if var_7_7.value ~= nil and type(var_7_7.value.data) == "number" then
				arg_1_2:debug("     use special extended information " .. var_7_7.value.data .. " to refresh fp" .. var_7_7.fpId)

				var_7_3[var_7_4] = var_7_7.value.data
			else
				var_7_3[var_7_4] = var_0_2.extendedInformationType.CURRENT_USING_A_RELATIVE_VALUE
			end

			var_7_4 = var_7_4 + 1
			var_7_6 = var_7_6.next
		end

		var_7_3[1] = var_7_0
		var_7_3[var_7_1 + 2] = var_7_2

		return var_7_3
	end

	var_1_0:reset()

	return var_1_0
end

setmetatable(var_0_7, var_0_6)

return var_0_7
