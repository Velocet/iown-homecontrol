return {
	0 = {
		name = "Generic Product",
		localPairing = true,
		0 = ({
			{
				linkedHighLevelState = {
					({
						[0] = {
							stateName = "core:DiscreteRSSILevelState",
							parameters = {
								{
									rawStateId = "2146500638",
									name = "p1"
								}
							},
							converter = ({
								function (slot0)
									return depends("io-utils").computeDiscreteRSSILevel(slot0)
								end,
								function (slot0)
									return depends("io-utils").toPercentValue(slot0)
								end,
								function (slot0)
									return depends("io-utils").fromRawName(slot0)
								end,
								function (slot0)
									if slot0 >= -50 then
										return 100
									elseif slot0 < -100 then
										return 0
									else
										return 2 * (slot0 + 100)
									end
								end,
								function (slot0)
									return depends("io-utils").fromRawStatusState(slot0)
								end,
								function (slot0)
									return depends("io-utils").getSoftwareVersionFromRawGeneralInfo(bytearray(slot0, "base64"))
								end,
								function (slot0)
									return depends("io-utils").fromRawManufacturer(slot0)
								end,
								function (slot0, slot1)
									return depends("io-utils").readActivateFunc({})
								end,
								function (slot0)
									return depends("io-utils").createWinkValue(false, slot0)
								end,
								function ()
									return depends("io-utils").createWinkValue(true, 3)
								end,
								function (slot0, slot1)
									return depends("io-utils").handleOneWayController(slot0, slot1, 0)
								end,
								function (slot0)
									return slot0 * 512
								end,
								function (slot0)
									return depends("io-utils").toRawName(slot0), nil, nil, {
										access = "r"
									}
								end,
								function ()
									return depends("io-utils").createWinkValue(true, "forever")
								end,
								function ()
									return depends("io-utils").createWinkValue(false)
								end,
								function ()
									return 1
								end,
								function (slot0, slot1)
									return depends("io-utils").handleOneWayController(slot0, slot1, 1)
								end,
								function (slot0)
									if slot0 == "configuration" then
										return 0
									elseif slot0 == "virgin" then
										return 1
									elseif slot0 == "close" then
										return 2
									elseif slot0 == "transmitting" then
										return 3
									end
								end,
								function (slot0)
									return depends("io-utils").createWinkValue(true, slot0)
								end,
								function (slot0)
									if slot0 == 51200 then
										return "closed"
									else
										return "open"
									end
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-utils").toPercentTargetValue(slot0, slot1, {
										[55296] = slot2,
										[55306] = slot3
									})
								end,
								function (slot0)
									return bit.band(slot0, 7)
								end,
								function (slot0)
									if slot0 == 4 then
										return true
									else
										return false
									end
								end,
								function (slot0)
									return slot0 * 512
								end,
								function (slot0, slot1)
									return depends("io-utils").createActivateFunc(slot0 * 512, {
										{
											1,
											slot1 * 512
										}
									})
								end,
								function (slot0)
									return depends("io-utils").createActivateFunc(nil, {
										{
											1,
											slot0 * 512
										}
									})
								end,
								function (slot0)
									if type(slot0) == "string" then
										if slot0 == "memorized1" or slot0 == "my" then
											return 55296
										elseif slot0 == "secured" then
											return 55306
										end
									else
										return slot0 * 512
									end
								end,
								function ()
									return depends("io-utils").createActivateFunc(53760, {
										{
											1,
											53760
										}
									})
								end,
								function (slot0)
									return depends("io-utils").motorRelativePositionToDiscreteOpenClosed(slot0)
								end,
								function (slot0)
									return nil
								end,
								function (slot0)
									return depends("io-utils").updateAdditionalStatusState(slot0)
								end,
								function ()
									return bytearray({
										1,
										1
									})
								end,
								function (slot0, slot1)
									error("Unknown command name : " .. slot0)
								end,
								function ()
									return 53760
								end,
								function ()
									return bytearray({
										2,
										1
									})
								end,
								function ()
									return 1
								end,
								function (slot0)
									if slot0 == 55307 then
										return "rocker"
									else
										return depends("io-utils").toPercentValue(slot0)
									end
								end,
								function (slot0)
									if slot0 == 55307 then
										return 100
									else
										return depends("io-utils").toPercentValue(slot0)
									end
								end,
								function (slot0, slot1)
									slot2 = depends("io-utils")

									if type(slot0) == "string" then
										if slot0 == "rocker" then
											return slot2.createActivateFunc(55307, {
												{
													3,
													slot1 * 512
												}
											})
										end
									elseif type(slot0) == "number" then
										return slot2.createActivateFunc(slot0 * 512)
									end

									return nil
								end,
								function (slot0)
									if type(slot0) == "string" and slot0 == "rocker" then
										return 55307
									end

									if type(slot0) == "number" then
										return slot0 * 512
									end

									return nil
								end,
								function (slot0)
									return depends("io-utils").createActivateFunc(nil, {
										{
											3,
											slot0 * 512
										}
									})
								end,
								function ()
									return depends("io-utils").createActivateFunc(53760, {
										{
											3,
											53760
										}
									})
								end,
								function (slot0, slot1)
									return depends("io-utils").createActivateFunc(slot0 * 512, {
										{
											9,
											slot1 * 512
										}
									})
								end,
								function (slot0)
									return depends("io-utils").createActivateFunc(nil, {
										{
											9,
											slot0 * 512
										}
									})
								end,
								function ()
									return depends("io-utils").createActivateFunc(53760, {
										{
											9,
											53760
										}
									})
								end,
								function (slot0)
									if type(slot0) == "string" then
										if slot0 == "secured" then
											return 55306
										end
									else
										return slot0 * 512
									end
								end,
								function (slot0)
									if slot0 == 54272 then
										return nil
									else
										return depends("io-utils").toPercentValue(slot0)
									end
								end,
								function (slot0)
									if slot0 == 54272 then
										return "unknown"
									end

									return depends("io-utils").motorRelativePositionToDiscreteOpenClosed(slot0)
								end,
								function ()
									return 51200
								end,
								function ()
									return 0
								end,
								function (slot0)
									return depends("io-utils").toPercentValue(51200 - slot0)
								end,
								function (slot0)
									if slot0 == 51200 then
										return "off"
									else
										return "on"
									end
								end,
								function (slot0)
									return depends("io-utils").createActivateFunc((100 - slot0) * 512, {
										{
											1,
											54016
										}
									}), {
										category = "lighting"
									}
								end,
								function (slot0)
									if slot0 == "on" then
										return 100
									else
										return 0
									end
								end,
								function (slot0, slot1, slot2)
									slot3 = depends("io-utils")

									if slot2 == nil then
										slot2 = 0
									end

									return slot3.createActivateFunc((100 - slot0) * 512, {
										{
											1,
											54016
										}
									}), {
										category = "lighting"
									}, slot3.createActivateFunc((100 - slot2) * 512, {
										{
											1,
											54016
										}
									}), {
										category = "lighting",
										delay = slot1
									}
								end,
								function (slot0)
									return {
										100,
										slot0,
										0
									}
								end,
								function (slot0)
									return (100 - slot0) * 512
								end,
								function (slot0)
									if type(slot0) == "string" then
										if slot0 == "memorized1" or slot0 == "my" then
											return 55296
										elseif slot0 == "secured" then
											return 55306
										end
									else
										return (100 - slot0) * 512
									end
								end,
								function (slot0)
									if slot0 > 0 then
										return "off"
									else
										return "on"
									end
								end,
								function (slot0)
									if slot0 == "on" then
										return 0
									else
										return 51200
									end
								end,
								function (slot0, slot1, slot2)
									if slot0 == nil or slot1 == nil or slot2 == nil then
										return overkiz.magic.IGNORE
									end

									slot4, slot5, slot6 = depends("io-utils").vectorToRGB(slot0 / 51200, slot1 / 51200, ((51200 - slot2) * 100) / 51200)

									return slot6
								end,
								function (slot0, slot1, slot2)
									if slot0 == nil or slot1 == nil or slot2 == nil then
										return overkiz.magic.IGNORE
									end

									slot4, slot5, slot6 = depends("io-utils").vectorToRGB(slot0 / 51200, slot1 / 51200, ((51200 - slot2) * 100) / 51200)

									return slot5
								end,
								function (slot0, slot1, slot2)
									if slot0 == nil or slot1 == nil or slot2 == nil then
										return overkiz.magic.IGNORE
									end

									slot4, slot5, slot6 = depends("io-utils").vectorToRGB(slot0 / 51200, slot1 / 51200, ((51200 - slot2) * 100) / 51200)

									return slot4
								end,
								function (slot0, slot1, slot2)
									slot4, slot5, slot6 = depends("io-utils").RGBToVector(slot0, slot1, slot2)

									return depends("io-utils").createActivateFunc((100 - slot6) * 512, {
										{
											10,
											slot4 * 51200
										},
										{
											11,
											slot5 * 51200
										}
									}), {
										category = "lighting"
									}
								end,
								function (slot0, slot1, slot2, slot3)
									slot4 = depends("io-utils")
									slot5, slot6, slot7 = slot4.RGBToVector(slot0, slot1, slot2)

									return slot4.createActivateFunc((100 - slot7) * 512, {
										{
											10,
											slot5 * 51200
										},
										{
											11,
											slot6 * 51200
										}
									}), {
										category = "lighting"
									}, slot4.createActivateFunc(51200, {
										{
											1,
											54016
										}
									}), {
										category = "lighting",
										delay = slot3
									}
								end,
								function (slot0)
									return depends("common", "utils").round((slot0 * 4500) / 51200 + 2000)
								end,
								function (slot0, slot1)
									return depends("io-utils").createActivateFunc(slot1, {
										{
											14,
											(slot0 - 2000) / 4500 * 51200
										}
									})
								end,
								function (slot0)
									if slot0 > 0 then
										return "off"
									else
										return "on"
									end
								end,
								function (slot0)
									return 0, {
										category = "lighting"
									}, 51200, {
										category = "lighting",
										delay = slot0
									}
								end,
								function (slot0)
									slot1 = nil

									return (slot0 == "on" and 0) or 51200, {
										category = "lighting"
									}
								end,
								function (slot0)
									if slot0 == 54272 then
										return nil
									elseif slot0 == 55303 then
										return nil
									else
										return depends("io-utils").toPercentValue(slot0)
									end
								end,
								function (slot0, slot1, slot2)
									return depends("io-utils").toOpenClosedPedestrianState(slot0, slot1, slot2)
								end,
								function (slot0)
									if type(slot0) == "string" and slot0 == "pedestrian" then
										return 55303
									end

									if type(slot0) == "number" then
										return slot0 * 512
									end

									return nil
								end,
								function ()
									return 55303
								end,
								function (slot0)
									if slot0 > 0 then
										return "locked"
									else
										return "unlocked"
									end
								end,
								function (slot0)
									if slot0 > 0 then
										return "closed"
									else
										return "open"
									end
								end,
								function (slot0)
									slot1 = nil

									return (slot0 == "closed" and 51200) or 0, {
										access = "w"
									}, 0, {
										access = "r",
										delay = 30
									}
								end,
								function (slot0)
									if slot0 == "locked" then
										return "closed"
									else
										return "open"
									end
								end,
								function (slot0)
									if slot0 == 0 then
										return "daylocked"
									elseif slot0 == 1 then
										return "homesecure"
									elseif slot0 == 2 then
										return "secured"
									else
										return "unknown"
									end
								end,
								function (slot0)
									slot1 = depends("io-utils")

									if slot0 == "daylocked" then
										return slot1.createActivateFunc(0)
									elseif slot0 == "homesecure" then
										return slot1.createActivateFunc(51200, {
											{
												1,
												1
											}
										})
									elseif slot0 == "secured" then
										return slot1.createActivateFunc(51200, {
											{
												1,
												2
											}
										})
									else
										return nil
									end
								end,
								function (slot0)
									if slot0 == "closed" then
										return 51200
									else
										return 0
									end
								end,
								function (slot0)
									return depends("io-utils").createActivateFunc(55304, {
										{
											1,
											53504
										},
										{
											2,
											slot0 * 512
										}
									})
								end,
								function (slot0, slot1)
									return depends("io-utils").createActivateFunc(55304, {
										{
											1,
											slot0 * 512
										},
										{
											2,
											slot1 * 512
										}
									})
								end,
								function (slot0)
									return depends("io-utils").createActivateFunc(55304, {
										{
											1,
											slot0 * 512
										},
										{
											2,
											53504
										}
									})
								end,
								function (slot0, slot1, slot2)
									return depends("io-utils").fromRawTemperatureValue(slot0, slot1, slot2)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot6 = depends("io-utils")
									slot7 = slot0
									slot7 = (slot0 == 55306 and slot1) or (slot0 == 55310 and slot2) or (slot0 == 55311 and slot3) or slot0

									if slot7 == nil then
										return nil
									else
										return slot6.fromRawTemperatureValue(slot7, slot4, slot5)
									end
								end,
								function (slot0, slot1, slot2)
									slot3 = depends("io-utils")

									if slot0 == nil then
										return nil
									else
										return slot3.fromRawTemperatureValue(slot0, slot1, slot2)
									end
								end,
								function ()
									if p1 == nil then
										return ""
									end

									if p1 == 1 then
										return "auto"
									elseif p1 == 2 then
										return "manu"
									else
										return ""
									end
								end,
								function ()
									if p1 == nil then
										return ""
									end

									if p1 == 0 then
										return "cooling and heating (manu)"
									elseif p1 == 1 then
										return "heating"
									elseif p1 == 2 then
										return "cooling"
									elseif p1 == 3 then
										return "cooling and heating (auto)"
									else
										return ""
									end
								end,
								function ()
									if p1 == nil then
										return ""
									end

									if p1 == 0 then
										return "passive"
									elseif p1 == 1 then
										return "active"
									elseif p1 == 2 then
										return "active cooling"
									else
										return ""
									end
								end,
								function ()
									if p1 == nil then
										return ""
									end

									if p1 == 1 then
										return "heating"
									elseif p1 == 2 then
										return "cooling"
									elseif p1 == 3 then
										return "both"
									else
										return ""
									end
								end,
								function (slot0)
									if slot0 == nil then
										return ""
									end

									if slot0 == 55311 then
										return "comfort"
									elseif slot0 == 55310 then
										return "eco"
									elseif slot0 == 55306 then
										return "secured"
									else
										return ""
									end
								end,
								function (slot0, slot1, slot2, slot3)
									slot4 = depends("io-utils")
									slot5 = ""

									if slot0 == "auto" then
										slot5 = {
											{
												9,
												1
											}
										}
									elseif slot0 == "manu" then
										slot5 = {
											{
												9,
												2
											}
										}
									else
										return slot4.createActivateFunc(54272, {
											{
												9,
												0
											}
										})
									end

									if slot0 == "auto" and type(slot1) == "number" then
										return slot4.createActivateFunc(54272, {
											{
												9,
												0
											}
										})
									end

									if type(slot1) == "string" then
										if slot1 == "comfort" then
											return slot4.createActivateFunc(55311, slot5)
										elseif slot1 == "eco" then
											return slot4.createActivateFunc(55310, slot5)
										elseif slot1 == "secured" then
											return slot4.createActivateFunc(55306, slot5)
										else
											return nil
										end
									elseif type(slot1) == "number" then
										return slot4.createActivateFunc(slot4.toRawTemperatureValue(slot1, slot2, slot3), slot5)
									else
										return nil
									end
								end,
								function (slot0, slot1)
									slot2 = depends("io-utils")

									if slot0 == "auto" then
										return slot2.createActivateFunc(55311, {
											{
												9,
												1
											}
										})
									elseif slot0 == "manu" then
										return slot2.createActivateFunc(slot1, {
											{
												9,
												2
											}
										})
									else
										return slot2.createActivateFunc(54272, {
											{
												9,
												0
											}
										})
									end
								end,
								function (slot0, slot1, slot2)
									return depends("io-utils").toRawTemperatureValue(slot0, slot1, slot2)
								end,
								function (slot0)
									slot1 = depends("io-utils")

									if slot0 == "heating" then
										return slot1.createActivateFunc(54272, {
											{
												9,
												4
											}
										})
									elseif slot0 == "cooling" then
										return slot1.createActivateFunc(54272, {
											{
												9,
												8
											}
										})
									elseif slot0 == "both" then
										return slot1.createActivateFunc(54272, {
											{
												9,
												12
											}
										})
									else
										return slot1.createActivateFunc(54272, {
											{
												9,
												0
											}
										})
									end
								end,
								function (slot0, slot1, slot2)
									slot3 = depends("io-utils")

									if slot0 == nil then
										return nil
									end

									if type(slot0) == "string" then
										if slot0 == "comfort" then
											return slot3.createActivateFunc(55311)
										elseif slot0 == "eco" then
											return slot3.createActivateFunc(55310)
										elseif slot0 == "secured" then
											return slot3.createActivateFunc(55306)
										end
									elseif type(slot0) == "number" then
										return slot3.createActivateFunc(slot3.toRawTemperatureValue(slot0, slot1, slot2), {
											{
												9,
												2
											}
										})
									end

									return nil
								end,
								function (slot0)
									return 0, {
										category = "onoff"
									}, 51200, {
										category = "onoff",
										delay = slot0
									}
								end,
								function (slot0)
									slot1 = nil

									return (slot0 == "on" and 0) or 51200, {
										category = "onoff"
									}
								end,
								function ()
									return depends("io-utils").createActivateFunc(0, {
										{
											13,
											55296
										}
									})
								end,
								function (slot0)
									return depends("io-utils").createActivateFunc(0, {
										{
											13,
											slot0
										}
									})
								end,
								function (slot0)
									slot1 = depends("io-utils")
									slot2 = nil

									return (slot0 == "on" and 0) or 51200
								end,
								function (slot0)
									return depends("io-somfy-utils").getParamValue(slot0, 136)
								end,
								function (slot0)
									return depends("io-utils").getMicroModuleLowBattery(slot0)
								end,
								function (slot0)
									slot1 = depends("io-utils")

									if bit.band(depends("io-somfy-utils").getParamValue(slot0, 26), 255) == 27 then
										return "onOffSwitch"
									elseif slot3 == 16 then
										return "dimmableLight"
									else
										return "onOffLight"
									end
								end,
								function (slot0, slot1)
									slot2 = bytearray(2)

									slot2:writeInt16(1, slot0)

									return depends("io-utils").updatePublicState(slot4, 42499, 2), nil, bytearray({
										2,
										166,
										3,
										0
									}), {
										access = "r"
									}
								end,
								function (slot0, slot1)
									slot2 = 18

									if slot0 == "onOffSwitch" then
										slot2 = 27
									end

									slot3 = bytearray(2)

									slot3:writeInt16(1, slot2)

									return depends("io-utils").updatePublicState(slot5, 42499, 2), nil, bytearray({
										2,
										166,
										3,
										0
									}), {
										access = "r"
									}
								end,
								function (slot0)
									return depends("io-utils").motorRelativePositionToDiscreteOpenClosed(slot0, true)
								end,
								function (slot0)
									return 100 - slot0
								end,
								function (slot0)
									slot1 = depends("io-utils")
									slot3 = 54656
									slot4 = 0.04

									if slot0 == nil then
										slot2 = 25
									end

									return slot1.createActivateFunc(slot3 - slot4 * slot2, nil), {
										category = "lighting"
									}
								end,
								function (slot0)
									slot1 = depends("io-utils")
									slot3 = 54656
									slot4 = 0.04

									if slot0 == nil then
										slot2 = 25
									end

									return slot1.createActivateFunc(slot3 + slot4 * slot2, nil), {
										category = "lighting"
									}
								end,
								function (slot0)
									return depends("io-utils").saveBoundValue(slot0)
								end,
								function (slot0, slot1)
									slot2, slot3 = nil

									if type(slot0) == "string" then
										if slot0 == "memorized1" or slot0 == "my" then
											slot2 = 55296
										elseif slot0 == "secured" then
											slot2 = 55306
										end
									else
										slot2 = slot0 * 512
									end

									if type(slot1) == "string" then
										if slot1 == "my" or slot1 == "memorized1" then
											slot3 = 55296
										end
									else
										slot3 = slot1 * 512
									end

									return depends("io-utils").createActivateFunc(slot2, {
										{
											3,
											slot3
										}
									})
								end,
								function (slot0)
									slot1 = nil

									if type(slot0) == "string" then
										if slot0 == "memorized1" or slot0 == "my" then
											slot1 = 55296
										end
									else
										slot1 = slot0 * 512
									end

									return depends("io-utils").createActivateFunc(depends("io-utils").value.CURRENT, {
										{
											3,
											slot1
										}
									})
								end,
								function (slot0)
									if type(slot0) == "string" and (slot0 == "my" or slot0 == "memorized1") then
										return 55296
									else
										return slot0 * 512
									end
								end,
								function (slot0)
									if slot0 == 0 then
										return "on"
									else
										return "off"
									end
								end,
								function ()
									return 51200
								end,
								function ()
									return 0
								end,
								function (slot0)
									return depends("common", "utils").round(0.00234375 * slot0 - 40, 1)
								end,
								function (slot0)
									return depends("common", "utils").round(0.00234375 * slot0 - 40)
								end,
								function (slot0)
									slot1 = ""

									if slot0 == nil then
										return slot1
									end

									if bit.band(slot0, 49152) == 16384 then
										slot1 = slot1 .. "On "
									elseif bit.band(slot0, 49152) == 32768 then
										slot1 = slot1 .. "Off "
									end

									if bit.band(slot0, 3) == 1 then
										slot1 = slot1 .. "+Heating "
									elseif bit.band(slot0, 3) == 2 then
										slot1 = slot1 .. "-Heating "
									end

									if bit.band(slot0, 12) == 4 then
										slot1 = slot1 .. "+Cooling "
									elseif bit.band(slot0, 12) == 8 then
										slot1 = slot1 .. "-Cooling "
									end

									if bit.band(slot0, 48) == 16 then
										slot1 = slot1 .. "+Away "
									elseif bit.band(slot0, 48) == 32 then
										slot1 = slot1 .. "-Away "
									end

									if bit.band(slot0, 192) == 64 then
										slot1 = slot1 .. "+SwimmingPool "
									elseif bit.band(slot0, 192) == 128 then
										slot1 = slot1 .. "-SwimmingPool "
									end

									if bit.band(slot0, 768) == 256 then
										slot1 = slot1 .. "+DHW "
									elseif bit.band(slot0, 768) == 512 then
										slot1 = slot1 .. "-DHW "
									end

									return slot1
								end,
								function (slot0)
									slot1 = ""

									if bit.band(slot0, 1) == 1 then
										slot1 = slot1 .. "HeatingMode "
									end

									if bit.band(slot0, 2) == 2 then
										slot1 = slot1 .. "Cooling "
									end

									if bit.band(slot0, 4) == 4 then
										slot1 = slot1 .. "Away "
									end

									if bit.band(slot0, 8) == 8 then
										slot1 = slot1 .. "SwimmingPool "
									end

									if bit.band(slot0, 16) == 16 then
										slot1 = slot1 .. "DHW "
									end

									return slot1
								end,
								function (slot0)
									slot1 = depends("io-utils")

									if slot0 == "comfort" then
										return slot1.createActivateFunc(55311, {
											{
												16,
												16384
											}
										})
									elseif slot0 == "setback" then
										return slot1.createActivateFunc(55310, {
											{
												16,
												16384
											}
										})
									elseif slot0 == "eco" then
										return slot1.createActivateFunc(55314, {
											{
												16,
												16384
											}
										})
									elseif slot0 == "halted" then
										return slot1.createActivateFunc(55315, {
											{
												16,
												16384
											}
										})
									else
										return slot1.createActivateFunc(54272, {
											{
												16,
												32768
											}
										})
									end
								end,
								function (slot0)
									return depends("common", "utils").round((51200 * (slot0 + 40)) / 120)
								end,
								function (slot0)
									if slot0 == 51200 then
										return "A,B,C"
									end

									if slot0 == 0 then
										return ""
									end

									if slot0 > 63488 then
										return ({
											[0] = "",
											nil,
											nil,
											"A",
											[12.0] = "B",
											[15.0] = "A,B",
											[60.0] = "B,C",
											[63.0] = "A,B,C",
											[48.0] = "C",
											[51.0] = "A,C"
										})[bit.band(slot0, 63)]
									end
								end,
								function (slot0)
									return ({
										["A,B,C"] = 51200,
										A = 64855,
										["A,C"] = 64887,
										C = 64885,
										["A,B"] = 64863,
										B = 64861,
										["B,C"] = 64893,
										[""] = 0
									})[slot0]
								end,
								function (slot0)
									if slot0 == "my" or slot0 == "memorized1" then
										return 55296
									elseif slot0 == "secured" then
										return 55306
									else
										return slot0 * 512
									end
								end,
								function ()
									return 53760
								end,
								function ()
									return 55296
								end,
								function (slot0, slot1)
									slot2 = depends("io-utils")

									if type(slot1) == "string" and slot1 == "lowspeed" then
										return slot2.createActivateFunc(slot0 * 512, {
											{
												1,
												55301
											}
										})
									else
										return slot2.createActivateFunc(slot0 * 512, {
											{
												1,
												54016
											}
										})
									end
								end,
								function (slot0)
									if slot0 == "securedVentilation" then
										return 55299
									elseif slot0 == "my" then
										return 55296
									else
										return slot0 * 512
									end
								end,
								function (slot0, slot1)
									slot2 = depends("io-utils")
									slot0 = (slot0 == "securedVentilation" and 55299) or (slot0 == "my" and 55296) or slot0 * 512

									if type(slot1) == "string" and slot1 == "lowspeed" then
										return slot2.createActivateFunc(slot0, {
											{
												1,
												55301
											}
										})
									else
										return slot2.createActivateFunc(slot0, {
											{
												1,
												54016
											}
										})
									end
								end,
								function (slot0)
									if slot0 == 51200 then
										return "locked"
									else
										return "unlocked"
									end
								end,
								function (slot0, slot1)
									if slot1 == 55299 then
										return "securedVentilation"
									elseif slot0 == 51200 then
										return "closed"
									else
										return "open"
									end
								end,
								function (slot0)
									if depends("io-somfy-utils").getParamValue(slot0, 26) ~= nil and slot2 >= 0 and slot2 < 61 then
										return slot2
									end
								end,
								function (slot0)
									if slot0 == 59 then
										return "left"
									elseif slot0 == 60 then
										return "right"
									end
								end,
								function (slot0)
									return depends("io-somfy-utils").getParamValue(slot0, 142)
								end,
								function (slot0)
									return depends("io-somfy-utils").getParamValue(slot0, 32)
								end,
								function (slot0)
									if slot0 == 1 then
										return "enabled"
									else
										return "disabled"
									end
								end,
								function (slot0)
									return depends("io-somfy-utils").getParamValue(slot0, 135)
								end,
								function (slot0)
									if slot0 == 1 then
										return "activated"
									else
										return "deactivated"
									end
								end,
								function (slot0)
									return depends("io-somfy-utils").getParamValue(slot0, 136)
								end,
								function (slot0)
									slot1 = bytearray(1)

									slot1:writeInt8(1, 1)

									return depends("io-utils").updatePublicState(slot3, 42499, 2), nil, bytearray({
										2,
										166,
										3,
										0
									}), {
										access = "r"
									}
								end,
								function (slot0)
									slot1 = bytearray(1)

									slot1:writeInt8(1, 0)

									return depends("io-utils").updatePublicState(slot3, 42499, 2), nil, bytearray({
										2,
										166,
										3,
										0
									}), {
										access = "r"
									}
								end,
								function (slot0)
									slot1 = depends("io-utils")

									if slot0 < 51200 then
										error("Opened window cannot be locked")
									end

									return slot1.createActivateFunc(51200, {
										{
											9,
											51200
										}
									})
								end,
								function (slot0)
									slot1 = depends("io-utils")

									if slot0 < 51200 then
										error("Opened window cannot be unlock")
									end

									return slot1.createActivateFunc(51200, {
										{
											9,
											0
										}
									})
								end,
								function (slot0)
									if type(slot0) == "string" then
										if slot0 == "memorized1" then
											return 55296
										elseif slot0 == "secured" then
											return 55306
										end
									else
										return slot0 * 512
									end
								end,
								function (slot0, slot1)
									slot2 = depends("io-utils")

									if type(slot0) == "string" then
										if slot0 == "memorized1" then
											return slot2.createActivateFunc(55296, {
												{
													1,
													slot1 * 512
												}
											})
										elseif slot0 == "secured" then
											return slot2.createActivateFunc(55306, {
												{
													1,
													slot1 * 512
												}
											})
										end
									else
										return slot2.createActivateFunc(slot0 * 512, {
											{
												1,
												slot1 * 512
											}
										})
									end
								end,
								function (slot0)
									return depends("io-utils").getBatteryLevelValue(slot0, 5)
								end,
								function (slot0)
									if slot0 == 51200 then
										return "off"
									else
										return "on"
									end
								end,
								function ()
									return 51200, {
										priority = depends("io-utils").priority.VERYHIGH
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
									return depends("io-utils").ringWithDoubleSequence(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-utils").ringWithSingleSequence(slot0, slot1, slot2, slot3, slot4, slot5)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)
									return depends("io-utils").ringWithThreeSequence(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)
								end,
								function (slot0)
									return slot0
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
									return depends("io-utils").ringWithDoubleSequence(slot0, slot1, slot2, slot3, nil, slot4, slot5, slot6, slot7, nil, slot8)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-utils").ringWithSingleSequence(slot0, slot1, slot2, slot3, nil, slot4)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12)
									return depends("io-utils").ringWithThreeSequence(slot0, slot1, slot2, slot3, nil, slot4, slot5, slot6, slot7, nil, slot8, slot9, slot10, slot11, nil, slot12)
								end,
								function (slot0)
									return slot0:readInt8(1)
								end,
								function (slot0)
									return depends("io-atlantic-utils").bytesToString(slot0)
								end,
								function (slot0)
									return depends("io-atlantic-utils").fromDHWRawDateTime(slot0)
								end,
								function (slot0)
									return depends("io-atlantic-utils").getManufacturerName(slot0)
								end,
								function (slot0)
									if slot0 == nil or #slot0 < 4 then
										return nil
									end

									return slot0:readUInt16(3)
								end,
								function (slot0)
									if slot0 == nil or #slot0 < 4 then
										return nil
									end

									return slot0:readUInt16(3) / 10
								end,
								function (slot0)
									if slot0 == nil or #slot0 < 2 then
										return nil
									end

									return slot0:readUInt16(1)
								end,
								function (slot0)
									if slot0 == nil or #slot0 < 2 then
										return nil
									end

									return slot0:readUInt16(1) / 10
								end,
								function (slot0)
									if slot0 == nil or #slot0 == 0 then
										return nil
									end

									return slot0:readUInt8(1)
								end,
								function (slot0)
									return depends("io-atlantic-utils").getCurrentOperatingMode(slot0)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
									slot8 = depends("io-utils")
									slot9 = slot0
									slot9 = (slot0 == 55306 and slot1) or (slot0 == 55314 and slot2) or (slot0 == 55311 and slot3) or (slot0 == 55315 and slot4) or (slot0 == 55318 and slot5) or slot0

									if slot9 == nil then
										return nil
									else
										return slot8.fromRawTemperatureValue(slot9, slot6, slot7)
									end
								end,
								function ()
									return depends("io-atlantic-utils").fromRawVersion(p1)
								end,
								function (slot0)
									return slot0:readUInt16(1)
								end,
								function (slot0)
									if slot0:readUInt8(1) == 255 then
										return "always"
									else
										return tostring(slot1)
									end
								end,
								function (slot0)
									return depends("io-atlantic-utils").getBoilerInstallationOption(slot0)
								end,
								function (slot0)
									return slot0:readUInt16(1)
								end,
								function (slot0)
									return depends("io-atlantic-utils").getDHWError(slot0)
								end,
								function (slot0)
									return slot0:readUInt8(1)
								end,
								function (slot0)
									if slot0 == 0 then
										return "autoMode"
									elseif slot0 == 1 then
										return "manualEcoActive"
									elseif slot0 == 2 then
										return "manualEcoInactive"
									end
								end,
								function (slot0)
									return slot0:readUInt16(3)
								end,
								function (slot0)
									return depends("io-atlantic-utils").getElectricalExtraManagement(slot0)
								end,
								function (slot0)
									return depends("io-atlantic-utils").getExtractionOption(slot0)
								end,
								function (slot0)
									return depends("io-atlantic-utils").getInstallation(slot0)
								end,
								function (slot0)
									if slot0 == nil or #slot0 < 2 then
										return nil
									end

									return slot0:readInt16(1) / 10
								end,
								function (slot0)
									return depends("io-atlantic-utils").getOperatingModeCapabilities(slot0)
								end,
								function (slot0)
									return depends("io-atlantic-utils").getOperatingRange(slot0)
								end,
								function (slot0)
									return depends("io-atlantic-utils").getUserProgSlotsDHW(slot0)
								end,
								function (slot0)
									return depends("io-atlantic-utils").getRateManagement(slot0)
								end,
								function (slot0)
									return depends("io-atlantic-utils").getSmartGridOption(slot0)
								end,
								function ()
									return depends("io-utils").getRefreshMethod(depends("io-utils").extendedInformationType.CURRENT_USING_DISCRETE_VALUE)
								end,
								function (slot0)
									return bytearray({
										slot0
									})
								end,
								function (slot0)
									slot1 = slot0

									if slot0 == "always" then
										slot1 = 255
									end

									return bytearray({
										slot1
									})
								end,
								function (slot0)
									slot1 = nil

									return bytearray({
										(slot0 == "heatPumpPriority" and 0) or (slot0 == "heatPumpOptimising" and 1) or (slot0 == "boilerOptimising" and 2) or 3
									})
								end,
								function (slot0)
									return depends("io-atlantic-utils").setCurrentOperatingMode(slot0)
								end,
								function (slot0)
									slot1 = 0

									if slot0 == "manualEcoActive" then
										slot1 = 1
									elseif slot0 == "manualEcoInactive" then
										slot1 = 2
									end

									return bytearray({
										slot1
									})
								end,
								function (slot0)
									return depends("io-atlantic-utils").toDHWRawDateTime(slot0)
								end,
								function (slot0)
									slot1 = 1

									if slot0 == "auto" then
										slot1 = 0
									end

									return bytearray({
										slot1
									})
								end,
								function (slot0)
									slot1 = nil

									return bytearray({
										(slot0 == "noExtraction" and 0) or (slot0 == "lowExtractionSpeed" and 1) or 2
									})
								end,
								function (slot0)
									slot1 = nil

									return bytearray({
										(slot0 == "onlyThermodynamic" and 0) or (slot0 == "extraBoiler" and 1) or 2
									})
								end,
								function (slot0)
									slot1 = nil

									return bytearray({
										(slot0 == "pacProg_elecProg" and 1) or 4
									})
								end,
								function (slot0)
									return depends("io-atlantic-utils").setUserProgSlotsDHW(slot0)
								end,
								function (slot0)
									slot1 = depends("io-utils")
									slot2 = nil

									if slot0 == "no" then
										slot2 = 64512
									elseif slot0 == "wanted" then
										slot2 = 64513
									elseif slot0 == "recommended" then
										slot2 = 64514
									elseif slot0 == "unsuitable" then
										slot2 = 64516
									elseif slot0 == "forbidden" then
										slot2 = 64517
									else
										return nil
									end

									return slot1.createActivateFunc(54272, {
										{
											10,
											slot2
										}
									})
								end,
								function (slot0)
									slot1 = 0

									if slot0 == "active" then
										slot1 = 1
									end

									return bytearray({
										slot1
									})
								end,
								function (slot0, slot1, slot2)
									slot3 = depends("io-utils")

									if type(slot0) == "string" then
										if slot0 == "secured" then
											return 55306
										elseif slot0 == "eco" then
											return 55314
										elseif slot0 == "comfort" then
											return 55311
										elseif slot0 == "halted" then
											return 55315
										elseif slot0 == "anti-frost" then
											return 55318
										else
											return nil
										end
									else
										return slot3.toRawTemperatureValue(slot0, slot1, slot2)
									end
								end,
								function (slot0)
									return slot0:readUInt32(1)
								end,
								function (slot0)
									if slot0 == 64512 then
										return "off"
									else
										return "on"
									end
								end,
								function (slot0)
									if slot0 == 64512 then
										return "off"
									elseif slot0 == 64513 then
										return "frostprotection"
									elseif slot0 == 64514 then
										return "eco"
									elseif slot0 == 64515 then
										return "comfort-2"
									elseif slot0 == 64516 then
										return "comfort-1"
									elseif slot0 == 64517 then
										return "comfort"
									elseif slot0 == 64519 then
										return "boost"
									elseif slot0 == 64575 then
										return "secured"
									else
										return "unknown"
									end
								end,
								function (slot0)
									if slot0 == 64512 then
										return "off"
									elseif slot0 == 64513 then
										return "frostprotection"
									elseif slot0 == 64514 or slot0 == 0 then
										return "eco"
									elseif slot0 == 64515 then
										return "comfort-2"
									elseif slot0 == 64516 then
										return "comfort-1"
									elseif slot0 == 64517 or slot0 == 51200 then
										return "comfort"
									elseif slot0 == 64519 then
										return "boost"
									elseif slot0 == 64575 then
										return "secured"
									else
										return "unknown"
									end
								end,
								function (slot0)
									return depends("io-utils").createActivateFunc(depends("io-utils").toRawHeatingLevel(slot0), {
										{
											11,
											0
										}
									}), {
										originator = 1
									}
								end,
								function (slot0)
									return depends("io-utils").createActivateFunc(depends("io-utils").toRawHeatingLevel(slot0), {
										{
											11,
											65535
										}
									}), {
										originator = 1
									}
								end,
								function (slot0, slot1)
									return depends("io-utils").createActivateFunc(depends("io-utils").toRawHeatingLevel(slot0), {
										{
											11,
											slot1
										}
									}), {
										originator = 1
									}
								end,
								function (slot0)
									return slot0:readInt8(15)
								end,
								function (slot0)
									return depends("io-atlantic-utils").getTimeProgram(slot0)
								end,
								function (slot0)
									if slot0 == 64515 then
										return "boost"
									elseif slot0 == 64514 then
										return "high"
									elseif slot0 == 64512 then
										return "away"
									elseif slot0 == 64513 then
										return "auto"
									else
										return "unknown"
									end
								end,
								function (slot0)
									return depends("io-atlantic-utils").getCO2History(slot0)
								end,
								function (slot0)
									return bit.lshift(slot0:readInt16(29), 16) + slot0:readInt16(31)
								end,
								function (slot0)
									return slot0:readUInt16(9)
								end,
								function (slot0)
									return slot0:readUInt16(7)
								end,
								function (slot0)
									return slot0:readInt8(16)
								end,
								function (slot0)
									return slot0:readInt16(13)
								end,
								function (slot0)
									return depends("io-atlantic-utils").getSensorsErrorState(slot0)
								end,
								function (slot0)
									if slot0 == 64514 then
										return "eco"
									elseif slot0 == 64513 then
										return "comfort"
									elseif slot0 == 64512 then
										return "standard"
									else
										return "unknown"
									end
								end,
								function (slot0)
									return depends("io-atlantic-utils").getVentilationMode(slot0)
								end,
								function ()
									return bytearray({
										12,
										0,
										1
									})
								end,
								function ()
									return bytearray({
										12,
										0,
										2
									})
								end,
								function (slot0, slot1, slot2)
									slot3 = bytearray(3)

									if slot0 == "on" then
										slot3[1] = 1
									else
										slot3[1] = 0
									end

									if slot1 == "on" then
										slot3[2] = 1
									else
										slot3[2] = 0
									end

									if slot2 == "on" then
										slot3[3] = 1
									else
										slot3[3] = 0
									end

									return slot3
								end,
								function (slot0)
									if slot0 == "boost" then
										return 64515
									elseif slot0 == "high" then
										return 64514
									elseif slot0 == "auto" then
										return 64513
									elseif slot0 == "away" then
										return 64512
									else
										return nil
									end
								end,
								function (slot0)
									return depends("io-atlantic-utils").setTimeProgram(slot0)
								end,
								function (slot0)
									slot1 = depends("io-utils")
									slot2 = slot0

									if type(slot0) == "string" then
										if slot0 == "standard" then
											slot2 = 64512
										elseif slot0 == "comfort" then
											slot2 = 64513
										elseif slot0 == "eco" then
											slot2 = 64514
										end
									end

									return slot1.createActivateFunc(54272, {
										{
											16,
											slot2
										}
									})
								end,
								function (slot0)
									return depends("io-atlantic-utils").setVentilationMode(slot0)
								end,
								function (slot0)
									return slot0:readInt16(11) / 10
								end,
								function (slot0)
									return slot0:readInt16(3) / 10
								end,
								function (slot0)
									return slot0:readInt16(7) / 10
								end,
								function (slot0)
									return slot0:readInt16(5) / 10
								end,
								function (slot0)
									return slot0:readInt16(9) / 10
								end,
								function (slot0)
									return depends("io-utils").getSensorDefect(slot0)
								end,
								function (slot0)
									return slot0
								end,
								function (slot0)
									return depends("io-utils").sensedUnit[slot0]
								end,
								function (slot0)
									return slot0 - 273.15
								end,
								function (slot0)
									if depends("io-utils").sensedUnit[slot0] == "core:TemperatureInKelvin" then
										return "core:TemperatureInCelcius"
									else
										return slot2
									end
								end,
								function (slot0)
									if slot0 == nil or #slot0 ~= 7 then
										return nil
									end

									if depends("io-utils").scaleFactors[slot0[3]] == nil then
										return nil
									end

									return slot0:readUInt32(4) / slot2
								end,
								function (slot0)
									return depends("io-utils").fromRawName(slot0)
								end,
								function (slot0)
									return depends("io-atlantic-utils").getTotal(slot0)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 0, 1)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 0, 2)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 0, 3)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 0, 4)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 0, 5)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 0, 6)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageTotalFor(slot0, slot1, 0)
								end,
								function (slot0, slot1)
									error("advanced refresh not implemented")
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 1, 1)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 1, 2)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 1, 3)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 1, 4)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 1, 5)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 1, 6)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageTotalFor(slot0, slot1, 1)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 2, 1)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 2, 2)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 2, 3)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 2, 4)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 2, 5)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 2, 6)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 3, 1)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 3, 2)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 3, 3)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 3, 4)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 3, 5)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 3, 6)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageTotalFor(slot0, slot1, 3)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 15, 1)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 15, 2)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 15, 3)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 15, 4)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 15, 5)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageByRateFor(slot0, slot1, 15, 6)
								end,
								function (slot0, slot1)
									return depends("io-atlantic-utils").getUsageTotalFor(slot0, slot1, 15)
								end,
								function (slot0)
									if slot0 == 1 then
										return "on"
									else
										return "off"
									end
								end,
								function (slot0)
									if slot0 == "on" then
										return bytearray({
											1
										})
									else
										return bytearray({
											0
										})
									end
								end,
								function (slot0)
									return bit.rshift(slot0[1], 4)
								end,
								function (slot0)
									return depends("io-atlantic-utils").fromRawName(slot0:sub(1, 16))
								end,
								function (slot0)
									return slot0[18]
								end,
								function (slot0)
									return bytearray(1):writeUInt8(1, slot0)
								end,
								function (slot0)
									if slot0 == 0 then
										return "on"
									elseif slot0 == 1 then
										return "off"
									end
								end,
								function (slot0)
									if slot0 == 0 then
										return "config1"
									elseif slot0 == 1 then
										return "config2"
									end
								end,
								function (slot0)
									if slot0 == "config1" then
										return bytearray({
											0
										})
									elseif slot0 == "config2" then
										return bytearray({
											1
										})
									end
								end,
								function (slot0)
									if slot0 == "on" then
										return bytearray({
											0
										})
									elseif slot0 == "off" then
										return bytearray({
											1
										})
									end
								end,
								function (slot0)
									return slot0 ~= nil and slot0 ~= 0
								end,
								function (slot0)
									if slot0 then
										return "detected"
									else
										return "notDetected"
									end
								end,
								function (slot0)
									return depends("io-fumix-utils").maintenanceRadioPartBatteryConverter(slot0)
								end,
								function (slot0)
									return depends("io-fumix-utils").maintenanceSensorPartBatteryConverter(slot0)
								end,
								function (slot0)
									return depends("io-utils").getDirtyRoomDefect(slot0)
								end,
								function (slot0)
									if slot0 == "short" then
										return 1
									elseif slot0 == "long" then
										return 0
									else
										return nil
									end
								end,
								function (slot0)
									if slot0 then
										return "open"
									else
										return "closed"
									end
								end,
								function (slot0)
									if slot0 == "maintenanceRequired" then
										return "lowBattery"
									else
										return slot0
									end
								end,
								function (slot0)
									if slot0 then
										return "personInside"
									else
										return "noPersonInside"
									end
								end,
								function (slot0)
									return slot0 ~= nil and slot0 == 65535
								end,
								function (slot0)
									if slot0 then
										return "detected"
									else
										return "notDetected"
									end
								end,
								function (slot0)
									return depends("io-utils").toMultiTypeSensorTiltedValue(slot0)
								end,
								function (slot0)
									return depends("io-utils").toMultiTypeSensorOpenClosedValue(slot0)
								end,
								function (slot0)
									return depends("io-utils").toMultiTypeSensorLockedUnlockedValue(slot0)
								end,
								function (slot0)
									return slot0.maxSensedValue
								end,
								function (slot0)
									return depends("io-utils").sensedUnit[slot0.measuredValueType]
								end,
								function (slot0)
									return slot0.minSensedValue
								end,
								function (slot0)
									return true
								end,
								function (slot0)
									return slot0:readUInt8(13)
								end,
								function (slot0, slot1)
									return depends("io-utils").updatePublicState(slot1.writeUInt8(slot3, 13, slot0), 17154, 0), nil, bytearray({
										0,
										67,
										2,
										0
									}), {
										access = "r"
									}
								end,
								function (slot0)
									if slot0 == "dpcActuators" then
										return 4
									elseif slot0 == "unsetActuators" then
										return 5
									end

									return nil
								end,
								function ()
									return 4
								end,
								function (slot0)
									if slot0 == "all" then
										return 1
									elseif slot0 == "inConfigurationState" then
										return 2
									elseif slot0 == "alreadyInTheNetwork" then
										return 3
									end

									return nil
								end,
								function (slot0)
									if slot0 == "all" then
										return 1
									elseif slot0 == "inConfigurationState" then
										return 2
									end

									return nil
								end,
								function (slot0, slot1)
									if slot1 == "keygo" then
										return bytearray({
											2
										})
									elseif slot1 == "izymo" then
										return bytearray({
											3
										})
									elseif slot1 == "public default" then
										return bytearray({
											4
										})
									elseif slot1 == "v500" then
										return bytearray({
											5
										})
									elseif slot1 == "keypad" then
										return bytearray({
											6
										})
									end

									return bytearray({
										0
									})
								end,
								function ()
									return 1
								end,
								function ()
									return depends("io-utils").generateIOKey()
								end,
								function ()
									return 630
								end,
								function (slot0)
									if slot0 == 0 then
										return "up"
									elseif slot0 == 1 then
										return "down"
									elseif slot0 == 2 then
										return "stop"
									elseif slot0 == 3 then
										return "prog"
									end

									return nil
								end,
								function (slot0)
									return tostring(slot0)
								end,
								function (slot0)
									if slot0 == 255 then
										return "released"
									elseif slot0 == 256 then
										return "stop"
									else
										return "pressed"
									end
								end,
								function (slot0, slot1)
									slot2 = depends("io-utils")

									if type(slot1) == "string" and slot1 == "lowspeed" then
										return slot2.createActivateFunc(slot0 * 512, {
											{
												1,
												55301
											}
										})
									else
										return slot2.createActivateFunc(slot0 * 512, {
											{
												1,
												54016
											}
										})
									end
								end,
								function (slot0, slot1)
									slot2 = depends("io-utils")
									slot0 = (slot0 == "my" and 55296) or slot0 * 512

									if type(slot1) == "string" and slot1 == "lowspeed" then
										return slot2.createActivateFunc(slot0, {
											{
												1,
												55301
											}
										})
									else
										return slot2.createActivateFunc(slot0, {
											{
												1,
												54016
											}
										})
									end
								end,
								function (slot0)
									if slot0 == 55296 then
										return "tight"
									else
										return depends("io-utils").toPercentValue(slot0)
									end
								end,
								function (slot0)
									if type(slot0) == "string" then
										if slot0 == "tight" then
											return 55296
										end
									else
										return slot0 * 512
									end
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-utils").toPercentTargetValue(slot0, slot1, {
										[55306] = slot2,
										[55297] = slot3,
										[55298] = slot4,
										[55299] = slot5
									})
								end,
								function (slot0, slot1)
									if slot0 == 54272 then
										return "unknown"
									elseif slot0 == slot1 or slot0 == 55305 then
										return "partial"
									end

									return depends("io-utils").motorRelativePositionToDiscreteOpenClosed(slot0)
								end,
								function ()
									return 55305
								end,
								function (slot0)
									if slot0 == 54272 then
										return "unknown"
									elseif slot0 > 0 then
										return "locked"
									else
										return "unlocked"
									end
								end,
								function (slot0)
									if depends("BinaryUtils").extractBitRange({
										slot0
									}, 6, 1) == 0 then
										return "closed"
									elseif slot3 == 1 then
										return "open"
									else
										return nil
									end
								end,
								function (slot0)
									slot1 = nil

									return (slot0 == "locked" and 51200) or 0, {
										access = "w"
									}, 0, {
										access = "r",
										delay = 30
									}
								end,
								function (slot0)
									if slot0 == "closed" then
										return "locked"
									else
										return "unlocked"
									end
								end,
								function ()
									slot0 = depends("io-utils")

									return slot0.createActivateMode(slot0.standardReceiver.switchActivationMode, slot0.standardReceiver.temporizedOnModeParameter)
								end,
								function (slot0)
									if type(slot0) == "string" then
										if slot0 == "memorized1" or slot0 == "my" then
											return 55296
										end
									else
										return slot0 * 512
									end
								end,
								function (slot0)
									return slot0 / 100 - 273.15
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot6 = slot0

									if ((slot0 == 55306 and slot1) or (slot0 == 55314 and slot2) or (slot0 == 55311 and slot3) or (slot0 == 55315 and slot4) or (slot0 == 55318 and slot5) or slot0) == nil then
										return nil
									else
										return slot6 / 100 - 273.15
									end
								end,
								function (slot0)
									if slot0 == 0 then
										return 200
									else
										return 270
									end
								end,
								function (slot0)
									return depends("common", "utils").round((slot0 + 273.15) * 100)
								end,
								function (slot0)
									slot1 = depends("common", "utils")

									if type(slot0) == "string" then
										if slot0 == "secured" then
											return 55306
										elseif slot0 == "eco" then
											return 55314
										elseif slot0 == "comfort" then
											return 55311
										elseif slot0 == "halted" then
											return 55315
										elseif slot0 == "anti-frost" then
											return 55318
										else
											return nil
										end
									else
										return slot1.round((slot0 + 273.15) * 100)
									end
								end,
								function (slot0)
									return bit.band(bit.rshift(slot0[1], 6), 3)
								end,
								function (slot0)
									if slot0 == 0 then
										return "none"
									else
										return slot0
									end
								end,
								function (slot0)
									return slot0[2]
								end,
								function (slot0)
									return slot0[1] / 2
								end,
								function (slot0)
									return slot0[2] / 2
								end,
								function (slot0)
									if slot0:readUInt32(7) == 0 then
										return nil
									else
										return slot1 * 1000
									end
								end,
								function (slot0)
									if slot0:readUInt32(3) == 0 then
										return nil
									else
										return slot1 * 1000
									end
								end,
								function (slot0)
									return slot0[3] / 2
								end,
								function (slot0)
									return slot0[5] / 2
								end,
								function (slot0)
									return slot0:readUInt8(2) / 2
								end,
								function (slot0)
									return slot0:readUInt8(3) / 2
								end,
								function (slot0)
									return bit.band(slot0[1], 1)
								end,
								function (slot0)
									return ({
										[0] = "closed",
										"open"
									})[slot0]
								end,
								function (slot0)
									return ({
										[0] = "inactive",
										"active"
									})[slot0]
								end,
								function (slot0)
									return bit.band(bit.rshift(slot0[1], 1), 1)
								end,
								function (slot0)
									return ({
										[0] = "auto",
										"manual"
									})[slot0]
								end,
								function (slot0)
									if bit.band(slot0[1], 128) ~= 0 then
										return "lowBattery"
									elseif bit.band(slot1, 32) ~= 0 then
										return "maintenanceRequired"
									elseif bit.band(slot1, 64) ~= 0 then
										return "dead"
									else
										return nil
									end
								end,
								function (slot0)
									return slot0:readUInt8(6) / 2
								end,
								function (slot0)
									slot0[4] = bit.band(slot0[4], 127)
									slot2 = slot0:readInt16(4)

									if bit.band(slot0[4], 128) ~= 0 then
										slot2 = -1 * slot2
									end

									return slot2 / 10
								end,
								function (slot0)
									return depends("io-utils").SomfyHeatingSystem.getCalendar(slot0)
								end,
								function (slot0)
									return depends("io-utils").SomfyHeatingSystem.expandCalendar(slot0)
								end,
								function (slot0)
									return slot0[2] / 2
								end,
								function (slot0)
									return bit.band(bit.rshift(slot0[1], 2), 1)
								end,
								function (slot0)
									return ({
										[0] = "disable",
										"enable"
									})[slot0]
								end,
								function (slot0)
									return bit.band(bit.rshift(slot0[1], 3), 31)
								end,
								function (slot0)
									return depends("io-utils").SomfyHeatingSystem.modes[slot0]
								end,
								function (slot0)
									return ({
										[0] = "comfort",
										"away",
										"eco",
										"geofencingMode",
										"manual",
										"frostprotection",
										"suddenDropMode"
									})[bit.band(bit.rshift(slot1, 3), 31)]
								end,
								function (slot0)
									return ({
										[0] = "date",
										"further_notice",
										"next_mode"
									})[bit.band(slot1, 7)]
								end,
								function (slot0)
									return slot0[4] / 2
								end,
								function (slot0)
									return ({
										[0] = "disable",
										"enable"
									})[slot0]
								end,
								function (slot0)
									return slot0[6] / 2
								end,
								function (slot0)
									return ({
										[0] = "pairing",
										"no_timestamp",
										"end_of_race_nok",
										"full_closed",
										"adjustment",
										"finished"
									})[bit.band(bit.rshift(slot1, 1), 15)]
								end,
								function (slot0, slot1)
									return depends("io-utils").updateAndRefreshPublicState(depends("io-utils").SomfyHeatingSystem.setDerogation(0, "derog", slot0, slot1), 42529, 2)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-utils").updateAndRefreshPublicState(depends("io-utils").SomfyHeatingSystem.updateAllModeTemperatures(slot0, slot1, slot2, slot3, slot4, slot5), 42533, 2)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-utils").updateAndRefreshPublicState(depends("io-utils").SomfyHeatingSystem.updateDerogation(slot0, slot1, slot2, slot3), 42529, 2)
								end,
								function (slot0, slot1)
									slot2 = depends("io-utils")

									return slot2.updateAndRefreshPublicState(slot2.SomfyHeatingSystem.setCalendar(slot1), slot2.SomfyHeatingSystem.getCalendarStateId(slot0), 2)
								end,
								function (slot0, slot1, slot2)
									return depends("io-utils").updateAndRefreshPublicState(depends("io-utils").SomfyHeatingSystem.updateValveSettings(slot0, slot1, slot2), 42532, 2)
								end,
								function (slot0)
									return slot0:readInt16(2) / 10
								end,
								function (slot0, slot1)
									slot2 = depends("io-utils")

									if type(slot0) == "string" then
										if slot0 == "rocker" then
											return slot2.createActivateFunc(55307, {
												{
													3,
													slot1 * 512
												}
											})
										end
									elseif type(slot0) == "number" then
										return slot2.createActivateFunc(slot0 * 512, {
											{
												3,
												slot1 * 512
											}
										})
									end

									return nil
								end,
								function (slot0)
									return depends("io-utils").fromRawTemperatureValue(slot0, 29315, 33515)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot6 = depends("io-utils")
									slot7 = slot0
									slot7 = (slot0 == 55306 and slot1) or (slot0 == 55314 and slot2) or (slot0 == 55311 and slot3) or (slot0 == 55315 and slot4) or (slot0 == 55318 and slot5) or slot0

									if slot7 == nil then
										return nil
									else
										return slot6.fromRawTemperatureValue(slot7, 29315, 33515)
									end
								end,
								function (slot0)
									slot1 = depends("io-utils")

									if slot0 == nil then
										return nil
									else
										return slot1.fromRawTemperatureValue(slot0, 29315, 33515)
									end
								end,
								function (slot0)
									return depends("io-utils").toRawTemperatureValue(slot0, 29315, 33515)
								end,
								function (slot0)
									slot1 = depends("io-utils")

									if type(slot0) == "string" then
										if slot0 == "secured" then
											return 55306
										elseif slot0 == "eco" then
											return 55314
										elseif slot0 == "comfort" then
											return 55311
										elseif slot0 == "halted" then
											return 55315
										elseif slot0 == "anti-frost" then
											return 55318
										else
											return nil
										end
									else
										return slot1.toRawTemperatureValue(slot0, 29315, 33515)
									end
								end,
								function (slot0)
									return bit.band(bit.rshift(slot0[1], 4), 3)
								end,
								function (slot0)
									return bit.band(bit.rshift(slot0[1], 3), 1)
								end,
								function (slot0)
									return ({
										[0] = "heating",
										"cooling"
									})[slot0]
								end,
								function (slot0)
									return slot0:readInt8(6) / 2
								end,
								function (slot0)
									return slot0:readInt8(5) / 10
								end,
								function (slot0)
									slot0[4] = bit.band(slot0[4], 127)
									slot2 = slot0:readInt8(4)

									if bit.band(slot0[4], 128) ~= 0 then
										slot2 = -1 * slot2
									end

									return slot2 / 10
								end,
								function (slot0, slot1, slot2)
									return depends("io-utils").updateAndRefreshPublicState(depends("io-utils").SomfyHeatingSystem.updateThermostatSettings(slot0, slot1, slot2), 42532, 2)
								end,
								function (slot0)
									return slot0:readInt8(9)
								end,
								function (slot0)
									return 100 - depends("io-utils").toPercentValue(slot0)
								end,
								function (slot0)
									if slot0 == nil or #slot0 < 2 then
										return nil
									end

									return slot0:readUInt16(1)
								end,
								function (slot0)
									return depends("io-atlantic-utils").readBit(slot0[1], 1)
								end,
								function (slot0)
									if slot0 == 0 then
										return "off"
									else
										return "Heating"
									end
								end,
								function (slot0)
									if slot0 == 0 then
										return "Relaunch Disable"
									else
										return " Relaunch Enable"
									end
								end,
								function (slot0)
									if slot0 == 0 then
										return "off"
									elseif slot0 == 1 then
										return "on"
									else
										return "prog"
									end
								end,
								function (slot0)
									slot1 = nil

									return bytearray({
										(slot0 == "off" and 0) or (slot0 == "on" and 1) or 2
									})
								end,
								function (slot0)
									return bytearray(2):writeInt16(1, slot0 * 10, true)
								end,
								function (slot0)
									if slot0 == 0 then
										return "up"
									elseif slot0 == 51200 then
										return "down"
									elseif slot0 == 53760 then
										return "stop"
									end

									return nil
								end,
								function (slot0, slot1, slot2)
									return depends("io-dynamic-actuator-controllables-adapter-utils").getFeatures("io:DynamicRollerShutterIOComponent", slot0, slot1, slot2)
								end,
								function (slot0)
									return slot0 * 110
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84059661 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139653634))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4504699139653634), {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4
									}, slot7.deepCopy(slot6.states_4504699139653634), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139653634), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1,
										65540 = slot2,
										48177664 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139129602))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"enter_auxiliary_parameter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"save_settings",
										"invert_rotation",
										"save_flat_slats_position",
										"save_my_position",
										"delete_my_position",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot7 = depends("io-somfy-devices-settings-utils")
									slot8 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot8.deepCopy(slot7.commands_4504699139129602), {
										84082687 = slot2,
										65537 = slot3,
										65540 = slot4,
										48177664 = slot5
									}, slot8.deepCopy(slot7.states_4504699139129602), slot8.deepCopy(slot7.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3,
										65540 = slot4,
										48177664 = slot5
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139129602), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1,
										65540 = slot2,
										48177664 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4505798650757378))
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot7 = depends("io-somfy-devices-settings-utils")
									slot8 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot8.deepCopy(slot7.commands_4504699139129602), {
										84082687 = slot2,
										65537 = slot3,
										65540 = slot4,
										48177664 = slot5
									}, slot8.deepCopy(slot7.states_4505798650757378), slot8.deepCopy(slot7.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3,
										65540 = slot4,
										48177664 = slot5
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4505798650757378), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139129346))
								end,
								function (slot0, slot1, slot2, slot3)
									slot5 = depends("io-somfy-devices-settings-utils")
									slot6 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot6.deepCopy(slot5.commands_4504699139129346), {
										84082687 = slot2,
										65537 = slot3
									}, slot6.deepCopy(slot5.states_4504699139129346), slot6.deepCopy(slot5.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139129346), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29, slot30, slot31, slot32, slot33, slot34, slot35, slot36)
									return depends("io-devices-settings-utils").aggregateConfig({
										84058662 = slot0,
										65537 = slot1,
										84058391 = slot2,
										49217792 = slot3,
										84058368 = slot4,
										84058369 = slot5,
										84058370 = slot6,
										84058371 = slot7,
										84058372 = slot8,
										84058393 = slot9,
										84058394 = slot10,
										84058395 = slot11,
										84058396 = slot12,
										84058373 = slot13,
										84058397 = slot14,
										84058398 = slot15,
										84058399 = slot16,
										84058400 = slot17,
										84058401 = slot18,
										84058375 = slot19,
										84058376 = slot20,
										84058374 = slot21,
										84058377 = slot22,
										84058412 = slot23,
										84058411 = slot24,
										84058378 = slot25,
										84058379 = slot26,
										84058402 = slot27,
										84058380 = slot28,
										84058381 = slot29,
										84058382 = slot30,
										84058383 = slot31,
										84058384 = slot32,
										84058385 = slot33,
										84058386 = slot34,
										84058387 = slot35,
										84058409 = slot36
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139471874))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"start_autolearning",
										"eject_from_setting_mode",
										"set_cells_activation",
										"calibrate_bus_cells",
										"invert_rotation",
										"set_mode_user_total",
										"set_close_tempo_total_mode",
										"set_mode_user_partial",
										"set_close_short_tempo_partial_mode",
										"set_close_long_tempo_partial_mode",
										"set_programmable_safety_input",
										"set_programmable_safety_input_function",
										"set_programmable_safety_input_action",
										"set_wired_control",
										"set_orange_light_prelighting",
										"set_area_lighting_activation",
										"set_area_lighting_tempo",
										"set_auxiliary_control_activation",
										"set_auxiliary_control_tempo",
										"set_lock_output",
										"set_cruising_speed_type_opening",
										"set_docking_area_type_in_opening",
										"set_cruising_speed_type_closing",
										"set_docking_area_type_in_closing",
										"set_docking_area_speed_opening",
										"set_docking_area_speed_closing",
										"set_motor_shift_in_closing",
										"set_motor_shift_in_opening",
										"set_lock_release",
										"set_motor1_closing_torque_limitation",
										"set_motor1_opening_torque_limitation",
										"set_motor1_closing_slowdown_torque_limitation",
										"set_motor1_opening_slowdown_torque_limitation",
										"set_motor2_closing_torque_limitation",
										"set_motor2_opening_torque_limitation",
										"set_motor2_closing_slowdown_torque_limitation",
										"set_motor2_opening_slowdown_torque_limitation",
										"set_settings_lock_status",
										"reset_actuator_settings",
										"reset_io_1W_and_key",
										"refresh_all_access_settings"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29, slot30, slot31, slot32, slot33, slot34, slot35, slot36, slot37, slot38)
									slot40 = depends("io-somfy-devices-settings-utils")
									slot41 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot41.deepCopy(slot40.commands_4504699139471874), {
										84058662 = slot2,
										65537 = slot3,
										84058391 = slot4,
										49217792 = slot5,
										84058368 = slot6,
										84058369 = slot7,
										84058370 = slot8,
										84058371 = slot9,
										84058372 = slot10,
										84058393 = slot11,
										84058394 = slot12,
										84058395 = slot13,
										84058396 = slot14,
										84058373 = slot15,
										84058397 = slot16,
										84058398 = slot17,
										84058399 = slot18,
										84058400 = slot19,
										84058401 = slot20,
										84058375 = slot21,
										84058376 = slot22,
										84058374 = slot23,
										84058377 = slot24,
										84058412 = slot25,
										84058411 = slot26,
										84058378 = slot27,
										84058379 = slot28,
										84058402 = slot29,
										84058380 = slot30,
										84058381 = slot31,
										84058382 = slot32,
										84058383 = slot33,
										84058384 = slot34,
										84058385 = slot35,
										84058386 = slot36,
										84058387 = slot37,
										84058409 = slot38
									}, slot41.deepCopy(slot40.states_4504699139471874), slot41.deepCopy(slot40.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29, slot30, slot31, slot32, slot33, slot34, slot35, slot36, slot37, slot38)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84058662 = slot2,
										65537 = slot3,
										84058391 = slot4,
										49217792 = slot5,
										84058368 = slot6,
										84058369 = slot7,
										84058370 = slot8,
										84058371 = slot9,
										84058372 = slot10,
										84058393 = slot11,
										84058394 = slot12,
										84058395 = slot13,
										84058396 = slot14,
										84058373 = slot15,
										84058397 = slot16,
										84058398 = slot17,
										84058399 = slot18,
										84058400 = slot19,
										84058401 = slot20,
										84058375 = slot21,
										84058376 = slot22,
										84058374 = slot23,
										84058377 = slot24,
										84058412 = slot25,
										84058411 = slot26,
										84058378 = slot27,
										84058379 = slot28,
										84058402 = slot29,
										84058380 = slot30,
										84058381 = slot31,
										84058382 = slot32,
										84058383 = slot33,
										84058384 = slot34,
										84058385 = slot35,
										84058386 = slot36,
										84058387 = slot37,
										84058409 = slot38
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139471874), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14)
									return depends("io-devices-settings-utils").aggregateConfig({
										84058662 = slot0,
										65537 = slot1,
										84058674 = slot2,
										84058391 = slot3,
										84058697 = slot4,
										49217792 = slot5,
										84058368 = slot6,
										84058420 = slot7,
										84058375 = slot8,
										84058376 = slot9,
										84058374 = slot10,
										84058377 = slot11,
										84058411 = slot12,
										84058390 = slot13,
										84058409 = slot14
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139340802))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"start_autolearning",
										"eject_from_setting_mode",
										"set_detailed_actuator_type",
										"set_cells_activation",
										"read_photocells_input_status",
										"calibrate_bus_cells",
										"invert_rotation",
										"set_mode_user_total",
										"set_close_tempo_total_mode",
										"save_partial_position",
										"set_cruising_speed_type_opening",
										"set_docking_area_type_in_opening",
										"set_cruising_speed_type_closing",
										"set_docking_area_type_in_closing",
										"set_docking_area_speed_closing",
										"set_resistance_sensitivity",
										"set_settings_lock_status",
										"reset_actuator_settings",
										"reset_actuator_param",
										"reset_io_1W_and_key",
										"refresh_all_access_settings"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16)
									slot18 = depends("io-somfy-devices-settings-utils")
									slot19 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot19.deepCopy(slot18.commands_4504699139340802), {
										84058662 = slot2,
										65537 = slot3,
										84058674 = slot4,
										84058391 = slot5,
										84058697 = slot6,
										49217792 = slot7,
										84058368 = slot8,
										84058420 = slot9,
										84058375 = slot10,
										84058376 = slot11,
										84058374 = slot12,
										84058377 = slot13,
										84058411 = slot14,
										84058390 = slot15,
										84058409 = slot16
									}, slot19.deepCopy(slot18.states_4504699139340802), slot19.deepCopy(slot18.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84058662 = slot2,
										65537 = slot3,
										84058674 = slot4,
										84058391 = slot5,
										84058697 = slot6,
										49217792 = slot7,
										84058368 = slot8,
										84058420 = slot9,
										84058375 = slot10,
										84058376 = slot11,
										84058374 = slot12,
										84058377 = slot13,
										84058411 = slot14,
										84058390 = slot15,
										84058409 = slot16
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139340802), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84059661 = slot2,
										48177664 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699140112386))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"enter_auxiliary_parameter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"save_settings",
										"invert_rotation",
										"save_evb_tilting_travel",
										"save_my_position",
										"delete_my_position",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot7 = depends("io-somfy-devices-settings-utils")
									slot8 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot8.deepCopy(slot7.commands_4504699140112386), {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4,
										48177664 = slot5
									}, slot8.deepCopy(slot7.states_4504699140112386), slot8.deepCopy(slot7.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4,
										48177664 = slot5
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699140112386), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84059661 = slot2,
										65540 = slot3,
										48177664 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4509097186623490))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"enter_auxiliary_parameter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"save_settings",
										"invert_rotation",
										"save_flat_slats_position",
										"save_evb_tilting_travel",
										"save_my_position",
										"delete_my_position",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									slot8 = depends("io-somfy-devices-settings-utils")
									slot9 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot9.deepCopy(slot8.commands_4509097186623490), {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4,
										65540 = slot5,
										48177664 = slot6
									}, slot9.deepCopy(slot8.states_4509097186623490), slot9.deepCopy(slot8.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4,
										65540 = slot5,
										48177664 = slot6
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4509097186623490), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29, slot30, slot31)
									return depends("io-devices-settings-utils").aggregateConfig({
										84058662 = slot0,
										65537 = slot1,
										84058391 = slot2,
										49217792 = slot3,
										84058368 = slot4,
										84058369 = slot5,
										84058370 = slot6,
										84058371 = slot7,
										84058372 = slot8,
										84058406 = slot9,
										84058392 = slot10,
										84058393 = slot11,
										84058394 = slot12,
										84058395 = slot13,
										84058396 = slot14,
										84058373 = slot15,
										84058397 = slot16,
										84058398 = slot17,
										84058399 = slot18,
										84058400 = slot19,
										84058375 = slot20,
										84058376 = slot21,
										84058374 = slot22,
										84058377 = slot23,
										84058412 = slot24,
										84058411 = slot25,
										84058380 = slot26,
										84058381 = slot27,
										84058382 = slot28,
										84058383 = slot29,
										84058390 = slot30,
										84058409 = slot31
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4512395720866306))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"start_autolearning",
										"eject_from_setting_mode",
										"set_cells_activation",
										"calibrate_bus_cells",
										"invert_rotation",
										"set_mode_user_total",
										"set_close_tempo_total_mode",
										"set_mode_user_partial",
										"set_close_short_tempo_partial_mode",
										"set_close_long_tempo_partial_mode",
										"set_pop_value",
										"set_safety_edge_activation",
										"set_programmable_safety_input",
										"set_programmable_safety_input_function",
										"set_programmable_safety_input_action",
										"set_wired_control",
										"set_orange_light_prelighting",
										"set_area_lighting_activation",
										"set_area_lighting_tempo",
										"set_auxiliary_control_activation",
										"set_auxiliary_control_tempo",
										"set_cruising_speed_type_opening",
										"set_docking_area_type_in_opening",
										"set_cruising_speed_type_closing",
										"set_docking_area_type_in_closing",
										"set_docking_area_speed_opening",
										"set_docking_area_speed_closing",
										"set_motor1_closing_torque_limitation",
										"set_motor1_opening_torque_limitation",
										"set_motor1_closing_slowdown_torque_limitation",
										"set_motor1_opening_slowdown_torque_limitation",
										"set_resistance_sensitivity",
										"set_settings_lock_status",
										"reset_actuator_settings",
										"reset_io_1W_and_key",
										"refresh_all_access_settings"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29, slot30, slot31, slot32, slot33)
									slot35 = depends("io-somfy-devices-settings-utils")
									slot36 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot36.deepCopy(slot35.commands_4512395720866306), {
										84058662 = slot2,
										65537 = slot3,
										84058391 = slot4,
										49217792 = slot5,
										84058368 = slot6,
										84058369 = slot7,
										84058370 = slot8,
										84058371 = slot9,
										84058372 = slot10,
										84058406 = slot11,
										84058392 = slot12,
										84058393 = slot13,
										84058394 = slot14,
										84058395 = slot15,
										84058396 = slot16,
										84058373 = slot17,
										84058397 = slot18,
										84058398 = slot19,
										84058399 = slot20,
										84058400 = slot21,
										84058375 = slot22,
										84058376 = slot23,
										84058374 = slot24,
										84058377 = slot25,
										84058412 = slot26,
										84058411 = slot27,
										84058380 = slot28,
										84058381 = slot29,
										84058382 = slot30,
										84058383 = slot31,
										84058390 = slot32,
										84058409 = slot33
									}, slot36.deepCopy(slot35.states_4512395720866306), slot36.deepCopy(slot35.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29, slot30, slot31, slot32, slot33)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84058662 = slot2,
										65537 = slot3,
										84058391 = slot4,
										49217792 = slot5,
										84058368 = slot6,
										84058369 = slot7,
										84058370 = slot8,
										84058371 = slot9,
										84058372 = slot10,
										84058406 = slot11,
										84058392 = slot12,
										84058393 = slot13,
										84058394 = slot14,
										84058395 = slot15,
										84058396 = slot16,
										84058373 = slot17,
										84058397 = slot18,
										84058398 = slot19,
										84058399 = slot20,
										84058400 = slot21,
										84058375 = slot22,
										84058376 = slot23,
										84058374 = slot24,
										84058377 = slot25,
										84058412 = slot26,
										84058411 = slot27,
										84058380 = slot28,
										84058381 = slot29,
										84058382 = slot30,
										84058383 = slot31,
										84058390 = slot32,
										84058409 = slot33
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4512395720866306), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14)
									return depends("io-devices-settings-utils").aggregateConfig({
										84058662 = slot0,
										65537 = slot1,
										84058391 = slot2,
										84058392 = slot3,
										84058697 = slot4,
										49217792 = slot5,
										84058368 = slot6,
										84058420 = slot7,
										84058375 = slot8,
										84058376 = slot9,
										84058374 = slot10,
										84058377 = slot11,
										84058411 = slot12,
										84058390 = slot13,
										84058409 = slot14
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4516793767377410))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"start_autolearning",
										"eject_from_setting_mode",
										"set_cells_activation",
										"read_photocells_input_status",
										"calibrate_bus_cells",
										"invert_rotation",
										"set_mode_user_total",
										"set_close_tempo_total_mode",
										"save_partial_position",
										"set_safety_edge_activation",
										"set_cruising_speed_type_opening",
										"set_docking_area_type_in_opening",
										"set_cruising_speed_type_closing",
										"set_docking_area_type_in_closing",
										"set_docking_area_speed_closing",
										"set_resistance_sensitivity",
										"set_settings_lock_status",
										"reset_actuator_settings",
										"reset_actuator_param",
										"reset_io_1W_and_key",
										"refresh_all_access_settings"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16)
									slot18 = depends("io-somfy-devices-settings-utils")
									slot19 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot19.deepCopy(slot18.commands_4516793767377410), {
										84058662 = slot2,
										65537 = slot3,
										84058391 = slot4,
										84058392 = slot5,
										84058697 = slot6,
										49217792 = slot7,
										84058368 = slot8,
										84058420 = slot9,
										84058375 = slot10,
										84058376 = slot11,
										84058374 = slot12,
										84058377 = slot13,
										84058411 = slot14,
										84058390 = slot15,
										84058409 = slot16
									}, slot19.deepCopy(slot18.states_4516793767377410), slot19.deepCopy(slot18.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84058662 = slot2,
										65537 = slot3,
										84058391 = slot4,
										84058392 = slot5,
										84058697 = slot6,
										49217792 = slot7,
										84058368 = slot8,
										84058420 = slot9,
										84058375 = slot10,
										84058376 = slot11,
										84058374 = slot12,
										84058377 = slot13,
										84058411 = slot14,
										84058390 = slot15,
										84058409 = slot16
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4516793767377410), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699140389378))
								end,
								function (slot0)
									return {
										"save_my_position",
										"delete_my_position",
										"set_timeout_timer",
										"set_timeout_timer_value",
										"reset_actuator",
										"double_power_cut"
									}
								end,
								function (slot0, slot1, slot2, slot3)
									slot5 = depends("io-somfy-devices-settings-utils")
									slot6 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot6.deepCopy(slot5.commands_4504699140389378), {
										84059651 = slot2,
										65537 = slot3
									}, slot6.deepCopy(slot5.states_4504699140389378), slot6.deepCopy(slot5.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699140389378), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4506898162385154), {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4
									}, slot7.deepCopy(slot6.states_4504699139653634), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4505798650757122), {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4
									}, slot7.deepCopy(slot6.states_4504699139653634), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29, slot30, slot31, slot32, slot33, slot34, slot35, slot36, slot37)
									return depends("io-devices-settings-utils").aggregateConfig({
										84058662 = slot0,
										65537 = slot1,
										84058391 = slot2,
										49217792 = slot3,
										84058368 = slot4,
										84058369 = slot5,
										84058370 = slot6,
										84058371 = slot7,
										84058372 = slot8,
										84058393 = slot9,
										84058394 = slot10,
										84058395 = slot11,
										84058396 = slot12,
										84058373 = slot13,
										84058397 = slot14,
										84058398 = slot15,
										84058399 = slot16,
										84058400 = slot17,
										84058401 = slot18,
										84058375 = slot19,
										84058376 = slot20,
										84058374 = slot21,
										84058377 = slot22,
										84058412 = slot23,
										84058411 = slot24,
										84058378 = slot25,
										84058379 = slot26,
										84058402 = slot27,
										84058404 = slot28,
										84058380 = slot29,
										84058381 = slot30,
										84058382 = slot31,
										84058383 = slot32,
										84058384 = slot33,
										84058385 = slot34,
										84058386 = slot35,
										84058387 = slot36,
										84058409 = slot37
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4527788883655170))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"start_autolearning",
										"eject_from_setting_mode",
										"set_cells_activation",
										"calibrate_bus_cells",
										"invert_rotation",
										"set_mode_user_total",
										"set_close_tempo_total_mode",
										"set_mode_user_partial",
										"set_close_short_tempo_partial_mode",
										"set_close_long_tempo_partial_mode",
										"set_programmable_safety_input",
										"set_programmable_safety_input_function",
										"set_programmable_safety_input_action",
										"set_wired_control",
										"set_orange_light_prelighting",
										"set_area_lighting_activation",
										"set_area_lighting_tempo",
										"set_auxiliary_control_activation",
										"set_auxiliary_control_tempo",
										"set_lock_output",
										"set_cruising_speed_type_opening",
										"set_docking_area_type_in_opening",
										"set_cruising_speed_type_closing",
										"set_docking_area_type_in_closing",
										"set_docking_area_speed_opening",
										"set_docking_area_speed_closing",
										"set_motor_shift_in_closing",
										"set_motor_shift_in_opening",
										"set_lock_release",
										"set_additional_thrust_in_closing",
										"set_motor1_closing_torque_limitation",
										"set_motor1_opening_torque_limitation",
										"set_motor1_closing_slowdown_torque_limitation",
										"set_motor1_opening_slowdown_torque_limitation",
										"set_motor2_closing_torque_limitation",
										"set_motor2_opening_torque_limitation",
										"set_motor2_closing_slowdown_torque_limitation",
										"set_motor2_opening_slowdown_torque_limitation",
										"set_settings_lock_status",
										"reset_actuator_settings",
										"reset_io_1W_and_key",
										"refresh_all_access_settings"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29, slot30, slot31, slot32, slot33, slot34, slot35, slot36, slot37, slot38, slot39)
									slot41 = depends("io-somfy-devices-settings-utils")
									slot42 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot42.deepCopy(slot41.commands_4527788883655170), {
										84058662 = slot2,
										65537 = slot3,
										84058391 = slot4,
										49217792 = slot5,
										84058368 = slot6,
										84058369 = slot7,
										84058370 = slot8,
										84058371 = slot9,
										84058372 = slot10,
										84058393 = slot11,
										84058394 = slot12,
										84058395 = slot13,
										84058396 = slot14,
										84058373 = slot15,
										84058397 = slot16,
										84058398 = slot17,
										84058399 = slot18,
										84058400 = slot19,
										84058401 = slot20,
										84058375 = slot21,
										84058376 = slot22,
										84058374 = slot23,
										84058377 = slot24,
										84058412 = slot25,
										84058411 = slot26,
										84058378 = slot27,
										84058379 = slot28,
										84058402 = slot29,
										84058404 = slot30,
										84058380 = slot31,
										84058381 = slot32,
										84058382 = slot33,
										84058383 = slot34,
										84058384 = slot35,
										84058385 = slot36,
										84058386 = slot37,
										84058387 = slot38,
										84058409 = slot39
									}, slot42.deepCopy(slot41.states_4527788883655170), slot42.deepCopy(slot41.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29, slot30, slot31, slot32, slot33, slot34, slot35, slot36, slot37, slot38, slot39)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84058662 = slot2,
										65537 = slot3,
										84058391 = slot4,
										49217792 = slot5,
										84058368 = slot6,
										84058369 = slot7,
										84058370 = slot8,
										84058371 = slot9,
										84058372 = slot10,
										84058393 = slot11,
										84058394 = slot12,
										84058395 = slot13,
										84058396 = slot14,
										84058373 = slot15,
										84058397 = slot16,
										84058398 = slot17,
										84058399 = slot18,
										84058400 = slot19,
										84058401 = slot20,
										84058375 = slot21,
										84058376 = slot22,
										84058374 = slot23,
										84058377 = slot24,
										84058412 = slot25,
										84058411 = slot26,
										84058378 = slot27,
										84058379 = slot28,
										84058402 = slot29,
										84058404 = slot30,
										84058380 = slot31,
										84058381 = slot32,
										84058382 = slot33,
										84058383 = slot34,
										84058384 = slot35,
										84058385 = slot36,
										84058386 = slot37,
										84058387 = slot38,
										84058409 = slot39
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4527788883655170), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1)
									return depends("io-devices-settings-utils").aggregateConfig({
										65537 = slot0,
										84059651 = slot1
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139981826))
								end,
								function (slot0)
									return {
										"save_my_position",
										"delete_my_position",
										"set_timeout_timer",
										"set_timeout_timer_value",
										"set_recovered_state_after_power_cut",
										"set_wired_input_type",
										"reset_actuator"
									}
								end,
								function (slot0, slot1, slot2, slot3)
									slot5 = depends("io-somfy-devices-settings-utils")
									slot6 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot6.deepCopy(slot5.commands_4504699139981826), {
										65537 = slot2,
										84059651 = slot3
									}, slot6.deepCopy(slot5.states_4504699139981826), slot6.deepCopy(slot5.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										65537 = slot2,
										84059651 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139981826), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										65537 = slot0,
										84059656 = slot1,
										84059651 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139391490))
								end,
								function (slot0)
									return {
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"eject_from_setting_mode",
										"save_my_position",
										"delete_my_position",
										"set_load_AC_drive_request",
										"set_recovered_state_after_power_cut",
										"set_wired_input_type",
										"reset_actuator"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4504699139391490), {
										65537 = slot2,
										84059656 = slot3,
										84059651 = slot4
									}, slot7.deepCopy(slot6.states_4504699139391490), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										65537 = slot2,
										84059656 = slot3,
										84059651 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139391490), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84082687 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4513495233134594))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"save_my_position",
										"delete_my_position",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4513495233134594), {
										84059651 = slot2,
										65537 = slot3,
										84082687 = slot4
									}, slot7.deepCopy(slot6.states_4513495233134594), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84082687 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4513495233134594), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"enter_auxiliary_parameter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"save_settings",
										"save_flat_slats_position",
										"save_evb_tilting_travel",
										"save_my_position",
										"delete_my_position",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									slot8 = depends("io-somfy-devices-settings-utils")
									slot9 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot9.deepCopy(slot8.commands_4517893279645698), {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4,
										65540 = slot5,
										48177664 = slot6
									}, slot9.deepCopy(slot8.states_4509097186623490), slot9.deepCopy(slot8.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84082687 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4522291326156802))
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4513495233134594), {
										84059651 = slot2,
										65537 = slot3,
										84082687 = slot4
									}, slot7.deepCopy(slot6.states_4522291326156802), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84082687 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4522291326156802), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84082687 = slot2,
										65540 = slot3,
										48177664 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4526689372667906))
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									slot8 = depends("io-somfy-devices-settings-utils")
									slot9 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot9.deepCopy(slot8.commands_4517893279645698), {
										84059651 = slot2,
										65537 = slot3,
										84082687 = slot4,
										65540 = slot5,
										48177664 = slot6
									}, slot9.deepCopy(slot8.states_4526689372667906), slot9.deepCopy(slot8.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84082687 = slot4,
										65540 = slot5,
										48177664 = slot6
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4526689372667906), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4505798651034114))
								end,
								function (slot0)
									return {
										"save_my_position",
										"delete_my_position",
										"reset_actuator",
										"double_power_cut"
									}
								end,
								function (slot0, slot1, slot2, slot3)
									slot5 = depends("io-somfy-devices-settings-utils")
									slot6 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot6.deepCopy(slot5.commands_4505798651034114), {
										84059651 = slot2,
										65537 = slot3
									}, slot6.deepCopy(slot5.states_4505798651034114), slot6.deepCopy(slot5.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4505798651034114), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										48170496 = slot2,
										84059658 = slot3,
										84059664 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139194882))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"set_auto_end_limits",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"set_unstressing_status",
										"set_obstacle_detection",
										"set_type_lock",
										"save_auxiliary_end_limit_entry",
										"save_auxiliary_end_limit_exit",
										"set_curtain_outstretching_level",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode",
										"set_x_time"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									slot8 = depends("io-somfy-devices-settings-utils")
									slot9 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot9.deepCopy(slot8.commands_4504699139194882), {
										84059651 = slot2,
										65537 = slot3,
										48170496 = slot4,
										84059658 = slot5,
										84059664 = slot6
									}, slot9.deepCopy(slot8.states_4504699139194882), slot9.deepCopy(slot8.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										48170496 = slot4,
										84059658 = slot5,
										84059664 = slot6
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699139194882), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"set_auto_end_limits",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"set_unstressing_status",
										"set_obstacle_detection",
										"set_type_lock",
										"save_auxiliary_end_limit_entry",
										"save_auxiliary_end_limit_exit",
										"set_curtain_outstretching_level",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode",
										"enter_back_impulse_setting_mode",
										"save_back_impulse_position",
										"set_x_time"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									slot8 = depends("io-somfy-devices-settings-utils")
									slot9 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot9.deepCopy(slot8.commands_4509097185705986), {
										84059651 = slot2,
										65537 = slot3,
										48170496 = slot4,
										84059658 = slot5,
										84059664 = slot6
									}, slot9.deepCopy(slot8.states_4504699139194882), slot9.deepCopy(slot8.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84059664 = slot2,
										84059659 = slot3,
										65540 = slot4,
										84059658 = slot5
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4531087419179010))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"enter_auxiliary_parameter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"save_settings",
										"save_flat_slats_position",
										"save_evb_tilting_travel",
										"set_evb_tilting_travel_pulse",
										"save_my_position",
										"delete_my_position",
										"set_choregraphy_disable_variator_down_move_min",
										"set_choregraphy_disable_variator_up_move_min",
										"set_choregraphy_enable_variator_down_move_min",
										"set_choregraphy_enable_variator_up_move_min",
										"set_kinematics",
										"set_obstacle_detection",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode",
										"set_x_time"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
									slot9 = depends("io-somfy-devices-settings-utils")
									slot10 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot10.deepCopy(slot9.commands_4531087419179010), {
										84059651 = slot2,
										65537 = slot3,
										84059664 = slot4,
										84059659 = slot5,
										65540 = slot6,
										84059658 = slot7
									}, slot10.deepCopy(slot9.states_4531087419179010), slot10.deepCopy(slot9.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84059664 = slot4,
										84059659 = slot5,
										65540 = slot6,
										84059658 = slot7
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4531087419179010), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84059664 = slot2,
										65540 = slot3,
										84059658 = slot4,
										84059659 = slot5
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4531087419179010))
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
									slot9 = depends("io-somfy-devices-settings-utils")
									slot10 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot10.deepCopy(slot9.commands_4535485465690114), {
										84059651 = slot2,
										65537 = slot3,
										84059664 = slot4,
										65540 = slot5,
										84059658 = slot6,
										84059659 = slot7
									}, slot10.deepCopy(slot9.states_4531087419179010), slot10.deepCopy(slot9.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84059664 = slot4,
										65540 = slot5,
										84059658 = slot6,
										84059659 = slot7
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4531087419179010), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4506898162384898), {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4
									}, slot7.deepCopy(slot6.states_4504699139653634), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4507997674012674), {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4
									}, slot7.deepCopy(slot6.states_4504699139653634), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1,
										84059651 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4509097185640450))
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4504699139129346), {
										84082687 = slot2,
										65537 = slot3,
										84059651 = slot4
									}, slot7.deepCopy(slot6.states_4509097185640450), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3,
										84059651 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4509097185640450), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4510196697268226), {
										84082687 = slot2,
										65537 = slot3,
										84059651 = slot4
									}, slot7.deepCopy(slot6.states_4509097185640450), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1,
										84059651 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4511296208896002))
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4510196697268226), {
										84082687 = slot2,
										65537 = slot3,
										84059651 = slot4
									}, slot7.deepCopy(slot6.states_4511296208896002), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3,
										84059651 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4511296208896002), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1)
									return depends("io-devices-settings-utils").aggregateConfig({
										49020928 = slot0,
										65537 = slot1
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4512395720523778))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"set_auto_end_limits",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3)
									slot5 = depends("io-somfy-devices-settings-utils")
									slot6 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot6.deepCopy(slot5.commands_4512395720523778), {
										49020928 = slot2,
										65537 = slot3
									}, slot6.deepCopy(slot5.states_4512395720523778), slot6.deepCopy(slot5.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										49020928 = slot2,
										65537 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4512395720523778), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1)
									return depends("io-devices-settings-utils").aggregateConfig({
										49020928 = slot0,
										65537 = slot1
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4513495232151554))
								end,
								function (slot0, slot1, slot2, slot3)
									slot5 = depends("io-somfy-devices-settings-utils")
									slot6 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot6.deepCopy(slot5.commands_4512395720523778), {
										49020928 = slot2,
										65537 = slot3
									}, slot6.deepCopy(slot5.states_4513495232151554), slot6.deepCopy(slot5.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										49020928 = slot2,
										65537 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4513495232151554), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4514594743779330))
								end,
								function (slot0, slot1, slot2, slot3)
									slot5 = depends("io-somfy-devices-settings-utils")
									slot6 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot6.deepCopy(slot5.commands_4506898162385154), {
										84082687 = slot2,
										65537 = slot3
									}, slot6.deepCopy(slot5.states_4514594743779330), slot6.deepCopy(slot5.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4514594743779330), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4515694255407106))
								end,
								function (slot0, slot1, slot2, slot3)
									slot5 = depends("io-somfy-devices-settings-utils")
									slot6 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot6.deepCopy(slot5.commands_4515694255407106), {
										84082687 = slot2,
										65537 = slot3
									}, slot6.deepCopy(slot5.states_4515694255407106), slot6.deepCopy(slot5.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4515694255407106), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									slot5 = depends("io-somfy-devices-settings-utils")
									slot6 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot6.deepCopy(slot5.commands_4506898162385154), {
										84082687 = slot2,
										65537 = slot3
									}, slot6.deepCopy(slot5.states_4515694255407106), slot6.deepCopy(slot5.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4504699140898818), {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4
									}, slot7.deepCopy(slot6.states_4504699139653634), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1,
										48170496 = slot2,
										48171008 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699140047106))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"set_unstressing_status",
										"set_dbe_up",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot7 = depends("io-somfy-devices-settings-utils")
									slot8 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot8.deepCopy(slot7.commands_4504699140047106), {
										84082687 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5
									}, slot8.deepCopy(slot7.states_4504699140047106), slot8.deepCopy(slot7.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699140047106), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1,
										48171008 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4505798651674882))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"set_auto_end_limits",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"set_dbe_up",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4505798651674882), {
										84082687 = slot2,
										65537 = slot3,
										48171008 = slot4
									}, slot7.deepCopy(slot6.states_4505798651674882), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3,
										48171008 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4505798651674882), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1,
										48171008 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4506898163302658))
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4505798651674882), {
										84082687 = slot2,
										65537 = slot3,
										48171008 = slot4
									}, slot7.deepCopy(slot6.states_4506898163302658), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3,
										48171008 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4506898163302658), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1,
										48171008 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4513495232217090))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"set_dbe_down",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4513495232217090), {
										84082687 = slot2,
										65537 = slot3,
										48171008 = slot4
									}, slot7.deepCopy(slot6.states_4513495232217090), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3,
										48171008 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4513495232217090), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4517893278728194), {
										84082687 = slot2,
										65537 = slot3,
										48171008 = slot4
									}, slot7.deepCopy(slot6.states_4513495232217090), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4520092301918210), {
										84082687 = slot2,
										65537 = slot3,
										84059651 = slot4
									}, slot7.deepCopy(slot6.states_4511296208896002), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
									return depends("io-devices-settings-utils").aggregateConfig({
										84058662 = slot0,
										65537 = slot1,
										49217792 = slot2,
										84058368 = slot3,
										84058420 = slot4,
										84058391 = slot5,
										84058697 = slot6,
										84058627 = slot7,
										84058399 = slot8,
										84058409 = slot9
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4517893278874114))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"eject_from_setting_mode",
										"set_cells_activation",
										"read_photocells_input_status",
										"invert_rotation",
										"set_mode_user_total",
										"set_close_tempo_total_mode",
										"set_safety_edge_technology",
										"set_auxiliary_control_activation",
										"set_settings_lock_status",
										"reset_actuator_settings",
										"reset_actuator_param",
										"reset_io_1W_and_key",
										"refresh_all_access_settings"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11)
									slot13 = depends("io-somfy-devices-settings-utils")
									slot14 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot14.deepCopy(slot13.commands_4517893278874114), {
										84058662 = slot2,
										65537 = slot3,
										49217792 = slot4,
										84058368 = slot5,
										84058420 = slot6,
										84058391 = slot7,
										84058697 = slot8,
										84058627 = slot9,
										84058399 = slot10,
										84058409 = slot11
									}, slot14.deepCopy(slot13.states_4517893278874114), slot14.deepCopy(slot13.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84058662 = slot2,
										65537 = slot3,
										49217792 = slot4,
										84058368 = slot5,
										84058420 = slot6,
										84058391 = slot7,
										84058697 = slot8,
										84058627 = slot9,
										84058399 = slot10,
										84058409 = slot11
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4517893278874114), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84059671 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4521191813545986))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"set_auto_end_limits",
										"set_auto_upper_end_limit",
										"set_auto_lower_end_limit",
										"save_settings",
										"invert_rotation",
										"set_smart_protect",
										"set_open_level",
										"set_security_level",
										"set_discreet_mode_speed",
										"set_nominal_mode_speed",
										"set_soft_start",
										"set_soft_stop",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4521191813545986), {
										84059651 = slot2,
										65537 = slot3,
										84059671 = slot4
									}, slot7.deepCopy(slot6.states_4521191813545986), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84059671 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4521191813545986), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84059671 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4525589860057090))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"set_auto_end_limits",
										"set_auto_upper_end_limit",
										"set_auto_lower_end_limit",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"set_open_level",
										"set_security_level",
										"set_discreet_mode_speed",
										"set_nominal_mode_speed",
										"set_soft_start",
										"set_soft_stop",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4525589860057090), {
										84059651 = slot2,
										65537 = slot3,
										84059671 = slot4
									}, slot7.deepCopy(slot6.states_4525589860057090), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84059671 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4525589860057090), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"set_auto_end_limits",
										"set_auto_upper_end_limit",
										"set_auto_lower_end_limit",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"set_smart_protect",
										"set_open_level",
										"set_security_level",
										"set_discreet_mode_speed",
										"set_nominal_mode_speed",
										"set_soft_start",
										"set_soft_stop",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4531087418195970), {
										84059651 = slot2,
										65537 = slot3,
										84059671 = slot4
									}, slot7.deepCopy(slot6.states_4521191813545986), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84059671 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4554177162379266))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"set_auto_end_limits",
										"set_auto_upper_end_limit",
										"set_auto_lower_end_limit",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"set_smart_protect",
										"set_knx",
										"set_open_level",
										"set_security_level",
										"set_discreet_mode_speed",
										"set_nominal_mode_speed",
										"set_soft_start",
										"set_soft_stop",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4554177162379266), {
										84059651 = slot2,
										65537 = slot3,
										84059671 = slot4
									}, slot7.deepCopy(slot6.states_4554177162379266), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84059671 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4554177162379266), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059649 = slot0,
										84059668 = slot1,
										84059669 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4584963487956994))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"set_auto_end_limits",
										"set_auto_upper_end_limit",
										"set_auto_lower_end_limit",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"set_open_level",
										"set_security_level",
										"set_discreet_mode_speed",
										"set_nominal_mode_speed",
										"set_soft_start",
										"set_soft_stop",
										"set_smart_protect",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode",
										"set_OEM_Battery_Reference",
										"set_OEM_Battery_Name",
										"set_OEM_SolarPanel_Reference",
										"set_OEM_SolarPanel_Name"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4584963487956994), {
										84059651 = slot2,
										65537 = slot3,
										84059671 = slot4
									}, slot7.deepCopy(slot6.states_4521191813545986), slot7.deepCopy(slot6.diagnosticStatesGroups_4584963487956994), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84059671 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4521191813545986), {
										84059649 = p6,
										84059668 = p7,
										84059669 = p8
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4584963487956994), context)
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"set_auto_end_limits",
										"set_auto_upper_end_limit",
										"set_auto_lower_end_limit",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"set_open_level",
										"set_security_level",
										"set_discreet_mode_speed",
										"set_soft_start",
										"set_soft_stop",
										"set_smart_protect",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode",
										"set_OEM_Battery_Reference",
										"set_OEM_Battery_Name",
										"set_OEM_SolarPanel_Reference",
										"set_OEM_SolarPanel_Name"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4587162511212546), {
										84059651 = slot2,
										65537 = slot3,
										84059671 = slot4
									}, slot7.deepCopy(slot6.states_4521191813545986), slot7.deepCopy(slot6.diagnosticStatesGroups_4584963487956994), context)
								end,
								function (slot0, slot1, slot2)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84059666 = slot2
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699140768002))
								end,
								function (slot0)
									return {
										"invert_rotation",
										"enter_settings_mode",
										"reset_end_limits",
										"read_end_limits_states",
										"set_application",
										"save_my_position",
										"delete_my_position",
										"set_ventilation_lock",
										"set_timeout_timer",
										"set_timeout_timer_value",
										"reset_actuator",
										"double_power_cut"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4504699140768002), {
										84059651 = slot2,
										65537 = slot3,
										84059666 = slot4
									}, slot7.deepCopy(slot6.states_4504699140768002), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84059666 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699140768002), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84059666 = slot2,
										84059658 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4505798652395778))
								end,
								function (slot0)
									return {
										"invert_rotation",
										"enter_settings_mode",
										"reset_end_limits",
										"read_end_limits_states",
										"set_application",
										"set_eld_level",
										"save_my_position",
										"delete_my_position",
										"set_ventilation_lock",
										"set_timeout_timer",
										"set_timeout_timer_value",
										"reset_actuator",
										"double_power_cut"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot7 = depends("io-somfy-devices-settings-utils")
									slot8 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot8.deepCopy(slot7.commands_4505798652395778), {
										84059651 = slot2,
										65537 = slot3,
										84059666 = slot4,
										84059658 = slot5
									}, slot8.deepCopy(slot7.states_4505798652395778), slot8.deepCopy(slot7.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84059666 = slot4,
										84059658 = slot5
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4505798652395778), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4504699140046850), {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4
									}, slot7.deepCopy(slot6.states_4504699139653634), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84059661 = slot2,
										84059657 = slot3,
										84059659 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699140243458))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"save_my_position",
										"delete_my_position",
										"set_running_time_up",
										"set_tilting_time",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									slot8 = depends("io-somfy-devices-settings-utils")
									slot9 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot9.deepCopy(slot8.commands_4504699140243458), {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4,
										84059657 = slot5,
										84059659 = slot6
									}, slot9.deepCopy(slot8.states_4504699140243458), slot9.deepCopy(slot8.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84059661 = slot4,
										84059657 = slot5,
										84059659 = slot6
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4504699140243458), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										48170496 = slot2,
										48171008 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4506898163302402))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"set_unstressing_status",
										"set_dbe_up",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode",
										"enter_back_impulse_setting_mode",
										"save_back_impulse_position"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot7 = depends("io-somfy-devices-settings-utils")
									slot8 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot8.deepCopy(slot7.commands_4506898163302402), {
										84059651 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5
									}, slot8.deepCopy(slot7.states_4506898163302402), slot8.deepCopy(slot7.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4506898163302402), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										48170496 = slot2,
										48171008 = slot3,
										84059664 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4507997674930178))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"set_unstressing_status",
										"set_dbe_up",
										"set_application",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode",
										"enter_back_impulse_setting_mode",
										"save_back_impulse_position",
										"set_x_time"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									slot8 = depends("io-somfy-devices-settings-utils")
									slot9 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot9.deepCopy(slot8.commands_4507997674930178), {
										84059651 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5,
										84059664 = slot6
									}, slot9.deepCopy(slot8.states_4507997674930178), slot9.deepCopy(slot8.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5,
										84059664 = slot6
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4507997674930178), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									return depends("io-devices-settings-utils").aggregateConfig({
										84059651 = slot0,
										65537 = slot1,
										84059659 = slot2,
										48171008 = slot3,
										84059664 = slot4
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4535485464772610))
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									slot8 = depends("io-somfy-devices-settings-utils")
									slot9 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot9.deepCopy(slot8.commands_4535485464772610), {
										84059651 = slot2,
										65537 = slot3,
										84059659 = slot4,
										48171008 = slot5,
										84059664 = slot6
									}, slot9.deepCopy(slot8.states_4535485464772610), slot9.deepCopy(slot8.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84059651 = slot2,
										65537 = slot3,
										84059659 = slot4,
										48171008 = slot5,
										84059664 = slot6
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4535485464772610), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1,
										48170496 = slot2,
										48171008 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4509097186557954))
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot7 = depends("io-somfy-devices-settings-utils")
									slot8 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot8.deepCopy(slot7.commands_4509097186557954), {
										84082687 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5
									}, slot8.deepCopy(slot7.states_4509097186557954), slot8.deepCopy(slot7.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4509097186557954), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot7 = depends("io-somfy-devices-settings-utils")
									slot8 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot8.deepCopy(slot7.commands_4510196698185730), {
										84082687 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5
									}, slot8.deepCopy(slot7.states_4509097186557954), slot8.deepCopy(slot7.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot7 = depends("io-somfy-devices-settings-utils")
									slot8 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot8.deepCopy(slot7.commands_4511296209813506), {
										84082687 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5
									}, slot8.deepCopy(slot7.states_4509097186557954), slot8.deepCopy(slot7.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1,
										48170496 = slot2,
										48171008 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4512395721441282))
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot7 = depends("io-somfy-devices-settings-utils")
									slot8 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot8.deepCopy(slot7.commands_4512395721441282), {
										84082687 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5
									}, slot8.deepCopy(slot7.states_4512395721441282), slot8.deepCopy(slot7.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4512395721441282), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1,
										48170496 = slot2,
										48171008 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4513495233069058))
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot7 = depends("io-somfy-devices-settings-utils")
									slot8 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot8.deepCopy(slot7.commands_4512395721441282), {
										84082687 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5
									}, slot8.deepCopy(slot7.states_4513495233069058), slot8.deepCopy(slot7.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3,
										48170496 = slot4,
										48171008 = slot5
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4513495233069058), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4515694256324610))
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"save_settings",
										"invert_rotation",
										"save_my_position",
										"delete_my_position",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode",
										"enter_back_impulse_setting_mode",
										"save_back_impulse_position"
									}
								end,
								function (slot0, slot1, slot2, slot3)
									slot5 = depends("io-somfy-devices-settings-utils")
									slot6 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot6.deepCopy(slot5.commands_4515694256324610), {
										84082687 = slot2,
										65537 = slot3
									}, slot6.deepCopy(slot5.states_4515694256324610), slot6.deepCopy(slot5.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4515694256324610), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									slot5 = depends("io-somfy-devices-settings-utils")
									slot6 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot6.deepCopy(slot5.commands_4516793767952386), {
										84082687 = slot2,
										65537 = slot3
									}, slot6.deepCopy(slot5.states_4515694256324610), slot6.deepCopy(slot5.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4517893279580162))
								end,
								function (slot0, slot1, slot2, slot3)
									slot5 = depends("io-somfy-devices-settings-utils")
									slot6 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot6.deepCopy(slot5.commands_4516793767952386), {
										84082687 = slot2,
										65537 = slot3
									}, slot6.deepCopy(slot5.states_4517893279580162), slot6.deepCopy(slot5.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4517893279580162), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0)
									return {
										"dead_man_up",
										"dead_man_down",
										"dead_man_stop",
										"dead_man_impulse_up",
										"dead_man_impulse_down",
										"enter_settings_mode",
										"save_upper_end_limit",
										"save_lower_end_limit",
										"stop_after_save_limit",
										"save_settings",
										"invert_rotation",
										"start_auto_learning",
										"save_my_position",
										"delete_my_position",
										"reset_actuator",
										"double_power_cut",
										"eject_from_setting_mode"
									}
								end,
								function (slot0, slot1, slot2, slot3, slot4)
									slot6 = depends("io-somfy-devices-settings-utils")
									slot7 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot7.deepCopy(slot6.commands_4581664953073666), {
										84082687 = slot2,
										65537 = slot3,
										84059651 = slot4
									}, slot7.deepCopy(slot6.states_4511296208896002), slot7.deepCopy(slot6.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3)
									return depends("io-devices-settings-utils").aggregateConfig({
										84082687 = slot0,
										65537 = slot1,
										65540 = slot2,
										48177664 = slot3
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4507997674012930))
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									slot7 = depends("io-somfy-devices-settings-utils")
									slot8 = depends("common_utils")

									return depends("io-devices-settings-utils").runConfig(slot0, slot1, slot8.deepCopy(slot7.commands_4504699139129602), {
										84082687 = slot2,
										65537 = slot3,
										65540 = slot4,
										48177664 = slot5
									}, slot8.deepCopy(slot7.states_4507997674012930), slot8.deepCopy(slot7.diagnosticStatesGroups_4504699139653634), context)
								end,
								function (slot0, slot1, slot2, slot3, slot4, slot5)
									return depends("io-devices-settings-utils").advancedRefresh(slot0, slot1, {
										84082687 = slot2,
										65537 = slot3,
										65540 = slot4,
										48177664 = slot5
									}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").states_4507997674012930), {}, depends("common_utils").deepCopy(depends("io-somfy-devices-settings-utils").diagnosticStatesGroups_4504699139653634), context)
								end
							})[1]
						},
						{
							stateName = "core:LevelState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ({
								[0] = {
									periodic = "1h",
									onRefreshAll = true,
									onStart = true
								},
								{
									onRefreshAll = false,
									onStart = true
								},
								{
									periodic = "168h",
									onRefreshAll = false,
									onStart = true
								},
								{
									onRefreshAll = true,
									onStart = true
								},
								{
									periodic = "48h",
									onRefreshAll = false,
									onStart = true
								},
								{
									onRefreshAll = true,
									onStart = true,
									calendar = ({
										[0] = {
											kind = "DAILY",
											startHour = 0,
											endHour = 24
										}
									})[0]
								},
								{
									periodic = "10m",
									onRefreshAll = true,
									onStart = true
								},
								{
									onRefreshAll = false,
									onStart = false,
									calendar = ()[0]
								},
								{
									periodic = "30m",
									onRefreshAll = true,
									onStart = true
								},
								{
									periodic = "1h",
									onRefreshAll = false,
									onStart = true
								},
								{
									periodic = "10m",
									onRefreshAll = false,
									onStart = false
								},
								{
									periodic = "24m",
									onRefreshAll = false,
									onStart = false
								},
								{
									periodic = "1h",
									onRefreshAll = false,
									onStart = false
								}
							})[0],
							converter = ()[2]
						},
						{
							stateName = "core:NameState",
							parameters = {
								{
									rawStateId = "1",
									name = "p1"
								}
							},
							refresh = ()[1],
							converter = ()[3]
						},
						{
							stateName = "core:RSSILevelState",
							parameters = {
								{
									rawStateId = "2146500638",
									name = "p1"
								}
							},
							converter = ()[4]
						},
						{
							stateName = "core:StatusState",
							parameters = {
								{
									rawStateId = "2147426304",
									name = "p1"
								}
							},
							converter = ()[5]
						},
						{
							stateName = "core:ClosureState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[2]
						},
						{
							stateName = "core:Memorized1PositionState",
							parameters = {
								{
									rawStateId = "16832512",
									name = "p1"
								}
							},
							refresh = ()[2],
							converter = ()[2]
						},
						{
							stateName = "core:OpenClosedState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[20]
						},
						{
							stateName = "core:SecuredPositionState",
							parameters = {
								{
									rawStateId = "16832522",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[2]
						},
						{
							stateName = "core:SlateOrientationState",
							parameters = {
								{
									rawStateId = "65538",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[2]
						},
						{
							stateName = "core:TargetClosureState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "16832512",
									name = "p3"
								},
								{
									rawStateId = "16832522",
									name = "p4"
								}
							},
							converter = ()[21]
						},
						{
							stateName = "core:MovingState",
							parameters = {
								{
									name = "p1",
									rawStateId = "65557",
									converter = ()[22]
								}
							},
							converter = ()[23]
						},
						{
							stateName = "core:OpenClosedState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[29]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "2",
									name = "p1"
								}
							},
							converter = ()[30]
						},
						{
							stateName = "core:ManufacturerDiagnosticsState",
							parameters = {
								{
									rawStateId = "2",
									name = "p1"
								}
							},
							converter = ()[30]
						},
						{
							stateName = "core:AdditionalStatusState",
							parameters = {
								{
									rawStateId = "2146500645",
									name = "p1"
								}
							},
							converter = ()[31]
						},
						{
							stateName = "core:ClosureOrRockerPositionState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[37]
						},
						{
							stateName = "core:ClosureState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[38]
						},
						{
							stateName = "core:SlateOrientationState",
							parameters = {
								{
									rawStateId = "65540",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[2]
						},
						{
							stateName = "core:ProjectionAngleState",
							parameters = {
								{
									rawStateId = "65546",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[2]
						},
						{
							stateName = "core:DeploymentState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[2]
						},
						{
							stateName = "core:ClosureState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[47]
						},
						{
							stateName = "core:OpenClosedUnknownState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[48]
						},
						{
							stateName = "core:LightIntensityState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[51]
						},
						{
							stateName = "core:Memorized1PositionState",
							parameters = {
								{
									rawStateId = "16832512",
									name = "p1"
								}
							},
							refresh = ()[2],
							converter = ()[51]
						},
						{
							stateName = "core:OnOffState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[52]
						},
						{
							stateName = "core:OnOffState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[59]
						},
						{
							stateName = "core:BlueColorIntensityState",
							parameters = {
								{
									rawStateId = "65547",
									name = "p1"
								},
								{
									rawStateId = "65548",
									name = "p2"
								},
								{
									rawStateId = "65537",
									name = "p3"
								}
							},
							converter = ()[61]
						},
						{
							stateName = "core:GreenColorIntensityState",
							parameters = {
								{
									rawStateId = "65547",
									name = "p1"
								},
								{
									rawStateId = "65548",
									name = "p2"
								},
								{
									rawStateId = "65537",
									name = "p3"
								}
							},
							converter = ()[62]
						},
						{
							stateName = "core:RedColorIntensityState",
							parameters = {
								{
									rawStateId = "65547",
									name = "p1"
								},
								{
									rawStateId = "65548",
									name = "p2"
								},
								{
									rawStateId = "65537",
									name = "p3"
								}
							},
							converter = ()[63]
						},
						{
							stateName = "core:ColorTemperatureState",
							parameters = {
								{
									rawStateId = "65551",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[66]
						},
						{
							stateName = "core:OnOffState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[68]
						},
						{
							stateName = "core:ClosureState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[71]
						},
						{
							stateName = "core:OpenClosedPedestrianState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								},
								{
									rawStateId = "16832519",
									name = "p2"
								},
								{
									rawStateId = "16830720",
									name = "p3"
								}
							},
							refresh = ()[0],
							converter = ()[72]
						},
						{
							stateName = "core:PedestrianPositionState",
							parameters = {
								{
									rawStateId = "16832519",
									name = "p1"
								}
							},
							refresh = ()[4],
							converter = ()[2]
						},
						{
							stateName = "core:LockedUnlockedState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[75]
						},
						{
							stateName = "core:OpenClosedState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[76]
						},
						{
							stateName = "core:WindowLockedState",
							parameters = {
								{
									rawStateId = "65538",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[79]
						},
						{
							stateName = "core:LowerClosureState",
							parameters = {
								{
									rawStateId = "65539",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[2]
						},
						{
							stateName = "core:LowerOpenClosedState",
							parameters = {
								{
									rawStateId = "65539",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[20]
						},
						{
							stateName = "core:UpperClosureState",
							parameters = {
								{
									rawStateId = "65538",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[2]
						},
						{
							stateName = "core:UpperOpenClosedState",
							parameters = {
								{
									rawStateId = "65538",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[20]
						},
						{
							stateName = "core:ComfortRoomTemperatureState",
							parameters = {
								{
									rawStateId = "16832527",
									name = "p1"
								},
								{
									rawStateId = "65558",
									name = "p2"
								},
								{
									rawStateId = "65559",
									name = "p3"
								}
							},
							converter = ()[85]
						},
						{
							stateName = "core:EcoRoomTemperatureState",
							parameters = {
								{
									rawStateId = "16832526",
									name = "p1"
								},
								{
									rawStateId = "65558",
									name = "p2"
								},
								{
									rawStateId = "65559",
									name = "p3"
								}
							},
							converter = ()[85]
						},
						{
							stateName = "core:SecuredPositionTemperatureState",
							parameters = {
								{
									rawStateId = "16832522",
									name = "p1"
								},
								{
									rawStateId = "65558",
									name = "p2"
								},
								{
									rawStateId = "65559",
									name = "p3"
								}
							},
							converter = ()[85]
						},
						{
							stateName = "core:TargetTemperatureState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								},
								{
									rawStateId = "16832522",
									name = "p2"
								},
								{
									rawStateId = "16832526",
									name = "p3"
								},
								{
									rawStateId = "16832527",
									name = "p4"
								},
								{
									rawStateId = "65558",
									name = "p5"
								},
								{
									rawStateId = "65559",
									name = "p6"
								}
							},
							converter = ()[86]
						},
						{
							stateName = "core:TemperatureState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								},
								{
									rawStateId = "65558",
									name = "p2"
								},
								{
									rawStateId = "65559",
									name = "p3"
								}
							},
							converter = ()[87]
						},
						{
							stateName = "io:HeatingTemperatureInterfaceSetPointModeState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[92]
						},
						{
							stateName = "core:TimerState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								}
							},
							converter = ()[103],
							refresh = ()[0]
						},
						{
							stateName = "io:PairedMicroModuleWithLowBatteryState",
							parameters = {
								{
									rawStateId = "84059655",
									name = "p1"
								}
							},
							converter = ()[104],
							refresh = ()[0]
						},
						{
							stateName = "io:PictoState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								}
							},
							converter = ()[105],
							refresh = ()[0]
						},
						{
							stateName = "core:OpenClosedState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[108]
						},
						{
							stateName = "core:Memorized1OrientationState",
							parameters = {
								{
									rawStateId = "17029120",
									name = "p1"
								}
							},
							refresh = ()[4],
							converter = ()[2]
						},
						{
							stateName = "core:AirInputState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[2]
						},
						{
							stateName = "core:AirTransferState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[2]
						},
						{
							stateName = "core:AirOutputState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[2]
						},
						{
							stateName = "core:AirOutputLevelState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[2]
						},
						{
							stateName = "core:OnOffState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[116]
						},
						{
							stateName = "core:ComfortRoomTemperatureState",
							parameters = {
								{
									rawStateId = "16832527",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[119]
						},
						{
							stateName = "core:EcoRoomTemperatureState",
							parameters = {
								{
									rawStateId = "16832530",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[119]
						},
						{
							stateName = "core:HaltedRoomTemperatureState",
							parameters = {
								{
									rawStateId = "16832531",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[119]
						},
						{
							stateName = "core:SecondaryTemperatureState",
							parameters = {
								{
									rawStateId = "65545",
									name = "p1"
								}
							},
							converter = ()[120]
						},
						{
							stateName = "core:SetBackRoomTemperatureState",
							parameters = {
								{
									rawStateId = "16832526",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[119]
						},
						{
							stateName = "core:TargetRoomTemperatureState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[119]
						},
						{
							stateName = "core:TargetTemperatureState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[119]
						},
						{
							stateName = "core:TemperatureState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[119]
						},
						{
							stateName = "io:HeatPumpActivesModesState",
							parameters = {
								{
									rawStateId = "65553",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[121]
						},
						{
							stateName = "io:HeatPumpCapabilitiesState",
							parameters = {
								{
									rawStateId = "65552",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[122]
						},
						{
							stateName = "core:ActiveZonesState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[125]
						},
						{
							stateName = "core:LockedUnlockedState",
							parameters = {
								{
									rawStateId = "65546",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[133]
						},
						{
							stateName = "core:OpenClosedSecuredVentilationState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								},
								{
									rawStateId = "65801",
									name = "p2"
								}
							},
							refresh = ()[0],
							converter = ()[134]
						},
						{
							stateName = "core:OpeningDirectionState",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059651",
									converter = ()[135]
								}
							},
							refresh = ()[0],
							converter = ()[136]
						},
						{
							stateName = "core:RemainingTimeState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								}
							},
							converter = ()[137],
							refresh = ()[0]
						},
						{
							stateName = "core:SecuredVentilationFeatureState",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059651",
									converter = ()[138]
								}
							},
							refresh = ()[0],
							converter = ()[139]
						},
						{
							stateName = "core:TimerActivationState",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059651",
									converter = ()[140]
								}
							},
							refresh = ()[0],
							converter = ()[141]
						},
						{
							stateName = "core:TimerState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								}
							},
							converter = ()[142],
							refresh = ()[0]
						},
						{
							stateName = "core:Memorized1OrientationState",
							parameters = {
								{
									rawStateId = "16832512",
									name = "p1"
								}
							},
							refresh = ()[2],
							converter = ()[2]
						},
						{
							stateName = "core:SecuredOrientationState",
							parameters = {
								{
									rawStateId = "16832522",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[2]
						},
						{
							stateName = "core:SlatsOpenClosedState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							converter = ()[20]
						},
						{
							stateName = "core:SlatsOrientationState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							converter = ()[2]
						},
						{
							stateName = "core:SlateOrientationState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							converter = ()[2]
						},
						{
							stateName = "core:BatteryState",
							parameters = {
								{
									rawStateId = "65556",
									name = "p1"
								}
							},
							converter = ()[149]
						},
						{
							stateName = "core:OnOffState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								}
							},
							converter = ()[150],
							refresh = ()[3]
						},
						{
							stateName = "io:MemorizedVolumeState",
							parameters = {
								{
									rawStateId = "io:MemorizedVolumeState",
									name = "p1"
								}
							}
						},
						{
							stateName = "io:MemorizedSimpleVolumeState",
							parameters = {
								{
									rawStateId = "io:MemorizedVolumeState",
									name = "p1"
								}
							}
						},
						{
							stateName = "core:BoostModeDurationState",
							parameters = {
								{
									rawStateId = "201326593",
									name = "p1"
								}
							},
							converter = ()[159],
							refresh = ()[5]
						},
						{
							stateName = "core:ComfortTargetTemperatureState",
							parameters = {
								{
									rawStateId = "16832527",
									name = "p1"
								},
								{
									rawStateId = "65558",
									name = "p2"
								},
								{
									rawStateId = "65559",
									name = "p3"
								}
							},
							converter = ()[85]
						},
						{
							stateName = "core:DHWPSoftwareVersionState",
							parameters = {
								{
									rawStateId = "201342977",
									name = "p1"
								}
							},
							converter = ()[160],
							refresh = ()[1]
						},
						{
							stateName = "core:DateTimeState",
							parameters = {
								{
									rawStateId = "201330433",
									name = "p1"
								}
							},
							converter = ()[161]
						},
						{
							stateName = "core:EcoTargetTemperatureState",
							parameters = {
								{
									rawStateId = "16832530",
									name = "p1"
								},
								{
									rawStateId = "65558",
									name = "p2"
								},
								{
									rawStateId = "65559",
									name = "p3"
								}
							},
							converter = ()[85]
						},
						{
							stateName = "core:FrostProtectionTargetTemperatureState",
							parameters = {
								{
									rawStateId = "16832534",
									name = "p1"
								},
								{
									rawStateId = "65558",
									name = "p2"
								},
								{
									rawStateId = "65559",
									name = "p3"
								}
							},
							converter = ()[85]
						},
						{
							stateName = "core:HaltedTargetTemperatureState",
							parameters = {
								{
									rawStateId = "16832531",
									name = "p1"
								},
								{
									rawStateId = "65558",
									name = "p2"
								},
								{
									rawStateId = "65559",
									name = "p3"
								}
							},
							converter = ()[85]
						},
						{
							stateName = "core:ManufacturerNameState",
							parameters = {
								{
									rawStateId = "201328385",
									name = "p1"
								}
							},
							converter = ()[162],
							refresh = ()[1]
						},
						{
							stateName = "core:MaximalShowerManualModeState",
							parameters = {
								{
									rawStateId = "201343489",
									name = "p1"
								}
							},
							converter = ()[163],
							refresh = ()[1]
						},
						{
							stateName = "core:MaximalTemperatureManualModeState",
							parameters = {
								{
									rawStateId = "201343233",
									name = "p1"
								}
							},
							converter = ()[164],
							refresh = ()[1]
						},
						{
							stateName = "core:MinimalShowerManualModeState",
							parameters = {
								{
									rawStateId = "201343489",
									name = "p1"
								}
							},
							converter = ()[165],
							refresh = ()[1]
						},
						{
							stateName = "core:MinimalTemperatureManualModeState",
							parameters = {
								{
									rawStateId = "201343233",
									name = "p1"
								}
							},
							converter = ()[166],
							refresh = ()[1]
						},
						{
							stateName = "core:NumberOfTankState",
							parameters = {
								{
									rawStateId = "201341185",
									name = "p1"
								}
							},
							converter = ()[167],
							refresh = ()[1]
						},
						{
							stateName = "core:OperatingModeState",
							parameters = {
								{
									rawStateId = "65553",
									name = "p1"
								}
							},
							converter = ()[168],
							refresh = ()[0]
						},
						{
							stateName = "core:TargetTemperatureState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								},
								{
									rawStateId = "16832522",
									name = "p2"
								},
								{
									rawStateId = "16832530",
									name = "p3"
								},
								{
									rawStateId = "16832527",
									name = "p4"
								},
								{
									rawStateId = "16832531",
									name = "p5"
								},
								{
									rawStateId = "16832534",
									name = "p6"
								},
								{
									rawStateId = "65558",
									name = "p7"
								},
								{
									rawStateId = "65559",
									name = "p8"
								}
							},
							converter = ()[169]
						},
						{
							stateName = "core:WaterConsumptionState",
							parameters = {
								{
									rawStateId = "201326849",
									name = "p1"
								}
							},
							converter = ()[171],
							refresh = ()[6],
							filter = ({
								[0] = {
									reportingInterval = "4h"
								},
								{
									absoluteVariation = 0
								}
							})[0]
						},
						{
							stateName = "io:AntiLegionellosisState",
							parameters = {
								{
									rawStateId = "201329665",
									name = "p1"
								}
							},
							converter = ()[167],
							refresh = ()[7],
							filter = ()[0]
						},
						{
							stateName = "io:AwayModeDurationState",
							parameters = {
								{
									rawStateId = "201327873",
									name = "p1"
								}
							},
							converter = ()[172],
							refresh = ()[5]
						},
						{
							stateName = "io:BoilerInstallationOptionState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201330945",
									converter = ()[167]
								}
							},
							refresh = ()[7],
							converter = ()[173]
						},
						{
							stateName = "io:DHWCapacityState",
							parameters = {
								{
									rawStateId = "201328641",
									name = "p1"
								}
							},
							refresh = ()[1],
							converter = ()[174]
						},
						{
							stateName = "io:DHWErrorState",
							parameters = {
								{
									rawStateId = "201327105",
									name = "p1"
								}
							},
							refresh = ()[8],
							filter = ()[1],
							converter = ()[175]
						},
						{
							stateName = "io:DHWModeState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201328129",
									converter = ()[176]
								}
							},
							refresh = ()[8],
							filter = ()[0],
							converter = ()[177]
						},
						{
							stateName = "io:ElectricBoosterOperatingTimeState",
							parameters = {
								{
									rawStateId = "201327361",
									name = "p1"
								}
							},
							converter = ()[178],
							refresh = ()[0],
							filter = ()[0]
						},
						{
							stateName = "io:ElectricalExtraManagementState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201330177",
									converter = ()[167]
								}
							},
							refresh = ()[7],
							converter = ()[179]
						},
						{
							stateName = "io:ExtractionOptionState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201331457",
									converter = ()[167]
								}
							},
							refresh = ()[7],
							converter = ()[180]
						},
						{
							stateName = "io:HeatPumpOperatingTimeState",
							parameters = {
								{
									rawStateId = "201327361",
									name = "p1"
								}
							},
							converter = ()[171],
							refresh = ()[0],
							filter = ()[0]
						},
						{
							stateName = "io:InstallationState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201330689",
									converter = ()[167]
								}
							},
							refresh = ()[1],
							converter = ()[181]
						},
						{
							stateName = "io:MiddleWaterTemperatureState",
							parameters = {
								{
									rawStateId = "201332481",
									name = "p1"
								}
							},
							converter = ()[182],
							refresh = ()[6],
							filter = ()[0]
						},
						{
							stateName = "io:OperatingModeCapabilitiesState",
							parameters = {
								{
									rawStateId = "65552",
									name = "p1"
								}
							},
							converter = ()[183],
							refresh = ()[0]
						},
						{
							stateName = "io:OperatingRangeState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201329153",
									converter = ()[176]
								}
							},
							refresh = ()[7],
							filter = ()[0],
							converter = ()[184]
						},
						{
							stateName = "io:PowerConsumptionFanState",
							parameters = {
								{
									rawStateId = "201337601",
									name = "p1"
								}
							},
							converter = ()[165],
							refresh = ()[9],
							filter = ()[0]
						},
						{
							stateName = "io:PowerHeatElectricalState",
							parameters = {
								{
									rawStateId = "201339649",
									name = "p1"
								}
							},
							converter = ()[165],
							refresh = ()[6],
							filter = ()[0]
						},
						{
							stateName = "io:PowerHeatPumpState",
							parameters = {
								{
									rawStateId = "201339905",
									name = "p1"
								}
							},
							converter = ()[165],
							refresh = ()[10],
							filter = ()[0]
						},
						{
							stateName = "io:ProgrammingSlotsState",
							parameters = {
								{
									rawStateId = "201329409",
									name = "p1"
								}
							},
							converter = ()[185],
							refresh = ()[5]
						},
						{
							stateName = "io:RateManagementState",
							parameters = {
								{
									rawStateId = "65547",
									name = "p1"
								}
							},
							converter = ()[186],
							refresh = ()[0]
						},
						{
							stateName = "io:SmartGridOptionState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201331201",
									converter = ()[167]
								}
							},
							refresh = ()[1],
							converter = ()[187]
						},
						{
							stateName = "core:ElectricEnergyConsumptionState",
							parameters = {
								{
									rawStateId = "201327617",
									name = "p1"
								}
							},
							converter = ()[203],
							refresh = ()[0],
							filter = ()[0]
						},
						{
							stateName = "core:OnOffState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[204]
						},
						{
							stateName = "io:MaximumHeatingLevelState",
							parameters = {
								{
									rawStateId = "65547",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[205]
						},
						{
							stateName = "io:TargetHeatingLevelState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[206]
						},
						{
							stateName = "core:TargetHeatingLevelState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[206]
						},
						{
							stateName = "io:TimerForTransitoryStateState",
							parameters = {
								{
									rawStateId = "65548",
									name = "p1"
								}
							},
							refresh = ()[0]
						},
						{
							stateName = "core:AbsenceModeState",
							parameters = {
								{
									rawStateId = "core:AbsenceModeState",
									name = "p1"
								}
							}
						},
						{
							stateName = "core:AirDemandState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[2]
						},
						{
							stateName = "core:OperatingStateState",
							parameters = {
								{
									rawStateId = "218040320",
									name = "p1"
								}
							},
							converter = ()[210],
							refresh = ()[8]
						},
						{
							stateName = "core:TimeProgramState",
							parameters = {
								{
									rawStateId = "218041600",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[211]
						},
						{
							stateName = "io:AirDemandModeState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								}
							},
							converter = ()[212],
							refresh = ()[3]
						},
						{
							stateName = "io:CO2HistoryState",
							parameters = {
								{
									rawStateId = "84672513",
									name = "p1"
								}
							},
							refresh = ()[6],
							converter = ()[213]
						},
						{
							stateName = "io:EnergySavingState",
							parameters = {
								{
									rawStateId = "84672514",
									name = "p1"
								}
							},
							converter = ()[214],
							refresh = ()[11],
							filter = ()[0]
						},
						{
							stateName = "io:InletEngineState",
							parameters = {
								{
									rawStateId = "218040320",
									name = "p1"
								}
							},
							converter = ()[215],
							refresh = ()[8]
						},
						{
							stateName = "io:OutletEngineState",
							parameters = {
								{
									rawStateId = "218040320",
									name = "p1"
								}
							},
							converter = ()[216],
							refresh = ()[8]
						},
						{
							stateName = "io:ProgCommandState",
							parameters = {
								{
									rawStateId = "218040320",
									name = "p1"
								}
							},
							converter = ()[217],
							refresh = ()[8]
						},
						{
							stateName = "io:RemainingTimeBeforeFilterChangeState",
							parameters = {
								{
									rawStateId = "218040320",
									name = "p1"
								}
							},
							converter = ()[218],
							refresh = ()[8]
						},
						{
							stateName = "io:SensorsErrorState",
							parameters = {
								{
									rawStateId = "218040576",
									name = "p1"
								}
							},
							refresh = ()[6],
							filter = ()[0],
							converter = ()[219]
						},
						{
							stateName = "io:VentilationConfigurationModeState",
							parameters = {
								{
									rawStateId = "65553",
									name = "p1"
								}
							},
							converter = ()[220],
							refresh = ()[0]
						},
						{
							stateName = "io:VentilationModeState",
							parameters = {
								{
									rawStateId = "218040064",
									name = "p1"
								}
							},
							converter = ()[221]
						},
						{
							stateName = "core:CO2ConcentrationState",
							parameters = {
								{
									rawStateId = "218040576",
									name = "p1"
								}
							},
							converter = ()[171],
							refresh = ()[6],
							filter = ()[0]
						},
						{
							stateName = "core:TemperatureState",
							parameters = {
								{
									rawStateId = "218040576",
									name = "p1"
								}
							},
							converter = ()[229],
							refresh = ()[6],
							filter = ()[0]
						},
						{
							stateName = "core:TemperatureState",
							parameters = {
								{
									rawStateId = "218040576",
									name = "p1"
								}
							},
							converter = ()[230],
							refresh = ()[6],
							filter = ()[0]
						},
						{
							stateName = "core:TemperatureState",
							parameters = {
								{
									rawStateId = "218040576",
									name = "p1"
								}
							},
							converter = ()[231],
							refresh = ()[6],
							filter = ()[0]
						},
						{
							stateName = "core:TemperatureState",
							parameters = {
								{
									rawStateId = "218040576",
									name = "p1"
								}
							},
							converter = ()[232],
							refresh = ()[6],
							filter = ()[0]
						},
						{
							stateName = "core:TemperatureState",
							parameters = {
								{
									rawStateId = "218040576",
									name = "p1"
								}
							},
							converter = ()[233],
							refresh = ()[6],
							filter = ()[0]
						},
						{
							stateName = "core:LuminanceState",
							parameters = {
								{
									rawStateId = "2415919106",
									name = "p1"
								}
							}
						},
						{
							stateName = "core:SensorDefectState",
							parameters = {
								{
									rawStateId = "2415919110",
									name = "p1"
								}
							},
							converter = ()[234]
						},
						{
							stateName = "core:TemperatureState",
							parameters = {
								{
									rawStateId = "2415919106",
									name = "p1"
								}
							},
							converter = ()[237]
						},
						{
							stateName = "core:WindSpeedState",
							parameters = {
								{
									rawStateId = "2415919106",
									name = "p1"
								}
							}
						},
						{
							stateName = "core:SunEnergyState",
							parameters = {
								{
									rawStateId = "2415919106",
									name = "p1"
								}
							}
						},
						{
							stateName = "core:RelativeHumidityState",
							parameters = {
								{
									rawStateId = "2415919106",
									name = "p1"
								}
							}
						},
						{
							stateName = "core:CO2ConcentrationState",
							parameters = {
								{
									rawStateId = "2415919106",
									name = "p1"
								}
							}
						},
						{
							stateName = "core:COConcentrationState",
							parameters = {
								{
									rawStateId = "2415919106",
									name = "p1"
								}
							}
						},
						{
							stateName = "core:GasConsumptionState",
							parameters = {
								{
									rawStateId = "83935248",
									name = "p1"
								}
							},
							converter = ()[239],
							refresh = ()[6]
						},
						{
							stateName = "core:NameState",
							parameters = {
								{
									rawStateId = "2415919105",
									name = "p1"
								}
							},
							converter = ()[240],
							refresh = ()[1]
						},
						{
							stateName = "core:WaterConsumptionState",
							parameters = {
								{
									rawStateId = "83935248",
									name = "p1"
								}
							},
							converter = ()[239],
							refresh = ()[6]
						},
						{
							stateName = "core:ThermalEnergyConsumptionState",
							parameters = {
								{
									rawStateId = "83935248",
									name = "p1"
								}
							},
							converter = ()[239],
							refresh = ()[6]
						},
						{
							stateName = "core:ElectricEnergyConsumptionState",
							parameters = {
								{
									rawStateId = "83935248",
									name = "p1"
								}
							},
							converter = ()[239],
							refresh = ()[6]
						},
						{
							stateName = "core:ElectricEnergyConsumptionState",
							parameters = {
								{
									rawStateId = "83902467",
									name = "p1"
								}
							},
							converter = ()[241],
							refresh = ()[0]
						},
						{
							stateName = "core:ConsumptionTariff0State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[242]
						},
						{
							stateName = "core:ConsumptionTariff1State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[243]
						},
						{
							stateName = "core:ConsumptionTariff2State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[244]
						},
						{
							stateName = "core:ConsumptionTariff3State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[245]
						},
						{
							stateName = "core:ConsumptionTariff4State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[246]
						},
						{
							stateName = "core:ConsumptionTariff5State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[247]
						},
						{
							stateName = "core:ElectricEnergyConsumptionState",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[248]
						},
						{
							stateName = "core:ConsumptionTariff0State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[250]
						},
						{
							stateName = "core:ConsumptionTariff1State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[251]
						},
						{
							stateName = "core:ConsumptionTariff2State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[252]
						},
						{
							stateName = "core:ConsumptionTariff3State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[253]
						},
						{
							stateName = "core:ConsumptionTariff4State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[254]
						},
						{
							stateName = "core:ConsumptionTariff5State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[255]
						},
						{
							stateName = "core:ElectricEnergyConsumptionState",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[256]
						},
						{
							stateName = "core:ConsumptionTariff0State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[257]
						},
						{
							stateName = "core:ConsumptionTariff1State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[258]
						},
						{
							stateName = "core:ConsumptionTariff2State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[259]
						},
						{
							stateName = "core:ConsumptionTariff3State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[260]
						},
						{
							stateName = "core:ConsumptionTariff4State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[261]
						},
						{
							stateName = "core:ConsumptionTariff5State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[262]
						},
						{
							stateName = "core:ElectricEnergyConsumptionState",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[244]
						},
						{
							stateName = "core:ConsumptionTariff0State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[263]
						},
						{
							stateName = "core:ConsumptionTariff1State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[264]
						},
						{
							stateName = "core:ConsumptionTariff2State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[265]
						},
						{
							stateName = "core:ConsumptionTariff3State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[266]
						},
						{
							stateName = "core:ConsumptionTariff4State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[267]
						},
						{
							stateName = "core:ConsumptionTariff5State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[268]
						},
						{
							stateName = "core:ElectricEnergyConsumptionState",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[269]
						},
						{
							stateName = "core:ConsumptionTariff0State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[270]
						},
						{
							stateName = "core:ConsumptionTariff1State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[271]
						},
						{
							stateName = "core:ConsumptionTariff2State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[272]
						},
						{
							stateName = "core:ConsumptionTariff3State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[273]
						},
						{
							stateName = "core:ConsumptionTariff4State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[274]
						},
						{
							stateName = "core:ConsumptionTariff5State",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[275]
						},
						{
							stateName = "core:ElectricEnergyConsumptionState",
							parameters = {
								{
									rawStateId = "83902466",
									name = "p1"
								},
								{
									rawStateId = "83902467",
									name = "p2"
								}
							},
							converter = ()[276]
						},
						{
							stateName = "io:AllowForceHeatingState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201392128",
									converter = ()[159]
								}
							},
							refresh = ()[5],
							converter = ()[277]
						},
						{
							stateName = "io:ForceHeatingState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201326592",
									converter = ()[159]
								}
							},
							converter = ()[277]
						},
						{
							stateName = "core:CurrentTariffNumberState",
							parameters = {
								{
									rawStateId = "83902467",
									name = "p1"
								}
							},
							converter = ()[279],
							refresh = ()[0]
						},
						{
							stateName = "core:ElectricalContractIntensityState",
							parameters = {
								{
									rawStateId = "201457664",
									name = "p1"
								}
							},
							converter = ()[176]
						},
						{
							stateName = "core:ElectricalContractNameState",
							parameters = {
								{
									rawStateId = "83902464",
									name = "p1"
								}
							},
							converter = ()[280],
							refresh = ()[0]
						},
						{
							stateName = "core:ElectricalMeterTypeState",
							parameters = {
								{
									rawStateId = "83902464",
									name = "p1"
								}
							},
							converter = ()[281],
							refresh = ()[0]
						},
						{
							stateName = "io:HeatPumpActiveState",
							parameters = {
								{
									rawStateId = "io:HeatPumpActiveState",
									name = "p1"
								}
							}
						},
						{
							stateName = "core:DerogationOnOffState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201588736",
									converter = ()[159]
								}
							},
							converter = ()[283]
						},
						{
							stateName = "io:ConfigurationServicesState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201523200",
									converter = ()[159]
								}
							},
							converter = ()[284]
						},
						{
							stateName = "core:SmokeState",
							parameters = {
								{
									name = "p1",
									rawStateId = "2415919106",
									converter = ()[287]
								}
							},
							converter = ()[288]
						},
						{
							stateName = "io:MaintenanceRadioPartBatteryState",
							parameters = {
								{
									rawStateId = "83902976",
									name = "p1"
								}
							},
							converter = ()[289]
						},
						{
							stateName = "io:MaintenanceSensorPartBatteryState",
							parameters = {
								{
									rawStateId = "83902976",
									name = "p1"
								}
							},
							converter = ()[290]
						},
						{
							stateName = "io:SensorRoomState",
							parameters = {
								{
									rawStateId = "2415919110",
									name = "p1"
								}
							},
							converter = ()[291]
						},
						{
							stateName = "core:ContactState",
							parameters = {
								{
									name = "p1",
									rawStateId = "2415919106",
									converter = ()[287]
								}
							},
							converter = ()[293]
						},
						{
							stateName = "core:SensorDefectState",
							parameters = {
								{
									name = "p1",
									rawStateId = "2415919110",
									converter = ()[234]
								}
							},
							converter = ()[294]
						},
						{
							stateName = "core:OccupancyState",
							parameters = {
								{
									name = "p1",
									rawStateId = "2415919106",
									converter = ()[287]
								}
							},
							converter = ()[295]
						},
						{
							stateName = "core:RainState",
							parameters = {
								{
									name = "p1",
									rawStateId = "2415919106",
									converter = ()[296]
								}
							},
							converter = ()[297]
						},
						{
							stateName = "core:TiltedState",
							parameters = {
								{
									rawStateId = "18183012483074",
									name = "p1"
								}
							},
							converter = ()[298]
						},
						{
							stateName = "core:OpenClosedState",
							parameters = {
								{
									rawStateId = "18183012483074",
									name = "p1"
								}
							},
							converter = ()[299]
						},
						{
							stateName = "core:LockedUnlockedState",
							parameters = {
								{
									rawStateId = "18183012483074",
									name = "p1"
								}
							},
							converter = ()[300]
						},
						{
							stateName = "core:RSSILevelState",
							parameters = {
								{
									rawStateId = "2146500638",
									name = "p1"
								}
							}
						},
						{
							stateName = "core:IntrusionDetectedState",
							parameters = {
								{
									rawStateId = "18152947712002",
									name = "p1"
								}
							},
							converter = ()[304]
						},
						{
							stateName = "core:VibrationLevelThresholdState",
							parameters = {
								{
									rawStateId = "83903234",
									name = "p1"
								}
							},
							converter = ()[305],
							refresh = ()[1]
						},
						{
							stateName = "io:OneWayControllerButtonState",
							parameters = {
								{
									rawStateId = "33554442",
									name = "p1"
								}
							},
							converter = ()[315]
						},
						{
							stateName = "io:OneWayStoppableButtonState",
							parameters = {
								{
									rawStateId = "33554442",
									name = "p1"
								}
							},
							converter = ()[317]
						},
						{
							stateName = "io:OneWayStoppableButtonState",
							parameters = {
								{
									rawStateId = "33554443",
									name = "p1"
								}
							},
							converter = ()[317]
						},
						{
							stateName = "core:ClosureOrTightPositionState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[320]
						},
						{
							stateName = "core:TargetClosureState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "120842",
									name = "p3"
								},
								{
									rawStateId = "120833",
									name = "p4"
								},
								{
									rawStateId = "120834",
									name = "p5"
								},
								{
									rawStateId = "120835",
									name = "p6"
								}
							},
							converter = ()[322]
						},
						{
							stateName = "core:OpenClosedPartialState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								},
								{
									rawStateId = "16832521",
									name = "p2"
								}
							},
							refresh = ()[0],
							converter = ()[323]
						},
						{
							stateName = "core:LockedUnlockedState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[325]
						},
						{
							stateName = "core:OpenClosedState",
							parameters = {
								{
									rawStateId = "65556",
									name = "p1"
								}
							},
							converter = ()[326]
						},
						{
							stateName = "core:ComfortTargetTemperatureState",
							parameters = {
								{
									rawStateId = "16832527",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[331]
						},
						{
							stateName = "core:EcoTargetTemperatureState",
							parameters = {
								{
									rawStateId = "16832530",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[331]
						},
						{
							stateName = "core:FrostProtectionTargetTemperatureState",
							parameters = {
								{
									rawStateId = "16832534",
									name = "p1"
								}
							},
							converter = ()[331]
						},
						{
							stateName = "core:HaltedTargetTemperatureState",
							parameters = {
								{
									rawStateId = "16832531",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[331]
						},
						{
							stateName = "core:SecuredPositionTemperatureState",
							parameters = {
								{
									rawStateId = "16832522",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[331]
						},
						{
							stateName = "core:TargetTemperatureState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								},
								{
									rawStateId = "16832522",
									name = "p2"
								},
								{
									rawStateId = "16832530",
									name = "p3"
								},
								{
									rawStateId = "16832527",
									name = "p4"
								},
								{
									rawStateId = "16832531",
									name = "p5"
								},
								{
									rawStateId = "16832534",
									name = "p6"
								}
							},
							converter = ()[332]
						},
						{
							stateName = "core:TemperatureState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[331]
						},
						{
							stateName = "io:DHWCapacityState",
							parameters = {
								{
									rawStateId = "201328641",
									name = "p1"
								}
							},
							refresh = ()[1],
							converter = ()[333]
						},
						{
							stateName = "core:ActiveTimeProgramState",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059684",
									converter = ()[336]
								}
							},
							refresh = ()[1],
							converter = ()[337]
						},
						{
							stateName = "core:BatteryLevelState",
							parameters = {
								{
									rawStateId = "84059682",
									name = "p1"
								}
							},
							converter = ()[338],
							refresh = ()[1]
						},
						{
							stateName = "core:ComfortRoomTemperatureState",
							parameters = {
								{
									rawStateId = "84059685",
									name = "p1"
								}
							},
							converter = ()[339],
							refresh = ()[1]
						},
						{
							stateName = "core:DerogatedTargetTemperatureState",
							parameters = {
								{
									rawStateId = "84059681",
									name = "p1"
								}
							},
							converter = ()[340],
							refresh = ()[1]
						},
						{
							stateName = "core:DerogationEndDateTimeState",
							parameters = {
								{
									rawStateId = "84059681",
									name = "p1"
								}
							},
							converter = ()[341],
							refresh = ()[1]
						},
						{
							stateName = "core:DerogationStartDateTimeState",
							parameters = {
								{
									rawStateId = "84059681",
									name = "p1"
								}
							},
							converter = ()[342],
							refresh = ()[1]
						},
						{
							stateName = "core:EcoTargetTemperatureState",
							parameters = {
								{
									rawStateId = "84059685",
									name = "p1"
								}
							},
							converter = ()[343],
							refresh = ()[1]
						},
						{
							stateName = "core:FrostProtectionRoomTemperatureState",
							parameters = {
								{
									rawStateId = "84059685",
									name = "p1"
								}
							},
							converter = ()[344],
							refresh = ()[1]
						},
						{
							stateName = "core:MaxSetpointState",
							parameters = {
								{
									rawStateId = "84059684",
									name = "p1"
								}
							},
							converter = ()[345],
							refresh = ()[1]
						},
						{
							stateName = "core:MinSetpointState",
							parameters = {
								{
									rawStateId = "84059684",
									name = "p1"
								}
							},
							converter = ()[346],
							refresh = ()[1]
						},
						{
							stateName = "core:OpenClosedValveState",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059680",
									converter = ()[347]
								}
							},
							refresh = ()[1],
							filter = ()[1],
							converter = ()[348]
						},
						{
							stateName = "core:OpenWindowDetectionActivationState",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059684",
									converter = ()[347]
								}
							},
							refresh = ()[1],
							converter = ()[349]
						},
						{
							stateName = "core:OperatingModeState",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059680",
									converter = ()[350]
								}
							},
							refresh = ()[1],
							filter = ()[1],
							converter = ()[351]
						},
						{
							stateName = "core:SensorDefectState",
							parameters = {
								{
									rawStateId = "84059682",
									name = "p1"
								}
							},
							converter = ()[352],
							refresh = ()[1]
						},
						{
							stateName = "core:TargetRoomTemperatureState",
							parameters = {
								{
									rawStateId = "84059680",
									name = "p1"
								}
							},
							converter = ()[353],
							refresh = ()[1],
							filter = ()[1]
						},
						{
							stateName = "core:TargetTemperatureState",
							parameters = {
								{
									rawStateId = "84059680",
									name = "p1"
								}
							},
							converter = ()[353],
							refresh = ()[1],
							filter = ()[1]
						},
						{
							stateName = "core:TemperatureOffsetConfigurationState",
							parameters = {
								{
									rawStateId = "84059684",
									name = "p1"
								}
							},
							converter = ()[354],
							refresh = ()[1]
						},
						{
							stateName = "core:TimeProgram1State",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059686",
									converter = ()[355]
								}
							},
							refresh = ()[1],
							converter = ()[356]
						},
						{
							stateName = "core:TimeProgram2State",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059687",
									converter = ()[355]
								}
							},
							refresh = ()[1],
							converter = ()[356]
						},
						{
							stateName = "io:AwayModeTargetTemperatureState",
							parameters = {
								{
									rawStateId = "84059685",
									name = "p1"
								}
							},
							converter = ()[357],
							refresh = ()[1]
						},
						{
							stateName = "io:ByPassActivationState",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059684",
									converter = ()[358]
								}
							},
							refresh = ()[1],
							converter = ()[359]
						},
						{
							stateName = "io:CurrentHeatingModeState",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059680",
									converter = ()[360]
								}
							},
							refresh = ()[1],
							filter = ()[1],
							converter = ()[361]
						},
						{
							stateName = "io:DerogationHeatingModeState",
							parameters = {
								{
									rawStateId = "84059681",
									name = "p1"
								}
							},
							converter = ()[362],
							refresh = ()[1]
						},
						{
							stateName = "io:DerogationTypeState",
							parameters = {
								{
									rawStateId = "84059681",
									name = "p1"
								}
							},
							converter = ()[363],
							refresh = ()[1]
						},
						{
							stateName = "io:GeofencingModeTargetTemperatureState",
							parameters = {
								{
									rawStateId = "84059685",
									name = "p1"
								}
							},
							converter = ()[364],
							refresh = ()[1]
						},
						{
							stateName = "io:LockKeyActivationState",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059684",
									converter = ()[350]
								}
							},
							refresh = ()[1],
							converter = ()[365]
						},
						{
							stateName = "io:ManualModeTargetTemperatureState",
							parameters = {
								{
									rawStateId = "84059681",
									name = "p1"
								}
							},
							converter = ()[340],
							refresh = ()[1]
						},
						{
							stateName = "io:OpenWindowDetectedTargetTemperatureState",
							parameters = {
								{
									rawStateId = "84059685",
									name = "p1"
								}
							},
							converter = ()[366],
							refresh = ()[1]
						},
						{
							stateName = "io:ValveInstallationModeState",
							parameters = {
								{
									rawStateId = "84059682",
									name = "p1"
								}
							},
							converter = ()[367],
							refresh = ()[1]
						},
						{
							stateName = "core:TemperatureState",
							parameters = {
								{
									rawStateId = "84059680",
									name = "p1"
								}
							},
							converter = ()[373],
							refresh = ()[1],
							filter = ()[1]
						},
						{
							stateName = "core:ComfortTargetTemperatureState",
							parameters = {
								{
									rawStateId = "16832527",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[375]
						},
						{
							stateName = "core:EcoTargetTemperatureState",
							parameters = {
								{
									rawStateId = "16832530",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[375]
						},
						{
							stateName = "core:FrostProtectionTargetTemperatureState",
							parameters = {
								{
									rawStateId = "16832534",
									name = "p1"
								}
							},
							converter = ()[375]
						},
						{
							stateName = "core:HaltedTargetTemperatureState",
							parameters = {
								{
									rawStateId = "16832531",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[375]
						},
						{
							stateName = "core:SecuredPositionTemperatureState",
							parameters = {
								{
									rawStateId = "16832522",
									name = "p1"
								}
							},
							refresh = ()[3],
							converter = ()[375]
						},
						{
							stateName = "core:TargetTemperatureState",
							parameters = {
								{
									rawStateId = "16830720",
									name = "p1"
								},
								{
									rawStateId = "16832522",
									name = "p2"
								},
								{
									rawStateId = "16832530",
									name = "p3"
								},
								{
									rawStateId = "16832527",
									name = "p4"
								},
								{
									rawStateId = "16832531",
									name = "p5"
								},
								{
									rawStateId = "16832534",
									name = "p6"
								}
							},
							refresh = ()[3],
							converter = ()[376]
						},
						{
							stateName = "core:TemperatureState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[377]
						},
						{
							stateName = "core:HeatingAnticipationState",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059684",
									converter = ()[380]
								}
							},
							refresh = ()[1],
							converter = ()[365]
						},
						{
							stateName = "core:PermanentDisplayState",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059684",
									converter = ()[358]
								}
							},
							refresh = ()[1],
							converter = ()[365]
						},
						{
							stateName = "core:ThermalConfigurationState",
							parameters = {
								{
									name = "p1",
									rawStateId = "84059684",
									converter = ()[381]
								}
							},
							refresh = ()[1],
							converter = ()[382]
						},
						{
							stateName = "core:TargetRoomTemperatureState",
							parameters = {
								{
									rawStateId = "84059680",
									name = "p1"
								}
							},
							converter = ()[383],
							refresh = ()[1],
							filter = ()[1]
						},
						{
							stateName = "core:TargetTemperatureState",
							parameters = {
								{
									rawStateId = "84059680",
									name = "p1"
								}
							},
							converter = ()[383],
							refresh = ()[1],
							filter = ()[1]
						},
						{
							stateName = "core:TargetTemperatureHysteresisState",
							parameters = {
								{
									rawStateId = "84059684",
									name = "p1"
								}
							},
							converter = ()[384],
							refresh = ()[1]
						},
						{
							stateName = "core:TemperatureOffsetConfigurationState",
							parameters = {
								{
									rawStateId = "84059684",
									name = "p1"
								}
							},
							converter = ()[385],
							refresh = ()[1]
						},
						{
							stateName = "core:RelativeHumidityState",
							parameters = {
								{
									rawStateId = "84059680",
									name = "p1"
								}
							},
							converter = ()[387],
							refresh = ()[1],
							filter = ()[1]
						},
						{
							stateName = "core:DeploymentState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								}
							},
							refresh = ()[0],
							converter = ()[388]
						},
						{
							stateName = "core:V40WaterVolumeEstimationState",
							parameters = {
								{
									rawStateId = "201339137",
									name = "p1"
								}
							},
							converter = ()[389],
							refresh = ()[12],
							filter = ()[0]
						},
						{
							stateName = "core:AbsenceEndDateState",
							parameters = {
								{
									rawStateId = "201351937",
									name = "p1"
								}
							},
							converter = ()[161]
						},
						{
							stateName = "core:AbsenceStartDateState",
							parameters = {
								{
									rawStateId = "201351681",
									name = "p1"
								}
							},
							converter = ()[161]
						},
						{
							stateName = "core:BoostElectricPowerConsumptionState",
							parameters = {
								{
									rawStateId = "201343745",
									name = "p1"
								}
							},
							converter = ()[165],
							refresh = ()[6]
						},
						{
							stateName = "core:BoostEndDateState",
							parameters = {
								{
									rawStateId = "201351425",
									name = "p1"
								}
							},
							converter = ()[161]
						},
						{
							stateName = "core:BoostStartDateState",
							parameters = {
								{
									rawStateId = "201351169",
									name = "p1"
								}
							},
							converter = ()[161]
						},
						{
							stateName = "core:BottomTankWaterTemperatureState",
							parameters = {
								{
									rawStateId = "201332993",
									name = "p1"
								}
							},
							converter = ()[182],
							refresh = ()[6],
							filter = ()[0]
						},
						{
							stateName = "core:ControlWaterTargetTemperatureState",
							parameters = {
								{
									rawStateId = "201345281",
									name = "p1"
								}
							},
							converter = ()[166],
							refresh = ()[0],
							filter = ()[0]
						},
						{
							stateName = "core:ExpectedNumberOfShowerState",
							parameters = {
								{
									rawStateId = "201345025",
									name = "p1"
								}
							},
							converter = ()[167],
							refresh = ()[0],
							filter = ()[0]
						},
						{
							stateName = "core:HeatingStatusState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201352193",
									converter = ()[390]
								}
							},
							refresh = ()[6],
							filter = ()[0],
							converter = ()[391]
						},
						{
							stateName = "core:MiddleWaterTemperatureInState",
							parameters = {
								{
									rawStateId = "201344257",
									name = "p1"
								}
							},
							converter = ()[166],
							refresh = ()[6],
							filter = ()[0]
						},
						{
							stateName = "core:NumberOfShowerRemainingState",
							parameters = {
								{
									rawStateId = "201344513",
									name = "p1"
								}
							},
							converter = ()[167],
							refresh = ()[6],
							filter = ()[0]
						},
						{
							stateName = "core:PowerHeatElectricalInState",
							parameters = {
								{
									rawStateId = "201344001",
									name = "p1"
								}
							},
							converter = ()[165],
							refresh = ()[6]
						},
						{
							stateName = "core:ProgrammingAvailableState",
							parameters = {
								{
									rawStateId = "201340929",
									name = "p1"
								}
							},
							converter = ()[167],
							refresh = ()[1]
						},
						{
							stateName = "core:StopRelaunchState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201340417",
									converter = ()[167]
								}
							},
							refresh = ()[0],
							filter = ()[0],
							converter = ()[392]
						},
						{
							stateName = "core:WaterTargetTemperatureState",
							parameters = {
								{
									rawStateId = "201344769",
									name = "p1"
								}
							},
							converter = ()[166],
							refresh = ()[0],
							filter = ()[0]
						},
						{
							stateName = "core:TargetDHWTemperatureState",
							parameters = {
								{
									rawStateId = "201344769",
									name = "p1"
								}
							},
							converter = ()[166],
							refresh = ()[0],
							filter = ()[0]
						},
						{
							stateName = "core:WaterTemperatureState",
							parameters = {
								{
									rawStateId = "201344769",
									name = "p1"
								}
							},
							converter = ()[166],
							refresh = ()[0],
							filter = ()[0]
						},
						{
							stateName = "io:DHWAbsenceModeState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201347841",
									converter = ()[167]
								}
							},
							refresh = ()[5],
							filter = ()[0],
							converter = ()[393]
						},
						{
							stateName = "io:DHWBoostModeState",
							parameters = {
								{
									name = "p1",
									rawStateId = "201347585",
									converter = ()[167]
								}
							},
							refresh = ()[5],
							filter = ()[0],
							converter = ()[393]
						},
						{
							stateName = "io:OneWayControllerButtonState",
							parameters = {
								{
									rawStateId = "65555",
									name = "p1"
								}
							},
							converter = ()[396]
						},
						{
							stateName = "core:BatteryLevelState",
							parameters = {
								{
									rawStateId = "67362619648",
									name = "p1"
								}
							}
						},
						{
							stateName = "core:LuminanceState",
							parameters = {
								{
									rawStateId = "67362620678",
									name = "p1"
								}
							},
							converter = ()[398]
						},
						{
							stateName = "core:SunEnergyState",
							parameters = {
								{
									rawStateId = "67362620678",
									name = "p1"
								}
							}
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059661",
									name = "p3"
								}
							},
							converter = ()[399]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "65540",
									name = "p3"
								},
								{
									rawStateId = "48177664",
									name = "p4"
								}
							},
							converter = ()[403]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "65540",
									name = "p3"
								},
								{
									rawStateId = "48177664",
									name = "p4"
								}
							},
							converter = ()[407]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								}
							},
							converter = ()[410]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84058662",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84058391",
									name = "p3"
								},
								{
									rawStateId = "49217792",
									name = "p4"
								},
								{
									rawStateId = "84058368",
									name = "p5"
								},
								{
									rawStateId = "84058369",
									name = "p6"
								},
								{
									rawStateId = "84058370",
									name = "p7"
								},
								{
									rawStateId = "84058371",
									name = "p8"
								},
								{
									rawStateId = "84058372",
									name = "p9"
								},
								{
									rawStateId = "84058393",
									name = "p10"
								},
								{
									rawStateId = "84058394",
									name = "p11"
								},
								{
									rawStateId = "84058395",
									name = "p12"
								},
								{
									rawStateId = "84058396",
									name = "p13"
								},
								{
									rawStateId = "84058373",
									name = "p14"
								},
								{
									rawStateId = "84058397",
									name = "p15"
								},
								{
									rawStateId = "84058398",
									name = "p16"
								},
								{
									rawStateId = "84058399",
									name = "p17"
								},
								{
									rawStateId = "84058400",
									name = "p18"
								},
								{
									rawStateId = "84058401",
									name = "p19"
								},
								{
									rawStateId = "84058375",
									name = "p20"
								},
								{
									rawStateId = "84058376",
									name = "p21"
								},
								{
									rawStateId = "84058374",
									name = "p22"
								},
								{
									rawStateId = "84058377",
									name = "p23"
								},
								{
									rawStateId = "84058412",
									name = "p24"
								},
								{
									rawStateId = "84058411",
									name = "p25"
								},
								{
									rawStateId = "84058378",
									name = "p26"
								},
								{
									rawStateId = "84058379",
									name = "p27"
								},
								{
									rawStateId = "84058402",
									name = "p28"
								},
								{
									rawStateId = "84058380",
									name = "p29"
								},
								{
									rawStateId = "84058381",
									name = "p30"
								},
								{
									rawStateId = "84058382",
									name = "p31"
								},
								{
									rawStateId = "84058383",
									name = "p32"
								},
								{
									rawStateId = "84058384",
									name = "p33"
								},
								{
									rawStateId = "84058385",
									name = "p34"
								},
								{
									rawStateId = "84058386",
									name = "p35"
								},
								{
									rawStateId = "84058387",
									name = "p36"
								},
								{
									rawStateId = "84058409",
									name = "p37"
								}
							},
							converter = ()[413]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84058662",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84058674",
									name = "p3"
								},
								{
									rawStateId = "84058391",
									name = "p4"
								},
								{
									rawStateId = "84058697",
									name = "p5"
								},
								{
									rawStateId = "49217792",
									name = "p6"
								},
								{
									rawStateId = "84058368",
									name = "p7"
								},
								{
									rawStateId = "84058420",
									name = "p8"
								},
								{
									rawStateId = "84058375",
									name = "p9"
								},
								{
									rawStateId = "84058376",
									name = "p10"
								},
								{
									rawStateId = "84058374",
									name = "p11"
								},
								{
									rawStateId = "84058377",
									name = "p12"
								},
								{
									rawStateId = "84058411",
									name = "p13"
								},
								{
									rawStateId = "84058390",
									name = "p14"
								},
								{
									rawStateId = "84058409",
									name = "p15"
								}
							},
							converter = ()[417]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059661",
									name = "p3"
								},
								{
									rawStateId = "48177664",
									name = "p4"
								}
							},
							refresh = ()[0],
							converter = ()[421]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059661",
									name = "p3"
								},
								{
									rawStateId = "65540",
									name = "p4"
								},
								{
									rawStateId = "48177664",
									name = "p5"
								}
							},
							refresh = ()[0],
							converter = ()[425]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84058662",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84058391",
									name = "p3"
								},
								{
									rawStateId = "49217792",
									name = "p4"
								},
								{
									rawStateId = "84058368",
									name = "p5"
								},
								{
									rawStateId = "84058369",
									name = "p6"
								},
								{
									rawStateId = "84058370",
									name = "p7"
								},
								{
									rawStateId = "84058371",
									name = "p8"
								},
								{
									rawStateId = "84058372",
									name = "p9"
								},
								{
									rawStateId = "84058406",
									name = "p10"
								},
								{
									rawStateId = "84058392",
									name = "p11"
								},
								{
									rawStateId = "84058393",
									name = "p12"
								},
								{
									rawStateId = "84058394",
									name = "p13"
								},
								{
									rawStateId = "84058395",
									name = "p14"
								},
								{
									rawStateId = "84058396",
									name = "p15"
								},
								{
									rawStateId = "84058373",
									name = "p16"
								},
								{
									rawStateId = "84058397",
									name = "p17"
								},
								{
									rawStateId = "84058398",
									name = "p18"
								},
								{
									rawStateId = "84058399",
									name = "p19"
								},
								{
									rawStateId = "84058400",
									name = "p20"
								},
								{
									rawStateId = "84058375",
									name = "p21"
								},
								{
									rawStateId = "84058376",
									name = "p22"
								},
								{
									rawStateId = "84058374",
									name = "p23"
								},
								{
									rawStateId = "84058377",
									name = "p24"
								},
								{
									rawStateId = "84058412",
									name = "p25"
								},
								{
									rawStateId = "84058411",
									name = "p26"
								},
								{
									rawStateId = "84058380",
									name = "p27"
								},
								{
									rawStateId = "84058381",
									name = "p28"
								},
								{
									rawStateId = "84058382",
									name = "p29"
								},
								{
									rawStateId = "84058383",
									name = "p30"
								},
								{
									rawStateId = "84058390",
									name = "p31"
								},
								{
									rawStateId = "84058409",
									name = "p32"
								}
							},
							converter = ()[429]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84058662",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84058391",
									name = "p3"
								},
								{
									rawStateId = "84058392",
									name = "p4"
								},
								{
									rawStateId = "84058697",
									name = "p5"
								},
								{
									rawStateId = "49217792",
									name = "p6"
								},
								{
									rawStateId = "84058368",
									name = "p7"
								},
								{
									rawStateId = "84058420",
									name = "p8"
								},
								{
									rawStateId = "84058375",
									name = "p9"
								},
								{
									rawStateId = "84058376",
									name = "p10"
								},
								{
									rawStateId = "84058374",
									name = "p11"
								},
								{
									rawStateId = "84058377",
									name = "p12"
								},
								{
									rawStateId = "84058411",
									name = "p13"
								},
								{
									rawStateId = "84058390",
									name = "p14"
								},
								{
									rawStateId = "84058409",
									name = "p15"
								}
							},
							converter = ()[433]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								}
							},
							converter = ()[437]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84058662",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84058391",
									name = "p3"
								},
								{
									rawStateId = "49217792",
									name = "p4"
								},
								{
									rawStateId = "84058368",
									name = "p5"
								},
								{
									rawStateId = "84058369",
									name = "p6"
								},
								{
									rawStateId = "84058370",
									name = "p7"
								},
								{
									rawStateId = "84058371",
									name = "p8"
								},
								{
									rawStateId = "84058372",
									name = "p9"
								},
								{
									rawStateId = "84058393",
									name = "p10"
								},
								{
									rawStateId = "84058394",
									name = "p11"
								},
								{
									rawStateId = "84058395",
									name = "p12"
								},
								{
									rawStateId = "84058396",
									name = "p13"
								},
								{
									rawStateId = "84058373",
									name = "p14"
								},
								{
									rawStateId = "84058397",
									name = "p15"
								},
								{
									rawStateId = "84058398",
									name = "p16"
								},
								{
									rawStateId = "84058399",
									name = "p17"
								},
								{
									rawStateId = "84058400",
									name = "p18"
								},
								{
									rawStateId = "84058401",
									name = "p19"
								},
								{
									rawStateId = "84058375",
									name = "p20"
								},
								{
									rawStateId = "84058376",
									name = "p21"
								},
								{
									rawStateId = "84058374",
									name = "p22"
								},
								{
									rawStateId = "84058377",
									name = "p23"
								},
								{
									rawStateId = "84058412",
									name = "p24"
								},
								{
									rawStateId = "84058411",
									name = "p25"
								},
								{
									rawStateId = "84058378",
									name = "p26"
								},
								{
									rawStateId = "84058379",
									name = "p27"
								},
								{
									rawStateId = "84058402",
									name = "p28"
								},
								{
									rawStateId = "84058404",
									name = "p29"
								},
								{
									rawStateId = "84058380",
									name = "p30"
								},
								{
									rawStateId = "84058381",
									name = "p31"
								},
								{
									rawStateId = "84058382",
									name = "p32"
								},
								{
									rawStateId = "84058383",
									name = "p33"
								},
								{
									rawStateId = "84058384",
									name = "p34"
								},
								{
									rawStateId = "84058385",
									name = "p35"
								},
								{
									rawStateId = "84058386",
									name = "p36"
								},
								{
									rawStateId = "84058387",
									name = "p37"
								},
								{
									rawStateId = "84058409",
									name = "p38"
								}
							},
							converter = ()[444]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								},
								{
									rawStateId = "84059651",
									name = "p2"
								}
							},
							refresh = ()[0],
							converter = ()[448]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "65537",
									name = "p1"
								},
								{
									rawStateId = "84059656",
									name = "p2"
								},
								{
									rawStateId = "84059651",
									name = "p3"
								}
							},
							refresh = ()[0],
							converter = ()[452]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84082687",
									name = "p3"
								}
							},
							refresh = ()[0],
							converter = ()[456]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84082687",
									name = "p3"
								}
							},
							refresh = ()[0],
							converter = ()[462]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84082687",
									name = "p3"
								},
								{
									rawStateId = "65540",
									name = "p4"
								},
								{
									rawStateId = "48177664",
									name = "p5"
								}
							},
							refresh = ()[0],
							converter = ()[465]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								}
							},
							converter = ()[468]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "48170496",
									name = "p3"
								},
								{
									rawStateId = "84059658",
									name = "p4"
								},
								{
									rawStateId = "84059664",
									name = "p5"
								}
							},
							refresh = ()[0],
							converter = ()[472]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059664",
									name = "p3"
								},
								{
									rawStateId = "84059659",
									name = "p4"
								},
								{
									rawStateId = "65540",
									name = "p5"
								},
								{
									rawStateId = "84059658",
									name = "p6"
								}
							},
							refresh = ()[0],
							converter = ()[478]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059664",
									name = "p3"
								},
								{
									rawStateId = "65540",
									name = "p4"
								},
								{
									rawStateId = "84059658",
									name = "p5"
								},
								{
									rawStateId = "84059659",
									name = "p6"
								}
							},
							refresh = ()[0],
							converter = ()[482]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059651",
									name = "p3"
								}
							},
							converter = ()[487]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059651",
									name = "p3"
								}
							},
							converter = ()[491]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "49020928",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								}
							},
							converter = ()[494]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "49020928",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								}
							},
							converter = ()[498]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								}
							},
							converter = ()[501]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								}
							},
							converter = ()[504]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "48170496",
									name = "p3"
								},
								{
									rawStateId = "48171008",
									name = "p4"
								}
							},
							converter = ()[509]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "48171008",
									name = "p3"
								}
							},
							converter = ()[513]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "48171008",
									name = "p3"
								}
							},
							converter = ()[517]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "48171008",
									name = "p3"
								}
							},
							converter = ()[520]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84058662",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "49217792",
									name = "p3"
								},
								{
									rawStateId = "84058368",
									name = "p4"
								},
								{
									rawStateId = "84058420",
									name = "p5"
								},
								{
									rawStateId = "84058391",
									name = "p6"
								},
								{
									rawStateId = "84058697",
									name = "p7"
								},
								{
									rawStateId = "84058627",
									name = "p8"
								},
								{
									rawStateId = "84058399",
									name = "p9"
								},
								{
									rawStateId = "84058409",
									name = "p10"
								}
							},
							converter = ()[527]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059671",
									name = "p3"
								}
							},
							converter = ()[531]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059671",
									name = "p3"
								}
							},
							converter = ()[535]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059671",
									name = "p3"
								}
							},
							converter = ()[541]
						},
						{
							stateName = "core:ManufacturerDiagnosticsState",
							parameters = {
								{
									rawStateId = "84059649",
									name = "p1"
								},
								{
									rawStateId = "84059668",
									name = "p2"
								},
								{
									rawStateId = "84059669",
									name = "p3"
								}
							},
							converter = ()[545]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059666",
									name = "p3"
								}
							},
							refresh = ()[0],
							converter = ()[551]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059666",
									name = "p3"
								},
								{
									rawStateId = "84059658",
									name = "p4"
								}
							},
							refresh = ()[0],
							converter = ()[555]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059661",
									name = "p3"
								}
							},
							refresh = ()[0],
							converter = ()[399]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059661",
									name = "p3"
								},
								{
									rawStateId = "84059657",
									name = "p4"
								},
								{
									rawStateId = "84059659",
									name = "p5"
								}
							},
							converter = ()[561]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059661",
									name = "p3"
								},
								{
									rawStateId = "84059657",
									name = "p4"
								},
								{
									rawStateId = "84059659",
									name = "p5"
								}
							},
							refresh = ()[0],
							converter = ()[561]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "48170496",
									name = "p3"
								},
								{
									rawStateId = "48171008",
									name = "p4"
								}
							},
							converter = ()[565]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "48170496",
									name = "p3"
								},
								{
									rawStateId = "48171008",
									name = "p4"
								},
								{
									rawStateId = "84059664",
									name = "p5"
								}
							},
							converter = ()[569]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "48170496",
									name = "p3"
								},
								{
									rawStateId = "48171008",
									name = "p4"
								},
								{
									rawStateId = "84059664",
									name = "p5"
								}
							},
							refresh = ()[0],
							converter = ()[569]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84059651",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "84059659",
									name = "p3"
								},
								{
									rawStateId = "48171008",
									name = "p4"
								},
								{
									rawStateId = "84059664",
									name = "p5"
								}
							},
							refresh = ()[0],
							converter = ()[573]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "48170496",
									name = "p3"
								},
								{
									rawStateId = "48171008",
									name = "p4"
								}
							},
							converter = ()[576]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "48170496",
									name = "p3"
								},
								{
									rawStateId = "48171008",
									name = "p4"
								}
							},
							converter = ()[581]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "48170496",
									name = "p3"
								},
								{
									rawStateId = "48171008",
									name = "p4"
								}
							},
							converter = ()[584]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								}
							},
							converter = ()[587]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								}
							},
							converter = ()[592]
						},
						{
							stateName = "core:ManufacturerSettingsState",
							parameters = {
								{
									rawStateId = "84082687",
									name = "p1"
								},
								{
									rawStateId = "65537",
									name = "p2"
								},
								{
									rawStateId = "65540",
									name = "p3"
								},
								{
									rawStateId = "48177664",
									name = "p4"
								}
							},
							converter = ()[597]
						}
					})[0],
					()[3]
				}
			},
			{
				linkedHighLevelState = {
					()[1]
				}
			},
			{
				linkedHighLevelState = {
					()[2]
				}
			},
			{
				linkedHighLevelState = {
					()[4]
				}
			},
			{
				["core:FirmwareRevision"] = ({
					[0] = {
						rawName = "io:generalinfo1",
						type = 3,
						converter = ()[6]
					},
					{
						rawName = "io:manufacturerid",
						type = 3,
						converter = ()[7]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[30]
					},
					{
						defaultValue = "mainSupply",
						type = 3
					},
					{
						defaultValue = "core:ElectricalEnergyInWh",
						type = 3
					},
					{
						defaultValue = "core:TemperatureInCelcius",
						type = 3
					},
					{
						rawName = "_io:maxsensedvalue",
						type = 2,
						converter = ()[235]
					},
					{
						rawName = "io:measuredvaluetype",
						type = 3,
						converter = ()[236]
					},
					{
						rawName = "_io:minsensedvalue",
						type = 2,
						converter = ()[235]
					},
					{
						defaultValue = "battery",
						type = 3
					},
					{
						rawName = "io:measuredvaluetype",
						type = 3,
						converter = ()[238]
					},
					{
						defaultValue = "core:LinearSpeedInMeterPerSecond",
						type = 3
					},
					{
						defaultValue = "core:PowerPerSquareMeter",
						type = 3
					},
					{
						defaultValue = "core:RelativeValueInPercentage",
						type = 3
					},
					{
						defaultValue = "core:PartsPerMillion",
						type = 3
					},
					{
						rawName = "io:gas-peoplecount",
						type = 1,
						converter = ()[235]
					},
					{
						rawName = "io:gas-cooking",
						type = 6,
						converter = ()[235]
					},
					{
						rawName = "io:gas-dhw",
						type = 6,
						converter = ()[235]
					},
					{
						defaultValue = "11",
						type = 2
					},
					{
						defaultValue = "gas/heatingSystem",
						type = 3
					},
					{
						defaultValue = "core:VolumeInCubicMeter",
						type = 3
					},
					{
						defaultValue = "gas/dhw",
						type = 3
					},
					{
						defaultValue = "electric/overall",
						type = 3
					},
					{
						defaultValue = "electric/heatingSystem",
						type = 3
					},
					{
						defaultValue = "electric/dhw",
						type = 3
					},
					{
						defaultValue = "electric/airConditioning",
						type = 3
					},
					{
						defaultValue = "electric/outlet",
						type = 3
					},
					{
						defaultValue = "electric/unknown",
						type = 3
					},
					{
						rawName = "_io:configuration-window",
						type = 2,
						converter = ()[301]
					},
					{
						rawName = "_io:configuration-window",
						type = 3,
						converter = ()[302]
					},
					{
						rawName = "_io:configuration-window",
						type = 2,
						converter = ()[303]
					},
					{
						rawName = "_io:configuration-intrusion",
						type = 2,
						converter = ()[301]
					},
					{
						rawName = "_io:configuration-intrusion",
						type = 3,
						converter = ()[302]
					},
					{
						rawName = "_io:configuration-intrusion",
						type = 2,
						converter = ()[303]
					},
					{
						defaultValue = "IO Repeater",
						type = 3
					},
					{
						rawName = "core:groupid",
						type = 3,
						converter = ()[316]
					},
					{
						rawName = "core:groupindex",
						type = 3,
						converter = ()[316]
					},
					{
						rawName = "io:parametersManagement",
						type = 10,
						extraRawNames = {
							"io:eventingSystem",
							"io:autonomy"
						},
						converter = ()[397]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[400]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[404]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[414]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[418]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[422]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[426]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[430]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[434]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[438]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[442]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[445]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[449]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[453]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[457]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[460]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[469]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[473]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[476]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[479]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[495]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[510]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[514]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[521]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[525]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[528]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[532]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[536]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[539]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[542]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[546]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[549]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[552]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[556]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[559]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[562]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[566]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[570]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[588]
					},
					{
						rawName = "io:generalinfo1",
						type = 10,
						converter = ()[595]
					}
				})[0],
				["core:Manufacturer"] = ()[1]
			},
			{
				isParameterRequired = true,
				name = "p1"
			},
			{
				isParameterRequired = false,
				name = "p2"
			},
			{
				()[6],
				()[7]
			},
			{
				access = "r",
				parameterId = "65554"
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				converter = ()[8],
				extraDefinition = ()[9]
			},
			{
				()[6]
			},
			{
				access = "w",
				parameterId = "4"
			},
			{
				prototype = "integer[1;254]",
				parameters = ()[11],
				converter = ()[9],
				extraDefinition = ()[12]
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "1"
				}
			},
			{
				converter = ()[10],
				extraDefinition = ()[12]
			},
			{
				access = "w",
				parameterId = "2146500642"
			},
			{
				prototype = "string,*integer[1;5]",
				parameters = ()[8],
				converter = ()[11],
				extraDefinition = ()[16]
			},
			{
				access = "w",
				parameterId = "65537"
			},
			{
				prototype = "integer[0;100]",
				parameters = ()[11],
				converter = ()[12],
				extraDefinition = ()[18]
			},
			{
				prototype = "string",
				parameters = ()[11],
				converter = ()[13],
				extraDefinition = {
					access = "w",
					parameterId = "1"
				}
			},
			{
				converter = ()[14],
				extraDefinition = ()[12]
			},
			{
				converter = ()[15],
				extraDefinition = ()[12]
			},
			{
				converter = ()[16],
				extraDefinition = {
					access = "w",
					parameterId = "2146500643"
				}
			},
			{
				prototype = "string,*integer[1;5]",
				parameters = ()[8],
				converter = ()[17],
				extraDefinition = ()[16]
			},
			{
				prototype = "string(configuration;virgin;close;transmitting)",
				parameters = ()[11],
				converter = ()[18],
				extraDefinition = {
					access = "w",
					parameterId = "11"
				}
			},
			{
				prototype = "integer[1;254]",
				parameters = ()[11],
				converter = ()[19],
				extraDefinition = ()[12]
			},
			{
				["io:UnknownIOComponent"] = {
					type = 1,
					widget = "IOGeneric",
					uiClass = "Generic",
					uiProfiles = {
						"StatefulLevelControl",
						"LevelControl",
						"Generic"
					},
					states = {
						2146500638 = ()[1],
						65537 = ()[2],
						1 = ()[3],
						2147426304 = ()[4]
					},
					attributes = ()[5],
					commands = {
						advancedRefresh = ()[10],
						delayedStopIdentify = ()[13],
						getName = ()[14],
						identify = ()[15],
						pairOneWayController = ()[17],
						setLevel = ()[19],
						setName = ()[20],
						startIdentify = ()[21],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						wink = ()[26]
					}
				}
			},
			{
				"StatefulVenetianBlind",
				"StatefulOrientableAndCloseable",
				"OrientableAndCloseable",
				"OpenClose"
			},
			{
				"16830720",
				"16832512",
				"16832522"
			},
			{
				"16830720",
				"16832522",
				"65537"
			},
			{
				linkedHighLevelState = {
					()[6],
					()[10]
				},
				linkedStateIds = ()[30]
			},
			{
				"16830720",
				"16832512",
				"65537"
			},
			{
				linkedHighLevelState = {
					()[8],
					()[10]
				},
				linkedStateIds = ()[32]
			},
			{
				()[10]
			},
			{
				linkedHighLevelState = ()[34],
				linkedStateIds = {
					"16832512",
					"16832522",
					"65537"
				}
			},
			{
				linkedHighLevelState = {
					()[11]
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "16832512"
				}
			},
			{
				prototype = "integer[0;100]",
				parameters = ()[11],
				converter = ()[24],
				extraDefinition = ()[18]
			},
			{
				{
					value = 100,
					name = "p1"
				}
			},
			{
				parameters = ()[39],
				converter = ()[24],
				extraDefinition = ()[18]
			},
			{
				{
					value = 0,
					name = "p1"
				}
			},
			{
				parameters = ()[41],
				converter = ()[24],
				extraDefinition = ()[18]
			},
			{
				isParameterRequired = true,
				name = "p2"
			},
			{
				()[6],
				()[43]
			},
			{
				access = "w",
				parameterId = "65554"
			},
			{
				access = "w",
				parameterId = "16832512"
			},
			{
				prototype = "integer[0;100]",
				parameters = ()[11],
				converter = ()[24],
				extraDefinition = ()[46]
			},
			{
				prototype = "string(my;memorized1;secured)|integer[0;100]",
				parameters = ()[11],
				converter = ()[27],
				extraDefinition = ()[18]
			},
			{
				value = "my",
				name = "p1"
			},
			{
				()[49]
			},
			{
				parameters = ()[50],
				converter = ()[27],
				extraDefinition = ()[18]
			},
			{
				access = "w",
				parameterId = "16832522"
			},
			{
				prototype = "integer[0;100]",
				parameters = ()[11],
				converter = ()[24],
				extraDefinition = ()[52]
			},
			{
				"StatefulCloseableShutter",
				"StatefulCloseable",
				"Closeable",
				"StatefulOpenClose",
				"OpenClose"
			},
			{
				linkedHighLevelState = {
					()[5],
					()[12],
					()[10]
				},
				linkedStateIds = ()[29]
			},
			{
				linkedHighLevelState = {
					()[13],
					()[14]
				}
			},
			{
				linkedHighLevelState = {
					()[15]
				}
			},
			{
				65537 = ()[55],
				2146500638 = ()[1],
				16832512 = ()[31],
				1 = ()[3],
				16832522 = ()[33],
				2147426304 = ()[4],
				16830720 = ()[35],
				65557 = ()[36],
				2 = ()[56],
				2146500645 = ()[57]
			},
			{
				["core:FirmwareRevision"] = ()[0],
				["core:Manufacturer"] = ()[1],
				["core:SupportedManufacturerSettingsCommands"] = ()[2]
			},
			{
				access = "w",
				parameterId = "49414656"
			},
			{
				converter = ()[32],
				extraDefinition = ()[60]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				converter = ()[33],
				extraDefinition = ()[45]
			},
			{
				converter = ()[34],
				extraDefinition = ()[18]
			},
			{
				converter = ()[35],
				extraDefinition = ()[60]
			},
			{
				converter = ()[36],
				extraDefinition = {
					access = "w",
					parameterId = "2146500637"
				}
			},
			{
				advancedRefresh = ()[10],
				delayedStopIdentify = ()[13],
				getName = ()[14],
				identify = ()[15],
				keepOneWayControllersAndDeleteNode = ()[61],
				runManufacturerSettingsCommand = ()[62],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				setClosure = ()[38],
				close = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				up = ()[42],
				setMemorized1Position = ()[47],
				setName = ()[20],
				setPosition = ()[48],
				my = ()[51],
				setSecuredPosition = ()[53],
				startIdentify = ()[21],
				stop = ()[63],
				stopIdentify = ()[22],
				unpairAllOneWayControllers = ()[23],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				unpairOneWayController = ()[24],
				setConfigState = ()[25],
				wink = ()[26],
				sendIOKey = ()[65]
			},
			{
				["io:RollerShutterGenericIOComponent"] = {
					type = 1,
					widget = "PositionableRollerShutter",
					uiClass = "RollerShutter",
					uiProfiles = ()[54],
					states = ()[58],
					attributes = ()[59],
					commands = ()[66]
				}
			},
			{
				linkedHighLevelState = {
					()[5],
					()[12]
				}
			},
			{
				linkedHighLevelState = {
					()[6]
				}
			},
			{
				linkedHighLevelState = {
					()[8]
				}
			},
			{
				65537 = ()[68],
				2146500638 = ()[1],
				16832512 = ()[69],
				1 = ()[3],
				16832522 = ()[70],
				2147426304 = ()[4]
			},
			{
				"StatefulRockingShutter",
				"StatefulOrientableOrCloseable",
				"OrientableOrCloseable",
				"StatefulCloseable",
				"Closeable",
				"OpenClose"
			},
			{
				linkedHighLevelState = {
					()[18]
				}
			},
			{
				linkedHighLevelState = ()[34],
				linkedStateIds = ()[30]
			},
			{
				linkedHighLevelState = ()[34],
				linkedStateIds = ()[32]
			},
			{
				65537 = {
					linkedHighLevelState = {
						()[16],
						()[17],
						()[10]
					},
					linkedStateIds = ()[29]
				},
				2146500638 = ()[1],
				1 = ()[3],
				65540 = ()[73],
				2147426304 = ()[4],
				16830720 = ()[35],
				16832512 = ()[74],
				16832522 = ()[75],
				65557 = ()[36],
				2 = ()[56],
				2146500645 = ()[57]
			},
			{
				prototype = "integer[0;100]|string(rocker),*integer[0;100]",
				parameters = ()[8],
				converter = ()[39],
				extraDefinition = ()[45]
			},
			{
				prototype = "integer[0;100]|string(rocker)",
				parameters = ()[11],
				converter = ()[40],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[39],
				converter = ()[40],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[41],
				converter = ()[40],
				extraDefinition = ()[18]
			},
			{
				prototype = "integer[0;100]",
				parameters = ()[11],
				converter = ()[40],
				extraDefinition = ()[18]
			},
			{
				parameters = {
					{
						value = "rocker",
						name = "p1"
					}
				},
				converter = ()[40],
				extraDefinition = ()[18]
			},
			{
				prototype = "integer[0;100]",
				parameters = ()[11],
				converter = ()[41],
				extraDefinition = ()[45]
			},
			{
				converter = ()[42],
				extraDefinition = ()[45]
			},
			{
				type = 1,
				widget = "PositionableOrOrientableRollerShutter",
				uiClass = "AdjustableSlatsRollerShutter",
				uiProfiles = ()[72],
				states = ()[76],
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					pairOneWayController = ()[17],
					setClosureOrOrientation = ()[77],
					setClosureOrRockerPosition = ()[78],
					close = ()[79],
					down = ()[79],
					open = ()[80],
					setClosure = ()[81],
					setDeployment = ()[81],
					setRockerPosition = ()[82],
					up = ()[80],
					setName = ()[20],
					setOrientation = ()[83],
					startIdentify = ()[21],
					stop = ()[84],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26],
					sendIOKey = ()[65]
				}
			},
			{
				["io:AdjustableSlatsRollerShutterIOComponent"] = ()[85]
			},
			{
				"StatefulDeployableVerticalAwning",
				"StatefulDeployable",
				"Deployable",
				"DeployUndeploy",
				"StatefulCloseable",
				"StatefulOpenClose",
				"OpenClose"
			},
			{
				linkedHighLevelState = {
					()[5],
					()[20],
					()[12],
					()[10]
				},
				linkedStateIds = ()[29]
			},
			{
				65537 = ()[88],
				2146500638 = ()[1],
				16832512 = ()[31],
				1 = ()[3],
				16832522 = ()[33],
				2147426304 = ()[4],
				16830720 = ()[35],
				65557 = ()[36],
				2 = ()[56],
				2146500645 = ()[57]
			},
			{
				advancedRefresh = ()[10],
				delayedStopIdentify = ()[13],
				getName = ()[14],
				identify = ()[15],
				keepOneWayControllersAndDeleteNode = ()[61],
				runManufacturerSettingsCommand = ()[62],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				setMemorized1Position = ()[47],
				setName = ()[20],
				setPosition = ()[48],
				my = ()[51],
				setSecuredPosition = ()[53],
				startIdentify = ()[21],
				stop = ()[63],
				stopIdentify = ()[22],
				unpairAllOneWayControllers = ()[23],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				unpairOneWayController = ()[24],
				setConfigState = ()[25],
				wink = ()[26],
				sendIOKey = ()[65]
			},
			{
				["io:VerticalExteriorAwningIOComponent"] = {
					type = 1,
					widget = "PositionableScreen",
					uiClass = "ExteriorScreen",
					uiProfiles = ()[87],
					states = ()[89],
					attributes = ()[59],
					commands = ()[90]
				}
			},
			{
				"StatefulCloseableWindow",
				"StatefulCloseable",
				"Closeable",
				"StatefulOpenClose",
				"OpenClose"
			},
			{
				65537 = ()[68],
				2146500638 = ()[1],
				1 = ()[3],
				2147426304 = ()[4]
			},
			{
				advancedRefresh = ()[10],
				delayedStopIdentify = ()[13],
				getName = ()[14],
				identify = ()[15],
				pairOneWayController = ()[17],
				setClosure = ()[38],
				close = ()[40],
				open = ()[42],
				setName = ()[20],
				startIdentify = ()[21],
				stop = ()[63],
				stopIdentify = ()[22],
				unpairAllOneWayControllers = ()[23],
				unpairOneWayController = ()[24],
				setConfigState = ()[25],
				wink = ()[26]
			},
			{
				["io:WindowOpenerVeluxIOComponent"] = {
					type = 1,
					widget = "PositionableTiltedWindow",
					uiClass = "Window",
					uiProfiles = ()[92],
					states = ()[93],
					attributes = ()[5],
					commands = ()[94]
				}
			},
			{
				["io:GarageOpenerIOComponent"] = {
					type = 1,
					widget = "PositionableGarageDoor",
					uiClass = "GarageDoor",
					uiProfiles = {
						"StatefulCloseableGarageOpener",
						"StatefulCloseable",
						"Closeable",
						"OpenClose"
					},
					states = {
						65537 = {
							linkedHighLevelState = {
								()[21],
								()[22]
							}
						},
						2146500638 = ()[1],
						1 = ()[3],
						2147426304 = ()[4],
						2 = ()[56],
						2146500645 = ()[57]
					},
					attributes = ()[59],
					commands = {
						advancedRefresh = ()[10],
						delayedStopIdentify = ()[13],
						getName = ()[14],
						identify = ()[15],
						keepOneWayControllersAndDeleteNode = ()[61],
						runManufacturerSettingsCommand = ()[62],
						pairOneWayController = ()[17],
						setClosure = ()[38],
						close = ()[40],
						down = ()[40],
						open = ()[42],
						up = ()[42],
						setName = ()[20],
						startIdentify = ()[21],
						stop = ()[63],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						wink = ()[26],
						sendIOKey = ()[65]
					}
				}
			},
			{
				"OpenCloseGarageOpener",
				"OpenClose"
			},
			{
				converter = ()[49],
				extraDefinition = ()[18]
			},
			{
				converter = ()[50],
				extraDefinition = ()[18]
			},
			{
				["io:DiscreteGarageOpenerIOComponent"] = {
					type = 1,
					widget = "DiscretePositionableGarageDoor",
					uiClass = "GarageDoor",
					uiProfiles = ()[97],
					states = {
						2146500638 = ()[1],
						1 = ()[3],
						65537 = {
							linkedHighLevelState = {
								()[22]
							}
						},
						2147426304 = ()[4],
						2 = ()[56],
						2146500645 = ()[57]
					},
					attributes = ()[59],
					commands = {
						advancedRefresh = ()[10],
						close = ()[98],
						delayedStopIdentify = ()[13],
						down = ()[98],
						getName = ()[14],
						identify = ()[15],
						keepOneWayControllersAndDeleteNode = ()[61],
						runManufacturerSettingsCommand = ()[62],
						open = ()[99],
						pairOneWayController = ()[17],
						setName = ()[20],
						startIdentify = ()[21],
						stop = ()[63],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						up = ()[99],
						wink = ()[26],
						sendIOKey = ()[65]
					}
				}
			},
			{
				"StatefulLightDimmer",
				"StatefulDimmable",
				"Dimmable",
				"StatefulSwitchable",
				"Switchable"
			},
			{
				linkedHighLevelState = {
					()[23],
					()[25]
				}
			},
			{
				linkedHighLevelState = {
					()[24]
				}
			},
			{
				prototype = "integer[0;100]",
				parameters = ()[11],
				converter = ()[53],
				extraDefinition = ()[45]
			},
			{
				parameters = ()[41],
				converter = ()[53],
				extraDefinition = ()[45]
			},
			{
				parameters = ()[39],
				converter = ()[53],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(off;on)",
				parameters = ()[11],
				aliasConverter = ()[54],
				converter = ()[53],
				extraDefinition = ()[45]
			},
			{
				isParameterRequired = false,
				name = "p3"
			},
			{
				prototype = "integer[0;100],integer[5;14400],*integer[0;100]",
				parameters = {
					()[6],
					()[43],
					()[108]
				},
				converter = ()[55],
				extraDefinition = ()[45]
			},
			{
				prototype = "integer[5;14400]",
				parameters = ()[11],
				aliasConverter = ()[56],
				converter = ()[55],
				extraDefinition = ()[45]
			},
			{
				prototype = "integer[0;100]",
				parameters = ()[11],
				converter = ()[57],
				extraDefinition = ()[46]
			},
			{
				prototype = "string(my;memorized1;secured)|integer[0;100]",
				parameters = ()[11],
				converter = ()[58],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[50],
				converter = ()[58],
				extraDefinition = ()[18]
			},
			{
				prototype = "integer[0;100]",
				parameters = ()[11],
				converter = ()[57],
				extraDefinition = ()[52]
			},
			{
				["io:DimmableLightIOComponent"] = {
					type = 1,
					widget = "DimmerLight",
					uiClass = "Light",
					uiProfiles = ()[101],
					states = {
						2146500638 = ()[1],
						65537 = ()[102],
						16832512 = ()[103],
						1 = ()[3],
						16832522 = ()[70],
						2147426304 = ()[4],
						2 = ()[56],
						2146500645 = ()[57]
					},
					attributes = ()[59],
					commands = {
						advancedRefresh = ()[10],
						delayedStopIdentify = ()[13],
						getName = ()[14],
						identify = ()[15],
						keepOneWayControllersAndDeleteNode = ()[61],
						runManufacturerSettingsCommand = ()[62],
						pairOneWayController = ()[17],
						refreshMemorized1Position = ()[37],
						setIntensity = ()[104],
						off = ()[105],
						on = ()[106],
						setOnOff = ()[107],
						setIntensityWithTimer = ()[109],
						onWithTimer = ()[110],
						setMemorized1Position = ()[111],
						setName = ()[20],
						setPosition = ()[112],
						my = ()[113],
						setSecuredPosition = ()[114],
						startIdentify = ()[21],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						wink = ()[26],
						sendIOKey = ()[65]
					}
				}
			},
			{
				2146500638 = ()[1],
				1 = ()[3],
				65537 = {
					linkedHighLevelState = {
						()[26]
					}
				},
				2147426304 = ()[4]
			},
			{
				{
					value = "off",
					name = "p1"
				}
			},
			{
				{
					value = "on",
					name = "p1"
				}
			},
			{
				()[27],
				()[28],
				()[29]
			},
			{
				"65537",
				"65548"
			},
			{
				"65537",
				"65547"
			},
			{
				isParameterRequired = true,
				name = "p3"
			},
			{
				prototype = "integer[0;255],integer[0;255],integer[0;255]",
				parameters = {
					()[6],
					()[43],
					()[122]
				},
				converter = ()[64],
				extraDefinition = ()[45]
			},
			{
				isParameterRequired = true,
				name = "p4"
			},
			{
				()[6],
				()[43],
				()[122],
				()[124]
			},
			{
				prototype = "integer[0;255],integer[0;255],integer[0;255],integer[5;14400]",
				parameters = ()[125],
				converter = ()[65],
				extraDefinition = ()[45]
			},
			{
				["io:DimmableRGBLightIOComponent"] = {
					type = 1,
					widget = "DimmerRGBColouredLight",
					uiClass = "Light",
					uiProfiles = ()[101],
					states = {
						65547 = {
							linkedHighLevelState = ()[119],
							linkedStateIds = ()[120]
						},
						65548 = {
							linkedHighLevelState = ()[119],
							linkedStateIds = ()[121]
						},
						65537 = {
							linkedHighLevelState = {
								()[27],
								()[28],
								()[23],
								()[25],
								()[29]
							},
							linkedStateIds = {
								"65547",
								"65548"
							}
						},
						2146500638 = ()[1],
						16832512 = ()[103],
						1 = ()[3],
						16832522 = ()[70],
						2147426304 = ()[4],
						2 = ()[56],
						2146500645 = ()[57]
					},
					attributes = ()[59],
					commands = {
						advancedRefresh = ()[10],
						delayedStopIdentify = ()[13],
						getName = ()[14],
						identify = ()[15],
						keepOneWayControllersAndDeleteNode = ()[61],
						runManufacturerSettingsCommand = ()[62],
						pairOneWayController = ()[17],
						refreshMemorized1Position = ()[37],
						setIntensity = ()[104],
						off = ()[105],
						on = ()[106],
						setOnOff = ()[107],
						setIntensityWithTimer = ()[109],
						onWithTimer = ()[110],
						setMemorized1Position = ()[111],
						setName = ()[20],
						setPosition = ()[112],
						my = ()[113],
						setRGB = ()[123],
						setRGBWithTimer = ()[126],
						setSecuredPosition = ()[114],
						startIdentify = ()[21],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						wink = ()[26],
						sendIOKey = ()[65]
					}
				}
			},
			{
				linkedHighLevelState = {
					()[30]
				}
			},
			{
				rawStateId = "65537"
			},
			{
				()[129]
			},
			{
				prototype = "integer[2000;6500]",
				parameters = ()[11],
				rawStates = ()[130],
				converter = ()[67],
				extraDefinition = ()[45]
			},
			{
				["io:DimmableColorTemperatureLightIOComponent"] = {
					type = 1,
					widget = "DimmerColorTemperatureLight",
					uiClass = "Light",
					uiProfiles = ()[101],
					states = {
						65551 = ()[128],
						2146500638 = ()[1],
						65537 = ()[102],
						16832512 = ()[103],
						1 = ()[3],
						16832522 = ()[70],
						2147426304 = ()[4],
						2 = ()[56],
						2146500645 = ()[57]
					},
					attributes = ()[59],
					commands = {
						advancedRefresh = ()[10],
						delayedStopIdentify = ()[13],
						getName = ()[14],
						identify = ()[15],
						keepOneWayControllersAndDeleteNode = ()[61],
						runManufacturerSettingsCommand = ()[62],
						pairOneWayController = ()[17],
						refreshMemorized1Position = ()[37],
						setColorTemperature = ()[131],
						setIntensity = ()[104],
						off = ()[105],
						on = ()[106],
						setOnOff = ()[107],
						setIntensityWithTimer = ()[109],
						onWithTimer = ()[110],
						setMemorized1Position = ()[111],
						setName = ()[20],
						setPosition = ()[112],
						my = ()[113],
						setSecuredPosition = ()[114],
						startIdentify = ()[21],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						wink = ()[26],
						sendIOKey = ()[65]
					}
				}
			},
			{
				"StatefulSwitchableLight",
				"StatefulSwitchable",
				"Switchable"
			},
			{
				linkedHighLevelState = {
					()[31]
				}
			},
			{
				prototype = "integer[5;14400]",
				parameters = ()[11],
				converter = ()[69],
				extraDefinition = ()[18]
			},
			{
				prototype = "string(off;on)",
				parameters = ()[11],
				converter = ()[70],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[117],
				converter = ()[70],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[118],
				converter = ()[70],
				extraDefinition = ()[18]
			},
			{
				type = 1,
				widget = "StatefulOnOffLight",
				uiClass = "Light",
				uiProfiles = ()[133],
				states = {
					2146500638 = ()[1],
					1 = ()[3],
					65537 = ()[134],
					2147426304 = ()[4],
					2 = ()[56],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					onWithTimer = ()[135],
					pairOneWayController = ()[17],
					setName = ()[20],
					setOnOff = ()[136],
					off = ()[137],
					on = ()[138],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26],
					sendIOKey = ()[65]
				}
			},
			{
				["io:OnOffLightIOComponent"] = ()[139]
			},
			{
				"16830720",
				"16832519"
			},
			{
				"16830720",
				"65537"
			},
			{
				linkedHighLevelState = {
					()[33],
					()[34]
				},
				linkedStateIds = ()[142]
			},
			{
				()[33]
			},
			{
				linkedHighLevelState = ()[144],
				linkedStateIds = {
					"16832519",
					"65537"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "16832519"
				}
			},
			{
				prototype = "integer[0;100]",
				parameters = ()[11],
				converter = ()[73],
				extraDefinition = ()[18]
			},
			{
				["io:GateOpenerIOComponent"] = {
					type = 1,
					widget = "PositionableGateWithPedestrianPosition",
					uiClass = "Gate",
					uiProfiles = {
						"StatefulCloseableGateOpener",
						"StatefulCloseable",
						"Closeable",
						"OpenClose"
					},
					states = {
						65537 = {
							linkedHighLevelState = {
								()[32],
								()[33]
							},
							linkedStateIds = ()[141]
						},
						2146500638 = ()[1],
						1 = ()[3],
						16832519 = ()[143],
						16830720 = ()[145],
						2147426304 = ()[4],
						2 = ()[56],
						2146500645 = ()[57]
					},
					attributes = ()[59],
					commands = {
						advancedRefresh = ()[10],
						delayedStopIdentify = ()[13],
						getName = ()[14],
						identify = ()[15],
						keepOneWayControllersAndDeleteNode = ()[61],
						runManufacturerSettingsCommand = ()[62],
						pairOneWayController = ()[17],
						refreshPedestrianPosition = ()[146],
						setClosureOrPedestrianPosition = {
							prototype = "integer[0;100]|string(pedestrian)",
							parameters = ()[11],
							converter = ()[73],
							extraDefinition = ()[18]
						},
						close = {
							parameters = ()[39],
							converter = ()[73],
							extraDefinition = ()[18]
						},
						open = {
							parameters = ()[41],
							converter = ()[73],
							extraDefinition = ()[18]
						},
						setClosure = ()[147],
						setDeployment = ()[147],
						setPedestrianPosition = {
							parameters = {
								{
									value = "pedestrian",
									name = "p1"
								}
							},
							converter = ()[73],
							extraDefinition = ()[18]
						},
						setName = ()[20],
						startIdentify = ()[21],
						stop = ()[63],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						wink = ()[26],
						sendIOKey = ()[65]
					}
				}
			},
			{
				"OpenCloseSlidingGateOpener",
				"OpenClose"
			},
			{
				converter = ()[74],
				extraDefinition = ()[18]
			},
			{
				type = 1,
				widget = "SlidingDiscreteGateWithPedestrianPosition",
				uiClass = "Gate",
				uiProfiles = ()[149],
				states = {
					2146500638 = ()[1],
					1 = ()[3],
					65537 = {
						linkedHighLevelState = ()[144],
						linkedStateIds = ()[141]
					},
					16832519 = ()[143],
					16830720 = ()[145],
					2147426304 = ()[4],
					2 = ()[56],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					close = ()[98],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					open = ()[99],
					pairOneWayController = ()[17],
					refreshPedestrianPosition = ()[146],
					setName = ()[20],
					setPedestrianPosition = ()[150],
					startIdentify = ()[21],
					stop = ()[63],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26],
					sendIOKey = ()[65]
				}
			},
			{
				["io:SlidingDiscreteGateOpenerIOComponent"] = ()[151]
			},
			{
				linkedHighLevelState = {
					()[5],
					()[7]
				}
			},
			{
				advancedRefresh = ()[10],
				delayedStopIdentify = ()[13],
				getName = ()[14],
				identify = ()[15],
				keepOneWayControllersAndDeleteNode = ()[61],
				runManufacturerSettingsCommand = ()[62],
				pairOneWayController = ()[17],
				setClosure = ()[38],
				close = ()[40],
				open = ()[42],
				setName = ()[20],
				startIdentify = ()[21],
				stop = ()[63],
				stopIdentify = ()[22],
				unpairAllOneWayControllers = ()[23],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				unpairOneWayController = ()[24],
				setConfigState = ()[25],
				wink = ()[26],
				sendIOKey = ()[65]
			},
			{
				["io:RollingDoorOpenerIOComponent"] = {
					type = 1,
					widget = "PositionableGarageDoor",
					uiClass = "GarageDoor",
					uiProfiles = {
						"StatefulCloseableSlidingDoor",
						"StatefulCloseable",
						"Closeable",
						"StatefulOpenClose",
						"OpenClose"
					},
					states = {
						65537 = ()[153],
						2146500638 = ()[1],
						1 = ()[3],
						2147426304 = ()[4],
						2 = ()[56],
						2146500645 = ()[57]
					},
					attributes = ()[59],
					commands = ()[154]
				}
			},
			{
				"StatefulDoorLockWithOpeningStatus",
				"StatefulLockWithOpeningStatus",
				"StatefulLock",
				"LockStatus",
				"Lock",
				"StatefulBasicOpenClose",
				"BasicOpenClose"
			},
			{
				linkedHighLevelState = {
					()[35],
					()[36]
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "65537"
				}
			},
			{
				{
					value = "closed",
					name = "p1"
				}
			},
			{
				parameters = ()[159],
				converter = ()[77],
				extraDefinition = ()[18]
			},
			{
				{
					value = "open",
					name = "p1"
				}
			},
			{
				parameters = ()[161],
				converter = ()[77],
				extraDefinition = ()[18]
			},
			{
				["io:DoorLockIOComponent"] = {
					type = 1,
					widget = "DoorLock",
					uiClass = "DoorLock",
					uiProfiles = ()[156],
					states = {
						2146500638 = ()[1],
						65537 = ()[157],
						1 = ()[3],
						2147426304 = ()[4],
						2 = ()[56],
						2146500645 = ()[57]
					},
					attributes = ()[59],
					commands = {
						advancedRefresh = ()[10],
						delayedStopIdentify = ()[13],
						getName = ()[14],
						getOpenClose = ()[158],
						identify = ()[15],
						keepOneWayControllersAndDeleteNode = ()[61],
						runManufacturerSettingsCommand = ()[62],
						pairOneWayController = ()[17],
						refreshLockedUnlocked = ()[158],
						setName = ()[20],
						setOpenClosed = {
							prototype = "string(open;closed)",
							parameters = ()[11],
							converter = ()[77],
							extraDefinition = ()[18]
						},
						close = ()[160],
						lock = ()[160],
						open = ()[162],
						setLockedUnlocked = {
							prototype = "string(locked;unlocked)",
							parameters = ()[11],
							aliasConverter = ()[78],
							converter = ()[77],
							extraDefinition = ()[18]
						},
						unlock = ()[162],
						startIdentify = ()[21],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						wink = ()[26],
						sendIOKey = ()[65]
					}
				}
			},
			{
				parameters = ()[159],
				converter = ()[81],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[161],
				converter = ()[81],
				extraDefinition = ()[18]
			},
			{
				["io:WindowLockIOComponent"] = {
					type = 1,
					widget = "WindowLock",
					uiClass = "DoorLock",
					uiProfiles = {
						"StatefulWindowLockWithOpeningStatus",
						"StatefulLockWithOpeningStatus",
						"StatefulLock",
						"LockStatus",
						"Lock",
						"StatefulBasicOpenClose",
						"BasicOpenClose"
					},
					states = {
						2146500638 = ()[1],
						65537 = ()[157],
						1 = ()[3],
						2147426304 = ()[4],
						65538 = {
							linkedHighLevelState = {
								()[37]
							}
						}
					},
					attributes = ()[5],
					commands = {
						advancedRefresh = ()[10],
						delayedStopIdentify = ()[13],
						getName = ()[14],
						identify = ()[15],
						pairOneWayController = ()[17],
						setLockPosition = {
							prototype = "any",
							parameters = ()[11],
							converter = ()[80],
							extraDefinition = ()[45]
						},
						setName = ()[20],
						setOpenClosed = {
							prototype = "string(open;closed)",
							parameters = ()[11],
							converter = ()[81],
							extraDefinition = ()[18]
						},
						close = ()[164],
						lock = ()[164],
						open = ()[165],
						setLockedUnlocked = {
							prototype = "string(locked;unlocked)",
							parameters = ()[11],
							aliasConverter = ()[78],
							converter = ()[81],
							extraDefinition = ()[18]
						},
						unlock = ()[165],
						startIdentify = ()[21],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						wink = ()[26]
					}
				}
			},
			{
				"StatefulCloseableBlind",
				"StatefulCloseable",
				"Closeable",
				"StatefulOpenClose",
				"OpenClose"
			},
			{
				advancedRefresh = ()[10],
				delayedStopIdentify = ()[13],
				getName = ()[14],
				identify = ()[15],
				keepOneWayControllersAndDeleteNode = ()[61],
				runManufacturerSettingsCommand = ()[62],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				setClosure = ()[38],
				close = ()[40],
				down = ()[40],
				open = ()[42],
				up = ()[42],
				setMemorized1Position = ()[47],
				setName = ()[20],
				setPosition = ()[48],
				my = ()[51],
				setSecuredPosition = ()[53],
				startIdentify = ()[21],
				stop = ()[63],
				stopIdentify = ()[22],
				unpairAllOneWayControllers = ()[23],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				unpairOneWayController = ()[24],
				setConfigState = ()[25],
				wink = ()[26],
				sendIOKey = ()[65]
			},
			{
				["io:VerticalInteriorBlindGenericIOComponent"] = {
					type = 1,
					widget = "PositionableScreen",
					uiClass = "Screen",
					uiProfiles = ()[167],
					states = ()[58],
					attributes = ()[59],
					commands = ()[168]
				}
			},
			{
				prototype = "any",
				parameters = ()[11],
				converter = ()[82],
				extraDefinition = ()[45]
			},
			{
				parameters = ()[39],
				converter = ()[82],
				extraDefinition = ()[45]
			},
			{
				parameters = ()[41],
				converter = ()[82],
				extraDefinition = ()[45]
			},
			{
				prototype = "integer[0;100],integer[0;100]",
				parameters = ()[44],
				converter = ()[83],
				extraDefinition = ()[45]
			},
			{
				prototype = "any",
				parameters = ()[11],
				converter = ()[84],
				extraDefinition = ()[45]
			},
			{
				parameters = ()[39],
				converter = ()[84],
				extraDefinition = ()[45]
			},
			{
				parameters = ()[41],
				converter = ()[84],
				extraDefinition = ()[45]
			},
			{
				"StatefulThermostatWithSensor",
				"StatefulThermostat",
				"Thermostat"
			},
			{
				()[42],
				()[43],
				()[44],
				()[45],
				()[46]
			},
			{
				linkedHighLevelState = {
					()[46]
				},
				linkedStateIds = {
					"65558",
					"65559"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "16832527"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "16832526"
				}
			},
			{
				{
					rawStateId = "65558"
				},
				{
					rawStateId = "65559"
				}
			},
			{
				access = "w",
				parameterId = "16832527"
			},
			{
				prototype = "float[0.0;100.0]",
				parameters = ()[11],
				rawStates = ()[182],
				converter = ()[95],
				extraDefinition = ()[183]
			},
			{
				access = "w",
				parameterId = "16832526"
			},
			{
				converter = ()[100],
				extraDefinition = ()[45]
			},
			{
				prototype = "integer[5;14400]",
				parameters = ()[11],
				converter = ()[101],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(off;on)",
				parameters = ()[11],
				converter = ()[102],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[117],
				converter = ()[102],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[118],
				converter = ()[102],
				extraDefinition = ()[18]
			},
			{
				linkedHighLevelState = {
					()[49]
				}
			},
			{
				2146500638 = ()[1],
				1 = ()[3],
				65537 = ()[134],
				2147426304 = ()[4],
				84059651 = {
					linkedHighLevelState = {
						()[48],
						()[50]
					}
				},
				2 = ()[56],
				2146500645 = ()[57],
				84059655 = ()[191]
			},
			{
				rawStateId = "84059651"
			},
			{
				()[193]
			},
			{
				access = "w",
				parameterId = "5"
			},
			{
				prototype = "integer[0;65535]",
				parameters = ()[11],
				rawStates = ()[194],
				converter = ()[106],
				extraDefinition = ()[195]
			},
			{
				prototype = "string(onOffLight;onOffSwitch)",
				parameters = ()[11],
				rawStates = ()[194],
				converter = ()[107],
				extraDefinition = ()[195]
			},
			{
				advancedRefresh = ()[10],
				delayedStopIdentify = ()[13],
				getName = ()[14],
				identify = ()[15],
				keepOneWayControllersAndDeleteNode = ()[61],
				runManufacturerSettingsCommand = ()[62],
				onWithInternalTimer = ()[186],
				onWithTimer = ()[187],
				pairOneWayController = ()[17],
				setInternalTimer = ()[196],
				setName = ()[20],
				setOnOff = ()[188],
				off = ()[189],
				on = ()[190],
				setPictoValue = ()[197],
				startIdentify = ()[21],
				stopIdentify = ()[22],
				unpairAllOneWayControllers = ()[23],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				unpairOneWayController = ()[24],
				setConfigState = ()[25],
				wink = ()[26],
				sendIOKey = ()[65]
			},
			{
				"StatefulDeployableAwning",
				"StatefulDeployable",
				"Deployable",
				"DeployUndeploy",
				"StatefulOpenClose",
				"OpenClose"
			},
			{
				65537 = {
					linkedHighLevelState = {
						()[20],
						()[51],
						()[10]
					},
					linkedStateIds = ()[29]
				},
				2146500638 = ()[1],
				16832512 = ()[31],
				1 = ()[3],
				16832522 = ()[33],
				2147426304 = ()[4],
				16830720 = ()[35],
				65557 = ()[36],
				2 = ()[56],
				2146500645 = ()[57]
			},
			{
				prototype = "integer[0;100]",
				parameters = ()[11],
				aliasConverter = ()[109],
				converter = ()[24],
				extraDefinition = ()[18]
			},
			{
				advancedRefresh = ()[10],
				delayedStopIdentify = ()[13],
				getName = ()[14],
				identify = ()[15],
				keepOneWayControllersAndDeleteNode = ()[61],
				runManufacturerSettingsCommand = ()[62],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				setDeployment = ()[38],
				close = ()[42],
				deploy = ()[40],
				down = ()[40],
				open = ()[40],
				setClosure = ()[201],
				undeploy = ()[42],
				up = ()[42],
				setMemorized1Position = ()[47],
				setName = ()[20],
				setPosition = ()[48],
				my = ()[51],
				setSecuredPosition = ()[53],
				startIdentify = ()[21],
				stop = ()[63],
				stopIdentify = ()[22],
				unpairAllOneWayControllers = ()[23],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				unpairOneWayController = ()[24],
				setConfigState = ()[25],
				wink = ()[26],
				sendIOKey = ()[65]
			},
			{
				["io:HorizontalAwningIOComponent"] = {
					type = 1,
					widget = "PositionableHorizontalAwning",
					uiClass = "Awning",
					uiProfiles = ()[199],
					states = ()[200],
					attributes = ()[59],
					commands = ()[202]
				}
			},
			{
				"StatefulSlidingPergola",
				"StatefulDeployable",
				"Deployable",
				"DeployUndeploy",
				"StatefulOpenClose",
				"OpenClose"
			},
			{
				["io:PergolaRailGuidedAwningIOComponent"] = {
					type = 1,
					widget = "PergolaHorizontalAwning",
					uiClass = "Pergola",
					uiProfiles = ()[204],
					states = ()[200],
					attributes = ()[59],
					commands = ()[202]
				}
			},
			{
				isParameterRequired = false,
				name = "p1"
			},
			{
				()[206]
			},
			{
				prototype = "*integer[25;3200]",
				parameters = ()[207],
				converter = ()[110],
				extraDefinition = ()[45]
			},
			{
				prototype = "*integer[25;3175]",
				parameters = ()[207],
				converter = ()[111],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(lower;upper)",
				parameters = ()[11],
				converter = ()[112],
				extraDefinition = {
					access = "w",
					parameterId = "2146500644"
				}
			},
			{
				linkedHighLevelState = {
					()[52]
				}
			},
			{
				65537 = ()[55],
				2146500638 = ()[1],
				16832512 = ()[31],
				17029120 = ()[211],
				1 = ()[3],
				16832522 = ()[33],
				65540 = ()[73],
				2147426304 = ()[4],
				16830720 = ()[35],
				65557 = ()[36],
				2 = ()[56],
				2146500645 = ()[57]
			},
			{
				prototype = "string(my;memorized1;secured)|integer[0;100],string(my;memorized1)|integer[0;100]",
				parameters = ()[44],
				converter = ()[113],
				extraDefinition = ()[45]
			},
			{
				parameters = {
					()[49],
					{
						value = "my",
						name = "p2"
					}
				},
				converter = ()[113],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(my;memorized1)|integer[0;100]",
				parameters = ()[11],
				converter = ()[114],
				extraDefinition = ()[45]
			},
			{
				prototype = "integer[0;100]",
				parameters = ()[11],
				converter = ()[24],
				extraDefinition = {
					access = "w",
					parameterId = "17029120"
				}
			},
			{
				advancedRefresh = ()[10],
				delayedStopIdentify = ()[13],
				getName = ()[14],
				identify = ()[15],
				keepOneWayControllersAndDeleteNode = ()[61],
				runManufacturerSettingsCommand = ()[62],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				setClosure = ()[38],
				close = ()[40],
				down = ()[40],
				open = ()[42],
				up = ()[42],
				setClosureAndOrientation = ()[213],
				my = ()[214],
				setMemorized1Position = ()[47],
				setName = ()[20],
				setOrientation = ()[215],
				setMemorized1Orientation = ()[216],
				setPosition = ()[48],
				setSecuredPosition = ()[53],
				startIdentify = ()[21],
				stop = ()[63],
				stopIdentify = ()[22],
				unpairAllOneWayControllers = ()[23],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				unpairOneWayController = ()[24],
				setConfigState = ()[25],
				wink = ()[26],
				sendIOKey = ()[65]
			},
			{
				["io:ExteriorVenetianBlindIOComponent"] = {
					type = 1,
					widget = "PositionableExteriorVenetianBlind",
					uiClass = "ExteriorVenetianBlind",
					uiProfiles = ()[28],
					states = ()[212],
					attributes = ()[59],
					commands = ()[217]
				}
			},
			{
				"SwitchableVentilation",
				"Switchable"
			},
			{
				type = 1,
				widget = "VentilationInlet",
				uiClass = "VentilationSystem",
				uiProfiles = ()[219],
				states = {
					65537 = {
						linkedHighLevelState = {
							()[53]
						}
					},
					2146500638 = ()[1],
					16832512 = ()[69],
					1 = ()[3],
					16832522 = ()[70],
					2147426304 = ()[4]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					setAirInput = ()[38],
					off = ()[42],
					on = ()[40],
					setName = ()[20],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			},
			{
				"StatefulLevelControlHeating",
				"StatefulLevelControl",
				"LevelControl",
				"Switchable"
			},
			{
				prototype = "integer[0;100]|string(memorized1;my)",
				parameters = ()[11],
				converter = ()[115],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[39],
				converter = ()[115],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[41],
				converter = ()[115],
				extraDefinition = ()[18]
			},
			{
				{
					value = "memorized1",
					name = "p1"
				}
			},
			{
				parameters = ()[225],
				converter = ()[115],
				extraDefinition = ()[18]
			},
			{
				type = 1,
				widget = "DimmerExteriorHeating",
				uiClass = "ExteriorHeatingSystem",
				uiProfiles = ()[221],
				states = {
					2146500638 = ()[1],
					65537 = ()[2],
					1 = ()[3],
					16832512 = ()[69],
					2147426304 = ()[4],
					2 = ()[56],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getLevel = ()[158],
					getName = ()[14],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					pairOneWayController = ()[17],
					setLevel = ()[222],
					off = ()[223],
					on = ()[224],
					my = ()[226],
					setName = ()[20],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26],
					sendIOKey = ()[65],
					setMemorized1Position = ()[47]
				}
			},
			{
				"StatefulSwitchableHeating",
				"StatefulSwitchable",
				"Switchable"
			},
			{
				converter = ()[117],
				extraDefinition = ()[18]
			},
			{
				converter = ()[118],
				extraDefinition = ()[18]
			},
			{
				["io:DiscreteExteriorHeatingIOComponent"] = {
					type = 1,
					widget = "DiscreteExteriorHeating",
					uiClass = "ExteriorHeatingSystem",
					uiProfiles = ()[228],
					states = {
						2146500638 = ()[1],
						1 = ()[3],
						65537 = {
							linkedHighLevelState = {
								()[57]
							}
						},
						2147426304 = ()[4],
						2 = ()[56],
						2146500645 = ()[57]
					},
					attributes = ()[59],
					commands = {
						advancedRefresh = ()[10],
						delayedStopIdentify = ()[13],
						getName = ()[14],
						identify = ()[15],
						keepOneWayControllersAndDeleteNode = ()[61],
						runManufacturerSettingsCommand = ()[62],
						off = ()[229],
						on = ()[230],
						pairOneWayController = ()[17],
						setName = ()[20],
						startIdentify = ()[21],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						wink = ()[26],
						sendIOKey = ()[65]
					}
				}
			},
			{
				access = "r",
				parameterId = "65553"
			},
			{
				extraDefinition = ()[232]
			},
			{
				access = "w",
				parameterId = "16832530"
			},
			{
				converter = ()[128],
				extraDefinition = ()[18]
			},
			{
				converter = ()[129],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[39],
				converter = ()[12],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[41],
				converter = ()[12],
				extraDefinition = ()[18]
			},
			{
				prototype = "integer[0;100],*string(lowspeed)",
				parameters = ()[8],
				converter = ()[130],
				extraDefinition = ()[45]
			},
			{
				parameters = ()[50],
				converter = ()[131],
				extraDefinition = ()[18]
			},
			{
				"StatefulCloseableSlidingWindow",
				"StatefulCloseable",
				"Closeable",
				"StatefulLock",
				"LockStatus",
				"Lock",
				"OpenClose"
			},
			{
				linkedHighLevelState = {
					()[69]
				}
			},
			{
				"65537"
			},
			{
				linkedHighLevelState = {
					()[70]
				},
				linkedStateIds = ()[243]
			},
			{
				rawStates = ()[194],
				converter = ()[143],
				extraDefinition = ()[195]
			},
			{
				rawStates = ()[194],
				converter = ()[144],
				extraDefinition = ()[195]
			},
			{
				rawStates = ()[130],
				converter = ()[145],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(my;securedVentilation)|integer[0;100]",
				parameters = ()[11],
				converter = ()[131],
				extraDefinition = ()[18]
			},
			{
				prototype = "string(my;securedVentilation)|integer[0;100],*string(lowspeed)",
				parameters = ()[8],
				converter = ()[132],
				extraDefinition = ()[45]
			},
			{
				rawStates = ()[130],
				converter = ()[146],
				extraDefinition = ()[45]
			},
			{
				["io:PositionableAndLockableSlidingWindowComponent"] = {
					type = 1,
					widget = "PositionableAndLockableSlidingWindow",
					uiClass = "Window",
					uiProfiles = ()[241],
					states = {
						65537 = {
							linkedHighLevelState = {
								()[5],
								()[70]
							},
							linkedStateIds = {
								"65801"
							}
						},
						2146500638 = ()[1],
						65546 = ()[242],
						1 = ()[3],
						65801 = ()[244],
						84059651 = {
							linkedHighLevelState = {
								()[71],
								()[72],
								()[73],
								()[74],
								()[75]
							}
						},
						2147426304 = ()[4],
						2 = ()[56],
						16832512 = ()[69],
						2146500645 = ()[57]
					},
					attributes = ()[59],
					commands = {
						advancedRefresh = ()[10],
						activateTimer = ()[245],
						deactivateTimer = ()[246],
						delayedStopIdentify = ()[13],
						getName = ()[14],
						identify = ()[15],
						keepOneWayControllersAndDeleteNode = ()[61],
						runManufacturerSettingsCommand = ()[62],
						lock = ()[247],
						pairOneWayController = ()[17],
						setClosure = ()[19],
						close = ()[237],
						open = ()[238],
						setClosureAndLinearSpeed = ()[239],
						setName = ()[20],
						setPosition = ()[248],
						my = ()[240],
						setPositionAndLinearSpeed = ()[249],
						setTimer = ()[196],
						setMemorized1Position = ()[47],
						refreshMemorized1Position = ()[37],
						startIdentify = ()[21],
						stop = ()[63],
						stopIdentify = ()[22],
						unlock = ()[250],
						unpairAllOneWayControllers = ()[23],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						wink = ()[26],
						sendIOKey = ()[65]
					}
				}
			},
			{
				"StatefulBioClimaticPergola",
				"StatefulOrientableSlats",
				"OrientableSlats"
			},
			{
				linkedHighLevelState = {
					()[76]
				}
			},
			{
				linkedHighLevelState = {
					()[77]
				}
			},
			{
				2146500638 = ()[1],
				16832512 = ()[253],
				1 = ()[3],
				16832522 = ()[254],
				65537 = {
					linkedHighLevelState = {
						()[78],
						()[79],
						()[80]
					}
				},
				2147426304 = ()[4],
				2 = ()[56],
				2146500645 = ()[57]
			},
			{
				prototype = "integer[0;100]|string(memorized1;secured)",
				parameters = ()[11],
				converter = ()[147],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[225],
				converter = ()[147],
				extraDefinition = ()[18]
			},
			{
				["io:BioclimaticPergolaIOComponent"] = {
					type = 1,
					widget = "BioclimaticPergola",
					uiClass = "Pergola",
					uiProfiles = ()[252],
					states = ()[255],
					attributes = ()[59],
					commands = {
						advancedRefresh = ()[10],
						closeSlats = ()[98],
						delayedStopIdentify = ()[13],
						getName = ()[14],
						identify = ()[15],
						keepOneWayControllersAndDeleteNode = ()[61],
						runManufacturerSettingsCommand = ()[62],
						openSlats = ()[99],
						pairOneWayController = ()[17],
						refreshMemorized1Orientation = ()[37],
						setMemorized1Orientation = ()[47],
						setName = ()[20],
						setOrientation = ()[256],
						my = ()[257],
						setSecuredOrientation = ()[53],
						setSlatsOrientationWithSpeed = {
							prototype = "integer[0;100]|string(memorized1;secured),integer[0;100]",
							parameters = ()[44],
							converter = ()[148],
							extraDefinition = ()[45]
						},
						startIdentify = ()[21],
						stop = ()[63],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						wink = ()[26],
						sendIOKey = ()[65]
					}
				}
			},
			{
				"StatefulSiren",
				"Siren"
			},
			{
				linkedHighLevelState = {
					()[81]
				}
			},
			{
				linkedHighLevelState = {
					()[82]
				}
			},
			{
				converter = ()[151],
				extraDefinition = ()[18]
			},
			{
				isParameterRequired = true,
				name = "p5"
			},
			{
				isParameterRequired = true,
				name = "p6"
			},
			{
				isParameterRequired = true,
				name = "p7"
			},
			{
				isParameterRequired = true,
				name = "p8"
			},
			{
				isParameterRequired = true,
				name = "p9"
			},
			{
				isParameterRequired = true,
				name = "p10"
			},
			{
				{
					rawStateId = "io:MemorizedVolumeState"
				}
			},
			{
				value = 2000,
				name = "p1"
			},
			{
				value = 50,
				name = "p2"
			},
			{
				value = 0,
				name = "p3"
			},
			{
				value = "standard",
				name = "p4"
			},
			{
				isParameterRequired = true,
				name = "p11"
			},
			{
				isParameterRequired = true,
				name = "p12"
			},
			{
				access = "w",
				parameterId = "io:MemorizedVolumeState"
			},
			{
				"StatefulThermostatWithSensor",
				"StatefulThermostat",
				"Thermostat",
				"WaterConsumption"
			},
			{
				linkedHighLevelState = {
					()[85]
				}
			},
			{
				linkedHighLevelState = {
					()[86],
					()[99]
				},
				linkedStateIds = {
					"16830720",
					"16832522",
					"16832530",
					"16832531",
					"16832534",
					"65558",
					"65559"
				}
			},
			{
				()[86],
				()[89],
				()[90],
				()[91],
				()[44],
				()[99],
				()[46]
			},
			{
				linkedHighLevelState = ()[280],
				linkedStateIds = {
					"16830720",
					"16832522",
					"16832527",
					"16832530",
					"16832531",
					"16832534",
					"65537",
					"65559"
				}
			},
			{
				linkedHighLevelState = ()[280],
				linkedStateIds = {
					"16830720",
					"16832522",
					"16832527",
					"16832530",
					"16832531",
					"16832534",
					"65537",
					"65558"
				}
			},
			{
				linkedHighLevelState = {
					()[87]
				}
			},
			{
				linkedHighLevelState = {
					()[88]
				}
			},
			{
				linkedHighLevelState = {
					()[89],
					()[99]
				},
				linkedStateIds = {
					"16830720",
					"16832522",
					"16832527",
					"16832531",
					"16832534",
					"65558",
					"65559"
				}
			},
			{
				linkedHighLevelState = {
					()[90],
					()[99]
				},
				linkedStateIds = {
					"16830720",
					"16832522",
					"16832527",
					"16832530",
					"16832531",
					"65558",
					"65559"
				}
			},
			{
				linkedHighLevelState = {
					()[91],
					()[99]
				},
				linkedStateIds = {
					"16830720",
					"16832522",
					"16832527",
					"16832530",
					"16832534",
					"65558",
					"65559"
				}
			},
			{
				linkedHighLevelState = {
					()[92]
				}
			},
			{
				linkedHighLevelState = {
					()[93],
					()[95]
				}
			},
			{
				linkedHighLevelState = {
					()[94],
					()[96]
				}
			},
			{
				linkedHighLevelState = {
					()[97]
				}
			},
			{
				linkedHighLevelState = {
					()[98]
				}
			},
			{
				linkedHighLevelState = {
					()[44],
					()[99]
				},
				linkedStateIds = {
					"16830720",
					"16832527",
					"16832530",
					"16832531",
					"16832534",
					"65558",
					"65559"
				}
			},
			{
				linkedHighLevelState = {
					()[99]
				},
				linkedStateIds = {
					"16832522",
					"16832527",
					"16832530",
					"16832531",
					"16832534",
					"65558",
					"65559"
				}
			},
			{
				linkedHighLevelState = {
					()[100]
				}
			},
			{
				linkedHighLevelState = {
					()[101]
				}
			},
			{
				linkedHighLevelState = {
					()[102]
				}
			},
			{
				linkedHighLevelState = {
					()[103]
				}
			},
			{
				linkedHighLevelState = {
					()[104]
				}
			},
			{
				linkedHighLevelState = {
					()[105]
				}
			},
			{
				linkedHighLevelState = {
					()[106]
				}
			},
			{
				linkedHighLevelState = {
					()[107],
					()[110]
				}
			},
			{
				linkedHighLevelState = {
					()[108]
				}
			},
			{
				linkedHighLevelState = {
					()[109]
				}
			},
			{
				linkedHighLevelState = {
					()[111]
				}
			},
			{
				linkedHighLevelState = {
					()[112]
				}
			},
			{
				linkedHighLevelState = {
					()[113]
				}
			},
			{
				linkedHighLevelState = {
					()[114]
				}
			},
			{
				linkedHighLevelState = {
					()[115]
				}
			},
			{
				linkedHighLevelState = {
					()[116]
				}
			},
			{
				linkedHighLevelState = {
					()[117]
				}
			},
			{
				linkedHighLevelState = {
					()[118]
				}
			},
			{
				linkedHighLevelState = {
					()[119]
				}
			},
			{
				linkedHighLevelState = {
					()[120]
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201329665"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201327873"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201330945"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201326593"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201328641"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201327105"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201328129"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201330177"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201331457"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201330689"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201328385"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201332481"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "65552"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201329153"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201327361"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201329409"
				}
			},
			{
				converter = ()[188],
				extraDefinition = {
					access = "r",
					parameterId = "65547"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201331201"
				}
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201326849"
				}
			},
			{
				prototype = "integer[0;4]",
				parameters = ()[11],
				converter = ()[189],
				extraDefinition = {
					access = "w",
					parameterId = "201329665"
				}
			},
			{
				prototype = "integer[0;99]|string(always)",
				parameters = ()[11],
				converter = ()[190],
				extraDefinition = {
					access = "w",
					parameterId = "201327873"
				}
			},
			{
				prototype = "string(boilerOptimising;boilerPriority;heatPumpOptimising;heatPumpPriority)",
				parameters = ()[11],
				converter = ()[191],
				extraDefinition = {
					access = "w",
					parameterId = "201330945"
				}
			},
			{
				prototype = "integer[1;7]",
				parameters = ()[11],
				converter = ()[189],
				extraDefinition = {
					access = "w",
					parameterId = "201326593"
				}
			},
			{
				prototype = "object",
				parameters = ()[11],
				converter = ()[192],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(autoMode;manualEcoActive;manualEcoInactive)",
				parameters = ()[11],
				converter = ()[193],
				extraDefinition = {
					access = "w",
					parameterId = "201328129"
				}
			},
			{
				prototype = "object",
				parameters = ()[11],
				converter = ()[194],
				extraDefinition = {
					access = "w",
					parameterId = "201330433"
				}
			},
			{
				prototype = "float[0.0;100.0]",
				parameters = ()[11],
				rawStates = ()[182],
				converter = ()[95],
				extraDefinition = ()[234]
			},
			{
				prototype = "string(auto;deactive)",
				parameters = ()[11],
				converter = ()[195],
				extraDefinition = {
					access = "w",
					parameterId = "201330177"
				}
			},
			{
				prototype = "string(fastExtractionSpeed;lowExtractionSpeed;noExtraction)",
				parameters = ()[11],
				converter = ()[196],
				extraDefinition = {
					access = "w",
					parameterId = "201331457"
				}
			},
			{
				access = "w",
				parameterId = "16832534"
			},
			{
				prototype = "float[0.0;100.0]",
				parameters = ()[11],
				rawStates = ()[182],
				converter = ()[95],
				extraDefinition = ()[344]
			},
			{
				access = "w",
				parameterId = "16832531"
			},
			{
				prototype = "float[0.0;100.0]",
				parameters = ()[11],
				rawStates = ()[182],
				converter = ()[95],
				extraDefinition = ()[346]
			},
			{
				prototype = "string(extraBoiler;extraSolar;onlyThermodynamic)",
				parameters = ()[11],
				converter = ()[197],
				extraDefinition = {
					access = "w",
					parameterId = "201330689"
				}
			},
			{
				prototype = "string(pac24h_elec24h;pacProg_elecProg)",
				parameters = ()[11],
				converter = ()[198],
				extraDefinition = {
					access = "w",
					parameterId = "201329153"
				}
			},
			{
				prototype = "object",
				parameters = ()[11],
				converter = ()[199],
				extraDefinition = {
					access = "w",
					parameterId = "201329409"
				}
			},
			{
				prototype = "string(forbidden;no;recommended;unsuitable;wanted)",
				parameters = ()[11],
				converter = ()[200],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(active;deactive)",
				parameters = ()[11],
				converter = ()[201],
				extraDefinition = {
					access = "w",
					parameterId = "201331201"
				}
			},
			{
				prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
				parameters = ()[11],
				rawStates = ()[182],
				converter = ()[202],
				extraDefinition = ()[18]
			},
			{
				advancedRefresh = ()[10],
				delayedStopIdentify = ()[13],
				getName = ()[14],
				identify = ()[15],
				pairOneWayController = ()[17],
				refreshAntiLegionellosis = ()[315],
				refreshAwayModeDuration = ()[316],
				refreshBoilerInstallationOption = ()[317],
				refreshBoostModeDuration = ()[318],
				refreshCurrentOperatingMode = ()[233],
				refreshDHWCapacity = ()[319],
				refreshDHWError = ()[320],
				refreshDHWMode = ()[321],
				refreshElectricalExtraManagement = ()[322],
				refreshExtractionOption = ()[323],
				refreshInstallation = ()[324],
				refreshManufacturerName = ()[325],
				refreshMiddleWaterTemperature = ()[326],
				refreshOperatingModeCapabilities = ()[327],
				refreshOperatingRange = ()[328],
				refreshOperatingTime = ()[329],
				refreshProgrammingSlots = ()[330],
				refreshRateManagement = ()[331],
				refreshSmartGridOption = ()[332],
				refreshTargetTemperature = ()[158],
				refreshWaterConsumption = ()[333],
				setAntiLegionellosis = ()[334],
				setAwayModeDuration = ()[335],
				setBoilerInstallationOption = ()[336],
				setBoostModeDuration = ()[337],
				setComfortTargetTemperature = ()[184],
				setCurrentOperatingMode = ()[338],
				setDHWMode = ()[339],
				setDateTime = ()[340],
				setEcoTargetTemperature = ()[341],
				setElectricalExtraManagement = ()[342],
				setExtractionOption = ()[343],
				setFrostProtectionTargetTemperature = ()[345],
				setHaltedTargetTemperature = ()[347],
				setInstallation = ()[348],
				setName = ()[20],
				setOperatingRange = ()[349],
				setProgrammingSlots = ()[350],
				setRateManagement = ()[351],
				setSmartGridOption = ()[352],
				setTargetTemperature = ()[353],
				startIdentify = ()[21],
				stopIdentify = ()[22],
				unpairAllOneWayControllers = ()[23],
				unpairOneWayController = ()[24],
				wink = ()[26]
			},
			{
				type = 1,
				widget = "DomesticHotWaterProduction",
				uiClass = "WaterHeatingSystem",
				uiProfiles = ()[277],
				states = {
					201326593 = ()[278],
					16832527 = ()[279],
					65558 = ()[281],
					65559 = ()[282],
					201342977 = ()[283],
					201330433 = ()[284],
					2146500638 = ()[1],
					16832530 = ()[285],
					16832534 = ()[286],
					16832531 = ()[287],
					201328385 = ()[288],
					201343489 = ()[289],
					201343233 = ()[290],
					1 = ()[3],
					201341185 = ()[291],
					65553 = ()[292],
					16832522 = ()[293],
					2147426304 = ()[4],
					16830720 = ()[294],
					65537 = ()[179],
					201326849 = ()[295],
					201329665 = ()[296],
					201327873 = ()[297],
					201330945 = ()[298],
					201328641 = ()[299],
					201327105 = ()[300],
					201328129 = ()[301],
					201327361 = ()[302],
					201330177 = ()[303],
					201331457 = ()[304],
					201330689 = ()[305],
					201332481 = ()[306],
					65552 = ()[307],
					201329153 = ()[308],
					201337601 = ()[309],
					201339649 = ()[310],
					201339905 = ()[311],
					201329409 = ()[312],
					65547 = ()[313],
					201331201 = ()[314]
				},
				attributes = ()[5],
				commands = ()[354]
			},
			{
				"ElectricEnergyConsumption"
			},
			{
				["core:FirmwareRevision"] = ()[0],
				["core:Manufacturer"] = ()[1],
				["core:PowerSourceType"] = ()[3],
				["core:MeasuredValueType"] = ()[4]
			},
			{
				["io:DHWCumulatedElectricalEnergyConsumptionIOSystemDeviceSensor"] = {
					type = 2,
					widget = "CumulativeElectricPowerConsumptionSensor",
					uiClass = "ElectricitySensor",
					uiProfiles = ()[356],
					states = {
						201327617 = {
							linkedHighLevelState = {
								()[121]
							}
						},
						2147426304 = ()[4]
					},
					attributes = ()[357],
					commands = {
						refreshElectricEnergyConsumption = {
							extraDefinition = {
								access = "r",
								parameterId = "201327617"
							}
						}
					}
				}
			},
			{
				"StatefulHeatingLevel",
				"HeatingLevel"
			},
			{
				linkedHighLevelState = {
					()[122],
					()[124],
					()[125]
				}
			},
			{
				linkedHighLevelState = {
					()[123]
				}
			},
			{
				linkedHighLevelState = {
					()[126]
				}
			},
			{
				prototype = "*string",
				parameters = ()[207],
				converter = ()[207],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(boost;comfort;comfort-1;comfort-2;eco;frostprotection;off;secured)",
				parameters = ()[11],
				converter = ()[208],
				extraDefinition = ()[45]
			},
			{
				parameters = ()[117],
				converter = ()[208],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(boost;comfort;comfort-1;comfort-2;eco;frostprotection;off;secured),integer[1;65534]",
				parameters = ()[44],
				converter = ()[209],
				extraDefinition = ()[45]
			},
			{
				"Specific"
			},
			{
				access = "r",
				parameterId = "5"
			},
			{
				"CO2Concentration"
			},
			{
				"Temperature"
			},
			{
				["core:FirmwareRevision"] = ()[0],
				["core:Manufacturer"] = ()[1],
				["core:MeasuredValueType"] = ()[5],
				["core:PowerSourceType"] = ()[3]
			},
			{
				"Luminance"
			},
			{
				linkedHighLevelState = {
					()[148]
				}
			},
			{
				prototype = "string(normal;advanced)",
				parameters = ()[11],
				extraDefinition = {
					access = "r",
					parameterId = "2415919106"
				}
			},
			{
				advancedRefresh = ()[374]
			},
			{
				["io:LightIOSystemSensor"] = {
					type = 2,
					widget = "LuminanceSensor",
					uiClass = "LightSensor",
					uiProfiles = ()[372],
					states = {
						2146500638 = ()[1],
						2415919106 = {
							linkedHighLevelState = {
								()[147]
							}
						},
						2415919110 = ()[373],
						2147426304 = ()[4]
					},
					attributes = {
						["core:FirmwareRevision"] = ()[0],
						["core:Manufacturer"] = ()[1],
						["core:MaxSensedValue"] = ()[6],
						["core:MeasuredValueType"] = ()[7],
						["core:MinSensedValue"] = ()[8],
						["core:PowerSourceType"] = ()[9]
					},
					commands = ()[375]
				}
			},
			{
				["core:FirmwareRevision"] = ()[0],
				["core:Manufacturer"] = ()[1],
				["core:MaxSensedValue"] = ()[6],
				["core:MeasuredValueType"] = ()[10],
				["core:MinSensedValue"] = ()[8],
				["core:PowerSourceType"] = ()[9]
			},
			{
				["io:TemperatureIOSystemSensor"] = {
					type = 2,
					widget = "TemperatureSensor",
					uiClass = "TemperatureSensor",
					uiProfiles = ()[370],
					states = {
						2146500638 = ()[1],
						2415919110 = ()[373],
						2147426304 = ()[4],
						2415919106 = {
							linkedHighLevelState = {
								()[149]
							}
						}
					},
					attributes = ()[377],
					commands = ()[375]
				}
			},
			{
				"RelativeHumidity"
			},
			{
				["core:FirmwareRevision"] = ()[0],
				["core:Manufacturer"] = ()[1],
				["core:PowerSourceType"] = ()[9],
				["core:MeasuredValueType"] = ()[13]
			},
			{
				["io:RelativeHumidityIOSystemSensor"] = {
					type = 2,
					widget = "RelativeHumiditySensor",
					uiClass = "HumiditySensor",
					uiProfiles = ()[379],
					states = {
						2146500638 = ()[1],
						2415919106 = {
							linkedHighLevelState = {
								()[152]
							}
						},
						2415919110 = ()[373],
						2147426304 = ()[4]
					},
					attributes = ()[380],
					commands = ()[375]
				}
			},
			{
				["core:FirmwareRevision"] = ()[0],
				["core:Manufacturer"] = ()[1],
				["core:PowerSourceType"] = ()[9],
				["core:MeasuredValueType"] = ()[14]
			},
			{
				"GasConsumption"
			},
			{
				linkedHighLevelState = {
					()[156]
				}
			},
			{
				2146500638 = ()[1],
				83935248 = {
					linkedHighLevelState = {
						()[155]
					}
				},
				2415919105 = ()[384],
				2415919110 = ()[373],
				2147426304 = ()[4]
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "2415919105"
				}
			},
			{
				prototype = "string",
				parameters = ()[11],
				converter = ()[13],
				extraDefinition = {
					access = "w",
					parameterId = "2415919105"
				}
			},
			{
				advancedRefresh = ()[374],
				getSensorName = ()[386],
				putSensorName = ()[387]
			},
			{
				()[161],
				()[162],
				()[163],
				()[164],
				()[165],
				()[166],
				()[167]
			},
			{
				"83902467"
			},
			{
				"83902466"
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				converter = ()[249],
				extraDefinition = ()[368]
			},
			{
				advancedRefresh = ()[392],
				getSensorName = ()[386],
				putSensorName = ()[387]
			},
			{
				()[168],
				()[169],
				()[170],
				()[171],
				()[172],
				()[173],
				()[174]
			},
			{
				()[175],
				()[176],
				()[177],
				()[178],
				()[179],
				()[180],
				()[181]
			},
			{
				()[182],
				()[183],
				()[184],
				()[185],
				()[186],
				()[187],
				()[188]
			},
			{
				()[189],
				()[190],
				()[191],
				()[192],
				()[193],
				()[194],
				()[195]
			},
			{
				"SmokeDetector"
			},
			{
				linkedHighLevelState = {
					()[205]
				}
			},
			{
				["core:FirmwareRevision"] = ()[0],
				["core:Manufacturer"] = ()[1],
				["core:MeasuredValueType"] = ()[7],
				["core:PowerSourceType"] = ()[9]
			},
			{
				"DoorContactSensor",
				"ContactDetector"
			},
			{
				linkedHighLevelState = {
					()[209]
				}
			},
			{
				linkedHighLevelState = {
					()[210]
				}
			},
			{
				type = 2,
				widget = "ContactSensor",
				uiClass = "ContactSensor",
				uiProfiles = ()[401],
				states = {
					2415919106 = ()[402],
					2146500638 = ()[1],
					2415919110 = ()[403],
					2147426304 = ()[4]
				},
				attributes = ()[400],
				commands = ()[375]
			},
			{
				"OccupancyDetector"
			},
			{
				linkedHighLevelState = {
					()[211]
				}
			},
			{
				type = 2,
				widget = "RainSensor",
				uiClass = "RainSensor",
				uiProfiles = {
					"RainDetector"
				},
				states = {
					2146500638 = ()[1],
					2415919106 = {
						linkedHighLevelState = {
							()[212]
						}
					},
					2415919110 = ()[373],
					2147426304 = ()[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:MeasuredValueType"] = ()[7]
				},
				commands = ()[375]
			},
			{
				"LockableTiltableWindowOpeningStatus",
				"LockableTiltableOpeningStatus",
				"TiltableOpeningStatus",
				"TiltedStatus",
				"LockableOpeningStatus",
				"LockStatus",
				"OpeningStatus"
			},
			{
				linkedHighLevelState = {
					()[0],
					()[216]
				}
			},
			{
				linkedHighLevelState = {
					()[213],
					()[214],
					()[215]
				}
			},
			{
				["core:FirmwareRevision"] = ()[0],
				["core:Manufacturer"] = ()[1],
				["core:MaxSensedValue"] = ()[28],
				["core:MeasuredValueType"] = ()[29],
				["core:MinSensedValue"] = ()[30]
			},
			{
				advancedRefresh = {
					prototype = "string(normal;advanced)",
					parameters = ()[11],
					extraDefinition = {
						access = "r",
						parameterId = "18183012483074"
					}
				}
			},
			{
				"IntrusionEventDetector"
			},
			{
				linkedHighLevelState = {
					()[217]
				}
			},
			{
				["core:FirmwareRevision"] = ()[0],
				["core:Manufacturer"] = ()[1],
				["core:MaxSensedValue"] = ()[31],
				["core:MeasuredValueType"] = ()[32],
				["core:MinSensedValue"] = ()[33],
				["core:PowerSourceType"] = ()[9]
			},
			{
				prototype = "string(normal;advanced)",
				parameters = ()[11],
				extraDefinition = {
					access = "r",
					parameterId = "18152947712002"
				}
			},
			{
				["io:SomfyIDEOIIntrusionSensor"] = {
					type = 2,
					widget = "IntrusionSensor",
					uiClass = "ContactSensor",
					uiProfiles = ()[413],
					states = {
						2146500638 = ()[409],
						2415919110 = ()[403],
						2147426304 = ()[4],
						18152947712002 = ()[414],
						83903234 = {
							linkedHighLevelState = {
								()[218]
							}
						}
					},
					attributes = ()[415],
					commands = {
						setVibrationLevelThreshold = {
							prototype = "integer[1;9]",
							parameters = ()[11],
							rawStates = {
								{
									rawStateId = "83903234"
								}
							},
							converter = ()[306],
							extraDefinition = ()[195]
						},
						advancedRefresh = ()[416]
					}
				}
			},
			{
				access = "w",
				parameterId = "2146566149"
			},
			{
				["core:GroupId"] = ()[35],
				["core:GroupIndex"] = ()[36]
			},
			{
				type = 4,
				widget = "RemoteControllerOneWay",
				uiClass = "RemoteController",
				uiProfiles = ()[367],
				states = {
					33554442 = {
						linkedHighLevelState = {
							()[220]
						}
					}
				},
				attributes = ()[419]
			},
			{
				prototype = "integer[0;100],*string(lowspeed)",
				parameters = ()[8],
				converter = ()[318],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(my)|integer[0;100],*string(lowspeed)",
				parameters = ()[8],
				converter = ()[319],
				extraDefinition = ()[45]
			},
			{
				advancedRefresh = ()[10],
				delayedStopIdentify = ()[13],
				getName = ()[14],
				identify = ()[15],
				keepOneWayControllersAndDeleteNode = ()[61],
				runManufacturerSettingsCommand = ()[62],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				setClosure = ()[38],
				close = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				up = ()[42],
				setClosureAndLinearSpeed = ()[421],
				setMemorized1Position = ()[47],
				setName = ()[20],
				setPosition = ()[48],
				my = ()[51],
				setPositionAndLinearSpeed = ()[422],
				setSecuredPosition = ()[53],
				startIdentify = ()[21],
				stop = ()[63],
				stopIdentify = ()[22],
				unpairAllOneWayControllers = ()[23],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				unpairOneWayController = ()[24],
				setConfigState = ()[25],
				wink = ()[26],
				sendIOKey = ()[65]
			},
			{
				["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
					type = 1,
					widget = "PositionableRollerShutterWithLowSpeedManagement",
					uiClass = "RollerShutter",
					uiProfiles = ()[54],
					states = ()[58],
					attributes = ()[59],
					commands = ()[423]
				}
			},
			{
				"SlidingPergola",
				"Deployable",
				"DeployUndeploy",
				"StatefulCloseable",
				"StatefulOpenClose",
				"OpenClose"
			},
			{
				prototype = "any",
				parameters = ()[11],
				converter = ()[321],
				extraDefinition = ()[18]
			},
			{
				"CloseableWindow",
				"Closeable",
				"OpenClose"
			},
			{
				()[223]
			},
			{
				linkedHighLevelState = ()[428],
				linkedStateIds = {
					"120833",
					"120834",
					"120835",
					"120842",
					"65537"
				}
			},
			{
				linkedHighLevelState = ()[428],
				linkedStateIds = {
					"120833",
					"120834",
					"120835",
					"16830720",
					"65537"
				}
			},
			{
				linkedHighLevelState = ()[428],
				linkedStateIds = {
					"120834",
					"120835",
					"120842",
					"16830720",
					"65537"
				}
			},
			{
				linkedHighLevelState = ()[428],
				linkedStateIds = {
					"120833",
					"120835",
					"120842",
					"16830720",
					"65537"
				}
			},
			{
				linkedHighLevelState = ()[428],
				linkedStateIds = {
					"120833",
					"120834",
					"120842",
					"16830720",
					"65537"
				}
			},
			{
				()[224]
			},
			{
				linkedHighLevelState = ()[434],
				linkedStateIds = ()[243]
			},
			{
				converter = ()[324],
				extraDefinition = ()[18]
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "16832521"
				}
			},
			{
				["io:DiscreteGarageOpenerWithPartialPositionIOComponent"] = {
					type = 1,
					widget = "PositionableGarageDoorWithPartialPosition",
					uiClass = "GarageDoor",
					uiProfiles = ()[97],
					states = {
						2146500638 = ()[1],
						1 = ()[3],
						65537 = {
							linkedHighLevelState = ()[434],
							linkedStateIds = {
								"16832521"
							}
						},
						16832521 = ()[435],
						2147426304 = ()[4],
						2 = ()[56],
						2146500645 = ()[57]
					},
					attributes = ()[59],
					commands = {
						advancedRefresh = ()[10],
						close = ()[98],
						delayedStopIdentify = ()[13],
						down = ()[98],
						getName = ()[14],
						identify = ()[15],
						keepOneWayControllersAndDeleteNode = ()[61],
						runManufacturerSettingsCommand = ()[62],
						open = ()[99],
						pairOneWayController = ()[17],
						partialPosition = ()[436],
						refreshPartialPosition = ()[437],
						setName = ()[20],
						startIdentify = ()[21],
						stop = ()[63],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						up = ()[99],
						wink = ()[26],
						sendIOKey = ()[65]
					}
				}
			},
			{
				parameters = {
					{
						value = "locked",
						name = "p1"
					}
				},
				converter = ()[327],
				extraDefinition = ()[18]
			},
			{
				parameters = {
					{
						value = "unlocked",
						name = "p1"
					}
				},
				converter = ()[327],
				extraDefinition = ()[18]
			},
			{
				"CloseableBlind",
				"Closeable",
				"OpenClose"
			},
			{
				linkedHighLevelState = ()[34],
				linkedStateIds = ()[29]
			},
			{
				2146500638 = ()[1],
				16832512 = ()[31],
				1 = ()[3],
				16832522 = ()[33],
				2147426304 = ()[4],
				16830720 = ()[35],
				65537 = ()[442],
				2 = ()[56],
				2146500645 = ()[57]
			},
			{
				"DeployableAwning",
				"DeployUndeploy",
				"StatefulOpenClose",
				"OpenClose",
				"StatefulDeployable",
				"Deployable"
			},
			{
				type = 1,
				widget = "PositionableHorizontalAwningUno",
				uiClass = "Awning",
				uiProfiles = ()[444],
				states = {
					65537 = {
						linkedHighLevelState = {
							()[20],
							()[10],
							()[51]
						},
						linkedStateIds = ()[29]
					},
					2146500638 = ()[1],
					16832512 = ()[31],
					1 = ()[3],
					16832522 = ()[33],
					2147426304 = ()[4],
					16830720 = ()[35],
					2 = ()[56],
					65557 = ()[36],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = ()[202]
			},
			{
				"SlidingPergola",
				"Deployable",
				"DeployUndeploy",
				"OpenClose"
			},
			{
				["io:ExteriorVenetianBlindWithWPIOComponent"] = {
					type = 1,
					widget = "PositionableExteriorVenetianBlindWithWP",
					uiClass = "ExteriorVenetianBlind",
					uiProfiles = ()[28],
					states = ()[212],
					attributes = ()[59],
					commands = ()[217]
				}
			},
			{
				"CloseableCurtain",
				"Closeable",
				"OpenClose"
			},
			{
				prototype = "string(my;memorized1)|integer[0;100]",
				parameters = ()[11],
				converter = ()[330],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[39],
				converter = ()[330],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[41],
				converter = ()[330],
				extraDefinition = ()[18]
			},
			{
				parameters = ()[50],
				converter = ()[330],
				extraDefinition = ()[18]
			},
			{
				["io:SimpleBioclimaticPergolaIOComponent"] = {
					type = 1,
					widget = "BioclimaticPergola",
					uiClass = "Pergola",
					uiProfiles = ()[252],
					states = ()[255],
					attributes = ()[59],
					commands = {
						advancedRefresh = ()[10],
						closeSlats = ()[98],
						delayedStopIdentify = ()[13],
						getName = ()[14],
						identify = ()[15],
						keepOneWayControllersAndDeleteNode = ()[61],
						runManufacturerSettingsCommand = ()[62],
						openSlats = ()[99],
						pairOneWayController = ()[17],
						refreshMemorized1Orientation = ()[37],
						setMemorized1Orientation = ()[47],
						setName = ()[20],
						setOrientation = ()[256],
						my = ()[257],
						setSecuredOrientation = ()[53],
						startIdentify = ()[21],
						stop = ()[63],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						wink = ()[26],
						sendIOKey = ()[65]
					}
				}
			},
			{
				"16830720",
				"16832522",
				"16832530",
				"16832531",
				"16832534"
			},
			{
				"16830720",
				"16832522",
				"16832527",
				"16832531",
				"16832534"
			},
			{
				"16830720",
				"16832522",
				"16832527",
				"16832530",
				"16832531"
			},
			{
				"16830720",
				"16832522",
				"16832527",
				"16832530",
				"16832534"
			},
			{
				"16830720",
				"16832527",
				"16832530",
				"16832531",
				"16832534"
			},
			{
				"16832522",
				"16832527",
				"16832530",
				"16832531",
				"16832534"
			},
			{
				"ThermostatTargetReader"
			},
			{
				linkedHighLevelState = {
					()[236],
					()[248],
					()[263]
				}
			},
			{
				linkedHighLevelState = {
					()[237],
					()[241],
					()[242],
					()[254],
					()[259],
					()[262]
				}
			},
			{
				linkedHighLevelState = {
					()[238],
					()[239],
					()[240],
					()[257],
					()[258],
					()[261]
				}
			},
			{
				linkedHighLevelState = {
					()[252]
				}
			},
			{
				linkedHighLevelState = {
					()[253]
				}
			},
			{
				{
					rawStateId = "84059684",
					converter = ()[346]
				},
				{
					rawStateId = "84059684",
					converter = ()[345]
				}
			},
			{
				rawStates = ()[466],
				converter = ()[368],
				extraDefinition = ()[195]
			},
			{
				prototype = "float[5.0;26.0],float[5.0;26.0],float[5.0;26.0],float[5.0;26.0]",
				parameters = ()[125],
				rawStates = {},
				converter = ()[369],
				extraDefinition = ()[195]
			},
			{
				prototype = "string(comfort;eco;away;frostprotection;geofencingMode)|float[5.0;26.0],string(further_notice;next_mode)|integer[0;]",
				parameters = ()[44],
				rawStates = ()[466],
				converter = ()[370],
				extraDefinition = ()[195]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				converter = ()[371],
				extraDefinition = ()[195]
			},
			{
				linkedHighLevelState = {
					()[248]
				}
			},
			{
				advancedRefresh = {
					prototype = "string(normal;advanced)",
					parameters = ()[11],
					extraDefinition = {
						access = "r",
						parameterId = "84059680"
					}
				}
			},
			{
				["io:TemperatureIOSystemSensor"] = {
					type = 2,
					widget = "TemperatureSensor",
					uiClass = "TemperatureSensor",
					uiProfiles = ()[370],
					states = {
						2146500638 = ()[1],
						84059682 = ()[471],
						2147426304 = ()[4],
						84059680 = {
							linkedHighLevelState = {
								()[264]
							}
						}
					},
					attributes = ()[377],
					commands = ()[472]
				}
			},
			{
				"StatefulOrientableAndCloseableShutter",
				"StatefulOrientableAndCloseable",
				"OrientableAndCloseable",
				"OpenClose"
			},
			{
				prototype = "integer[0;100],integer[0;100]",
				parameters = ()[44],
				converter = ()[374],
				extraDefinition = ()[45]
			},
			{
				"DeployableVerticalAwning",
				"DeployUndeploy",
				"StatefulOpenClose",
				"OpenClose",
				"StatefulCloseable",
				"Closeable",
				"StatefulDeployable",
				"Deployable"
			},
			{
				"CloseableShutter",
				"StatefulCloseable",
				"Closeable",
				"StatefulOpenClose",
				"OpenClose"
			},
			{
				["io:RollerShutterUnoIOComponent"] = {
					type = 1,
					widget = "PositionableRollerShutterUno",
					uiClass = "RollerShutter",
					uiProfiles = ()[477],
					states = {
						2146500638 = ()[1],
						16832512 = ()[31],
						1 = ()[3],
						16832522 = ()[33],
						2147426304 = ()[4],
						16830720 = ()[35],
						65537 = {
							linkedHighLevelState = {
								()[10],
								()[12],
								()[5]
							},
							linkedStateIds = ()[29]
						},
						65557 = ()[36],
						2 = ()[56],
						2146500645 = ()[57]
					},
					attributes = ()[59],
					commands = ()[66]
				}
			},
			{
				"DeployableVerticalAwning",
				"DeployUndeploy",
				"StatefulCloseable",
				"Closeable",
				"StatefulOpenClose",
				"OpenClose",
				"StatefulDeployable",
				"Deployable"
			},
			{
				linkedHighLevelState = {
					()[5],
					()[12],
					()[10],
					()[20]
				},
				linkedStateIds = ()[29]
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "17029120"
				}
			},
			{
				["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
					type = 1,
					widget = "PositionableExteriorVenetianBlindWithWP2",
					uiClass = "ExteriorVenetianBlind",
					uiProfiles = ()[28],
					states = {
						65537 = ()[68],
						2146500638 = ()[1],
						17029120 = ()[211],
						16832512 = ()[69],
						1 = ()[3],
						16832522 = ()[70],
						65540 = ()[73],
						2147426304 = ()[4],
						2 = ()[56],
						2146500645 = ()[57]
					},
					attributes = ()[59],
					commands = {
						advancedRefresh = ()[10],
						delayedStopIdentify = ()[13],
						getName = ()[14],
						identify = ()[15],
						keepOneWayControllersAndDeleteNode = ()[61],
						runManufacturerSettingsCommand = ()[62],
						pairOneWayController = ()[17],
						refreshMemorized1Orientation = ()[481],
						refreshMemorized1Position = ()[37],
						setClosure = ()[38],
						close = ()[40],
						down = ()[40],
						open = ()[42],
						up = ()[42],
						setClosureAndOrientation = ()[213],
						my = ()[214],
						setMemorized1Orientation = ()[216],
						setMemorized1Position = ()[47],
						setName = ()[20],
						setOrientation = ()[215],
						setPosition = ()[48],
						setSecuredPosition = ()[53],
						startIdentify = ()[21],
						stop = ()[63],
						stopIdentify = ()[22],
						unpairAllOneWayControllers = ()[23],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						unpairOneWayController = ()[24],
						setConfigState = ()[25],
						wink = ()[26],
						sendIOKey = ()[65]
					}
				}
			},
			{
				"StatefulDeployableAwning",
				"StatefulDeployable",
				"Deployable",
				"DeployUndeploy",
				"StatefulCloseable",
				"StatefulOpenClose",
				"OpenClose"
			},
			{
				linkedHighLevelState = {
					()[5],
					()[280],
					()[12],
					()[10]
				},
				linkedStateIds = ()[29]
			},
			{
				linkedHighLevelState = {
					()[281]
				}
			},
			{
				type = 1,
				widget = "DomesticHotWaterProduction",
				uiClass = "WaterHeatingSystem",
				uiProfiles = ()[277],
				states = {
					201326593 = ()[278],
					16832527 = ()[279],
					65558 = ()[281],
					65559 = ()[282],
					201342977 = ()[283],
					201330433 = ()[284],
					2146500638 = ()[1],
					16832530 = ()[285],
					16832534 = ()[286],
					16832531 = ()[287],
					201328385 = ()[288],
					201343489 = ()[289],
					201343233 = ()[290],
					1 = ()[3],
					201341185 = ()[291],
					65553 = ()[292],
					16832522 = ()[293],
					2147426304 = ()[4],
					16830720 = ()[294],
					65537 = ()[179],
					201339137 = ()[485],
					201326849 = ()[295],
					201329665 = ()[296],
					201327873 = ()[297],
					201330945 = ()[298],
					201328641 = ()[299],
					201327105 = ()[300],
					201328129 = ()[301],
					201327361 = ()[302],
					201330177 = ()[303],
					201331457 = ()[304],
					201330689 = ()[305],
					201332481 = ()[306],
					65552 = ()[307],
					201329153 = ()[308],
					201337601 = ()[309],
					201339649 = ()[310],
					201339905 = ()[311],
					201329409 = ()[312],
					65547 = ()[313],
					201331201 = ()[314]
				},
				attributes = ()[5],
				commands = ()[354]
			},
			{
				"DeployableAwning",
				"DeployUndeploy",
				"StatefulDeployable",
				"Deployable",
				"StatefulCloseable",
				"StatefulOpenClose",
				"OpenClose"
			},
			{
				65537 = ()[55],
				2146500638 = ()[1],
				16832512 = ()[31],
				1 = ()[3],
				16832522 = ()[33],
				2147426304 = ()[4],
				16830720 = ()[35],
				65557 = ()[36],
				2 = ()[56],
				2146500645 = ()[57],
				65556 = ()[260]
			},
			{
				"CloseableScreen",
				"Closeable",
				"Deployable",
				"DeployUndeploy",
				"OpenClose"
			},
			{
				["io:SlidingDiscreteFullyPedestriableGateOpenerIOComponent"] = ()[151]
			},
			{
				extraDefinition = {
					access = "r",
					parameterId = "201344769"
				}
			},
			{
				prototype = "float[0.0;100.0]",
				parameters = ()[11],
				converter = ()[395],
				extraDefinition = {
					access = "w",
					parameterId = "201344769"
				}
			},
			{
				type = 1,
				widget = "DomesticHotWaterProduction",
				uiClass = "WaterHeatingSystem",
				uiProfiles = {
					"StatefulDHWThermostat",
					"DHWThermostat",
					"StatefulThermostatWithSensor",
					"StatefulThermostat",
					"Thermostat",
					"WaterConsumption"
				},
				states = {
					201351937 = {
						linkedHighLevelState = {
							()[282]
						}
					},
					201351681 = {
						linkedHighLevelState = {
							()[283]
						}
					},
					201343745 = {
						linkedHighLevelState = {
							()[284]
						}
					},
					201351425 = {
						linkedHighLevelState = {
							()[285]
						}
					},
					201326593 = ()[278],
					201351169 = {
						linkedHighLevelState = {
							()[286]
						}
					},
					201332993 = {
						linkedHighLevelState = {
							()[287]
						}
					},
					16832527 = ()[279],
					65558 = ()[281],
					65559 = ()[282],
					201345281 = {
						linkedHighLevelState = {
							()[288]
						}
					},
					201342977 = ()[283],
					201330433 = ()[284],
					2146500638 = ()[1],
					16832530 = ()[285],
					201345025 = {
						linkedHighLevelState = {
							()[289]
						}
					},
					16832534 = ()[286],
					16832531 = ()[287],
					201352193 = {
						linkedHighLevelState = {
							()[290]
						}
					},
					201328385 = ()[288],
					201343489 = ()[289],
					201343233 = ()[290],
					201344257 = {
						linkedHighLevelState = {
							()[291]
						}
					},
					1 = ()[3],
					201344513 = {
						linkedHighLevelState = {
							()[292]
						}
					},
					201341185 = ()[291],
					65553 = ()[292],
					201344001 = {
						linkedHighLevelState = {
							()[293]
						}
					},
					201340929 = {
						linkedHighLevelState = {
							()[294]
						}
					},
					16832522 = ()[293],
					2147426304 = ()[4],
					201340417 = {
						linkedHighLevelState = {
							()[295]
						}
					},
					16830720 = ()[294],
					65537 = ()[179],
					201339137 = ()[485],
					201326849 = ()[295],
					201344769 = {
						linkedHighLevelState = {
							()[296],
							()[297],
							()[298]
						}
					},
					201329665 = ()[296],
					201327873 = ()[297],
					201330945 = ()[298],
					201347841 = {
						linkedHighLevelState = {
							()[299]
						}
					},
					201347585 = {
						linkedHighLevelState = {
							()[300]
						}
					},
					201328641 = ()[299],
					201327105 = ()[300],
					201328129 = ()[301],
					201327361 = ()[302],
					201330177 = ()[303],
					201331457 = ()[304],
					201330689 = ()[305],
					201332481 = ()[306],
					65552 = ()[307],
					201329153 = ()[308],
					201337601 = ()[309],
					201339649 = ()[310],
					201339905 = ()[311],
					201329409 = ()[312],
					65547 = ()[313],
					201331201 = ()[314]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshAbsenceEndDate = {
						extraDefinition = {
							access = "r",
							parameterId = "201351937"
						}
					},
					refreshAbsenceMode = {
						extraDefinition = {
							access = "r",
							parameterId = "201347841"
						}
					},
					refreshAbsenceStartDate = {
						extraDefinition = {
							access = "r",
							parameterId = "201351681"
						}
					},
					refreshAntiLegionellosis = ()[315],
					refreshAwayModeDuration = ()[316],
					refreshBoilerInstallationOption = ()[317],
					refreshBoostEndDate = {
						extraDefinition = {
							access = "r",
							parameterId = "201351425"
						}
					},
					refreshBoostMode = {
						extraDefinition = {
							access = "r",
							parameterId = "201347585"
						}
					},
					refreshBoostModeDuration = ()[318],
					refreshBoostStartDate = {
						extraDefinition = {
							access = "r",
							parameterId = "201351169"
						}
					},
					refreshBottomTankWaterTemperature = {
						extraDefinition = {
							access = "r",
							parameterId = "201332993"
						}
					},
					refreshCurrentOperatingMode = ()[233],
					refreshDHWCapacity = ()[319],
					refreshDHWError = ()[320],
					refreshDHWMode = ()[321],
					refreshElectricalExtraManagement = ()[322],
					refreshExpectedNumberOfShower = {
						extraDefinition = {
							access = "r",
							parameterId = "201345025"
						}
					},
					refreshExtractionOption = ()[323],
					refreshInstallation = ()[324],
					refreshManufacturerName = ()[325],
					refreshMiddleWaterTemperature = ()[326],
					refreshMiddleWaterTemperatureIn = {
						extraDefinition = {
							access = "r",
							parameterId = "201344257"
						}
					},
					refreshOperatingModeCapabilities = ()[327],
					refreshOperatingRange = ()[328],
					refreshOperatingTime = ()[329],
					refreshProgrammingSlots = ()[330],
					refreshRateManagement = ()[331],
					refreshSmartGridOption = ()[332],
					refreshTargetTemperature = ()[158],
					refreshWaterConsumption = ()[333],
					refreshWaterTargetTemperature = ()[491],
					refreshWaterTemperature = ()[491],
					setAbsenceEndDate = {
						prototype = "object",
						parameters = ()[11],
						converter = ()[194],
						extraDefinition = {
							access = "w",
							parameterId = "201351937"
						}
					},
					setAbsenceMode = {
						prototype = "string(off;on;prog)",
						parameters = ()[11],
						converter = ()[394],
						extraDefinition = {
							access = "w",
							parameterId = "201347841"
						}
					},
					setAbsenceStartDate = {
						prototype = "object",
						parameters = ()[11],
						converter = ()[194],
						extraDefinition = {
							access = "w",
							parameterId = "201351681"
						}
					},
					setAntiLegionellosis = ()[334],
					setAwayModeDuration = ()[335],
					setBoilerInstallationOption = ()[336],
					setBoostEndDate = {
						prototype = "object",
						parameters = ()[11],
						converter = ()[194],
						extraDefinition = {
							access = "w",
							parameterId = "201351425"
						}
					},
					setBoostMode = {
						prototype = "string(off;on;prog)",
						parameters = ()[11],
						converter = ()[394],
						extraDefinition = {
							access = "w",
							parameterId = "201347585"
						}
					},
					setBoostModeDuration = ()[337],
					setBoostStartDate = {
						prototype = "object",
						parameters = ()[11],
						converter = ()[194],
						extraDefinition = {
							access = "w",
							parameterId = "201351169"
						}
					},
					setComfortTargetTemperature = ()[184],
					setCurrentOperatingMode = ()[338],
					setDHWMode = ()[339],
					setDateTime = ()[340],
					setEcoTargetTemperature = ()[341],
					setElectricalExtraManagement = ()[342],
					setExpectedNumberOfShower = {
						prototype = "integer[0;10]",
						parameters = ()[11],
						converter = ()[189],
						extraDefinition = {
							access = "w",
							parameterId = "201345025"
						}
					},
					setExtractionOption = ()[343],
					setFrostProtectionTargetTemperature = ()[345],
					setHaltedTargetTemperature = ()[347],
					setInstallation = ()[348],
					setName = ()[20],
					setOperatingRange = ()[349],
					setProgrammingSlots = ()[350],
					setRateManagement = ()[351],
					setSmartGridOption = ()[352],
					setTargetTemperature = ()[353],
					setWaterTargetTemperature = ()[492],
					setTargetDHWTemperature = ()[492],
					setWaterTemperature = ()[492],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					wink = ()[26]
				}
			},
			{
				type = 4,
				widget = "RemoteControllerOneWay",
				uiClass = "RemoteController",
				uiProfiles = ()[367],
				states = {
					65555 = {
						linkedHighLevelState = {
							()[301]
						}
					}
				},
				attributes = ()[419]
			},
			{
				65537 = ()[88],
				2146500638 = ()[1],
				16832512 = ()[31],
				1 = ()[3],
				16832522 = ()[33],
				2147426304 = ()[4],
				2 = ()[56],
				2146500645 = ()[57],
				65556 = ()[260],
				65557 = ()[36],
				16830720 = ()[35]
			},
			{
				linkedHighLevelState = {
					()[302]
				}
			},
			{
				["io:SunEnergyActuatorSensor"] = {
					type = 2,
					widget = "LuminanceSensor",
					uiClass = "LightSensor",
					uiProfiles = ()[372],
					states = {
						67362620678 = {
							linkedHighLevelState = {
								()[303],
								()[304]
							}
						}
					}
				}
			},
			{
				()[305]
			},
			{
				"65537",
				"84059661"
			},
			{
				linkedHighLevelState = ()[498],
				linkedStateIds = ()[499]
			},
			{
				"16830720",
				"16832512",
				"16832522",
				"84059651",
				"84059661"
			},
			{
				"65537",
				"84059651"
			},
			{
				linkedHighLevelState = ()[498],
				linkedStateIds = ()[502]
			},
			{
				linkedHighLevelState = {
					()[10],
					()[8]
				},
				linkedStateIds = ()[32]
			},
			{
				linkedHighLevelState = {
					()[14]
				}
			},
			{
				16832512 = ()[31],
				84059651 = ()[500],
				65537 = {
					linkedHighLevelState = {
						()[305],
						()[5],
						()[12],
						()[10]
					},
					linkedStateIds = ()[501]
				},
				84059661 = ()[503],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[38],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				rawStateId = "84059661"
			},
			{
				()[193],
				()[129],
				()[508]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[509],
				converter = ()[402],
				extraDefinition = ()[9]
			},
			{
				["io:VerticalInteriorBlindGenericIOComponent"] = {
					type = 1,
					widget = "PositionableScreen",
					uiClass = "Screen",
					uiProfiles = ()[167],
					states = ()[506],
					attributes = ()[507],
					commands = {
						setName = ()[20],
						sendIOKey = ()[65],
						keepOneWayControllersAndDeleteNode = ()[61],
						unpairOneWayController = ()[24],
						getName = ()[14],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						delayedStopIdentify = ()[13],
						identify = ()[15],
						unpairAllOneWayControllers = ()[23],
						setSecuredPosition = ()[53],
						setPosition = ()[48],
						my = ()[51],
						setConfigState = ()[25],
						startIdentify = ()[21],
						stop = ()[63],
						setMemorized1Position = ()[47],
						stopIdentify = ()[22],
						wink = ()[26],
						runManufacturerSettingsCommand = {
							prototype = "string,object",
							parameters = ()[44],
							rawStates = ()[509],
							converter = ()[401],
							extraDefinition = ()[45]
						},
						setClosure = ()[38],
						close = ()[40],
						down = ()[40],
						open = ()[42],
						up = ()[42],
						pairOneWayController = ()[17],
						refreshMemorized1Position = ()[37],
						advancedRefresh = ()[510]
					}
				}
			},
			{
				()[306]
			},
			{
				"48177664",
				"65537",
				"65540"
			},
			{
				"16830720",
				"16832512",
				"16832522",
				"48177664",
				"65540",
				"84082687"
			},
			{
				"48177664",
				"65537",
				"84082687"
			},
			{
				"65537",
				"65540",
				"84082687"
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[39],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				rawStateId = "84082687"
			},
			{
				rawStateId = "65540"
			},
			{
				rawStateId = "48177664"
			},
			{
				()[518],
				()[129],
				()[519],
				()[520]
			},
			{
				()[307]
			},
			{
				["io:AdjustableSlatsRollerShutterIOComponent"] = {
					type = 1,
					widget = "PositionableOrOrientableRollerShutter",
					uiClass = "AdjustableSlatsRollerShutter",
					uiProfiles = ()[72],
					states = {
						84082687 = {
							linkedHighLevelState = ()[522],
							linkedStateIds = ()[513]
						},
						65537 = {
							linkedHighLevelState = {
								()[307],
								()[17],
								()[16],
								()[10]
							},
							linkedStateIds = ()[514]
						},
						65540 = {
							linkedHighLevelState = {
								()[307],
								()[18]
							},
							linkedStateIds = ()[515]
						},
						48177664 = {
							linkedHighLevelState = ()[522],
							linkedStateIds = ()[516]
						},
						2147426304 = ()[4],
						1 = ()[3],
						65557 = ()[36],
						2146500645 = ()[57],
						16830720 = ()[35],
						16832512 = ()[74],
						16832522 = ()[75],
						2 = ()[505],
						2146500638 = ()[1]
					},
					attributes = ()[517],
					commands = {
						setName = ()[20],
						setOrientation = ()[83],
						sendIOKey = ()[65],
						keepOneWayControllersAndDeleteNode = ()[61],
						unpairOneWayController = ()[24],
						getName = ()[14],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						delayedStopIdentify = ()[13],
						identify = ()[15],
						unpairAllOneWayControllers = ()[23],
						setConfigState = ()[25],
						setClosureOrRockerPosition = ()[78],
						close = ()[79],
						down = ()[79],
						open = ()[80],
						setClosure = ()[81],
						setDeployment = ()[81],
						setRockerPosition = ()[82],
						up = ()[80],
						startIdentify = ()[21],
						stop = ()[84],
						stopIdentify = ()[22],
						wink = ()[26],
						setClosureOrOrientation = ()[77],
						runManufacturerSettingsCommand = {
							prototype = "string,object",
							parameters = ()[44],
							rawStates = ()[521],
							converter = ()[408],
							extraDefinition = ()[45]
						},
						pairOneWayController = ()[17],
						advancedRefresh = {
							prototype = "string(normal;advanced;custom),*array",
							parameters = ()[8],
							rawStates = ()[521],
							converter = ()[409],
							extraDefinition = ()[9]
						}
					}
				}
			},
			{
				"16830720",
				"16832512",
				"16832522",
				"84082687"
			},
			{
				()[518],
				()[129]
			},
			{
				()[309]
			},
			{
				linkedHighLevelState = {
					()[34],
					()[33]
				},
				linkedStateIds = ()[142]
			},
			{
				rawStateId = "84058662"
			},
			{
				rawStateId = "84058391"
			},
			{
				rawStateId = "49217792"
			},
			{
				rawStateId = "84058368"
			},
			{
				rawStateId = "84058369"
			},
			{
				rawStateId = "84058370"
			},
			{
				rawStateId = "84058371"
			},
			{
				rawStateId = "84058372"
			},
			{
				rawStateId = "84058393"
			},
			{
				rawStateId = "84058394"
			},
			{
				rawStateId = "84058395"
			},
			{
				rawStateId = "84058396"
			},
			{
				rawStateId = "84058373"
			},
			{
				rawStateId = "84058397"
			},
			{
				rawStateId = "84058398"
			},
			{
				rawStateId = "84058399"
			},
			{
				rawStateId = "84058400"
			},
			{
				rawStateId = "84058401"
			},
			{
				rawStateId = "84058375"
			},
			{
				rawStateId = "84058376"
			},
			{
				rawStateId = "84058374"
			},
			{
				rawStateId = "84058377"
			},
			{
				rawStateId = "84058412"
			},
			{
				rawStateId = "84058411"
			},
			{
				rawStateId = "84058378"
			},
			{
				rawStateId = "84058379"
			},
			{
				rawStateId = "84058402"
			},
			{
				rawStateId = "84058380"
			},
			{
				rawStateId = "84058381"
			},
			{
				rawStateId = "84058382"
			},
			{
				rawStateId = "84058383"
			},
			{
				rawStateId = "84058384"
			},
			{
				rawStateId = "84058385"
			},
			{
				rawStateId = "84058386"
			},
			{
				rawStateId = "84058387"
			},
			{
				rawStateId = "84058409"
			},
			{
				()[528],
				()[129],
				()[529],
				()[530],
				()[531],
				()[532],
				()[533],
				()[534],
				()[535],
				()[536],
				()[537],
				()[538],
				()[539],
				()[540],
				()[541],
				()[542],
				()[543],
				()[544],
				()[545],
				()[546],
				()[547],
				()[548],
				()[549],
				()[550],
				()[551],
				()[552],
				()[553],
				()[554],
				()[555],
				()[556],
				()[557],
				()[558],
				()[559],
				()[560],
				()[561],
				()[562],
				()[563]
			},
			{
				["io:SlidingDiscreteGateOpenerIOComponent"] = {
					type = 1,
					widget = "SlidingDiscreteGateWithPedestrianPosition",
					uiClass = "Gate",
					uiProfiles = ()[149],
					states = {
						84058662 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412"
							}
						},
						65537 = {
							linkedHighLevelState = {
								()[309],
								()[33]
							},
							linkedStateIds = {
								"16830720",
								"16832519",
								"49217792",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058391 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						49217792 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058368 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058369 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058370 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058371 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058372 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058393 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058394 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058395 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058396 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058373 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058397 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058398 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058399 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058400 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058401 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058375 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058376 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058374 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058377 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058412 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058662"
							}
						},
						84058411 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058412",
								"84058662"
							}
						},
						84058378 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058379 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058402 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058380 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058381 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058382 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058383 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058384 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058385 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058386 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058387 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058409",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						84058409 = {
							linkedHighLevelState = ()[526],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058369",
								"84058370",
								"84058371",
								"84058372",
								"84058373",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058378",
								"84058379",
								"84058380",
								"84058381",
								"84058382",
								"84058383",
								"84058384",
								"84058385",
								"84058386",
								"84058387",
								"84058391",
								"84058393",
								"84058394",
								"84058395",
								"84058396",
								"84058397",
								"84058398",
								"84058399",
								"84058400",
								"84058401",
								"84058402",
								"84058411",
								"84058412",
								"84058662"
							}
						},
						16832519 = ()[527],
						2147426304 = ()[4],
						1 = ()[3],
						2146500645 = ()[57],
						16830720 = ()[145],
						2 = ()[505],
						2146500638 = ()[1]
					},
					attributes = {
						["core:SupportedManufacturerSettingsCommands"] = ()[40],
						["core:Manufacturer"] = ()[1],
						["core:FirmwareRevision"] = ()[0]
					},
					commands = {
						setName = ()[20],
						sendIOKey = ()[65],
						keepOneWayControllersAndDeleteNode = ()[61],
						unpairOneWayController = ()[24],
						getName = ()[14],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						delayedStopIdentify = ()[13],
						identify = ()[15],
						unpairAllOneWayControllers = ()[23],
						setConfigState = ()[25],
						startIdentify = ()[21],
						refreshPedestrianPosition = ()[146],
						stop = ()[63],
						stopIdentify = ()[22],
						wink = ()[26],
						setPedestrianPosition = ()[150],
						runManufacturerSettingsCommand = {
							prototype = "string,object",
							parameters = ()[44],
							rawStates = ()[564],
							converter = ()[415],
							extraDefinition = ()[45]
						},
						close = ()[98],
						pairOneWayController = ()[17],
						open = ()[99],
						advancedRefresh = {
							prototype = "string(normal;advanced;custom),*array",
							parameters = ()[8],
							rawStates = ()[564],
							converter = ()[416],
							extraDefinition = ()[9]
						}
					}
				}
			},
			{
				name = "Axovia 3S io V2",
				localPairing = true,
				0 = ()[565]
			},
			{
				name = "Axovia 200 3S io V2",
				localPairing = true,
				0 = ()[565]
			},
			{
				()[310]
			},
			{
				"49217792",
				"65537",
				"84058368",
				"84058374",
				"84058375",
				"84058376",
				"84058377",
				"84058390",
				"84058391",
				"84058409",
				"84058411",
				"84058420",
				"84058662",
				"84058697"
			},
			{
				rawStateId = "84058697"
			},
			{
				rawStateId = "84058420"
			},
			{
				rawStateId = "84058390"
			},
			{
				()[528],
				()[129],
				{
					rawStateId = "84058674"
				},
				()[529],
				()[570],
				()[530],
				()[531],
				()[571],
				()[546],
				()[547],
				()[548],
				()[549],
				()[551],
				()[572],
				()[563]
			},
			{
				["io:DiscreteGarageOpenerWithPartialPositionIOComponent"] = {
					type = 1,
					widget = "PositionableGarageDoorWithPartialPosition",
					uiClass = "GarageDoor",
					uiProfiles = ()[97],
					states = {
						84058662 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058409",
								"84058411",
								"84058420",
								"84058674",
								"84058697"
							}
						},
						65537 = {
							linkedHighLevelState = {
								()[310],
								()[224]
							},
							linkedStateIds = {
								"16832521",
								"49217792",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058674",
								"84058697"
							}
						},
						84058674 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = ()[569]
						},
						84058391 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058674",
								"84058697"
							}
						},
						84058697 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058674"
							}
						},
						49217792 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = {
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058674",
								"84058697"
							}
						},
						84058368 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058674",
								"84058697"
							}
						},
						84058420 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058409",
								"84058411",
								"84058662",
								"84058674",
								"84058697"
							}
						},
						84058375 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058674",
								"84058697"
							}
						},
						84058376 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058377",
								"84058390",
								"84058391",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058674",
								"84058697"
							}
						},
						84058374 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058674",
								"84058697"
							}
						},
						84058377 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058390",
								"84058391",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058674",
								"84058697"
							}
						},
						84058411 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058409",
								"84058420",
								"84058662",
								"84058674",
								"84058697"
							}
						},
						84058390 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058391",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058674",
								"84058697"
							}
						},
						84058409 = {
							linkedHighLevelState = ()[568],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058411",
								"84058420",
								"84058662",
								"84058674",
								"84058697"
							}
						},
						16832521 = ()[435],
						2147426304 = ()[4],
						1 = ()[3],
						2 = ()[505],
						2146500638 = ()[1],
						2146500645 = ()[57]
					},
					attributes = {
						["core:SupportedManufacturerSettingsCommands"] = ()[41],
						["core:Manufacturer"] = ()[1],
						["core:FirmwareRevision"] = ()[0]
					},
					commands = {
						setName = ()[20],
						sendIOKey = ()[65],
						keepOneWayControllersAndDeleteNode = ()[61],
						unpairOneWayController = ()[24],
						getName = ()[14],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						delayedStopIdentify = ()[13],
						identify = ()[15],
						partialPosition = ()[436],
						unpairAllOneWayControllers = ()[23],
						down = ()[98],
						refreshPartialPosition = ()[437],
						setConfigState = ()[25],
						startIdentify = ()[21],
						stop = ()[63],
						stopIdentify = ()[22],
						wink = ()[26],
						up = ()[99],
						runManufacturerSettingsCommand = {
							prototype = "string,object",
							parameters = ()[44],
							rawStates = ()[573],
							converter = ()[419],
							extraDefinition = ()[45]
						},
						close = ()[98],
						pairOneWayController = ()[17],
						open = ()[99],
						advancedRefresh = {
							prototype = "string(normal;advanced;custom),*array",
							parameters = ()[8],
							rawStates = ()[573],
							converter = ()[420],
							extraDefinition = ()[9]
						}
					}
				}
			},
			{
				name = "Dexxo Smart 800 io",
				localPairing = true,
				0 = ()[574]
			},
			{
				name = "Dexxo Smart 1000 io",
				localPairing = true,
				0 = ()[574]
			},
			{
				name = "Metro Smart 800 io",
				localPairing = true,
				0 = ()[574]
			},
			{
				name = "Metro Smart 1000 io",
				localPairing = true,
				0 = ()[574]
			},
			{
				()[311]
			},
			{
				linkedHighLevelState = ()[579],
				linkedStateIds = {
					"48177664",
					"65537",
					"84059661"
				}
			},
			{
				linkedHighLevelState = ()[579],
				linkedStateIds = {
					"48177664",
					"65537",
					"84059651"
				}
			},
			{
				linkedHighLevelState = ()[579],
				linkedStateIds = {
					"65537",
					"84059651",
					"84059661"
				}
			},
			{
				16832512 = ()[31],
				17029120 = ()[211],
				84059651 = ()[580],
				65537 = {
					linkedHighLevelState = {
						()[311],
						()[5],
						()[12],
						()[10]
					},
					linkedStateIds = {
						"16830720",
						"16832512",
						"16832522",
						"48177664",
						"84059651",
						"84059661"
					}
				},
				84059661 = ()[581],
				48177664 = ()[582],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				65540 = ()[73],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[42],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				()[193],
				()[129],
				()[508],
				()[520]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[585],
				converter = ()[423],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[585],
				converter = ()[424],
				extraDefinition = ()[9]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				unpairOneWayController = ()[24],
				getName = ()[14],
				delayedStopIdentify = ()[13],
				unpairAllOneWayControllers = ()[23],
				setClosureAndOrientation = ()[213],
				my = ()[214],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				stopIdentify = ()[22],
				runManufacturerSettingsCommand = ()[586],
				setClosure = ()[38],
				close = ()[40],
				down = ()[40],
				open = ()[42],
				up = ()[42],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[587],
				setOrientation = ()[215],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				identify = ()[15],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				wink = ()[26],
				pairOneWayController = ()[17],
				setMemorized1Orientation = ()[216]
			},
			{
				name = "EVB-Slim Receiver for Variation WP IO Plug",
				localPairing = true,
				0 = {
					["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
						type = 1,
						widget = "PositionableExteriorVenetianBlindWithWP2",
						uiClass = "ExteriorVenetianBlind",
						uiProfiles = ()[28],
						states = {
							16832512 = ()[69],
							17029120 = ()[211],
							84059651 = ()[580],
							65537 = {
								linkedHighLevelState = {
									()[311],
									()[5],
									()[12]
								},
								linkedStateIds = {
									"48177664",
									"84059651",
									"84059661"
								}
							},
							84059661 = ()[581],
							48177664 = ()[582],
							2147426304 = ()[4],
							1 = ()[3],
							65540 = ()[73],
							2146500645 = ()[57],
							16832522 = ()[70],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = ()[584],
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							unpairOneWayController = ()[24],
							getName = ()[14],
							delayedStopIdentify = ()[13],
							unpairAllOneWayControllers = ()[23],
							setClosureAndOrientation = ()[213],
							my = ()[214],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							stopIdentify = ()[22],
							runManufacturerSettingsCommand = ()[586],
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							up = ()[42],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[587],
							setOrientation = ()[215],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							identify = ()[15],
							refreshMemorized1Orientation = ()[481],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							wink = ()[26],
							pairOneWayController = ()[17],
							setMemorized1Orientation = ()[216]
						}
					}
				}
			},
			{
				()[312]
			},
			{
				linkedHighLevelState = ()[590],
				linkedStateIds = {
					"48177664",
					"65537",
					"65540",
					"84059661"
				}
			},
			{
				"48177664",
				"65537",
				"65540",
				"84059651"
			},
			{
				linkedHighLevelState = ()[590],
				linkedStateIds = ()[592]
			},
			{
				linkedHighLevelState = {
					()[312],
					()[18]
				},
				linkedStateIds = {
					"48177664",
					"65537",
					"84059651",
					"84059661"
				}
			},
			{
				linkedHighLevelState = ()[590],
				linkedStateIds = {
					"65537",
					"65540",
					"84059651",
					"84059661"
				}
			},
			{
				16832512 = ()[31],
				17029120 = ()[211],
				84059651 = ()[591],
				65537 = {
					linkedHighLevelState = {
						()[312],
						()[5],
						()[12],
						()[10]
					},
					linkedStateIds = {
						"16830720",
						"16832512",
						"16832522",
						"48177664",
						"65540",
						"84059651",
						"84059661"
					}
				},
				84059661 = ()[593],
				65540 = ()[594],
				48177664 = ()[595],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[43],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				()[193],
				()[129],
				()[508],
				()[519],
				()[520]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[598],
				converter = ()[427],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[598],
				converter = ()[428],
				extraDefinition = ()[9]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				unpairOneWayController = ()[24],
				getName = ()[14],
				delayedStopIdentify = ()[13],
				unpairAllOneWayControllers = ()[23],
				setClosureAndOrientation = ()[213],
				my = ()[214],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				stopIdentify = ()[22],
				runManufacturerSettingsCommand = ()[599],
				setClosure = ()[38],
				close = ()[40],
				down = ()[40],
				open = ()[42],
				up = ()[42],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[600],
				setOrientation = ()[215],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				identify = ()[15],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				wink = ()[26],
				pairOneWayController = ()[17],
				setMemorized1Orientation = ()[216]
			},
			{
				16832512 = ()[69],
				17029120 = ()[211],
				84059651 = ()[591],
				65537 = {
					linkedHighLevelState = {
						()[312],
						()[5],
						()[12]
					},
					linkedStateIds = {
						"48177664",
						"65540",
						"84059651",
						"84059661"
					}
				},
				84059661 = ()[593],
				65540 = ()[594],
				48177664 = ()[595],
				2147426304 = ()[4],
				1 = ()[3],
				2146500645 = ()[57],
				16832522 = ()[70],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				name = "EVB-Slim Receiver for Variation",
				localPairing = true,
				0 = {
					["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
						type = 1,
						widget = "PositionableExteriorVenetianBlindWithWP2",
						uiClass = "ExteriorVenetianBlind",
						uiProfiles = ()[28],
						states = ()[602],
						attributes = ()[597],
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							unpairOneWayController = ()[24],
							getName = ()[14],
							delayedStopIdentify = ()[13],
							unpairAllOneWayControllers = ()[23],
							setClosureAndOrientation = ()[213],
							my = ()[214],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							stopIdentify = ()[22],
							runManufacturerSettingsCommand = ()[599],
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							up = ()[42],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[600],
							setOrientation = ()[215],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							identify = ()[15],
							refreshMemorized1Orientation = ()[481],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							wink = ()[26],
							pairOneWayController = ()[17],
							setMemorized1Orientation = ()[216]
						}
					}
				}
			},
			{
				()[313]
			},
			{
				rawStateId = "84058392"
			},
			{
				()[528],
				()[129],
				()[529],
				()[530],
				()[531],
				()[532],
				()[533],
				()[534],
				()[535],
				{
					rawStateId = "84058406"
				},
				()[605],
				()[536],
				()[537],
				()[538],
				()[539],
				()[540],
				()[541],
				()[542],
				()[543],
				()[544],
				()[546],
				()[547],
				()[548],
				()[549],
				()[550],
				()[551],
				()[555],
				()[556],
				()[557],
				()[558],
				()[572],
				()[563]
			},
			{
				name = "Elixo 3S io V2",
				localPairing = true,
				0 = {
					["io:SlidingDiscreteGateOpenerIOComponent"] = {
						type = 1,
						widget = "SlidingDiscreteGateWithPedestrianPosition",
						uiClass = "Gate",
						uiProfiles = ()[149],
						states = {
							84058662 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412"
								}
							},
							65537 = {
								linkedHighLevelState = {
									()[313],
									()[33]
								},
								linkedStateIds = {
									"16830720",
									"16832519",
									"49217792",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058391 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							49217792 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058368 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058369 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058370 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058371 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058372 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058406 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058392 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058393 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058394 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058395 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058396 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058373 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058397 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058398 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058399 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058400 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058375 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058376 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058374 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058377 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058412 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058662"
								}
							},
							84058411 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058412",
									"84058662"
								}
							},
							84058380 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058381 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058382 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058383 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058390 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058409 = {
								linkedHighLevelState = ()[604],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058390",
									"84058391",
									"84058392",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058406",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							16832519 = ()[527],
							2147426304 = ()[4],
							1 = ()[3],
							2146500645 = ()[57],
							16830720 = ()[145],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = {
							["core:SupportedManufacturerSettingsCommands"] = ()[44],
							["core:Manufacturer"] = ()[1],
							["core:FirmwareRevision"] = ()[0]
						},
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairOneWayController = ()[24],
							getName = ()[14],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							delayedStopIdentify = ()[13],
							identify = ()[15],
							unpairAllOneWayControllers = ()[23],
							setConfigState = ()[25],
							startIdentify = ()[21],
							refreshPedestrianPosition = ()[146],
							stop = ()[63],
							stopIdentify = ()[22],
							wink = ()[26],
							setPedestrianPosition = ()[150],
							runManufacturerSettingsCommand = {
								prototype = "string,object",
								parameters = ()[44],
								rawStates = ()[606],
								converter = ()[431],
								extraDefinition = ()[45]
							},
							close = ()[98],
							pairOneWayController = ()[17],
							open = ()[99],
							advancedRefresh = {
								prototype = "string(normal;advanced;custom),*array",
								parameters = ()[8],
								rawStates = ()[606],
								converter = ()[432],
								extraDefinition = ()[9]
							}
						}
					}
				}
			},
			{
				()[314]
			},
			{
				()[528],
				()[129],
				()[529],
				()[605],
				()[570],
				()[530],
				()[531],
				()[571],
				()[546],
				()[547],
				()[548],
				()[549],
				()[551],
				()[572],
				()[563]
			},
			{
				["io:SlidingDiscreteFullyPedestriableGateOpenerIOComponent"] = {
					type = 1,
					widget = "SlidingDiscreteGateWithPedestrianPosition",
					uiClass = "Gate",
					uiProfiles = ()[149],
					states = {
						84058662 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058392",
								"84058409",
								"84058411",
								"84058420",
								"84058697"
							}
						},
						65537 = {
							linkedHighLevelState = {
								()[314],
								()[33]
							},
							linkedStateIds = {
								"16830720",
								"16832519",
								"49217792",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058392",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058697"
							}
						},
						84058391 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058392",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058697"
							}
						},
						84058392 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = ()[569]
						},
						84058697 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058392",
								"84058409",
								"84058411",
								"84058420",
								"84058662"
							}
						},
						49217792 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = {
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058392",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058697"
							}
						},
						84058368 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058392",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058697"
							}
						},
						84058420 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058392",
								"84058409",
								"84058411",
								"84058662",
								"84058697"
							}
						},
						84058375 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058392",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058697"
							}
						},
						84058376 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058377",
								"84058390",
								"84058391",
								"84058392",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058697"
							}
						},
						84058374 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058392",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058697"
							}
						},
						84058377 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058390",
								"84058391",
								"84058392",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058697"
							}
						},
						84058411 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058392",
								"84058409",
								"84058420",
								"84058662",
								"84058697"
							}
						},
						84058390 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058391",
								"84058392",
								"84058409",
								"84058411",
								"84058420",
								"84058662",
								"84058697"
							}
						},
						84058409 = {
							linkedHighLevelState = ()[608],
							linkedStateIds = {
								"49217792",
								"65537",
								"84058368",
								"84058374",
								"84058375",
								"84058376",
								"84058377",
								"84058390",
								"84058391",
								"84058392",
								"84058411",
								"84058420",
								"84058662",
								"84058697"
							}
						},
						16832519 = ()[527],
						2147426304 = ()[4],
						1 = ()[3],
						2146500645 = ()[57],
						16830720 = ()[145],
						2 = ()[505],
						2146500638 = ()[1]
					},
					attributes = {
						["core:SupportedManufacturerSettingsCommands"] = ()[45],
						["core:Manufacturer"] = ()[1],
						["core:FirmwareRevision"] = ()[0]
					},
					commands = {
						setName = ()[20],
						sendIOKey = ()[65],
						keepOneWayControllersAndDeleteNode = ()[61],
						unpairOneWayController = ()[24],
						getName = ()[14],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						delayedStopIdentify = ()[13],
						identify = ()[15],
						unpairAllOneWayControllers = ()[23],
						setConfigState = ()[25],
						startIdentify = ()[21],
						refreshPedestrianPosition = ()[146],
						stop = ()[63],
						stopIdentify = ()[22],
						wink = ()[26],
						setPedestrianPosition = ()[150],
						runManufacturerSettingsCommand = {
							prototype = "string,object",
							parameters = ()[44],
							rawStates = ()[609],
							converter = ()[435],
							extraDefinition = ()[45]
						},
						close = ()[98],
						pairOneWayController = ()[17],
						open = ()[99],
						advancedRefresh = {
							prototype = "string(normal;advanced;custom),*array",
							parameters = ()[8],
							rawStates = ()[609],
							converter = ()[436],
							extraDefinition = ()[9]
						}
					}
				}
			},
			{
				name = "Elixo Smart io",
				localPairing = true,
				0 = ()[610]
			},
			{
				name = "Roly Smart io",
				localPairing = true,
				0 = ()[610]
			},
			{
				linkedHighLevelState = {
					()[315]
				},
				linkedStateIds = ()[243]
			},
			{
				"84059651"
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[46],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				()[193],
				()[129]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[616],
				converter = ()[439],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[616],
				converter = ()[440],
				extraDefinition = ()[9]
			},
			{
				["io:RollerShutterGenericIOComponent"] = {
					type = 1,
					widget = "PositionableRollerShutter",
					uiClass = "RollerShutter",
					uiProfiles = ()[54],
					states = ()[506],
					attributes = {
						["core:SupportedManufacturerSettingsCommands"] = ()[47],
						["core:Manufacturer"] = ()[1],
						["core:FirmwareRevision"] = ()[0]
					},
					commands = {
						setName = ()[20],
						sendIOKey = ()[65],
						keepOneWayControllersAndDeleteNode = ()[61],
						unpairOneWayController = ()[24],
						getName = ()[14],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						delayedStopIdentify = ()[13],
						identify = ()[15],
						unpairAllOneWayControllers = ()[23],
						setSecuredPosition = ()[53],
						setPosition = ()[48],
						my = ()[51],
						setConfigState = ()[25],
						startIdentify = ()[21],
						stop = ()[63],
						setMemorized1Position = ()[47],
						stopIdentify = ()[22],
						wink = ()[26],
						runManufacturerSettingsCommand = {
							prototype = "string,object",
							parameters = ()[44],
							rawStates = ()[509],
							converter = ()[443],
							extraDefinition = ()[45]
						},
						setClosure = ()[38],
						close = ()[40],
						down = ()[40],
						open = ()[42],
						setDeployment = ()[38],
						up = ()[42],
						pairOneWayController = ()[17],
						refreshMemorized1Position = ()[37],
						advancedRefresh = ()[510]
					}
				}
			},
			{
				name = "Invisio 3S io V2",
				localPairing = true,
				0 = ()[565]
			},
			{
				()[316]
			},
			{
				()[528],
				()[129],
				()[529],
				()[530],
				()[531],
				()[532],
				()[533],
				()[534],
				()[535],
				()[536],
				()[537],
				()[538],
				()[539],
				()[540],
				()[541],
				()[542],
				()[543],
				()[544],
				()[545],
				()[546],
				()[547],
				()[548],
				()[549],
				()[550],
				()[551],
				()[552],
				()[553],
				()[554],
				{
					rawStateId = "84058404"
				},
				()[555],
				()[556],
				()[557],
				()[558],
				()[559],
				()[560],
				()[561],
				()[562],
				()[563]
			},
			{
				name = "Ixengo 3S io V2",
				localPairing = true,
				0 = {
					["io:SlidingDiscreteGateOpenerIOComponent"] = {
						type = 1,
						widget = "SlidingDiscreteGateWithPedestrianPosition",
						uiClass = "Gate",
						uiProfiles = ()[149],
						states = {
							84058662 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412"
								}
							},
							65537 = {
								linkedHighLevelState = {
									()[316],
									()[33]
								},
								linkedStateIds = {
									"16830720",
									"16832519",
									"49217792",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058391 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							49217792 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058368 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058369 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058370 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058371 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058372 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058393 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058394 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058395 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058396 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058373 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058397 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058398 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058399 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058400 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058401 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058375 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058376 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058374 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058377 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058412 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058662"
								}
							},
							84058411 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058412",
									"84058662"
								}
							},
							84058378 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058379 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058402 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058404 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058380 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058381 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058382 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058383 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058384 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058385 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058386 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058387 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058409",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							84058409 = {
								linkedHighLevelState = ()[621],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058369",
									"84058370",
									"84058371",
									"84058372",
									"84058373",
									"84058374",
									"84058375",
									"84058376",
									"84058377",
									"84058378",
									"84058379",
									"84058380",
									"84058381",
									"84058382",
									"84058383",
									"84058384",
									"84058385",
									"84058386",
									"84058387",
									"84058391",
									"84058393",
									"84058394",
									"84058395",
									"84058396",
									"84058397",
									"84058398",
									"84058399",
									"84058400",
									"84058401",
									"84058402",
									"84058404",
									"84058411",
									"84058412",
									"84058662"
								}
							},
							16832519 = ()[527],
							2147426304 = ()[4],
							1 = ()[3],
							2146500645 = ()[57],
							16830720 = ()[145],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = {
							["core:SupportedManufacturerSettingsCommands"] = ()[48],
							["core:Manufacturer"] = ()[1],
							["core:FirmwareRevision"] = ()[0]
						},
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairOneWayController = ()[24],
							getName = ()[14],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							delayedStopIdentify = ()[13],
							identify = ()[15],
							unpairAllOneWayControllers = ()[23],
							setConfigState = ()[25],
							startIdentify = ()[21],
							refreshPedestrianPosition = ()[146],
							stop = ()[63],
							stopIdentify = ()[22],
							wink = ()[26],
							setPedestrianPosition = ()[150],
							runManufacturerSettingsCommand = {
								prototype = "string,object",
								parameters = ()[44],
								rawStates = ()[622],
								converter = ()[446],
								extraDefinition = ()[45]
							},
							close = ()[98],
							pairOneWayController = ()[17],
							open = ()[99],
							advancedRefresh = {
								prototype = "string(normal;advanced;custom),*array",
								parameters = ()[8],
								rawStates = ()[622],
								converter = ()[447],
								extraDefinition = ()[9]
							}
						}
					}
				}
			},
			{
				84059655 = ()[191],
				65537 = {
					linkedHighLevelState = {
						()[317],
						()[31]
					},
					linkedStateIds = ()[614]
				},
				84059651 = {
					linkedHighLevelState = {
						()[317],
						()[50],
						()[48]
					},
					linkedStateIds = ()[243]
				},
				2147426304 = ()[4],
				1 = ()[3],
				2146500645 = ()[57],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[49],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				()[129],
				()[193]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				onWithInternalTimer = ()[186],
				setConfigState = ()[25],
				onWithTimer = ()[187],
				setInternalTimer = ()[196],
				startIdentify = ()[21],
				setOnOff = ()[188],
				off = ()[189],
				on = ()[190],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ()[44],
					rawStates = ()[626],
					converter = ()[450],
					extraDefinition = ()[45]
				},
				setPictoValue = ()[197],
				pairOneWayController = ()[17],
				advancedRefresh = {
					prototype = "string(normal;advanced;custom),*array",
					parameters = ()[8],
					rawStates = ()[626],
					converter = ()[451],
					extraDefinition = ()[9]
				}
			},
			{
				()[318]
			},
			{
				()[129],
				{
					rawStateId = "84059656"
				},
				()[193]
			},
			{
				()[319]
			},
			{
				"65537",
				"84082687"
			},
			{
				linkedHighLevelState = ()[630],
				linkedStateIds = ()[631]
			},
			{
				"16830720",
				"16832512",
				"16832522",
				"84059651",
				"84082687"
			},
			{
				linkedHighLevelState = ()[630],
				linkedStateIds = ()[502]
			},
			{
				16832512 = ()[31],
				17029120 = ()[211],
				84059651 = ()[632],
				65537 = {
					linkedHighLevelState = {
						()[319],
						()[5],
						()[12],
						()[10]
					},
					linkedStateIds = ()[633]
				},
				84082687 = ()[634],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				65540 = ()[73],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[51],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				()[193],
				()[129],
				()[518]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[637],
				converter = ()[458],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[637],
				converter = ()[459],
				extraDefinition = ()[9]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				unpairOneWayController = ()[24],
				getName = ()[14],
				delayedStopIdentify = ()[13],
				unpairAllOneWayControllers = ()[23],
				setClosureAndOrientation = ()[213],
				my = ()[214],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				stopIdentify = ()[22],
				runManufacturerSettingsCommand = ()[638],
				setClosure = ()[38],
				close = ()[40],
				down = ()[40],
				open = ()[42],
				up = ()[42],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[639],
				setOrientation = ()[215],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				identify = ()[15],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				wink = ()[26],
				pairOneWayController = ()[17],
				setMemorized1Orientation = ()[216]
			},
			{
				"84059651",
				"84082687"
			},
			{
				name = "J4 io Plate",
				localPairing = true,
				0 = {
					["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
						type = 1,
						widget = "PositionableExteriorVenetianBlindWithWP2",
						uiClass = "ExteriorVenetianBlind",
						uiProfiles = ()[28],
						states = {
							16832512 = ()[69],
							17029120 = ()[211],
							84059651 = ()[632],
							65537 = {
								linkedHighLevelState = {
									()[319],
									()[5],
									()[12]
								},
								linkedStateIds = ()[641]
							},
							84082687 = ()[634],
							2147426304 = ()[4],
							1 = ()[3],
							65540 = ()[73],
							2146500645 = ()[57],
							16832522 = ()[70],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = ()[636],
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							unpairOneWayController = ()[24],
							getName = ()[14],
							delayedStopIdentify = ()[13],
							unpairAllOneWayControllers = ()[23],
							setClosureAndOrientation = ()[213],
							my = ()[214],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							stopIdentify = ()[22],
							runManufacturerSettingsCommand = ()[638],
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							up = ()[42],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[639],
							setOrientation = ()[215],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							identify = ()[15],
							refreshMemorized1Orientation = ()[481],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							wink = ()[26],
							pairOneWayController = ()[17],
							setMemorized1Orientation = ()[216]
						}
					}
				}
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[52],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[598],
				converter = ()[461],
				extraDefinition = ()[45]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				unpairOneWayController = ()[24],
				getName = ()[14],
				delayedStopIdentify = ()[13],
				unpairAllOneWayControllers = ()[23],
				setClosureAndOrientation = ()[213],
				my = ()[214],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				stopIdentify = ()[22],
				runManufacturerSettingsCommand = ()[644],
				setClosure = ()[38],
				close = ()[40],
				down = ()[40],
				open = ()[42],
				up = ()[42],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[600],
				setOrientation = ()[215],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				identify = ()[15],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				wink = ()[26],
				pairOneWayController = ()[17],
				setMemorized1Orientation = ()[216]
			},
			{
				name = "J4 io Plate",
				localPairing = true,
				0 = {
					["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
						type = 1,
						widget = "PositionableExteriorVenetianBlindWithWP2",
						uiClass = "ExteriorVenetianBlind",
						uiProfiles = ()[28],
						states = ()[602],
						attributes = ()[643],
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							unpairOneWayController = ()[24],
							getName = ()[14],
							delayedStopIdentify = ()[13],
							unpairAllOneWayControllers = ()[23],
							setClosureAndOrientation = ()[213],
							my = ()[214],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							stopIdentify = ()[22],
							runManufacturerSettingsCommand = ()[644],
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							up = ()[42],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[600],
							setOrientation = ()[215],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							identify = ()[15],
							refreshMemorized1Orientation = ()[481],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							wink = ()[26],
							pairOneWayController = ()[17],
							setMemorized1Orientation = ()[216]
						}
					}
				}
			},
			{
				()[320]
			},
			{
				linkedHighLevelState = ()[647],
				linkedStateIds = ()[631]
			},
			{
				linkedHighLevelState = ()[647],
				linkedStateIds = ()[502]
			},
			{
				16832512 = ()[31],
				17029120 = ()[211],
				84059651 = ()[648],
				65537 = {
					linkedHighLevelState = {
						()[320],
						()[5],
						()[12],
						()[10]
					},
					linkedStateIds = ()[633]
				},
				84082687 = ()[649],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				65540 = ()[73],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[637],
				converter = ()[463],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[637],
				converter = ()[464],
				extraDefinition = ()[9]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				unpairOneWayController = ()[24],
				getName = ()[14],
				delayedStopIdentify = ()[13],
				unpairAllOneWayControllers = ()[23],
				setClosureAndOrientation = ()[213],
				my = ()[214],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				stopIdentify = ()[22],
				runManufacturerSettingsCommand = ()[651],
				setClosure = ()[38],
				close = ()[40],
				down = ()[40],
				open = ()[42],
				up = ()[42],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[652],
				setOrientation = ()[215],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				identify = ()[15],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				wink = ()[26],
				pairOneWayController = ()[17],
				setMemorized1Orientation = ()[216]
			},
			{
				name = "J4 io Plate",
				localPairing = true,
				0 = {
					["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
						type = 1,
						widget = "PositionableExteriorVenetianBlindWithWP2",
						uiClass = "ExteriorVenetianBlind",
						uiProfiles = ()[28],
						states = {
							16832512 = ()[69],
							17029120 = ()[211],
							84059651 = ()[648],
							65537 = {
								linkedHighLevelState = {
									()[320],
									()[5],
									()[12]
								},
								linkedStateIds = ()[641]
							},
							84082687 = ()[649],
							2147426304 = ()[4],
							1 = ()[3],
							65540 = ()[73],
							2146500645 = ()[57],
							16832522 = ()[70],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = ()[636],
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							unpairOneWayController = ()[24],
							getName = ()[14],
							delayedStopIdentify = ()[13],
							unpairAllOneWayControllers = ()[23],
							setClosureAndOrientation = ()[213],
							my = ()[214],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							stopIdentify = ()[22],
							runManufacturerSettingsCommand = ()[651],
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							up = ()[42],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[652],
							setOrientation = ()[215],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							identify = ()[15],
							refreshMemorized1Orientation = ()[481],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							wink = ()[26],
							pairOneWayController = ()[17],
							setMemorized1Orientation = ()[216]
						}
					}
				}
			},
			{
				()[321]
			},
			{
				linkedHighLevelState = ()[655],
				linkedStateIds = {
					"48177664",
					"65537",
					"65540",
					"84082687"
				}
			},
			{
				linkedHighLevelState = ()[655],
				linkedStateIds = ()[592]
			},
			{
				linkedHighLevelState = {
					()[321],
					()[18]
				},
				linkedStateIds = {
					"48177664",
					"65537",
					"84059651",
					"84082687"
				}
			},
			{
				linkedHighLevelState = ()[655],
				linkedStateIds = {
					"65537",
					"65540",
					"84059651",
					"84082687"
				}
			},
			{
				16832512 = ()[31],
				17029120 = ()[211],
				84059651 = ()[656],
				65537 = {
					linkedHighLevelState = {
						()[321],
						()[5],
						()[12],
						()[10]
					},
					linkedStateIds = {
						"16830720",
						"16832512",
						"16832522",
						"48177664",
						"65540",
						"84059651",
						"84082687"
					}
				},
				84082687 = ()[657],
				65540 = ()[658],
				48177664 = ()[659],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				()[193],
				()[129],
				()[518],
				()[519],
				()[520]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[661],
				converter = ()[466],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[661],
				converter = ()[467],
				extraDefinition = ()[9]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				unpairOneWayController = ()[24],
				getName = ()[14],
				delayedStopIdentify = ()[13],
				unpairAllOneWayControllers = ()[23],
				setClosureAndOrientation = ()[213],
				my = ()[214],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				stopIdentify = ()[22],
				runManufacturerSettingsCommand = ()[662],
				setClosure = ()[38],
				close = ()[40],
				down = ()[40],
				open = ()[42],
				up = ()[42],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[663],
				setOrientation = ()[215],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				identify = ()[15],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				wink = ()[26],
				pairOneWayController = ()[17],
				setMemorized1Orientation = ()[216]
			},
			{
				name = "J4 io Plate",
				localPairing = true,
				0 = {
					["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
						type = 1,
						widget = "PositionableExteriorVenetianBlindWithWP2",
						uiClass = "ExteriorVenetianBlind",
						uiProfiles = ()[28],
						states = {
							16832512 = ()[69],
							17029120 = ()[211],
							84059651 = ()[656],
							65537 = {
								linkedHighLevelState = {
									()[321],
									()[5],
									()[12]
								},
								linkedStateIds = {
									"48177664",
									"65540",
									"84059651",
									"84082687"
								}
							},
							84082687 = ()[657],
							65540 = ()[658],
							48177664 = ()[659],
							2147426304 = ()[4],
							1 = ()[3],
							2146500645 = ()[57],
							16832522 = ()[70],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = ()[643],
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							unpairOneWayController = ()[24],
							getName = ()[14],
							delayedStopIdentify = ()[13],
							unpairAllOneWayControllers = ()[23],
							setClosureAndOrientation = ()[213],
							my = ()[214],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							stopIdentify = ()[22],
							runManufacturerSettingsCommand = ()[662],
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							up = ()[42],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[663],
							setOrientation = ()[215],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							identify = ()[15],
							refreshMemorized1Orientation = ()[481],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							wink = ()[26],
							pairOneWayController = ()[17],
							setMemorized1Orientation = ()[216]
						}
					}
				}
			},
			{
				()[29],
				()[28],
				()[27]
			},
			{
				linkedHighLevelState = {
					()[315],
					()[23],
					()[25]
				},
				linkedStateIds = ()[614]
			},
			{
				()[323]
			},
			{
				linkedHighLevelState = ()[668],
				linkedStateIds = {
					"48170496",
					"65537",
					"84059658",
					"84059664"
				}
			},
			{
				"16830720",
				"16832512",
				"16832522",
				"48170496",
				"84059651",
				"84059658",
				"84059664"
			},
			{
				linkedHighLevelState = ()[668],
				linkedStateIds = {
					"65537",
					"84059651",
					"84059658",
					"84059664"
				}
			},
			{
				"48170496",
				"65537",
				"84059651",
				"84059664"
			},
			{
				linkedHighLevelState = ()[668],
				linkedStateIds = ()[672]
			},
			{
				linkedHighLevelState = ()[668],
				linkedStateIds = {
					"48170496",
					"65537",
					"84059651",
					"84059658"
				}
			},
			{
				16832512 = ()[31],
				84059651 = ()[669],
				65537 = {
					linkedHighLevelState = {
						()[323],
						()[5],
						()[12],
						()[10],
						()[20]
					},
					linkedStateIds = ()[670]
				},
				48170496 = ()[671],
				84059658 = ()[673],
				84059664 = ()[674],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[54],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				rawStateId = "48170496"
			},
			{
				rawStateId = "84059658"
			},
			{
				rawStateId = "84059664"
			},
			{
				()[193],
				()[129],
				()[677],
				()[678],
				()[679]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[680],
				converter = ()[475],
				extraDefinition = ()[9]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ()[44],
					rawStates = ()[680],
					converter = ()[474],
					extraDefinition = ()[45]
				},
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[681]
			},
			{
				16832512 = ()[31],
				84059651 = ()[669],
				65537 = {
					linkedHighLevelState = {
						()[323],
						()[5],
						()[12],
						()[10],
						()[280]
					},
					linkedStateIds = ()[670]
				},
				48170496 = ()[671],
				84059658 = ()[673],
				84059664 = ()[674],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[55],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ()[44],
					rawStates = ()[680],
					converter = ()[477],
					extraDefinition = ()[45]
				},
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[681]
			},
			{
				()[324]
			},
			{
				"65537",
				"65540",
				"84059658",
				"84059659",
				"84059664"
			},
			{
				linkedHighLevelState = ()[686],
				linkedStateIds = ()[687]
			},
			{
				"16830720",
				"16832512",
				"16832522",
				"65540",
				"84059651",
				"84059658",
				"84059659",
				"84059664"
			},
			{
				"65537",
				"65540",
				"84059651",
				"84059658",
				"84059659"
			},
			{
				linkedHighLevelState = ()[686],
				linkedStateIds = ()[690]
			},
			{
				"65537",
				"65540",
				"84059651",
				"84059658",
				"84059664"
			},
			{
				linkedHighLevelState = ()[686],
				linkedStateIds = ()[692]
			},
			{
				"65537",
				"84059651",
				"84059658",
				"84059659",
				"84059664"
			},
			{
				linkedHighLevelState = {
					()[324],
					()[18]
				},
				linkedStateIds = ()[694]
			},
			{
				"65537",
				"65540",
				"84059651",
				"84059659",
				"84059664"
			},
			{
				linkedHighLevelState = ()[686],
				linkedStateIds = ()[696]
			},
			{
				16832512 = ()[31],
				17029120 = ()[211],
				84059651 = ()[688],
				65537 = {
					linkedHighLevelState = {
						()[324],
						()[5],
						()[12],
						()[10]
					},
					linkedStateIds = ()[689]
				},
				84059664 = ()[691],
				84059659 = ()[693],
				65540 = ()[695],
				84059658 = ()[697],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[56],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				rawStateId = "84059659"
			},
			{
				()[193],
				()[129],
				()[679],
				()[700],
				()[519],
				()[678]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[701],
				converter = ()[480],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[701],
				converter = ()[481],
				extraDefinition = ()[9]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				unpairOneWayController = ()[24],
				getName = ()[14],
				delayedStopIdentify = ()[13],
				unpairAllOneWayControllers = ()[23],
				setClosureAndOrientation = ()[213],
				my = ()[214],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				stopIdentify = ()[22],
				runManufacturerSettingsCommand = ()[702],
				setClosure = ()[38],
				close = ()[40],
				down = ()[40],
				open = ()[42],
				up = ()[42],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[703],
				setOrientation = ()[215],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				identify = ()[15],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				wink = ()[26],
				pairOneWayController = ()[17],
				setMemorized1Orientation = ()[216]
			},
			{
				"65540",
				"84059651",
				"84059658",
				"84059659",
				"84059664"
			},
			{
				name = "My EVB Pro io",
				localPairing = true,
				0 = {
					["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
						type = 1,
						widget = "PositionableExteriorVenetianBlindWithWP2",
						uiClass = "ExteriorVenetianBlind",
						uiProfiles = ()[28],
						states = {
							16832512 = ()[69],
							17029120 = ()[211],
							84059651 = ()[688],
							65537 = {
								linkedHighLevelState = {
									()[324],
									()[5],
									()[12]
								},
								linkedStateIds = ()[705]
							},
							84059664 = ()[691],
							84059659 = ()[693],
							65540 = ()[695],
							84059658 = ()[697],
							2147426304 = ()[4],
							1 = ()[3],
							2146500645 = ()[57],
							16832522 = ()[70],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = ()[699],
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							unpairOneWayController = ()[24],
							getName = ()[14],
							delayedStopIdentify = ()[13],
							unpairAllOneWayControllers = ()[23],
							setClosureAndOrientation = ()[213],
							my = ()[214],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							stopIdentify = ()[22],
							runManufacturerSettingsCommand = ()[702],
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							up = ()[42],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[703],
							setOrientation = ()[215],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							identify = ()[15],
							refreshMemorized1Orientation = ()[481],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							wink = ()[26],
							pairOneWayController = ()[17],
							setMemorized1Orientation = ()[216]
						}
					}
				}
			},
			{
				()[325]
			},
			{
				linkedHighLevelState = ()[707],
				linkedStateIds = ()[687]
			},
			{
				linkedHighLevelState = ()[707],
				linkedStateIds = ()[690]
			},
			{
				linkedHighLevelState = {
					()[325],
					()[18]
				},
				linkedStateIds = ()[694]
			},
			{
				linkedHighLevelState = ()[707],
				linkedStateIds = ()[696]
			},
			{
				linkedHighLevelState = ()[707],
				linkedStateIds = ()[692]
			},
			{
				16832512 = ()[31],
				17029120 = ()[211],
				84059651 = ()[708],
				65537 = {
					linkedHighLevelState = {
						()[325],
						()[5],
						()[12],
						()[10]
					},
					linkedStateIds = ()[689]
				},
				84059664 = ()[709],
				65540 = ()[710],
				84059658 = ()[711],
				84059659 = ()[712],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				()[193],
				()[129],
				()[679],
				()[519],
				()[678],
				()[700]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[714],
				converter = ()[483],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[714],
				converter = ()[484],
				extraDefinition = ()[9]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				unpairOneWayController = ()[24],
				getName = ()[14],
				delayedStopIdentify = ()[13],
				unpairAllOneWayControllers = ()[23],
				setClosureAndOrientation = ()[213],
				my = ()[214],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				stopIdentify = ()[22],
				runManufacturerSettingsCommand = ()[715],
				setClosure = ()[38],
				close = ()[40],
				down = ()[40],
				open = ()[42],
				up = ()[42],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[716],
				setOrientation = ()[215],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				identify = ()[15],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				wink = ()[26],
				pairOneWayController = ()[17],
				setMemorized1Orientation = ()[216]
			},
			{
				name = "My EVB Pro io",
				localPairing = true,
				0 = {
					["io:ExteriorVenetianBlindWithWPIOComponent"] = {
						type = 1,
						widget = "PositionableExteriorVenetianBlindWithWP",
						uiClass = "ExteriorVenetianBlind",
						uiProfiles = ()[28],
						states = ()[713],
						attributes = ()[699],
						commands = ()[717]
					}
				}
			},
			{
				name = "My EVB Pro io",
				localPairing = true,
				0 = {
					["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
						type = 1,
						widget = "PositionableExteriorVenetianBlindWithWP2",
						uiClass = "ExteriorVenetianBlind",
						uiProfiles = ()[28],
						states = {
							16832512 = ()[69],
							17029120 = ()[211],
							84059651 = ()[708],
							65537 = {
								linkedHighLevelState = {
									()[325],
									()[5],
									()[12]
								},
								linkedStateIds = ()[705]
							},
							84059664 = ()[709],
							65540 = ()[710],
							84059658 = ()[711],
							84059659 = ()[712],
							2147426304 = ()[4],
							1 = ()[3],
							2146500645 = ()[57],
							16832522 = ()[70],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = ()[699],
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							unpairOneWayController = ()[24],
							getName = ()[14],
							delayedStopIdentify = ()[13],
							unpairAllOneWayControllers = ()[23],
							setClosureAndOrientation = ()[213],
							my = ()[214],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							stopIdentify = ()[22],
							runManufacturerSettingsCommand = ()[715],
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							up = ()[42],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[716],
							setOrientation = ()[215],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							identify = ()[15],
							refreshMemorized1Orientation = ()[481],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							wink = ()[26],
							pairOneWayController = ()[17],
							setMemorized1Orientation = ()[216]
						}
					}
				}
			},
			{
				name = "My EVB Pro io",
				localPairing = true,
				0 = {
					["io:ExteriorVenetianBlindIOComponent"] = {
						type = 1,
						widget = "PositionableExteriorVenetianBlind",
						uiClass = "ExteriorVenetianBlind",
						uiProfiles = ()[28],
						states = ()[713],
						attributes = ()[699],
						commands = ()[717]
					}
				}
			},
			{
				["io:RollerShutterGenericIOComponent"] = {
					type = 1,
					widget = "PositionableRollerShutter",
					uiClass = "RollerShutter",
					uiProfiles = ()[54],
					states = ()[506],
					attributes = ()[507],
					commands = {
						setName = ()[20],
						sendIOKey = ()[65],
						keepOneWayControllersAndDeleteNode = ()[61],
						unpairOneWayController = ()[24],
						getName = ()[14],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						delayedStopIdentify = ()[13],
						identify = ()[15],
						unpairAllOneWayControllers = ()[23],
						setSecuredPosition = ()[53],
						setPosition = ()[48],
						my = ()[51],
						setConfigState = ()[25],
						startIdentify = ()[21],
						stop = ()[63],
						setMemorized1Position = ()[47],
						stopIdentify = ()[22],
						wink = ()[26],
						runManufacturerSettingsCommand = {
							prototype = "string,object",
							parameters = ()[44],
							rawStates = ()[509],
							converter = ()[486],
							extraDefinition = ()[45]
						},
						setClosure = ()[38],
						close = ()[40],
						down = ()[40],
						open = ()[42],
						setDeployment = ()[38],
						up = ()[42],
						pairOneWayController = ()[17],
						refreshMemorized1Position = ()[37],
						advancedRefresh = ()[510]
					}
				}
			},
			{
				()[326]
			},
			{
				16832512 = ()[31],
				84082687 = {
					linkedHighLevelState = ()[722],
					linkedStateIds = ()[502]
				},
				65537 = {
					linkedHighLevelState = {
						()[326],
						()[5],
						()[12],
						()[10]
					},
					linkedStateIds = ()[633]
				},
				84059651 = {
					linkedHighLevelState = ()[722],
					linkedStateIds = ()[631]
				},
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				()[518],
				()[129],
				()[193]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[724],
				converter = ()[489],
				extraDefinition = ()[9]
			},
			{
				()[327]
			},
			{
				16832512 = ()[31],
				84082687 = {
					linkedHighLevelState = ()[726],
					linkedStateIds = ()[502]
				},
				65537 = {
					linkedHighLevelState = {
						()[327],
						()[5],
						()[12],
						()[10]
					},
					linkedStateIds = ()[633]
				},
				84059651 = {
					linkedHighLevelState = ()[726],
					linkedStateIds = ()[631]
				},
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[724],
				converter = ()[493],
				extraDefinition = ()[9]
			},
			{
				"16830720",
				"16832512",
				"16832522",
				"49020928"
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[57],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				{
					rawStateId = "49020928"
				},
				()[129]
			},
			{
				16832512 = ()[31],
				84082687 = {
					linkedHighLevelState = {
						()[331]
					},
					linkedStateIds = ()[243]
				},
				65537 = {
					linkedHighLevelState = {
						()[331],
						()[5],
						()[12],
						()[10]
					},
					linkedStateIds = ()[524]
				},
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[525],
				converter = ()[506],
				extraDefinition = ()[9]
			},
			{
				["io:RollerShutterGenericIOComponent"] = {
					type = 1,
					widget = "PositionableRollerShutter",
					uiClass = "RollerShutter",
					uiProfiles = ()[54],
					states = ()[732],
					attributes = ()[507],
					commands = {
						setName = ()[20],
						sendIOKey = ()[65],
						keepOneWayControllersAndDeleteNode = ()[61],
						unpairOneWayController = ()[24],
						getName = ()[14],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						delayedStopIdentify = ()[13],
						identify = ()[15],
						unpairAllOneWayControllers = ()[23],
						setSecuredPosition = ()[53],
						setPosition = ()[48],
						my = ()[51],
						setConfigState = ()[25],
						startIdentify = ()[21],
						stop = ()[63],
						setMemorized1Position = ()[47],
						stopIdentify = ()[22],
						wink = ()[26],
						runManufacturerSettingsCommand = {
							prototype = "string,object",
							parameters = ()[44],
							rawStates = ()[525],
							converter = ()[507],
							extraDefinition = ()[45]
						},
						setClosure = ()[38],
						close = ()[40],
						down = ()[40],
						open = ()[42],
						setDeployment = ()[38],
						up = ()[42],
						pairOneWayController = ()[17],
						refreshMemorized1Position = ()[37],
						advancedRefresh = ()[733]
					}
				}
			},
			{
				name = "Oximo io",
				localPairing = true,
				0 = ()[721]
			},
			{
				()[332]
			},
			{
				"48170496",
				"48171008",
				"65537"
			},
			{
				"16830720",
				"16832512",
				"16832522",
				"48170496",
				"48171008",
				"84082687"
			},
			{
				"48171008",
				"65537",
				"84082687"
			},
			{
				"48170496",
				"65537",
				"84082687"
			},
			{
				rawStateId = "48171008"
			},
			{
				()[518],
				()[129],
				()[677],
				()[741]
			},
			{
				()[333]
			},
			{
				"48171008",
				"65537"
			},
			{
				"16830720",
				"16832512",
				"16832522",
				"48171008",
				"84082687"
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[59],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				()[518],
				()[129],
				()[741]
			},
			{
				()[334]
			},
			{
				()[335]
			},
			{
				linkedHighLevelState = ()[749],
				linkedStateIds = ()[744]
			},
			{
				linkedHighLevelState = ()[749],
				linkedStateIds = ()[631]
			},
			{
				16832512 = ()[69],
				65537 = {
					linkedHighLevelState = {
						()[222],
						()[335],
						()[5],
						()[12]
					},
					linkedStateIds = {
						"48171008",
						"84082687"
					}
				},
				84082687 = ()[750],
				48171008 = ()[751],
				2147426304 = ()[4],
				1 = ()[3],
				2146500645 = ()[57],
				16832522 = ()[70],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[60],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[747],
				converter = ()[522],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[747],
				converter = ()[523],
				extraDefinition = ()[9]
			},
			{
				16832512 = ()[31],
				84082687 = ()[750],
				65537 = {
					linkedHighLevelState = {
						()[335],
						()[5],
						()[12],
						()[10],
						()[20]
					},
					linkedStateIds = ()[745]
				},
				48171008 = ()[751],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[754],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[755]
			},
			{
				16832512 = ()[31],
				84082687 = ()[750],
				65537 = {
					linkedHighLevelState = {
						()[335],
						()[5],
						()[12],
						()[10],
						()[280]
					},
					linkedStateIds = ()[745]
				},
				48171008 = ()[751],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[747],
				converter = ()[524],
				extraDefinition = ()[45]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[759],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[755]
			},
			{
				()[336]
			},
			{
				()[528],
				()[129],
				()[530],
				()[531],
				()[571],
				()[529],
				()[570],
				{
					rawStateId = "84058627"
				},
				()[543],
				()[563]
			},
			{
				name = "Rollixo Smart io",
				localPairing = true,
				0 = {
					["io:DiscreteGarageOpenerIOComponent"] = {
						type = 1,
						widget = "DiscretePositionableGarageDoor",
						uiClass = "GarageDoor",
						uiProfiles = ()[97],
						states = {
							84058662 = {
								linkedHighLevelState = ()[761],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058391",
									"84058399",
									"84058409",
									"84058420",
									"84058627",
									"84058697"
								}
							},
							65537 = {
								linkedHighLevelState = {
									()[336],
									()[22]
								},
								linkedStateIds = {
									"49217792",
									"84058368",
									"84058391",
									"84058399",
									"84058409",
									"84058420",
									"84058627",
									"84058662",
									"84058697"
								}
							},
							49217792 = {
								linkedHighLevelState = ()[761],
								linkedStateIds = {
									"65537",
									"84058368",
									"84058391",
									"84058399",
									"84058409",
									"84058420",
									"84058627",
									"84058662",
									"84058697"
								}
							},
							84058368 = {
								linkedHighLevelState = ()[761],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058391",
									"84058399",
									"84058409",
									"84058420",
									"84058627",
									"84058662",
									"84058697"
								}
							},
							84058420 = {
								linkedHighLevelState = ()[761],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058391",
									"84058399",
									"84058409",
									"84058627",
									"84058662",
									"84058697"
								}
							},
							84058391 = {
								linkedHighLevelState = ()[761],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058399",
									"84058409",
									"84058420",
									"84058627",
									"84058662",
									"84058697"
								}
							},
							84058697 = {
								linkedHighLevelState = ()[761],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058391",
									"84058399",
									"84058409",
									"84058420",
									"84058627",
									"84058662"
								}
							},
							84058627 = {
								linkedHighLevelState = ()[761],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058391",
									"84058399",
									"84058409",
									"84058420",
									"84058662",
									"84058697"
								}
							},
							84058399 = {
								linkedHighLevelState = ()[761],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058391",
									"84058409",
									"84058420",
									"84058627",
									"84058662",
									"84058697"
								}
							},
							84058409 = {
								linkedHighLevelState = ()[761],
								linkedStateIds = {
									"49217792",
									"65537",
									"84058368",
									"84058391",
									"84058399",
									"84058420",
									"84058627",
									"84058662",
									"84058697"
								}
							},
							2147426304 = ()[4],
							1 = ()[3],
							2 = ()[505],
							2146500638 = ()[1],
							2146500645 = ()[57]
						},
						attributes = {
							["core:SupportedManufacturerSettingsCommands"] = ()[62],
							["core:Manufacturer"] = ()[1],
							["core:FirmwareRevision"] = ()[0]
						},
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairOneWayController = ()[24],
							getName = ()[14],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							delayedStopIdentify = ()[13],
							identify = ()[15],
							unpairAllOneWayControllers = ()[23],
							down = ()[98],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							stopIdentify = ()[22],
							wink = ()[26],
							up = ()[99],
							runManufacturerSettingsCommand = {
								prototype = "string,object",
								parameters = ()[44],
								rawStates = ()[762],
								converter = ()[529],
								extraDefinition = ()[45]
							},
							close = ()[98],
							pairOneWayController = ()[17],
							open = ()[99],
							advancedRefresh = {
								prototype = "string(normal;advanced;custom),*array",
								parameters = ()[8],
								rawStates = ()[762],
								converter = ()[530],
								extraDefinition = ()[9]
							}
						}
					}
				}
			},
			{
				()[337]
			},
			{
				"65537",
				"84059671"
			},
			{
				linkedHighLevelState = ()[764],
				linkedStateIds = ()[765]
			},
			{
				"16830720",
				"16832512",
				"16832522",
				"84059651",
				"84059671"
			},
			{
				linkedHighLevelState = {
					()[337],
					()[5],
					()[12],
					()[10]
				},
				linkedStateIds = ()[767]
			},
			{
				linkedHighLevelState = ()[764],
				linkedStateIds = ()[502]
			},
			{
				16832512 = ()[31],
				84059651 = ()[766],
				65537 = ()[768],
				84059671 = ()[769],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				()[193],
				()[129],
				{
					rawStateId = "84059671"
				}
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[771],
				converter = ()[534],
				extraDefinition = ()[9]
			},
			{
				name = "S&SO - RS100 AIR",
				localPairing = true,
				0 = {
					["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
						type = 1,
						widget = "PositionableRollerShutterWithLowSpeedManagement",
						uiClass = "RollerShutter",
						uiProfiles = ()[54],
						states = ()[770],
						attributes = {
							["core:SupportedManufacturerSettingsCommands"] = ()[63],
							["core:Manufacturer"] = ()[1],
							["core:FirmwareRevision"] = ()[0]
						},
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							unpairOneWayController = ()[24],
							getName = ()[14],
							delayedStopIdentify = ()[13],
							unpairAllOneWayControllers = ()[23],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							my = ()[51],
							setPositionAndLinearSpeed = ()[422],
							stopIdentify = ()[22],
							runManufacturerSettingsCommand = {
								prototype = "string,object",
								parameters = ()[44],
								rawStates = ()[771],
								converter = ()[533],
								extraDefinition = ()[45]
							},
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							setDeployment = ()[38],
							up = ()[42],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[772],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							identify = ()[15],
							setClosureAndLinearSpeed = ()[421],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							wink = ()[26],
							pairOneWayController = ()[17]
						}
					}
				}
			},
			{
				()[338]
			},
			{
				["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
					type = 1,
					widget = "PositionableRollerShutterWithLowSpeedManagement",
					uiClass = "RollerShutter",
					uiProfiles = ()[54],
					states = {
						16832512 = ()[31],
						84059651 = {
							linkedHighLevelState = ()[774],
							linkedStateIds = ()[765]
						},
						65537 = {
							linkedHighLevelState = {
								()[338],
								()[5],
								()[12],
								()[10]
							},
							linkedStateIds = ()[767]
						},
						84059671 = {
							linkedHighLevelState = ()[774],
							linkedStateIds = ()[502]
						},
						2147426304 = ()[4],
						1 = ()[3],
						65557 = ()[36],
						2146500645 = ()[57],
						16830720 = ()[35],
						16832522 = ()[504],
						2 = ()[505],
						2146500638 = ()[1]
					},
					attributes = {
						["core:SupportedManufacturerSettingsCommands"] = ()[64],
						["core:Manufacturer"] = ()[1],
						["core:FirmwareRevision"] = ()[0]
					},
					commands = {
						setName = ()[20],
						sendIOKey = ()[65],
						unpairOneWayController = ()[24],
						getName = ()[14],
						delayedStopIdentify = ()[13],
						unpairAllOneWayControllers = ()[23],
						setSecuredPosition = ()[53],
						setPosition = ()[48],
						my = ()[51],
						setPositionAndLinearSpeed = ()[422],
						stopIdentify = ()[22],
						runManufacturerSettingsCommand = {
							prototype = "string,object",
							parameters = ()[44],
							rawStates = ()[771],
							converter = ()[537],
							extraDefinition = ()[45]
						},
						setClosure = ()[38],
						close = ()[40],
						down = ()[40],
						open = ()[42],
						setDeployment = ()[38],
						up = ()[42],
						refreshMemorized1Position = ()[37],
						advancedRefresh = {
							prototype = "string(normal;advanced;custom),*array",
							parameters = ()[8],
							rawStates = ()[771],
							converter = ()[538],
							extraDefinition = ()[9]
						},
						keepOneWayControllersAndDeleteNode = ()[61],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						identify = ()[15],
						setClosureAndLinearSpeed = ()[421],
						setConfigState = ()[25],
						startIdentify = ()[21],
						stop = ()[63],
						setMemorized1Position = ()[47],
						wink = ()[26],
						pairOneWayController = ()[17]
					}
				}
			},
			{
				name = "S&SO - RS100 io",
				localPairing = true,
				0 = ()[775]
			},
			{
				["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
					type = 1,
					widget = "PositionableRollerShutterWithLowSpeedManagement",
					uiClass = "RollerShutter",
					uiProfiles = ()[54],
					states = ()[770],
					attributes = {
						["core:SupportedManufacturerSettingsCommands"] = ()[65],
						["core:Manufacturer"] = ()[1],
						["core:FirmwareRevision"] = ()[0]
					},
					commands = {
						setName = ()[20],
						sendIOKey = ()[65],
						unpairOneWayController = ()[24],
						getName = ()[14],
						delayedStopIdentify = ()[13],
						unpairAllOneWayControllers = ()[23],
						setSecuredPosition = ()[53],
						setPosition = ()[48],
						my = ()[51],
						setPositionAndLinearSpeed = ()[422],
						stopIdentify = ()[22],
						runManufacturerSettingsCommand = {
							prototype = "string,object",
							parameters = ()[44],
							rawStates = ()[771],
							converter = ()[540],
							extraDefinition = ()[45]
						},
						setClosure = ()[38],
						close = ()[40],
						down = ()[40],
						open = ()[42],
						setDeployment = ()[38],
						up = ()[42],
						refreshMemorized1Position = ()[37],
						advancedRefresh = ()[772],
						keepOneWayControllersAndDeleteNode = ()[61],
						unpairAllOneWayControllersAndDeleteNode = ()[64],
						identify = ()[15],
						setClosureAndLinearSpeed = ()[421],
						setConfigState = ()[25],
						startIdentify = ()[21],
						stop = ()[63],
						setMemorized1Position = ()[47],
						wink = ()[26],
						pairOneWayController = ()[17]
					}
				}
			},
			{
				name = "S&SO - RS100 io",
				localPairing = true,
				0 = ()[777]
			},
			{
				name = "S&SO - RS100 ioHybrid",
				localPairing = true,
				0 = ()[775]
			},
			{
				name = "S&SO - RS100 ioHybrid",
				localPairing = true,
				0 = ()[777]
			},
			{
				()[339]
			},
			{
				name = "S&SO - RS100 ioHybrid",
				localPairing = true,
				0 = {
					["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
						type = 1,
						widget = "PositionableRollerShutterWithLowSpeedManagement",
						uiClass = "RollerShutter",
						uiProfiles = ()[54],
						states = {
							16832512 = ()[31],
							84059651 = {
								linkedHighLevelState = ()[781],
								linkedStateIds = ()[765]
							},
							65537 = {
								linkedHighLevelState = {
									()[339],
									()[5],
									()[12],
									()[10]
								},
								linkedStateIds = ()[767]
							},
							84059671 = {
								linkedHighLevelState = ()[781],
								linkedStateIds = ()[502]
							},
							2147426304 = ()[4],
							1 = ()[3],
							65557 = ()[36],
							2146500645 = ()[57],
							16830720 = ()[35],
							16832522 = ()[504],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = {
							["core:SupportedManufacturerSettingsCommands"] = ()[66],
							["core:Manufacturer"] = ()[1],
							["core:FirmwareRevision"] = ()[0]
						},
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							unpairOneWayController = ()[24],
							getName = ()[14],
							delayedStopIdentify = ()[13],
							unpairAllOneWayControllers = ()[23],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							my = ()[51],
							setPositionAndLinearSpeed = ()[422],
							stopIdentify = ()[22],
							runManufacturerSettingsCommand = {
								prototype = "string,object",
								parameters = ()[44],
								rawStates = ()[771],
								converter = ()[543],
								extraDefinition = ()[45]
							},
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							setDeployment = ()[38],
							up = ()[42],
							refreshMemorized1Position = ()[37],
							advancedRefresh = {
								prototype = "string(normal;advanced;custom),*array",
								parameters = ()[8],
								rawStates = ()[771],
								converter = ()[544],
								extraDefinition = ()[9]
							},
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							identify = ()[15],
							setClosureAndLinearSpeed = ()[421],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							wink = ()[26],
							pairOneWayController = ()[17]
						}
					}
				}
			},
			{
				()[340]
			},
			{
				linkedHighLevelState = ()[783],
				linkedStateIds = {
					"84059668",
					"84059669"
				}
			},
			{
				linkedHighLevelState = ()[783],
				linkedStateIds = {
					"84059649",
					"84059669"
				}
			},
			{
				linkedHighLevelState = ()[783],
				linkedStateIds = {
					"84059649",
					"84059668"
				}
			},
			{
				16832512 = ()[31],
				84059651 = ()[766],
				65537 = ()[768],
				84059671 = ()[769],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				65556 = ()[260],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				84059649 = ()[784],
				84059668 = ()[785],
				84059669 = ()[786],
				2146500638 = ()[1],
				67362619648 = ()[496]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[771],
				converter = ()[547],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[771],
				converter = ()[548],
				extraDefinition = ()[9]
			},
			{
				name = "S&SO - RS100 solar io",
				localPairing = true,
				1 = {
					["io:DynamicRollerShutterIOComponent"] = {
						type = 1,
						widget = "DynamicRollerShutter",
						uiClass = "RollerShutter",
						uiProfiles = ()[54],
						states = ()[787],
						attributes = {
							["core:SupportedManufacturerSettingsCommands"] = ()[67],
							["core:Manufacturer"] = ()[1],
							["core:FirmwareRevision"] = ()[0],
							["io:Features"] = ()[37]
						},
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							unpairOneWayController = ()[24],
							getName = ()[14],
							delayedStopIdentify = ()[13],
							unpairAllOneWayControllers = ()[23],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							my = ()[51],
							setPositionAndLinearSpeed = ()[422],
							stopIdentify = ()[22],
							runManufacturerSettingsCommand = ()[788],
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							setDeployment = ()[38],
							up = ()[42],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[789],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							identify = ()[15],
							setClosureAndLinearSpeed = ()[421],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							wink = ()[26],
							pairOneWayController = ()[17]
						}
					}
				},
				2 = ()[497]
			},
			{
				16832512 = ()[31],
				84059651 = ()[766],
				65537 = ()[768],
				84059671 = ()[769],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				84059649 = ()[784],
				84059668 = ()[785],
				84059669 = ()[786],
				2146500638 = ()[1]
			},
			{
				name = "S&SO - RS100 solar io",
				localPairing = true,
				0 = {
					["io:RollerShutterGenericIOComponent"] = {
						type = 1,
						widget = "PositionableRollerShutter",
						uiClass = "RollerShutter",
						uiProfiles = ()[54],
						states = ()[791],
						attributes = {
							["core:SupportedManufacturerSettingsCommands"] = ()[67],
							["core:Manufacturer"] = ()[1],
							["core:FirmwareRevision"] = ()[0]
						},
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairOneWayController = ()[24],
							getName = ()[14],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							delayedStopIdentify = ()[13],
							identify = ()[15],
							unpairAllOneWayControllers = ()[23],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							my = ()[51],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							stopIdentify = ()[22],
							wink = ()[26],
							runManufacturerSettingsCommand = ()[788],
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							setDeployment = ()[38],
							up = ()[42],
							pairOneWayController = ()[17],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[789]
						}
					}
				}
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[771],
				converter = ()[550],
				extraDefinition = ()[45]
			},
			{
				name = "S&SO - RS100 solar io",
				localPairing = true,
				1 = {
					["io:DynamicRollerShutterIOComponent"] = {
						type = 1,
						widget = "DynamicRollerShutter",
						uiClass = "RollerShutter",
						uiProfiles = ()[54],
						states = ()[787],
						attributes = {
							["core:SupportedManufacturerSettingsCommands"] = ()[68],
							["core:Manufacturer"] = ()[1],
							["core:FirmwareRevision"] = ()[0],
							["io:Features"] = ()[37]
						},
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							unpairOneWayController = ()[24],
							getName = ()[14],
							delayedStopIdentify = ()[13],
							unpairAllOneWayControllers = ()[23],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							my = ()[51],
							setPositionAndLinearSpeed = ()[422],
							stopIdentify = ()[22],
							runManufacturerSettingsCommand = ()[793],
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							setDeployment = ()[38],
							up = ()[42],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[789],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							identify = ()[15],
							setClosureAndLinearSpeed = ()[421],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							wink = ()[26],
							pairOneWayController = ()[17]
						}
					}
				},
				2 = ()[497]
			},
			{
				name = "S&SO - RS100 solar io",
				localPairing = true,
				0 = {
					["io:RollerShutterGenericIOComponent"] = {
						type = 1,
						widget = "PositionableRollerShutter",
						uiClass = "RollerShutter",
						uiProfiles = ()[54],
						states = ()[791],
						attributes = {
							["core:SupportedManufacturerSettingsCommands"] = ()[68],
							["core:Manufacturer"] = ()[1],
							["core:FirmwareRevision"] = ()[0]
						},
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairOneWayController = ()[24],
							getName = ()[14],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							delayedStopIdentify = ()[13],
							identify = ()[15],
							unpairAllOneWayControllers = ()[23],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							my = ()[51],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							stopIdentify = ()[22],
							wink = ()[26],
							runManufacturerSettingsCommand = ()[793],
							setClosure = ()[38],
							close = ()[40],
							down = ()[40],
							open = ()[42],
							setDeployment = ()[38],
							up = ()[42],
							pairOneWayController = ()[17],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[789]
						}
					}
				}
			},
			{
				rawStateId = "84059666"
			},
			{
				()[193],
				()[129],
				()[796]
			},
			{
				()[342]
			},
			{
				()[193],
				()[129],
				()[796],
				()[678]
			},
			{
				name = "Sliding window V1",
				localPairing = true,
				0 = {
					["io:PositionableAndLockableSlidingWindowComponent"] = {
						type = 1,
						widget = "PositionableAndLockableSlidingWindow",
						uiClass = "Window",
						uiProfiles = ()[241],
						states = {
							84059651 = {
								linkedHighLevelState = {
									()[74],
									()[342],
									()[71],
									()[72],
									()[73],
									()[75]
								},
								linkedStateIds = {
									"65537",
									"84059658",
									"84059666"
								}
							},
							16832512 = ()[69],
							65537 = {
								linkedHighLevelState = {
									()[342],
									()[5],
									()[70]
								},
								linkedStateIds = {
									"65801",
									"84059651",
									"84059658",
									"84059666"
								}
							},
							84059666 = {
								linkedHighLevelState = ()[798],
								linkedStateIds = {
									"65537",
									"84059651",
									"84059658"
								}
							},
							84059658 = {
								linkedHighLevelState = ()[798],
								linkedStateIds = {
									"65537",
									"84059651",
									"84059666"
								}
							},
							2147426304 = ()[4],
							1 = ()[3],
							2146500645 = ()[57],
							65546 = ()[242],
							2 = ()[505],
							65801 = ()[244],
							2146500638 = ()[1]
						},
						attributes = {
							["core:SupportedManufacturerSettingsCommands"] = ()[70],
							["core:Manufacturer"] = ()[1],
							["core:FirmwareRevision"] = ()[0]
						},
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							unpairOneWayController = ()[24],
							getName = ()[14],
							delayedStopIdentify = ()[13],
							unpairAllOneWayControllers = ()[23],
							setPosition = ()[248],
							my = ()[240],
							setPositionAndLinearSpeed = ()[249],
							stopIdentify = ()[22],
							deactivateTimer = ()[246],
							lock = ()[247],
							runManufacturerSettingsCommand = {
								prototype = "string,object",
								parameters = ()[44],
								rawStates = ()[799],
								converter = ()[557],
								extraDefinition = ()[45]
							},
							setClosure = ()[19],
							close = ()[237],
							open = ()[238],
							refreshMemorized1Position = ()[37],
							advancedRefresh = {
								prototype = "string(normal;advanced;custom),*array",
								parameters = ()[8],
								rawStates = ()[799],
								converter = ()[558],
								extraDefinition = ()[9]
							},
							activateTimer = ()[245],
							keepOneWayControllersAndDeleteNode = ()[61],
							unlock = ()[250],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							identify = ()[15],
							setClosureAndLinearSpeed = ()[239],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							wink = ()[26],
							setTimer = ()[196],
							pairOneWayController = ()[17]
						}
					}
				}
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[71],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[509],
				converter = ()[560],
				extraDefinition = ()[45]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				setDeployment = ()[38],
				close = ()[42],
				deploy = ()[40],
				down = ()[40],
				open = ()[40],
				setClosure = ()[201],
				undeploy = ()[42],
				up = ()[42],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[802],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[510]
			},
			{
				()[343]
			},
			{
				linkedHighLevelState = ()[804],
				linkedStateIds = ()[499]
			},
			{
				linkedHighLevelState = ()[804],
				linkedStateIds = ()[502]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[802],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[510]
			},
			{
				16832512 = ()[31],
				84059651 = ()[805],
				65537 = {
					linkedHighLevelState = {
						()[343],
						()[5],
						()[12],
						()[10],
						()[20]
					},
					linkedStateIds = ()[501]
				},
				84059661 = ()[806],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				()[344]
			},
			{
				"65537",
				"84059657",
				"84059659",
				"84059661"
			},
			{
				linkedHighLevelState = ()[809],
				linkedStateIds = ()[810]
			},
			{
				"16830720",
				"16832512",
				"16832522",
				"84059651",
				"84059657",
				"84059659",
				"84059661"
			},
			{
				linkedHighLevelState = {
					()[344],
					()[10]
				},
				linkedStateIds = ()[812]
			},
			{
				"65537",
				"84059651",
				"84059657",
				"84059659"
			},
			{
				linkedHighLevelState = ()[809],
				linkedStateIds = ()[814]
			},
			{
				"65537",
				"84059651",
				"84059659",
				"84059661"
			},
			{
				linkedHighLevelState = ()[809],
				linkedStateIds = ()[816]
			},
			{
				"65537",
				"84059651",
				"84059657",
				"84059661"
			},
			{
				linkedHighLevelState = ()[809],
				linkedStateIds = ()[818]
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[72],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				()[193],
				()[129],
				()[508],
				{
					rawStateId = "84059657"
				},
				()[700]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[821],
				converter = ()[563],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[821],
				converter = ()[564],
				extraDefinition = ()[9]
			},
			{
				()[345]
			},
			{
				linkedHighLevelState = ()[824],
				linkedStateIds = ()[810]
			},
			{
				linkedHighLevelState = ()[824],
				linkedStateIds = ()[814]
			},
			{
				linkedHighLevelState = ()[824],
				linkedStateIds = ()[816]
			},
			{
				linkedHighLevelState = ()[824],
				linkedStateIds = ()[818]
			},
			{
				16832512 = ()[31],
				84059651 = ()[825],
				65537 = {
					linkedHighLevelState = {
						()[345],
						()[5],
						()[12],
						()[10],
						()[20]
					},
					linkedStateIds = ()[812]
				},
				84059661 = ()[826],
				84059657 = ()[827],
				84059659 = ()[828],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[822],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[823]
			},
			{
				()[346]
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[73],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				()[193],
				()[129],
				()[677],
				()[741]
			},
			{
				()[347]
			},
			{
				"48170496",
				"48171008",
				"65537",
				"84059664"
			},
			{
				"16830720",
				"16832512",
				"16832522",
				"48170496",
				"48171008",
				"84059651",
				"84059664"
			},
			{
				"48171008",
				"65537",
				"84059651",
				"84059664"
			},
			{
				"48170496",
				"48171008",
				"65537",
				"84059651"
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[74],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				()[193],
				()[129],
				()[677],
				()[741],
				()[679]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[840],
				converter = ()[571],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[840],
				converter = ()[572],
				extraDefinition = ()[9]
			},
			{
				()[348]
			},
			{
				linkedHighLevelState = ()[843],
				linkedStateIds = ()[835]
			},
			{
				linkedHighLevelState = ()[843],
				linkedStateIds = ()[837]
			},
			{
				linkedHighLevelState = ()[843],
				linkedStateIds = ()[672]
			},
			{
				linkedHighLevelState = ()[843],
				linkedStateIds = ()[838]
			},
			{
				16832512 = ()[31],
				84059651 = ()[844],
				65537 = {
					linkedHighLevelState = {
						()[348],
						()[5],
						()[12],
						()[10],
						()[20]
					},
					linkedStateIds = ()[836]
				},
				48170496 = ()[845],
				48171008 = ()[846],
				84059664 = ()[847],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[841],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[842]
			},
			{
				()[349]
			},
			{
				linkedHighLevelState = ()[850],
				linkedStateIds = {
					"48171008",
					"65537",
					"84059659",
					"84059664"
				}
			},
			{
				"16830720",
				"16832512",
				"16832522",
				"48171008",
				"84059651",
				"84059659",
				"84059664"
			},
			{
				linkedHighLevelState = {
					()[349],
					()[5],
					()[12],
					()[10],
					()[20]
				},
				linkedStateIds = ()[852]
			},
			{
				linkedHighLevelState = ()[850],
				linkedStateIds = ()[837]
			},
			{
				linkedHighLevelState = ()[850],
				linkedStateIds = {
					"65537",
					"84059651",
					"84059659",
					"84059664"
				}
			},
			{
				linkedHighLevelState = ()[850],
				linkedStateIds = {
					"48171008",
					"65537",
					"84059651",
					"84059659"
				}
			},
			{
				16832512 = ()[31],
				84059651 = ()[851],
				65537 = ()[853],
				84059659 = ()[854],
				48171008 = ()[855],
				84059664 = ()[856],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				65556 = ()[260],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				()[193],
				()[129],
				()[700],
				()[741],
				()[679]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ()[44],
					rawStates = ()[858],
					converter = ()[574],
					extraDefinition = ()[45]
				},
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = {
					prototype = "string(normal;advanced;custom),*array",
					parameters = ()[8],
					rawStates = ()[858],
					converter = ()[575],
					extraDefinition = ()[9]
				}
			},
			{
				name = "Sunea 40 solar io",
				localPairing = true,
				0 = {
					["io:PergolaSideScreenWithBatteryIOComponent"] = {
						type = 1,
						widget = "PergolaSideScreen",
						uiClass = "Pergola",
						uiProfiles = ()[479],
						states = ()[857],
						attributes = ()[839],
						commands = ()[859]
					}
				}
			},
			{
				name = "Sunea 40 solar io",
				localPairing = true,
				0 = {
					["io:AwningValanceWithBatteryIOComponent"] = {
						type = 1,
						widget = "AwningValance",
						uiClass = "Awning",
						uiProfiles = ()[487],
						states = ()[857],
						attributes = ()[839],
						commands = ()[859]
					}
				}
			},
			{
				linkedHighLevelState = {
					()[349],
					()[5],
					()[12],
					()[10],
					()[280]
				},
				linkedStateIds = ()[852]
			},
			{
				name = "Sunea 40 solar io",
				localPairing = true,
				0 = {
					["io:DropArmAwningWithBatteryIOComponent"] = {
						type = 1,
						widget = "DropArmAwning",
						uiClass = "Awning",
						uiProfiles = ()[483],
						states = {
							16832512 = ()[31],
							84059651 = ()[851],
							65537 = ()[862],
							84059659 = ()[854],
							48171008 = ()[855],
							84059664 = ()[856],
							2147426304 = ()[4],
							1 = ()[3],
							65557 = ()[36],
							65556 = ()[260],
							2146500645 = ()[57],
							16830720 = ()[35],
							16832522 = ()[504],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = ()[839],
						commands = ()[859]
					}
				}
			},
			{
				name = "Sunea 40 solar io",
				localPairing = true,
				0 = {
					["io:VerticalExteriorAwningWithBatteryIOComponent"] = {
						type = 1,
						widget = "PositionableScreen",
						uiClass = "ExteriorScreen",
						uiProfiles = ()[87],
						states = ()[857],
						attributes = ()[839],
						commands = ()[859]
					}
				}
			},
			{
				16832512 = ()[31],
				84059651 = ()[851],
				65537 = ()[853],
				84059659 = ()[854],
				48171008 = ()[855],
				84059664 = ()[856],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				name = "Sunea 40 solar io",
				localPairing = true,
				0 = {
					["io:PergolaSideScreenIOComponent"] = {
						type = 1,
						widget = "PergolaSideScreen",
						uiClass = "Pergola",
						uiProfiles = ()[479],
						states = ()[865],
						attributes = ()[839],
						commands = ()[859]
					}
				}
			},
			{
				name = "Sunea 40 solar io",
				localPairing = true,
				0 = {
					["io:DropArmAwningIOComponent"] = {
						type = 1,
						widget = "DropArmAwning",
						uiClass = "Awning",
						uiProfiles = ()[483],
						states = {
							16832512 = ()[31],
							84059651 = ()[851],
							65537 = ()[862],
							84059659 = ()[854],
							48171008 = ()[855],
							84059664 = ()[856],
							2147426304 = ()[4],
							1 = ()[3],
							65557 = ()[36],
							2146500645 = ()[57],
							16830720 = ()[35],
							16832522 = ()[504],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = ()[839],
						commands = ()[859]
					}
				}
			},
			{
				name = "Sunea 40 solar io",
				localPairing = true,
				0 = {
					["io:AwningValanceIOComponent"] = {
						type = 1,
						widget = "AwningValance",
						uiClass = "Awning",
						uiProfiles = ()[487],
						states = ()[865],
						attributes = ()[839],
						commands = ()[859]
					}
				}
			},
			{
				()[350]
			},
			{
				linkedHighLevelState = ()[869],
				linkedStateIds = ()[737]
			},
			{
				linkedHighLevelState = ()[869],
				linkedStateIds = ()[739]
			},
			{
				linkedHighLevelState = ()[869],
				linkedStateIds = ()[740]
			},
			{
				16832512 = ()[31],
				84082687 = ()[870],
				65537 = {
					linkedHighLevelState = {
						()[350],
						()[51],
						()[10],
						()[20]
					},
					linkedStateIds = ()[738]
				},
				48170496 = ()[871],
				48171008 = ()[872],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[742],
				converter = ()[577],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[742],
				converter = ()[578],
				extraDefinition = ()[9]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[742],
				converter = ()[579],
				extraDefinition = ()[45]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[742],
				converter = ()[580],
				extraDefinition = ()[45]
			},
			{
				16832512 = ()[31],
				84082687 = ()[870],
				65537 = {
					linkedHighLevelState = {
						()[350],
						()[5],
						()[12],
						()[10],
						()[20]
					},
					linkedStateIds = ()[738]
				},
				48170496 = ()[871],
				48171008 = ()[872],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[874],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[875]
			},
			{
				16832512 = ()[31],
				84082687 = ()[870],
				65537 = {
					linkedHighLevelState = {
						()[350],
						()[5],
						()[12],
						()[10],
						()[280]
					},
					linkedStateIds = ()[738]
				},
				48170496 = ()[871],
				48171008 = ()[872],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[876],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[875]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[877],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[875]
			},
			{
				()[351]
			},
			{
				linkedHighLevelState = ()[883],
				linkedStateIds = ()[737]
			},
			{
				linkedHighLevelState = ()[883],
				linkedStateIds = ()[739]
			},
			{
				linkedHighLevelState = ()[883],
				linkedStateIds = ()[740]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[742],
				converter = ()[582],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[742],
				converter = ()[583],
				extraDefinition = ()[9]
			},
			{
				()[352]
			},
			{
				linkedHighLevelState = ()[889],
				linkedStateIds = ()[737]
			},
			{
				linkedHighLevelState = ()[889],
				linkedStateIds = ()[739]
			},
			{
				linkedHighLevelState = ()[889],
				linkedStateIds = ()[740]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[742],
				converter = ()[585],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[742],
				converter = ()[586],
				extraDefinition = ()[9]
			},
			{
				name = "Sunea,Sunea Screen",
				localPairing = true,
				0 = {
					["io:HorizontalAwningIOComponent"] = {
						type = 1,
						widget = "PositionableHorizontalAwning",
						uiClass = "Awning",
						uiProfiles = ()[199],
						states = {
							16832512 = ()[31],
							84082687 = ()[890],
							65537 = {
								linkedHighLevelState = {
									()[352],
									()[51],
									()[10],
									()[20]
								},
								linkedStateIds = ()[738]
							},
							48170496 = ()[891],
							48171008 = ()[892],
							2147426304 = ()[4],
							1 = ()[3],
							65557 = ()[36],
							2146500645 = ()[57],
							16830720 = ()[35],
							16832522 = ()[504],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = ()[832],
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairOneWayController = ()[24],
							getName = ()[14],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							delayedStopIdentify = ()[13],
							identify = ()[15],
							unpairAllOneWayControllers = ()[23],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							my = ()[51],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							stopIdentify = ()[22],
							setDeployment = ()[38],
							close = ()[42],
							deploy = ()[40],
							down = ()[40],
							open = ()[40],
							setClosure = ()[201],
							undeploy = ()[42],
							up = ()[42],
							wink = ()[26],
							runManufacturerSettingsCommand = ()[893],
							pairOneWayController = ()[17],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[894]
						}
					}
				}
			},
			{
				16832512 = ()[31],
				84082687 = ()[884],
				65537 = {
					linkedHighLevelState = {
						()[351],
						()[5],
						()[12],
						()[10],
						()[20]
					},
					linkedStateIds = ()[738]
				},
				48170496 = ()[885],
				48171008 = ()[886],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[887],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[888]
			},
			{
				16832512 = ()[31],
				84082687 = ()[890],
				65537 = {
					linkedHighLevelState = {
						()[352],
						()[5],
						()[12],
						()[10],
						()[20]
					},
					linkedStateIds = ()[738]
				},
				48170496 = ()[891],
				48171008 = ()[892],
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[893],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[894]
			},
			{
				name = "Sunea,Sunea Screen",
				localPairing = true,
				0 = {
					["io:VerticalExteriorAwningIOComponent"] = {
						type = 1,
						widget = "PositionableScreen",
						uiClass = "ExteriorScreen",
						uiProfiles = ()[87],
						states = ()[898],
						attributes = ()[832],
						commands = ()[899]
					}
				}
			},
			{
				name = "Sunea,Sunea Screen",
				localPairing = true,
				0 = {
					["io:PergolaSideScreenIOComponent"] = {
						type = 1,
						widget = "PergolaSideScreen",
						uiClass = "Pergola",
						uiProfiles = ()[479],
						states = ()[898],
						attributes = ()[832],
						commands = ()[899]
					}
				}
			},
			{
				name = "Sunea,Sunea Screen",
				localPairing = true,
				0 = {
					["io:DropArmAwningIOComponent"] = {
						type = 1,
						widget = "DropArmAwning",
						uiClass = "Awning",
						uiProfiles = ()[483],
						states = {
							16832512 = ()[31],
							84082687 = ()[890],
							65537 = {
								linkedHighLevelState = {
									()[352],
									()[5],
									()[12],
									()[10],
									()[280]
								},
								linkedStateIds = ()[738]
							},
							48170496 = ()[891],
							48171008 = ()[892],
							2147426304 = ()[4],
							1 = ()[3],
							65557 = ()[36],
							2146500645 = ()[57],
							16830720 = ()[35],
							16832522 = ()[504],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = ()[832],
						commands = ()[899]
					}
				}
			},
			{
				name = "Sunea,Sunea Screen",
				localPairing = true,
				0 = {
					["io:AwningValanceIOComponent"] = {
						type = 1,
						widget = "AwningValance",
						uiClass = "Awning",
						uiProfiles = ()[487],
						states = ()[898],
						attributes = ()[832],
						commands = ()[899]
					}
				}
			},
			{
				linkedHighLevelState = {
					()[353]
				},
				linkedStateIds = ()[243]
			},
			{
				16832512 = ()[31],
				84082687 = ()[904],
				65537 = {
					linkedHighLevelState = {
						()[353],
						()[51],
						()[10],
						()[20]
					},
					linkedStateIds = ()[524]
				},
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				["core:SupportedManufacturerSettingsCommands"] = ()[75],
				["core:Manufacturer"] = ()[1],
				["core:FirmwareRevision"] = ()[0]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[525],
				converter = ()[589],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[525],
				converter = ()[590],
				extraDefinition = ()[9]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[525],
				converter = ()[591],
				extraDefinition = ()[45]
			},
			{
				16832512 = ()[31],
				84082687 = ()[904],
				65537 = {
					linkedHighLevelState = {
						()[353],
						()[5],
						()[12],
						()[10],
						()[20]
					},
					linkedStateIds = ()[524]
				},
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[907],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[908]
			},
			{
				16832512 = ()[31],
				84082687 = ()[904],
				65537 = {
					linkedHighLevelState = {
						()[353],
						()[5],
						()[12],
						()[10],
						()[280]
					},
					linkedStateIds = ()[524]
				},
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[909],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[908]
			},
			{
				linkedHighLevelState = {
					()[354]
				},
				linkedStateIds = ()[243]
			},
			{
				prototype = "string,object",
				parameters = ()[44],
				rawStates = ()[525],
				converter = ()[593],
				extraDefinition = ()[45]
			},
			{
				prototype = "string(normal;advanced;custom),*array",
				parameters = ()[8],
				rawStates = ()[525],
				converter = ()[594],
				extraDefinition = ()[9]
			},
			{
				name = "Sunilus,Sunilus Screen io",
				localPairing = true,
				0 = {
					["io:HorizontalAwningIOComponent"] = {
						type = 1,
						widget = "PositionableHorizontalAwning",
						uiClass = "Awning",
						uiProfiles = ()[199],
						states = {
							16832512 = ()[31],
							84082687 = ()[914],
							65537 = {
								linkedHighLevelState = {
									()[354],
									()[51],
									()[10],
									()[20]
								},
								linkedStateIds = ()[524]
							},
							2147426304 = ()[4],
							1 = ()[3],
							65557 = ()[36],
							2146500645 = ()[57],
							16830720 = ()[35],
							16832522 = ()[504],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = ()[906],
						commands = {
							setName = ()[20],
							sendIOKey = ()[65],
							keepOneWayControllersAndDeleteNode = ()[61],
							unpairOneWayController = ()[24],
							getName = ()[14],
							unpairAllOneWayControllersAndDeleteNode = ()[64],
							delayedStopIdentify = ()[13],
							identify = ()[15],
							unpairAllOneWayControllers = ()[23],
							setSecuredPosition = ()[53],
							setPosition = ()[48],
							my = ()[51],
							setConfigState = ()[25],
							startIdentify = ()[21],
							stop = ()[63],
							setMemorized1Position = ()[47],
							stopIdentify = ()[22],
							setDeployment = ()[38],
							close = ()[42],
							deploy = ()[40],
							down = ()[40],
							open = ()[40],
							setClosure = ()[201],
							undeploy = ()[42],
							up = ()[42],
							wink = ()[26],
							runManufacturerSettingsCommand = ()[915],
							pairOneWayController = ()[17],
							refreshMemorized1Position = ()[37],
							advancedRefresh = ()[916]
						}
					}
				}
			},
			{
				16832512 = ()[31],
				84082687 = ()[914],
				65537 = {
					linkedHighLevelState = {
						()[354],
						()[5],
						()[12],
						()[10],
						()[20]
					},
					linkedStateIds = ()[524]
				},
				2147426304 = ()[4],
				1 = ()[3],
				65557 = ()[36],
				2146500645 = ()[57],
				16830720 = ()[35],
				16832522 = ()[504],
				2 = ()[505],
				2146500638 = ()[1]
			},
			{
				setName = ()[20],
				sendIOKey = ()[65],
				keepOneWayControllersAndDeleteNode = ()[61],
				unpairOneWayController = ()[24],
				getName = ()[14],
				unpairAllOneWayControllersAndDeleteNode = ()[64],
				delayedStopIdentify = ()[13],
				identify = ()[15],
				unpairAllOneWayControllers = ()[23],
				setSecuredPosition = ()[53],
				setPosition = ()[48],
				my = ()[51],
				setConfigState = ()[25],
				startIdentify = ()[21],
				stop = ()[63],
				setMemorized1Position = ()[47],
				stopIdentify = ()[22],
				wink = ()[26],
				runManufacturerSettingsCommand = ()[915],
				setClosure = ()[38],
				close = ()[40],
				deploy = ()[40],
				down = ()[40],
				open = ()[42],
				setDeployment = ()[38],
				undeploy = ()[42],
				up = ()[42],
				pairOneWayController = ()[17],
				refreshMemorized1Position = ()[37],
				advancedRefresh = ()[916]
			},
			{
				name = "Sunilus,Sunilus Screen io",
				localPairing = true,
				0 = {
					["io:VerticalExteriorAwningIOComponent"] = {
						type = 1,
						widget = "PositionableScreen",
						uiClass = "ExteriorScreen",
						uiProfiles = ()[87],
						states = ()[918],
						attributes = ()[906],
						commands = ()[919]
					}
				}
			},
			{
				name = "Sunilus,Sunilus Screen io",
				localPairing = true,
				0 = {
					["io:PergolaSideScreenIOComponent"] = {
						type = 1,
						widget = "PergolaSideScreen",
						uiClass = "Pergola",
						uiProfiles = ()[479],
						states = ()[918],
						attributes = ()[906],
						commands = ()[919]
					}
				}
			},
			{
				name = "Sunilus,Sunilus Screen io",
				localPairing = true,
				0 = {
					["io:DropArmAwningIOComponent"] = {
						type = 1,
						widget = "DropArmAwning",
						uiClass = "Awning",
						uiProfiles = ()[483],
						states = {
							16832512 = ()[31],
							84082687 = ()[914],
							65537 = {
								linkedHighLevelState = {
									()[354],
									()[5],
									()[12],
									()[10],
									()[280]
								},
								linkedStateIds = ()[524]
							},
							2147426304 = ()[4],
							1 = ()[3],
							65557 = ()[36],
							2146500645 = ()[57],
							16830720 = ()[35],
							16832522 = ()[504],
							2 = ()[505],
							2146500638 = ()[1]
						},
						attributes = ()[906],
						commands = ()[919]
					}
				}
			},
			{
				name = "Sunilus,Sunilus Screen io",
				localPairing = true,
				0 = {
					["io:AwningValanceIOComponent"] = {
						type = 1,
						widget = "AwningValance",
						uiClass = "Awning",
						uiProfiles = ()[487],
						states = ()[918],
						attributes = ()[906],
						commands = ()[919]
					}
				}
			},
			{
				name = "T3.5 BHZ",
				localPairing = true,
				0 = ()[721]
			},
			{
				()[355]
			}
		})[27]
	},
	65536 = {
		name = "Venetian Blind",
		localPairing = true,
		0 = {
			["io:VenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableVenetianBlind",
				uiClass = "VenetianBlind",
				uiProfiles = ()[28],
				states = {
					65537 = {
						linkedHighLevelState = {
							()[5],
							()[7],
							()[10]
						},
						linkedStateIds = ()[29]
					},
					2146500638 = ()[1],
					16832512 = ()[31],
					1 = ()[3],
					16832522 = ()[33],
					65538 = {
						linkedHighLevelState = {
							()[9]
						}
					},
					2147426304 = ()[4],
					16830720 = ()[35],
					65557 = ()[36]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					up = ()[42],
					setClosureAndOrientation = {
						prototype = "integer[0;100],integer[0;100]",
						parameters = ()[44],
						converter = ()[25],
						extraDefinition = ()[45]
					},
					setMemorized1Position = ()[47],
					setName = ()[20],
					setOrientation = {
						prototype = "integer[0;100]",
						parameters = ()[11],
						converter = ()[26],
						extraDefinition = ()[45]
					},
					setPosition = ()[48],
					my = ()[51],
					setSecuredPosition = ()[53],
					startIdentify = ()[21],
					stop = {
						converter = ()[28],
						extraDefinition = ()[45]
					},
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	131072 = {
		name = "Roller Shutter",
		localPairing = true,
		0 = ()[67]
	},
	131073 = {
		name = "Roller Shutter VELUX",
		localPairing = true,
		0 = {
			["io:RollerShutterVeluxIOComponent"] = {
				type = 1,
				widget = "PositionableTiltedRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = ()[71],
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					setMemorized1Position = ()[47],
					setName = ()[20],
					setPosition = ()[48],
					my = ()[51],
					setSecuredPosition = ()[53],
					startIdentify = ()[21],
					stop = ()[63],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	131074 = {
		name = "Roller Shutter SOMFY",
		localPairing = true,
		0 = ()[67]
	},
	131328 = {
		name = "Adjustable Slats Roller Shutter",
		localPairing = true,
		0 = ()[86]
	},
	131330 = {
		name = "Adj. Slats Roller Shutter SOMFY",
		localPairing = true,
		0 = ()[86]
	},
	131584 = {
		name = "Projection Roller Shutter",
		localPairing = true,
		0 = {
			["io:ProjectionRollerShutterIOComponent"] = {
				type = 1,
				widget = "PositionableProjectionRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = {
					65537 = ()[68],
					2146500638 = ()[1],
					16832512 = ()[69],
					1 = ()[3],
					65546 = {
						linkedHighLevelState = {
							()[19]
						}
					},
					16832522 = ()[70],
					2147426304 = ()[4]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					setClosureAndProjectionAngle = {
						prototype = "integer[0;100],integer[0;100]",
						parameters = ()[44],
						converter = ()[43],
						extraDefinition = ()[45]
					},
					setMemorized1Position = ()[47],
					setName = ()[20],
					setPosition = ()[48],
					my = ()[51],
					setProjectionAngle = {
						prototype = "any",
						parameters = ()[11],
						converter = ()[44],
						extraDefinition = ()[45]
					},
					setSecuredPosition = ()[53],
					startIdentify = ()[21],
					stop = {
						converter = ()[45],
						extraDefinition = ()[45]
					},
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	196608 = {
		name = "Vertical Exterior Awning",
		localPairing = true,
		0 = ()[91]
	},
	196609 = {
		name = "Vertical Exterior Awning Velux",
		localPairing = true,
		0 = {
			["io:VerticalExteriorAwningVeluxIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[87],
				states = {
					65537 = ()[88],
					2146500638 = ()[1],
					1 = ()[3],
					16832522 = ()[33],
					2147426304 = ()[4],
					16830720 = ()[35],
					16832512 = ()[74],
					65557 = ()[36],
					2 = ()[56],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					pairOneWayController = ()[17],
					setClosure = ()[38],
					close = ()[40],
					deploy = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					undeploy = ()[42],
					up = ()[42],
					setName = ()[20],
					setPosition = {
						prototype = "string(secured)|integer[0;100]",
						parameters = ()[11],
						converter = ()[46],
						extraDefinition = ()[18]
					},
					setSecuredPosition = ()[53],
					startIdentify = ()[21],
					stop = ()[63],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26],
					sendIOKey = ()[65]
				}
			}
		}
	},
	196610 = {
		name = "Vertical Exterior Awning SOMFY",
		localPairing = true,
		0 = ()[91]
	},
	262144 = {
		name = "Window Opener",
		localPairing = true,
		0 = {
			["io:WindowOpenerGenericIOComponent"] = {
				type = 1,
				widget = "PositionableWindow",
				uiClass = "Window",
				uiProfiles = ()[92],
				states = ()[93],
				attributes = ()[5],
				commands = ()[94]
			}
		}
	},
	262145 = {
		name = "Window Opener VELUX",
		localPairing = true,
		0 = ()[95]
	},
	262401 = {
		name = "Window Opener with integrated rain sensor VELUX",
		localPairing = true,
		0 = ()[95]
	},
	327680 = {
		name = "Garage Door Opener",
		localPairing = true,
		0 = ()[96]
	},
	327682 = {
		name = "Garage Door Opener SOMFY",
		localPairing = true,
		0 = ()[96]
	},
	342528 = {
		name = "Discrete Garage Door Opener",
		localPairing = true,
		0 = ()[100]
	},
	342530 = {
		name = "Discrete Garage Door Opener SOMFY",
		localPairing = true,
		0 = ()[100]
	},
	393216 = {
		name = "Dimmable Light",
		localPairing = true,
		0 = ()[115]
	},
	393218 = {
		name = "Dimmable Light - Somfy",
		localPairing = true,
		0 = ()[115]
	},
	393471 = {
		name = "FirstInnov Swimming Pool",
		localPairing = true,
		0 = {
			["io:SwimmingPoolIOComponent"] = {
				type = 1,
				widget = "SwimmingPool",
				uiClass = "SwimmingPool",
				uiProfiles = {
					"SwitchableLight",
					"StatefulSwitchable",
					"Switchable"
				},
				states = ()[116],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					setName = ()[20],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = ()[11],
						converter = ()[60],
						extraDefinition = ()[18]
					},
					off = {
						parameters = ()[117],
						converter = ()[60],
						extraDefinition = ()[18]
					},
					on = {
						parameters = ()[118],
						converter = ()[60],
						extraDefinition = ()[18]
					},
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					wink = ()[26]
				}
			}
		}
	},
	393472 = {
		name = "Dimmable RGB Light",
		localPairing = true,
		0 = ()[127]
	},
	393474 = {
		name = "Dimmable RGB Light Somfy",
		localPairing = true,
		0 = ()[127]
	},
	393730 = {
		name = "Tunable White Receiver",
		localPairing = true,
		0 = ()[132]
	},
	408064 = {
		name = "On/Off Light",
		localPairing = true,
		0 = ()[140]
	},
	408066 = {
		name = "On/Off Light - Somfy",
		localPairing = true,
		0 = ()[140]
	},
	2199023663618 = {
		name = "On/Off Light - Somfy  - With battery status",
		localPairing = true,
		0 = {
			["io:OnOffLightMicroModuleSomfyIOComponent"] = ()[139]
		}
	},
	458752 = {
		name = "Gate Opener",
		localPairing = true,
		0 = ()[148]
	},
	458754 = {
		name = "Gate Opener Wardrobe SOMFY",
		localPairing = true,
		0 = ()[148]
	},
	473600 = {
		name = "Discrete Gate Opener",
		localPairing = true,
		0 = ()[152]
	},
	473602 = {
		name = "Discrete Gate Opener SOMFY",
		localPairing = true,
		0 = ()[152]
	},
	524288 = {
		name = "Rolling Door Opener",
		localPairing = true,
		0 = ()[155]
	},
	524290 = {
		name = "Rolling Door Opener SOMFY",
		localPairing = true,
		0 = ()[155]
	},
	589824 = {
		name = "Door Lock",
		localPairing = true,
		0 = ()[163]
	},
	589826 = {
		name = "Door Lock SOMFY",
		localPairing = true,
		0 = ()[163]
	},
	590080 = {
		name = "Window Lock",
		localPairing = true,
		0 = ()[166]
	},
	590090 = {
		name = "Window Lock SECUYOU",
		localPairing = true,
		0 = ()[166]
	},
	655360 = {
		name = "Vertical Blind",
		localPairing = true,
		0 = ()[169]
	},
	655361 = {
		name = "Blind VELUX",
		localPairing = true,
		0 = {
			["io:VerticalInteriorBlindVeluxIOComponent"] = {
				type = 1,
				widget = "PositionableTiltedScreen",
				uiClass = "Screen",
				uiProfiles = ()[167],
				states = ()[71],
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					up = ()[42],
					setMemorized1Position = ()[47],
					setName = ()[20],
					setPosition = ()[48],
					my = ()[51],
					setSecuredPosition = ()[53],
					startIdentify = ()[21],
					stop = ()[63],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	655362 = {
		name = "Sonesse 40",
		localPairing = true,
		0 = ()[169]
	},
	851968 = {
		name = "Dual Roller Shutter",
		localPairing = true,
		0 = {
			["io:DualRollerShutterIOComponent"] = {
				type = 1,
				widget = "PositionableDualRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = {
					65537 = ()[153],
					2146500638 = ()[1],
					65539 = {
						linkedHighLevelState = {
							()[38],
							()[39]
						}
					},
					16832512 = ()[69],
					1 = ()[3],
					16832522 = ()[70],
					2147426304 = ()[4],
					65538 = {
						linkedHighLevelState = {
							()[40],
							()[41]
						}
					}
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getClosure = ()[158],
					getLowerClosure = {
						extraDefinition = {
							access = "r",
							parameterId = "65539"
						}
					},
					getName = ()[14],
					getUpperClosure = {
						extraDefinition = {
							access = "r",
							parameterId = "65538"
						}
					},
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					up = ()[42],
					setLowerClosure = ()[170],
					lowerClose = ()[171],
					lowerDown = ()[171],
					lowerOpen = ()[172],
					lowerUp = ()[172],
					setLowerPosition = ()[170],
					setMemorized1Position = ()[47],
					setName = ()[20],
					setPosition = ()[48],
					my = ()[51],
					setSecuredPosition = ()[53],
					setUpperAndLowerClosure = ()[173],
					setUpperAndLowerPosition = ()[173],
					setUpperClosure = ()[174],
					upperClose = ()[175],
					upperDown = ()[175],
					upperOpen = ()[176],
					upperUp = ()[176],
					setUpperPosition = ()[174],
					startIdentify = ()[21],
					stop = ()[63],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	917504 = {
		name = "Heating Temperature Interface",
		localPairing = true,
		0 = {
			["io:HeatingTemperatureInterfaceIOComponent"] = {
				type = 1,
				widget = "HeatingTemperatureInterface",
				uiClass = "HeatingSystem",
				uiProfiles = ()[177],
				states = {
					16832527 = {
						linkedHighLevelState = {
							()[42],
							()[45]
						},
						linkedStateIds = {
							"16830720",
							"16832522",
							"16832526",
							"65558",
							"65559"
						}
					},
					65558 = {
						linkedHighLevelState = ()[178],
						linkedStateIds = {
							"16830720",
							"16832522",
							"16832526",
							"16832527",
							"65537",
							"65559"
						}
					},
					65559 = {
						linkedHighLevelState = ()[178],
						linkedStateIds = {
							"16830720",
							"16832522",
							"16832526",
							"16832527",
							"65537",
							"65558"
						}
					},
					2146500638 = ()[1],
					16832526 = {
						linkedHighLevelState = {
							()[43],
							()[45]
						},
						linkedStateIds = {
							"16830720",
							"16832522",
							"16832527",
							"65558",
							"65559"
						}
					},
					1 = ()[3],
					16832522 = {
						linkedHighLevelState = {
							()[44],
							()[45]
						},
						linkedStateIds = {
							"16830720",
							"16832526",
							"16832527",
							"65558",
							"65559"
						}
					},
					2147426304 = ()[4],
					16830720 = {
						linkedHighLevelState = {
							()[45],
							()[47]
						},
						linkedStateIds = {
							"16832522",
							"16832526",
							"16832527",
							"65558",
							"65559"
						}
					},
					65537 = ()[179]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshActiveMode = {
						extraDefinition = {
							access = "r",
							parameterId = "65546"
						}
					},
					refreshComfortTemperature = ()[180],
					refreshEcoTemperature = ()[181],
					refreshSecuredPositionTemperature = {
						extraDefinition = {
							access = "r",
							parameterId = "16832522"
						}
					},
					refreshTemperature = ()[158],
					refreshSetPointMode = ()[158],
					refreshTargetTemperature = ()[158],
					setActiveAndSetPointModes = {
						prototype = "any,any",
						parameters = ()[44],
						rawStates = ()[182],
						converter = ()[93],
						extraDefinition = ()[45]
					},
					setActiveMode = {
						prototype = "any",
						parameters = ()[11],
						rawStates = {
							{
								rawStateId = "16830720"
							}
						},
						converter = ()[94],
						extraDefinition = ()[45]
					},
					setComfortTemperature = ()[184],
					setEcoTemperature = {
						prototype = "any",
						parameters = ()[11],
						rawStates = ()[182],
						converter = ()[95],
						extraDefinition = ()[185]
					},
					setName = ()[20],
					setOperatingMode = {
						prototype = "any",
						parameters = ()[11],
						converter = ()[96],
						extraDefinition = ()[45]
					},
					setSecuredPosition = {
						prototype = "integer[0;100]",
						parameters = ()[11],
						rawStates = ()[182],
						converter = ()[95],
						extraDefinition = ()[52]
					},
					setSecuredPositionTemperature = {
						prototype = "any",
						parameters = ()[11],
						rawStates = ()[182],
						converter = ()[95],
						extraDefinition = ()[52]
					},
					setSetPointMode = {
						prototype = "any",
						parameters = ()[11],
						rawStates = ()[182],
						converter = ()[97],
						extraDefinition = ()[45]
					},
					setTargetTemperature = {
						prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
						parameters = ()[11],
						rawStates = ()[182],
						converter = ()[97],
						extraDefinition = ()[45]
					},
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	983040 = {
		name = "Switch On/Off",
		localPairing = true,
		0 = {
			["io:OnOffIOComponent"] = {
				type = 1,
				widget = "StatefulOnOff",
				uiClass = "OnOff",
				uiProfiles = {
					"StatefulSwitchablePlug",
					"StatefulSwitchable",
					"Switchable"
				},
				states = ()[116],
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					onWithTimer = {
						prototype = "integer[5;14400]",
						parameters = ()[11],
						converter = ()[98],
						extraDefinition = ()[18]
					},
					pairOneWayController = ()[17],
					setName = ()[20],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = ()[11],
						converter = ()[99],
						extraDefinition = ()[18]
					},
					off = {
						parameters = ()[117],
						converter = ()[99],
						extraDefinition = ()[18]
					},
					on = {
						parameters = ()[118],
						converter = ()[99],
						extraDefinition = ()[18]
					},
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	983552 = {
		name = "Switch On/Off - micromodule",
		localPairing = true,
		0 = {
			["io:SwitchMicroModuleIOComponent"] = {
				type = 1,
				widget = "TimedOnOff",
				uiClass = "OnOff",
				uiProfiles = ()[133],
				states = {
					2146500638 = ()[1],
					1 = ()[3],
					65537 = ()[134],
					2147426304 = ()[4]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					onWithInternalTimer = ()[186],
					onWithTimer = ()[187],
					pairOneWayController = ()[17],
					setName = ()[20],
					setOnOff = ()[188],
					off = ()[189],
					on = ()[190],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	983554 = {
		name = "Light On/Off - micromodule SOMFY",
		localPairing = true,
		0 = {
			["io:LightMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "TimedOnOffLight",
				uiClass = "Light",
				uiProfiles = ()[133],
				states = ()[192],
				attributes = ()[59],
				commands = ()[198]
			}
		}
	},
	1048576 = {
		name = "Horizontal Awning",
		localPairing = true,
		0 = ()[203]
	},
	1048832 = {
		name = "Pergola Rail Guided Awning",
		localPairing = true,
		0 = ()[205]
	},
	2199023648770 = {
		name = "Dimmable Light - micromodule SOMFY",
		localPairing = true,
		0 = {
			["io:DimmableLightMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "DimmerLight",
				uiClass = "Light",
				uiProfiles = ()[101],
				states = {
					2146500638 = ()[1],
					65537 = ()[102],
					1 = ()[3],
					2147426304 = ()[4],
					16832512 = ()[103],
					2 = ()[56],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					pairOneWayController = ()[17],
					setName = ()[20],
					setIntensity = ()[104],
					off = ()[105],
					on = ()[106],
					setOnOff = ()[107],
					setIntensityWithTimer = ()[109],
					onWithTimer = ()[110],
					setMemorized1Position = ()[111],
					refreshMemorized1Position = ()[37],
					setPosition = ()[112],
					my = ()[113],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					wink = ()[26],
					setConfigState = ()[25],
					increaseIntensityForBoundConfiguration = ()[208],
					decreaseIntensityForBoundConfiguration = ()[209],
					saveBound = ()[210],
					sendIOKey = ()[65]
				}
			}
		}
	},
	1048834 = {
		name = "Pergola Rail Guided Awning SOMFY",
		localPairing = true,
		0 = ()[205]
	},
	1114112 = {
		name = "Exterior Venetian Blind",
		localPairing = true,
		0 = ()[218]
	},
	1179648 = {
		name = "Louver Blind",
		localPairing = true,
		0 = ()[27]
	},
	1245184 = {
		name = "Curtain track",
		localPairing = true,
		0 = ()[27]
	},
	1310720 = {
		name = "Ventilation point",
		localPairing = true,
		0 = {
			["io:VentilationPointIOComponent"] = ()[220]
		}
	},
	1310976 = {
		name = "Ventilation Inlet",
		localPairing = true,
		0 = {
			["io:VentilationPointAirInletIOComponent"] = ()[220]
		}
	},
	1311232 = {
		name = "Ventilation Transfer",
		localPairing = true,
		0 = {
			["io:VentilationPointAirTransferIOComponent"] = {
				type = 1,
				widget = "VentilationTransfer",
				uiClass = "VentilationSystem",
				uiProfiles = ()[219],
				states = {
					65537 = {
						linkedHighLevelState = {
							()[54]
						}
					},
					2146500638 = ()[1],
					16832512 = ()[69],
					1 = ()[3],
					16832522 = ()[70],
					2147426304 = ()[4]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					setAirTransfer = ()[38],
					off = ()[42],
					on = ()[40],
					setName = ()[20],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	1311488 = {
		name = "Ventilation Outlet",
		localPairing = true,
		0 = {
			["io:VentilationPointAirOutletIOComponent"] = {
				type = 1,
				widget = "VentilationOutlet",
				uiClass = "VentilationSystem",
				uiProfiles = {
					"SwitchableVentilation",
					"AirOutputLevelSensor",
					"Switchable"
				},
				states = {
					65537 = {
						linkedHighLevelState = {
							()[55],
							()[56]
						}
					},
					2146500638 = ()[1],
					16832512 = ()[69],
					1 = ()[3],
					16832522 = ()[70],
					2147426304 = ()[4]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					setAirOutput = ()[38],
					off = ()[42],
					on = ()[40],
					setName = ()[20],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	1376256 = {
		name = "Exterior Heating",
		localPairing = true,
		0 = ()[27]
	},
	1376258 = {
		name = "Exterior Heating SOMFY",
		localPairing = true,
		0 = {
			["io:ExteriorHeatingIOComponent"] = ()[227]
		}
	},
	1391106 = {
		name = "Discrete Exterior Heating SOMFY",
		localPairing = true,
		0 = ()[231]
	},
	1441792 = {
		name = "Heat Pump",
		localPairing = true,
		0 = {
			["io:HeatPumpIOComponent"] = {
				type = 1,
				widget = "HeatPump",
				uiClass = "HeatPumpSystem",
				uiProfiles = ()[177],
				states = {
					16832527 = {
						linkedHighLevelState = {
							()[58]
						}
					},
					2146500638 = ()[1],
					16832530 = {
						linkedHighLevelState = {
							()[59]
						}
					},
					16832531 = {
						linkedHighLevelState = {
							()[60]
						}
					},
					1 = ()[3],
					65545 = {
						linkedHighLevelState = {
							()[61]
						}
					},
					16832526 = {
						linkedHighLevelState = {
							()[62]
						}
					},
					2147426304 = ()[4],
					16830720 = {
						linkedHighLevelState = {
							()[63],
							()[64]
						}
					},
					65537 = {
						linkedHighLevelState = {
							()[65]
						}
					},
					65553 = {
						linkedHighLevelState = {
							()[66]
						}
					},
					65552 = {
						linkedHighLevelState = {
							()[67]
						}
					}
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshActiveModes = ()[233],
					refreshComfortTemperature = ()[180],
					refreshEcoTemperature = {
						extraDefinition = {
							access = "r",
							parameterId = "16832530"
						}
					},
					refreshHaltedTemperature = {
						extraDefinition = {
							access = "r",
							parameterId = "16832531"
						}
					},
					refreshSetBackTemperature = ()[181],
					refreshTargetTemperature = ()[158],
					refreshTemperature = ()[158],
					setActiveMode = {
						prototype = "any",
						parameters = ()[11],
						converter = ()[123],
						extraDefinition = ()[45]
					},
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[11],
						converter = ()[124],
						extraDefinition = ()[183]
					},
					setEcoTemperature = {
						prototype = "any",
						parameters = ()[11],
						converter = ()[124],
						extraDefinition = ()[234]
					},
					setName = ()[20],
					setSetBackTemperature = {
						prototype = "any",
						parameters = ()[11],
						converter = ()[124],
						extraDefinition = ()[185]
					},
					setTargetTemperature = {
						prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
						parameters = ()[11],
						converter = ()[124],
						extraDefinition = ()[18]
					},
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	1507328 = {
		name = "Alarm System",
		localPairing = true,
		0 = {
			["io:AlarmIOComponent"] = {
				type = 1,
				widget = "StatefulAlarmController",
				uiClass = "Alarm",
				uiProfiles = {
					"Alarm"
				},
				states = {
					65537 = {
						linkedHighLevelState = {
							()[68]
						}
					},
					2146500638 = ()[1],
					1 = ()[3],
					2147426304 = ()[4]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					alarmOff = ()[99],
					disarm = ()[99],
					alarmOn = ()[98],
					arm = ()[98],
					alarmZoneOn = {
						prototype = "string(A;B;C;A\\,B;B\\,C;A\\,C;A\\,B\\,C)",
						parameters = ()[11],
						converter = ()[126],
						extraDefinition = ()[18]
					},
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshState = ()[158],
					setName = ()[20],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	1572864 = {
		name = "Swinging Shutters",
		localPairing = true,
		0 = ()[27]
	},
	1572866 = {
		name = "Swinging Shutter Somfy",
		localPairing = true,
		0 = {
			["io:SwingingShutterSomfyIOComponent"] = {
				type = 1,
				widget = "SwingingShutter",
				uiClass = "SwingingShutter",
				uiProfiles = {
					"StatefulCloseableSwingingShutter",
					"StatefulCloseable",
					"Closeable",
					"StatefulOpenClose",
					"OpenClose"
				},
				states = {
					65537 = ()[153],
					2146500638 = ()[1],
					1 = ()[3],
					2147426304 = ()[4],
					16832512 = ()[69],
					16832522 = ()[70],
					2 = ()[56],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					pairOneWayController = ()[17],
					setClosure = ()[38],
					close = ()[40],
					open = ()[42],
					setName = ()[20],
					setPosition = {
						prototype = "string(my;memorized1;secured)|integer[0;100]",
						parameters = ()[11],
						converter = ()[127],
						extraDefinition = ()[18]
					},
					my = {
						parameters = ()[50],
						converter = ()[127],
						extraDefinition = ()[18]
					},
					setMemorized1Position = ()[47],
					refreshMemorized1Position = ()[37],
					setSecuredPosition = ()[53],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					stop = ()[235],
					sendIOKey = ()[65]
				}
			}
		}
	},
	1587714 = {
		name = "Discrete Swinging Shutter Somfy",
		localPairing = true,
		0 = {
			["io:DiscreteSwingingShutterSomfyIOComponent"] = {
				type = 1,
				widget = "SwingingShutter",
				uiClass = "SwingingShutter",
				uiProfiles = {
					"StatefulOpenCloseSwingingShutter",
					"StatefulOpenClose",
					"OpenClose"
				},
				states = {
					2146500638 = ()[1],
					1 = ()[3],
					65537 = {
						linkedHighLevelState = {
							()[7]
						}
					},
					2147426304 = ()[4],
					16832512 = ()[69],
					2 = ()[56],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					pairOneWayController = ()[17],
					close = ()[98],
					open = ()[99],
					my = ()[236],
					startIdentify = ()[21],
					setName = ()[20],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					setMemorized1Position = ()[47],
					refreshMemorized1Position = ()[37],
					stop = ()[235],
					sendIOKey = ()[65]
				}
			}
		}
	},
	1573120 = {
		name = "Independant Swinging Shutters",
		localPairing = true,
		0 = ()[27]
	},
	1769472 = {
		name = "Sliding Window",
		localPairing = true,
		0 = {
			["io:PositionableSlidingWindowComponent"] = {
				type = 1,
				widget = "PositionableSlidingWindow",
				uiClass = "Window",
				uiProfiles = {
					"StatefulCloseableSlidingWindow",
					"StatefulCloseable",
					"Closeable",
					"StatefulOpenClose",
					"OpenClose"
				},
				states = {
					16832512 = ()[69],
					65537 = ()[153],
					2146500638 = ()[1],
					1 = ()[3],
					2147426304 = ()[4]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					setClosure = ()[19],
					close = ()[237],
					open = ()[238],
					setClosureAndLinearSpeed = ()[239],
					setName = ()[20],
					setPosition = {
						prototype = "string(my)|integer[0;100]",
						parameters = ()[11],
						converter = ()[131],
						extraDefinition = ()[18]
					},
					my = ()[240],
					setPositionAndLinearSpeed = {
						prototype = "string(my)|integer[0;100],*string(lowspeed)",
						parameters = ()[8],
						converter = ()[132],
						extraDefinition = ()[45]
					},
					setMemorized1Position = ()[47],
					refreshMemorized1Position = ()[37],
					startIdentify = ()[21],
					stop = ()[63],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	1769730 = {
		name = "Sliding Window with lock SOMFY",
		localPairing = true,
		0 = ()[251]
	},
	2199025025282 = {
		name = "Sliding Air Window io Portability Step 1",
		localPairing = true,
		0 = ()[251]
	},
	1900544 = {
		name = "Bioclimatic Pergola",
		localPairing = true,
		0 = ()[258]
	},
	1900546 = {
		name = "Bioclimatic Pergola Somfy",
		localPairing = true,
		0 = ()[258]
	},
	1966080 = {
		name = "Siren",
		localPairing = true,
		0 = {
			["io:SirenIOComponent"] = {
				type = 1,
				widget = "IOSiren",
				uiClass = "Siren",
				uiProfiles = ()[259],
				states = {
					65556 = ()[260],
					2146500638 = ()[1],
					1 = ()[3],
					16830720 = ()[261],
					2147426304 = ()[4],
					["io:MemorizedVolumeState"] = {
						linkedHighLevelState = {
							()[83]
						}
					}
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					off = ()[262],
					stop = ()[262],
					pairOneWayController = ()[17],
					ringWithDoubleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default)",
						parameters = {
							()[6],
							()[43],
							()[122],
							()[124],
							()[263],
							()[264],
							()[265],
							()[266],
							()[267],
							()[268]
						},
						rawStates = ()[269],
						converter = ()[152],
						extraDefinition = ()[45]
					},
					ringWithSingleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default)",
						parameters = {
							()[6],
							()[43],
							()[122],
							()[124],
							()[263]
						},
						rawStates = ()[269],
						converter = ()[153],
						extraDefinition = ()[45]
					},
					ring = {
						parameters = {
							()[270],
							()[271],
							()[272],
							()[273],
							{
								value = "noVisualEffect",
								name = "p5"
							}
						},
						rawStates = ()[269],
						converter = ()[153],
						extraDefinition = ()[45]
					},
					ringWithThreeSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default)",
						parameters = {
							()[6],
							()[43],
							()[122],
							()[124],
							()[263],
							()[264],
							()[265],
							()[266],
							()[267],
							()[268],
							()[274],
							()[275],
							{
								isParameterRequired = true,
								name = "p13"
							},
							{
								isParameterRequired = true,
								name = "p14"
							},
							{
								isParameterRequired = true,
								name = "p15"
							}
						},
						rawStates = ()[269],
						converter = ()[154],
						extraDefinition = ()[45]
					},
					setMemorizedVolume = {
						prototype = "string(default;highest;lowest;noSound;standard)",
						parameters = ()[11],
						converter = ()[155],
						extraDefinition = ()[276]
					},
					setName = ()[20],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	1966082 = {
		name = "Indoor Siren SOMFY",
		localPairing = true,
		0 = {
			["io:SomfyIndoorSimpleSirenIOComponent"] = {
				type = 1,
				widget = "IOSiren",
				uiClass = "Siren",
				uiProfiles = ()[259],
				states = {
					65556 = ()[260],
					2146500638 = ()[1],
					1 = ()[3],
					16830720 = ()[261],
					2147426304 = ()[4],
					2 = ()[56],
					2146500645 = ()[57],
					["io:MemorizedVolumeState"] = {
						linkedHighLevelState = {
							()[84]
						}
					}
				},
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					off = ()[262],
					stop = ()[262],
					pairOneWayController = ()[17],
					ringWithDoubleSimpleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume)",
						parameters = {
							()[6],
							()[43],
							()[122],
							()[124],
							()[263],
							()[264],
							()[265],
							()[266]
						},
						rawStates = ()[269],
						converter = ()[156],
						extraDefinition = ()[45]
					},
					ringWithSingleSimpleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume)",
						parameters = ()[125],
						rawStates = ()[269],
						converter = ()[157],
						extraDefinition = ()[45]
					},
					ring = {
						parameters = {
							()[270],
							()[271],
							()[272],
							()[273]
						},
						rawStates = ()[269],
						converter = ()[157],
						extraDefinition = ()[45]
					},
					ringWithThreeSimpleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume)",
						parameters = {
							()[6],
							()[43],
							()[122],
							()[124],
							()[263],
							()[264],
							()[265],
							()[266],
							()[267],
							()[268],
							()[274],
							()[275]
						},
						rawStates = ()[269],
						converter = ()[158],
						extraDefinition = ()[45]
					},
					setMemorizedSimpleVolume = {
						prototype = "string(highest;standard)",
						parameters = ()[11],
						converter = ()[155],
						extraDefinition = ()[276]
					},
					setName = ()[20],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26],
					sendIOKey = ()[65]
				}
			}
		}
	},
	3342348 = {
		name = "Domestic hot water production (Atlantic V2)",
		localPairing = true,
		1 = {
			["io:AtlanticDomesticHotWaterProductionV2IOComponent"] = ()[355]
		},
		2 = ()[358]
	},
	3407872 = {
		name = "Electrical heater",
		localPairing = true,
		0 = {
			["io:ElectricalHeaterGenericIOComponent"] = {
				type = 1,
				widget = "ElectricalHeater",
				uiClass = "HeatingSystem",
				uiProfiles = ()[359],
				states = {
					2146500638 = ()[1],
					1 = ()[3],
					16830720 = ()[360],
					2147426304 = ()[4],
					65547 = ()[361],
					65548 = ()[362]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					cancelHeatingLevel = ()[363],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshHeatingLevel = ()[158],
					setHeatingLevel = ()[364],
					off = ()[365],
					setHeatingLevelWithTimer = ()[366],
					setName = ()[20],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	3407884 = {
		name = "Electrical heater (Atlantic)",
		localPairing = true,
		0 = {
			["io:AtlanticElectricalHeaterIOComponent"] = {
				type = 1,
				widget = "AtlanticElectricalHeater",
				uiClass = "HeatingSystem",
				uiProfiles = ()[359],
				states = {
					2146500638 = ()[1],
					1 = ()[3],
					16830720 = ()[360],
					2147426304 = ()[4],
					65547 = ()[361],
					65548 = ()[362],
					["core:AbsenceModeState"] = {
						linkedHighLevelState = {
							()[127]
						}
					}
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					cancelHeatingLevel = ()[363],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshHeatingLevel = ()[158],
					setHeatingLevel = ()[364],
					off = ()[365],
					setHeatingLevelForTrigger = {
						prototype = "any",
						parameters = ()[11],
						converter = ()[208],
						extraDefinition = ()[45]
					},
					setHeatingLevelWithTimer = ()[366],
					setName = ()[20],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					wink = ()[26]
				}
			}
		}
	},
	3473420 = {
		localPairing = true,
		name = "Heat Recovery Ventilation (Atlantic)",
		1 = {
			["io:AtlanticHeatRecoveryVentilationIOComponent"] = {
				type = 1,
				widget = "AtlanticHeatRecoveryVentilation",
				uiClass = "VentilationSystem",
				uiProfiles = ()[367],
				states = {
					65537 = {
						linkedHighLevelState = {
							()[128]
						}
					},
					2146500638 = ()[1],
					1 = ()[3],
					218040320 = {
						linkedHighLevelState = {
							()[129],
							()[134],
							()[135],
							()[136],
							()[137]
						}
					},
					2147426304 = ()[4],
					218041600 = {
						linkedHighLevelState = {
							()[130]
						}
					},
					16830720 = {
						linkedHighLevelState = {
							()[131]
						}
					},
					84672513 = {
						linkedHighLevelState = {
							()[132]
						}
					},
					84672514 = {
						linkedHighLevelState = {
							()[133]
						}
					},
					218040576 = {
						linkedHighLevelState = {
							()[138]
						}
					},
					65553 = {
						linkedHighLevelState = {
							()[139]
						}
					},
					218040064 = {
						linkedHighLevelState = {
							()[140]
						}
					}
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshCO2History = {
						converter = ()[222],
						extraDefinition = ()[368]
					},
					refreshEnergySaving = {
						converter = ()[223],
						extraDefinition = ()[368]
					},
					refreshSensorsState = {
						extraDefinition = {
							access = "r",
							parameterId = "218040576"
						}
					},
					refreshTimeProgram = {
						extraDefinition = {
							access = "r",
							parameterId = "218041600"
						}
					},
					refreshVentilationConfigurationMode = {
						converter = ()[188],
						extraDefinition = ()[232]
					},
					refreshVentilationState = {
						extraDefinition = {
							access = "r",
							parameterId = "218040320"
						}
					},
					resetVentilation = {
						prototype = "*string,*string,*string",
						parameters = {
							()[206],
							()[7],
							()[108]
						},
						converter = ()[224],
						extraDefinition = {
							access = "w",
							parameterId = "218041088"
						}
					},
					setAirDemandMode = {
						prototype = "any",
						parameters = ()[11],
						converter = ()[225],
						extraDefinition = ()[18]
					},
					setName = ()[20],
					setTimeProgram = {
						prototype = "any",
						parameters = ()[11],
						converter = ()[226],
						extraDefinition = {
							access = "w",
							parameterId = "218041856"
						}
					},
					setVentilationConfigurationMode = {
						prototype = "any",
						parameters = ()[11],
						converter = ()[227],
						extraDefinition = ()[45]
					},
					setVentilationMode = {
						prototype = "any",
						parameters = ()[11],
						converter = ()[228],
						extraDefinition = {
							access = "w",
							parameterId = "218040064"
						}
					},
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					wink = ()[26]
				}
			}
		},
		2 = {
			["io:CO2IOSystemDeviceSensor"] = {
				type = 2,
				widget = "CO2Sensor",
				uiClass = "AirSensor",
				uiProfiles = ()[369],
				states = {
					218040576 = {
						linkedHighLevelState = {
							()[141]
						}
					},
					2147426304 = ()[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:PowerSourceType"] = ()[3]
				}
			}
		},
		3 = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[370],
				states = {
					2147426304 = ()[4],
					218040576 = {
						linkedHighLevelState = {
							()[142]
						}
					}
				},
				attributes = ()[371]
			}
		},
		4 = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[370],
				states = {
					2147426304 = ()[4],
					218040576 = {
						linkedHighLevelState = {
							()[143]
						}
					}
				},
				attributes = ()[371]
			}
		},
		5 = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[370],
				states = {
					2147426304 = ()[4],
					218040576 = {
						linkedHighLevelState = {
							()[144]
						}
					}
				},
				attributes = ()[371]
			}
		},
		6 = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[370],
				states = {
					2147426304 = ()[4],
					218040576 = {
						linkedHighLevelState = {
							()[145]
						}
					}
				},
				attributes = ()[371]
			}
		},
		7 = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[370],
				states = {
					2147426304 = ()[4],
					218040576 = {
						linkedHighLevelState = {
							()[146]
						}
					}
				},
				attributes = ()[371]
			}
		}
	},
	16711691 = {
		name = "Gateway RSOverkiz",
		localPairing = true,
		0 = {
			["io:RSOverkizIOComponent"] = {
				type = 1,
				widget = "unknown",
				uiClass = "Generic",
				uiProfiles = ()[367],
				states = {
					2146500638 = ()[1],
					1 = ()[3],
					2147426304 = ()[4]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					setName = ()[20],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26]
				}
			}
		}
	},
	4295032832 = {
		name = "Light Inside Sensor",
		localPairing = true,
		0 = ()[376]
	},
	4295098368 = {
		name = "Temperature Inside Sensor",
		localPairing = true,
		0 = ()[378]
	},
	4295163904 = {
		name = "Temperature Outside Sensor",
		localPairing = true,
		0 = ()[378]
	},
	4295229440 = {
		name = "Wind Sensor",
		localPairing = true,
		0 = {
			["io:WindIOSystemSensor"] = {
				type = 2,
				widget = "WindSpeedSensor",
				uiClass = "WindSensor",
				uiProfiles = {
					"WindSpeed"
				},
				states = {
					2146500638 = ()[1],
					2415919110 = ()[373],
					2147426304 = ()[4],
					2415919106 = {
						linkedHighLevelState = {
							()[150]
						}
					}
				},
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:PowerSourceType"] = ()[9],
					["core:MeasuredValueType"] = ()[11]
				},
				commands = ()[375]
			}
		}
	},
	4295360512 = {
		name = "Sun Energy Outside Sensor",
		localPairing = true,
		0 = {
			["io:SunEnergyIOSystemSensor"] = {
				type = 2,
				widget = "SunEnergySensor",
				uiClass = "SunSensor",
				uiProfiles = ()[367],
				states = {
					2146500638 = ()[1],
					2415919110 = ()[373],
					2147426304 = ()[4],
					2415919106 = {
						linkedHighLevelState = {
							()[151]
						}
					}
				},
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:PowerSourceType"] = ()[9],
					["core:MeasuredValueType"] = ()[12]
				},
				commands = ()[375]
			}
		}
	},
	4295426048 = {
		name = "Relative Humidity Inside Sensor",
		localPairing = true,
		0 = ()[381]
	},
	4295491584 = {
		name = "Relative Humidity Outside Sensor",
		localPairing = true,
		0 = ()[381]
	},
	4295557120 = {
		name = "CO2 Sensor",
		localPairing = true,
		0 = {
			["io:CO2IOSystemSensor"] = {
				type = 2,
				widget = "CO2Sensor",
				uiClass = "AirSensor",
				uiProfiles = ()[369],
				states = {
					2415919106 = {
						linkedHighLevelState = {
							()[153]
						}
					},
					2146500638 = ()[1],
					2415919110 = ()[373],
					2147426304 = ()[4]
				},
				attributes = ()[382],
				commands = ()[375]
			}
		}
	},
	4295622656 = {
		name = "CO Sensor",
		localPairing = true,
		0 = {
			["io:COIOSystemSensor"] = {
				type = 2,
				widget = "COSensor",
				uiClass = "AirSensor",
				uiProfiles = {
					"COConcentration"
				},
				states = {
					2415919106 = {
						linkedHighLevelState = {
							()[154]
						}
					},
					2146500638 = ()[1],
					2415919110 = ()[373],
					2147426304 = ()[4]
				},
				attributes = ()[382],
				commands = ()[375]
			}
		}
	},
	4295688192 = {
		name = "Light Outside Sensor",
		localPairing = true,
		0 = ()[376]
	},
	4295753728 = {
		name = "Cumulated Gas Consumption Sensor",
		localPairing = true,
		1 = {
			["io:GasHeaterConsumptionSensor"] = {
				type = 2,
				widget = "GasHeaterConsumptionSensor",
				uiClass = "GasSensor",
				uiProfiles = ()[383],
				states = ()[385],
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:PeopleCount"] = ()[15],
					["core:UsedForCooking"] = ()[16],
					["core:UsedForDHW"] = ()[17],
					["core:PowerSourceType"] = ()[9],
					["core:GasThermalEfficiency"] = ()[18],
					["core:MeasurementCategory"] = ()[19],
					["core:MeasuredValueType"] = ()[20]
				},
				commands = ()[388]
			}
		},
		2 = {
			["io:GasDHWConsumptionSensor"] = {
				type = 2,
				widget = "GasDHWConsumptionSensor",
				uiClass = "GasSensor",
				uiProfiles = ()[383],
				states = ()[385],
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:PeopleCount"] = ()[15],
					["core:UsedForCooking"] = ()[16],
					["core:UsedForDHW"] = ()[17],
					["core:PowerSourceType"] = ()[9],
					["core:GasThermalEfficiency"] = ()[18],
					["core:MeasurementCategory"] = ()[21],
					["core:MeasuredValueType"] = ()[20]
				},
				commands = ()[388]
			}
		}
	},
	4295819264 = {
		name = "Cumulated Water Consumption Sensor",
		localPairing = true,
		0 = {
			["io:CumulatedWaterConsumptionIOSystemSensor"] = {
				type = 2,
				widget = "CumulativeWaterConsumptionSensor",
				uiClass = "WaterSensor",
				uiProfiles = {
					"WaterConsumption"
				},
				states = {
					2146500638 = ()[1],
					2415919105 = ()[384],
					2415919110 = ()[373],
					2147426304 = ()[4],
					83935248 = {
						linkedHighLevelState = {
							()[157]
						}
					}
				},
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:PowerSourceType"] = ()[9],
					["core:MeasuredValueType"] = ()[20]
				},
				commands = ()[388]
			}
		}
	},
	4295884800 = {
		name = "Cumulated Thermal Energy Consumption Sensor",
		localPairing = true,
		0 = {
			["io:CumulatedThermalEnergyConsumptionIOSystemSensor"] = {
				type = 2,
				widget = "CumulativeThermalEnergyConsumptionSensor",
				uiClass = "ThermalEnergySensor",
				uiProfiles = {
					"ThermalEnergyConsumption"
				},
				states = {
					2146500638 = ()[1],
					2415919105 = ()[384],
					2415919110 = ()[373],
					2147426304 = ()[4],
					83935248 = {
						linkedHighLevelState = {
							()[158]
						}
					}
				},
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:PowerSourceType"] = ()[9],
					["core:MeasuredValueType"] = ()[4]
				},
				commands = ()[388]
			}
		}
	},
	4295950336 = {
		name = "Cumulated Electrical Energy Consumption Sensor",
		localPairing = true,
		0 = {
			["io:CumulatedElectricalEnergyConsumptionIOSystemSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ()[356],
				states = {
					2146500638 = ()[1],
					83935248 = {
						linkedHighLevelState = {
							()[159]
						}
					},
					2415919105 = ()[384],
					2415919110 = ()[373],
					2147426304 = ()[4]
				},
				attributes = ()[357],
				commands = ()[388]
			}
		}
	},
	4295950348 = {
		name = "Multi-Energy Consumption Sensor - GMDE (Atlantic)",
		localPairing = true,
		1 = {
			["io:TotalElectricalEnergyConsumptionIOSystemSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ()[356],
				states = {
					2146500638 = ()[1],
					83902467 = {
						linkedHighLevelState = {
							()[160]
						}
					},
					2415919110 = ()[373],
					2147426304 = ()[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:MeasurementCategory"] = ()[22],
					["core:PowerSourceType"] = ()[3],
					["core:MeasuredValueType"] = ()[4]
				},
				commands = {
					advancedRefresh = {
						prototype = "string(normal;advanced)",
						parameters = ()[11],
						extraDefinition = {
							access = "r",
							parameterId = "83902467"
						}
					}
				}
			}
		},
		2 = {
			["io:HeatingElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ()[356],
				states = {
					83902466 = {
						linkedHighLevelState = ()[389],
						linkedStateIds = ()[390]
					},
					83902467 = {
						linkedHighLevelState = ()[389],
						linkedStateIds = ()[391]
					},
					2146500638 = ()[1],
					2415919105 = ()[384],
					2415919110 = ()[373],
					2147426304 = ()[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:MeasurementCategory"] = ()[23],
					["core:PowerSourceType"] = ()[3],
					["core:MeasuredValueType"] = ()[4]
				},
				commands = ()[393]
			}
		},
		3 = {
			["io:DHWElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ()[356],
				states = {
					83902466 = {
						linkedHighLevelState = ()[394],
						linkedStateIds = ()[390]
					},
					83902467 = {
						linkedHighLevelState = ()[394],
						linkedStateIds = ()[391]
					},
					2146500638 = ()[1],
					2415919105 = ()[384],
					2415919110 = ()[373],
					2147426304 = ()[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:MeasurementCategory"] = ()[24],
					["core:PowerSourceType"] = ()[3],
					["core:MeasuredValueType"] = ()[4]
				},
				commands = ()[393]
			}
		},
		4 = {
			["io:AirConditioningElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ()[356],
				states = {
					83902466 = {
						linkedHighLevelState = ()[395],
						linkedStateIds = ()[390]
					},
					83902467 = {
						linkedHighLevelState = ()[395],
						linkedStateIds = ()[391]
					},
					2146500638 = ()[1],
					2415919105 = ()[384],
					2415919110 = ()[373],
					2147426304 = ()[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:MeasurementCategory"] = ()[25],
					["core:PowerSourceType"] = ()[3],
					["core:MeasuredValueType"] = ()[4]
				},
				commands = ()[393]
			}
		},
		5 = {
			["io:PlugsElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ()[356],
				states = {
					83902466 = {
						linkedHighLevelState = ()[396],
						linkedStateIds = ()[390]
					},
					83902467 = {
						linkedHighLevelState = ()[396],
						linkedStateIds = ()[391]
					},
					2146500638 = ()[1],
					2415919105 = ()[384],
					2415919110 = ()[373],
					2147426304 = ()[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:MeasurementCategory"] = ()[26],
					["core:PowerSourceType"] = ()[3],
					["core:MeasuredValueType"] = ()[4]
				},
				commands = ()[393]
			}
		},
		6 = {
			["io:OtherElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ()[356],
				states = {
					83902466 = {
						linkedHighLevelState = ()[397],
						linkedStateIds = ()[390]
					},
					83902467 = {
						linkedHighLevelState = ()[397],
						linkedStateIds = ()[391]
					},
					2146500638 = ()[1],
					2415919105 = ()[384],
					2415919110 = ()[373],
					2147426304 = ()[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:MeasurementCategory"] = ()[27],
					["core:PowerSourceType"] = ()[3],
					["core:MeasuredValueType"] = ()[4]
				},
				commands = ()[393]
			}
		},
		7 = {
			["io:DomesticHotWaterTankComponent"] = {
				type = 1,
				widget = "DomesticHotWaterTank",
				uiClass = "WaterHeatingSystem",
				uiProfiles = ()[367],
				states = {
					2147426304 = ()[4],
					201392128 = {
						linkedHighLevelState = {
							()[196]
						}
					},
					201326592 = {
						linkedHighLevelState = {
							()[197]
						}
					}
				},
				commands = {
					refreshForceHeatingMode = {
						extraDefinition = {
							access = "r",
							parameterId = "201392128"
						}
					},
					setForceHeating = {
						prototype = "string(off;on)",
						parameters = ()[11],
						converter = ()[278],
						extraDefinition = {
							access = "w",
							parameterId = "201326592"
						}
					}
				}
			}
		},
		8 = {
			["io:ElectricityMeterComponent"] = {
				type = 1,
				widget = "AtlanticMultiMeterElectricSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ()[367],
				states = {
					83902467 = {
						linkedHighLevelState = {
							()[198]
						}
					},
					201457664 = {
						linkedHighLevelState = {
							()[199]
						}
					},
					83902464 = {
						linkedHighLevelState = {
							()[200],
							()[201]
						}
					},
					2147426304 = ()[4]
				},
				commands = {
					setElectricalContractIntensity = {
						prototype = "integer[0;150]",
						parameters = ()[11],
						converter = ()[282],
						extraDefinition = {
							access = "w",
							parameterId = "201457664"
						}
					},
					advancedRefresh = ()[392]
				}
			}
		},
		9 = {
			["io:EnergyConsumptionSensorsConfigurationComponent"] = {
				type = 1,
				widget = "AtlanticMultiMeterElectricConfiguration",
				uiClass = "ElectricitySensor",
				uiProfiles = ()[367],
				states = {
					2147426304 = ()[4],
					["io:HeatPumpActiveState"] = {
						linkedHighLevelState = {
							()[202]
						}
					}
				},
				commands = {
					advancedRefresh = ()[392],
					activateHeatPumpMode = {
						extraDefinition = {
							access = "w",
							parameterId = "io:HeatPumpActiveState"
						}
					}
				}
			}
		},
		10 = {
			["io:EnergyConsumptionSensorsHeatPumpComponent"] = {
				type = 1,
				widget = "AtlanticMultiMeterElectricHeatPump",
				uiClass = "ElectricitySensor",
				uiProfiles = ()[367],
				states = {
					201588736 = {
						linkedHighLevelState = {
							()[203]
						}
					},
					2147426304 = ()[4],
					201523200 = {
						linkedHighLevelState = {
							()[204]
						}
					}
				},
				commands = {
					advancedRefresh = ()[392],
					setConfigurationServices = {
						prototype = "string(config1;config2)",
						parameters = ()[11],
						converter = ()[285],
						extraDefinition = {
							access = "w",
							parameterId = "201523200"
						}
					},
					setDerogationOnOffState = {
						prototype = "string(on;off)",
						parameters = ()[11],
						converter = ()[286],
						extraDefinition = {
							access = "w",
							parameterId = "201588736"
						}
					}
				}
			}
		}
	},
	4303355904 = {
		name = "Smoke sensor",
		localPairing = true,
		0 = {
			["io:SmokeIOSystemSensor"] = {
				type = 2,
				widget = "SmokeSensor",
				uiClass = "SmokeSensor",
				uiProfiles = ()[398],
				states = {
					2146500638 = ()[1],
					2415919110 = ()[373],
					2415919106 = ()[399],
					2147426304 = ()[4]
				},
				attributes = ()[400],
				commands = ()[375]
			}
		}
	},
	4303355906 = {
		name = "Smoke sensor - Fumix SOMFY",
		localPairing = true,
		0 = {
			["io:SomfySmokeIOSystemSensor"] = {
				type = 2,
				widget = "SmokeSensor",
				uiClass = "SmokeSensor",
				uiProfiles = ()[398],
				states = {
					2146500638 = ()[1],
					2415919110 = {
						linkedHighLevelState = {
							()[148],
							()[208]
						}
					},
					2415919106 = ()[399],
					2147426304 = ()[4],
					83902976 = {
						linkedHighLevelState = {
							()[206],
							()[207]
						}
					}
				},
				attributes = ()[400],
				commands = {
					advancedRefresh = ()[374],
					checkEventTrigger = {
						prototype = "string(short;long)",
						parameters = ()[11],
						converter = ()[292],
						extraDefinition = {
							access = "w",
							parameterId = "33554650"
						}
					}
				}
			}
		}
	},
	4303683584 = {
		name = "Generic closure sensor",
		localPairing = true,
		0 = {
			["io:ContactIOSystemSensor"] = {
				type = 2,
				widget = "ContactSensor",
				uiClass = "ContactSensor",
				uiProfiles = ()[401],
				states = {
					2415919106 = ()[402],
					2146500638 = ()[1],
					2415919110 = ()[373],
					2147426304 = ()[4]
				},
				attributes = ()[400],
				commands = ()[375]
			}
		}
	},
	4303683586 = {
		name = "Closure sensor - DO SOMFY",
		localPairing = true,
		0 = {
			["io:SomfyContactIOSystemSensor"] = ()[404]
		}
	},
	4303749120 = {
		name = "Motion sensor",
		localPairing = true,
		0 = {
			["io:OccupancyIOSystemSensor"] = {
				type = 2,
				widget = "OccupancySensor",
				uiClass = "OccupancySensor",
				uiProfiles = ()[405],
				states = {
					2146500638 = ()[1],
					2415919106 = ()[406],
					2415919110 = ()[373],
					2147426304 = ()[4]
				},
				attributes = ()[400],
				commands = ()[375]
			}
		}
	},
	4303749122 = {
		name = "Motion sensor - DM SOMFY",
		localPairing = true,
		0 = {
			["io:SomfyOccupancyIOSystemSensor"] = {
				type = 2,
				widget = "OccupancySensor",
				uiClass = "OccupancySensor",
				uiProfiles = ()[405],
				states = {
					2146500638 = ()[1],
					2415919106 = ()[406],
					2415919110 = ()[403],
					2147426304 = ()[4]
				},
				attributes = ()[400],
				commands = ()[375]
			}
		}
	},
	4303880192 = {
		name = "Rain sensor",
		localPairing = true,
		0 = {
			["io:RainIOSystemSensor"] = ()[407]
		}
	},
	4303880194 = {
		name = "Rain sensor - ondeis SOMFY",
		localPairing = true,
		0 = {
			["io:SomfyRainIOSystemSensor"] = ()[407]
		}
	},
	4311613440 = {
		name = "Multi Type Sensor (single channel per type)",
		localPairing = true,
		1 = {
			["io:WindowStateSensor"] = {
				type = 2,
				widget = "IntrusionEventSensor",
				uiClass = "ContactSensor",
				uiProfiles = ()[408],
				states = {
					2146500638 = ()[409],
					2415919105 = ()[384],
					18183012483074 = ()[410],
					2147426304 = ()[4],
					2415919110 = ()[373]
				},
				attributes = ()[411],
				commands = ()[412]
			}
		},
		2 = {
			["io:IntrusionSensor"] = {
				type = 2,
				widget = "IntrusionSensor",
				uiClass = "ContactSensor",
				uiProfiles = ()[413],
				states = {
					2146500638 = ()[409],
					2415919110 = ()[373],
					2147426304 = ()[4],
					18152947712002 = ()[414]
				},
				attributes = ()[415],
				commands = {
					advancedRefresh = ()[416]
				}
			}
		}
	},
	1103823241218 = {
		name = "IDEOI somfy multi type sensor (open close tilt window and Intrusion)",
		localPairing = true,
		1 = {
			["io:WindowStateSensor"] = {
				type = 2,
				widget = "IntrusionEventSensor",
				uiClass = "ContactSensor",
				uiProfiles = ()[408],
				states = {
					2146500638 = ()[409],
					2415919105 = ()[384],
					18183012483074 = ()[410],
					2147426304 = ()[4],
					2415919110 = ()[403]
				},
				attributes = ()[411],
				commands = ()[412]
			}
		},
		2 = ()[417]
	},
	2203334868994 = {
		name = "IDEOI somfy multi type sensor (sliding window and Intrusion)",
		localPairing = true,
		1 = {
			["io:SlidingWindowStateSensor"] = {
				type = 2,
				widget = "IntrusionEventSensor",
				uiClass = "ContactSensor",
				uiProfiles = {
					"WindowOpeningStatus",
					"LockableOpeningStatus",
					"LockStatus",
					"OpeningStatus"
				},
				states = {
					2146500638 = ()[409],
					2415919105 = ()[384],
					18183012483074 = {
						linkedHighLevelState = {
							()[214],
							()[215]
						}
					},
					2147426304 = ()[4],
					2415919110 = ()[403]
				},
				attributes = ()[411],
				commands = ()[412]
			}
		},
		2 = ()[417]
	},
	4311678976 = {
		name = "Generic pulse sensor (virgin)",
		localPairing = true,
		0 = {
			["io:GenericPulseSensor"] = {
				type = 2,
				widget = "unknown",
				uiClass = "unknown",
				uiProfiles = ()[367],
				states = {
					2146500638 = ()[1],
					2147426304 = ()[4]
				}
			}
		}
	},
	8656978944 = {
		name = "Stack Master (V2)",
		localPairing = true,
		0 = {
			["io:StackComponent"] = {
				type = 5,
				widget = "IOStack",
				uiClass = "ProtocolGateway",
				uiProfiles = ()[367],
				commands = {
					advancedSomfyDiscover = {
						prototype = "string(dpcActuators;unsetActuators)",
						parameters = ()[11],
						converter = ()[307],
						extraDefinition = ()[418]
					},
					discoverSomfyUnsetActuators = {
						converter = ()[308],
						extraDefinition = ()[418]
					},
					discoverActuators = {
						prototype = "string(alreadyInTheNetwork;inConfigurationState;all)",
						parameters = ()[11],
						converter = ()[309],
						extraDefinition = ()[418]
					},
					discoverSensors = {
						prototype = "string(inConfigurationState;all)",
						parameters = ()[11],
						converter = ()[310],
						extraDefinition = {
							access = "w",
							parameterId = "2146566150"
						}
					},
					discover1WayController = {
						prototype = "*integer,*string(keygo;izymo;public default;v500;default;keypad)",
						parameters = {
							()[206],
							()[7]
						},
						converter = ()[311],
						extraDefinition = {
							access = "w",
							parameterId = "2146566151"
						}
					},
					joinNetwork = {
						converter = ()[312],
						extraDefinition = {
							access = "w",
							parameterId = "2146566148"
						}
					},
					resetNetworkSecurity = {
						converter = ()[313],
						extraDefinition = {
							access = "w",
							parameterId = "2146500620"
						}
					},
					shareNetwork = {
						converter = ()[314],
						extraDefinition = {
							access = "w",
							parameterId = "2146566147"
						}
					}
				}
			}
		}
	},
	21475622912 = {
		name = "Beacon",
		localPairing = true,
		0 = {
			["io:BeaconIOComponent"] = {
				type = 6,
				widget = "Repeater",
				uiClass = "NetworkComponent",
				uiProfiles = ()[367],
				states = {
					2146500638 = ()[1]
				},
				attributes = {
					["core:DefaultName"] = ()[34]
				}
			}
		}
	},
	25836847104 = {
		name = "Remote Controller (1W)",
		localPairing = true,
		0 = {
			["io:IORemoteController"] = {
				type = 4,
				widget = "RemoteControllerOneWay",
				uiClass = "RemoteController",
				uiProfiles = ()[367],
				states = {
					33554442 = {
						linkedHighLevelState = {
							()[219]
						}
					}
				},
				attributes = ()[419]
			}
		}
	},
	25836847616 = {
		name = "Keygo Remote Controller",
		localPairing = true,
		0 = {
			["io:KeygoController"] = ()[420]
		}
	},
	25836847872 = {
		name = "Izymo Remote Controller",
		localPairing = true,
		0 = {
			["io:IzymoController"] = {
				type = 4,
				widget = "RemoteControllerOneWay",
				uiClass = "RemoteController",
				uiProfiles = ()[367],
				states = {
					33554443 = {
						linkedHighLevelState = {
							()[221]
						}
					}
				},
				attributes = ()[419]
			}
		}
	},
	1099511758850 = {
		name = "Roller Shutter With Low Speed Management SOMFY",
		localPairing = true,
		0 = ()[424]
	},
	1099511759106 = {
		name = "GradHermetic SOMFY",
		localPairing = true,
		0 = {
			["io:GradHermeticIOComponent"] = ()[85]
		}
	},
	1099511824386 = {
		name = "Pergola Screen SOMFY",
		localPairing = true,
		0 = {
			["io:PergolaScreenIOComponent"] = {
				type = 1,
				widget = "PositionableAndStretchablePergolaScreen",
				uiClass = "Pergola",
				uiProfiles = ()[425],
				states = {
					65537 = {
						linkedHighLevelState = {
							()[222],
							()[5],
							()[12]
						}
					},
					2146500638 = ()[1],
					16832512 = ()[69],
					1 = ()[3],
					16832522 = ()[70],
					2147426304 = ()[4],
					2 = ()[56],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					setClosure = ()[38],
					close = ()[40],
					deploy = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					undeploy = ()[42],
					up = ()[42],
					setClosureOrTightPosition = ()[426],
					setMemorized1Position = ()[47],
					setName = ()[20],
					setPosition = ()[48],
					my = ()[51],
					setSecuredPosition = ()[53],
					setTightPosition = ()[236],
					startIdentify = ()[21],
					stop = ()[63],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26],
					sendIOKey = ()[65]
				}
			}
		}
	},
	1099511889922 = {
		name = "Window Opener Uno",
		localPairing = true,
		0 = {
			["io:WindowOpenerUnoIOComponent"] = {
				type = 1,
				widget = "PositionableWindowUno",
				uiClass = "Window",
				uiProfiles = ()[427],
				states = {
					2146500638 = ()[1],
					1 = ()[3],
					2147426304 = ()[4],
					16830720 = ()[429],
					65537 = {
						linkedHighLevelState = ()[428],
						linkedStateIds = {
							"120833",
							"120834",
							"120835",
							"120842",
							"16830720"
						}
					},
					120842 = ()[430],
					120833 = ()[431],
					120834 = ()[432],
					120835 = ()[433],
					2 = ()[56],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = ()[154]
			}
		}
	},
	1099511970306 = {
		name = "Discrete Garage Door Opener SOMFY (Dexxo Smart io 800)",
		localPairing = true,
		0 = ()[438]
	},
	1099512020994 = {
		name = "Dimmable Light - Somfy  - Light Receiver 2017",
		localPairing = true,
		0 = ()[115]
	},
	1099512021250 = {
		name = "Dimmable RGB Light Somfy - Light Receiver 2017",
		localPairing = true,
		0 = ()[127]
	},
	1099512021506 = {
		name = "Tunable White Receiver - Light Receiver 2017",
		localPairing = true,
		0 = ()[132]
	},
	1099512035842 = {
		name = "On/Off Light - Somfy  - Light Receiver 2017",
		localPairing = true,
		0 = ()[140]
	},
	1099512101378 = {
		name = "Discrete Gate Opener SOMFY (Axovia 3S)",
		localPairing = true,
		0 = ()[152]
	},
	1099512217602 = {
		name = "Door Lock With Unknown Position",
		localPairing = true,
		0 = {
			["io:LockUnlockDoorLockWithUnknownPositionIOComponent"] = {
				type = 1,
				widget = "LockUnlockDoorLockWithUnknownPosition",
				uiClass = "DoorLock",
				uiProfiles = ()[156],
				states = {
					2146500638 = ()[1],
					65537 = {
						linkedHighLevelState = {
							()[225]
						}
					},
					1 = ()[3],
					65556 = {
						linkedHighLevelState = {
							()[226]
						}
					},
					2147426304 = ()[4],
					2 = ()[56],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					getOpenClose = ()[158],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					pairOneWayController = ()[17],
					refreshLockedUnlocked = ()[158],
					setLockedUnlocked = {
						prototype = "string(locked;unlocked)",
						parameters = ()[11],
						converter = ()[327],
						extraDefinition = ()[18]
					},
					close = ()[439],
					lock = ()[439],
					open = ()[440],
					setOpenClosed = {
						prototype = "string(open;closed)",
						parameters = ()[11],
						aliasConverter = ()[328],
						converter = ()[327],
						extraDefinition = ()[18]
					},
					unlock = ()[440],
					setName = ()[20],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26],
					sendIOKey = ()[65]
				}
			}
		}
	},
	1099512283138 = {
		name = "Vertical Blind Uno",
		localPairing = true,
		0 = {
			["io:VerticalInteriorBlindUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "Screen",
				uiProfiles = ()[441],
				states = ()[443],
				attributes = ()[59],
				commands = ()[168]
			}
		}
	},
	1099512610818 = {
		name = "Cyclic Standard Receiver SOMFY",
		localPairing = true,
		0 = {
			["io:CyclicStandardReceiverIOComponent"] = {
				type = 1,
				widget = "CyclicGeneric",
				uiClass = "Generic",
				uiProfiles = {
					"Cyclic",
					"Generic"
				},
				states = {
					2146500638 = ()[1],
					1 = ()[3],
					2147426304 = ()[4],
					2 = ()[56],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					cycle = {
						converter = ()[329],
						extraDefinition = {
							access = "w",
							parameterId = "65786"
						}
					},
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					pairOneWayController = ()[17],
					setName = ()[20],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26],
					sendIOKey = ()[65]
				}
			}
		}
	},
	1099512611330 = {
		name = "Switch On/Off - micromodule SOMFY",
		localPairing = true,
		0 = {
			["io:SwitchMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "TimedOnOff",
				uiClass = "OnOff",
				uiProfiles = ()[133],
				states = ()[192],
				attributes = ()[59],
				commands = ()[198]
			}
		}
	},
	1099512676354 = {
		name = "Horizontal Awning Uno",
		localPairing = true,
		0 = {
			["io:HorizontalAwningUnoIOComponent"] = ()[445]
		}
	},
	1099512676610 = {
		name = "Pergola Warema SOMFY",
		localPairing = true,
		0 = {
			["io:PergolaHorizontalUnoIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwningUno",
				uiClass = "Pergola",
				uiProfiles = ()[446],
				states = ()[443],
				attributes = ()[59],
				commands = ()[202]
			}
		}
	},
	1099512741888 = {
		name = "Exterior Venetian Blind with WP",
		localPairing = true,
		0 = ()[447]
	},
	1099512872962 = {
		name = "Curtain track Uno",
		localPairing = true,
		0 = {
			["io:CurtainTrackUnoIOComponent"] = {
				type = 1,
				widget = "CurtainTrackUno",
				uiClass = "Curtain",
				uiProfiles = ()[448],
				states = {
					2146500638 = ()[1],
					1 = ()[3],
					2147426304 = ()[4],
					16832512 = ()[31],
					16830720 = ()[35],
					65537 = ()[442],
					16832522 = ()[75],
					2 = ()[56],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					pairOneWayController = ()[17],
					setClosure = ()[449],
					close = ()[450],
					open = ()[451],
					my = ()[452],
					setName = ()[20],
					setMemorized1Position = ()[47],
					refreshMemorized1Position = ()[37],
					startIdentify = ()[21],
					stop = ()[63],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26],
					sendIOKey = ()[65]
				}
			}
		}
	},
	1099513004034 = {
		name = "Heating Receiver io Dimming SOMFY",
		localPairing = true,
		0 = {
			["io:SimpleExteriorHeatingIOComponent"] = ()[227]
		}
	},
	1099513018882 = {
		name = "Heating Receiver io On Off SOMFY",
		localPairing = true,
		0 = ()[231]
	},
	1099513397506 = {
		name = "Sliding Window with lock SOMFY - Air",
		localPairing = true,
		0 = ()[251]
	},
	1099513528322 = {
		name = "Simple Bioclimatic Pergola Somfy",
		localPairing = true,
		0 = ()[453]
	},
	2199025156098 = {
		name = "Pergola Louver io",
		localPairing = true,
		0 = ()[453]
	},
	1099514970124 = {
		name = "Domestic hot water production (Atlantic)",
		localPairing = true,
		1 = {
			["io:AtlanticDomesticHotWaterProductionIOComponent"] = {
				type = 1,
				widget = "DomesticHotWaterProduction",
				uiClass = "WaterHeatingSystem",
				uiProfiles = ()[277],
				states = {
					201326593 = ()[278],
					16832527 = {
						linkedHighLevelState = {
							()[227],
							()[232]
						},
						linkedStateIds = ()[454]
					},
					2146500638 = ()[1],
					16832530 = {
						linkedHighLevelState = {
							()[228],
							()[232]
						},
						linkedStateIds = ()[455]
					},
					16832534 = {
						linkedHighLevelState = {
							()[229],
							()[232]
						},
						linkedStateIds = ()[456]
					},
					16832531 = {
						linkedHighLevelState = {
							()[230],
							()[232]
						},
						linkedStateIds = ()[457]
					},
					201328385 = ()[288],
					1 = ()[3],
					65553 = ()[292],
					16832522 = {
						linkedHighLevelState = {
							()[231],
							()[232]
						},
						linkedStateIds = ()[458]
					},
					2147426304 = ()[4],
					16830720 = {
						linkedHighLevelState = {
							()[232]
						},
						linkedStateIds = ()[459]
					},
					65537 = {
						linkedHighLevelState = {
							()[233]
						}
					},
					201326849 = ()[295],
					201327873 = ()[297],
					201328641 = {
						linkedHighLevelState = {
							()[234]
						}
					},
					201327105 = ()[300],
					201328129 = ()[301],
					201327361 = ()[302],
					65552 = ()[307],
					65547 = ()[313]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshAwayModeDuration = ()[316],
					refreshBoostModeDuration = ()[318],
					refreshCurrentOperatingMode = ()[233],
					refreshDHWCapacity = ()[319],
					refreshDHWError = ()[320],
					refreshDHWMode = ()[321],
					refreshManufacturerName = ()[325],
					refreshOperatingModeCapabilities = ()[327],
					refreshOperatingTime = ()[329],
					refreshRateManagement = ()[331],
					refreshTargetTemperature = ()[158],
					refreshWaterConsumption = ()[333],
					setAwayModeDuration = ()[335],
					setBoostModeDuration = ()[337],
					setComfortTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[11],
						converter = ()[334],
						extraDefinition = ()[183]
					},
					setCurrentOperatingMode = ()[338],
					setDHWMode = ()[339],
					setEcoTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[11],
						converter = ()[334],
						extraDefinition = ()[234]
					},
					setFrostProtectionTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[11],
						converter = ()[334],
						extraDefinition = ()[344]
					},
					setHaltedTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[11],
						converter = ()[334],
						extraDefinition = ()[346]
					},
					setName = ()[20],
					setRateManagement = ()[351],
					setTargetTemperature = {
						prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
						parameters = ()[11],
						converter = ()[335],
						extraDefinition = ()[18]
					},
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					wink = ()[26]
				}
			}
		},
		2 = ()[358]
	},
	1103806726146 = {
		name = "Thermostatic valve SOMFY",
		localPairing = true,
		1 = {
			["io:HeatingValveIOComponent"] = {
				type = 1,
				widget = "ValveHeatingTemperatureInterface",
				uiClass = "HeatingSystem",
				uiProfiles = ()[460],
				states = {
					84059684 = {
						linkedHighLevelState = {
							()[235],
							()[243],
							()[244],
							()[246],
							()[251],
							()[255],
							()[260]
						}
					},
					84059682 = ()[461],
					84059685 = ()[462],
					84059681 = ()[463],
					2146500638 = ()[1],
					2415919105 = ()[384],
					84059680 = {
						linkedHighLevelState = {
							()[245],
							()[247],
							()[249],
							()[250],
							()[256]
						}
					},
					2147426304 = ()[4],
					84059686 = ()[464],
					84059687 = ()[465]
				},
				commands = {
					advancedRefresh = ()[374],
					delayedStopIdentify = ()[13],
					exitDerogation = ()[467],
					getName = ()[386],
					identify = ()[15],
					setAllModeTemperatures = ()[468],
					setDerogation = ()[469],
					setName = ()[387],
					setTimeProgramById = ()[470],
					setValveSettings = {
						prototype = "object",
						parameters = ()[11],
						rawStates = {},
						converter = ()[372],
						extraDefinition = ()[195]
					},
					startIdentify = ()[21],
					stopIdentify = ()[22],
					wink = ()[26]
				}
			}
		},
		2 = ()[473]
	},
	1103815311362 = {
		name = "Closure sensor - Slim DO SOMFY",
		localPairing = true,
		0 = {
			["io:SomfyBasicContactIOSystemSensor"] = ()[404]
		}
	},
	2199023386626 = {
		name = "Roller Shutter With Low Speed Management SOMFY (WT)",
		localPairing = true,
		0 = ()[424]
	},
	2199023386882 = {
		name = "VR Holla SOMFY",
		localPairing = true,
		0 = {
			["io:VRHollaIOComponent"] = {
				type = 1,
				widget = "PositionableOrProgressiveOrientableRollerShutter",
				uiClass = "AdjustableSlatsRollerShutter",
				uiProfiles = ()[474],
				states = ()[76],
				attributes = ()[59],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					keepOneWayControllersAndDeleteNode = ()[61],
					runManufacturerSettingsCommand = ()[62],
					pairOneWayController = ()[17],
					setClosureAndOrientation = ()[475],
					setClosureOrOrientation = ()[77],
					setClosureOrRockerPosition = ()[78],
					close = ()[79],
					down = ()[79],
					open = ()[80],
					setClosure = ()[81],
					setDeployment = ()[81],
					setRockerPosition = ()[82],
					up = ()[80],
					setName = ()[20],
					setOrientation = ()[83],
					startIdentify = ()[21],
					stop = ()[84],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					unpairOneWayController = ()[24],
					setConfigState = ()[25],
					wink = ()[26],
					sendIOKey = ()[65]
				}
			}
		}
	},
	2199023452162 = {
		name = "Vertical Exterior Awning Uno",
		localPairing = true,
		0 = {
			["io:VerticalExteriorAwningUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[476],
				states = {
					65537 = {
						linkedHighLevelState = {
							()[20],
							()[5],
							()[12],
							()[10]
						},
						linkedStateIds = ()[29]
					},
					2146500638 = ()[1],
					16832512 = ()[31],
					1 = ()[3],
					16832522 = ()[33],
					2147426304 = ()[4],
					16830720 = ()[35],
					2 = ()[56],
					65557 = ()[36],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = ()[90]
			}
		}
	},
	2199023598082 = {
		name = "Discrete Garage Door Opener SOMFY (Rollixo IO)",
		localPairing = true,
		0 = ()[100]
	},
	2199023729154 = {
		name = "Discrete Gate Opener SOMFY (Axovia 200 3S)",
		localPairing = true,
		0 = ()[152]
	},
	2199023910914 = {
		name = "Sonesse 40 SOMFY",
		localPairing = true,
		0 = ()[169]
	},
	2199024304130 = {
		name = "Awning Receiver Uno SOMFY",
		localPairing = true,
		0 = {
			["io:AwningReceiverUnoIOComponent"] = ()[445]
		}
	},
	2199024304386 = {
		name = "Pergola Rail Guided Awning SOMFY - Pergola CQFD",
		localPairing = true,
		0 = ()[205]
	},
	3298535932162 = {
		name = "Pergola RGS 50/60 SOMFY",
		localPairing = true,
		0 = ()[205]
	},
	2199024369666 = {
		name = "Exterior Venetian Blind Uno",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindUnoIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindUno",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = {
					"VenetianBlind",
					"OrientableAndCloseable",
					"OpenClose"
				},
				states = {
					2146500638 = ()[1],
					16832512 = ()[31],
					17029120 = ()[211],
					1 = ()[3],
					16832522 = ()[33],
					2147426304 = ()[4],
					16830720 = ()[35],
					65537 = ()[442],
					2 = ()[56],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = ()[217]
			}
		}
	},
	2199026597900 = {
		name = "Domestic hot water production (Atlantic V3)",
		localPairing = true,
		1 = {
			["io:AtlanticDomesticHotWaterProductionV3IOComponent"] = {
				type = 1,
				widget = "DomesticHotWaterProduction",
				uiClass = "WaterHeatingSystem",
				uiProfiles = ()[277],
				states = {
					201326593 = ()[278],
					16832527 = {
						linkedHighLevelState = {
							()[265],
							()[270]
						},
						linkedStateIds = ()[454]
					},
					201330433 = ()[284],
					2146500638 = ()[1],
					16832530 = {
						linkedHighLevelState = {
							()[266],
							()[270]
						},
						linkedStateIds = ()[455]
					},
					16832534 = {
						linkedHighLevelState = {
							()[267],
							()[270]
						},
						linkedStateIds = ()[456]
					},
					16832531 = {
						linkedHighLevelState = {
							()[268],
							()[270]
						},
						linkedStateIds = ()[457]
					},
					201328385 = ()[288],
					1 = ()[3],
					65553 = ()[292],
					16832522 = {
						linkedHighLevelState = {
							()[269],
							()[270]
						},
						linkedStateIds = ()[458]
					},
					2147426304 = ()[4],
					16830720 = {
						linkedHighLevelState = {
							()[270]
						},
						linkedStateIds = ()[459]
					},
					65537 = {
						linkedHighLevelState = {
							()[271]
						}
					},
					201326849 = ()[295],
					201329665 = ()[296],
					201327873 = ()[297],
					201330945 = ()[298],
					201328641 = ()[299],
					201327105 = ()[300],
					201328129 = ()[301],
					201327361 = ()[302],
					201330177 = ()[303],
					201331457 = ()[304],
					201330689 = ()[305],
					65552 = ()[307],
					201329153 = ()[308],
					201329409 = ()[312],
					65547 = ()[313],
					201331201 = ()[314]
				},
				attributes = ()[5],
				commands = {
					advancedRefresh = ()[10],
					delayedStopIdentify = ()[13],
					getName = ()[14],
					identify = ()[15],
					pairOneWayController = ()[17],
					refreshAntiLegionellosis = ()[315],
					refreshAwayModeDuration = ()[316],
					refreshBoilerInstallationOption = ()[317],
					refreshBoostModeDuration = ()[318],
					refreshCurrentOperatingMode = ()[233],
					refreshDHWCapacity = ()[319],
					refreshDHWError = ()[320],
					refreshDHWMode = ()[321],
					refreshElectricalExtraManagement = ()[322],
					refreshExtractionOption = ()[323],
					refreshInstallation = ()[324],
					refreshManufacturerName = ()[325],
					refreshOperatingModeCapabilities = ()[327],
					refreshOperatingRange = ()[328],
					refreshOperatingTime = ()[329],
					refreshProgrammingSlots = ()[330],
					refreshRateManagement = ()[331],
					refreshSmartGridOption = ()[332],
					refreshTargetTemperature = ()[158],
					refreshWaterConsumption = ()[333],
					setAntiLegionellosis = ()[334],
					setAwayModeDuration = ()[335],
					setBoilerInstallationOption = ()[336],
					setBoostModeDuration = ()[337],
					setComfortTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[11],
						converter = ()[378],
						extraDefinition = ()[183]
					},
					setCurrentOperatingMode = ()[338],
					setDHWMode = ()[339],
					setDateTime = ()[340],
					setEcoTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[11],
						converter = ()[378],
						extraDefinition = ()[234]
					},
					setElectricalExtraManagement = ()[342],
					setExtractionOption = ()[343],
					setFrostProtectionTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[11],
						converter = ()[378],
						extraDefinition = ()[344]
					},
					setHaltedTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[11],
						converter = ()[378],
						extraDefinition = ()[346]
					},
					setInstallation = ()[348],
					setName = ()[20],
					setOperatingRange = ()[349],
					setProgrammingSlots = ()[350],
					setRateManagement = ()[351],
					setSmartGridOption = ()[352],
					setTargetTemperature = {
						prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
						parameters = ()[11],
						converter = ()[379],
						extraDefinition = ()[18]
					},
					startIdentify = ()[21],
					stopIdentify = ()[22],
					unpairAllOneWayControllers = ()[23],
					unpairOneWayController = ()[24],
					wink = ()[26]
				}
			}
		},
		2 = ()[358]
	},
	2203318353922 = {
		name = "Thermostat SOMFY",
		localPairing = true,
		1 = {
			["io:HeatingThermostatIOComponent"] = {
				type = 1,
				widget = "ThermostatHeatingTemperatureInterface",
				uiClass = "HeatingSystem",
				uiProfiles = ()[460],
				states = {
					84059684 = {
						linkedHighLevelState = {
							()[235],
							()[272],
							()[243],
							()[244],
							()[246],
							()[273],
							()[274],
							()[277],
							()[278],
							()[260]
						}
					},
					84059682 = ()[461],
					84059685 = ()[462],
					84059681 = ()[463],
					2146500638 = ()[1],
					2415919105 = ()[384],
					84059680 = {
						linkedHighLevelState = {
							()[245],
							()[247],
							()[275],
							()[276],
							()[256]
						}
					},
					2147426304 = ()[4],
					84059686 = ()[464],
					84059687 = ()[465]
				},
				commands = {
					advancedRefresh = ()[374],
					delayedStopIdentify = ()[13],
					exitDerogation = ()[467],
					getName = ()[386],
					identify = ()[15],
					setAllModeTemperatures = ()[468],
					setDerogation = ()[469],
					setName = ()[387],
					setThermostatSettings = {
						prototype = "object",
						parameters = ()[11],
						rawStates = {},
						converter = ()[386],
						extraDefinition = ()[195]
					},
					setTimeProgramById = ()[470],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					wink = ()[26]
				}
			}
		},
		2 = ()[473],
		3 = {
			["io:RelativeHumidityIOSystemSensor"] = {
				type = 2,
				widget = "RelativeHumiditySensor",
				uiClass = "HumiditySensor",
				uiProfiles = ()[379],
				states = {
					2146500638 = ()[1],
					84059680 = {
						linkedHighLevelState = {
							()[279]
						}
					},
					84059682 = ()[471],
					2147426304 = ()[4]
				},
				attributes = ()[380],
				commands = ()[472]
			}
		}
	},
	3298535014402 = {
		name = "Roller Shutter Uno SOMFY",
		localPairing = true,
		0 = ()[478]
	},
	3298535079938 = {
		name = "Pergola Side Screen SOMFY",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = {
					65537 = ()[480],
					2146500638 = ()[1],
					16832512 = ()[31],
					1 = ()[3],
					16832522 = ()[33],
					2147426304 = ()[4],
					2 = ()[56],
					2146500645 = ()[57],
					65557 = ()[36],
					16830720 = ()[35]
				},
				attributes = ()[59],
				commands = ()[90]
			}
		}
	},
	3298535225858 = {
		name = "Discrete Garage Door Opener SOMFY (Metro Smart 800 IO)",
		localPairing = true,
		0 = ()[438]
	},
	3298535356930 = {
		name = "Discrete Gate Opener SOMFY (Ixengo 3S)",
		localPairing = true,
		0 = ()[152]
	},
	3298535538690 = {
		name = "Actuo 40 SOMFY",
		localPairing = true,
		0 = ()[169]
	},
	3298535931906 = {
		name = "Horizontal Awning Somfy - Sunea Sunilus CQFD",
		localPairing = true,
		0 = ()[203]
	},
	3298535997442 = {
		name = "Exterior Venetian Blind J4 with WP2",
		localPairing = true,
		0 = ()[482]
	},
	3298538225676 = {
		name = "Domestic hot water production (Atlantic V2 - AEX)",
		localPairing = true,
		1 = {
			["io:AtlanticDomesticHotWaterProductionV2_AEX_IOComponent"] = ()[355]
		},
		2 = ()[358]
	},
	4398046642178 = {
		name = "Roller Shutter Receiver Uno SOMFY",
		localPairing = true,
		0 = ()[478]
	},
	4398046707714 = {
		name = "Drop Arm Awning SOMFY",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = {
					65537 = ()[484],
					2146500638 = ()[1],
					16832512 = ()[31],
					1 = ()[3],
					16832522 = ()[33],
					2147426304 = ()[4],
					2 = ()[56],
					65557 = ()[36],
					16830720 = ()[35],
					2146500645 = ()[57]
				},
				attributes = ()[59],
				commands = ()[90]
			}
		}
	},
	4398046853634 = {
		name = "Discrete Garage Door Opener SOMFY (Metro Smart 1000 IO)",
		localPairing = true,
		0 = ()[438]
	},
	4398046984706 = {
		name = "Discrete Gate Opener SOMFY (Invisio 3S)",
		localPairing = true,
		0 = ()[152]
	},
	4398047166466 = {
		name = "Optuo 40 SOMFY",
		localPairing = true,
		0 = ()[169]
	},
	4398047559682 = {
		name = "Horizontal Awning Somfy - Sunea Screen 40",
		localPairing = true,
		0 = ()[203]
	},
	4398049853452 = {
		name = "Domestic hot water production (Atlantic V2 - MURAL)",
		localPairing = true,
		1 = {
			["io:AtlanticDomesticHotWaterProductionV2_MURAL_IOComponent"] = ()[486]
		},
		2 = ()[358]
	},
	5497558269954 = {
		name = "Roller Shutter SOMFY - Altus RS",
		localPairing = true,
		0 = ()[67]
	},
	5497558335490 = {
		name = "Awning Valance SOMFY",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[89],
				attributes = ()[59],
				commands = ()[90]
			}
		}
	},
	5497558481410 = {
		name = "Discrete Garage Door Opener SOMFY (Dexxo Smart io 1000)",
		localPairing = true,
		0 = ()[438]
	},
	5497558612482 = {
		name = "Discrete Gate Opener SOMFY (Elixo 3S)",
		localPairing = true,
		0 = ()[152]
	},
	5497558794242 = {
		name = "Sonesse Wirefree",
		localPairing = true,
		0 = {
			["io:VerticalInteriorBlindWithBatterySomfyIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "Screen",
				uiProfiles = ()[167],
				states = ()[488],
				attributes = ()[59],
				commands = ()[168]
			}
		}
	},
	5497559187458 = {
		name = "Horizontal Awning Somfy - Sunea 50 CSI",
		localPairing = true,
		0 = ()[203]
	},
	5497561481228 = {
		name = "Domestic hot water production (Atlantic V2 - SPLIT)",
		localPairing = true,
		1 = {
			["io:AtlanticDomesticHotWaterProductionV2_SPLIT_IOComponent"] = ()[355]
		},
		2 = ()[358]
	},
	6597069897730 = {
		name = "Roller Shutter SOMFY - Oximo 40",
		localPairing = true,
		0 = ()[67]
	},
	14293651292162 = {
		name = "Roller Shutter SOMFY with battery",
		localPairing = true,
		0 = {
			["io:RollerShutterWithBatterySomfyIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = ()[488],
				attributes = ()[59],
				commands = ()[66]
			}
		}
	},
	6597069963266 = {
		name = "Screen Receiver Uno SOMFY",
		localPairing = true,
		0 = {
			["io:ScreenReceiverUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[489],
				states = ()[443],
				attributes = ()[59],
				commands = ()[90]
			}
		}
	},
	6597070109186 = {
		name = "Discrete Garage Door Opener SOMFY (Rollixo Smart IO)",
		localPairing = true,
		0 = ()[100]
	},
	6597070240258 = {
		name = "Discrete Gate Opener SOMFY (Elixo Smart)",
		localPairing = true,
		0 = ()[490]
	},
	6597073109004 = {
		name = "Domestic hot water production (Atlantic V2 - V2 TEC5)",
		localPairing = true,
		1 = {
			["io:AtlanticDomesticHotWaterProductionV2_TEC5_IOComponent"] = ()[355]
		},
		2 = ()[358]
	},
	7696581525506 = {
		name = "Roller Shutter SOMFY - Awmio - Oximo CQFD",
		localPairing = true,
		0 = ()[67]
	},
	15393162919938 = {
		name = "Roller Shutter SOMFY - Awmio - Oximo CQFD Redesign",
		localPairing = true,
		0 = ()[67]
	},
	7696581591042 = {
		name = "Vertical Exterior Awning SOMFY - AWMIO",
		localPairing = true,
		0 = ()[91]
	},
	7696581868034 = {
		name = "Discrete Gate Opener SOMFY (Roly Smart IO)",
		localPairing = true,
		0 = ()[490]
	},
	7696584736780 = {
		name = "Domestic hot water production (Atlantic V2 - CE FLAT C2)",
		localPairing = true,
		1 = {
			["io:AtlanticDomesticHotWaterProductionV2_CE_FLAT_C2_IOComponent"] = ()[493]
		},
		2 = ()[358]
	},
	8796093153282 = {
		name = "Roller Shutter SOMFY - Short Motor IO",
		localPairing = true,
		0 = ()[67]
	},
	8796093218818 = {
		name = "Vertical Exterior Awning SOMFY - Sunea Sunilus",
		localPairing = true,
		0 = ()[91]
	},
	8796096364556 = {
		name = "Domestic hot water production (Atlantic V2 - CE S4)",
		localPairing = true,
		1 = {
			["io:AtlanticDomesticHotWaterProductionV2_CE_S4_IOComponent"] = ()[493]
		},
		2 = ()[358]
	},
	9895604781058 = {
		name = "Roller Shutter SOMFY - MicroModule IO",
		localPairing = true,
		0 = {
			["io:MicroModuleRollerShutterSomfyIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = {
					65537 = ()[68],
					2146500638 = ()[1],
					16832512 = ()[69],
					1 = ()[3],
					16832522 = ()[70],
					2147426304 = ()[4],
					2 = ()[56],
					2146500645 = ()[57],
					84059655 = ()[191]
				},
				attributes = ()[59],
				commands = ()[66]
			}
		}
	},
	9895604846594 = {
		name = "Vertical Exterior Awning SOMFY - Slim Receiver",
		localPairing = true,
		0 = ()[91]
	},
	9895607992332 = {
		name = "Domestic hot water production (Atlantic V2 - CETHI V4)",
		localPairing = true,
		1 = {
			["io:AtlanticDomesticHotWaterProductionV2_CETHI_V4_IOComponent"] = ()[486]
		},
		2 = ()[358]
	},
	10995116408834 = {
		name = "Roller Shutter With Low Speed Management SOMFY (AIR)",
		localPairing = true,
		0 = ()[424]
	},
	10995116474370 = {
		name = "Vertical Exterior Awning SOMFY - Universal Screen",
		localPairing = true,
		0 = ()[91]
	},
	10995119620108 = {
		name = "Domestic hot water production (Atlantic V2 - CV4E)",
		localPairing = true,
		1 = {
			["io:AtlanticDomesticHotWaterProductionV2_CV4E_IOComponent"] = ()[486]
		},
		2 = ()[358]
	},
	12094628036610 = {
		name = "Roller Shutter SOMFY - Ilmo 2 50",
		localPairing = true,
		0 = ()[67]
	},
	12094628102146 = {
		name = "Sunea 40 - Vertical Exterior Awning SOMFY",
		localPairing = true,
		0 = ()[91]
	},
	13194139664386 = {
		name = "Roller Shutter SOMFY - Solus P&P 50",
		localPairing = true,
		0 = ()[67]
	},
	17592187158530 = {
		name = "Exterior Venetian Blind - J4 IO",
		localPairing = true,
		0 = ()[218]
	},
	18691698786306 = {
		name = "Exterior Venetian Blind with WP - J4 IO",
		localPairing = true,
		0 = ()[447]
	},
	20890722041858 = {
		name = "Exterior Venetian Blind J4 with WP2  - J4 IO",
		localPairing = true,
		0 = ()[482]
	},
	35184373202946 = {
		name = "Exterior Venetian Blind - EVB RTX BRIDGE",
		localPairing = true,
		0 = ()[218]
	},
	36283884830722 = {
		name = "Exterior Venetian Blind with WP - EVB RTX BRIDGE",
		localPairing = true,
		0 = ()[447]
	},
	38482908086274 = {
		name = "Exterior Venetian Blind J4 with WP2 - EVB RTX BRIDGE",
		localPairing = true,
		0 = ()[482]
	},
	52776559247362 = {
		name = "Exterior Venetian Blind - J4 IO PROTECT",
		localPairing = true,
		0 = ()[218]
	},
	53876070875138 = {
		name = "Exterior Venetian Blind with WP - J4 IO PROTECT",
		localPairing = true,
		0 = ()[447]
	},
	56075094130690 = {
		name = "Exterior Venetian Blind J4 with WP2 - J4 IO PROTECT",
		localPairing = true,
		0 = ()[482]
	},
	25836848128 = {
		name = "Remote Controller (Public Trame)",
		localPairing = true,
		0 = {
			["io:GenericOneWayController"] = ()[494]
		}
	},
	25836848384 = {
		name = "V500 Remote Controller",
		localPairing = true,
		0 = {
			["io:V500Controller"] = ()[494]
		}
	},
	25836848640 = {
		name = "Keypad Remote Controller",
		localPairing = true,
		0 = {
			["io:KeypadController"] = ()[420]
		}
	},
	13194139729922 = {
		name = "Pergola Side Screen With Battery SOMFY",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenWithBatteryIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = {
					65537 = ()[480],
					2146500638 = ()[1],
					16832512 = ()[31],
					1 = ()[3],
					16832522 = ()[33],
					2147426304 = ()[4],
					2 = ()[56],
					2146500645 = ()[57],
					65556 = ()[260],
					65557 = ()[36],
					16830720 = ()[35]
				},
				attributes = ()[59],
				commands = ()[90]
			}
		}
	},
	14293651357698 = {
		name = "Awning Valance With Battery SOMFY",
		localPairing = true,
		0 = {
			["io:AwningValanceWithBatteryIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[495],
				attributes = ()[59],
				commands = ()[90]
			}
		}
	},
	15393162985474 = {
		name = "Drop Arm Awning With Battery SOMFY",
		localPairing = true,
		0 = {
			["io:DropArmAwningWithBatteryIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = {
					65537 = ()[484],
					2146500638 = ()[1],
					16832512 = ()[31],
					1 = ()[3],
					16832522 = ()[33],
					2147426304 = ()[4],
					2 = ()[56],
					2146500645 = ()[57],
					65556 = ()[260],
					65557 = ()[36],
					16830720 = ()[35]
				},
				attributes = ()[59],
				commands = ()[90]
			}
		}
	},
	16492674613250 = {
		name = "Vertical Exterior Awning With Battery SOMFY",
		localPairing = true,
		0 = {
			["io:VerticalExteriorAwningWithBatteryIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[87],
				states = ()[495],
				attributes = ()[59],
				commands = ()[90]
			}
		}
	},
	16492674547714 = {
		name = "Dynamic Roller Shutter",
		localPairing = true,
		1 = {
			["io:DynamicRollerShutterIOComponent"] = {
				type = 1,
				widget = "DynamicRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = {
					65537 = ()[55],
					2146500638 = ()[1],
					16832512 = ()[31],
					1 = ()[3],
					16832522 = ()[33],
					2147426304 = ()[4],
					16830720 = ()[35],
					65557 = ()[36],
					2 = ()[56],
					2146500645 = ()[57],
					65556 = ()[260],
					67362619648 = ()[496]
				},
				attributes = {
					["core:FirmwareRevision"] = ()[0],
					["core:Manufacturer"] = ()[1],
					["core:SupportedManufacturerSettingsCommands"] = ()[2],
					["io:Features"] = ()[37]
				},
				commands = ()[423]
			}
		},
		2 = ()[497]
	},
	4504699139653634 = {
		name = "Actuo 40 io",
		localPairing = true,
		0 = ()[511]
	},
	4504699139129602 = {
		name = "Altus GradHermetic io",
		localPairing = true,
		0 = {
			["io:GradHermeticIOComponent"] = {
				type = 1,
				widget = "PositionableOrOrientableRollerShutter",
				uiClass = "AdjustableSlatsRollerShutter",
				uiProfiles = ()[72],
				states = {
					84082687 = {
						linkedHighLevelState = ()[512],
						linkedStateIds = ()[513]
					},
					65537 = {
						linkedHighLevelState = {
							()[306],
							()[17],
							()[16],
							()[10]
						},
						linkedStateIds = ()[514]
					},
					65540 = {
						linkedHighLevelState = {
							()[306],
							()[18]
						},
						linkedStateIds = ()[515]
					},
					48177664 = {
						linkedHighLevelState = ()[512],
						linkedStateIds = ()[516]
					},
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832512 = ()[74],
					16832522 = ()[75],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[517],
				commands = {
					setName = ()[20],
					setOrientation = ()[83],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setConfigState = ()[25],
					setClosureOrRockerPosition = ()[78],
					close = ()[79],
					down = ()[79],
					open = ()[80],
					setClosure = ()[81],
					setDeployment = ()[81],
					setRockerPosition = ()[82],
					up = ()[80],
					startIdentify = ()[21],
					stop = ()[84],
					stopIdentify = ()[22],
					wink = ()[26],
					setClosureOrOrientation = ()[77],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[521],
						converter = ()[405],
						extraDefinition = ()[45]
					},
					pairOneWayController = ()[17],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ()[8],
						rawStates = ()[521],
						converter = ()[406],
						extraDefinition = ()[9]
					}
				}
			}
		}
	},
	4505798650757378 = {
		name = "Altus GradHermetic io",
		localPairing = true,
		0 = ()[523]
	},
	4504699139129346 = {
		name = "Altus RS io",
		localPairing = true,
		0 = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = {
					16832512 = ()[31],
					84082687 = {
						linkedHighLevelState = {
							()[308]
						},
						linkedStateIds = ()[243]
					},
					65537 = {
						linkedHighLevelState = {
							()[308],
							()[5],
							()[12],
							()[10]
						},
						linkedStateIds = ()[524]
					},
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[507],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[525],
						converter = ()[411],
						extraDefinition = ()[45]
					},
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ()[8],
						rawStates = ()[525],
						converter = ()[412],
						extraDefinition = ()[9]
					}
				}
			}
		}
	},
	4504699139471874 = ()[566],
	4505798651099650 = ()[566],
	4506898162727426 = ()[566],
	4507997674355202 = ()[566],
	4509097185982978 = ()[567],
	4510196697610754 = ()[567],
	4511296209238530 = ()[567],
	4504699139340802 = ()[575],
	4505798650968578 = ()[575],
	4506898162596354 = ()[575],
	4507997674224130 = ()[576],
	4509097185851906 = ()[576],
	4510196697479682 = ()[576],
	4511296209107458 = ()[577],
	4512395720735234 = ()[577],
	4513495232363010 = ()[577],
	4514594743990786 = ()[578],
	4515694255618562 = ()[578],
	4516793767246338 = ()[578],
	4504699140112386 = {
		name = "EVB-Slim Receiver for Variation WP IO Plug",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[583],
				attributes = ()[584],
				commands = ()[588]
			}
		}
	},
	4505798651740162 = ()[589],
	4506898163367938 = ()[589],
	4507997674995714 = {
		name = "EVB-Slim Receiver for Variation WP IO Plug",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[583],
				attributes = ()[584],
				commands = ()[588]
			}
		}
	},
	4509097186623490 = {
		name = "EVB-Slim Receiver for Variation",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[596],
				attributes = ()[597],
				commands = ()[601]
			}
		}
	},
	4510196698251266 = ()[603],
	4511296209879042 = ()[603],
	4512395721506818 = {
		name = "EVB-Slim Receiver for Variation",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[596],
				attributes = ()[597],
				commands = ()[601]
			}
		}
	},
	4512395720866306 = ()[607],
	4513495232494082 = ()[607],
	4514594744121858 = ()[607],
	4515694255749634 = ()[607],
	4516793767377410 = ()[611],
	4517893279005186 = ()[611],
	4518992790632962 = ()[612],
	4520092302260738 = ()[612],
	4521191813888514 = ()[611],
	4522291325516290 = ()[612],
	4504699140389378 = {
		name = "Heat Slim Rec io",
		localPairing = true,
		0 = {
			["io:DiscreteExteriorHeatingIOComponent"] = {
				type = 1,
				widget = "DiscreteExteriorHeating",
				uiClass = "ExteriorHeatingSystem",
				uiProfiles = ()[228],
				states = {
					84059651 = ()[613],
					65537 = {
						linkedHighLevelState = {
							()[315],
							()[57]
						},
						linkedStateIds = ()[614]
					},
					2147426304 = ()[4],
					1 = ()[3],
					2 = ()[505],
					2146500638 = ()[1],
					2146500645 = ()[57]
				},
				attributes = ()[615],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					off = ()[229],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[617],
					pairOneWayController = ()[17],
					advancedRefresh = ()[618],
					on = ()[230]
				}
			}
		}
	},
	4504699140374530 = {
		name = "Heating Variation io",
		localPairing = true,
		0 = {
			["io:SimpleExteriorHeatingIOComponent"] = {
				type = 1,
				widget = "DimmerExteriorHeating",
				uiClass = "ExteriorHeatingSystem",
				uiProfiles = ()[221],
				states = {
					16832512 = ()[69],
					84059651 = ()[613],
					65537 = {
						linkedHighLevelState = {
							()[315],
							()[1]
						},
						linkedStateIds = ()[614]
					},
					2147426304 = ()[4],
					1 = ()[3],
					2146500645 = ()[57],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[615],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setLevel = ()[222],
					off = ()[223],
					on = ()[224],
					my = ()[226],
					setConfigState = ()[25],
					getLevel = ()[158],
					startIdentify = ()[21],
					stopIdentify = ()[22],
					setMemorized1Position = ()[47],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[617],
					pairOneWayController = ()[17],
					advancedRefresh = ()[618]
				}
			}
		}
	},
	4506898162385154 = {
		name = "Holla Slateo B",
		localPairing = true,
		0 = {
			["io:VRHollaIOComponent"] = {
				type = 1,
				widget = "PositionableOrProgressiveOrientableRollerShutter",
				uiClass = "AdjustableSlatsRollerShutter",
				uiProfiles = ()[474],
				states = {
					84059651 = ()[500],
					65537 = {
						linkedHighLevelState = {
							()[305],
							()[17],
							()[16],
							()[10]
						},
						linkedStateIds = ()[501]
					},
					84059661 = ()[503],
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					65540 = ()[73],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832512 = ()[74],
					16832522 = ()[75],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[507],
				commands = {
					setName = ()[20],
					setOrientation = ()[83],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setClosureAndOrientation = ()[475],
					setConfigState = ()[25],
					setClosureOrRockerPosition = ()[78],
					close = ()[79],
					down = ()[79],
					open = ()[80],
					setClosure = ()[81],
					setDeployment = ()[81],
					setRockerPosition = ()[82],
					up = ()[80],
					startIdentify = ()[21],
					stop = ()[84],
					stopIdentify = ()[22],
					wink = ()[26],
					setClosureOrOrientation = ()[77],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[509],
						converter = ()[441],
						extraDefinition = ()[45]
					},
					pairOneWayController = ()[17],
					advancedRefresh = ()[510]
				}
			}
		}
	},
	4505798650757122 = {
		name = "Ilmo io",
		localPairing = true,
		0 = ()[619]
	},
	4523390837144066 = ()[620],
	4524490348771842 = ()[620],
	4525589860399618 = ()[620],
	4526689372027394 = ()[620],
	4527788883655170 = ()[623],
	4528888395282946 = ()[623],
	4529987906910722 = ()[623],
	4531087418538498 = ()[623],
	4504699139981826 = {
		name = "Izymo ON/OFF Micromodule io",
		localPairing = true,
		0 = {
			["io:SwitchMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "TimedOnOff",
				uiClass = "OnOff",
				uiProfiles = ()[133],
				states = ()[624],
				attributes = ()[625],
				commands = ()[627]
			}
		}
	},
	4505798651609602 = {
		name = "Izymo ON/OFF Micromodule io",
		localPairing = true,
		0 = {
			["io:LightMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "TimedOnOffLight",
				uiClass = "Light",
				uiProfiles = ()[133],
				states = ()[624],
				attributes = ()[625],
				commands = ()[627]
			}
		}
	},
	4504699139391490 = {
		name = "Izymo Dimmer Micromodule io",
		localPairing = true,
		0 = {
			["io:DimmableLightMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "DimmerLight",
				uiClass = "Light",
				uiProfiles = ()[101],
				states = {
					16832512 = ()[103],
					65537 = {
						linkedHighLevelState = {
							()[318],
							()[23],
							()[25]
						},
						linkedStateIds = {
							"84059651",
							"84059656"
						}
					},
					84059656 = {
						linkedHighLevelState = ()[628],
						linkedStateIds = ()[502]
					},
					84059651 = {
						linkedHighLevelState = ()[628],
						linkedStateIds = {
							"65537",
							"84059656"
						}
					},
					2147426304 = ()[4],
					1 = ()[3],
					2146500645 = ()[57],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ()[50],
					["core:Manufacturer"] = ()[1],
					["core:FirmwareRevision"] = ()[0]
				},
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					unpairOneWayController = ()[24],
					getName = ()[14],
					delayedStopIdentify = ()[13],
					increaseIntensityForBoundConfiguration = ()[208],
					unpairAllOneWayControllers = ()[23],
					setPosition = ()[112],
					my = ()[113],
					stopIdentify = ()[22],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[629],
						converter = ()[454],
						extraDefinition = ()[45]
					},
					refreshMemorized1Position = ()[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ()[8],
						rawStates = ()[629],
						converter = ()[455],
						extraDefinition = ()[9]
					},
					saveBound = ()[210],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					identify = ()[15],
					setConfigState = ()[25],
					startIdentify = ()[21],
					setIntensityWithTimer = ()[109],
					onWithTimer = ()[110],
					setIntensity = ()[104],
					off = ()[105],
					on = ()[106],
					setOnOff = ()[107],
					setMemorized1Position = ()[111],
					wink = ()[26],
					pairOneWayController = ()[17],
					decreaseIntensityForBoundConfiguration = ()[209]
				}
			}
		}
	},
	4513495233134594 = {
		name = "J4 io Plate",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[635],
				attributes = ()[636],
				commands = ()[640]
			}
		}
	},
	4514594744762370 = ()[642],
	4515694256390146 = ()[642],
	4516793768017922 = {
		name = "J4 io Plate",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[635],
				attributes = ()[636],
				commands = ()[640]
			}
		}
	},
	4517893279645698 = {
		name = "J4 io Plate",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[596],
				attributes = ()[643],
				commands = ()[645]
			}
		}
	},
	4518992791273474 = ()[646],
	4520092302901250 = ()[646],
	4521191814529026 = {
		name = "J4 io Plate",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[596],
				attributes = ()[643],
				commands = ()[645]
			}
		}
	},
	4522291326156802 = {
		name = "J4 io Plate",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[650],
				attributes = ()[636],
				commands = ()[653]
			}
		}
	},
	4523390837784578 = ()[654],
	4524490349412354 = ()[654],
	4525589861040130 = {
		name = "J4 io Plate",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[650],
				attributes = ()[636],
				commands = ()[653]
			}
		}
	},
	4526689372667906 = {
		name = "J4 io Plate",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[660],
				attributes = ()[643],
				commands = ()[664]
			}
		}
	},
	4527788884295682 = ()[665],
	4528888395923458 = ()[665],
	4529987907551234 = {
		name = "J4 io Plate",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[660],
				attributes = ()[643],
				commands = ()[664]
			}
		}
	},
	4504699139391746 = {
		name = "Lighting Variation io RGBW",
		localPairing = true,
		0 = {
			["io:DimmableRGBLightIOComponent"] = {
				type = 1,
				widget = "DimmerRGBColouredLight",
				uiClass = "Light",
				uiProfiles = ()[101],
				states = {
					16832512 = ()[103],
					65547 = {
						linkedHighLevelState = ()[666],
						linkedStateIds = ()[120]
					},
					65548 = {
						linkedHighLevelState = ()[666],
						linkedStateIds = ()[121]
					},
					65537 = {
						linkedHighLevelState = {
							()[29],
							()[315],
							()[23],
							()[28],
							()[27],
							()[25]
						},
						linkedStateIds = {
							"65547",
							"65548",
							"84059651"
						}
					},
					84059651 = ()[613],
					2147426304 = ()[4],
					1 = ()[3],
					2146500645 = ()[57],
					16832522 = ()[70],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[615],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					unpairOneWayController = ()[24],
					getName = ()[14],
					delayedStopIdentify = ()[13],
					unpairAllOneWayControllers = ()[23],
					setRGB = ()[123],
					setSecuredPosition = ()[114],
					setPosition = ()[112],
					my = ()[113],
					stopIdentify = ()[22],
					runManufacturerSettingsCommand = ()[617],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[618],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					identify = ()[15],
					setConfigState = ()[25],
					startIdentify = ()[21],
					setIntensityWithTimer = ()[109],
					onWithTimer = ()[110],
					setIntensity = ()[104],
					off = ()[105],
					on = ()[106],
					setOnOff = ()[107],
					setMemorized1Position = ()[111],
					wink = ()[26],
					setRGBWithTimer = ()[126],
					pairOneWayController = ()[17]
				}
			}
		}
	},
	4504699139392002 = {
		name = "Lighting Variation io TW",
		localPairing = true,
		0 = {
			["io:DimmableColorTemperatureLightIOComponent"] = {
				type = 1,
				widget = "DimmerColorTemperatureLight",
				uiClass = "Light",
				uiProfiles = ()[101],
				states = {
					16832512 = ()[103],
					84059651 = ()[613],
					65537 = ()[667],
					2147426304 = ()[4],
					1 = ()[3],
					65551 = ()[128],
					2146500645 = ()[57],
					16832522 = ()[70],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[615],
				commands = {
					setColorTemperature = ()[131],
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[114],
					setPosition = ()[112],
					my = ()[113],
					setConfigState = ()[25],
					startIdentify = ()[21],
					setIntensityWithTimer = ()[109],
					onWithTimer = ()[110],
					setIntensity = ()[104],
					off = ()[105],
					on = ()[106],
					setOnOff = ()[107],
					setMemorized1Position = ()[111],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[617],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[618]
				}
			}
		}
	},
	4504699139406338 = {
		name = "Lighting Variation io White",
		localPairing = true,
		0 = {
			["io:OnOffLightIOComponent"] = {
				type = 1,
				widget = "StatefulOnOffLight",
				uiClass = "Light",
				uiProfiles = ()[133],
				states = {
					84059651 = ()[613],
					65537 = {
						linkedHighLevelState = {
							()[315],
							()[31]
						},
						linkedStateIds = ()[614]
					},
					2147426304 = ()[4],
					1 = ()[3],
					2 = ()[505],
					2146500638 = ()[1],
					2146500645 = ()[57]
				},
				attributes = ()[615],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setConfigState = ()[25],
					onWithTimer = ()[135],
					startIdentify = ()[21],
					setOnOff = ()[136],
					off = ()[137],
					on = ()[138],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[617],
					pairOneWayController = ()[17],
					advancedRefresh = ()[618]
				}
			}
		}
	},
	4505798651034114 = {
		name = "Lighting receiver ONOFF io",
		localPairing = true,
		0 = {
			["io:OnOffLightIOComponent"] = {
				type = 1,
				widget = "StatefulOnOffLight",
				uiClass = "Light",
				uiProfiles = ()[133],
				states = {
					84059651 = {
						linkedHighLevelState = {
							()[322]
						},
						linkedStateIds = ()[243]
					},
					65537 = {
						linkedHighLevelState = {
							()[322],
							()[31]
						},
						linkedStateIds = ()[614]
					},
					2147426304 = ()[4],
					1 = ()[3],
					2 = ()[505],
					2146500638 = ()[1],
					2146500645 = ()[57]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ()[53],
					["core:Manufacturer"] = ()[1],
					["core:FirmwareRevision"] = ()[0]
				},
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setConfigState = ()[25],
					onWithTimer = ()[135],
					startIdentify = ()[21],
					setOnOff = ()[136],
					off = ()[137],
					on = ()[138],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[616],
						converter = ()[470],
						extraDefinition = ()[45]
					},
					pairOneWayController = ()[17],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ()[8],
						rawStates = ()[616],
						converter = ()[471],
						extraDefinition = ()[9]
					}
				}
			}
		}
	},
	4505798651019266 = {
		name = "Lighting receiver Variation io",
		localPairing = true,
		0 = {
			["io:DimmableLightIOComponent"] = {
				type = 1,
				widget = "DimmerLight",
				uiClass = "Light",
				uiProfiles = ()[101],
				states = {
					16832512 = ()[103],
					84059651 = ()[613],
					65537 = ()[667],
					2147426304 = ()[4],
					1 = ()[3],
					2146500645 = ()[57],
					16832522 = ()[70],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[615],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[114],
					setPosition = ()[112],
					my = ()[113],
					setConfigState = ()[25],
					startIdentify = ()[21],
					setIntensityWithTimer = ()[109],
					onWithTimer = ()[110],
					setIntensity = ()[104],
					off = ()[105],
					on = ()[106],
					setOnOff = ()[107],
					setMemorized1Position = ()[111],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[617],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[618]
				}
			}
		}
	},
	4504699139194882 = {
		name = "Maestria+ io",
		localPairing = true,
		0 = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[87],
				states = ()[675],
				attributes = ()[676],
				commands = ()[682]
			}
		}
	},
	4505798650822658 = {
		name = "Maestria+ io",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = ()[675],
				attributes = ()[676],
				commands = ()[682]
			}
		}
	},
	4506898162450434 = {
		name = "Maestria+ io",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = ()[683],
				attributes = ()[676],
				commands = ()[682]
			}
		}
	},
	4507997674078210 = {
		name = "Maestria+ io",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[675],
				attributes = ()[676],
				commands = ()[682]
			}
		}
	},
	4509097185705986 = {
		name = "Maestria+ io",
		localPairing = true,
		0 = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[87],
				states = ()[675],
				attributes = ()[684],
				commands = ()[685]
			}
		}
	},
	4510196697333762 = {
		name = "Maestria+ io",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = ()[675],
				attributes = ()[684],
				commands = ()[685]
			}
		}
	},
	4511296208961538 = {
		name = "Maestria+ io",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = ()[683],
				attributes = ()[684],
				commands = ()[685]
			}
		}
	},
	4512395720589314 = {
		name = "Maestria+ io",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[675],
				attributes = ()[684],
				commands = ()[685]
			}
		}
	},
	4531087419179010 = {
		name = "My EVB Pro io",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[698],
				attributes = ()[699],
				commands = ()[704]
			}
		}
	},
	4532186930806786 = ()[706],
	4533286442434562 = ()[706],
	4534385954062338 = {
		name = "My EVB Pro io",
		localPairing = true,
		0 = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ()[28],
				states = ()[698],
				attributes = ()[699],
				commands = ()[704]
			}
		}
	},
	4535485465690114 = ()[718],
	4536584977317890 = ()[719],
	4537684488945666 = ()[719],
	4538784000573442 = ()[720],
	4539883512201218 = ()[718],
	4540983023828994 = ()[719],
	4542082535456770 = ()[719],
	4543182047084546 = ()[720],
	4506898162384898 = {
		name = "OXIMO 40 io",
		localPairing = true,
		0 = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = ()[506],
				attributes = ()[507],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[509],
						converter = ()[485],
						extraDefinition = ()[45]
					},
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[510]
				}
			}
		}
	},
	4507997674012674 = {
		name = "OXIMO 40 io",
		localPairing = true,
		0 = ()[721]
	},
	4505798651281410 = {
		name = "Optuo 40 io",
		localPairing = true,
		0 = ()[511]
	},
	4509097185640450 = {
		name = "Oximo S Auto io",
		localPairing = true,
		0 = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = ()[723],
				attributes = ()[507],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[724],
						converter = ()[488],
						extraDefinition = ()[45]
					},
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[725]
				}
			}
		}
	},
	4510196697268226 = {
		name = "Oximo S Auto io",
		localPairing = true,
		0 = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = ()[723],
				attributes = ()[507],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[724],
						converter = ()[490],
						extraDefinition = ()[45]
					},
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[725]
				}
			}
		}
	},
	4511296208896002 = {
		name = "Oximo S Auto io",
		localPairing = true,
		0 = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = ()[727],
				attributes = ()[507],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[724],
						converter = ()[492],
						extraDefinition = ()[45]
					},
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[728]
				}
			}
		}
	},
	4512395720523778 = {
		name = "Oximo io",
		localPairing = true,
		0 = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = {
					16832512 = ()[31],
					49020928 = {
						linkedHighLevelState = {
							()[328]
						},
						linkedStateIds = ()[243]
					},
					65537 = {
						linkedHighLevelState = {
							()[328],
							()[5],
							()[12],
							()[10]
						},
						linkedStateIds = ()[729]
					},
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[730],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[731],
						converter = ()[496],
						extraDefinition = ()[45]
					},
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ()[8],
						rawStates = ()[731],
						converter = ()[497],
						extraDefinition = ()[9]
					}
				}
			}
		}
	},
	4513495232151554 = {
		name = "Oximo io",
		localPairing = true,
		0 = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = {
					16832512 = ()[31],
					49020928 = {
						linkedHighLevelState = {
							()[329]
						},
						linkedStateIds = ()[243]
					},
					65537 = {
						linkedHighLevelState = {
							()[329],
							()[5],
							()[12],
							()[10]
						},
						linkedStateIds = ()[729]
					},
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[730],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[731],
						converter = ()[499],
						extraDefinition = ()[45]
					},
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ()[8],
						rawStates = ()[731],
						converter = ()[500],
						extraDefinition = ()[9]
					}
				}
			}
		}
	},
	4514594743779330 = {
		name = "Oximo io",
		localPairing = true,
		0 = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = {
					16832512 = ()[31],
					84082687 = {
						linkedHighLevelState = {
							()[330]
						},
						linkedStateIds = ()[243]
					},
					65537 = {
						linkedHighLevelState = {
							()[330],
							()[5],
							()[12],
							()[10]
						},
						linkedStateIds = ()[524]
					},
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[507],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[525],
						converter = ()[502],
						extraDefinition = ()[45]
					},
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ()[8],
						rawStates = ()[525],
						converter = ()[503],
						extraDefinition = ()[9]
					}
				}
			}
		}
	},
	4515694255407106 = {
		name = "Oximo io",
		localPairing = true,
		0 = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = ()[732],
				attributes = ()[507],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[525],
						converter = ()[505],
						extraDefinition = ()[45]
					},
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[733]
				}
			}
		}
	},
	4516793767034882 = {
		name = "Oximo io",
		localPairing = true,
		0 = ()[734]
	},
	4517893278662658 = ()[735],
	4518992790290434 = ()[735],
	4504699140898818 = {
		name = "Pergola Box io",
		localPairing = true,
		0 = {
			["io:SimpleBioclimaticPergolaIOComponent"] = {
				type = 1,
				widget = "BioclimaticPergola",
				uiClass = "Pergola",
				uiProfiles = ()[252],
				states = {
					16832512 = ()[253],
					65537 = {
						linkedHighLevelState = {
							()[78],
							()[305],
							()[80],
							()[79]
						},
						linkedStateIds = {
							"84059651",
							"84059661"
						}
					},
					84059651 = ()[500],
					84059661 = ()[503],
					2147426304 = ()[4],
					1 = ()[3],
					2146500645 = ()[57],
					16832522 = ()[254],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[507],
				commands = {
					setName = ()[20],
					setOrientation = ()[256],
					my = ()[257],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					openSlats = ()[99],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					refreshMemorized1Orientation = ()[37],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[509],
						converter = ()[508],
						extraDefinition = ()[45]
					},
					closeSlats = ()[98],
					pairOneWayController = ()[17],
					setMemorized1Orientation = ()[47],
					setSecuredOrientation = ()[53],
					advancedRefresh = ()[510]
				}
			}
		}
	},
	4504699140047106 = {
		name = "Pergola Gibus io",
		localPairing = true,
		0 = {
			["io:PergolaRailGuidedAwningIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwning",
				uiClass = "Pergola",
				uiProfiles = ()[204],
				states = {
					16832512 = ()[31],
					84082687 = {
						linkedHighLevelState = ()[736],
						linkedStateIds = ()[737]
					},
					65537 = {
						linkedHighLevelState = {
							()[332],
							()[51],
							()[10],
							()[20]
						},
						linkedStateIds = ()[738]
					},
					48170496 = {
						linkedHighLevelState = ()[736],
						linkedStateIds = ()[739]
					},
					48171008 = {
						linkedHighLevelState = ()[736],
						linkedStateIds = ()[740]
					},
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ()[58],
					["core:Manufacturer"] = ()[1],
					["core:FirmwareRevision"] = ()[0]
				},
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					setDeployment = ()[38],
					close = ()[42],
					deploy = ()[40],
					down = ()[40],
					open = ()[40],
					setClosure = ()[201],
					undeploy = ()[42],
					up = ()[42],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[742],
						converter = ()[511],
						extraDefinition = ()[45]
					},
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ()[8],
						rawStates = ()[742],
						converter = ()[512],
						extraDefinition = ()[9]
					}
				}
			}
		}
	},
	4505798651674882 = {
		name = "Pergola io",
		localPairing = true,
		0 = {
			["io:PergolaRailGuidedAwningIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwning",
				uiClass = "Pergola",
				uiProfiles = ()[204],
				states = {
					16832512 = ()[31],
					84082687 = {
						linkedHighLevelState = ()[743],
						linkedStateIds = ()[744]
					},
					65537 = {
						linkedHighLevelState = {
							()[333],
							()[51],
							()[10],
							()[20]
						},
						linkedStateIds = ()[745]
					},
					48171008 = {
						linkedHighLevelState = ()[743],
						linkedStateIds = ()[631]
					},
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[746],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					setDeployment = ()[38],
					close = ()[42],
					deploy = ()[40],
					down = ()[40],
					open = ()[40],
					setClosure = ()[201],
					undeploy = ()[42],
					up = ()[42],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[747],
						converter = ()[515],
						extraDefinition = ()[45]
					},
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ()[8],
						rawStates = ()[747],
						converter = ()[516],
						extraDefinition = ()[9]
					}
				}
			}
		}
	},
	4506898163302658 = {
		name = "Pergola io",
		localPairing = true,
		0 = {
			["io:PergolaRailGuidedAwningIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwning",
				uiClass = "Pergola",
				uiProfiles = ()[204],
				states = {
					16832512 = ()[31],
					84082687 = {
						linkedHighLevelState = ()[748],
						linkedStateIds = ()[744]
					},
					65537 = {
						linkedHighLevelState = {
							()[334],
							()[51],
							()[10],
							()[20]
						},
						linkedStateIds = ()[745]
					},
					48171008 = {
						linkedHighLevelState = ()[748],
						linkedStateIds = ()[631]
					},
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[746],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					setDeployment = ()[38],
					close = ()[42],
					deploy = ()[40],
					down = ()[40],
					open = ()[40],
					setClosure = ()[201],
					undeploy = ()[42],
					up = ()[42],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[747],
						converter = ()[518],
						extraDefinition = ()[45]
					},
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ()[8],
						rawStates = ()[747],
						converter = ()[519],
						extraDefinition = ()[9]
					}
				}
			}
		}
	},
	4513495232217090 = {
		name = "Pergola screen io",
		localPairing = true,
		0 = {
			["io:PergolaScreenIOComponent"] = {
				type = 1,
				widget = "PositionableAndStretchablePergolaScreen",
				uiClass = "Pergola",
				uiProfiles = ()[425],
				states = ()[752],
				attributes = ()[753],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					unpairOneWayController = ()[24],
					getName = ()[14],
					delayedStopIdentify = ()[13],
					unpairAllOneWayControllers = ()[23],
					setClosureOrTightPosition = ()[426],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					stopIdentify = ()[22],
					runManufacturerSettingsCommand = ()[754],
					setClosure = ()[38],
					close = ()[40],
					deploy = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					undeploy = ()[42],
					up = ()[42],
					refreshMemorized1Position = ()[37],
					setTightPosition = ()[236],
					advancedRefresh = ()[755],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					identify = ()[15],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					wink = ()[26],
					pairOneWayController = ()[17]
				}
			}
		}
	},
	4514594743844866 = {
		name = "Pergola screen io",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = ()[756],
				attributes = ()[753],
				commands = ()[757]
			}
		}
	},
	4515694255472642 = {
		name = "Pergola screen io",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = ()[758],
				attributes = ()[753],
				commands = ()[757]
			}
		}
	},
	4516793767100418 = {
		name = "Pergola screen io",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[756],
				attributes = ()[753],
				commands = ()[757]
			}
		}
	},
	4517893278728194 = {
		name = "Pergola screen io",
		localPairing = true,
		0 = {
			["io:PergolaScreenIOComponent"] = {
				type = 1,
				widget = "PositionableAndStretchablePergolaScreen",
				uiClass = "Pergola",
				uiProfiles = ()[425],
				states = ()[752],
				attributes = ()[753],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					unpairOneWayController = ()[24],
					getName = ()[14],
					delayedStopIdentify = ()[13],
					unpairAllOneWayControllers = ()[23],
					setClosureOrTightPosition = ()[426],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					stopIdentify = ()[22],
					runManufacturerSettingsCommand = ()[759],
					setClosure = ()[38],
					close = ()[40],
					deploy = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					undeploy = ()[42],
					up = ()[42],
					refreshMemorized1Position = ()[37],
					setTightPosition = ()[236],
					advancedRefresh = ()[755],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					identify = ()[15],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					wink = ()[26],
					pairOneWayController = ()[17]
				}
			}
		}
	},
	4518992790355970 = {
		name = "Pergola screen io",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = ()[756],
				attributes = ()[753],
				commands = ()[760]
			}
		}
	},
	4520092301983746 = {
		name = "Pergola screen io",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = ()[758],
				attributes = ()[753],
				commands = ()[760]
			}
		}
	},
	4521191813611522 = {
		name = "Pergola screen io",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[756],
				attributes = ()[753],
				commands = ()[760]
			}
		}
	},
	4520092301918210 = {
		name = "RS Receiver io Manual",
		localPairing = true,
		0 = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = ()[727],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ()[61],
					["core:Manufacturer"] = ()[1],
					["core:FirmwareRevision"] = ()[0]
				},
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[724],
						converter = ()[526],
						extraDefinition = ()[45]
					},
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[728]
				}
			}
		}
	},
	4517893278874114 = ()[763],
	4518992790501890 = ()[763],
	4520092302129666 = ()[763],
	4521191813545986 = ()[773],
	4522291325173762 = ()[773],
	4523390836801538 = ()[773],
	4524490348429314 = ()[773],
	4525589860057090 = ()[776],
	4526689371684866 = ()[776],
	4527788883312642 = ()[776],
	4528888394940418 = ()[776],
	4529987906568194 = ()[776],
	4531087418195970 = ()[778],
	4532186929823746 = ()[776],
	4533286441451522 = ()[778],
	4534385953079298 = ()[776],
	4535485464707074 = ()[778],
	4536584976334850 = ()[778],
	4537684487962626 = ()[778],
	4538783999590402 = ()[778],
	4539883511218178 = ()[778],
	4540983022845954 = ()[778],
	4542082534473730 = ()[778],
	4543182046101506 = ()[778],
	4544281557729282 = ()[778],
	4545381069357058 = ()[778],
	4546480580984834 = ()[778],
	4547580092612610 = ()[779],
	4548679604240386 = ()[779],
	4549779115868162 = ()[779],
	4550878627495938 = ()[779],
	4551978139123714 = ()[779],
	4553077650751490 = ()[780],
	4554177162379266 = ()[782],
	4555276674007042 = ()[779],
	4556376185634818 = ()[780],
	4557475697262594 = ()[782],
	4558575208890370 = ()[779],
	4559674720518146 = ()[780],
	4560774232145922 = ()[782],
	4561873743773698 = ()[780],
	4562973255401474 = ()[782],
	4564072767029250 = ()[782],
	4565172278657026 = ()[782],
	4566271790284802 = ()[782],
	4567371301912578 = ()[782],
	4568470813540354 = ()[782],
	4569570325168130 = ()[782],
	4584963487956994 = ()[790],
	4570669836795906 = ()[792],
	4586062999584770 = ()[790],
	4571769348423682 = ()[792],
	4587162511212546 = ()[794],
	4572868860051458 = ()[795],
	4588262022840322 = ()[794],
	4573968371679234 = ()[795],
	4589361534468098 = ()[794],
	4575067883307010 = ()[795],
	4504699140768002 = {
		name = "Sliding window V0",
		localPairing = true,
		0 = {
			["io:PositionableAndLockableSlidingWindowComponent"] = {
				type = 1,
				widget = "PositionableAndLockableSlidingWindow",
				uiClass = "Window",
				uiProfiles = ()[241],
				states = {
					84059651 = {
						linkedHighLevelState = {
							()[74],
							()[341],
							()[71],
							()[72],
							()[73],
							()[75]
						},
						linkedStateIds = {
							"65537",
							"84059666"
						}
					},
					16832512 = ()[69],
					65537 = {
						linkedHighLevelState = {
							()[341],
							()[5],
							()[70]
						},
						linkedStateIds = {
							"65801",
							"84059651",
							"84059666"
						}
					},
					84059666 = {
						linkedHighLevelState = {
							()[341]
						},
						linkedStateIds = ()[502]
					},
					2147426304 = ()[4],
					1 = ()[3],
					2146500645 = ()[57],
					65546 = ()[242],
					2 = ()[505],
					65801 = ()[244],
					2146500638 = ()[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ()[69],
					["core:Manufacturer"] = ()[1],
					["core:FirmwareRevision"] = ()[0]
				},
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					unpairOneWayController = ()[24],
					getName = ()[14],
					delayedStopIdentify = ()[13],
					unpairAllOneWayControllers = ()[23],
					setPosition = ()[248],
					my = ()[240],
					setPositionAndLinearSpeed = ()[249],
					stopIdentify = ()[22],
					deactivateTimer = ()[246],
					lock = ()[247],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[797],
						converter = ()[553],
						extraDefinition = ()[45]
					},
					setClosure = ()[19],
					close = ()[237],
					open = ()[238],
					refreshMemorized1Position = ()[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ()[8],
						rawStates = ()[797],
						converter = ()[554],
						extraDefinition = ()[9]
					},
					activateTimer = ()[245],
					keepOneWayControllersAndDeleteNode = ()[61],
					unlock = ()[250],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					identify = ()[15],
					setClosureAndLinearSpeed = ()[239],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					wink = ()[26],
					setTimer = ()[196],
					pairOneWayController = ()[17]
				}
			}
		}
	},
	4505798652395778 = ()[800],
	4506898164023554 = ()[800],
	4507997675651330 = ()[800],
	4504699140046850 = {
		name = "Slim Receiver Awning io",
		localPairing = true,
		0 = {
			["io:AwningReceiverUnoIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwningUno",
				uiClass = "Awning",
				uiProfiles = ()[444],
				states = {
					16832512 = ()[31],
					84059651 = ()[500],
					65537 = {
						linkedHighLevelState = {
							()[305],
							()[51],
							()[10],
							()[20]
						},
						linkedStateIds = ()[501]
					},
					84059661 = ()[503],
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[801],
				commands = ()[803]
			}
		}
	},
	4507997674930434 = {
		name = "Slim Receiver Pergola io",
		localPairing = true,
		0 = {
			["io:PergolaHorizontalUnoIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwningUno",
				uiClass = "Pergola",
				uiProfiles = ()[446],
				states = {
					16832512 = ()[31],
					84059651 = ()[500],
					65537 = {
						linkedHighLevelState = {
							()[305],
							()[10]
						},
						linkedStateIds = ()[501]
					},
					84059661 = ()[503],
					2147426304 = ()[4],
					1 = ()[3],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[801],
				commands = ()[803]
			}
		}
	},
	4576167394934786 = {
		name = "Slim Receiver RS io",
		localPairing = true,
		0 = {
			["io:RollerShutterUnoIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutterUno",
				uiClass = "RollerShutter",
				uiProfiles = ()[477],
				states = ()[506],
				attributes = ()[801],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[802],
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[510]
				}
			}
		}
	},
	4522291325239298 = {
		name = "Slim Receiver Screen io",
		localPairing = true,
		0 = {
			["io:ScreenReceiverUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[489],
				states = {
					16832512 = ()[31],
					84059651 = ()[805],
					65537 = {
						linkedHighLevelState = {
							()[343],
							()[10]
						},
						linkedStateIds = ()[501]
					},
					84059661 = ()[806],
					2147426304 = ()[4],
					1 = ()[3],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[801],
				commands = ()[807]
			}
		}
	},
	4523390836867074 = {
		name = "Slim Receiver Screen io",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = ()[808],
				attributes = ()[801],
				commands = ()[807]
			}
		}
	},
	4524490348494850 = {
		name = "Slim Receiver Screen io",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = {
					16832512 = ()[31],
					84059651 = ()[805],
					65537 = {
						linkedHighLevelState = {
							()[343],
							()[5],
							()[12],
							()[10],
							()[280]
						},
						linkedStateIds = ()[501]
					},
					84059661 = ()[806],
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[801],
				commands = ()[807]
			}
		}
	},
	4525589860122626 = {
		name = "Slim Receiver Screen io",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[808],
				attributes = ()[801],
				commands = ()[807]
			}
		}
	},
	4504699140243458 = {
		name = "Smoove UNO io",
		localPairing = true,
		0 = {
			["io:CurtainTrackUnoIOComponent"] = {
				type = 1,
				widget = "CurtainTrackUno",
				uiClass = "Curtain",
				uiProfiles = ()[448],
				states = {
					16832512 = ()[31],
					84059651 = ()[811],
					65537 = ()[813],
					84059661 = ()[815],
					84059657 = ()[817],
					84059659 = ()[819],
					2147426304 = ()[4],
					1 = ()[3],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[75],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[820],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[822],
					setClosure = ()[449],
					close = ()[450],
					open = ()[451],
					my = ()[452],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[823]
				}
			}
		}
	},
	4505798651674626 = {
		name = "Smoove UNO io",
		localPairing = true,
		0 = {
			["io:HorizontalAwningUnoIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwningUno",
				uiClass = "Awning",
				uiProfiles = ()[444],
				states = {
					16832512 = ()[31],
					84059651 = ()[811],
					65537 = {
						linkedHighLevelState = {
							()[344],
							()[51],
							()[10],
							()[20]
						},
						linkedStateIds = ()[812]
					},
					84059661 = ()[815],
					84059657 = ()[817],
					84059659 = ()[819],
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[820],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					setDeployment = ()[38],
					close = ()[42],
					deploy = ()[40],
					down = ()[40],
					open = ()[40],
					setClosure = ()[201],
					undeploy = ()[42],
					up = ()[42],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[822],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[823]
				}
			}
		}
	},
	4506898162909186 = {
		name = "Smoove UNO io",
		localPairing = true,
		0 = {
			["io:VerticalInteriorBlindUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "Screen",
				uiProfiles = ()[441],
				states = {
					16832512 = ()[31],
					84059651 = ()[811],
					65537 = ()[813],
					84059661 = ()[815],
					84059657 = ()[817],
					84059659 = ()[819],
					2147426304 = ()[4],
					1 = ()[3],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[820],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[822],
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[823]
				}
			}
		}
	},
	4504699139260418 = {
		name = "Smoove UNO io",
		localPairing = true,
		0 = {
			["io:WindowOpenerUnoIOComponent"] = {
				type = 1,
				widget = "PositionableWindowUno",
				uiClass = "Window",
				uiProfiles = ()[427],
				states = {
					16830720 = ()[429],
					65537 = {
						linkedHighLevelState = {
							()[223],
							()[344]
						},
						linkedStateIds = {
							"120833",
							"120834",
							"120835",
							"120842",
							"16830720",
							"84059651",
							"84059657",
							"84059659",
							"84059661"
						}
					},
					120842 = ()[430],
					120833 = ()[431],
					120834 = ()[432],
					120835 = ()[433],
					84059651 = ()[811],
					84059661 = ()[815],
					84059657 = ()[817],
					84059659 = ()[819],
					2147426304 = ()[4],
					1 = ()[3],
					2 = ()[505],
					2146500638 = ()[1],
					2146500645 = ()[57]
				},
				attributes = ()[820],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[822],
					setClosure = ()[38],
					close = ()[40],
					open = ()[42],
					pairOneWayController = ()[17],
					advancedRefresh = ()[823]
				}
			}
		}
	},
	4526689371750402 = {
		name = "Smoove UNO io",
		localPairing = true,
		0 = {
			["io:VerticalExteriorAwningUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[476],
				states = ()[829],
				attributes = ()[820],
				commands = ()[830]
			}
		}
	},
	4527788883378178 = {
		name = "Smoove UNO io",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = ()[829],
				attributes = ()[820],
				commands = ()[830]
			}
		}
	},
	4528888395005954 = {
		name = "Smoove UNO io",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = {
					16832512 = ()[31],
					84059651 = ()[825],
					65537 = {
						linkedHighLevelState = {
							()[345],
							()[5],
							()[12],
							()[10],
							()[280]
						},
						linkedStateIds = ()[812]
					},
					84059661 = ()[826],
					84059657 = ()[827],
					84059659 = ()[828],
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[820],
				commands = ()[830]
			}
		}
	},
	4529987906633730 = {
		name = "Smoove UNO io",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[829],
				attributes = ()[820],
				commands = ()[830]
			}
		}
	},
	4577266906562562 = {
		name = "Smoove UNO io",
		localPairing = true,
		0 = {
			["io:RollerShutterUnoIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutterUno",
				uiClass = "RollerShutter",
				uiProfiles = ()[477],
				states = {
					16832512 = ()[31],
					84059651 = ()[811],
					65537 = {
						linkedHighLevelState = {
							()[344],
							()[5],
							()[12],
							()[10]
						},
						linkedStateIds = ()[812]
					},
					84059661 = ()[815],
					84059657 = ()[817],
					84059659 = ()[819],
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[820],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[822],
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[823]
				}
			}
		}
	},
	4578366418190338 = {
		name = "Solus io",
		localPairing = true,
		0 = ()[619]
	},
	4507997674536962 = {
		name = "Sonesse 40 io",
		localPairing = true,
		0 = ()[511]
	},
	4506898163302402 = {
		name = "Sunea CSI io",
		localPairing = true,
		0 = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ()[199],
				states = {
					16832512 = ()[31],
					84059651 = {
						linkedHighLevelState = ()[831],
						linkedStateIds = ()[737]
					},
					65537 = {
						linkedHighLevelState = {
							()[346],
							()[51],
							()[10],
							()[20]
						},
						linkedStateIds = {
							"16830720",
							"16832512",
							"16832522",
							"48170496",
							"48171008",
							"84059651"
						}
					},
					48170496 = {
						linkedHighLevelState = ()[831],
						linkedStateIds = {
							"48171008",
							"65537",
							"84059651"
						}
					},
					48171008 = {
						linkedHighLevelState = ()[831],
						linkedStateIds = {
							"48170496",
							"65537",
							"84059651"
						}
					},
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[832],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					setDeployment = ()[38],
					close = ()[42],
					deploy = ()[40],
					down = ()[40],
					open = ()[40],
					setClosure = ()[201],
					undeploy = ()[42],
					up = ()[42],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[833],
						converter = ()[567],
						extraDefinition = ()[45]
					},
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ()[8],
						rawStates = ()[833],
						converter = ()[568],
						extraDefinition = ()[9]
					}
				}
			}
		}
	},
	4507997674930178 = {
		name = "Sunea Screen 40 io",
		localPairing = true,
		0 = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ()[199],
				states = {
					16832512 = ()[31],
					84059651 = {
						linkedHighLevelState = ()[834],
						linkedStateIds = ()[835]
					},
					65537 = {
						linkedHighLevelState = {
							()[347],
							()[51],
							()[10],
							()[20]
						},
						linkedStateIds = ()[836]
					},
					48170496 = {
						linkedHighLevelState = ()[834],
						linkedStateIds = ()[837]
					},
					48171008 = {
						linkedHighLevelState = ()[834],
						linkedStateIds = ()[672]
					},
					84059664 = {
						linkedHighLevelState = ()[834],
						linkedStateIds = ()[838]
					},
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[839],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					setDeployment = ()[38],
					close = ()[42],
					deploy = ()[40],
					down = ()[40],
					open = ()[40],
					setClosure = ()[201],
					undeploy = ()[42],
					up = ()[42],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[841],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[842]
				}
			}
		}
	},
	4531087418261506 = {
		name = "Sunea Screen 40 io",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = ()[848],
				attributes = ()[839],
				commands = ()[849]
			}
		}
	},
	4532186929889282 = {
		name = "Sunea Screen 40 io",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = {
					16832512 = ()[31],
					84059651 = ()[844],
					65537 = {
						linkedHighLevelState = {
							()[348],
							()[5],
							()[12],
							()[10],
							()[280]
						},
						linkedStateIds = ()[836]
					},
					48170496 = ()[845],
					48171008 = ()[846],
					84059664 = ()[847],
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[839],
				commands = ()[849]
			}
		}
	},
	4533286441517058 = {
		name = "Sunea Screen 40 io",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[848],
				attributes = ()[839],
				commands = ()[849]
			}
		}
	},
	4534385953144834 = {
		name = "Sunea Screen 40 io",
		localPairing = true,
		0 = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[87],
				states = ()[848],
				attributes = ()[839],
				commands = ()[849]
			}
		}
	},
	4535485464772610 = ()[860],
	4536584976400386 = ()[861],
	4537684488028162 = ()[863],
	4538783999655938 = ()[864],
	4539883511283714 = ()[866],
	4540983022911490 = ()[867],
	4542082534539266 = ()[868],
	4543182046167042 = ()[860],
	4544281557794818 = ()[861],
	4545381069422594 = ()[863],
	4546480581050370 = ()[864],
	4547580092678146 = ()[866],
	4548679604305922 = ()[867],
	4549779115933698 = ()[868],
	4550878627561474 = ()[860],
	4551978139189250 = ()[861],
	4553077650817026 = ()[863],
	4554177162444802 = ()[864],
	4555276674072578 = ()[866],
	4556376185700354 = ()[867],
	4557475697328130 = ()[868],
	4509097186557954 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ()[199],
				states = ()[873],
				attributes = ()[832],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					setDeployment = ()[38],
					close = ()[42],
					deploy = ()[40],
					down = ()[40],
					open = ()[40],
					setClosure = ()[201],
					undeploy = ()[42],
					up = ()[42],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[874],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[875]
				}
			}
		}
	},
	4510196698185730 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ()[199],
				states = ()[873],
				attributes = ()[832],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					setDeployment = ()[38],
					close = ()[42],
					deploy = ()[40],
					down = ()[40],
					open = ()[40],
					setClosure = ()[201],
					undeploy = ()[42],
					up = ()[42],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[876],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[875]
				}
			}
		}
	},
	4511296209813506 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ()[199],
				states = ()[873],
				attributes = ()[832],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					setDeployment = ()[38],
					close = ()[42],
					deploy = ()[40],
					down = ()[40],
					open = ()[40],
					setClosure = ()[201],
					undeploy = ()[42],
					up = ()[42],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[877],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[875]
				}
			}
		}
	},
	4558575208955906 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[87],
				states = ()[878],
				attributes = ()[832],
				commands = ()[879]
			}
		}
	},
	4559674720583682 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = ()[878],
				attributes = ()[832],
				commands = ()[879]
			}
		}
	},
	4560774232211458 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = ()[880],
				attributes = ()[832],
				commands = ()[879]
			}
		}
	},
	4561873743839234 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[878],
				attributes = ()[832],
				commands = ()[879]
			}
		}
	},
	4562973255467010 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[87],
				states = ()[878],
				attributes = ()[832],
				commands = ()[881]
			}
		}
	},
	4564072767094786 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = ()[878],
				attributes = ()[832],
				commands = ()[881]
			}
		}
	},
	4565172278722562 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = ()[880],
				attributes = ()[832],
				commands = ()[881]
			}
		}
	},
	4566271790350338 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[878],
				attributes = ()[832],
				commands = ()[881]
			}
		}
	},
	4567371301978114 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[87],
				states = ()[878],
				attributes = ()[832],
				commands = ()[882]
			}
		}
	},
	4568470813605890 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = ()[878],
				attributes = ()[832],
				commands = ()[882]
			}
		}
	},
	4569570325233666 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = ()[880],
				attributes = ()[832],
				commands = ()[882]
			}
		}
	},
	4570669836861442 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[878],
				attributes = ()[832],
				commands = ()[882]
			}
		}
	},
	4512395721441282 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ()[199],
				states = {
					16832512 = ()[31],
					84082687 = ()[884],
					65537 = {
						linkedHighLevelState = {
							()[351],
							()[51],
							()[10],
							()[20]
						},
						linkedStateIds = ()[738]
					},
					48170496 = ()[885],
					48171008 = ()[886],
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[832],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					setDeployment = ()[38],
					close = ()[42],
					deploy = ()[40],
					down = ()[40],
					open = ()[40],
					setClosure = ()[201],
					undeploy = ()[42],
					up = ()[42],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[887],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[888]
				}
			}
		}
	},
	4513495233069058 = ()[895],
	4571769348489218 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[87],
				states = ()[896],
				attributes = ()[832],
				commands = ()[897]
			}
		}
	},
	4572868860116994 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = ()[896],
				attributes = ()[832],
				commands = ()[897]
			}
		}
	},
	4573968371744770 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = {
					16832512 = ()[31],
					84082687 = ()[884],
					65537 = {
						linkedHighLevelState = {
							()[351],
							()[5],
							()[12],
							()[10],
							()[280]
						},
						linkedStateIds = ()[738]
					},
					48170496 = ()[885],
					48171008 = ()[886],
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832522 = ()[504],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[832],
				commands = ()[897]
			}
		}
	},
	4575067883372546 = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[896],
				attributes = ()[832],
				commands = ()[897]
			}
		}
	},
	4576167395000322 = ()[900],
	4577266906628098 = ()[901],
	4578366418255874 = ()[902],
	4579465929883650 = ()[903],
	4514594744696834 = ()[895],
	4580565441511426 = ()[900],
	4581664953139202 = ()[901],
	4582764464766978 = ()[902],
	4583863976394754 = ()[903],
	4515694256324610 = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		0 = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ()[199],
				states = ()[905],
				attributes = ()[906],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					setDeployment = ()[38],
					close = ()[42],
					deploy = ()[40],
					down = ()[40],
					open = ()[40],
					setClosure = ()[201],
					undeploy = ()[42],
					up = ()[42],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[907],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[908]
				}
			}
		}
	},
	4516793767952386 = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		0 = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ()[199],
				states = ()[905],
				attributes = ()[906],
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					setDeployment = ()[38],
					close = ()[42],
					deploy = ()[40],
					down = ()[40],
					open = ()[40],
					setClosure = ()[201],
					undeploy = ()[42],
					up = ()[42],
					wink = ()[26],
					runManufacturerSettingsCommand = ()[909],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[908]
				}
			}
		}
	},
	4584963488022530 = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		0 = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[87],
				states = ()[910],
				attributes = ()[906],
				commands = ()[911]
			}
		}
	},
	4586062999650306 = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = ()[910],
				attributes = ()[906],
				commands = ()[911]
			}
		}
	},
	4587162511278082 = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = ()[912],
				attributes = ()[906],
				commands = ()[911]
			}
		}
	},
	4588262022905858 = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[910],
				attributes = ()[906],
				commands = ()[911]
			}
		}
	},
	4589361534533634 = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		0 = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ()[87],
				states = ()[910],
				attributes = ()[906],
				commands = ()[913]
			}
		}
	},
	4590461046161410 = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		0 = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ()[479],
				states = ()[910],
				attributes = ()[906],
				commands = ()[913]
			}
		}
	},
	4591560557789186 = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		0 = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ()[483],
				states = ()[912],
				attributes = ()[906],
				commands = ()[913]
			}
		}
	},
	4592660069416962 = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		0 = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ()[487],
				states = ()[910],
				attributes = ()[906],
				commands = ()[913]
			}
		}
	},
	4517893279580162 = ()[917],
	4593759581044738 = ()[920],
	4594859092672514 = ()[921],
	4595958604300290 = ()[922],
	4597058115928066 = ()[923],
	4518992791207938 = ()[917],
	4598157627555842 = ()[920],
	4599257139183618 = ()[921],
	4600356650811394 = ()[922],
	4601456162439170 = ()[923],
	4579465929818114 = ()[924],
	4580565441445890 = ()[924],
	4581664953073666 = {
		name = "T5 AS BHZ",
		localPairing = true,
		0 = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ()[54],
				states = ()[727],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ()[76],
					["core:Manufacturer"] = ()[1],
					["core:FirmwareRevision"] = ()[0]
				},
				commands = {
					setName = ()[20],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setSecuredPosition = ()[53],
					setPosition = ()[48],
					my = ()[51],
					setConfigState = ()[25],
					startIdentify = ()[21],
					stop = ()[63],
					setMemorized1Position = ()[47],
					stopIdentify = ()[22],
					wink = ()[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[724],
						converter = ()[596],
						extraDefinition = ()[45]
					},
					setClosure = ()[38],
					close = ()[40],
					down = ()[40],
					open = ()[42],
					setDeployment = ()[38],
					up = ()[42],
					pairOneWayController = ()[17],
					refreshMemorized1Position = ()[37],
					advancedRefresh = ()[728]
				}
			}
		}
	},
	4582764464701442 = {
		name = "T5 Auto BHz",
		localPairing = true,
		0 = ()[619]
	},
	4583863976329218 = {
		name = "T5 BHZ",
		localPairing = true,
		0 = ()[734]
	},
	4507997674012930 = {
		name = "Teba Slateo A",
		localPairing = true,
		0 = {
			["io:AdjustableSlatsRollerShutterIOComponent"] = {
				type = 1,
				widget = "PositionableOrOrientableRollerShutter",
				uiClass = "AdjustableSlatsRollerShutter",
				uiProfiles = ()[72],
				states = {
					84082687 = {
						linkedHighLevelState = ()[925],
						linkedStateIds = ()[513]
					},
					65537 = {
						linkedHighLevelState = {
							()[355],
							()[17],
							()[16],
							()[10]
						},
						linkedStateIds = ()[514]
					},
					65540 = {
						linkedHighLevelState = {
							()[355],
							()[18]
						},
						linkedStateIds = ()[515]
					},
					48177664 = {
						linkedHighLevelState = ()[925],
						linkedStateIds = ()[516]
					},
					2147426304 = ()[4],
					1 = ()[3],
					65557 = ()[36],
					2146500645 = ()[57],
					16830720 = ()[35],
					16832512 = ()[74],
					16832522 = ()[75],
					2 = ()[505],
					2146500638 = ()[1]
				},
				attributes = ()[517],
				commands = {
					setName = ()[20],
					setOrientation = ()[83],
					sendIOKey = ()[65],
					keepOneWayControllersAndDeleteNode = ()[61],
					unpairOneWayController = ()[24],
					getName = ()[14],
					unpairAllOneWayControllersAndDeleteNode = ()[64],
					delayedStopIdentify = ()[13],
					identify = ()[15],
					unpairAllOneWayControllers = ()[23],
					setConfigState = ()[25],
					setClosureOrRockerPosition = ()[78],
					close = ()[79],
					down = ()[79],
					open = ()[80],
					setClosure = ()[81],
					setDeployment = ()[81],
					setRockerPosition = ()[82],
					up = ()[80],
					startIdentify = ()[21],
					stop = ()[84],
					stopIdentify = ()[22],
					wink = ()[26],
					setClosureOrOrientation = ()[77],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ()[44],
						rawStates = ()[521],
						converter = ()[598],
						extraDefinition = ()[45]
					},
					pairOneWayController = ()[17],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ()[8],
						rawStates = ()[521],
						converter = ()[599],
						extraDefinition = ()[9]
					}
				}
			}
		}
	},
	4509097185640706 = {
		name = "Teba Slateo A",
		localPairing = true,
		0 = ()[523]
	}
}
