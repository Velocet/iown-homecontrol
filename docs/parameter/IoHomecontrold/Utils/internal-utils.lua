-- chunkname: @./gateway/Internal_utils.module

local InternalUtils = {}

function InternalUtils.checkAlarmName(v)
	local patt = "['\";%c%z\\]"

	if v:match(patt) then
		return error("Unsupported character")
	end

	return v
end

function InternalUtils.fromRawAlarmMode(v)
	if v == nil then
		return nil
	end

	if v == 0 then
		return "off"
	elseif v == 2147483648 then
		return "sos"
	elseif v == 4294967295 then
		return "total"
	end

	local zones = {}

	for i = 0, 31 do
		if bit.band(bit.rshift(v, i), 1) == 1 then
			table.insert(zones, "zone" .. i + 1)
		end
	end

	if #zones == 1 then
		return zones[1]
	end

	return zones
end

function InternalUtils.toRawAlarmMode(v)
	if v == "total" then
		return 4294967295
	elseif v == "off" then
		return 0
	elseif v == "partial1" then
		return 1
	elseif v == "sos" then
		return 2147483648
	else
		return 2
	end
end

function InternalUtils.fromRawTouchButton(p)
	if p == "pressedEvent" then
		return "pressed"
	elseif p == "stopEvent" then
		return "stop"
	else
		return nil
	end
end

function InternalUtils.getRSSILevel(v)
	if v == nil then
		return nil
	end

	if v > -25 then
		return "excellent"
	elseif v > -50 then
		return "good"
	elseif v > -60 then
		return "normal"
	elseif v > -70 then
		return "low"
	else
		return "verylow"
	end
end

function InternalUtils.rssiSignalQuality(v)
	if v == "unknown" then
		return nil
	end

	local dBm, ber = v:match("(%d+)dBm < (.*)%%")

	dBm = 0 - dBm

	local rssiquality = 0

	rssiquality = dBm <= -100 and 0 or dBm >= -50 and 100 or 2 * (dBm + 100)

	local quality = rssiquality - rssiquality * (ber / 100)

	return quality
end

function InternalUtils.toRawUpdate()
	return {
		force = false,
		download = true,
		reboot = true,
		target = {
			"system",
			"applications"
		}
	}
end

function InternalUtils.toRawSirenStatus(p1, p2, p3)
	if p1 == "on" or p1 == "off" then
		return p1
	elseif p1 == "cyclic" and (p2 == nil or p3 == nil) then
		return error("When using \"cyclic\", delays have to be defined")
	else
		return p1 .. ";" .. p2 .. ";" .. p3
	end
end

function InternalUtils.fromRawSirenStatus(p1)
	if p1 == "on" or p1 == "off" then
		return p1
	else
		return p1:match("(.*);.*;.*")
	end
end

function InternalUtils.toRawShortBip(p1)
	return 10 .. ";" .. 500 .. ";" .. p1
end

function InternalUtils.toRawLongBip(p1)
	return 110 .. ";" .. 500 .. ";" .. p1
end

function InternalUtils.toRawIncreasingFrequencyBip(p1, p2)
	return p1 .. ";" .. p2
end

function InternalUtils.toRawBlinkModemLed(p1, p2)
	if p2 == nil then
		return tostring(p1)
	else
		return p1 .. ";" .. p2
	end
end

function InternalUtils.fromRawIgnoreUnknownValue(p1)
	if string.lower(p1) == "unknown" then
		return overkiz.magic.IGNORE
	else
		return p1
	end
end

function InternalUtils.fromRawConfigButton(p)
	if p == "simplePress" or p == "doublePress" or p == "triplePress" or p == "longPress" or p == "veryLongPress" then
		return p
	else
		return nil
	end
end

return InternalUtils
