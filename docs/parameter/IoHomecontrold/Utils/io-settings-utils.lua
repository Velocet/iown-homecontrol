local CommonUtils = depends("common_utils")
local IOUtils = depends("io-utils")
local IOSomfyUtils = depends("io-somfy-utils")
local IOSettingsUtils = {baseCommands = {}}
IOSettingsUtils.conversions = {
	simpleMatching = function (rawValue, params)
		IOSettingsUtils.assertParamCount(params, 1, "simpleMatching")

		if params[1][tostring(rawValue)] ~= nil then
			return params[1][tostring(rawValue)]
		end

		return rawValue
	end,
	readSOFOPU = function (rawValue, params)
		IOSettingsUtils.assertParamCount(params, 1, "readSOFOPU")

		return IOSomfyUtils.getParamValue(rawValue, params[1])
	end,
	extractBytesFromAck = function (rawValue, params)
		IOSettingsUtils.assertParamCount(params, 2, "extractBytesFromAck")

		if rawValue == nil then
			return nil
		end

		local startPosition = params[1]
		local length = params[2]

		if length == 1 then
			return rawValue:readInt8(startPosition + 1)
		elseif length == 2 then
			return rawValue:readInt16(startPosition + 1)
		elseif length == 3 then
			return rawValue:readInt24(startPosition + 1)
		elseif length == 4 then
			return rawValue:readInt32(startPosition + 1)
		end

		error("Invalid parameters for extractBytesFromAck")
	end,
	rangeConversion = function (rawValue, params)
		IOSettingsUtils.assertParamCount(params, 2, "rangeConversion")

		local originalBounds = params[1]
		local targetBounds = params[2]

		IOSettingsUtils.assertParamCount(originalBounds, 2, "rangeConversion[1]")
		IOSettingsUtils.assertParamCount(targetBounds, 2, "rangeConversion[2]")

		local value = rawValue - originalBounds[1]
		value = value * (targetBounds[2] - targetBounds[1]) / (originalBounds[2] - originalBounds[1])

		return targetBounds[1] + value
	end,
	replaceBytes = function (rawValue, params)
		IOSettingsUtils.assertParamCount(params, 3, "replaceBytes")

		local startPosition = params[1]
		local length = params[2]
		local newValue = params[3]

		for i = 1, length do
			local newByteValue = bit.band(bit.rshift(newValue, (length - i) * 8), 255)
			rawValue[startPosition + i] = newByteValue
		end

		return rawValue
	end}
IOSettingsUtils.triggerFunctions = {
	refreshState = function (params, statesDefinitions, commandParams, states)
		local payloads = {}
		local mpfps = nil
		local index = 1

		for i in ipairs(params) do
			local stateDefinition = statesDefinitions[params[i]]

			if stateDefinition == nil then
				error("Unknown state in refreshState trigger : " .. params[i])
			end

			if stateDefinition.baseCommand == "readMP" or stateDefinition.baseCommand == "readFP" then
				if mpfps == nil then
					mpfps = {}
				end

				if stateDefinition.baseCommand == "readFP" then
					local refreshParams = IOSettingsUtils.convertParamsValue(stateDefinition.params, commandParams, states)

					if stateDefinition.conversions ~= nil then
						refreshParams = IOSettingsUtils.applyParamsConversions(refreshParams, stateDefinition.conversions, commandParams, states)
					end

					for key in ipairs(refreshParams) do
						mpfps[#mpfps + 1] = refreshParams[key]
					end
				end
			else
				local payload, options = IOSettingsUtils.computeCommand(stateDefinition.baseCommand, stateDefinition.params, stateDefinition.conversions, commandParams, states)

				if IOSettingsUtils.isCommandAlreadyPresentInArray(payloads, payload, options) == false then
					payloads[index] = payload
					payloads[index + 1] = options
					index = index + 2
				end
			end
		end

		if mpfps ~= nil then
			local payload, options = IOSettingsUtils.computeCommand("readFP", mpfps, {}, commandParams, states)
			payloads[index] = payload
			payloads[index + 1] = options
		end

		return payloads
	end}



function IOSettingsUtils.baseCommands.readObject(params, currentRawStates, context)
	IOSettingsUtils.assertParamCount(params, 1, "readObject")

	local arrayId = params[1]
	local payload = bytearray({
		2,
		0,
		0
	})

	payload:writeInt16(2, arrayId)

	return payload, {
		access = "r",
		type = 5
	}
end
function IOSettingsUtils.baseCommands.writeObject(params, currentRawStates, context)
	IOSettingsUtils.assertParamCount(params, 4, "writeObject")

	local arrayId = params[1]
	local length = params[3]
	local parameterValue = bytearray(length)

	if length == 1 then
		parameterValue = parameterValue:writeInt8(1, params[4])
	elseif length == 2 then
		parameterValue = parameterValue:writeInt16(1, params[4])
	elseif length == 3 then
		parameterValue = parameterValue:writeInt24(1, params[4])
	elseif length == 4 then
		parameterValue = parameterValue:writeInt32(1, params[4])
	end

	local stateId = 84017152 + arrayId
	local newStateValue = IOUtils.updateSOFOPUParam(currentRawStates[stateId], parameterValue, params[2])

	return IOUtils.updatePublicState(newStateValue, arrayId, 2), {
		access = "w",
		type = 5
	}
end
function IOSettingsUtils.baseCommands.readPrivate(params, currentRawStates, context)
	IOSettingsUtils.assertParamCount(params, 1, "readPrivate")

	return bytearray(params[1]), {
		access = "r",
		type = 2415919090.0,
	}
end
function IOSettingsUtils.baseCommands.writePrivate(params, currentRawStates, context)
	IOSettingsUtils.assertParamCount(params, 1, "writePrivate")

	return bytearray(params[1]), {
		type = 2415919090.0
	}
end
function IOSettingsUtils.baseCommands.writePrivateWithoutPolling(params, currentRawStates, context)
	IOSettingsUtils.assertParamCount(params, 1, "writePrivateWithoutPolling")

	return bytearray(params[1]), {
		type = 49414657
	}
end
function IOSettingsUtils.baseCommands.readMP(params, currentRawStates, context)
	IOSettingsUtils.assertParamCount(params, 0, "readMP")

	return IOUtils.readActivateFunc({}), {
		access = "r",
		type = 65554,
	}
end
function IOSettingsUtils.baseCommands.readFP(params, currentRawStates, context)
	for k in ipairs(params) do
		if type(params[k]) ~= "number" or params[k] < 1 or params[k] > 16 then
			error("readMP parameters should be numbers between 1 and 16")
		end
	end

	return IOUtils.readActivateFunc(params), {
		access = "r",
		type = 65554,
	}
end
function IOSettingsUtils.baseCommands.activateStatusRequest(params, currentRawStates, context)
	IOSettingsUtils.assertParamCount(params, 1, "activateStatusRequest")
	table.remove(params[1], 1)

	return bytearray(params[1]), {
		type = 65554
	}
end
function IOSettingsUtils.baseCommands.writeAlias(params, currentRawStates, context)
	IOSettingsUtils.assertParamCount(params, 1, "writeAlias")

	local originator = table.remove(params[1], 1)
	local acei = table.remove(params[1], 1)

	return bytearray({
		#params[1]
	}):append(bytearray(params[1])), {
		type = 65555,
		originator = originator,
		acei = acei
	}
end
function IOSettingsUtils.baseCommands.deadMan(params, currentRawStates, context)
	IOSettingsUtils.assertParamCount(params, 2, "deadMan")

	local durationMultiplier = math.ceil(params[2] / 50)
	local payload = bytearray({
		2,
		0,
		1,
		0,
		1,
		0
	})

	payload:writeInt8(2, params[1])
	payload:writeInt8(4, durationMultiplier)

	local timeout = 2000

	if context ~= nil and context.keepAliveTimeout ~= nil then
		timeout = context.keepAliveTimeout
	end

	return payload, {
		type = 2415919091.0,
		keepAliveTimeout = timeout
	}
end
function IOSettingsUtils.baseCommands.getData(params, currentRawStates, context)
	IOSettingsUtils.assertParamCount(params, 1, "getData")

	local payload = bytearray({
		2,
		236,
		0,
		0
	})

	payload:writeInt16(3, params[1])

	return payload, {
		access = "r",
		type = 49414657
	}
end

function IOSettingsUtils.assertParamCount(params, expectedCount, commandName)
	if #params ~= expectedCount then
		error("Invalid parameter count for " .. commandName .. ". Current : " .. #params .. ", Expected : " .. expectedCount)
	end
end
function IOSettingsUtils.isCommandAlreadyPresentInArray(array, payload, options)
	local arrayLength = #array

	if arrayLength < 1 then
		return false
	end

	for payloadIndex = 1, arrayLength / 2 do
		if CommonUtils.equals(array[2 * payloadIndex - 1], payload) and CommonUtils.equals(array[2 * payloadIndex], options) then
			return true
		end
	end

	return false
end
function IOSettingsUtils.isContextValid(context, commandParams, states)
	for stateName, stateValues in pairs(context) do
		local inputValue = IOSettingsUtils.getInputValue(stateName, commandParams, states)

		if inputValue == stateName then
			error("Invalid input value : " .. stateName .. ". Expected state or APIParam")
		end

		for stateValueKey in ipairs(stateValues) do
			if inputValue == stateValues[stateValueKey] then
				return true
			end
		end
	end

	return false
end
function IOSettingsUtils.runConfig(commandName, commandParams, commandDefinitions, statesDefinitions, envContext)
	local commandDefinition = commandDefinitions[commandName]

	if commandDefinition == nil then
		error("Unknown command name : " .. commandName)
	end

	local states = IOSettingsUtils.aggregateConfig(statesDefinitions)
	local rawStates = IOSettingsUtils.computeCurrentRawStates(statesDefinitions)

	for i in ipairs(commandDefinition) do
		local context = commandDefinition[i]

		if context.context == nil or IOSettingsUtils.isContextValid(context.context, commandParams, states) then
			local commands = IOSettingsUtils.computeCommands(context.commands, commandParams, states, rawStates, envContext)

			if context.trigger ~= nil then
				local refreshStateCommands = IOSettingsUtils.computeTriggerCommand(context.trigger, statesDefinitions, commandParams, states)

				for _, v in ipairs(refreshStateCommands) do
					table.insert(commands, v)
				end
			end

			return table.unpack(commands)
		end
	end

	error("no valid context")
end
function IOSettingsUtils.aggregateConfig(statesDefinitions)
	local states = {}

	for k, v in pairs(statesDefinitions) do
		states[k] = v.value

		if v.conversions ~= nil then
			states[k] = IOSettingsUtils.applyStateConversions(states[k], v.conversions)
		end

		if v.type == "int" then
			states[k] = tonumber(states[k])
		end
	end

	return states
end
function IOSettingsUtils.getInputValue(inputName, commandParams, states)
	if type(inputName) == "string" then
		local parts = CommonUtils.stringSimpleSplit(inputName, ":")

		if #parts == 2 and parts[1] == "state" then
			return states[parts[2]]
		elseif #parts == 2 and parts[1] == "APIParam" then
			return commandParams[parts[2]]
		end
	end

	return inputName
end
function IOSettingsUtils.advancedRefresh(type, statesDefinitions)
	local states = IOSettingsUtils.aggregateConfig(statesDefinitions)
	local payloads = {}
	local mpfps = {}
	local index = 1

	if type == "advanced" then
		for k, v in pairs(statesDefinitions) do
			local stateDefinition = statesDefinitions[k]

			if v.refreshAll == true then
				if stateDefinition.baseCommand == "readFP" then
					local refreshParams = IOSettingsUtils.convertParamsValue(stateDefinition.params, {}, states)

					if stateDefinition.conversions ~= nil then
						refreshParams = IOSettingsUtils.applyParamsConversions(
							refreshParams,
							stateDefinition.conversions,
							{},
							states
						)
					end

					for key in ipairs(refreshParams) do
						mpfps[#mpfps + 1] = refreshParams[key]
					end
				elseif stateDefinition.baseCommand ~= "readMP" then
					local payload, options = IOSettingsUtils.computeCommand(
						stateDefinition.baseCommand,
						stateDefinition.params,
						stateDefinition.conversions,
						{},
						states
					)

					if IOSettingsUtils.isCommandAlreadyPresentInArray(payloads, payload, options) == false then
						payloads[index] = payload
						payloads[index + 1] = options
						index = index + 2
					end
				end
			end
		end
	end

	local payload, options = IOSettingsUtils.computeCommand("readFP", mpfps, {}, {}, states)
	payloads[index] = payload
	payloads[index + 1] = options

	return table.unpack(payloads)
end

function IOSettingsUtils.applyParamsConversions(params, conversions, commandParams, states)
	for i in ipairs(conversions) do
		local conversion = conversions[i]

		if conversion.index ~= nil then
			local paramValue = params[conversion.index + 1]

			if paramValue == nil then
				error("Invalid parameter index : " .. conversion.index)
			end

			local conversionFunction = IOSettingsUtils.conversions[conversion["function"]]

			if conversionFunction == nil then
				error("Invalid conversion function : " .. conversion["function"])
			end

			local conversionParams = IOSettingsUtils.convertParamsValue(conversion.params, commandParams, states)
			params[i] = conversionFunction(paramValue, conversion.params, conversionParams)
		end
	end

	return params
end
function IOSettingsUtils.applyStateConversions(rawValue, conversions)
	for i in ipairs(conversions) do
		local conversion = conversions[i]

		if conversion.index == nil then
			if IOSettingsUtils.conversions[conversion["function"]] == nil then
				error("Unknown conversion function : " .. conversion["function"])
			end

			rawValue = IOSettingsUtils.conversions[conversion["function"]](rawValue, conversion.params)
		end
	end

	return rawValue
end
function IOSettingsUtils.computeCommand(
	baseCommand,
	definitionParams,
	conversions,
	commandParams,
	states,
	rawStates,
	envContext
 )
	if baseCommand == nil then
		error("Base command should not be null")
	elseif IOSettingsUtils.baseCommands[baseCommand] == nil then
		error("Unknown base command : " .. baseCommand)
	end

	local params = IOSettingsUtils.convertParamsValue(definitionParams, commandParams, states)

	if conversions ~= nil then
		params = IOSettingsUtils.applyParamsConversions(params, conversions, commandParams, states)
	end

	return IOSettingsUtils.baseCommands[baseCommand](params, rawStates, envContext)
end
function IOSettingsUtils.computeCommands(commands, commandParams, states, rawStates, envContext)
	local payloads = {}
	local index = 1

	for i in ipairs(commands) do
		local payload, options = IOSettingsUtils.computeCommand(commands[i].baseCommand, commands[i].params, commands[i].conversions, commandParams, states, rawStates, envContext)
		payloads[index] = payload
		payloads[index + 1] = options
		index = index + 2
	end

	return payloads
end
function IOSettingsUtils.computeTriggerCommand(trigger, statesDefinitions, commandParams, states)
	local func = trigger["function"]

	if IOSettingsUtils.triggerFunctions[func] == nil then
		error("Unknown trigger function : " .. func)
	end

	return IOSettingsUtils.triggerFunctions[func](trigger.params, statesDefinitions, commandParams, states)
end
function IOSettingsUtils.computeCurrentRawStates(statesDefinitions)
	local rawStates = {}

	for k, v in pairs(statesDefinitions) do
		rawStates[v.stateId] = v.value
	end

	return rawStates
end
function IOSettingsUtils.convertParamsValue(params, commandParams, states)
	if params == nil then
		return {}
	end

	for i in ipairs(params) do
		params[i] = IOSettingsUtils.getInputValue(params[i], commandParams, states)
		params[i] = IOSettingsUtils.convertHexadecimalValues(params[i])
	end

	return params
end
function IOSettingsUtils.convertHexadecimalValues(paramValue)
	if type(paramValue) == "string" and string.match(paramValue, "^0x([0-9A-F]+)$") then
		paramValue = tonumber(paramValue:gsub("0x", ""), 16)
	elseif type(paramValue) == "table" then
		for i in ipairs(paramValue) do
			paramValue[i] = IOSettingsUtils.convertHexadecimalValues(paramValue[i])
		end
	end

	return paramValue
end return IOSettingsUtils
