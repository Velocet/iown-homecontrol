local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter9")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.CurrentAliasOnMainParameter")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Object.SofopuObject")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_7 = require("pl.List")
local var_0_8 = require("Overkiz.utilities")
local var_0_9 = {}

var_0_9.name = "SlidingWindowWithLock"

function var_0_9.create(arg_1_0)
	var_0_0:create(var_0_3, arg_1_0)

	if arg_1_0.manufacturer == var_0_1.manufacturers.Somfy then
		local var_1_0 = var_0_7({
			5,
			1,
			3,
			7,
			5,
			6,
			9
		}):map(string.byte)
		local var_1_1 = var_0_8.tableExtract(arg_1_0.generalinfo[1], 1, 7)

		if var_0_8.tableCompare(var_1_1, var_1_0) then
			local var_1_2 = var_0_8.tableDeepCopy(var_0_5.refresh)

			var_1_2.startup = true
			var_1_2.oncommand = true

			var_0_0:create(var_0_5, arg_1_0, var_1_2)
			var_0_0:create(var_0_4, arg_1_0)
			var_0_6:debug("Node " .. arg_1_0.address .. " is a Sliding window with optional secured ventilation")

			local function var_1_3(arg_2_0, arg_2_1, arg_2_2)
				var_0_6:debug("[Somfy Sliding Window with Lock] Link alias refresh to MainParameter.")

				local var_2_0 = arg_2_2:lookupParameterById(var_0_4.id)

				if var_2_0.refreshDef then
					var_2_0.refreshDef:refresh()
				end
			end

			local var_1_4 = {
				refreshTriggers = var_1_3
			}

			var_0_0:create(var_0_2, arg_1_0, var_1_4)
		end
	end
end

return var_0_9
