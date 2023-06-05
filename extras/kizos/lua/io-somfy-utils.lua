return {
	getFormat = function (slot0)
		return ({
			[0] = "Number",
			"Measurement",
			"String",
			"ND"
		})[slot0]
	end,
	getUnit = function (slot0)
		if ({
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
		})[slot0] == nil then
			slot2 = slot1[0]
		end

		return slot2
	end,
	getParamSizeInformation = function (slot0, slot1)
		slot3 = {
			length = 0,
			lengthInfo = 1
		}

		if slot0[slot1] == nil then
			return slot3
		end

		if slot2 <= 127 then
			slot3.length = slot2 + 1
		else
			slot3.lengthInfo = slot3.lengthInfo + 1

			if slot0[slot1 + 1] == 0 then
				slot3.length = slot2 + 1
			else
				slot3.length = bit.bor(bit.lshift(slot0[slot1 + 1], 7), bit.band(slot2, 127)) + 1
			end
		end

		return slot3
	end,
	getParamData = function (slot0, slot1)
		slot2 = 1
		slot3 = #slot0
		slot4 = {
			unit = 0,
			scale = 1,
			additionalDescField = 0
		}

		if slot1 == 1 and slot3 > 0 then
			if slot3 > 0 then
				if slot0[slot2] > 127 then
					slot4.scale = 10^(-(128 - bit.band(slot0[slot2], 127)))
				else
					slot4.scale = 10^slot0[slot2]
				end

				slot2 = slot2 + 1
				slot4.additionalDescField = slot4.additionalDescField + 1
				slot3 = slot3 - 1
			end

			if slot3 > 0 then
				slot4.unit = slot0[slot2]
				slot2 = slot2 + 1
				slot4.additionalDescField = slot4.additionalDescField + 1
				slot3 = slot3 - 1
			end
		end

		if slot3 == 0 then
			slot4.value = nil
		else
			slot4.value = slot0:sub(slot2, #slot0 + 1)
		end

		return slot4
	end,
	getParamValue = function (slot0, slot1, slot2, slot3)
		if slot3 then
			print("**********************     New test       **************************")
		end

		if slot0 == nil then
			return nil
		end

		slot4 = nil
		slot5 = 1
		slot6 = "iso-8859-1"

		while slot5 < #slot0 do
			slot5 = slot5 + 1
			slot8 = 3

			if ({
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
					type = slot0.getFormat(3),
					unit = slot0.getUnit(0)
				},
				ID = slot0[slot5]
			})["ID"] <= 127 then
				slot7.size = slot0:getParamSizeInformation(slot5)
				slot7.format.sizeElt = slot7.size.length
			else
				if bit.rshift(slot0[slot5], 4) > 2 then
					slot8 = 0
				end

				slot7.format.type = slot0.getFormat(slot8)

				if slot8 == 0 or slot8 == 1 then
					if bit.band(slot0[slot5], 8) == 8 then
						slot7.format.signed = "true"
					end

					slot7.format.sizeElt = bit.band(slot0[slot5], 7) + 1
				elseif bit.band(bit.rshift(slot0[slot5], 3), 1) == 0 then
					slot7.format.stringEncoding = "iso-8859-1"
				else
					slot7.format.stringEncoding = "Latin-1"
				end

				slot7.size = slot0:getParamSizeInformation(slot5 + 1)
			end

			slot9 = bytearray(0)

			if (slot7.size.length + slot5 + slot7.size.lengthInfo) - 1 <= #slot0 then
				slot9 = bytearray(slot7.size.length)

				for slot13 = 0, slot7.size.length - 1, 1 do
					slot9[slot13 + 1] = slot0[slot5 + slot13]
				end
			end

			slot7.format.scale = slot0.getParamData(slot9, slot8).scale
			slot7.format.unit = slot0.getUnit(slot0.getParamData(slot9, slot8).unit)

			if slot7.format.type == "Number" or slot7.format.type == "Measurement" then
				if slot7.size.length - slot10.additionalDescField ~= slot7.format.sizeElt then
					slot7.format.isArray = "true"
				else
					slot7.format.isArray = "false"
				end

				if slot7.format.isArray == "true" then
					slot7.format.nbArrayElt = (slot7.size.length - slot10.additionalDescField) / slot7.format.sizeElt
				end
			elseif slot2 then
				slot7.format.isArray = "true"
			end

			slot11 = nil

			if slot10.value ~= nil then
				if slot7.format.type == "Number" or slot7.format.type == "Measurement" then
					if slot7.format.isArray == "true" then
						slot12 = {}
						slot13 = slot10.value

						for slot17 = 0, slot7.format.nbArrayElt - 1, 1 do
							slot18 = slot17 * slot7.format.sizeElt + 1

							if slot7.format.sizeElt == 1 then
								slot12[#slot12 + 1] = slot13:readInt8(slot18) * slot7.format.scale
							elseif slot7.format.sizeElt == 2 then
								slot12[#slot12 + 1] = slot13:readInt16(slot18, true) * slot7.format.scale
							elseif slot7.format.sizeElt == 3 then
								slot12[#slot12 + 1] = slot13:readInt24(slot18, true) * slot7.format.scale
							elseif slot7.format.sizeElt == 4 then
								slot12[#slot12 + 1] = slot13:readInt32(slot18, true) * slot7.format.scale
							end
						end

						slot11 = slot12
					elseif slot7.format.signed == "true" then
						slot11 = slot0.computeSignedValue(slot10.value) * slot7.format.scale
					else
						slot11 = slot0.computeUnSignedValue(slot10.value) * slot7.format.scale
					end
				elseif slot7.format.type == "String" then
					slot11 = slot10.value:tostring(slot7.format.stringEncoding)
				elseif slot2 then
					slot12 = {}

					for slot16 = 1, #slot10.value, 1 do
						slot12[slot16] = slot10.value[slot16]
					end

					slot11 = slot12
				else
					slot11 = slot10.value:asint(true)
				end
			end

			slot7.value = slot11

			if slot3 then
				print("************ New Parameter ************")
				print("  Parameter:" .. slot7.ID)
				print("  Data:")
				print("      Length: " .. slot7.size.length)
				print("      LengthInfo: " .. slot7.size.lengthInfo)
				print("  Format:")
				print("      Type: " .. slot7.format.type)
				print("      Signed: " .. slot7.format.signed)
				print("      SizeElement: " .. slot7.format.sizeElt)
				print("      isArray: " .. slot7.format.isArray)
				print("      nbArrayElt: " .. slot7.format.nbArrayElt)
				print("      Scale: " .. slot7.format.scale)
				print("      Unit: " .. slot7.format.unit)
				print("      StringEncoding: " .. slot7.format.stringEncoding)

				if slot7.value == nil then
					print("  Value: unknown")
				elseif slot7.format.isArray == "true" then
					print("  Value: ")
					print(slot7.value)
				else
					print("  Value: " .. slot7.value)
				end
			end

			if slot7.ID == slot1 then
				slot4 = slot7.value

				break
			end

			slot5 = slot5 + slot7.size.length
		end

		return slot4
	end,
	computeSignedValue = function (slot0)
		if #slot0 == 1 then
			return slot0:readInt8(1)
		elseif #slot0 == 2 then
			return slot0:readInt16(1, true)
		elseif #slot0 == 3 then
			return slot0:readInt24(1, true)
		elseif #slot0 == 4 then
			return slot0:readInt32(1, true)
		end
	end,
	computeUnSignedValue = function (slot0)
		if #slot0 == 1 then
			return slot0:readUInt8(1)
		elseif #slot0 == 2 then
			return slot0:readUInt16(1, true)
		elseif #slot0 == 3 then
			return slot0:readUInt24(1, true)
		elseif #slot0 == 4 then
			return slot0:readUInt32(1, true)
		end
	end
}
