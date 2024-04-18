local var_0_0 = {}
local var_0_1 = {
	KEY_IS_MISSING = 2146500645
}

var_0_0.keyValueStoreEntries = {
	[var_0_1.KEY_IS_MISSING] = "noKeyTransferSetupRequired"
}

function var_0_0.getParameterIdFromKey(arg_1_0)
	for iter_1_0, iter_1_1 in pairs(var_0_0.keyValueStoreEntries) do
		if arg_1_0 == iter_1_1 then
			return iter_1_0
		end
	end
end

return var_0_0
