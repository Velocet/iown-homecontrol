return {
	E = {
		INVALID_FIELD_VALUE = "INVALID_FIELD_VALUE"
	},
	BoolToNumber = {
		[true] = 1,
		[false] = 0
	},
	NumberToBool = {
		[0] = false,
		true
	},
	ZERO_CELSIUS_IN_KELVIN = 273.15,
	copyElements = function (slot0, slot1, slot2)
		if slot2 == nil then
			slot2 = 1
		end

		if slot1 == nil or slot0 == nil or type(slot2) ~= "number" or slot2 < 1 then
			return nil
		end

		for slot6 = 1, #slot0, 1 do
			slot1[slot6 - 1 + slot2] = slot0[slot6]
		end

		return slot1
	end,
	appendList = function (slot0, slot1)
		return slot0:copyElements(slot1, #slot1 + 1)
	end,
	split = function (slot0, slot1)
		if slot1 or "[^%s]+":len() == 0 then
			slot1 = "[^%s]+"
		end

		setmetatable(slot2, slot2)
		slot0:gsub(slot1, {
			__index = table.insert,
			__index = nil
		})
		setmetatable(, nil)

		return 
	end,
	concatList = function (...)
		slot0 = {}

		for slot4, slot5 in ipairs({
			...
		}) do
			for slot9, slot10 in ipairs(slot5) do
				slot0[#slot0 + 1] = slot10
			end
		end

		return slot0
	end,
	stringSimpleSplit = function (slot0, slot1)
		if type(slot0) ~= "string" or type(slot1) ~= "string" then
			return nil
		end

		if slot1:len() == 0 then
			slot1 = "%s"
		end

		slot2 = {}

		for slot6 in slot0:gmatch("([^" .. slot1 .. "]+)") do
			slot2[#slot2 + 1] = slot6
		end

		return slot2
	end,
	splitWithSpecialCharacter = function (slot0, slot1, slot2)
		if type(slot0) ~= "string" or type(slot1) ~= "string" or type(slot2) ~= "string" then
			return nil
		end

		assert(#slot1 == 1, "separator should be a character")
		assert(#slot2 == 1, "separator should be a character")

		slot3 = 1
		slot4 = 1
		slot5 = nil

		while slot3 < #slot0 do
			if string.sub(slot0, slot3, slot3) == slot2 then
				slot3 = slot3 + 1
			elseif string.sub(slot0, slot3, slot3) == slot1 then
				if slot5 == nil then
					slot5 = {}
				end

				slot5[#slot5 + 1] = string.sub(slot0, slot4, slot3 - 1)
				slot4 = slot3 + 1
			end

			slot3 = slot3 + 1
		end

		if slot5 ~= nil then
			slot5[#slot5 + 1] = string.sub(slot0, slot4, slot3)

			return slot5
		end

		return slot0
	end,
	round = function (slot0, slot1)
		if slot0 == nil then
			return nil
		end

		slot2 = slot1 or 0
		slot2 = 10^slot2

		if slot0 >= 0 then
			return math.floor(slot0 * slot2 + 0.5) / slot2
		else
			return math.ceil(slot0 * slot2 - 0.5) / slot2
		end
	end,
	shallowCopy = function (slot0)
		if type(slot0) ~= "table" then
			return slot0
		end

		slot1 = {}

		for slot5, slot6 in pairs(slot0) do
			slot1[slot5] = slot6
		end

		return slot1
	end,
	deepCopy = function (slot0)
		if type(slot0) ~= "table" then
			return slot0
		end

		slot1 = {}

		for slot5, slot6 in pairs(slot0) do
			slot1[slot5] = slot0.deepCopy(slot6)
		end

		return slot1
	end,
	scaleChange = function (slot0, slot1, slot2, slot3, slot4)
		if slot0 == nil or type(slot0) ~= "number" or slot1 == nil or type(slot1) ~= "number" or slot2 == nil or type(slot2) ~= "number" or slot2 <= slot1 or slot0 < slot1 or slot2 < slot0 then
			return nil
		end

		if slot3 == nil or type(slot3) ~= "number" or slot4 == nil or type(slot4) ~= "number" then
			return nil
		end

		return slot0.round((slot4 - slot3) / (slot2 - slot1) * slot0 + slot3 - (slot4 - slot3) / (slot2 - slot1) * slot1, 1)
	end,
	assertByteValue = function (slot0, slot1)
		if slot0 == nil or type(slot0) ~= "number" or slot0 < 0 or slot0 > 255 then
			if slot1 ~= nil then
				error("Invalid " .. tostring(slot1) .. " value " .. tostring(slot0) .. " : should be a byte value")
			else
				error("Invalid value " .. tostring(slot0) .. " : should be a byte value")
			end
		end
	end,
	removeLeadingValues = function (slot0, slot1)
		slot2 = 1

		if slot0 ~= nil and slot2 <= #slot0 and slot0[slot2] == slot1 then
			while slot2 <= #slot0 and slot0[slot2] == slot1 do
				slot2 = slot2 + 1
			end

			if slot2 > #slot0 then
				return bytearray(0)
			end

			return slot0:sub(slot2, #slot0)
		end

		return slot0
	end,
	removeTrailingValues = function (slot0, slot1)
		if slot0 ~= nil and #slot0 > 0 and slot0[#slot0] == slot1 then
			slot2 = #slot0

			while slot2 > 0 and slot0[slot2] == slot1 do
				slot2 = slot2 - 1
			end

			if slot2 <= 0 then
				return bytearray(0)
			end

			return slot0:sub(1, slot2)
		end

		return slot0
	end,
	rawTrim = function (slot0)
		return slot0.removeTrailingValues(slot0:removeLeadingValues(32), 32)
	end,
	trim = function (slot0, slot1)
		if slot1 == nil then
			slot1 = "iso-8859-1"
		end

		return slot0.removeTrailingValues(slot0.removeLeadingValues(bytearray(slot0, slot1), 32), 32):tostring(slot1)
	end,
	equals = function (slot0, slot1)
		if type(slot0) ~= "table" or type(slot1) ~= "table" then
			return slot0 == slot1
		end

		if #slot0 ~= #slot1 then
			return false
		end

		for slot5, slot6 in pairs(slot0) do
			if type(slot6) == "table" then
				if slot1[slot5] == nil or slot0.equals(slot1[slot5], slot6) == false then
					return false
				end
			elseif slot1[slot5] ~= slot6 then
				return false
			end
		end

		for slot5, slot6 in pairs(slot1) do
			if type(slot6) == "table" then
				if slot0[slot5] == nil or slot0.equals(slot0[slot5], slot6) == false then
					return false
				end
			elseif slot0[slot5] ~= slot6 then
				return false
			end
		end

		return true
	end,
	ToLuaString = function (slot0, slot1, slot2)
		slot3 = slot1 .. " = {};\n"

		for slot7, slot8 in pairs(slot0) do
			if type(slot7) == "string" then
				if not slot2 then
					slot7 = slot7:gsub("['\";%c%z\\]", "")
				end

				slot7 = "'" .. slot7 .. "'"
			end

			if type(slot8) == "table" then
				slot3 = slot3 .. slot0.ToLuaString(slot8, slot1 .. "[" .. slot7 .. "]", slot2)
			elseif type(slot8) == "string" then
				if not slot2 then
					slot8 = slot8:gsub("['\";%c%z\\]", ".")
				end

				slot3 = slot3 .. slot1 .. "[" .. slot7 .. "] = '" .. slot8 .. "';\n"
			elseif type(slot8) == "function" then
			else
				slot3 = slot3 .. slot1 .. "[" .. slot7 .. "] = " .. tostring(slot8) .. ";\n"
			end
		end

		return slot3
	end,
	functionalException = function (slot0, slot1)
		error("[ErrorCode]:" .. slot0 .. "|[Message]:" .. slot1)
	end,
	urlEncode = function (slot0)
		return slot0 and string.gsub(string.gsub(string.gsub(slot0, "\n", "\r\n"), "([^%w %-%_%.%~])", function (slot0)
			return string.format("%%%02X", string.byte(slot0))
		end), " ", "+")
	end,
	urlDecode = function (slot0)
		return string.gsub(string.gsub(string.gsub(slot0, "+", " "), "%%(%x%x)", function (slot0)
			return string.char(tonumber(slot0, 16))
		end), "\r\n", "\n")
	end,
	writeSignedRawValue = function (slot0, slot1)
		if type(slot0) ~= "number" then
			error("invalid input value : type = " .. type(slot0) .. ", should be a number")
		end

		if type(slot1) ~= "number" or slot1 < 2 or slot1 > 32 then
			error("invalid number of bits : type = " .. type(slot1) .. "value = " .. tostring(slot1) .. "should be a number >= 2 and <= 32")
		end

		slot3 = 2^(slot1 - 1) - 1

		if slot0 < -2^(slot1 - 1) or slot3 < slot0 then
			error("out of range error, trying to encode " .. tostring(value) .. " on " .. tostring(slot1) .. " bits but supported range is [" .. slot2 .. ";" .. slot3 .. "]")
		end

		if slot0 < 0 then
			return bit.band(bit.bnot(math.abs(slot0)) + 1, 2^slot1 - 1)
		end

		return slot0
	end,
	readSignedRawValue = function (slot0, slot1)
		if type(slot0) ~= "number" then
			error("invalid input value : type = " .. type(slot0) .. ", should be a number")
		end

		if type(slot1) ~= "number" or slot1 < 2 or slot1 > 32 then
			error("invalid number of bits : type = " .. type(slot1) .. "value = " .. tostring(slot1) .. " should be a number >= 2 and <= 32")
		end

		if 2^slot1 - 1 < bit.band(slot0, 2^slot1 - 1) then
			error("out of range input " .. slot0 .. " regarding " .. slot1 .. " bits, max supported value is " .. slot2)
		end

		if bit.rshift(slot0, slot1 - 1) == 1 then
			return -bit.band(bit.bnot(slot0) + 1, 2^slot1 - 1)
		end

		return slot0
	end,
	parseDeviceURL = function (slot0)
		slot1, slot2, slot3, slot4, slot5, slot6, slot7 = nil
		slot8 = {}

		if string.find(slot0, "://") == nil then
			error("invalid device url")
		else
			slot8.protocolType = string.sub(slot0, 0, slot4 - 1)
			slot8.gatewayId = string.sub(slot0, slot4 + 3, string.find(slot0, "/", slot4 + 3) - 1)

			if string.find(slot0, "#", string.find(slot0, "/", slot4 + 3) + 1) == nil then
				slot8.deviceAddress = string.sub(slot0, slot1 + 1, slot2)
				slot8.subSystem = 0
			else
				slot8.deviceAddress = string.sub(slot0, slot1 + 1)
				slot8.subSystem = string.sub(slot0, slot2)
			end
		end

		return slot8
	end,
	numberToHexString = function (slot0)
		if slot0 == nil then
			return nil
		end

		return string.format("0x%02X", slot0)
	end,
	startsWith = function (slot0, slot1)
		return string.sub(slot0, 1, string.len(slot1)) == slot1
	end,
	endsWith = function (slot0, slot1)
		return slot1 == "" or string.sub(slot0, -string.len(slot1)) == slot1
	end,
	userDataToJsonString = function (slot0)
		if slot0 == nil or type(slot0) ~= "userdata" then
			return "{}"
		end

		slot1 = "{"

		for slot5 = 1, #slot0, 1 do
			if type(slot0[slot5]) == "table" then
				slot1 = slot1 .. slot0.ToLuaString(slot6, "", true)
			elseif type(slot6) == "userdata" then
				slot1 = slot1 .. slot0.userDataToJsonString(slot6)
			elseif type(slot6) == "string" then
				slot1 = slot1 .. slot6
			elseif type(slot6) == "number" then
				slot1 = slot1 .. tostring(slot6)
			end

			if slot5 < #slot0 then
				slot1 = slot1 .. ","
			end
		end

		return slot1 .. "}"
	end,
	isArray = function (slot0)
		if slot0 ~= nil and #slot0 > 0 and slot0[0] == nil and slot0[1] ~= nil and slot0[#slot0] ~= nil and slot0[#slot0 + 1] == nil then
			slot2 = 0

			for slot6, slot7 in pairs(slot0) do
				slot2 = slot2 + 1

				if type(slot6) ~= "number" or slot6 > #slot0 then
					return false
				end
			end

			return slot2 == #slot0
		else
			return false
		end
	end,
	toJsonString = function (slot0)
		if slot0 == nil then
			return "null"
		end

		if type(slot0) == "string" then
			return slot0:toJsonStringString()
		elseif slot1 == "table" then
			if slot0:isArray() then
				return slot0:toJsonArrayString()
			else
				return slot0:toJsonObjectString()
			end
		else
			return tostring(slot0)
		end
	end,
	toJsonArrayString = function (slot0)
		if slot0 == nil then
			return "null"
		end

		slot1 = "["

		for slot5, slot6 in pairs(slot0) do
			if slot5 > 1 then
				slot1 = slot1 .. ","
			end

			slot1 = slot1 .. slot0.toJsonString(slot6)
		end

		return slot1 .. "]"
	end,
	toJsonObjectString = function (slot0)
		if slot0 == nil then
			return "null"
		end

		slot1 = "{"
		slot2 = 0

		for slot6, slot7 in pairs(slot0) do
			if slot2 + 1 > 1 then
				slot1 = slot1 .. ","
			end

			slot1 = slot1 .. slot0.toJsonStringString(slot6) .. ":" .. slot0.toJsonString(slot7)
		end

		return slot1 .. "}"
	end,
	toJsonStringString = function (slot0)
		if slot0 == nil then
			return "null"
		else
			return "\"" .. tostring(slot0):gsub("\\", "\\\\"):gsub("\"", "\\\"") .. "\""
		end
	end,
	contains = function (slot0, slot1)
		if slot0 == nil or #slot0 == 0 or slot1 == nil then
			return false
		end

		for slot5, slot6 in ipairs(slot0) do
			if slot6 == slot1 then
				return true
			end
		end

		return false
	end,
	convertFahrenheitToCelsius = function (slot0)
		if slot0 == nil or type(slot0) ~= "number" then
			error("Given value cannot be converted")
		end

		return slot0.round((slot0 - 32) / 1.8, 2)
	end,
	enumValueToEnumIndex = function (slot0, slot1)
		for slot5, slot6 in pairs(slot0) do
			if slot6 == slot1 then
				return slot5
			end
		end

		return nil
	end,
	mappingToStateValue = function (slot0)
		return function (slot0)
			return slot0[tonumber(slot0)]
		end
	end,
	convertKelvinToCelsius = function (slot0)
		return tonumber(slot0) - slot0.ZERO_CELSIUS_IN_KELVIN
	end,
	objPathExtract = function (slot0, slot1)
		if not slot1 then
			return nil
		end

		if slot1 == "" or slot1 == "/" then
			return slot0
		end

		slot2 = slot0

		for slot6 in string.gmatch(slot1 .. "/", "[^/]+") do
			if slot2 and type(slot2) == "table" then
				slot2 = slot2[slot6]
			else
				return nil
			end
		end

		return slot2
	end,
	objPathExtractTrigger = function (slot0, slot1)
		if not slot1 or slot1 == "" or slot1 == "/" then
			return nil
		end

		if slot0:objPathExtract(slot1) and type(slot2) ~= "table" then
			return slot2
		else
			return nil
		end
	end,
	mathLog10 = function (slot0)
		return math.log(slot0) / math.log(10)
	end,
	mapLength = function (slot0)
		slot1 = 0

		for slot5 in pairs(slot0) do
			slot1 = slot1 + 1
		end

		return slot1
	end,
	addToSet = function (slot0, slot1)
		slot0[slot1] = true
	end,
	removeFromSet = function (slot0, slot1)
		slot0[slot1] = nil
	end,
	setContains = function (slot0, slot1)
		return slot0[slot1] ~= nil
	end
}
