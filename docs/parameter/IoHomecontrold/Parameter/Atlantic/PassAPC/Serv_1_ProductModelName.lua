local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.atlanticProductFamilyNames")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.PassAPC.Diagnostics.encapsulatedAtlanticServices")
local var_0_5 = require("Overkiz.utilities")

local function var_0_6(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = var_0_3.getProductModelNameType(arg_1_1)

	if var_1_0 then
		var_0_2:debug("ProductModelNameType is " .. tostring(var_1_0) .. ". Now setting appropriate data on encapsulated services.")

		for iter_1_0, iter_1_1 in pairs(arg_1_2:getAll()) do
			local var_1_1 = iter_1_1.refreshDef.resync

			if var_1_1.manufacturerSpecific and var_1_1.manufacturerSpecific.encapsulatedServiceId then
				local var_1_2 = var_0_4.getEncapsulatedDataForProductFamily(var_1_0, var_1_1.manufacturerSpecific.encapsulatedServiceId)

				if var_1_2 ~= nil then
					var_0_2:debug("Knowing that product model type is " .. tostring(var_1_0) .. ", setting encapsulated service " .. tostring(var_1_1.manufacturerSpecific.encapsulatedServiceId) .. " with data " .. var_0_5.tableDump(var_1_2))

					var_1_1.info.value.data = var_1_2

					if iter_1_1.refreshDef.intervalTimer then
						iter_1_1.refreshDef.intervalTimer:start()
					end
				end
			end
		end
	else
		var_0_2:warning("PASS APC - Service 1 - Unknown Product Model Name. Therefore not creating diagnostic services.")

		return
	end
end

local var_0_7 = {
	startup = true,
	info = {
		parameter = 202116097,
		value = {
			type = "ay",
			data = {
				0,
				1
			}
		}
	},
	refreshTriggers = var_0_6
}

return (var_0_0(202113025, var_0_1.access.READ, var_0_7))
