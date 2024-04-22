local var_0_0 = require("Overkiz.Persistence")
local var_0_1 = {}
local var_0_2, var_0_3 = var_0_0.Layer("region", var_0_0.Type.UPDATE)
local var_0_4 = var_0_2:get("countryCode")

var_0_1.refresh = {
	startup = true
}

function var_0_1.read(arg_1_0, arg_1_1)
	if not var_0_2:keyExists("countryCode") then
		arg_1_1("Country code is not set")
	else
		arg_1_0(var_0_2:get("countryCode"))
	end
end

function var_0_1.write(arg_2_0, arg_2_1, arg_2_2)
	if string.match(arg_2_0, "%u%u") == arg_2_0 then
		var_0_2:put("countryCode", arg_2_0)
		arg_2_1(var_0_2:get("countryCode"))
	else
		arg_2_2("Wrong format for " .. arg_2_0 .. ", expecting ISO 3166-1 alpha-2")
	end
end

return var_0_1
