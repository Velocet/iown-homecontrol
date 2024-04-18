local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter9")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter10")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter11")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter12")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter13")
local var_0_6 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter14")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_8 = {}

var_0_8.name = "IndoorSiren"

function var_0_8.create(arg_1_0)
	var_0_8.specificRefresh = {
		supportMpFp = true,
		onRefreshNode = true,
		startup = true,
		oncommand = true
	}
	var_0_8.refreshes = {
		{
			name = "SoundPattern1",
			refresh = var_0_1
		},
		{
			name = "SonorousSequence1",
			refresh = var_0_2
		},
		{
			name = "SoundPattern2",
			refresh = var_0_3
		},
		{
			name = "SonorousSequence2",
			refresh = var_0_4
		},
		{
			name = "SoundPattern3",
			refresh = var_0_5
		},
		{
			name = "SonorousSequence3",
			refresh = var_0_6
		}
	}

	var_0_7:create(var_0_0, arg_1_0)

	for iter_1_0, iter_1_1 in pairs(var_0_8.refreshes) do
		local var_1_0 = iter_1_1.refresh

		var_1_0.resync = var_0_8.specificRefresh

		var_0_7:create(var_1_0, arg_1_0)
	end
end

return var_0_8
