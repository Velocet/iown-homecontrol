local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Object.SensorInternalTriggerDetailedStatusObject")
local var_0_3 = require("bit")
local var_0_4 = {
	maintenanceRequired = 1
}
local var_0_5

var_0_5.maintenanceRequiredDefect, var_0_5 = "maintenanceRequired", var_0_0(2415919110, var_0_1.access.READ)

local function var_0_6(arg_1_0, arg_1_1, arg_1_2)
	if var_0_3.band(arg_1_1.data, var_0_4.maintenanceRequired) ~= 0 or arg_1_0 == nil or var_0_3.band(arg_1_0.data, var_0_4.maintenanceRequired) ~= 0 then
		local var_1_0 = arg_1_2:lookupParameterById(var_0_2.id)

		if var_1_0 and var_1_0.refreshDef then
			if var_0_5.log ~= nil then
				var_0_5.log:info("   sensor defect: launching maintenance details refresh")
			end

			var_1_0.refreshDef:refresh()
		end
	end
end

var_0_5.refreshWithMaintenanceDetails = {
	refreshTriggers = var_0_6
}

return var_0_5
