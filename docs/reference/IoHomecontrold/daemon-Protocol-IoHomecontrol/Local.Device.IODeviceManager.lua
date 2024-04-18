local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Local.Device.DeviceManager")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_2 = require("Overkiz.moduleUtils")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Transport.Utils.Node")
local var_0_4 = {}
local var_0_5 = {}
local var_0_6 = "io-manufacturer-subtypes-guesser-utils"
local var_0_7 = 0
local var_0_8 = {
	[16] = {
		"5066738"
	},
	[32] = {
		"5109538",
		"5111501",
		"5116661",
		"5116659"
	},
	[2] = {
		"5125936"
	},
	[48] = {
		"5128194"
	}
}

function var_0_4.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = var_0_0(arg_1_1, arg_1_2, arg_1_3, arg_1_4)

	function var_1_0.guessManufacturerSubType(arg_2_0, arg_2_1)
		if not arg_2_1.generalInfo1 or not arg_2_1.generalInfo2 then
			error("A raw Node def must have its general info 1 & 2")
		end

		if not arg_2_0.utils then
			arg_1_4:error("[IoDeviceManager] Unable to compute type. utils is missing.")

			return 0
		end

		local var_2_0, var_2_1 = var_0_3.getNodeTypeAndNodeSubType(arg_2_1.type)
		local var_2_2 = arg_2_0.utils.guessManufacturerSubType(arg_2_1.class, var_2_0, var_2_1, arg_2_1.manufacturer, arg_2_1.generalInfo1, arg_2_1.generalInfo2)

		if var_2_2 == var_0_7 and var_2_0 == var_0_1.profile.EXTERIOR_VENETIAN_BLIND and var_2_1 == 0 and arg_2_1.manufacturer == var_0_1.manufacturers.Somfy then
			for iter_2_0, iter_2_1 in pairs(var_0_8) do
				for iter_2_2, iter_2_3 in ipairs(iter_2_1) do
					if arg_2_1.generalInfo1:sub(1, 7):tostring("utf-8") == iter_2_3 then
						return iter_2_0
					end
				end
			end
		end

		return var_2_2 or var_0_7
	end

	var_1_0.utils = var_0_2.loadModule(var_0_6, nil, arg_1_4)

	if not var_1_0.utils then
		arg_1_4:error("io requires the module " .. var_0_6)
	end

	var_1_0:checkImplementation()

	return var_1_0
end

setmetatable(var_0_5, var_0_4)

return var_0_5
