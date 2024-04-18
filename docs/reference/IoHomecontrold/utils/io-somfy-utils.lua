-- chunkname: @./gateway/io-somfy-utils.module

local FunctionUtils = {}

function FunctionUtils.getFormat(format)
	local formatTable = {
		[0] = "Number",
		"Measurement",
		"String",
		"ND"
	}

	return formatTable[format]
end

function FunctionUtils.getUnit(unit)
	local unitTable = {
		[0] = "Raw",
		"Meter (m)",
		"Speed (m/s)",
		"Angular distance (°)",
		"Angular speed (°/s)",
		"Percentage (%)",
		"Amps (A)",
		"Temperature (°K)",
		"Electrical energy (KWh)",
		"Volume flow (l/s)",
		"Relative gradient (% / s)",
		"Time (s)",
		"Vector coordinate ",
		"Lux (lx)",
		"Hectopascal (hPa)",
		"Watt (W)",
		"Power per square meter (W/m2)",
		"Volt (V)",
		"Frequency (Hz)",
		"Temperature (°C)",
		"Temperature (°F)",
		"Candela (cd)",
		"Joules (J)",
		"Kilogram (kg)",
		"Angle (rd)",
		"Force (N)",
		"Pascal (Pa)",
		nil,
		"Area (m2)",
		"Volume (m3)",
		"Torque (N.m)",
		"Resistance ( Ω / Ohm / R )"
	}
	local unitValue = unitTable[unit]

	if unitValue == nil then
		unitValue = unitTable[0]
	end

	return unitValue
end

function FunctionUtils.getParamSizeInformation(input, pointerPosition)
	local paramSizeOctet = input[pointerPosition]
	local size = {
		length = 0,
		lengthInfo = 1
	}

	if paramSizeOctet == nil then
		return size
	end

	if paramSizeOctet <= 127 then
		size.length = paramSizeOctet + 1
	else
		size.lengthInfo = size.lengthInfo + 1

		if input[pointerPosition + 1] == 0 then
			size.length = paramSizeOctet + 1
		else
			local dataSizeExtendShift = bit.lshift(input[pointerPosition + 1], 7)
			local dataSizeAnd = bit.band(paramSizeOctet, 127)

			size.length = bit.bor(dataSizeExtendShift, dataSizeAnd) + 1
		end
	end

	return size
end

function FunctionUtils.getParamData(inputData, format)
	local valueOffset = 1
	local remainingDataLength = #inputData
	local data = {
		unit = 0,
		scale = 1,
		additionalDescField = 0
	}

	if format == 1 and remainingDataLength > 0 then
		if remainingDataLength > 0 then
			local scaleByte = inputData[valueOffset]

			if scaleByte > 127 then
				data.scale = 10^-(128 - bit.band(inputData[valueOffset], 127))
			else
				data.scale = 10^inputData[valueOffset]
			end

			valueOffset = valueOffset + 1
			data.additionalDescField = data.additionalDescField + 1
			remainingDataLength = remainingDataLength - 1
		end

		if remainingDataLength > 0 then
			data.unit = inputData[valueOffset]
			valueOffset = valueOffset + 1
			data.additionalDescField = data.additionalDescField + 1
			remainingDataLength = remainingDataLength - 1
		end
	end

	if remainingDataLength == 0 then
		data.value = nil
	else
		data.value = inputData:sub(valueOffset, #inputData + 1)
	end

	return data
end

function FunctionUtils.getParamValue(input, subfield, isRawArrayValue, debug)
	if debug then
		print("**********************     New test       **************************")
	end

	if input == nil then
		return nil
	end

	local objectValue
	local pointerPosition = 1
	local stringEncoding = "iso-8859-1"

	while pointerPosition < #input do
		local paramIDObject = {
			ID = nill,
			size = {
				length = 0,
				lengthInfo = 1
			},
			format = {
				isArray = "false",
				nbArrayElt = 0,
				stringEncoding = "NA",
				sizeElt = 0,
				scale = 1,
				signed = "false",
				type = FunctionUtils.getFormat(3),
				unit = FunctionUtils.getUnit(0)
			}
		}

		paramIDObject.ID = input[pointerPosition]
		pointerPosition = pointerPosition + 1

		local format = 3

		if paramIDObject.ID <= 127 then
			paramIDObject.size = FunctionUtils.getParamSizeInformation(input, pointerPosition)
			paramIDObject.format.sizeElt = paramIDObject.size.length
		else
			format = bit.rshift(input[pointerPosition], 4)

			if format > 2 then
				format = 0
			end

			paramIDObject.format.type = FunctionUtils.getFormat(format)

			if format == 0 or format == 1 then
				if bit.band(input[pointerPosition], 8) == 8 then
					paramIDObject.format.signed = "true"
				end

				paramIDObject.format.sizeElt = bit.band(input[pointerPosition], 7) + 1
			else
				local stringEncodingByte = bit.band(bit.rshift(input[pointerPosition], 3), 1)

				if stringEncodingByte == 0 then
					paramIDObject.format.stringEncoding = "iso-8859-1"
				else
					paramIDObject.format.stringEncoding = "Latin-1"
				end
			end

			pointerPosition = pointerPosition + 1
			paramIDObject.size = FunctionUtils.getParamSizeInformation(input, pointerPosition)
		end

		pointerPosition = pointerPosition + paramIDObject.size.lengthInfo

		local dataByteArray = bytearray(0)

		if paramIDObject.size.length + pointerPosition - 1 <= #input then
			dataByteArray = bytearray(paramIDObject.size.length)

			for i = 0, paramIDObject.size.length - 1 do
				dataByteArray[i + 1] = input[pointerPosition + i]
			end
		end

		local data = FunctionUtils.getParamData(dataByteArray, format)

		paramIDObject.format.scale = data.scale
		paramIDObject.format.unit = FunctionUtils.getUnit(data.unit)

		if paramIDObject.format.type == "Number" or paramIDObject.format.type == "Measurement" then
			if paramIDObject.size.length - data.additionalDescField ~= paramIDObject.format.sizeElt then
				paramIDObject.format.isArray = "true"
			else
				paramIDObject.format.isArray = "false"
			end

			if paramIDObject.format.isArray == "true" then
				paramIDObject.format.nbArrayElt = (paramIDObject.size.length - data.additionalDescField) / paramIDObject.format.sizeElt
			end
		elseif isRawArrayValue then
			paramIDObject.format.isArray = "true"
		end

		local value

		if data.value ~= nil then
			if paramIDObject.format.type == "Number" or paramIDObject.format.type == "Measurement" then
				if paramIDObject.format.isArray == "true" then
					local dataArray = {}

					for i = 1, #data.value do
						dataArray[i] = data.value[i]
					end

					value = dataArray
				elseif paramIDObject.format.signed == "true" then
					if paramIDObject.size.length == 2 then
						if data.value:asint(true) > 32767 then
							value = -(32768 - bit.band(data.value:asint(true), 32767))
						else
							value = data.value:asint(true)
						end
					elseif paramIDObject.size.length == 4 then
						if data.value:asint(true) > 2147483647 then
							value = -(2147483648 - bit.band(data.value:asint(true), 2147483647))
						else
							value = data.value:asint(true)
						end
					else
						value = -data.value:asint(true)
					end
				else
					value = data.value:asint(true)
				end
			elseif paramIDObject.format.type == "String" then
				value = data.value:tostring(paramIDObject.format.stringEncoding)
			elseif isRawArrayValue then
				local dataArray = {}

				for i = 1, #data.value do
					dataArray[i] = data.value[i]
				end

				value = dataArray
			else
				value = data.value:asint(true)
			end
		end

		paramIDObject.value = value

		if debug then
			print("************ New Parameter ************")
			print("  Parameter:" .. paramIDObject.ID)
			print("  Data:")
			print("      Length: " .. paramIDObject.size.length)
			print("      LengthInfo: " .. paramIDObject.size.lengthInfo)
			print("  Format:")
			print("      Type: " .. paramIDObject.format.type)
			print("      Signed: " .. paramIDObject.format.signed)
			print("      SizeElement: " .. paramIDObject.format.sizeElt)
			print("      isArray: " .. paramIDObject.format.isArray)
			print("      nbArrayElt: " .. paramIDObject.format.nbArrayElt)
			print("      Scale: " .. paramIDObject.format.scale)
			print("      Unit: " .. paramIDObject.format.unit)
			print("      StringEncoding: " .. paramIDObject.format.stringEncoding)

			if paramIDObject.value == nil then
				print("  Value: unknown")
			elseif paramIDObject.format.isArray == "true" then
				print("  Value: ")
				print(paramIDObject.value)
			else
				print("  Value: " .. paramIDObject.value)
			end
		end

		if paramIDObject.ID == subfield then
			objectValue = paramIDObject.value

			break
		end

		pointerPosition = pointerPosition + paramIDObject.size.length
	end

	return objectValue
end

return FunctionUtils
