-- chunkname: @./gateway/RTx-utils.module

local function RTxConstructor(extend)
	local CommonUtils = depends("common", "utils")
	local RTxUtils = {}

	RTxUtils.defaultTimeBreak = 470
	RTxUtils.testTimeBreak = 5000
	RTxUtils.defaultTimeStop = 30
	RTxUtils.RTxVersion = {}
	RTxUtils.RTxVersion.u56 = "u56"
	RTxUtils.RTxVersion.u80 = "u80"
	RTxUtils.commands = {}
	RTxUtils.baseCommand = {}
	RTxUtils.baseCommand.command = 0
	RTxUtils.baseCommand.u80function = 2
	RTxUtils.baseCommand.u80parameter = 0
	RTxUtils.u80function = {}
	RTxUtils.u80function["Frame Counter"] = 0
	RTxUtils.u80function.Goto = 2
	RTxUtils.u80function.MoveOf = 3
	RTxUtils.u80GotoParameters = {}
	RTxUtils.u80GotoParameters.up = 0
	RTxUtils.u80GotoParameters.down = 200
	RTxUtils.u80GotoParameters.stop = 255
	RTxUtils.u80GotoParameters.my = 201
	RTxUtils.commands.up = {}
	RTxUtils.commands.up.command = 2
	RTxUtils.commands.up.u80function = RTxUtils.u80function.Goto
	RTxUtils.commands.up.u80parameter = RTxUtils.u80GotoParameters.up
	RTxUtils.commands.down = {}
	RTxUtils.commands.down.command = 4
	RTxUtils.commands.down.u80function = RTxUtils.u80function.Goto
	RTxUtils.commands.down.u80parameter = RTxUtils.u80GotoParameters.down
	RTxUtils.commands.stop = {}
	RTxUtils.commands.stop.command = 1
	RTxUtils.commands.stop.u80function = RTxUtils.u80function.Goto
	RTxUtils.commands.stop.u80parameter = RTxUtils.u80GotoParameters.stop
	RTxUtils.commands.my = {}
	RTxUtils.commands.my.command = 1
	RTxUtils.commands.my.u80function = RTxUtils.u80function.Goto
	RTxUtils.commands.my.u80parameter = RTxUtils.u80GotoParameters.my
	RTxUtils.commands.moveOf = {}
	RTxUtils.commands.moveOf.command = 11
	RTxUtils.commands.moveOf.u80function = RTxUtils.u80function.MoveOf
	RTxUtils.commands.moveOf.u80parameter = 0
	RTxUtils.commands.moveOf.timebreak = 0
	RTxUtils.commands.autoMode = {}
	RTxUtils.commands.autoMode.command = 5
	RTxUtils.commands.autoMode.u80function = RTxUtils.u80function["Frame Counter"]
	RTxUtils.commands.autoMode.u80parameter = 0
	RTxUtils.commands.cycle = {}
	RTxUtils.commands.cycle.command = 15
	RTxUtils.commands.cycle.u80function = RTxUtils.u80function.MoveOf
	RTxUtils.commands.cycle.u80parameter = RTxUtils.u80GotoParameters.stop
	RTxUtils.commands.heatingTest = {}
	RTxUtils.commands.heatingTest.command = 3
	RTxUtils.commands.heatingTest.u80function = RTxUtils.u80function.Goto
	RTxUtils.commands.heatingTest.u80parameter = RTxUtils.u80GotoParameters.my
	RTxUtils.commands.goto = {}
	RTxUtils.commands.goto.command = 1
	RTxUtils.commands.goto.u80function = RTxUtils.u80function.Goto
	RTxUtils.commands.goto.u80parameter = 0

	function RTxUtils.createBaseCommand(command, repeatCount)
		RTxUtils.checkCommandData(command)

		local parameters

		parameters = command
		parameters.version = RTxUtils.RTxVersion.u80
		parameters.repeatseq = 3
		parameters.repeatcmd = repeatCount
		parameters.rcautoinc = true
		parameters.u80key = 0
		parameters.u80extension = 0

		extend.setProtocolSpecificCommandParameters(command)

		return parameters
	end

	function RTxUtils.createCycleCommand(command, repeatCount)
		RTxUtils.checkCommandData(command)

		local parameters

		parameters = command
		parameters.version = RTxUtils.RTxVersion.u56
		parameters.rcautoinc = true
		parameters.repeatseq = 3
		parameters.repeatcmd = repeatCount
		parameters.u80key = 0
		parameters.u80extension = 0
		parameters.u80function = 0
		parameters.u80parameter = 0
		parameters.random = 164

		extend.setProtocolSpecificCommandParameters(command)

		return parameters
	end

	function RTxUtils.checkCommandData(command)
		RTxUtils.checkTimeArg(command.timestop)
		RTxUtils.checkTimeArg(command.timebreak)
		assert(command.command ~= nil, "command value is nil")
		assert(type(command.command) == "number", "command value should be a number")
	end

	function RTxUtils.checkTimeArg(time)
		assert(time ~= nil, "given time value is nil")
		assert(type(time) == "number", "given time should be a number")
		assert(time >= 0, "given time should be a positive value")
	end

	function RTxUtils.getParametersForCommand(commandName, deviceType)
		local command = CommonUtils.deepCopy(RTxUtils.commands[commandName])

		assert(command ~= nil, "unknown command name for :" .. commandName)

		command.timestop = RTxUtils.getTimeStop(deviceType)

		if command.timebreak == nil then
			command.timebreak = RTxUtils.defaultTimeBreak
		end

		return command
	end

	function RTxUtils.getTimeStop(deviceType)
		assert(type(deviceType) == "number", "deviceType is not a number")
		assert(deviceType >= 0, "deviceType is negative")

		local type = bit.band(deviceType, 255)

		if type == 13 or type == 7 or type == 9 then
			return 0
		else
			return RTxUtils.defaultTimeStop
		end
	end

	function RTxUtils.getSimpleCommand(commandName, context)
		assert(context ~= nil, "context is nil!!")

		if context.deviceType == nil then
			print("context.deviceType is nil")
		end

		local deviceType = tonumber(context.deviceType)
		local repeatCount = tonumber(context.repeatCount)
		local command = RTxUtils.getParametersForCommand(commandName, deviceType)

		if commandName == "cycle" then
			return nil, RTxUtils.createCycleCommand(command, repeatCount)
		else
			return nil, RTxUtils.createBaseCommand(command, repeatCount)
		end
	end

	function RTxUtils.on(context)
		local r, commandOn = RTxUtils.getSimpleCommand("up", context)

		commandOn.category = "onoff"

		return nil, commandOn
	end

	function RTxUtils.off(context)
		local r, commandOff = RTxUtils.getSimpleCommand("down", context)

		commandOff.category = "onoff"

		return nil, commandOff
	end

	function RTxUtils.onWithTimer(delay, context)
		local deviceType = tonumber(context.deviceType)
		local repeatCount = tonumber(context.repeatCount)

		RTxUtils.checkTimeArg(delay)

		local commandOn = RTxUtils.getParametersForCommand("up", deviceType)
		local commandOff = RTxUtils.getParametersForCommand("down", deviceType)

		commandOn.category = "onoff"
		commandOff.category = "onoff"
		commandOff.delay = delay

		return nil, RTxUtils.createBaseCommand(commandOn, repeatCount), nil, RTxUtils.createBaseCommand(commandOff, repeatCount)
	end

	function RTxUtils.myWithTimer(delay, context)
		local deviceType = tonumber(context.deviceType)
		local repeatCount = tonumber(context.repeatCount)

		RTxUtils.checkTimeArg(delay)

		local commandMy = RTxUtils.getParametersForCommand("my", deviceType)
		local commandOff = RTxUtils.getParametersForCommand("down", deviceType)

		commandMy.category = "onoff"
		commandOff.category = "onoff"
		commandOff.delay = delay

		return nil, RTxUtils.createBaseCommand(commandMy, repeatCount), nil, RTxUtils.createBaseCommand(commandOff, repeatCount)
	end

	function RTxUtils.moveOfWithTimeStop(arg, timestop, context)
		print(context)

		local deviceType = tonumber(context.deviceType)
		local repeatCount = 2

		assert(arg < 128 and arg > -128, "wrong value for parameter, should be between ]-128;128[ value :" .. arg)

		local command = RTxUtils.getParametersForCommand("moveOf", deviceType)
		local parameters = RTxUtils.createBaseCommand(command, repeatCount)

		parameters.timestop = timestop

		if arg < 0 then
			arg = 128 - arg
		end

		parameters.u80parameter = arg

		return nil, parameters
	end

	function RTxUtils.moveOf(arg, context)
		return RTxUtils.moveOfWithTimeStop(arg, RTxUtils.defaultTimeStop, context)
	end

	function RTxUtils.gotoPosition(arg, context)
		local deviceType = tonumber(context.deviceType)
		local repeatCount = 2
		local command = RTxUtils.getParametersForCommand("goto", deviceType)

		command.category = "onoff"

		local parameters = RTxUtils.createBaseCommand(command, repeatCount)

		parameters.u80parameter = 200 - arg * 2

		return nil, parameters
	end

	function RTxUtils.testTwoCommands(command1, command2, timestop1, timestop2, context)
		local deviceType = tonumber(context.deviceType)
		local repeatCount = tonumber(context.repeatCount)
		local firstCommand = RTxUtils.getParametersForCommand(command1, deviceType)

		firstCommand.timestop = timestop1
		firstCommand.timebreak = RTxUtils.testTimeBreak

		local secondCommand = RTxUtils.getParametersForCommand(command2, deviceType)

		secondCommand.timestop = timestop2

		local firstParameters = RTxUtils.createBaseCommand(firstCommand, repeatCount)
		local secondParameters = RTxUtils.createBaseCommand(secondCommand, repeatCount)

		return nil, firstParameters, nil, secondParameters
	end

	return RTxUtils
end

return RTxConstructor
