local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_1 = {}
local var_0_2 = {}

function var_0_1.__call(arg_1_0, arg_1_1)
	local var_1_0 = {
		listeners = {},
		allowedConnectionStatusChanges = {
			disconnected = true,
			connectionPending = true,
			connected = true
		}
	}

	var_1_0.lastConnectionStatus = "Unknown"
	var_1_0.currentMode = "Unknown"

	function var_1_0.checkIfAllowed(arg_2_0, arg_2_1, arg_2_2)
		if not arg_2_2[arg_2_0] then
			var_0_0:debug("No transition available for this mode")

			return false
		end

		if not arg_2_2[arg_2_0][arg_2_1] then
			var_0_0:debug("Transition not allowed from " .. arg_2_0 .. " to " .. arg_2_1)

			return false
		end

		return true
	end

	function var_1_0.addFunctionsListener(arg_3_0)
		var_1_0.listeners[arg_3_0] = arg_3_0
	end

	function var_1_0.notify(arg_4_0)
		var_0_0:info("Event notification: " .. arg_4_0)

		for iter_4_0, iter_4_1 in pairs(var_1_0.listeners) do
			iter_4_1:modified(arg_4_0)
		end
	end

	function var_1_0.setFunction(arg_5_0)
		var_0_0:critical("Board must override this function")
	end

	function var_1_0.setEvent(arg_6_0)
		var_0_0:critical("Board must override this function")
	end

	return var_1_0
end

setmetatable(var_0_2, var_0_1)

return var_0_2
