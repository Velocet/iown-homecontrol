local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_1 = require("Overkiz.Tracker")
local var_0_2 = require("Overkiz.Time")
local var_0_3 = require("Overkiz.Timer")
local var_0_4 = require("Overkiz.OOP.Class")
local var_0_5 = require("tableshape").types
local var_0_6 = var_0_4()
local var_0_7 = 2
local var_0_8 = 8
local var_0_9 = 700000000
local var_0_10 = {
	longPressTime = var_0_7,
	veryLongPressTime = var_0_8,
	multipleButtonPressInterval = var_0_9
}
local var_0_11 = var_0_5.shape({
	longPressTime = var_0_5.number,
	veryLongPressTime = var_0_5.number,
	multipleButtonPressInterval = var_0_5.number
})

function var_0_6.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._button = arg_1_1
	arg_1_0._eventCallback = arg_1_2
	arg_1_0._buttonInfo = {
		count = 0,
		time = 0,
		status = "unknown"
	}
	arg_1_0._timeout = nil

	local var_1_0, var_1_1 = var_0_11:check_value(arg_1_3)

	if var_1_0 then
		arg_1_0._config = arg_1_3
	else
		if arg_1_3 and var_1_1 then
			var_0_0:info("[buttonHandler] wrong configuration format: " .. var_1_1)
		end

		var_0_0:debug("[buttonHandler] use defaut configuration")

		arg_1_0._config = var_0_10
	end
end

function var_0_6.start(arg_2_0)
	var_0_1.add(arg_2_0._button, arg_2_0)
end

function var_0_6.stop(arg_3_0)
	var_0_1.remove(arg_3_0._button, arg_3_0)

	if arg_3_0._timeout then
		arg_3_0._timeout:cancel()
	end
end

function var_0_6.modified(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if arg_4_2 ~= "status" then
		return
	end

	local var_4_0 = arg_4_0._button.time.microSeconds + arg_4_0._button.time.seconds * 1000000

	if arg_4_3 == 1 then
		if arg_4_0._buttonInfo.status ~= "pressed" then
			var_0_0:debug("button pressed")

			arg_4_0._buttonInfo.status = "pressed"
			arg_4_0._buttonInfo.time = var_4_0

			local function var_4_1()
				arg_4_0._eventCallback("longHold")

				arg_4_0._timeout = var_0_3.Timeout(var_0_2.Elapsed(arg_4_0._config.veryLongPressTime - arg_4_0._config.longPressTime, 0), function()
					arg_4_0._eventCallback("veryLongHold")

					return false
				end)

				return false
			end

			if arg_4_0._timeout then
				arg_4_0._timeout:cancel()
			end

			arg_4_0._timeout = var_0_3.Timeout(var_0_2.Elapsed(arg_4_0._config.longPressTime, 0), var_4_1)
		end
	elseif arg_4_3 == 0 then
		var_0_0:debug("button released")

		if arg_4_0._buttonInfo.status ~= "released" then
			if arg_4_0._buttonInfo.status == "pressed" then
				if arg_4_0._timeout then
					arg_4_0._timeout:cancel()
				end

				arg_4_0._buttonInfo.count = arg_4_0._buttonInfo.count + 1

				if var_4_0 > arg_4_0._buttonInfo.time + arg_4_0._config.veryLongPressTime * 1000000 - 1 then
					arg_4_0._eventCallback("veryLongPress")

					arg_4_0._buttonInfo.count = 0
				elseif var_4_0 > arg_4_0._buttonInfo.time + arg_4_0._config.longPressTime * 1000000 - 1 then
					arg_4_0._eventCallback("longPress")

					arg_4_0._buttonInfo.count = 0
				else
					arg_4_0._eventCallback("shortPress")

					arg_4_0._timeout = var_0_3.Timeout(var_0_2.Elapsed(0, arg_4_0._config.multipleButtonPressInterval), function()
						if arg_4_0._buttonInfo.count == 1 then
							arg_4_0._eventCallback("simplePress")
						elseif arg_4_0._buttonInfo.count == 2 then
							arg_4_0._eventCallback("doublePress")
						elseif arg_4_0._buttonInfo.count == 3 then
							arg_4_0._eventCallback("triplePress")
						else
							arg_4_0._eventCallback("multiplePress:" .. arg_4_0._buttonInfo.count)
						end

						arg_4_0._buttonInfo.count = 0

						return false
					end)
				end
			end

			arg_4_0._buttonInfo.status = "released"
			arg_4_0._buttonInfo.time = var_4_0
		end
	else
		var_0_0:warning("button unknown value " .. arg_4_3)

		arg_4_0._buttonInfo.status = "unknown"
		arg_4_0._buttonInfo.time = var_4_0
	end
end

return var_0_6
