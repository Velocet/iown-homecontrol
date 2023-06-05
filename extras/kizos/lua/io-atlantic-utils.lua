slot1 = depends("io-utils")
slot2 = 
-- Decompilation error in this vicinity:
depends("common-atlantic-utils")(slot0)

slot2.setElectricalHeaterComfortTemperature = function (slot0, slot1, slot2)
	if slot0 == "holidays" or slot0 == "previous" then
		if slot2 ~= nil and slot2.groupDef then
			return slot0
		else
			slot3 = bytearray(2)

			if slot1 == nil then
				return slot0.createActivateFunc(54272, {
					{
						12,
						slot0.toRawTemperatureValue(15, 28015, 30115)
					}
				})
			else
				return slot0.createActivateFunc(54272, {
					{
						12,
						slot0.toRawTemperatureValue(slot1, 28015, 30115)
					}
				})
			end
		end
	else
		return slot0.createActivateFunc(54272, {
			{
				12,
				slot0:toRawTemperatureValue(28015, 30115)
			}
		})
	end
end

slot2.setCurrentOperatingMode = function (slot0)
	if slot0 == nil then
		error("Missing mode parameter")
	end

	if slot0.absence == "on" and slot0.relaunch == "off" then
		return slot0.createActivateFunc(54272, {
			{
				16,
				17920
			}
		})
	end

	if slot0.absence == "off" and slot0.relaunch == "off" then
		return slot0.createActivateFunc(54272, {
			{
				16,
				18944
			}
		})
	end

	if slot0.absence == "off" and slot0.relaunch == "on" then
		return slot0.createActivateFunc(54272, {
			{
				16,
				18688
			}
		})
	end

	error("Invalid mode")
end

slot2.computeWinterModeState = function (slot0, slot1)
	if slot1 ~= nil and slot1 == true then
		if slot0 then
			return "on"
		else
			return "off"
		end
	end
end

return slot2
