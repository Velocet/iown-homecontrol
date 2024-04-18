local var_0_0 = require("Overkiz.Bus.Message")
local var_0_1 = require("Overkiz.AbstractDBusService")
local var_0_2 = require("Overkiz.IDBusService")
local var_0_3 = require("Overkiz.OOP.Class")(var_0_1).__implements__(var_0_2)

function var_0_3.new(arg_1_0, arg_1_1)
	var_0_1.new(arg_1_0, "com.overkiz.Application.Internal.Region", "region_service")

	arg_1_0._stateManager = arg_1_1
	arg_1_0._countryCode = ""

	local function var_1_0(arg_2_0)
		if arg_2_0.rawStateId == "countryCode" and arg_1_0._countryCode ~= arg_2_0.rawStatevalue then
			arg_1_0._countryCode = arg_2_0.rawStatevalue

			local var_2_0 = var_0_0.Signal()
			local var_2_1 = var_2_0:begin()

			var_2_0:setMember("countryCodeUpdated")
			var_2_0:setInterface(arg_1_0._interface)
			var_2_1:push("string", arg_1_0._countryCode)
			arg_1_0:send(var_2_0)
		end
	end

	arg_1_1:addListener(var_1_0)
	arg_1_0:_registerMethod("getCountryCode", "", arg_1_0._handle_getCountryCode)
end

function var_0_3._handle_getCountryCode(arg_3_0, arg_3_1)
	local var_3_0 = var_0_0.Method.Return(arg_3_1)

	var_3_0:begin():push("string", arg_3_0._countryCode)
	arg_3_0:send(var_3_0)
end

return var_0_3
