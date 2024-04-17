-- chunkname: @./gateway/RTS-utils.module

local CommonUtils = depends("common", "utils")
local RTSUtils = {}

RTSUtils.defaultTimeBreak = 470
RTSUtils.testTimeBreak = 5000
RTSUtils.defaultTimeStop = 30
RTSUtils.RTSType = {}
RTSUtils.RTSType.RTS = "rts"
RTSUtils.RTSType.vendor = "vendor"
RTSUtils.RTSVersion = {}
RTSUtils.RTSVersion.u56 = "u56"
RTSUtils.RTSVersion.u80 = "u80"
RTSUtils.vendor = {}
RTSUtils.vendor.somfy = 2
RTSUtils.commands = {}
RTSUtils.baseCommand = {}
RTSUtils.baseCommand.command = 0
RTSUtils.baseCommand.u80function = 2
RTSUtils.baseCommand.u80parameter = 0
RTSUtils.u80function = {}
RTSUtils.u80function["Frame Counter"] = 0
RTSUtils.u80function.Goto = 2
RTSUtils.u80function.MoveOf = 3
RTSUtils.u80GotoParameters = {}
RTSUtils.u80GotoParameters.up = 0
RTSUtils.u80GotoParameters.down = 200
RTSUtils.u80GotoParameters.stop = 255
RTSUtils.u80GotoParameters.my = 201
RTSUtils.commands.up = {}
RTSUtils.commands.up.command = 2
RTSUtils.commands.up.u80function = RTSUtils.u80function.Goto
RTSUtils.commands.up.u80parameter = RTSUtils.u80GotoParameters.up
RTSUtils.commands.down = {}
RTSUtils.commands.down.command = 4
RTSUtils.commands.down.u80function = RTSUtils.u80function.Goto
RTSUtils.commands.down.u80parameter = RTSUtils.u80GotoParameters.down
RTSUtils.commands.stop = {}
RTSUtils.commands.stop.command = 1
RTSUtils.commands.stop.u80function = RTSUtils.u80function.Goto
RTSUtils.commands.stop.u80parameter = RTSUtils.u80GotoParameters.stop
RTSUtils.commands.my = {}
RTSUtils.commands.my.command = 1
RTSUtils.commands.my.u80function = RTSUtils.u80function.Goto
RTSUtils.commands.my.u80parameter = RTSUtils.u80GotoParameters.my
RTSUtils.commands.moveOf = {}
RTSUtils.commands.moveOf.command = 11
RTSUtils.commands.moveOf.u80function = RTSUtils.u80function.MoveOf
RTSUtils.commands.moveOf.u80parameter = 0
RTSUtils.commands.moveOf.timebreak = 0
RTSUtils.commands.autoMode = {}
RTSUtils.commands.autoMode.command = 5
RTSUtils.commands.autoMode.u80function = RTSUtils.u80function["Frame Counter"]
RTSUtils.commands.autoMode.u80parameter = 0
RTSUtils.commands.cycle = {}
RTSUtils.commands.cycle.command = 15
RTSUtils.commands.cycle.u80function = RTSUtils.u80function.MoveOf
RTSUtils.commands.cycle.u80parameter = RTSUtils.u80GotoParameters.stop
RTSUtils.commands.openConfiguration = {}
RTSUtils.commands.openConfiguration.command = 8
RTSUtils.commands.openConfigurationFor4T = {}
RTSUtils.commands.openConfigurationFor4T.command = 15
RTSUtils.commands.heatingTest = {}
RTSUtils.commands.heatingTest.command = 3
RTSUtils.commands.heatingTest.u80function = RTSUtils.u80function.Goto
RTSUtils.commands.heatingTest.u80parameter = RTSUtils.u80GotoParameters.my

function RTSUtils.createBaseCommand(command, repeatCount)
	RTSUtils.checkCommandData(command)

	local parameters

	parameters = command
	parameters.type = RTSUtils.RTSType.RTS
	parameters.version = RTSUtils.RTSVersion.u80
	parameters.repeatseq = 3
	parameters.repeatcmd = repeatCount
	parameters.rcautoinc = true
	parameters.u80key = 0
	parameters.u80extension = 0

	return parameters
end

function RTSUtils.createCycleCommand(command, repeatCount)
	RTSUtils.checkCommandData(command)

	local parameters

	parameters = command
	parameters.type = RTSUtils.RTSType.RTS
	parameters.vendorid = RTSUtils.vendor.somfy
	parameters.version = RTSUtils.RTSVersion.u56
	parameters.rcautoinc = true
	parameters.repeatseq = 3
	parameters.repeatcmd = repeatCount
	parameters.u80key = 0
	parameters.u80extension = 0
	parameters.u80function = 0
	parameters.u80parameter = 0
	parameters.random = 164

	return parameters
end

function RTSUtils.createOpenConfigurationCommand(command)
	RTSUtils.checkCommandData(command)

	local parameters

	parameters = command
	parameters.type = RTSUtils.RTSType.RTS
	parameters.version = RTSUtils.RTSVersion.u56
	parameters.rcautoinc = true
	parameters.repeatseq = 15
	parameters.repeatcmd = 15
	parameters.u80key = 0
	parameters.u80extension = 0
	parameters.u80function = 0
	parameters.u80parameter = 0
	parameters.random = 164

	return parameters
end

function RTSUtils.checkCommandData(command)
	RTSUtils.checkTimeArg(command.timestop)
	RTSUtils.checkTimeArg(command.timebreak)
	assert(command.command ~= nil, "command value is nil")
	assert(type(command.command) == "number", "command value should be a number")
end

function RTSUtils.checkTimeArg(time)
	assert(time ~= nil, "given time value is nil")
	assert(type(time) == "number", "given time should be a number")
	assert(time >= 0, "given time should be a positive value")
end

function RTSUtils.getParametersForCommand(commandName, deviceType, timestop)
	local command = CommonUtils.deepCopy(RTSUtils.commands[commandName])

	assert(command ~= nil, "unknown command name for :" .. commandName)

	if timestop == nil then
		command.timestop = RTSUtils.getTimeStop(deviceType)
	else
		assert(type(timestop) == "number" and timestop >= 0 and timestop <= 30, "timestop should be a number between 0 and 30")

		command.timestop = timestop
	end

	if command.timebreak == nil then
		command.timebreak = RTSUtils.defaultTimeBreak
	end

	return command
end

function RTSUtils.getTimeStop(deviceType)
	assert(type(deviceType) == "number", "deviceType is not a number")
	assert(deviceType >= 0, "deviceType is negative")

	local type = bit.band(deviceType, 255)

	if type == 13 or type == 7 or type == 9 or type == 23 then
		return 0
	else
		return RTSUtils.defaultTimeStop
	end
end

function RTSUtils.getSimpleCommand(commandName, context, timestop)
	assert(context ~= nil, "context is nil!!")

	if context.deviceType == nil then
		print("context.deviceType is nil")
	end

	local deviceType = tonumber(context.deviceType)
	local repeatCount = tonumber(context.repeatCount)
	local command = RTSUtils.getParametersForCommand(commandName, deviceType, timestop)

	if commandName == "cycle" then
		return nil, RTSUtils.createCycleCommand(command, repeatCount)
	elseif commandName == "openConfiguration" or commandName == "openConfigurationFor4T" then
		return nil, RTSUtils.createOpenConfigurationCommand(command)
	else
		return nil, RTSUtils.createBaseCommand(command, repeatCount)
	end
end

function RTSUtils.on(context)
	local r, commandOn = RTSUtils.getSimpleCommand("up", context, 0)

	commandOn.category = "onoff"

	return nil, commandOn
end

function RTSUtils.off(context)
	local r, commandOff = RTSUtils.getSimpleCommand("down", context, 0)

	commandOff.category = "onoff"

	return nil, commandOff
end

function RTSUtils.onWithTimer(delay, context)
	local deviceType = tonumber(context.deviceType)
	local repeatCount = tonumber(context.repeatCount)

	RTSUtils.checkTimeArg(delay)

	local commandOn = RTSUtils.getParametersForCommand("up", deviceType, 0)
	local commandOff = RTSUtils.getParametersForCommand("down", deviceType, 0)

	commandOn.category = "onoff"
	commandOff.category = "onoff"
	commandOff.delay = delay

	return nil, RTSUtils.createBaseCommand(commandOn, repeatCount), nil, RTSUtils.createBaseCommand(commandOff, repeatCount)
end

function RTSUtils.myWithTimer(delay, context)
	local deviceType = tonumber(context.deviceType)
	local repeatCount = tonumber(context.repeatCount)

	RTSUtils.checkTimeArg(delay)

	local commandMy = RTSUtils.getParametersForCommand("my", deviceType)
	local commandOff = RTSUtils.getParametersForCommand("down", deviceType)

	commandMy.category = "onoff"
	commandOff.category = "onoff"
	commandOff.delay = delay

	return nil, RTSUtils.createBaseCommand(commandMy, repeatCount), nil, RTSUtils.createBaseCommand(commandOff, repeatCount)
end

function RTSUtils.moveOfWithTimeStop(arg, timestop, context)
	print(context)

	local deviceType = tonumber(context.deviceType)
	local repeatCount = 2

	assert(arg < 128 and arg > -128, "wrong value for parameter, should be between ]-128;128[ value :" .. arg)

	local command = RTSUtils.getParametersForCommand("moveOf", deviceType)
	local parameters = RTSUtils.createBaseCommand(command, repeatCount)

	if timestop == nil then
		parameters.timestop = RTSUtils.getTimeStop(deviceType)
	else
		assert(type(timestop) == "number" and timestop >= 0 and timestop <= 30, "timestop should be a number between 0 and 30")

		parameters.timestop = timestop
	end

	if arg < 0 then
		arg = 128 - arg
	end

	parameters.u80parameter = arg

	return nil, parameters
end

function RTSUtils.testTwoCommands(command1, command2, timestop1, timestop2, context)
	local deviceType = tonumber(context.deviceType)
	local repeatCount = tonumber(context.repeatCount)
	local firstCommand = RTSUtils.getParametersForCommand(command1, deviceType)

	firstCommand.timestop = timestop1
	firstCommand.timebreak = RTSUtils.testTimeBreak

	local secondCommand = RTSUtils.getParametersForCommand(command2, deviceType)

	secondCommand.timestop = timestop2

	local firstParameters = RTSUtils.createBaseCommand(firstCommand, repeatCount)
	local secondParameters = RTSUtils.createBaseCommand(secondCommand, repeatCount)

	return nil, firstParameters, nil, secondParameters
end

return RTSUtils
