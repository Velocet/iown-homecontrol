local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.Admin.common")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.Admin.FileUpdater")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Admin.RandomCron")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Common.systemex")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_6 = require("Overkiz.Type.ByteArray")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.Internal.bus.timezone")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.Internal.modules")
local var_0_9 = require("Overkiz.HomeAutomation.Protocol.Internal.conf")
local var_0_10 = require("Overkiz.asyncFs")
local var_0_11 = require("Overkiz.Subject")
local var_0_12 = require("Overkiz.Timer")
local var_0_13 = require("Overkiz.Time")
local var_0_14 = require("Overkiz.Network.ConnectivityCheck")
local var_0_15 = require("Overkiz.FileWatcher")
local var_0_16 = require("Overkiz.asyncProcess")
local var_0_17 = require("Overkiz.Promise")
local var_0_18 = require("pl.path")
local var_0_19 = require("pl.file")
local var_0_20 = require("pl.url")
local var_0_21 = require("openssl")
local var_0_22 = {}
local var_0_23 = false

function var_0_22.enableProtocolsAsync(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if var_0_23 then
		var_0_5:error("Already running enable protocol")
		arg_1_3(1)

		return
	end

	var_0_23 = true

	var_0_16.execute("sh", var_0_9.path.scriptDir .. "/enable-protocols.sh", arg_1_1, arg_1_0):next(function(arg_2_0)
		arg_1_3(arg_2_0)

		var_0_23 = false
	end)

	local var_1_0 = var_0_0.stringSimpleSplit(arg_1_0, ",")

	var_0_8.setModules(var_1_0, arg_1_2)
end

var_0_22.logWatcher = var_0_15.Inotify(var_0_9.path.logFile)

function var_0_22.getLogConfigAsync(arg_3_0)
	function var_0_22.logWatcher.modified(arg_4_0, arg_4_1)
		arg_3_0(true, var_0_6(var_0_1.readInfoFile(var_0_9.path.logFile, true), "utf-8"))

		var_0_22.logWatcher.modified = nil
	end

	var_0_4.executeWithResult("killall -SIGUSR1 http-logd")
end

function var_0_22.getLogConfig()
	var_0_4.executeWithResult("killall -SIGUSR1 http-logd")

	return var_0_6(var_0_1.readInfoFile(var_0_9.path.logFile, true), "utf-8")
end

function var_0_22.setLogConfig(arg_6_0)
	var_0_1.writeInfoFile(var_0_9.path.logFile, var_0_6(arg_6_0, "base64"):tostring("utf-8"))
	var_0_4.executeWithResult("killall -SIGUSR2 http-logd")

	return var_0_22.getLogConfig()
end

function var_0_22.setTimezone(arg_7_0)
	local var_7_0 = var_0_17()

	var_7_0:next(function(arg_8_0)
		if arg_8_0 then
			var_0_5:debug("[system.setTimezone]: " .. arg_8_0)
		end
	end, function(arg_9_0)
		var_0_5:error("[system.setTimezone]: " .. arg_9_0)
	end)

	local var_7_1 = os.getenv("UPDATE_URL")

	if var_7_1 == nil then
		var_7_0:reject("env. var UPDATE_URL is not defined. Cannot download timezone.")

		return var_7_0
	end

	var_0_2(var_0_18.join(var_0_9.persistentSysConfDir, "tzdata")):update(var_7_1 .. "/timezone/" .. var_0_20.quote(arg_7_0, true), var_7_1 .. "/timezone/" .. var_0_20.quote(arg_7_0, true) .. "/md5"):next(function(arg_10_0)
		if arg_10_0 == var_0_2.SuccessCode.NO_NEW_VERSION then
			var_7_0:resolve("system.setTimezone-zone is already set to " .. arg_7_0)
		else
			var_0_19.write(var_0_18.join(var_0_9.persistentSysConfDir, "timezone"), arg_7_0)
			var_0_5:notice("[System]: timezone successfully changed to " .. arg_7_0)
			var_0_7.timezoneHasChanged()
			var_7_0:resolve()
		end
	end):catch(function(arg_11_0)
		if arg_11_0 and arg_11_0.code then
			if arg_11_0.code == var_0_2.ErrorCode.MD5 then
				if arg_11_0.httpCode == 404 then
					var_7_0:reject("'" .. arg_7_0 .. "' does not seem to be a valid timezone.")
				else
					var_7_0:reject("unable to GET file md5 for '" .. arg_7_0 .. "': " .. tostring(arg_11_0.reason) .. "(" .. tostring(arg_11_0.httpCode) .. ")")
				end
			elseif arg_11_0.code == var_0_2.ErrorCode.DOWNLOAD then
				var_7_0:reject("http error: " .. tostring(arg_11_0.reason) .. "(" .. tostring(arg_11_0.httpCode) .. ")")
			else
				var_7_0:reject(arg_11_0.reason)
			end
		end
	end)

	return var_7_0
end

function var_0_22.checkUpdateLocalAppsCrl()
	return var_0_10.exists(var_0_9.appCA):next(function(arg_13_0)
		if not arg_13_0 then
			return var_0_17.reject("Local apps CRL update not activated, missing " .. var_0_9.appCA)
		end
	end)
end

function var_0_22.updateLocalAppsCrl()
	local var_14_0 = var_0_17()

	var_14_0:next(function(arg_15_0)
		if arg_15_0 then
			var_0_5:debug("[system.updateLocalAppsCrl]: " .. arg_15_0)
		end
	end, function(arg_16_0)
		var_0_5:error("[system.updateLocalAppsCrl]: " .. arg_16_0)
	end)

	local var_14_1 = os.getenv("UPDATE_URL")

	if var_14_1 == nil then
		var_14_0:reject("env. var UPDATE_URL is not defined. Cannot download CRL.")

		return var_14_0
	end

	var_0_2(var_0_9.crlFile):setSanityCheck(function(arg_17_0)
		local var_17_0 = var_0_21.x509.crl.read(var_0_21.bio.file(arg_17_0))
		local var_17_1 = var_0_21.x509.read(var_0_21.bio.file(var_0_9.appCA))

		if var_17_0:verify(var_17_1) then
			return var_0_17.resolve()
		else
			return var_0_17.reject("cannot validate CRL file")
		end
	end):update(var_14_1 .. var_0_9.crlUploadUrl, var_14_1 .. var_0_9.crlMd5UploadUrl):next(function(arg_18_0)
		if arg_18_0 == var_0_2.SuccessCode.NO_NEW_VERSION then
			var_14_0:resolve("no newer version")
		else
			var_0_5:notice("[System]: CRL successfully updated")
			var_0_8.restartIfRequested("webserver")
			var_14_0:resolve()
		end
	end):catch(function(arg_19_0)
		if arg_19_0 and arg_19_0.code then
			if arg_19_0.code == var_0_2.ErrorCode.MD5 then
				var_14_0:reject("unable to GET file md5 for CRL: " .. tostring(arg_19_0.reason) .. "(" .. tostring(arg_19_0.httpCode) .. ")")
			elseif arg_19_0.code == var_0_2.ErrorCode.DOWNLOAD then
				var_14_0:reject("http error: " .. tostring(arg_19_0.reason) .. "(" .. tostring(arg_19_0.httpCode) .. ")")
			else
				var_14_0:reject("Cannot update CRL: " .. tostring(arg_19_0.reason))
			end
		end
	end)

	return var_14_0
end

function var_0_22.getCurrentTimezone()
	return var_0_19.read(var_0_18.join(var_0_9.persistentSysConfDir, "timezone"))
end

function var_0_22.getUptime()
	return tonumber(var_0_1.readInfoFile("/proc/uptime"):match("(%d+)")) or "Unknown"
end

function var_0_22.getSystime()
	return os.time()
end

function var_0_22.isRtcSupported()
	return var_0_18.exists(var_0_9.path.rtcDev) ~= false
end

function var_0_22.getRtcReliability()
	return var_0_13.Real.reliable()
end

local var_0_24 = var_0_11()

var_0_22.itimer = var_0_12.Real()

function var_0_22.itimer.reschedule(arg_25_0)
	var_0_5:notice("Reschedule")

	local var_25_0 = os.time() + 1

	repeat
		-- block empty
	until var_25_0 < os.time()

	var_0_24:notify()
	var_0_22.itimer:start()
end

var_0_22.itimer:setTime(var_0_13.Real(var_0_13.Elapsed(2147483647, 0)))
var_0_22.itimer:start()

local var_0_25 = var_0_11()

var_0_22.ntpWatcher = var_0_15.Inotify(var_0_9.ntpFile)

function var_0_22.ntpWatcher.modified(arg_26_0)
	var_0_25:notify()
end

function var_0_22.subscribeSystimeUpdates(arg_27_0)
	var_0_24:addListener(arg_27_0)
end

function var_0_22.subscribeNtpUpdates(arg_28_0)
	var_0_25:addListener(arg_28_0)
end

function var_0_22.getCoredumpStatus()
	local var_29_0, var_29_1 = var_0_4.executeWithResult(var_0_9.path.scriptDir .. "/coredump.sh status")

	return var_29_0 and var_29_1 == "true"
end

function var_0_22.setCoredumpStatus(arg_30_0)
	if arg_30_0 then
		var_0_4.executeWithResult(var_0_9.path.scriptDir .. "/coredump.sh start")
	else
		var_0_4.executeWithResult(var_0_9.path.scriptDir .. "/coredump.sh stop")
	end
end

function var_0_22.getSshStatus()
	local var_31_0, var_31_1 = var_0_4.executeWithResult(var_0_9.path.scriptDir .. "/ssh.sh status")

	return var_31_0 and var_31_1 == "true"
end

function var_0_22.setSshStatus(arg_32_0)
	if arg_32_0 then
		var_0_4.executeWithResult(var_0_9.path.scriptDir .. "/ssh.sh enable")
	else
		var_0_4.executeWithResult(var_0_9.path.scriptDir .. "/ssh.sh disable")
	end
end

function var_0_22.getPackagesHash()
	local var_33_0, var_33_1 = var_0_4.executeWithResult(var_0_9.path.scriptDir .. "/pkg.sh md5 2>&1")

	return var_33_1
end

function var_0_22.getPackagesStatus()
	local var_34_0, var_34_1 = var_0_4.executeWithResult(var_0_9.path.scriptDir .. "/pkg.sh nbrunpacked 2>&1")

	return tonumber(var_34_1) or -1
end

function var_0_22.getImageId()
	return var_0_9.path.imageId
end

function var_0_22.getRecoverId()
	if var_0_9.path.recoveryFile and var_0_9.path.recoveryFile ~= "" then
		return var_0_1.readInfoFile(var_0_9.path.recoveryFile)
	end

	return ""
end

function var_0_22.getRevision()
	return var_0_9.path.revision
end

function var_0_22.getVersion()
	return var_0_9.path.version
end

function var_0_22.isRecovered()
	return var_0_18.exists(var_0_9.path.recoveredFile) ~= false
end

function var_0_22.hasRecovered()
	os.remove(var_0_9.path.recoveredFile)
end

function var_0_22.isBoot()
	return var_0_18.exists(var_0_9.path.bootFile) ~= false
end

function var_0_22.hasBoot()
	os.remove(var_0_9.path.bootFile)
end

function var_0_22.bootMode()
	local var_43_0 = var_0_1.readInfoFile(var_0_9.path.bootnextFile)

	return tonumber(var_43_0) or var_43_0
end

function var_0_22.rebootMode()
	local var_44_0 = var_0_1.readInfoFile(var_0_9.path.bootmodeFile)

	return tonumber(var_44_0) or var_44_0
end

function var_0_22.rebootReason()
	return var_0_1.readInfoFile(var_0_9.path.reasonFile)
end

var_0_22.async = var_0_12.Monotonic()

var_0_22.async:setTime(var_0_13.Monotonic(var_0_13.Elapsed(2, 0)), true)

function var_0_22.reboot()
	function var_0_22.async.expired(arg_47_0)
		var_0_4.executeWithResult(var_0_9.path.scriptDir .. "/reboot.sh")
		var_0_5:debug("reboot")
	end

	var_0_22.async:start()
end

function var_0_22.run(arg_48_0, arg_48_1, arg_48_2)
	var_0_16.execute("sh", "-c", "timeout 120 " .. arg_48_0, {
		logLevel = "error"
	}):next(function(arg_49_0)
		var_0_5:debug("The cmd \"", arg_48_0, "\" exited with code: ", arg_49_0)
	end)
end

function var_0_22.connectivityCheck(arg_50_0, arg_50_1, arg_50_2)
	local function var_50_0(arg_51_0)
		arg_50_2(arg_51_0)
	end

	var_0_22.ccheck = var_0_14()

	local var_50_1
	local var_50_2 = var_0_22.ccheck:listInterfaces()

	for iter_50_0, iter_50_1 in pairs(var_50_2) do
		if iter_50_1 ~= "lo" and var_0_22.ccheck:getInet(iter_50_1) ~= "" then
			var_50_1 = iter_50_1

			var_0_5:debug("[connectivityCheck] " .. var_50_1 .. " will be used for check connectivity")

			break
		end
	end

	if var_50_1 then
		var_0_22.ccheck:check(arg_50_0, arg_50_1, var_50_1, var_50_0)
	else
		var_0_5:error("[connectivityCheck] no valid interface")
		arg_50_2(false)
	end
end

function var_0_22.upgradeBootloader()
	return var_0_4.executeWithResult(var_0_9.path.scriptDir .. "/bootloader-upgrade.sh start")
end

var_0_22.checkUpdateLocalAppsCrl():next(function()
	var_0_3(var_0_22.updateLocalAppsCrl, "Automatic local apps CRL update"):start()
end):catch(function(arg_54_0)
	var_0_5:warning(arg_54_0 and tostring(arg_54_0) or "Error starting automatic local apps CRL update")
end)

return var_0_22
