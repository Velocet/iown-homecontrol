slot1 = {}
slot2 = {}
slot5 = {}

return {
	0 = {
		name = "Generic Product",
		localPairing = true,
		0 = {
			["ovp:UnknownOVPComponent"] = {
				type = 1,
				widget = "OVPGeneric",
				uiClass = "Generic",
				uiProfiles = {
					"StatefulLevelControl",
					"LevelControl",
					"Generic"
				},
				states = {
					65537 = {
						linkedHighLevelState = {
							({
								[0] = {
									stateName = "core:LevelState",
									parameters = {
										{
											rawStateId = "65537",
											name = "p1"
										}
									},
									converter = ({
										function (slot0)
											return math.floor(slot0 / 512)
										end,
										function (slot0)
											return depends("ovp-utils").fromRawName(slot0)
										end,
										function (slot0)
											return depends("ovp-utils").fromRawStatusState(slot0)
										end,
										function ()
											return depends("ovp-utils").createWinkValue(true, 3)
										end,
										function (slot0)
											return slot0 * 512
										end,
										function (slot0)
											return depends("ovp-utils").toRawName(slot0), nil, nil, {
												access = "r"
											}
										end,
										function (slot0)
											return depends("BinaryUtils").extractBitRange({
												slot0
											}, 1, 2)
										end,
										function (slot0)
											if slot0 == 1 then
												return "low"
											else
												return "normal"
											end
										end,
										function (slot0, slot1, slot2)
											return depends("ovp-utils").fromRawTemperatureValue(slot0, slot1, slot2)
										end,
										function (slot0)
											if slot0 == 55315 then
												return "off"
											else
												return "on"
											end
										end,
										function (slot0, slot1, slot2, slot3, slot4, slot5)
											slot6 = depends("ovp-utils")
											slot7 = slot0

											if slot0 == 55306 then
												slot7 = slot1
											elseif slot0 == 55310 then
												slot7 = slot2
											elseif slot0 == 55311 then
												slot7 = slot3
											elseif slot0 == 55315 then
												slot7 = nil
											end

											if slot7 == nil then
												return nil
											else
												return slot6.fromRawTemperatureValue(slot7, slot4, slot5)
											end
										end,
										function ()
											return p1:tostring("iso-8859-1")
										end,
										function (slot0)
											return depends("ovp-utils").extractNumericFPPart(slot0, 14, 2)
										end,
										function (slot0)
											if slot0 == 1 then
												return "auto"
											elseif slot0 == 2 then
												return "manu"
											else
												return nil
											end
										end,
										function (slot0)
											return depends("ovp-utils").extractNumericFPPart(slot0, 12, 2)
										end,
										function (slot0)
											if slot0 == 1 then
												return "heating"
											elseif slot0 == 2 then
												return "cooling"
											elseif slot0 == 3 then
												return "heatingCooling"
											else
												return nil
											end
										end,
										function (slot0)
											if slot0 == 55311 then
												return "comfort"
											elseif slot0 == 55310 then
												return "eco"
											elseif slot0 == 55306 then
												return "secured"
											else
												return "free"
											end
										end,
										function (slot0, slot1)
											slot2 = depends("ovp-utils")

											if slot0 == "auto" then
												return slot2.createActivateFunc(53504, {
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
												return nil
											end
										end,
										function (slot0, slot1, slot2)
											return depends("ovp-utils").toRawTemperatureValue(slot0, slot1, slot2)
										end,
										function (slot0)
											slot1 = depends("ovp-utils")

											if slot0 == "comfort" then
												return slot1.createActivateFunc(55311, {
													{
														9,
														2
													}
												})
											elseif slot0 == "eco" then
												return slot1.createActivateFunc(55310, {
													{
														9,
														2
													}
												})
											elseif slot0 == "secured" then
												return slot1.createActivateFunc(55306, {
													{
														9,
														2
													}
												})
											else
												return nil
											end
										end,
										function (slot0, slot1, slot2)
											slot3 = depends("ovp-utils")

											if slot0 == "on" then
												if bit.band(slot1, 3) == 1 then
													return slot3.createActivateFunc(53504, {
														{
															9,
															1
														}
													})
												elseif slot2 ~= 55315 then
													return slot3.createActivateFunc(slot2, {
														{
															9,
															2
														}
													})
												else
													return slot3.createActivateFunc(55311, {
														{
															9,
															2
														}
													})
												end
											else
												return slot3.createActivateFunc(55315, {
													{
														9,
														2
													}
												})
											end
										end,
										function (slot0)
											slot1 = depends("ovp-utils")

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
											elseif slot0 == "heatingCooling" then
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
											slot3 = depends("ovp-utils")

											if slot0 == nil then
												return nil
											else
												return slot3.fromRawTemperatureValue(slot0, slot1, slot2)
											end
										end,
										function ()
											return 0
										end,
										function (slot0, slot1, slot2, slot3)
											slot4 = depends("ovp-utils")
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
											slot2 = depends("ovp-utils")

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
										function (slot0)
											slot1 = depends("ovp-utils")

											if slot0 == nil then
												return nil
											end

											if type(slot0) == "string" then
												if slot0 == "comfort" then
													return slot1.createActivateFunc(55311, {
														{
															9,
															1
														}
													})
												elseif slot0 == "eco" then
													return slot1.createActivateFunc(55310, {
														{
															9,
															1
														}
													})
												elseif slot0 == "secured" then
													return slot1.createActivateFunc(55306, {
														{
															9,
															1
														}
													})
												end
											else
												return nil
											end
										end,
										function (slot0, slot1, slot2)
											slot3 = depends("ovp-utils")

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
											if slot0 == 0 then
												return "down"
											else
												return "alive"
											end
										end,
										function (slot0)
											return depends("ovp-utils").extractNumericFPPart(slot0, 10, 2)
										end,
										function (slot0)
											if slot0 == 0 then
												return "off"
											else
												return "on"
											end
										end,
										function ()
											return 1
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
										function ()
											return 64512
										end,
										function (slot0)
											slot1 = depends("ovp-utils")
											slot2 = 64512

											if type(slot0) == "string" then
												if slot0 == "off" then
													slot2 = 64512
												elseif slot0 == "frostprotection" then
													slot2 = 64513
												elseif slot0 == "eco" then
													slot2 = 64514
												elseif slot0 == "comfort-2" then
													slot2 = 64515
												elseif slot0 == "comfort-1" then
													slot2 = 64516
												elseif slot0 == "comfort" then
													slot2 = 64517
												elseif slot0 == "boost" then
													slot2 = 64519
												elseif slot0 == "secured" then
													slot2 = 64575
												end
											end

											return slot1.createActivateFunc(slot2, {
												{
													11,
													65535
												}
											})
										end,
										function (slot0)
											slot1 = 64512

											if type(slot0) == "string" then
												if slot0 == "off" then
													slot1 = 64512
												elseif slot0 == "frostprotection" then
													slot1 = 64513
												elseif slot0 == "eco" then
													slot1 = 64514
												elseif slot0 == "comfort-2" then
													slot1 = 64515
												elseif slot0 == "comfort-1" then
													slot1 = 64516
												elseif slot0 == "comfort" then
													slot1 = 64517
												elseif slot0 == "boost" then
													slot1 = 64519
												elseif slot0 == "secured" then
													slot1 = 64575
												end
											end

											return slot1
										end,
										function (slot0)
											return depends("ovp-utils").createActivateFunc(64512, {
												{
													11,
													slot0
												}
											})
										end,
										function (slot0)
											return depends("ovp-utils").fromRawStatusState(slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Type.Int.state(slot0)
										end,
										function (slot0)
											slot1 = ""

											if bit.band(slot0[1], 128) == 128 then
												slot1 = ",default cascade"
											end

											if bit.band(slot0[2], 32) == 32 then
												slot1 = slot1 .. ",maximum output power"
											end

											if bit.band(slot0[2], 16) == 16 then
												slot1 = slot1 .. ",burner on"
											end

											if bit.band(slot0[2], 8) == 8 then
												slot1 = slot1 .. ",secondary pump"
											end

											if bit.band(slot0[2], 4) == 4 then
												slot1 = slot1 .. ",secondary stop"
											end

											if bit.band(slot0[2], 2) == 2 then
												slot1 = slot1 .. ",direct stop"
											end

											if bit.band(slot0[2], 1) == 1 then
												slot1 = slot1 .. ",burner stop"
											end

											return string.sub(slot1, 2)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(465)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(735)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(500)
										end,
										function (slot0)
											return depends("modbus-utils").Type.Float.state(slot0)
										end,
										function (slot0)
											if slot0 == 0 then
												return "p1"
											elseif slot0 == 1 then
												return "p2"
											elseif slot0 == 2 then
												return "p3"
											else
												return "p4"
											end
										end,
										function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20)
											return depends("modbus-utils").Type.TimeProgram.state(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20)
										end,
										function (slot0)
											if bit.band(slot0[2], 1) == 1 then
												return "holidays"
											elseif bit.band(slot0[2], 2) == 2 then
												return "eco"
											elseif bit.band(slot0[2], 4) == 4 then
												return "comfort"
											elseif bit.band(slot0[2], 8) == 8 then
												return "auto"
											else
												return overkiz.magic.IGNORE
											end
										end,
										function ()
											return depends("modbus-utils").Command.refresh(231)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(296)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(650)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(653)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(637)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(651)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(652)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(126, 21)
										end,
										function (slot0)
											slot1 = depends("modbus-utils")
											slot2 = 0

											if slot0 == "p1" then
												slot2 = 0
											elseif slot0 == "p2" then
												slot2 = 1
											elseif slot0 == "p3" then
												slot2 = 2
											elseif slot0 == "p4" then
												slot2 = 3
											end

											return slot1.Command.write("Int", 231, slot2)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Float", 650, slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Int", 653, slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Float", 651, slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Float", 652, slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Type.TimeProgram.cmd(slot0, 126)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(232)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(297)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(656)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(659)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(638)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(657)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(658)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(147, 21)
										end,
										function (slot0)
											slot1 = depends("modbus-utils")
											slot2 = 0

											if slot0 == "p1" then
												slot2 = 0
											elseif slot0 == "p2" then
												slot2 = 1
											elseif slot0 == "p3" then
												slot2 = 2
											elseif slot0 == "p4" then
												slot2 = 3
											end

											return slot1.Command.write("Int", 232, slot2)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Float", 656, slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Int", 659, slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Float", 657, slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Float", 658, slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Type.TimeProgram.cmd(slot0, 147)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(233)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(360)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(664)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(667)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(639)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(665)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(666)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(168, 21)
										end,
										function (slot0)
											slot1 = depends("modbus-utils")
											slot2 = 0

											if slot0 == "p1" then
												slot2 = 0
											elseif slot0 == "p2" then
												slot2 = 1
											elseif slot0 == "p3" then
												slot2 = 2
											elseif slot0 == "p4" then
												slot2 = 3
											end

											return slot1.Command.write("Int", 233, slot2)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Float", 664, slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Int", 667, slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Float", 665, slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Float", 666, slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Type.TimeProgram.cmd(slot0, 168)
										end,
										function (slot0, slot1, slot2)
											if bit.band(bit.rshift(slot0[2], 4), 1) == 1 and bit.band(bit.rshift(slot1[2], 4), 1) == 1 and bit.band(bit.rshift(slot2[2], 4), 1) == 1 then
												return "comfort"
											elseif bit.band(bit.rshift(slot0[2], 4), 1) == 0 and bit.band(bit.rshift(slot1[2], 4), 1) == 0 and bit.band(bit.rshift(slot2[2], 4), 1) == 0 then
												return "auto"
											end
										end,
										function ()
											return depends("modbus-utils").Command.refresh(603)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(672)
										end,
										function ()
											slot0 = depends("modbus-utils")

											return slot0.Command.refresh(653), nil, slot0.Command.refresh(659), nil, slot0.Command.refresh(667), nil
										end,
										function ()
											return depends("modbus-utils").Command.refresh(640)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(673)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(189, 21)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Float", 672, slot0)
										end,
										function (slot0, slot1, slot2, slot3)
											slot4 = depends("modbus-utils")

											return slot4.Command.write("Int", 653, slot4.Command.applyDerogationDDModbusGateway(slot0, slot1)), nil, slot4.Command.write("Int", 659, slot4.Command.applyDerogationDDModbusGateway(slot0, slot2)), nil, slot4.Command.write("Int", 667, slot4.Command.applyDerogationDDModbusGateway(slot0, slot3)), nil
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Float", 673, slot0)
										end,
										function (slot0)
											return depends("modbus-utils").Type.TimeProgram.cmd(slot0, 189)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(744)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(641)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(210, 21)
										end,
										function (slot0)
											return depends("modbus-utils").Type.TimeProgram.cmd(slot0, 210)
										end,
										function ()
											return depends("modbus-utils").Command.write("Int", 659, 8)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(686)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(605)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Float", 686, slot0)
										end,
										function ()
											return depends("modbus-utils").Command.write("Int", 667, 8)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(687)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(606)
										end,
										function (slot0)
											return depends("modbus-utils").Command.write("Float", 687, slot0)
										end,
										function ()
											return depends("modbus-utils").Command.refresh(817)
										end,
										function (slot0)
											return slot0:readInt16(1) / 10
										end,
										function (slot0)
											return depends("ovp-utils").getLockedUnlockedButton(slot0:readUInt8(1))
										end,
										function (slot0)
											return depends("ovp-utils").getActiveInactiveStateCotherm(slot0:readInt16(1))
										end,
										function (slot0)
											return slot0:readInt16(1)
										end,
										function (slot0)
											return depends("ovp-utils").getUserProgTimeThermostatCotherm(slot0)
										end,
										function (slot0)
											return slot0:readUInt8(1)
										end,
										function (slot0)
											return depends("ovp-utils").cothermCurrentStates[slot0:readInt16(1)]
										end,
										function (slot0)
											return slot0:readUInt16(1) / 1000
										end,
										function (slot0)
											return depends("ovp-utils").getErrorsThermostatCotherm(slot0)
										end,
										function (slot0)
											return slot0:tostring("iso-8859-1")
										end,
										function (slot0)
											return depends("ovp-utils").cothermThermostatMode[slot0:readInt16(1)]
										end,
										function (slot0)
											return slot0:readUInt32(1)
										end,
										function (slot0)
											return slot0:readUInt16(1)
										end,
										function (slot0)
											return depends("ovp-utils").getRTCThermostatCotherm(slot0)
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												26
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												26
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												26
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												35
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												35
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												35
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												14
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												14
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												14
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												208,
												9
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												208,
												2
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												13
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												13
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												13
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												208,
												10
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												25
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												25
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												25
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												15
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												15
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												15
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												23
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												23
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												23
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												208,
												6
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												240,
												2
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												16
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												16
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												16
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												24
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												24
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												24
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												208,
												0
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												44
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												44
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												44
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												43
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												43
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												43
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												208,
												1
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												29
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												29
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												29
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												240,
												0
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												240,
												1
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												41
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												41
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												41
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												17
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												17
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												17
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												42
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												42
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												42
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												240,
												4
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												0,
												45
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												144,
												45
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												128,
												45
											})
										end,
										function ()
											return bytearray({
												2,
												0,
												2,
												240,
												3
											})
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(26, slot0, 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(5888, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(5889, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(5890, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(5891, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(5892, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(5893, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(5894, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6144, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6145, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6146, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6147, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6148, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6149, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6150, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6400, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6401, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6402, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6403, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6404, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6405, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(6406, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(35, depends("ovp-utils").setActiveInactiveStateCotherm(slot0), 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(14, slot0 * 10, 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(53257, slot0 * 10, 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(53250, slot0, 8)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(13, depends("ovp-utils").getCurrentStateIdThermostatCotherm(slot0), 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(53258, slot0 * 1000, 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(25, slot0, 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(15, slot0 * 10, 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(23, slot0, 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(53254, depends("ovp-utils").setErrorsThermostatCotherm(slot0), 8)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(16, slot0 * 10, 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(24, slot0, 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(53248, depends("ovp-utils").setLockedUnlockedButton(slot0), 8)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(44, depends("ovp-utils").setCothermThermostatMode(slot0), 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(43, depends("ovp-utils").setCothermThermostatMode(slot0), 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(53249, slot0, 32)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(29, depends("ovp-utils").setActiveInactiveStateCotherm(slot0), 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(41, slot0 * 10, 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(17, slot0, 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(42, slot0 * 10, 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(61444, slot0, 32)
										end,
										function (slot0)
											return depends("ovp-utils").writeCMDCotherm(45, slot0, 16)
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(4096, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(4097, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(4098, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(4099, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(4100, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(4101, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").writeCmdUserProg(4102, depends("ovp-utils").setUserProgTimeThermostatCotherm(slot0))
										end,
										function (slot0)
											return depends("ovp-utils").fromRawName(slot0)
										end,
										function (slot0)
											return depends("ovp-utils").getSensorDefect(slot0)
										end,
										function ()
											if p1 then
												return "on"
											else
												return "off"
											end
										end,
										function ()
											if p1 then
												return "fault"
											else
												return "noFault"
											end
										end,
										function ()
											if p1 then
												return "active"
											else
												return "inactive"
											end
										end,
										function (slot0)
											if slot0 == nil or #slot0 ~= 2 then
												return nil
											end

											slot1 = "CH1"

											if bit.band(slot0[1], 32) > 0 then
												slot1 = slot1 .. ",CH2"
											end

											if bit.band(slot0[1], 8) > 0 then
												slot1 = slot1 .. ",DHW"
											end

											return slot1
										end,
										function (slot0)
											if slot0 == nil or #slot0 ~= 2 then
												return nil
											end

											return bit.band(slot0[2], 15) .. "," .. bit.rshift(bit.band(slot0[2], 240), 4) .. "," .. bit.band(slot0[1], 15)
										end,
										function ()
											if p1 then
												return "Pressure Fault"
											else
												return "No Water Pressure Fault"
											end
										end,
										function (slot0)
											if #depends("common", "utils").split(slot0, "[0-9]") ~= 3 then
												return nil
											end

											slot3 = bytearray(2)
											slot3[1] = slot2[3]
											slot3[2] = slot2[1] + bit.lshift(slot2[2], 4)

											return slot3
										end,
										function (slot0)
											slot1 = bytearray(2)
											slot1[1] = math.floor(slot0)
											slot1[2] = (slot0 - slot1[1]) * 256

											return slot1
										end,
										function (slot0)
											if slot0 == 0 then
												return "off"
											else
												return "on"
											end
										end,
										function (slot0)
											if slot0 == "on" then
												return 51200
											else
												return 0
											end
										end,
										function (slot0)
											return depends("ovp-utils").fromRawModeChange(slot0:readUInt16(1))
										end,
										function (slot0)
											return depends("ovp-utils").toTemperatureChange(slot0:readUInt8(2))
										end,
										function (slot0, slot1)
											return depends("ovp-utils").toTargetTemperature(slot0, slot1)
										end,
										function (slot0)
											return string.format("%02X%02X", slot0[1], slot0[2])
										end,
										function ()
											if p1 == 0 then
												return "auto"
											elseif p1 == 1 then
												return "high"
											elseif p1 == 2 then
												return "medium"
											elseif p1 == 3 then
												return "low"
											elseif p1 == 4 then
												return "silent"
											else
												return nil
											end
										end,
										function ()
											if p1 == 0 then
												return "Ok"
											elseif p1 == 1 then
												return "Alert"
											else
												return nil
											end
										end,
										function ()
											if p1 == 0 then
												return "Normal"
											elseif p1 == 1 then
												return "Reset"
											else
												return nil
											end
										end,
										function (slot0)
											return depends("ovp-utils").fromRawOperationState(slot0:readUInt16(1))
										end,
										function (slot0)
											return depends("ovp-utils").toRawTemperature(slot0:readInt16(1))
										end,
										function ()
											if p1 == 0 then
												return "Enable"
											elseif p1 == 1 then
												return "Disable"
											else
												return nil
											end
										end,
										function (slot0)
											return depends("ovp-utils").toRawThermoStatus(slot0:readUInt16(1))
										end,
										function (slot0, slot1, slot2, slot3, slot4)
											return depends("ovp-utils").toRawGlobalControl(slot0, slot1, slot2, slot3)
										end,
										function (slot0)
											return depends("ovp-utils").toRawMainOperation(slot0)
										end,
										function (slot0)
											if #slot0 >= 4 then
												return string.format("%02x", slot0[1]) .. string.format("%02x", slot0[2]) .. string.format("%02x", slot0[3]) .. string.format("%02x", slot0[4])
											end
										end,
										function ()
											return bytearray({
												0,
												192,
												1
											})
										end,
										function (slot0)
											return depends("common", "utils").convertKelvinToCelsius(slot0)
										end,
										function (slot0)
											if bit.band(slot0, 2) ~= 0 then
												return "low"
											else
												return "normal"
											end
										end,
										function (slot0)
											if slot0 == 4 then
												return "off"
											else
												return "on"
											end
										end,
										function (slot0)
											if slot0 == 0 then
												return "auto"
											else
												return "manu"
											end
										end,
										function (slot0)
											if slot0 == 1 then
												return "comfort"
											elseif slot0 == 2 then
												return "eco"
											elseif slot0 == 3 then
												return "secured"
											else
												return nil
											end
										end,
										function (slot0)
											if slot0 == "auto" then
												return 0
											elseif slot0 == "manu" then
												return 2
											else
												return nil
											end
										end,
										function (slot0)
											if slot0 == "off" then
												return 4
											elseif slot0 == "on" then
												return 2
											else
												return nil
											end
										end,
										function (slot0)
											if slot0 == "comfort" then
												return 1
											elseif slot0 == "eco" then
												return 2
											elseif slot0 == "secured" then
												return 3
											else
												return nil
											end
										end
									})[1]
								},
								{
									stateName = "core:NameState",
									parameters = {
										{
											rawStateId = "1",
											name = "p1"
										}
									},
									converter = ()[2]
								},
								{
									stateName = "core:StatusState",
									parameters = {
										{
											rawStateId = "2147426304",
											name = "p1"
										}
									},
									converter = ()[3]
								},
								{
									stateName = "core:BatteryState",
									parameters = {
										{
											name = "p1",
											rawStateId = "65556",
											converter = ()[7]
										}
									},
									converter = ()[8]
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
									converter = ()[9]
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
									converter = ()[9]
								},
								{
									stateName = "core:OnOffState",
									parameters = {
										{
											rawStateId = "16830720",
											name = "p1"
										}
									},
									refresh = ({
										[0] = {
											onRefreshAll = true,
											onStart = true
										},
										{
											periodic = "1h",
											onRefreshAll = true,
											onStart = true
										},
										{
											onRefreshAll = false,
											onStart = true
										},
										{
											periodic = "12h",
											onRefreshAll = true,
											onStart = true
										}
									})[0],
									converter = ()[10]
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
									converter = ()[9]
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
									converter = ()[11]
								},
								{
									stateName = "ovp:HeatingTemperatureInterfaceActiveModeState",
									parameters = {
										{
											name = "p1",
											rawStateId = "65546",
											converter = ()[13]
										}
									},
									refresh = ()[0],
									converter = ()[14]
								},
								{
									stateName = "ovp:HeatingTemperatureInterfaceOperatingModeState",
									parameters = {
										{
											name = "p1",
											rawStateId = "65546",
											converter = ()[15]
										}
									},
									refresh = ()[0],
									converter = ()[16]
								},
								{
									stateName = "ovp:HeatingTemperatureInterfaceSetPointModeState",
									parameters = {
										{
											rawStateId = "16830720",
											name = "p1"
										}
									},
									refresh = ()[0],
									converter = ()[17]
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
									converter = ()[23]
								},
								{
									stateName = "core:BatteryState",
									parameters = {
										{
											rawStateId = "234946564",
											name = "p1"
										}
									},
									converter = ()[8]
								},
								{
									stateName = "ovp:BoilerOperatingTimeState",
									parameters = {
										{
											rawStateId = "234946826",
											name = "p1"
										}
									}
								},
								{
									stateName = "ovp:SetSetPointModeInProgressState",
									parameters = {
										{
											rawStateId = "ovp:SetSetPointModeInProgressState",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:AliveDownState",
									parameters = {
										{
											rawStateId = "234946824",
											name = "p1"
										}
									},
									converter = ()[29]
								},
								{
									stateName = "core:OnOffState",
									parameters = {
										{
											name = "p1",
											rawStateId = "65546",
											converter = ()[30]
										}
									},
									refresh = ()[0],
									converter = ()[31]
								},
								{
									stateName = "core:OnOffState",
									parameters = {
										{
											rawStateId = "65537",
											name = "p1"
										}
									},
									converter = ()[33]
								},
								{
									stateName = "core:OnOffState",
									parameters = {
										{
											rawStateId = "16830720",
											name = "p1"
										}
									},
									refresh = ()[0],
									converter = ()[35]
								},
								{
									stateName = "ovp:MaximumHeatingLevelState",
									parameters = {
										{
											rawStateId = "65547",
											name = "p1"
										}
									},
									refresh = ()[1],
									converter = ()[36]
								},
								{
									stateName = "ovp:TargetHeatingLevelState",
									parameters = {
										{
											rawStateId = "16830720",
											name = "p1"
										}
									},
									refresh = ()[0],
									converter = ()[37]
								},
								{
									stateName = "core:TargetHeatingLevelState",
									parameters = {
										{
											rawStateId = "16830720",
											name = "p1"
										}
									},
									refresh = ()[0],
									converter = ()[37]
								},
								{
									stateName = "ovp:TimerForTransitoryStateState",
									parameters = {
										{
											rawStateId = "65548",
											name = "p1"
										}
									},
									refresh = ()[1]
								},
								{
									stateName = "core:StatusState",
									parameters = {
										{
											rawStateId = "2147426304",
											name = "p1"
										}
									},
									converter = ()[42]
								},
								{
									stateName = "core:AlarmState",
									parameters = {
										{
											rawStateId = "187695569",
											name = "p1"
										}
									},
									converter = ()[43]
								},
								{
									stateName = "core:OperatingStateState",
									parameters = {
										{
											rawStateId = "187695839",
											name = "p1"
										}
									},
									converter = ()[44]
								},
								{
									stateName = "modbus:RedAlarmState",
									parameters = {
										{
											rawStateId = "187695604",
											name = "p1"
										}
									},
									converter = ()[43]
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "187695705",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:ActiveTimeProgramState",
									parameters = {
										{
											name = "p1",
											rawStateId = "187695335",
											converter = ()[43]
										}
									},
									converter = ()[49]
								},
								{
									stateName = "core:ComfortRoomTemperatureState",
									parameters = {
										{
											rawStateId = "187695754",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:OperatingModeState",
									parameters = {
										{
											rawStateId = "187695741",
											name = "p1"
										}
									},
									converter = ()[43]
								},
								{
									stateName = "core:ReducedTemperatureState",
									parameters = {
										{
											rawStateId = "187695755",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:SecuredPositionTemperatureState",
									parameters = {
										{
											rawStateId = "187695756",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "187695718",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:TimeProgramState",
									parameters = {
										{
											rawStateId = "187695230",
											name = "p1"
										},
										{
											rawStateId = "187695231",
											name = "p2"
										},
										{
											rawStateId = "187695232",
											name = "p3"
										},
										{
											rawStateId = "187695233",
											name = "p4"
										},
										{
											rawStateId = "187695234",
											name = "p5"
										},
										{
											rawStateId = "187695235",
											name = "p6"
										},
										{
											rawStateId = "187695236",
											name = "p7"
										},
										{
											rawStateId = "187695237",
											name = "p8"
										},
										{
											rawStateId = "187695238",
											name = "p9"
										},
										{
											rawStateId = "187695239",
											name = "p10"
										},
										{
											rawStateId = "187695240",
											name = "p11"
										},
										{
											rawStateId = "187695241",
											name = "p12"
										},
										{
											rawStateId = "187695242",
											name = "p13"
										},
										{
											rawStateId = "187695243",
											name = "p14"
										},
										{
											rawStateId = "187695244",
											name = "p15"
										},
										{
											rawStateId = "187695245",
											name = "p16"
										},
										{
											rawStateId = "187695246",
											name = "p17"
										},
										{
											rawStateId = "187695247",
											name = "p18"
										},
										{
											rawStateId = "187695248",
											name = "p19"
										},
										{
											rawStateId = "187695249",
											name = "p20"
										},
										{
											rawStateId = "187695250",
											name = "p21"
										}
									},
									converter = ()[50]
								},
								{
									stateName = "ovp:HeatingDerogationModeState",
									parameters = {
										{
											rawStateId = "187695757",
											name = "p1"
										}
									},
									converter = ()[51]
								},
								{
									stateName = "core:ActiveTimeProgramState",
									parameters = {
										{
											name = "p1",
											rawStateId = "187695336",
											converter = ()[43]
										}
									},
									converter = ()[49]
								},
								{
									stateName = "core:ComfortRoomTemperatureState",
									parameters = {
										{
											rawStateId = "187695760",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:OperatingModeState",
									parameters = {
										{
											rawStateId = "187695742",
											name = "p1"
										}
									},
									converter = ()[43]
								},
								{
									stateName = "core:ReducedTemperatureState",
									parameters = {
										{
											rawStateId = "187695761",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:SecuredPositionTemperatureState",
									parameters = {
										{
											rawStateId = "187695762",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "187695720",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:TimeProgramState",
									parameters = {
										{
											rawStateId = "187695251",
											name = "p1"
										},
										{
											rawStateId = "187695252",
											name = "p2"
										},
										{
											rawStateId = "187695253",
											name = "p3"
										},
										{
											rawStateId = "187695254",
											name = "p4"
										},
										{
											rawStateId = "187695255",
											name = "p5"
										},
										{
											rawStateId = "187695256",
											name = "p6"
										},
										{
											rawStateId = "187695257",
											name = "p7"
										},
										{
											rawStateId = "187695258",
											name = "p8"
										},
										{
											rawStateId = "187695259",
											name = "p9"
										},
										{
											rawStateId = "187695260",
											name = "p10"
										},
										{
											rawStateId = "187695261",
											name = "p11"
										},
										{
											rawStateId = "187695262",
											name = "p12"
										},
										{
											rawStateId = "187695263",
											name = "p13"
										},
										{
											rawStateId = "187695264",
											name = "p14"
										},
										{
											rawStateId = "187695265",
											name = "p15"
										},
										{
											rawStateId = "187695266",
											name = "p16"
										},
										{
											rawStateId = "187695267",
											name = "p17"
										},
										{
											rawStateId = "187695268",
											name = "p18"
										},
										{
											rawStateId = "187695269",
											name = "p19"
										},
										{
											rawStateId = "187695270",
											name = "p20"
										},
										{
											rawStateId = "187695271",
											name = "p21"
										}
									},
									converter = ()[50]
								},
								{
									stateName = "ovp:HeatingDerogationModeState",
									parameters = {
										{
											rawStateId = "187695763",
											name = "p1"
										}
									},
									converter = ()[51]
								},
								{
									stateName = "core:ActiveTimeProgramState",
									parameters = {
										{
											name = "p1",
											rawStateId = "187695337",
											converter = ()[43]
										}
									},
									converter = ()[49]
								},
								{
									stateName = "core:ComfortRoomTemperatureState",
									parameters = {
										{
											rawStateId = "187695768",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:OperatingModeState",
									parameters = {
										{
											rawStateId = "187695743",
											name = "p1"
										}
									},
									converter = ()[43]
								},
								{
									stateName = "core:ReducedTemperatureState",
									parameters = {
										{
											rawStateId = "187695769",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:SecuredPositionTemperatureState",
									parameters = {
										{
											rawStateId = "187695770",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "187695722",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:TimeProgramState",
									parameters = {
										{
											rawStateId = "187695272",
											name = "p1"
										},
										{
											rawStateId = "187695273",
											name = "p2"
										},
										{
											rawStateId = "187695274",
											name = "p3"
										},
										{
											rawStateId = "187695275",
											name = "p4"
										},
										{
											rawStateId = "187695276",
											name = "p5"
										},
										{
											rawStateId = "187695277",
											name = "p6"
										},
										{
											rawStateId = "187695278",
											name = "p7"
										},
										{
											rawStateId = "187695279",
											name = "p8"
										},
										{
											rawStateId = "187695280",
											name = "p9"
										},
										{
											rawStateId = "187695281",
											name = "p10"
										},
										{
											rawStateId = "187695282",
											name = "p11"
										},
										{
											rawStateId = "187695283",
											name = "p12"
										},
										{
											rawStateId = "187695284",
											name = "p13"
										},
										{
											rawStateId = "187695285",
											name = "p14"
										},
										{
											rawStateId = "187695286",
											name = "p15"
										},
										{
											rawStateId = "187695287",
											name = "p16"
										},
										{
											rawStateId = "187695288",
											name = "p17"
										},
										{
											rawStateId = "187695289",
											name = "p18"
										},
										{
											rawStateId = "187695290",
											name = "p19"
										},
										{
											rawStateId = "187695291",
											name = "p20"
										},
										{
											rawStateId = "187695292",
											name = "p21"
										}
									},
									converter = ()[50]
								},
								{
									stateName = "ovp:HeatingDerogationModeState",
									parameters = {
										{
											rawStateId = "187695771",
											name = "p1"
										}
									},
									converter = ()[51]
								},
								{
									stateName = "core:ComfortRoomTemperatureState",
									parameters = {
										{
											rawStateId = "187695776",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:OperatingModeState",
									parameters = {
										{
											rawStateId = "187695744",
											name = "p1"
										}
									},
									converter = ()[43]
								},
								{
									stateName = "core:ReducedTemperatureState",
									parameters = {
										{
											rawStateId = "187695777",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "187695707",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:TimeProgramState",
									parameters = {
										{
											rawStateId = "187695293",
											name = "p1"
										},
										{
											rawStateId = "187695294",
											name = "p2"
										},
										{
											rawStateId = "187695295",
											name = "p3"
										},
										{
											rawStateId = "187695296",
											name = "p4"
										},
										{
											rawStateId = "187695297",
											name = "p5"
										},
										{
											rawStateId = "187695298",
											name = "p6"
										},
										{
											rawStateId = "187695299",
											name = "p7"
										},
										{
											rawStateId = "187695300",
											name = "p8"
										},
										{
											rawStateId = "187695301",
											name = "p9"
										},
										{
											rawStateId = "187695302",
											name = "p10"
										},
										{
											rawStateId = "187695303",
											name = "p11"
										},
										{
											rawStateId = "187695304",
											name = "p12"
										},
										{
											rawStateId = "187695305",
											name = "p13"
										},
										{
											rawStateId = "187695306",
											name = "p14"
										},
										{
											rawStateId = "187695307",
											name = "p15"
										},
										{
											rawStateId = "187695308",
											name = "p16"
										},
										{
											rawStateId = "187695309",
											name = "p17"
										},
										{
											rawStateId = "187695310",
											name = "p18"
										},
										{
											rawStateId = "187695311",
											name = "p19"
										},
										{
											rawStateId = "187695312",
											name = "p20"
										},
										{
											rawStateId = "187695313",
											name = "p21"
										}
									},
									converter = ()[50]
								},
								{
									stateName = "ovp:DHWDerogationModeState",
									parameters = {
										{
											rawStateId = "187695757",
											name = "p1"
										},
										{
											rawStateId = "187695763",
											name = "p2"
										},
										{
											rawStateId = "187695771",
											name = "p3"
										}
									},
									converter = ()[94]
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "187695726",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:OperatingModeState",
									parameters = {
										{
											rawStateId = "187695745",
											name = "p1"
										}
									},
									converter = ()[43]
								},
								{
									stateName = "core:TimeProgramState",
									parameters = {
										{
											rawStateId = "187695314",
											name = "p1"
										},
										{
											rawStateId = "187695315",
											name = "p2"
										},
										{
											rawStateId = "187695316",
											name = "p3"
										},
										{
											rawStateId = "187695317",
											name = "p4"
										},
										{
											rawStateId = "187695318",
											name = "p5"
										},
										{
											rawStateId = "187695319",
											name = "p6"
										},
										{
											rawStateId = "187695320",
											name = "p7"
										},
										{
											rawStateId = "187695321",
											name = "p8"
										},
										{
											rawStateId = "187695322",
											name = "p9"
										},
										{
											rawStateId = "187695323",
											name = "p10"
										},
										{
											rawStateId = "187695324",
											name = "p11"
										},
										{
											rawStateId = "187695325",
											name = "p12"
										},
										{
											rawStateId = "187695326",
											name = "p13"
										},
										{
											rawStateId = "187695327",
											name = "p14"
										},
										{
											rawStateId = "187695328",
											name = "p15"
										},
										{
											rawStateId = "187695329",
											name = "p16"
										},
										{
											rawStateId = "187695330",
											name = "p17"
										},
										{
											rawStateId = "187695331",
											name = "p18"
										},
										{
											rawStateId = "187695332",
											name = "p19"
										},
										{
											rawStateId = "187695333",
											name = "p20"
										},
										{
											rawStateId = "187695334",
											name = "p21"
										}
									},
									converter = ()[50]
								},
								{
									stateName = "core:ComfortRoomTemperatureState",
									parameters = {
										{
											rawStateId = "187695790",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "187695709",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:ComfortRoomTemperatureState",
									parameters = {
										{
											rawStateId = "187695791",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "187695710",
											name = "p1"
										}
									},
									converter = ()[48]
								},
								{
									stateName = "core:ComfortRoomTemperatureState",
									parameters = {
										{
											rawStateId = "455344142",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "core:EcoRoomTemperatureState",
									parameters = {
										{
											rawStateId = "455344143",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "core:FrostProtectionRoomTemperatureState",
									parameters = {
										{
											rawStateId = "455344144",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "core:LockedButtonState",
									parameters = {
										{
											rawStateId = "455397376",
											name = "p1"
										}
									},
									converter = ()[119]
								},
								{
									stateName = "core:OpenWindowDetectionActivationState",
									parameters = {
										{
											rawStateId = "455344157",
											name = "p1"
										}
									},
									converter = ()[120]
								},
								{
									stateName = "ovp:AbscenceTimeMaxState",
									parameters = {
										{
											rawStateId = "455381018",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:AbscenceTimeMinState",
									parameters = {
										{
											rawStateId = "455376922",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:AbscenceTimeState",
									parameters = {
										{
											rawStateId = "455344154",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:AutoProgW1J1State",
									parameters = {
										{
											rawStateId = "455350016",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW1J2State",
									parameters = {
										{
											rawStateId = "455350017",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW1J3State",
									parameters = {
										{
											rawStateId = "455350018",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW1J4State",
									parameters = {
										{
											rawStateId = "455350019",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW1J5State",
									parameters = {
										{
											rawStateId = "455350020",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW1J6State",
									parameters = {
										{
											rawStateId = "455350021",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW1J7State",
									parameters = {
										{
											rawStateId = "455350022",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW2J1State",
									parameters = {
										{
											rawStateId = "455350272",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW2J2State",
									parameters = {
										{
											rawStateId = "455350273",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW2J3State",
									parameters = {
										{
											rawStateId = "455350274",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW2J4State",
									parameters = {
										{
											rawStateId = "455350275",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW2J5State",
									parameters = {
										{
											rawStateId = "455350276",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW2J6State",
									parameters = {
										{
											rawStateId = "455350277",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW2J7State",
									parameters = {
										{
											rawStateId = "455350278",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW3J1State",
									parameters = {
										{
											rawStateId = "455350528",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW3J2State",
									parameters = {
										{
											rawStateId = "455350529",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW3J3State",
									parameters = {
										{
											rawStateId = "455350530",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW3J4State",
									parameters = {
										{
											rawStateId = "455350531",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW3J5State",
									parameters = {
										{
											rawStateId = "455350532",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW3J6State",
									parameters = {
										{
											rawStateId = "455350533",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:AutoProgW3J7State",
									parameters = {
										{
											rawStateId = "455350534",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:BabyCareFunctionActivationMaxState",
									parameters = {
										{
											rawStateId = "455381027",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:BabyCareFunctionActivationMinState",
									parameters = {
										{
											rawStateId = "455376931",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:BabyCareFunctionActivationState",
									parameters = {
										{
											rawStateId = "455344163",
											name = "p1"
										}
									},
									converter = ()[120]
								},
								{
									stateName = "ovp:ComfortRoomTemperatureMaxState",
									parameters = {
										{
											rawStateId = "455381006",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "ovp:ComfortRoomTemperatureMinState",
									parameters = {
										{
											rawStateId = "455376910",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "ovp:ConsignRegulState",
									parameters = {
										{
											rawStateId = "455397385",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "ovp:CountDetectPresenceState",
									parameters = {
										{
											rawStateId = "455397378",
											name = "p1"
										}
									},
									converter = ()[123]
								},
								{
									stateName = "ovp:CurrentStateMaxState",
									parameters = {
										{
											rawStateId = "455381005",
											name = "p1"
										}
									},
									converter = ()[124]
								},
								{
									stateName = "ovp:CurrentStateMinState",
									parameters = {
										{
											rawStateId = "455376909",
											name = "p1"
										}
									},
									converter = ()[124]
								},
								{
									stateName = "ovp:CurrentStateState",
									parameters = {
										{
											rawStateId = "455344141",
											name = "p1"
										}
									},
									converter = ()[124]
								},
								{
									stateName = "ovp:CycleReportState",
									parameters = {
										{
											rawStateId = "455397386",
											name = "p1"
										}
									},
									converter = ()[125]
								},
								{
									stateName = "ovp:DurationEnergyCounterMaxState",
									parameters = {
										{
											rawStateId = "455381017",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:DurationEnergyCounterMinState",
									parameters = {
										{
											rawStateId = "455376921",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:DurationEnergyCounterState",
									parameters = {
										{
											rawStateId = "455344153",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:EcoRoomTemperatureMaxState",
									parameters = {
										{
											rawStateId = "455381007",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "ovp:EcoRoomTemperatureMinState",
									parameters = {
										{
											rawStateId = "455376911",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "ovp:ElectricPowerMaxState",
									parameters = {
										{
											rawStateId = "455381015",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:ElectricPowerMinState",
									parameters = {
										{
											rawStateId = "455376919",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:ElectricPowerState",
									parameters = {
										{
											rawStateId = "455344151",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:ErrorThermostatState",
									parameters = {
										{
											rawStateId = "455397382",
											name = "p1"
										}
									},
									converter = ()[126]
								},
								{
									stateName = "ovp:FirmwareVersionState",
									parameters = {
										{
											rawStateId = "455405570",
											name = "p1"
										}
									},
									converter = ()[127]
								},
								{
									stateName = "ovp:FrostProtectionRoomTemperatureMaxState",
									parameters = {
										{
											rawStateId = "455381008",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "ovp:FrostProtectionRoomTemperatureMinState",
									parameters = {
										{
											rawStateId = "455376912",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "ovp:HoursEnergyCounterMaxState",
									parameters = {
										{
											rawStateId = "455381016",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:HoursEnergyCounterMinState",
									parameters = {
										{
											rawStateId = "455376920",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:HoursEnergyCounterState",
									parameters = {
										{
											rawStateId = "455344152",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:MiniboxHolidayModeMaxState",
									parameters = {
										{
											rawStateId = "455381036",
											name = "p1"
										}
									},
									converter = ()[128]
								},
								{
									stateName = "ovp:MiniboxHolidayModeMinState",
									parameters = {
										{
											rawStateId = "455376940",
											name = "p1"
										}
									},
									converter = ()[128]
								},
								{
									stateName = "ovp:MiniboxHolidayModeState",
									parameters = {
										{
											rawStateId = "455344172",
											name = "p1"
										}
									},
									converter = ()[128]
								},
								{
									stateName = "ovp:MiniboxProgModeMaxState",
									parameters = {
										{
											rawStateId = "455381035",
											name = "p1"
										}
									},
									converter = ()[128]
								},
								{
									stateName = "ovp:MiniboxProgModeMinState",
									parameters = {
										{
											rawStateId = "455376939",
											name = "p1"
										}
									},
									converter = ()[128]
								},
								{
									stateName = "ovp:MiniboxProgModeState",
									parameters = {
										{
											rawStateId = "455344171",
											name = "p1"
										}
									},
									converter = ()[128]
								},
								{
									stateName = "ovp:NbSecAfterLastDetectState",
									parameters = {
										{
											rawStateId = "455397377",
											name = "p1"
										}
									},
									converter = ()[129]
								},
								{
									stateName = "ovp:OpenWindowDetectionActivationMaxState",
									parameters = {
										{
											rawStateId = "455381021",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:OpenWindowDetectionActivationMinState",
									parameters = {
										{
											rawStateId = "455376925",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:ProductTypeState",
									parameters = {
										{
											rawStateId = "455405568",
											name = "p1"
										}
									},
									converter = ()[123]
								},
								{
									stateName = "ovp:ProductVersionState",
									parameters = {
										{
											rawStateId = "455405569",
											name = "p1"
										}
									},
									converter = ()[130]
								},
								{
									stateName = "ovp:RoomTemperatureMaxState",
									parameters = {
										{
											rawStateId = "455381033",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "ovp:RoomTemperatureMinState",
									parameters = {
										{
											rawStateId = "455376937",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "ovp:RoomTemperatureState",
									parameters = {
										{
											rawStateId = "455344169",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "ovp:TechnicalOffsetMaxState",
									parameters = {
										{
											rawStateId = "455381009",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:TechnicalOffsetMinState",
									parameters = {
										{
											rawStateId = "455376913",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:TechnicalOffsetState",
									parameters = {
										{
											rawStateId = "455344145",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:TemporaryTemperatureMaxState",
									parameters = {
										{
											rawStateId = "455381034",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "ovp:TemporaryTemperatureMinState",
									parameters = {
										{
											rawStateId = "455376938",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "ovp:TemporaryTemperatureState",
									parameters = {
										{
											rawStateId = "455344170",
											name = "p1"
										}
									},
									converter = ()[118]
								},
								{
									stateName = "ovp:ThermostatRTCState",
									parameters = {
										{
											rawStateId = "455405572",
											name = "p1"
										}
									},
									converter = ()[131],
									refresh = ()[2]
								},
								{
									stateName = "ovp:Timer2hMaxState",
									parameters = {
										{
											rawStateId = "455381037",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:Timer2hMinState",
									parameters = {
										{
											rawStateId = "455376941",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:Timer2hState",
									parameters = {
										{
											rawStateId = "455344173",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:UniqueSTChipIdState",
									parameters = {
										{
											rawStateId = "455405571",
											name = "p1"
										}
									},
									converter = ()[121]
								},
								{
									stateName = "ovp:UserProgJ1State",
									parameters = {
										{
											rawStateId = "455348224",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:UserProgJ2State",
									parameters = {
										{
											rawStateId = "455348225",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:UserProgJ3State",
									parameters = {
										{
											rawStateId = "455348226",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:UserProgJ4State",
									parameters = {
										{
											rawStateId = "455348227",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:UserProgJ5State",
									parameters = {
										{
											rawStateId = "455348228",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:UserProgJ6State",
									parameters = {
										{
											rawStateId = "455348229",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "ovp:UserProgJ7State",
									parameters = {
										{
											rawStateId = "455348230",
											name = "p1"
										}
									},
									converter = ()[122]
								},
								{
									stateName = "core:NameState",
									parameters = {
										{
											rawStateId = "2415919105",
											name = "p1"
										}
									},
									converter = ()[242]
								},
								{
									stateName = "core:SensorDefectState",
									parameters = {
										{
											rawStateId = "2415919110",
											name = "p1"
										}
									},
									converter = ()[243]
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "2415919106",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:DHWTemperatureState",
									parameters = {
										{
											rawStateId = "185598490",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:ElectricEnergyGenerationState",
									parameters = {
										{
											rawStateId = "185598576",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:ElectricPowerGenerationState",
									parameters = {
										{
											rawStateId = "185598575",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:PrimaryTargetWaterTemperatureState",
									parameters = {
										{
											rawStateId = "185598465",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:SecondaryTargetWaterTemperatureState",
									parameters = {
										{
											rawStateId = "185598472",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:TargetDHWTemperatureState",
									parameters = {
										{
											rawStateId = "185598520",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:TargetRoomTemperatureState",
									parameters = {
										{
											rawStateId = "185598480",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:TargetTemperatureState",
									parameters = {
										{
											rawStateId = "185598480",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:WaterPressureState",
									parameters = {
										{
											rawStateId = "185598482",
											name = "p1"
										}
									}
								},
								{
									stateName = "kizotherm:BurnerOperationHoursState",
									parameters = {
										{
											rawStateId = "185598584",
											name = "p1"
										}
									}
								},
								{
									stateName = "kizotherm:KizOThermCapabilitiesState",
									parameters = {
										{
											rawStateId = "185598467",
											name = "p1"
										}
									},
									converter = ()[247]
								},
								{
									stateName = "kizotherm:KizOThermOperatingModesState",
									parameters = {
										{
											rawStateId = "185598563",
											name = "p1"
										}
									},
									converter = ()[248]
								},
								{
									stateName = "kizotherm:RemoteRoomOverrideSetpointState",
									parameters = {
										{
											rawStateId = "185598473",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "185598488",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "185598489",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "185598490",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "185598491",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:OnOffState",
									parameters = {
										{
											rawStateId = "16830720",
											name = "p1"
										}
									},
									refresh = ()[0],
									converter = ()[252]
								},
								{
									stateName = "core:AutoManuModeState",
									parameters = {
										{
											rawStateId = "core:AutoManuModeState",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:HolidaysModeState",
									parameters = {
										{
											rawStateId = "core:HolidaysModeState",
											name = "p1"
										}
									}
								},
								{
									stateName = "core:TargetTemperatureState",
									parameters = {
										{
											name = "p1",
											rawStateId = "185401345",
											converter = ()[254]
										},
										{
											name = "p2",
											rawStateId = "185401347",
											converter = ()[255]
										}
									},
									converter = ()[256]
								},
								{
									stateName = "ovp:DiagnosticCodeState",
									parameters = {
										{
											rawStateId = "185401857",
											name = "p1"
										}
									},
									converter = ()[257],
									refresh = ()[3]
								},
								{
									stateName = "ovp:MainOperationState",
									parameters = {
										{
											rawStateId = "185401344",
											name = "p1"
										}
									},
									converter = ()[261],
									refresh = ()[3]
								},
								{
									stateName = "ovp:ModeChangeState",
									parameters = {
										{
											rawStateId = "185401345",
											name = "p1"
										}
									},
									converter = ()[254],
									refresh = ()[3]
								},
								{
									stateName = "ovp:OutdoorTemperatureState",
									parameters = {
										{
											rawStateId = "185401602",
											name = "p1"
										}
									},
									converter = ()[262],
									refresh = ()[3]
								},
								{
									stateName = "ovp:RoomTemperatureState",
									parameters = {
										{
											rawStateId = "185401600",
											name = "p1"
										}
									},
									converter = ()[262],
									refresh = ()[3]
								},
								{
									stateName = "ovp:TemperatureChangeState",
									parameters = {
										{
											rawStateId = "185401347",
											name = "p1"
										}
									},
									converter = ()[255],
									refresh = ()[3]
								},
								{
									stateName = "ovp:ThermoStatusState",
									parameters = {
										{
											rawStateId = "185402113",
											name = "p1"
										}
									},
									converter = ()[264],
									refresh = ()[3]
								},
								{
									stateName = "core:IdentifierState",
									parameters = {
										{
											rawStateId = "83935233",
											name = "p1"
										}
									},
									converter = ()[267],
									refresh = ()[2]
								},
								{
									stateName = "core:TemperatureState",
									parameters = {
										{
											rawStateId = "2415919106",
											name = "p1"
										}
									},
									converter = ()[269]
								},
								{
									stateName = "core:BatteryState",
									parameters = {
										{
											rawStateId = "2415919110",
											name = "p1"
										}
									},
									converter = ()[270]
								},
								{
									stateName = "core:OnOffState",
									parameters = {
										{
											rawStateId = "33620224",
											name = "p1"
										}
									},
									refresh = ()[0],
									converter = ()[271]
								},
								{
									stateName = "ovp:HeatingTemperatureInterfaceActiveModeState",
									parameters = {
										{
											rawStateId = "33620224",
											name = "p1"
										}
									},
									refresh = ()[0],
									converter = ()[272]
								},
								{
									stateName = "ovp:HeatingTemperatureInterfaceSetPointModeState",
									parameters = {
										{
											rawStateId = "33620224",
											name = "p1"
										}
									},
									refresh = ()[0],
									converter = ()[273]
								}
							})[0]
						}
					},
					1 = ({
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
							extraDefinition = {
								access = "r",
								parameterId = "1"
							}
						},
						{
							converter = ()[4],
							extraDefinition = {
								access = "w",
								parameterId = "4"
							}
						},
						{
							isParameterRequired = true,
							name = "p1"
						},
						{
							()[5]
						},
						{
							access = "w",
							parameterId = "65537"
						},
						{
							prototype = "string",
							parameters = ()[6],
							converter = ()[6],
							extraDefinition = {
								access = "w",
								parameterId = "1"
							}
						},
						{
							linkedHighLevelState = {
								()[4],
								()[8]
							},
							linkedStateIds = {
								"16830720",
								"16832522",
								"16832526",
								"65558",
								"65559"
							}
						},
						{
							()[4],
							()[5],
							()[7],
							()[8]
						},
						{
							linkedHighLevelState = ()[10],
							linkedStateIds = {
								"16830720",
								"16832522",
								"16832526",
								"16832527",
								"65559"
							}
						},
						{
							linkedHighLevelState = ()[10],
							linkedStateIds = {
								"16830720",
								"16832522",
								"16832526",
								"16832527",
								"65558"
							}
						},
						{
							linkedHighLevelState = {
								()[5],
								()[8]
							},
							linkedStateIds = {
								"16830720",
								"16832522",
								"16832527",
								"65558",
								"65559"
							}
						},
						{
							"16832522",
							"16832526",
							"16832527",
							"65558",
							"65559"
						},
						{
							linkedHighLevelState = {
								()[7],
								()[8]
							},
							linkedStateIds = {
								"16830720",
								"16832526",
								"16832527",
								"65558",
								"65559"
							}
						},
						{
							extraDefinition = {
								access = "r",
								parameterId = "65546"
							}
						},
						{
							extraDefinition = {
								access = "r",
								parameterId = "65537"
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
							extraDefinition = {
								access = "r",
								parameterId = "16832522"
							}
						},
						{
							rawStateId = "16830720"
						},
						{
							()[21]
						},
						{
							access = "w",
							parameterId = "65554"
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
							access = "w",
							parameterId = "16832526"
						},
						{
							access = "w",
							parameterId = "16832522"
						},
						{
							"Temperature"
						},
						{
							()[12]
						},
						{
							getName = ()[3],
							setName = ()[8]
						},
						{
							type = 2,
							widget = "TemperatureSensor",
							uiClass = "TemperatureSensor",
							uiProfiles = ()[28],
							states = {
								1 = ()[1],
								2147426304 = ()[2],
								65537 = {
									linkedHighLevelState = ()[29],
									linkedStateIds = {
										"65558",
										"65559"
									}
								},
								65558 = {
									linkedHighLevelState = ()[29],
									linkedStateIds = {
										"65537",
										"65559"
									}
								},
								65559 = {
									linkedHighLevelState = ()[29],
									linkedStateIds = {
										"65537",
										"65558"
									}
								}
							},
							commands = ()[30]
						},
						{
							"ThermostatTargetReader"
						},
						{
							access = "r",
							parameterId = "234946561"
						},
						{
							isParameterRequired = true,
							name = "p2"
						},
						{
							"SwitchableHeatingStatus",
							"OnOffStatus"
						},
						{
							"StatefulSwitchable",
							"Switchable",
							"Generic"
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
							"StatefulHeatingLevel",
							"HeatingLevel"
						},
						{
							linkedHighLevelState = {
								()[19],
								()[21],
								()[22]
							}
						},
						{
							linkedHighLevelState = {
								()[20]
							}
						},
						{
							linkedHighLevelState = {
								()[23]
							}
						},
						{
							converter = ()[38],
							extraDefinition = ()[7]
						},
						{
							prototype = "string(boost;comfort;comfort-1;comfort-2;eco;frostprotection;off;secured)",
							parameters = ()[6],
							converter = ()[39],
							extraDefinition = ()[23]
						},
						{
							prototype = "any",
							parameters = ()[6],
							converter = ()[40],
							extraDefinition = ()[7]
						},
						{
							prototype = "any",
							parameters = ()[6],
							converter = ()[41],
							extraDefinition = ()[23]
						},
						{
							"Specific"
						},
						{
							linkedHighLevelState = {
								()[24]
							}
						},
						{
							getName = ()[3],
							identify = ()[4],
							setName = ()[8]
						},
						{
							access = "r",
							parameterId = "187760639"
						},
						{
							linkedHighLevelState = {
								()[29]
							}
						},
						{
							linkedHighLevelState = {
								()[31]
							}
						},
						{
							linkedHighLevelState = {
								()[34]
							}
						},
						{
							()[35]
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695246",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695247",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695248",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695249",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695250"
							}
						},
						{
							linkedHighLevelState = ()[54],
							linkedStateIds = {
								"187695230",
								"187695231",
								"187695232",
								"187695233",
								"187695234",
								"187695235",
								"187695236",
								"187695237",
								"187695238",
								"187695239",
								"187695240",
								"187695241",
								"187695242",
								"187695243",
								"187695244",
								"187695245",
								"187695246",
								"187695247",
								"187695248",
								"187695249"
							}
						},
						{
							converter = ()[52],
							extraDefinition = ()[50]
						},
						{
							converter = ()[53],
							extraDefinition = ()[50]
						},
						{
							converter = ()[56],
							extraDefinition = ()[50]
						},
						{
							converter = ()[59],
							extraDefinition = ()[50]
						},
						{
							access = "w",
							parameterId = "187760639"
						},
						{
							prototype = "any",
							parameters = ()[6],
							converter = ()[60],
							extraDefinition = ()[80]
						},
						{
							prototype = "any",
							parameters = ()[6],
							converter = ()[65],
							extraDefinition = ()[80]
						},
						{
							linkedHighLevelState = {
								()[37]
							}
						},
						{
							linkedHighLevelState = {
								()[39]
							}
						},
						{
							linkedHighLevelState = {
								()[40]
							}
						},
						{
							linkedHighLevelState = {
								()[42]
							}
						},
						{
							()[43]
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695267",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695268",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695269",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695270",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695271"
							}
						},
						{
							linkedHighLevelState = ()[87],
							linkedStateIds = {
								"187695251",
								"187695252",
								"187695253",
								"187695254",
								"187695255",
								"187695256",
								"187695257",
								"187695258",
								"187695259",
								"187695260",
								"187695261",
								"187695262",
								"187695263",
								"187695264",
								"187695265",
								"187695266",
								"187695267",
								"187695268",
								"187695269",
								"187695270"
							}
						},
						{
							converter = ()[66],
							extraDefinition = ()[50]
						},
						{
							converter = ()[67],
							extraDefinition = ()[50]
						},
						{
							converter = ()[70],
							extraDefinition = ()[50]
						},
						{
							converter = ()[71],
							extraDefinition = ()[50]
						},
						{
							converter = ()[73],
							extraDefinition = ()[50]
						},
						{
							prototype = "any",
							parameters = ()[6],
							converter = ()[74],
							extraDefinition = ()[80]
						},
						{
							prototype = "any",
							parameters = ()[6],
							converter = ()[77],
							extraDefinition = ()[80]
						},
						{
							prototype = "any",
							parameters = ()[6],
							converter = ()[79],
							extraDefinition = ()[80]
						},
						{
							linkedHighLevelState = {
								()[45]
							}
						},
						{
							linkedHighLevelState = {
								()[47]
							}
						},
						{
							linkedHighLevelState = {
								()[48]
							}
						},
						{
							linkedHighLevelState = {
								()[50]
							}
						},
						{
							()[51]
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695288",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695289",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695290",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695291",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695292"
							}
						},
						{
							linkedHighLevelState = ()[121],
							linkedStateIds = {
								"187695272",
								"187695273",
								"187695274",
								"187695275",
								"187695276",
								"187695277",
								"187695278",
								"187695279",
								"187695280",
								"187695281",
								"187695282",
								"187695283",
								"187695284",
								"187695285",
								"187695286",
								"187695287",
								"187695288",
								"187695289",
								"187695290",
								"187695291"
							}
						},
						{
							converter = ()[80],
							extraDefinition = ()[50]
						},
						{
							converter = ()[81],
							extraDefinition = ()[50]
						},
						{
							converter = ()[84],
							extraDefinition = ()[50]
						},
						{
							converter = ()[85],
							extraDefinition = ()[50]
						},
						{
							converter = ()[87],
							extraDefinition = ()[50]
						},
						{
							prototype = "any",
							parameters = ()[6],
							converter = ()[88],
							extraDefinition = ()[80]
						},
						{
							prototype = "any",
							parameters = ()[6],
							converter = ()[91],
							extraDefinition = ()[80]
						},
						{
							prototype = "any",
							parameters = ()[6],
							converter = ()[93],
							extraDefinition = ()[80]
						},
						{
							linkedHighLevelState = {
								()[56]
							}
						},
						{
							()[57]
						},
						{
							()[58]
						},
						{
							linkedHighLevelState = {
								()[59]
							}
						},
						{
							type = 2,
							widget = "TemperatureSensor",
							uiClass = "TemperatureSensor",
							uiProfiles = ()[28],
							states = {
								2147426304 = ()[2],
								187695726 = ()[154]
							}
						},
						{
							()[61]
						},
						{
							linkedHighLevelState = {
								()[63]
							}
						},
						{
							linkedHighLevelState = {
								()[65]
							}
						},
						{
							2147426304 = ()[2]
						},
						{
							type = 2,
							widget = "CumulativeElectricPowerConsumptionSensor",
							uiClass = "ElectricitySensor",
							uiProfiles = {
								"ElectricEnergyConsumption"
							},
							states = ()[159]
						},
						{
							["ovp:ModbusMainController"] = {
								type = 1,
								widget = "unknown",
								uiClass = "Generic",
								uiProfiles = ()[47],
								states = {
									1 = ()[1],
									2147426304 = ()[2]
								},
								commands = ()[49]
							}
						},
						{
							access = "r",
							parameterId = "186908673"
						},
						{
							access = "w",
							parameterId = "186908673"
						},
						{
							linkedHighLevelState = {
								()[153]
							}
						},
						{
							linkedHighLevelState = {
								()[154]
							}
						},
						{
							extraDefinition = {
								access = "r",
								parameterId = "2415919105"
							}
						},
						{
							prototype = "string",
							parameters = ()[6],
							converter = ()[6],
							extraDefinition = {
								access = "w",
								parameterId = "2415919105"
							}
						},
						{
							["ovp:KizOThermV2OVPComponent"] = {
								type = 1,
								widget = "KizOThermV2Bridge",
								uiClass = "HeatingSystem",
								uiProfiles = {
									"ThermostatTargetReader",
									"DHWThermostatTargetReader",
									"DHWTemperature"
								},
								states = {
									185598490 = {
										linkedHighLevelState = {
											()[156]
										}
									},
									185598576 = {
										linkedHighLevelState = {
											()[157]
										}
									},
									185598575 = {
										linkedHighLevelState = {
											()[158]
										}
									},
									1 = ()[1],
									185598465 = {
										linkedHighLevelState = {
											()[159]
										}
									},
									185598472 = {
										linkedHighLevelState = {
											()[160]
										}
									},
									2147426304 = ()[2],
									185598520 = {
										linkedHighLevelState = {
											()[161]
										}
									},
									185598480 = {
										linkedHighLevelState = {
											()[162],
											()[163]
										}
									},
									185598482 = {
										linkedHighLevelState = {
											()[164]
										}
									},
									185598584 = {
										linkedHighLevelState = {
											()[165]
										}
									},
									185598467 = {
										linkedHighLevelState = {
											()[166]
										}
									},
									185598563 = {
										linkedHighLevelState = {
											()[167]
										}
									},
									185598473 = {
										linkedHighLevelState = {
											()[168]
										}
									}
								},
								commands = {
									getName = ()[3],
									identify = ()[4],
									refreshState = {
										extraDefinition = {
											access = "r",
											parameterId = "185598209"
										}
									},
									setName = ()[8],
									setOperatingModes = {
										prototype = "any",
										parameters = ()[6],
										converter = ()[250],
										extraDefinition = {
											access = "w",
											parameterId = "185598563"
										}
									},
									setSetpointOverride = {
										prototype = "any",
										parameters = ()[6],
										converter = ()[251],
										extraDefinition = {
											access = "w",
											parameterId = "185598473"
										}
									}
								}
							}
						},
						{
							["ovp:KizOThermRoomTemperatureSensor"] = {
								type = 2,
								widget = "TemperatureSensor",
								uiClass = "TemperatureSensor",
								uiProfiles = ()[28],
								states = {
									1 = ()[1],
									2147426304 = ()[2],
									185598488 = {
										linkedHighLevelState = {
											()[169]
										}
									}
								},
								commands = ()[30]
							}
						},
						{
							["ovp:KizOThermBoilerTemperatureSensor"] = {
								type = 2,
								widget = "TemperatureSensor",
								uiClass = "TemperatureSensor",
								uiProfiles = ()[28],
								states = {
									1 = ()[1],
									2147426304 = ()[2],
									185598489 = {
										linkedHighLevelState = {
											()[170]
										}
									}
								},
								commands = ()[30]
							}
						},
						{
							["ovp:KizOThermDHWTemperatureSensor"] = {
								type = 2,
								widget = "TemperatureSensor",
								uiClass = "TemperatureSensor",
								uiProfiles = ()[28],
								states = {
									2147426304 = ()[2],
									185598490 = {
										linkedHighLevelState = {
											()[171]
										}
									}
								}
							}
						},
						{
							["ovp:KizOThermOutsideTemperatureSensor"] = {
								type = 2,
								widget = "TemperatureSensor",
								uiClass = "TemperatureSensor",
								uiProfiles = ()[28],
								states = {
									2147426304 = ()[2],
									185598491 = {
										linkedHighLevelState = {
											()[172]
										}
									}
								}
							}
						},
						{
							linkedHighLevelState = {
								()[184]
							}
						},
						{
							converter = ()[268],
							extraDefinition = {
								access = "r",
								parameterId = "5"
							}
						},
						{
							extraDefinition = {
								access = "r",
								parameterId = "2415919106"
							}
						},
						{
							extraDefinition = {
								access = "r",
								parameterId = "33620224"
							}
						},
						{
							access = "w",
							parameterId = "34603264"
						}
					})[1],
					2147426304 = ()[2]
				},
				commands = {
					getName = ()[3],
					identify = ()[4],
					setLevel = {
						prototype = "integer[0;100]",
						parameters = ()[6],
						converter = ()[5],
						extraDefinition = ()[7]
					},
					setName = ()[8]
				}
			}
		}
	},
	917506 = {
		name = "Heating Temperature Interface (SOMFY)",
		localPairing = true,
		1 = {
			["ovp:SomfyHeatingTemperatureInterfaceOVPComponent"] = {
				type = 1,
				widget = "SomfyHeatingTemperatureInterface",
				uiClass = "HeatingSystem",
				uiProfiles = {
					"OperatingModeHeating",
					"ThermostatTargetReader",
					"OnOffStatus"
				},
				states = {
					65556 = {
						linkedHighLevelState = {
							()[3]
						}
					},
					16832527 = ()[9],
					65558 = ()[11],
					65559 = ()[12],
					16832526 = ()[13],
					1 = ()[1],
					16830720 = {
						linkedHighLevelState = {
							()[6],
							()[8],
							()[11]
						},
						linkedStateIds = ()[14]
					},
					16832522 = ()[15],
					2147426304 = ()[2],
					65546 = {
						linkedHighLevelState = {
							()[9],
							()[10]
						}
					}
				},
				commands = {
					getName = ()[3],
					identify = ()[4],
					refreshActiveMode = ()[16],
					refreshBatteryLevel = ()[17],
					refreshComfortTemperature = ()[18],
					refreshEcoTemperature = ()[19],
					refreshOnOffState = ()[17],
					refreshSecuredPositionTemperature = ()[20],
					refreshTemperature = ()[17],
					refreshSetPointMode = ()[17],
					refreshTargetTemperature = ()[17],
					setActiveMode = {
						prototype = "string(auto;manu)",
						parameters = ()[6],
						rawStates = ()[22],
						converter = ()[18],
						extraDefinition = ()[23]
					},
					setComfortTemperature = {
						prototype = "float[7.0;30.0]",
						parameters = ()[6],
						rawStates = ()[24],
						converter = ()[19],
						extraDefinition = ()[25]
					},
					setEcoTemperature = {
						prototype = "float[6.0;29.0]",
						parameters = ()[6],
						rawStates = ()[24],
						converter = ()[19],
						extraDefinition = ()[26]
					},
					setManuAndSetPointModes = {
						prototype = "string(comfort;eco;secured)",
						parameters = ()[6],
						converter = ()[20],
						extraDefinition = ()[23]
					},
					setName = ()[8],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = ()[6],
						rawStates = {
							{
								rawStateId = "65546"
							},
							()[21]
						},
						converter = ()[21],
						extraDefinition = ()[23]
					},
					setOperatingMode = {
						prototype = "string(heating;cooling;heatingCooling)",
						parameters = ()[6],
						converter = ()[22],
						extraDefinition = ()[23]
					},
					setSecuredPositionTemperature = {
						prototype = "float[5.0;15.0]",
						parameters = ()[6],
						rawStates = ()[24],
						converter = ()[19],
						extraDefinition = ()[27]
					}
				}
			}
		},
		2 = {
			["ovp:HeatingTemperatureInterfaceTemperatureSensor"] = ()[31]
		}
	},
	917515 = {
		name = "Heating Temperature Interface (IMHOTEP)",
		localPairing = true,
		1 = {
			["ovp:ImhotepHeatingTemperatureInterfaceOVPComponent"] = {
				type = 1,
				widget = "ImhotepHeatingTemperatureInterface",
				uiClass = "HeatingSystem",
				uiProfiles = ()[32],
				states = {
					234946564 = {
						linkedHighLevelState = {
							()[13]
						}
					},
					16832527 = ()[9],
					65558 = ()[11],
					65559 = ()[12],
					16832526 = ()[13],
					1 = ()[1],
					16832522 = ()[15],
					2147426304 = ()[2],
					16830720 = {
						linkedHighLevelState = {
							()[8],
							()[11]
						},
						linkedStateIds = ()[14]
					},
					234946826 = {
						linkedHighLevelState = {
							()[14]
						}
					},
					65546 = {
						linkedHighLevelState = {
							()[9]
						}
					},
					["ovp:SetSetPointModeInProgressState"] = {
						linkedHighLevelState = {
							()[15]
						}
					}
				},
				commands = {
					getName = ()[3],
					identify = ()[4],
					refreshActiveMode = ()[16],
					refreshBatteryLevel = {
						converter = ()[24],
						extraDefinition = {
							access = "r",
							parameterId = "234946563"
						}
					},
					refreshComfortTemperature = ()[18],
					refreshDeviceSerialNumber = {
						converter = ()[24],
						extraDefinition = ()[33]
					},
					refreshEcoTemperature = ()[19],
					refreshSecuredPositionTemperature = ()[20],
					refreshTemperature = ()[17],
					refreshSetPointMode = ()[17],
					refreshTargetTemperature = ()[17],
					setActiveAndSetPointModes = {
						prototype = "string(auto;manu),string(comfort;eco;secured)|float[7.0;26.0]",
						parameters = {
							()[5],
							()[34]
						},
						rawStates = ()[24],
						converter = ()[25],
						extraDefinition = ()[23]
					},
					setActiveMode = {
						prototype = "string(auto;manu)",
						parameters = ()[6],
						rawStates = ()[22],
						converter = ()[26],
						extraDefinition = ()[23]
					},
					setAutoAndSetPointModes = {
						prototype = "string(comfort;eco;secured)",
						parameters = ()[6],
						converter = ()[27],
						extraDefinition = ()[23]
					},
					setComfortTemperature = {
						prototype = "float[14.5;26.0]",
						parameters = ()[6],
						rawStates = ()[24],
						converter = ()[19],
						extraDefinition = ()[25]
					},
					setEcoTemperature = {
						prototype = "float[12.5;24.0]",
						parameters = ()[6],
						rawStates = ()[24],
						converter = ()[19],
						extraDefinition = ()[26]
					},
					setName = ()[8],
					setSecuredPositionTemperature = {
						prototype = "float[7.0;12.0]",
						parameters = ()[6],
						rawStates = ()[24],
						converter = ()[19],
						extraDefinition = ()[27]
					},
					setSetPointMode = {
						prototype = "string(comfort;eco;secured)|float[7.0;26.0]",
						parameters = ()[6],
						rawStates = ()[24],
						converter = ()[28],
						extraDefinition = ()[23]
					}
				}
			}
		},
		2 = {
			["ovp:ImhotepHeatingTemperatureInterfaceTemperatureSensor"] = ()[31]
		},
		3 = {
			["ovp:ImhotepHeatingTemperatureRelayOVPComponent"] = {
				type = 1,
				widget = "StatefulOnOff",
				uiClass = "HeatingSystem",
				uiProfiles = ()[35],
				states = {
					234946824 = {
						linkedHighLevelState = {
							()[16]
						}
					},
					1 = ()[1],
					65546 = {
						linkedHighLevelState = {
							()[17]
						}
					},
					2147426304 = ()[2]
				},
				commands = {
					getName = ()[3],
					identify = ()[4],
					refreshConnectivity = {
						converter = ()[32],
						extraDefinition = {
							access = "r",
							parameterId = "234946567"
						}
					},
					refreshDeviceSerialNumber = {
						converter = ()[32],
						extraDefinition = ()[33]
					},
					refreshOnOffState = ()[16],
					refreshOperatingTime = {
						converter = ()[32],
						extraDefinition = {
							access = "r",
							parameterId = "234946569"
						}
					},
					setName = ()[8]
				}
			}
		}
	},
	983040 = {
		name = "Switch On/Off",
		localPairing = true,
		0 = {
			["ovp:OnOffOVPComponent"] = {
				type = 1,
				widget = "StatefulOnOff",
				uiClass = "OnOff",
				uiProfiles = ()[36],
				states = {
					1 = ()[1],
					65537 = {
						linkedHighLevelState = {
							()[18]
						}
					},
					2147426304 = ()[2]
				},
				commands = {
					getName = ()[3],
					identify = ()[4],
					setName = ()[8],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = ()[6],
						converter = ()[34],
						extraDefinition = ()[7]
					},
					off = {
						parameters = ()[37],
						converter = ()[34],
						extraDefinition = ()[7]
					},
					on = {
						parameters = ()[38],
						converter = ()[34],
						extraDefinition = ()[7]
					}
				}
			}
		}
	},
	3407872 = {
		name = "Electrical heater",
		localPairing = true,
		0 = {
			["ovp:ElectricalHeaterGenericOVPComponent"] = {
				type = 1,
				widget = "unknown",
				uiClass = "HeatingSystem",
				uiProfiles = ()[39],
				states = {
					1 = ()[1],
					16830720 = ()[40],
					2147426304 = ()[2],
					65547 = ()[41],
					65548 = ()[42]
				},
				commands = {
					getName = ()[3],
					identify = ()[4],
					off = ()[43],
					setHeatingLevel = ()[44],
					setHeatingLevelForTrigger = ()[45],
					setName = ()[8],
					setTimerForTransitoryState = ()[46]
				}
			}
		}
	},
	16842763 = {
		name = "De Dietrich Modbus Gateway",
		localPairing = true,
		1 = {
			["ovp:DeDietrichModbusGatewayOVPComponent"] = {
				type = 5,
				widget = "DeDietrichModbusGateway",
				uiClass = "ProtocolGateway",
				uiProfiles = ()[47],
				states = {
					1 = ()[1],
					2147426304 = ()[48]
				},
				commands = ()[49]
			}
		},
		2 = {
			["ovp:BoilerControllerOVPComponent"] = {
				type = 1,
				widget = "DeDietrichBoiler",
				uiClass = "HeatingSystem",
				uiProfiles = ()[47],
				states = {
					187695569 = {
						linkedHighLevelState = {
							()[25]
						}
					},
					187695839 = {
						linkedHighLevelState = {
							()[26]
						}
					},
					2147426304 = ()[2],
					187695604 = {
						linkedHighLevelState = {
							()[27]
						}
					}
				},
				commands = {
					refreshAlarm = {
						converter = ()[45],
						extraDefinition = ()[50]
					},
					refreshOperatingState = {
						converter = ()[46],
						extraDefinition = ()[50]
					},
					refreshRedAlarm = {
						converter = ()[47],
						extraDefinition = ()[50]
					}
				}
			}
		},
		3 = {
			["ovp:OutsideTemperatureSensorOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[28],
				states = {
					2147426304 = ()[2],
					187695705 = {
						linkedHighLevelState = {
							()[28]
						}
					}
				}
			}
		},
		4 = {
			["ovp:HeatingCircuitOnCircuitAOVPComponent"] = {
				type = 1,
				widget = "DeDietrichHeatingCircuit",
				uiClass = "HeatingSystem",
				uiProfiles = ()[28],
				states = {
					187695335 = ()[51],
					187695754 = {
						linkedHighLevelState = {
							()[30]
						}
					},
					187695741 = ()[52],
					187695755 = {
						linkedHighLevelState = {
							()[32]
						}
					},
					187695756 = {
						linkedHighLevelState = {
							()[33]
						}
					},
					2147426304 = ()[2],
					187695718 = ()[53],
					187695230 = ()[55],
					187695231 = ()[56],
					187695232 = ()[57],
					187695233 = ()[58],
					187695234 = ()[59],
					187695235 = ()[60],
					187695236 = ()[61],
					187695237 = ()[62],
					187695238 = ()[63],
					187695239 = ()[64],
					187695240 = ()[65],
					187695241 = ()[66],
					187695242 = ()[67],
					187695243 = ()[68],
					187695244 = ()[69],
					187695245 = ()[70],
					187695246 = ()[71],
					187695247 = ()[72],
					187695248 = ()[73],
					187695249 = ()[74],
					187695250 = ()[75],
					187695757 = {
						linkedHighLevelState = {
							()[36]
						}
					}
				},
				commands = {
					refreshActiveTimeProgram = ()[76],
					refreshCircuitType = ()[77],
					refreshComfortTemperature = {
						converter = ()[54],
						extraDefinition = ()[50]
					},
					refreshDerogationMode = {
						converter = ()[55],
						extraDefinition = ()[50]
					},
					refreshOperatingMode = ()[78],
					refreshReducedTemperature = {
						converter = ()[57],
						extraDefinition = ()[50]
					},
					refreshSecuredPositionTemperature = {
						converter = ()[58],
						extraDefinition = ()[50]
					},
					refreshTimeProgram = ()[79],
					setActiveTimeProgram = ()[81],
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[6],
						converter = ()[61],
						extraDefinition = ()[80]
					},
					setDerogationMode = {
						prototype = "string(holidays;eco;comfort;auto)",
						parameters = ()[6],
						converter = ()[62],
						extraDefinition = ()[80]
					},
					setReducedTemperature = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[63],
						extraDefinition = ()[80]
					},
					setSecuredPositionTemperature = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[64],
						extraDefinition = ()[80]
					},
					setTimeProgram = ()[82]
				}
			}
		},
		5 = {
			["ovp:HeatingCircuitTemperatureSensorOnCircuitAOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[28],
				states = {
					2147426304 = ()[2],
					187695718 = ()[53]
				}
			}
		},
		6 = {
			["ovp:HeatingCircuitOnCircuitBOVPComponent"] = {
				type = 1,
				widget = "DeDietrichHeatingCircuit",
				uiClass = "HeatingSystem",
				uiProfiles = ()[28],
				states = {
					187695336 = ()[83],
					187695760 = {
						linkedHighLevelState = {
							()[38]
						}
					},
					187695742 = ()[84],
					187695761 = ()[85],
					187695762 = {
						linkedHighLevelState = {
							()[41]
						}
					},
					2147426304 = ()[2],
					187695720 = ()[86],
					187695251 = ()[88],
					187695252 = ()[89],
					187695253 = ()[90],
					187695254 = ()[91],
					187695255 = ()[92],
					187695256 = ()[93],
					187695257 = ()[94],
					187695258 = ()[95],
					187695259 = ()[96],
					187695260 = ()[97],
					187695261 = ()[98],
					187695262 = ()[99],
					187695263 = ()[100],
					187695264 = ()[101],
					187695265 = ()[102],
					187695266 = ()[103],
					187695267 = ()[104],
					187695268 = ()[105],
					187695269 = ()[106],
					187695270 = ()[107],
					187695271 = ()[108],
					187695763 = {
						linkedHighLevelState = {
							()[44]
						}
					}
				},
				commands = {
					refreshActiveTimeProgram = ()[109],
					refreshCircuitType = ()[110],
					refreshComfortTemperature = {
						converter = ()[68],
						extraDefinition = ()[50]
					},
					refreshDerogationMode = {
						converter = ()[69],
						extraDefinition = ()[50]
					},
					refreshOperatingMode = ()[111],
					refreshReducedTemperature = ()[112],
					refreshSecuredPositionTemperature = {
						converter = ()[72],
						extraDefinition = ()[50]
					},
					refreshTimeProgram = ()[113],
					setActiveTimeProgram = ()[114],
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[6],
						converter = ()[75],
						extraDefinition = ()[80]
					},
					setDerogationMode = {
						prototype = "string(holidays;eco;comfort;auto)",
						parameters = ()[6],
						converter = ()[76],
						extraDefinition = ()[50]
					},
					setReducedTemperature = ()[115],
					setSecuredPositionTemperature = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[78],
						extraDefinition = ()[80]
					},
					setTimeProgram = ()[116]
				}
			}
		},
		7 = {
			["ovp:HeatingCircuitTemperatureSensorOnCircuitBOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[28],
				states = {
					2147426304 = ()[2],
					187695720 = ()[86]
				}
			}
		},
		8 = {
			["ovp:HeatingCircuitOnCircuitCOVPComponent"] = {
				type = 1,
				widget = "DeDietrichHeatingCircuit",
				uiClass = "HeatingSystem",
				uiProfiles = ()[28],
				states = {
					187695337 = ()[117],
					187695768 = {
						linkedHighLevelState = {
							()[46]
						}
					},
					187695743 = ()[118],
					187695769 = ()[119],
					187695770 = {
						linkedHighLevelState = {
							()[49]
						}
					},
					2147426304 = ()[2],
					187695722 = ()[120],
					187695272 = ()[122],
					187695273 = ()[123],
					187695274 = ()[124],
					187695275 = ()[125],
					187695276 = ()[126],
					187695277 = ()[127],
					187695278 = ()[128],
					187695279 = ()[129],
					187695280 = ()[130],
					187695281 = ()[131],
					187695282 = ()[132],
					187695283 = ()[133],
					187695284 = ()[134],
					187695285 = ()[135],
					187695286 = ()[136],
					187695287 = ()[137],
					187695288 = ()[138],
					187695289 = ()[139],
					187695290 = ()[140],
					187695291 = ()[141],
					187695292 = ()[142],
					187695771 = {
						linkedHighLevelState = {
							()[52]
						}
					}
				},
				commands = {
					refreshActiveTimeProgram = ()[143],
					refreshCircuitType = ()[144],
					refreshComfortTemperature = {
						converter = ()[82],
						extraDefinition = ()[50]
					},
					refreshDerogationMode = {
						converter = ()[83],
						extraDefinition = ()[50]
					},
					refreshOperatingMode = ()[145],
					refreshReducedTemperature = ()[146],
					refreshSecuredPositionTemperature = {
						converter = ()[86],
						extraDefinition = ()[50]
					},
					refreshTimeProgram = ()[147],
					setActiveTimeProgram = ()[148],
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[6],
						converter = ()[89],
						extraDefinition = ()[80]
					},
					setDerogationMode = {
						prototype = "string(holidays;eco;comfort;auto)",
						parameters = ()[6],
						converter = ()[90],
						extraDefinition = ()[50]
					},
					setReducedTemperature = ()[149],
					setSecuredPositionTemperature = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[92],
						extraDefinition = ()[80]
					},
					setTimeProgram = ()[150]
				}
			}
		},
		9 = {
			["ovp:HeatingCircuitTemperatureSensorOnCircuitCOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[28],
				states = {
					2147426304 = ()[2],
					187695722 = ()[120]
				}
			}
		},
		10 = {
			["ovp:DHW1OnDHWCircuitOVPComponent"] = {
				type = 1,
				widget = "DeDietrichDHW",
				uiClass = "WaterHeatingSystem",
				uiProfiles = ()[28],
				states = {
					187695776 = {
						linkedHighLevelState = {
							()[53]
						}
					},
					187695744 = {
						linkedHighLevelState = {
							()[54]
						}
					},
					187695777 = {
						linkedHighLevelState = {
							()[55]
						}
					},
					2147426304 = ()[2],
					187695707 = ()[151],
					187695293 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695294 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695295 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695296 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695297 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695298 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695299 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695300 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695301 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695302 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695303 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695304 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695305 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695306 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695307 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695308 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695309",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695309 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695310",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695310 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695311",
							"187695312",
							"187695313"
						}
					},
					187695311 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695312",
							"187695313"
						}
					},
					187695312 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695313"
						}
					},
					187695313 = {
						linkedHighLevelState = ()[152],
						linkedStateIds = {
							"187695293",
							"187695294",
							"187695295",
							"187695296",
							"187695297",
							"187695298",
							"187695299",
							"187695300",
							"187695301",
							"187695302",
							"187695303",
							"187695304",
							"187695305",
							"187695306",
							"187695307",
							"187695308",
							"187695309",
							"187695310",
							"187695311",
							"187695312"
						}
					},
					187695757 = {
						linkedHighLevelState = ()[153],
						linkedStateIds = {
							"187695763",
							"187695771"
						}
					},
					187695763 = {
						linkedHighLevelState = ()[153],
						linkedStateIds = {
							"187695757",
							"187695771"
						}
					},
					187695771 = {
						linkedHighLevelState = ()[153],
						linkedStateIds = {
							"187695757",
							"187695763"
						}
					}
				},
				commands = {
					refreshCircuitType = {
						converter = ()[95],
						extraDefinition = ()[50]
					},
					refreshComfortTemperature = {
						converter = ()[96],
						extraDefinition = ()[50]
					},
					refreshDHWDerogationMode = {
						converter = ()[97],
						extraDefinition = ()[50]
					},
					refreshOperatingMode = {
						converter = ()[98],
						extraDefinition = ()[50]
					},
					refreshReducedTemperature = {
						converter = ()[99],
						extraDefinition = ()[50]
					},
					refreshTimeProgram = {
						converter = ()[100],
						extraDefinition = ()[50]
					},
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[6],
						converter = ()[101],
						extraDefinition = ()[80]
					},
					setDHWDerogationMode = {
						prototype = "string(auto;comfort)",
						parameters = ()[6],
						rawStates = {
							{
								rawStateId = "187695757"
							},
							{
								rawStateId = "187695763"
							},
							{
								rawStateId = "187695771"
							}
						},
						converter = ()[102],
						extraDefinition = ()[50]
					},
					setReducedTemperature = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[103],
						extraDefinition = ()[80]
					},
					setTimeProgram = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[104],
						extraDefinition = ()[80]
					}
				}
			}
		},
		11 = {
			["ovp:DHW1TemperatureSensorOnDHWCircuitOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[28],
				states = {
					2147426304 = ()[2],
					187695707 = ()[151]
				}
			}
		},
		12 = {
			["ovp:DHW2OnCircuitAOVPComponent"] = {
				type = 1,
				widget = "DeDietrichDHW",
				uiClass = "WaterHeatingSystem",
				uiProfiles = ()[28],
				states = {
					187695335 = ()[51],
					187695741 = ()[52],
					2147426304 = ()[2],
					187695726 = ()[154],
					187695230 = ()[55],
					187695231 = ()[56],
					187695232 = ()[57],
					187695233 = ()[58],
					187695234 = ()[59],
					187695235 = ()[60],
					187695236 = ()[61],
					187695237 = ()[62],
					187695238 = ()[63],
					187695239 = ()[64],
					187695240 = ()[65],
					187695241 = ()[66],
					187695242 = ()[67],
					187695243 = ()[68],
					187695244 = ()[69],
					187695245 = ()[70],
					187695246 = ()[71],
					187695247 = ()[72],
					187695248 = ()[73],
					187695249 = ()[74],
					187695250 = ()[75]
				},
				commands = {
					refreshActiveTimeProgram = ()[76],
					refreshCircuitType = ()[77],
					refreshOperatingMode = ()[78],
					refreshTimeProgram = ()[79],
					setActiveTimeProgram = ()[81],
					setTimeProgram = ()[82]
				}
			}
		},
		13 = {
			["ovp:DHW2TemperatureSensorOnCircuitAOVPComponent"] = ()[155]
		},
		14 = {
			["ovp:DHW2OnAuxiliaryCircuitOVPComponent"] = {
				type = 1,
				widget = "DeDietrichDHW",
				uiClass = "WaterHeatingSystem",
				uiProfiles = ()[28],
				states = {
					187695745 = {
						linkedHighLevelState = {
							()[60]
						}
					},
					2147426304 = ()[2],
					187695726 = ()[154],
					187695314 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695315 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695316 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695317 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695318 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695319 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695320 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695321 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695322 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695323 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695324 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695325 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695326 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695327 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695328 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695329 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695330",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695330 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695331",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695331 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695332",
							"187695333",
							"187695334"
						}
					},
					187695332 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695333",
							"187695334"
						}
					},
					187695333 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695334"
						}
					},
					187695334 = {
						linkedHighLevelState = ()[156],
						linkedStateIds = {
							"187695314",
							"187695315",
							"187695316",
							"187695317",
							"187695318",
							"187695319",
							"187695320",
							"187695321",
							"187695322",
							"187695323",
							"187695324",
							"187695325",
							"187695326",
							"187695327",
							"187695328",
							"187695329",
							"187695330",
							"187695331",
							"187695332",
							"187695333"
						}
					}
				},
				commands = {
					refreshCircuitType = {
						converter = ()[105],
						extraDefinition = ()[50]
					},
					refreshOperatingMode = {
						converter = ()[106],
						extraDefinition = ()[50]
					},
					refreshTimeProgram = {
						converter = ()[107],
						extraDefinition = ()[50]
					},
					setTimeProgram = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[108],
						extraDefinition = ()[80]
					}
				}
			}
		},
		15 = {
			["ovp:DHW2TemperatureSensorOnAuxiliaryCircuitOVPComponent"] = ()[155]
		},
		16 = {
			["ovp:SwimmingPoolOnCircuitBOVPComponent"] = {
				type = 1,
				widget = "DeDietrichSwimmingPool",
				uiClass = "SwimmingPool",
				uiProfiles = ()[28],
				states = {
					187695336 = ()[83],
					187695790 = {
						linkedHighLevelState = {
							()[62]
						}
					},
					187695742 = ()[84],
					187695761 = ()[85],
					2147426304 = ()[2],
					187695709 = ()[157],
					187695251 = ()[88],
					187695252 = ()[89],
					187695253 = ()[90],
					187695254 = ()[91],
					187695255 = ()[92],
					187695256 = ()[93],
					187695257 = ()[94],
					187695258 = ()[95],
					187695259 = ()[96],
					187695260 = ()[97],
					187695261 = ()[98],
					187695262 = ()[99],
					187695263 = ()[100],
					187695264 = ()[101],
					187695265 = ()[102],
					187695266 = ()[103],
					187695267 = ()[104],
					187695268 = ()[105],
					187695269 = ()[106],
					187695270 = ()[107],
					187695271 = ()[108]
				},
				commands = {
					autoMode = {
						converter = ()[109],
						extraDefinition = ()[80]
					},
					refreshActiveTimeProgram = ()[109],
					refreshCircuitType = ()[110],
					refreshComfortTemperature = {
						converter = ()[110],
						extraDefinition = ()[50]
					},
					refreshOperatingMode = ()[111],
					refreshReducedTemperature = ()[112],
					refreshTimeProgram = ()[113],
					refreshWaterSensorValue = {
						converter = ()[111],
						extraDefinition = ()[50]
					},
					setActiveTimeProgram = ()[114],
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[6],
						converter = ()[112],
						extraDefinition = ()[80]
					},
					setReducedTemperature = ()[115],
					setTimeProgram = ()[116]
				}
			}
		},
		17 = {
			["ovp:SwimmingPoolTemperatureSensorOnCircuitBOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[28],
				states = {
					2147426304 = ()[2],
					187695709 = ()[157]
				}
			}
		},
		18 = {
			["ovp:SwimmingPoolOnCircuitCOVPComponent"] = {
				type = 1,
				widget = "DeDietrichSwimmingPool",
				uiClass = "SwimmingPool",
				uiProfiles = ()[28],
				states = {
					187695337 = ()[117],
					187695791 = {
						linkedHighLevelState = {
							()[64]
						}
					},
					187695743 = ()[118],
					187695769 = ()[119],
					2147426304 = ()[2],
					187695710 = ()[158],
					187695272 = ()[122],
					187695273 = ()[123],
					187695274 = ()[124],
					187695275 = ()[125],
					187695276 = ()[126],
					187695277 = ()[127],
					187695278 = ()[128],
					187695279 = ()[129],
					187695280 = ()[130],
					187695281 = ()[131],
					187695282 = ()[132],
					187695283 = ()[133],
					187695284 = ()[134],
					187695285 = ()[135],
					187695286 = ()[136],
					187695287 = ()[137],
					187695288 = ()[138],
					187695289 = ()[139],
					187695290 = ()[140],
					187695291 = ()[141],
					187695292 = ()[142]
				},
				commands = {
					autoMode = {
						converter = ()[113],
						extraDefinition = ()[80]
					},
					refreshActiveTimeProgram = ()[143],
					refreshCircuitType = ()[144],
					refreshComfortTemperature = {
						converter = ()[114],
						extraDefinition = ()[50]
					},
					refreshOperatingMode = ()[145],
					refreshReducedTemperature = ()[146],
					refreshTimeProgram = ()[147],
					refreshWaterSensorValue = {
						converter = ()[115],
						extraDefinition = ()[50]
					},
					setActiveTimeProgram = ()[148],
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[6],
						converter = ()[116],
						extraDefinition = ()[80]
					},
					setReducedTemperature = ()[149],
					setTimeProgram = ()[150]
				}
			}
		},
		19 = {
			["ovp:SwimmingPoolTemperatureSensorOnCircuitCOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[28],
				states = {
					2147426304 = ()[2],
					187695710 = ()[158]
				}
			}
		},
		20 = {
			["ovp:SolarCircuitOVPComponent"] = {
				type = 1,
				widget = "unknown",
				uiClass = "unknown",
				uiProfiles = ()[47],
				states = ()[159],
				commands = {
					refreshSoftwareVersion = {
						converter = ()[117],
						extraDefinition = ()[50]
					}
				}
			}
		},
		21 = {
			["ovp:CoolingCumulatedElectricalEnergyConsumptionSensor"] = ()[160]
		},
		22 = {
			["ovp:DHWCumulatedElectricalEnergyConsumptionSensor"] = ()[160]
		},
		23 = {
			["ovp:HeatingCumulatedElectricalEnergyConsumptionSensor"] = ()[160]
		}
	},
	16843019 = {
		name = "Generic Modbus Gateway",
		localPairing = true,
		0 = ()[161]
	},
	17043211 = {
		name = "Thermostat Cotherm ERD440-01",
		localPairing = true,
		0 = {
			["ovp:CothermThermostatOVPComponent"] = {
				type = 1,
				widget = "CothermThermostat",
				uiClass = "HeatingSystem",
				uiProfiles = ()[47],
				states = {
					455344142 = {
						linkedHighLevelState = {
							()[66]
						}
					},
					455344143 = {
						linkedHighLevelState = {
							()[67]
						}
					},
					455344144 = {
						linkedHighLevelState = {
							()[68]
						}
					},
					455397376 = {
						linkedHighLevelState = {
							()[69]
						}
					},
					1 = ()[1],
					455344157 = {
						linkedHighLevelState = {
							()[70]
						}
					},
					2147426304 = ()[2],
					455381018 = {
						linkedHighLevelState = {
							()[71]
						}
					},
					455376922 = {
						linkedHighLevelState = {
							()[72]
						}
					},
					455344154 = {
						linkedHighLevelState = {
							()[73]
						}
					},
					455350016 = {
						linkedHighLevelState = {
							()[74]
						}
					},
					455350017 = {
						linkedHighLevelState = {
							()[75]
						}
					},
					455350018 = {
						linkedHighLevelState = {
							()[76]
						}
					},
					455350019 = {
						linkedHighLevelState = {
							()[77]
						}
					},
					455350020 = {
						linkedHighLevelState = {
							()[78]
						}
					},
					455350021 = {
						linkedHighLevelState = {
							()[79]
						}
					},
					455350022 = {
						linkedHighLevelState = {
							()[80]
						}
					},
					455350272 = {
						linkedHighLevelState = {
							()[81]
						}
					},
					455350273 = {
						linkedHighLevelState = {
							()[82]
						}
					},
					455350274 = {
						linkedHighLevelState = {
							()[83]
						}
					},
					455350275 = {
						linkedHighLevelState = {
							()[84]
						}
					},
					455350276 = {
						linkedHighLevelState = {
							()[85]
						}
					},
					455350277 = {
						linkedHighLevelState = {
							()[86]
						}
					},
					455350278 = {
						linkedHighLevelState = {
							()[87]
						}
					},
					455350528 = {
						linkedHighLevelState = {
							()[88]
						}
					},
					455350529 = {
						linkedHighLevelState = {
							()[89]
						}
					},
					455350530 = {
						linkedHighLevelState = {
							()[90]
						}
					},
					455350531 = {
						linkedHighLevelState = {
							()[91]
						}
					},
					455350532 = {
						linkedHighLevelState = {
							()[92]
						}
					},
					455350533 = {
						linkedHighLevelState = {
							()[93]
						}
					},
					455350534 = {
						linkedHighLevelState = {
							()[94]
						}
					},
					455381027 = {
						linkedHighLevelState = {
							()[95]
						}
					},
					455376931 = {
						linkedHighLevelState = {
							()[96]
						}
					},
					455344163 = {
						linkedHighLevelState = {
							()[97]
						}
					},
					455381006 = {
						linkedHighLevelState = {
							()[98]
						}
					},
					455376910 = {
						linkedHighLevelState = {
							()[99]
						}
					},
					455397385 = {
						linkedHighLevelState = {
							()[100]
						}
					},
					455397378 = {
						linkedHighLevelState = {
							()[101]
						}
					},
					455381005 = {
						linkedHighLevelState = {
							()[102]
						}
					},
					455376909 = {
						linkedHighLevelState = {
							()[103]
						}
					},
					455344141 = {
						linkedHighLevelState = {
							()[104]
						}
					},
					455397386 = {
						linkedHighLevelState = {
							()[105]
						}
					},
					455381017 = {
						linkedHighLevelState = {
							()[106]
						}
					},
					455376921 = {
						linkedHighLevelState = {
							()[107]
						}
					},
					455344153 = {
						linkedHighLevelState = {
							()[108]
						}
					},
					455381007 = {
						linkedHighLevelState = {
							()[109]
						}
					},
					455376911 = {
						linkedHighLevelState = {
							()[110]
						}
					},
					455381015 = {
						linkedHighLevelState = {
							()[111]
						}
					},
					455376919 = {
						linkedHighLevelState = {
							()[112]
						}
					},
					455344151 = {
						linkedHighLevelState = {
							()[113]
						}
					},
					455397382 = {
						linkedHighLevelState = {
							()[114]
						}
					},
					455405570 = {
						linkedHighLevelState = {
							()[115]
						}
					},
					455381008 = {
						linkedHighLevelState = {
							()[116]
						}
					},
					455376912 = {
						linkedHighLevelState = {
							()[117]
						}
					},
					455381016 = {
						linkedHighLevelState = {
							()[118]
						}
					},
					455376920 = {
						linkedHighLevelState = {
							()[119]
						}
					},
					455344152 = {
						linkedHighLevelState = {
							()[120]
						}
					},
					455381036 = {
						linkedHighLevelState = {
							()[121]
						}
					},
					455376940 = {
						linkedHighLevelState = {
							()[122]
						}
					},
					455344172 = {
						linkedHighLevelState = {
							()[123]
						}
					},
					455381035 = {
						linkedHighLevelState = {
							()[124]
						}
					},
					455376939 = {
						linkedHighLevelState = {
							()[125]
						}
					},
					455344171 = {
						linkedHighLevelState = {
							()[126]
						}
					},
					455397377 = {
						linkedHighLevelState = {
							()[127]
						}
					},
					455381021 = {
						linkedHighLevelState = {
							()[128]
						}
					},
					455376925 = {
						linkedHighLevelState = {
							()[129]
						}
					},
					455405568 = {
						linkedHighLevelState = {
							()[130]
						}
					},
					455405569 = {
						linkedHighLevelState = {
							()[131]
						}
					},
					455381033 = {
						linkedHighLevelState = {
							()[132]
						}
					},
					455376937 = {
						linkedHighLevelState = {
							()[133]
						}
					},
					455344169 = {
						linkedHighLevelState = {
							()[134]
						}
					},
					455381009 = {
						linkedHighLevelState = {
							()[135]
						}
					},
					455376913 = {
						linkedHighLevelState = {
							()[136]
						}
					},
					455344145 = {
						linkedHighLevelState = {
							()[137]
						}
					},
					455381034 = {
						linkedHighLevelState = {
							()[138]
						}
					},
					455376938 = {
						linkedHighLevelState = {
							()[139]
						}
					},
					455344170 = {
						linkedHighLevelState = {
							()[140]
						}
					},
					455405572 = {
						linkedHighLevelState = {
							()[141]
						}
					},
					455381037 = {
						linkedHighLevelState = {
							()[142]
						}
					},
					455376941 = {
						linkedHighLevelState = {
							()[143]
						}
					},
					455344173 = {
						linkedHighLevelState = {
							()[144]
						}
					},
					455405571 = {
						linkedHighLevelState = {
							()[145]
						}
					},
					455348224 = {
						linkedHighLevelState = {
							()[146]
						}
					},
					455348225 = {
						linkedHighLevelState = {
							()[147]
						}
					},
					455348226 = {
						linkedHighLevelState = {
							()[148]
						}
					},
					455348227 = {
						linkedHighLevelState = {
							()[149]
						}
					},
					455348228 = {
						linkedHighLevelState = {
							()[150]
						}
					},
					455348229 = {
						linkedHighLevelState = {
							()[151]
						}
					},
					455348230 = {
						linkedHighLevelState = {
							()[152]
						}
					}
				},
				commands = {
					getName = ()[3],
					identify = ()[4],
					refreshAbscenceTime = {
						converter = ()[132],
						extraDefinition = ()[162]
					},
					refreshAbscenceTimeMax = {
						converter = ()[133],
						extraDefinition = ()[162]
					},
					refreshAbscenceTimeMin = {
						converter = ()[134],
						extraDefinition = ()[162]
					},
					refreshBabyCareFunctionActivation = {
						converter = ()[135],
						extraDefinition = ()[162]
					},
					refreshBabyCareFunctionActivationMax = {
						converter = ()[136],
						extraDefinition = ()[162]
					},
					refreshBabyCareFunctionActivationMin = {
						converter = ()[137],
						extraDefinition = ()[162]
					},
					refreshComfortTemperature = {
						converter = ()[138],
						extraDefinition = ()[162]
					},
					refreshComfortTemperatureMax = {
						converter = ()[139],
						extraDefinition = ()[162]
					},
					refreshComfortTemperatureMin = {
						converter = ()[140],
						extraDefinition = ()[162]
					},
					refreshConsignRegul = {
						converter = ()[141],
						extraDefinition = ()[162]
					},
					refreshCountDetectPresence = {
						converter = ()[142],
						extraDefinition = ()[162]
					},
					refreshCurrentState = {
						converter = ()[143],
						extraDefinition = ()[162]
					},
					refreshCurrentStateMax = {
						converter = ()[144],
						extraDefinition = ()[162]
					},
					refreshCurrentStateMin = {
						converter = ()[145],
						extraDefinition = ()[162]
					},
					refreshCycleReport = {
						converter = ()[146],
						extraDefinition = ()[162]
					},
					refreshDurationEnergyCounter = {
						converter = ()[147],
						extraDefinition = ()[162]
					},
					refreshDurationEnergyCounterMax = {
						converter = ()[148],
						extraDefinition = ()[162]
					},
					refreshDurationEnergyCounterMin = {
						converter = ()[149],
						extraDefinition = ()[162]
					},
					refreshEcoTemperature = {
						converter = ()[150],
						extraDefinition = ()[162]
					},
					refreshEcoTemperatureMax = {
						converter = ()[151],
						extraDefinition = ()[162]
					},
					refreshEcoTemperatureMin = {
						converter = ()[152],
						extraDefinition = ()[162]
					},
					refreshElectricPower = {
						converter = ()[153],
						extraDefinition = ()[162]
					},
					refreshElectricPowerMax = {
						converter = ()[154],
						extraDefinition = ()[162]
					},
					refreshElectricPowerMin = {
						converter = ()[155],
						extraDefinition = ()[162]
					},
					refreshErrorThermostat = {
						converter = ()[156],
						extraDefinition = ()[162]
					},
					refreshFirmwareVersion = {
						converter = ()[157],
						extraDefinition = ()[162]
					},
					refreshFrostProtectionTemperature = {
						converter = ()[158],
						extraDefinition = ()[162]
					},
					refreshFrostProtectionTemperatureMax = {
						converter = ()[159],
						extraDefinition = ()[162]
					},
					refreshFrostProtectionTemperatureMin = {
						converter = ()[160],
						extraDefinition = ()[162]
					},
					refreshHoursEnergyCounter = {
						converter = ()[161],
						extraDefinition = ()[162]
					},
					refreshHoursEnergyCounterMax = {
						converter = ()[162],
						extraDefinition = ()[162]
					},
					refreshHoursEnergyCounterMin = {
						converter = ()[163],
						extraDefinition = ()[162]
					},
					refreshLockedUnlockedButton = {
						converter = ()[164],
						extraDefinition = ()[162]
					},
					refreshMiniboxHolidayMode = {
						converter = ()[165],
						extraDefinition = ()[162]
					},
					refreshMiniboxHolidayModeMax = {
						converter = ()[166],
						extraDefinition = ()[162]
					},
					refreshMiniboxHolidayModeMin = {
						converter = ()[167],
						extraDefinition = ()[162]
					},
					refreshMiniboxProgMode = {
						converter = ()[168],
						extraDefinition = ()[162]
					},
					refreshMiniboxProgModeMax = {
						converter = ()[169],
						extraDefinition = ()[162]
					},
					refreshMiniboxProgModeMin = {
						converter = ()[170],
						extraDefinition = ()[162]
					},
					refreshNbSecAfterLastDetect = {
						converter = ()[171],
						extraDefinition = ()[162]
					},
					refreshOpenWindowDetectionActivation = {
						converter = ()[172],
						extraDefinition = ()[162]
					},
					refreshOpenWindowDetectionActivationMax = {
						converter = ()[173],
						extraDefinition = ()[162]
					},
					refreshOpenWindowDetectionActivationMin = {
						converter = ()[174],
						extraDefinition = ()[162]
					},
					refreshProductType = {
						converter = ()[175],
						extraDefinition = ()[162]
					},
					refreshProductVersion = {
						converter = ()[176],
						extraDefinition = ()[162]
					},
					refreshRoomTemperature = {
						converter = ()[177],
						extraDefinition = ()[162]
					},
					refreshRoomTemperatureMax = {
						converter = ()[178],
						extraDefinition = ()[162]
					},
					refreshRoomTemperatureMin = {
						converter = ()[179],
						extraDefinition = ()[162]
					},
					refreshTechnicalOffset = {
						converter = ()[180],
						extraDefinition = ()[162]
					},
					refreshTechnicalOffsetMax = {
						converter = ()[181],
						extraDefinition = ()[162]
					},
					refreshTechnicalOffsetMin = {
						converter = ()[182],
						extraDefinition = ()[162]
					},
					refreshTemporaryTemperature = {
						converter = ()[183],
						extraDefinition = ()[162]
					},
					refreshTemporaryTemperatureMax = {
						converter = ()[184],
						extraDefinition = ()[162]
					},
					refreshTemporaryTemperatureMin = {
						converter = ()[185],
						extraDefinition = ()[162]
					},
					refreshThermostatRTC = {
						converter = ()[186],
						extraDefinition = ()[162]
					},
					refreshTimer2h = {
						converter = ()[187],
						extraDefinition = ()[162]
					},
					refreshTimer2hMax = {
						converter = ()[188],
						extraDefinition = ()[162]
					},
					refreshTimer2hMin = {
						converter = ()[189],
						extraDefinition = ()[162]
					},
					refreshUniqueSTChipId = {
						converter = ()[190],
						extraDefinition = ()[162]
					},
					setAbscenceTime = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[191],
						extraDefinition = ()[163]
					},
					setAutoProgW1J1 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[192],
						extraDefinition = ()[162]
					},
					setAutoProgW1J2 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[193],
						extraDefinition = ()[162]
					},
					setAutoProgW1J3 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[194],
						extraDefinition = ()[162]
					},
					setAutoProgW1J4 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[195],
						extraDefinition = ()[162]
					},
					setAutoProgW1J5 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[196],
						extraDefinition = ()[162]
					},
					setAutoProgW1J6 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[197],
						extraDefinition = ()[162]
					},
					setAutoProgW1J7 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[198],
						extraDefinition = ()[162]
					},
					setAutoProgW2J1 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[199],
						extraDefinition = ()[162]
					},
					setAutoProgW2J2 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[200],
						extraDefinition = ()[162]
					},
					setAutoProgW2J3 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[201],
						extraDefinition = ()[162]
					},
					setAutoProgW2J4 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[202],
						extraDefinition = ()[162]
					},
					setAutoProgW2J5 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[203],
						extraDefinition = ()[162]
					},
					setAutoProgW2J6 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[204],
						extraDefinition = ()[162]
					},
					setAutoProgW2J7 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[205],
						extraDefinition = ()[162]
					},
					setAutoProgW3J1 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[206],
						extraDefinition = ()[162]
					},
					setAutoProgW3J2 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[207],
						extraDefinition = ()[162]
					},
					setAutoProgW3J3 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[208],
						extraDefinition = ()[162]
					},
					setAutoProgW3J4 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[209],
						extraDefinition = ()[162]
					},
					setAutoProgW3J5 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[210],
						extraDefinition = ()[162]
					},
					setAutoProgW3J6 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[211],
						extraDefinition = ()[162]
					},
					setAutoProgW3J7 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[212],
						extraDefinition = ()[162]
					},
					setBabyCareFunctionActivation = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[213],
						extraDefinition = ()[163]
					},
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ()[6],
						converter = ()[214],
						extraDefinition = ()[163]
					},
					setConsignRegul = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[215],
						extraDefinition = ()[163]
					},
					setCountDetectPresence = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[216],
						extraDefinition = ()[163]
					},
					setCurrentState = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[217],
						extraDefinition = ()[163]
					},
					setCycleReport = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[218],
						extraDefinition = ()[163]
					},
					setDurationEnergyCounter = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[219],
						extraDefinition = ()[163]
					},
					setEcoTemperature = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[220],
						extraDefinition = ()[163]
					},
					setElectricPower = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[221],
						extraDefinition = ()[163]
					},
					setErrorThermostat = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[222],
						extraDefinition = ()[163]
					},
					setFrostProtectionTemperature = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[223],
						extraDefinition = ()[163]
					},
					setHoursEnergyCounter = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[224],
						extraDefinition = ()[163]
					},
					setLockedUnlockedButton = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[225],
						extraDefinition = ()[163]
					},
					setMiniboxHolidayMode = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[226],
						extraDefinition = ()[163]
					},
					setMiniboxProgMode = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[227],
						extraDefinition = ()[163]
					},
					setName = ()[8],
					setNbSecAfterLastDetect = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[228],
						extraDefinition = ()[163]
					},
					setOpenWindowDetectionActivation = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[229],
						extraDefinition = ()[163]
					},
					setRoomTemperature = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[230],
						extraDefinition = ()[163]
					},
					setTechnicalOffset = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[231],
						extraDefinition = ()[163]
					},
					setTemporaryTemperature = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[232],
						extraDefinition = ()[163]
					},
					setThermostatRTC = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[233],
						extraDefinition = ()[163]
					},
					setTimer2h = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[234],
						extraDefinition = ()[163]
					},
					setUserProgJ1 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[235],
						extraDefinition = ()[162]
					},
					setUserProgJ2 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[236],
						extraDefinition = ()[162]
					},
					setUserProgJ3 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[237],
						extraDefinition = ()[162]
					},
					setUserProgJ4 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[238],
						extraDefinition = ()[162]
					},
					setUserProgJ5 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[239],
						extraDefinition = ()[162]
					},
					setUserProgJ6 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[240],
						extraDefinition = ()[162]
					},
					setUserProgJ7 = {
						prototype = "any",
						parameters = ()[6],
						converter = ()[241],
						extraDefinition = ()[162]
					}
				}
			}
		}
	},
	4295098368 = {
		name = "Temperature Inside Sensor",
		localPairing = true,
		0 = {
			["ovp:InsideTemperatureSensorOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[28],
				states = {
					2415919105 = ()[164],
					2415919110 = ()[165],
					2147426304 = ()[48],
					2415919106 = {
						linkedHighLevelState = {
							()[155]
						}
					}
				},
				commands = {
					getName = ()[166],
					setName = ()[167]
				}
			}
		}
	},
	1099511628043 = {
		name = "KizOTherm Bridge v2",
		localPairing = true,
		1 = ()[168],
		2 = ()[169],
		3 = ()[170],
		4 = ()[171],
		5 = ()[172]
	},
	1099512610827 = {
		name = "Switch On/Off (IMHOTEP)",
		localPairing = true,
		0 = {
			["ovp:OnOffOVPComponent"] = {
				type = 1,
				widget = "StatefulOnOff",
				uiClass = "OnOff",
				uiProfiles = ()[36],
				states = {
					1 = ()[1],
					16830720 = {
						linkedHighLevelState = {
							()[173]
						}
					},
					2147426304 = ()[2]
				},
				commands = {
					getName = ()[3],
					identify = ()[4],
					setName = ()[8],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = ()[6],
						converter = ()[253],
						extraDefinition = ()[7]
					},
					off = {
						parameters = ()[37],
						converter = ()[253],
						extraDefinition = ()[7]
					},
					on = {
						parameters = ()[38],
						converter = ()[253],
						extraDefinition = ()[7]
					}
				}
			}
		}
	},
	1099513069579 = {
		name = "Generic HLink Gateway",
		localPairing = true,
		0 = {
			["ovp:HLinkMainController"] = {
				type = 1,
				widget = "HitachiAirToAirHeatPump",
				uiClass = "HitachiHeatingSystem",
				uiProfiles = ()[32],
				states = {
					["core:AutoManuModeState"] = {
						linkedHighLevelState = {
							()[174]
						}
					},
					["core:HolidaysModeState"] = {
						linkedHighLevelState = {
							()[175]
						}
					},
					1 = ()[1],
					2147426304 = ()[2],
					185401345 = {
						linkedHighLevelState = {
							()[176],
							()[179]
						},
						linkedStateIds = {
							"185401347"
						}
					},
					185401347 = {
						linkedHighLevelState = {
							()[176],
							()[182]
						},
						linkedStateIds = {
							"185401345"
						}
					},
					185401857 = {
						linkedHighLevelState = {
							()[177]
						}
					},
					185401344 = {
						linkedHighLevelState = {
							()[178]
						}
					},
					185401602 = {
						linkedHighLevelState = {
							()[180]
						}
					},
					185401600 = {
						linkedHighLevelState = {
							()[181]
						}
					},
					185402113 = {
						linkedHighLevelState = {
							()[183]
						}
					}
				},
				commands = {
					getName = ()[3],
					globalControl = {
						prototype = "string(On;Off)|string(off;on),integer,string(auto;hi;med;lo;silent),string(auto;heating;dehumidify;cooling;fan;circulator),*string(timer;manu;holidays)",
						parameters = {
							()[5],
							()[34],
							{
								isParameterRequired = true,
								name = "p3"
							},
							{
								isParameterRequired = true,
								name = "p4"
							},
							{
								isParameterRequired = false,
								name = "p5"
							}
						},
						converter = ()[265],
						extraDefinition = {
							access = "w",
							parameterId = "185466879"
						}
					},
					identify = ()[4],
					setMainOperation = {
						prototype = "string(On;Off)|string(off;on)",
						parameters = ()[6],
						converter = ()[266],
						extraDefinition = {
							access = "w",
							parameterId = "185401344"
						}
					},
					setName = ()[8]
				}
			}
		}
	},
	1099515035650 = {
		name = "Electrical heater (SOMFY Pilot Wire Module)",
		localPairing = true,
		0 = {
			["ovp:SomfyPilotWireElectricalHeaterOVPComponent"] = {
				type = 1,
				widget = "SomfyPilotWireElectricalHeater",
				uiClass = "HeatingSystem",
				uiProfiles = ()[39],
				states = {
					83935233 = ()[173],
					1 = ()[1],
					16830720 = ()[40],
					2147426304 = ()[2],
					65547 = ()[41],
					65548 = ()[42]
				},
				commands = {
					getName = ()[3],
					identify = ()[4],
					off = ()[43],
					refreshHeatingLevel = ()[17],
					refreshIdentifier = ()[174],
					setHeatingLevel = ()[44],
					setHeatingLevelForTrigger = ()[45],
					setName = ()[8],
					setTimerForTransitoryState = ()[46]
				}
			}
		}
	},
	1099528470795 = {
		name = "Generic Modbus Gateway V2",
		localPairing = true,
		0 = ()[161]
	},
	1103806726146 = {
		name = "Temperature Inside Sensor (SOMFY Pilot Wire Heating Interface)",
		localPairing = true,
		1 = {
			["ovp:SomfyPilotWireTemperatureSensorOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ()[28],
				states = {
					2415919105 = ()[164],
					2415919110 = ()[165],
					2147426304 = ()[48],
					2415919106 = {
						linkedHighLevelState = {
							()[185]
						}
					}
				},
				commands = {
					getName = ()[166],
					refreshTemperature = ()[175],
					setName = ()[167]
				}
			}
		},
		2 = {
			["ovp:SomfyPilotWireHeatingInterfaceOVPComponent"] = {
				type = 1,
				widget = "SomfyPilotWireHeatingInterface",
				uiClass = "HeatingSystem",
				uiProfiles = ()[35],
				states = {
					2415919110 = {
						linkedHighLevelState = {
							()[186]
						}
					},
					83935233 = ()[173],
					2415919105 = ()[164],
					33620224 = {
						linkedHighLevelState = {
							()[187],
							()[188],
							()[189]
						}
					},
					2147426304 = ()[48]
				},
				commands = {
					getName = ()[166],
					identify = ()[4],
					refreshActiveMode = ()[176],
					refreshBatteryLevel = ()[175],
					refreshIdentifier = ()[174],
					refreshOnOffState = ()[176],
					refreshSetPointMode = ()[176],
					setActiveMode = {
						prototype = "string(auto;manu)",
						parameters = ()[6],
						converter = ()[274],
						extraDefinition = ()[177]
					},
					setName = ()[167],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = ()[6],
						converter = ()[275],
						extraDefinition = ()[177]
					},
					setSetPointMode = {
						prototype = "string(comfort;eco;secured)",
						parameters = ()[6],
						converter = ()[276],
						extraDefinition = ()[177]
					}
				}
			}
		}
	},
	2199023255819 = {
		name = "KizOTherm Bridge v2-1",
		localPairing = true,
		1 = ()[168],
		2 = ()[169],
		3 = ()[170],
		4 = ()[171],
		5 = ()[172]
	}
}
