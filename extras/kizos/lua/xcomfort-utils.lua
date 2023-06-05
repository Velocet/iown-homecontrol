({
	EnumDataType = {},
	HRV_ERROR = {
		"HRV_ERROR_CONNECTION_LOST",
		"HRV_ERROR_VALVE_SLUGGISH",
		"HRV_ERROR_VALVE_RANGE_TOO_LARGE",
		nil,
		nil,
		nil,
		nil,
		"HRV_ERROR_VALVE_RANGE_TOO_SMALL",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"HRV_ERROR_BATTERY_EMPTY"
	},
	checkDataType = function (slot0, slot1)
		if slot1 == nil or slot0 == nil then
			return false
		end

		return slot1 == slot0
	end,
	getDataNumberValueAccordingToDataType = function (slot0, slot1)
		slot2 = 255
		slot3 = 65535
		slot4 = 4294967295.0

		if slot0 == nil or slot1 == nil then
			return nil
		end

		slot5 = nil

		if type(slot0) == "userdata" and #slot0 == 1 then
			slot5 = slot0[1]
		elseif type(slot0) == "number" then
			slot5 = slot0
		else
			error("Unsupported dataType " .. type(slot0))
		end

		if type(slot1) ~= "userdata" then
			error("Data should be a byte array")
		end

		if slot5 == slot0.EnumDataType.NO_DATA then
			return nil
		elseif slot5 == slot0.EnumDataType.PERCENT then
			slot0.checkMaxValueForDataType(slot1, "PERCENT", slot2)

			if slot1:asint(true) > 100 then
				return (100 * slot1:asint(true)) / slot2
			end

			return slot1:asint(true)
		elseif slot5 == slot0.EnumDataType.PERCENT_TO_64 then
			slot0.checkMaxValueForDataType(slot1, "PERCENT_TO_64", 100)

			return slot1:asint(true)
		elseif slot5 == slot0.EnumDataType.PERCENT_TO_FF then
			slot0.checkMaxValueForDataType(slot1, "PERCENT_TO_FF", slot2)

			return (100 * slot1:asint(true)) / slot2
		elseif slot5 == slot0.EnumDataType.UCHAR then
			slot0.checkMaxValueForDataType(slot1, "UCHAR", slot2)

			return slot1:tostring("utf-8")
		elseif slot5 == slot0.EnumDataType.INT16_1POINT then
			slot0.checkMaxValueForDataType(slot1, "INT16_1POINT", slot3)

			if slot1:asint(true) < 32768 then
				return slot1:asint(true) / 10
			else
				return (-65536 + slot1:asint(true)) / 10
			end
		elseif slot5 == slot0.EnumDataType.UINT16 then
			slot0.checkMaxValueForDataType(slot1, "UINT16", slot3)

			return slot1:asint(true)
		elseif slot5 == slot0.EnumDataType.UINT16_1POINT then
			slot0.checkMaxValueForDataType(slot1, "UINT16_1POINT", slot3)

			return slot1:asint(true) / 10
		elseif slot5 == slot0.EnumDataType.UINT16_2POINT then
			slot0.checkMaxValueForDataType(slot1, "UINT16_2POINT", slot3)

			return slot1:asint(true) / 100
		elseif slot5 == slot0.EnumDataType.UINT16_3POINT then
			slot0.checkMaxValueForDataType(slot1, "UINT16_3POINT", slot3)

			return slot1:asint(true) / 1000
		elseif slot5 == slot0.EnumDataType.FLOAT then
			if #slot1 < 4 or #slot1 > 8 then
				error("Unsupported value " .. slot1:tostring("hex") .. " for data type FLOAT")
			end

			return slot1:asfloat(true)
		elseif slot5 == slot0.EnumDataType.UINT32 then
			slot0.checkMaxValueForDataType(slot1, "UINT32", slot4)

			return slot1:asint(true)
		elseif slot5 == slot0.EnumDataType.UINT32_1POINT then
			slot0.checkMaxValueForDataType(slot1, "UINT32_1POINT", slot4)

			return slot1:asint(true) / 10
		elseif slot5 == slot0.EnumDataType.UINT32_2POINT then
			slot0.checkMaxValueForDataType(slot1, "UINT32_2POINT", slot4)

			return slot1:asint(true) / 100
		elseif slot5 == slot0.EnumDataType.UINT32_3POINT then
			slot0.checkMaxValueForDataType(slot1, "UINT32_3POINT", slot4)

			return slot1:asint(true) / 1000
		else
			return nil
		end
	end,
	getDataObjectValueAccordingToDataType = function (slot0, slot1)
		if slot0 == nil or slot1 == nil then
			return nil
		end

		slot2 = nil

		if type(slot0) == "userdata" and #slot0 == 1 then
			slot2 = slot0[1]
		elseif type(slot0) == "number" then
			slot2 = slot0
		else
			error("Unsupported dataType " .. type(slot0))
		end

		if type(slot1) ~= "userdata" then
			error("Data should be a byte array")
		end

		if slot2 == slot0.EnumDataType.RC_DATA then
			if #slot1 < 4 then
				error("Unsupported value " .. slot1:tostring("hex") .. " for data type RC_DATA")
			end

			return {
				temperature = slot1:sub(1, 2):asint(true) / 10,
				wheelAdjustment = slot1:sub(3, 4):asint(true)
			}
		elseif slot2 == slot0.EnumDataType.TIME then
			if #slot1 < 4 then
				error("Unsupported value " .. slot1:tostring("hex") .. " for data type TIME")
			end

			return {
				hours = slot1[1],
				minutes = slot1[2],
				seconds = slot1[3]
			}
		elseif slot2 == slot0.EnumDataType.DATE then
			if #slot1 < 4 then
				error("Unsupported value " .. slot1:tostring("hex") .. " for data type DATE")
			end

			return {
				dayOfMonth = slot1[1],
				dayOfWeek = bit.rshift(slot1[2], 4),
				month = bit.band(slot1[2], 15),
				year = slot1[3] * 100 + slot1[4]
			}
		elseif slot2 == slot0.EnumDataType.HRV_OUT then
			if #slot1 < 4 then
				error("Unsupported value " .. slot1:tostring("hex") .. " for data type HRV_OUT")
			end

			slot3 = {}
			slot4 = {}

			if bit.band(slot1[1], 1) == 1 then
				table.insert(slot4, slot0.HRV_ERROR[1])
			end

			if bit.band(slot1[1], 2) == 2 then
				table.insert(slot4, slot0.HRV_ERROR[2])
			end

			if bit.band(slot1[1], 4) == 4 then
				table.insert(slot4, slot0.HRV_ERROR[4])
			end

			if bit.band(slot1[1], 8) == 8 then
				table.insert(slot4, slot0.HRV_ERROR[8])
			end

			if bit.band(slot1[1], 16) == 16 then
				table.insert(slot4, slot0.HRV_ERROR[16])
			end

			if #slot4 > 0 then
				slot3.errorStatus = slot4
			end

			slot3.valvePosition = slot1[2]
			slot3.requestIndex = bit.rshift(bit.band(slot1[3], 240), 4)
			slot3.temperature = (bit.lshift(bit.band(slot1[3], 15), 8) + slot1[4]) / 10

			return slot3
		else
			return nil
		end
	end,
	checkMaxValueForDataType = function (slot0, slot1, slot2)
		if slot2 < slot0:asint(true) then
			error("Unsupported value " .. slot0:tostring("hex") .. " for data type " .. slot1)
		end
	end,
	getTooColdWarm = function (slot0)
		slot2 = nil

		if slot0:getDataType() == slot0.EnumDataType.RC_DATA then
			if #slot0 < 7 then
				return nil
			end

			slot2 = slot0[7]
		elseif slot0.EnumDataType.INT16_1POINT then
			if #slot0 < 5 then
				return nil
			end

			slot2 = slot0[5]
		end

		if slot2 == 0 then
			return "tooCold"
		elseif slot2 == 1 then
			return "tooWarm"
		end

		return nil
	end,
	getRSSILevel = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 1 then
			if slot0[1] <= 67 then
				return "good"
			elseif slot0[1] <= 75 then
				return "normal"
			elseif slot0[1] <= 90 then
				return "low"
			elseif slot0[1] <= 120 then
				return "verylow"
			end
		end

		return nil
	end,
	getBatteryLevel = function (slot0)
		if type(slot0) == "userdata" and #slot0 == 1 then
			if slot0[1] == 1 or slot0[1] == 33 then
				return "verylow"
			elseif slot0[1] == 2 or slot0[1] == 34 then
				return "verylow"
			elseif slot0[1] == 3 or slot0[1] == 35 then
				return "low"
			elseif slot0[1] == 4 or slot0[1] == 36 then
				return "normal"
			elseif slot0[1] == 5 or slot0[1] == 37 then
				return "full"
			end
		end

		return nil
	end,
	getDataType = function (slot0)
		if type(slot0) == "userdata" and #slot0 >= 1 then
			return slot0[1]
		end

		return nil
	end,
	getShortInfo = function (slot0)
		if type(slot0) == "userdata" and #slot0 >= 2 then
			return slot0[2]
		end

		return nil
	end,
	getData = function (slot0)
		if slot0:getDataType() == nil or type(slot0) ~= "userdata" or #slot0 < 3 then
			return nil
		end

		if slot1 == slot0.EnumDataType.PERCENT then
			return slot0:sub(3, 3)
		elseif slot1 == slot0.EnumDataType.PERCENT_TO_64 then
			return slot0:sub(3, 3)
		elseif slot1 == slot0.EnumDataType.PERCENT_TO_FF then
			return slot0:sub(3, 3)
		elseif slot1 == slot0.EnumDataType.INT16_1POINT then
			return slot0:sub(3, 4)
		elseif slot1 == slot0.EnumDataType.UINT16 then
			return slot0:sub(3, 4)
		elseif slot1 == slot0.EnumDataType.UINT16_1POINT then
			return slot0:sub(3, 4)
		elseif slot1 == slot0.EnumDataType.UINT16_2POINT then
			return slot0:sub(3, 4)
		elseif slot1 == slot0.EnumDataType.UINT16_3POINT then
			return slot0:sub(3, 4)
		elseif slot1 == slot0.EnumDataType.FLOAT then
			return slot0:sub(3, 6)
		elseif slot1 == slot0.EnumDataType.UINT32 then
			return slot0:sub(3, 6)
		elseif slot1 == slot0.EnumDataType.UINT32_1POINT then
			return slot0:sub(3, 6)
		elseif slot1 == slot0.EnumDataType.UINT32_2POINT then
			return slot0:sub(3, 6)
		elseif slot1 == slot0.EnumDataType.UINT32_3POINT then
			return slot0:sub(3, 6)
		else
			return slot0:sub(3, #slot0)
		end
	end,
	getUpDownValueFromOnOffState = function (slot0)
		if type(slot0) == "string" then
			if slot0 == "on" then
				return "up"
			elseif slot0 == "off" then
				return "down"
			end
		end

		return nil
	end,
	getOnOffFromStatusShortInfo = function (slot0)
		if slot0 == 0 then
			return "off"
		elseif slot0 == 1 then
			return "on"
		end

		return nil
	end,
	setOnOff = function (slot0)
		slot1 = bytearray(1)

		if type(slot0) == "string" then
			if slot0 == "on" then
				slot1[1] = 1
			elseif slot0 == "off" then
				slot1[1] = 0
			else
				error("Parameter " .. slot0 .. " should be a 'on' or 'off'.")
			end

			return slot1
		else
			error("Parameter " .. slot0 .. " should be a string.")
		end

		return nil
	end,
	getOnOffFromDimmingValue = function (slot0)
		if slot0 == 0 then
			return "off"
		end

		return "on"
	end,
	setDimmerIntensity = function (slot0)
		if slot0 > 100 then
			error("Parameter " .. slot0 .. " cannot be higher than 100")
		end

		return bytearray({
			64,
			slot0
		})
	end,
	getThermostatOffsetValue = function (slot0)
		if slot0 ~= nil and type(slot0) == "number" then
			if slot0 < 32768 then
				return slot0 / 10
			else
				return (-65536 + slot0) / 10
			end
		end

		return nil
	end,
	getRCDataWheelOffset = function (slot0)
		if slot0.checkDataType(slot0:getDataType(), slot0.EnumDataType.RC_DATA) then
			return slot0.getDataObjectValueAccordingToDataType(slot0:getDataType(), slot0:getData()).wheelAdjustment
		else
			return nil
		end
	end,
	getRCDataTemperature = function (slot0)
		if slot0.checkDataType(slot0:getDataType(), slot0.EnumDataType.RC_DATA) then
			return slot0.getDataObjectValueAccordingToDataType(slot0:getDataType(), slot0:getData()).temperature
		else
			return nil
		end
	end,
	getCurrentTemperatureSetpoint = function (slot0)
		if type(slot0) == "userdata" and #slot0 > 1 then
			return (slot0[1] * 256 + slot0[2]) / 10
		else
			return nil
		end
	end,
	getExternalReferenceTemperature = function (slot0)
		if slot0 ~= nil and type(slot0) == "table" then
			return slot0.value
		else
			return nil
		end
	end,
	setExternalReferenceTemperature = function (slot0)
		return "{\"value\":" .. tostring(slot0) .. ", \"timestamp\":" .. math.floor(os.time()) .. "}"
	end,
	getHRVTemperature = function (slot0)
		if slot0.checkDataType(slot0:getDataType(), slot0.EnumDataType.HRV_OUT) then
			return slot0.getDataObjectValueAccordingToDataType(slot0:getDataType(), slot0:getData()).temperature
		else
			return nil
		end
	end,
	getHRVValvePosition = function (slot0)
		if slot0.checkDataType(slot0:getDataType(), slot0.EnumDataType.HRV_OUT) then
			return slot0.getDataObjectValueAccordingToDataType(slot0:getDataType(), slot0:getData()).valvePosition
		else
			return nil
		end
	end,
	getHRVErrors = function (slot0)
		if slot0.checkDataType(slot0:getDataType(), slot0.EnumDataType.HRV_OUT) then
			return slot0.getDataObjectValueAccordingToDataType(slot0:getDataType(), slot0:getData()).errorStatus
		else
			return nil
		end
	end,
	toRawDewPoint = function (slot0)
		if type(slot0) ~= "string" then
			error("Parameter " .. tostring(slot0) .. " should be a string.")
		end

		if slot0 == "on" then
			return bytearray({
				1
			})
		elseif slot0 == "off" then
			return bytearray({
				0
			})
		else
			error("Parameter " .. slot0 .. " should be a 'on' or 'off'.")
		end
	end,
	toRawThermalConfiguration = function (slot0)
		if slot0 == "heating" then
			return bytearray({
				0
			})
		elseif slot0 == "cooling" then
			return bytearray({
				1
			})
		else
			error("Invalid input (mode) value : '" .. slot0 .. "', The supported values are : {heating|cooling}.")
		end
	end,
	toRawTargetTemperatureWithMode = function (slot0, slot1)
		bytearray(3):writeInt16(1, slot0 * 10)

		if slot1 == "frostprotection" then
			slot2[3] = 1
		elseif slot1 == "office" then
			slot2[3] = 2
		elseif slot1 == "comfort" then
			slot2[3] = 3
		elseif slot1 == "eco" then
			slot2[3] = 4
		elseif slot1 == "off" then
			slot2[4] = 5
		else
			error("Invalid input (mode) value : '" .. slot1 .. "', The supported values are : {comfort|eco|off|frostprotection|office}.")
		end

		return slot2
	end,
	toRawCurrentExternalReferenceTemperature = function (slot0)
		slot1 = bytearray(2)

		slot1:writeInt16(1, slot0 * 10)

		return slot1
	end,
	toFaultState = function (slot0)
		if slot0 == "on" then
			return "fault"
		elseif slot0 == "off" then
			return "noFault"
		else
			return nil
		end
	end,
	getNewShortInfo = function (slot0)
		if type(slot0) == "userdata" and #slot0 >= 9 then
			if slot0[7] == 74 then
				return bit.rshift(bit.band(slot0[9], 240), 4)
			elseif slot0[7] == 77 then
				return slot0[9]
			end
		end

		return nil
	end,
	getSerialNumber = function (slot0)
		if type(slot0) == "userdata" and #slot0 >= 3 then
			return slot0:readInt32(3, false)
		end

		return nil
	end,
	getDeviceType = function (slot0)
		if type(slot0) == "userdata" and #slot0 >= 7 then
			return slot0[7]
		end

		return nil
	end,
	getVariant = function (slot0)
		if type(slot0) == "userdata" and #slot0 >= 8 then
			return slot0[8]
		end

		return nil
	end,
	getBinaryInput1 = function (slot0)
		if type(slot0) == "userdata" then
			if slot0[7] == 74 and #slot0 >= 9 then
				return bit.band(slot0[9], 15)
			elseif slot0[7] == 77 and #slot0 >= 11 then
				return bit.band(slot0[11], 15)
			end
		end

		return nil
	end,
	getBinaryInput2 = function (slot0)
		if type(slot0) == "userdata" then
			if slot0[7] == 74 then
				return overkiz.magic.IGNORE
			elseif slot0[7] == 77 and #slot0 >= 11 then
				return bit.rshift(bit.band(slot0[11], 240), 4)
			end
		end

		return nil
	end,
	getDeviceInternalTemperature = function (slot0)
		if type(slot0) == "userdata" then
			if slot0[7] == 74 and #slot0 >= 10 then
				return slot0[10]
			elseif slot0[7] == 77 and #slot0 >= 12 then
				return slot0[12]
			end
		end

		return nil
	end,
	getActualPower = function (slot0)
		if type(slot0) == "userdata" then
			if slot0[7] == 74 and #slot0 >= 11 then
				return slot0:readInt8(11, false)
			elseif slot0[7] == 77 and #slot0 >= 13 then
				return slot0:readInt8(13, false)
			end
		end

		return nil
	end,
	getOnOffStatusFromNewShortInfo = function (slot0)
		if slot0 == 1 then
			return "off"
		elseif slot0 == 2 then
			return "on"
		end

		return nil
	end,
	toRockerSwitchx1State = function (slot0)
		if slot0 == "on" then
			return "A0"
		elseif slot0 == "off" then
			return "A1"
		end

		return nil
	end,
	getTooColdTooWarmFromOnOffState = function (slot0)
		if type(slot0) == "string" then
			if slot0 == "on" then
				return "tooCold"
			elseif slot0 == "off" then
				return "tooWarm"
			end
		end

		return nil
	end,
	getHumidityLevelFromOnOffState = function (slot0)
		if type(slot0) == "string" then
			if slot0 == "on" then
				return "low"
			elseif slot0 == "off" then
				return "high"
			end
		end
	end,
	getLeftRightValueFromOnOffState = function (slot0)
		if type(slot0) == "string" then
			if slot0 == "on" then
				return "left"
			elseif slot0 == "off" then
				return "right"
			end
		end

		return nil
	end
})["EnumDataType"].NO_DATA = 0
()["EnumDataType"].PERCENT = 1
()["EnumDataType"].PERCENT_TO_64 = 256
()["EnumDataType"].PERCENT_TO_FF = 257
()["EnumDataType"].UCHAR = 2
()["EnumDataType"].MEMORY = 6
()["EnumDataType"].INT16_1POINT = 3
()["EnumDataType"].UINT16 = 13
()["EnumDataType"].UINT16_1POINT = 33
()["EnumDataType"].UINT16_2POINT = 34
()["EnumDataType"].UINT16_3POINT = 35
()["EnumDataType"].FLOAT = 4
()["EnumDataType"].UINT32 = 14
()["EnumDataType"].UINT32_1POINT = 15
()["EnumDataType"].UINT32_2POINT = 16
()["EnumDataType"].UINT32_3POINT = 17
()["EnumDataType"].RC_DATA = 23
()["EnumDataType"].TIME = 30
()["EnumDataType"].DATE = 31
()["EnumDataType"].HRV_OUT = 55
()["EnumDataType"].NEWSTATUS = 57

return 
