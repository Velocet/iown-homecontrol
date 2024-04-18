local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.conf")
local var_0_1 = {}
local var_0_2

function var_0_1.get()
	if var_0_2 == nil then
		var_0_2 = false

		local var_1_0 = io.open(var_0_0.path.recoveredFile)

		if var_1_0 then
			var_0_2 = true

			var_1_0:close()
		end
	end

	return var_0_2
end

return var_0_1
