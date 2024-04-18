local var_0_0 = require("Overkiz.Bus.Object")
local var_0_1 = require("Overkiz.Bus.Message")
local var_0_2 = var_0_0.Server("/com/overkiz/Application/Internal/Knowledge")

function var_0_2.init(arg_1_0)
	arg_1_0.onUpdated:addListener({
		notified = function(arg_2_0, arg_2_1)
			local var_2_0 = var_0_1.Signal()
			local var_2_1 = var_2_0:begin()

			var_2_0:setMember("updated")
			var_2_0:setInterface("com.overkiz.Application.Internal.Knowledge")
			var_2_1:push("string", tostring(arg_2_1))
			var_0_2:send(var_2_0)
		end
	})
end

var_0_2:start()

return var_0_2
