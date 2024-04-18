-- chunkname: @./common_utils.module

local CommonUtils = {}

CommonUtils.E = {
	INVALID_FIELD_VALUE = "INVALID_FIELD_VALUE"
}
CommonUtils.BoolToNumber = {
	[true] = 1,
	[false] = 0
}
CommonUtils.NumberToBool = {
	[0] = false,
	true
}
CommonUtils.ZERO_CELSIUS_IN_KELVIN = 273.15

function CommonUtils.copyElements(sourceTable, destinationTable, position)
	if position == nil then
		position = 1
	end

	if destinationTable == nil or sourceTable == nil or type(position) ~= "number" or position < 1 then
		return nil
	end

	for i = 1, #sourceTable do
		destinationTable[i - 1 + position] = sourceTable[i]
	end

	return destinationTable
end

function CommonUtils.split(str, pattern)
	pattern = pattern or "[^%s]+"

	if pattern:len() == 0 then
		pattern = "[^%s]+"
	end

	local parts = {
		__index = table.insert
	}

	setmetatable(parts, parts)
	str:gsub(pattern, parts)
	setmetatable(parts, nil)

	parts.__index = nil

	return parts
end

function CommonUtils.concatList(...)
	local newList = {}

	for _, list in ipairs({
		...
	}) do
		for _, item in ipairs(list) do
			newList[#newList + 1] = item
		end
	end

	return newList
end

function CommonUtils.stringSimpleSplit(inputstr, separator)
	if type(inputstr) ~= "string" or type(separator) ~= "string" then
		return nil
	end

	if separator:len() == 0 then
		separator = "%s"
	end

	local result = {}

	for str in inputstr:gmatch("([^" .. separator .. "]+)") do
		result[#result + 1] = str
	end

	return result
end

function CommonUtils.splitWithSpecialCharacter(stringToSplit, separator, escapingCharacter)
	if type(stringToSplit) ~= "string" or type(separator) ~= "string" or type(escapingCharacter) ~= "string" then
		return nil
	end

	assert(#separator == 1, "separator should be a character")
	assert(#escapingCharacter == 1, "separator should be a character")

	local i = 1
	local lastIndex = 1
	local splittedString

	while i < #stringToSplit do
		if string.sub(stringToSplit, i, i) == escapingCharacter then
			i = i + 1
		elseif string.sub(stringToSplit, i, i) == separator then
			if splittedString == nil then
				splittedString = {}
			end

			splittedString[#splittedString + 1] = string.sub(stringToSplit, lastIndex, i - 1)
			lastIndex = i + 1
		end

		i = i + 1
	end

	if splittedString ~= nil then
		splittedString[#splittedString + 1] = string.sub(stringToSplit, lastIndex, i)

		return splittedString
	end

	return stringToSplit
end

function CommonUtils.round(num, idp)
	if num == nil then
		return nil
	end

	local mult = 10^(idp or 0)

	if num >= 0 then
		return math.floor(num * mult + 0.5) / mult
	else
		return math.ceil(num * mult - 0.5) / mult
	end
end

function CommonUtils.shallowCopy(t)
	if type(t) ~= "table" then
		return t
	end

	local t2 = {}

	for k, v in pairs(t) do
		t2[k] = v
	end

	return t2
end

function CommonUtils.deepCopy(t)
	if type(t) ~= "table" then
		return t
	end

	local t2 = {}

	for k, v in pairs(t) do
		t2[k] = CommonUtils.deepCopy(v)
	end

	return t2
end

function CommonUtils.scaleChange(value, xmin, xmax, f_xmin, f_xmax)
	if value == nil or type(value) ~= "number" or xmin == nil or type(xmin) ~= "number" or xmax == nil or type(xmax) ~= "number" or xmax <= xmin or value < xmin or xmax < value then
		return nil
	end

	if f_xmin == nil or type(f_xmin) ~= "number" or f_xmax == nil or type(f_xmax) ~= "number" then
		return nil
	end

	local slope = (f_xmax - f_xmin) / (xmax - xmin)
	local shift = f_xmin - slope * xmin

	return CommonUtils.round(slope * value + shift, 1)
end

function CommonUtils.assertByteValue(value, description)
	if value == nil or type(value) ~= "number" or value < 0 or value > 255 then
		if description ~= nil then
			error("Invalid " .. tostring(description) .. " value " .. tostring(value) .. " : should be a byte value")
		else
			error("Invalid value " .. tostring(value) .. " : should be a byte value")
		end
	end
end

function CommonUtils.removeLeadingValues(b, value)
	local beginIdx = 1

	if b ~= nil and beginIdx <= #b and b[beginIdx] == value then
		while beginIdx <= #b and b[beginIdx] == value do
			beginIdx = beginIdx + 1
		end

		if beginIdx > #b then
			return bytearray(0)
		end

		return b:sub(beginIdx, #b)
	end

	return b
end

function CommonUtils.removeTrailingValues(b, value)
	if b ~= nil and #b > 0 and b[#b] == value then
		local endIdx = #b

		while endIdx > 0 and b[endIdx] == value do
			endIdx = endIdx - 1
		end

		if endIdx <= 0 then
			return bytearray(0)
		end

		return b:sub(1, endIdx)
	end

	return b
end

function CommonUtils.rawTrim(strByteArray)
	strByteArray = CommonUtils.removeLeadingValues(strByteArray, 32)
	strByteArray = CommonUtils.removeTrailingValues(strByteArray, 32)

	return strByteArray
end

function CommonUtils.trim(str, encoding)
	if encoding == nil then
		encoding = "iso-8859-1"
	end

	local strByteArray = bytearray(str, encoding)

	strByteArray = CommonUtils.removeLeadingValues(strByteArray, 32)
	strByteArray = CommonUtils.removeTrailingValues(strByteArray, 32)

	return strByteArray:tostring(encoding)
end

function CommonUtils.equals(tbl1, tbl2)
	if type(tbl1) ~= "table" or type(tbl2) ~= "table" then
		return tbl1 == tbl2
	end

	if #tbl1 ~= #tbl2 then
		return false
	end

	for k, v in pairs(tbl1) do
		if type(v) == "table" then
			if tbl2[k] == nil or CommonUtils.equals(tbl2[k], v) == false then
				return false
			end
		elseif tbl2[k] ~= v then
			return false
		end
	end

	for k, v in pairs(tbl2) do
		if type(v) == "table" then
			if tbl1[k] == nil or CommonUtils.equals(tbl1[k], v) == false then
				return false
			end
		elseif tbl1[k] ~= v then
			return false
		end
	end

	return true
end

function CommonUtils.ToLuaString(t, varName, unsafe)
	varName = tostring(varName)

	local d = varName .. " = {};\n"

	for key, value in pairs(t) do
		if type(key) == "string" then
			if not unsafe then
				key = key:gsub("['\";%c%z\\]", "")
			end

			key = "'" .. key .. "'"
		end

		if type(value) == "table" then
			d = d .. CommonUtils.ToLuaString(value, varName .. "[" .. key .. "]", unsafe)
		elseif type(value) == "string" then
			if not unsafe then
				value = value:gsub("['\";%c%z\\]", ".")
			end

			d = d .. varName .. "[" .. key .. "] = '" .. value .. "';\n"
		elseif type(value) == "function" then
			-- block empty
		else
			d = d .. varName .. "[" .. key .. "] = " .. tostring(value) .. ";\n"
		end
	end

	return d
end

function CommonUtils.functionalException(errorCode, message)
	error("[ErrorCode]:" .. errorCode .. "|[Message]:" .. message)
end

function CommonUtils.urlEncode(str)
	if str then
		str = string.gsub(str, "\n", "\r\n")
		str = string.gsub(str, "([^%w %-%_%.%~])", function(c)
			return string.format("%%%02X", string.byte(c))
		end)
		str = string.gsub(str, " ", "+")
	end

	return str
end

function CommonUtils.urlDecode(str)
	str = string.gsub(str, "+", " ")
	str = string.gsub(str, "%%(%x%x)", function(h)
		return string.char(tonumber(h, 16))
	end)
	str = string.gsub(str, "\r\n", "\n")

	return str
end

function CommonUtils.writeSignedRawValue(value, numberOfBits)
	if type(numberOfBits) ~= "number" or numberOfBits <= 0 or numberOfBits > 32 then
		error("Write signed raw value : invalid number of bits " .. tostring(numberOfBits) .. ", should be > 0 and <= 32")
	end

	local maxValue = 2^(numberOfBits - 1) - 1
	local minValue = -maxValue - 1

	if maxValue < value or value < minValue then
		error("Write signed raw value : out of range error, trying to encode " .. tostring(value) .. " on " .. tostring(numberOfBits) .. " bits but supported range is [" .. minValue .. ";" .. maxValue .. "]")
	end

	local twoComplementValue = 0

	if value < 0 then
		twoComplementValue = -value + maxValue
	else
		twoComplementValue = value
	end

	return twoComplementValue
end

function CommonUtils.readSignedRawValue(rawValue, numberOfBits)
	if type(numberOfBits) ~= "number" or numberOfBits <= 0 or numberOfBits > 32 then
		error("Read signed raw value : invalid number of bits " .. tostring(numberOfBits) .. ", should be > 0 and <= 32")
	end

	local maxRange = 2^numberOfBits - 1

	if maxRange < rawValue then
		error("Read signed raw value : out of range raw value " .. rawValue .. " regarding " .. numberOfBits .. " bits, max supported value is " .. maxRange)
	end

	local value = rawValue

	if bit.band(rawValue, bit.lshift(1, numberOfBits - 1)) ~= 0 then
		value = bit.band(rawValue, 2^(numberOfBits - 1) - 1)
		value = -value
		value = value - 1
	end

	return value
end

function CommonUtils.parseDeviceURL(deviceURl)
	local lastSepIdx, anchorIdx, deviceAddress, protocolSepIdx, protocolType, gatewayId, subSystem
	local deviceURL = {}

	protocolSepIdx = string.find(deviceURl, "://")

	if protocolSepIdx == nil then
		error("invalid device url")
	else
		deviceURL.protocolType = string.sub(deviceURl, 0, protocolSepIdx - 1)
		lastSepIdx = string.find(deviceURl, "/", protocolSepIdx + 3)
		deviceURL.gatewayId = string.sub(deviceURl, protocolSepIdx + 3, lastSepIdx - 1)
		anchorIdx = string.find(deviceURl, "#", lastSepIdx + 1)

		if anchorIdx == nil then
			deviceURL.deviceAddress = string.sub(deviceURl, lastSepIdx + 1, anchorIdx)
			deviceURL.subSystem = 0
		else
			deviceURL.deviceAddress = string.sub(deviceURl, lastSepIdx + 1)
			deviceURL.subSystem = string.sub(deviceURl, anchorIdx)
		end
	end

	return deviceURL
end

function CommonUtils.numberToHexString(b)
	if b == nil then
		return nil
	end

	return string.format("0x%02X", b)
end

function CommonUtils.startsWith(inputString, startPattern)
	return string.sub(inputString, 1, string.len(startPattern)) == startPattern
end

function CommonUtils.endsWith(inputString, endPattern)
	return endPattern == "" or string.sub(inputString, -string.len(endPattern)) == endPattern
end

function CommonUtils.userDataToJsonString(barray)
	if barray == nil or type(barray) ~= "userdata" then
		return "{}"
	end

	local bstr = "{"

	for i = 1, #barray do
		local value = barray[i]

		if type(value) == "table" then
			bstr = bstr .. CommonUtils.ToLuaString(value, "", true)
		elseif type(value) == "userdata" then
			bstr = bstr .. CommonUtils.userDataToJsonString(value)
		elseif type(value) == "string" then
			bstr = bstr .. value
		elseif type(value) == "number" then
			bstr = bstr .. tostring(value)
		end

		if i < #barray then
			bstr = bstr .. ","
		end
	end

	bstr = bstr .. "}"

	return bstr
end

function CommonUtils.containsTableStringSeparateBySemicolon(tab, val)
	if tab == nil or #tab == 0 or val == nil then
		return false
	end

	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

function CommonUtils.convertFahrenheitToCelsius(fahrenheit)
	if fahrenheit == nil or type(fahrenheit) ~= "number" then
		error("Given value cannot be converted")
	end

	return CommonUtils.round((fahrenheit - 32) / 1.8, 2)
end

function CommonUtils.enumValueToEnumIndex(enum, valueToConvert)
	for idx, value in pairs(enum) do
		if value == valueToConvert then
			return idx
		end
	end

	return nil
end

function CommonUtils.mappingToStateValue(tab)
	return function(value)
		return tab[tonumber(value)]
	end
end

function CommonUtils.convertKelvinToCelsius(p1)
	return tonumber(p1) - CommonUtils.ZERO_CELSIUS_IN_KELVIN
end

function CommonUtils.objPathExtract(obj, path)
	if not path then
		return nil
	end

	if path == "" or path == "/" then
		return obj
	end

	local currentElement = obj

	for nextKey in string.gmatch(path .. "/", "[^/]+") do
		if currentElement and type(currentElement) == "table" then
			currentElement = currentElement[nextKey]
		else
			return nil
		end
	end

	return currentElement
end

function CommonUtils.objPathExtractTrigger(obj, path)
	if not path or path == "" or path == "/" then
		return nil
	end

	local extractedElement = CommonUtils.objPathExtract(obj, path)

	if extractedElement and type(extractedElement) ~= "table" then
		return extractedElement
	else
		return nil
	end
end

function CommonUtils.mathLog10(value)
	return math.log(value) / math.log(10)
end

function CommonUtils.mapLength(T)
	local count = 0

	for _ in pairs(T) do
		count = count + 1
	end

	return count
end

return CommonUtils
