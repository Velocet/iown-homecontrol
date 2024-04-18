local var_0_0 = require("Overkiz.Kizbox.Proxy.modules")
local var_0_1 = require("Overkiz.Kernel.StartupUpdate")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.conf")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.daemon")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.State.manager")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.OVP.State.manager")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.manager")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.OVP.Node.manager")
local var_0_8 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.Manager")
local var_0_9 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Node.refreshManager")
local var_0_10 = require("Overkiz.HomeAutomation.Protocol.OVP.Node.refreshManager")
local var_0_11 = var_0_1(var_0_2.device, var_0_2.updateScript, {
	"v2D71p0703"
}, "tty")

function var_0_11.onStart(arg_1_0, arg_1_1, arg_1_2)
	var_0_11.daemon = var_0_3

	var_0_11.daemon:start(arg_1_1, {
		ioStateManager = var_0_4,
		ovpStateManager = var_0_5,
		ioNodeManager = var_0_6,
		ovpNodeManager = var_0_7
	})
	var_0_6:on(var_0_8.Events.Node, function(arg_2_0, arg_2_1, arg_2_2)
		var_0_3:getIoNodeManager():modified(arg_2_0, arg_2_1, arg_2_2)
	end)
	var_0_7:on(var_0_8.Events.Node, function(arg_3_0, arg_3_1, arg_3_2)
		var_0_3:getOvpNodeManager():modified(arg_3_0, arg_3_1, arg_3_2)
	end)
	var_0_9:initNodesRefresh()
	var_0_10:initNodesRefresh()
end

function var_0_11.onStop(arg_4_0)
	if var_0_11.daemon then
		var_0_11.daemon:stop()

		var_0_11.daemon = nil
	end
end

var_0_0:getModules()

return var_0_11
