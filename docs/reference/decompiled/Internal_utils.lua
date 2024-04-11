return {
	checkAlarmName = function (slot0)
		if slot0:match("['\";%c%z\\]") then
			return error("Unsupported character")
		end

		return slot0
	end,
	fromRawAlarmMode = function (slot0)
		if slot0 == nil then
			return nil
		end

		if slot0 == 0 then
			return "off"
		elseif slot0 == 2147483648.0 then
			return "sos"
		elseif slot0 == 4294967295.0 then
			return "total"
		end

		slot1 = {}

		for slot5 = 0, 31, 1 do
			if bit.band(bit.rshift(slot0, slot5), 1) == 1 then
				table.insert(slot1, "zone" .. slot5 + 1)
			end
		end

		if #slot1 == 1 then
			return slot1[1]
		end

		return slot1
	end,
	toRawAlarmMode = function (slot0)
		if slot0 == "total" then
			return 4294967295.0
		elseif slot0 == "off" then
			return 0
		elseif slot0 == "partial1" then
			return 1
		elseif slot0 == "sos" then
			return 2147483648.0
		else
			return 2
		end
	end,
	fromRawTouchButton = function (slot0)
		if slot0 == "pressedEvent" then
			return "pressed"
		elseif slot0 == "stopEvent" then
			return "stop"
		else
			return nil
		end
	end,
	getRSSILevel = function (slot0)
		if slot0 == nil then
			return nil
		end

		if slot0 > -25 then
			return "excellent"
		elseif slot0 > -50 then
			return "good"
		elseif slot0 > -60 then
			return "normal"
		elseif slot0 > -70 then
			return "low"
		else
			return "verylow"
		end
	end,
	rssiSignalQuality = function (slot0)
		if slot0 == "unknown" then
			return nil
		end

		slot1, slot2 = slot0:match("(%d+)dBm < (.*)%%")
		slot3 = 0

		return ((0 - slot1 <= -100 and 0) or (slot1 >= -50 and 100) or 2 * (slot1 + 100)) - ((0 - slot1 <= -100 and 0) or (slot1 >= -50 and 100) or 2 * (slot1 + 100)) * slot2 / 100
	end,
	toRawUpdate = function ()
		return {
			force = false,
			download = true,
			reboot = true,
			target = {
				"system",
				"applications"
			}
		}
	end,
	toRawSirenStatus = function (slot0, slot1, slot2)
		if slot0 == "on" or slot0 == "off" then
			return slot0
		elseif slot0 == "cyclic" and (slot1 == nil or slot2 == nil) then
			return error("When using \"cyclic\", delays have to be defined")
		else
			return slot0 .. ";" .. slot1 .. ";" .. slot2
		end
	end,
	fromRawSirenStatus = function (slot0)
		if slot0 == "on" or slot0 == "off" then
			return slot0
		else
			return slot0:match("(.*);.*;.*")
		end
	end,
	toRawShortBip = function (slot0)
		return 10 .. ";" .. 500 .. ";" .. slot0
	end,
	toRawLongBip = function (slot0)
		return 110 .. ";" .. 500 .. ";" .. slot0
	end,
	toRawIncreasingFrequencyBip = function (slot0, slot1)
		return slot0 .. ";" .. slot1
	end,
	toRawBlinkModemLed = function (slot0, slot1)
		if slot1 == nil then
			return tostring(slot0)
		else
			return slot0 .. ";" .. slot1
		end
	end,
	fromRawIgnoreUnknownValue = function (slot0)
		if string.lower(slot0) == "unknown" then
			return overkiz.magic.IGNORE
		else
			return slot0
		end
	end,
	fromRawConfigButton = function (slot0)
		if slot0 == "simplePress" or slot0 == "doublePress" or slot0 == "triplePress" or slot0 == "longPress" or slot0 == "veryLongPress" then
			return slot0
		else
			return nil
		end
	end
}
