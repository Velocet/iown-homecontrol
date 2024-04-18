local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.Internal.bus.modules")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.Internal.bus.Modules")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Boards.handler")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.conf")
local var_0_6 = require("Overkiz.Bus.Manager")
local var_0_7 = require("Overkiz.asyncProcess")
local var_0_8 = require("Overkiz.Time")
local var_0_9 = require("Overkiz.Timer")
local var_0_10 = require("Overkiz.Event")
local var_0_11 = require("Overkiz.Persistence")
local var_0_12 = 0
local var_0_13 = 10000
local var_0_14 = 1000
local var_0_15 = 10000
local var_0_16 = {}

var_0_16.autorestart = true

local var_0_17 = {}
local var_0_18 = {
	rts = "RTS.RTS",
	ovp = "OVP",
	modbus = "Modbus",
	lpb = "LPB",
	upnpcontrol = "UPNP",
	sauteripc = "SauterIpc",
	io = "IoHomecontrol",
	camera = "Camera",
	hue = "Hue",
	ramses = "Ramses",
	rtds = "RTDS",
	rtw = "RTS.RTW",
	rtd = "RTD"
}

local function var_0_19(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = "/etc/init.d/" .. arg_1_0

	return {
		{
			var_1_0,
			"start"
		},
		"com.overkiz.Application." .. arg_1_1,
		{
			var_1_0,
			"stop"
		},
		{
			var_1_0,
			"restart"
		},
		name = arg_1_0,
		delayOnRestart = var_0_12,
		lastStartTimestamp = var_0_8.Monotonic.now(),
		checkWithDBus = not arg_1_2
	}
end

local var_0_20 = var_0_19("lua", "Lua")
local var_0_21 = var_0_19("network", "Network")
local var_0_22 = var_0_19("io-homecontrol", "IoHomecontrol")
local var_0_23 = var_0_19("rtx", "RTx")
local var_0_24 = var_0_19("rts", "RTS")
local var_0_25 = var_0_19("ows", "OWS.Plugin.Manager")
local var_0_26 = var_0_19("trigger", "Trigger")
local var_0_27 = var_0_19("local", "Local")
local var_0_28 = var_0_19("webserver", "webserver", true)
local var_0_29 = {
	io = {
		var_0_22
	},
	ovp = {
		var_0_22
	},
	lpb = {
		var_0_19("lpb", "LPB"),
		var_0_22,
		var_0_20
	},
	modbus = {
		var_0_19("modbus", "Modbus"),
		var_0_22,
		var_0_20
	},
	rtd = {
		var_0_19("rtd", "RTD"),
		var_0_20
	},
	rtds = {
		var_0_19("rtds", "RTDS"),
		var_0_20
	},
	rts = {
		var_0_24
	},
	rtw = {
		var_0_24
	},
	ramses = {
		var_0_19("ramses", "Ramses"),
		var_0_20
	},
	camera = {
		var_0_21
	},
	hue = {
		var_0_21
	},
	sauteripc = {
		var_0_21
	},
	enocean = {
		var_0_19("enocean", "Enocean")
	},
	zwave = {
		var_0_19("zwave", "Zwave")
	},
	knx = {
		var_0_19("knx-ip", "KNX")
	},
	yokis = {
		var_0_19("yokis", "Yokis")
	},
	aurora = {
		var_0_19("aurora", "Aurora")
	},
	["local"] = {
		var_0_28,
		var_0_27
	},
	idealrf = {
		var_0_19("idealrf", "IdealRF")
	},
	rtn = {
		var_0_19("rtn", "RTN")
	},
	upnpcontrol = {
		var_0_21
	},
	zigbee = {
		var_0_19("zigbee", "Zigbee")
	},
	xcomfort = {
		var_0_19("xcomfort", "XComfort")
	},
	profalux868 = {
		var_0_19("profalux868", "Profalux868")
	},
	ogp = {
		var_0_19("ogp", "OGP")
	},
	mylink = {
		var_0_27,
		var_0_19("mylink", "Mylink")
	},
	webserver = {
		var_0_28
	},
	homekit = {
		var_0_27,
		var_0_19("homekit", "HomeKit")
	}
}
local var_0_30 = {}
local var_0_31 = var_0_10()
local var_0_32 = false
local var_0_33 = false

function var_0_16.StrandExpiration()
	return
end

function var_0_31.receive(arg_3_0)
	if var_0_32 or not next(var_0_30) then
		return
	end

	local var_3_0 = table.remove(var_0_30, 1)

	var_0_32 = true

	var_0_7.execute(unpack(var_3_0)):next(function(arg_4_0)
		var_0_32 = false

		if #var_0_30 > 0 then
			var_0_31:send()
		elseif var_0_33 then
			var_0_16.StrandExpiration()
		end
	end)
end

local function var_0_34(arg_5_0)
	if var_0_33 then
		return
	end

	table.insert(var_0_30, arg_5_0)

	if not var_0_32 then
		var_0_31:send()
	end
end

local function var_0_35(arg_6_0, arg_6_1)
	local var_6_0 = var_0_8.Monotonic.now()

	if var_6_0.totalMilliseconds - arg_6_1.lastStartTimestamp.totalMilliseconds > var_0_15 then
		arg_6_1.delayOnRestart = var_0_12
	else
		arg_6_1.delayOnRestart = arg_6_1.delayOnRestart + var_0_14

		if arg_6_1.delayOnRestart > var_0_13 then
			arg_6_1.delayOnRestart = var_0_13
		end
	end

	arg_6_1.lastStartTimestamp = var_6_0

	var_0_4:warning("Modules loader: service " .. tostring(arg_6_0) .. " crashed. Re-Starting in " .. tostring(arg_6_1.delayOnRestart) .. "ms ...")
	var_0_9.Timeout.create(arg_6_1.delayOnRestart, function()
		var_0_34(arg_6_1.onStart)
	end)
end

local function var_0_36()
	var_0_33 = true
end

local var_0_37 = var_0_3:getBoardName()

if var_0_37:match("kizbox2") or var_0_37:match("kizboxmini") then
	table.insert(var_0_29.rtd, var_0_23)
	table.insert(var_0_29.rts, var_0_23)
	table.insert(var_0_29.rtds, var_0_23)
	table.insert(var_0_29.rtn, var_0_23)
	table.insert(var_0_29.rtw, var_0_23)
end

var_0_16.persistentMode = var_0_11.Layer("modules", var_0_5.persistenceType)
var_0_16.modulesOptions = var_0_11.Layer("module_options", var_0_5.persistenceType)
var_0_16.list = {}

for iter_0_0, iter_0_1 in ipairs(var_0_16.persistentMode:keys()) do
	var_0_16.list[iter_0_1] = var_0_16.persistentMode:get(iter_0_1)
end

function var_0_16.setModules(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in pairs(var_0_16.list) do
		local var_9_0 = false

		for iter_9_2, iter_9_3 in ipairs(arg_9_0) do
			if iter_9_3 == iter_9_0 then
				var_9_0 = true

				break
			end
		end

		if not var_9_0 then
			var_0_16.removeModule(iter_9_0)
		end
	end

	var_0_16.list = {}

	var_0_16.persistentMode:clear()

	for iter_9_4, iter_9_5 in ipairs(arg_9_0) do
		var_0_16.addModule(iter_9_5, arg_9_1[iter_9_5])
	end
end

var_0_16.appSeeker = var_0_6()

local var_0_38 = {}

function var_0_16.appSeeker.nameOwnerChanged(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	if not var_0_16.autorestart then
		return
	end

	local var_10_0 = var_0_38[arg_10_1]

	if not var_10_0 then
		return
	end

	if arg_10_3 == "" then
		var_10_0.status = "REQUESTED"

		var_0_35(arg_10_1, var_10_0)
	else
		var_10_0.status = "DONE"
	end
end

local function var_0_39(arg_11_0, arg_11_1)
	if arg_11_0.name and var_0_17[arg_11_0.name:lower()] then
		var_0_4:notice("addRequested denied - " .. arg_11_0.name .. " is blacklisted")

		return
	end

	var_0_38[arg_11_0[2]] = {
		status = "REQUESTED",
		onStart = arg_11_0[1],
		count = {
			[arg_11_1] = true
		},
		onStop = arg_11_0[3],
		onRestart = arg_11_0[4],
		delayOnRestart = arg_11_0.delayOnRestart,
		lastStartTimestamp = arg_11_0.lastStartTimestamp,
		checkWithDBus = arg_11_0.checkWithDBus
	}

	local function var_11_0(arg_12_0)
		if arg_12_0 then
			var_0_4:info("Modules loader: service " .. tostring(arg_11_0[2]) .. " started.")
		else
			var_0_4:notice("Modules loader: service " .. tostring(arg_11_0[2]) .. " needed. Starting ...")
			var_0_34(arg_11_0[1])
		end
	end

	if arg_11_0.checkWithDBus then
		var_0_16.appSeeker:nameHasOwner(arg_11_0[2], var_11_0)
	else
		var_11_0(false)
	end
end

function var_0_16.addService(arg_13_0)
	if arg_13_0 == "internal" then
		return
	end

	local var_13_0 = var_0_29[arg_13_0]

	if not var_13_0 then
		var_0_4:error("Modules loader: no service requested for " .. tostring(arg_13_0))

		return
	end

	if var_0_17[arg_13_0:lower()] then
		var_0_4:notice("addService denied - " .. arg_13_0 .. " is blacklisted")

		return
	end

	for iter_13_0, iter_13_1 in ipairs(var_13_0) do
		if not var_0_38[iter_13_1[2]] then
			var_0_39(iter_13_1, arg_13_0)
		else
			var_0_38[iter_13_1[2]].count[arg_13_0] = true
		end
	end
end

function var_0_16.removeService(arg_14_0, arg_14_1)
	local var_14_0 = var_0_29[arg_14_0]

	if not var_14_0 then
		var_0_4:info("Modules loader: no service requested for " .. tostring(arg_14_0))

		return
	end

	for iter_14_0, iter_14_1 in ipairs(var_14_0) do
		if var_0_38[iter_14_1[2]] then
			local var_14_1 = var_0_38[iter_14_1[2]].count

			var_14_1[arg_14_0] = nil

			local var_14_2 = true

			if next(var_14_1) ~= nil then
				var_14_2 = false
			end

			if var_14_2 or arg_14_1 then
				local var_14_3 = var_0_38[iter_14_1[2]].onStop

				var_0_4:notice("Modules loader: service " .. tostring(iter_14_1[2]) .. " not needed anymore. Stopping ...")

				var_0_38[iter_14_1[2]] = nil

				if var_14_3 then
					var_0_34(var_14_3)
				end
			end
		end
	end
end

function var_0_16.restartIfRequested(arg_15_0)
	local var_15_0 = false

	for iter_15_0, iter_15_1 in pairs(var_0_29) do
		for iter_15_2, iter_15_3 in ipairs(iter_15_1) do
			if iter_15_3.name == arg_15_0 then
				if var_0_38[iter_15_3[2]] then
					var_0_4:debug("Restarting daemon " .. arg_15_0)

					local var_15_1 = var_0_38[iter_15_3[2]].onRestart

					if var_15_1 then
						var_0_34(var_15_1)
					else
						var_0_4:warning("There is no command to restart " .. arg_15_0)
					end
				else
					var_0_4:notice("Daemon " .. arg_15_0 .. " was not started, no restart needed")
				end

				var_15_0 = true

				break
			end
		end

		if var_15_0 then
			break
		end
	end
end

function var_0_16.stopAllServices()
	var_0_16.autorestart = false

	for iter_16_0, iter_16_1 in pairs(var_0_38) do
		var_0_4:notice("Stopping '" .. iter_16_0 .. "'")

		if iter_16_1.onStop then
			var_0_34(iter_16_1.onStop)
		end
	end

	var_0_36()
end

var_0_16.modules = var_0_2(var_0_16.modulesOptions)

function var_0_16.addModule(arg_17_0, arg_17_1)
	if var_0_17[arg_17_0:lower()] then
		var_0_4:notice("addModule denied - " .. arg_17_0 .. " is blacklisted")

		return
	end

	var_0_16.list[arg_17_0] = true

	var_0_16.persistentMode:put(arg_17_0, "true")

	local var_17_0 = var_0_0.decode(var_0_16.modulesOptions:get(arg_17_0)) or {}
	local var_17_1 = arg_17_1 or {}

	if not var_0_0.tableCompare(var_17_0, var_17_1) then
		var_0_16.modules:optionsUpdated(arg_17_0, arg_17_1)
		var_0_16.modulesOptions:del(arg_17_0)

		if arg_17_1 then
			var_0_16.modulesOptions:put(arg_17_0, var_0_0.encode(arg_17_1))
		end
	end

	var_0_16.addService(arg_17_0)

	local var_17_2 = var_0_18[arg_17_0]

	if var_17_2 then
		var_0_1:enableModule(var_17_2)
	end
end

function var_0_16.removeModule(arg_18_0)
	var_0_16.list[arg_18_0] = nil

	var_0_16.persistentMode:del(arg_18_0)
	var_0_16.modulesOptions:del(arg_18_0)
	var_0_16.removeService(arg_18_0)

	local var_18_0 = var_0_18[arg_18_0]

	if var_18_0 then
		var_0_1:disableModule(var_18_0)
	end
end

function var_0_16.getModules()
	local var_19_0 = {}

	for iter_19_0, iter_19_1 in pairs(var_0_16.list) do
		if var_0_18[iter_19_0] then
			var_19_0[var_0_18[iter_19_0]] = iter_19_1
		end
	end

	return var_19_0
end

function var_0_16.setRestart(arg_20_0)
	var_0_16.autorestart = arg_20_0
end

local var_0_40 = var_0_0.getBoardModelInfo()
local var_0_41 = {}
local var_0_42 = _G.io.popen("ls -1 " .. var_0_5.appLoader.configsSearchPattern)

while true do
	local var_0_43 = var_0_42:read("*line")

	if not var_0_43 then
		break
	end

	var_0_41[#var_0_41 + 1] = var_0_43
end

var_0_42:close()

for iter_0_2, iter_0_3 in pairs(var_0_41) do
	local var_0_44, var_0_45, var_0_46 = pcall(dofile, iter_0_3)

	if var_0_44 and type(var_0_45) == "function" and type(var_0_46) == "table" and #var_0_46 > 0 then
		for iter_0_4, iter_0_5 in pairs(var_0_46) do
			local var_0_47 = var_0_45(iter_0_5, var_0_40.MACHINE, var_0_40.FAMILY, var_0_40.MODEL, var_0_40.MODEL_FULLNAME)

			if type(var_0_47) == "table" then
				if var_0_47.isLaunchable == false then
					var_0_17[iter_0_5:lower()] = true
				end
			else
				var_0_4:error("blacklist filling: invalid config: " .. iter_0_3 .. " (bad getter retval type) ; skipping")
			end
		end
	else
		var_0_4:error("blacklist filling: invalid config: " .. iter_0_3 .. " (needs 1 function and 1 table) ; skipping")
	end
end

var_0_1.delegate = var_0_16

var_0_16.appSeeker:start()
var_0_9.Timeout.create(var_0_8.Elapsed(0), function()
	var_0_39(var_0_26, "trigger")
	var_0_39(var_0_25, "ows")

	for iter_21_0 in pairs(var_0_16.list) do
		var_0_16.addService(iter_21_0)
	end
end)

return var_0_16
