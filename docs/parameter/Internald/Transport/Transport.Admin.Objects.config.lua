local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Admin.dispatcher")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Admin.system")
local var_0_2 = require("tableshape").types

function var_0_0.protocols(arg_1_0, arg_1_1)
	local function var_1_0(arg_2_0)
		arg_1_1(arg_2_0 == 0)
	end

	var_0_1.enableProtocolsAsync(arg_1_0.activated, arg_1_0.supported, arg_1_0.options or {}, var_1_0)

	return nil
end

function var_0_0.log(arg_3_0, arg_3_1)
	if arg_3_0.cmd then
		if arg_3_0.cmd == "get" then
			var_0_1.getLogConfigAsync(function(arg_4_0, arg_4_1)
				var_0_0:push("logconfig", {
					value = arg_4_1:tostring("base64")
				})
				arg_3_1(arg_4_0)
			end)

			return nil
		elseif arg_3_0.cmd == "put" and arg_3_0.value then
			var_0_0:push("logconfig", {
				value = var_0_1.setLogConfig(arg_3_0.value):tostring("base64")
			})
		else
			return false
		end
	end

	return true
end

function var_0_0.timezone(arg_5_0, arg_5_1)
	local var_5_0, var_5_1 = var_0_2.shape({
		name = var_0_2.string
	}, {
		open = true
	}):check_value(arg_5_0)

	if not var_5_0 then
		return false, var_5_1
	end

	var_0_1.setTimezone(arg_5_0.name):next(function()
		arg_5_1(true)
	end, function(arg_7_0)
		arg_5_1(false)
	end)

	return nil
end

function var_0_0.getcurrenttimezone(arg_8_0)
	var_0_0:push("localtime", {
		name = var_0_1.getCurrentTimezone()
	})

	return true
end

function var_0_0.updateLocalAppsCrl(arg_9_0, arg_9_1)
	var_0_1.checkUpdateLocalAppsCrl():next(function()
		return var_0_1.updateLocalAppsCrl()
	end):next(function()
		arg_9_1(true)
	end):catch(function(arg_12_0)
		arg_9_1(false, arg_12_0 and tostring(arg_12_0))
	end)

	return nil
end

return {}
