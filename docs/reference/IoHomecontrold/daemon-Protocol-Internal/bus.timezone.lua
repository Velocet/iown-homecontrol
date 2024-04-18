local var_0_0 = require("Overkiz.Bus.Object")
local var_0_1 = require("Overkiz.Bus.Connection")
local var_0_2 = require("Overkiz.Bus.Message")
local var_0_3 = var_0_0.Server("/com/overkiz/Application/Internal/TimeZone/Notifier")
local var_0_4 = var_0_1.get()

function var_0_3.timezoneHasChanged(arg_1_0)
	local var_1_0 = var_0_2.Signal()
	local var_1_1 = var_1_0:begin()

	var_1_0:setMember("localTimeZoneHasChangedNotification")
	var_1_0:setInterface("com.overkiz.Application.Internal.TimeZone.Notifier")
	var_0_3:send(var_1_0)
end

var_0_3:start()

return var_0_3
