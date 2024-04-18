local var_0_0 = {}
local var_0_1 = {}

function var_0_0.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if arg_1_1 == nil or arg_1_2 == nil or arg_1_3 == nil then
		arg_1_3:warning("[Bus] Command originator: missing or invalid arguments")
	end

	return {
		id = arg_1_1,
		functionalDelegate = {}
	}
end

setmetatable(var_0_1, var_0_0)

return var_0_1
