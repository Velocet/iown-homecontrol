var_0_0 = {
	function(arg_1_0)
		return math.floor(arg_1_0 / 512)
	end,
	function(arg_2_0)
		return depends("ovp-utils").fromRawName(arg_2_0)
	end,
	function(arg_3_0)
		return depends("ovp-utils").fromRawStatusState(arg_3_0)
	end,
	function()
		return depends("ovp-utils").createWinkValue(true, 3)
	end,
	function(arg_5_0)
		return arg_5_0 * 512
	end,
	function(arg_6_0)
		return depends("ovp-utils").toRawName(arg_6_0), nil, nil, {
			access = "r"
		}
	end,
	function(arg_7_0)
		var_7_0 = depends("BinaryUtils")
		var_7_1 = {
			arg_7_0
		}
		
		return var_7_0.extractBitRange(var_7_1, 1, 2)
	end,
	function(arg_8_0)
		if arg_8_0 == 1 then
			return "low"
		else
			return "normal"
		end
	end,
	function(arg_9_0, arg_9_1, arg_9_2)
		return depends("ovp-utils").fromRawTemperatureValue(arg_9_0, arg_9_1, arg_9_2)
	end,
	function(arg_10_0)
		if arg_10_0 == 55315 then
			return "off"
		else
			return "on"
		end
	end,
	function(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
		var_11_0 = depends("ovp-utils")
		var_11_1 = arg_11_0
		
		if arg_11_0 == 55306 then
			var_11_1 = arg_11_1
		elseif arg_11_0 == 55310 then
			var_11_1 = arg_11_2
		elseif arg_11_0 == 55311 then
			var_11_1 = arg_11_3
		elseif arg_11_0 == 55315 then
			var_11_1 = nil
		end
		
		if var_11_1 == nil then
			return nil
		else
			return var_11_0.fromRawTemperatureValue(var_11_1, arg_11_4, arg_11_5)
		end
	end,
	function()
		return p1:tostring("iso-8859-1")
	end,
	function(arg_13_0)
		return depends("ovp-utils").extractNumericFPPart(arg_13_0, 14, 2)
	end,
	function(arg_14_0)
		if arg_14_0 == 1 then
			return "auto"
		elseif arg_14_0 == 2 then
			return "manu"
		else
			return nil
		end
	end,
	function(arg_15_0)
		return depends("ovp-utils").extractNumericFPPart(arg_15_0, 12, 2)
	end,
	function(arg_16_0)
		if arg_16_0 == 1 then
			return "heating"
		elseif arg_16_0 == 2 then
			return "cooling"
		elseif arg_16_0 == 3 then
			return "heatingCooling"
		else
			return nil
		end
	end,
	function(arg_17_0)
		if arg_17_0 == 55311 then
			return "comfort"
		elseif arg_17_0 == 55310 then
			return "eco"
		elseif arg_17_0 == 55306 then
			return "secured"
		else
			return "free"
		end
	end,
	function(arg_18_0, arg_18_1)
		var_18_0 = depends("ovp-utils")
		
		if arg_18_0 == "auto" then
			return var_18_0.createActivateFunc(53504, {
				{
					9,
					1
				}
			})
		elseif arg_18_0 == "manu" then
			return var_18_0.createActivateFunc(arg_18_1, {
				{
					9,
					2
				}
			})
		else
			return nil
		end
	end,
	function(arg_19_0, arg_19_1, arg_19_2)
		return depends("ovp-utils").toRawTemperatureValue(arg_19_0, arg_19_1, arg_19_2)
	end,
	function(arg_20_0)
		var_20_0 = depends("ovp-utils")
		
		if arg_20_0 == "comfort" then
			return var_20_0.createActivateFunc(55311, {
				{
					9,
					2
				}
			})
		elseif arg_20_0 == "eco" then
			return var_20_0.createActivateFunc(55310, {
				{
					9,
					2
				}
			})
		elseif arg_20_0 == "secured" then
			return var_20_0.createActivateFunc(55306, {
				{
					9,
					2
				}
			})
		else
			return nil
		end
	end,
	function(arg_21_0, arg_21_1, arg_21_2)
		var_21_0 = depends("ovp-utils")
		
		if arg_21_0 == "on" then
			if bit.band(arg_21_1, 3) == 1 then
				return var_21_0.createActivateFunc(53504, {
					{
						9,
						1
					}
				})
			elseif arg_21_2 ~= 55315 then
				return var_21_0.createActivateFunc(arg_21_2, {
					{
						9,
						2
					}
				})
			else
				return var_21_0.createActivateFunc(55311, {
					{
						9,
						2
					}
				})
			end
		else
			return var_21_0.createActivateFunc(55315, {
				{
					9,
					2
				}
			})
		end
	end,
	function(arg_22_0)
		var_22_0 = depends("ovp-utils")
		
		if arg_22_0 == "heating" then
			return var_22_0.createActivateFunc(54272, {
				{
					9,
					4
				}
			})
		elseif arg_22_0 == "cooling" then
			return var_22_0.createActivateFunc(54272, {
				{
					9,
					8
				}
			})
		elseif arg_22_0 == "heatingCooling" then
			return var_22_0.createActivateFunc(54272, {
				{
					9,
					12
				}
			})
		else
			return var_22_0.createActivateFunc(54272, {
				{
					9,
					0
				}
			})
		end
	end,
	function(arg_23_0, arg_23_1, arg_23_2)
		var_23_0 = depends("ovp-utils")
		
		if arg_23_0 == nil then
			return nil
		else
			return var_23_0.fromRawTemperatureValue(arg_23_0, arg_23_1, arg_23_2)
		end
	end,
	function()
		return 0
	end,
	function(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
		var_25_0 = depends("ovp-utils")
		var_25_1 = ""
		
		if arg_25_0 == "auto" then
			var_25_1 = {
				{
					9,
					1
				}
			}
		elseif arg_25_0 == "manu" then
			var_25_1 = {
				{
					9,
					2
				}
			}
		else
			return var_25_0.createActivateFunc(54272, {
				{
					9,
					0
				}
			})
		end
		
		if arg_25_0 == "auto" and type(arg_25_1) == "number" then
			return var_25_0.createActivateFunc(54272, {
				{
					9,
					0
				}
			})
		end
		
		if type(arg_25_1) == "string" then
			if arg_25_1 == "comfort" then
				return var_25_0.createActivateFunc(55311, var_25_1)
			elseif arg_25_1 == "eco" then
				return var_25_0.createActivateFunc(55310, var_25_1)
			elseif arg_25_1 == "secured" then
				return var_25_0.createActivateFunc(55306, var_25_1)
			else
				return nil
			end
		elseif type(arg_25_1) == "number" then
			return var_25_0.createActivateFunc(var_25_0.toRawTemperatureValue(arg_25_1, arg_25_2, arg_25_3), var_25_1)
		else
			return nil
		end
	end,
	function(arg_26_0, arg_26_1)
		var_26_0 = depends("ovp-utils")
		
		if arg_26_0 == "auto" then
			return var_26_0.createActivateFunc(55311, {
				{
					9,
					1
				}
			})
		elseif arg_26_0 == "manu" then
			return var_26_0.createActivateFunc(arg_26_1, {
				{
					9,
					2
				}
			})
		else
			return var_26_0.createActivateFunc(54272, {
				{
					9,
					0
				}
			})
		end
	end,
	function(arg_27_0)
		var_27_0 = depends("ovp-utils")
		
		if arg_27_0 == nil then
			return nil
		end
		
		if type(arg_27_0) == "string" then
			if arg_27_0 == "comfort" then
				return var_27_0.createActivateFunc(55311, {
					{
						9,
						1
					}
				})
			elseif arg_27_0 == "eco" then
				return var_27_0.createActivateFunc(55310, {
					{
						9,
						1
					}
				})
			elseif arg_27_0 == "secured" then
				return var_27_0.createActivateFunc(55306, {
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
	function(arg_28_0, arg_28_1, arg_28_2)
		var_28_0 = depends("ovp-utils")
		
		if type(arg_28_0) == "string" then
			if arg_28_0 == "comfort" then
				return var_28_0.createActivateFunc(55311)
			elseif arg_28_0 == "eco" then
				return var_28_0.createActivateFunc(55310)
			elseif arg_28_0 == "secured" then
				return var_28_0.createActivateFunc(55306)
			end
		elseif type(arg_28_0) == "number" then
			return var_28_0.createActivateFunc(var_28_0.toRawTemperatureValue(arg_28_0, arg_28_1, arg_28_2), {
				{
					9,
					2
				}
			})
		end
		
		return nil
	end,
	function(arg_29_0)
		if arg_29_0 == 0 then
			return "down"
		else
			return "alive"
		end
	end,
	function(arg_30_0)
		return depends("ovp-utils").extractNumericFPPart(arg_30_0, 10, 2)
	end,
	function(arg_31_0)
		if arg_31_0 == 0 then
			return "off"
		else
			return "on"
		end
	end,
	function()
		return 1
	end,
	function(arg_33_0)
		if arg_33_0 > 0 then
			return "off"
		else
			return "on"
		end
	end,
	function(arg_34_0)
		if arg_34_0 == "on" then
			return 0
		else
			return 51200
		end
	end,
	function(arg_35_0)
		if arg_35_0 == 64512 then
			return "off"
		else
			return "on"
		end
	end,
	function(arg_36_0)
		if arg_36_0 == 64512 then
			return "off"
		elseif arg_36_0 == 64513 then
			return "frostprotection"
		elseif arg_36_0 == 64514 then
			return "eco"
		elseif arg_36_0 == 64515 then
			return "comfort-2"
		elseif arg_36_0 == 64516 then
			return "comfort-1"
		elseif arg_36_0 == 64517 then
			return "comfort"
		elseif arg_36_0 == 64519 then
			return "boost"
		elseif arg_36_0 == 64575 then
			return "secured"
		else
			return "unknown"
		end
	end,
	function(arg_37_0)
		if arg_37_0 == 64512 then
			return "off"
		elseif arg_37_0 == 64513 then
			return "frostprotection"
		elseif arg_37_0 == 64514 or arg_37_0 == 0 then
			return "eco"
		elseif arg_37_0 == 64515 then
			return "comfort-2"
		elseif arg_37_0 == 64516 then
			return "comfort-1"
		elseif arg_37_0 == 64517 or arg_37_0 == 51200 then
			return "comfort"
		elseif arg_37_0 == 64519 then
			return "boost"
		elseif arg_37_0 == 64575 then
			return "secured"
		else
			return "unknown"
		end
	end,
	function()
		return 64512
	end,
	function(arg_39_0)
		var_39_0 = depends("ovp-utils")
		var_39_1 = 64512
		
		if type(arg_39_0) == "string" then
			if arg_39_0 == "off" then
				var_39_1 = 64512
			elseif arg_39_0 == "frostprotection" then
				var_39_1 = 64513
			elseif arg_39_0 == "eco" then
				var_39_1 = 64514
			elseif arg_39_0 == "comfort-2" then
				var_39_1 = 64515
			elseif arg_39_0 == "comfort-1" then
				var_39_1 = 64516
			elseif arg_39_0 == "comfort" then
				var_39_1 = 64517
			elseif arg_39_0 == "boost" then
				var_39_1 = 64519
			elseif arg_39_0 == "secured" then
				var_39_1 = 64575
			end
		end
		
		return var_39_0.createActivateFunc(var_39_1, {
			{
				11,
				65535
			}
		})
	end,
	function(arg_40_0)
		var_40_0 = 64512
		
		if type(arg_40_0) == "string" then
			if arg_40_0 == "off" then
				var_40_0 = 64512
			elseif arg_40_0 == "frostprotection" then
				var_40_0 = 64513
			elseif arg_40_0 == "eco" then
				var_40_0 = 64514
			elseif arg_40_0 == "comfort-2" then
				var_40_0 = 64515
			elseif arg_40_0 == "comfort-1" then
				var_40_0 = 64516
			elseif arg_40_0 == "comfort" then
				var_40_0 = 64517
			elseif arg_40_0 == "boost" then
				var_40_0 = 64519
			elseif arg_40_0 == "secured" then
				var_40_0 = 64575
			end
		end
		
		return var_40_0
	end,
	function(arg_41_0)
		return depends("ovp-utils").createActivateFunc(64512, {
			{
				11,
				arg_41_0
			}
		})
	end,
	function(arg_42_0)
		return depends("ovp-utils").fromRawStatusState(arg_42_0)
	end,
	function(arg_43_0)
		return depends("modbus-utils").Type.Int.state(arg_43_0)
	end,
	function(arg_44_0)
		var_44_0 = ""
		
		if bit.band(arg_44_0[1], 128) == 128 then
			var_44_0 = ",default cascade"
		end
		
		if bit.band(arg_44_0[2], 32) == 32 then
			var_44_0 = var_44_0 .. ",maximum output power"
		end
		
		if bit.band(arg_44_0[2], 16) == 16 then
			var_44_0 = var_44_0 .. ",burner on"
		end
		
		if bit.band(arg_44_0[2], 8) == 8 then
			var_44_0 = var_44_0 .. ",secondary pump"
		end
		
		if bit.band(arg_44_0[2], 4) == 4 then
			var_44_0 = var_44_0 .. ",secondary stop"
		end
		
		if bit.band(arg_44_0[2], 2) == 2 then
			var_44_0 = var_44_0 .. ",direct stop"
		end
		
		if bit.band(arg_44_0[2], 1) == 1 then
			var_44_0 = var_44_0 .. ",burner stop"
		end
		
		return string.sub(var_44_0, 2)
	end,
	function()
		return depends("modbus-utils").Command.refresh(465)
	end,
	function()
		return depends("modbus-utils").Command.refresh(735)
	end,
	function()
		return depends("modbus-utils").Command.refresh(500)
	end,
	function(arg_48_0)
		return depends("modbus-utils").Type.Float.state(arg_48_0)
	end,
	function(arg_49_0)
		if arg_49_0 == 0 then
			return "p1"
		elseif arg_49_0 == 1 then
			return "p2"
		elseif arg_49_0 == 2 then
			return "p3"
		else
			return "p4"
		end
	end,
	function(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4, arg_50_5, arg_50_6, arg_50_7, arg_50_8, arg_50_9, arg_50_10, arg_50_11, arg_50_12, arg_50_13, arg_50_14, arg_50_15, arg_50_16, arg_50_17, arg_50_18, arg_50_19, arg_50_20)
		return depends("modbus-utils").Type.TimeProgram.state(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4, arg_50_5, arg_50_6, arg_50_7, arg_50_8, arg_50_9, arg_50_10, arg_50_11, arg_50_12, arg_50_13, arg_50_14, arg_50_15, arg_50_16, arg_50_17, arg_50_18, arg_50_19, arg_50_20)
	end,
	function(arg_51_0)
		if bit.band(arg_51_0[2], 1) == 1 then
			return "holidays"
		elseif bit.band(arg_51_0[2], 2) == 2 then
			return "eco"
		elseif bit.band(arg_51_0[2], 4) == 4 then
			return "comfort"
		elseif bit.band(arg_51_0[2], 8) == 8 then
			return "auto"
		else
			return overkiz.magic.IGNORE
		end
	end,
	function()
		return depends("modbus-utils").Command.refresh(231)
	end,
	function()
		return depends("modbus-utils").Command.refresh(296)
	end,
	function()
		return depends("modbus-utils").Command.refresh(650)
	end,
	function()
		return depends("modbus-utils").Command.refresh(653)
	end,
	function()
		return depends("modbus-utils").Command.refresh(637)
	end,
	function()
		return depends("modbus-utils").Command.refresh(651)
	end,
	function()
		return depends("modbus-utils").Command.refresh(652)
	end,
	function()
		return depends("modbus-utils").Command.refresh(126, 21)
	end,
	function(arg_60_0)
		var_60_0 = depends("modbus-utils")
		var_60_1 = 0
		
		if arg_60_0 == "p1" then
			var_60_1 = 0
		elseif arg_60_0 == "p2" then
			var_60_1 = 1
		elseif arg_60_0 == "p3" then
			var_60_1 = 2
		elseif arg_60_0 == "p4" then
			var_60_1 = 3
		end
		
		return var_60_0.Command.write("Int", 231, var_60_1)
	end,
	function(arg_61_0)
		return depends("modbus-utils").Command.write("Float", 650, arg_61_0)
	end,
	function(arg_62_0)
		return depends("modbus-utils").Command.write("Int", 653, arg_62_0)
	end,
	function(arg_63_0)
		return depends("modbus-utils").Command.write("Float", 651, arg_63_0)
	end,
	function(arg_64_0)
		return depends("modbus-utils").Command.write("Float", 652, arg_64_0)
	end,
	function(arg_65_0)
		return depends("modbus-utils").Type.TimeProgram.cmd(arg_65_0, 126)
	end,
	function()
		return depends("modbus-utils").Command.refresh(232)
	end,
	function()
		return depends("modbus-utils").Command.refresh(297)
	end,
	function()
		return depends("modbus-utils").Command.refresh(656)
	end,
	function()
		return depends("modbus-utils").Command.refresh(659)
	end,
	function()
		return depends("modbus-utils").Command.refresh(638)
	end,
	function()
		return depends("modbus-utils").Command.refresh(657)
	end,
	function()
		return depends("modbus-utils").Command.refresh(658)
	end,
	function()
		return depends("modbus-utils").Command.refresh(147, 21)
	end,
	function(arg_74_0)
		var_74_0 = depends("modbus-utils")
		var_74_1 = 0
		
		if arg_74_0 == "p1" then
			var_74_1 = 0
		elseif arg_74_0 == "p2" then
			var_74_1 = 1
		elseif arg_74_0 == "p3" then
			var_74_1 = 2
		elseif arg_74_0 == "p4" then
			var_74_1 = 3
		end
		
		return var_74_0.Command.write("Int", 232, var_74_1)
	end,
	function(arg_75_0)
		return depends("modbus-utils").Command.write("Float", 656, arg_75_0)
	end,
	function(arg_76_0)
		return depends("modbus-utils").Command.write("Int", 659, arg_76_0)
	end,
	function(arg_77_0)
		return depends("modbus-utils").Command.write("Float", 657, arg_77_0)
	end,
	function(arg_78_0)
		return depends("modbus-utils").Command.write("Float", 658, arg_78_0)
	end,
	function(arg_79_0)
		return depends("modbus-utils").Type.TimeProgram.cmd(arg_79_0, 147)
	end,
	function()
		return depends("modbus-utils").Command.refresh(233)
	end,
	function()
		return depends("modbus-utils").Command.refresh(360)
	end,
	function()
		return depends("modbus-utils").Command.refresh(664)
	end,
	function()
		return depends("modbus-utils").Command.refresh(667)
	end,
	function()
		return depends("modbus-utils").Command.refresh(639)
	end,
	function()
		return depends("modbus-utils").Command.refresh(665)
	end,
	function()
		return depends("modbus-utils").Command.refresh(666)
	end,
	function()
		return depends("modbus-utils").Command.refresh(168, 21)
	end,
	function(arg_88_0)
		var_88_0 = depends("modbus-utils")
		var_88_1 = 0
		
		if arg_88_0 == "p1" then
			var_88_1 = 0
		elseif arg_88_0 == "p2" then
			var_88_1 = 1
		elseif arg_88_0 == "p3" then
			var_88_1 = 2
		elseif arg_88_0 == "p4" then
			var_88_1 = 3
		end
		
		return var_88_0.Command.write("Int", 233, var_88_1)
	end,
	function(arg_89_0)
		return depends("modbus-utils").Command.write("Float", 664, arg_89_0)
	end,
	function(arg_90_0)
		return depends("modbus-utils").Command.write("Int", 667, arg_90_0)
	end,
	function(arg_91_0)
		return depends("modbus-utils").Command.write("Float", 665, arg_91_0)
	end,
	function(arg_92_0)
		return depends("modbus-utils").Command.write("Float", 666, arg_92_0)
	end,
	function(arg_93_0)
		return depends("modbus-utils").Type.TimeProgram.cmd(arg_93_0, 168)
	end,
	function(arg_94_0, arg_94_1, arg_94_2)
		if bit.band(bit.rshift(arg_94_0[2], 4), 1) == 1 and bit.band(bit.rshift(arg_94_1[2], 4), 1) == 1 and bit.band(bit.rshift(arg_94_2[2], 4), 1) == 1 then
			return "comfort"
		elseif bit.band(bit.rshift(arg_94_0[2], 4), 1) == 0 and bit.band(bit.rshift(arg_94_1[2], 4), 1) == 0 and bit.band(bit.rshift(arg_94_2[2], 4), 1) == 0 then
			return "auto"
		end
	end,
	function()
		return depends("modbus-utils").Command.refresh(603)
	end,
	function()
		return depends("modbus-utils").Command.refresh(672)
	end,
	function()
		var_97_0 = depends("modbus-utils")
		
		return var_97_0.Command.refresh(653), nil, var_97_0.Command.refresh(659), nil, var_97_0.Command.refresh(667), nil
	end,
	function()
		return depends("modbus-utils").Command.refresh(640)
	end,
	function()
		return depends("modbus-utils").Command.refresh(673)
	end,
	function()
		return depends("modbus-utils").Command.refresh(189, 21)
	end,
	function(arg_101_0)
		return depends("modbus-utils").Command.write("Float", 672, arg_101_0)
	end,
	function(arg_102_0, arg_102_1, arg_102_2, arg_102_3)
		var_102_0 = depends("modbus-utils")
		
		return var_102_0.Command.write("Int", 653, var_102_0.Command.applyDerogationDDModbusGateway(arg_102_0, arg_102_1)), nil, var_102_0.Command.write("Int", 659, var_102_0.Command.applyDerogationDDModbusGateway(arg_102_0, arg_102_2)), nil, var_102_0.Command.write("Int", 667, var_102_0.Command.applyDerogationDDModbusGateway(arg_102_0, arg_102_3)), nil
	end,
	function(arg_103_0)
		return depends("modbus-utils").Command.write("Float", 673, arg_103_0)
	end,
	function(arg_104_0)
		return depends("modbus-utils").Type.TimeProgram.cmd(arg_104_0, 189)
	end,
	function()
		return depends("modbus-utils").Command.refresh(744)
	end,
	function()
		return depends("modbus-utils").Command.refresh(641)
	end,
	function()
		return depends("modbus-utils").Command.refresh(210, 21)
	end,
	function(arg_108_0)
		return depends("modbus-utils").Type.TimeProgram.cmd(arg_108_0, 210)
	end,
	function()
		return depends("modbus-utils").Command.write("Int", 659, 8)
	end,
	function()
		return depends("modbus-utils").Command.refresh(686)
	end,
	function()
		return depends("modbus-utils").Command.refresh(605)
	end,
	function(arg_112_0)
		return depends("modbus-utils").Command.write("Float", 686, arg_112_0)
	end,
	function()
		return depends("modbus-utils").Command.write("Int", 667, 8)
	end,
	function()
		return depends("modbus-utils").Command.refresh(687)
	end,
	function()
		return depends("modbus-utils").Command.refresh(606)
	end,
	function(arg_116_0)
		return depends("modbus-utils").Command.write("Float", 687, arg_116_0)
	end,
	function()
		return depends("modbus-utils").Command.refresh(817)
	end,
	function(arg_118_0)
		return arg_118_0:readInt16(1) / 10
	end,
	function(arg_119_0)
		return depends("ovp-utils").getLockedUnlockedButton(arg_119_0:readUInt8(1))
	end,
	function(arg_120_0)
		return depends("ovp-utils").getActiveInactiveStateCotherm(arg_120_0:readInt16(1))
	end,
	function(arg_121_0)
		return arg_121_0:readInt16(1)
	end,
	function(arg_122_0)
		return depends("ovp-utils").getUserProgTimeThermostatCotherm(arg_122_0)
	end,
	function(arg_123_0)
		return arg_123_0:readUInt8(1)
	end,
	function(arg_124_0)
		return depends("ovp-utils").cothermCurrentStates[arg_124_0:readInt16(1)]
	end,
	function(arg_125_0)
		return arg_125_0:readUInt16(1) / 1000
	end,
	function(arg_126_0)
		return depends("ovp-utils").getErrorsThermostatCotherm(arg_126_0)
	end,
	function(arg_127_0)
		return arg_127_0:tostring("iso-8859-1")
	end,
	function(arg_128_0)
		return depends("ovp-utils").cothermThermostatMode[arg_128_0:readInt16(1)]
	end,
	function(arg_129_0)
		return arg_129_0:readUInt32(1)
	end,
	function(arg_130_0)
		return arg_130_0:readUInt16(1)
	end,
	function(arg_131_0)
		return depends("ovp-utils").getRTCThermostatCotherm(arg_131_0)
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			26
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			26
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			26
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			35
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			35
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			35
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			14
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			14
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			14
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			208,
			9
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			208,
			2
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			13
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			13
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			13
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			208,
			10
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			25
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			25
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			25
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			15
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			15
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			15
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			23
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			23
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			23
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			208,
			6
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			240,
			2
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			16
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			16
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			16
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			24
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			24
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			24
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			208,
			0
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			44
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			44
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			44
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			43
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			43
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			43
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			208,
			1
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			29
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			29
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			29
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			240,
			0
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			240,
			1
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			41
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			41
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			41
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			17
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			17
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			17
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			42
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			42
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			42
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			240,
			4
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			0,
			45
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			144,
			45
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			128,
			45
		})
	end,
	function()
		return bytearray({
			2,
			0,
			2,
			240,
			3
		})
	end,
	function(arg_191_0)
		return depends("ovp-utils").writeCMDCotherm(26, arg_191_0, 16)
	end,
	function(arg_192_0)
		var_192_0 = depends("ovp-utils")
		
		return var_192_0.writeCmdUserProg(5888, var_192_0.setUserProgTimeThermostatCotherm(arg_192_0))
	end,
	function(arg_193_0)
		var_193_0 = depends("ovp-utils")
		
		return var_193_0.writeCmdUserProg(5889, var_193_0.setUserProgTimeThermostatCotherm(arg_193_0))
	end,
	function(arg_194_0)
		var_194_0 = depends("ovp-utils")
		
		return var_194_0.writeCmdUserProg(5890, var_194_0.setUserProgTimeThermostatCotherm(arg_194_0))
	end,
	function(arg_195_0)
		var_195_0 = depends("ovp-utils")
		
		return var_195_0.writeCmdUserProg(5891, var_195_0.setUserProgTimeThermostatCotherm(arg_195_0))
	end,
	function(arg_196_0)
		var_196_0 = depends("ovp-utils")
		
		return var_196_0.writeCmdUserProg(5892, var_196_0.setUserProgTimeThermostatCotherm(arg_196_0))
	end,
	function(arg_197_0)
		var_197_0 = depends("ovp-utils")
		
		return var_197_0.writeCmdUserProg(5893, var_197_0.setUserProgTimeThermostatCotherm(arg_197_0))
	end,
	function(arg_198_0)
		var_198_0 = depends("ovp-utils")
		
		return var_198_0.writeCmdUserProg(5894, var_198_0.setUserProgTimeThermostatCotherm(arg_198_0))
	end,
	function(arg_199_0)
		var_199_0 = depends("ovp-utils")
		
		return var_199_0.writeCmdUserProg(6144, var_199_0.setUserProgTimeThermostatCotherm(arg_199_0))
	end,
	function(arg_200_0)
		var_200_0 = depends("ovp-utils")
		
		return var_200_0.writeCmdUserProg(6145, var_200_0.setUserProgTimeThermostatCotherm(arg_200_0))
	end,
	function(arg_201_0)
		var_201_0 = depends("ovp-utils")
		
		return var_201_0.writeCmdUserProg(6146, var_201_0.setUserProgTimeThermostatCotherm(arg_201_0))
	end,
	function(arg_202_0)
		var_202_0 = depends("ovp-utils")
		
		return var_202_0.writeCmdUserProg(6147, var_202_0.setUserProgTimeThermostatCotherm(arg_202_0))
	end,
	function(arg_203_0)
		var_203_0 = depends("ovp-utils")
		
		return var_203_0.writeCmdUserProg(6148, var_203_0.setUserProgTimeThermostatCotherm(arg_203_0))
	end,
	function(arg_204_0)
		var_204_0 = depends("ovp-utils")
		
		return var_204_0.writeCmdUserProg(6149, var_204_0.setUserProgTimeThermostatCotherm(arg_204_0))
	end,
	function(arg_205_0)
		var_205_0 = depends("ovp-utils")
		
		return var_205_0.writeCmdUserProg(6150, var_205_0.setUserProgTimeThermostatCotherm(arg_205_0))
	end,
	function(arg_206_0)
		var_206_0 = depends("ovp-utils")
		
		return var_206_0.writeCmdUserProg(6400, var_206_0.setUserProgTimeThermostatCotherm(arg_206_0))
	end,
	function(arg_207_0)
		var_207_0 = depends("ovp-utils")
		
		return var_207_0.writeCmdUserProg(6401, var_207_0.setUserProgTimeThermostatCotherm(arg_207_0))
	end,
	function(arg_208_0)
		var_208_0 = depends("ovp-utils")
		
		return var_208_0.writeCmdUserProg(6402, var_208_0.setUserProgTimeThermostatCotherm(arg_208_0))
	end,
	function(arg_209_0)
		var_209_0 = depends("ovp-utils")
		
		return var_209_0.writeCmdUserProg(6403, var_209_0.setUserProgTimeThermostatCotherm(arg_209_0))
	end,
	function(arg_210_0)
		var_210_0 = depends("ovp-utils")
		
		return var_210_0.writeCmdUserProg(6404, var_210_0.setUserProgTimeThermostatCotherm(arg_210_0))
	end,
	function(arg_211_0)
		var_211_0 = depends("ovp-utils")
		
		return var_211_0.writeCmdUserProg(6405, var_211_0.setUserProgTimeThermostatCotherm(arg_211_0))
	end,
	function(arg_212_0)
		var_212_0 = depends("ovp-utils")
		
		return var_212_0.writeCmdUserProg(6406, var_212_0.setUserProgTimeThermostatCotherm(arg_212_0))
	end,
	function(arg_213_0)
		var_213_0 = depends("ovp-utils")
		
		return var_213_0.writeCMDCotherm(35, var_213_0.setActiveInactiveStateCotherm(arg_213_0), 16)
	end,
	function(arg_214_0)
		return depends("ovp-utils").writeCMDCotherm(14, arg_214_0 * 10, 16)
	end,
	function(arg_215_0)
		return depends("ovp-utils").writeCMDCotherm(53257, arg_215_0 * 10, 16)
	end,
	function(arg_216_0)
		return depends("ovp-utils").writeCMDCotherm(53250, arg_216_0, 8)
	end,
	function(arg_217_0)
		var_217_0 = depends("ovp-utils")
		
		return var_217_0.writeCMDCotherm(13, var_217_0.getCurrentStateIdThermostatCotherm(arg_217_0), 16)
	end,
	function(arg_218_0)
		return depends("ovp-utils").writeCMDCotherm(53258, arg_218_0 * 1000, 16)
	end,
	function(arg_219_0)
		return depends("ovp-utils").writeCMDCotherm(25, arg_219_0, 16)
	end,
	function(arg_220_0)
		return depends("ovp-utils").writeCMDCotherm(15, arg_220_0 * 10, 16)
	end,
	function(arg_221_0)
		return depends("ovp-utils").writeCMDCotherm(23, arg_221_0, 16)
	end,
	function(arg_222_0)
		var_222_0 = depends("ovp-utils")
		
		return var_222_0.writeCMDCotherm(53254, var_222_0.setErrorsThermostatCotherm(arg_222_0), 8)
	end,
	function(arg_223_0)
		return depends("ovp-utils").writeCMDCotherm(16, arg_223_0 * 10, 16)
	end,
	function(arg_224_0)
		return depends("ovp-utils").writeCMDCotherm(24, arg_224_0, 16)
	end,
	function(arg_225_0)
		var_225_0 = depends("ovp-utils")
		
		return var_225_0.writeCMDCotherm(53248, var_225_0.setLockedUnlockedButton(arg_225_0), 8)
	end,
	function(arg_226_0)
		var_226_0 = depends("ovp-utils")
		
		return var_226_0.writeCMDCotherm(44, var_226_0.setCothermThermostatMode(arg_226_0), 16)
	end,
	function(arg_227_0)
		var_227_0 = depends("ovp-utils")
		
		return var_227_0.writeCMDCotherm(43, var_227_0.setCothermThermostatMode(arg_227_0), 16)
	end,
	function(arg_228_0)
		return depends("ovp-utils").writeCMDCotherm(53249, arg_228_0, 32)
	end,
	function(arg_229_0)
		var_229_0 = depends("ovp-utils")
		
		return var_229_0.writeCMDCotherm(29, var_229_0.setActiveInactiveStateCotherm(arg_229_0), 16)
	end,
	function(arg_230_0)
		return depends("ovp-utils").writeCMDCotherm(41, arg_230_0 * 10, 16)
	end,
	function(arg_231_0)
		return depends("ovp-utils").writeCMDCotherm(17, arg_231_0, 16)
	end,
	function(arg_232_0)
		return depends("ovp-utils").writeCMDCotherm(42, arg_232_0 * 10, 16)
	end,
	function(arg_233_0)
		return depends("ovp-utils").writeCMDCotherm(61444, arg_233_0, 32)
	end,
	function(arg_234_0)
		return depends("ovp-utils").writeCMDCotherm(45, arg_234_0, 16)
	end,
	function(arg_235_0)
		var_235_0 = depends("ovp-utils")
		
		return var_235_0.writeCmdUserProg(4096, var_235_0.setUserProgTimeThermostatCotherm(arg_235_0))
	end,
	function(arg_236_0)
		var_236_0 = depends("ovp-utils")
		
		return var_236_0.writeCmdUserProg(4097, var_236_0.setUserProgTimeThermostatCotherm(arg_236_0))
	end,
	function(arg_237_0)
		var_237_0 = depends("ovp-utils")
		
		return var_237_0.writeCmdUserProg(4098, var_237_0.setUserProgTimeThermostatCotherm(arg_237_0))
	end,
	function(arg_238_0)
		var_238_0 = depends("ovp-utils")
		
		return var_238_0.writeCmdUserProg(4099, var_238_0.setUserProgTimeThermostatCotherm(arg_238_0))
	end,
	function(arg_239_0)
		var_239_0 = depends("ovp-utils")
		
		return var_239_0.writeCmdUserProg(4100, var_239_0.setUserProgTimeThermostatCotherm(arg_239_0))
	end,
	function(arg_240_0)
		var_240_0 = depends("ovp-utils")
		
		return var_240_0.writeCmdUserProg(4101, var_240_0.setUserProgTimeThermostatCotherm(arg_240_0))
	end,
	function(arg_241_0)
		var_241_0 = depends("ovp-utils")
		
		return var_241_0.writeCmdUserProg(4102, var_241_0.setUserProgTimeThermostatCotherm(arg_241_0))
	end,
	function(arg_242_0)
		return depends("ovp-utils").fromRawName(arg_242_0)
	end,
	function(arg_243_0)
		return depends("ovp-utils").getSensorDefect(arg_243_0)
	end,
	function()
		if p1 then
			return "on"
		else
			return "off"
		end
	end,
	function()
		if p1 then
			return "fault"
		else
			return "noFault"
		end
	end,
	function()
		if p1 then
			return "active"
		else
			return "inactive"
		end
	end,
	function(arg_247_0)
		if arg_247_0 == nil or #arg_247_0 ~= 2 then
			return nil
		end
		
		var_247_0 = "CH1"
		
		if bit.band(arg_247_0[1], 32) > 0 then
			var_247_0 = var_247_0 .. ",CH2"
		end
		
		if bit.band(arg_247_0[1], 8) > 0 then
			var_247_0 = var_247_0 .. ",DHW"
		end
		
		return var_247_0
	end,
	function(arg_248_0)
		if arg_248_0 == nil or #arg_248_0 ~= 2 then
			return nil
		end
		
		return bit.band(arg_248_0[2], 15) .. "," .. bit.rshift(bit.band(arg_248_0[2], 240), 4) .. "," .. bit.band(arg_248_0[1], 15)
	end,
	function()
		if p1 then
			return "Pressure Fault"
		else
			return "No Water Pressure Fault"
		end
	end,
	function(arg_250_0)
		var_250_0 = depends("common", "utils").split(arg_250_0, "[0-9]")
		
		if #var_250_0 ~= 3 then
			return nil
		end
		
		var_250_1 = bytearray(2)
		var_250_1[1] = var_250_0[3]
		var_250_1[2] = var_250_0[1] + bit.lshift(var_250_0[2], 4)
		
		return var_250_1
	end,
	function(arg_251_0)
		var_251_0 = bytearray(2)
		var_251_0[1] = math.floor(arg_251_0)
		var_251_0[2] = (arg_251_0 - var_251_0[1]) * 256
		
		return var_251_0
	end,
	function(arg_252_0)
		if arg_252_0 == 0 then
			return "off"
		else
			return "on"
		end
	end,
	function(arg_253_0)
		if arg_253_0 == "on" then
			return 51200
		else
			return 0
		end
	end,
	function(arg_254_0)
		return depends("ovp-utils").fromRawModeChange(arg_254_0:readUInt16(1))
	end,
	function(arg_255_0)
		return depends("ovp-utils").toTemperatureChange(arg_255_0:readUInt8(2))
	end,
	function(arg_256_0, arg_256_1)
		return depends("ovp-utils").toTargetTemperature(arg_256_0, arg_256_1)
	end,
	function(arg_257_0)
		return string.format("%02X%02X", arg_257_0[1], arg_257_0[2])
	end,
	function()
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
	function()
		if p1 == 0 then
			return "Ok"
		elseif p1 == 1 then
			return "Alert"
		else
			return nil
		end
	end,
	function()
		if p1 == 0 then
			return "Normal"
		elseif p1 == 1 then
			return "Reset"
		else
			return nil
		end
	end,
	function(arg_261_0)
		return depends("ovp-utils").fromRawOperationState(arg_261_0:readUInt16(1))
	end,
	function(arg_262_0)
		return depends("ovp-utils").toRawTemperature(arg_262_0:readInt16(1))
	end,
	function()
		if p1 == 0 then
			return "Enable"
		elseif p1 == 1 then
			return "Disable"
		else
			return nil
		end
	end,
	function(arg_264_0)
		return depends("ovp-utils").toRawThermoStatus(arg_264_0:readUInt16(1))
	end,
	function(arg_265_0, arg_265_1, arg_265_2, arg_265_3, arg_265_4)
		return depends("ovp-utils").toRawGlobalControl(arg_265_0, arg_265_1, arg_265_2, arg_265_3)
	end,
	function(arg_266_0)
		return depends("ovp-utils").toRawMainOperation(arg_266_0)
	end,
	function(arg_267_0)
		if #arg_267_0 >= 4 then
			return string.format("%02x", arg_267_0[1]) .. string.format("%02x", arg_267_0[2]) .. string.format("%02x", arg_267_0[3]) .. string.format("%02x", arg_267_0[4])
		end
	end,
	function()
		return bytearray({
			0,
			192,
			1
		})
	end,
	function(arg_269_0)
		return depends("common", "utils").convertKelvinToCelsius(arg_269_0)
	end,
	function(arg_270_0)
		if bit.band(arg_270_0, 2) ~= 0 then
			return "low"
		else
			return "normal"
		end
	end,
	function(arg_271_0)
		if arg_271_0 == 4 then
			return "off"
		else
			return "on"
		end
	end,
	function(arg_272_0)
		if arg_272_0 == 0 then
			return "auto"
		else
			return "manu"
		end
	end,
	function(arg_273_0)
		if arg_273_0 == 1 then
			return "comfort"
		elseif arg_273_0 == 2 then
			return "eco"
		elseif arg_273_0 == 3 then
			return "secured"
		else
			return nil
		end
	end,
	function(arg_274_0)
		if arg_274_0 == "auto" then
			return 0
		elseif arg_274_0 == "manu" then
			return 2
		else
			return nil
		end
	end,
	function(arg_275_0)
		if arg_275_0 == "off" then
			return 4
		elseif arg_275_0 == "on" then
			return 2
		else
			return nil
		end
	end,
	function(arg_276_0)
		if arg_276_0 == "comfort" then
			return 1
		elseif arg_276_0 == "eco" then
			return 2
		elseif arg_276_0 == "secured" then
			return 3
		else
			return nil
		end
	end
}
var_0_1 = {}
var_0_2 = {}
var_0_3 = {
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
}
var_0_4 = {
	[0] = {
		stateName = "core:LevelState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		converter = var_0_0[1]
	},
	{
		stateName = "core:NameState",
		parameters = {
			{
				rawStateId = "1",
				name = "p1"
			}
		},
		converter = var_0_0[2]
	},
	{
		stateName = "core:StatusState",
		parameters = {
			{
				rawStateId = "2147426304",
				name = "p1"
			}
		},
		converter = var_0_0[3]
	},
	{
		stateName = "core:BatteryState",
		parameters = {
			{
				name = "p1",
				rawStateId = "65556",
				converter = var_0_0[7]
			}
		},
		converter = var_0_0[8]
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
		converter = var_0_0[9]
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
		converter = var_0_0[9]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[10]
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
		converter = var_0_0[9]
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
		converter = var_0_0[11]
	},
	{
		stateName = "ovp:HeatingTemperatureInterfaceActiveModeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "65546",
				converter = var_0_0[13]
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[14]
	},
	{
		stateName = "ovp:HeatingTemperatureInterfaceOperatingModeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "65546",
				converter = var_0_0[15]
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[16]
	},
	{
		stateName = "ovp:HeatingTemperatureInterfaceSetPointModeState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[17]
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
		converter = var_0_0[23]
	},
	{
		stateName = "core:BatteryState",
		parameters = {
			{
				rawStateId = "234946564",
				name = "p1"
			}
		},
		converter = var_0_0[8]
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
		converter = var_0_0[29]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				name = "p1",
				rawStateId = "65546",
				converter = var_0_0[30]
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[31]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		converter = var_0_0[33]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[35]
	},
	{
		stateName = "ovp:MaximumHeatingLevelState",
		parameters = {
			{
				rawStateId = "65547",
				name = "p1"
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[36]
	},
	{
		stateName = "ovp:TargetHeatingLevelState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[37]
	},
	{
		stateName = "core:TargetHeatingLevelState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[37]
	},
	{
		stateName = "ovp:TimerForTransitoryStateState",
		parameters = {
			{
				rawStateId = "65548",
				name = "p1"
			}
		},
		refresh = var_0_3[1]
	},
	{
		stateName = "core:StatusState",
		parameters = {
			{
				rawStateId = "2147426304",
				name = "p1"
			}
		},
		converter = var_0_0[42]
	},
	{
		stateName = "core:AlarmState",
		parameters = {
			{
				rawStateId = "187695569",
				name = "p1"
			}
		},
		converter = var_0_0[43]
	},
	{
		stateName = "core:OperatingStateState",
		parameters = {
			{
				rawStateId = "187695839",
				name = "p1"
			}
		},
		converter = var_0_0[44]
	},
	{
		stateName = "modbus:RedAlarmState",
		parameters = {
			{
				rawStateId = "187695604",
				name = "p1"
			}
		},
		converter = var_0_0[43]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "187695705",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:ActiveTimeProgramState",
		parameters = {
			{
				name = "p1",
				rawStateId = "187695335",
				converter = var_0_0[43]
			}
		},
		converter = var_0_0[49]
	},
	{
		stateName = "core:ComfortRoomTemperatureState",
		parameters = {
			{
				rawStateId = "187695754",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:OperatingModeState",
		parameters = {
			{
				rawStateId = "187695741",
				name = "p1"
			}
		},
		converter = var_0_0[43]
	},
	{
		stateName = "core:ReducedTemperatureState",
		parameters = {
			{
				rawStateId = "187695755",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:SecuredPositionTemperatureState",
		parameters = {
			{
				rawStateId = "187695756",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "187695718",
				name = "p1"
			}
		},
		converter = var_0_0[48]
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
		converter = var_0_0[50]
	},
	{
		stateName = "ovp:HeatingDerogationModeState",
		parameters = {
			{
				rawStateId = "187695757",
				name = "p1"
			}
		},
		converter = var_0_0[51]
	},
	{
		stateName = "core:ActiveTimeProgramState",
		parameters = {
			{
				name = "p1",
				rawStateId = "187695336",
				converter = var_0_0[43]
			}
		},
		converter = var_0_0[49]
	},
	{
		stateName = "core:ComfortRoomTemperatureState",
		parameters = {
			{
				rawStateId = "187695760",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:OperatingModeState",
		parameters = {
			{
				rawStateId = "187695742",
				name = "p1"
			}
		},
		converter = var_0_0[43]
	},
	{
		stateName = "core:ReducedTemperatureState",
		parameters = {
			{
				rawStateId = "187695761",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:SecuredPositionTemperatureState",
		parameters = {
			{
				rawStateId = "187695762",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "187695720",
				name = "p1"
			}
		},
		converter = var_0_0[48]
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
		converter = var_0_0[50]
	},
	{
		stateName = "ovp:HeatingDerogationModeState",
		parameters = {
			{
				rawStateId = "187695763",
				name = "p1"
			}
		},
		converter = var_0_0[51]
	},
	{
		stateName = "core:ActiveTimeProgramState",
		parameters = {
			{
				name = "p1",
				rawStateId = "187695337",
				converter = var_0_0[43]
			}
		},
		converter = var_0_0[49]
	},
	{
		stateName = "core:ComfortRoomTemperatureState",
		parameters = {
			{
				rawStateId = "187695768",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:OperatingModeState",
		parameters = {
			{
				rawStateId = "187695743",
				name = "p1"
			}
		},
		converter = var_0_0[43]
	},
	{
		stateName = "core:ReducedTemperatureState",
		parameters = {
			{
				rawStateId = "187695769",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:SecuredPositionTemperatureState",
		parameters = {
			{
				rawStateId = "187695770",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "187695722",
				name = "p1"
			}
		},
		converter = var_0_0[48]
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
		converter = var_0_0[50]
	},
	{
		stateName = "ovp:HeatingDerogationModeState",
		parameters = {
			{
				rawStateId = "187695771",
				name = "p1"
			}
		},
		converter = var_0_0[51]
	},
	{
		stateName = "core:ComfortRoomTemperatureState",
		parameters = {
			{
				rawStateId = "187695776",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:OperatingModeState",
		parameters = {
			{
				rawStateId = "187695744",
				name = "p1"
			}
		},
		converter = var_0_0[43]
	},
	{
		stateName = "core:ReducedTemperatureState",
		parameters = {
			{
				rawStateId = "187695777",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "187695707",
				name = "p1"
			}
		},
		converter = var_0_0[48]
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
		converter = var_0_0[50]
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
		converter = var_0_0[94]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "187695726",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:OperatingModeState",
		parameters = {
			{
				rawStateId = "187695745",
				name = "p1"
			}
		},
		converter = var_0_0[43]
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
		converter = var_0_0[50]
	},
	{
		stateName = "core:ComfortRoomTemperatureState",
		parameters = {
			{
				rawStateId = "187695790",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "187695709",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:ComfortRoomTemperatureState",
		parameters = {
			{
				rawStateId = "187695791",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "187695710",
				name = "p1"
			}
		},
		converter = var_0_0[48]
	},
	{
		stateName = "core:ComfortRoomTemperatureState",
		parameters = {
			{
				rawStateId = "455344142",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "core:EcoRoomTemperatureState",
		parameters = {
			{
				rawStateId = "455344143",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "core:FrostProtectionRoomTemperatureState",
		parameters = {
			{
				rawStateId = "455344144",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "core:LockedButtonState",
		parameters = {
			{
				rawStateId = "455397376",
				name = "p1"
			}
		},
		converter = var_0_0[119]
	},
	{
		stateName = "core:OpenWindowDetectionActivationState",
		parameters = {
			{
				rawStateId = "455344157",
				name = "p1"
			}
		},
		converter = var_0_0[120]
	},
	{
		stateName = "ovp:AbscenceTimeMaxState",
		parameters = {
			{
				rawStateId = "455381018",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:AbscenceTimeMinState",
		parameters = {
			{
				rawStateId = "455376922",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:AbscenceTimeState",
		parameters = {
			{
				rawStateId = "455344154",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:AutoProgW1J1State",
		parameters = {
			{
				rawStateId = "455350016",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW1J2State",
		parameters = {
			{
				rawStateId = "455350017",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW1J3State",
		parameters = {
			{
				rawStateId = "455350018",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW1J4State",
		parameters = {
			{
				rawStateId = "455350019",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW1J5State",
		parameters = {
			{
				rawStateId = "455350020",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW1J6State",
		parameters = {
			{
				rawStateId = "455350021",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW1J7State",
		parameters = {
			{
				rawStateId = "455350022",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW2J1State",
		parameters = {
			{
				rawStateId = "455350272",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW2J2State",
		parameters = {
			{
				rawStateId = "455350273",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW2J3State",
		parameters = {
			{
				rawStateId = "455350274",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW2J4State",
		parameters = {
			{
				rawStateId = "455350275",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW2J5State",
		parameters = {
			{
				rawStateId = "455350276",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW2J6State",
		parameters = {
			{
				rawStateId = "455350277",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW2J7State",
		parameters = {
			{
				rawStateId = "455350278",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW3J1State",
		parameters = {
			{
				rawStateId = "455350528",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW3J2State",
		parameters = {
			{
				rawStateId = "455350529",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW3J3State",
		parameters = {
			{
				rawStateId = "455350530",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW3J4State",
		parameters = {
			{
				rawStateId = "455350531",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW3J5State",
		parameters = {
			{
				rawStateId = "455350532",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW3J6State",
		parameters = {
			{
				rawStateId = "455350533",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:AutoProgW3J7State",
		parameters = {
			{
				rawStateId = "455350534",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:BabyCareFunctionActivationMaxState",
		parameters = {
			{
				rawStateId = "455381027",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:BabyCareFunctionActivationMinState",
		parameters = {
			{
				rawStateId = "455376931",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:BabyCareFunctionActivationState",
		parameters = {
			{
				rawStateId = "455344163",
				name = "p1"
			}
		},
		converter = var_0_0[120]
	},
	{
		stateName = "ovp:ComfortRoomTemperatureMaxState",
		parameters = {
			{
				rawStateId = "455381006",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "ovp:ComfortRoomTemperatureMinState",
		parameters = {
			{
				rawStateId = "455376910",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "ovp:ConsignRegulState",
		parameters = {
			{
				rawStateId = "455397385",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "ovp:CountDetectPresenceState",
		parameters = {
			{
				rawStateId = "455397378",
				name = "p1"
			}
		},
		converter = var_0_0[123]
	},
	{
		stateName = "ovp:CurrentStateMaxState",
		parameters = {
			{
				rawStateId = "455381005",
				name = "p1"
			}
		},
		converter = var_0_0[124]
	},
	{
		stateName = "ovp:CurrentStateMinState",
		parameters = {
			{
				rawStateId = "455376909",
				name = "p1"
			}
		},
		converter = var_0_0[124]
	},
	{
		stateName = "ovp:CurrentStateState",
		parameters = {
			{
				rawStateId = "455344141",
				name = "p1"
			}
		},
		converter = var_0_0[124]
	},
	{
		stateName = "ovp:CycleReportState",
		parameters = {
			{
				rawStateId = "455397386",
				name = "p1"
			}
		},
		converter = var_0_0[125]
	},
	{
		stateName = "ovp:DurationEnergyCounterMaxState",
		parameters = {
			{
				rawStateId = "455381017",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:DurationEnergyCounterMinState",
		parameters = {
			{
				rawStateId = "455376921",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:DurationEnergyCounterState",
		parameters = {
			{
				rawStateId = "455344153",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:EcoRoomTemperatureMaxState",
		parameters = {
			{
				rawStateId = "455381007",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "ovp:EcoRoomTemperatureMinState",
		parameters = {
			{
				rawStateId = "455376911",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "ovp:ElectricPowerMaxState",
		parameters = {
			{
				rawStateId = "455381015",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:ElectricPowerMinState",
		parameters = {
			{
				rawStateId = "455376919",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:ElectricPowerState",
		parameters = {
			{
				rawStateId = "455344151",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:ErrorThermostatState",
		parameters = {
			{
				rawStateId = "455397382",
				name = "p1"
			}
		},
		converter = var_0_0[126]
	},
	{
		stateName = "ovp:FirmwareVersionState",
		parameters = {
			{
				rawStateId = "455405570",
				name = "p1"
			}
		},
		converter = var_0_0[127]
	},
	{
		stateName = "ovp:FrostProtectionRoomTemperatureMaxState",
		parameters = {
			{
				rawStateId = "455381008",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "ovp:FrostProtectionRoomTemperatureMinState",
		parameters = {
			{
				rawStateId = "455376912",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "ovp:HoursEnergyCounterMaxState",
		parameters = {
			{
				rawStateId = "455381016",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:HoursEnergyCounterMinState",
		parameters = {
			{
				rawStateId = "455376920",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:HoursEnergyCounterState",
		parameters = {
			{
				rawStateId = "455344152",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:MiniboxHolidayModeMaxState",
		parameters = {
			{
				rawStateId = "455381036",
				name = "p1"
			}
		},
		converter = var_0_0[128]
	},
	{
		stateName = "ovp:MiniboxHolidayModeMinState",
		parameters = {
			{
				rawStateId = "455376940",
				name = "p1"
			}
		},
		converter = var_0_0[128]
	},
	{
		stateName = "ovp:MiniboxHolidayModeState",
		parameters = {
			{
				rawStateId = "455344172",
				name = "p1"
			}
		},
		converter = var_0_0[128]
	},
	{
		stateName = "ovp:MiniboxProgModeMaxState",
		parameters = {
			{
				rawStateId = "455381035",
				name = "p1"
			}
		},
		converter = var_0_0[128]
	},
	{
		stateName = "ovp:MiniboxProgModeMinState",
		parameters = {
			{
				rawStateId = "455376939",
				name = "p1"
			}
		},
		converter = var_0_0[128]
	},
	{
		stateName = "ovp:MiniboxProgModeState",
		parameters = {
			{
				rawStateId = "455344171",
				name = "p1"
			}
		},
		converter = var_0_0[128]
	},
	{
		stateName = "ovp:NbSecAfterLastDetectState",
		parameters = {
			{
				rawStateId = "455397377",
				name = "p1"
			}
		},
		converter = var_0_0[129]
	},
	{
		stateName = "ovp:OpenWindowDetectionActivationMaxState",
		parameters = {
			{
				rawStateId = "455381021",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:OpenWindowDetectionActivationMinState",
		parameters = {
			{
				rawStateId = "455376925",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:ProductTypeState",
		parameters = {
			{
				rawStateId = "455405568",
				name = "p1"
			}
		},
		converter = var_0_0[123]
	},
	{
		stateName = "ovp:ProductVersionState",
		parameters = {
			{
				rawStateId = "455405569",
				name = "p1"
			}
		},
		converter = var_0_0[130]
	},
	{
		stateName = "ovp:RoomTemperatureMaxState",
		parameters = {
			{
				rawStateId = "455381033",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "ovp:RoomTemperatureMinState",
		parameters = {
			{
				rawStateId = "455376937",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "ovp:RoomTemperatureState",
		parameters = {
			{
				rawStateId = "455344169",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "ovp:TechnicalOffsetMaxState",
		parameters = {
			{
				rawStateId = "455381009",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:TechnicalOffsetMinState",
		parameters = {
			{
				rawStateId = "455376913",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:TechnicalOffsetState",
		parameters = {
			{
				rawStateId = "455344145",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:TemporaryTemperatureMaxState",
		parameters = {
			{
				rawStateId = "455381034",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "ovp:TemporaryTemperatureMinState",
		parameters = {
			{
				rawStateId = "455376938",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "ovp:TemporaryTemperatureState",
		parameters = {
			{
				rawStateId = "455344170",
				name = "p1"
			}
		},
		converter = var_0_0[118]
	},
	{
		stateName = "ovp:ThermostatRTCState",
		parameters = {
			{
				rawStateId = "455405572",
				name = "p1"
			}
		},
		converter = var_0_0[131],
		refresh = var_0_3[2]
	},
	{
		stateName = "ovp:Timer2hMaxState",
		parameters = {
			{
				rawStateId = "455381037",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:Timer2hMinState",
		parameters = {
			{
				rawStateId = "455376941",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:Timer2hState",
		parameters = {
			{
				rawStateId = "455344173",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:UniqueSTChipIdState",
		parameters = {
			{
				rawStateId = "455405571",
				name = "p1"
			}
		},
		converter = var_0_0[121]
	},
	{
		stateName = "ovp:UserProgJ1State",
		parameters = {
			{
				rawStateId = "455348224",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:UserProgJ2State",
		parameters = {
			{
				rawStateId = "455348225",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:UserProgJ3State",
		parameters = {
			{
				rawStateId = "455348226",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:UserProgJ4State",
		parameters = {
			{
				rawStateId = "455348227",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:UserProgJ5State",
		parameters = {
			{
				rawStateId = "455348228",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:UserProgJ6State",
		parameters = {
			{
				rawStateId = "455348229",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "ovp:UserProgJ7State",
		parameters = {
			{
				rawStateId = "455348230",
				name = "p1"
			}
		},
		converter = var_0_0[122]
	},
	{
		stateName = "core:NameState",
		parameters = {
			{
				rawStateId = "2415919105",
				name = "p1"
			}
		},
		converter = var_0_0[242]
	},
	{
		stateName = "core:SensorDefectState",
		parameters = {
			{
				rawStateId = "2415919110",
				name = "p1"
			}
		},
		converter = var_0_0[243]
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
		converter = var_0_0[247]
	},
	{
		stateName = "kizotherm:KizOThermOperatingModesState",
		parameters = {
			{
				rawStateId = "185598563",
				name = "p1"
			}
		},
		converter = var_0_0[248]
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
		refresh = var_0_3[0],
		converter = var_0_0[252]
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
				converter = var_0_0[254]
			},
			{
				name = "p2",
				rawStateId = "185401347",
				converter = var_0_0[255]
			}
		},
		converter = var_0_0[256]
	},
	{
		stateName = "ovp:DiagnosticCodeState",
		parameters = {
			{
				rawStateId = "185401857",
				name = "p1"
			}
		},
		converter = var_0_0[257],
		refresh = var_0_3[3]
	},
	{
		stateName = "ovp:MainOperationState",
		parameters = {
			{
				rawStateId = "185401344",
				name = "p1"
			}
		},
		converter = var_0_0[261],
		refresh = var_0_3[3]
	},
	{
		stateName = "ovp:ModeChangeState",
		parameters = {
			{
				rawStateId = "185401345",
				name = "p1"
			}
		},
		converter = var_0_0[254],
		refresh = var_0_3[3]
	},
	{
		stateName = "ovp:OutdoorTemperatureState",
		parameters = {
			{
				rawStateId = "185401602",
				name = "p1"
			}
		},
		converter = var_0_0[262],
		refresh = var_0_3[3]
	},
	{
		stateName = "ovp:RoomTemperatureState",
		parameters = {
			{
				rawStateId = "185401600",
				name = "p1"
			}
		},
		converter = var_0_0[262],
		refresh = var_0_3[3]
	},
	{
		stateName = "ovp:TemperatureChangeState",
		parameters = {
			{
				rawStateId = "185401347",
				name = "p1"
			}
		},
		converter = var_0_0[255],
		refresh = var_0_3[3]
	},
	{
		stateName = "ovp:ThermoStatusState",
		parameters = {
			{
				rawStateId = "185402113",
				name = "p1"
			}
		},
		converter = var_0_0[264],
		refresh = var_0_3[3]
	},
	{
		stateName = "core:IdentifierState",
		parameters = {
			{
				rawStateId = "83935233",
				name = "p1"
			}
		},
		converter = var_0_0[267],
		refresh = var_0_3[2]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "2415919106",
				name = "p1"
			}
		},
		converter = var_0_0[269]
	},
	{
		stateName = "core:BatteryState",
		parameters = {
			{
				rawStateId = "2415919110",
				name = "p1"
			}
		},
		converter = var_0_0[270]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "33620224",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[271]
	},
	{
		stateName = "ovp:HeatingTemperatureInterfaceActiveModeState",
		parameters = {
			{
				rawStateId = "33620224",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[272]
	},
	{
		stateName = "ovp:HeatingTemperatureInterfaceSetPointModeState",
		parameters = {
			{
				rawStateId = "33620224",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[273]
	}
}
var_0_5 = {}
var_0_6 = {
	{
		linkedHighLevelState = {
			var_0_4[1]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[2]
		}
	},
	{
		extraDefinition = {
			access = "r",
			parameterId = "1"
		}
	},
	{
		converter = var_0_0[4],
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
		var_0_6[5]
	},
	{
		access = "w",
		parameterId = "65537"
	},
	{
		prototype = "string",
		parameters = var_0_6[6],
		converter = var_0_0[6],
		extraDefinition = {
			access = "w",
			parameterId = "1"
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[4],
			var_0_4[8]
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
		var_0_4[4],
		var_0_4[5],
		var_0_4[7],
		var_0_4[8]
	},
	{
		linkedHighLevelState = var_0_6[10],
		linkedStateIds = {
			"16830720",
			"16832522",
			"16832526",
			"16832527",
			"65559"
		}
	},
	{
		linkedHighLevelState = var_0_6[10],
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
			var_0_4[5],
			var_0_4[8]
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
			var_0_4[7],
			var_0_4[8]
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
		var_0_6[21]
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
		var_0_4[12]
	},
	{
		getName = var_0_6[3],
		setName = var_0_6[8]
	},
	{
		type = 2,
		widget = "TemperatureSensor",
		uiClass = "TemperatureSensor",
		uiProfiles = var_0_6[28],
		states = {
			["1"] = var_0_6[1],
			["2147426304"] = var_0_6[2],
			["65537"] = {
				linkedHighLevelState = var_0_6[29],
				linkedStateIds = {
					"65558",
					"65559"
				}
			},
			["65558"] = {
				linkedHighLevelState = var_0_6[29],
				linkedStateIds = {
					"65537",
					"65559"
				}
			},
			["65559"] = {
				linkedHighLevelState = var_0_6[29],
				linkedStateIds = {
					"65537",
					"65558"
				}
			}
		},
		commands = var_0_6[30]
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
			var_0_4[19],
			var_0_4[21],
			var_0_4[22]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[20]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[23]
		}
	},
	{
		converter = var_0_0[38],
		extraDefinition = var_0_6[7]
	},
	{
		prototype = "string(boost;comfort;comfort-1;comfort-2;eco;frostprotection;off;secured)",
		parameters = var_0_6[6],
		converter = var_0_0[39],
		extraDefinition = var_0_6[23]
	},
	{
		prototype = "any",
		parameters = var_0_6[6],
		converter = var_0_0[40],
		extraDefinition = var_0_6[7]
	},
	{
		prototype = "any",
		parameters = var_0_6[6],
		converter = var_0_0[41],
		extraDefinition = var_0_6[23]
	},
	{
		"Specific"
	},
	{
		linkedHighLevelState = {
			var_0_4[24]
		}
	},
	{
		getName = var_0_6[3],
		identify = var_0_6[4],
		setName = var_0_6[8]
	},
	{
		access = "r",
		parameterId = "187760639"
	},
	{
		linkedHighLevelState = {
			var_0_4[29]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[31]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[34]
		}
	},
	{
		var_0_4[35]
	},
	{
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		linkedHighLevelState = var_0_6[54],
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
		converter = var_0_0[52],
		extraDefinition = var_0_6[50]
	},
	{
		converter = var_0_0[53],
		extraDefinition = var_0_6[50]
	},
	{
		converter = var_0_0[56],
		extraDefinition = var_0_6[50]
	},
	{
		converter = var_0_0[59],
		extraDefinition = var_0_6[50]
	},
	{
		access = "w",
		parameterId = "187760639"
	},
	{
		prototype = "any",
		parameters = var_0_6[6],
		converter = var_0_0[60],
		extraDefinition = var_0_6[80]
	},
	{
		prototype = "any",
		parameters = var_0_6[6],
		converter = var_0_0[65],
		extraDefinition = var_0_6[80]
	},
	{
		linkedHighLevelState = {
			var_0_4[37]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[39]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[40]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[42]
		}
	},
	{
		var_0_4[43]
	},
	{
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		linkedHighLevelState = var_0_6[87],
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
		converter = var_0_0[66],
		extraDefinition = var_0_6[50]
	},
	{
		converter = var_0_0[67],
		extraDefinition = var_0_6[50]
	},
	{
		converter = var_0_0[70],
		extraDefinition = var_0_6[50]
	},
	{
		converter = var_0_0[71],
		extraDefinition = var_0_6[50]
	},
	{
		converter = var_0_0[73],
		extraDefinition = var_0_6[50]
	},
	{
		prototype = "any",
		parameters = var_0_6[6],
		converter = var_0_0[74],
		extraDefinition = var_0_6[80]
	},
	{
		prototype = "any",
		parameters = var_0_6[6],
		converter = var_0_0[77],
		extraDefinition = var_0_6[80]
	},
	{
		prototype = "any",
		parameters = var_0_6[6],
		converter = var_0_0[79],
		extraDefinition = var_0_6[80]
	},
	{
		linkedHighLevelState = {
			var_0_4[45]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[47]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[48]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[50]
		}
	},
	{
		var_0_4[51]
	},
	{
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		linkedHighLevelState = var_0_6[121],
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
		converter = var_0_0[80],
		extraDefinition = var_0_6[50]
	},
	{
		converter = var_0_0[81],
		extraDefinition = var_0_6[50]
	},
	{
		converter = var_0_0[84],
		extraDefinition = var_0_6[50]
	},
	{
		converter = var_0_0[85],
		extraDefinition = var_0_6[50]
	},
	{
		converter = var_0_0[87],
		extraDefinition = var_0_6[50]
	},
	{
		prototype = "any",
		parameters = var_0_6[6],
		converter = var_0_0[88],
		extraDefinition = var_0_6[80]
	},
	{
		prototype = "any",
		parameters = var_0_6[6],
		converter = var_0_0[91],
		extraDefinition = var_0_6[80]
	},
	{
		prototype = "any",
		parameters = var_0_6[6],
		converter = var_0_0[93],
		extraDefinition = var_0_6[80]
	},
	{
		linkedHighLevelState = {
			var_0_4[56]
		}
	},
	{
		var_0_4[57]
	},
	{
		var_0_4[58]
	},
	{
		linkedHighLevelState = {
			var_0_4[59]
		}
	},
	{
		type = 2,
		widget = "TemperatureSensor",
		uiClass = "TemperatureSensor",
		uiProfiles = var_0_6[28],
		states = {
			["2147426304"] = var_0_6[2],
			["187695726"] = var_0_6[154]
		}
	},
	{
		var_0_4[61]
	},
	{
		linkedHighLevelState = {
			var_0_4[63]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[65]
		}
	},
	{
		["2147426304"] = var_0_6[2]
	},
	{
		type = 2,
		widget = "CumulativeElectricPowerConsumptionSensor",
		uiClass = "ElectricitySensor",
		uiProfiles = {
			"ElectricEnergyConsumption"
		},
		states = var_0_6[159]
	},
	{
		["ovp:ModbusMainController"] = {
			type = 1,
			widget = "unknown",
			uiClass = "Generic",
			uiProfiles = var_0_6[47],
			states = {
				["1"] = var_0_6[1],
				["2147426304"] = var_0_6[2]
			},
			commands = var_0_6[49]
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
			var_0_4[153]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[154]
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
		parameters = var_0_6[6],
		converter = var_0_0[6],
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
				["185598490"] = {
					linkedHighLevelState = {
						var_0_4[156]
					}
				},
				["185598576"] = {
					linkedHighLevelState = {
						var_0_4[157]
					}
				},
				["185598575"] = {
					linkedHighLevelState = {
						var_0_4[158]
					}
				},
				["1"] = var_0_6[1],
				["185598465"] = {
					linkedHighLevelState = {
						var_0_4[159]
					}
				},
				["185598472"] = {
					linkedHighLevelState = {
						var_0_4[160]
					}
				},
				["2147426304"] = var_0_6[2],
				["185598520"] = {
					linkedHighLevelState = {
						var_0_4[161]
					}
				},
				["185598480"] = {
					linkedHighLevelState = {
						var_0_4[162],
						var_0_4[163]
					}
				},
				["185598482"] = {
					linkedHighLevelState = {
						var_0_4[164]
					}
				},
				["185598584"] = {
					linkedHighLevelState = {
						var_0_4[165]
					}
				},
				["185598467"] = {
					linkedHighLevelState = {
						var_0_4[166]
					}
				},
				["185598563"] = {
					linkedHighLevelState = {
						var_0_4[167]
					}
				},
				["185598473"] = {
					linkedHighLevelState = {
						var_0_4[168]
					}
				}
			},
			commands = {
				getName = var_0_6[3],
				identify = var_0_6[4],
				refreshState = {
					extraDefinition = {
						access = "r",
						parameterId = "185598209"
					}
				},
				setName = var_0_6[8],
				setOperatingModes = {
					prototype = "any",
					parameters = var_0_6[6],
					converter = var_0_0[250],
					extraDefinition = {
						access = "w",
						parameterId = "185598563"
					}
				},
				setSetpointOverride = {
					prototype = "any",
					parameters = var_0_6[6],
					converter = var_0_0[251],
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
			uiProfiles = var_0_6[28],
			states = {
				["1"] = var_0_6[1],
				["2147426304"] = var_0_6[2],
				["185598488"] = {
					linkedHighLevelState = {
						var_0_4[169]
					}
				}
			},
			commands = var_0_6[30]
		}
	},
	{
		["ovp:KizOThermBoilerTemperatureSensor"] = {
			type = 2,
			widget = "TemperatureSensor",
			uiClass = "TemperatureSensor",
			uiProfiles = var_0_6[28],
			states = {
				["1"] = var_0_6[1],
				["2147426304"] = var_0_6[2],
				["185598489"] = {
					linkedHighLevelState = {
						var_0_4[170]
					}
				}
			},
			commands = var_0_6[30]
		}
	},
	{
		["ovp:KizOThermDHWTemperatureSensor"] = {
			type = 2,
			widget = "TemperatureSensor",
			uiClass = "TemperatureSensor",
			uiProfiles = var_0_6[28],
			states = {
				["2147426304"] = var_0_6[2],
				["185598490"] = {
					linkedHighLevelState = {
						var_0_4[171]
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
			uiProfiles = var_0_6[28],
			states = {
				["2147426304"] = var_0_6[2],
				["185598491"] = {
					linkedHighLevelState = {
						var_0_4[172]
					}
				}
			}
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[184]
		}
	},
	{
		converter = var_0_0[268],
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
}

return {
	["0"] = {
		name = "Generic Product",
		localPairing = true,
		["0"] = {
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
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[0]
						}
					},
					["1"] = var_0_6[1],
					["2147426304"] = var_0_6[2]
				},
				commands = {
					getName = var_0_6[3],
					identify = var_0_6[4],
					setLevel = {
						prototype = "integer[0;100]",
						parameters = var_0_6[6],
						converter = var_0_0[5],
						extraDefinition = var_0_6[7]
					},
					setName = var_0_6[8]
				}
			}
		}
	},
	["917506"] = {
		name = "Heating Temperature Interface (SOMFY)",
		localPairing = true,
		["1"] = {
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
					["65556"] = {
						linkedHighLevelState = {
							var_0_4[3]
						}
					},
					["16832527"] = var_0_6[9],
					["65558"] = var_0_6[11],
					["65559"] = var_0_6[12],
					["16832526"] = var_0_6[13],
					["1"] = var_0_6[1],
					["16830720"] = {
						linkedHighLevelState = {
							var_0_4[6],
							var_0_4[8],
							var_0_4[11]
						},
						linkedStateIds = var_0_6[14]
					},
					["16832522"] = var_0_6[15],
					["2147426304"] = var_0_6[2],
					["65546"] = {
						linkedHighLevelState = {
							var_0_4[9],
							var_0_4[10]
						}
					}
				},
				commands = {
					getName = var_0_6[3],
					identify = var_0_6[4],
					refreshActiveMode = var_0_6[16],
					refreshBatteryLevel = var_0_6[17],
					refreshComfortTemperature = var_0_6[18],
					refreshEcoTemperature = var_0_6[19],
					refreshOnOffState = var_0_6[17],
					refreshSecuredPositionTemperature = var_0_6[20],
					refreshTemperature = var_0_6[17],
					refreshSetPointMode = var_0_6[17],
					refreshTargetTemperature = var_0_6[17],
					setActiveMode = {
						prototype = "string(auto;manu)",
						parameters = var_0_6[6],
						rawStates = var_0_6[22],
						converter = var_0_0[18],
						extraDefinition = var_0_6[23]
					},
					setComfortTemperature = {
						prototype = "float[7.0;30.0]",
						parameters = var_0_6[6],
						rawStates = var_0_6[24],
						converter = var_0_0[19],
						extraDefinition = var_0_6[25]
					},
					setEcoTemperature = {
						prototype = "float[6.0;29.0]",
						parameters = var_0_6[6],
						rawStates = var_0_6[24],
						converter = var_0_0[19],
						extraDefinition = var_0_6[26]
					},
					setManuAndSetPointModes = {
						prototype = "string(comfort;eco;secured)",
						parameters = var_0_6[6],
						converter = var_0_0[20],
						extraDefinition = var_0_6[23]
					},
					setName = var_0_6[8],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = var_0_6[6],
						rawStates = {
							{
								rawStateId = "65546"
							},
							var_0_6[21]
						},
						converter = var_0_0[21],
						extraDefinition = var_0_6[23]
					},
					setOperatingMode = {
						prototype = "string(heating;cooling;heatingCooling)",
						parameters = var_0_6[6],
						converter = var_0_0[22],
						extraDefinition = var_0_6[23]
					},
					setSecuredPositionTemperature = {
						prototype = "float[5.0;15.0]",
						parameters = var_0_6[6],
						rawStates = var_0_6[24],
						converter = var_0_0[19],
						extraDefinition = var_0_6[27]
					}
				}
			}
		},
		["2"] = {
			["ovp:HeatingTemperatureInterfaceTemperatureSensor"] = var_0_6[31]
		}
	},
	["917515"] = {
		name = "Heating Temperature Interface (IMHOTEP)",
		localPairing = true,
		["1"] = {
			["ovp:ImhotepHeatingTemperatureInterfaceOVPComponent"] = {
				type = 1,
				widget = "ImhotepHeatingTemperatureInterface",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[32],
				states = {
					["234946564"] = {
						linkedHighLevelState = {
							var_0_4[13]
						}
					},
					["16832527"] = var_0_6[9],
					["65558"] = var_0_6[11],
					["65559"] = var_0_6[12],
					["16832526"] = var_0_6[13],
					["1"] = var_0_6[1],
					["16832522"] = var_0_6[15],
					["2147426304"] = var_0_6[2],
					["16830720"] = {
						linkedHighLevelState = {
							var_0_4[8],
							var_0_4[11]
						},
						linkedStateIds = var_0_6[14]
					},
					["234946826"] = {
						linkedHighLevelState = {
							var_0_4[14]
						}
					},
					["65546"] = {
						linkedHighLevelState = {
							var_0_4[9]
						}
					},
					["ovp:SetSetPointModeInProgressState"] = {
						linkedHighLevelState = {
							var_0_4[15]
						}
					}
				},
				commands = {
					getName = var_0_6[3],
					identify = var_0_6[4],
					refreshActiveMode = var_0_6[16],
					refreshBatteryLevel = {
						converter = var_0_0[24],
						extraDefinition = {
							access = "r",
							parameterId = "234946563"
						}
					},
					refreshComfortTemperature = var_0_6[18],
					refreshDeviceSerialNumber = {
						converter = var_0_0[24],
						extraDefinition = var_0_6[33]
					},
					refreshEcoTemperature = var_0_6[19],
					refreshSecuredPositionTemperature = var_0_6[20],
					refreshTemperature = var_0_6[17],
					refreshSetPointMode = var_0_6[17],
					refreshTargetTemperature = var_0_6[17],
					setActiveAndSetPointModes = {
						prototype = "string(auto;manu),string(comfort;eco;secured)|float[7.0;26.0]",
						parameters = {
							var_0_6[5],
							var_0_6[34]
						},
						rawStates = var_0_6[24],
						converter = var_0_0[25],
						extraDefinition = var_0_6[23]
					},
					setActiveMode = {
						prototype = "string(auto;manu)",
						parameters = var_0_6[6],
						rawStates = var_0_6[22],
						converter = var_0_0[26],
						extraDefinition = var_0_6[23]
					},
					setAutoAndSetPointModes = {
						prototype = "string(comfort;eco;secured)",
						parameters = var_0_6[6],
						converter = var_0_0[27],
						extraDefinition = var_0_6[23]
					},
					setComfortTemperature = {
						prototype = "float[14.5;26.0]",
						parameters = var_0_6[6],
						rawStates = var_0_6[24],
						converter = var_0_0[19],
						extraDefinition = var_0_6[25]
					},
					setEcoTemperature = {
						prototype = "float[12.5;24.0]",
						parameters = var_0_6[6],
						rawStates = var_0_6[24],
						converter = var_0_0[19],
						extraDefinition = var_0_6[26]
					},
					setName = var_0_6[8],
					setSecuredPositionTemperature = {
						prototype = "float[7.0;12.0]",
						parameters = var_0_6[6],
						rawStates = var_0_6[24],
						converter = var_0_0[19],
						extraDefinition = var_0_6[27]
					},
					setSetPointMode = {
						prototype = "string(comfort;eco;secured)|float[7.0;26.0]",
						parameters = var_0_6[6],
						rawStates = var_0_6[24],
						converter = var_0_0[28],
						extraDefinition = var_0_6[23]
					}
				}
			}
		},
		["2"] = {
			["ovp:ImhotepHeatingTemperatureInterfaceTemperatureSensor"] = var_0_6[31]
		},
		["3"] = {
			["ovp:ImhotepHeatingTemperatureRelayOVPComponent"] = {
				type = 1,
				widget = "StatefulOnOff",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[35],
				states = {
					["234946824"] = {
						linkedHighLevelState = {
							var_0_4[16]
						}
					},
					["1"] = var_0_6[1],
					["65546"] = {
						linkedHighLevelState = {
							var_0_4[17]
						}
					},
					["2147426304"] = var_0_6[2]
				},
				commands = {
					getName = var_0_6[3],
					identify = var_0_6[4],
					refreshConnectivity = {
						converter = var_0_0[32],
						extraDefinition = {
							access = "r",
							parameterId = "234946567"
						}
					},
					refreshDeviceSerialNumber = {
						converter = var_0_0[32],
						extraDefinition = var_0_6[33]
					},
					refreshOnOffState = var_0_6[16],
					refreshOperatingTime = {
						converter = var_0_0[32],
						extraDefinition = {
							access = "r",
							parameterId = "234946569"
						}
					},
					setName = var_0_6[8]
				}
			}
		}
	},
	["983040"] = {
		name = "Switch On/Off",
		localPairing = true,
		["0"] = {
			["ovp:OnOffOVPComponent"] = {
				type = 1,
				widget = "StatefulOnOff",
				uiClass = "OnOff",
				uiProfiles = var_0_6[36],
				states = {
					["1"] = var_0_6[1],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[18]
						}
					},
					["2147426304"] = var_0_6[2]
				},
				commands = {
					getName = var_0_6[3],
					identify = var_0_6[4],
					setName = var_0_6[8],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = var_0_6[6],
						converter = var_0_0[34],
						extraDefinition = var_0_6[7]
					},
					off = {
						parameters = var_0_6[37],
						converter = var_0_0[34],
						extraDefinition = var_0_6[7]
					},
					on = {
						parameters = var_0_6[38],
						converter = var_0_0[34],
						extraDefinition = var_0_6[7]
					}
				}
			}
		}
	},
	["3407872"] = {
		name = "Electrical heater",
		localPairing = true,
		["0"] = {
			["ovp:ElectricalHeaterGenericOVPComponent"] = {
				type = 1,
				widget = "unknown",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[39],
				states = {
					["1"] = var_0_6[1],
					["16830720"] = var_0_6[40],
					["2147426304"] = var_0_6[2],
					["65547"] = var_0_6[41],
					["65548"] = var_0_6[42]
				},
				commands = {
					getName = var_0_6[3],
					identify = var_0_6[4],
					off = var_0_6[43],
					setHeatingLevel = var_0_6[44],
					setHeatingLevelForTrigger = var_0_6[45],
					setName = var_0_6[8],
					setTimerForTransitoryState = var_0_6[46]
				}
			}
		}
	},
	["16842763"] = {
		name = "De Dietrich Modbus Gateway",
		localPairing = true,
		["1"] = {
			["ovp:DeDietrichModbusGatewayOVPComponent"] = {
				type = 5,
				widget = "DeDietrichModbusGateway",
				uiClass = "ProtocolGateway",
				uiProfiles = var_0_6[47],
				states = {
					["1"] = var_0_6[1],
					["2147426304"] = var_0_6[48]
				},
				commands = var_0_6[49]
			}
		},
		["2"] = {
			["ovp:BoilerControllerOVPComponent"] = {
				type = 1,
				widget = "DeDietrichBoiler",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[47],
				states = {
					["187695569"] = {
						linkedHighLevelState = {
							var_0_4[25]
						}
					},
					["187695839"] = {
						linkedHighLevelState = {
							var_0_4[26]
						}
					},
					["2147426304"] = var_0_6[2],
					["187695604"] = {
						linkedHighLevelState = {
							var_0_4[27]
						}
					}
				},
				commands = {
					refreshAlarm = {
						converter = var_0_0[45],
						extraDefinition = var_0_6[50]
					},
					refreshOperatingState = {
						converter = var_0_0[46],
						extraDefinition = var_0_6[50]
					},
					refreshRedAlarm = {
						converter = var_0_0[47],
						extraDefinition = var_0_6[50]
					}
				}
			}
		},
		["3"] = {
			["ovp:OutsideTemperatureSensorOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[28],
				states = {
					["2147426304"] = var_0_6[2],
					["187695705"] = {
						linkedHighLevelState = {
							var_0_4[28]
						}
					}
				}
			}
		},
		["4"] = {
			["ovp:HeatingCircuitOnCircuitAOVPComponent"] = {
				type = 1,
				widget = "DeDietrichHeatingCircuit",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[28],
				states = {
					["187695335"] = var_0_6[51],
					["187695754"] = {
						linkedHighLevelState = {
							var_0_4[30]
						}
					},
					["187695741"] = var_0_6[52],
					["187695755"] = {
						linkedHighLevelState = {
							var_0_4[32]
						}
					},
					["187695756"] = {
						linkedHighLevelState = {
							var_0_4[33]
						}
					},
					["2147426304"] = var_0_6[2],
					["187695718"] = var_0_6[53],
					["187695230"] = var_0_6[55],
					["187695231"] = var_0_6[56],
					["187695232"] = var_0_6[57],
					["187695233"] = var_0_6[58],
					["187695234"] = var_0_6[59],
					["187695235"] = var_0_6[60],
					["187695236"] = var_0_6[61],
					["187695237"] = var_0_6[62],
					["187695238"] = var_0_6[63],
					["187695239"] = var_0_6[64],
					["187695240"] = var_0_6[65],
					["187695241"] = var_0_6[66],
					["187695242"] = var_0_6[67],
					["187695243"] = var_0_6[68],
					["187695244"] = var_0_6[69],
					["187695245"] = var_0_6[70],
					["187695246"] = var_0_6[71],
					["187695247"] = var_0_6[72],
					["187695248"] = var_0_6[73],
					["187695249"] = var_0_6[74],
					["187695250"] = var_0_6[75],
					["187695757"] = {
						linkedHighLevelState = {
							var_0_4[36]
						}
					}
				},
				commands = {
					refreshActiveTimeProgram = var_0_6[76],
					refreshCircuitType = var_0_6[77],
					refreshComfortTemperature = {
						converter = var_0_0[54],
						extraDefinition = var_0_6[50]
					},
					refreshDerogationMode = {
						converter = var_0_0[55],
						extraDefinition = var_0_6[50]
					},
					refreshOperatingMode = var_0_6[78],
					refreshReducedTemperature = {
						converter = var_0_0[57],
						extraDefinition = var_0_6[50]
					},
					refreshSecuredPositionTemperature = {
						converter = var_0_0[58],
						extraDefinition = var_0_6[50]
					},
					refreshTimeProgram = var_0_6[79],
					setActiveTimeProgram = var_0_6[81],
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[6],
						converter = var_0_0[61],
						extraDefinition = var_0_6[80]
					},
					setDerogationMode = {
						prototype = "string(holidays;eco;comfort;auto)",
						parameters = var_0_6[6],
						converter = var_0_0[62],
						extraDefinition = var_0_6[80]
					},
					setReducedTemperature = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[63],
						extraDefinition = var_0_6[80]
					},
					setSecuredPositionTemperature = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[64],
						extraDefinition = var_0_6[80]
					},
					setTimeProgram = var_0_6[82]
				}
			}
		},
		["5"] = {
			["ovp:HeatingCircuitTemperatureSensorOnCircuitAOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[28],
				states = {
					["2147426304"] = var_0_6[2],
					["187695718"] = var_0_6[53]
				}
			}
		},
		["6"] = {
			["ovp:HeatingCircuitOnCircuitBOVPComponent"] = {
				type = 1,
				widget = "DeDietrichHeatingCircuit",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[28],
				states = {
					["187695336"] = var_0_6[83],
					["187695760"] = {
						linkedHighLevelState = {
							var_0_4[38]
						}
					},
					["187695742"] = var_0_6[84],
					["187695761"] = var_0_6[85],
					["187695762"] = {
						linkedHighLevelState = {
							var_0_4[41]
						}
					},
					["2147426304"] = var_0_6[2],
					["187695720"] = var_0_6[86],
					["187695251"] = var_0_6[88],
					["187695252"] = var_0_6[89],
					["187695253"] = var_0_6[90],
					["187695254"] = var_0_6[91],
					["187695255"] = var_0_6[92],
					["187695256"] = var_0_6[93],
					["187695257"] = var_0_6[94],
					["187695258"] = var_0_6[95],
					["187695259"] = var_0_6[96],
					["187695260"] = var_0_6[97],
					["187695261"] = var_0_6[98],
					["187695262"] = var_0_6[99],
					["187695263"] = var_0_6[100],
					["187695264"] = var_0_6[101],
					["187695265"] = var_0_6[102],
					["187695266"] = var_0_6[103],
					["187695267"] = var_0_6[104],
					["187695268"] = var_0_6[105],
					["187695269"] = var_0_6[106],
					["187695270"] = var_0_6[107],
					["187695271"] = var_0_6[108],
					["187695763"] = {
						linkedHighLevelState = {
							var_0_4[44]
						}
					}
				},
				commands = {
					refreshActiveTimeProgram = var_0_6[109],
					refreshCircuitType = var_0_6[110],
					refreshComfortTemperature = {
						converter = var_0_0[68],
						extraDefinition = var_0_6[50]
					},
					refreshDerogationMode = {
						converter = var_0_0[69],
						extraDefinition = var_0_6[50]
					},
					refreshOperatingMode = var_0_6[111],
					refreshReducedTemperature = var_0_6[112],
					refreshSecuredPositionTemperature = {
						converter = var_0_0[72],
						extraDefinition = var_0_6[50]
					},
					refreshTimeProgram = var_0_6[113],
					setActiveTimeProgram = var_0_6[114],
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[6],
						converter = var_0_0[75],
						extraDefinition = var_0_6[80]
					},
					setDerogationMode = {
						prototype = "string(holidays;eco;comfort;auto)",
						parameters = var_0_6[6],
						converter = var_0_0[76],
						extraDefinition = var_0_6[50]
					},
					setReducedTemperature = var_0_6[115],
					setSecuredPositionTemperature = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[78],
						extraDefinition = var_0_6[80]
					},
					setTimeProgram = var_0_6[116]
				}
			}
		},
		["7"] = {
			["ovp:HeatingCircuitTemperatureSensorOnCircuitBOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[28],
				states = {
					["2147426304"] = var_0_6[2],
					["187695720"] = var_0_6[86]
				}
			}
		},
		["8"] = {
			["ovp:HeatingCircuitOnCircuitCOVPComponent"] = {
				type = 1,
				widget = "DeDietrichHeatingCircuit",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[28],
				states = {
					["187695337"] = var_0_6[117],
					["187695768"] = {
						linkedHighLevelState = {
							var_0_4[46]
						}
					},
					["187695743"] = var_0_6[118],
					["187695769"] = var_0_6[119],
					["187695770"] = {
						linkedHighLevelState = {
							var_0_4[49]
						}
					},
					["2147426304"] = var_0_6[2],
					["187695722"] = var_0_6[120],
					["187695272"] = var_0_6[122],
					["187695273"] = var_0_6[123],
					["187695274"] = var_0_6[124],
					["187695275"] = var_0_6[125],
					["187695276"] = var_0_6[126],
					["187695277"] = var_0_6[127],
					["187695278"] = var_0_6[128],
					["187695279"] = var_0_6[129],
					["187695280"] = var_0_6[130],
					["187695281"] = var_0_6[131],
					["187695282"] = var_0_6[132],
					["187695283"] = var_0_6[133],
					["187695284"] = var_0_6[134],
					["187695285"] = var_0_6[135],
					["187695286"] = var_0_6[136],
					["187695287"] = var_0_6[137],
					["187695288"] = var_0_6[138],
					["187695289"] = var_0_6[139],
					["187695290"] = var_0_6[140],
					["187695291"] = var_0_6[141],
					["187695292"] = var_0_6[142],
					["187695771"] = {
						linkedHighLevelState = {
							var_0_4[52]
						}
					}
				},
				commands = {
					refreshActiveTimeProgram = var_0_6[143],
					refreshCircuitType = var_0_6[144],
					refreshComfortTemperature = {
						converter = var_0_0[82],
						extraDefinition = var_0_6[50]
					},
					refreshDerogationMode = {
						converter = var_0_0[83],
						extraDefinition = var_0_6[50]
					},
					refreshOperatingMode = var_0_6[145],
					refreshReducedTemperature = var_0_6[146],
					refreshSecuredPositionTemperature = {
						converter = var_0_0[86],
						extraDefinition = var_0_6[50]
					},
					refreshTimeProgram = var_0_6[147],
					setActiveTimeProgram = var_0_6[148],
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[6],
						converter = var_0_0[89],
						extraDefinition = var_0_6[80]
					},
					setDerogationMode = {
						prototype = "string(holidays;eco;comfort;auto)",
						parameters = var_0_6[6],
						converter = var_0_0[90],
						extraDefinition = var_0_6[50]
					},
					setReducedTemperature = var_0_6[149],
					setSecuredPositionTemperature = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[92],
						extraDefinition = var_0_6[80]
					},
					setTimeProgram = var_0_6[150]
				}
			}
		},
		["9"] = {
			["ovp:HeatingCircuitTemperatureSensorOnCircuitCOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[28],
				states = {
					["2147426304"] = var_0_6[2],
					["187695722"] = var_0_6[120]
				}
			}
		},
		["10"] = {
			["ovp:DHW1OnDHWCircuitOVPComponent"] = {
				type = 1,
				widget = "DeDietrichDHW",
				uiClass = "WaterHeatingSystem",
				uiProfiles = var_0_6[28],
				states = {
					["187695776"] = {
						linkedHighLevelState = {
							var_0_4[53]
						}
					},
					["187695744"] = {
						linkedHighLevelState = {
							var_0_4[54]
						}
					},
					["187695777"] = {
						linkedHighLevelState = {
							var_0_4[55]
						}
					},
					["2147426304"] = var_0_6[2],
					["187695707"] = var_0_6[151],
					["187695293"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695294"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695295"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695296"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695297"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695298"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695299"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695300"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695301"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695302"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695303"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695304"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695305"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695306"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695307"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695308"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695309"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695310"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695311"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695312"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695313"] = {
						linkedHighLevelState = var_0_6[152],
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
					["187695757"] = {
						linkedHighLevelState = var_0_6[153],
						linkedStateIds = {
							"187695763",
							"187695771"
						}
					},
					["187695763"] = {
						linkedHighLevelState = var_0_6[153],
						linkedStateIds = {
							"187695757",
							"187695771"
						}
					},
					["187695771"] = {
						linkedHighLevelState = var_0_6[153],
						linkedStateIds = {
							"187695757",
							"187695763"
						}
					}
				},
				commands = {
					refreshCircuitType = {
						converter = var_0_0[95],
						extraDefinition = var_0_6[50]
					},
					refreshComfortTemperature = {
						converter = var_0_0[96],
						extraDefinition = var_0_6[50]
					},
					refreshDHWDerogationMode = {
						converter = var_0_0[97],
						extraDefinition = var_0_6[50]
					},
					refreshOperatingMode = {
						converter = var_0_0[98],
						extraDefinition = var_0_6[50]
					},
					refreshReducedTemperature = {
						converter = var_0_0[99],
						extraDefinition = var_0_6[50]
					},
					refreshTimeProgram = {
						converter = var_0_0[100],
						extraDefinition = var_0_6[50]
					},
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[6],
						converter = var_0_0[101],
						extraDefinition = var_0_6[80]
					},
					setDHWDerogationMode = {
						prototype = "string(auto;comfort)",
						parameters = var_0_6[6],
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
						converter = var_0_0[102],
						extraDefinition = var_0_6[50]
					},
					setReducedTemperature = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[103],
						extraDefinition = var_0_6[80]
					},
					setTimeProgram = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[104],
						extraDefinition = var_0_6[80]
					}
				}
			}
		},
		["11"] = {
			["ovp:DHW1TemperatureSensorOnDHWCircuitOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[28],
				states = {
					["2147426304"] = var_0_6[2],
					["187695707"] = var_0_6[151]
				}
			}
		},
		["12"] = {
			["ovp:DHW2OnCircuitAOVPComponent"] = {
				type = 1,
				widget = "DeDietrichDHW",
				uiClass = "WaterHeatingSystem",
				uiProfiles = var_0_6[28],
				states = {
					["187695335"] = var_0_6[51],
					["187695741"] = var_0_6[52],
					["2147426304"] = var_0_6[2],
					["187695726"] = var_0_6[154],
					["187695230"] = var_0_6[55],
					["187695231"] = var_0_6[56],
					["187695232"] = var_0_6[57],
					["187695233"] = var_0_6[58],
					["187695234"] = var_0_6[59],
					["187695235"] = var_0_6[60],
					["187695236"] = var_0_6[61],
					["187695237"] = var_0_6[62],
					["187695238"] = var_0_6[63],
					["187695239"] = var_0_6[64],
					["187695240"] = var_0_6[65],
					["187695241"] = var_0_6[66],
					["187695242"] = var_0_6[67],
					["187695243"] = var_0_6[68],
					["187695244"] = var_0_6[69],
					["187695245"] = var_0_6[70],
					["187695246"] = var_0_6[71],
					["187695247"] = var_0_6[72],
					["187695248"] = var_0_6[73],
					["187695249"] = var_0_6[74],
					["187695250"] = var_0_6[75]
				},
				commands = {
					refreshActiveTimeProgram = var_0_6[76],
					refreshCircuitType = var_0_6[77],
					refreshOperatingMode = var_0_6[78],
					refreshTimeProgram = var_0_6[79],
					setActiveTimeProgram = var_0_6[81],
					setTimeProgram = var_0_6[82]
				}
			}
		},
		["13"] = {
			["ovp:DHW2TemperatureSensorOnCircuitAOVPComponent"] = var_0_6[155]
		},
		["14"] = {
			["ovp:DHW2OnAuxiliaryCircuitOVPComponent"] = {
				type = 1,
				widget = "DeDietrichDHW",
				uiClass = "WaterHeatingSystem",
				uiProfiles = var_0_6[28],
				states = {
					["187695745"] = {
						linkedHighLevelState = {
							var_0_4[60]
						}
					},
					["2147426304"] = var_0_6[2],
					["187695726"] = var_0_6[154],
					["187695314"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695315"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695316"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695317"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695318"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695319"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695320"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695321"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695322"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695323"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695324"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695325"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695326"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695327"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695328"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695329"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695330"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695331"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695332"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695333"] = {
						linkedHighLevelState = var_0_6[156],
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
					["187695334"] = {
						linkedHighLevelState = var_0_6[156],
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
						converter = var_0_0[105],
						extraDefinition = var_0_6[50]
					},
					refreshOperatingMode = {
						converter = var_0_0[106],
						extraDefinition = var_0_6[50]
					},
					refreshTimeProgram = {
						converter = var_0_0[107],
						extraDefinition = var_0_6[50]
					},
					setTimeProgram = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[108],
						extraDefinition = var_0_6[80]
					}
				}
			}
		},
		["15"] = {
			["ovp:DHW2TemperatureSensorOnAuxiliaryCircuitOVPComponent"] = var_0_6[155]
		},
		["16"] = {
			["ovp:SwimmingPoolOnCircuitBOVPComponent"] = {
				type = 1,
				widget = "DeDietrichSwimmingPool",
				uiClass = "SwimmingPool",
				uiProfiles = var_0_6[28],
				states = {
					["187695336"] = var_0_6[83],
					["187695790"] = {
						linkedHighLevelState = {
							var_0_4[62]
						}
					},
					["187695742"] = var_0_6[84],
					["187695761"] = var_0_6[85],
					["2147426304"] = var_0_6[2],
					["187695709"] = var_0_6[157],
					["187695251"] = var_0_6[88],
					["187695252"] = var_0_6[89],
					["187695253"] = var_0_6[90],
					["187695254"] = var_0_6[91],
					["187695255"] = var_0_6[92],
					["187695256"] = var_0_6[93],
					["187695257"] = var_0_6[94],
					["187695258"] = var_0_6[95],
					["187695259"] = var_0_6[96],
					["187695260"] = var_0_6[97],
					["187695261"] = var_0_6[98],
					["187695262"] = var_0_6[99],
					["187695263"] = var_0_6[100],
					["187695264"] = var_0_6[101],
					["187695265"] = var_0_6[102],
					["187695266"] = var_0_6[103],
					["187695267"] = var_0_6[104],
					["187695268"] = var_0_6[105],
					["187695269"] = var_0_6[106],
					["187695270"] = var_0_6[107],
					["187695271"] = var_0_6[108]
				},
				commands = {
					autoMode = {
						converter = var_0_0[109],
						extraDefinition = var_0_6[80]
					},
					refreshActiveTimeProgram = var_0_6[109],
					refreshCircuitType = var_0_6[110],
					refreshComfortTemperature = {
						converter = var_0_0[110],
						extraDefinition = var_0_6[50]
					},
					refreshOperatingMode = var_0_6[111],
					refreshReducedTemperature = var_0_6[112],
					refreshTimeProgram = var_0_6[113],
					refreshWaterSensorValue = {
						converter = var_0_0[111],
						extraDefinition = var_0_6[50]
					},
					setActiveTimeProgram = var_0_6[114],
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[6],
						converter = var_0_0[112],
						extraDefinition = var_0_6[80]
					},
					setReducedTemperature = var_0_6[115],
					setTimeProgram = var_0_6[116]
				}
			}
		},
		["17"] = {
			["ovp:SwimmingPoolTemperatureSensorOnCircuitBOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[28],
				states = {
					["2147426304"] = var_0_6[2],
					["187695709"] = var_0_6[157]
				}
			}
		},
		["18"] = {
			["ovp:SwimmingPoolOnCircuitCOVPComponent"] = {
				type = 1,
				widget = "DeDietrichSwimmingPool",
				uiClass = "SwimmingPool",
				uiProfiles = var_0_6[28],
				states = {
					["187695337"] = var_0_6[117],
					["187695791"] = {
						linkedHighLevelState = {
							var_0_4[64]
						}
					},
					["187695743"] = var_0_6[118],
					["187695769"] = var_0_6[119],
					["2147426304"] = var_0_6[2],
					["187695710"] = var_0_6[158],
					["187695272"] = var_0_6[122],
					["187695273"] = var_0_6[123],
					["187695274"] = var_0_6[124],
					["187695275"] = var_0_6[125],
					["187695276"] = var_0_6[126],
					["187695277"] = var_0_6[127],
					["187695278"] = var_0_6[128],
					["187695279"] = var_0_6[129],
					["187695280"] = var_0_6[130],
					["187695281"] = var_0_6[131],
					["187695282"] = var_0_6[132],
					["187695283"] = var_0_6[133],
					["187695284"] = var_0_6[134],
					["187695285"] = var_0_6[135],
					["187695286"] = var_0_6[136],
					["187695287"] = var_0_6[137],
					["187695288"] = var_0_6[138],
					["187695289"] = var_0_6[139],
					["187695290"] = var_0_6[140],
					["187695291"] = var_0_6[141],
					["187695292"] = var_0_6[142]
				},
				commands = {
					autoMode = {
						converter = var_0_0[113],
						extraDefinition = var_0_6[80]
					},
					refreshActiveTimeProgram = var_0_6[143],
					refreshCircuitType = var_0_6[144],
					refreshComfortTemperature = {
						converter = var_0_0[114],
						extraDefinition = var_0_6[50]
					},
					refreshOperatingMode = var_0_6[145],
					refreshReducedTemperature = var_0_6[146],
					refreshTimeProgram = var_0_6[147],
					refreshWaterSensorValue = {
						converter = var_0_0[115],
						extraDefinition = var_0_6[50]
					},
					setActiveTimeProgram = var_0_6[148],
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[6],
						converter = var_0_0[116],
						extraDefinition = var_0_6[80]
					},
					setReducedTemperature = var_0_6[149],
					setTimeProgram = var_0_6[150]
				}
			}
		},
		["19"] = {
			["ovp:SwimmingPoolTemperatureSensorOnCircuitCOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[28],
				states = {
					["2147426304"] = var_0_6[2],
					["187695710"] = var_0_6[158]
				}
			}
		},
		["20"] = {
			["ovp:SolarCircuitOVPComponent"] = {
				type = 1,
				widget = "unknown",
				uiClass = "unknown",
				uiProfiles = var_0_6[47],
				states = var_0_6[159],
				commands = {
					refreshSoftwareVersion = {
						converter = var_0_0[117],
						extraDefinition = var_0_6[50]
					}
				}
			}
		},
		["21"] = {
			["ovp:CoolingCumulatedElectricalEnergyConsumptionSensor"] = var_0_6[160]
		},
		["22"] = {
			["ovp:DHWCumulatedElectricalEnergyConsumptionSensor"] = var_0_6[160]
		},
		["23"] = {
			["ovp:HeatingCumulatedElectricalEnergyConsumptionSensor"] = var_0_6[160]
		}
	},
	["16843019"] = {
		name = "Generic Modbus Gateway",
		localPairing = true,
		["0"] = var_0_6[161]
	},
	["17043211"] = {
		name = "Thermostat Cotherm ERD440-01",
		localPairing = true,
		["0"] = {
			["ovp:CothermThermostatOVPComponent"] = {
				type = 1,
				widget = "CothermThermostat",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[47],
				states = {
					["455344142"] = {
						linkedHighLevelState = {
							var_0_4[66]
						}
					},
					["455344143"] = {
						linkedHighLevelState = {
							var_0_4[67]
						}
					},
					["455344144"] = {
						linkedHighLevelState = {
							var_0_4[68]
						}
					},
					["455397376"] = {
						linkedHighLevelState = {
							var_0_4[69]
						}
					},
					["1"] = var_0_6[1],
					["455344157"] = {
						linkedHighLevelState = {
							var_0_4[70]
						}
					},
					["2147426304"] = var_0_6[2],
					["455381018"] = {
						linkedHighLevelState = {
							var_0_4[71]
						}
					},
					["455376922"] = {
						linkedHighLevelState = {
							var_0_4[72]
						}
					},
					["455344154"] = {
						linkedHighLevelState = {
							var_0_4[73]
						}
					},
					["455350016"] = {
						linkedHighLevelState = {
							var_0_4[74]
						}
					},
					["455350017"] = {
						linkedHighLevelState = {
							var_0_4[75]
						}
					},
					["455350018"] = {
						linkedHighLevelState = {
							var_0_4[76]
						}
					},
					["455350019"] = {
						linkedHighLevelState = {
							var_0_4[77]
						}
					},
					["455350020"] = {
						linkedHighLevelState = {
							var_0_4[78]
						}
					},
					["455350021"] = {
						linkedHighLevelState = {
							var_0_4[79]
						}
					},
					["455350022"] = {
						linkedHighLevelState = {
							var_0_4[80]
						}
					},
					["455350272"] = {
						linkedHighLevelState = {
							var_0_4[81]
						}
					},
					["455350273"] = {
						linkedHighLevelState = {
							var_0_4[82]
						}
					},
					["455350274"] = {
						linkedHighLevelState = {
							var_0_4[83]
						}
					},
					["455350275"] = {
						linkedHighLevelState = {
							var_0_4[84]
						}
					},
					["455350276"] = {
						linkedHighLevelState = {
							var_0_4[85]
						}
					},
					["455350277"] = {
						linkedHighLevelState = {
							var_0_4[86]
						}
					},
					["455350278"] = {
						linkedHighLevelState = {
							var_0_4[87]
						}
					},
					["455350528"] = {
						linkedHighLevelState = {
							var_0_4[88]
						}
					},
					["455350529"] = {
						linkedHighLevelState = {
							var_0_4[89]
						}
					},
					["455350530"] = {
						linkedHighLevelState = {
							var_0_4[90]
						}
					},
					["455350531"] = {
						linkedHighLevelState = {
							var_0_4[91]
						}
					},
					["455350532"] = {
						linkedHighLevelState = {
							var_0_4[92]
						}
					},
					["455350533"] = {
						linkedHighLevelState = {
							var_0_4[93]
						}
					},
					["455350534"] = {
						linkedHighLevelState = {
							var_0_4[94]
						}
					},
					["455381027"] = {
						linkedHighLevelState = {
							var_0_4[95]
						}
					},
					["455376931"] = {
						linkedHighLevelState = {
							var_0_4[96]
						}
					},
					["455344163"] = {
						linkedHighLevelState = {
							var_0_4[97]
						}
					},
					["455381006"] = {
						linkedHighLevelState = {
							var_0_4[98]
						}
					},
					["455376910"] = {
						linkedHighLevelState = {
							var_0_4[99]
						}
					},
					["455397385"] = {
						linkedHighLevelState = {
							var_0_4[100]
						}
					},
					["455397378"] = {
						linkedHighLevelState = {
							var_0_4[101]
						}
					},
					["455381005"] = {
						linkedHighLevelState = {
							var_0_4[102]
						}
					},
					["455376909"] = {
						linkedHighLevelState = {
							var_0_4[103]
						}
					},
					["455344141"] = {
						linkedHighLevelState = {
							var_0_4[104]
						}
					},
					["455397386"] = {
						linkedHighLevelState = {
							var_0_4[105]
						}
					},
					["455381017"] = {
						linkedHighLevelState = {
							var_0_4[106]
						}
					},
					["455376921"] = {
						linkedHighLevelState = {
							var_0_4[107]
						}
					},
					["455344153"] = {
						linkedHighLevelState = {
							var_0_4[108]
						}
					},
					["455381007"] = {
						linkedHighLevelState = {
							var_0_4[109]
						}
					},
					["455376911"] = {
						linkedHighLevelState = {
							var_0_4[110]
						}
					},
					["455381015"] = {
						linkedHighLevelState = {
							var_0_4[111]
						}
					},
					["455376919"] = {
						linkedHighLevelState = {
							var_0_4[112]
						}
					},
					["455344151"] = {
						linkedHighLevelState = {
							var_0_4[113]
						}
					},
					["455397382"] = {
						linkedHighLevelState = {
							var_0_4[114]
						}
					},
					["455405570"] = {
						linkedHighLevelState = {
							var_0_4[115]
						}
					},
					["455381008"] = {
						linkedHighLevelState = {
							var_0_4[116]
						}
					},
					["455376912"] = {
						linkedHighLevelState = {
							var_0_4[117]
						}
					},
					["455381016"] = {
						linkedHighLevelState = {
							var_0_4[118]
						}
					},
					["455376920"] = {
						linkedHighLevelState = {
							var_0_4[119]
						}
					},
					["455344152"] = {
						linkedHighLevelState = {
							var_0_4[120]
						}
					},
					["455381036"] = {
						linkedHighLevelState = {
							var_0_4[121]
						}
					},
					["455376940"] = {
						linkedHighLevelState = {
							var_0_4[122]
						}
					},
					["455344172"] = {
						linkedHighLevelState = {
							var_0_4[123]
						}
					},
					["455381035"] = {
						linkedHighLevelState = {
							var_0_4[124]
						}
					},
					["455376939"] = {
						linkedHighLevelState = {
							var_0_4[125]
						}
					},
					["455344171"] = {
						linkedHighLevelState = {
							var_0_4[126]
						}
					},
					["455397377"] = {
						linkedHighLevelState = {
							var_0_4[127]
						}
					},
					["455381021"] = {
						linkedHighLevelState = {
							var_0_4[128]
						}
					},
					["455376925"] = {
						linkedHighLevelState = {
							var_0_4[129]
						}
					},
					["455405568"] = {
						linkedHighLevelState = {
							var_0_4[130]
						}
					},
					["455405569"] = {
						linkedHighLevelState = {
							var_0_4[131]
						}
					},
					["455381033"] = {
						linkedHighLevelState = {
							var_0_4[132]
						}
					},
					["455376937"] = {
						linkedHighLevelState = {
							var_0_4[133]
						}
					},
					["455344169"] = {
						linkedHighLevelState = {
							var_0_4[134]
						}
					},
					["455381009"] = {
						linkedHighLevelState = {
							var_0_4[135]
						}
					},
					["455376913"] = {
						linkedHighLevelState = {
							var_0_4[136]
						}
					},
					["455344145"] = {
						linkedHighLevelState = {
							var_0_4[137]
						}
					},
					["455381034"] = {
						linkedHighLevelState = {
							var_0_4[138]
						}
					},
					["455376938"] = {
						linkedHighLevelState = {
							var_0_4[139]
						}
					},
					["455344170"] = {
						linkedHighLevelState = {
							var_0_4[140]
						}
					},
					["455405572"] = {
						linkedHighLevelState = {
							var_0_4[141]
						}
					},
					["455381037"] = {
						linkedHighLevelState = {
							var_0_4[142]
						}
					},
					["455376941"] = {
						linkedHighLevelState = {
							var_0_4[143]
						}
					},
					["455344173"] = {
						linkedHighLevelState = {
							var_0_4[144]
						}
					},
					["455405571"] = {
						linkedHighLevelState = {
							var_0_4[145]
						}
					},
					["455348224"] = {
						linkedHighLevelState = {
							var_0_4[146]
						}
					},
					["455348225"] = {
						linkedHighLevelState = {
							var_0_4[147]
						}
					},
					["455348226"] = {
						linkedHighLevelState = {
							var_0_4[148]
						}
					},
					["455348227"] = {
						linkedHighLevelState = {
							var_0_4[149]
						}
					},
					["455348228"] = {
						linkedHighLevelState = {
							var_0_4[150]
						}
					},
					["455348229"] = {
						linkedHighLevelState = {
							var_0_4[151]
						}
					},
					["455348230"] = {
						linkedHighLevelState = {
							var_0_4[152]
						}
					}
				},
				commands = {
					getName = var_0_6[3],
					identify = var_0_6[4],
					refreshAbscenceTime = {
						converter = var_0_0[132],
						extraDefinition = var_0_6[162]
					},
					refreshAbscenceTimeMax = {
						converter = var_0_0[133],
						extraDefinition = var_0_6[162]
					},
					refreshAbscenceTimeMin = {
						converter = var_0_0[134],
						extraDefinition = var_0_6[162]
					},
					refreshBabyCareFunctionActivation = {
						converter = var_0_0[135],
						extraDefinition = var_0_6[162]
					},
					refreshBabyCareFunctionActivationMax = {
						converter = var_0_0[136],
						extraDefinition = var_0_6[162]
					},
					refreshBabyCareFunctionActivationMin = {
						converter = var_0_0[137],
						extraDefinition = var_0_6[162]
					},
					refreshComfortTemperature = {
						converter = var_0_0[138],
						extraDefinition = var_0_6[162]
					},
					refreshComfortTemperatureMax = {
						converter = var_0_0[139],
						extraDefinition = var_0_6[162]
					},
					refreshComfortTemperatureMin = {
						converter = var_0_0[140],
						extraDefinition = var_0_6[162]
					},
					refreshConsignRegul = {
						converter = var_0_0[141],
						extraDefinition = var_0_6[162]
					},
					refreshCountDetectPresence = {
						converter = var_0_0[142],
						extraDefinition = var_0_6[162]
					},
					refreshCurrentState = {
						converter = var_0_0[143],
						extraDefinition = var_0_6[162]
					},
					refreshCurrentStateMax = {
						converter = var_0_0[144],
						extraDefinition = var_0_6[162]
					},
					refreshCurrentStateMin = {
						converter = var_0_0[145],
						extraDefinition = var_0_6[162]
					},
					refreshCycleReport = {
						converter = var_0_0[146],
						extraDefinition = var_0_6[162]
					},
					refreshDurationEnergyCounter = {
						converter = var_0_0[147],
						extraDefinition = var_0_6[162]
					},
					refreshDurationEnergyCounterMax = {
						converter = var_0_0[148],
						extraDefinition = var_0_6[162]
					},
					refreshDurationEnergyCounterMin = {
						converter = var_0_0[149],
						extraDefinition = var_0_6[162]
					},
					refreshEcoTemperature = {
						converter = var_0_0[150],
						extraDefinition = var_0_6[162]
					},
					refreshEcoTemperatureMax = {
						converter = var_0_0[151],
						extraDefinition = var_0_6[162]
					},
					refreshEcoTemperatureMin = {
						converter = var_0_0[152],
						extraDefinition = var_0_6[162]
					},
					refreshElectricPower = {
						converter = var_0_0[153],
						extraDefinition = var_0_6[162]
					},
					refreshElectricPowerMax = {
						converter = var_0_0[154],
						extraDefinition = var_0_6[162]
					},
					refreshElectricPowerMin = {
						converter = var_0_0[155],
						extraDefinition = var_0_6[162]
					},
					refreshErrorThermostat = {
						converter = var_0_0[156],
						extraDefinition = var_0_6[162]
					},
					refreshFirmwareVersion = {
						converter = var_0_0[157],
						extraDefinition = var_0_6[162]
					},
					refreshFrostProtectionTemperature = {
						converter = var_0_0[158],
						extraDefinition = var_0_6[162]
					},
					refreshFrostProtectionTemperatureMax = {
						converter = var_0_0[159],
						extraDefinition = var_0_6[162]
					},
					refreshFrostProtectionTemperatureMin = {
						converter = var_0_0[160],
						extraDefinition = var_0_6[162]
					},
					refreshHoursEnergyCounter = {
						converter = var_0_0[161],
						extraDefinition = var_0_6[162]
					},
					refreshHoursEnergyCounterMax = {
						converter = var_0_0[162],
						extraDefinition = var_0_6[162]
					},
					refreshHoursEnergyCounterMin = {
						converter = var_0_0[163],
						extraDefinition = var_0_6[162]
					},
					refreshLockedUnlockedButton = {
						converter = var_0_0[164],
						extraDefinition = var_0_6[162]
					},
					refreshMiniboxHolidayMode = {
						converter = var_0_0[165],
						extraDefinition = var_0_6[162]
					},
					refreshMiniboxHolidayModeMax = {
						converter = var_0_0[166],
						extraDefinition = var_0_6[162]
					},
					refreshMiniboxHolidayModeMin = {
						converter = var_0_0[167],
						extraDefinition = var_0_6[162]
					},
					refreshMiniboxProgMode = {
						converter = var_0_0[168],
						extraDefinition = var_0_6[162]
					},
					refreshMiniboxProgModeMax = {
						converter = var_0_0[169],
						extraDefinition = var_0_6[162]
					},
					refreshMiniboxProgModeMin = {
						converter = var_0_0[170],
						extraDefinition = var_0_6[162]
					},
					refreshNbSecAfterLastDetect = {
						converter = var_0_0[171],
						extraDefinition = var_0_6[162]
					},
					refreshOpenWindowDetectionActivation = {
						converter = var_0_0[172],
						extraDefinition = var_0_6[162]
					},
					refreshOpenWindowDetectionActivationMax = {
						converter = var_0_0[173],
						extraDefinition = var_0_6[162]
					},
					refreshOpenWindowDetectionActivationMin = {
						converter = var_0_0[174],
						extraDefinition = var_0_6[162]
					},
					refreshProductType = {
						converter = var_0_0[175],
						extraDefinition = var_0_6[162]
					},
					refreshProductVersion = {
						converter = var_0_0[176],
						extraDefinition = var_0_6[162]
					},
					refreshRoomTemperature = {
						converter = var_0_0[177],
						extraDefinition = var_0_6[162]
					},
					refreshRoomTemperatureMax = {
						converter = var_0_0[178],
						extraDefinition = var_0_6[162]
					},
					refreshRoomTemperatureMin = {
						converter = var_0_0[179],
						extraDefinition = var_0_6[162]
					},
					refreshTechnicalOffset = {
						converter = var_0_0[180],
						extraDefinition = var_0_6[162]
					},
					refreshTechnicalOffsetMax = {
						converter = var_0_0[181],
						extraDefinition = var_0_6[162]
					},
					refreshTechnicalOffsetMin = {
						converter = var_0_0[182],
						extraDefinition = var_0_6[162]
					},
					refreshTemporaryTemperature = {
						converter = var_0_0[183],
						extraDefinition = var_0_6[162]
					},
					refreshTemporaryTemperatureMax = {
						converter = var_0_0[184],
						extraDefinition = var_0_6[162]
					},
					refreshTemporaryTemperatureMin = {
						converter = var_0_0[185],
						extraDefinition = var_0_6[162]
					},
					refreshThermostatRTC = {
						converter = var_0_0[186],
						extraDefinition = var_0_6[162]
					},
					refreshTimer2h = {
						converter = var_0_0[187],
						extraDefinition = var_0_6[162]
					},
					refreshTimer2hMax = {
						converter = var_0_0[188],
						extraDefinition = var_0_6[162]
					},
					refreshTimer2hMin = {
						converter = var_0_0[189],
						extraDefinition = var_0_6[162]
					},
					refreshUniqueSTChipId = {
						converter = var_0_0[190],
						extraDefinition = var_0_6[162]
					},
					setAbscenceTime = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[191],
						extraDefinition = var_0_6[163]
					},
					setAutoProgW1J1 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[192],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW1J2 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[193],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW1J3 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[194],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW1J4 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[195],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW1J5 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[196],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW1J6 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[197],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW1J7 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[198],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW2J1 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[199],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW2J2 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[200],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW2J3 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[201],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW2J4 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[202],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW2J5 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[203],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW2J6 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[204],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW2J7 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[205],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW3J1 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[206],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW3J2 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[207],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW3J3 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[208],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW3J4 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[209],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW3J5 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[210],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW3J6 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[211],
						extraDefinition = var_0_6[162]
					},
					setAutoProgW3J7 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[212],
						extraDefinition = var_0_6[162]
					},
					setBabyCareFunctionActivation = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[213],
						extraDefinition = var_0_6[163]
					},
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[6],
						converter = var_0_0[214],
						extraDefinition = var_0_6[163]
					},
					setConsignRegul = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[215],
						extraDefinition = var_0_6[163]
					},
					setCountDetectPresence = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[216],
						extraDefinition = var_0_6[163]
					},
					setCurrentState = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[217],
						extraDefinition = var_0_6[163]
					},
					setCycleReport = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[218],
						extraDefinition = var_0_6[163]
					},
					setDurationEnergyCounter = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[219],
						extraDefinition = var_0_6[163]
					},
					setEcoTemperature = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[220],
						extraDefinition = var_0_6[163]
					},
					setElectricPower = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[221],
						extraDefinition = var_0_6[163]
					},
					setErrorThermostat = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[222],
						extraDefinition = var_0_6[163]
					},
					setFrostProtectionTemperature = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[223],
						extraDefinition = var_0_6[163]
					},
					setHoursEnergyCounter = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[224],
						extraDefinition = var_0_6[163]
					},
					setLockedUnlockedButton = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[225],
						extraDefinition = var_0_6[163]
					},
					setMiniboxHolidayMode = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[226],
						extraDefinition = var_0_6[163]
					},
					setMiniboxProgMode = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[227],
						extraDefinition = var_0_6[163]
					},
					setName = var_0_6[8],
					setNbSecAfterLastDetect = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[228],
						extraDefinition = var_0_6[163]
					},
					setOpenWindowDetectionActivation = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[229],
						extraDefinition = var_0_6[163]
					},
					setRoomTemperature = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[230],
						extraDefinition = var_0_6[163]
					},
					setTechnicalOffset = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[231],
						extraDefinition = var_0_6[163]
					},
					setTemporaryTemperature = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[232],
						extraDefinition = var_0_6[163]
					},
					setThermostatRTC = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[233],
						extraDefinition = var_0_6[163]
					},
					setTimer2h = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[234],
						extraDefinition = var_0_6[163]
					},
					setUserProgJ1 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[235],
						extraDefinition = var_0_6[162]
					},
					setUserProgJ2 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[236],
						extraDefinition = var_0_6[162]
					},
					setUserProgJ3 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[237],
						extraDefinition = var_0_6[162]
					},
					setUserProgJ4 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[238],
						extraDefinition = var_0_6[162]
					},
					setUserProgJ5 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[239],
						extraDefinition = var_0_6[162]
					},
					setUserProgJ6 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[240],
						extraDefinition = var_0_6[162]
					},
					setUserProgJ7 = {
						prototype = "any",
						parameters = var_0_6[6],
						converter = var_0_0[241],
						extraDefinition = var_0_6[162]
					}
				}
			}
		}
	},
	["4295098368"] = {
		name = "Temperature Inside Sensor",
		localPairing = true,
		["0"] = {
			["ovp:InsideTemperatureSensorOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[28],
				states = {
					["2415919105"] = var_0_6[164],
					["2415919110"] = var_0_6[165],
					["2147426304"] = var_0_6[48],
					["2415919106"] = {
						linkedHighLevelState = {
							var_0_4[155]
						}
					}
				},
				commands = {
					getName = var_0_6[166],
					setName = var_0_6[167]
				}
			}
		}
	},
	["1099511628043"] = {
		name = "KizOTherm Bridge v2",
		localPairing = true,
		["1"] = var_0_6[168],
		["2"] = var_0_6[169],
		["3"] = var_0_6[170],
		["4"] = var_0_6[171],
		["5"] = var_0_6[172]
	},
	["1099512610827"] = {
		name = "Switch On/Off (IMHOTEP)",
		localPairing = true,
		["0"] = {
			["ovp:OnOffOVPComponent"] = {
				type = 1,
				widget = "StatefulOnOff",
				uiClass = "OnOff",
				uiProfiles = var_0_6[36],
				states = {
					["1"] = var_0_6[1],
					["16830720"] = {
						linkedHighLevelState = {
							var_0_4[173]
						}
					},
					["2147426304"] = var_0_6[2]
				},
				commands = {
					getName = var_0_6[3],
					identify = var_0_6[4],
					setName = var_0_6[8],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = var_0_6[6],
						converter = var_0_0[253],
						extraDefinition = var_0_6[7]
					},
					off = {
						parameters = var_0_6[37],
						converter = var_0_0[253],
						extraDefinition = var_0_6[7]
					},
					on = {
						parameters = var_0_6[38],
						converter = var_0_0[253],
						extraDefinition = var_0_6[7]
					}
				}
			}
		}
	},
	["1099513069579"] = {
		name = "Generic HLink Gateway",
		localPairing = true,
		["0"] = {
			["ovp:HLinkMainController"] = {
				type = 1,
				widget = "HitachiAirToAirHeatPump",
				uiClass = "HitachiHeatingSystem",
				uiProfiles = var_0_6[32],
				states = {
					["core:AutoManuModeState"] = {
						linkedHighLevelState = {
							var_0_4[174]
						}
					},
					["core:HolidaysModeState"] = {
						linkedHighLevelState = {
							var_0_4[175]
						}
					},
					["1"] = var_0_6[1],
					["2147426304"] = var_0_6[2],
					["185401345"] = {
						linkedHighLevelState = {
							var_0_4[176],
							var_0_4[179]
						},
						linkedStateIds = {
							"185401347"
						}
					},
					["185401347"] = {
						linkedHighLevelState = {
							var_0_4[176],
							var_0_4[182]
						},
						linkedStateIds = {
							"185401345"
						}
					},
					["185401857"] = {
						linkedHighLevelState = {
							var_0_4[177]
						}
					},
					["185401344"] = {
						linkedHighLevelState = {
							var_0_4[178]
						}
					},
					["185401602"] = {
						linkedHighLevelState = {
							var_0_4[180]
						}
					},
					["185401600"] = {
						linkedHighLevelState = {
							var_0_4[181]
						}
					},
					["185402113"] = {
						linkedHighLevelState = {
							var_0_4[183]
						}
					}
				},
				commands = {
					getName = var_0_6[3],
					globalControl = {
						prototype = "string(On;Off)|string(off;on),integer,string(auto;hi;med;lo;silent),string(auto;heating;dehumidify;cooling;fan;circulator),*string(timer;manu;holidays)",
						parameters = {
							var_0_6[5],
							var_0_6[34],
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
						converter = var_0_0[265],
						extraDefinition = {
							access = "w",
							parameterId = "185466879"
						}
					},
					identify = var_0_6[4],
					setMainOperation = {
						prototype = "string(On;Off)|string(off;on)",
						parameters = var_0_6[6],
						converter = var_0_0[266],
						extraDefinition = {
							access = "w",
							parameterId = "185401344"
						}
					},
					setName = var_0_6[8]
				}
			}
		}
	},
	["1099515035650"] = {
		name = "Electrical heater (SOMFY Pilot Wire Module)",
		localPairing = true,
		["0"] = {
			["ovp:SomfyPilotWireElectricalHeaterOVPComponent"] = {
				type = 1,
				widget = "SomfyPilotWireElectricalHeater",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[39],
				states = {
					["83935233"] = var_0_6[173],
					["1"] = var_0_6[1],
					["16830720"] = var_0_6[40],
					["2147426304"] = var_0_6[2],
					["65547"] = var_0_6[41],
					["65548"] = var_0_6[42]
				},
				commands = {
					getName = var_0_6[3],
					identify = var_0_6[4],
					off = var_0_6[43],
					refreshHeatingLevel = var_0_6[17],
					refreshIdentifier = var_0_6[174],
					setHeatingLevel = var_0_6[44],
					setHeatingLevelForTrigger = var_0_6[45],
					setName = var_0_6[8],
					setTimerForTransitoryState = var_0_6[46]
				}
			}
		}
	},
	["1099528470795"] = {
		name = "Generic Modbus Gateway V2",
		localPairing = true,
		["0"] = var_0_6[161]
	},
	["1103806726146"] = {
		name = "Temperature Inside Sensor (SOMFY Pilot Wire Heating Interface)",
		localPairing = true,
		["1"] = {
			["ovp:SomfyPilotWireTemperatureSensorOVPComponent"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[28],
				states = {
					["2415919105"] = var_0_6[164],
					["2415919110"] = var_0_6[165],
					["2147426304"] = var_0_6[48],
					["2415919106"] = {
						linkedHighLevelState = {
							var_0_4[185]
						}
					}
				},
				commands = {
					getName = var_0_6[166],
					refreshTemperature = var_0_6[175],
					setName = var_0_6[167]
				}
			}
		},
		["2"] = {
			["ovp:SomfyPilotWireHeatingInterfaceOVPComponent"] = {
				type = 1,
				widget = "SomfyPilotWireHeatingInterface",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[35],
				states = {
					["2415919110"] = {
						linkedHighLevelState = {
							var_0_4[186]
						}
					},
					["83935233"] = var_0_6[173],
					["2415919105"] = var_0_6[164],
					["33620224"] = {
						linkedHighLevelState = {
							var_0_4[187],
							var_0_4[188],
							var_0_4[189]
						}
					},
					["2147426304"] = var_0_6[48]
				},
				commands = {
					getName = var_0_6[166],
					identify = var_0_6[4],
					refreshActiveMode = var_0_6[176],
					refreshBatteryLevel = var_0_6[175],
					refreshIdentifier = var_0_6[174],
					refreshOnOffState = var_0_6[176],
					refreshSetPointMode = var_0_6[176],
					setActiveMode = {
						prototype = "string(auto;manu)",
						parameters = var_0_6[6],
						converter = var_0_0[274],
						extraDefinition = var_0_6[177]
					},
					setName = var_0_6[167],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = var_0_6[6],
						converter = var_0_0[275],
						extraDefinition = var_0_6[177]
					},
					setSetPointMode = {
						prototype = "string(comfort;eco;secured)",
						parameters = var_0_6[6],
						converter = var_0_0[276],
						extraDefinition = var_0_6[177]
					}
				}
			}
		}
	},
	["2199023255819"] = {
		name = "KizOTherm Bridge v2-1",
		localPairing = true,
		["1"] = var_0_6[168],
		["2"] = var_0_6[169],
		["3"] = var_0_6[170],
		["4"] = var_0_6[171],
		["5"] = var_0_6[172]
	}
}
