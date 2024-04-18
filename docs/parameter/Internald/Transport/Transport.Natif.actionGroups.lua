local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Natif.view")
local var_0_3 = require("Overkiz.HomeAutomation.Trigger.Proxy.Launcher")("internal")

var_0_3.groupDelegate = {}

local var_0_4
local var_0_5

function var_0_3.init(arg_1_0, arg_1_1)
	var_0_4 = arg_1_0
	var_0_5 = arg_1_1
end

function var_0_3.newActionGroup(arg_2_0, arg_2_1, arg_2_2)
	var_0_1:info("Internal: launch action group")

	local var_2_0 = {
		commands = {
			{
				command = {
					param = "string",
					node = "string",
					access = "string"
				}
			}
		}
	}
	local var_2_1, var_2_2 = var_0_0.checkPath(arg_2_2, var_2_0)

	if not var_2_1 then
		var_0_1:error("Error on parsing new action group (" .. var_2_2 .. ")")

		return
	end

	local var_2_3 = {
		id = arg_2_1.launchid,
		progress = arg_2_0.groupDelegate.progress,
		originator = var_0_5,
		cmds = {}
	}

	for iter_2_0, iter_2_1 in ipairs(arg_2_2.commands) do
		local var_2_4 = iter_2_1.command

		table.insert(var_2_3.cmds, var_0_2:buildCommandFromTransport({
			node = var_2_4.node,
			index = var_2_4.index,
			param = var_2_4.param,
			value = var_2_4.value,
			access = var_2_4.access
		}))
	end

	var_0_4:addInternalCommand(var_2_3)
end

function var_0_3.canceled(arg_3_0, arg_3_1)
	return
end

return var_0_3
