local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.Transport.Admin.dispatcher")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.bus.resync")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Admin.system")
local var_0_3 = require("Overkiz.Time")
local var_0_4 = {}

local function var_0_5()
	var_0_0:push("uptime", {
		seconds = var_0_2.getUptime()
	})
end

local var_0_6

local function var_0_7(arg_2_0)
	local var_2_0 = {
		["time-stamp"] = var_0_2.getSystime(),
		ntpreliable = var_0_3.isUptodate()
	}

	if var_0_2.isRtcSupported() then
		var_2_0.rtcreliable = var_0_2.getRtcReliability()
	end

	if var_0_6 ~= var_2_0.ntpreliable or not arg_2_0 then
		var_0_0:push("systime", var_2_0)

		var_0_6 = var_2_0.ntpreliable
	end
end

var_0_2.subscribeSystimeUpdates(function()
	var_0_7()
end)
var_0_2.subscribeNtpUpdates(function()
	var_0_7(true)
end)

local function var_0_8()
	var_0_0:push("coredump", {
		enabled = var_0_2.getCoredumpStatus()
	})
end

local function var_0_9()
	var_0_0:push("ssh", {
		enabled = var_0_2.getSshStatus()
	})
end

local function var_0_10(arg_7_0)
	(arg_7_0 and var_0_0.pushUrg or var_0_0.push)(var_0_0, "image", {
		hash = var_0_2.getPackagesHash(),
		imageid = var_0_2.getImageId(),
		pkgstatus = var_0_2.getPackagesStatus(),
		revision = var_0_2.getRevision(),
		version = var_0_2.getVersion()
	})
end

function var_0_0.getimageinfo(arg_8_0)
	var_0_10()

	return true
end

function var_0_0.getrecoveryinfo(arg_9_0)
	var_0_0:push("recovery", {
		recovered = false,
		imageid = var_0_2.getRecoverId()
	})

	return true
end

function var_0_0.getuptime(arg_10_0)
	var_0_5()

	return true
end

function var_0_0.getsystime(arg_11_0)
	var_0_7()

	return true
end

function var_0_0.coredump(arg_12_0)
	var_0_2.setCoredumpStatus(arg_12_0.enabled == true)
	var_0_8()

	return true
end

function var_0_0.ssh(arg_13_0)
	var_0_2.setSshStatus(arg_13_0.enabled == true)
	var_0_9()

	return true
end

local var_0_11 = {
	notified = function(arg_14_0, arg_14_1)
		if #arg_14_1 >= 1 then
			var_0_0:pushUrg("resync", {
				modules = arg_14_1
			}, function()
				var_0_1:cleanup()
			end)
		end
	end
}

var_0_1.notifier:addListener(var_0_11)

local function var_0_12()
	var_0_11:notified(var_0_1:getModules())

	if var_0_2.isRecovered() then
		var_0_0:pushUrg("recovery", {
			recovered = true,
			imageid = var_0_2.getRecoverId()
		}, var_0_2.hasRecovered)
	end

	if var_0_2.isBoot() then
		var_0_0:pushUrg("boot", {
			bootmode = var_0_2.bootMode(),
			rebootmode = var_0_2.rebootMode(),
			reset = var_0_2.rebootReason()
		}, var_0_2.hasBoot)
	end

	var_0_5()
	var_0_7()
	var_0_8()
	var_0_9()
	var_0_0:unlock()
end

table.insert(var_0_0.onStartFunctions, var_0_12)

return var_0_4
