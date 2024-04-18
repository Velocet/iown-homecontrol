local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Natif.dispatcher")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Natif.view")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_4 = {
	commandManager = {}
}

function var_0_4.init(arg_1_0, arg_1_1)
	var_0_4.commandManager = arg_1_0
	arg_1_1.groupDelegate = var_0_4
end

function var_0_1.group(arg_2_0)
	local var_2_0 = {
		id = "string",
		commands = {
			{
				command = {
					access = "string",
					param = "string"
				}
			}
		}
	}
	local var_2_1, var_2_2 = var_0_0.checkPath(arg_2_0, var_2_0)

	if not var_2_1 then
		var_0_3:debug("wrong group format")

		return false, var_2_2
	end

	local var_2_3 = var_0_2:buildGroupFromTransport(arg_2_0)
	local var_2_4 = {}

	for iter_2_0, iter_2_1 in pairs(arg_2_0.commands) do
		local var_2_5 = var_0_2:buildCommandFromTransport(iter_2_1.command)

		var_2_4[#var_2_4 + 1] = var_2_5

		var_0_3:notice("new command added from server")
	end

	var_2_3.cmds = var_2_4
	var_2_3.priority = 0
	var_2_3.originator = var_0_4

	var_0_4.commandManager:addInternalCommand(var_2_3)

	return true
end

function var_0_1.cancelgroup(arg_3_0)
	var_0_3:debug("not implemented")

	return true
end

function var_0_4.progress(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = {
		index = arg_4_2.index,
		status = arg_4_2.status,
		groupid = arg_4_2.groupid
	}

	var_0_1:push("commandresult", var_4_0)
end

return var_0_4
