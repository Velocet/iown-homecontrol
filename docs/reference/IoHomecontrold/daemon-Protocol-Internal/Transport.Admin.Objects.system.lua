local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Admin.dispatcher")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Common.systemex")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Admin.system")

function var_0_0.reboot(arg_1_0)
	var_0_2.reboot()

	return true
end

function var_0_0.upgrade(arg_2_0)
	return var_0_2.upgradeBootloader()
end

function var_0_0.download(arg_3_0)
	local var_3_0 = var_0_1.executeWithResult("curl -o /dev/null -s -w \"%{http_code} %{time_total} %{size_download} %{speed_download} %{time_connect} %{time_namelookup}\" " .. arg_3_0.url)

	var_0_0:push("downloadresult", {
		speed = 0,
		time = 5,
		result = "string",
		size = 5,
		value = var_3_0
	})

	return true
end

function var_0_0.tcpcheck(arg_4_0, arg_4_1)
	if not arg_4_0.address or not arg_4_0.port then
		return false
	end

	local function var_4_0(arg_5_0)
		arg_4_1(arg_5_0)
	end

	var_0_2.connectivityCheck(arg_4_0.address, arg_4_0.port, var_4_0)

	return nil
end

function var_0_0.run(arg_6_0)
	var_0_2.run(arg_6_0.path, arg_6_0.argv, arg_6_0.mode)

	return true
end

return {}
