local var_0_0 = {}
local var_0_1 = {}

function var_0_0.__call(arg_1_0, arg_1_1)
	local var_1_0 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
	local var_1_1 = require("Overkiz.Event")
	local var_1_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Natif.view")
	local var_1_3 = require("Overkiz.Cloudlink.si")
	local var_1_4 = {
		groups = {}
	}

	var_1_4.currentCmd = nil
	var_1_4.handlerId = ""
	var_1_4.currentGroup = nil
	var_1_4.delegate = {}

	local var_1_5 = var_1_1()

	local function var_1_6()
		var_1_4.currentCmd = nil

		if not var_1_4.currentGroup or not var_1_4.currentGroup.cmds or #var_1_4.currentGroup.cmds < 1 then
			var_1_4.currentGroup = nil

			var_1_4:processGroup()
		else
			var_1_5:send()
		end
	end

	local function var_1_7(arg_3_0)
		if var_1_4 and var_1_4.currentGroup and var_1_4.currentGroup.originator then
			local var_3_0 = var_1_2:buildRawCommandResult(var_1_4.currentGroup.id, var_1_4.currentCmd.id, arg_3_0)

			var_1_4.currentGroup.originator:progress(var_1_4.currentGroup, var_3_0)
		else
			var_1_0:warning("doProgressWithStatus: async issue, currentGroup:progress wanted to be called, but currentGroup is nil")
		end
	end

	local function var_1_8(arg_4_0)
		var_1_0:error("Command failed: " .. tostring(arg_4_0))
		var_1_7(var_1_3.status.ERROR_WHILE_EXECUTING)
		var_1_6()
	end

	local function var_1_9()
		var_1_0:info("Command done.")
		var_1_7(var_1_3.status.DONE)
		var_1_6()
	end

	local function var_1_10()
		var_1_0:info("Command in progress.")
		var_1_7(var_1_3.status.EXECUTING)
	end

	local function var_1_11(arg_7_0, arg_7_1)
		if arg_7_1.access == "w" then
			arg_7_0:write(arg_7_1.param, arg_7_1.value, var_1_9, var_1_8, var_1_10)
		elseif arg_7_1.access == "r" then
			arg_7_0:read(arg_7_1.param, var_1_9, var_1_8)
		else
			var_1_8("Unknown access")
		end
	end

	function var_1_5.receive(arg_8_0, arg_8_1)
		var_1_0:debug("CommandManager : event received")

		if not var_1_4.currentCmd and var_1_4.currentGroup then
			var_1_4.currentCmd = table.remove(var_1_4.currentGroup.cmds, 1)

			if not var_1_4.currentCmd.id then
				var_1_4.currentCmd.id = var_1_4.currentCmd.index
			end

			var_1_7(var_1_3.status.EXECUTING)

			local var_8_0 = arg_1_1:getNode(var_1_4.currentCmd.node)

			if not var_8_0 then
				var_1_8("node doesn't exists")
			else
				var_1_11(var_8_0, var_1_4.currentCmd)
			end
		end
	end

	function var_1_4.processGroup(arg_9_0)
		if not arg_9_0.currentGroup then
			if #arg_9_0.groups > 0 then
				arg_9_0.currentGroup = table.remove(arg_9_0.groups, 1)
			else
				return
			end
		end

		var_1_5:send()
	end

	function var_1_4.add(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
		var_1_0:debug("CommandManager : adding group command : " .. tostring(arg_10_2.id))

		local var_10_0 = {
			priority = 0,
			id = arg_10_2.id,
			originator = arg_10_1,
			progress = arg_10_1.progress,
			cmds = {}
		}

		for iter_10_0, iter_10_1 in pairs(arg_10_3) do
			table.insert(var_10_0.cmds, iter_10_1)
		end

		arg_10_0:addInternalCommand(var_10_0)
	end

	function var_1_4.addInternalCommand(arg_11_0, arg_11_1)
		table.insert(arg_11_0.groups, arg_11_1)
		arg_11_0:processGroup()
	end

	return var_1_4
end

setmetatable(var_0_1, var_0_0)

return var_0_1
