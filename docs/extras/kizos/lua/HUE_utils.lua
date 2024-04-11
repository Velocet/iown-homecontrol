slot0 = depends("common", "utils")

function slot2(slot0, slot1, slot2)
	return (slot0 <= 0.04045 or math.pow((slot0 + 0.055) / 1.055, 2.4)) and slot0 / 12.92, (slot1 <= 0.04045 or math.pow((slot1 + 0.055) / 1.055, 2.4)) and slot1 / 12.92, (slot2 <= 0.04045 or math.pow((slot2 + 0.055) / 1.055, 2.4)) and slot2 / 12.92
end

return {
	hueCorrection = function (slot0)
		if slot0 <= 120 then
			return (slot0 * 140) / 120
		elseif slot0 > 120 and slot0 <= 240 then
			return slot0 + 20
		else
			return 260 + ((slot0 - 240) * 100) / 120
		end
	end,
	reverseHueCorrection = function (slot0)
		slot1 = nil

		return (slot0 <= 140 and (slot0 * 120) / 140) or (slot0 > 140 and slot0 <= 260 and slot0 - 20) or 240 + ((slot0 - 260) * 120) / 100
	end,
	rgbToHSB = function (slot0, slot1, slot2)
		slot3, slot4, slot5 = slot0(slot3, slot4, slot2 / 255)
		slot9 = nil
		slot9 = (math.max(slot3, slot4, slot5) - math.min(slot3, slot4, slot8) == 0 and 0) or (slot6 == slot3 and ((slot4 - slot5) / slot8) % 6) or (slot6 == slot4 and (slot5 - slot3) / slot8 + 2) or (slot3 - slot4) / slot8 + 4

		if slot1.round(slot9 * 60) < 0 then
			slot9 = slot9 + 360
		end

		if slot9 >= 360 then
			slot9 = slot9 - 360
		end

		slot10 = nil

		return slot2.hueCorrection(slot9), (slot6 == 0 and 0) or slot1.round((100 * slot8) / slot6), slot1.round(100 * slot6)
	end,
	setIntensityWithTimer = function (slot0, slot1, slot2)
		slot3, slot4 = nil

		if slot0 == 0 then
			if slot2 == nil or slot2 == 0 then
				return {
					on = false
				}, {
					category = "lighting"
				}
			else
				slot3 = {
					on = false
				}
			end
		else
			slot3 = {
				on = true,
				bri = slot0.round((slot0 * 255) / 100)
			}
		end

		return slot3, {
			category = "lighting"
		}, ((slot2 ~= nil and slot2 ~= 0) or {
			on = false
		}) and {
			on = true,
			bri = slot0.round((slot2 * 255) / 100)
		}, {
			category = "lighting",
			delay = slot1
		}
	end
}
