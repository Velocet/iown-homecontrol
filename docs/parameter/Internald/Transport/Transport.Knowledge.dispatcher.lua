local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_2 = require("Overkiz.Cloudlink.Dispatcher")
local var_0_3 = require("Overkiz.Cloudlink.si")
local var_0_4 = {}
local var_0_5

function var_0_4.init(arg_1_0)
	var_0_5 = arg_1_0
end

local function var_0_6(arg_2_0)
	local var_2_0 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
		table.insert(var_2_0, {
			category = iter_2_1.category,
			hash = iter_2_1.hash,
			name = iter_2_1.name
		})
	end

	return var_2_0
end

var_0_4.dispatcher = var_0_2("knowledge", {
	"com.overkiz.Application.Internal"
}, true)

function var_0_4.dispatcher.update(arg_3_0, arg_3_1)
	if not var_0_5 then
		return false, "Missing delegate"
	end

	local var_3_0, var_3_1 = var_0_0.checkPath(arg_3_0, {
		url = "string",
		name = "string",
		hash = "string",
		category = "string"
	})

	if not var_3_0 then
		var_0_1:debug("wrong update format")

		return false, var_3_1
	end

	local function var_3_2(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0

		if arg_4_2 then
			var_4_0 = {
				error = var_0_3.status.APPLICATION_ERROR,
				detailederror = arg_4_2
			}
		end

		if arg_4_1 then
			var_0_4.dispatcher:push("element", {
				category = arg_4_1.category,
				hash = arg_4_1.hash,
				name = arg_4_1.name
			})
		end

		arg_3_1(arg_4_0, var_4_0)
	end

	var_0_5:update(arg_3_0.category, arg_3_0.name, arg_3_0.url, arg_3_0.hash, var_3_2)

	return nil
end

function var_0_4.dispatcher.list(arg_5_0)
	if not var_0_5 then
		return false, "Missing delegate"
	end

	local var_5_0 = var_0_5:listElements()

	var_0_4.dispatcher:push("elements", var_0_6(var_5_0))

	return true
end

table.insert(var_0_4.dispatcher.onStartFunctions, var_0_4.dispatcher.list)

return var_0_4
