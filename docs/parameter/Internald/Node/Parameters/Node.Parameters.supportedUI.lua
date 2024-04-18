local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")

return {
	refresh = {
		startup = true
	},
	read = function(arg_1_0, arg_1_1)
		local var_1_0 = var_0_0:getBoardName()
		local var_1_1 = ""
		local var_1_2 = var_0_0:listUI()

		for iter_1_0, iter_1_1 in ipairs(var_1_2) do
			local var_1_3 = var_1_0:gsub("%-", "%%-") .. "%-"

			if iter_1_1 == var_1_0 or iter_1_1:find(var_1_3) then
				var_1_1 = var_1_1 .. iter_1_1 .. ";"
			end
		end

		arg_1_0(var_1_1)
	end
}
