local var_0_0 = require("Overkiz.moduleUtils")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.OVP.State.manager")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.log")
local var_0_3 = {
	getStateValue = function(arg_1_0, arg_1_1, arg_1_2)
		local var_1_0 = {}

		var_1_0["ovp:DeDietrichDerogationA"] = 187695757
		var_1_0["ovp:DeDietrichDerogationB"] = 187695763
		var_1_0["ovp:DeDietrichDerogationC"] = 187695771

		local var_1_1 = var_1_0[tostring(arg_1_1) .. ":" .. tostring(arg_1_2)]

		if var_1_1 == nil then
			return var_1_1
		end

		local var_1_2, var_1_3, var_1_4 = string.match(arg_1_0, "([^/:]*)://([^/]*)/(.*)")

		if var_1_4:find("/") then
			var_1_4 = string.match(var_1_4, "(.*)/(.*)")
		end

		if var_1_4 == nil then
			return var_1_4
		end

		local var_1_5 = var_0_1:getRawStates()
		local var_1_6

		if var_1_5 ~= nil then
			var_1_6 = var_0_1.rawStates[tostring(var_1_4) .. "#" .. tostring(var_1_1)]
		end

		if var_1_6 ~= nil then
			return var_1_6.value.data
		end

		return nil
	end
}

return var_0_0.loadModule("modbus-utils", nil, var_0_2, var_0_3)
