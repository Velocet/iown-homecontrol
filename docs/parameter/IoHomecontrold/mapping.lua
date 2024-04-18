local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Manager.mpFpRefreshManager")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local var_0_3 = {
	Command = {
		Monitor = {
			originator = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Bus.Command.Monitor.originator")
		}
	},
	Local = {
		originator = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Bus.Local.originator")
	},
	UI = {
		originator = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Bus.UI.originator")
	}
}
local var_0_4 = {
	monitor = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Command.monitor")
}
local var_0_5 = {
	Action = {
		actionDelegate = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Local.Action.actionDelegate"),
		executionManager = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Local.Action.executionManager")
	},
	Config = {
		configDelegate = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Local.Config.configDelegate")
	},
	Device = {
		deviceDelegate = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Local.Device.deviceDelegate")
	},
	State = {
		stateDelegate = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Local.State.stateDelegate")
	},
	KeepAlive = {
		delegate = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Local.KeepAlive.keepAliveDelegate")
	}
}
local var_0_6 = {
	eventCatcher = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.UI.eventCatcher"),
	manager = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.UI.manager"),
	originator = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.UI.originator")
}
local var_0_7, var_0_8 = pcall(require, "Overkiz.HomeAutomation.Protocol.OVP.Test.Report.originator")
local var_0_9 = {
	Report = {
		originator = var_0_8
	}
}

return {
	init = function(arg_1_0)
		var_0_3.Command.Monitor.originator.functionalDelegate = var_0_4.monitor
		var_0_4.monitor.transportOriginator = var_0_3.Command.Monitor.originator

		if var_0_5 ~= nil and var_0_5.Action then
			var_0_3.Local.originator.functionalDelegate = var_0_5.Action.executionManager
			var_0_5.Action.executionManager.transportOriginator = var_0_3.Local.originator
		end

		local var_1_0

		if var_0_7 then
			var_0_3.Test.Report.originator.functionalDelegate = var_0_9.Report.originator
			var_1_0 = var_0_3.Test.Report.originator

			var_0_2:notice("IoHomecontrol mapping: test report is activated")
		end

		var_0_0.transportOriginator = var_1_0
		var_0_1.transportOriginator = var_1_0
		var_0_6.manager.transportOriginator = var_0_3.UI.originator
		var_0_3.UI.originator.functionalDelegate = var_0_6.originator
	end,
	start = function(arg_2_0)
		if var_0_5 then
			if var_0_5.Action and var_0_5.Action.actionDelegate then
				var_0_5.Action.actionDelegate:start()
			end

			if var_0_5.Device and var_0_5.Device.deviceDelegate then
				var_0_5.Device.deviceDelegate:start()
			end

			if var_0_5.Config and var_0_5.Config.configDelegate then
				var_0_5.Config.configDelegate:start()
			end

			if var_0_5.State and var_0_5.State.stateDelegate then
				var_0_5.State.stateDelegate:start()
			end
		end

		var_0_6.manager:start()
		var_0_6.eventCatcher:start()
	end
}
