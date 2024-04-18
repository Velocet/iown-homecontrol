local var_0_0 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Manager.mpFpRefreshManager")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.factory")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.log")
local var_0_3 = {
	Command = {
		Monitor = {
			originator = require("Overkiz.HomeAutomation.Protocol.OVP.Bus.Command.Monitor.originator")
		}
	},
	Local = {
		originator = require("Overkiz.HomeAutomation.Protocol.OVP.Bus.Local.originator")
	},
	UI = {
		originator = require("Overkiz.HomeAutomation.Protocol.OVP.Bus.UI.originator")
	}
}
local var_0_4 = {
	monitor = require("Overkiz.HomeAutomation.Protocol.OVP.Command.monitor")
}
local var_0_5 = {
	Action = {
		actionDelegate = require("Overkiz.HomeAutomation.Protocol.OVP.Local.Action.actionDelegate"),
		executionManager = require("Overkiz.HomeAutomation.Protocol.OVP.Local.Action.executionManager")
	},
	Config = {
		configDelegate = require("Overkiz.HomeAutomation.Protocol.OVP.Local.Config.configDelegate")
	},
	Device = {
		deviceDelegate = require("Overkiz.HomeAutomation.Protocol.OVP.Local.Device.deviceDelegate")
	},
	State = {
		stateDelegate = require("Overkiz.HomeAutomation.Protocol.OVP.Local.State.stateDelegate")
	}
}
local var_0_6 = {
	eventCatcher = require("Overkiz.HomeAutomation.Protocol.OVP.UI.eventCatcher"),
	manager = require("Overkiz.HomeAutomation.Protocol.OVP.UI.manager"),
	originator = require("Overkiz.HomeAutomation.Protocol.OVP.UI.originator")
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

			var_0_2:notice("Ovp mapping: test report is activated")
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
