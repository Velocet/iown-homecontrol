local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_2 = {}

_G.log = var_0_0

require("Overkiz.HomeAutomation.Protocol.Internal.bus.downloadService")
require("Overkiz.HomeAutomation.Protocol.Internal.bus.image")
require("Overkiz.HomeAutomation.Protocol.Internal.bus.knowledge")
require("Overkiz.HomeAutomation.Protocol.Internal.bus.mode")
require("Overkiz.HomeAutomation.Protocol.Internal.bus.modules")
require("Overkiz.HomeAutomation.Protocol.Internal.bus.resync")
require("Overkiz.HomeAutomation.Protocol.Internal.bus.timezone")
require("Overkiz.HomeAutomation.Protocol.Internal.bus.ui")

local var_0_3 = require("Overkiz.Bus.Connection")

require("Overkiz.HomeAutomation.Protocol.Internal.update"):start()
var_0_3.get():bind("com.overkiz.Application.Internal.Update")
require("Overkiz.HomeAutomation.Protocol.Internal.modules")

local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Command.CommandManager")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.State.StateManager")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.NodeManager")()
local var_0_7 = var_0_5(var_0_6)
local var_0_8 = var_0_4(var_0_6)

require("Overkiz.HomeAutomation.Protocol.Internal.Connection.WifiManager"):init(var_0_6, var_0_7)
require("Overkiz.HomeAutomation.Protocol.Internal.Connection.BluetoothManager"):init()

local var_0_9 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Natif.Objects.command")
local var_0_10 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Natif.Objects.node")
local var_0_11 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Natif.Objects.state")
local var_0_12 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Natif.actionGroups")

var_0_10.init(var_0_6)
var_0_11.init(var_0_7, var_0_6)
var_0_9.init(var_0_8, var_0_12)
var_0_12.init(var_0_8, var_0_9)
require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Admin.Objects.config")
require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Admin.Objects.info")
require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Admin.Objects.system")
require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Usb.dispatcher")

local var_0_13 = require("Overkiz.HomeAutomation.Protocol.Internal.Knowledge.KnowledgeManager")
local var_0_14 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Knowledge.dispatcher")
local var_0_15 = require("Overkiz.HomeAutomation.Protocol.Internal.bus.knowledge")
local var_0_16 = var_0_13()

var_0_14.init(var_0_16)
var_0_15.init(var_0_16)

local var_0_17 = require("Overkiz.DBusServer")
local var_0_18 = require("Overkiz.HomeAutomation.Protocol.Internal.bus.services.RegionService")

var_0_2.dbusServer = var_0_17("/com/overkiz/Application/Internal")

var_0_2.dbusServer:registerService(var_0_18(var_0_7))
var_0_2.dbusServer:startup()
var_0_0:trace("[LOCAL] Import and init local mode support")

local var_0_19 = require("Overkiz.Protocols")
local var_0_20 = require("Overkiz.HomeAutomation.Local.Model.Remote.State.StateManager")
local var_0_21 = require("Overkiz.HomeAutomation.Local.Model.Remote.Device.DeviceDelegate")
local var_0_22 = require("Overkiz.HomeAutomation.Local.Model.Remote.State.StateDelegate")
local var_0_23 = require("Overkiz.HomeAutomation.Local.Model.Remote.Action.ExecutionManager")
local var_0_24 = require("Overkiz.HomeAutomation.Local.Model.Remote.Action.ActionDelegate")
local var_0_25 = require("Overkiz.HomeAutomation.Protocol.Internal.Local.Driver.Driver")
local var_0_26 = require("Overkiz.HomeAutomation.Protocol.Internal.Local.Device.DeviceManager")
local var_0_27 = require("Overkiz.HomeAutomation.Protocol.Internal.Local.Config.ConfigDelegate")

var_0_6:reload()

local var_0_28 = var_0_25(var_0_19.INTERNAL.id, "internal", var_0_0)
local var_0_29 = var_0_26(var_0_28, var_0_6, var_0_0)
local var_0_30 = var_0_20(var_0_28, var_0_29, var_0_7, nil, var_0_0)

var_0_29.deviceDelegate = var_0_21("internal", var_0_29, var_0_0)
var_0_30.stateDelegate = var_0_22("internal", var_0_30, var_0_0)

var_0_27("internal", var_0_29, var_0_6, var_0_0)

local var_0_31 = var_0_23(var_0_28, var_0_29, var_0_8, var_0_30, var_0_0)

var_0_31.actionDelegate = var_0_24("internal", var_0_31, var_0_0)
var_0_31.transportOriginator = var_0_31

var_0_28:start()
var_0_29:start()
var_0_29:loadDevices()

local var_0_32 = require("Overkiz.Timer")
local var_0_33 = require("Overkiz.Time")

var_0_2.event = var_0_32.Monotonic()

if not var_0_6:getDef("pod/0") then
	local var_0_34 = {}
	local var_0_35 = var_0_1:getBoardName()

	if var_0_35:match("kizbox2") then
		var_0_34.type = "podV2"
	elseif var_0_35:match("kizboxmini") then
		var_0_34.type = "podMini"
	elseif var_0_35 == "kizbox" then
		var_0_34.type = "podV1"
	elseif var_0_35:match("kizbox3") then
		var_0_34.type = "podV3"
	else
		var_0_0:error("Unknown board: " .. var_0_35)

		var_0_34.type = "podUnknown"
	end

	var_0_34.id = "pod/0"
	var_0_34.status = "done"

	var_0_6:saveAndReload(var_0_34)
end

function var_0_2.event.expired()
	if var_0_1:getBoardName():match("kizbox2") then
		local var_1_0 = require("Overkiz.HomeAutomation.Protocol.Internal.modemHandler")

		if var_1_0.proxy.refreshKey then
			var_1_0.proxy:refreshKey()
		end

		var_1_0.Watcher:add(var_0_6)
	end

	var_0_6:reload()
end

var_0_2.event:setTime(var_0_33.Monotonic(var_0_33.Elapsed(1, 0)), true)
var_0_2.event:start()

return var_0_2
