-- chunkname: @./gateway/rtn-utils.module

local CommonUtils = depends("common", "utils")
local RTNUtils = {}

RTNUtils.on = 250
RTNUtils.off = 251
RTNUtils.toogle = 252
RTNUtils.identify = 253
RTNUtils.ignore = 254

function RTNUtils.log(message, ...)
	if debug ~= nil then
		print("[RTN] Log: " .. message, ...)
	end
end

function RTNUtils.error(message)
	error("[RTN] error: " .. message)
end

function RTNUtils.lastButtonPressedState(value)
	if value == 0 then
		return "Scenario #1"
	elseif value == 1 then
		return "Scenario #2"
	elseif value == 2 then
		return "Local #1"
	elseif value == 3 then
		return "Local #2"
	else
		return nil
	end
end

function RTNUtils.onOffState(value)
	if value == RTNUtils.off or value == 0 then
		return "off"
	elseif value == RTNUtils.ignore then
		return nil
	else
		return "on"
	end
end

function RTNUtils.intensityState(value)
	if value == 0 or value == RTNUtils.off then
		return 0
	elseif value == 249 or value == RTNUtils.on then
		return 100
	elseif value == RTNUtils.ignore then
		return nil
	else
		return math.floor(value * 100 / 249) + 1
	end
end

function RTNUtils.onOffCommand(value)
	if value == "on" then
		return RTNUtils.on, {
			category = "onoff"
		}
	elseif value == "off" then
		return RTNUtils.off, {
			category = "onoff"
		}
	else
		return nil
	end
end

function RTNUtils.toogleCommand()
	return RTNUtils.toogle, {
		category = "onoff"
	}
end

function RTNUtils.intensityCommand(value)
	return math.floor(value * 249 / 100), {
		category = "onoff"
	}
end

function RTNUtils.intensityCommandWithTimer(value)
	return 249, {
		category = "onoff"
	}, 0, {
		category = "onoff",
		delay = value
	}
end

function RTNUtils.identifyCommand()
	return RTNUtils.identify, {
		category = "onoff"
	}
end

function RTNUtils.toogleCommandForDimmer(value)
	if value == nil then
		return RTNUtils.toogle, {
			category = "onoff"
		}
	else
		return math.floor((100 - value) * 249 / 100), {
			category = "onoff"
		}
	end
end

function RTNUtils.onWithTimerCommand(value)
	return RTNUtils.on, {
		category = "onoff"
	}, RTNUtils.off, {
		category = "onoff",
		delay = value
	}
end

function RTNUtils.onOffChan1Command(value)
	if value == "on" then
		return bytearray({
			RTNUtils.on,
			RTNUtils.ignore
		}), {
			category = "onoff"
		}
	elseif value == "off" then
		return bytearray({
			RTNUtils.off,
			RTNUtils.ignore
		}), {
			category = "onoff"
		}
	end
end

function RTNUtils.intensityChan1Command(value)
	return bytearray({
		value * 249 / 100,
		RTNUtils.ignore
	}), {
		category = "onoff"
	}
end

function RTNUtils.identifyChan1Command()
	return bytearray({
		RTNUtils.identify,
		RTNUtils.ignore
	}), {
		category = "onoff"
	}
end

function RTNUtils.toogleChan1Command()
	return bytearray({
		RTNUtils.toogle,
		RTNUtils.ignore
	}), {
		category = "onoff"
	}
end

function RTNUtils.onWithTimerChan1Command(value)
	return bytearray({
		RTNUtils.on,
		RTNUtils.ignore
	}), {
		category = "onoff"
	}, bytearray({
		RTNUtils.off,
		RTNUtils.ignore
	}), {
		category = "onoff",
		delay = value
	}
end

function RTNUtils.onOffChan2Command(value)
	if value == "on" then
		return bytearray({
			RTNUtils.ignore,
			RTNUtils.on
		}), {
			category = "onoff"
		}
	elseif value == "off" then
		return bytearray({
			RTNUtils.ignore,
			RTNUtils.off
		}), {
			category = "onoff"
		}
	end
end

function RTNUtils.intensityChan2Command(value)
	return bytearray({
		RTNUtils.ignore,
		value * 249 / 100
	}), {
		category = "onoff"
	}
end

function RTNUtils.identifyChan2Command()
	return bytearray({
		RTNUtils.ignore,
		RTNUtils.identify
	}), {
		category = "onoff"
	}
end

function RTNUtils.toogleChan2Command()
	return bytearray({
		RTNUtils.ignore,
		RTNUtils.toogle
	}), {
		category = "onoff"
	}
end

function RTNUtils.onWithTimerChan2Command(value)
	return bytearray({
		RTNUtils.ignore,
		RTNUtils.on
	}), {
		category = "onoff"
	}, bytearray({
		RTNUtils.ignore,
		RTNUtils.off
	}), {
		category = "onoff",
		delay = value
	}
end

RTNUtils.IRBlaster = {}
RTNUtils.IRBlaster.requiredField = {}
RTNUtils.IRBlaster.requiredField.commandName = "string"
RTNUtils.IRBlaster.requiredField.IRCode = "number"

function RTNUtils.IRBlaster.addCommands(commandsArray, commandsState)
	RTNUtils.IRBlaster.checkCommands(commandsArray)

	local state = {}

	if commandsState == nil then
		commandsState = {
			commands = {},
			UnusedIndexes = {}
		}
	end

	state.commandsState = commandsState

	local returnValue = {}
	local i = 1

	while i <= #commandsArray do
		commandsState.commands[commandsArray[i].commandName] = {}
		commandsState.commands[commandsArray[i].commandName].metadata = commandsArray[i].metadata

		RTNUtils.IRBlaster.setIndex(commandsArray[i].commandName, commandsState)

		returnValue[i * 2 - 1] = RTNUtils.IRBlaster.createCommandValue(commandsState.commands[commandsArray[i].commandName], commandsArray[i].IRCode)
		returnValue[i * 2] = {}
		i = i + 1
	end

	returnValue[2] = state

	return table.unpack(returnValue)
end

function RTNUtils.IRBlaster.checkCommands(commandsArray)
	assert(commandsArray ~= nil, "commandsArray should not be nil")
	assert(type(commandsArray) == "table", "commandsArray is not a table")

	for i = 1, #commandsArray do
		RTNUtils.IRBlaster.checkCommand(commandsArray[i], i)
	end
end

function RTNUtils.IRBlaster.checkCommand(command, i)
	assert(command ~= nil, "command in " .. tostring(i) .. " position is nil")
	assert(type(command) == "table", "command in " .. tostring(i) .. " position is not a table")
	RTNUtils.assertNotNilInPosition(command.commandName, "commandName", i)
	RTNUtils.assertTypeInPosition(command.commandName, "string", "commandName", i)
	RTNUtils.assertNotNilInPosition(command.IRCode, "IRCode", i)
	RTNUtils.assertTypeInPosition(command.IRCode, "table", "IRCode", i)
end

function RTNUtils.IRBlaster.setIndex(commandName, commandsState)
	if #commandsState.UnusedIndexes > 0 then
		commandsState.commands[commandName].index = commandsState.UnusedIndexes[#commandsState.UnusedIndexes]
		commandsState.UnusedIndexes[#commandsState.UnusedIndexes] = nil
	else
		local count = 0

		for _ in pairs(commandsState.commands) do
			count = count + 1
		end

		commandsState.commands[commandName].index = count
	end
end

function RTNUtils.IRBlaster.createCommandValue(command, IRCodeStringTable)
	local byteToStore = {}

	byteToStore = bytearray({
		command.index,
		0
	})

	local IRCodeNumberTable = {}

	for i = 1, #IRCodeStringTable do
		IRCodeNumberTable[i] = tonumber(IRCodeStringTable[i])
	end

	return byteToStore:append(bytearray(IRCodeNumberTable))
end

function RTNUtils.IRBlaster.deleteCommand(commandName, commandsState)
	commandsState.UnusedIndexes[#commandsState.UnusedIndexes + 1] = commandsState.commands[commandName].index

	local value = bytearray({
		commandsState.commands[commandName].index,
		0,
		0
	})

	commandsState.commands[commandName] = nil

	local state = {}

	state.commandsState = commandsState

	return value, state
end

function RTNUtils.IRBlaster.deleteAllCommands(commandsState)
	local state = {}

	if commandsState == nil then
		commandsState = {}
	end

	commandsState.commands = {}
	commandsState.UnusedIndexes = {}
	state.commandsState = commandsState

	return nil, state
end

function RTNUtils.IRBlaster.launchCommand(commandName, commandsState)
	assert(type(commandName) == "string", "the command name should be a string")
	assert(commandsState.commands[commandName] ~= nil, "command " .. commandName .. " does not exist in the commands list")

	return commandsState.commands[commandName].index
end

function RTNUtils.IRBlaster.getIRState(p1)
	local returnValue = CommonUtils.deepCopy(p1)

	for k, v in pairs(returnValue.commands) do
		returnValue.commands[k].index = nil
	end

	return returnValue.commands
end

function RTNUtils.assertNotNilInPosition(object, objectName, position)
	assert(object ~= nil, objectName .. " in the command with " .. tostring(position) .. " position is nil")
end

function RTNUtils.assertTypeInPosition(object, objectType, objectName, position)
	assert(type(object) == objectType, objectName .. " in the command with " .. tostring(position) .. " position is not a " .. objectType)
end

return RTNUtils
