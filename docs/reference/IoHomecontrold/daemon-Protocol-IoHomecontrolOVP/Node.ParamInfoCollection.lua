local var_0_0 = require("Overkiz.OOP.Class")()

function var_0_0.new(arg_1_0)
	arg_1_0._elements = {}
end

function var_0_0.append(arg_2_0, arg_2_1)
	table.insert(arg_2_0._elements, arg_2_1)
end

function var_0_0.lookupParameterByStateIdAndData(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_2 == nil then
		return arg_3_0:lookupParametersById(arg_3_1)
	end

	for iter_3_0, iter_3_1 in pairs(arg_3_0._elements) do
		if iter_3_1.id ~= nil and iter_3_1.id == arg_3_1 then
			local var_3_0

			if iter_3_1.refreshDef and iter_3_1.refreshDef.resync and iter_3_1.refreshDef.resync.matchStateFunction then
				var_3_0 = iter_3_1.refreshDef.resync.matchStateFunction(arg_3_1, arg_3_2)
			else
				var_3_0 = true
			end

			if var_3_0 == true then
				return iter_3_1
			end
		end
	end

	return nil
end

function var_0_0.lookupParameterById(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in pairs(arg_4_0._elements) do
		if iter_4_1.id ~= nil and iter_4_1.id == arg_4_1 then
			return iter_4_1
		end
	end

	return nil
end

function var_0_0.lookupParametersById(arg_5_0, arg_5_1)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in pairs(arg_5_0._elements) do
		if iter_5_1.id ~= nil and iter_5_1.id == arg_5_1 then
			table.insert(var_5_0, iter_5_1)
		end
	end

	return var_5_0
end

function var_0_0.lookupParameterByParameter(arg_6_0, arg_6_1)
	for iter_6_0, iter_6_1 in pairs(arg_6_0._elements) do
		if iter_6_1.parameter ~= nil and iter_6_1.parameter == arg_6_1 then
			return iter_6_1
		end
	end

	return nil
end

function var_0_0.lookupParametersByParameter(arg_7_0, arg_7_1)
	local var_7_0 = {}

	for iter_7_0, iter_7_1 in pairs(arg_7_0._elements) do
		if iter_7_1.parameter ~= nil and iter_7_1.parameter == arg_7_1 then
			table.insert(var_7_0, iter_7_1)
		end
	end

	return var_7_0
end

function var_0_0.getAll(arg_8_0)
	return arg_8_0._elements
end

return var_0_0
