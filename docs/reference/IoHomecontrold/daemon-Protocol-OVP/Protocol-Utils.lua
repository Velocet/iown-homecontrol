return {
	importRequire = function(arg_1_0, arg_1_1)
		local var_1_0 = {}

		for iter_1_0, iter_1_1 in pairs(arg_1_1) do
			iter_1_1 = tostring(iter_1_1)
			var_1_0[iter_1_1] = require(arg_1_0 .. "." .. iter_1_1)
		end

		return var_1_0
	end
}
