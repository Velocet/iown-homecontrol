-- chunkname: @./gateway/rtds-utils.module

local RTDSUtils = {}

function RTDSUtils.getOriginator(v)
	return bit.rshift(v, 6)
end

function RTDSUtils.getControllerOriginator(v)
	if bit.rshift(v, 6) < 3 then
		return bit.rshift(v, 6)
	else
		return bit.rshift(v, 4)
	end
end

function RTDSUtils.getSensing(v)
	return bit.band(bit.rshift(v, 3), 1) == 1
end

function RTDSUtils.getBattery(v)
	return bit.band(bit.rshift(v, 5), 1) == 1
end

function RTDSUtils.getControllerSensing(v)
	if bit.rshift(v, 6) < 3 then
		if bit.band(bit.rshift(v, 3), 1) == 1 then
			return "OK"
		else
			return "KO"
		end
	else
		return nil
	end
end

function RTDSUtils.getControllerBattery(v)
	if bit.rshift(v, 6) < 3 then
		if bit.band(bit.rshift(v, 5), 1) == 1 then
			return "OK"
		else
			return "KO"
		end
	else
		return nil
	end
end

function RTDSUtils.getOrder(v)
	return bit.band(v, 7)
end

function RTDSUtils.getControllerOrder(v)
	local originator = RTDSUtils.getControllerOriginator(v)
	local order = bit.band(v, 15)

	if originator == 0 then
		if order == 0 then
			return "Common init code"
		else
			return "Init code with last adress deletion"
		end
	elseif originator == 1 then
		return "0000"
	elseif originator == 2 then
		if order == 0 then
			return "off"
		elseif order == 1 then
			return "onZ1"
		elseif order == 2 then
			return "onZ2"
		elseif order == 3 then
			return "onZ3"
		elseif order == 4 then
			return "onZ1-2"
		elseif order == 5 then
			return "onZ2-3"
		elseif order == 6 then
			return "onZ1-3"
		elseif order == 7 then
			return "onZ1-2-3"
		elseif order == 8 then
			return "SOS"
		elseif order == 9 then
			return "SOS (transmitter)"
		elseif order == 10 then
			return "autowatch"
		elseif order == 11 then
			return "unknown"
		elseif order == 12 then
			return "offcode"
		elseif order == 13 then
			return "offZ1"
		elseif order == 14 then
			return "offZ2"
		elseif order == 15 then
			return "offZ3"
		end
	elseif originator == 12 then
		if order == 0 then
			return "access code 1 - stop"
		elseif order == 1 then
			return "access code 1 - run"
		elseif order == 2 then
			return "access code 2 - stop"
		elseif order == 3 then
			return "access code 2 - run"
		end
	else
		return nil
	end
end

function RTDSUtils.getControllerBipAndSirenLevel(v)
	local originator = RTDSUtils.getControllerOriginator(v)

	if originator ~= 15 then
		return nil
	else
		local level = bit.band(bit.rshift(v, 2), 1)

		if level == 0 then
			return "low"
		elseif level == 1 then
			return "medium"
		elseif level == 2 then
			return "high"
		else
			return "unaltered level"
		end
	end
end

function RTDSUtils.getSirenEventType(rawValue)
	local rawEventType = bit.rshift(bit.band(rawValue, 192), 6)

	if rawEventType == 0 then
		return "buttonPushed"
	elseif rawEventType == 1 then
		return "periodical"
	elseif rawEventType == 2 then
		return "autoDetection"
	else
		return "unknown"
	end
end

function RTDSUtils.getSirenBatteryState(rawValue)
	if bit.band(rawValue, 32) == 0 then
		return "low"
	else
		return "normal"
	end
end

function RTDSUtils.getSirenASState(rawValue)
	if bit.band(rawValue, 16) == 0 then
		return "open"
	else
		return "closed"
	end
end

return RTDSUtils
