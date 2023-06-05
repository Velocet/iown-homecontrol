return {
	getOriginator = function (slot0)
		return bit.rshift(slot0, 6)
	end,
	getControllerOriginator = function (slot0)
		if bit.rshift(slot0, 6) < 3 then
			return bit.rshift(slot0, 6)
		else
			return bit.rshift(slot0, 4)
		end
	end,
	getSensing = function (slot0)
		return bit.band(bit.rshift(slot0, 3), 1) == 1
	end,
	getBattery = function (slot0)
		return bit.band(bit.rshift(slot0, 5), 1) == 1
	end,
	getControllerSensing = function (slot0)
		if bit.rshift(slot0, 6) < 3 then
			if bit.band(bit.rshift(slot0, 3), 1) == 1 then
				return "OK"
			else
				return "KO"
			end
		else
			return nil
		end
	end,
	getControllerBattery = function (slot0)
		if bit.rshift(slot0, 6) < 3 then
			if bit.band(bit.rshift(slot0, 5), 1) == 1 then
				return "OK"
			else
				return "KO"
			end
		else
			return nil
		end
	end,
	getOrder = function (slot0)
		return bit.band(slot0, 7)
	end,
	getControllerOrder = function (slot0)
		slot2 = bit.band(slot0, 15)

		if slot0:getControllerOriginator() == 0 then
			if slot2 == 0 then
				return "Common init code"
			else
				return "Init code with last adress deletion"
			end
		elseif slot1 == 1 then
			return "0000"
		elseif slot1 == 2 then
			if slot2 == 0 then
				return "off"
			elseif slot2 == 1 then
				return "onZ1"
			elseif slot2 == 2 then
				return "onZ2"
			elseif slot2 == 3 then
				return "onZ3"
			elseif slot2 == 4 then
				return "onZ1-2"
			elseif slot2 == 5 then
				return "onZ2-3"
			elseif slot2 == 6 then
				return "onZ1-3"
			elseif slot2 == 7 then
				return "onZ1-2-3"
			elseif slot2 == 8 then
				return "SOS"
			elseif slot2 == 9 then
				return "SOS (transmitter)"
			elseif slot2 == 10 then
				return "autowatch"
			elseif slot2 == 11 then
				return "unknown"
			elseif slot2 == 12 then
				return "offcode"
			elseif slot2 == 13 then
				return "offZ1"
			elseif slot2 == 14 then
				return "offZ2"
			elseif slot2 == 15 then
				return "offZ3"
			end
		elseif slot1 == 12 then
			if slot2 == 0 then
				return "access code 1 - stop"
			elseif slot2 == 1 then
				return "access code 1 - run"
			elseif slot2 == 2 then
				return "access code 2 - stop"
			elseif slot2 == 3 then
				return "access code 2 - run"
			end
		else
			return nil
		end
	end,
	getControllerBipAndSirenLevel = function (slot0)
		if slot0:getControllerOriginator() ~= 15 then
			return nil
		elseif bit.band(bit.rshift(slot0, 2), 1) == 0 then
			return "low"
		elseif slot2 == 1 then
			return "medium"
		elseif slot2 == 2 then
			return "high"
		else
			return "unaltered level"
		end
	end,
	getSirenEventType = function (slot0)
		if bit.rshift(bit.band(slot0, 192), 6) == 0 then
			return "buttonPushed"
		elseif slot1 == 1 then
			return "periodical"
		elseif slot1 == 2 then
			return "autoDetection"
		else
			return "unknown"
		end
	end,
	getSirenBatteryState = function (slot0)
		if bit.band(slot0, 32) == 0 then
			return "low"
		else
			return "normal"
		end
	end,
	getSirenASState = function (slot0)
		if bit.band(slot0, 16) == 0 then
			return "open"
		else
			return "closed"
		end
	end
}
