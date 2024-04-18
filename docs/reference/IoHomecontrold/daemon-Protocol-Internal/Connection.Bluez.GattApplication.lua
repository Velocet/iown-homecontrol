local var_0_0 = require("Overkiz.Bus.DBusFactory")
local var_0_1 = require("Overkiz.OOP.Class")
local var_0_2 = require("Overkiz.Bus.OrgFreedesktopDBus").ObjectManager
local var_0_3 = var_0_1()

function var_0_3.new(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._services = arg_1_2

	local var_1_0 = {
		GetManagedObjects = function()
			local var_2_0 = {}

			for iter_2_0, iter_2_1 in pairs(arg_1_0._services) do
				var_2_0[iter_2_1:getPath()] = iter_2_1:getProperties()

				local var_2_1 = iter_2_1:getCharacteristics()

				for iter_2_2, iter_2_3 in pairs(var_2_1) do
					var_2_0[iter_2_3:getPath()] = iter_2_3:getProperties()
				end
			end

			return var_2_0
		end
	}

	arg_1_0._server = var_0_0.createServer("com.overkiz.bluez", arg_1_1, {
		[var_0_2.interface] = var_0_2.definition
	}, {
		[var_0_2.interface] = var_1_0
	})
end

return var_0_3
