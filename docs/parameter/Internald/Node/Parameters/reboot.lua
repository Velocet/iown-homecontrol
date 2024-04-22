local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")

return {
	write = function(arg_1_0, arg_1_1, arg_1_2)
		local function var_1_0(arg_2_0, arg_2_1)
			os.execute("telit-usb restart ; telit-hub restart")

			if arg_2_0 then
				arg_1_2()
			else
				arg_1_1()
			end
		end

		os.execute("killall -9 ofonod")
		os.execute("/etc/init.d/ofono start")
		var_0_0:send("#REBOOT", var_1_0)
	end
}
