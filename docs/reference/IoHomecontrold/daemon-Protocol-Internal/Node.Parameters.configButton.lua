local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_1 = {
	refresh = {}
}

local function var_0_2(arg_1_0)
	for iter_1_0, iter_1_1 in pairs(var_0_1.watchers) do
		iter_1_1(arg_1_0, true)
	end
end

local var_0_3 = {
	modified = function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_1:match("configButton:(%a+)")

		if var_2_0 then
			var_0_2(var_2_0)
		end
	end
}

var_0_0:addFunctionsListener(var_0_3)

var_0_1.watchers = {}

function var_0_1.listen(arg_3_0)
	var_0_1.watchers[arg_3_0] = arg_3_0
end

return var_0_1
