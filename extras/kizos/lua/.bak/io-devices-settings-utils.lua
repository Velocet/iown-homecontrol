slot0 = depends("common_utils")
slot1 = depends("io-utils")
slot2 = depends("io-somfy-utils")

function slot4(slot0, slot1)
	slot2 = 2

	if slot1 ~= nil then
		slot2 = slot1
	end

	slot3 = bytearray({
		slot2,
		0,
		0
	})

	slot3:writeInt16(2, slot0)

	return slot3
end

return {
	CONVERSION_ERRORS = "conversionErrors",
	PREPARE_DATA_OBJECT = 8,
	baseCommands = {
		readObject = function (slot0, slot1, slot2)
			slot0:assertParamCount(1, "readObject")

			return slot1(slot0[1]), {
				access = "r",
				type = 5
			}
		end,
		readObjectPublic = function (slot0, slot1, slot2)
			slot0:assertParamCountRange(1, 2, "readObjectPublic")

			return slot1(slot0[1], slot0[2]), {
				access = "r",
				type = 5
			}
		end,
		readObjectWithPrepareData = function (slot0, slot1, slot2)
			slot0:assertParamCountRange(1, 2, "readObjectWithPrepareData")

			return slot1(slot0[1], slot0[2]), {
				access = "r",
				type = 8
			}
		end,
		writeSOFOPUObject = function (slot0, slot1, slot2)
			slot0:assertParamCount(4, "writeSOFOPUObject")

			slot3 = slot0[1]
			slot5 = bytearray(slot0[3])

			if slot0[3] == 1 then
				slot5 = slot5:writeInt8(1, slot0[4])
			elseif slot4 == 2 then
				slot5 = slot5:writeInt16(1, slot0[4])
			elseif slot4 == 3 then
				slot5 = slot5:writeInt24(1, slot0[4])
			elseif slot4 == 4 then
				slot5 = slot5:writeInt32(1, slot0[4])
			end

			return slot1.updatePublicState(slot7, slot3, 2), {
				access = "w",
				type = 5
			}
		end,
		writeSOFOPUObjectString = function (slot0, slot1, slot2)
			slot0:assertParamCountRange(3, 5, "writeSOFOPUObjectString")

			slot3 = slot0[1]
			slot4 = slot0[2]
			slot5 = bytearray(slot0[3], "iso-8859-1")
			slot6 = slot0[4] or false

			if (slot0[5] or 50) < #slot5 and slot6 then
				error("Size of the string should be inferior at " .. tostring(slot7) .. ". Actual size is " .. #slot5 .. ".")
			end

			return slot1.updatePublicState(slot9, slot3, 2), {
				access = "w",
				type = 5
			}
		end,
		writeRawObject = function (slot0, slot1, slot2)
			slot0:assertParamCountRange(2, 3, "writeRawObject")

			slot3 = slot0[1]
			slot4 = slot0[2]
			slot5 = 2

			if slot0[3] ~= nil then
				slot5 = slot0[3]
			end

			slot6 = bytearray({
				slot5,
				0,
				0,
				0,
				0
			})

			slot6:writeInt16(2, slot3)

			return slot6:append(bytearray(slot4)), {
				access = "w",
				type = 5
			}
		end,
		writePrivate = function (slot0, slot1, slot2)
			slot0:assertParamCount(1, "writePrivate")

			return bytearray(slot0[1]), {
				type = 2415919090.0
			}
		end,
		writePrivateWithoutPolling = function (slot0, slot1, slot2)
			slot0:assertParamCount(1, "writePrivateWithoutPolling")

			return bytearray(slot0[1]), {
				type = 49414657
			}
		end,
		readPrivate = function (slot0, slot1, slot2)
			slot0:assertParamCount(1, "readPrivate")

			return bytearray(slot0[1]), {
				access = "r",
				type = 49414657
			}
		end,
		activateStatusRequest = function (slot0, slot1, slot2)
			slot0:assertParamCount(1, "activateStatusRequest")
			table.remove(slot0[1], 1)

			return bytearray(slot0[1]), {
				type = 65554
			}
		end,
		readMP = function (slot0, slot1, slot2)
			slot0:assertParamCount(0, "readMP")

			return slot1.readActivateFunc({}), {
				access = "r",
				type = 65554
			}
		end,
		readFP = function (slot0, slot1, slot2)
			for slot6 in ipairs(slot0) do
				if type(slot0[slot6]) ~= "number" or slot0[slot6] < 1 or slot0[slot6] > 16 then
					error("readMP parameters should be numbers between 1 and 16")
				end
			end

			return slot0:readActivateFunc(), {
				access = "r",
				type = 65554
			}
		end,
		writeAlias = function (slot0, slot1, slot2)
			slot0:assertParamCount(1, "writeAlias")

			return bytearray({
				#slot0[1]
			}):append(bytearray(slot0[1])), {
				type = 65555,
				originator = table.remove(slot0[1], 1),
				acei = table.remove(slot0[1], 1)
			}
		end,
		deadMan = function (slot0, slot1, slot2)
			slot0:assertParamCount(2, "deadMan")

			slot4 = bytearray({
				2,
				0,
				1,
				0,
				1,
				0
			})

			slot4:writeInt8(2, slot0[1])
			slot4:writeInt8(4, math.ceil(slot0[2] / 50))

			slot5 = 2000

			if slot2 ~= nil and slot2.keepAliveTimeout ~= nil then
				slot5 = slot2.keepAliveTimeout
			end

			return slot4, {
				type = 2415919091.0,
				keepAliveTimeout = slot5
			}
		end,
		getData = function (slot0, slot1, slot2)
			slot0:assertParamCount(1, "getData")

			slot3 = bytearray({
				2,
				236,
				0,
				0
			})

			slot3:writeInt16(3, slot0[1])

			return slot3, {
				access = "r",
				type = 49414657
			}
		end,
		accessLearningEndLimits = function (slot0, slot1, slot2)
			slot0:assertParamCount(0, "accessLearningEndLimits")

			return bytearray({
				2,
				223,
				24,
				2
			}), {
				access = "w",
				type = 2415919090.0
			}
		end
	},
	conversions = {
		simpleMatching = function (slot0, slot1)
			slot0.assertParamCount(slot1, 1, "simpleMatching")

			if slot1[1][tostring(slot0)] ~= nil then
				return slot1[1][tostring(slot0)]
			end

			return slot0
		end,
		readSOFOPU = function (slot0, slot1)
			slot0.assertParamCount(slot1, 1, "readSOFOPU")

			return slot1.getParamValue(slot0, slot1[1])
		end,
		readSOFOPUString = function (slot0, slot1)
			slot0.assertParamCount(slot1, 1, "readSOFOPUString")

			return slot1.getParamValue(slot0, slot1[1], true)
		end,
		readInt = function (slot0, slot1)
			if slot0 == nil then
				return nil
			end

			slot0.assertParamCountRange(slot1, 2, 3, "readInt")

			slot2 = slot0.convertParamsValue(slot1)[3]
			slot3 = slot1[1]

			if slot1[2] == 1 then
				if slot2 ~= nil and slot2 == false then
					return slot0:readUInt8(slot3 + 1)
				end

				return slot0:readInt8(slot3 + 1)
			elseif slot4 == 2 then
				if slot2 ~= nil and slot2 == false then
					return slot0:readUInt16(slot3 + 1)
				end

				return slot0:readInt16(slot3 + 1)
			elseif slot4 == 3 then
				if slot2 ~= nil and slot2 == false then
					return slot0:readUInt24(slot3 + 1)
				end

				return slot0:readInt24(slot3 + 1)
			elseif slot4 == 4 then
				if slot2 ~= nil and slot2 == false then
					return slot0:readUInt32(slot3 + 1)
				end

				return slot0:readInt32(slot3 + 1)
			end

			error("Invalid parameters for readInt")
		end,
		rangeConversion = function (slot0, slot1)
			slot0.assertParamCount(slot1, 2, "rangeConversion")
			slot0.assertParamCount(slot2, 2, "rangeConversion[1]")
			slot0.assertParamCount(slot3, 2, "rangeConversion[2]")

			return slot1[2][1] + ((slot0 - slot1[1][1]) * (slot1[2][2] - slot1[2][1])) / (slot1[1][2] - slot1[1][1])
		end,
		writeInt = function (slot0, slot1)
			slot0.assertParamCount(slot1, 3, "writeInt")

			slot2 = slot1[1]
			slot4 = slot1[3]

			for slot8 = 1, slot1[2], 1 do
				slot0[slot2 + slot8] = bit.band(bit.rshift(slot4, (slot3 - slot8) * 8), 255)
			end

			return slot0
		end,
		operation = function (slot0, slot1)
			slot0.assertParamCount(slot1, 2, "operation")
			slot0.assertParamType(slot2, "number")
			slot0.assertParamType(slot3, "string")
			slot0.assertParamType(slot1[2], "number")

			if slot1[1] == "+" then
				return slot2 + slot4
			elseif slot3 == "-" then
				return slot2 - slot4
			elseif slot3 == "*" then
				return slot2 * slot4
			elseif slot3 == "/" then
				if slot4 == 0 then
					error("Can't divide by zero")
				end

				return math.floor(slot2 / slot4)
			else
				error("Unknown operation sign '" .. slot3 .. "'")
			end
		end
	},
	triggerFunctions = {
		refreshState = function (slot0, slot1, slot2, slot3)
			slot4 = {}
			slot5 = nil
			slot6 = 1

			for slot10 in ipairs(slot0) do
				if slot1[slot0[slot10]] == nil then
					error("Unknown state in refreshState trigger : " .. slot0[slot10])
				end

				if slot11.baseCommand == "readMP" or slot11.baseCommand == "readFP" then
					if slot5 == nil then
						slot5 = {}
					end

					if slot11.baseCommand == "readFP" then
						slot12 = slot0.convertParamsValue(slot11.params, slot2, slot3)

						if slot11.conversions ~= nil then
							slot12 = slot0.applyParamsConversions(slot12, slot11.conversions, slot2, slot3)
						end

						for slot16 in ipairs(slot12) do
							slot5[#slot5 + 1] = slot12[slot16]
						end
					end
				else
					slot16, slot17 = slot0.computeCommand(slot11.baseCommand, slot11.params, slot11.conversions, slot2, slot3)

					if slot0.isCommandAlreadyPresentInArray(slot4, slot12, slot13) == false then
						if slot13.type ~= nil and slot13.type == slot0.PREPARE_DATA_OBJECT then
							slot13.delay = 1
						end

						slot4[slot6] = slot12
						slot4[slot6 + 1] = slot13
						slot6 = slot6 + 2
					end
				end
			end

			if slot5 ~= nil then
				slot4[slot6], slot4[slot6 + 1] = slot0.computeCommand("readFP", slot5, {}, slot2, slot3)
			end

			return slot4
		end
	},
	assertParamCount = function (slot0, slot1, slot2)
		if #slot0 ~= slot1 then
			error("Invalid parameter count for " .. slot2 .. ". Current : " .. #slot0 .. ", Expected : " .. slot1)
		end
	end,
	assertParamType = function (slot0, slot1, slot2)
		if type(slot0) ~= slot1 then
			error("Invalid parameter type for " .. slot2 .. ". Current type: " .. slot3 .. ", Expected : " .. slot1)
		end
	end,
	assertParamCountRange = function (slot0, slot1, slot2, slot3)
		if slot2 < #slot0 or slot1 > #slot0 then
			error("Invalid parameter count range for " .. slot3 .. ". Current : " .. #slot0 .. ", Expected between : " .. slot1 .. " and " .. slot2)
		end
	end,
	isCommandAlreadyPresentInArray = function (slot0, slot1, slot2)
		if #slot0 < 1 then
			return false
		end

		for slot7 = 1, slot3 / 2, 1 do
			if slot0.equals(slot0[2 * slot7 - 1], slot1) and slot0.equals(slot0[2 * slot7], slot2) then
				return true
			end
		end

		return false
	end,
	runConfig = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		if slot2[slot0] == nil then
			error("Unknown command name : " .. slot0)
		end

		slot8 = slot0.aggregateConfig(slot3, slot4)

		for slot12 in ipairs(slot7) do
			if slot7[slot12].context == nil or slot0.isContextValid(slot13.context, slot1, slot8) then
				slot14 = slot0.computeCommands(slot13.commands, slot1, slot8, slot3, slot6)

				if slot13.trigger ~= nil then
					for slot19, slot20 in ipairs(slot15) do
						table.insert(slot14, slot20)
					end
				end

				return table.unpack(slot14)
			end
		end

		error("no valid context")
	end,
	computeCommands = function (slot0, slot1, slot2, slot3, slot4)
		slot5 = {}
		slot6 = 1

		for slot10 in ipairs(slot0) do
			slot5[slot6], slot5[slot6 + 1] = slot0.computeCommand(slot0[slot10].baseCommand, slot0[slot10].params, slot0[slot10].conversions, slot1, slot2, slot3, slot4)
			slot6 = slot6 + 2
		end

		return slot5
	end,
	computeTriggerCommand = function (slot0, slot1, slot2, slot3)
		if slot0.triggerFunctions[slot0.function] == nil then
			error("Unknown trigger function : " .. slot4)
		end

		return slot0.triggerFunctions[slot4](slot0.params, slot1, slot2, slot3)
	end,
	computeCommand = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		if slot0 == nil then
			error("Base command should not be null")
		elseif slot0.baseCommands[slot0] == nil then
			error("Unknown base command : " .. slot0)
		end

		slot7 = slot0.convertParamsValue(slot1, slot3, slot4)

		if slot2 ~= nil then
			slot7 = slot0.applyParamsConversions(slot7, slot2, slot3, slot4)
		end

		return slot0.baseCommands[slot0](slot7, slot5, slot6)
	end,
	convertParamsValue = function (slot0, slot1, slot2)
		if slot0 == nil then
			return {}
		end

		slot3 = {}

		for slot7 in ipairs(slot0) do
			slot3[slot7] = slot0.convertBooleanValue(slot0.convertHexadecimalValues(slot0.getInputValue(slot0[slot7], slot1, slot2)))
		end

		return slot3
	end,
	convertHexadecimalValues = function (slot0)
		if type(slot0) == "string" and string.match(slot0, "^0x([0-9A-F]+)$") then
			slot0 = tonumber(slot0:gsub("0x", ""), 16)
		elseif type(slot0) == "table" then
			for slot4 in ipairs(slot0) do
				slot0[slot4] = slot0.convertHexadecimalValues(slot0[slot4])
			end
		end

		return slot0
	end,
	convertBooleanValue = function (slot0)
		if type(slot0) == "string" then
			if slot0 == "true" then
				return true
			elseif slot0 == "false" then
				return false
			end
		end

		return slot0
	end,
	applyParamsConversions = function (slot0, slot1, slot2, slot3)
		for slot7 in ipairs(slot1) do
			if slot1[slot7].index ~= nil then
				if slot0[slot8.index + 1] == nil then
					error("Invalid parameter index : " .. slot8.index)
				end

				if slot0.conversions[slot8.function] == nil then
					error("Invalid conversion function : " .. slot8.function)
				end

				slot11 = slot0.convertParamsValue(slot8.params, slot2, slot3)

				if slot8.conversions ~= nil then
					slot11 = slot0.applyParamsConversions(slot11, slot8.conversions, slot2, slot3)
				end

				slot0[slot8.index + 1] = slot10(slot9, slot11)
			end
		end

		return slot0
	end,
	isContextValid = function (slot0, slot1, slot2)
		for slot6, slot7 in pairs(slot0) do
			if slot0.getInputValue(slot6, slot1, slot2) == slot6 then
				error("Invalid input value : " .. slot6 .. ". Expected state or APIParam")
			end

			for slot12 in ipairs(slot7) do
				if slot8 == slot7[slot12] then
					return true
				end
			end
		end

		return false
	end,
	getInputValue = function (slot0, slot1, slot2)
		if type(slot0) == "string" then
			if #slot0:stringSimpleSplit(":") == 2 and slot3[1] == "state" then
				return slot2[slot3[2]]
			elseif #slot3 == 2 and slot3[1] == "APIParam" then
				return slot1[slot3[2]]
			end
		end

		return slot0
	end,
	aggregateConfig = function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in pairs(slot1) do
			slot2[slot6] = slot0[tostring(slot7.stateId)]
			slot8 = true
			slot9 = nil

			if slot7.conversions ~= nil then
				slot8, slot9 = slot0.applyStateConversions(slot2[slot6], slot7.conversions)

				if slot10 then
					slot2[slot6] = slot9
				else
					if not slot2[slot0.CONVERSION_ERRORS] then
						slot2[slot0.CONVERSION_ERRORS] = {}
					end

					slot2[slot0.CONVERSION_ERRORS][slot6] = slot9
					slot2[slot6] = nil
				end
			end

			if slot8 and slot7.type == "int" then
				slot2[slot6] = tonumber(slot2[slot6])
			end
		end

		return slot2
	end,
	applyStateConversions = function (slot0, slot1)
		slot2 = true

		for slot6 in ipairs(slot1) do
			if slot1[slot6].index == nil then
				if slot0.conversions[slot7.function] == nil then
					return false, "Unknown conversion function : " .. tostring(slot7.function)
				end

				if pcall then
					slot2, slot0 = pcall(slot0.conversions[slot7.function], slot0, slot7.params)

					if not slot8 then
						return false, slot0
					end
				else
					slot0 = slot0.conversions[slot7.function](slot0, slot7.params)
				end
			end
		end

		return true, slot0
	end,
	mergeTables = function (slot0, slot1)
		for slot5, slot6 in pairs(slot1) do
			slot0[slot5] = slot6
		end

		return slot0
	end,
	advancedRefresh = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		slot9 = slot0.aggregateConfig(slot7, slot8)
		slot10 = {}
		slot11 = {}
		slot12 = {}
		slot13 = 1

		if slot0 == "custom" then
			if slot1 == nil or #slot1 == 0 then
				error("Expected at least 1 state to refresh")
			end

			for slot17, slot18 in pairs(slot8) do
				if slot1:contains(slot17) then
					slot10[slot17] = slot18
				end
			end
		end

		if #slot10 == 0 and slot0 ~= "custom" then
			slot10 = slot8
		end

		if slot0 == "advanced" or slot0 == "custom" then
			for slot17, slot18 in pairs(slot10) do
				slot19 = slot10[slot17]

				if slot18.refreshAll == true or slot0 == "custom" then
					if slot19.baseCommand == "readFP" then
						slot20 = slot0.convertParamsValue(slot19.params, {}, slot9)

						if slot19.conversions ~= nil then
							slot20 = slot0.applyParamsConversions(slot20, slot19.conversions, {}, slot9)
						end

						for slot24 in ipairs(slot20) do
							slot12[#slot12 + 1] = slot20[slot24]
						end
					elseif slot19.baseCommand ~= "readMP" then
						slot24, slot25 = slot0.computeCommand(slot19.baseCommand, slot19.params, slot19.conversions, {}, slot9, slot6)

						if slot0.isCommandAlreadyPresentInArray(slot11, slot20, slot21) == false then
							slot11[slot13] = slot20
							slot11[slot13 + 1] = slot21
							slot13 = slot13 + 2
						end
					end
				end
			end
		end

		slot11[slot13], slot11[slot13 + 1] = slot0.computeCommand("readFP", slot12, {}, {}, slot9)

		return table.unpack(slot11)
	end
}
