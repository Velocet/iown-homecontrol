var_0_0 = {
	function(arg_1_0)
		return depends("io-utils").computeDiscreteRSSILevel(arg_1_0)
	end,
	function(arg_2_0)
		return depends("io-utils").toPercentValue(arg_2_0)
	end,
	function(arg_3_0)
		return depends("io-utils").fromRawName(arg_3_0)
	end,
	function(arg_4_0)
		if arg_4_0 >= -50 then
			return 100
		elseif arg_4_0 < -100 then
			return 0
		else
			return 2 * (arg_4_0 + 100)
		end
	end,
	function(arg_5_0)
		return depends("io-utils").fromRawStatusState(arg_5_0)
	end,
	function(arg_6_0)
		return depends("io-utils").getSoftwareVersionFromRawGeneralInfo(bytearray(arg_6_0, "base64"))
	end,
	function(arg_7_0)
		return depends("io-utils").fromRawManufacturer(arg_7_0)
	end,
	function(arg_8_0, arg_8_1)
		return depends("io-utils").readActivateFunc({})
	end,
	function(arg_9_0)
		return depends("io-utils").createWinkValue(false, arg_9_0)
	end,
	function()
		return depends("io-utils").createWinkValue(true, 3)
	end,
	function(arg_11_0, arg_11_1)
		return depends("io-utils").handleOneWayController(arg_11_0, arg_11_1, 0)
	end,
	function(arg_12_0)
		return arg_12_0 * 512
	end,
	function(arg_13_0)
		return depends("io-utils").toRawName(arg_13_0), nil, nil, {
			access = "r"
		}
	end,
	function()
		return depends("io-utils").createWinkValue(true, "forever")
	end,
	function()
		return depends("io-utils").createWinkValue(false)
	end,
	function()
		return 1
	end,
	function(arg_17_0, arg_17_1)
		return depends("io-utils").handleOneWayController(arg_17_0, arg_17_1, 1)
	end,
	function(arg_18_0)
		if arg_18_0 == "configuration" then
			return 0
		elseif arg_18_0 == "virgin" then
			return 1
		elseif arg_18_0 == "close" then
			return 2
		elseif arg_18_0 == "transmitting" then
			return 3
		end
	end,
	function(arg_19_0)
		return depends("io-utils").createWinkValue(true, arg_19_0)
	end,
	function(arg_20_0)
		if arg_20_0 == 51200 then
			return "closed"
		else
			return "open"
		end
	end,
	function(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
		return depends("io-utils").toPercentTargetValue(arg_21_0, arg_21_1, {
			[55296] = arg_21_2,
			[55306] = arg_21_3
		})
	end,
	function(arg_22_0)
		return bit.band(arg_22_0, 7)
	end,
	function(arg_23_0)
		if arg_23_0 == 4 then
			return true
		else
			return false
		end
	end,
	function(arg_24_0)
		return arg_24_0 * 512
	end,
	function(arg_25_0, arg_25_1)
		return depends("io-utils").createActivateFunc(arg_25_0 * 512, {
			{
				1,
				arg_25_1 * 512
			}
		})
	end,
	function(arg_26_0)
		return depends("io-utils").createActivateFunc(nil, {
			{
				1,
				arg_26_0 * 512
			}
		})
	end,
	function(arg_27_0)
		if type(arg_27_0) == "string" then
			if arg_27_0 == "memorized1" or arg_27_0 == "my" then
				return 55296
			elseif arg_27_0 == "secured" then
				return 55306
			end
		else
			return arg_27_0 * 512
		end
	end,
	function()
		return depends("io-utils").createActivateFunc(53760, {
			{
				1,
				53760
			}
		})
	end,
	function(arg_29_0)
		return depends("io-utils").motorRelativePositionToDiscreteOpenClosed(arg_29_0)
	end,
	function(arg_30_0)
		return nil
	end,
	function(arg_31_0)
		return depends("io-utils").updateAdditionalStatusState(arg_31_0)
	end,
	function()
		return bytearray({
			1,
			1
		})
	end,
	function(arg_33_0, arg_33_1)
		error("Unknown command name : " .. arg_33_0)
	end,
	function()
		return 53760
	end,
	function()
		return bytearray({
			2,
			1
		})
	end,
	function()
		return 1
	end,
	function(arg_37_0)
		if arg_37_0 == 55307 then
			return "rocker"
		else
			return depends("io-utils").toPercentValue(arg_37_0)
		end
	end,
	function(arg_38_0)
		if arg_38_0 == 55307 then
			return 100
		else
			return depends("io-utils").toPercentValue(arg_38_0)
		end
	end,
	function(arg_39_0, arg_39_1)
		var_39_0 = depends("io-utils")
		
		if type(arg_39_0) == "string" then
			if arg_39_0 == "rocker" then
				return var_39_0.createActivateFunc(55307, {
					{
						3,
						arg_39_1 * 512
					}
				})
			end
		elseif type(arg_39_0) == "number" then
			return var_39_0.createActivateFunc(arg_39_0 * 512)
		end
		
		return nil
	end,
	function(arg_40_0)
		if type(arg_40_0) == "string" and arg_40_0 == "rocker" then
			return 55307
		end
		
		if type(arg_40_0) == "number" then
			return arg_40_0 * 512
		end
		
		return nil
	end,
	function(arg_41_0)
		return depends("io-utils").createActivateFunc(nil, {
			{
				3,
				arg_41_0 * 512
			}
		})
	end,
	function()
		return depends("io-utils").createActivateFunc(53760, {
			{
				3,
				53760
			}
		})
	end,
	function(arg_43_0, arg_43_1)
		return depends("io-utils").createActivateFunc(arg_43_0 * 512, {
			{
				9,
				arg_43_1 * 512
			}
		})
	end,
	function(arg_44_0)
		return depends("io-utils").createActivateFunc(nil, {
			{
				9,
				arg_44_0 * 512
			}
		})
	end,
	function()
		return depends("io-utils").createActivateFunc(53760, {
			{
				9,
				53760
			}
		})
	end,
	function(arg_46_0)
		if type(arg_46_0) == "string" then
			if arg_46_0 == "secured" then
				return 55306
			end
		else
			return arg_46_0 * 512
		end
	end,
	function(arg_47_0)
		if arg_47_0 == 54272 then
			return nil
		else
			return depends("io-utils").toPercentValue(arg_47_0)
		end
	end,
	function(arg_48_0)
		if arg_48_0 == 54272 then
			return "unknown"
		end
		
		return depends("io-utils").motorRelativePositionToDiscreteOpenClosed(arg_48_0)
	end,
	function()
		return 51200
	end,
	function()
		return 0
	end,
	function(arg_51_0)
		return depends("io-utils").toPercentValue(51200 - arg_51_0)
	end,
	function(arg_52_0)
		if arg_52_0 == 51200 then
			return "off"
		else
			return "on"
		end
	end,
	function(arg_53_0)
		return depends("io-utils").createActivateFunc((100 - arg_53_0) * 512, {
			{
				1,
				54016
			}
		}), {
			category = "lighting"
		}
	end,
	function(arg_54_0)
		if arg_54_0 == "on" then
			return 100
		else
			return 0
		end
	end,
	function(arg_55_0, arg_55_1, arg_55_2)
		var_55_0 = depends("io-utils")
		
		if arg_55_2 == nil then
			arg_55_2 = 0
		end
		
		var_55_1 = var_55_0.createActivateFunc((100 - arg_55_0) * 512, {
			{
				1,
				54016
			}
		})
		var_55_2 = var_55_0.createActivateFunc((100 - arg_55_2) * 512, {
			{
				1,
				54016
			}
		})
		
		return var_55_1, {
			category = "lighting"
		}, var_55_2, {
			category = "lighting",
			delay = arg_55_1
		}
	end,
	function(arg_56_0)
		return {
			100,
			arg_56_0,
			0
		}
	end,
	function(arg_57_0)
		return (100 - arg_57_0) * 512
	end,
	function(arg_58_0)
		if type(arg_58_0) == "string" then
			if arg_58_0 == "memorized1" or arg_58_0 == "my" then
				return 55296
			elseif arg_58_0 == "secured" then
				return 55306
			end
		else
			return (100 - arg_58_0) * 512
		end
	end,
	function(arg_59_0)
		if arg_59_0 > 0 then
			return "off"
		else
			return "on"
		end
	end,
	function(arg_60_0)
		if arg_60_0 == "on" then
			return 0
		else
			return 51200
		end
	end,
	function(arg_61_0, arg_61_1, arg_61_2)
		if arg_61_0 == nil or arg_61_1 == nil or arg_61_2 == nil then
			return overkiz.magic.IGNORE
		end
		
		var_61_0, var_61_1, var_61_2 = depends("io-utils").vectorToRGB(arg_61_0 / 51200, arg_61_1 / 51200, (51200 - arg_61_2) * 100 / 51200)
		
		return var_61_2
	end,
	function(arg_62_0, arg_62_1, arg_62_2)
		if arg_62_0 == nil or arg_62_1 == nil or arg_62_2 == nil then
			return overkiz.magic.IGNORE
		end
		
		var_62_0, var_62_1, var_62_2 = depends("io-utils").vectorToRGB(arg_62_0 / 51200, arg_62_1 / 51200, (51200 - arg_62_2) * 100 / 51200)
		
		return var_62_1
	end,
	function(arg_63_0, arg_63_1, arg_63_2)
		if arg_63_0 == nil or arg_63_1 == nil or arg_63_2 == nil then
			return overkiz.magic.IGNORE
		end
		
		var_63_0, var_63_1, var_63_2 = depends("io-utils").vectorToRGB(arg_63_0 / 51200, arg_63_1 / 51200, (51200 - arg_63_2) * 100 / 51200)
		
		return var_63_0
	end,
	function(arg_64_0, arg_64_1, arg_64_2)
		var_64_0 = depends("io-utils")
		var_64_1, var_64_2, var_64_3 = var_64_0.RGBToVector(arg_64_0, arg_64_1, arg_64_2)
		
		return var_64_0.createActivateFunc((100 - var_64_3) * 512, {
			{
				10,
				var_64_1 * 51200
			},
			{
				11,
				var_64_2 * 51200
			}
		}), {
			category = "lighting"
		}
	end,
	function(arg_65_0, arg_65_1, arg_65_2, arg_65_3)
		var_65_0 = depends("io-utils")
		var_65_1, var_65_2, var_65_3 = var_65_0.RGBToVector(arg_65_0, arg_65_1, arg_65_2)
		var_65_4 = var_65_0.createActivateFunc((100 - var_65_3) * 512, {
			{
				10,
				var_65_1 * 51200
			},
			{
				11,
				var_65_2 * 51200
			}
		})
		var_65_5 = var_65_0.createActivateFunc(51200, {
			{
				1,
				54016
			}
		})
		
		return var_65_4, {
			category = "lighting"
		}, var_65_5, {
			category = "lighting",
			delay = arg_65_3
		}
	end,
	function(arg_66_0)
		return depends("common", "utils").round(arg_66_0 * 4500 / 51200 + 2000)
	end,
	function(arg_67_0, arg_67_1)
		return depends("io-utils").createActivateFunc(arg_67_1, {
			{
				14,
				(arg_67_0 - 2000) / 4500 * 51200
			}
		})
	end,
	function(arg_68_0)
		if arg_68_0 > 0 then
			return "off"
		else
			return "on"
		end
	end,
	function(arg_69_0)
		return 0, {
			category = "lighting"
		}, 51200, {
			category = "lighting",
			delay = arg_69_0
		}
	end,
	function(arg_70_0)
		var_70_0 = nil
		
		return arg_70_0 == "on" and 0 or 51200, {
			category = "lighting"
		}
	end,
	function(arg_71_0)
		if arg_71_0 == 54272 then
			return nil
		elseif arg_71_0 == 55303 then
			return nil
		else
			return depends("io-utils").toPercentValue(arg_71_0)
		end
	end,
	function(arg_72_0, arg_72_1, arg_72_2)
		return depends("io-utils").toOpenClosedPedestrianState(arg_72_0, arg_72_1, arg_72_2)
	end,
	function(arg_73_0)
		if type(arg_73_0) == "string" and arg_73_0 == "pedestrian" then
			return 55303
		end
		
		if type(arg_73_0) == "number" then
			return arg_73_0 * 512
		end
		
		return nil
	end,
	function()
		return 55303
	end,
	function(arg_75_0)
		if arg_75_0 > 0 then
			return "locked"
		else
			return "unlocked"
		end
	end,
	function(arg_76_0)
		if arg_76_0 > 0 then
			return "closed"
		else
			return "open"
		end
	end,
	function(arg_77_0)
		var_77_0 = nil
		var_77_1 = arg_77_0 == "closed" and 51200 or 0
		var_77_2 = 0
		
		return var_77_1, {
			access = "w"
		}, var_77_2, {
			access = "r",
			delay = 30
		}
	end,
	function(arg_78_0)
		if arg_78_0 == "locked" then
			return "closed"
		else
			return "open"
		end
	end,
	function(arg_79_0)
		if arg_79_0 == 0 then
			return "daylocked"
		elseif arg_79_0 == 1 then
			return "homesecure"
		elseif arg_79_0 == 2 then
			return "secured"
		else
			return "unknown"
		end
	end,
	function(arg_80_0)
		var_80_0 = depends("io-utils")
		
		if arg_80_0 == "daylocked" then
			return var_80_0.createActivateFunc(0)
		elseif arg_80_0 == "homesecure" then
			return var_80_0.createActivateFunc(51200, {
				{
					1,
					1
				}
			})
		elseif arg_80_0 == "secured" then
			return var_80_0.createActivateFunc(51200, {
				{
					1,
					2
				}
			})
		else
			return nil
		end
	end,
	function(arg_81_0)
		if arg_81_0 == "closed" then
			return 51200
		else
			return 0
		end
	end,
	function(arg_82_0)
		return depends("io-utils").createActivateFunc(55304, {
			{
				1,
				53504
			},
			{
				2,
				arg_82_0 * 512
			}
		})
	end,
	function(arg_83_0, arg_83_1)
		return depends("io-utils").createActivateFunc(55304, {
			{
				1,
				arg_83_0 * 512
			},
			{
				2,
				arg_83_1 * 512
			}
		})
	end,
	function(arg_84_0)
		return depends("io-utils").createActivateFunc(55304, {
			{
				1,
				arg_84_0 * 512
			},
			{
				2,
				53504
			}
		})
	end,
	function(arg_85_0, arg_85_1, arg_85_2)
		return depends("io-utils").fromRawTemperatureValue(arg_85_0, arg_85_1, arg_85_2)
	end,
	function(arg_86_0, arg_86_1, arg_86_2, arg_86_3, arg_86_4, arg_86_5)
		var_86_0 = depends("io-utils")
		var_86_1 = arg_86_0
		
		if arg_86_0 == 55306 then
			var_86_1 = arg_86_1
		elseif arg_86_0 == 55310 then
			var_86_1 = arg_86_2
		elseif arg_86_0 == 55311 then
			var_86_1 = arg_86_3
		else
			var_86_1 = arg_86_0
		end
		
		if var_86_1 == nil then
			return nil
		else
			return var_86_0.fromRawTemperatureValue(var_86_1, arg_86_4, arg_86_5)
		end
	end,
	function(arg_87_0, arg_87_1, arg_87_2)
		var_87_0 = depends("io-utils")
		
		if arg_87_0 == nil then
			return nil
		else
			return var_87_0.fromRawTemperatureValue(arg_87_0, arg_87_1, arg_87_2)
		end
	end,
	function()
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
	function()
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
	function()
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
	function()
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
	function(arg_92_0)
		if arg_92_0 == nil then
			return ""
		end
		
		if arg_92_0 == 55311 then
			return "comfort"
		elseif arg_92_0 == 55310 then
			return "eco"
		elseif arg_92_0 == 55306 then
			return "secured"
		else
			return ""
		end
	end,
	function(arg_93_0, arg_93_1, arg_93_2, arg_93_3)
		var_93_0 = depends("io-utils")
		var_93_1 = ""
		
		if arg_93_0 == "auto" then
			var_93_1 = {
				{
					9,
					1
				}
			}
		elseif arg_93_0 == "manu" then
			var_93_1 = {
				{
					9,
					2
				}
			}
		else
			return var_93_0.createActivateFunc(54272, {
				{
					9,
					0
				}
			})
		end
		
		if arg_93_0 == "auto" and type(arg_93_1) == "number" then
			return var_93_0.createActivateFunc(54272, {
				{
					9,
					0
				}
			})
		end
		
		if type(arg_93_1) == "string" then
			if arg_93_1 == "comfort" then
				return var_93_0.createActivateFunc(55311, var_93_1)
			elseif arg_93_1 == "eco" then
				return var_93_0.createActivateFunc(55310, var_93_1)
			elseif arg_93_1 == "secured" then
				return var_93_0.createActivateFunc(55306, var_93_1)
			else
				return nil
			end
		elseif type(arg_93_1) == "number" then
			return var_93_0.createActivateFunc(var_93_0.toRawTemperatureValue(arg_93_1, arg_93_2, arg_93_3), var_93_1)
		else
			return nil
		end
	end,
	function(arg_94_0, arg_94_1)
		var_94_0 = depends("io-utils")
		
		if arg_94_0 == "auto" then
			return var_94_0.createActivateFunc(55311, {
				{
					9,
					1
				}
			})
		elseif arg_94_0 == "manu" then
			return var_94_0.createActivateFunc(arg_94_1, {
				{
					9,
					2
				}
			})
		else
			return var_94_0.createActivateFunc(54272, {
				{
					9,
					0
				}
			})
		end
	end,
	function(arg_95_0, arg_95_1, arg_95_2)
		return depends("io-utils").toRawTemperatureValue(arg_95_0, arg_95_1, arg_95_2)
	end,
	function(arg_96_0)
		var_96_0 = depends("io-utils")
		
		if arg_96_0 == "heating" then
			return var_96_0.createActivateFunc(54272, {
				{
					9,
					4
				}
			})
		elseif arg_96_0 == "cooling" then
			return var_96_0.createActivateFunc(54272, {
				{
					9,
					8
				}
			})
		elseif arg_96_0 == "both" then
			return var_96_0.createActivateFunc(54272, {
				{
					9,
					12
				}
			})
		else
			return var_96_0.createActivateFunc(54272, {
				{
					9,
					0
				}
			})
		end
	end,
	function(arg_97_0, arg_97_1, arg_97_2)
		var_97_0 = depends("io-utils")
		
		if arg_97_0 == nil then
			return nil
		end
		
		if type(arg_97_0) == "string" then
			if arg_97_0 == "comfort" then
				return var_97_0.createActivateFunc(55311)
			elseif arg_97_0 == "eco" then
				return var_97_0.createActivateFunc(55310)
			elseif arg_97_0 == "secured" then
				return var_97_0.createActivateFunc(55306)
			end
		elseif type(arg_97_0) == "number" then
			return var_97_0.createActivateFunc(var_97_0.toRawTemperatureValue(arg_97_0, arg_97_1, arg_97_2), {
				{
					9,
					2
				}
			})
		end
		
		return nil
	end,
	function(arg_98_0)
		return 0, {
			category = "onoff"
		}, 51200, {
			category = "onoff",
			delay = arg_98_0
		}
	end,
	function(arg_99_0)
		var_99_0 = nil
		
		return arg_99_0 == "on" and 0 or 51200, {
			category = "onoff"
		}
	end,
	function()
		return depends("io-utils").createActivateFunc(0, {
			{
				13,
				55296
			}
		})
	end,
	function(arg_101_0)
		return depends("io-utils").createActivateFunc(0, {
			{
				13,
				arg_101_0
			}
		})
	end,
	function(arg_102_0)
		var_102_0 = depends("io-utils")
		var_102_1 = nil
		
		return arg_102_0 == "on" and 0 or 51200
	end,
	function(arg_103_0)
		return depends("io-somfy-utils").getParamValue(arg_103_0, 136)
	end,
	function(arg_104_0)
		return depends("io-utils").getMicroModuleLowBattery(arg_104_0)
	end,
	function(arg_105_0)
		var_105_0 = depends("io-utils")
		var_105_1 = depends("io-somfy-utils")
		var_105_2 = bit.band(var_105_1.getParamValue(arg_105_0, 26), 255)
		
		if var_105_2 == 27 then
			return "onOffSwitch"
		elseif var_105_2 == 16 then
			return "dimmableLight"
		else
			return "onOffLight"
		end
	end,
	function(arg_106_0, arg_106_1)
		var_106_0 = bytearray(2)
		var_106_1 = depends("io-utils")
		
		var_106_0:writeInt16(1, arg_106_0)
		
		var_106_2 = var_106_1.updateSOFOPUParam(arg_106_1, var_106_0, 136)
		
		return var_106_1.updatePublicState(var_106_2, 42499, 2), nil, bytearray({
			2,
			166,
			3,
			0
		}), {
			access = "r"
		}
	end,
	function(arg_107_0, arg_107_1)
		var_107_0 = 18
		
		if arg_107_0 == "onOffSwitch" then
			var_107_0 = 27
		end
		
		var_107_1 = bytearray(2)
		var_107_2 = depends("io-utils")
		
		var_107_1:writeInt16(1, var_107_0)
		
		var_107_3 = var_107_2.updateSOFOPUParam(arg_107_1, var_107_1, 26)
		var_107_4 = bytearray({
			2,
			166,
			3,
			0
		})
		
		return var_107_2.updatePublicState(var_107_3, 42499, 2), nil, var_107_4, {
			access = "r"
		}
	end,
	function(arg_108_0)
		return depends("io-utils").motorRelativePositionToDiscreteOpenClosed(arg_108_0, true)
	end,
	function(arg_109_0)
		return 100 - arg_109_0
	end,
	function(arg_110_0)
		var_110_0 = depends("io-utils")
		var_110_1 = arg_110_0
		var_110_2 = 54656
		var_110_3 = 0.040000000000000001
		
		if var_110_1 == nil then
			var_110_1 = 25
		end
		
		return var_110_0.createActivateFunc(var_110_2 - var_110_3 * var_110_1, nil), {
			category = "lighting"
		}
	end,
	function(arg_111_0)
		var_111_0 = depends("io-utils")
		var_111_1 = arg_111_0
		var_111_2 = 54656
		var_111_3 = 0.040000000000000001
		
		if var_111_1 == nil then
			var_111_1 = 25
		end
		
		return var_111_0.createActivateFunc(var_111_2 + var_111_3 * var_111_1, nil), {
			category = "lighting"
		}
	end,
	function(arg_112_0)
		return depends("io-utils").saveBoundValue(arg_112_0)
	end,
	function(arg_113_0, arg_113_1)
		var_113_0 = nil
		var_113_1 = nil
		
		if type(arg_113_0) == "string" then
			if arg_113_0 == "memorized1" or arg_113_0 == "my" then
				var_113_0 = 55296
			elseif arg_113_0 == "secured" then
				var_113_0 = 55306
			end
		else
			var_113_0 = arg_113_0 * 512
		end
		
		if type(arg_113_1) == "string" then
			if arg_113_1 == "my" or arg_113_1 == "memorized1" then
				var_113_1 = 55296
			end
		else
			var_113_1 = arg_113_1 * 512
		end
		
		return depends("io-utils").createActivateFunc(var_113_0, {
			{
				3,
				var_113_1
			}
		})
	end,
	function(arg_114_0)
		var_114_0 = nil
		
		if type(arg_114_0) == "string" then
			if arg_114_0 == "memorized1" or arg_114_0 == "my" then
				var_114_0 = 55296
			end
		else
			var_114_0 = arg_114_0 * 512
		end
		
		var_114_1 = depends("io-utils")
		
		return var_114_1.createActivateFunc(var_114_1.value.CURRENT, {
			{
				3,
				var_114_0
			}
		})
	end,
	function(arg_115_0)
		if type(arg_115_0) == "string" and (arg_115_0 == "my" or arg_115_0 == "memorized1") then
			return 55296
		else
			return arg_115_0 * 512
		end
	end,
	function(arg_116_0)
		if arg_116_0 == 0 then
			return "on"
		else
			return "off"
		end
	end,
	function()
		return 51200
	end,
	function()
		return 0
	end,
	function(arg_119_0)
		return depends("common", "utils").round(0.0023437499999999999 * arg_119_0 - 40, 1)
	end,
	function(arg_120_0)
		return depends("common", "utils").round(0.0023437499999999999 * arg_120_0 - 40)
	end,
	function(arg_121_0)
		var_121_0 = ""
		
		if arg_121_0 == nil then
			return var_121_0
		end
		
		if bit.band(arg_121_0, 49152) == 16384 then
			var_121_0 = var_121_0 .. "On "
		elseif bit.band(arg_121_0, 49152) == 32768 then
			var_121_0 = var_121_0 .. "Off "
		end
		
		if bit.band(arg_121_0, 3) == 1 then
			var_121_0 = var_121_0 .. "+Heating "
		elseif bit.band(arg_121_0, 3) == 2 then
			var_121_0 = var_121_0 .. "-Heating "
		end
		
		if bit.band(arg_121_0, 12) == 4 then
			var_121_0 = var_121_0 .. "+Cooling "
		elseif bit.band(arg_121_0, 12) == 8 then
			var_121_0 = var_121_0 .. "-Cooling "
		end
		
		if bit.band(arg_121_0, 48) == 16 then
			var_121_0 = var_121_0 .. "+Away "
		elseif bit.band(arg_121_0, 48) == 32 then
			var_121_0 = var_121_0 .. "-Away "
		end
		
		if bit.band(arg_121_0, 192) == 64 then
			var_121_0 = var_121_0 .. "+SwimmingPool "
		elseif bit.band(arg_121_0, 192) == 128 then
			var_121_0 = var_121_0 .. "-SwimmingPool "
		end
		
		if bit.band(arg_121_0, 768) == 256 then
			var_121_0 = var_121_0 .. "+DHW "
		elseif bit.band(arg_121_0, 768) == 512 then
			var_121_0 = var_121_0 .. "-DHW "
		end
		
		return var_121_0
	end,
	function(arg_122_0)
		var_122_0 = ""
		
		if bit.band(arg_122_0, 1) == 1 then
			var_122_0 = var_122_0 .. "HeatingMode "
		end
		
		if bit.band(arg_122_0, 2) == 2 then
			var_122_0 = var_122_0 .. "Cooling "
		end
		
		if bit.band(arg_122_0, 4) == 4 then
			var_122_0 = var_122_0 .. "Away "
		end
		
		if bit.band(arg_122_0, 8) == 8 then
			var_122_0 = var_122_0 .. "SwimmingPool "
		end
		
		if bit.band(arg_122_0, 16) == 16 then
			var_122_0 = var_122_0 .. "DHW "
		end
		
		return var_122_0
	end,
	function(arg_123_0)
		var_123_0 = depends("io-utils")
		
		if arg_123_0 == "comfort" then
			return var_123_0.createActivateFunc(55311, {
				{
					16,
					16384
				}
			})
		elseif arg_123_0 == "setback" then
			return var_123_0.createActivateFunc(55310, {
				{
					16,
					16384
				}
			})
		elseif arg_123_0 == "eco" then
			return var_123_0.createActivateFunc(55314, {
				{
					16,
					16384
				}
			})
		elseif arg_123_0 == "halted" then
			return var_123_0.createActivateFunc(55315, {
				{
					16,
					16384
				}
			})
		else
			return var_123_0.createActivateFunc(54272, {
				{
					16,
					32768
				}
			})
		end
	end,
	function(arg_124_0)
		return depends("common", "utils").round(51200 * (arg_124_0 + 40) / 120)
	end,
	function(arg_125_0)
		if arg_125_0 == 51200 then
			return "A,B,C"
		end
		
		if arg_125_0 == 0 then
			return ""
		end
		
		if arg_125_0 > 63488 then
			var_125_0 = bit.band(arg_125_0, 63)
			
			return ({
				[0] = "",
				nil,
				nil,
				"A",
				[12] = "B",
				[15] = "A,B",
				[60] = "B,C",
				[63] = "A,B,C",
				[48] = "C",
				[51] = "A,C"
			})[var_125_0]
		end
	end,
	function(arg_126_0)
		return ({
			["A,B,C"] = 51200,
			A = 64855,
			["A,C"] = 64887,
			C = 64885,
			["A,B"] = 64863,
			B = 64861,
			["B,C"] = 64893,
			[""] = 0
		})[arg_126_0]
	end,
	function(arg_127_0)
		if arg_127_0 == "my" or arg_127_0 == "memorized1" then
			return 55296
		elseif arg_127_0 == "secured" then
			return 55306
		else
			return arg_127_0 * 512
		end
	end,
	function()
		return 53760
	end,
	function()
		return 55296
	end,
	function(arg_130_0, arg_130_1)
		var_130_0 = depends("io-utils")
		
		if type(arg_130_1) == "string" and arg_130_1 == "lowspeed" then
			return var_130_0.createActivateFunc(arg_130_0 * 512, {
				{
					1,
					55301
				}
			})
		else
			return var_130_0.createActivateFunc(arg_130_0 * 512, {
				{
					1,
					54016
				}
			})
		end
	end,
	function(arg_131_0)
		if arg_131_0 == "securedVentilation" then
			return 55299
		elseif arg_131_0 == "my" then
			return 55296
		else
			return arg_131_0 * 512
		end
	end,
	function(arg_132_0, arg_132_1)
		var_132_0 = depends("io-utils")
		arg_132_0 = arg_132_0 == "securedVentilation" and 55299 or arg_132_0 == "my" and 55296 or arg_132_0 * 512
		
		if type(arg_132_1) == "string" and arg_132_1 == "lowspeed" then
			return var_132_0.createActivateFunc(arg_132_0, {
				{
					1,
					55301
				}
			})
		else
			return var_132_0.createActivateFunc(arg_132_0, {
				{
					1,
					54016
				}
			})
		end
	end,
	function(arg_133_0)
		if arg_133_0 == 51200 then
			return "locked"
		else
			return "unlocked"
		end
	end,
	function(arg_134_0, arg_134_1)
		if arg_134_1 == 55299 then
			return "securedVentilation"
		elseif arg_134_0 == 51200 then
			return "closed"
		else
			return "open"
		end
	end,
	function(arg_135_0)
		var_135_0 = depends("io-somfy-utils").getParamValue(arg_135_0, 26)
		
		if var_135_0 ~= nil and var_135_0 >= 0 and var_135_0 < 61 then
			return var_135_0
		end
	end,
	function(arg_136_0)
		if arg_136_0 == 59 then
			return "left"
		elseif arg_136_0 == 60 then
			return "right"
		end
	end,
	function(arg_137_0)
		return depends("io-somfy-utils").getParamValue(arg_137_0, 142)
	end,
	function(arg_138_0)
		return depends("io-somfy-utils").getParamValue(arg_138_0, 32)
	end,
	function(arg_139_0)
		if arg_139_0 == 1 then
			return "enabled"
		else
			return "disabled"
		end
	end,
	function(arg_140_0)
		return depends("io-somfy-utils").getParamValue(arg_140_0, 135)
	end,
	function(arg_141_0)
		if arg_141_0 == 1 then
			return "activated"
		else
			return "deactivated"
		end
	end,
	function(arg_142_0)
		return depends("io-somfy-utils").getParamValue(arg_142_0, 136)
	end,
	function(arg_143_0)
		var_143_0 = bytearray(1)
		var_143_1 = depends("io-utils")
		
		var_143_0:writeInt8(1, 1)
		
		var_143_2 = var_143_1.updateSOFOPUParam(arg_143_0, var_143_0, 135)
		
		return var_143_1.updatePublicState(var_143_2, 42499, 2), nil, bytearray({
			2,
			166,
			3,
			0
		}), {
			access = "r"
		}
	end,
	function(arg_144_0)
		var_144_0 = bytearray(1)
		var_144_1 = depends("io-utils")
		
		var_144_0:writeInt8(1, 0)
		
		var_144_2 = var_144_1.updateSOFOPUParam(arg_144_0, var_144_0, 135)
		
		return var_144_1.updatePublicState(var_144_2, 42499, 2), nil, bytearray({
			2,
			166,
			3,
			0
		}), {
			access = "r"
		}
	end,
	function(arg_145_0)
		var_145_0 = depends("io-utils")
		
		if arg_145_0 < 51200 then
			error("Opened window cannot be locked")
		end
		
		return var_145_0.createActivateFunc(51200, {
			{
				9,
				51200
			}
		})
	end,
	function(arg_146_0)
		var_146_0 = depends("io-utils")
		
		if arg_146_0 < 51200 then
			error("Opened window cannot be unlock")
		end
		
		return var_146_0.createActivateFunc(51200, {
			{
				9,
				0
			}
		})
	end,
	function(arg_147_0)
		if type(arg_147_0) == "string" then
			if arg_147_0 == "memorized1" then
				return 55296
			elseif arg_147_0 == "secured" then
				return 55306
			end
		else
			return arg_147_0 * 512
		end
	end,
	function(arg_148_0, arg_148_1)
		var_148_0 = depends("io-utils")
		
		if type(arg_148_0) == "string" then
			if arg_148_0 == "memorized1" then
				return var_148_0.createActivateFunc(55296, {
					{
						1,
						arg_148_1 * 512
					}
				})
			elseif arg_148_0 == "secured" then
				return var_148_0.createActivateFunc(55306, {
					{
						1,
						arg_148_1 * 512
					}
				})
			end
		else
			return var_148_0.createActivateFunc(arg_148_0 * 512, {
				{
					1,
					arg_148_1 * 512
				}
			})
		end
	end,
	function(arg_149_0)
		var_149_0 = 5
		
		return depends("io-utils").getBatteryLevelValue(arg_149_0, var_149_0)
	end,
	function(arg_150_0)
		if arg_150_0 == 51200 then
			return "off"
		else
			return "on"
		end
	end,
	function()
		var_151_0 = depends("io-utils")
		
		return 51200, {
			priority = var_151_0.priority.VERYHIGH
		}
	end,
	function(arg_152_0, arg_152_1, arg_152_2, arg_152_3, arg_152_4, arg_152_5, arg_152_6, arg_152_7, arg_152_8, arg_152_9, arg_152_10)
		return depends("io-utils").ringWithDoubleSequence(arg_152_0, arg_152_1, arg_152_2, arg_152_3, arg_152_4, arg_152_5, arg_152_6, arg_152_7, arg_152_8, arg_152_9, arg_152_10)
	end,
	function(arg_153_0, arg_153_1, arg_153_2, arg_153_3, arg_153_4, arg_153_5)
		return depends("io-utils").ringWithSingleSequence(arg_153_0, arg_153_1, arg_153_2, arg_153_3, arg_153_4, arg_153_5)
	end,
	function(arg_154_0, arg_154_1, arg_154_2, arg_154_3, arg_154_4, arg_154_5, arg_154_6, arg_154_7, arg_154_8, arg_154_9, arg_154_10, arg_154_11, arg_154_12, arg_154_13, arg_154_14, arg_154_15)
		return depends("io-utils").ringWithThreeSequence(arg_154_0, arg_154_1, arg_154_2, arg_154_3, arg_154_4, arg_154_5, arg_154_6, arg_154_7, arg_154_8, arg_154_9, arg_154_10, arg_154_11, arg_154_12, arg_154_13, arg_154_14, arg_154_15)
	end,
	function(arg_155_0)
		return arg_155_0
	end,
	function(arg_156_0, arg_156_1, arg_156_2, arg_156_3, arg_156_4, arg_156_5, arg_156_6, arg_156_7, arg_156_8)
		return depends("io-utils").ringWithDoubleSequence(arg_156_0, arg_156_1, arg_156_2, arg_156_3, nil, arg_156_4, arg_156_5, arg_156_6, arg_156_7, nil, arg_156_8)
	end,
	function(arg_157_0, arg_157_1, arg_157_2, arg_157_3, arg_157_4)
		return depends("io-utils").ringWithSingleSequence(arg_157_0, arg_157_1, arg_157_2, arg_157_3, nil, arg_157_4)
	end,
	function(arg_158_0, arg_158_1, arg_158_2, arg_158_3, arg_158_4, arg_158_5, arg_158_6, arg_158_7, arg_158_8, arg_158_9, arg_158_10, arg_158_11, arg_158_12)
		return depends("io-utils").ringWithThreeSequence(arg_158_0, arg_158_1, arg_158_2, arg_158_3, nil, arg_158_4, arg_158_5, arg_158_6, arg_158_7, nil, arg_158_8, arg_158_9, arg_158_10, arg_158_11, nil, arg_158_12)
	end,
	function(arg_159_0)
		return arg_159_0:readInt8(1)
	end,
	function(arg_160_0)
		return depends("io-atlantic-utils").bytesToString(arg_160_0)
	end,
	function(arg_161_0)
		return depends("io-atlantic-utils").fromDHWRawDateTime(arg_161_0)
	end,
	function(arg_162_0)
		return depends("io-atlantic-utils").getManufacturerName(arg_162_0)
	end,
	function(arg_163_0)
		if arg_163_0 == nil or #arg_163_0 < 4 then
			return nil
		end
		
		return arg_163_0:readUInt16(3)
	end,
	function(arg_164_0)
		if arg_164_0 == nil or #arg_164_0 < 4 then
			return nil
		end
		
		return arg_164_0:readUInt16(3) / 10
	end,
	function(arg_165_0)
		if arg_165_0 == nil or #arg_165_0 < 2 then
			return nil
		end
		
		return arg_165_0:readUInt16(1)
	end,
	function(arg_166_0)
		if arg_166_0 == nil or #arg_166_0 < 2 then
			return nil
		end
		
		return arg_166_0:readUInt16(1) / 10
	end,
	function(arg_167_0)
		if arg_167_0 == nil or #arg_167_0 == 0 then
			return nil
		end
		
		return arg_167_0:readUInt8(1)
	end,
	function(arg_168_0)
		return depends("io-atlantic-utils").getCurrentOperatingMode(arg_168_0)
	end,
	function(arg_169_0, arg_169_1, arg_169_2, arg_169_3, arg_169_4, arg_169_5, arg_169_6, arg_169_7)
		var_169_0 = depends("io-utils")
		var_169_1 = arg_169_0
		
		if arg_169_0 == 55306 then
			var_169_1 = arg_169_1
		elseif arg_169_0 == 55314 then
			var_169_1 = arg_169_2
		elseif arg_169_0 == 55311 then
			var_169_1 = arg_169_3
		elseif arg_169_0 == 55315 then
			var_169_1 = arg_169_4
		elseif arg_169_0 == 55318 then
			var_169_1 = arg_169_5
		else
			var_169_1 = arg_169_0
		end
		
		if var_169_1 == nil then
			return nil
		else
			return var_169_0.fromRawTemperatureValue(var_169_1, arg_169_6, arg_169_7)
		end
	end,
	function()
		return depends("io-atlantic-utils").fromRawVersion(p1)
	end,
	function(arg_171_0)
		return arg_171_0:readUInt16(1)
	end,
	function(arg_172_0)
		var_172_0 = arg_172_0:readUInt8(1)
		
		if var_172_0 == 255 then
			return "always"
		else
			return tostring(var_172_0)
		end
	end,
	function(arg_173_0)
		return depends("io-atlantic-utils").getBoilerInstallationOption(arg_173_0)
	end,
	function(arg_174_0)
		return arg_174_0:readUInt16(1)
	end,
	function(arg_175_0)
		return depends("io-atlantic-utils").getDHWError(arg_175_0)
	end,
	function(arg_176_0)
		return arg_176_0:readUInt8(1)
	end,
	function(arg_177_0)
		if arg_177_0 == 0 then
			return "autoMode"
		elseif arg_177_0 == 1 then
			return "manualEcoActive"
		elseif arg_177_0 == 2 then
			return "manualEcoInactive"
		end
	end,
	function(arg_178_0)
		return arg_178_0:readUInt16(3)
	end,
	function(arg_179_0)
		return depends("io-atlantic-utils").getElectricalExtraManagement(arg_179_0)
	end,
	function(arg_180_0)
		return depends("io-atlantic-utils").getExtractionOption(arg_180_0)
	end,
	function(arg_181_0)
		return depends("io-atlantic-utils").getInstallation(arg_181_0)
	end,
	function(arg_182_0)
		if arg_182_0 == nil or #arg_182_0 < 2 then
			return nil
		end
		
		return arg_182_0:readInt16(1) / 10
	end,
	function(arg_183_0)
		return depends("io-atlantic-utils").getOperatingModeCapabilities(arg_183_0)
	end,
	function(arg_184_0)
		return depends("io-atlantic-utils").getOperatingRange(arg_184_0)
	end,
	function(arg_185_0)
		return depends("io-atlantic-utils").getUserProgSlotsDHW(arg_185_0)
	end,
	function(arg_186_0)
		return depends("io-atlantic-utils").getRateManagement(arg_186_0)
	end,
	function(arg_187_0)
		return depends("io-atlantic-utils").getSmartGridOption(arg_187_0)
	end,
	function()
		var_188_0 = depends("io-utils")
		
		return var_188_0.getRefreshMethod(var_188_0.extendedInformationType.CURRENT_USING_DISCRETE_VALUE)
	end,
	function(arg_189_0)
		return bytearray({
			arg_189_0
		})
	end,
	function(arg_190_0)
		var_190_0 = arg_190_0
		
		if arg_190_0 == "always" then
			var_190_0 = 255
		end
		
		return bytearray({
			var_190_0
		})
	end,
	function(arg_191_0)
		var_191_0 = nil
		var_191_1 = arg_191_0 == "heatPumpPriority" and 0 or arg_191_0 == "heatPumpOptimising" and 1 or arg_191_0 == "boilerOptimising" and 2 or 3
		
		return bytearray({
			var_191_1
		})
	end,
	function(arg_192_0)
		return depends("io-atlantic-utils").setCurrentOperatingMode(arg_192_0)
	end,
	function(arg_193_0)
		var_193_0 = 0
		
		if arg_193_0 == "manualEcoActive" then
			var_193_0 = 1
		elseif arg_193_0 == "manualEcoInactive" then
			var_193_0 = 2
		end
		
		return bytearray({
			var_193_0
		})
	end,
	function(arg_194_0)
		return depends("io-atlantic-utils").toDHWRawDateTime(arg_194_0)
	end,
	function(arg_195_0)
		var_195_0 = 1
		
		if arg_195_0 == "auto" then
			var_195_0 = 0
		end
		
		return bytearray({
			var_195_0
		})
	end,
	function(arg_196_0)
		var_196_0 = nil
		var_196_1 = arg_196_0 == "noExtraction" and 0 or arg_196_0 == "lowExtractionSpeed" and 1 or 2
		
		return bytearray({
			var_196_1
		})
	end,
	function(arg_197_0)
		var_197_0 = nil
		var_197_1 = arg_197_0 == "onlyThermodynamic" and 0 or arg_197_0 == "extraBoiler" and 1 or 2
		
		return bytearray({
			var_197_1
		})
	end,
	function(arg_198_0)
		var_198_0 = nil
		var_198_1 = arg_198_0 == "pacProg_elecProg" and 1 or 4
		
		return bytearray({
			var_198_1
		})
	end,
	function(arg_199_0)
		return depends("io-atlantic-utils").setUserProgSlotsDHW(arg_199_0)
	end,
	function(arg_200_0)
		var_200_0 = depends("io-utils")
		var_200_1 = nil
		
		if arg_200_0 == "no" then
			var_200_1 = 64512
		elseif arg_200_0 == "wanted" then
			var_200_1 = 64513
		elseif arg_200_0 == "recommended" then
			var_200_1 = 64514
		elseif arg_200_0 == "unsuitable" then
			var_200_1 = 64516
		elseif arg_200_0 == "forbidden" then
			var_200_1 = 64517
		else
			return nil
		end
		
		return var_200_0.createActivateFunc(54272, {
			{
				10,
				var_200_1
			}
		})
	end,
	function(arg_201_0)
		var_201_0 = 0
		
		if arg_201_0 == "active" then
			var_201_0 = 1
		end
		
		return bytearray({
			var_201_0
		})
	end,
	function(arg_202_0, arg_202_1, arg_202_2)
		var_202_0 = depends("io-utils")
		
		if type(arg_202_0) == "string" then
			if arg_202_0 == "secured" then
				return 55306
			elseif arg_202_0 == "eco" then
				return 55314
			elseif arg_202_0 == "comfort" then
				return 55311
			elseif arg_202_0 == "halted" then
				return 55315
			elseif arg_202_0 == "anti-frost" then
				return 55318
			else
				return nil
			end
		else
			return var_202_0.toRawTemperatureValue(arg_202_0, arg_202_1, arg_202_2)
		end
	end,
	function(arg_203_0)
		return arg_203_0:readUInt32(1)
	end,
	function(arg_204_0)
		if arg_204_0 == 64512 then
			return "off"
		else
			return "on"
		end
	end,
	function(arg_205_0)
		if arg_205_0 == 64512 then
			return "off"
		elseif arg_205_0 == 64513 then
			return "frostprotection"
		elseif arg_205_0 == 64514 then
			return "eco"
		elseif arg_205_0 == 64515 then
			return "comfort-2"
		elseif arg_205_0 == 64516 then
			return "comfort-1"
		elseif arg_205_0 == 64517 then
			return "comfort"
		elseif arg_205_0 == 64519 then
			return "boost"
		elseif arg_205_0 == 64575 then
			return "secured"
		else
			return "unknown"
		end
	end,
	function(arg_206_0)
		if arg_206_0 == 64512 then
			return "off"
		elseif arg_206_0 == 64513 then
			return "frostprotection"
		elseif arg_206_0 == 64514 or arg_206_0 == 0 then
			return "eco"
		elseif arg_206_0 == 64515 then
			return "comfort-2"
		elseif arg_206_0 == 64516 then
			return "comfort-1"
		elseif arg_206_0 == 64517 or arg_206_0 == 51200 then
			return "comfort"
		elseif arg_206_0 == 64519 then
			return "boost"
		elseif arg_206_0 == 64575 then
			return "secured"
		else
			return "unknown"
		end
	end,
	function(arg_207_0)
		var_207_0 = depends("io-utils")
		
		return var_207_0.createActivateFunc(var_207_0.toRawHeatingLevel(arg_207_0), {
			{
				11,
				0
			}
		}), {
			originator = 1
		}
	end,
	function(arg_208_0)
		var_208_0 = depends("io-utils")
		
		return var_208_0.createActivateFunc(var_208_0.toRawHeatingLevel(arg_208_0), {
			{
				11,
				65535
			}
		}), {
			originator = 1
		}
	end,
	function(arg_209_0, arg_209_1)
		var_209_0 = depends("io-utils")
		
		return var_209_0.createActivateFunc(var_209_0.toRawHeatingLevel(arg_209_0), {
			{
				11,
				arg_209_1
			}
		}), {
			originator = 1
		}
	end,
	function(arg_210_0)
		return arg_210_0:readInt8(15)
	end,
	function(arg_211_0)
		return depends("io-atlantic-utils").getTimeProgram(arg_211_0)
	end,
	function(arg_212_0)
		if arg_212_0 == 64515 then
			return "boost"
		elseif arg_212_0 == 64514 then
			return "high"
		elseif arg_212_0 == 64512 then
			return "away"
		elseif arg_212_0 == 64513 then
			return "auto"
		else
			return "unknown"
		end
	end,
	function(arg_213_0)
		return depends("io-atlantic-utils").getCO2History(arg_213_0)
	end,
	function(arg_214_0)
		return bit.lshift(arg_214_0:readInt16(29), 16) + arg_214_0:readInt16(31)
	end,
	function(arg_215_0)
		return arg_215_0:readUInt16(9)
	end,
	function(arg_216_0)
		return arg_216_0:readUInt16(7)
	end,
	function(arg_217_0)
		return arg_217_0:readInt8(16)
	end,
	function(arg_218_0)
		return arg_218_0:readInt16(13)
	end,
	function(arg_219_0)
		return depends("io-atlantic-utils").getSensorsErrorState(arg_219_0)
	end,
	function(arg_220_0)
		if arg_220_0 == 64514 then
			return "eco"
		elseif arg_220_0 == 64513 then
			return "comfort"
		elseif arg_220_0 == 64512 then
			return "standard"
		else
			return "unknown"
		end
	end,
	function(arg_221_0)
		return depends("io-atlantic-utils").getVentilationMode(arg_221_0)
	end,
	function()
		return bytearray({
			12,
			0,
			1
		})
	end,
	function()
		return bytearray({
			12,
			0,
			2
		})
	end,
	function(arg_224_0, arg_224_1, arg_224_2)
		var_224_0 = bytearray(3)
		
		if arg_224_0 == "on" then
			var_224_0[1] = 1
		else
			var_224_0[1] = 0
		end
		
		if arg_224_1 == "on" then
			var_224_0[2] = 1
		else
			var_224_0[2] = 0
		end
		
		if arg_224_2 == "on" then
			var_224_0[3] = 1
		else
			var_224_0[3] = 0
		end
		
		return var_224_0
	end,
	function(arg_225_0)
		if arg_225_0 == "boost" then
			return 64515
		elseif arg_225_0 == "high" then
			return 64514
		elseif arg_225_0 == "auto" then
			return 64513
		elseif arg_225_0 == "away" then
			return 64512
		else
			return nil
		end
	end,
	function(arg_226_0)
		return depends("io-atlantic-utils").setTimeProgram(arg_226_0)
	end,
	function(arg_227_0)
		var_227_0 = depends("io-utils")
		var_227_1 = arg_227_0
		
		if type(arg_227_0) == "string" then
			if arg_227_0 == "standard" then
				var_227_1 = 64512
			elseif arg_227_0 == "comfort" then
				var_227_1 = 64513
			elseif arg_227_0 == "eco" then
				var_227_1 = 64514
			end
		end
		
		return var_227_0.createActivateFunc(54272, {
			{
				16,
				var_227_1
			}
		})
	end,
	function(arg_228_0)
		return depends("io-atlantic-utils").setVentilationMode(arg_228_0)
	end,
	function(arg_229_0)
		return arg_229_0:readInt16(11) / 10
	end,
	function(arg_230_0)
		return arg_230_0:readInt16(3) / 10
	end,
	function(arg_231_0)
		return arg_231_0:readInt16(7) / 10
	end,
	function(arg_232_0)
		return arg_232_0:readInt16(5) / 10
	end,
	function(arg_233_0)
		return arg_233_0:readInt16(9) / 10
	end,
	function(arg_234_0)
		return depends("io-utils").getSensorDefect(arg_234_0)
	end,
	function(arg_235_0)
		return arg_235_0
	end,
	function(arg_236_0)
		return depends("io-utils").sensedUnit[arg_236_0]
	end,
	function(arg_237_0)
		return arg_237_0 - 273.14999999999998
	end,
	function(arg_238_0)
		var_238_0 = depends("io-utils").sensedUnit[arg_238_0]
		
		if var_238_0 == "core:TemperatureInKelvin" then
			return "core:TemperatureInCelcius"
		else
			return var_238_0
		end
	end,
	function(arg_239_0)
		if arg_239_0 == nil or #arg_239_0 ~= 7 then
			return nil
		end
		
		var_239_0 = depends("io-utils").scaleFactors[arg_239_0[3]]
		
		if var_239_0 == nil then
			return nil
		end
		
		return arg_239_0:readUInt32(4) / var_239_0
	end,
	function(arg_240_0)
		return depends("io-utils").fromRawName(arg_240_0)
	end,
	function(arg_241_0)
		return depends("io-atlantic-utils").getTotal(arg_241_0)
	end,
	function(arg_242_0, arg_242_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_242_0, arg_242_1, 0, 1)
	end,
	function(arg_243_0, arg_243_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_243_0, arg_243_1, 0, 2)
	end,
	function(arg_244_0, arg_244_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_244_0, arg_244_1, 0, 3)
	end,
	function(arg_245_0, arg_245_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_245_0, arg_245_1, 0, 4)
	end,
	function(arg_246_0, arg_246_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_246_0, arg_246_1, 0, 5)
	end,
	function(arg_247_0, arg_247_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_247_0, arg_247_1, 0, 6)
	end,
	function(arg_248_0, arg_248_1)
		return depends("io-atlantic-utils").getUsageTotalFor(arg_248_0, arg_248_1, 0)
	end,
	function(arg_249_0, arg_249_1)
		error("advanced refresh not implemented")
	end,
	function(arg_250_0, arg_250_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_250_0, arg_250_1, 1, 1)
	end,
	function(arg_251_0, arg_251_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_251_0, arg_251_1, 1, 2)
	end,
	function(arg_252_0, arg_252_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_252_0, arg_252_1, 1, 3)
	end,
	function(arg_253_0, arg_253_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_253_0, arg_253_1, 1, 4)
	end,
	function(arg_254_0, arg_254_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_254_0, arg_254_1, 1, 5)
	end,
	function(arg_255_0, arg_255_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_255_0, arg_255_1, 1, 6)
	end,
	function(arg_256_0, arg_256_1)
		return depends("io-atlantic-utils").getUsageTotalFor(arg_256_0, arg_256_1, 1)
	end,
	function(arg_257_0, arg_257_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_257_0, arg_257_1, 2, 1)
	end,
	function(arg_258_0, arg_258_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_258_0, arg_258_1, 2, 2)
	end,
	function(arg_259_0, arg_259_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_259_0, arg_259_1, 2, 3)
	end,
	function(arg_260_0, arg_260_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_260_0, arg_260_1, 2, 4)
	end,
	function(arg_261_0, arg_261_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_261_0, arg_261_1, 2, 5)
	end,
	function(arg_262_0, arg_262_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_262_0, arg_262_1, 2, 6)
	end,
	function(arg_263_0, arg_263_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_263_0, arg_263_1, 3, 1)
	end,
	function(arg_264_0, arg_264_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_264_0, arg_264_1, 3, 2)
	end,
	function(arg_265_0, arg_265_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_265_0, arg_265_1, 3, 3)
	end,
	function(arg_266_0, arg_266_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_266_0, arg_266_1, 3, 4)
	end,
	function(arg_267_0, arg_267_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_267_0, arg_267_1, 3, 5)
	end,
	function(arg_268_0, arg_268_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_268_0, arg_268_1, 3, 6)
	end,
	function(arg_269_0, arg_269_1)
		return depends("io-atlantic-utils").getUsageTotalFor(arg_269_0, arg_269_1, 3)
	end,
	function(arg_270_0, arg_270_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_270_0, arg_270_1, 15, 1)
	end,
	function(arg_271_0, arg_271_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_271_0, arg_271_1, 15, 2)
	end,
	function(arg_272_0, arg_272_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_272_0, arg_272_1, 15, 3)
	end,
	function(arg_273_0, arg_273_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_273_0, arg_273_1, 15, 4)
	end,
	function(arg_274_0, arg_274_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_274_0, arg_274_1, 15, 5)
	end,
	function(arg_275_0, arg_275_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_275_0, arg_275_1, 15, 6)
	end,
	function(arg_276_0, arg_276_1)
		return depends("io-atlantic-utils").getUsageTotalFor(arg_276_0, arg_276_1, 15)
	end,
	function(arg_277_0)
		if arg_277_0 == 1 then
			return "on"
		else
			return "off"
		end
	end,
	function(arg_278_0)
		if arg_278_0 == "on" then
			return bytearray({
				1
			})
		else
			return bytearray({
				0
			})
		end
	end,
	function(arg_279_0)
		return bit.rshift(arg_279_0[1], 4)
	end,
	function(arg_280_0)
		return depends("io-atlantic-utils").fromRawName(arg_280_0:sub(1, 16))
	end,
	function(arg_281_0)
		return arg_281_0[18]
	end,
	function(arg_282_0)
		return bytearray(1):writeUInt8(1, arg_282_0)
	end,
	function(arg_283_0)
		if arg_283_0 == 0 then
			return "on"
		elseif arg_283_0 == 1 then
			return "off"
		end
	end,
	function(arg_284_0)
		if arg_284_0 == 0 then
			return "config1"
		elseif arg_284_0 == 1 then
			return "config2"
		end
	end,
	function(arg_285_0)
		if arg_285_0 == "config1" then
			return bytearray({
				0
			})
		elseif arg_285_0 == "config2" then
			return bytearray({
				1
			})
		end
	end,
	function(arg_286_0)
		if arg_286_0 == "on" then
			return bytearray({
				0
			})
		elseif arg_286_0 == "off" then
			return bytearray({
				1
			})
		end
	end,
	function(arg_287_0)
		return arg_287_0 ~= nil and arg_287_0 ~= 0
	end,
	function(arg_288_0)
		if arg_288_0 then
			return "detected"
		else
			return "notDetected"
		end
	end,
	function(arg_289_0)
		return depends("io-fumix-utils").maintenanceRadioPartBatteryConverter(arg_289_0)
	end,
	function(arg_290_0)
		return depends("io-fumix-utils").maintenanceSensorPartBatteryConverter(arg_290_0)
	end,
	function(arg_291_0)
		return depends("io-utils").getDirtyRoomDefect(arg_291_0)
	end,
	function(arg_292_0)
		if arg_292_0 == "short" then
			return 1
		elseif arg_292_0 == "long" then
			return 0
		else
			return nil
		end
	end,
	function(arg_293_0)
		if arg_293_0 then
			return "open"
		else
			return "closed"
		end
	end,
	function(arg_294_0)
		if arg_294_0 == "maintenanceRequired" then
			return "lowBattery"
		else
			return arg_294_0
		end
	end,
	function(arg_295_0)
		if arg_295_0 then
			return "personInside"
		else
			return "noPersonInside"
		end
	end,
	function(arg_296_0)
		return arg_296_0 ~= nil and arg_296_0 == 65535
	end,
	function(arg_297_0)
		if arg_297_0 then
			return "detected"
		else
			return "notDetected"
		end
	end,
	function(arg_298_0)
		return depends("io-utils").toMultiTypeSensorTiltedValue(arg_298_0)
	end,
	function(arg_299_0)
		return depends("io-utils").toMultiTypeSensorOpenClosedValue(arg_299_0)
	end,
	function(arg_300_0)
		return depends("io-utils").toMultiTypeSensorLockedUnlockedValue(arg_300_0)
	end,
	function(arg_301_0)
		return arg_301_0.maxSensedValue
	end,
	function(arg_302_0)
		return depends("io-utils").sensedUnit[arg_302_0.measuredValueType]
	end,
	function(arg_303_0)
		return arg_303_0.minSensedValue
	end,
	function(arg_304_0)
		return true
	end,
	function(arg_305_0)
		return arg_305_0:readUInt8(13)
	end,
	function(arg_306_0, arg_306_1)
		var_306_0 = depends("io-utils")
		var_306_1 = arg_306_1
		
		return var_306_0.updatePublicState(var_306_1:writeUInt8(13, arg_306_0), 17154, 0), nil, bytearray({
			0,
			67,
			2,
			0
		}), {
			access = "r"
		}
	end,
	function(arg_307_0)
		if arg_307_0 == "dpcActuators" then
			return 4
		elseif arg_307_0 == "unsetActuators" then
			return 5
		end
		
		return nil
	end,
	function()
		return 4
	end,
	function(arg_309_0)
		if arg_309_0 == "all" then
			return 1
		elseif arg_309_0 == "inConfigurationState" then
			return 2
		elseif arg_309_0 == "alreadyInTheNetwork" then
			return 3
		end
		
		return nil
	end,
	function(arg_310_0)
		if arg_310_0 == "all" then
			return 1
		elseif arg_310_0 == "inConfigurationState" then
			return 2
		end
		
		return nil
	end,
	function(arg_311_0, arg_311_1)
		if arg_311_1 == "keygo" then
			return bytearray({
				2
			})
		elseif arg_311_1 == "izymo" then
			return bytearray({
				3
			})
		elseif arg_311_1 == "public default" then
			return bytearray({
				4
			})
		elseif arg_311_1 == "v500" then
			return bytearray({
				5
			})
		elseif arg_311_1 == "keypad" then
			return bytearray({
				6
			})
		end
		
		return bytearray({
			0
		})
	end,
	function()
		return 1
	end,
	function()
		return depends("io-utils").generateIOKey()
	end,
	function()
		return 630
	end,
	function(arg_315_0)
		if arg_315_0 == 0 then
			return "up"
		elseif arg_315_0 == 1 then
			return "down"
		elseif arg_315_0 == 2 then
			return "stop"
		elseif arg_315_0 == 3 then
			return "prog"
		end
		
		return nil
	end,
	function(arg_316_0)
		return tostring(arg_316_0)
	end,
	function(arg_317_0)
		if arg_317_0 == 255 then
			return "released"
		elseif arg_317_0 == 256 then
			return "stop"
		else
			return "pressed"
		end
	end,
	function(arg_318_0, arg_318_1)
		var_318_0 = depends("io-utils")
		
		if type(arg_318_1) == "string" and arg_318_1 == "lowspeed" then
			return var_318_0.createActivateFunc(arg_318_0 * 512, {
				{
					1,
					55301
				}
			})
		else
			return var_318_0.createActivateFunc(arg_318_0 * 512, {
				{
					1,
					54016
				}
			})
		end
	end,
	function(arg_319_0, arg_319_1)
		var_319_0 = depends("io-utils")
		arg_319_0 = arg_319_0 == "my" and 55296 or arg_319_0 * 512
		
		if type(arg_319_1) == "string" and arg_319_1 == "lowspeed" then
			return var_319_0.createActivateFunc(arg_319_0, {
				{
					1,
					55301
				}
			})
		else
			return var_319_0.createActivateFunc(arg_319_0, {
				{
					1,
					54016
				}
			})
		end
	end,
	function(arg_320_0)
		if arg_320_0 == 55296 then
			return "tight"
		else
			return depends("io-utils").toPercentValue(arg_320_0)
		end
	end,
	function(arg_321_0)
		if type(arg_321_0) == "string" then
			if arg_321_0 == "tight" then
				return 55296
			end
		else
			return arg_321_0 * 512
		end
	end,
	function(arg_322_0, arg_322_1, arg_322_2, arg_322_3, arg_322_4, arg_322_5)
		return depends("io-utils").toPercentTargetValue(arg_322_0, arg_322_1, {
			[55306] = arg_322_2,
			[55297] = arg_322_3,
			[55298] = arg_322_4,
			[55299] = arg_322_5
		})
	end,
	function(arg_323_0, arg_323_1)
		if arg_323_0 == 54272 then
			return "unknown"
		elseif arg_323_0 == arg_323_1 or arg_323_0 == 55305 then
			return "partial"
		end
		
		return depends("io-utils").motorRelativePositionToDiscreteOpenClosed(arg_323_0)
	end,
	function()
		return 55305
	end,
	function(arg_325_0)
		if arg_325_0 == 54272 then
			return "unknown"
		elseif arg_325_0 > 0 then
			return "locked"
		else
			return "unlocked"
		end
	end,
	function(arg_326_0)
		var_326_0 = depends("BinaryUtils")
		var_326_1 = {
			arg_326_0
		}
		var_326_2 = var_326_0.extractBitRange(var_326_1, 6, 1)
		
		if var_326_2 == 0 then
			return "closed"
		elseif var_326_2 == 1 then
			return "open"
		else
			return nil
		end
	end,
	function(arg_327_0)
		var_327_0 = nil
		var_327_1 = arg_327_0 == "locked" and 51200 or 0
		var_327_2 = 0
		
		return var_327_1, {
			access = "w"
		}, var_327_2, {
			access = "r",
			delay = 30
		}
	end,
	function(arg_328_0)
		if arg_328_0 == "closed" then
			return "locked"
		else
			return "unlocked"
		end
	end,
	function()
		var_329_0 = depends("io-utils")
		
		return var_329_0.createActivateMode(var_329_0.standardReceiver.switchActivationMode, var_329_0.standardReceiver.temporizedOnModeParameter)
	end,
	function(arg_330_0)
		if type(arg_330_0) == "string" then
			if arg_330_0 == "memorized1" or arg_330_0 == "my" then
				return 55296
			end
		else
			return arg_330_0 * 512
		end
	end,
	function(arg_331_0)
		return arg_331_0 / 100 - 273.14999999999998
	end,
	function(arg_332_0, arg_332_1, arg_332_2, arg_332_3, arg_332_4, arg_332_5)
		var_332_0 = arg_332_0
		
		if arg_332_0 == 55306 then
			var_332_0 = arg_332_1
		elseif arg_332_0 == 55314 then
			var_332_0 = arg_332_2
		elseif arg_332_0 == 55311 then
			var_332_0 = arg_332_3
		elseif arg_332_0 == 55315 then
			var_332_0 = arg_332_4
		elseif arg_332_0 == 55318 then
			var_332_0 = arg_332_5
		else
			var_332_0 = arg_332_0
		end
		
		if var_332_0 == nil then
			return nil
		else
			return var_332_0 / 100 - 273.14999999999998
		end
	end,
	function(arg_333_0)
		if arg_333_0 == 0 then
			return 200
		else
			return 270
		end
	end,
	function(arg_334_0)
		return depends("common", "utils").round((arg_334_0 + 273.14999999999998) * 100)
	end,
	function(arg_335_0)
		var_335_0 = depends("common", "utils")
		
		if type(arg_335_0) == "string" then
			if arg_335_0 == "secured" then
				return 55306
			elseif arg_335_0 == "eco" then
				return 55314
			elseif arg_335_0 == "comfort" then
				return 55311
			elseif arg_335_0 == "halted" then
				return 55315
			elseif arg_335_0 == "anti-frost" then
				return 55318
			else
				return nil
			end
		else
			return var_335_0.round((arg_335_0 + 273.14999999999998) * 100)
		end
	end,
	function(arg_336_0)
		return bit.band(bit.rshift(arg_336_0[1], 6), 3)
	end,
	function(arg_337_0)
		if arg_337_0 == 0 then
			return "none"
		else
			return arg_337_0
		end
	end,
	function(arg_338_0)
		return arg_338_0[2]
	end,
	function(arg_339_0)
		return arg_339_0[1] / 2
	end,
	function(arg_340_0)
		return arg_340_0[2] / 2
	end,
	function(arg_341_0)
		var_341_0 = arg_341_0:readUInt32(7)
		
		if var_341_0 == 0 then
			return nil
		else
			return var_341_0 * 1000
		end
	end,
	function(arg_342_0)
		var_342_0 = arg_342_0:readUInt32(3)
		
		if var_342_0 == 0 then
			return nil
		else
			return var_342_0 * 1000
		end
	end,
	function(arg_343_0)
		return arg_343_0[3] / 2
	end,
	function(arg_344_0)
		return arg_344_0[5] / 2
	end,
	function(arg_345_0)
		return arg_345_0:readUInt8(2) / 2
	end,
	function(arg_346_0)
		return arg_346_0:readUInt8(3) / 2
	end,
	function(arg_347_0)
		return bit.band(arg_347_0[1], 1)
	end,
	function(arg_348_0)
		return ({
			[0] = "closed",
			"open"
		})[arg_348_0]
	end,
	function(arg_349_0)
		return ({
			[0] = "inactive",
			"active"
		})[arg_349_0]
	end,
	function(arg_350_0)
		return bit.band(bit.rshift(arg_350_0[1], 1), 1)
	end,
	function(arg_351_0)
		return ({
			[0] = "auto",
			"manual"
		})[arg_351_0]
	end,
	function(arg_352_0)
		var_352_0 = arg_352_0[1]
		
		if bit.band(var_352_0, 128) ~= 0 then
			return "lowBattery"
		elseif bit.band(var_352_0, 32) ~= 0 then
			return "maintenanceRequired"
		elseif bit.band(var_352_0, 64) ~= 0 then
			return "dead"
		else
			return nil
		end
	end,
	function(arg_353_0)
		return arg_353_0:readUInt8(6) / 2
	end,
	function(arg_354_0)
		var_354_0 = bit.band(arg_354_0[4], 128) ~= 0
		arg_354_0[4] = bit.band(arg_354_0[4], 127)
		var_354_1 = arg_354_0:readInt16(4)
		
		if var_354_0 then
			var_354_1 = -1 * var_354_1
		end
		
		return var_354_1 / 10
	end,
	function(arg_355_0)
		return depends("io-utils").SomfyHeatingSystem.getCalendar(arg_355_0)
	end,
	function(arg_356_0)
		return depends("io-utils").SomfyHeatingSystem.expandCalendar(arg_356_0)
	end,
	function(arg_357_0)
		return arg_357_0[2] / 2
	end,
	function(arg_358_0)
		return bit.band(bit.rshift(arg_358_0[1], 2), 1)
	end,
	function(arg_359_0)
		return ({
			[0] = "disable",
			"enable"
		})[arg_359_0]
	end,
	function(arg_360_0)
		return bit.band(bit.rshift(arg_360_0[1], 3), 31)
	end,
	function(arg_361_0)
		return depends("io-utils").SomfyHeatingSystem.modes[arg_361_0]
	end,
	function(arg_362_0)
		var_362_0 = arg_362_0[1]
		var_362_1 = bit.rshift(var_362_0, 3)
		var_362_2 = bit.band(var_362_1, 31)
		
		return ({
			[0] = "comfort",
			"away",
			"eco",
			"geofencingMode",
			"manual",
			"frostprotection",
			"suddenDropMode"
		})[var_362_2]
	end,
	function(arg_363_0)
		var_363_0 = arg_363_0[1]
		var_363_1 = bit.band(var_363_0, 7)
		
		return ({
			[0] = "date",
			"further_notice",
			"next_mode"
		})[var_363_1]
	end,
	function(arg_364_0)
		return arg_364_0[4] / 2
	end,
	function(arg_365_0)
		return ({
			[0] = "disable",
			"enable"
		})[arg_365_0]
	end,
	function(arg_366_0)
		return arg_366_0[6] / 2
	end,
	function(arg_367_0)
		var_367_0 = arg_367_0[1]
		var_367_1 = bit.rshift(var_367_0, 1)
		var_367_2 = bit.band(var_367_1, 15)
		
		return ({
			[0] = "pairing",
			"no_timestamp",
			"end_of_race_nok",
			"full_closed",
			"adjustment",
			"finished"
		})[var_367_2]
	end,
	function(arg_368_0, arg_368_1)
		var_368_0 = depends("io-utils")
		var_368_1 = var_368_0.SomfyHeatingSystem.setDerogation(0, "derog", arg_368_0, arg_368_1)
		
		return var_368_0.updateAndRefreshPublicState(var_368_1, 42529, 2)
	end,
	function(arg_369_0, arg_369_1, arg_369_2, arg_369_3, arg_369_4, arg_369_5)
		var_369_0 = depends("io-utils")
		var_369_1 = var_369_0.SomfyHeatingSystem.updateAllModeTemperatures(arg_369_0, arg_369_1, arg_369_2, arg_369_3, arg_369_4, arg_369_5)
		
		return var_369_0.updateAndRefreshPublicState(var_369_1, 42533, 2)
	end,
	function(arg_370_0, arg_370_1, arg_370_2, arg_370_3)
		var_370_0 = depends("io-utils")
		var_370_1 = var_370_0.SomfyHeatingSystem.updateDerogation(arg_370_0, arg_370_1, arg_370_2, arg_370_3)
		
		return var_370_0.updateAndRefreshPublicState(var_370_1, 42529, 2)
	end,
	function(arg_371_0, arg_371_1)
		var_371_0 = depends("io-utils")
		var_371_1 = var_371_0.SomfyHeatingSystem.setCalendar(arg_371_1)
		
		return var_371_0.updateAndRefreshPublicState(var_371_1, var_371_0.SomfyHeatingSystem.getCalendarStateId(arg_371_0), 2)
	end,
	function(arg_372_0, arg_372_1, arg_372_2)
		var_372_0 = depends("io-utils")
		var_372_1 = var_372_0.SomfyHeatingSystem.updateValveSettings(arg_372_0, arg_372_1, arg_372_2)
		
		return var_372_0.updateAndRefreshPublicState(var_372_1, 42532, 2)
	end,
	function(arg_373_0)
		return arg_373_0:readInt16(2) / 10
	end,
	function(arg_374_0, arg_374_1)
		var_374_0 = depends("io-utils")
		
		if type(arg_374_0) == "string" then
			if arg_374_0 == "rocker" then
				return var_374_0.createActivateFunc(55307, {
					{
						3,
						arg_374_1 * 512
					}
				})
			end
		elseif type(arg_374_0) == "number" then
			return var_374_0.createActivateFunc(arg_374_0 * 512, {
				{
					3,
					arg_374_1 * 512
				}
			})
		end
		
		return nil
	end,
	function(arg_375_0)
		return depends("io-utils").fromRawTemperatureValue(arg_375_0, 29315, 33515)
	end,
	function(arg_376_0, arg_376_1, arg_376_2, arg_376_3, arg_376_4, arg_376_5)
		var_376_0 = depends("io-utils")
		var_376_1 = arg_376_0
		
		if arg_376_0 == 55306 then
			var_376_1 = arg_376_1
		elseif arg_376_0 == 55314 then
			var_376_1 = arg_376_2
		elseif arg_376_0 == 55311 then
			var_376_1 = arg_376_3
		elseif arg_376_0 == 55315 then
			var_376_1 = arg_376_4
		elseif arg_376_0 == 55318 then
			var_376_1 = arg_376_5
		else
			var_376_1 = arg_376_0
		end
		
		if var_376_1 == nil then
			return nil
		else
			return var_376_0.fromRawTemperatureValue(var_376_1, 29315, 33515)
		end
	end,
	function(arg_377_0)
		var_377_0 = depends("io-utils")
		
		if arg_377_0 == nil then
			return nil
		else
			return var_377_0.fromRawTemperatureValue(arg_377_0, 29315, 33515)
		end
	end,
	function(arg_378_0)
		return depends("io-utils").toRawTemperatureValue(arg_378_0, 29315, 33515)
	end,
	function(arg_379_0)
		var_379_0 = depends("io-utils")
		
		if type(arg_379_0) == "string" then
			if arg_379_0 == "secured" then
				return 55306
			elseif arg_379_0 == "eco" then
				return 55314
			elseif arg_379_0 == "comfort" then
				return 55311
			elseif arg_379_0 == "halted" then
				return 55315
			elseif arg_379_0 == "anti-frost" then
				return 55318
			else
				return nil
			end
		else
			return var_379_0.toRawTemperatureValue(arg_379_0, 29315, 33515)
		end
	end,
	function(arg_380_0)
		return bit.band(bit.rshift(arg_380_0[1], 4), 3)
	end,
	function(arg_381_0)
		return bit.band(bit.rshift(arg_381_0[1], 3), 1)
	end,
	function(arg_382_0)
		return ({
			[0] = "heating",
			"cooling"
		})[arg_382_0]
	end,
	function(arg_383_0)
		return arg_383_0:readInt8(6) / 2
	end,
	function(arg_384_0)
		return arg_384_0:readInt8(5) / 10
	end,
	function(arg_385_0)
		var_385_0 = bit.band(arg_385_0[4], 128) ~= 0
		arg_385_0[4] = bit.band(arg_385_0[4], 127)
		var_385_1 = arg_385_0:readInt8(4)
		
		if var_385_0 then
			var_385_1 = -1 * var_385_1
		end
		
		return var_385_1 / 10
	end,
	function(arg_386_0, arg_386_1, arg_386_2)
		var_386_0 = depends("io-utils")
		var_386_1 = var_386_0.SomfyHeatingSystem.updateThermostatSettings(arg_386_0, arg_386_1, arg_386_2)
		
		return var_386_0.updateAndRefreshPublicState(var_386_1, 42532, 2)
	end,
	function(arg_387_0)
		return arg_387_0:readInt8(9)
	end,
	function(arg_388_0)
		return 100 - depends("io-utils").toPercentValue(arg_388_0)
	end,
	function(arg_389_0)
		if arg_389_0 == nil or #arg_389_0 < 2 then
			return nil
		end
		
		return arg_389_0:readUInt16(1)
	end,
	function(arg_390_0)
		return depends("io-atlantic-utils").readBit(arg_390_0[1], 1)
	end,
	function(arg_391_0)
		if arg_391_0 == 0 then
			return "off"
		else
			return "Heating"
		end
	end,
	function(arg_392_0)
		if arg_392_0 == 0 then
			return "Relaunch Disable"
		else
			return " Relaunch Enable"
		end
	end,
	function(arg_393_0)
		if arg_393_0 == 0 then
			return "off"
		elseif arg_393_0 == 1 then
			return "on"
		else
			return "prog"
		end
	end,
	function(arg_394_0)
		var_394_0 = nil
		var_394_1 = arg_394_0 == "off" and 0 or arg_394_0 == "on" and 1 or 2
		
		return bytearray({
			var_394_1
		})
	end,
	function(arg_395_0)
		return bytearray(2):writeInt16(1, arg_395_0 * 10, true)
	end,
	function(arg_396_0)
		if arg_396_0 == 0 then
			return "up"
		elseif arg_396_0 == 51200 then
			return "down"
		elseif arg_396_0 == 53760 then
			return "stop"
		end
		
		return nil
	end,
	function(arg_397_0, arg_397_1, arg_397_2)
		return depends("io-dynamic-actuator-controllables-adapter-utils").getFeatures("io:DynamicRollerShutterIOComponent", arg_397_0, arg_397_1, arg_397_2)
	end,
	function(arg_398_0)
		return arg_398_0 * 110
	end,
	function(arg_399_0, arg_399_1, arg_399_2)
		var_399_0 = depends("io-devices-settings-utils")
		var_399_1 = depends("common_utils")
		var_399_2 = depends("io-somfy-devices-settings-utils")
		
		return var_399_0.aggregateConfig({
			["84059651"] = arg_399_0,
			["65537"] = arg_399_1,
			["84059661"] = arg_399_2
		}, var_399_1.deepCopy(var_399_2.states_4504699139653634))
	end,
	function(arg_400_0)
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
	function(arg_401_0, arg_401_1, arg_401_2, arg_401_3, arg_401_4)
		var_401_0 = depends("io-devices-settings-utils")
		var_401_1 = depends("io-somfy-devices-settings-utils")
		var_401_2 = depends("common_utils")
		
		return var_401_0.runConfig(arg_401_0, arg_401_1, var_401_2.deepCopy(var_401_1.commands_4504699139653634), {
			["84059651"] = arg_401_2,
			["65537"] = arg_401_3,
			["84059661"] = arg_401_4
		}, var_401_2.deepCopy(var_401_1.states_4504699139653634), var_401_2.deepCopy(var_401_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_402_0, arg_402_1, arg_402_2, arg_402_3, arg_402_4)
		var_402_0 = depends("io-devices-settings-utils")
		var_402_1 = depends("common_utils")
		var_402_2 = depends("io-somfy-devices-settings-utils")
		
		return var_402_0.advancedRefresh(arg_402_0, arg_402_1, {
			["84059651"] = arg_402_2,
			["65537"] = arg_402_3,
			["84059661"] = arg_402_4
		}, var_402_1.deepCopy(var_402_2.states_4504699139653634), {}, var_402_1.deepCopy(var_402_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_403_0, arg_403_1, arg_403_2, arg_403_3)
		var_403_0 = depends("io-devices-settings-utils")
		var_403_1 = depends("common_utils")
		var_403_2 = depends("io-somfy-devices-settings-utils")
		
		return var_403_0.aggregateConfig({
			["84082687"] = arg_403_0,
			["65537"] = arg_403_1,
			["65540"] = arg_403_2,
			["48177664"] = arg_403_3
		}, var_403_1.deepCopy(var_403_2.states_4504699139129602))
	end,
	function(arg_404_0)
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
	function(arg_405_0, arg_405_1, arg_405_2, arg_405_3, arg_405_4, arg_405_5)
		var_405_0 = depends("io-devices-settings-utils")
		var_405_1 = depends("io-somfy-devices-settings-utils")
		var_405_2 = depends("common_utils")
		
		return var_405_0.runConfig(arg_405_0, arg_405_1, var_405_2.deepCopy(var_405_1.commands_4504699139129602), {
			["84082687"] = arg_405_2,
			["65537"] = arg_405_3,
			["65540"] = arg_405_4,
			["48177664"] = arg_405_5
		}, var_405_2.deepCopy(var_405_1.states_4504699139129602), var_405_2.deepCopy(var_405_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_406_0, arg_406_1, arg_406_2, arg_406_3, arg_406_4, arg_406_5)
		var_406_0 = depends("io-devices-settings-utils")
		var_406_1 = depends("common_utils")
		var_406_2 = depends("io-somfy-devices-settings-utils")
		
		return var_406_0.advancedRefresh(arg_406_0, arg_406_1, {
			["84082687"] = arg_406_2,
			["65537"] = arg_406_3,
			["65540"] = arg_406_4,
			["48177664"] = arg_406_5
		}, var_406_1.deepCopy(var_406_2.states_4504699139129602), {}, var_406_1.deepCopy(var_406_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_407_0, arg_407_1, arg_407_2, arg_407_3)
		var_407_0 = depends("io-devices-settings-utils")
		var_407_1 = depends("common_utils")
		var_407_2 = depends("io-somfy-devices-settings-utils")
		
		return var_407_0.aggregateConfig({
			["84082687"] = arg_407_0,
			["65537"] = arg_407_1,
			["65540"] = arg_407_2,
			["48177664"] = arg_407_3
		}, var_407_1.deepCopy(var_407_2.states_4505798650757378))
	end,
	function(arg_408_0, arg_408_1, arg_408_2, arg_408_3, arg_408_4, arg_408_5)
		var_408_0 = depends("io-devices-settings-utils")
		var_408_1 = depends("io-somfy-devices-settings-utils")
		var_408_2 = depends("common_utils")
		
		return var_408_0.runConfig(arg_408_0, arg_408_1, var_408_2.deepCopy(var_408_1.commands_4504699139129602), {
			["84082687"] = arg_408_2,
			["65537"] = arg_408_3,
			["65540"] = arg_408_4,
			["48177664"] = arg_408_5
		}, var_408_2.deepCopy(var_408_1.states_4505798650757378), var_408_2.deepCopy(var_408_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_409_0, arg_409_1, arg_409_2, arg_409_3, arg_409_4, arg_409_5)
		var_409_0 = depends("io-devices-settings-utils")
		var_409_1 = depends("common_utils")
		var_409_2 = depends("io-somfy-devices-settings-utils")
		
		return var_409_0.advancedRefresh(arg_409_0, arg_409_1, {
			["84082687"] = arg_409_2,
			["65537"] = arg_409_3,
			["65540"] = arg_409_4,
			["48177664"] = arg_409_5
		}, var_409_1.deepCopy(var_409_2.states_4505798650757378), {}, var_409_1.deepCopy(var_409_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_410_0, arg_410_1)
		var_410_0 = depends("io-devices-settings-utils")
		var_410_1 = depends("common_utils")
		var_410_2 = depends("io-somfy-devices-settings-utils")
		
		return var_410_0.aggregateConfig({
			["84082687"] = arg_410_0,
			["65537"] = arg_410_1
		}, var_410_1.deepCopy(var_410_2.states_4504699139129346))
	end,
	function(arg_411_0, arg_411_1, arg_411_2, arg_411_3)
		var_411_0 = depends("io-devices-settings-utils")
		var_411_1 = depends("io-somfy-devices-settings-utils")
		var_411_2 = depends("common_utils")
		
		return var_411_0.runConfig(arg_411_0, arg_411_1, var_411_2.deepCopy(var_411_1.commands_4504699139129346), {
			["84082687"] = arg_411_2,
			["65537"] = arg_411_3
		}, var_411_2.deepCopy(var_411_1.states_4504699139129346), var_411_2.deepCopy(var_411_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_412_0, arg_412_1, arg_412_2, arg_412_3)
		var_412_0 = depends("io-devices-settings-utils")
		var_412_1 = depends("common_utils")
		var_412_2 = depends("io-somfy-devices-settings-utils")
		
		return var_412_0.advancedRefresh(arg_412_0, arg_412_1, {
			["84082687"] = arg_412_2,
			["65537"] = arg_412_3
		}, var_412_1.deepCopy(var_412_2.states_4504699139129346), {}, var_412_1.deepCopy(var_412_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_413_0, arg_413_1, arg_413_2, arg_413_3, arg_413_4, arg_413_5, arg_413_6, arg_413_7, arg_413_8, arg_413_9, arg_413_10, arg_413_11, arg_413_12, arg_413_13, arg_413_14, arg_413_15, arg_413_16, arg_413_17, arg_413_18, arg_413_19, arg_413_20, arg_413_21, arg_413_22, arg_413_23, arg_413_24, arg_413_25, arg_413_26, arg_413_27, arg_413_28, arg_413_29, arg_413_30, arg_413_31, arg_413_32, arg_413_33, arg_413_34, arg_413_35, arg_413_36)
		var_413_0 = depends("io-devices-settings-utils")
		var_413_1 = depends("common_utils")
		var_413_2 = depends("io-somfy-devices-settings-utils")
		
		return var_413_0.aggregateConfig({
			["84058662"] = arg_413_0,
			["65537"] = arg_413_1,
			["84058391"] = arg_413_2,
			["49217792"] = arg_413_3,
			["84058368"] = arg_413_4,
			["84058369"] = arg_413_5,
			["84058370"] = arg_413_6,
			["84058371"] = arg_413_7,
			["84058372"] = arg_413_8,
			["84058393"] = arg_413_9,
			["84058394"] = arg_413_10,
			["84058395"] = arg_413_11,
			["84058396"] = arg_413_12,
			["84058373"] = arg_413_13,
			["84058397"] = arg_413_14,
			["84058398"] = arg_413_15,
			["84058399"] = arg_413_16,
			["84058400"] = arg_413_17,
			["84058401"] = arg_413_18,
			["84058375"] = arg_413_19,
			["84058376"] = arg_413_20,
			["84058374"] = arg_413_21,
			["84058377"] = arg_413_22,
			["84058412"] = arg_413_23,
			["84058411"] = arg_413_24,
			["84058378"] = arg_413_25,
			["84058379"] = arg_413_26,
			["84058402"] = arg_413_27,
			["84058380"] = arg_413_28,
			["84058381"] = arg_413_29,
			["84058382"] = arg_413_30,
			["84058383"] = arg_413_31,
			["84058384"] = arg_413_32,
			["84058385"] = arg_413_33,
			["84058386"] = arg_413_34,
			["84058387"] = arg_413_35,
			["84058409"] = arg_413_36
		}, var_413_1.deepCopy(var_413_2.states_4504699139471874))
	end,
	function(arg_414_0)
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
	function(arg_415_0, arg_415_1, arg_415_2, arg_415_3, arg_415_4, arg_415_5, arg_415_6, arg_415_7, arg_415_8, arg_415_9, arg_415_10, arg_415_11, arg_415_12, arg_415_13, arg_415_14, arg_415_15, arg_415_16, arg_415_17, arg_415_18, arg_415_19, arg_415_20, arg_415_21, arg_415_22, arg_415_23, arg_415_24, arg_415_25, arg_415_26, arg_415_27, arg_415_28, arg_415_29, arg_415_30, arg_415_31, arg_415_32, arg_415_33, arg_415_34, arg_415_35, arg_415_36, arg_415_37, arg_415_38)
		var_415_0 = depends("io-devices-settings-utils")
		var_415_1 = depends("io-somfy-devices-settings-utils")
		var_415_2 = depends("common_utils")
		
		return var_415_0.runConfig(arg_415_0, arg_415_1, var_415_2.deepCopy(var_415_1.commands_4504699139471874), {
			["84058662"] = arg_415_2,
			["65537"] = arg_415_3,
			["84058391"] = arg_415_4,
			["49217792"] = arg_415_5,
			["84058368"] = arg_415_6,
			["84058369"] = arg_415_7,
			["84058370"] = arg_415_8,
			["84058371"] = arg_415_9,
			["84058372"] = arg_415_10,
			["84058393"] = arg_415_11,
			["84058394"] = arg_415_12,
			["84058395"] = arg_415_13,
			["84058396"] = arg_415_14,
			["84058373"] = arg_415_15,
			["84058397"] = arg_415_16,
			["84058398"] = arg_415_17,
			["84058399"] = arg_415_18,
			["84058400"] = arg_415_19,
			["84058401"] = arg_415_20,
			["84058375"] = arg_415_21,
			["84058376"] = arg_415_22,
			["84058374"] = arg_415_23,
			["84058377"] = arg_415_24,
			["84058412"] = arg_415_25,
			["84058411"] = arg_415_26,
			["84058378"] = arg_415_27,
			["84058379"] = arg_415_28,
			["84058402"] = arg_415_29,
			["84058380"] = arg_415_30,
			["84058381"] = arg_415_31,
			["84058382"] = arg_415_32,
			["84058383"] = arg_415_33,
			["84058384"] = arg_415_34,
			["84058385"] = arg_415_35,
			["84058386"] = arg_415_36,
			["84058387"] = arg_415_37,
			["84058409"] = arg_415_38
		}, var_415_2.deepCopy(var_415_1.states_4504699139471874), var_415_2.deepCopy(var_415_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_416_0, arg_416_1, arg_416_2, arg_416_3, arg_416_4, arg_416_5, arg_416_6, arg_416_7, arg_416_8, arg_416_9, arg_416_10, arg_416_11, arg_416_12, arg_416_13, arg_416_14, arg_416_15, arg_416_16, arg_416_17, arg_416_18, arg_416_19, arg_416_20, arg_416_21, arg_416_22, arg_416_23, arg_416_24, arg_416_25, arg_416_26, arg_416_27, arg_416_28, arg_416_29, arg_416_30, arg_416_31, arg_416_32, arg_416_33, arg_416_34, arg_416_35, arg_416_36, arg_416_37, arg_416_38)
		var_416_0 = depends("io-devices-settings-utils")
		var_416_1 = depends("common_utils")
		var_416_2 = depends("io-somfy-devices-settings-utils")
		
		return var_416_0.advancedRefresh(arg_416_0, arg_416_1, {
			["84058662"] = arg_416_2,
			["65537"] = arg_416_3,
			["84058391"] = arg_416_4,
			["49217792"] = arg_416_5,
			["84058368"] = arg_416_6,
			["84058369"] = arg_416_7,
			["84058370"] = arg_416_8,
			["84058371"] = arg_416_9,
			["84058372"] = arg_416_10,
			["84058393"] = arg_416_11,
			["84058394"] = arg_416_12,
			["84058395"] = arg_416_13,
			["84058396"] = arg_416_14,
			["84058373"] = arg_416_15,
			["84058397"] = arg_416_16,
			["84058398"] = arg_416_17,
			["84058399"] = arg_416_18,
			["84058400"] = arg_416_19,
			["84058401"] = arg_416_20,
			["84058375"] = arg_416_21,
			["84058376"] = arg_416_22,
			["84058374"] = arg_416_23,
			["84058377"] = arg_416_24,
			["84058412"] = arg_416_25,
			["84058411"] = arg_416_26,
			["84058378"] = arg_416_27,
			["84058379"] = arg_416_28,
			["84058402"] = arg_416_29,
			["84058380"] = arg_416_30,
			["84058381"] = arg_416_31,
			["84058382"] = arg_416_32,
			["84058383"] = arg_416_33,
			["84058384"] = arg_416_34,
			["84058385"] = arg_416_35,
			["84058386"] = arg_416_36,
			["84058387"] = arg_416_37,
			["84058409"] = arg_416_38
		}, var_416_1.deepCopy(var_416_2.states_4504699139471874), {}, var_416_1.deepCopy(var_416_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_417_0, arg_417_1, arg_417_2, arg_417_3, arg_417_4, arg_417_5, arg_417_6, arg_417_7, arg_417_8, arg_417_9, arg_417_10, arg_417_11, arg_417_12, arg_417_13, arg_417_14)
		var_417_0 = depends("io-devices-settings-utils")
		var_417_1 = depends("common_utils")
		var_417_2 = depends("io-somfy-devices-settings-utils")
		
		return var_417_0.aggregateConfig({
			["84058662"] = arg_417_0,
			["65537"] = arg_417_1,
			["84058674"] = arg_417_2,
			["84058391"] = arg_417_3,
			["84058697"] = arg_417_4,
			["49217792"] = arg_417_5,
			["84058368"] = arg_417_6,
			["84058420"] = arg_417_7,
			["84058375"] = arg_417_8,
			["84058376"] = arg_417_9,
			["84058374"] = arg_417_10,
			["84058377"] = arg_417_11,
			["84058411"] = arg_417_12,
			["84058390"] = arg_417_13,
			["84058409"] = arg_417_14
		}, var_417_1.deepCopy(var_417_2.states_4504699139340802))
	end,
	function(arg_418_0)
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
	function(arg_419_0, arg_419_1, arg_419_2, arg_419_3, arg_419_4, arg_419_5, arg_419_6, arg_419_7, arg_419_8, arg_419_9, arg_419_10, arg_419_11, arg_419_12, arg_419_13, arg_419_14, arg_419_15, arg_419_16)
		var_419_0 = depends("io-devices-settings-utils")
		var_419_1 = depends("io-somfy-devices-settings-utils")
		var_419_2 = depends("common_utils")
		
		return var_419_0.runConfig(arg_419_0, arg_419_1, var_419_2.deepCopy(var_419_1.commands_4504699139340802), {
			["84058662"] = arg_419_2,
			["65537"] = arg_419_3,
			["84058674"] = arg_419_4,
			["84058391"] = arg_419_5,
			["84058697"] = arg_419_6,
			["49217792"] = arg_419_7,
			["84058368"] = arg_419_8,
			["84058420"] = arg_419_9,
			["84058375"] = arg_419_10,
			["84058376"] = arg_419_11,
			["84058374"] = arg_419_12,
			["84058377"] = arg_419_13,
			["84058411"] = arg_419_14,
			["84058390"] = arg_419_15,
			["84058409"] = arg_419_16
		}, var_419_2.deepCopy(var_419_1.states_4504699139340802), var_419_2.deepCopy(var_419_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_420_0, arg_420_1, arg_420_2, arg_420_3, arg_420_4, arg_420_5, arg_420_6, arg_420_7, arg_420_8, arg_420_9, arg_420_10, arg_420_11, arg_420_12, arg_420_13, arg_420_14, arg_420_15, arg_420_16)
		var_420_0 = depends("io-devices-settings-utils")
		var_420_1 = depends("common_utils")
		var_420_2 = depends("io-somfy-devices-settings-utils")
		
		return var_420_0.advancedRefresh(arg_420_0, arg_420_1, {
			["84058662"] = arg_420_2,
			["65537"] = arg_420_3,
			["84058674"] = arg_420_4,
			["84058391"] = arg_420_5,
			["84058697"] = arg_420_6,
			["49217792"] = arg_420_7,
			["84058368"] = arg_420_8,
			["84058420"] = arg_420_9,
			["84058375"] = arg_420_10,
			["84058376"] = arg_420_11,
			["84058374"] = arg_420_12,
			["84058377"] = arg_420_13,
			["84058411"] = arg_420_14,
			["84058390"] = arg_420_15,
			["84058409"] = arg_420_16
		}, var_420_1.deepCopy(var_420_2.states_4504699139340802), {}, var_420_1.deepCopy(var_420_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_421_0, arg_421_1, arg_421_2, arg_421_3)
		var_421_0 = depends("io-devices-settings-utils")
		var_421_1 = depends("common_utils")
		var_421_2 = depends("io-somfy-devices-settings-utils")
		
		return var_421_0.aggregateConfig({
			["84059651"] = arg_421_0,
			["65537"] = arg_421_1,
			["84059661"] = arg_421_2,
			["48177664"] = arg_421_3
		}, var_421_1.deepCopy(var_421_2.states_4504699140112386))
	end,
	function(arg_422_0)
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
	function(arg_423_0, arg_423_1, arg_423_2, arg_423_3, arg_423_4, arg_423_5)
		var_423_0 = depends("io-devices-settings-utils")
		var_423_1 = depends("io-somfy-devices-settings-utils")
		var_423_2 = depends("common_utils")
		
		return var_423_0.runConfig(arg_423_0, arg_423_1, var_423_2.deepCopy(var_423_1.commands_4504699140112386), {
			["84059651"] = arg_423_2,
			["65537"] = arg_423_3,
			["84059661"] = arg_423_4,
			["48177664"] = arg_423_5
		}, var_423_2.deepCopy(var_423_1.states_4504699140112386), var_423_2.deepCopy(var_423_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_424_0, arg_424_1, arg_424_2, arg_424_3, arg_424_4, arg_424_5)
		var_424_0 = depends("io-devices-settings-utils")
		var_424_1 = depends("common_utils")
		var_424_2 = depends("io-somfy-devices-settings-utils")
		
		return var_424_0.advancedRefresh(arg_424_0, arg_424_1, {
			["84059651"] = arg_424_2,
			["65537"] = arg_424_3,
			["84059661"] = arg_424_4,
			["48177664"] = arg_424_5
		}, var_424_1.deepCopy(var_424_2.states_4504699140112386), {}, var_424_1.deepCopy(var_424_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_425_0, arg_425_1, arg_425_2, arg_425_3, arg_425_4)
		var_425_0 = depends("io-devices-settings-utils")
		var_425_1 = depends("common_utils")
		var_425_2 = depends("io-somfy-devices-settings-utils")
		
		return var_425_0.aggregateConfig({
			["84059651"] = arg_425_0,
			["65537"] = arg_425_1,
			["84059661"] = arg_425_2,
			["65540"] = arg_425_3,
			["48177664"] = arg_425_4
		}, var_425_1.deepCopy(var_425_2.states_4509097186623490))
	end,
	function(arg_426_0)
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
	function(arg_427_0, arg_427_1, arg_427_2, arg_427_3, arg_427_4, arg_427_5, arg_427_6)
		var_427_0 = depends("io-devices-settings-utils")
		var_427_1 = depends("io-somfy-devices-settings-utils")
		var_427_2 = depends("common_utils")
		
		return var_427_0.runConfig(arg_427_0, arg_427_1, var_427_2.deepCopy(var_427_1.commands_4509097186623490), {
			["84059651"] = arg_427_2,
			["65537"] = arg_427_3,
			["84059661"] = arg_427_4,
			["65540"] = arg_427_5,
			["48177664"] = arg_427_6
		}, var_427_2.deepCopy(var_427_1.states_4509097186623490), var_427_2.deepCopy(var_427_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_428_0, arg_428_1, arg_428_2, arg_428_3, arg_428_4, arg_428_5, arg_428_6)
		var_428_0 = depends("io-devices-settings-utils")
		var_428_1 = depends("common_utils")
		var_428_2 = depends("io-somfy-devices-settings-utils")
		
		return var_428_0.advancedRefresh(arg_428_0, arg_428_1, {
			["84059651"] = arg_428_2,
			["65537"] = arg_428_3,
			["84059661"] = arg_428_4,
			["65540"] = arg_428_5,
			["48177664"] = arg_428_6
		}, var_428_1.deepCopy(var_428_2.states_4509097186623490), {}, var_428_1.deepCopy(var_428_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_429_0, arg_429_1, arg_429_2, arg_429_3, arg_429_4, arg_429_5, arg_429_6, arg_429_7, arg_429_8, arg_429_9, arg_429_10, arg_429_11, arg_429_12, arg_429_13, arg_429_14, arg_429_15, arg_429_16, arg_429_17, arg_429_18, arg_429_19, arg_429_20, arg_429_21, arg_429_22, arg_429_23, arg_429_24, arg_429_25, arg_429_26, arg_429_27, arg_429_28, arg_429_29, arg_429_30, arg_429_31)
		var_429_0 = depends("io-devices-settings-utils")
		var_429_1 = depends("common_utils")
		var_429_2 = depends("io-somfy-devices-settings-utils")
		
		return var_429_0.aggregateConfig({
			["84058662"] = arg_429_0,
			["65537"] = arg_429_1,
			["84058391"] = arg_429_2,
			["49217792"] = arg_429_3,
			["84058368"] = arg_429_4,
			["84058369"] = arg_429_5,
			["84058370"] = arg_429_6,
			["84058371"] = arg_429_7,
			["84058372"] = arg_429_8,
			["84058406"] = arg_429_9,
			["84058392"] = arg_429_10,
			["84058393"] = arg_429_11,
			["84058394"] = arg_429_12,
			["84058395"] = arg_429_13,
			["84058396"] = arg_429_14,
			["84058373"] = arg_429_15,
			["84058397"] = arg_429_16,
			["84058398"] = arg_429_17,
			["84058399"] = arg_429_18,
			["84058400"] = arg_429_19,
			["84058375"] = arg_429_20,
			["84058376"] = arg_429_21,
			["84058374"] = arg_429_22,
			["84058377"] = arg_429_23,
			["84058412"] = arg_429_24,
			["84058411"] = arg_429_25,
			["84058380"] = arg_429_26,
			["84058381"] = arg_429_27,
			["84058382"] = arg_429_28,
			["84058383"] = arg_429_29,
			["84058390"] = arg_429_30,
			["84058409"] = arg_429_31
		}, var_429_1.deepCopy(var_429_2.states_4512395720866306))
	end,
	function(arg_430_0)
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
	function(arg_431_0, arg_431_1, arg_431_2, arg_431_3, arg_431_4, arg_431_5, arg_431_6, arg_431_7, arg_431_8, arg_431_9, arg_431_10, arg_431_11, arg_431_12, arg_431_13, arg_431_14, arg_431_15, arg_431_16, arg_431_17, arg_431_18, arg_431_19, arg_431_20, arg_431_21, arg_431_22, arg_431_23, arg_431_24, arg_431_25, arg_431_26, arg_431_27, arg_431_28, arg_431_29, arg_431_30, arg_431_31, arg_431_32, arg_431_33)
		var_431_0 = depends("io-devices-settings-utils")
		var_431_1 = depends("io-somfy-devices-settings-utils")
		var_431_2 = depends("common_utils")
		
		return var_431_0.runConfig(arg_431_0, arg_431_1, var_431_2.deepCopy(var_431_1.commands_4512395720866306), {
			["84058662"] = arg_431_2,
			["65537"] = arg_431_3,
			["84058391"] = arg_431_4,
			["49217792"] = arg_431_5,
			["84058368"] = arg_431_6,
			["84058369"] = arg_431_7,
			["84058370"] = arg_431_8,
			["84058371"] = arg_431_9,
			["84058372"] = arg_431_10,
			["84058406"] = arg_431_11,
			["84058392"] = arg_431_12,
			["84058393"] = arg_431_13,
			["84058394"] = arg_431_14,
			["84058395"] = arg_431_15,
			["84058396"] = arg_431_16,
			["84058373"] = arg_431_17,
			["84058397"] = arg_431_18,
			["84058398"] = arg_431_19,
			["84058399"] = arg_431_20,
			["84058400"] = arg_431_21,
			["84058375"] = arg_431_22,
			["84058376"] = arg_431_23,
			["84058374"] = arg_431_24,
			["84058377"] = arg_431_25,
			["84058412"] = arg_431_26,
			["84058411"] = arg_431_27,
			["84058380"] = arg_431_28,
			["84058381"] = arg_431_29,
			["84058382"] = arg_431_30,
			["84058383"] = arg_431_31,
			["84058390"] = arg_431_32,
			["84058409"] = arg_431_33
		}, var_431_2.deepCopy(var_431_1.states_4512395720866306), var_431_2.deepCopy(var_431_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_432_0, arg_432_1, arg_432_2, arg_432_3, arg_432_4, arg_432_5, arg_432_6, arg_432_7, arg_432_8, arg_432_9, arg_432_10, arg_432_11, arg_432_12, arg_432_13, arg_432_14, arg_432_15, arg_432_16, arg_432_17, arg_432_18, arg_432_19, arg_432_20, arg_432_21, arg_432_22, arg_432_23, arg_432_24, arg_432_25, arg_432_26, arg_432_27, arg_432_28, arg_432_29, arg_432_30, arg_432_31, arg_432_32, arg_432_33)
		var_432_0 = depends("io-devices-settings-utils")
		var_432_1 = depends("common_utils")
		var_432_2 = depends("io-somfy-devices-settings-utils")
		
		return var_432_0.advancedRefresh(arg_432_0, arg_432_1, {
			["84058662"] = arg_432_2,
			["65537"] = arg_432_3,
			["84058391"] = arg_432_4,
			["49217792"] = arg_432_5,
			["84058368"] = arg_432_6,
			["84058369"] = arg_432_7,
			["84058370"] = arg_432_8,
			["84058371"] = arg_432_9,
			["84058372"] = arg_432_10,
			["84058406"] = arg_432_11,
			["84058392"] = arg_432_12,
			["84058393"] = arg_432_13,
			["84058394"] = arg_432_14,
			["84058395"] = arg_432_15,
			["84058396"] = arg_432_16,
			["84058373"] = arg_432_17,
			["84058397"] = arg_432_18,
			["84058398"] = arg_432_19,
			["84058399"] = arg_432_20,
			["84058400"] = arg_432_21,
			["84058375"] = arg_432_22,
			["84058376"] = arg_432_23,
			["84058374"] = arg_432_24,
			["84058377"] = arg_432_25,
			["84058412"] = arg_432_26,
			["84058411"] = arg_432_27,
			["84058380"] = arg_432_28,
			["84058381"] = arg_432_29,
			["84058382"] = arg_432_30,
			["84058383"] = arg_432_31,
			["84058390"] = arg_432_32,
			["84058409"] = arg_432_33
		}, var_432_1.deepCopy(var_432_2.states_4512395720866306), {}, var_432_1.deepCopy(var_432_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_433_0, arg_433_1, arg_433_2, arg_433_3, arg_433_4, arg_433_5, arg_433_6, arg_433_7, arg_433_8, arg_433_9, arg_433_10, arg_433_11, arg_433_12, arg_433_13, arg_433_14)
		var_433_0 = depends("io-devices-settings-utils")
		var_433_1 = depends("common_utils")
		var_433_2 = depends("io-somfy-devices-settings-utils")
		
		return var_433_0.aggregateConfig({
			["84058662"] = arg_433_0,
			["65537"] = arg_433_1,
			["84058391"] = arg_433_2,
			["84058392"] = arg_433_3,
			["84058697"] = arg_433_4,
			["49217792"] = arg_433_5,
			["84058368"] = arg_433_6,
			["84058420"] = arg_433_7,
			["84058375"] = arg_433_8,
			["84058376"] = arg_433_9,
			["84058374"] = arg_433_10,
			["84058377"] = arg_433_11,
			["84058411"] = arg_433_12,
			["84058390"] = arg_433_13,
			["84058409"] = arg_433_14
		}, var_433_1.deepCopy(var_433_2.states_4516793767377410))
	end,
	function(arg_434_0)
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
	function(arg_435_0, arg_435_1, arg_435_2, arg_435_3, arg_435_4, arg_435_5, arg_435_6, arg_435_7, arg_435_8, arg_435_9, arg_435_10, arg_435_11, arg_435_12, arg_435_13, arg_435_14, arg_435_15, arg_435_16)
		var_435_0 = depends("io-devices-settings-utils")
		var_435_1 = depends("io-somfy-devices-settings-utils")
		var_435_2 = depends("common_utils")
		
		return var_435_0.runConfig(arg_435_0, arg_435_1, var_435_2.deepCopy(var_435_1.commands_4516793767377410), {
			["84058662"] = arg_435_2,
			["65537"] = arg_435_3,
			["84058391"] = arg_435_4,
			["84058392"] = arg_435_5,
			["84058697"] = arg_435_6,
			["49217792"] = arg_435_7,
			["84058368"] = arg_435_8,
			["84058420"] = arg_435_9,
			["84058375"] = arg_435_10,
			["84058376"] = arg_435_11,
			["84058374"] = arg_435_12,
			["84058377"] = arg_435_13,
			["84058411"] = arg_435_14,
			["84058390"] = arg_435_15,
			["84058409"] = arg_435_16
		}, var_435_2.deepCopy(var_435_1.states_4516793767377410), var_435_2.deepCopy(var_435_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_436_0, arg_436_1, arg_436_2, arg_436_3, arg_436_4, arg_436_5, arg_436_6, arg_436_7, arg_436_8, arg_436_9, arg_436_10, arg_436_11, arg_436_12, arg_436_13, arg_436_14, arg_436_15, arg_436_16)
		var_436_0 = depends("io-devices-settings-utils")
		var_436_1 = depends("common_utils")
		var_436_2 = depends("io-somfy-devices-settings-utils")
		
		return var_436_0.advancedRefresh(arg_436_0, arg_436_1, {
			["84058662"] = arg_436_2,
			["65537"] = arg_436_3,
			["84058391"] = arg_436_4,
			["84058392"] = arg_436_5,
			["84058697"] = arg_436_6,
			["49217792"] = arg_436_7,
			["84058368"] = arg_436_8,
			["84058420"] = arg_436_9,
			["84058375"] = arg_436_10,
			["84058376"] = arg_436_11,
			["84058374"] = arg_436_12,
			["84058377"] = arg_436_13,
			["84058411"] = arg_436_14,
			["84058390"] = arg_436_15,
			["84058409"] = arg_436_16
		}, var_436_1.deepCopy(var_436_2.states_4516793767377410), {}, var_436_1.deepCopy(var_436_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_437_0, arg_437_1)
		var_437_0 = depends("io-devices-settings-utils")
		var_437_1 = depends("common_utils")
		var_437_2 = depends("io-somfy-devices-settings-utils")
		
		return var_437_0.aggregateConfig({
			["84059651"] = arg_437_0,
			["65537"] = arg_437_1
		}, var_437_1.deepCopy(var_437_2.states_4504699140389378))
	end,
	function(arg_438_0)
		return {
			"save_my_position",
			"delete_my_position",
			"set_timeout_timer",
			"set_timeout_timer_value",
			"reset_actuator",
			"double_power_cut"
		}
	end,
	function(arg_439_0, arg_439_1, arg_439_2, arg_439_3)
		var_439_0 = depends("io-devices-settings-utils")
		var_439_1 = depends("io-somfy-devices-settings-utils")
		var_439_2 = depends("common_utils")
		
		return var_439_0.runConfig(arg_439_0, arg_439_1, var_439_2.deepCopy(var_439_1.commands_4504699140389378), {
			["84059651"] = arg_439_2,
			["65537"] = arg_439_3
		}, var_439_2.deepCopy(var_439_1.states_4504699140389378), var_439_2.deepCopy(var_439_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_440_0, arg_440_1, arg_440_2, arg_440_3)
		var_440_0 = depends("io-devices-settings-utils")
		var_440_1 = depends("common_utils")
		var_440_2 = depends("io-somfy-devices-settings-utils")
		
		return var_440_0.advancedRefresh(arg_440_0, arg_440_1, {
			["84059651"] = arg_440_2,
			["65537"] = arg_440_3
		}, var_440_1.deepCopy(var_440_2.states_4504699140389378), {}, var_440_1.deepCopy(var_440_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_441_0, arg_441_1, arg_441_2, arg_441_3, arg_441_4)
		var_441_0 = depends("io-devices-settings-utils")
		var_441_1 = depends("io-somfy-devices-settings-utils")
		var_441_2 = depends("common_utils")
		
		return var_441_0.runConfig(arg_441_0, arg_441_1, var_441_2.deepCopy(var_441_1.commands_4506898162385154), {
			["84059651"] = arg_441_2,
			["65537"] = arg_441_3,
			["84059661"] = arg_441_4
		}, var_441_2.deepCopy(var_441_1.states_4504699139653634), var_441_2.deepCopy(var_441_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_442_0)
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
	function(arg_443_0, arg_443_1, arg_443_2, arg_443_3, arg_443_4)
		var_443_0 = depends("io-devices-settings-utils")
		var_443_1 = depends("io-somfy-devices-settings-utils")
		var_443_2 = depends("common_utils")
		
		return var_443_0.runConfig(arg_443_0, arg_443_1, var_443_2.deepCopy(var_443_1.commands_4505798650757122), {
			["84059651"] = arg_443_2,
			["65537"] = arg_443_3,
			["84059661"] = arg_443_4
		}, var_443_2.deepCopy(var_443_1.states_4504699139653634), var_443_2.deepCopy(var_443_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_444_0, arg_444_1, arg_444_2, arg_444_3, arg_444_4, arg_444_5, arg_444_6, arg_444_7, arg_444_8, arg_444_9, arg_444_10, arg_444_11, arg_444_12, arg_444_13, arg_444_14, arg_444_15, arg_444_16, arg_444_17, arg_444_18, arg_444_19, arg_444_20, arg_444_21, arg_444_22, arg_444_23, arg_444_24, arg_444_25, arg_444_26, arg_444_27, arg_444_28, arg_444_29, arg_444_30, arg_444_31, arg_444_32, arg_444_33, arg_444_34, arg_444_35, arg_444_36, arg_444_37)
		var_444_0 = depends("io-devices-settings-utils")
		var_444_1 = depends("common_utils")
		var_444_2 = depends("io-somfy-devices-settings-utils")
		
		return var_444_0.aggregateConfig({
			["84058662"] = arg_444_0,
			["65537"] = arg_444_1,
			["84058391"] = arg_444_2,
			["49217792"] = arg_444_3,
			["84058368"] = arg_444_4,
			["84058369"] = arg_444_5,
			["84058370"] = arg_444_6,
			["84058371"] = arg_444_7,
			["84058372"] = arg_444_8,
			["84058393"] = arg_444_9,
			["84058394"] = arg_444_10,
			["84058395"] = arg_444_11,
			["84058396"] = arg_444_12,
			["84058373"] = arg_444_13,
			["84058397"] = arg_444_14,
			["84058398"] = arg_444_15,
			["84058399"] = arg_444_16,
			["84058400"] = arg_444_17,
			["84058401"] = arg_444_18,
			["84058375"] = arg_444_19,
			["84058376"] = arg_444_20,
			["84058374"] = arg_444_21,
			["84058377"] = arg_444_22,
			["84058412"] = arg_444_23,
			["84058411"] = arg_444_24,
			["84058378"] = arg_444_25,
			["84058379"] = arg_444_26,
			["84058402"] = arg_444_27,
			["84058404"] = arg_444_28,
			["84058380"] = arg_444_29,
			["84058381"] = arg_444_30,
			["84058382"] = arg_444_31,
			["84058383"] = arg_444_32,
			["84058384"] = arg_444_33,
			["84058385"] = arg_444_34,
			["84058386"] = arg_444_35,
			["84058387"] = arg_444_36,
			["84058409"] = arg_444_37
		}, var_444_1.deepCopy(var_444_2.states_4527788883655170))
	end,
	function(arg_445_0)
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
	function(arg_446_0, arg_446_1, arg_446_2, arg_446_3, arg_446_4, arg_446_5, arg_446_6, arg_446_7, arg_446_8, arg_446_9, arg_446_10, arg_446_11, arg_446_12, arg_446_13, arg_446_14, arg_446_15, arg_446_16, arg_446_17, arg_446_18, arg_446_19, arg_446_20, arg_446_21, arg_446_22, arg_446_23, arg_446_24, arg_446_25, arg_446_26, arg_446_27, arg_446_28, arg_446_29, arg_446_30, arg_446_31, arg_446_32, arg_446_33, arg_446_34, arg_446_35, arg_446_36, arg_446_37, arg_446_38, arg_446_39)
		var_446_0 = depends("io-devices-settings-utils")
		var_446_1 = depends("io-somfy-devices-settings-utils")
		var_446_2 = depends("common_utils")
		
		return var_446_0.runConfig(arg_446_0, arg_446_1, var_446_2.deepCopy(var_446_1.commands_4527788883655170), {
			["84058662"] = arg_446_2,
			["65537"] = arg_446_3,
			["84058391"] = arg_446_4,
			["49217792"] = arg_446_5,
			["84058368"] = arg_446_6,
			["84058369"] = arg_446_7,
			["84058370"] = arg_446_8,
			["84058371"] = arg_446_9,
			["84058372"] = arg_446_10,
			["84058393"] = arg_446_11,
			["84058394"] = arg_446_12,
			["84058395"] = arg_446_13,
			["84058396"] = arg_446_14,
			["84058373"] = arg_446_15,
			["84058397"] = arg_446_16,
			["84058398"] = arg_446_17,
			["84058399"] = arg_446_18,
			["84058400"] = arg_446_19,
			["84058401"] = arg_446_20,
			["84058375"] = arg_446_21,
			["84058376"] = arg_446_22,
			["84058374"] = arg_446_23,
			["84058377"] = arg_446_24,
			["84058412"] = arg_446_25,
			["84058411"] = arg_446_26,
			["84058378"] = arg_446_27,
			["84058379"] = arg_446_28,
			["84058402"] = arg_446_29,
			["84058404"] = arg_446_30,
			["84058380"] = arg_446_31,
			["84058381"] = arg_446_32,
			["84058382"] = arg_446_33,
			["84058383"] = arg_446_34,
			["84058384"] = arg_446_35,
			["84058385"] = arg_446_36,
			["84058386"] = arg_446_37,
			["84058387"] = arg_446_38,
			["84058409"] = arg_446_39
		}, var_446_2.deepCopy(var_446_1.states_4527788883655170), var_446_2.deepCopy(var_446_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_447_0, arg_447_1, arg_447_2, arg_447_3, arg_447_4, arg_447_5, arg_447_6, arg_447_7, arg_447_8, arg_447_9, arg_447_10, arg_447_11, arg_447_12, arg_447_13, arg_447_14, arg_447_15, arg_447_16, arg_447_17, arg_447_18, arg_447_19, arg_447_20, arg_447_21, arg_447_22, arg_447_23, arg_447_24, arg_447_25, arg_447_26, arg_447_27, arg_447_28, arg_447_29, arg_447_30, arg_447_31, arg_447_32, arg_447_33, arg_447_34, arg_447_35, arg_447_36, arg_447_37, arg_447_38, arg_447_39)
		var_447_0 = depends("io-devices-settings-utils")
		var_447_1 = depends("common_utils")
		var_447_2 = depends("io-somfy-devices-settings-utils")
		
		return var_447_0.advancedRefresh(arg_447_0, arg_447_1, {
			["84058662"] = arg_447_2,
			["65537"] = arg_447_3,
			["84058391"] = arg_447_4,
			["49217792"] = arg_447_5,
			["84058368"] = arg_447_6,
			["84058369"] = arg_447_7,
			["84058370"] = arg_447_8,
			["84058371"] = arg_447_9,
			["84058372"] = arg_447_10,
			["84058393"] = arg_447_11,
			["84058394"] = arg_447_12,
			["84058395"] = arg_447_13,
			["84058396"] = arg_447_14,
			["84058373"] = arg_447_15,
			["84058397"] = arg_447_16,
			["84058398"] = arg_447_17,
			["84058399"] = arg_447_18,
			["84058400"] = arg_447_19,
			["84058401"] = arg_447_20,
			["84058375"] = arg_447_21,
			["84058376"] = arg_447_22,
			["84058374"] = arg_447_23,
			["84058377"] = arg_447_24,
			["84058412"] = arg_447_25,
			["84058411"] = arg_447_26,
			["84058378"] = arg_447_27,
			["84058379"] = arg_447_28,
			["84058402"] = arg_447_29,
			["84058404"] = arg_447_30,
			["84058380"] = arg_447_31,
			["84058381"] = arg_447_32,
			["84058382"] = arg_447_33,
			["84058383"] = arg_447_34,
			["84058384"] = arg_447_35,
			["84058385"] = arg_447_36,
			["84058386"] = arg_447_37,
			["84058387"] = arg_447_38,
			["84058409"] = arg_447_39
		}, var_447_1.deepCopy(var_447_2.states_4527788883655170), {}, var_447_1.deepCopy(var_447_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_448_0, arg_448_1)
		var_448_0 = depends("io-devices-settings-utils")
		var_448_1 = depends("common_utils")
		var_448_2 = depends("io-somfy-devices-settings-utils")
		
		return var_448_0.aggregateConfig({
			["65537"] = arg_448_0,
			["84059651"] = arg_448_1
		}, var_448_1.deepCopy(var_448_2.states_4504699139981826))
	end,
	function(arg_449_0)
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
	function(arg_450_0, arg_450_1, arg_450_2, arg_450_3)
		var_450_0 = depends("io-devices-settings-utils")
		var_450_1 = depends("io-somfy-devices-settings-utils")
		var_450_2 = depends("common_utils")
		
		return var_450_0.runConfig(arg_450_0, arg_450_1, var_450_2.deepCopy(var_450_1.commands_4504699139981826), {
			["65537"] = arg_450_2,
			["84059651"] = arg_450_3
		}, var_450_2.deepCopy(var_450_1.states_4504699139981826), var_450_2.deepCopy(var_450_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_451_0, arg_451_1, arg_451_2, arg_451_3)
		var_451_0 = depends("io-devices-settings-utils")
		var_451_1 = depends("common_utils")
		var_451_2 = depends("io-somfy-devices-settings-utils")
		
		return var_451_0.advancedRefresh(arg_451_0, arg_451_1, {
			["65537"] = arg_451_2,
			["84059651"] = arg_451_3
		}, var_451_1.deepCopy(var_451_2.states_4504699139981826), {}, var_451_1.deepCopy(var_451_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_452_0, arg_452_1, arg_452_2)
		var_452_0 = depends("io-devices-settings-utils")
		var_452_1 = depends("common_utils")
		var_452_2 = depends("io-somfy-devices-settings-utils")
		
		return var_452_0.aggregateConfig({
			["65537"] = arg_452_0,
			["84059656"] = arg_452_1,
			["84059651"] = arg_452_2
		}, var_452_1.deepCopy(var_452_2.states_4504699139391490))
	end,
	function(arg_453_0)
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
	function(arg_454_0, arg_454_1, arg_454_2, arg_454_3, arg_454_4)
		var_454_0 = depends("io-devices-settings-utils")
		var_454_1 = depends("io-somfy-devices-settings-utils")
		var_454_2 = depends("common_utils")
		
		return var_454_0.runConfig(arg_454_0, arg_454_1, var_454_2.deepCopy(var_454_1.commands_4504699139391490), {
			["65537"] = arg_454_2,
			["84059656"] = arg_454_3,
			["84059651"] = arg_454_4
		}, var_454_2.deepCopy(var_454_1.states_4504699139391490), var_454_2.deepCopy(var_454_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_455_0, arg_455_1, arg_455_2, arg_455_3, arg_455_4)
		var_455_0 = depends("io-devices-settings-utils")
		var_455_1 = depends("common_utils")
		var_455_2 = depends("io-somfy-devices-settings-utils")
		
		return var_455_0.advancedRefresh(arg_455_0, arg_455_1, {
			["65537"] = arg_455_2,
			["84059656"] = arg_455_3,
			["84059651"] = arg_455_4
		}, var_455_1.deepCopy(var_455_2.states_4504699139391490), {}, var_455_1.deepCopy(var_455_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_456_0, arg_456_1, arg_456_2)
		var_456_0 = depends("io-devices-settings-utils")
		var_456_1 = depends("common_utils")
		var_456_2 = depends("io-somfy-devices-settings-utils")
		
		return var_456_0.aggregateConfig({
			["84059651"] = arg_456_0,
			["65537"] = arg_456_1,
			["84082687"] = arg_456_2
		}, var_456_1.deepCopy(var_456_2.states_4513495233134594))
	end,
	function(arg_457_0)
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
	function(arg_458_0, arg_458_1, arg_458_2, arg_458_3, arg_458_4)
		var_458_0 = depends("io-devices-settings-utils")
		var_458_1 = depends("io-somfy-devices-settings-utils")
		var_458_2 = depends("common_utils")
		
		return var_458_0.runConfig(arg_458_0, arg_458_1, var_458_2.deepCopy(var_458_1.commands_4513495233134594), {
			["84059651"] = arg_458_2,
			["65537"] = arg_458_3,
			["84082687"] = arg_458_4
		}, var_458_2.deepCopy(var_458_1.states_4513495233134594), var_458_2.deepCopy(var_458_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_459_0, arg_459_1, arg_459_2, arg_459_3, arg_459_4)
		var_459_0 = depends("io-devices-settings-utils")
		var_459_1 = depends("common_utils")
		var_459_2 = depends("io-somfy-devices-settings-utils")
		
		return var_459_0.advancedRefresh(arg_459_0, arg_459_1, {
			["84059651"] = arg_459_2,
			["65537"] = arg_459_3,
			["84082687"] = arg_459_4
		}, var_459_1.deepCopy(var_459_2.states_4513495233134594), {}, var_459_1.deepCopy(var_459_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_460_0)
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
	function(arg_461_0, arg_461_1, arg_461_2, arg_461_3, arg_461_4, arg_461_5, arg_461_6)
		var_461_0 = depends("io-devices-settings-utils")
		var_461_1 = depends("io-somfy-devices-settings-utils")
		var_461_2 = depends("common_utils")
		
		return var_461_0.runConfig(arg_461_0, arg_461_1, var_461_2.deepCopy(var_461_1.commands_4517893279645698), {
			["84059651"] = arg_461_2,
			["65537"] = arg_461_3,
			["84059661"] = arg_461_4,
			["65540"] = arg_461_5,
			["48177664"] = arg_461_6
		}, var_461_2.deepCopy(var_461_1.states_4509097186623490), var_461_2.deepCopy(var_461_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_462_0, arg_462_1, arg_462_2)
		var_462_0 = depends("io-devices-settings-utils")
		var_462_1 = depends("common_utils")
		var_462_2 = depends("io-somfy-devices-settings-utils")
		
		return var_462_0.aggregateConfig({
			["84059651"] = arg_462_0,
			["65537"] = arg_462_1,
			["84082687"] = arg_462_2
		}, var_462_1.deepCopy(var_462_2.states_4522291326156802))
	end,
	function(arg_463_0, arg_463_1, arg_463_2, arg_463_3, arg_463_4)
		var_463_0 = depends("io-devices-settings-utils")
		var_463_1 = depends("io-somfy-devices-settings-utils")
		var_463_2 = depends("common_utils")
		
		return var_463_0.runConfig(arg_463_0, arg_463_1, var_463_2.deepCopy(var_463_1.commands_4513495233134594), {
			["84059651"] = arg_463_2,
			["65537"] = arg_463_3,
			["84082687"] = arg_463_4
		}, var_463_2.deepCopy(var_463_1.states_4522291326156802), var_463_2.deepCopy(var_463_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_464_0, arg_464_1, arg_464_2, arg_464_3, arg_464_4)
		var_464_0 = depends("io-devices-settings-utils")
		var_464_1 = depends("common_utils")
		var_464_2 = depends("io-somfy-devices-settings-utils")
		
		return var_464_0.advancedRefresh(arg_464_0, arg_464_1, {
			["84059651"] = arg_464_2,
			["65537"] = arg_464_3,
			["84082687"] = arg_464_4
		}, var_464_1.deepCopy(var_464_2.states_4522291326156802), {}, var_464_1.deepCopy(var_464_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_465_0, arg_465_1, arg_465_2, arg_465_3, arg_465_4)
		var_465_0 = depends("io-devices-settings-utils")
		var_465_1 = depends("common_utils")
		var_465_2 = depends("io-somfy-devices-settings-utils")
		
		return var_465_0.aggregateConfig({
			["84059651"] = arg_465_0,
			["65537"] = arg_465_1,
			["84082687"] = arg_465_2,
			["65540"] = arg_465_3,
			["48177664"] = arg_465_4
		}, var_465_1.deepCopy(var_465_2.states_4526689372667906))
	end,
	function(arg_466_0, arg_466_1, arg_466_2, arg_466_3, arg_466_4, arg_466_5, arg_466_6)
		var_466_0 = depends("io-devices-settings-utils")
		var_466_1 = depends("io-somfy-devices-settings-utils")
		var_466_2 = depends("common_utils")
		
		return var_466_0.runConfig(arg_466_0, arg_466_1, var_466_2.deepCopy(var_466_1.commands_4517893279645698), {
			["84059651"] = arg_466_2,
			["65537"] = arg_466_3,
			["84082687"] = arg_466_4,
			["65540"] = arg_466_5,
			["48177664"] = arg_466_6
		}, var_466_2.deepCopy(var_466_1.states_4526689372667906), var_466_2.deepCopy(var_466_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_467_0, arg_467_1, arg_467_2, arg_467_3, arg_467_4, arg_467_5, arg_467_6)
		var_467_0 = depends("io-devices-settings-utils")
		var_467_1 = depends("common_utils")
		var_467_2 = depends("io-somfy-devices-settings-utils")
		
		return var_467_0.advancedRefresh(arg_467_0, arg_467_1, {
			["84059651"] = arg_467_2,
			["65537"] = arg_467_3,
			["84082687"] = arg_467_4,
			["65540"] = arg_467_5,
			["48177664"] = arg_467_6
		}, var_467_1.deepCopy(var_467_2.states_4526689372667906), {}, var_467_1.deepCopy(var_467_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_468_0, arg_468_1)
		var_468_0 = depends("io-devices-settings-utils")
		var_468_1 = depends("common_utils")
		var_468_2 = depends("io-somfy-devices-settings-utils")
		
		return var_468_0.aggregateConfig({
			["84059651"] = arg_468_0,
			["65537"] = arg_468_1
		}, var_468_1.deepCopy(var_468_2.states_4505798651034114))
	end,
	function(arg_469_0)
		return {
			"save_my_position",
			"delete_my_position",
			"reset_actuator",
			"double_power_cut"
		}
	end,
	function(arg_470_0, arg_470_1, arg_470_2, arg_470_3)
		var_470_0 = depends("io-devices-settings-utils")
		var_470_1 = depends("io-somfy-devices-settings-utils")
		var_470_2 = depends("common_utils")
		
		return var_470_0.runConfig(arg_470_0, arg_470_1, var_470_2.deepCopy(var_470_1.commands_4505798651034114), {
			["84059651"] = arg_470_2,
			["65537"] = arg_470_3
		}, var_470_2.deepCopy(var_470_1.states_4505798651034114), var_470_2.deepCopy(var_470_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_471_0, arg_471_1, arg_471_2, arg_471_3)
		var_471_0 = depends("io-devices-settings-utils")
		var_471_1 = depends("common_utils")
		var_471_2 = depends("io-somfy-devices-settings-utils")
		
		return var_471_0.advancedRefresh(arg_471_0, arg_471_1, {
			["84059651"] = arg_471_2,
			["65537"] = arg_471_3
		}, var_471_1.deepCopy(var_471_2.states_4505798651034114), {}, var_471_1.deepCopy(var_471_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_472_0, arg_472_1, arg_472_2, arg_472_3, arg_472_4)
		var_472_0 = depends("io-devices-settings-utils")
		var_472_1 = depends("common_utils")
		var_472_2 = depends("io-somfy-devices-settings-utils")
		
		return var_472_0.aggregateConfig({
			["84059651"] = arg_472_0,
			["65537"] = arg_472_1,
			["48170496"] = arg_472_2,
			["84059658"] = arg_472_3,
			["84059664"] = arg_472_4
		}, var_472_1.deepCopy(var_472_2.states_4504699139194882))
	end,
	function(arg_473_0)
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
	function(arg_474_0, arg_474_1, arg_474_2, arg_474_3, arg_474_4, arg_474_5, arg_474_6)
		var_474_0 = depends("io-devices-settings-utils")
		var_474_1 = depends("io-somfy-devices-settings-utils")
		var_474_2 = depends("common_utils")
		
		return var_474_0.runConfig(arg_474_0, arg_474_1, var_474_2.deepCopy(var_474_1.commands_4504699139194882), {
			["84059651"] = arg_474_2,
			["65537"] = arg_474_3,
			["48170496"] = arg_474_4,
			["84059658"] = arg_474_5,
			["84059664"] = arg_474_6
		}, var_474_2.deepCopy(var_474_1.states_4504699139194882), var_474_2.deepCopy(var_474_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_475_0, arg_475_1, arg_475_2, arg_475_3, arg_475_4, arg_475_5, arg_475_6)
		var_475_0 = depends("io-devices-settings-utils")
		var_475_1 = depends("common_utils")
		var_475_2 = depends("io-somfy-devices-settings-utils")
		
		return var_475_0.advancedRefresh(arg_475_0, arg_475_1, {
			["84059651"] = arg_475_2,
			["65537"] = arg_475_3,
			["48170496"] = arg_475_4,
			["84059658"] = arg_475_5,
			["84059664"] = arg_475_6
		}, var_475_1.deepCopy(var_475_2.states_4504699139194882), {}, var_475_1.deepCopy(var_475_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_476_0)
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
	function(arg_477_0, arg_477_1, arg_477_2, arg_477_3, arg_477_4, arg_477_5, arg_477_6)
		var_477_0 = depends("io-devices-settings-utils")
		var_477_1 = depends("io-somfy-devices-settings-utils")
		var_477_2 = depends("common_utils")
		
		return var_477_0.runConfig(arg_477_0, arg_477_1, var_477_2.deepCopy(var_477_1.commands_4509097185705986), {
			["84059651"] = arg_477_2,
			["65537"] = arg_477_3,
			["48170496"] = arg_477_4,
			["84059658"] = arg_477_5,
			["84059664"] = arg_477_6
		}, var_477_2.deepCopy(var_477_1.states_4504699139194882), var_477_2.deepCopy(var_477_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_478_0, arg_478_1, arg_478_2, arg_478_3, arg_478_4, arg_478_5)
		var_478_0 = depends("io-devices-settings-utils")
		var_478_1 = depends("common_utils")
		var_478_2 = depends("io-somfy-devices-settings-utils")
		
		return var_478_0.aggregateConfig({
			["84059651"] = arg_478_0,
			["65537"] = arg_478_1,
			["84059664"] = arg_478_2,
			["84059659"] = arg_478_3,
			["65540"] = arg_478_4,
			["84059658"] = arg_478_5
		}, var_478_1.deepCopy(var_478_2.states_4531087419179010))
	end,
	function(arg_479_0)
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
	function(arg_480_0, arg_480_1, arg_480_2, arg_480_3, arg_480_4, arg_480_5, arg_480_6, arg_480_7)
		var_480_0 = depends("io-devices-settings-utils")
		var_480_1 = depends("io-somfy-devices-settings-utils")
		var_480_2 = depends("common_utils")
		
		return var_480_0.runConfig(arg_480_0, arg_480_1, var_480_2.deepCopy(var_480_1.commands_4531087419179010), {
			["84059651"] = arg_480_2,
			["65537"] = arg_480_3,
			["84059664"] = arg_480_4,
			["84059659"] = arg_480_5,
			["65540"] = arg_480_6,
			["84059658"] = arg_480_7
		}, var_480_2.deepCopy(var_480_1.states_4531087419179010), var_480_2.deepCopy(var_480_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_481_0, arg_481_1, arg_481_2, arg_481_3, arg_481_4, arg_481_5, arg_481_6, arg_481_7)
		var_481_0 = depends("io-devices-settings-utils")
		var_481_1 = depends("common_utils")
		var_481_2 = depends("io-somfy-devices-settings-utils")
		
		return var_481_0.advancedRefresh(arg_481_0, arg_481_1, {
			["84059651"] = arg_481_2,
			["65537"] = arg_481_3,
			["84059664"] = arg_481_4,
			["84059659"] = arg_481_5,
			["65540"] = arg_481_6,
			["84059658"] = arg_481_7
		}, var_481_1.deepCopy(var_481_2.states_4531087419179010), {}, var_481_1.deepCopy(var_481_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_482_0, arg_482_1, arg_482_2, arg_482_3, arg_482_4, arg_482_5)
		var_482_0 = depends("io-devices-settings-utils")
		var_482_1 = depends("common_utils")
		var_482_2 = depends("io-somfy-devices-settings-utils")
		
		return var_482_0.aggregateConfig({
			["84059651"] = arg_482_0,
			["65537"] = arg_482_1,
			["84059664"] = arg_482_2,
			["65540"] = arg_482_3,
			["84059658"] = arg_482_4,
			["84059659"] = arg_482_5
		}, var_482_1.deepCopy(var_482_2.states_4531087419179010))
	end,
	function(arg_483_0, arg_483_1, arg_483_2, arg_483_3, arg_483_4, arg_483_5, arg_483_6, arg_483_7)
		var_483_0 = depends("io-devices-settings-utils")
		var_483_1 = depends("io-somfy-devices-settings-utils")
		var_483_2 = depends("common_utils")
		
		return var_483_0.runConfig(arg_483_0, arg_483_1, var_483_2.deepCopy(var_483_1.commands_4535485465690114), {
			["84059651"] = arg_483_2,
			["65537"] = arg_483_3,
			["84059664"] = arg_483_4,
			["65540"] = arg_483_5,
			["84059658"] = arg_483_6,
			["84059659"] = arg_483_7
		}, var_483_2.deepCopy(var_483_1.states_4531087419179010), var_483_2.deepCopy(var_483_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_484_0, arg_484_1, arg_484_2, arg_484_3, arg_484_4, arg_484_5, arg_484_6, arg_484_7)
		var_484_0 = depends("io-devices-settings-utils")
		var_484_1 = depends("common_utils")
		var_484_2 = depends("io-somfy-devices-settings-utils")
		
		return var_484_0.advancedRefresh(arg_484_0, arg_484_1, {
			["84059651"] = arg_484_2,
			["65537"] = arg_484_3,
			["84059664"] = arg_484_4,
			["65540"] = arg_484_5,
			["84059658"] = arg_484_6,
			["84059659"] = arg_484_7
		}, var_484_1.deepCopy(var_484_2.states_4531087419179010), {}, var_484_1.deepCopy(var_484_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_485_0, arg_485_1, arg_485_2, arg_485_3, arg_485_4)
		var_485_0 = depends("io-devices-settings-utils")
		var_485_1 = depends("io-somfy-devices-settings-utils")
		var_485_2 = depends("common_utils")
		
		return var_485_0.runConfig(arg_485_0, arg_485_1, var_485_2.deepCopy(var_485_1.commands_4506898162384898), {
			["84059651"] = arg_485_2,
			["65537"] = arg_485_3,
			["84059661"] = arg_485_4
		}, var_485_2.deepCopy(var_485_1.states_4504699139653634), var_485_2.deepCopy(var_485_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_486_0, arg_486_1, arg_486_2, arg_486_3, arg_486_4)
		var_486_0 = depends("io-devices-settings-utils")
		var_486_1 = depends("io-somfy-devices-settings-utils")
		var_486_2 = depends("common_utils")
		
		return var_486_0.runConfig(arg_486_0, arg_486_1, var_486_2.deepCopy(var_486_1.commands_4507997674012674), {
			["84059651"] = arg_486_2,
			["65537"] = arg_486_3,
			["84059661"] = arg_486_4
		}, var_486_2.deepCopy(var_486_1.states_4504699139653634), var_486_2.deepCopy(var_486_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_487_0, arg_487_1, arg_487_2)
		var_487_0 = depends("io-devices-settings-utils")
		var_487_1 = depends("common_utils")
		var_487_2 = depends("io-somfy-devices-settings-utils")
		
		return var_487_0.aggregateConfig({
			["84082687"] = arg_487_0,
			["65537"] = arg_487_1,
			["84059651"] = arg_487_2
		}, var_487_1.deepCopy(var_487_2.states_4509097185640450))
	end,
	function(arg_488_0, arg_488_1, arg_488_2, arg_488_3, arg_488_4)
		var_488_0 = depends("io-devices-settings-utils")
		var_488_1 = depends("io-somfy-devices-settings-utils")
		var_488_2 = depends("common_utils")
		
		return var_488_0.runConfig(arg_488_0, arg_488_1, var_488_2.deepCopy(var_488_1.commands_4504699139129346), {
			["84082687"] = arg_488_2,
			["65537"] = arg_488_3,
			["84059651"] = arg_488_4
		}, var_488_2.deepCopy(var_488_1.states_4509097185640450), var_488_2.deepCopy(var_488_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_489_0, arg_489_1, arg_489_2, arg_489_3, arg_489_4)
		var_489_0 = depends("io-devices-settings-utils")
		var_489_1 = depends("common_utils")
		var_489_2 = depends("io-somfy-devices-settings-utils")
		
		return var_489_0.advancedRefresh(arg_489_0, arg_489_1, {
			["84082687"] = arg_489_2,
			["65537"] = arg_489_3,
			["84059651"] = arg_489_4
		}, var_489_1.deepCopy(var_489_2.states_4509097185640450), {}, var_489_1.deepCopy(var_489_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_490_0, arg_490_1, arg_490_2, arg_490_3, arg_490_4)
		var_490_0 = depends("io-devices-settings-utils")
		var_490_1 = depends("io-somfy-devices-settings-utils")
		var_490_2 = depends("common_utils")
		
		return var_490_0.runConfig(arg_490_0, arg_490_1, var_490_2.deepCopy(var_490_1.commands_4510196697268226), {
			["84082687"] = arg_490_2,
			["65537"] = arg_490_3,
			["84059651"] = arg_490_4
		}, var_490_2.deepCopy(var_490_1.states_4509097185640450), var_490_2.deepCopy(var_490_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_491_0, arg_491_1, arg_491_2)
		var_491_0 = depends("io-devices-settings-utils")
		var_491_1 = depends("common_utils")
		var_491_2 = depends("io-somfy-devices-settings-utils")
		
		return var_491_0.aggregateConfig({
			["84082687"] = arg_491_0,
			["65537"] = arg_491_1,
			["84059651"] = arg_491_2
		}, var_491_1.deepCopy(var_491_2.states_4511296208896002))
	end,
	function(arg_492_0, arg_492_1, arg_492_2, arg_492_3, arg_492_4)
		var_492_0 = depends("io-devices-settings-utils")
		var_492_1 = depends("io-somfy-devices-settings-utils")
		var_492_2 = depends("common_utils")
		
		return var_492_0.runConfig(arg_492_0, arg_492_1, var_492_2.deepCopy(var_492_1.commands_4510196697268226), {
			["84082687"] = arg_492_2,
			["65537"] = arg_492_3,
			["84059651"] = arg_492_4
		}, var_492_2.deepCopy(var_492_1.states_4511296208896002), var_492_2.deepCopy(var_492_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_493_0, arg_493_1, arg_493_2, arg_493_3, arg_493_4)
		var_493_0 = depends("io-devices-settings-utils")
		var_493_1 = depends("common_utils")
		var_493_2 = depends("io-somfy-devices-settings-utils")
		
		return var_493_0.advancedRefresh(arg_493_0, arg_493_1, {
			["84082687"] = arg_493_2,
			["65537"] = arg_493_3,
			["84059651"] = arg_493_4
		}, var_493_1.deepCopy(var_493_2.states_4511296208896002), {}, var_493_1.deepCopy(var_493_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_494_0, arg_494_1)
		var_494_0 = depends("io-devices-settings-utils")
		var_494_1 = depends("common_utils")
		var_494_2 = depends("io-somfy-devices-settings-utils")
		
		return var_494_0.aggregateConfig({
			["49020928"] = arg_494_0,
			["65537"] = arg_494_1
		}, var_494_1.deepCopy(var_494_2.states_4512395720523778))
	end,
	function(arg_495_0)
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
	function(arg_496_0, arg_496_1, arg_496_2, arg_496_3)
		var_496_0 = depends("io-devices-settings-utils")
		var_496_1 = depends("io-somfy-devices-settings-utils")
		var_496_2 = depends("common_utils")
		
		return var_496_0.runConfig(arg_496_0, arg_496_1, var_496_2.deepCopy(var_496_1.commands_4512395720523778), {
			["49020928"] = arg_496_2,
			["65537"] = arg_496_3
		}, var_496_2.deepCopy(var_496_1.states_4512395720523778), var_496_2.deepCopy(var_496_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_497_0, arg_497_1, arg_497_2, arg_497_3)
		var_497_0 = depends("io-devices-settings-utils")
		var_497_1 = depends("common_utils")
		var_497_2 = depends("io-somfy-devices-settings-utils")
		
		return var_497_0.advancedRefresh(arg_497_0, arg_497_1, {
			["49020928"] = arg_497_2,
			["65537"] = arg_497_3
		}, var_497_1.deepCopy(var_497_2.states_4512395720523778), {}, var_497_1.deepCopy(var_497_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_498_0, arg_498_1)
		var_498_0 = depends("io-devices-settings-utils")
		var_498_1 = depends("common_utils")
		var_498_2 = depends("io-somfy-devices-settings-utils")
		
		return var_498_0.aggregateConfig({
			["49020928"] = arg_498_0,
			["65537"] = arg_498_1
		}, var_498_1.deepCopy(var_498_2.states_4513495232151554))
	end,
	function(arg_499_0, arg_499_1, arg_499_2, arg_499_3)
		var_499_0 = depends("io-devices-settings-utils")
		var_499_1 = depends("io-somfy-devices-settings-utils")
		var_499_2 = depends("common_utils")
		
		return var_499_0.runConfig(arg_499_0, arg_499_1, var_499_2.deepCopy(var_499_1.commands_4512395720523778), {
			["49020928"] = arg_499_2,
			["65537"] = arg_499_3
		}, var_499_2.deepCopy(var_499_1.states_4513495232151554), var_499_2.deepCopy(var_499_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_500_0, arg_500_1, arg_500_2, arg_500_3)
		var_500_0 = depends("io-devices-settings-utils")
		var_500_1 = depends("common_utils")
		var_500_2 = depends("io-somfy-devices-settings-utils")
		
		return var_500_0.advancedRefresh(arg_500_0, arg_500_1, {
			["49020928"] = arg_500_2,
			["65537"] = arg_500_3
		}, var_500_1.deepCopy(var_500_2.states_4513495232151554), {}, var_500_1.deepCopy(var_500_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_501_0, arg_501_1)
		var_501_0 = depends("io-devices-settings-utils")
		var_501_1 = depends("common_utils")
		var_501_2 = depends("io-somfy-devices-settings-utils")
		
		return var_501_0.aggregateConfig({
			["84082687"] = arg_501_0,
			["65537"] = arg_501_1
		}, var_501_1.deepCopy(var_501_2.states_4514594743779330))
	end,
	function(arg_502_0, arg_502_1, arg_502_2, arg_502_3)
		var_502_0 = depends("io-devices-settings-utils")
		var_502_1 = depends("io-somfy-devices-settings-utils")
		var_502_2 = depends("common_utils")
		
		return var_502_0.runConfig(arg_502_0, arg_502_1, var_502_2.deepCopy(var_502_1.commands_4506898162385154), {
			["84082687"] = arg_502_2,
			["65537"] = arg_502_3
		}, var_502_2.deepCopy(var_502_1.states_4514594743779330), var_502_2.deepCopy(var_502_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_503_0, arg_503_1, arg_503_2, arg_503_3)
		var_503_0 = depends("io-devices-settings-utils")
		var_503_1 = depends("common_utils")
		var_503_2 = depends("io-somfy-devices-settings-utils")
		
		return var_503_0.advancedRefresh(arg_503_0, arg_503_1, {
			["84082687"] = arg_503_2,
			["65537"] = arg_503_3
		}, var_503_1.deepCopy(var_503_2.states_4514594743779330), {}, var_503_1.deepCopy(var_503_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_504_0, arg_504_1)
		var_504_0 = depends("io-devices-settings-utils")
		var_504_1 = depends("common_utils")
		var_504_2 = depends("io-somfy-devices-settings-utils")
		
		return var_504_0.aggregateConfig({
			["84082687"] = arg_504_0,
			["65537"] = arg_504_1
		}, var_504_1.deepCopy(var_504_2.states_4515694255407106))
	end,
	function(arg_505_0, arg_505_1, arg_505_2, arg_505_3)
		var_505_0 = depends("io-devices-settings-utils")
		var_505_1 = depends("io-somfy-devices-settings-utils")
		var_505_2 = depends("common_utils")
		
		return var_505_0.runConfig(arg_505_0, arg_505_1, var_505_2.deepCopy(var_505_1.commands_4515694255407106), {
			["84082687"] = arg_505_2,
			["65537"] = arg_505_3
		}, var_505_2.deepCopy(var_505_1.states_4515694255407106), var_505_2.deepCopy(var_505_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_506_0, arg_506_1, arg_506_2, arg_506_3)
		var_506_0 = depends("io-devices-settings-utils")
		var_506_1 = depends("common_utils")
		var_506_2 = depends("io-somfy-devices-settings-utils")
		
		return var_506_0.advancedRefresh(arg_506_0, arg_506_1, {
			["84082687"] = arg_506_2,
			["65537"] = arg_506_3
		}, var_506_1.deepCopy(var_506_2.states_4515694255407106), {}, var_506_1.deepCopy(var_506_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_507_0, arg_507_1, arg_507_2, arg_507_3)
		var_507_0 = depends("io-devices-settings-utils")
		var_507_1 = depends("io-somfy-devices-settings-utils")
		var_507_2 = depends("common_utils")
		
		return var_507_0.runConfig(arg_507_0, arg_507_1, var_507_2.deepCopy(var_507_1.commands_4506898162385154), {
			["84082687"] = arg_507_2,
			["65537"] = arg_507_3
		}, var_507_2.deepCopy(var_507_1.states_4515694255407106), var_507_2.deepCopy(var_507_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_508_0, arg_508_1, arg_508_2, arg_508_3, arg_508_4)
		var_508_0 = depends("io-devices-settings-utils")
		var_508_1 = depends("io-somfy-devices-settings-utils")
		var_508_2 = depends("common_utils")
		
		return var_508_0.runConfig(arg_508_0, arg_508_1, var_508_2.deepCopy(var_508_1.commands_4504699140898818), {
			["84059651"] = arg_508_2,
			["65537"] = arg_508_3,
			["84059661"] = arg_508_4
		}, var_508_2.deepCopy(var_508_1.states_4504699139653634), var_508_2.deepCopy(var_508_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_509_0, arg_509_1, arg_509_2, arg_509_3)
		var_509_0 = depends("io-devices-settings-utils")
		var_509_1 = depends("common_utils")
		var_509_2 = depends("io-somfy-devices-settings-utils")
		
		return var_509_0.aggregateConfig({
			["84082687"] = arg_509_0,
			["65537"] = arg_509_1,
			["48170496"] = arg_509_2,
			["48171008"] = arg_509_3
		}, var_509_1.deepCopy(var_509_2.states_4504699140047106))
	end,
	function(arg_510_0)
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
	function(arg_511_0, arg_511_1, arg_511_2, arg_511_3, arg_511_4, arg_511_5)
		var_511_0 = depends("io-devices-settings-utils")
		var_511_1 = depends("io-somfy-devices-settings-utils")
		var_511_2 = depends("common_utils")
		
		return var_511_0.runConfig(arg_511_0, arg_511_1, var_511_2.deepCopy(var_511_1.commands_4504699140047106), {
			["84082687"] = arg_511_2,
			["65537"] = arg_511_3,
			["48170496"] = arg_511_4,
			["48171008"] = arg_511_5
		}, var_511_2.deepCopy(var_511_1.states_4504699140047106), var_511_2.deepCopy(var_511_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_512_0, arg_512_1, arg_512_2, arg_512_3, arg_512_4, arg_512_5)
		var_512_0 = depends("io-devices-settings-utils")
		var_512_1 = depends("common_utils")
		var_512_2 = depends("io-somfy-devices-settings-utils")
		
		return var_512_0.advancedRefresh(arg_512_0, arg_512_1, {
			["84082687"] = arg_512_2,
			["65537"] = arg_512_3,
			["48170496"] = arg_512_4,
			["48171008"] = arg_512_5
		}, var_512_1.deepCopy(var_512_2.states_4504699140047106), {}, var_512_1.deepCopy(var_512_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_513_0, arg_513_1, arg_513_2)
		var_513_0 = depends("io-devices-settings-utils")
		var_513_1 = depends("common_utils")
		var_513_2 = depends("io-somfy-devices-settings-utils")
		
		return var_513_0.aggregateConfig({
			["84082687"] = arg_513_0,
			["65537"] = arg_513_1,
			["48171008"] = arg_513_2
		}, var_513_1.deepCopy(var_513_2.states_4505798651674882))
	end,
	function(arg_514_0)
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
	function(arg_515_0, arg_515_1, arg_515_2, arg_515_3, arg_515_4)
		var_515_0 = depends("io-devices-settings-utils")
		var_515_1 = depends("io-somfy-devices-settings-utils")
		var_515_2 = depends("common_utils")
		
		return var_515_0.runConfig(arg_515_0, arg_515_1, var_515_2.deepCopy(var_515_1.commands_4505798651674882), {
			["84082687"] = arg_515_2,
			["65537"] = arg_515_3,
			["48171008"] = arg_515_4
		}, var_515_2.deepCopy(var_515_1.states_4505798651674882), var_515_2.deepCopy(var_515_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_516_0, arg_516_1, arg_516_2, arg_516_3, arg_516_4)
		var_516_0 = depends("io-devices-settings-utils")
		var_516_1 = depends("common_utils")
		var_516_2 = depends("io-somfy-devices-settings-utils")
		
		return var_516_0.advancedRefresh(arg_516_0, arg_516_1, {
			["84082687"] = arg_516_2,
			["65537"] = arg_516_3,
			["48171008"] = arg_516_4
		}, var_516_1.deepCopy(var_516_2.states_4505798651674882), {}, var_516_1.deepCopy(var_516_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_517_0, arg_517_1, arg_517_2)
		var_517_0 = depends("io-devices-settings-utils")
		var_517_1 = depends("common_utils")
		var_517_2 = depends("io-somfy-devices-settings-utils")
		
		return var_517_0.aggregateConfig({
			["84082687"] = arg_517_0,
			["65537"] = arg_517_1,
			["48171008"] = arg_517_2
		}, var_517_1.deepCopy(var_517_2.states_4506898163302658))
	end,
	function(arg_518_0, arg_518_1, arg_518_2, arg_518_3, arg_518_4)
		var_518_0 = depends("io-devices-settings-utils")
		var_518_1 = depends("io-somfy-devices-settings-utils")
		var_518_2 = depends("common_utils")
		
		return var_518_0.runConfig(arg_518_0, arg_518_1, var_518_2.deepCopy(var_518_1.commands_4505798651674882), {
			["84082687"] = arg_518_2,
			["65537"] = arg_518_3,
			["48171008"] = arg_518_4
		}, var_518_2.deepCopy(var_518_1.states_4506898163302658), var_518_2.deepCopy(var_518_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_519_0, arg_519_1, arg_519_2, arg_519_3, arg_519_4)
		var_519_0 = depends("io-devices-settings-utils")
		var_519_1 = depends("common_utils")
		var_519_2 = depends("io-somfy-devices-settings-utils")
		
		return var_519_0.advancedRefresh(arg_519_0, arg_519_1, {
			["84082687"] = arg_519_2,
			["65537"] = arg_519_3,
			["48171008"] = arg_519_4
		}, var_519_1.deepCopy(var_519_2.states_4506898163302658), {}, var_519_1.deepCopy(var_519_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_520_0, arg_520_1, arg_520_2)
		var_520_0 = depends("io-devices-settings-utils")
		var_520_1 = depends("common_utils")
		var_520_2 = depends("io-somfy-devices-settings-utils")
		
		return var_520_0.aggregateConfig({
			["84082687"] = arg_520_0,
			["65537"] = arg_520_1,
			["48171008"] = arg_520_2
		}, var_520_1.deepCopy(var_520_2.states_4513495232217090))
	end,
	function(arg_521_0)
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
	function(arg_522_0, arg_522_1, arg_522_2, arg_522_3, arg_522_4)
		var_522_0 = depends("io-devices-settings-utils")
		var_522_1 = depends("io-somfy-devices-settings-utils")
		var_522_2 = depends("common_utils")
		
		return var_522_0.runConfig(arg_522_0, arg_522_1, var_522_2.deepCopy(var_522_1.commands_4513495232217090), {
			["84082687"] = arg_522_2,
			["65537"] = arg_522_3,
			["48171008"] = arg_522_4
		}, var_522_2.deepCopy(var_522_1.states_4513495232217090), var_522_2.deepCopy(var_522_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_523_0, arg_523_1, arg_523_2, arg_523_3, arg_523_4)
		var_523_0 = depends("io-devices-settings-utils")
		var_523_1 = depends("common_utils")
		var_523_2 = depends("io-somfy-devices-settings-utils")
		
		return var_523_0.advancedRefresh(arg_523_0, arg_523_1, {
			["84082687"] = arg_523_2,
			["65537"] = arg_523_3,
			["48171008"] = arg_523_4
		}, var_523_1.deepCopy(var_523_2.states_4513495232217090), {}, var_523_1.deepCopy(var_523_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_524_0, arg_524_1, arg_524_2, arg_524_3, arg_524_4)
		var_524_0 = depends("io-devices-settings-utils")
		var_524_1 = depends("io-somfy-devices-settings-utils")
		var_524_2 = depends("common_utils")
		
		return var_524_0.runConfig(arg_524_0, arg_524_1, var_524_2.deepCopy(var_524_1.commands_4517893278728194), {
			["84082687"] = arg_524_2,
			["65537"] = arg_524_3,
			["48171008"] = arg_524_4
		}, var_524_2.deepCopy(var_524_1.states_4513495232217090), var_524_2.deepCopy(var_524_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_525_0)
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
	function(arg_526_0, arg_526_1, arg_526_2, arg_526_3, arg_526_4)
		var_526_0 = depends("io-devices-settings-utils")
		var_526_1 = depends("io-somfy-devices-settings-utils")
		var_526_2 = depends("common_utils")
		
		return var_526_0.runConfig(arg_526_0, arg_526_1, var_526_2.deepCopy(var_526_1.commands_4520092301918210), {
			["84082687"] = arg_526_2,
			["65537"] = arg_526_3,
			["84059651"] = arg_526_4
		}, var_526_2.deepCopy(var_526_1.states_4511296208896002), var_526_2.deepCopy(var_526_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_527_0, arg_527_1, arg_527_2, arg_527_3, arg_527_4, arg_527_5, arg_527_6, arg_527_7, arg_527_8, arg_527_9)
		var_527_0 = depends("io-devices-settings-utils")
		var_527_1 = depends("common_utils")
		var_527_2 = depends("io-somfy-devices-settings-utils")
		
		return var_527_0.aggregateConfig({
			["84058662"] = arg_527_0,
			["65537"] = arg_527_1,
			["49217792"] = arg_527_2,
			["84058368"] = arg_527_3,
			["84058420"] = arg_527_4,
			["84058391"] = arg_527_5,
			["84058697"] = arg_527_6,
			["84058627"] = arg_527_7,
			["84058399"] = arg_527_8,
			["84058409"] = arg_527_9
		}, var_527_1.deepCopy(var_527_2.states_4517893278874114))
	end,
	function(arg_528_0)
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
	function(arg_529_0, arg_529_1, arg_529_2, arg_529_3, arg_529_4, arg_529_5, arg_529_6, arg_529_7, arg_529_8, arg_529_9, arg_529_10, arg_529_11)
		var_529_0 = depends("io-devices-settings-utils")
		var_529_1 = depends("io-somfy-devices-settings-utils")
		var_529_2 = depends("common_utils")
		
		return var_529_0.runConfig(arg_529_0, arg_529_1, var_529_2.deepCopy(var_529_1.commands_4517893278874114), {
			["84058662"] = arg_529_2,
			["65537"] = arg_529_3,
			["49217792"] = arg_529_4,
			["84058368"] = arg_529_5,
			["84058420"] = arg_529_6,
			["84058391"] = arg_529_7,
			["84058697"] = arg_529_8,
			["84058627"] = arg_529_9,
			["84058399"] = arg_529_10,
			["84058409"] = arg_529_11
		}, var_529_2.deepCopy(var_529_1.states_4517893278874114), var_529_2.deepCopy(var_529_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_530_0, arg_530_1, arg_530_2, arg_530_3, arg_530_4, arg_530_5, arg_530_6, arg_530_7, arg_530_8, arg_530_9, arg_530_10, arg_530_11)
		var_530_0 = depends("io-devices-settings-utils")
		var_530_1 = depends("common_utils")
		var_530_2 = depends("io-somfy-devices-settings-utils")
		
		return var_530_0.advancedRefresh(arg_530_0, arg_530_1, {
			["84058662"] = arg_530_2,
			["65537"] = arg_530_3,
			["49217792"] = arg_530_4,
			["84058368"] = arg_530_5,
			["84058420"] = arg_530_6,
			["84058391"] = arg_530_7,
			["84058697"] = arg_530_8,
			["84058627"] = arg_530_9,
			["84058399"] = arg_530_10,
			["84058409"] = arg_530_11
		}, var_530_1.deepCopy(var_530_2.states_4517893278874114), {}, var_530_1.deepCopy(var_530_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_531_0, arg_531_1, arg_531_2)
		var_531_0 = depends("io-devices-settings-utils")
		var_531_1 = depends("common_utils")
		var_531_2 = depends("io-somfy-devices-settings-utils")
		
		return var_531_0.aggregateConfig({
			["84059651"] = arg_531_0,
			["65537"] = arg_531_1,
			["84059671"] = arg_531_2
		}, var_531_1.deepCopy(var_531_2.states_4521191813545986))
	end,
	function(arg_532_0)
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
	function(arg_533_0, arg_533_1, arg_533_2, arg_533_3, arg_533_4)
		var_533_0 = depends("io-devices-settings-utils")
		var_533_1 = depends("io-somfy-devices-settings-utils")
		var_533_2 = depends("common_utils")
		
		return var_533_0.runConfig(arg_533_0, arg_533_1, var_533_2.deepCopy(var_533_1.commands_4521191813545986), {
			["84059651"] = arg_533_2,
			["65537"] = arg_533_3,
			["84059671"] = arg_533_4
		}, var_533_2.deepCopy(var_533_1.states_4521191813545986), var_533_2.deepCopy(var_533_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_534_0, arg_534_1, arg_534_2, arg_534_3, arg_534_4)
		var_534_0 = depends("io-devices-settings-utils")
		var_534_1 = depends("common_utils")
		var_534_2 = depends("io-somfy-devices-settings-utils")
		
		return var_534_0.advancedRefresh(arg_534_0, arg_534_1, {
			["84059651"] = arg_534_2,
			["65537"] = arg_534_3,
			["84059671"] = arg_534_4
		}, var_534_1.deepCopy(var_534_2.states_4521191813545986), {}, var_534_1.deepCopy(var_534_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_535_0, arg_535_1, arg_535_2)
		var_535_0 = depends("io-devices-settings-utils")
		var_535_1 = depends("common_utils")
		var_535_2 = depends("io-somfy-devices-settings-utils")
		
		return var_535_0.aggregateConfig({
			["84059651"] = arg_535_0,
			["65537"] = arg_535_1,
			["84059671"] = arg_535_2
		}, var_535_1.deepCopy(var_535_2.states_4525589860057090))
	end,
	function(arg_536_0)
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
	function(arg_537_0, arg_537_1, arg_537_2, arg_537_3, arg_537_4)
		var_537_0 = depends("io-devices-settings-utils")
		var_537_1 = depends("io-somfy-devices-settings-utils")
		var_537_2 = depends("common_utils")
		
		return var_537_0.runConfig(arg_537_0, arg_537_1, var_537_2.deepCopy(var_537_1.commands_4525589860057090), {
			["84059651"] = arg_537_2,
			["65537"] = arg_537_3,
			["84059671"] = arg_537_4
		}, var_537_2.deepCopy(var_537_1.states_4525589860057090), var_537_2.deepCopy(var_537_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_538_0, arg_538_1, arg_538_2, arg_538_3, arg_538_4)
		var_538_0 = depends("io-devices-settings-utils")
		var_538_1 = depends("common_utils")
		var_538_2 = depends("io-somfy-devices-settings-utils")
		
		return var_538_0.advancedRefresh(arg_538_0, arg_538_1, {
			["84059651"] = arg_538_2,
			["65537"] = arg_538_3,
			["84059671"] = arg_538_4
		}, var_538_1.deepCopy(var_538_2.states_4525589860057090), {}, var_538_1.deepCopy(var_538_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_539_0)
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
	function(arg_540_0, arg_540_1, arg_540_2, arg_540_3, arg_540_4)
		var_540_0 = depends("io-devices-settings-utils")
		var_540_1 = depends("io-somfy-devices-settings-utils")
		var_540_2 = depends("common_utils")
		
		return var_540_0.runConfig(arg_540_0, arg_540_1, var_540_2.deepCopy(var_540_1.commands_4531087418195970), {
			["84059651"] = arg_540_2,
			["65537"] = arg_540_3,
			["84059671"] = arg_540_4
		}, var_540_2.deepCopy(var_540_1.states_4521191813545986), var_540_2.deepCopy(var_540_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_541_0, arg_541_1, arg_541_2)
		var_541_0 = depends("io-devices-settings-utils")
		var_541_1 = depends("common_utils")
		var_541_2 = depends("io-somfy-devices-settings-utils")
		
		return var_541_0.aggregateConfig({
			["84059651"] = arg_541_0,
			["65537"] = arg_541_1,
			["84059671"] = arg_541_2
		}, var_541_1.deepCopy(var_541_2.states_4554177162379266))
	end,
	function(arg_542_0)
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
	function(arg_543_0, arg_543_1, arg_543_2, arg_543_3, arg_543_4)
		var_543_0 = depends("io-devices-settings-utils")
		var_543_1 = depends("io-somfy-devices-settings-utils")
		var_543_2 = depends("common_utils")
		
		return var_543_0.runConfig(arg_543_0, arg_543_1, var_543_2.deepCopy(var_543_1.commands_4554177162379266), {
			["84059651"] = arg_543_2,
			["65537"] = arg_543_3,
			["84059671"] = arg_543_4
		}, var_543_2.deepCopy(var_543_1.states_4554177162379266), var_543_2.deepCopy(var_543_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_544_0, arg_544_1, arg_544_2, arg_544_3, arg_544_4)
		var_544_0 = depends("io-devices-settings-utils")
		var_544_1 = depends("common_utils")
		var_544_2 = depends("io-somfy-devices-settings-utils")
		
		return var_544_0.advancedRefresh(arg_544_0, arg_544_1, {
			["84059651"] = arg_544_2,
			["65537"] = arg_544_3,
			["84059671"] = arg_544_4
		}, var_544_1.deepCopy(var_544_2.states_4554177162379266), {}, var_544_1.deepCopy(var_544_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_545_0, arg_545_1, arg_545_2)
		var_545_0 = depends("io-devices-settings-utils")
		var_545_1 = depends("common_utils")
		var_545_2 = depends("io-somfy-devices-settings-utils")
		
		return var_545_0.aggregateConfig({
			["84059649"] = arg_545_0,
			["84059668"] = arg_545_1,
			["84059669"] = arg_545_2
		}, var_545_1.deepCopy(var_545_2.diagnosticStatesGroups_4584963487956994))
	end,
	function(arg_546_0)
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
	function(arg_547_0, arg_547_1, arg_547_2, arg_547_3, arg_547_4)
		var_547_0 = depends("io-devices-settings-utils")
		var_547_1 = depends("io-somfy-devices-settings-utils")
		var_547_2 = depends("common_utils")
		
		return var_547_0.runConfig(arg_547_0, arg_547_1, var_547_2.deepCopy(var_547_1.commands_4584963487956994), {
			["84059651"] = arg_547_2,
			["65537"] = arg_547_3,
			["84059671"] = arg_547_4
		}, var_547_2.deepCopy(var_547_1.states_4521191813545986), var_547_2.deepCopy(var_547_1.diagnosticStatesGroups_4584963487956994), context)
	end,
	function(arg_548_0, arg_548_1, arg_548_2, arg_548_3, arg_548_4)
		var_548_0 = depends("io-devices-settings-utils")
		var_548_1 = depends("common_utils")
		var_548_2 = depends("io-somfy-devices-settings-utils")
		
		return var_548_0.advancedRefresh(arg_548_0, arg_548_1, {
			["84059651"] = arg_548_2,
			["65537"] = arg_548_3,
			["84059671"] = arg_548_4
		}, var_548_1.deepCopy(var_548_2.states_4521191813545986), {
			["84059649"] = p6,
			["84059668"] = p7,
			["84059669"] = p8
		}, var_548_1.deepCopy(var_548_2.diagnosticStatesGroups_4584963487956994), context)
	end,
	function(arg_549_0)
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
	function(arg_550_0, arg_550_1, arg_550_2, arg_550_3, arg_550_4)
		var_550_0 = depends("io-devices-settings-utils")
		var_550_1 = depends("io-somfy-devices-settings-utils")
		var_550_2 = depends("common_utils")
		
		return var_550_0.runConfig(arg_550_0, arg_550_1, var_550_2.deepCopy(var_550_1.commands_4587162511212546), {
			["84059651"] = arg_550_2,
			["65537"] = arg_550_3,
			["84059671"] = arg_550_4
		}, var_550_2.deepCopy(var_550_1.states_4521191813545986), var_550_2.deepCopy(var_550_1.diagnosticStatesGroups_4584963487956994), context)
	end,
	function(arg_551_0, arg_551_1, arg_551_2)
		var_551_0 = depends("io-devices-settings-utils")
		var_551_1 = depends("common_utils")
		var_551_2 = depends("io-somfy-devices-settings-utils")
		
		return var_551_0.aggregateConfig({
			["84059651"] = arg_551_0,
			["65537"] = arg_551_1,
			["84059666"] = arg_551_2
		}, var_551_1.deepCopy(var_551_2.states_4504699140768002))
	end,
	function(arg_552_0)
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
	function(arg_553_0, arg_553_1, arg_553_2, arg_553_3, arg_553_4)
		var_553_0 = depends("io-devices-settings-utils")
		var_553_1 = depends("io-somfy-devices-settings-utils")
		var_553_2 = depends("common_utils")
		
		return var_553_0.runConfig(arg_553_0, arg_553_1, var_553_2.deepCopy(var_553_1.commands_4504699140768002), {
			["84059651"] = arg_553_2,
			["65537"] = arg_553_3,
			["84059666"] = arg_553_4
		}, var_553_2.deepCopy(var_553_1.states_4504699140768002), var_553_2.deepCopy(var_553_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_554_0, arg_554_1, arg_554_2, arg_554_3, arg_554_4)
		var_554_0 = depends("io-devices-settings-utils")
		var_554_1 = depends("common_utils")
		var_554_2 = depends("io-somfy-devices-settings-utils")
		
		return var_554_0.advancedRefresh(arg_554_0, arg_554_1, {
			["84059651"] = arg_554_2,
			["65537"] = arg_554_3,
			["84059666"] = arg_554_4
		}, var_554_1.deepCopy(var_554_2.states_4504699140768002), {}, var_554_1.deepCopy(var_554_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_555_0, arg_555_1, arg_555_2, arg_555_3)
		var_555_0 = depends("io-devices-settings-utils")
		var_555_1 = depends("common_utils")
		var_555_2 = depends("io-somfy-devices-settings-utils")
		
		return var_555_0.aggregateConfig({
			["84059651"] = arg_555_0,
			["65537"] = arg_555_1,
			["84059666"] = arg_555_2,
			["84059658"] = arg_555_3
		}, var_555_1.deepCopy(var_555_2.states_4505798652395778))
	end,
	function(arg_556_0)
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
	function(arg_557_0, arg_557_1, arg_557_2, arg_557_3, arg_557_4, arg_557_5)
		var_557_0 = depends("io-devices-settings-utils")
		var_557_1 = depends("io-somfy-devices-settings-utils")
		var_557_2 = depends("common_utils")
		
		return var_557_0.runConfig(arg_557_0, arg_557_1, var_557_2.deepCopy(var_557_1.commands_4505798652395778), {
			["84059651"] = arg_557_2,
			["65537"] = arg_557_3,
			["84059666"] = arg_557_4,
			["84059658"] = arg_557_5
		}, var_557_2.deepCopy(var_557_1.states_4505798652395778), var_557_2.deepCopy(var_557_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_558_0, arg_558_1, arg_558_2, arg_558_3, arg_558_4, arg_558_5)
		var_558_0 = depends("io-devices-settings-utils")
		var_558_1 = depends("common_utils")
		var_558_2 = depends("io-somfy-devices-settings-utils")
		
		return var_558_0.advancedRefresh(arg_558_0, arg_558_1, {
			["84059651"] = arg_558_2,
			["65537"] = arg_558_3,
			["84059666"] = arg_558_4,
			["84059658"] = arg_558_5
		}, var_558_1.deepCopy(var_558_2.states_4505798652395778), {}, var_558_1.deepCopy(var_558_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_559_0)
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
	function(arg_560_0, arg_560_1, arg_560_2, arg_560_3, arg_560_4)
		var_560_0 = depends("io-devices-settings-utils")
		var_560_1 = depends("io-somfy-devices-settings-utils")
		var_560_2 = depends("common_utils")
		
		return var_560_0.runConfig(arg_560_0, arg_560_1, var_560_2.deepCopy(var_560_1.commands_4504699140046850), {
			["84059651"] = arg_560_2,
			["65537"] = arg_560_3,
			["84059661"] = arg_560_4
		}, var_560_2.deepCopy(var_560_1.states_4504699139653634), var_560_2.deepCopy(var_560_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_561_0, arg_561_1, arg_561_2, arg_561_3, arg_561_4)
		var_561_0 = depends("io-devices-settings-utils")
		var_561_1 = depends("common_utils")
		var_561_2 = depends("io-somfy-devices-settings-utils")
		
		return var_561_0.aggregateConfig({
			["84059651"] = arg_561_0,
			["65537"] = arg_561_1,
			["84059661"] = arg_561_2,
			["84059657"] = arg_561_3,
			["84059659"] = arg_561_4
		}, var_561_1.deepCopy(var_561_2.states_4504699140243458))
	end,
	function(arg_562_0)
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
	function(arg_563_0, arg_563_1, arg_563_2, arg_563_3, arg_563_4, arg_563_5, arg_563_6)
		var_563_0 = depends("io-devices-settings-utils")
		var_563_1 = depends("io-somfy-devices-settings-utils")
		var_563_2 = depends("common_utils")
		
		return var_563_0.runConfig(arg_563_0, arg_563_1, var_563_2.deepCopy(var_563_1.commands_4504699140243458), {
			["84059651"] = arg_563_2,
			["65537"] = arg_563_3,
			["84059661"] = arg_563_4,
			["84059657"] = arg_563_5,
			["84059659"] = arg_563_6
		}, var_563_2.deepCopy(var_563_1.states_4504699140243458), var_563_2.deepCopy(var_563_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_564_0, arg_564_1, arg_564_2, arg_564_3, arg_564_4, arg_564_5, arg_564_6)
		var_564_0 = depends("io-devices-settings-utils")
		var_564_1 = depends("common_utils")
		var_564_2 = depends("io-somfy-devices-settings-utils")
		
		return var_564_0.advancedRefresh(arg_564_0, arg_564_1, {
			["84059651"] = arg_564_2,
			["65537"] = arg_564_3,
			["84059661"] = arg_564_4,
			["84059657"] = arg_564_5,
			["84059659"] = arg_564_6
		}, var_564_1.deepCopy(var_564_2.states_4504699140243458), {}, var_564_1.deepCopy(var_564_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_565_0, arg_565_1, arg_565_2, arg_565_3)
		var_565_0 = depends("io-devices-settings-utils")
		var_565_1 = depends("common_utils")
		var_565_2 = depends("io-somfy-devices-settings-utils")
		
		return var_565_0.aggregateConfig({
			["84059651"] = arg_565_0,
			["65537"] = arg_565_1,
			["48170496"] = arg_565_2,
			["48171008"] = arg_565_3
		}, var_565_1.deepCopy(var_565_2.states_4506898163302402))
	end,
	function(arg_566_0)
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
	function(arg_567_0, arg_567_1, arg_567_2, arg_567_3, arg_567_4, arg_567_5)
		var_567_0 = depends("io-devices-settings-utils")
		var_567_1 = depends("io-somfy-devices-settings-utils")
		var_567_2 = depends("common_utils")
		
		return var_567_0.runConfig(arg_567_0, arg_567_1, var_567_2.deepCopy(var_567_1.commands_4506898163302402), {
			["84059651"] = arg_567_2,
			["65537"] = arg_567_3,
			["48170496"] = arg_567_4,
			["48171008"] = arg_567_5
		}, var_567_2.deepCopy(var_567_1.states_4506898163302402), var_567_2.deepCopy(var_567_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_568_0, arg_568_1, arg_568_2, arg_568_3, arg_568_4, arg_568_5)
		var_568_0 = depends("io-devices-settings-utils")
		var_568_1 = depends("common_utils")
		var_568_2 = depends("io-somfy-devices-settings-utils")
		
		return var_568_0.advancedRefresh(arg_568_0, arg_568_1, {
			["84059651"] = arg_568_2,
			["65537"] = arg_568_3,
			["48170496"] = arg_568_4,
			["48171008"] = arg_568_5
		}, var_568_1.deepCopy(var_568_2.states_4506898163302402), {}, var_568_1.deepCopy(var_568_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_569_0, arg_569_1, arg_569_2, arg_569_3, arg_569_4)
		var_569_0 = depends("io-devices-settings-utils")
		var_569_1 = depends("common_utils")
		var_569_2 = depends("io-somfy-devices-settings-utils")
		
		return var_569_0.aggregateConfig({
			["84059651"] = arg_569_0,
			["65537"] = arg_569_1,
			["48170496"] = arg_569_2,
			["48171008"] = arg_569_3,
			["84059664"] = arg_569_4
		}, var_569_1.deepCopy(var_569_2.states_4507997674930178))
	end,
	function(arg_570_0)
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
	function(arg_571_0, arg_571_1, arg_571_2, arg_571_3, arg_571_4, arg_571_5, arg_571_6)
		var_571_0 = depends("io-devices-settings-utils")
		var_571_1 = depends("io-somfy-devices-settings-utils")
		var_571_2 = depends("common_utils")
		
		return var_571_0.runConfig(arg_571_0, arg_571_1, var_571_2.deepCopy(var_571_1.commands_4507997674930178), {
			["84059651"] = arg_571_2,
			["65537"] = arg_571_3,
			["48170496"] = arg_571_4,
			["48171008"] = arg_571_5,
			["84059664"] = arg_571_6
		}, var_571_2.deepCopy(var_571_1.states_4507997674930178), var_571_2.deepCopy(var_571_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_572_0, arg_572_1, arg_572_2, arg_572_3, arg_572_4, arg_572_5, arg_572_6)
		var_572_0 = depends("io-devices-settings-utils")
		var_572_1 = depends("common_utils")
		var_572_2 = depends("io-somfy-devices-settings-utils")
		
		return var_572_0.advancedRefresh(arg_572_0, arg_572_1, {
			["84059651"] = arg_572_2,
			["65537"] = arg_572_3,
			["48170496"] = arg_572_4,
			["48171008"] = arg_572_5,
			["84059664"] = arg_572_6
		}, var_572_1.deepCopy(var_572_2.states_4507997674930178), {}, var_572_1.deepCopy(var_572_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_573_0, arg_573_1, arg_573_2, arg_573_3, arg_573_4)
		var_573_0 = depends("io-devices-settings-utils")
		var_573_1 = depends("common_utils")
		var_573_2 = depends("io-somfy-devices-settings-utils")
		
		return var_573_0.aggregateConfig({
			["84059651"] = arg_573_0,
			["65537"] = arg_573_1,
			["84059659"] = arg_573_2,
			["48171008"] = arg_573_3,
			["84059664"] = arg_573_4
		}, var_573_1.deepCopy(var_573_2.states_4535485464772610))
	end,
	function(arg_574_0, arg_574_1, arg_574_2, arg_574_3, arg_574_4, arg_574_5, arg_574_6)
		var_574_0 = depends("io-devices-settings-utils")
		var_574_1 = depends("io-somfy-devices-settings-utils")
		var_574_2 = depends("common_utils")
		
		return var_574_0.runConfig(arg_574_0, arg_574_1, var_574_2.deepCopy(var_574_1.commands_4535485464772610), {
			["84059651"] = arg_574_2,
			["65537"] = arg_574_3,
			["84059659"] = arg_574_4,
			["48171008"] = arg_574_5,
			["84059664"] = arg_574_6
		}, var_574_2.deepCopy(var_574_1.states_4535485464772610), var_574_2.deepCopy(var_574_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_575_0, arg_575_1, arg_575_2, arg_575_3, arg_575_4, arg_575_5, arg_575_6)
		var_575_0 = depends("io-devices-settings-utils")
		var_575_1 = depends("common_utils")
		var_575_2 = depends("io-somfy-devices-settings-utils")
		
		return var_575_0.advancedRefresh(arg_575_0, arg_575_1, {
			["84059651"] = arg_575_2,
			["65537"] = arg_575_3,
			["84059659"] = arg_575_4,
			["48171008"] = arg_575_5,
			["84059664"] = arg_575_6
		}, var_575_1.deepCopy(var_575_2.states_4535485464772610), {}, var_575_1.deepCopy(var_575_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_576_0, arg_576_1, arg_576_2, arg_576_3)
		var_576_0 = depends("io-devices-settings-utils")
		var_576_1 = depends("common_utils")
		var_576_2 = depends("io-somfy-devices-settings-utils")
		
		return var_576_0.aggregateConfig({
			["84082687"] = arg_576_0,
			["65537"] = arg_576_1,
			["48170496"] = arg_576_2,
			["48171008"] = arg_576_3
		}, var_576_1.deepCopy(var_576_2.states_4509097186557954))
	end,
	function(arg_577_0, arg_577_1, arg_577_2, arg_577_3, arg_577_4, arg_577_5)
		var_577_0 = depends("io-devices-settings-utils")
		var_577_1 = depends("io-somfy-devices-settings-utils")
		var_577_2 = depends("common_utils")
		
		return var_577_0.runConfig(arg_577_0, arg_577_1, var_577_2.deepCopy(var_577_1.commands_4509097186557954), {
			["84082687"] = arg_577_2,
			["65537"] = arg_577_3,
			["48170496"] = arg_577_4,
			["48171008"] = arg_577_5
		}, var_577_2.deepCopy(var_577_1.states_4509097186557954), var_577_2.deepCopy(var_577_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_578_0, arg_578_1, arg_578_2, arg_578_3, arg_578_4, arg_578_5)
		var_578_0 = depends("io-devices-settings-utils")
		var_578_1 = depends("common_utils")
		var_578_2 = depends("io-somfy-devices-settings-utils")
		
		return var_578_0.advancedRefresh(arg_578_0, arg_578_1, {
			["84082687"] = arg_578_2,
			["65537"] = arg_578_3,
			["48170496"] = arg_578_4,
			["48171008"] = arg_578_5
		}, var_578_1.deepCopy(var_578_2.states_4509097186557954), {}, var_578_1.deepCopy(var_578_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_579_0, arg_579_1, arg_579_2, arg_579_3, arg_579_4, arg_579_5)
		var_579_0 = depends("io-devices-settings-utils")
		var_579_1 = depends("io-somfy-devices-settings-utils")
		var_579_2 = depends("common_utils")
		
		return var_579_0.runConfig(arg_579_0, arg_579_1, var_579_2.deepCopy(var_579_1.commands_4510196698185730), {
			["84082687"] = arg_579_2,
			["65537"] = arg_579_3,
			["48170496"] = arg_579_4,
			["48171008"] = arg_579_5
		}, var_579_2.deepCopy(var_579_1.states_4509097186557954), var_579_2.deepCopy(var_579_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_580_0, arg_580_1, arg_580_2, arg_580_3, arg_580_4, arg_580_5)
		var_580_0 = depends("io-devices-settings-utils")
		var_580_1 = depends("io-somfy-devices-settings-utils")
		var_580_2 = depends("common_utils")
		
		return var_580_0.runConfig(arg_580_0, arg_580_1, var_580_2.deepCopy(var_580_1.commands_4511296209813506), {
			["84082687"] = arg_580_2,
			["65537"] = arg_580_3,
			["48170496"] = arg_580_4,
			["48171008"] = arg_580_5
		}, var_580_2.deepCopy(var_580_1.states_4509097186557954), var_580_2.deepCopy(var_580_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_581_0, arg_581_1, arg_581_2, arg_581_3)
		var_581_0 = depends("io-devices-settings-utils")
		var_581_1 = depends("common_utils")
		var_581_2 = depends("io-somfy-devices-settings-utils")
		
		return var_581_0.aggregateConfig({
			["84082687"] = arg_581_0,
			["65537"] = arg_581_1,
			["48170496"] = arg_581_2,
			["48171008"] = arg_581_3
		}, var_581_1.deepCopy(var_581_2.states_4512395721441282))
	end,
	function(arg_582_0, arg_582_1, arg_582_2, arg_582_3, arg_582_4, arg_582_5)
		var_582_0 = depends("io-devices-settings-utils")
		var_582_1 = depends("io-somfy-devices-settings-utils")
		var_582_2 = depends("common_utils")
		
		return var_582_0.runConfig(arg_582_0, arg_582_1, var_582_2.deepCopy(var_582_1.commands_4512395721441282), {
			["84082687"] = arg_582_2,
			["65537"] = arg_582_3,
			["48170496"] = arg_582_4,
			["48171008"] = arg_582_5
		}, var_582_2.deepCopy(var_582_1.states_4512395721441282), var_582_2.deepCopy(var_582_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_583_0, arg_583_1, arg_583_2, arg_583_3, arg_583_4, arg_583_5)
		var_583_0 = depends("io-devices-settings-utils")
		var_583_1 = depends("common_utils")
		var_583_2 = depends("io-somfy-devices-settings-utils")
		
		return var_583_0.advancedRefresh(arg_583_0, arg_583_1, {
			["84082687"] = arg_583_2,
			["65537"] = arg_583_3,
			["48170496"] = arg_583_4,
			["48171008"] = arg_583_5
		}, var_583_1.deepCopy(var_583_2.states_4512395721441282), {}, var_583_1.deepCopy(var_583_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_584_0, arg_584_1, arg_584_2, arg_584_3)
		var_584_0 = depends("io-devices-settings-utils")
		var_584_1 = depends("common_utils")
		var_584_2 = depends("io-somfy-devices-settings-utils")
		
		return var_584_0.aggregateConfig({
			["84082687"] = arg_584_0,
			["65537"] = arg_584_1,
			["48170496"] = arg_584_2,
			["48171008"] = arg_584_3
		}, var_584_1.deepCopy(var_584_2.states_4513495233069058))
	end,
	function(arg_585_0, arg_585_1, arg_585_2, arg_585_3, arg_585_4, arg_585_5)
		var_585_0 = depends("io-devices-settings-utils")
		var_585_1 = depends("io-somfy-devices-settings-utils")
		var_585_2 = depends("common_utils")
		
		return var_585_0.runConfig(arg_585_0, arg_585_1, var_585_2.deepCopy(var_585_1.commands_4512395721441282), {
			["84082687"] = arg_585_2,
			["65537"] = arg_585_3,
			["48170496"] = arg_585_4,
			["48171008"] = arg_585_5
		}, var_585_2.deepCopy(var_585_1.states_4513495233069058), var_585_2.deepCopy(var_585_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_586_0, arg_586_1, arg_586_2, arg_586_3, arg_586_4, arg_586_5)
		var_586_0 = depends("io-devices-settings-utils")
		var_586_1 = depends("common_utils")
		var_586_2 = depends("io-somfy-devices-settings-utils")
		
		return var_586_0.advancedRefresh(arg_586_0, arg_586_1, {
			["84082687"] = arg_586_2,
			["65537"] = arg_586_3,
			["48170496"] = arg_586_4,
			["48171008"] = arg_586_5
		}, var_586_1.deepCopy(var_586_2.states_4513495233069058), {}, var_586_1.deepCopy(var_586_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_587_0, arg_587_1)
		var_587_0 = depends("io-devices-settings-utils")
		var_587_1 = depends("common_utils")
		var_587_2 = depends("io-somfy-devices-settings-utils")
		
		return var_587_0.aggregateConfig({
			["84082687"] = arg_587_0,
			["65537"] = arg_587_1
		}, var_587_1.deepCopy(var_587_2.states_4515694256324610))
	end,
	function(arg_588_0)
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
	function(arg_589_0, arg_589_1, arg_589_2, arg_589_3)
		var_589_0 = depends("io-devices-settings-utils")
		var_589_1 = depends("io-somfy-devices-settings-utils")
		var_589_2 = depends("common_utils")
		
		return var_589_0.runConfig(arg_589_0, arg_589_1, var_589_2.deepCopy(var_589_1.commands_4515694256324610), {
			["84082687"] = arg_589_2,
			["65537"] = arg_589_3
		}, var_589_2.deepCopy(var_589_1.states_4515694256324610), var_589_2.deepCopy(var_589_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_590_0, arg_590_1, arg_590_2, arg_590_3)
		var_590_0 = depends("io-devices-settings-utils")
		var_590_1 = depends("common_utils")
		var_590_2 = depends("io-somfy-devices-settings-utils")
		
		return var_590_0.advancedRefresh(arg_590_0, arg_590_1, {
			["84082687"] = arg_590_2,
			["65537"] = arg_590_3
		}, var_590_1.deepCopy(var_590_2.states_4515694256324610), {}, var_590_1.deepCopy(var_590_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_591_0, arg_591_1, arg_591_2, arg_591_3)
		var_591_0 = depends("io-devices-settings-utils")
		var_591_1 = depends("io-somfy-devices-settings-utils")
		var_591_2 = depends("common_utils")
		
		return var_591_0.runConfig(arg_591_0, arg_591_1, var_591_2.deepCopy(var_591_1.commands_4516793767952386), {
			["84082687"] = arg_591_2,
			["65537"] = arg_591_3
		}, var_591_2.deepCopy(var_591_1.states_4515694256324610), var_591_2.deepCopy(var_591_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_592_0, arg_592_1)
		var_592_0 = depends("io-devices-settings-utils")
		var_592_1 = depends("common_utils")
		var_592_2 = depends("io-somfy-devices-settings-utils")
		
		return var_592_0.aggregateConfig({
			["84082687"] = arg_592_0,
			["65537"] = arg_592_1
		}, var_592_1.deepCopy(var_592_2.states_4517893279580162))
	end,
	function(arg_593_0, arg_593_1, arg_593_2, arg_593_3)
		var_593_0 = depends("io-devices-settings-utils")
		var_593_1 = depends("io-somfy-devices-settings-utils")
		var_593_2 = depends("common_utils")
		
		return var_593_0.runConfig(arg_593_0, arg_593_1, var_593_2.deepCopy(var_593_1.commands_4516793767952386), {
			["84082687"] = arg_593_2,
			["65537"] = arg_593_3
		}, var_593_2.deepCopy(var_593_1.states_4517893279580162), var_593_2.deepCopy(var_593_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_594_0, arg_594_1, arg_594_2, arg_594_3)
		var_594_0 = depends("io-devices-settings-utils")
		var_594_1 = depends("common_utils")
		var_594_2 = depends("io-somfy-devices-settings-utils")
		
		return var_594_0.advancedRefresh(arg_594_0, arg_594_1, {
			["84082687"] = arg_594_2,
			["65537"] = arg_594_3
		}, var_594_1.deepCopy(var_594_2.states_4517893279580162), {}, var_594_1.deepCopy(var_594_2.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_595_0)
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
	function(arg_596_0, arg_596_1, arg_596_2, arg_596_3, arg_596_4)
		var_596_0 = depends("io-devices-settings-utils")
		var_596_1 = depends("io-somfy-devices-settings-utils")
		var_596_2 = depends("common_utils")
		
		return var_596_0.runConfig(arg_596_0, arg_596_1, var_596_2.deepCopy(var_596_1.commands_4581664953073666), {
			["84082687"] = arg_596_2,
			["65537"] = arg_596_3,
			["84059651"] = arg_596_4
		}, var_596_2.deepCopy(var_596_1.states_4511296208896002), var_596_2.deepCopy(var_596_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_597_0, arg_597_1, arg_597_2, arg_597_3)
		var_597_0 = depends("io-devices-settings-utils")
		var_597_1 = depends("common_utils")
		var_597_2 = depends("io-somfy-devices-settings-utils")
		
		return var_597_0.aggregateConfig({
			["84082687"] = arg_597_0,
			["65537"] = arg_597_1,
			["65540"] = arg_597_2,
			["48177664"] = arg_597_3
		}, var_597_1.deepCopy(var_597_2.states_4507997674012930))
	end,
	function(arg_598_0, arg_598_1, arg_598_2, arg_598_3, arg_598_4, arg_598_5)
		var_598_0 = depends("io-devices-settings-utils")
		var_598_1 = depends("io-somfy-devices-settings-utils")
		var_598_2 = depends("common_utils")
		
		return var_598_0.runConfig(arg_598_0, arg_598_1, var_598_2.deepCopy(var_598_1.commands_4504699139129602), {
			["84082687"] = arg_598_2,
			["65537"] = arg_598_3,
			["65540"] = arg_598_4,
			["48177664"] = arg_598_5
		}, var_598_2.deepCopy(var_598_1.states_4507997674012930), var_598_2.deepCopy(var_598_1.diagnosticStatesGroups_4504699139653634), context)
	end,
	function(arg_599_0, arg_599_1, arg_599_2, arg_599_3, arg_599_4, arg_599_5)
		var_599_0 = depends("io-devices-settings-utils")
		var_599_1 = depends("common_utils")
		var_599_2 = depends("io-somfy-devices-settings-utils")
		
		return var_599_0.advancedRefresh(arg_599_0, arg_599_1, {
			["84082687"] = arg_599_2,
			["65537"] = arg_599_3,
			["65540"] = arg_599_4,
			["48177664"] = arg_599_5
		}, var_599_1.deepCopy(var_599_2.states_4507997674012930), {}, var_599_1.deepCopy(var_599_2.diagnosticStatesGroups_4504699139653634), context)
	end
}
var_0_1 = {
	[0] = {
		kind = "DAILY",
		startHour = 0,
		endHour = 24
	}
}
var_0_2 = {
	[0] = {
		reportingInterval = "4h"
	},
	{
		absoluteVariation = 0
	}
}
var_0_3 = {
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
		calendar = var_0_1[0]
	},
	{
		periodic = "10m",
		onRefreshAll = true,
		onStart = true
	},
	{
		onRefreshAll = false,
		onStart = false,
		calendar = var_0_1[0]
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
}
var_0_4 = {
	[0] = {
		stateName = "core:DiscreteRSSILevelState",
		parameters = {
			{
				rawStateId = "2146500638",
				name = "p1"
			}
		},
		converter = var_0_0[1]
	},
	{
		stateName = "core:LevelState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[2]
	},
	{
		stateName = "core:NameState",
		parameters = {
			{
				rawStateId = "1",
				name = "p1"
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[3]
	},
	{
		stateName = "core:RSSILevelState",
		parameters = {
			{
				rawStateId = "2146500638",
				name = "p1"
			}
		},
		converter = var_0_0[4]
	},
	{
		stateName = "core:StatusState",
		parameters = {
			{
				rawStateId = "2147426304",
				name = "p1"
			}
		},
		converter = var_0_0[5]
	},
	{
		stateName = "core:ClosureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[2]
	},
	{
		stateName = "core:Memorized1PositionState",
		parameters = {
			{
				rawStateId = "16832512",
				name = "p1"
			}
		},
		refresh = var_0_3[2],
		converter = var_0_0[2]
	},
	{
		stateName = "core:OpenClosedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[20]
	},
	{
		stateName = "core:SecuredPositionState",
		parameters = {
			{
				rawStateId = "16832522",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[2]
	},
	{
		stateName = "core:SlateOrientationState",
		parameters = {
			{
				rawStateId = "65538",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[2]
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
		converter = var_0_0[21]
	},
	{
		stateName = "core:MovingState",
		parameters = {
			{
				name = "p1",
				rawStateId = "65557",
				converter = var_0_0[22]
			}
		},
		converter = var_0_0[23]
	},
	{
		stateName = "core:OpenClosedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[29]
	},
	{
		stateName = "core:ManufacturerSettingsState",
		parameters = {
			{
				rawStateId = "2",
				name = "p1"
			}
		},
		converter = var_0_0[30]
	},
	{
		stateName = "core:ManufacturerDiagnosticsState",
		parameters = {
			{
				rawStateId = "2",
				name = "p1"
			}
		},
		converter = var_0_0[30]
	},
	{
		stateName = "core:AdditionalStatusState",
		parameters = {
			{
				rawStateId = "2146500645",
				name = "p1"
			}
		},
		converter = var_0_0[31]
	},
	{
		stateName = "core:ClosureOrRockerPositionState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[37]
	},
	{
		stateName = "core:ClosureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[38]
	},
	{
		stateName = "core:SlateOrientationState",
		parameters = {
			{
				rawStateId = "65540",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[2]
	},
	{
		stateName = "core:ProjectionAngleState",
		parameters = {
			{
				rawStateId = "65546",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[2]
	},
	{
		stateName = "core:DeploymentState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[2]
	},
	{
		stateName = "core:ClosureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[47]
	},
	{
		stateName = "core:OpenClosedUnknownState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[48]
	},
	{
		stateName = "core:LightIntensityState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[51]
	},
	{
		stateName = "core:Memorized1PositionState",
		parameters = {
			{
				rawStateId = "16832512",
				name = "p1"
			}
		},
		refresh = var_0_3[2],
		converter = var_0_0[51]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[52]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[59]
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
		converter = var_0_0[61]
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
		converter = var_0_0[62]
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
		converter = var_0_0[63]
	},
	{
		stateName = "core:ColorTemperatureState",
		parameters = {
			{
				rawStateId = "65551",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[66]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[68]
	},
	{
		stateName = "core:ClosureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[71]
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
		refresh = var_0_3[0],
		converter = var_0_0[72]
	},
	{
		stateName = "core:PedestrianPositionState",
		parameters = {
			{
				rawStateId = "16832519",
				name = "p1"
			}
		},
		refresh = var_0_3[4],
		converter = var_0_0[2]
	},
	{
		stateName = "core:LockedUnlockedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[75]
	},
	{
		stateName = "core:OpenClosedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[76]
	},
	{
		stateName = "core:WindowLockedState",
		parameters = {
			{
				rawStateId = "65538",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[79]
	},
	{
		stateName = "core:LowerClosureState",
		parameters = {
			{
				rawStateId = "65539",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[2]
	},
	{
		stateName = "core:LowerOpenClosedState",
		parameters = {
			{
				rawStateId = "65539",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[20]
	},
	{
		stateName = "core:UpperClosureState",
		parameters = {
			{
				rawStateId = "65538",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[2]
	},
	{
		stateName = "core:UpperOpenClosedState",
		parameters = {
			{
				rawStateId = "65538",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[20]
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
		converter = var_0_0[85]
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
		converter = var_0_0[85]
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
		converter = var_0_0[85]
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
		converter = var_0_0[86]
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
		converter = var_0_0[87]
	},
	{
		stateName = "io:HeatingTemperatureInterfaceSetPointModeState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[92]
	},
	{
		stateName = "core:TimerState",
		parameters = {
			{
				rawStateId = "84059651",
				name = "p1"
			}
		},
		converter = var_0_0[103],
		refresh = var_0_3[0]
	},
	{
		stateName = "io:PairedMicroModuleWithLowBatteryState",
		parameters = {
			{
				rawStateId = "84059655",
				name = "p1"
			}
		},
		converter = var_0_0[104],
		refresh = var_0_3[0]
	},
	{
		stateName = "io:PictoState",
		parameters = {
			{
				rawStateId = "84059651",
				name = "p1"
			}
		},
		converter = var_0_0[105],
		refresh = var_0_3[0]
	},
	{
		stateName = "core:OpenClosedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[108]
	},
	{
		stateName = "core:Memorized1OrientationState",
		parameters = {
			{
				rawStateId = "17029120",
				name = "p1"
			}
		},
		refresh = var_0_3[4],
		converter = var_0_0[2]
	},
	{
		stateName = "core:AirInputState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[2]
	},
	{
		stateName = "core:AirTransferState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[2]
	},
	{
		stateName = "core:AirOutputState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[2]
	},
	{
		stateName = "core:AirOutputLevelState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[2]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[116]
	},
	{
		stateName = "core:ComfortRoomTemperatureState",
		parameters = {
			{
				rawStateId = "16832527",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[119]
	},
	{
		stateName = "core:EcoRoomTemperatureState",
		parameters = {
			{
				rawStateId = "16832530",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[119]
	},
	{
		stateName = "core:HaltedRoomTemperatureState",
		parameters = {
			{
				rawStateId = "16832531",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[119]
	},
	{
		stateName = "core:SecondaryTemperatureState",
		parameters = {
			{
				rawStateId = "65545",
				name = "p1"
			}
		},
		converter = var_0_0[120]
	},
	{
		stateName = "core:SetBackRoomTemperatureState",
		parameters = {
			{
				rawStateId = "16832526",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[119]
	},
	{
		stateName = "core:TargetRoomTemperatureState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[119]
	},
	{
		stateName = "core:TargetTemperatureState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[119]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[119]
	},
	{
		stateName = "io:HeatPumpActivesModesState",
		parameters = {
			{
				rawStateId = "65553",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[121]
	},
	{
		stateName = "io:HeatPumpCapabilitiesState",
		parameters = {
			{
				rawStateId = "65552",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[122]
	},
	{
		stateName = "core:ActiveZonesState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[125]
	},
	{
		stateName = "core:LockedUnlockedState",
		parameters = {
			{
				rawStateId = "65546",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[133]
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
		refresh = var_0_3[0],
		converter = var_0_0[134]
	},
	{
		stateName = "core:OpeningDirectionState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059651",
				converter = var_0_0[135]
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[136]
	},
	{
		stateName = "core:RemainingTimeState",
		parameters = {
			{
				rawStateId = "84059651",
				name = "p1"
			}
		},
		converter = var_0_0[137],
		refresh = var_0_3[0]
	},
	{
		stateName = "core:SecuredVentilationFeatureState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059651",
				converter = var_0_0[138]
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[139]
	},
	{
		stateName = "core:TimerActivationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059651",
				converter = var_0_0[140]
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[141]
	},
	{
		stateName = "core:TimerState",
		parameters = {
			{
				rawStateId = "84059651",
				name = "p1"
			}
		},
		converter = var_0_0[142],
		refresh = var_0_3[0]
	},
	{
		stateName = "core:Memorized1OrientationState",
		parameters = {
			{
				rawStateId = "16832512",
				name = "p1"
			}
		},
		refresh = var_0_3[2],
		converter = var_0_0[2]
	},
	{
		stateName = "core:SecuredOrientationState",
		parameters = {
			{
				rawStateId = "16832522",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[2]
	},
	{
		stateName = "core:SlatsOpenClosedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		converter = var_0_0[20]
	},
	{
		stateName = "core:SlatsOrientationState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		converter = var_0_0[2]
	},
	{
		stateName = "core:SlateOrientationState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		converter = var_0_0[2]
	},
	{
		stateName = "core:BatteryState",
		parameters = {
			{
				rawStateId = "65556",
				name = "p1"
			}
		},
		converter = var_0_0[149]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		converter = var_0_0[150],
		refresh = var_0_3[3]
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
		converter = var_0_0[159],
		refresh = var_0_3[5]
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
		converter = var_0_0[85]
	},
	{
		stateName = "core:DHWPSoftwareVersionState",
		parameters = {
			{
				rawStateId = "201342977",
				name = "p1"
			}
		},
		converter = var_0_0[160],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:DateTimeState",
		parameters = {
			{
				rawStateId = "201330433",
				name = "p1"
			}
		},
		converter = var_0_0[161]
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
		converter = var_0_0[85]
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
		converter = var_0_0[85]
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
		converter = var_0_0[85]
	},
	{
		stateName = "core:ManufacturerNameState",
		parameters = {
			{
				rawStateId = "201328385",
				name = "p1"
			}
		},
		converter = var_0_0[162],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:MaximalShowerManualModeState",
		parameters = {
			{
				rawStateId = "201343489",
				name = "p1"
			}
		},
		converter = var_0_0[163],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:MaximalTemperatureManualModeState",
		parameters = {
			{
				rawStateId = "201343233",
				name = "p1"
			}
		},
		converter = var_0_0[164],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:MinimalShowerManualModeState",
		parameters = {
			{
				rawStateId = "201343489",
				name = "p1"
			}
		},
		converter = var_0_0[165],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:MinimalTemperatureManualModeState",
		parameters = {
			{
				rawStateId = "201343233",
				name = "p1"
			}
		},
		converter = var_0_0[166],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:NumberOfTankState",
		parameters = {
			{
				rawStateId = "201341185",
				name = "p1"
			}
		},
		converter = var_0_0[167],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:OperatingModeState",
		parameters = {
			{
				rawStateId = "65553",
				name = "p1"
			}
		},
		converter = var_0_0[168],
		refresh = var_0_3[0]
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
		converter = var_0_0[169]
	},
	{
		stateName = "core:WaterConsumptionState",
		parameters = {
			{
				rawStateId = "201326849",
				name = "p1"
			}
		},
		converter = var_0_0[171],
		refresh = var_0_3[6],
		filter = var_0_2[0]
	},
	{
		stateName = "io:AntiLegionellosisState",
		parameters = {
			{
				rawStateId = "201329665",
				name = "p1"
			}
		},
		converter = var_0_0[167],
		refresh = var_0_3[7],
		filter = var_0_2[0]
	},
	{
		stateName = "io:AwayModeDurationState",
		parameters = {
			{
				rawStateId = "201327873",
				name = "p1"
			}
		},
		converter = var_0_0[172],
		refresh = var_0_3[5]
	},
	{
		stateName = "io:BoilerInstallationOptionState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201330945",
				converter = var_0_0[167]
			}
		},
		refresh = var_0_3[7],
		converter = var_0_0[173]
	},
	{
		stateName = "io:DHWCapacityState",
		parameters = {
			{
				rawStateId = "201328641",
				name = "p1"
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[174]
	},
	{
		stateName = "io:DHWErrorState",
		parameters = {
			{
				rawStateId = "201327105",
				name = "p1"
			}
		},
		refresh = var_0_3[8],
		filter = var_0_2[1],
		converter = var_0_0[175]
	},
	{
		stateName = "io:DHWModeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201328129",
				converter = var_0_0[176]
			}
		},
		refresh = var_0_3[8],
		filter = var_0_2[0],
		converter = var_0_0[177]
	},
	{
		stateName = "io:ElectricBoosterOperatingTimeState",
		parameters = {
			{
				rawStateId = "201327361",
				name = "p1"
			}
		},
		converter = var_0_0[178],
		refresh = var_0_3[0],
		filter = var_0_2[0]
	},
	{
		stateName = "io:ElectricalExtraManagementState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201330177",
				converter = var_0_0[167]
			}
		},
		refresh = var_0_3[7],
		converter = var_0_0[179]
	},
	{
		stateName = "io:ExtractionOptionState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201331457",
				converter = var_0_0[167]
			}
		},
		refresh = var_0_3[7],
		converter = var_0_0[180]
	},
	{
		stateName = "io:HeatPumpOperatingTimeState",
		parameters = {
			{
				rawStateId = "201327361",
				name = "p1"
			}
		},
		converter = var_0_0[171],
		refresh = var_0_3[0],
		filter = var_0_2[0]
	},
	{
		stateName = "io:InstallationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201330689",
				converter = var_0_0[167]
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[181]
	},
	{
		stateName = "io:MiddleWaterTemperatureState",
		parameters = {
			{
				rawStateId = "201332481",
				name = "p1"
			}
		},
		converter = var_0_0[182],
		refresh = var_0_3[6],
		filter = var_0_2[0]
	},
	{
		stateName = "io:OperatingModeCapabilitiesState",
		parameters = {
			{
				rawStateId = "65552",
				name = "p1"
			}
		},
		converter = var_0_0[183],
		refresh = var_0_3[0]
	},
	{
		stateName = "io:OperatingRangeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201329153",
				converter = var_0_0[176]
			}
		},
		refresh = var_0_3[7],
		filter = var_0_2[0],
		converter = var_0_0[184]
	},
	{
		stateName = "io:PowerConsumptionFanState",
		parameters = {
			{
				rawStateId = "201337601",
				name = "p1"
			}
		},
		converter = var_0_0[165],
		refresh = var_0_3[9],
		filter = var_0_2[0]
	},
	{
		stateName = "io:PowerHeatElectricalState",
		parameters = {
			{
				rawStateId = "201339649",
				name = "p1"
			}
		},
		converter = var_0_0[165],
		refresh = var_0_3[6],
		filter = var_0_2[0]
	},
	{
		stateName = "io:PowerHeatPumpState",
		parameters = {
			{
				rawStateId = "201339905",
				name = "p1"
			}
		},
		converter = var_0_0[165],
		refresh = var_0_3[10],
		filter = var_0_2[0]
	},
	{
		stateName = "io:ProgrammingSlotsState",
		parameters = {
			{
				rawStateId = "201329409",
				name = "p1"
			}
		},
		converter = var_0_0[185],
		refresh = var_0_3[5]
	},
	{
		stateName = "io:RateManagementState",
		parameters = {
			{
				rawStateId = "65547",
				name = "p1"
			}
		},
		converter = var_0_0[186],
		refresh = var_0_3[0]
	},
	{
		stateName = "io:SmartGridOptionState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201331201",
				converter = var_0_0[167]
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[187]
	},
	{
		stateName = "core:ElectricEnergyConsumptionState",
		parameters = {
			{
				rawStateId = "201327617",
				name = "p1"
			}
		},
		converter = var_0_0[203],
		refresh = var_0_3[0],
		filter = var_0_2[0]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[204]
	},
	{
		stateName = "io:MaximumHeatingLevelState",
		parameters = {
			{
				rawStateId = "65547",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[205]
	},
	{
		stateName = "io:TargetHeatingLevelState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[206]
	},
	{
		stateName = "core:TargetHeatingLevelState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[206]
	},
	{
		stateName = "io:TimerForTransitoryStateState",
		parameters = {
			{
				rawStateId = "65548",
				name = "p1"
			}
		},
		refresh = var_0_3[0]
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
		refresh = var_0_3[0],
		converter = var_0_0[2]
	},
	{
		stateName = "core:OperatingStateState",
		parameters = {
			{
				rawStateId = "218040320",
				name = "p1"
			}
		},
		converter = var_0_0[210],
		refresh = var_0_3[8]
	},
	{
		stateName = "core:TimeProgramState",
		parameters = {
			{
				rawStateId = "218041600",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[211]
	},
	{
		stateName = "io:AirDemandModeState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		converter = var_0_0[212],
		refresh = var_0_3[3]
	},
	{
		stateName = "io:CO2HistoryState",
		parameters = {
			{
				rawStateId = "84672513",
				name = "p1"
			}
		},
		refresh = var_0_3[6],
		converter = var_0_0[213]
	},
	{
		stateName = "io:EnergySavingState",
		parameters = {
			{
				rawStateId = "84672514",
				name = "p1"
			}
		},
		converter = var_0_0[214],
		refresh = var_0_3[11],
		filter = var_0_2[0]
	},
	{
		stateName = "io:InletEngineState",
		parameters = {
			{
				rawStateId = "218040320",
				name = "p1"
			}
		},
		converter = var_0_0[215],
		refresh = var_0_3[8]
	},
	{
		stateName = "io:OutletEngineState",
		parameters = {
			{
				rawStateId = "218040320",
				name = "p1"
			}
		},
		converter = var_0_0[216],
		refresh = var_0_3[8]
	},
	{
		stateName = "io:ProgCommandState",
		parameters = {
			{
				rawStateId = "218040320",
				name = "p1"
			}
		},
		converter = var_0_0[217],
		refresh = var_0_3[8]
	},
	{
		stateName = "io:RemainingTimeBeforeFilterChangeState",
		parameters = {
			{
				rawStateId = "218040320",
				name = "p1"
			}
		},
		converter = var_0_0[218],
		refresh = var_0_3[8]
	},
	{
		stateName = "io:SensorsErrorState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		refresh = var_0_3[6],
		filter = var_0_2[0],
		converter = var_0_0[219]
	},
	{
		stateName = "io:VentilationConfigurationModeState",
		parameters = {
			{
				rawStateId = "65553",
				name = "p1"
			}
		},
		converter = var_0_0[220],
		refresh = var_0_3[0]
	},
	{
		stateName = "io:VentilationModeState",
		parameters = {
			{
				rawStateId = "218040064",
				name = "p1"
			}
		},
		converter = var_0_0[221]
	},
	{
		stateName = "core:CO2ConcentrationState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		converter = var_0_0[171],
		refresh = var_0_3[6],
		filter = var_0_2[0]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		converter = var_0_0[229],
		refresh = var_0_3[6],
		filter = var_0_2[0]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		converter = var_0_0[230],
		refresh = var_0_3[6],
		filter = var_0_2[0]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		converter = var_0_0[231],
		refresh = var_0_3[6],
		filter = var_0_2[0]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		converter = var_0_0[232],
		refresh = var_0_3[6],
		filter = var_0_2[0]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		converter = var_0_0[233],
		refresh = var_0_3[6],
		filter = var_0_2[0]
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
		converter = var_0_0[234]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "2415919106",
				name = "p1"
			}
		},
		converter = var_0_0[237]
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
		converter = var_0_0[239],
		refresh = var_0_3[6]
	},
	{
		stateName = "core:NameState",
		parameters = {
			{
				rawStateId = "2415919105",
				name = "p1"
			}
		},
		converter = var_0_0[240],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:WaterConsumptionState",
		parameters = {
			{
				rawStateId = "83935248",
				name = "p1"
			}
		},
		converter = var_0_0[239],
		refresh = var_0_3[6]
	},
	{
		stateName = "core:ThermalEnergyConsumptionState",
		parameters = {
			{
				rawStateId = "83935248",
				name = "p1"
			}
		},
		converter = var_0_0[239],
		refresh = var_0_3[6]
	},
	{
		stateName = "core:ElectricEnergyConsumptionState",
		parameters = {
			{
				rawStateId = "83935248",
				name = "p1"
			}
		},
		converter = var_0_0[239],
		refresh = var_0_3[6]
	},
	{
		stateName = "core:ElectricEnergyConsumptionState",
		parameters = {
			{
				rawStateId = "83902467",
				name = "p1"
			}
		},
		converter = var_0_0[241],
		refresh = var_0_3[0]
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
		converter = var_0_0[242]
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
		converter = var_0_0[243]
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
		converter = var_0_0[244]
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
		converter = var_0_0[245]
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
		converter = var_0_0[246]
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
		converter = var_0_0[247]
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
		converter = var_0_0[248]
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
		converter = var_0_0[250]
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
		converter = var_0_0[251]
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
		converter = var_0_0[252]
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
		converter = var_0_0[253]
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
		converter = var_0_0[254]
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
		converter = var_0_0[255]
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
		converter = var_0_0[256]
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
		converter = var_0_0[257]
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
		converter = var_0_0[258]
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
		converter = var_0_0[259]
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
		converter = var_0_0[260]
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
		converter = var_0_0[261]
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
		converter = var_0_0[262]
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
		converter = var_0_0[244]
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
		converter = var_0_0[263]
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
		converter = var_0_0[264]
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
		converter = var_0_0[265]
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
		converter = var_0_0[266]
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
		converter = var_0_0[267]
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
		converter = var_0_0[268]
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
		converter = var_0_0[269]
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
		converter = var_0_0[270]
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
		converter = var_0_0[271]
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
		converter = var_0_0[272]
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
		converter = var_0_0[273]
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
		converter = var_0_0[274]
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
		converter = var_0_0[275]
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
		converter = var_0_0[276]
	},
	{
		stateName = "io:AllowForceHeatingState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201392128",
				converter = var_0_0[159]
			}
		},
		refresh = var_0_3[5],
		converter = var_0_0[277]
	},
	{
		stateName = "io:ForceHeatingState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201326592",
				converter = var_0_0[159]
			}
		},
		converter = var_0_0[277]
	},
	{
		stateName = "core:CurrentTariffNumberState",
		parameters = {
			{
				rawStateId = "83902467",
				name = "p1"
			}
		},
		converter = var_0_0[279],
		refresh = var_0_3[0]
	},
	{
		stateName = "core:ElectricalContractIntensityState",
		parameters = {
			{
				rawStateId = "201457664",
				name = "p1"
			}
		},
		converter = var_0_0[176]
	},
	{
		stateName = "core:ElectricalContractNameState",
		parameters = {
			{
				rawStateId = "83902464",
				name = "p1"
			}
		},
		converter = var_0_0[280],
		refresh = var_0_3[0]
	},
	{
		stateName = "core:ElectricalMeterTypeState",
		parameters = {
			{
				rawStateId = "83902464",
				name = "p1"
			}
		},
		converter = var_0_0[281],
		refresh = var_0_3[0]
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
				converter = var_0_0[159]
			}
		},
		converter = var_0_0[283]
	},
	{
		stateName = "io:ConfigurationServicesState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201523200",
				converter = var_0_0[159]
			}
		},
		converter = var_0_0[284]
	},
	{
		stateName = "core:SmokeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "2415919106",
				converter = var_0_0[287]
			}
		},
		converter = var_0_0[288]
	},
	{
		stateName = "io:MaintenanceRadioPartBatteryState",
		parameters = {
			{
				rawStateId = "83902976",
				name = "p1"
			}
		},
		converter = var_0_0[289]
	},
	{
		stateName = "io:MaintenanceSensorPartBatteryState",
		parameters = {
			{
				rawStateId = "83902976",
				name = "p1"
			}
		},
		converter = var_0_0[290]
	},
	{
		stateName = "io:SensorRoomState",
		parameters = {
			{
				rawStateId = "2415919110",
				name = "p1"
			}
		},
		converter = var_0_0[291]
	},
	{
		stateName = "core:ContactState",
		parameters = {
			{
				name = "p1",
				rawStateId = "2415919106",
				converter = var_0_0[287]
			}
		},
		converter = var_0_0[293]
	},
	{
		stateName = "core:SensorDefectState",
		parameters = {
			{
				name = "p1",
				rawStateId = "2415919110",
				converter = var_0_0[234]
			}
		},
		converter = var_0_0[294]
	},
	{
		stateName = "core:OccupancyState",
		parameters = {
			{
				name = "p1",
				rawStateId = "2415919106",
				converter = var_0_0[287]
			}
		},
		converter = var_0_0[295]
	},
	{
		stateName = "core:RainState",
		parameters = {
			{
				name = "p1",
				rawStateId = "2415919106",
				converter = var_0_0[296]
			}
		},
		converter = var_0_0[297]
	},
	{
		stateName = "core:TiltedState",
		parameters = {
			{
				rawStateId = "18183012483074",
				name = "p1"
			}
		},
		converter = var_0_0[298]
	},
	{
		stateName = "core:OpenClosedState",
		parameters = {
			{
				rawStateId = "18183012483074",
				name = "p1"
			}
		},
		converter = var_0_0[299]
	},
	{
		stateName = "core:LockedUnlockedState",
		parameters = {
			{
				rawStateId = "18183012483074",
				name = "p1"
			}
		},
		converter = var_0_0[300]
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
		converter = var_0_0[304]
	},
	{
		stateName = "core:VibrationLevelThresholdState",
		parameters = {
			{
				rawStateId = "83903234",
				name = "p1"
			}
		},
		converter = var_0_0[305],
		refresh = var_0_3[1]
	},
	{
		stateName = "io:OneWayControllerButtonState",
		parameters = {
			{
				rawStateId = "33554442",
				name = "p1"
			}
		},
		converter = var_0_0[315]
	},
	{
		stateName = "io:OneWayStoppableButtonState",
		parameters = {
			{
				rawStateId = "33554442",
				name = "p1"
			}
		},
		converter = var_0_0[317]
	},
	{
		stateName = "io:OneWayStoppableButtonState",
		parameters = {
			{
				rawStateId = "33554443",
				name = "p1"
			}
		},
		converter = var_0_0[317]
	},
	{
		stateName = "core:ClosureOrTightPositionState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[320]
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
		converter = var_0_0[322]
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
		refresh = var_0_3[0],
		converter = var_0_0[323]
	},
	{
		stateName = "core:LockedUnlockedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[325]
	},
	{
		stateName = "core:OpenClosedState",
		parameters = {
			{
				rawStateId = "65556",
				name = "p1"
			}
		},
		converter = var_0_0[326]
	},
	{
		stateName = "core:ComfortTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832527",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[331]
	},
	{
		stateName = "core:EcoTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832530",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[331]
	},
	{
		stateName = "core:FrostProtectionTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832534",
				name = "p1"
			}
		},
		converter = var_0_0[331]
	},
	{
		stateName = "core:HaltedTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832531",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[331]
	},
	{
		stateName = "core:SecuredPositionTemperatureState",
		parameters = {
			{
				rawStateId = "16832522",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[331]
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
		converter = var_0_0[332]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[331]
	},
	{
		stateName = "io:DHWCapacityState",
		parameters = {
			{
				rawStateId = "201328641",
				name = "p1"
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[333]
	},
	{
		stateName = "core:ActiveTimeProgramState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = var_0_0[336]
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[337]
	},
	{
		stateName = "core:BatteryLevelState",
		parameters = {
			{
				rawStateId = "84059682",
				name = "p1"
			}
		},
		converter = var_0_0[338],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:ComfortRoomTemperatureState",
		parameters = {
			{
				rawStateId = "84059685",
				name = "p1"
			}
		},
		converter = var_0_0[339],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:DerogatedTargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059681",
				name = "p1"
			}
		},
		converter = var_0_0[340],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:DerogationEndDateTimeState",
		parameters = {
			{
				rawStateId = "84059681",
				name = "p1"
			}
		},
		converter = var_0_0[341],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:DerogationStartDateTimeState",
		parameters = {
			{
				rawStateId = "84059681",
				name = "p1"
			}
		},
		converter = var_0_0[342],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:EcoTargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059685",
				name = "p1"
			}
		},
		converter = var_0_0[343],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:FrostProtectionRoomTemperatureState",
		parameters = {
			{
				rawStateId = "84059685",
				name = "p1"
			}
		},
		converter = var_0_0[344],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:MaxSetpointState",
		parameters = {
			{
				rawStateId = "84059684",
				name = "p1"
			}
		},
		converter = var_0_0[345],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:MinSetpointState",
		parameters = {
			{
				rawStateId = "84059684",
				name = "p1"
			}
		},
		converter = var_0_0[346],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:OpenClosedValveState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059680",
				converter = var_0_0[347]
			}
		},
		refresh = var_0_3[1],
		filter = var_0_2[1],
		converter = var_0_0[348]
	},
	{
		stateName = "core:OpenWindowDetectionActivationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = var_0_0[347]
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[349]
	},
	{
		stateName = "core:OperatingModeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059680",
				converter = var_0_0[350]
			}
		},
		refresh = var_0_3[1],
		filter = var_0_2[1],
		converter = var_0_0[351]
	},
	{
		stateName = "core:SensorDefectState",
		parameters = {
			{
				rawStateId = "84059682",
				name = "p1"
			}
		},
		converter = var_0_0[352],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:TargetRoomTemperatureState",
		parameters = {
			{
				rawStateId = "84059680",
				name = "p1"
			}
		},
		converter = var_0_0[353],
		refresh = var_0_3[1],
		filter = var_0_2[1]
	},
	{
		stateName = "core:TargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059680",
				name = "p1"
			}
		},
		converter = var_0_0[353],
		refresh = var_0_3[1],
		filter = var_0_2[1]
	},
	{
		stateName = "core:TemperatureOffsetConfigurationState",
		parameters = {
			{
				rawStateId = "84059684",
				name = "p1"
			}
		},
		converter = var_0_0[354],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:TimeProgram1State",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059686",
				converter = var_0_0[355]
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[356]
	},
	{
		stateName = "core:TimeProgram2State",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059687",
				converter = var_0_0[355]
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[356]
	},
	{
		stateName = "io:AwayModeTargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059685",
				name = "p1"
			}
		},
		converter = var_0_0[357],
		refresh = var_0_3[1]
	},
	{
		stateName = "io:ByPassActivationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = var_0_0[358]
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[359]
	},
	{
		stateName = "io:CurrentHeatingModeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059680",
				converter = var_0_0[360]
			}
		},
		refresh = var_0_3[1],
		filter = var_0_2[1],
		converter = var_0_0[361]
	},
	{
		stateName = "io:DerogationHeatingModeState",
		parameters = {
			{
				rawStateId = "84059681",
				name = "p1"
			}
		},
		converter = var_0_0[362],
		refresh = var_0_3[1]
	},
	{
		stateName = "io:DerogationTypeState",
		parameters = {
			{
				rawStateId = "84059681",
				name = "p1"
			}
		},
		converter = var_0_0[363],
		refresh = var_0_3[1]
	},
	{
		stateName = "io:GeofencingModeTargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059685",
				name = "p1"
			}
		},
		converter = var_0_0[364],
		refresh = var_0_3[1]
	},
	{
		stateName = "io:LockKeyActivationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = var_0_0[350]
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[365]
	},
	{
		stateName = "io:ManualModeTargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059681",
				name = "p1"
			}
		},
		converter = var_0_0[340],
		refresh = var_0_3[1]
	},
	{
		stateName = "io:OpenWindowDetectedTargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059685",
				name = "p1"
			}
		},
		converter = var_0_0[366],
		refresh = var_0_3[1]
	},
	{
		stateName = "io:ValveInstallationModeState",
		parameters = {
			{
				rawStateId = "84059682",
				name = "p1"
			}
		},
		converter = var_0_0[367],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "84059680",
				name = "p1"
			}
		},
		converter = var_0_0[373],
		refresh = var_0_3[1],
		filter = var_0_2[1]
	},
	{
		stateName = "core:ComfortTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832527",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[375]
	},
	{
		stateName = "core:EcoTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832530",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[375]
	},
	{
		stateName = "core:FrostProtectionTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832534",
				name = "p1"
			}
		},
		converter = var_0_0[375]
	},
	{
		stateName = "core:HaltedTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832531",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[375]
	},
	{
		stateName = "core:SecuredPositionTemperatureState",
		parameters = {
			{
				rawStateId = "16832522",
				name = "p1"
			}
		},
		refresh = var_0_3[3],
		converter = var_0_0[375]
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
		refresh = var_0_3[3],
		converter = var_0_0[376]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[377]
	},
	{
		stateName = "core:HeatingAnticipationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = var_0_0[380]
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[365]
	},
	{
		stateName = "core:PermanentDisplayState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = var_0_0[358]
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[365]
	},
	{
		stateName = "core:ThermalConfigurationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = var_0_0[381]
			}
		},
		refresh = var_0_3[1],
		converter = var_0_0[382]
	},
	{
		stateName = "core:TargetRoomTemperatureState",
		parameters = {
			{
				rawStateId = "84059680",
				name = "p1"
			}
		},
		converter = var_0_0[383],
		refresh = var_0_3[1],
		filter = var_0_2[1]
	},
	{
		stateName = "core:TargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059680",
				name = "p1"
			}
		},
		converter = var_0_0[383],
		refresh = var_0_3[1],
		filter = var_0_2[1]
	},
	{
		stateName = "core:TargetTemperatureHysteresisState",
		parameters = {
			{
				rawStateId = "84059684",
				name = "p1"
			}
		},
		converter = var_0_0[384],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:TemperatureOffsetConfigurationState",
		parameters = {
			{
				rawStateId = "84059684",
				name = "p1"
			}
		},
		converter = var_0_0[385],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:RelativeHumidityState",
		parameters = {
			{
				rawStateId = "84059680",
				name = "p1"
			}
		},
		converter = var_0_0[387],
		refresh = var_0_3[1],
		filter = var_0_2[1]
	},
	{
		stateName = "core:DeploymentState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = var_0_3[0],
		converter = var_0_0[388]
	},
	{
		stateName = "core:V40WaterVolumeEstimationState",
		parameters = {
			{
				rawStateId = "201339137",
				name = "p1"
			}
		},
		converter = var_0_0[389],
		refresh = var_0_3[12],
		filter = var_0_2[0]
	},
	{
		stateName = "core:AbsenceEndDateState",
		parameters = {
			{
				rawStateId = "201351937",
				name = "p1"
			}
		},
		converter = var_0_0[161]
	},
	{
		stateName = "core:AbsenceStartDateState",
		parameters = {
			{
				rawStateId = "201351681",
				name = "p1"
			}
		},
		converter = var_0_0[161]
	},
	{
		stateName = "core:BoostElectricPowerConsumptionState",
		parameters = {
			{
				rawStateId = "201343745",
				name = "p1"
			}
		},
		converter = var_0_0[165],
		refresh = var_0_3[6]
	},
	{
		stateName = "core:BoostEndDateState",
		parameters = {
			{
				rawStateId = "201351425",
				name = "p1"
			}
		},
		converter = var_0_0[161]
	},
	{
		stateName = "core:BoostStartDateState",
		parameters = {
			{
				rawStateId = "201351169",
				name = "p1"
			}
		},
		converter = var_0_0[161]
	},
	{
		stateName = "core:BottomTankWaterTemperatureState",
		parameters = {
			{
				rawStateId = "201332993",
				name = "p1"
			}
		},
		converter = var_0_0[182],
		refresh = var_0_3[6],
		filter = var_0_2[0]
	},
	{
		stateName = "core:ControlWaterTargetTemperatureState",
		parameters = {
			{
				rawStateId = "201345281",
				name = "p1"
			}
		},
		converter = var_0_0[166],
		refresh = var_0_3[0],
		filter = var_0_2[0]
	},
	{
		stateName = "core:ExpectedNumberOfShowerState",
		parameters = {
			{
				rawStateId = "201345025",
				name = "p1"
			}
		},
		converter = var_0_0[167],
		refresh = var_0_3[0],
		filter = var_0_2[0]
	},
	{
		stateName = "core:HeatingStatusState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201352193",
				converter = var_0_0[390]
			}
		},
		refresh = var_0_3[6],
		filter = var_0_2[0],
		converter = var_0_0[391]
	},
	{
		stateName = "core:MiddleWaterTemperatureInState",
		parameters = {
			{
				rawStateId = "201344257",
				name = "p1"
			}
		},
		converter = var_0_0[166],
		refresh = var_0_3[6],
		filter = var_0_2[0]
	},
	{
		stateName = "core:NumberOfShowerRemainingState",
		parameters = {
			{
				rawStateId = "201344513",
				name = "p1"
			}
		},
		converter = var_0_0[167],
		refresh = var_0_3[6],
		filter = var_0_2[0]
	},
	{
		stateName = "core:PowerHeatElectricalInState",
		parameters = {
			{
				rawStateId = "201344001",
				name = "p1"
			}
		},
		converter = var_0_0[165],
		refresh = var_0_3[6]
	},
	{
		stateName = "core:ProgrammingAvailableState",
		parameters = {
			{
				rawStateId = "201340929",
				name = "p1"
			}
		},
		converter = var_0_0[167],
		refresh = var_0_3[1]
	},
	{
		stateName = "core:StopRelaunchState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201340417",
				converter = var_0_0[167]
			}
		},
		refresh = var_0_3[0],
		filter = var_0_2[0],
		converter = var_0_0[392]
	},
	{
		stateName = "core:WaterTargetTemperatureState",
		parameters = {
			{
				rawStateId = "201344769",
				name = "p1"
			}
		},
		converter = var_0_0[166],
		refresh = var_0_3[0],
		filter = var_0_2[0]
	},
	{
		stateName = "core:TargetDHWTemperatureState",
		parameters = {
			{
				rawStateId = "201344769",
				name = "p1"
			}
		},
		converter = var_0_0[166],
		refresh = var_0_3[0],
		filter = var_0_2[0]
	},
	{
		stateName = "core:WaterTemperatureState",
		parameters = {
			{
				rawStateId = "201344769",
				name = "p1"
			}
		},
		converter = var_0_0[166],
		refresh = var_0_3[0],
		filter = var_0_2[0]
	},
	{
		stateName = "io:DHWAbsenceModeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201347841",
				converter = var_0_0[167]
			}
		},
		refresh = var_0_3[5],
		filter = var_0_2[0],
		converter = var_0_0[393]
	},
	{
		stateName = "io:DHWBoostModeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201347585",
				converter = var_0_0[167]
			}
		},
		refresh = var_0_3[5],
		filter = var_0_2[0],
		converter = var_0_0[393]
	},
	{
		stateName = "io:OneWayControllerButtonState",
		parameters = {
			{
				rawStateId = "65555",
				name = "p1"
			}
		},
		converter = var_0_0[396]
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
		converter = var_0_0[398]
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
		converter = var_0_0[399]
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
		converter = var_0_0[403]
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
		converter = var_0_0[407]
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
		converter = var_0_0[410]
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
		converter = var_0_0[413]
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
		converter = var_0_0[417]
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
		refresh = var_0_3[0],
		converter = var_0_0[421]
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
		refresh = var_0_3[0],
		converter = var_0_0[425]
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
		converter = var_0_0[429]
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
		converter = var_0_0[433]
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
		converter = var_0_0[437]
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
		converter = var_0_0[444]
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
		refresh = var_0_3[0],
		converter = var_0_0[448]
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
		refresh = var_0_3[0],
		converter = var_0_0[452]
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
		refresh = var_0_3[0],
		converter = var_0_0[456]
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
		refresh = var_0_3[0],
		converter = var_0_0[462]
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
		refresh = var_0_3[0],
		converter = var_0_0[465]
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
		converter = var_0_0[468]
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
		refresh = var_0_3[0],
		converter = var_0_0[472]
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
		refresh = var_0_3[0],
		converter = var_0_0[478]
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
		refresh = var_0_3[0],
		converter = var_0_0[482]
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
		converter = var_0_0[487]
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
		converter = var_0_0[491]
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
		converter = var_0_0[494]
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
		converter = var_0_0[498]
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
		converter = var_0_0[501]
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
		converter = var_0_0[504]
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
		converter = var_0_0[509]
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
		converter = var_0_0[513]
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
		converter = var_0_0[517]
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
		converter = var_0_0[520]
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
		converter = var_0_0[527]
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
		converter = var_0_0[531]
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
		converter = var_0_0[535]
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
		converter = var_0_0[541]
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
		converter = var_0_0[545]
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
		refresh = var_0_3[0],
		converter = var_0_0[551]
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
		refresh = var_0_3[0],
		converter = var_0_0[555]
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
		refresh = var_0_3[0],
		converter = var_0_0[399]
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
		converter = var_0_0[561]
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
		refresh = var_0_3[0],
		converter = var_0_0[561]
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
		converter = var_0_0[565]
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
		converter = var_0_0[569]
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
		refresh = var_0_3[0],
		converter = var_0_0[569]
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
		refresh = var_0_3[0],
		converter = var_0_0[573]
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
		converter = var_0_0[576]
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
		converter = var_0_0[581]
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
		converter = var_0_0[584]
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
		converter = var_0_0[587]
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
		converter = var_0_0[592]
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
		converter = var_0_0[597]
	}
}
var_0_5 = {
	[0] = {
		rawName = "io:generalinfo1",
		type = 3,
		converter = var_0_0[6]
	},
	{
		rawName = "io:manufacturerid",
		type = 3,
		converter = var_0_0[7]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[30]
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
		converter = var_0_0[235]
	},
	{
		rawName = "io:measuredvaluetype",
		type = 3,
		converter = var_0_0[236]
	},
	{
		rawName = "_io:minsensedvalue",
		type = 2,
		converter = var_0_0[235]
	},
	{
		defaultValue = "battery",
		type = 3
	},
	{
		rawName = "io:measuredvaluetype",
		type = 3,
		converter = var_0_0[238]
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
		converter = var_0_0[235]
	},
	{
		rawName = "io:gas-cooking",
		type = 6,
		converter = var_0_0[235]
	},
	{
		rawName = "io:gas-dhw",
		type = 6,
		converter = var_0_0[235]
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
		converter = var_0_0[301]
	},
	{
		rawName = "_io:configuration-window",
		type = 3,
		converter = var_0_0[302]
	},
	{
		rawName = "_io:configuration-window",
		type = 2,
		converter = var_0_0[303]
	},
	{
		rawName = "_io:configuration-intrusion",
		type = 2,
		converter = var_0_0[301]
	},
	{
		rawName = "_io:configuration-intrusion",
		type = 3,
		converter = var_0_0[302]
	},
	{
		rawName = "_io:configuration-intrusion",
		type = 2,
		converter = var_0_0[303]
	},
	{
		defaultValue = "IO Repeater",
		type = 3
	},
	{
		rawName = "core:groupid",
		type = 3,
		converter = var_0_0[316]
	},
	{
		rawName = "core:groupindex",
		type = 3,
		converter = var_0_0[316]
	},
	{
		rawName = "io:parametersManagement",
		type = 10,
		extraRawNames = {
			"io:eventingSystem",
			"io:autonomy"
		},
		converter = var_0_0[397]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[400]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[404]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[414]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[418]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[422]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[426]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[430]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[434]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[438]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[442]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[445]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[449]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[453]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[457]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[460]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[469]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[473]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[476]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[479]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[495]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[510]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[514]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[521]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[525]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[528]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[532]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[536]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[539]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[542]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[546]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[549]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[552]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[556]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[559]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[562]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[566]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[570]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[588]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = var_0_0[595]
	}
}
var_0_6 = {
	{
		linkedHighLevelState = {
			var_0_4[0],
			var_0_4[3]
		}
	},
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
		linkedHighLevelState = {
			var_0_4[4]
		}
	},
	{
		["core:FirmwareRevision"] = var_0_5[0],
		["core:Manufacturer"] = var_0_5[1]
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
		var_0_6[6],
		var_0_6[7]
	},
	{
		access = "r",
		parameterId = "65554"
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		converter = var_0_0[8],
		extraDefinition = var_0_6[9]
	},
	{
		var_0_6[6]
	},
	{
		access = "w",
		parameterId = "4"
	},
	{
		prototype = "integer[1;254]",
		parameters = var_0_6[11],
		converter = var_0_0[9],
		extraDefinition = var_0_6[12]
	},
	{
		extraDefinition = {
			access = "r",
			parameterId = "1"
		}
	},
	{
		converter = var_0_0[10],
		extraDefinition = var_0_6[12]
	},
	{
		access = "w",
		parameterId = "2146500642"
	},
	{
		prototype = "string,*integer[1;5]",
		parameters = var_0_6[8],
		converter = var_0_0[11],
		extraDefinition = var_0_6[16]
	},
	{
		access = "w",
		parameterId = "65537"
	},
	{
		prototype = "integer[0;100]",
		parameters = var_0_6[11],
		converter = var_0_0[12],
		extraDefinition = var_0_6[18]
	},
	{
		prototype = "string",
		parameters = var_0_6[11],
		converter = var_0_0[13],
		extraDefinition = {
			access = "w",
			parameterId = "1"
		}
	},
	{
		converter = var_0_0[14],
		extraDefinition = var_0_6[12]
	},
	{
		converter = var_0_0[15],
		extraDefinition = var_0_6[12]
	},
	{
		converter = var_0_0[16],
		extraDefinition = {
			access = "w",
			parameterId = "2146500643"
		}
	},
	{
		prototype = "string,*integer[1;5]",
		parameters = var_0_6[8],
		converter = var_0_0[17],
		extraDefinition = var_0_6[16]
	},
	{
		prototype = "string(configuration;virgin;close;transmitting)",
		parameters = var_0_6[11],
		converter = var_0_0[18],
		extraDefinition = {
			access = "w",
			parameterId = "11"
		}
	},
	{
		prototype = "integer[1;254]",
		parameters = var_0_6[11],
		converter = var_0_0[19],
		extraDefinition = var_0_6[12]
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
				["2146500638"] = var_0_6[1],
				["65537"] = var_0_6[2],
				["1"] = var_0_6[3],
				["2147426304"] = var_0_6[4]
			},
			attributes = var_0_6[5],
			commands = {
				advancedRefresh = var_0_6[10],
				delayedStopIdentify = var_0_6[13],
				getName = var_0_6[14],
				identify = var_0_6[15],
				pairOneWayController = var_0_6[17],
				setLevel = var_0_6[19],
				setName = var_0_6[20],
				startIdentify = var_0_6[21],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				wink = var_0_6[26]
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
			var_0_4[6],
			var_0_4[10]
		},
		linkedStateIds = var_0_6[30]
	},
	{
		"16830720",
		"16832512",
		"65537"
	},
	{
		linkedHighLevelState = {
			var_0_4[8],
			var_0_4[10]
		},
		linkedStateIds = var_0_6[32]
	},
	{
		var_0_4[10]
	},
	{
		linkedHighLevelState = var_0_6[34],
		linkedStateIds = {
			"16832512",
			"16832522",
			"65537"
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[11]
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
		parameters = var_0_6[11],
		converter = var_0_0[24],
		extraDefinition = var_0_6[18]
	},
	{
		{
			value = 100,
			name = "p1"
		}
	},
	{
		parameters = var_0_6[39],
		converter = var_0_0[24],
		extraDefinition = var_0_6[18]
	},
	{
		{
			value = 0,
			name = "p1"
		}
	},
	{
		parameters = var_0_6[41],
		converter = var_0_0[24],
		extraDefinition = var_0_6[18]
	},
	{
		isParameterRequired = true,
		name = "p2"
	},
	{
		var_0_6[6],
		var_0_6[43]
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
		parameters = var_0_6[11],
		converter = var_0_0[24],
		extraDefinition = var_0_6[46]
	},
	{
		prototype = "string(my;memorized1;secured)|integer[0;100]",
		parameters = var_0_6[11],
		converter = var_0_0[27],
		extraDefinition = var_0_6[18]
	},
	{
		value = "my",
		name = "p1"
	},
	{
		var_0_6[49]
	},
	{
		parameters = var_0_6[50],
		converter = var_0_0[27],
		extraDefinition = var_0_6[18]
	},
	{
		access = "w",
		parameterId = "16832522"
	},
	{
		prototype = "integer[0;100]",
		parameters = var_0_6[11],
		converter = var_0_0[24],
		extraDefinition = var_0_6[52]
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
			var_0_4[5],
			var_0_4[12],
			var_0_4[10]
		},
		linkedStateIds = var_0_6[29]
	},
	{
		linkedHighLevelState = {
			var_0_4[13],
			var_0_4[14]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[15]
		}
	},
	{
		["65537"] = var_0_6[55],
		["2146500638"] = var_0_6[1],
		["16832512"] = var_0_6[31],
		["1"] = var_0_6[3],
		["16832522"] = var_0_6[33],
		["2147426304"] = var_0_6[4],
		["16830720"] = var_0_6[35],
		["65557"] = var_0_6[36],
		["2"] = var_0_6[56],
		["2146500645"] = var_0_6[57]
	},
	{
		["core:FirmwareRevision"] = var_0_5[0],
		["core:Manufacturer"] = var_0_5[1],
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[2]
	},
	{
		access = "w",
		parameterId = "49414656"
	},
	{
		converter = var_0_0[32],
		extraDefinition = var_0_6[60]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		converter = var_0_0[33],
		extraDefinition = var_0_6[45]
	},
	{
		converter = var_0_0[34],
		extraDefinition = var_0_6[18]
	},
	{
		converter = var_0_0[35],
		extraDefinition = var_0_6[60]
	},
	{
		converter = var_0_0[36],
		extraDefinition = {
			access = "w",
			parameterId = "2146500637"
		}
	},
	{
		advancedRefresh = var_0_6[10],
		delayedStopIdentify = var_0_6[13],
		getName = var_0_6[14],
		identify = var_0_6[15],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		runManufacturerSettingsCommand = var_0_6[62],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		up = var_0_6[42],
		setMemorized1Position = var_0_6[47],
		setName = var_0_6[20],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setSecuredPosition = var_0_6[53],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		stopIdentify = var_0_6[22],
		unpairAllOneWayControllers = var_0_6[23],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		unpairOneWayController = var_0_6[24],
		setConfigState = var_0_6[25],
		wink = var_0_6[26],
		sendIOKey = var_0_6[65]
	},
	{
		["io:RollerShutterGenericIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutter",
			uiClass = "RollerShutter",
			uiProfiles = var_0_6[54],
			states = var_0_6[58],
			attributes = var_0_6[59],
			commands = var_0_6[66]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[5],
			var_0_4[12]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[6]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[8]
		}
	},
	{
		["65537"] = var_0_6[68],
		["2146500638"] = var_0_6[1],
		["16832512"] = var_0_6[69],
		["1"] = var_0_6[3],
		["16832522"] = var_0_6[70],
		["2147426304"] = var_0_6[4]
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
			var_0_4[18]
		}
	},
	{
		linkedHighLevelState = var_0_6[34],
		linkedStateIds = var_0_6[30]
	},
	{
		linkedHighLevelState = var_0_6[34],
		linkedStateIds = var_0_6[32]
	},
	{
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[16],
				var_0_4[17],
				var_0_4[10]
			},
			linkedStateIds = var_0_6[29]
		},
		["2146500638"] = var_0_6[1],
		["1"] = var_0_6[3],
		["65540"] = var_0_6[73],
		["2147426304"] = var_0_6[4],
		["16830720"] = var_0_6[35],
		["16832512"] = var_0_6[74],
		["16832522"] = var_0_6[75],
		["65557"] = var_0_6[36],
		["2"] = var_0_6[56],
		["2146500645"] = var_0_6[57]
	},
	{
		prototype = "integer[0;100]|string(rocker),*integer[0;100]",
		parameters = var_0_6[8],
		converter = var_0_0[39],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "integer[0;100]|string(rocker)",
		parameters = var_0_6[11],
		converter = var_0_0[40],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[39],
		converter = var_0_0[40],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[41],
		converter = var_0_0[40],
		extraDefinition = var_0_6[18]
	},
	{
		prototype = "integer[0;100]",
		parameters = var_0_6[11],
		converter = var_0_0[40],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = {
			{
				value = "rocker",
				name = "p1"
			}
		},
		converter = var_0_0[40],
		extraDefinition = var_0_6[18]
	},
	{
		prototype = "integer[0;100]",
		parameters = var_0_6[11],
		converter = var_0_0[41],
		extraDefinition = var_0_6[45]
	},
	{
		converter = var_0_0[42],
		extraDefinition = var_0_6[45]
	},
	{
		type = 1,
		widget = "PositionableOrOrientableRollerShutter",
		uiClass = "AdjustableSlatsRollerShutter",
		uiProfiles = var_0_6[72],
		states = var_0_6[76],
		attributes = var_0_6[59],
		commands = {
			advancedRefresh = var_0_6[10],
			delayedStopIdentify = var_0_6[13],
			getName = var_0_6[14],
			identify = var_0_6[15],
			keepOneWayControllersAndDeleteNode = var_0_6[61],
			runManufacturerSettingsCommand = var_0_6[62],
			pairOneWayController = var_0_6[17],
			setClosureOrOrientation = var_0_6[77],
			setClosureOrRockerPosition = var_0_6[78],
			close = var_0_6[79],
			down = var_0_6[79],
			open = var_0_6[80],
			setClosure = var_0_6[81],
			setDeployment = var_0_6[81],
			setRockerPosition = var_0_6[82],
			up = var_0_6[80],
			setName = var_0_6[20],
			setOrientation = var_0_6[83],
			startIdentify = var_0_6[21],
			stop = var_0_6[84],
			stopIdentify = var_0_6[22],
			unpairAllOneWayControllers = var_0_6[23],
			unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
			unpairOneWayController = var_0_6[24],
			setConfigState = var_0_6[25],
			wink = var_0_6[26],
			sendIOKey = var_0_6[65]
		}
	},
	{
		["io:AdjustableSlatsRollerShutterIOComponent"] = var_0_6[85]
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
			var_0_4[5],
			var_0_4[20],
			var_0_4[12],
			var_0_4[10]
		},
		linkedStateIds = var_0_6[29]
	},
	{
		["65537"] = var_0_6[88],
		["2146500638"] = var_0_6[1],
		["16832512"] = var_0_6[31],
		["1"] = var_0_6[3],
		["16832522"] = var_0_6[33],
		["2147426304"] = var_0_6[4],
		["16830720"] = var_0_6[35],
		["65557"] = var_0_6[36],
		["2"] = var_0_6[56],
		["2146500645"] = var_0_6[57]
	},
	{
		advancedRefresh = var_0_6[10],
		delayedStopIdentify = var_0_6[13],
		getName = var_0_6[14],
		identify = var_0_6[15],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		runManufacturerSettingsCommand = var_0_6[62],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		setMemorized1Position = var_0_6[47],
		setName = var_0_6[20],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setSecuredPosition = var_0_6[53],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		stopIdentify = var_0_6[22],
		unpairAllOneWayControllers = var_0_6[23],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		unpairOneWayController = var_0_6[24],
		setConfigState = var_0_6[25],
		wink = var_0_6[26],
		sendIOKey = var_0_6[65]
	},
	{
		["io:VerticalExteriorAwningIOComponent"] = {
			type = 1,
			widget = "PositionableScreen",
			uiClass = "ExteriorScreen",
			uiProfiles = var_0_6[87],
			states = var_0_6[89],
			attributes = var_0_6[59],
			commands = var_0_6[90]
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
		["65537"] = var_0_6[68],
		["2146500638"] = var_0_6[1],
		["1"] = var_0_6[3],
		["2147426304"] = var_0_6[4]
	},
	{
		advancedRefresh = var_0_6[10],
		delayedStopIdentify = var_0_6[13],
		getName = var_0_6[14],
		identify = var_0_6[15],
		pairOneWayController = var_0_6[17],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		open = var_0_6[42],
		setName = var_0_6[20],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		stopIdentify = var_0_6[22],
		unpairAllOneWayControllers = var_0_6[23],
		unpairOneWayController = var_0_6[24],
		setConfigState = var_0_6[25],
		wink = var_0_6[26]
	},
	{
		["io:WindowOpenerVeluxIOComponent"] = {
			type = 1,
			widget = "PositionableTiltedWindow",
			uiClass = "Window",
			uiProfiles = var_0_6[92],
			states = var_0_6[93],
			attributes = var_0_6[5],
			commands = var_0_6[94]
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
				["65537"] = {
					linkedHighLevelState = {
						var_0_4[21],
						var_0_4[22]
					}
				},
				["2146500638"] = var_0_6[1],
				["1"] = var_0_6[3],
				["2147426304"] = var_0_6[4],
				["2"] = var_0_6[56],
				["2146500645"] = var_0_6[57]
			},
			attributes = var_0_6[59],
			commands = {
				advancedRefresh = var_0_6[10],
				delayedStopIdentify = var_0_6[13],
				getName = var_0_6[14],
				identify = var_0_6[15],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				runManufacturerSettingsCommand = var_0_6[62],
				pairOneWayController = var_0_6[17],
				setClosure = var_0_6[38],
				close = var_0_6[40],
				down = var_0_6[40],
				open = var_0_6[42],
				up = var_0_6[42],
				setName = var_0_6[20],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				wink = var_0_6[26],
				sendIOKey = var_0_6[65]
			}
		}
	},
	{
		"OpenCloseGarageOpener",
		"OpenClose"
	},
	{
		converter = var_0_0[49],
		extraDefinition = var_0_6[18]
	},
	{
		converter = var_0_0[50],
		extraDefinition = var_0_6[18]
	},
	{
		["io:DiscreteGarageOpenerIOComponent"] = {
			type = 1,
			widget = "DiscretePositionableGarageDoor",
			uiClass = "GarageDoor",
			uiProfiles = var_0_6[97],
			states = {
				["2146500638"] = var_0_6[1],
				["1"] = var_0_6[3],
				["65537"] = {
					linkedHighLevelState = {
						var_0_4[22]
					}
				},
				["2147426304"] = var_0_6[4],
				["2"] = var_0_6[56],
				["2146500645"] = var_0_6[57]
			},
			attributes = var_0_6[59],
			commands = {
				advancedRefresh = var_0_6[10],
				close = var_0_6[98],
				delayedStopIdentify = var_0_6[13],
				down = var_0_6[98],
				getName = var_0_6[14],
				identify = var_0_6[15],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				runManufacturerSettingsCommand = var_0_6[62],
				open = var_0_6[99],
				pairOneWayController = var_0_6[17],
				setName = var_0_6[20],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				up = var_0_6[99],
				wink = var_0_6[26],
				sendIOKey = var_0_6[65]
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
			var_0_4[23],
			var_0_4[25]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[24]
		}
	},
	{
		prototype = "integer[0;100]",
		parameters = var_0_6[11],
		converter = var_0_0[53],
		extraDefinition = var_0_6[45]
	},
	{
		parameters = var_0_6[41],
		converter = var_0_0[53],
		extraDefinition = var_0_6[45]
	},
	{
		parameters = var_0_6[39],
		converter = var_0_0[53],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(off;on)",
		parameters = var_0_6[11],
		aliasConverter = var_0_0[54],
		converter = var_0_0[53],
		extraDefinition = var_0_6[45]
	},
	{
		isParameterRequired = false,
		name = "p3"
	},
	{
		prototype = "integer[0;100],integer[5;14400],*integer[0;100]",
		parameters = {
			var_0_6[6],
			var_0_6[43],
			var_0_6[108]
		},
		converter = var_0_0[55],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "integer[5;14400]",
		parameters = var_0_6[11],
		aliasConverter = var_0_0[56],
		converter = var_0_0[55],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "integer[0;100]",
		parameters = var_0_6[11],
		converter = var_0_0[57],
		extraDefinition = var_0_6[46]
	},
	{
		prototype = "string(my;memorized1;secured)|integer[0;100]",
		parameters = var_0_6[11],
		converter = var_0_0[58],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[50],
		converter = var_0_0[58],
		extraDefinition = var_0_6[18]
	},
	{
		prototype = "integer[0;100]",
		parameters = var_0_6[11],
		converter = var_0_0[57],
		extraDefinition = var_0_6[52]
	},
	{
		["io:DimmableLightIOComponent"] = {
			type = 1,
			widget = "DimmerLight",
			uiClass = "Light",
			uiProfiles = var_0_6[101],
			states = {
				["2146500638"] = var_0_6[1],
				["65537"] = var_0_6[102],
				["16832512"] = var_0_6[103],
				["1"] = var_0_6[3],
				["16832522"] = var_0_6[70],
				["2147426304"] = var_0_6[4],
				["2"] = var_0_6[56],
				["2146500645"] = var_0_6[57]
			},
			attributes = var_0_6[59],
			commands = {
				advancedRefresh = var_0_6[10],
				delayedStopIdentify = var_0_6[13],
				getName = var_0_6[14],
				identify = var_0_6[15],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				runManufacturerSettingsCommand = var_0_6[62],
				pairOneWayController = var_0_6[17],
				refreshMemorized1Position = var_0_6[37],
				setIntensity = var_0_6[104],
				off = var_0_6[105],
				on = var_0_6[106],
				setOnOff = var_0_6[107],
				setIntensityWithTimer = var_0_6[109],
				onWithTimer = var_0_6[110],
				setMemorized1Position = var_0_6[111],
				setName = var_0_6[20],
				setPosition = var_0_6[112],
				my = var_0_6[113],
				setSecuredPosition = var_0_6[114],
				startIdentify = var_0_6[21],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				wink = var_0_6[26],
				sendIOKey = var_0_6[65]
			}
		}
	},
	{
		["2146500638"] = var_0_6[1],
		["1"] = var_0_6[3],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[26]
			}
		},
		["2147426304"] = var_0_6[4]
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
		var_0_4[27],
		var_0_4[28],
		var_0_4[29]
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
			var_0_6[6],
			var_0_6[43],
			var_0_6[122]
		},
		converter = var_0_0[64],
		extraDefinition = var_0_6[45]
	},
	{
		isParameterRequired = true,
		name = "p4"
	},
	{
		var_0_6[6],
		var_0_6[43],
		var_0_6[122],
		var_0_6[124]
	},
	{
		prototype = "integer[0;255],integer[0;255],integer[0;255],integer[5;14400]",
		parameters = var_0_6[125],
		converter = var_0_0[65],
		extraDefinition = var_0_6[45]
	},
	{
		["io:DimmableRGBLightIOComponent"] = {
			type = 1,
			widget = "DimmerRGBColouredLight",
			uiClass = "Light",
			uiProfiles = var_0_6[101],
			states = {
				["65547"] = {
					linkedHighLevelState = var_0_6[119],
					linkedStateIds = var_0_6[120]
				},
				["65548"] = {
					linkedHighLevelState = var_0_6[119],
					linkedStateIds = var_0_6[121]
				},
				["65537"] = {
					linkedHighLevelState = {
						var_0_4[27],
						var_0_4[28],
						var_0_4[23],
						var_0_4[25],
						var_0_4[29]
					},
					linkedStateIds = {
						"65547",
						"65548"
					}
				},
				["2146500638"] = var_0_6[1],
				["16832512"] = var_0_6[103],
				["1"] = var_0_6[3],
				["16832522"] = var_0_6[70],
				["2147426304"] = var_0_6[4],
				["2"] = var_0_6[56],
				["2146500645"] = var_0_6[57]
			},
			attributes = var_0_6[59],
			commands = {
				advancedRefresh = var_0_6[10],
				delayedStopIdentify = var_0_6[13],
				getName = var_0_6[14],
				identify = var_0_6[15],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				runManufacturerSettingsCommand = var_0_6[62],
				pairOneWayController = var_0_6[17],
				refreshMemorized1Position = var_0_6[37],
				setIntensity = var_0_6[104],
				off = var_0_6[105],
				on = var_0_6[106],
				setOnOff = var_0_6[107],
				setIntensityWithTimer = var_0_6[109],
				onWithTimer = var_0_6[110],
				setMemorized1Position = var_0_6[111],
				setName = var_0_6[20],
				setPosition = var_0_6[112],
				my = var_0_6[113],
				setRGB = var_0_6[123],
				setRGBWithTimer = var_0_6[126],
				setSecuredPosition = var_0_6[114],
				startIdentify = var_0_6[21],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				wink = var_0_6[26],
				sendIOKey = var_0_6[65]
			}
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[30]
		}
	},
	{
		rawStateId = "65537"
	},
	{
		var_0_6[129]
	},
	{
		prototype = "integer[2000;6500]",
		parameters = var_0_6[11],
		rawStates = var_0_6[130],
		converter = var_0_0[67],
		extraDefinition = var_0_6[45]
	},
	{
		["io:DimmableColorTemperatureLightIOComponent"] = {
			type = 1,
			widget = "DimmerColorTemperatureLight",
			uiClass = "Light",
			uiProfiles = var_0_6[101],
			states = {
				["65551"] = var_0_6[128],
				["2146500638"] = var_0_6[1],
				["65537"] = var_0_6[102],
				["16832512"] = var_0_6[103],
				["1"] = var_0_6[3],
				["16832522"] = var_0_6[70],
				["2147426304"] = var_0_6[4],
				["2"] = var_0_6[56],
				["2146500645"] = var_0_6[57]
			},
			attributes = var_0_6[59],
			commands = {
				advancedRefresh = var_0_6[10],
				delayedStopIdentify = var_0_6[13],
				getName = var_0_6[14],
				identify = var_0_6[15],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				runManufacturerSettingsCommand = var_0_6[62],
				pairOneWayController = var_0_6[17],
				refreshMemorized1Position = var_0_6[37],
				setColorTemperature = var_0_6[131],
				setIntensity = var_0_6[104],
				off = var_0_6[105],
				on = var_0_6[106],
				setOnOff = var_0_6[107],
				setIntensityWithTimer = var_0_6[109],
				onWithTimer = var_0_6[110],
				setMemorized1Position = var_0_6[111],
				setName = var_0_6[20],
				setPosition = var_0_6[112],
				my = var_0_6[113],
				setSecuredPosition = var_0_6[114],
				startIdentify = var_0_6[21],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				wink = var_0_6[26],
				sendIOKey = var_0_6[65]
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
			var_0_4[31]
		}
	},
	{
		prototype = "integer[5;14400]",
		parameters = var_0_6[11],
		converter = var_0_0[69],
		extraDefinition = var_0_6[18]
	},
	{
		prototype = "string(off;on)",
		parameters = var_0_6[11],
		converter = var_0_0[70],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[117],
		converter = var_0_0[70],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[118],
		converter = var_0_0[70],
		extraDefinition = var_0_6[18]
	},
	{
		type = 1,
		widget = "StatefulOnOffLight",
		uiClass = "Light",
		uiProfiles = var_0_6[133],
		states = {
			["2146500638"] = var_0_6[1],
			["1"] = var_0_6[3],
			["65537"] = var_0_6[134],
			["2147426304"] = var_0_6[4],
			["2"] = var_0_6[56],
			["2146500645"] = var_0_6[57]
		},
		attributes = var_0_6[59],
		commands = {
			advancedRefresh = var_0_6[10],
			delayedStopIdentify = var_0_6[13],
			getName = var_0_6[14],
			identify = var_0_6[15],
			keepOneWayControllersAndDeleteNode = var_0_6[61],
			runManufacturerSettingsCommand = var_0_6[62],
			onWithTimer = var_0_6[135],
			pairOneWayController = var_0_6[17],
			setName = var_0_6[20],
			setOnOff = var_0_6[136],
			off = var_0_6[137],
			on = var_0_6[138],
			startIdentify = var_0_6[21],
			stopIdentify = var_0_6[22],
			unpairAllOneWayControllers = var_0_6[23],
			unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
			unpairOneWayController = var_0_6[24],
			setConfigState = var_0_6[25],
			wink = var_0_6[26],
			sendIOKey = var_0_6[65]
		}
	},
	{
		["io:OnOffLightIOComponent"] = var_0_6[139]
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
			var_0_4[33],
			var_0_4[34]
		},
		linkedStateIds = var_0_6[142]
	},
	{
		var_0_4[33]
	},
	{
		linkedHighLevelState = var_0_6[144],
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
		parameters = var_0_6[11],
		converter = var_0_0[73],
		extraDefinition = var_0_6[18]
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
				["65537"] = {
					linkedHighLevelState = {
						var_0_4[32],
						var_0_4[33]
					},
					linkedStateIds = var_0_6[141]
				},
				["2146500638"] = var_0_6[1],
				["1"] = var_0_6[3],
				["16832519"] = var_0_6[143],
				["16830720"] = var_0_6[145],
				["2147426304"] = var_0_6[4],
				["2"] = var_0_6[56],
				["2146500645"] = var_0_6[57]
			},
			attributes = var_0_6[59],
			commands = {
				advancedRefresh = var_0_6[10],
				delayedStopIdentify = var_0_6[13],
				getName = var_0_6[14],
				identify = var_0_6[15],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				runManufacturerSettingsCommand = var_0_6[62],
				pairOneWayController = var_0_6[17],
				refreshPedestrianPosition = var_0_6[146],
				setClosureOrPedestrianPosition = {
					prototype = "integer[0;100]|string(pedestrian)",
					parameters = var_0_6[11],
					converter = var_0_0[73],
					extraDefinition = var_0_6[18]
				},
				close = {
					parameters = var_0_6[39],
					converter = var_0_0[73],
					extraDefinition = var_0_6[18]
				},
				open = {
					parameters = var_0_6[41],
					converter = var_0_0[73],
					extraDefinition = var_0_6[18]
				},
				setClosure = var_0_6[147],
				setDeployment = var_0_6[147],
				setPedestrianPosition = {
					parameters = {
						{
							value = "pedestrian",
							name = "p1"
						}
					},
					converter = var_0_0[73],
					extraDefinition = var_0_6[18]
				},
				setName = var_0_6[20],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				wink = var_0_6[26],
				sendIOKey = var_0_6[65]
			}
		}
	},
	{
		"OpenCloseSlidingGateOpener",
		"OpenClose"
	},
	{
		converter = var_0_0[74],
		extraDefinition = var_0_6[18]
	},
	{
		type = 1,
		widget = "SlidingDiscreteGateWithPedestrianPosition",
		uiClass = "Gate",
		uiProfiles = var_0_6[149],
		states = {
			["2146500638"] = var_0_6[1],
			["1"] = var_0_6[3],
			["65537"] = {
				linkedHighLevelState = var_0_6[144],
				linkedStateIds = var_0_6[141]
			},
			["16832519"] = var_0_6[143],
			["16830720"] = var_0_6[145],
			["2147426304"] = var_0_6[4],
			["2"] = var_0_6[56],
			["2146500645"] = var_0_6[57]
		},
		attributes = var_0_6[59],
		commands = {
			advancedRefresh = var_0_6[10],
			close = var_0_6[98],
			delayedStopIdentify = var_0_6[13],
			getName = var_0_6[14],
			identify = var_0_6[15],
			keepOneWayControllersAndDeleteNode = var_0_6[61],
			runManufacturerSettingsCommand = var_0_6[62],
			open = var_0_6[99],
			pairOneWayController = var_0_6[17],
			refreshPedestrianPosition = var_0_6[146],
			setName = var_0_6[20],
			setPedestrianPosition = var_0_6[150],
			startIdentify = var_0_6[21],
			stop = var_0_6[63],
			stopIdentify = var_0_6[22],
			unpairAllOneWayControllers = var_0_6[23],
			unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
			unpairOneWayController = var_0_6[24],
			setConfigState = var_0_6[25],
			wink = var_0_6[26],
			sendIOKey = var_0_6[65]
		}
	},
	{
		["io:SlidingDiscreteGateOpenerIOComponent"] = var_0_6[151]
	},
	{
		linkedHighLevelState = {
			var_0_4[5],
			var_0_4[7]
		}
	},
	{
		advancedRefresh = var_0_6[10],
		delayedStopIdentify = var_0_6[13],
		getName = var_0_6[14],
		identify = var_0_6[15],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		runManufacturerSettingsCommand = var_0_6[62],
		pairOneWayController = var_0_6[17],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		open = var_0_6[42],
		setName = var_0_6[20],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		stopIdentify = var_0_6[22],
		unpairAllOneWayControllers = var_0_6[23],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		unpairOneWayController = var_0_6[24],
		setConfigState = var_0_6[25],
		wink = var_0_6[26],
		sendIOKey = var_0_6[65]
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
				["65537"] = var_0_6[153],
				["2146500638"] = var_0_6[1],
				["1"] = var_0_6[3],
				["2147426304"] = var_0_6[4],
				["2"] = var_0_6[56],
				["2146500645"] = var_0_6[57]
			},
			attributes = var_0_6[59],
			commands = var_0_6[154]
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
			var_0_4[35],
			var_0_4[36]
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
		parameters = var_0_6[159],
		converter = var_0_0[77],
		extraDefinition = var_0_6[18]
	},
	{
		{
			value = "open",
			name = "p1"
		}
	},
	{
		parameters = var_0_6[161],
		converter = var_0_0[77],
		extraDefinition = var_0_6[18]
	},
	{
		["io:DoorLockIOComponent"] = {
			type = 1,
			widget = "DoorLock",
			uiClass = "DoorLock",
			uiProfiles = var_0_6[156],
			states = {
				["2146500638"] = var_0_6[1],
				["65537"] = var_0_6[157],
				["1"] = var_0_6[3],
				["2147426304"] = var_0_6[4],
				["2"] = var_0_6[56],
				["2146500645"] = var_0_6[57]
			},
			attributes = var_0_6[59],
			commands = {
				advancedRefresh = var_0_6[10],
				delayedStopIdentify = var_0_6[13],
				getName = var_0_6[14],
				getOpenClose = var_0_6[158],
				identify = var_0_6[15],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				runManufacturerSettingsCommand = var_0_6[62],
				pairOneWayController = var_0_6[17],
				refreshLockedUnlocked = var_0_6[158],
				setName = var_0_6[20],
				setOpenClosed = {
					prototype = "string(open;closed)",
					parameters = var_0_6[11],
					converter = var_0_0[77],
					extraDefinition = var_0_6[18]
				},
				close = var_0_6[160],
				lock = var_0_6[160],
				open = var_0_6[162],
				setLockedUnlocked = {
					prototype = "string(locked;unlocked)",
					parameters = var_0_6[11],
					aliasConverter = var_0_0[78],
					converter = var_0_0[77],
					extraDefinition = var_0_6[18]
				},
				unlock = var_0_6[162],
				startIdentify = var_0_6[21],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				wink = var_0_6[26],
				sendIOKey = var_0_6[65]
			}
		}
	},
	{
		parameters = var_0_6[159],
		converter = var_0_0[81],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[161],
		converter = var_0_0[81],
		extraDefinition = var_0_6[18]
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
				["2146500638"] = var_0_6[1],
				["65537"] = var_0_6[157],
				["1"] = var_0_6[3],
				["2147426304"] = var_0_6[4],
				["65538"] = {
					linkedHighLevelState = {
						var_0_4[37]
					}
				}
			},
			attributes = var_0_6[5],
			commands = {
				advancedRefresh = var_0_6[10],
				delayedStopIdentify = var_0_6[13],
				getName = var_0_6[14],
				identify = var_0_6[15],
				pairOneWayController = var_0_6[17],
				setLockPosition = {
					prototype = "any",
					parameters = var_0_6[11],
					converter = var_0_0[80],
					extraDefinition = var_0_6[45]
				},
				setName = var_0_6[20],
				setOpenClosed = {
					prototype = "string(open;closed)",
					parameters = var_0_6[11],
					converter = var_0_0[81],
					extraDefinition = var_0_6[18]
				},
				close = var_0_6[164],
				lock = var_0_6[164],
				open = var_0_6[165],
				setLockedUnlocked = {
					prototype = "string(locked;unlocked)",
					parameters = var_0_6[11],
					aliasConverter = var_0_0[78],
					converter = var_0_0[81],
					extraDefinition = var_0_6[18]
				},
				unlock = var_0_6[165],
				startIdentify = var_0_6[21],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				wink = var_0_6[26]
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
		advancedRefresh = var_0_6[10],
		delayedStopIdentify = var_0_6[13],
		getName = var_0_6[14],
		identify = var_0_6[15],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		runManufacturerSettingsCommand = var_0_6[62],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		up = var_0_6[42],
		setMemorized1Position = var_0_6[47],
		setName = var_0_6[20],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setSecuredPosition = var_0_6[53],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		stopIdentify = var_0_6[22],
		unpairAllOneWayControllers = var_0_6[23],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		unpairOneWayController = var_0_6[24],
		setConfigState = var_0_6[25],
		wink = var_0_6[26],
		sendIOKey = var_0_6[65]
	},
	{
		["io:VerticalInteriorBlindGenericIOComponent"] = {
			type = 1,
			widget = "PositionableScreen",
			uiClass = "Screen",
			uiProfiles = var_0_6[167],
			states = var_0_6[58],
			attributes = var_0_6[59],
			commands = var_0_6[168]
		}
	},
	{
		prototype = "any",
		parameters = var_0_6[11],
		converter = var_0_0[82],
		extraDefinition = var_0_6[45]
	},
	{
		parameters = var_0_6[39],
		converter = var_0_0[82],
		extraDefinition = var_0_6[45]
	},
	{
		parameters = var_0_6[41],
		converter = var_0_0[82],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "integer[0;100],integer[0;100]",
		parameters = var_0_6[44],
		converter = var_0_0[83],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "any",
		parameters = var_0_6[11],
		converter = var_0_0[84],
		extraDefinition = var_0_6[45]
	},
	{
		parameters = var_0_6[39],
		converter = var_0_0[84],
		extraDefinition = var_0_6[45]
	},
	{
		parameters = var_0_6[41],
		converter = var_0_0[84],
		extraDefinition = var_0_6[45]
	},
	{
		"StatefulThermostatWithSensor",
		"StatefulThermostat",
		"Thermostat"
	},
	{
		var_0_4[42],
		var_0_4[43],
		var_0_4[44],
		var_0_4[45],
		var_0_4[46]
	},
	{
		linkedHighLevelState = {
			var_0_4[46]
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
		parameters = var_0_6[11],
		rawStates = var_0_6[182],
		converter = var_0_0[95],
		extraDefinition = var_0_6[183]
	},
	{
		access = "w",
		parameterId = "16832526"
	},
	{
		converter = var_0_0[100],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "integer[5;14400]",
		parameters = var_0_6[11],
		converter = var_0_0[101],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(off;on)",
		parameters = var_0_6[11],
		converter = var_0_0[102],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[117],
		converter = var_0_0[102],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[118],
		converter = var_0_0[102],
		extraDefinition = var_0_6[18]
	},
	{
		linkedHighLevelState = {
			var_0_4[49]
		}
	},
	{
		["2146500638"] = var_0_6[1],
		["1"] = var_0_6[3],
		["65537"] = var_0_6[134],
		["2147426304"] = var_0_6[4],
		["84059651"] = {
			linkedHighLevelState = {
				var_0_4[48],
				var_0_4[50]
			}
		},
		["2"] = var_0_6[56],
		["2146500645"] = var_0_6[57],
		["84059655"] = var_0_6[191]
	},
	{
		rawStateId = "84059651"
	},
	{
		var_0_6[193]
	},
	{
		access = "w",
		parameterId = "5"
	},
	{
		prototype = "integer[0;65535]",
		parameters = var_0_6[11],
		rawStates = var_0_6[194],
		converter = var_0_0[106],
		extraDefinition = var_0_6[195]
	},
	{
		prototype = "string(onOffLight;onOffSwitch)",
		parameters = var_0_6[11],
		rawStates = var_0_6[194],
		converter = var_0_0[107],
		extraDefinition = var_0_6[195]
	},
	{
		advancedRefresh = var_0_6[10],
		delayedStopIdentify = var_0_6[13],
		getName = var_0_6[14],
		identify = var_0_6[15],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		runManufacturerSettingsCommand = var_0_6[62],
		onWithInternalTimer = var_0_6[186],
		onWithTimer = var_0_6[187],
		pairOneWayController = var_0_6[17],
		setInternalTimer = var_0_6[196],
		setName = var_0_6[20],
		setOnOff = var_0_6[188],
		off = var_0_6[189],
		on = var_0_6[190],
		setPictoValue = var_0_6[197],
		startIdentify = var_0_6[21],
		stopIdentify = var_0_6[22],
		unpairAllOneWayControllers = var_0_6[23],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		unpairOneWayController = var_0_6[24],
		setConfigState = var_0_6[25],
		wink = var_0_6[26],
		sendIOKey = var_0_6[65]
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
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[20],
				var_0_4[51],
				var_0_4[10]
			},
			linkedStateIds = var_0_6[29]
		},
		["2146500638"] = var_0_6[1],
		["16832512"] = var_0_6[31],
		["1"] = var_0_6[3],
		["16832522"] = var_0_6[33],
		["2147426304"] = var_0_6[4],
		["16830720"] = var_0_6[35],
		["65557"] = var_0_6[36],
		["2"] = var_0_6[56],
		["2146500645"] = var_0_6[57]
	},
	{
		prototype = "integer[0;100]",
		parameters = var_0_6[11],
		aliasConverter = var_0_0[109],
		converter = var_0_0[24],
		extraDefinition = var_0_6[18]
	},
	{
		advancedRefresh = var_0_6[10],
		delayedStopIdentify = var_0_6[13],
		getName = var_0_6[14],
		identify = var_0_6[15],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		runManufacturerSettingsCommand = var_0_6[62],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		setDeployment = var_0_6[38],
		close = var_0_6[42],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[40],
		setClosure = var_0_6[201],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		setMemorized1Position = var_0_6[47],
		setName = var_0_6[20],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setSecuredPosition = var_0_6[53],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		stopIdentify = var_0_6[22],
		unpairAllOneWayControllers = var_0_6[23],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		unpairOneWayController = var_0_6[24],
		setConfigState = var_0_6[25],
		wink = var_0_6[26],
		sendIOKey = var_0_6[65]
	},
	{
		["io:HorizontalAwningIOComponent"] = {
			type = 1,
			widget = "PositionableHorizontalAwning",
			uiClass = "Awning",
			uiProfiles = var_0_6[199],
			states = var_0_6[200],
			attributes = var_0_6[59],
			commands = var_0_6[202]
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
			uiProfiles = var_0_6[204],
			states = var_0_6[200],
			attributes = var_0_6[59],
			commands = var_0_6[202]
		}
	},
	{
		isParameterRequired = false,
		name = "p1"
	},
	{
		var_0_6[206]
	},
	{
		prototype = "*integer[25;3200]",
		parameters = var_0_6[207],
		converter = var_0_0[110],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "*integer[25;3175]",
		parameters = var_0_6[207],
		converter = var_0_0[111],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(lower;upper)",
		parameters = var_0_6[11],
		converter = var_0_0[112],
		extraDefinition = {
			access = "w",
			parameterId = "2146500644"
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[52]
		}
	},
	{
		["65537"] = var_0_6[55],
		["2146500638"] = var_0_6[1],
		["16832512"] = var_0_6[31],
		["17029120"] = var_0_6[211],
		["1"] = var_0_6[3],
		["16832522"] = var_0_6[33],
		["65540"] = var_0_6[73],
		["2147426304"] = var_0_6[4],
		["16830720"] = var_0_6[35],
		["65557"] = var_0_6[36],
		["2"] = var_0_6[56],
		["2146500645"] = var_0_6[57]
	},
	{
		prototype = "string(my;memorized1;secured)|integer[0;100],string(my;memorized1)|integer[0;100]",
		parameters = var_0_6[44],
		converter = var_0_0[113],
		extraDefinition = var_0_6[45]
	},
	{
		parameters = {
			var_0_6[49],
			{
				value = "my",
				name = "p2"
			}
		},
		converter = var_0_0[113],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(my;memorized1)|integer[0;100]",
		parameters = var_0_6[11],
		converter = var_0_0[114],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "integer[0;100]",
		parameters = var_0_6[11],
		converter = var_0_0[24],
		extraDefinition = {
			access = "w",
			parameterId = "17029120"
		}
	},
	{
		advancedRefresh = var_0_6[10],
		delayedStopIdentify = var_0_6[13],
		getName = var_0_6[14],
		identify = var_0_6[15],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		runManufacturerSettingsCommand = var_0_6[62],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		up = var_0_6[42],
		setClosureAndOrientation = var_0_6[213],
		my = var_0_6[214],
		setMemorized1Position = var_0_6[47],
		setName = var_0_6[20],
		setOrientation = var_0_6[215],
		setMemorized1Orientation = var_0_6[216],
		setPosition = var_0_6[48],
		setSecuredPosition = var_0_6[53],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		stopIdentify = var_0_6[22],
		unpairAllOneWayControllers = var_0_6[23],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		unpairOneWayController = var_0_6[24],
		setConfigState = var_0_6[25],
		wink = var_0_6[26],
		sendIOKey = var_0_6[65]
	},
	{
		["io:ExteriorVenetianBlindIOComponent"] = {
			type = 1,
			widget = "PositionableExteriorVenetianBlind",
			uiClass = "ExteriorVenetianBlind",
			uiProfiles = var_0_6[28],
			states = var_0_6[212],
			attributes = var_0_6[59],
			commands = var_0_6[217]
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
		uiProfiles = var_0_6[219],
		states = {
			["65537"] = {
				linkedHighLevelState = {
					var_0_4[53]
				}
			},
			["2146500638"] = var_0_6[1],
			["16832512"] = var_0_6[69],
			["1"] = var_0_6[3],
			["16832522"] = var_0_6[70],
			["2147426304"] = var_0_6[4]
		},
		attributes = var_0_6[5],
		commands = {
			advancedRefresh = var_0_6[10],
			delayedStopIdentify = var_0_6[13],
			getName = var_0_6[14],
			identify = var_0_6[15],
			pairOneWayController = var_0_6[17],
			setAirInput = var_0_6[38],
			off = var_0_6[42],
			on = var_0_6[40],
			setName = var_0_6[20],
			startIdentify = var_0_6[21],
			stopIdentify = var_0_6[22],
			unpairAllOneWayControllers = var_0_6[23],
			unpairOneWayController = var_0_6[24],
			setConfigState = var_0_6[25],
			wink = var_0_6[26]
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
		parameters = var_0_6[11],
		converter = var_0_0[115],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[39],
		converter = var_0_0[115],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[41],
		converter = var_0_0[115],
		extraDefinition = var_0_6[18]
	},
	{
		{
			value = "memorized1",
			name = "p1"
		}
	},
	{
		parameters = var_0_6[225],
		converter = var_0_0[115],
		extraDefinition = var_0_6[18]
	},
	{
		type = 1,
		widget = "DimmerExteriorHeating",
		uiClass = "ExteriorHeatingSystem",
		uiProfiles = var_0_6[221],
		states = {
			["2146500638"] = var_0_6[1],
			["65537"] = var_0_6[2],
			["1"] = var_0_6[3],
			["16832512"] = var_0_6[69],
			["2147426304"] = var_0_6[4],
			["2"] = var_0_6[56],
			["2146500645"] = var_0_6[57]
		},
		attributes = var_0_6[59],
		commands = {
			advancedRefresh = var_0_6[10],
			delayedStopIdentify = var_0_6[13],
			getLevel = var_0_6[158],
			getName = var_0_6[14],
			identify = var_0_6[15],
			keepOneWayControllersAndDeleteNode = var_0_6[61],
			runManufacturerSettingsCommand = var_0_6[62],
			pairOneWayController = var_0_6[17],
			setLevel = var_0_6[222],
			off = var_0_6[223],
			on = var_0_6[224],
			my = var_0_6[226],
			setName = var_0_6[20],
			startIdentify = var_0_6[21],
			stopIdentify = var_0_6[22],
			unpairAllOneWayControllers = var_0_6[23],
			unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
			unpairOneWayController = var_0_6[24],
			setConfigState = var_0_6[25],
			wink = var_0_6[26],
			sendIOKey = var_0_6[65],
			setMemorized1Position = var_0_6[47]
		}
	},
	{
		"StatefulSwitchableHeating",
		"StatefulSwitchable",
		"Switchable"
	},
	{
		converter = var_0_0[117],
		extraDefinition = var_0_6[18]
	},
	{
		converter = var_0_0[118],
		extraDefinition = var_0_6[18]
	},
	{
		["io:DiscreteExteriorHeatingIOComponent"] = {
			type = 1,
			widget = "DiscreteExteriorHeating",
			uiClass = "ExteriorHeatingSystem",
			uiProfiles = var_0_6[228],
			states = {
				["2146500638"] = var_0_6[1],
				["1"] = var_0_6[3],
				["65537"] = {
					linkedHighLevelState = {
						var_0_4[57]
					}
				},
				["2147426304"] = var_0_6[4],
				["2"] = var_0_6[56],
				["2146500645"] = var_0_6[57]
			},
			attributes = var_0_6[59],
			commands = {
				advancedRefresh = var_0_6[10],
				delayedStopIdentify = var_0_6[13],
				getName = var_0_6[14],
				identify = var_0_6[15],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				runManufacturerSettingsCommand = var_0_6[62],
				off = var_0_6[229],
				on = var_0_6[230],
				pairOneWayController = var_0_6[17],
				setName = var_0_6[20],
				startIdentify = var_0_6[21],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				wink = var_0_6[26],
				sendIOKey = var_0_6[65]
			}
		}
	},
	{
		access = "r",
		parameterId = "65553"
	},
	{
		extraDefinition = var_0_6[232]
	},
	{
		access = "w",
		parameterId = "16832530"
	},
	{
		converter = var_0_0[128],
		extraDefinition = var_0_6[18]
	},
	{
		converter = var_0_0[129],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[39],
		converter = var_0_0[12],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[41],
		converter = var_0_0[12],
		extraDefinition = var_0_6[18]
	},
	{
		prototype = "integer[0;100],*string(lowspeed)",
		parameters = var_0_6[8],
		converter = var_0_0[130],
		extraDefinition = var_0_6[45]
	},
	{
		parameters = var_0_6[50],
		converter = var_0_0[131],
		extraDefinition = var_0_6[18]
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
			var_0_4[69]
		}
	},
	{
		"65537"
	},
	{
		linkedHighLevelState = {
			var_0_4[70]
		},
		linkedStateIds = var_0_6[243]
	},
	{
		rawStates = var_0_6[194],
		converter = var_0_0[143],
		extraDefinition = var_0_6[195]
	},
	{
		rawStates = var_0_6[194],
		converter = var_0_0[144],
		extraDefinition = var_0_6[195]
	},
	{
		rawStates = var_0_6[130],
		converter = var_0_0[145],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(my;securedVentilation)|integer[0;100]",
		parameters = var_0_6[11],
		converter = var_0_0[131],
		extraDefinition = var_0_6[18]
	},
	{
		prototype = "string(my;securedVentilation)|integer[0;100],*string(lowspeed)",
		parameters = var_0_6[8],
		converter = var_0_0[132],
		extraDefinition = var_0_6[45]
	},
	{
		rawStates = var_0_6[130],
		converter = var_0_0[146],
		extraDefinition = var_0_6[45]
	},
	{
		["io:PositionableAndLockableSlidingWindowComponent"] = {
			type = 1,
			widget = "PositionableAndLockableSlidingWindow",
			uiClass = "Window",
			uiProfiles = var_0_6[241],
			states = {
				["65537"] = {
					linkedHighLevelState = {
						var_0_4[5],
						var_0_4[70]
					},
					linkedStateIds = {
						"65801"
					}
				},
				["2146500638"] = var_0_6[1],
				["65546"] = var_0_6[242],
				["1"] = var_0_6[3],
				["65801"] = var_0_6[244],
				["84059651"] = {
					linkedHighLevelState = {
						var_0_4[71],
						var_0_4[72],
						var_0_4[73],
						var_0_4[74],
						var_0_4[75]
					}
				},
				["2147426304"] = var_0_6[4],
				["2"] = var_0_6[56],
				["16832512"] = var_0_6[69],
				["2146500645"] = var_0_6[57]
			},
			attributes = var_0_6[59],
			commands = {
				advancedRefresh = var_0_6[10],
				activateTimer = var_0_6[245],
				deactivateTimer = var_0_6[246],
				delayedStopIdentify = var_0_6[13],
				getName = var_0_6[14],
				identify = var_0_6[15],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				runManufacturerSettingsCommand = var_0_6[62],
				lock = var_0_6[247],
				pairOneWayController = var_0_6[17],
				setClosure = var_0_6[19],
				close = var_0_6[237],
				open = var_0_6[238],
				setClosureAndLinearSpeed = var_0_6[239],
				setName = var_0_6[20],
				setPosition = var_0_6[248],
				my = var_0_6[240],
				setPositionAndLinearSpeed = var_0_6[249],
				setTimer = var_0_6[196],
				setMemorized1Position = var_0_6[47],
				refreshMemorized1Position = var_0_6[37],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				stopIdentify = var_0_6[22],
				unlock = var_0_6[250],
				unpairAllOneWayControllers = var_0_6[23],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				wink = var_0_6[26],
				sendIOKey = var_0_6[65]
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
			var_0_4[76]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[77]
		}
	},
	{
		["2146500638"] = var_0_6[1],
		["16832512"] = var_0_6[253],
		["1"] = var_0_6[3],
		["16832522"] = var_0_6[254],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[78],
				var_0_4[79],
				var_0_4[80]
			}
		},
		["2147426304"] = var_0_6[4],
		["2"] = var_0_6[56],
		["2146500645"] = var_0_6[57]
	},
	{
		prototype = "integer[0;100]|string(memorized1;secured)",
		parameters = var_0_6[11],
		converter = var_0_0[147],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[225],
		converter = var_0_0[147],
		extraDefinition = var_0_6[18]
	},
	{
		["io:BioclimaticPergolaIOComponent"] = {
			type = 1,
			widget = "BioclimaticPergola",
			uiClass = "Pergola",
			uiProfiles = var_0_6[252],
			states = var_0_6[255],
			attributes = var_0_6[59],
			commands = {
				advancedRefresh = var_0_6[10],
				closeSlats = var_0_6[98],
				delayedStopIdentify = var_0_6[13],
				getName = var_0_6[14],
				identify = var_0_6[15],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				runManufacturerSettingsCommand = var_0_6[62],
				openSlats = var_0_6[99],
				pairOneWayController = var_0_6[17],
				refreshMemorized1Orientation = var_0_6[37],
				setMemorized1Orientation = var_0_6[47],
				setName = var_0_6[20],
				setOrientation = var_0_6[256],
				my = var_0_6[257],
				setSecuredOrientation = var_0_6[53],
				setSlatsOrientationWithSpeed = {
					prototype = "integer[0;100]|string(memorized1;secured),integer[0;100]",
					parameters = var_0_6[44],
					converter = var_0_0[148],
					extraDefinition = var_0_6[45]
				},
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				wink = var_0_6[26],
				sendIOKey = var_0_6[65]
			}
		}
	},
	{
		"StatefulSiren",
		"Siren"
	},
	{
		linkedHighLevelState = {
			var_0_4[81]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[82]
		}
	},
	{
		converter = var_0_0[151],
		extraDefinition = var_0_6[18]
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
			var_0_4[85]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[86],
			var_0_4[99]
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
		var_0_4[86],
		var_0_4[89],
		var_0_4[90],
		var_0_4[91],
		var_0_4[44],
		var_0_4[99],
		var_0_4[46]
	},
	{
		linkedHighLevelState = var_0_6[280],
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
		linkedHighLevelState = var_0_6[280],
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
			var_0_4[87]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[88]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[89],
			var_0_4[99]
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
			var_0_4[90],
			var_0_4[99]
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
			var_0_4[91],
			var_0_4[99]
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
			var_0_4[92]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[93],
			var_0_4[95]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[94],
			var_0_4[96]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[97]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[98]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[44],
			var_0_4[99]
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
			var_0_4[99]
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
			var_0_4[100]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[101]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[102]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[103]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[104]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[105]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[106]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[107],
			var_0_4[110]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[108]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[109]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[111]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[112]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[113]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[114]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[115]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[116]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[117]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[118]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[119]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[120]
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
		converter = var_0_0[188],
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
		parameters = var_0_6[11],
		converter = var_0_0[189],
		extraDefinition = {
			access = "w",
			parameterId = "201329665"
		}
	},
	{
		prototype = "integer[0;99]|string(always)",
		parameters = var_0_6[11],
		converter = var_0_0[190],
		extraDefinition = {
			access = "w",
			parameterId = "201327873"
		}
	},
	{
		prototype = "string(boilerOptimising;boilerPriority;heatPumpOptimising;heatPumpPriority)",
		parameters = var_0_6[11],
		converter = var_0_0[191],
		extraDefinition = {
			access = "w",
			parameterId = "201330945"
		}
	},
	{
		prototype = "integer[1;7]",
		parameters = var_0_6[11],
		converter = var_0_0[189],
		extraDefinition = {
			access = "w",
			parameterId = "201326593"
		}
	},
	{
		prototype = "object",
		parameters = var_0_6[11],
		converter = var_0_0[192],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(autoMode;manualEcoActive;manualEcoInactive)",
		parameters = var_0_6[11],
		converter = var_0_0[193],
		extraDefinition = {
			access = "w",
			parameterId = "201328129"
		}
	},
	{
		prototype = "object",
		parameters = var_0_6[11],
		converter = var_0_0[194],
		extraDefinition = {
			access = "w",
			parameterId = "201330433"
		}
	},
	{
		prototype = "float[0.0;100.0]",
		parameters = var_0_6[11],
		rawStates = var_0_6[182],
		converter = var_0_0[95],
		extraDefinition = var_0_6[234]
	},
	{
		prototype = "string(auto;deactive)",
		parameters = var_0_6[11],
		converter = var_0_0[195],
		extraDefinition = {
			access = "w",
			parameterId = "201330177"
		}
	},
	{
		prototype = "string(fastExtractionSpeed;lowExtractionSpeed;noExtraction)",
		parameters = var_0_6[11],
		converter = var_0_0[196],
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
		parameters = var_0_6[11],
		rawStates = var_0_6[182],
		converter = var_0_0[95],
		extraDefinition = var_0_6[344]
	},
	{
		access = "w",
		parameterId = "16832531"
	},
	{
		prototype = "float[0.0;100.0]",
		parameters = var_0_6[11],
		rawStates = var_0_6[182],
		converter = var_0_0[95],
		extraDefinition = var_0_6[346]
	},
	{
		prototype = "string(extraBoiler;extraSolar;onlyThermodynamic)",
		parameters = var_0_6[11],
		converter = var_0_0[197],
		extraDefinition = {
			access = "w",
			parameterId = "201330689"
		}
	},
	{
		prototype = "string(pac24h_elec24h;pacProg_elecProg)",
		parameters = var_0_6[11],
		converter = var_0_0[198],
		extraDefinition = {
			access = "w",
			parameterId = "201329153"
		}
	},
	{
		prototype = "object",
		parameters = var_0_6[11],
		converter = var_0_0[199],
		extraDefinition = {
			access = "w",
			parameterId = "201329409"
		}
	},
	{
		prototype = "string(forbidden;no;recommended;unsuitable;wanted)",
		parameters = var_0_6[11],
		converter = var_0_0[200],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(active;deactive)",
		parameters = var_0_6[11],
		converter = var_0_0[201],
		extraDefinition = {
			access = "w",
			parameterId = "201331201"
		}
	},
	{
		prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
		parameters = var_0_6[11],
		rawStates = var_0_6[182],
		converter = var_0_0[202],
		extraDefinition = var_0_6[18]
	},
	{
		advancedRefresh = var_0_6[10],
		delayedStopIdentify = var_0_6[13],
		getName = var_0_6[14],
		identify = var_0_6[15],
		pairOneWayController = var_0_6[17],
		refreshAntiLegionellosis = var_0_6[315],
		refreshAwayModeDuration = var_0_6[316],
		refreshBoilerInstallationOption = var_0_6[317],
		refreshBoostModeDuration = var_0_6[318],
		refreshCurrentOperatingMode = var_0_6[233],
		refreshDHWCapacity = var_0_6[319],
		refreshDHWError = var_0_6[320],
		refreshDHWMode = var_0_6[321],
		refreshElectricalExtraManagement = var_0_6[322],
		refreshExtractionOption = var_0_6[323],
		refreshInstallation = var_0_6[324],
		refreshManufacturerName = var_0_6[325],
		refreshMiddleWaterTemperature = var_0_6[326],
		refreshOperatingModeCapabilities = var_0_6[327],
		refreshOperatingRange = var_0_6[328],
		refreshOperatingTime = var_0_6[329],
		refreshProgrammingSlots = var_0_6[330],
		refreshRateManagement = var_0_6[331],
		refreshSmartGridOption = var_0_6[332],
		refreshTargetTemperature = var_0_6[158],
		refreshWaterConsumption = var_0_6[333],
		setAntiLegionellosis = var_0_6[334],
		setAwayModeDuration = var_0_6[335],
		setBoilerInstallationOption = var_0_6[336],
		setBoostModeDuration = var_0_6[337],
		setComfortTargetTemperature = var_0_6[184],
		setCurrentOperatingMode = var_0_6[338],
		setDHWMode = var_0_6[339],
		setDateTime = var_0_6[340],
		setEcoTargetTemperature = var_0_6[341],
		setElectricalExtraManagement = var_0_6[342],
		setExtractionOption = var_0_6[343],
		setFrostProtectionTargetTemperature = var_0_6[345],
		setHaltedTargetTemperature = var_0_6[347],
		setInstallation = var_0_6[348],
		setName = var_0_6[20],
		setOperatingRange = var_0_6[349],
		setProgrammingSlots = var_0_6[350],
		setRateManagement = var_0_6[351],
		setSmartGridOption = var_0_6[352],
		setTargetTemperature = var_0_6[353],
		startIdentify = var_0_6[21],
		stopIdentify = var_0_6[22],
		unpairAllOneWayControllers = var_0_6[23],
		unpairOneWayController = var_0_6[24],
		wink = var_0_6[26]
	},
	{
		type = 1,
		widget = "DomesticHotWaterProduction",
		uiClass = "WaterHeatingSystem",
		uiProfiles = var_0_6[277],
		states = {
			["201326593"] = var_0_6[278],
			["16832527"] = var_0_6[279],
			["65558"] = var_0_6[281],
			["65559"] = var_0_6[282],
			["201342977"] = var_0_6[283],
			["201330433"] = var_0_6[284],
			["2146500638"] = var_0_6[1],
			["16832530"] = var_0_6[285],
			["16832534"] = var_0_6[286],
			["16832531"] = var_0_6[287],
			["201328385"] = var_0_6[288],
			["201343489"] = var_0_6[289],
			["201343233"] = var_0_6[290],
			["1"] = var_0_6[3],
			["201341185"] = var_0_6[291],
			["65553"] = var_0_6[292],
			["16832522"] = var_0_6[293],
			["2147426304"] = var_0_6[4],
			["16830720"] = var_0_6[294],
			["65537"] = var_0_6[179],
			["201326849"] = var_0_6[295],
			["201329665"] = var_0_6[296],
			["201327873"] = var_0_6[297],
			["201330945"] = var_0_6[298],
			["201328641"] = var_0_6[299],
			["201327105"] = var_0_6[300],
			["201328129"] = var_0_6[301],
			["201327361"] = var_0_6[302],
			["201330177"] = var_0_6[303],
			["201331457"] = var_0_6[304],
			["201330689"] = var_0_6[305],
			["201332481"] = var_0_6[306],
			["65552"] = var_0_6[307],
			["201329153"] = var_0_6[308],
			["201337601"] = var_0_6[309],
			["201339649"] = var_0_6[310],
			["201339905"] = var_0_6[311],
			["201329409"] = var_0_6[312],
			["65547"] = var_0_6[313],
			["201331201"] = var_0_6[314]
		},
		attributes = var_0_6[5],
		commands = var_0_6[354]
	},
	{
		"ElectricEnergyConsumption"
	},
	{
		["core:FirmwareRevision"] = var_0_5[0],
		["core:Manufacturer"] = var_0_5[1],
		["core:PowerSourceType"] = var_0_5[3],
		["core:MeasuredValueType"] = var_0_5[4]
	},
	{
		["io:DHWCumulatedElectricalEnergyConsumptionIOSystemDeviceSensor"] = {
			type = 2,
			widget = "CumulativeElectricPowerConsumptionSensor",
			uiClass = "ElectricitySensor",
			uiProfiles = var_0_6[356],
			states = {
				["201327617"] = {
					linkedHighLevelState = {
						var_0_4[121]
					}
				},
				["2147426304"] = var_0_6[4]
			},
			attributes = var_0_6[357],
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
			var_0_4[122],
			var_0_4[124],
			var_0_4[125]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[123]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[126]
		}
	},
	{
		prototype = "*string",
		parameters = var_0_6[207],
		converter = var_0_0[207],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(boost;comfort;comfort-1;comfort-2;eco;frostprotection;off;secured)",
		parameters = var_0_6[11],
		converter = var_0_0[208],
		extraDefinition = var_0_6[45]
	},
	{
		parameters = var_0_6[117],
		converter = var_0_0[208],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(boost;comfort;comfort-1;comfort-2;eco;frostprotection;off;secured),integer[1;65534]",
		parameters = var_0_6[44],
		converter = var_0_0[209],
		extraDefinition = var_0_6[45]
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
		["core:FirmwareRevision"] = var_0_5[0],
		["core:Manufacturer"] = var_0_5[1],
		["core:MeasuredValueType"] = var_0_5[5],
		["core:PowerSourceType"] = var_0_5[3]
	},
	{
		"Luminance"
	},
	{
		linkedHighLevelState = {
			var_0_4[148]
		}
	},
	{
		prototype = "string(normal;advanced)",
		parameters = var_0_6[11],
		extraDefinition = {
			access = "r",
			parameterId = "2415919106"
		}
	},
	{
		advancedRefresh = var_0_6[374]
	},
	{
		["io:LightIOSystemSensor"] = {
			type = 2,
			widget = "LuminanceSensor",
			uiClass = "LightSensor",
			uiProfiles = var_0_6[372],
			states = {
				["2146500638"] = var_0_6[1],
				["2415919106"] = {
					linkedHighLevelState = {
						var_0_4[147]
					}
				},
				["2415919110"] = var_0_6[373],
				["2147426304"] = var_0_6[4]
			},
			attributes = {
				["core:FirmwareRevision"] = var_0_5[0],
				["core:Manufacturer"] = var_0_5[1],
				["core:MaxSensedValue"] = var_0_5[6],
				["core:MeasuredValueType"] = var_0_5[7],
				["core:MinSensedValue"] = var_0_5[8],
				["core:PowerSourceType"] = var_0_5[9]
			},
			commands = var_0_6[375]
		}
	},
	{
		["core:FirmwareRevision"] = var_0_5[0],
		["core:Manufacturer"] = var_0_5[1],
		["core:MaxSensedValue"] = var_0_5[6],
		["core:MeasuredValueType"] = var_0_5[10],
		["core:MinSensedValue"] = var_0_5[8],
		["core:PowerSourceType"] = var_0_5[9]
	},
	{
		["io:TemperatureIOSystemSensor"] = {
			type = 2,
			widget = "TemperatureSensor",
			uiClass = "TemperatureSensor",
			uiProfiles = var_0_6[370],
			states = {
				["2146500638"] = var_0_6[1],
				["2415919110"] = var_0_6[373],
				["2147426304"] = var_0_6[4],
				["2415919106"] = {
					linkedHighLevelState = {
						var_0_4[149]
					}
				}
			},
			attributes = var_0_6[377],
			commands = var_0_6[375]
		}
	},
	{
		"RelativeHumidity"
	},
	{
		["core:FirmwareRevision"] = var_0_5[0],
		["core:Manufacturer"] = var_0_5[1],
		["core:PowerSourceType"] = var_0_5[9],
		["core:MeasuredValueType"] = var_0_5[13]
	},
	{
		["io:RelativeHumidityIOSystemSensor"] = {
			type = 2,
			widget = "RelativeHumiditySensor",
			uiClass = "HumiditySensor",
			uiProfiles = var_0_6[379],
			states = {
				["2146500638"] = var_0_6[1],
				["2415919106"] = {
					linkedHighLevelState = {
						var_0_4[152]
					}
				},
				["2415919110"] = var_0_6[373],
				["2147426304"] = var_0_6[4]
			},
			attributes = var_0_6[380],
			commands = var_0_6[375]
		}
	},
	{
		["core:FirmwareRevision"] = var_0_5[0],
		["core:Manufacturer"] = var_0_5[1],
		["core:PowerSourceType"] = var_0_5[9],
		["core:MeasuredValueType"] = var_0_5[14]
	},
	{
		"GasConsumption"
	},
	{
		linkedHighLevelState = {
			var_0_4[156]
		}
	},
	{
		["2146500638"] = var_0_6[1],
		["83935248"] = {
			linkedHighLevelState = {
				var_0_4[155]
			}
		},
		["2415919105"] = var_0_6[384],
		["2415919110"] = var_0_6[373],
		["2147426304"] = var_0_6[4]
	},
	{
		extraDefinition = {
			access = "r",
			parameterId = "2415919105"
		}
	},
	{
		prototype = "string",
		parameters = var_0_6[11],
		converter = var_0_0[13],
		extraDefinition = {
			access = "w",
			parameterId = "2415919105"
		}
	},
	{
		advancedRefresh = var_0_6[374],
		getSensorName = var_0_6[386],
		putSensorName = var_0_6[387]
	},
	{
		var_0_4[161],
		var_0_4[162],
		var_0_4[163],
		var_0_4[164],
		var_0_4[165],
		var_0_4[166],
		var_0_4[167]
	},
	{
		"83902467"
	},
	{
		"83902466"
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		converter = var_0_0[249],
		extraDefinition = var_0_6[368]
	},
	{
		advancedRefresh = var_0_6[392],
		getSensorName = var_0_6[386],
		putSensorName = var_0_6[387]
	},
	{
		var_0_4[168],
		var_0_4[169],
		var_0_4[170],
		var_0_4[171],
		var_0_4[172],
		var_0_4[173],
		var_0_4[174]
	},
	{
		var_0_4[175],
		var_0_4[176],
		var_0_4[177],
		var_0_4[178],
		var_0_4[179],
		var_0_4[180],
		var_0_4[181]
	},
	{
		var_0_4[182],
		var_0_4[183],
		var_0_4[184],
		var_0_4[185],
		var_0_4[186],
		var_0_4[187],
		var_0_4[188]
	},
	{
		var_0_4[189],
		var_0_4[190],
		var_0_4[191],
		var_0_4[192],
		var_0_4[193],
		var_0_4[194],
		var_0_4[195]
	},
	{
		"SmokeDetector"
	},
	{
		linkedHighLevelState = {
			var_0_4[205]
		}
	},
	{
		["core:FirmwareRevision"] = var_0_5[0],
		["core:Manufacturer"] = var_0_5[1],
		["core:MeasuredValueType"] = var_0_5[7],
		["core:PowerSourceType"] = var_0_5[9]
	},
	{
		"DoorContactSensor",
		"ContactDetector"
	},
	{
		linkedHighLevelState = {
			var_0_4[209]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[210]
		}
	},
	{
		type = 2,
		widget = "ContactSensor",
		uiClass = "ContactSensor",
		uiProfiles = var_0_6[401],
		states = {
			["2415919106"] = var_0_6[402],
			["2146500638"] = var_0_6[1],
			["2415919110"] = var_0_6[403],
			["2147426304"] = var_0_6[4]
		},
		attributes = var_0_6[400],
		commands = var_0_6[375]
	},
	{
		"OccupancyDetector"
	},
	{
		linkedHighLevelState = {
			var_0_4[211]
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
			["2146500638"] = var_0_6[1],
			["2415919106"] = {
				linkedHighLevelState = {
					var_0_4[212]
				}
			},
			["2415919110"] = var_0_6[373],
			["2147426304"] = var_0_6[4]
		},
		attributes = {
			["core:FirmwareRevision"] = var_0_5[0],
			["core:Manufacturer"] = var_0_5[1],
			["core:MeasuredValueType"] = var_0_5[7]
		},
		commands = var_0_6[375]
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
			var_0_4[0],
			var_0_4[216]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[213],
			var_0_4[214],
			var_0_4[215]
		}
	},
	{
		["core:FirmwareRevision"] = var_0_5[0],
		["core:Manufacturer"] = var_0_5[1],
		["core:MaxSensedValue"] = var_0_5[28],
		["core:MeasuredValueType"] = var_0_5[29],
		["core:MinSensedValue"] = var_0_5[30]
	},
	{
		advancedRefresh = {
			prototype = "string(normal;advanced)",
			parameters = var_0_6[11],
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
			var_0_4[217]
		}
	},
	{
		["core:FirmwareRevision"] = var_0_5[0],
		["core:Manufacturer"] = var_0_5[1],
		["core:MaxSensedValue"] = var_0_5[31],
		["core:MeasuredValueType"] = var_0_5[32],
		["core:MinSensedValue"] = var_0_5[33],
		["core:PowerSourceType"] = var_0_5[9]
	},
	{
		prototype = "string(normal;advanced)",
		parameters = var_0_6[11],
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
			uiProfiles = var_0_6[413],
			states = {
				["2146500638"] = var_0_6[409],
				["2415919110"] = var_0_6[403],
				["2147426304"] = var_0_6[4],
				["18152947712002"] = var_0_6[414],
				["83903234"] = {
					linkedHighLevelState = {
						var_0_4[218]
					}
				}
			},
			attributes = var_0_6[415],
			commands = {
				setVibrationLevelThreshold = {
					prototype = "integer[1;9]",
					parameters = var_0_6[11],
					rawStates = {
						{
							rawStateId = "83903234"
						}
					},
					converter = var_0_0[306],
					extraDefinition = var_0_6[195]
				},
				advancedRefresh = var_0_6[416]
			}
		}
	},
	{
		access = "w",
		parameterId = "2146566149"
	},
	{
		["core:GroupId"] = var_0_5[35],
		["core:GroupIndex"] = var_0_5[36]
	},
	{
		type = 4,
		widget = "RemoteControllerOneWay",
		uiClass = "RemoteController",
		uiProfiles = var_0_6[367],
		states = {
			["33554442"] = {
				linkedHighLevelState = {
					var_0_4[220]
				}
			}
		},
		attributes = var_0_6[419]
	},
	{
		prototype = "integer[0;100],*string(lowspeed)",
		parameters = var_0_6[8],
		converter = var_0_0[318],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(my)|integer[0;100],*string(lowspeed)",
		parameters = var_0_6[8],
		converter = var_0_0[319],
		extraDefinition = var_0_6[45]
	},
	{
		advancedRefresh = var_0_6[10],
		delayedStopIdentify = var_0_6[13],
		getName = var_0_6[14],
		identify = var_0_6[15],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		runManufacturerSettingsCommand = var_0_6[62],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		up = var_0_6[42],
		setClosureAndLinearSpeed = var_0_6[421],
		setMemorized1Position = var_0_6[47],
		setName = var_0_6[20],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setPositionAndLinearSpeed = var_0_6[422],
		setSecuredPosition = var_0_6[53],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		stopIdentify = var_0_6[22],
		unpairAllOneWayControllers = var_0_6[23],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		unpairOneWayController = var_0_6[24],
		setConfigState = var_0_6[25],
		wink = var_0_6[26],
		sendIOKey = var_0_6[65]
	},
	{
		["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutterWithLowSpeedManagement",
			uiClass = "RollerShutter",
			uiProfiles = var_0_6[54],
			states = var_0_6[58],
			attributes = var_0_6[59],
			commands = var_0_6[423]
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
		parameters = var_0_6[11],
		converter = var_0_0[321],
		extraDefinition = var_0_6[18]
	},
	{
		"CloseableWindow",
		"Closeable",
		"OpenClose"
	},
	{
		var_0_4[223]
	},
	{
		linkedHighLevelState = var_0_6[428],
		linkedStateIds = {
			"120833",
			"120834",
			"120835",
			"120842",
			"65537"
		}
	},
	{
		linkedHighLevelState = var_0_6[428],
		linkedStateIds = {
			"120833",
			"120834",
			"120835",
			"16830720",
			"65537"
		}
	},
	{
		linkedHighLevelState = var_0_6[428],
		linkedStateIds = {
			"120834",
			"120835",
			"120842",
			"16830720",
			"65537"
		}
	},
	{
		linkedHighLevelState = var_0_6[428],
		linkedStateIds = {
			"120833",
			"120835",
			"120842",
			"16830720",
			"65537"
		}
	},
	{
		linkedHighLevelState = var_0_6[428],
		linkedStateIds = {
			"120833",
			"120834",
			"120842",
			"16830720",
			"65537"
		}
	},
	{
		var_0_4[224]
	},
	{
		linkedHighLevelState = var_0_6[434],
		linkedStateIds = var_0_6[243]
	},
	{
		converter = var_0_0[324],
		extraDefinition = var_0_6[18]
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
			uiProfiles = var_0_6[97],
			states = {
				["2146500638"] = var_0_6[1],
				["1"] = var_0_6[3],
				["65537"] = {
					linkedHighLevelState = var_0_6[434],
					linkedStateIds = {
						"16832521"
					}
				},
				["16832521"] = var_0_6[435],
				["2147426304"] = var_0_6[4],
				["2"] = var_0_6[56],
				["2146500645"] = var_0_6[57]
			},
			attributes = var_0_6[59],
			commands = {
				advancedRefresh = var_0_6[10],
				close = var_0_6[98],
				delayedStopIdentify = var_0_6[13],
				down = var_0_6[98],
				getName = var_0_6[14],
				identify = var_0_6[15],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				runManufacturerSettingsCommand = var_0_6[62],
				open = var_0_6[99],
				pairOneWayController = var_0_6[17],
				partialPosition = var_0_6[436],
				refreshPartialPosition = var_0_6[437],
				setName = var_0_6[20],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				up = var_0_6[99],
				wink = var_0_6[26],
				sendIOKey = var_0_6[65]
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
		converter = var_0_0[327],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = {
			{
				value = "unlocked",
				name = "p1"
			}
		},
		converter = var_0_0[327],
		extraDefinition = var_0_6[18]
	},
	{
		"CloseableBlind",
		"Closeable",
		"OpenClose"
	},
	{
		linkedHighLevelState = var_0_6[34],
		linkedStateIds = var_0_6[29]
	},
	{
		["2146500638"] = var_0_6[1],
		["16832512"] = var_0_6[31],
		["1"] = var_0_6[3],
		["16832522"] = var_0_6[33],
		["2147426304"] = var_0_6[4],
		["16830720"] = var_0_6[35],
		["65537"] = var_0_6[442],
		["2"] = var_0_6[56],
		["2146500645"] = var_0_6[57]
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
		uiProfiles = var_0_6[444],
		states = {
			["65537"] = {
				linkedHighLevelState = {
					var_0_4[20],
					var_0_4[10],
					var_0_4[51]
				},
				linkedStateIds = var_0_6[29]
			},
			["2146500638"] = var_0_6[1],
			["16832512"] = var_0_6[31],
			["1"] = var_0_6[3],
			["16832522"] = var_0_6[33],
			["2147426304"] = var_0_6[4],
			["16830720"] = var_0_6[35],
			["2"] = var_0_6[56],
			["65557"] = var_0_6[36],
			["2146500645"] = var_0_6[57]
		},
		attributes = var_0_6[59],
		commands = var_0_6[202]
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
			uiProfiles = var_0_6[28],
			states = var_0_6[212],
			attributes = var_0_6[59],
			commands = var_0_6[217]
		}
	},
	{
		"CloseableCurtain",
		"Closeable",
		"OpenClose"
	},
	{
		prototype = "string(my;memorized1)|integer[0;100]",
		parameters = var_0_6[11],
		converter = var_0_0[330],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[39],
		converter = var_0_0[330],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[41],
		converter = var_0_0[330],
		extraDefinition = var_0_6[18]
	},
	{
		parameters = var_0_6[50],
		converter = var_0_0[330],
		extraDefinition = var_0_6[18]
	},
	{
		["io:SimpleBioclimaticPergolaIOComponent"] = {
			type = 1,
			widget = "BioclimaticPergola",
			uiClass = "Pergola",
			uiProfiles = var_0_6[252],
			states = var_0_6[255],
			attributes = var_0_6[59],
			commands = {
				advancedRefresh = var_0_6[10],
				closeSlats = var_0_6[98],
				delayedStopIdentify = var_0_6[13],
				getName = var_0_6[14],
				identify = var_0_6[15],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				runManufacturerSettingsCommand = var_0_6[62],
				openSlats = var_0_6[99],
				pairOneWayController = var_0_6[17],
				refreshMemorized1Orientation = var_0_6[37],
				setMemorized1Orientation = var_0_6[47],
				setName = var_0_6[20],
				setOrientation = var_0_6[256],
				my = var_0_6[257],
				setSecuredOrientation = var_0_6[53],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				wink = var_0_6[26],
				sendIOKey = var_0_6[65]
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
			var_0_4[236],
			var_0_4[248],
			var_0_4[263]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[237],
			var_0_4[241],
			var_0_4[242],
			var_0_4[254],
			var_0_4[259],
			var_0_4[262]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[238],
			var_0_4[239],
			var_0_4[240],
			var_0_4[257],
			var_0_4[258],
			var_0_4[261]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[252]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[253]
		}
	},
	{
		{
			rawStateId = "84059684",
			converter = var_0_0[346]
		},
		{
			rawStateId = "84059684",
			converter = var_0_0[345]
		}
	},
	{
		rawStates = var_0_6[466],
		converter = var_0_0[368],
		extraDefinition = var_0_6[195]
	},
	{
		prototype = "float[5.0;26.0],float[5.0;26.0],float[5.0;26.0],float[5.0;26.0]",
		parameters = var_0_6[125],
		rawStates = {},
		converter = var_0_0[369],
		extraDefinition = var_0_6[195]
	},
	{
		prototype = "string(comfort;eco;away;frostprotection;geofencingMode)|float[5.0;26.0],string(further_notice;next_mode)|integer[0;]",
		parameters = var_0_6[44],
		rawStates = var_0_6[466],
		converter = var_0_0[370],
		extraDefinition = var_0_6[195]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		converter = var_0_0[371],
		extraDefinition = var_0_6[195]
	},
	{
		linkedHighLevelState = {
			var_0_4[248]
		}
	},
	{
		advancedRefresh = {
			prototype = "string(normal;advanced)",
			parameters = var_0_6[11],
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
			uiProfiles = var_0_6[370],
			states = {
				["2146500638"] = var_0_6[1],
				["84059682"] = var_0_6[471],
				["2147426304"] = var_0_6[4],
				["84059680"] = {
					linkedHighLevelState = {
						var_0_4[264]
					}
				}
			},
			attributes = var_0_6[377],
			commands = var_0_6[472]
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
		parameters = var_0_6[44],
		converter = var_0_0[374],
		extraDefinition = var_0_6[45]
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
			uiProfiles = var_0_6[477],
			states = {
				["2146500638"] = var_0_6[1],
				["16832512"] = var_0_6[31],
				["1"] = var_0_6[3],
				["16832522"] = var_0_6[33],
				["2147426304"] = var_0_6[4],
				["16830720"] = var_0_6[35],
				["65537"] = {
					linkedHighLevelState = {
						var_0_4[10],
						var_0_4[12],
						var_0_4[5]
					},
					linkedStateIds = var_0_6[29]
				},
				["65557"] = var_0_6[36],
				["2"] = var_0_6[56],
				["2146500645"] = var_0_6[57]
			},
			attributes = var_0_6[59],
			commands = var_0_6[66]
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
			var_0_4[5],
			var_0_4[12],
			var_0_4[10],
			var_0_4[20]
		},
		linkedStateIds = var_0_6[29]
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
			uiProfiles = var_0_6[28],
			states = {
				["65537"] = var_0_6[68],
				["2146500638"] = var_0_6[1],
				["17029120"] = var_0_6[211],
				["16832512"] = var_0_6[69],
				["1"] = var_0_6[3],
				["16832522"] = var_0_6[70],
				["65540"] = var_0_6[73],
				["2147426304"] = var_0_6[4],
				["2"] = var_0_6[56],
				["2146500645"] = var_0_6[57]
			},
			attributes = var_0_6[59],
			commands = {
				advancedRefresh = var_0_6[10],
				delayedStopIdentify = var_0_6[13],
				getName = var_0_6[14],
				identify = var_0_6[15],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				runManufacturerSettingsCommand = var_0_6[62],
				pairOneWayController = var_0_6[17],
				refreshMemorized1Orientation = var_0_6[481],
				refreshMemorized1Position = var_0_6[37],
				setClosure = var_0_6[38],
				close = var_0_6[40],
				down = var_0_6[40],
				open = var_0_6[42],
				up = var_0_6[42],
				setClosureAndOrientation = var_0_6[213],
				my = var_0_6[214],
				setMemorized1Orientation = var_0_6[216],
				setMemorized1Position = var_0_6[47],
				setName = var_0_6[20],
				setOrientation = var_0_6[215],
				setPosition = var_0_6[48],
				setSecuredPosition = var_0_6[53],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				stopIdentify = var_0_6[22],
				unpairAllOneWayControllers = var_0_6[23],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				unpairOneWayController = var_0_6[24],
				setConfigState = var_0_6[25],
				wink = var_0_6[26],
				sendIOKey = var_0_6[65]
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
			var_0_4[5],
			var_0_4[280],
			var_0_4[12],
			var_0_4[10]
		},
		linkedStateIds = var_0_6[29]
	},
	{
		linkedHighLevelState = {
			var_0_4[281]
		}
	},
	{
		type = 1,
		widget = "DomesticHotWaterProduction",
		uiClass = "WaterHeatingSystem",
		uiProfiles = var_0_6[277],
		states = {
			["201326593"] = var_0_6[278],
			["16832527"] = var_0_6[279],
			["65558"] = var_0_6[281],
			["65559"] = var_0_6[282],
			["201342977"] = var_0_6[283],
			["201330433"] = var_0_6[284],
			["2146500638"] = var_0_6[1],
			["16832530"] = var_0_6[285],
			["16832534"] = var_0_6[286],
			["16832531"] = var_0_6[287],
			["201328385"] = var_0_6[288],
			["201343489"] = var_0_6[289],
			["201343233"] = var_0_6[290],
			["1"] = var_0_6[3],
			["201341185"] = var_0_6[291],
			["65553"] = var_0_6[292],
			["16832522"] = var_0_6[293],
			["2147426304"] = var_0_6[4],
			["16830720"] = var_0_6[294],
			["65537"] = var_0_6[179],
			["201339137"] = var_0_6[485],
			["201326849"] = var_0_6[295],
			["201329665"] = var_0_6[296],
			["201327873"] = var_0_6[297],
			["201330945"] = var_0_6[298],
			["201328641"] = var_0_6[299],
			["201327105"] = var_0_6[300],
			["201328129"] = var_0_6[301],
			["201327361"] = var_0_6[302],
			["201330177"] = var_0_6[303],
			["201331457"] = var_0_6[304],
			["201330689"] = var_0_6[305],
			["201332481"] = var_0_6[306],
			["65552"] = var_0_6[307],
			["201329153"] = var_0_6[308],
			["201337601"] = var_0_6[309],
			["201339649"] = var_0_6[310],
			["201339905"] = var_0_6[311],
			["201329409"] = var_0_6[312],
			["65547"] = var_0_6[313],
			["201331201"] = var_0_6[314]
		},
		attributes = var_0_6[5],
		commands = var_0_6[354]
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
		["65537"] = var_0_6[55],
		["2146500638"] = var_0_6[1],
		["16832512"] = var_0_6[31],
		["1"] = var_0_6[3],
		["16832522"] = var_0_6[33],
		["2147426304"] = var_0_6[4],
		["16830720"] = var_0_6[35],
		["65557"] = var_0_6[36],
		["2"] = var_0_6[56],
		["2146500645"] = var_0_6[57],
		["65556"] = var_0_6[260]
	},
	{
		"CloseableScreen",
		"Closeable",
		"Deployable",
		"DeployUndeploy",
		"OpenClose"
	},
	{
		["io:SlidingDiscreteFullyPedestriableGateOpenerIOComponent"] = var_0_6[151]
	},
	{
		extraDefinition = {
			access = "r",
			parameterId = "201344769"
		}
	},
	{
		prototype = "float[0.0;100.0]",
		parameters = var_0_6[11],
		converter = var_0_0[395],
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
			["201351937"] = {
				linkedHighLevelState = {
					var_0_4[282]
				}
			},
			["201351681"] = {
				linkedHighLevelState = {
					var_0_4[283]
				}
			},
			["201343745"] = {
				linkedHighLevelState = {
					var_0_4[284]
				}
			},
			["201351425"] = {
				linkedHighLevelState = {
					var_0_4[285]
				}
			},
			["201326593"] = var_0_6[278],
			["201351169"] = {
				linkedHighLevelState = {
					var_0_4[286]
				}
			},
			["201332993"] = {
				linkedHighLevelState = {
					var_0_4[287]
				}
			},
			["16832527"] = var_0_6[279],
			["65558"] = var_0_6[281],
			["65559"] = var_0_6[282],
			["201345281"] = {
				linkedHighLevelState = {
					var_0_4[288]
				}
			},
			["201342977"] = var_0_6[283],
			["201330433"] = var_0_6[284],
			["2146500638"] = var_0_6[1],
			["16832530"] = var_0_6[285],
			["201345025"] = {
				linkedHighLevelState = {
					var_0_4[289]
				}
			},
			["16832534"] = var_0_6[286],
			["16832531"] = var_0_6[287],
			["201352193"] = {
				linkedHighLevelState = {
					var_0_4[290]
				}
			},
			["201328385"] = var_0_6[288],
			["201343489"] = var_0_6[289],
			["201343233"] = var_0_6[290],
			["201344257"] = {
				linkedHighLevelState = {
					var_0_4[291]
				}
			},
			["1"] = var_0_6[3],
			["201344513"] = {
				linkedHighLevelState = {
					var_0_4[292]
				}
			},
			["201341185"] = var_0_6[291],
			["65553"] = var_0_6[292],
			["201344001"] = {
				linkedHighLevelState = {
					var_0_4[293]
				}
			},
			["201340929"] = {
				linkedHighLevelState = {
					var_0_4[294]
				}
			},
			["16832522"] = var_0_6[293],
			["2147426304"] = var_0_6[4],
			["201340417"] = {
				linkedHighLevelState = {
					var_0_4[295]
				}
			},
			["16830720"] = var_0_6[294],
			["65537"] = var_0_6[179],
			["201339137"] = var_0_6[485],
			["201326849"] = var_0_6[295],
			["201344769"] = {
				linkedHighLevelState = {
					var_0_4[296],
					var_0_4[297],
					var_0_4[298]
				}
			},
			["201329665"] = var_0_6[296],
			["201327873"] = var_0_6[297],
			["201330945"] = var_0_6[298],
			["201347841"] = {
				linkedHighLevelState = {
					var_0_4[299]
				}
			},
			["201347585"] = {
				linkedHighLevelState = {
					var_0_4[300]
				}
			},
			["201328641"] = var_0_6[299],
			["201327105"] = var_0_6[300],
			["201328129"] = var_0_6[301],
			["201327361"] = var_0_6[302],
			["201330177"] = var_0_6[303],
			["201331457"] = var_0_6[304],
			["201330689"] = var_0_6[305],
			["201332481"] = var_0_6[306],
			["65552"] = var_0_6[307],
			["201329153"] = var_0_6[308],
			["201337601"] = var_0_6[309],
			["201339649"] = var_0_6[310],
			["201339905"] = var_0_6[311],
			["201329409"] = var_0_6[312],
			["65547"] = var_0_6[313],
			["201331201"] = var_0_6[314]
		},
		attributes = var_0_6[5],
		commands = {
			advancedRefresh = var_0_6[10],
			delayedStopIdentify = var_0_6[13],
			getName = var_0_6[14],
			identify = var_0_6[15],
			pairOneWayController = var_0_6[17],
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
			refreshAntiLegionellosis = var_0_6[315],
			refreshAwayModeDuration = var_0_6[316],
			refreshBoilerInstallationOption = var_0_6[317],
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
			refreshBoostModeDuration = var_0_6[318],
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
			refreshCurrentOperatingMode = var_0_6[233],
			refreshDHWCapacity = var_0_6[319],
			refreshDHWError = var_0_6[320],
			refreshDHWMode = var_0_6[321],
			refreshElectricalExtraManagement = var_0_6[322],
			refreshExpectedNumberOfShower = {
				extraDefinition = {
					access = "r",
					parameterId = "201345025"
				}
			},
			refreshExtractionOption = var_0_6[323],
			refreshInstallation = var_0_6[324],
			refreshManufacturerName = var_0_6[325],
			refreshMiddleWaterTemperature = var_0_6[326],
			refreshMiddleWaterTemperatureIn = {
				extraDefinition = {
					access = "r",
					parameterId = "201344257"
				}
			},
			refreshOperatingModeCapabilities = var_0_6[327],
			refreshOperatingRange = var_0_6[328],
			refreshOperatingTime = var_0_6[329],
			refreshProgrammingSlots = var_0_6[330],
			refreshRateManagement = var_0_6[331],
			refreshSmartGridOption = var_0_6[332],
			refreshTargetTemperature = var_0_6[158],
			refreshWaterConsumption = var_0_6[333],
			refreshWaterTargetTemperature = var_0_6[491],
			refreshWaterTemperature = var_0_6[491],
			setAbsenceEndDate = {
				prototype = "object",
				parameters = var_0_6[11],
				converter = var_0_0[194],
				extraDefinition = {
					access = "w",
					parameterId = "201351937"
				}
			},
			setAbsenceMode = {
				prototype = "string(off;on;prog)",
				parameters = var_0_6[11],
				converter = var_0_0[394],
				extraDefinition = {
					access = "w",
					parameterId = "201347841"
				}
			},
			setAbsenceStartDate = {
				prototype = "object",
				parameters = var_0_6[11],
				converter = var_0_0[194],
				extraDefinition = {
					access = "w",
					parameterId = "201351681"
				}
			},
			setAntiLegionellosis = var_0_6[334],
			setAwayModeDuration = var_0_6[335],
			setBoilerInstallationOption = var_0_6[336],
			setBoostEndDate = {
				prototype = "object",
				parameters = var_0_6[11],
				converter = var_0_0[194],
				extraDefinition = {
					access = "w",
					parameterId = "201351425"
				}
			},
			setBoostMode = {
				prototype = "string(off;on;prog)",
				parameters = var_0_6[11],
				converter = var_0_0[394],
				extraDefinition = {
					access = "w",
					parameterId = "201347585"
				}
			},
			setBoostModeDuration = var_0_6[337],
			setBoostStartDate = {
				prototype = "object",
				parameters = var_0_6[11],
				converter = var_0_0[194],
				extraDefinition = {
					access = "w",
					parameterId = "201351169"
				}
			},
			setComfortTargetTemperature = var_0_6[184],
			setCurrentOperatingMode = var_0_6[338],
			setDHWMode = var_0_6[339],
			setDateTime = var_0_6[340],
			setEcoTargetTemperature = var_0_6[341],
			setElectricalExtraManagement = var_0_6[342],
			setExpectedNumberOfShower = {
				prototype = "integer[0;10]",
				parameters = var_0_6[11],
				converter = var_0_0[189],
				extraDefinition = {
					access = "w",
					parameterId = "201345025"
				}
			},
			setExtractionOption = var_0_6[343],
			setFrostProtectionTargetTemperature = var_0_6[345],
			setHaltedTargetTemperature = var_0_6[347],
			setInstallation = var_0_6[348],
			setName = var_0_6[20],
			setOperatingRange = var_0_6[349],
			setProgrammingSlots = var_0_6[350],
			setRateManagement = var_0_6[351],
			setSmartGridOption = var_0_6[352],
			setTargetTemperature = var_0_6[353],
			setWaterTargetTemperature = var_0_6[492],
			setTargetDHWTemperature = var_0_6[492],
			setWaterTemperature = var_0_6[492],
			startIdentify = var_0_6[21],
			stopIdentify = var_0_6[22],
			unpairAllOneWayControllers = var_0_6[23],
			unpairOneWayController = var_0_6[24],
			wink = var_0_6[26]
		}
	},
	{
		type = 4,
		widget = "RemoteControllerOneWay",
		uiClass = "RemoteController",
		uiProfiles = var_0_6[367],
		states = {
			["65555"] = {
				linkedHighLevelState = {
					var_0_4[301]
				}
			}
		},
		attributes = var_0_6[419]
	},
	{
		["65537"] = var_0_6[88],
		["2146500638"] = var_0_6[1],
		["16832512"] = var_0_6[31],
		["1"] = var_0_6[3],
		["16832522"] = var_0_6[33],
		["2147426304"] = var_0_6[4],
		["2"] = var_0_6[56],
		["2146500645"] = var_0_6[57],
		["65556"] = var_0_6[260],
		["65557"] = var_0_6[36],
		["16830720"] = var_0_6[35]
	},
	{
		linkedHighLevelState = {
			var_0_4[302]
		}
	},
	{
		["io:SunEnergyActuatorSensor"] = {
			type = 2,
			widget = "LuminanceSensor",
			uiClass = "LightSensor",
			uiProfiles = var_0_6[372],
			states = {
				["67362620678"] = {
					linkedHighLevelState = {
						var_0_4[303],
						var_0_4[304]
					}
				}
			}
		}
	},
	{
		var_0_4[305]
	},
	{
		"65537",
		"84059661"
	},
	{
		linkedHighLevelState = var_0_6[498],
		linkedStateIds = var_0_6[499]
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
		linkedHighLevelState = var_0_6[498],
		linkedStateIds = var_0_6[502]
	},
	{
		linkedHighLevelState = {
			var_0_4[10],
			var_0_4[8]
		},
		linkedStateIds = var_0_6[32]
	},
	{
		linkedHighLevelState = {
			var_0_4[14]
		}
	},
	{
		["16832512"] = var_0_6[31],
		["84059651"] = var_0_6[500],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[305],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10]
			},
			linkedStateIds = var_0_6[501]
		},
		["84059661"] = var_0_6[503],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[38],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		rawStateId = "84059661"
	},
	{
		var_0_6[193],
		var_0_6[129],
		var_0_6[508]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[509],
		converter = var_0_0[402],
		extraDefinition = var_0_6[9]
	},
	{
		["io:VerticalInteriorBlindGenericIOComponent"] = {
			type = 1,
			widget = "PositionableScreen",
			uiClass = "Screen",
			uiProfiles = var_0_6[167],
			states = var_0_6[506],
			attributes = var_0_6[507],
			commands = {
				setName = var_0_6[20],
				sendIOKey = var_0_6[65],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				unpairOneWayController = var_0_6[24],
				getName = var_0_6[14],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				delayedStopIdentify = var_0_6[13],
				identify = var_0_6[15],
				unpairAllOneWayControllers = var_0_6[23],
				setSecuredPosition = var_0_6[53],
				setPosition = var_0_6[48],
				my = var_0_6[51],
				setConfigState = var_0_6[25],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				setMemorized1Position = var_0_6[47],
				stopIdentify = var_0_6[22],
				wink = var_0_6[26],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = var_0_6[44],
					rawStates = var_0_6[509],
					converter = var_0_0[401],
					extraDefinition = var_0_6[45]
				},
				setClosure = var_0_6[38],
				close = var_0_6[40],
				down = var_0_6[40],
				open = var_0_6[42],
				up = var_0_6[42],
				pairOneWayController = var_0_6[17],
				refreshMemorized1Position = var_0_6[37],
				advancedRefresh = var_0_6[510]
			}
		}
	},
	{
		var_0_4[306]
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
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[39],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
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
		var_0_6[518],
		var_0_6[129],
		var_0_6[519],
		var_0_6[520]
	},
	{
		var_0_4[307]
	},
	{
		["io:AdjustableSlatsRollerShutterIOComponent"] = {
			type = 1,
			widget = "PositionableOrOrientableRollerShutter",
			uiClass = "AdjustableSlatsRollerShutter",
			uiProfiles = var_0_6[72],
			states = {
				["84082687"] = {
					linkedHighLevelState = var_0_6[522],
					linkedStateIds = var_0_6[513]
				},
				["65537"] = {
					linkedHighLevelState = {
						var_0_4[307],
						var_0_4[17],
						var_0_4[16],
						var_0_4[10]
					},
					linkedStateIds = var_0_6[514]
				},
				["65540"] = {
					linkedHighLevelState = {
						var_0_4[307],
						var_0_4[18]
					},
					linkedStateIds = var_0_6[515]
				},
				["48177664"] = {
					linkedHighLevelState = var_0_6[522],
					linkedStateIds = var_0_6[516]
				},
				["2147426304"] = var_0_6[4],
				["1"] = var_0_6[3],
				["65557"] = var_0_6[36],
				["2146500645"] = var_0_6[57],
				["16830720"] = var_0_6[35],
				["16832512"] = var_0_6[74],
				["16832522"] = var_0_6[75],
				["2"] = var_0_6[505],
				["2146500638"] = var_0_6[1]
			},
			attributes = var_0_6[517],
			commands = {
				setName = var_0_6[20],
				setOrientation = var_0_6[83],
				sendIOKey = var_0_6[65],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				unpairOneWayController = var_0_6[24],
				getName = var_0_6[14],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				delayedStopIdentify = var_0_6[13],
				identify = var_0_6[15],
				unpairAllOneWayControllers = var_0_6[23],
				setConfigState = var_0_6[25],
				setClosureOrRockerPosition = var_0_6[78],
				close = var_0_6[79],
				down = var_0_6[79],
				open = var_0_6[80],
				setClosure = var_0_6[81],
				setDeployment = var_0_6[81],
				setRockerPosition = var_0_6[82],
				up = var_0_6[80],
				startIdentify = var_0_6[21],
				stop = var_0_6[84],
				stopIdentify = var_0_6[22],
				wink = var_0_6[26],
				setClosureOrOrientation = var_0_6[77],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = var_0_6[44],
					rawStates = var_0_6[521],
					converter = var_0_0[408],
					extraDefinition = var_0_6[45]
				},
				pairOneWayController = var_0_6[17],
				advancedRefresh = {
					prototype = "string(normal;advanced;custom),*array",
					parameters = var_0_6[8],
					rawStates = var_0_6[521],
					converter = var_0_0[409],
					extraDefinition = var_0_6[9]
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
		var_0_6[518],
		var_0_6[129]
	},
	{
		var_0_4[309]
	},
	{
		linkedHighLevelState = {
			var_0_4[34],
			var_0_4[33]
		},
		linkedStateIds = var_0_6[142]
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
		var_0_6[528],
		var_0_6[129],
		var_0_6[529],
		var_0_6[530],
		var_0_6[531],
		var_0_6[532],
		var_0_6[533],
		var_0_6[534],
		var_0_6[535],
		var_0_6[536],
		var_0_6[537],
		var_0_6[538],
		var_0_6[539],
		var_0_6[540],
		var_0_6[541],
		var_0_6[542],
		var_0_6[543],
		var_0_6[544],
		var_0_6[545],
		var_0_6[546],
		var_0_6[547],
		var_0_6[548],
		var_0_6[549],
		var_0_6[550],
		var_0_6[551],
		var_0_6[552],
		var_0_6[553],
		var_0_6[554],
		var_0_6[555],
		var_0_6[556],
		var_0_6[557],
		var_0_6[558],
		var_0_6[559],
		var_0_6[560],
		var_0_6[561],
		var_0_6[562],
		var_0_6[563]
	},
	{
		["io:SlidingDiscreteGateOpenerIOComponent"] = {
			type = 1,
			widget = "SlidingDiscreteGateWithPedestrianPosition",
			uiClass = "Gate",
			uiProfiles = var_0_6[149],
			states = {
				["84058662"] = {
					linkedHighLevelState = var_0_6[526],
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
				["65537"] = {
					linkedHighLevelState = {
						var_0_4[309],
						var_0_4[33]
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
				["84058391"] = {
					linkedHighLevelState = var_0_6[526],
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
				["49217792"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058368"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058369"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058370"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058371"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058372"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058393"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058394"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058395"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058396"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058373"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058397"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058398"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058399"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058400"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058401"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058375"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058376"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058374"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058377"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058412"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058411"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058378"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058379"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058402"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058380"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058381"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058382"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058383"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058384"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058385"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058386"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058387"] = {
					linkedHighLevelState = var_0_6[526],
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
				["84058409"] = {
					linkedHighLevelState = var_0_6[526],
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
				["16832519"] = var_0_6[527],
				["2147426304"] = var_0_6[4],
				["1"] = var_0_6[3],
				["2146500645"] = var_0_6[57],
				["16830720"] = var_0_6[145],
				["2"] = var_0_6[505],
				["2146500638"] = var_0_6[1]
			},
			attributes = {
				["core:SupportedManufacturerSettingsCommands"] = var_0_5[40],
				["core:Manufacturer"] = var_0_5[1],
				["core:FirmwareRevision"] = var_0_5[0]
			},
			commands = {
				setName = var_0_6[20],
				sendIOKey = var_0_6[65],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				unpairOneWayController = var_0_6[24],
				getName = var_0_6[14],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				delayedStopIdentify = var_0_6[13],
				identify = var_0_6[15],
				unpairAllOneWayControllers = var_0_6[23],
				setConfigState = var_0_6[25],
				startIdentify = var_0_6[21],
				refreshPedestrianPosition = var_0_6[146],
				stop = var_0_6[63],
				stopIdentify = var_0_6[22],
				wink = var_0_6[26],
				setPedestrianPosition = var_0_6[150],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = var_0_6[44],
					rawStates = var_0_6[564],
					converter = var_0_0[415],
					extraDefinition = var_0_6[45]
				},
				close = var_0_6[98],
				pairOneWayController = var_0_6[17],
				open = var_0_6[99],
				advancedRefresh = {
					prototype = "string(normal;advanced;custom),*array",
					parameters = var_0_6[8],
					rawStates = var_0_6[564],
					converter = var_0_0[416],
					extraDefinition = var_0_6[9]
				}
			}
		}
	},
	{
		name = "Axovia 3S io V2",
		localPairing = true,
		["0"] = var_0_6[565]
	},
	{
		name = "Axovia 200 3S io V2",
		localPairing = true,
		["0"] = var_0_6[565]
	},
	{
		var_0_4[310]
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
		var_0_6[528],
		var_0_6[129],
		{
			rawStateId = "84058674"
		},
		var_0_6[529],
		var_0_6[570],
		var_0_6[530],
		var_0_6[531],
		var_0_6[571],
		var_0_6[546],
		var_0_6[547],
		var_0_6[548],
		var_0_6[549],
		var_0_6[551],
		var_0_6[572],
		var_0_6[563]
	},
	{
		["io:DiscreteGarageOpenerWithPartialPositionIOComponent"] = {
			type = 1,
			widget = "PositionableGarageDoorWithPartialPosition",
			uiClass = "GarageDoor",
			uiProfiles = var_0_6[97],
			states = {
				["84058662"] = {
					linkedHighLevelState = var_0_6[568],
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
				["65537"] = {
					linkedHighLevelState = {
						var_0_4[310],
						var_0_4[224]
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
				["84058674"] = {
					linkedHighLevelState = var_0_6[568],
					linkedStateIds = var_0_6[569]
				},
				["84058391"] = {
					linkedHighLevelState = var_0_6[568],
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
				["84058697"] = {
					linkedHighLevelState = var_0_6[568],
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
				["49217792"] = {
					linkedHighLevelState = var_0_6[568],
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
				["84058368"] = {
					linkedHighLevelState = var_0_6[568],
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
				["84058420"] = {
					linkedHighLevelState = var_0_6[568],
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
				["84058375"] = {
					linkedHighLevelState = var_0_6[568],
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
				["84058376"] = {
					linkedHighLevelState = var_0_6[568],
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
				["84058374"] = {
					linkedHighLevelState = var_0_6[568],
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
				["84058377"] = {
					linkedHighLevelState = var_0_6[568],
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
				["84058411"] = {
					linkedHighLevelState = var_0_6[568],
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
				["84058390"] = {
					linkedHighLevelState = var_0_6[568],
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
				["84058409"] = {
					linkedHighLevelState = var_0_6[568],
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
				["16832521"] = var_0_6[435],
				["2147426304"] = var_0_6[4],
				["1"] = var_0_6[3],
				["2"] = var_0_6[505],
				["2146500638"] = var_0_6[1],
				["2146500645"] = var_0_6[57]
			},
			attributes = {
				["core:SupportedManufacturerSettingsCommands"] = var_0_5[41],
				["core:Manufacturer"] = var_0_5[1],
				["core:FirmwareRevision"] = var_0_5[0]
			},
			commands = {
				setName = var_0_6[20],
				sendIOKey = var_0_6[65],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				unpairOneWayController = var_0_6[24],
				getName = var_0_6[14],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				delayedStopIdentify = var_0_6[13],
				identify = var_0_6[15],
				partialPosition = var_0_6[436],
				unpairAllOneWayControllers = var_0_6[23],
				down = var_0_6[98],
				refreshPartialPosition = var_0_6[437],
				setConfigState = var_0_6[25],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				stopIdentify = var_0_6[22],
				wink = var_0_6[26],
				up = var_0_6[99],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = var_0_6[44],
					rawStates = var_0_6[573],
					converter = var_0_0[419],
					extraDefinition = var_0_6[45]
				},
				close = var_0_6[98],
				pairOneWayController = var_0_6[17],
				open = var_0_6[99],
				advancedRefresh = {
					prototype = "string(normal;advanced;custom),*array",
					parameters = var_0_6[8],
					rawStates = var_0_6[573],
					converter = var_0_0[420],
					extraDefinition = var_0_6[9]
				}
			}
		}
	},
	{
		name = "Dexxo Smart 800 io",
		localPairing = true,
		["0"] = var_0_6[574]
	},
	{
		name = "Dexxo Smart 1000 io",
		localPairing = true,
		["0"] = var_0_6[574]
	},
	{
		name = "Metro Smart 800 io",
		localPairing = true,
		["0"] = var_0_6[574]
	},
	{
		name = "Metro Smart 1000 io",
		localPairing = true,
		["0"] = var_0_6[574]
	},
	{
		var_0_4[311]
	},
	{
		linkedHighLevelState = var_0_6[579],
		linkedStateIds = {
			"48177664",
			"65537",
			"84059661"
		}
	},
	{
		linkedHighLevelState = var_0_6[579],
		linkedStateIds = {
			"48177664",
			"65537",
			"84059651"
		}
	},
	{
		linkedHighLevelState = var_0_6[579],
		linkedStateIds = {
			"65537",
			"84059651",
			"84059661"
		}
	},
	{
		["16832512"] = var_0_6[31],
		["17029120"] = var_0_6[211],
		["84059651"] = var_0_6[580],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[311],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10]
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
		["84059661"] = var_0_6[581],
		["48177664"] = var_0_6[582],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["65540"] = var_0_6[73],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[42],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		var_0_6[193],
		var_0_6[129],
		var_0_6[508],
		var_0_6[520]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[585],
		converter = var_0_0[423],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[585],
		converter = var_0_0[424],
		extraDefinition = var_0_6[9]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		delayedStopIdentify = var_0_6[13],
		unpairAllOneWayControllers = var_0_6[23],
		setClosureAndOrientation = var_0_6[213],
		my = var_0_6[214],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		stopIdentify = var_0_6[22],
		runManufacturerSettingsCommand = var_0_6[586],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		up = var_0_6[42],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[587],
		setOrientation = var_0_6[215],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		identify = var_0_6[15],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		wink = var_0_6[26],
		pairOneWayController = var_0_6[17],
		setMemorized1Orientation = var_0_6[216]
	},
	{
		name = "EVB-Slim Receiver for Variation WP IO Plug",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP2",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = {
					["16832512"] = var_0_6[69],
					["17029120"] = var_0_6[211],
					["84059651"] = var_0_6[580],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[311],
							var_0_4[5],
							var_0_4[12]
						},
						linkedStateIds = {
							"48177664",
							"84059651",
							"84059661"
						}
					},
					["84059661"] = var_0_6[581],
					["48177664"] = var_0_6[582],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65540"] = var_0_6[73],
					["2146500645"] = var_0_6[57],
					["16832522"] = var_0_6[70],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[584],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setClosureAndOrientation = var_0_6[213],
					my = var_0_6[214],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = var_0_6[586],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[587],
					setOrientation = var_0_6[215],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					refreshMemorized1Orientation = var_0_6[481],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17],
					setMemorized1Orientation = var_0_6[216]
				}
			}
		}
	},
	{
		var_0_4[312]
	},
	{
		linkedHighLevelState = var_0_6[590],
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
		linkedHighLevelState = var_0_6[590],
		linkedStateIds = var_0_6[592]
	},
	{
		linkedHighLevelState = {
			var_0_4[312],
			var_0_4[18]
		},
		linkedStateIds = {
			"48177664",
			"65537",
			"84059651",
			"84059661"
		}
	},
	{
		linkedHighLevelState = var_0_6[590],
		linkedStateIds = {
			"65537",
			"65540",
			"84059651",
			"84059661"
		}
	},
	{
		["16832512"] = var_0_6[31],
		["17029120"] = var_0_6[211],
		["84059651"] = var_0_6[591],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[312],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10]
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
		["84059661"] = var_0_6[593],
		["65540"] = var_0_6[594],
		["48177664"] = var_0_6[595],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[43],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		var_0_6[193],
		var_0_6[129],
		var_0_6[508],
		var_0_6[519],
		var_0_6[520]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[598],
		converter = var_0_0[427],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[598],
		converter = var_0_0[428],
		extraDefinition = var_0_6[9]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		delayedStopIdentify = var_0_6[13],
		unpairAllOneWayControllers = var_0_6[23],
		setClosureAndOrientation = var_0_6[213],
		my = var_0_6[214],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		stopIdentify = var_0_6[22],
		runManufacturerSettingsCommand = var_0_6[599],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		up = var_0_6[42],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[600],
		setOrientation = var_0_6[215],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		identify = var_0_6[15],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		wink = var_0_6[26],
		pairOneWayController = var_0_6[17],
		setMemorized1Orientation = var_0_6[216]
	},
	{
		["16832512"] = var_0_6[69],
		["17029120"] = var_0_6[211],
		["84059651"] = var_0_6[591],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[312],
				var_0_4[5],
				var_0_4[12]
			},
			linkedStateIds = {
				"48177664",
				"65540",
				"84059651",
				"84059661"
			}
		},
		["84059661"] = var_0_6[593],
		["65540"] = var_0_6[594],
		["48177664"] = var_0_6[595],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["2146500645"] = var_0_6[57],
		["16832522"] = var_0_6[70],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		name = "EVB-Slim Receiver for Variation",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP2",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[602],
				attributes = var_0_6[597],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setClosureAndOrientation = var_0_6[213],
					my = var_0_6[214],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = var_0_6[599],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[600],
					setOrientation = var_0_6[215],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					refreshMemorized1Orientation = var_0_6[481],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17],
					setMemorized1Orientation = var_0_6[216]
				}
			}
		}
	},
	{
		var_0_4[313]
	},
	{
		rawStateId = "84058392"
	},
	{
		var_0_6[528],
		var_0_6[129],
		var_0_6[529],
		var_0_6[530],
		var_0_6[531],
		var_0_6[532],
		var_0_6[533],
		var_0_6[534],
		var_0_6[535],
		{
			rawStateId = "84058406"
		},
		var_0_6[605],
		var_0_6[536],
		var_0_6[537],
		var_0_6[538],
		var_0_6[539],
		var_0_6[540],
		var_0_6[541],
		var_0_6[542],
		var_0_6[543],
		var_0_6[544],
		var_0_6[546],
		var_0_6[547],
		var_0_6[548],
		var_0_6[549],
		var_0_6[550],
		var_0_6[551],
		var_0_6[555],
		var_0_6[556],
		var_0_6[557],
		var_0_6[558],
		var_0_6[572],
		var_0_6[563]
	},
	{
		name = "Elixo 3S io V2",
		localPairing = true,
		["0"] = {
			["io:SlidingDiscreteGateOpenerIOComponent"] = {
				type = 1,
				widget = "SlidingDiscreteGateWithPedestrianPosition",
				uiClass = "Gate",
				uiProfiles = var_0_6[149],
				states = {
					["84058662"] = {
						linkedHighLevelState = var_0_6[604],
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
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[313],
							var_0_4[33]
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
					["84058391"] = {
						linkedHighLevelState = var_0_6[604],
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
					["49217792"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058368"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058369"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058370"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058371"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058372"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058406"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058392"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058393"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058394"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058395"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058396"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058373"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058397"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058398"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058399"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058400"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058375"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058376"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058374"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058377"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058412"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058411"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058380"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058381"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058382"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058383"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058390"] = {
						linkedHighLevelState = var_0_6[604],
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
					["84058409"] = {
						linkedHighLevelState = var_0_6[604],
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
					["16832519"] = var_0_6[527],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[145],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[44],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					refreshPedestrianPosition = var_0_6[146],
					stop = var_0_6[63],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					setPedestrianPosition = var_0_6[150],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[606],
						converter = var_0_0[431],
						extraDefinition = var_0_6[45]
					},
					close = var_0_6[98],
					pairOneWayController = var_0_6[17],
					open = var_0_6[99],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[606],
						converter = var_0_0[432],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	{
		var_0_4[314]
	},
	{
		var_0_6[528],
		var_0_6[129],
		var_0_6[529],
		var_0_6[605],
		var_0_6[570],
		var_0_6[530],
		var_0_6[531],
		var_0_6[571],
		var_0_6[546],
		var_0_6[547],
		var_0_6[548],
		var_0_6[549],
		var_0_6[551],
		var_0_6[572],
		var_0_6[563]
	},
	{
		["io:SlidingDiscreteFullyPedestriableGateOpenerIOComponent"] = {
			type = 1,
			widget = "SlidingDiscreteGateWithPedestrianPosition",
			uiClass = "Gate",
			uiProfiles = var_0_6[149],
			states = {
				["84058662"] = {
					linkedHighLevelState = var_0_6[608],
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
				["65537"] = {
					linkedHighLevelState = {
						var_0_4[314],
						var_0_4[33]
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
				["84058391"] = {
					linkedHighLevelState = var_0_6[608],
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
				["84058392"] = {
					linkedHighLevelState = var_0_6[608],
					linkedStateIds = var_0_6[569]
				},
				["84058697"] = {
					linkedHighLevelState = var_0_6[608],
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
				["49217792"] = {
					linkedHighLevelState = var_0_6[608],
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
				["84058368"] = {
					linkedHighLevelState = var_0_6[608],
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
				["84058420"] = {
					linkedHighLevelState = var_0_6[608],
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
				["84058375"] = {
					linkedHighLevelState = var_0_6[608],
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
				["84058376"] = {
					linkedHighLevelState = var_0_6[608],
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
				["84058374"] = {
					linkedHighLevelState = var_0_6[608],
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
				["84058377"] = {
					linkedHighLevelState = var_0_6[608],
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
				["84058411"] = {
					linkedHighLevelState = var_0_6[608],
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
				["84058390"] = {
					linkedHighLevelState = var_0_6[608],
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
				["84058409"] = {
					linkedHighLevelState = var_0_6[608],
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
				["16832519"] = var_0_6[527],
				["2147426304"] = var_0_6[4],
				["1"] = var_0_6[3],
				["2146500645"] = var_0_6[57],
				["16830720"] = var_0_6[145],
				["2"] = var_0_6[505],
				["2146500638"] = var_0_6[1]
			},
			attributes = {
				["core:SupportedManufacturerSettingsCommands"] = var_0_5[45],
				["core:Manufacturer"] = var_0_5[1],
				["core:FirmwareRevision"] = var_0_5[0]
			},
			commands = {
				setName = var_0_6[20],
				sendIOKey = var_0_6[65],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				unpairOneWayController = var_0_6[24],
				getName = var_0_6[14],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				delayedStopIdentify = var_0_6[13],
				identify = var_0_6[15],
				unpairAllOneWayControllers = var_0_6[23],
				setConfigState = var_0_6[25],
				startIdentify = var_0_6[21],
				refreshPedestrianPosition = var_0_6[146],
				stop = var_0_6[63],
				stopIdentify = var_0_6[22],
				wink = var_0_6[26],
				setPedestrianPosition = var_0_6[150],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = var_0_6[44],
					rawStates = var_0_6[609],
					converter = var_0_0[435],
					extraDefinition = var_0_6[45]
				},
				close = var_0_6[98],
				pairOneWayController = var_0_6[17],
				open = var_0_6[99],
				advancedRefresh = {
					prototype = "string(normal;advanced;custom),*array",
					parameters = var_0_6[8],
					rawStates = var_0_6[609],
					converter = var_0_0[436],
					extraDefinition = var_0_6[9]
				}
			}
		}
	},
	{
		name = "Elixo Smart io",
		localPairing = true,
		["0"] = var_0_6[610]
	},
	{
		name = "Roly Smart io",
		localPairing = true,
		["0"] = var_0_6[610]
	},
	{
		linkedHighLevelState = {
			var_0_4[315]
		},
		linkedStateIds = var_0_6[243]
	},
	{
		"84059651"
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[46],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		var_0_6[193],
		var_0_6[129]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[616],
		converter = var_0_0[439],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[616],
		converter = var_0_0[440],
		extraDefinition = var_0_6[9]
	},
	{
		["io:RollerShutterGenericIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutter",
			uiClass = "RollerShutter",
			uiProfiles = var_0_6[54],
			states = var_0_6[506],
			attributes = {
				["core:SupportedManufacturerSettingsCommands"] = var_0_5[47],
				["core:Manufacturer"] = var_0_5[1],
				["core:FirmwareRevision"] = var_0_5[0]
			},
			commands = {
				setName = var_0_6[20],
				sendIOKey = var_0_6[65],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				unpairOneWayController = var_0_6[24],
				getName = var_0_6[14],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				delayedStopIdentify = var_0_6[13],
				identify = var_0_6[15],
				unpairAllOneWayControllers = var_0_6[23],
				setSecuredPosition = var_0_6[53],
				setPosition = var_0_6[48],
				my = var_0_6[51],
				setConfigState = var_0_6[25],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				setMemorized1Position = var_0_6[47],
				stopIdentify = var_0_6[22],
				wink = var_0_6[26],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = var_0_6[44],
					rawStates = var_0_6[509],
					converter = var_0_0[443],
					extraDefinition = var_0_6[45]
				},
				setClosure = var_0_6[38],
				close = var_0_6[40],
				down = var_0_6[40],
				open = var_0_6[42],
				setDeployment = var_0_6[38],
				up = var_0_6[42],
				pairOneWayController = var_0_6[17],
				refreshMemorized1Position = var_0_6[37],
				advancedRefresh = var_0_6[510]
			}
		}
	},
	{
		name = "Invisio 3S io V2",
		localPairing = true,
		["0"] = var_0_6[565]
	},
	{
		var_0_4[316]
	},
	{
		var_0_6[528],
		var_0_6[129],
		var_0_6[529],
		var_0_6[530],
		var_0_6[531],
		var_0_6[532],
		var_0_6[533],
		var_0_6[534],
		var_0_6[535],
		var_0_6[536],
		var_0_6[537],
		var_0_6[538],
		var_0_6[539],
		var_0_6[540],
		var_0_6[541],
		var_0_6[542],
		var_0_6[543],
		var_0_6[544],
		var_0_6[545],
		var_0_6[546],
		var_0_6[547],
		var_0_6[548],
		var_0_6[549],
		var_0_6[550],
		var_0_6[551],
		var_0_6[552],
		var_0_6[553],
		var_0_6[554],
		{
			rawStateId = "84058404"
		},
		var_0_6[555],
		var_0_6[556],
		var_0_6[557],
		var_0_6[558],
		var_0_6[559],
		var_0_6[560],
		var_0_6[561],
		var_0_6[562],
		var_0_6[563]
	},
	{
		name = "Ixengo 3S io V2",
		localPairing = true,
		["0"] = {
			["io:SlidingDiscreteGateOpenerIOComponent"] = {
				type = 1,
				widget = "SlidingDiscreteGateWithPedestrianPosition",
				uiClass = "Gate",
				uiProfiles = var_0_6[149],
				states = {
					["84058662"] = {
						linkedHighLevelState = var_0_6[621],
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
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[316],
							var_0_4[33]
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
					["84058391"] = {
						linkedHighLevelState = var_0_6[621],
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
					["49217792"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058368"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058369"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058370"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058371"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058372"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058393"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058394"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058395"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058396"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058373"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058397"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058398"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058399"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058400"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058401"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058375"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058376"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058374"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058377"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058412"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058411"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058378"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058379"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058402"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058404"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058380"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058381"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058382"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058383"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058384"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058385"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058386"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058387"] = {
						linkedHighLevelState = var_0_6[621],
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
					["84058409"] = {
						linkedHighLevelState = var_0_6[621],
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
					["16832519"] = var_0_6[527],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[145],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[48],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					refreshPedestrianPosition = var_0_6[146],
					stop = var_0_6[63],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					setPedestrianPosition = var_0_6[150],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[622],
						converter = var_0_0[446],
						extraDefinition = var_0_6[45]
					},
					close = var_0_6[98],
					pairOneWayController = var_0_6[17],
					open = var_0_6[99],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[622],
						converter = var_0_0[447],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	{
		["84059655"] = var_0_6[191],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[317],
				var_0_4[31]
			},
			linkedStateIds = var_0_6[614]
		},
		["84059651"] = {
			linkedHighLevelState = {
				var_0_4[317],
				var_0_4[50],
				var_0_4[48]
			},
			linkedStateIds = var_0_6[243]
		},
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["2146500645"] = var_0_6[57],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[49],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		var_0_6[129],
		var_0_6[193]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		onWithInternalTimer = var_0_6[186],
		setConfigState = var_0_6[25],
		onWithTimer = var_0_6[187],
		setInternalTimer = var_0_6[196],
		startIdentify = var_0_6[21],
		setOnOff = var_0_6[188],
		off = var_0_6[189],
		on = var_0_6[190],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = {
			prototype = "string,object",
			parameters = var_0_6[44],
			rawStates = var_0_6[626],
			converter = var_0_0[450],
			extraDefinition = var_0_6[45]
		},
		setPictoValue = var_0_6[197],
		pairOneWayController = var_0_6[17],
		advancedRefresh = {
			prototype = "string(normal;advanced;custom),*array",
			parameters = var_0_6[8],
			rawStates = var_0_6[626],
			converter = var_0_0[451],
			extraDefinition = var_0_6[9]
		}
	},
	{
		var_0_4[318]
	},
	{
		var_0_6[129],
		{
			rawStateId = "84059656"
		},
		var_0_6[193]
	},
	{
		var_0_4[319]
	},
	{
		"65537",
		"84082687"
	},
	{
		linkedHighLevelState = var_0_6[630],
		linkedStateIds = var_0_6[631]
	},
	{
		"16830720",
		"16832512",
		"16832522",
		"84059651",
		"84082687"
	},
	{
		linkedHighLevelState = var_0_6[630],
		linkedStateIds = var_0_6[502]
	},
	{
		["16832512"] = var_0_6[31],
		["17029120"] = var_0_6[211],
		["84059651"] = var_0_6[632],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[319],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10]
			},
			linkedStateIds = var_0_6[633]
		},
		["84082687"] = var_0_6[634],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["65540"] = var_0_6[73],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[51],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		var_0_6[193],
		var_0_6[129],
		var_0_6[518]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[637],
		converter = var_0_0[458],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[637],
		converter = var_0_0[459],
		extraDefinition = var_0_6[9]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		delayedStopIdentify = var_0_6[13],
		unpairAllOneWayControllers = var_0_6[23],
		setClosureAndOrientation = var_0_6[213],
		my = var_0_6[214],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		stopIdentify = var_0_6[22],
		runManufacturerSettingsCommand = var_0_6[638],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		up = var_0_6[42],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[639],
		setOrientation = var_0_6[215],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		identify = var_0_6[15],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		wink = var_0_6[26],
		pairOneWayController = var_0_6[17],
		setMemorized1Orientation = var_0_6[216]
	},
	{
		"84059651",
		"84082687"
	},
	{
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP2",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = {
					["16832512"] = var_0_6[69],
					["17029120"] = var_0_6[211],
					["84059651"] = var_0_6[632],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[319],
							var_0_4[5],
							var_0_4[12]
						},
						linkedStateIds = var_0_6[641]
					},
					["84082687"] = var_0_6[634],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65540"] = var_0_6[73],
					["2146500645"] = var_0_6[57],
					["16832522"] = var_0_6[70],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[636],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setClosureAndOrientation = var_0_6[213],
					my = var_0_6[214],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = var_0_6[638],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[639],
					setOrientation = var_0_6[215],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					refreshMemorized1Orientation = var_0_6[481],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17],
					setMemorized1Orientation = var_0_6[216]
				}
			}
		}
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[52],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[598],
		converter = var_0_0[461],
		extraDefinition = var_0_6[45]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		delayedStopIdentify = var_0_6[13],
		unpairAllOneWayControllers = var_0_6[23],
		setClosureAndOrientation = var_0_6[213],
		my = var_0_6[214],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		stopIdentify = var_0_6[22],
		runManufacturerSettingsCommand = var_0_6[644],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		up = var_0_6[42],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[600],
		setOrientation = var_0_6[215],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		identify = var_0_6[15],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		wink = var_0_6[26],
		pairOneWayController = var_0_6[17],
		setMemorized1Orientation = var_0_6[216]
	},
	{
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP2",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[602],
				attributes = var_0_6[643],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setClosureAndOrientation = var_0_6[213],
					my = var_0_6[214],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = var_0_6[644],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[600],
					setOrientation = var_0_6[215],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					refreshMemorized1Orientation = var_0_6[481],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17],
					setMemorized1Orientation = var_0_6[216]
				}
			}
		}
	},
	{
		var_0_4[320]
	},
	{
		linkedHighLevelState = var_0_6[647],
		linkedStateIds = var_0_6[631]
	},
	{
		linkedHighLevelState = var_0_6[647],
		linkedStateIds = var_0_6[502]
	},
	{
		["16832512"] = var_0_6[31],
		["17029120"] = var_0_6[211],
		["84059651"] = var_0_6[648],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[320],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10]
			},
			linkedStateIds = var_0_6[633]
		},
		["84082687"] = var_0_6[649],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["65540"] = var_0_6[73],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[637],
		converter = var_0_0[463],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[637],
		converter = var_0_0[464],
		extraDefinition = var_0_6[9]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		delayedStopIdentify = var_0_6[13],
		unpairAllOneWayControllers = var_0_6[23],
		setClosureAndOrientation = var_0_6[213],
		my = var_0_6[214],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		stopIdentify = var_0_6[22],
		runManufacturerSettingsCommand = var_0_6[651],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		up = var_0_6[42],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[652],
		setOrientation = var_0_6[215],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		identify = var_0_6[15],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		wink = var_0_6[26],
		pairOneWayController = var_0_6[17],
		setMemorized1Orientation = var_0_6[216]
	},
	{
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP2",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = {
					["16832512"] = var_0_6[69],
					["17029120"] = var_0_6[211],
					["84059651"] = var_0_6[648],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[320],
							var_0_4[5],
							var_0_4[12]
						},
						linkedStateIds = var_0_6[641]
					},
					["84082687"] = var_0_6[649],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65540"] = var_0_6[73],
					["2146500645"] = var_0_6[57],
					["16832522"] = var_0_6[70],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[636],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setClosureAndOrientation = var_0_6[213],
					my = var_0_6[214],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = var_0_6[651],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[652],
					setOrientation = var_0_6[215],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					refreshMemorized1Orientation = var_0_6[481],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17],
					setMemorized1Orientation = var_0_6[216]
				}
			}
		}
	},
	{
		var_0_4[321]
	},
	{
		linkedHighLevelState = var_0_6[655],
		linkedStateIds = {
			"48177664",
			"65537",
			"65540",
			"84082687"
		}
	},
	{
		linkedHighLevelState = var_0_6[655],
		linkedStateIds = var_0_6[592]
	},
	{
		linkedHighLevelState = {
			var_0_4[321],
			var_0_4[18]
		},
		linkedStateIds = {
			"48177664",
			"65537",
			"84059651",
			"84082687"
		}
	},
	{
		linkedHighLevelState = var_0_6[655],
		linkedStateIds = {
			"65537",
			"65540",
			"84059651",
			"84082687"
		}
	},
	{
		["16832512"] = var_0_6[31],
		["17029120"] = var_0_6[211],
		["84059651"] = var_0_6[656],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[321],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10]
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
		["84082687"] = var_0_6[657],
		["65540"] = var_0_6[658],
		["48177664"] = var_0_6[659],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		var_0_6[193],
		var_0_6[129],
		var_0_6[518],
		var_0_6[519],
		var_0_6[520]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[661],
		converter = var_0_0[466],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[661],
		converter = var_0_0[467],
		extraDefinition = var_0_6[9]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		delayedStopIdentify = var_0_6[13],
		unpairAllOneWayControllers = var_0_6[23],
		setClosureAndOrientation = var_0_6[213],
		my = var_0_6[214],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		stopIdentify = var_0_6[22],
		runManufacturerSettingsCommand = var_0_6[662],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		up = var_0_6[42],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[663],
		setOrientation = var_0_6[215],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		identify = var_0_6[15],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		wink = var_0_6[26],
		pairOneWayController = var_0_6[17],
		setMemorized1Orientation = var_0_6[216]
	},
	{
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP2",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = {
					["16832512"] = var_0_6[69],
					["17029120"] = var_0_6[211],
					["84059651"] = var_0_6[656],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[321],
							var_0_4[5],
							var_0_4[12]
						},
						linkedStateIds = {
							"48177664",
							"65540",
							"84059651",
							"84082687"
						}
					},
					["84082687"] = var_0_6[657],
					["65540"] = var_0_6[658],
					["48177664"] = var_0_6[659],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["16832522"] = var_0_6[70],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[643],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setClosureAndOrientation = var_0_6[213],
					my = var_0_6[214],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = var_0_6[662],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[663],
					setOrientation = var_0_6[215],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					refreshMemorized1Orientation = var_0_6[481],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17],
					setMemorized1Orientation = var_0_6[216]
				}
			}
		}
	},
	{
		var_0_4[29],
		var_0_4[28],
		var_0_4[27]
	},
	{
		linkedHighLevelState = {
			var_0_4[315],
			var_0_4[23],
			var_0_4[25]
		},
		linkedStateIds = var_0_6[614]
	},
	{
		var_0_4[323]
	},
	{
		linkedHighLevelState = var_0_6[668],
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
		linkedHighLevelState = var_0_6[668],
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
		linkedHighLevelState = var_0_6[668],
		linkedStateIds = var_0_6[672]
	},
	{
		linkedHighLevelState = var_0_6[668],
		linkedStateIds = {
			"48170496",
			"65537",
			"84059651",
			"84059658"
		}
	},
	{
		["16832512"] = var_0_6[31],
		["84059651"] = var_0_6[669],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[323],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[20]
			},
			linkedStateIds = var_0_6[670]
		},
		["48170496"] = var_0_6[671],
		["84059658"] = var_0_6[673],
		["84059664"] = var_0_6[674],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[54],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
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
		var_0_6[193],
		var_0_6[129],
		var_0_6[677],
		var_0_6[678],
		var_0_6[679]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[680],
		converter = var_0_0[475],
		extraDefinition = var_0_6[9]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = {
			prototype = "string,object",
			parameters = var_0_6[44],
			rawStates = var_0_6[680],
			converter = var_0_0[474],
			extraDefinition = var_0_6[45]
		},
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[681]
	},
	{
		["16832512"] = var_0_6[31],
		["84059651"] = var_0_6[669],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[323],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[280]
			},
			linkedStateIds = var_0_6[670]
		},
		["48170496"] = var_0_6[671],
		["84059658"] = var_0_6[673],
		["84059664"] = var_0_6[674],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[55],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = {
			prototype = "string,object",
			parameters = var_0_6[44],
			rawStates = var_0_6[680],
			converter = var_0_0[477],
			extraDefinition = var_0_6[45]
		},
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[681]
	},
	{
		var_0_4[324]
	},
	{
		"65537",
		"65540",
		"84059658",
		"84059659",
		"84059664"
	},
	{
		linkedHighLevelState = var_0_6[686],
		linkedStateIds = var_0_6[687]
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
		linkedHighLevelState = var_0_6[686],
		linkedStateIds = var_0_6[690]
	},
	{
		"65537",
		"65540",
		"84059651",
		"84059658",
		"84059664"
	},
	{
		linkedHighLevelState = var_0_6[686],
		linkedStateIds = var_0_6[692]
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
			var_0_4[324],
			var_0_4[18]
		},
		linkedStateIds = var_0_6[694]
	},
	{
		"65537",
		"65540",
		"84059651",
		"84059659",
		"84059664"
	},
	{
		linkedHighLevelState = var_0_6[686],
		linkedStateIds = var_0_6[696]
	},
	{
		["16832512"] = var_0_6[31],
		["17029120"] = var_0_6[211],
		["84059651"] = var_0_6[688],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[324],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10]
			},
			linkedStateIds = var_0_6[689]
		},
		["84059664"] = var_0_6[691],
		["84059659"] = var_0_6[693],
		["65540"] = var_0_6[695],
		["84059658"] = var_0_6[697],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[56],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		rawStateId = "84059659"
	},
	{
		var_0_6[193],
		var_0_6[129],
		var_0_6[679],
		var_0_6[700],
		var_0_6[519],
		var_0_6[678]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[701],
		converter = var_0_0[480],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[701],
		converter = var_0_0[481],
		extraDefinition = var_0_6[9]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		delayedStopIdentify = var_0_6[13],
		unpairAllOneWayControllers = var_0_6[23],
		setClosureAndOrientation = var_0_6[213],
		my = var_0_6[214],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		stopIdentify = var_0_6[22],
		runManufacturerSettingsCommand = var_0_6[702],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		up = var_0_6[42],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[703],
		setOrientation = var_0_6[215],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		identify = var_0_6[15],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		wink = var_0_6[26],
		pairOneWayController = var_0_6[17],
		setMemorized1Orientation = var_0_6[216]
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
		["0"] = {
			["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP2",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = {
					["16832512"] = var_0_6[69],
					["17029120"] = var_0_6[211],
					["84059651"] = var_0_6[688],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[324],
							var_0_4[5],
							var_0_4[12]
						},
						linkedStateIds = var_0_6[705]
					},
					["84059664"] = var_0_6[691],
					["84059659"] = var_0_6[693],
					["65540"] = var_0_6[695],
					["84059658"] = var_0_6[697],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["16832522"] = var_0_6[70],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[699],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setClosureAndOrientation = var_0_6[213],
					my = var_0_6[214],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = var_0_6[702],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[703],
					setOrientation = var_0_6[215],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					refreshMemorized1Orientation = var_0_6[481],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17],
					setMemorized1Orientation = var_0_6[216]
				}
			}
		}
	},
	{
		var_0_4[325]
	},
	{
		linkedHighLevelState = var_0_6[707],
		linkedStateIds = var_0_6[687]
	},
	{
		linkedHighLevelState = var_0_6[707],
		linkedStateIds = var_0_6[690]
	},
	{
		linkedHighLevelState = {
			var_0_4[325],
			var_0_4[18]
		},
		linkedStateIds = var_0_6[694]
	},
	{
		linkedHighLevelState = var_0_6[707],
		linkedStateIds = var_0_6[696]
	},
	{
		linkedHighLevelState = var_0_6[707],
		linkedStateIds = var_0_6[692]
	},
	{
		["16832512"] = var_0_6[31],
		["17029120"] = var_0_6[211],
		["84059651"] = var_0_6[708],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[325],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10]
			},
			linkedStateIds = var_0_6[689]
		},
		["84059664"] = var_0_6[709],
		["65540"] = var_0_6[710],
		["84059658"] = var_0_6[711],
		["84059659"] = var_0_6[712],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		var_0_6[193],
		var_0_6[129],
		var_0_6[679],
		var_0_6[519],
		var_0_6[678],
		var_0_6[700]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[714],
		converter = var_0_0[483],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[714],
		converter = var_0_0[484],
		extraDefinition = var_0_6[9]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		delayedStopIdentify = var_0_6[13],
		unpairAllOneWayControllers = var_0_6[23],
		setClosureAndOrientation = var_0_6[213],
		my = var_0_6[214],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		stopIdentify = var_0_6[22],
		runManufacturerSettingsCommand = var_0_6[715],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		up = var_0_6[42],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[716],
		setOrientation = var_0_6[215],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		identify = var_0_6[15],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		wink = var_0_6[26],
		pairOneWayController = var_0_6[17],
		setMemorized1Orientation = var_0_6[216]
	},
	{
		name = "My EVB Pro io",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[713],
				attributes = var_0_6[699],
				commands = var_0_6[717]
			}
		}
	},
	{
		name = "My EVB Pro io",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP2",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = {
					["16832512"] = var_0_6[69],
					["17029120"] = var_0_6[211],
					["84059651"] = var_0_6[708],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[325],
							var_0_4[5],
							var_0_4[12]
						},
						linkedStateIds = var_0_6[705]
					},
					["84059664"] = var_0_6[709],
					["65540"] = var_0_6[710],
					["84059658"] = var_0_6[711],
					["84059659"] = var_0_6[712],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["16832522"] = var_0_6[70],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[699],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setClosureAndOrientation = var_0_6[213],
					my = var_0_6[214],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = var_0_6[715],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[716],
					setOrientation = var_0_6[215],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					refreshMemorized1Orientation = var_0_6[481],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17],
					setMemorized1Orientation = var_0_6[216]
				}
			}
		}
	},
	{
		name = "My EVB Pro io",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[713],
				attributes = var_0_6[699],
				commands = var_0_6[717]
			}
		}
	},
	{
		["io:RollerShutterGenericIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutter",
			uiClass = "RollerShutter",
			uiProfiles = var_0_6[54],
			states = var_0_6[506],
			attributes = var_0_6[507],
			commands = {
				setName = var_0_6[20],
				sendIOKey = var_0_6[65],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				unpairOneWayController = var_0_6[24],
				getName = var_0_6[14],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				delayedStopIdentify = var_0_6[13],
				identify = var_0_6[15],
				unpairAllOneWayControllers = var_0_6[23],
				setSecuredPosition = var_0_6[53],
				setPosition = var_0_6[48],
				my = var_0_6[51],
				setConfigState = var_0_6[25],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				setMemorized1Position = var_0_6[47],
				stopIdentify = var_0_6[22],
				wink = var_0_6[26],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = var_0_6[44],
					rawStates = var_0_6[509],
					converter = var_0_0[486],
					extraDefinition = var_0_6[45]
				},
				setClosure = var_0_6[38],
				close = var_0_6[40],
				down = var_0_6[40],
				open = var_0_6[42],
				setDeployment = var_0_6[38],
				up = var_0_6[42],
				pairOneWayController = var_0_6[17],
				refreshMemorized1Position = var_0_6[37],
				advancedRefresh = var_0_6[510]
			}
		}
	},
	{
		var_0_4[326]
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = {
			linkedHighLevelState = var_0_6[722],
			linkedStateIds = var_0_6[502]
		},
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[326],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10]
			},
			linkedStateIds = var_0_6[633]
		},
		["84059651"] = {
			linkedHighLevelState = var_0_6[722],
			linkedStateIds = var_0_6[631]
		},
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		var_0_6[518],
		var_0_6[129],
		var_0_6[193]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[724],
		converter = var_0_0[489],
		extraDefinition = var_0_6[9]
	},
	{
		var_0_4[327]
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = {
			linkedHighLevelState = var_0_6[726],
			linkedStateIds = var_0_6[502]
		},
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[327],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10]
			},
			linkedStateIds = var_0_6[633]
		},
		["84059651"] = {
			linkedHighLevelState = var_0_6[726],
			linkedStateIds = var_0_6[631]
		},
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[724],
		converter = var_0_0[493],
		extraDefinition = var_0_6[9]
	},
	{
		"16830720",
		"16832512",
		"16832522",
		"49020928"
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[57],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		{
			rawStateId = "49020928"
		},
		var_0_6[129]
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = {
			linkedHighLevelState = {
				var_0_4[331]
			},
			linkedStateIds = var_0_6[243]
		},
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[331],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10]
			},
			linkedStateIds = var_0_6[524]
		},
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[525],
		converter = var_0_0[506],
		extraDefinition = var_0_6[9]
	},
	{
		["io:RollerShutterGenericIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutter",
			uiClass = "RollerShutter",
			uiProfiles = var_0_6[54],
			states = var_0_6[732],
			attributes = var_0_6[507],
			commands = {
				setName = var_0_6[20],
				sendIOKey = var_0_6[65],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				unpairOneWayController = var_0_6[24],
				getName = var_0_6[14],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				delayedStopIdentify = var_0_6[13],
				identify = var_0_6[15],
				unpairAllOneWayControllers = var_0_6[23],
				setSecuredPosition = var_0_6[53],
				setPosition = var_0_6[48],
				my = var_0_6[51],
				setConfigState = var_0_6[25],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				setMemorized1Position = var_0_6[47],
				stopIdentify = var_0_6[22],
				wink = var_0_6[26],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = var_0_6[44],
					rawStates = var_0_6[525],
					converter = var_0_0[507],
					extraDefinition = var_0_6[45]
				},
				setClosure = var_0_6[38],
				close = var_0_6[40],
				down = var_0_6[40],
				open = var_0_6[42],
				setDeployment = var_0_6[38],
				up = var_0_6[42],
				pairOneWayController = var_0_6[17],
				refreshMemorized1Position = var_0_6[37],
				advancedRefresh = var_0_6[733]
			}
		}
	},
	{
		name = "Oximo io",
		localPairing = true,
		["0"] = var_0_6[721]
	},
	{
		var_0_4[332]
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
		var_0_6[518],
		var_0_6[129],
		var_0_6[677],
		var_0_6[741]
	},
	{
		var_0_4[333]
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
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[59],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		var_0_6[518],
		var_0_6[129],
		var_0_6[741]
	},
	{
		var_0_4[334]
	},
	{
		var_0_4[335]
	},
	{
		linkedHighLevelState = var_0_6[749],
		linkedStateIds = var_0_6[744]
	},
	{
		linkedHighLevelState = var_0_6[749],
		linkedStateIds = var_0_6[631]
	},
	{
		["16832512"] = var_0_6[69],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[222],
				var_0_4[335],
				var_0_4[5],
				var_0_4[12]
			},
			linkedStateIds = {
				"48171008",
				"84082687"
			}
		},
		["84082687"] = var_0_6[750],
		["48171008"] = var_0_6[751],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["2146500645"] = var_0_6[57],
		["16832522"] = var_0_6[70],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[60],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[747],
		converter = var_0_0[522],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[747],
		converter = var_0_0[523],
		extraDefinition = var_0_6[9]
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = var_0_6[750],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[335],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[20]
			},
			linkedStateIds = var_0_6[745]
		},
		["48171008"] = var_0_6[751],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[754],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[755]
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = var_0_6[750],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[335],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[280]
			},
			linkedStateIds = var_0_6[745]
		},
		["48171008"] = var_0_6[751],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[747],
		converter = var_0_0[524],
		extraDefinition = var_0_6[45]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[759],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[755]
	},
	{
		var_0_4[336]
	},
	{
		var_0_6[528],
		var_0_6[129],
		var_0_6[530],
		var_0_6[531],
		var_0_6[571],
		var_0_6[529],
		var_0_6[570],
		{
			rawStateId = "84058627"
		},
		var_0_6[543],
		var_0_6[563]
	},
	{
		name = "Rollixo Smart io",
		localPairing = true,
		["0"] = {
			["io:DiscreteGarageOpenerIOComponent"] = {
				type = 1,
				widget = "DiscretePositionableGarageDoor",
				uiClass = "GarageDoor",
				uiProfiles = var_0_6[97],
				states = {
					["84058662"] = {
						linkedHighLevelState = var_0_6[761],
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
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[336],
							var_0_4[22]
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
					["49217792"] = {
						linkedHighLevelState = var_0_6[761],
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
					["84058368"] = {
						linkedHighLevelState = var_0_6[761],
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
					["84058420"] = {
						linkedHighLevelState = var_0_6[761],
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
					["84058391"] = {
						linkedHighLevelState = var_0_6[761],
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
					["84058697"] = {
						linkedHighLevelState = var_0_6[761],
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
					["84058627"] = {
						linkedHighLevelState = var_0_6[761],
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
					["84058399"] = {
						linkedHighLevelState = var_0_6[761],
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
					["84058409"] = {
						linkedHighLevelState = var_0_6[761],
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
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1],
					["2146500645"] = var_0_6[57]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[62],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					down = var_0_6[98],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					up = var_0_6[99],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[762],
						converter = var_0_0[529],
						extraDefinition = var_0_6[45]
					},
					close = var_0_6[98],
					pairOneWayController = var_0_6[17],
					open = var_0_6[99],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[762],
						converter = var_0_0[530],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	{
		var_0_4[337]
	},
	{
		"65537",
		"84059671"
	},
	{
		linkedHighLevelState = var_0_6[764],
		linkedStateIds = var_0_6[765]
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
			var_0_4[337],
			var_0_4[5],
			var_0_4[12],
			var_0_4[10]
		},
		linkedStateIds = var_0_6[767]
	},
	{
		linkedHighLevelState = var_0_6[764],
		linkedStateIds = var_0_6[502]
	},
	{
		["16832512"] = var_0_6[31],
		["84059651"] = var_0_6[766],
		["65537"] = var_0_6[768],
		["84059671"] = var_0_6[769],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		var_0_6[193],
		var_0_6[129],
		{
			rawStateId = "84059671"
		}
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[771],
		converter = var_0_0[534],
		extraDefinition = var_0_6[9]
	},
	{
		name = "S&SO - RS100 AIR",
		localPairing = true,
		["0"] = {
			["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutterWithLowSpeedManagement",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[770],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[63],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setPositionAndLinearSpeed = var_0_6[422],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[771],
						converter = var_0_0[533],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[772],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					setClosureAndLinearSpeed = var_0_6[421],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17]
				}
			}
		}
	},
	{
		var_0_4[338]
	},
	{
		["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutterWithLowSpeedManagement",
			uiClass = "RollerShutter",
			uiProfiles = var_0_6[54],
			states = {
				["16832512"] = var_0_6[31],
				["84059651"] = {
					linkedHighLevelState = var_0_6[774],
					linkedStateIds = var_0_6[765]
				},
				["65537"] = {
					linkedHighLevelState = {
						var_0_4[338],
						var_0_4[5],
						var_0_4[12],
						var_0_4[10]
					},
					linkedStateIds = var_0_6[767]
				},
				["84059671"] = {
					linkedHighLevelState = var_0_6[774],
					linkedStateIds = var_0_6[502]
				},
				["2147426304"] = var_0_6[4],
				["1"] = var_0_6[3],
				["65557"] = var_0_6[36],
				["2146500645"] = var_0_6[57],
				["16830720"] = var_0_6[35],
				["16832522"] = var_0_6[504],
				["2"] = var_0_6[505],
				["2146500638"] = var_0_6[1]
			},
			attributes = {
				["core:SupportedManufacturerSettingsCommands"] = var_0_5[64],
				["core:Manufacturer"] = var_0_5[1],
				["core:FirmwareRevision"] = var_0_5[0]
			},
			commands = {
				setName = var_0_6[20],
				sendIOKey = var_0_6[65],
				unpairOneWayController = var_0_6[24],
				getName = var_0_6[14],
				delayedStopIdentify = var_0_6[13],
				unpairAllOneWayControllers = var_0_6[23],
				setSecuredPosition = var_0_6[53],
				setPosition = var_0_6[48],
				my = var_0_6[51],
				setPositionAndLinearSpeed = var_0_6[422],
				stopIdentify = var_0_6[22],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = var_0_6[44],
					rawStates = var_0_6[771],
					converter = var_0_0[537],
					extraDefinition = var_0_6[45]
				},
				setClosure = var_0_6[38],
				close = var_0_6[40],
				down = var_0_6[40],
				open = var_0_6[42],
				setDeployment = var_0_6[38],
				up = var_0_6[42],
				refreshMemorized1Position = var_0_6[37],
				advancedRefresh = {
					prototype = "string(normal;advanced;custom),*array",
					parameters = var_0_6[8],
					rawStates = var_0_6[771],
					converter = var_0_0[538],
					extraDefinition = var_0_6[9]
				},
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				identify = var_0_6[15],
				setClosureAndLinearSpeed = var_0_6[421],
				setConfigState = var_0_6[25],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				setMemorized1Position = var_0_6[47],
				wink = var_0_6[26],
				pairOneWayController = var_0_6[17]
			}
		}
	},
	{
		name = "S&SO - RS100 io",
		localPairing = true,
		["0"] = var_0_6[775]
	},
	{
		["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutterWithLowSpeedManagement",
			uiClass = "RollerShutter",
			uiProfiles = var_0_6[54],
			states = var_0_6[770],
			attributes = {
				["core:SupportedManufacturerSettingsCommands"] = var_0_5[65],
				["core:Manufacturer"] = var_0_5[1],
				["core:FirmwareRevision"] = var_0_5[0]
			},
			commands = {
				setName = var_0_6[20],
				sendIOKey = var_0_6[65],
				unpairOneWayController = var_0_6[24],
				getName = var_0_6[14],
				delayedStopIdentify = var_0_6[13],
				unpairAllOneWayControllers = var_0_6[23],
				setSecuredPosition = var_0_6[53],
				setPosition = var_0_6[48],
				my = var_0_6[51],
				setPositionAndLinearSpeed = var_0_6[422],
				stopIdentify = var_0_6[22],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = var_0_6[44],
					rawStates = var_0_6[771],
					converter = var_0_0[540],
					extraDefinition = var_0_6[45]
				},
				setClosure = var_0_6[38],
				close = var_0_6[40],
				down = var_0_6[40],
				open = var_0_6[42],
				setDeployment = var_0_6[38],
				up = var_0_6[42],
				refreshMemorized1Position = var_0_6[37],
				advancedRefresh = var_0_6[772],
				keepOneWayControllersAndDeleteNode = var_0_6[61],
				unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
				identify = var_0_6[15],
				setClosureAndLinearSpeed = var_0_6[421],
				setConfigState = var_0_6[25],
				startIdentify = var_0_6[21],
				stop = var_0_6[63],
				setMemorized1Position = var_0_6[47],
				wink = var_0_6[26],
				pairOneWayController = var_0_6[17]
			}
		}
	},
	{
		name = "S&SO - RS100 io",
		localPairing = true,
		["0"] = var_0_6[777]
	},
	{
		name = "S&SO - RS100 ioHybrid",
		localPairing = true,
		["0"] = var_0_6[775]
	},
	{
		name = "S&SO - RS100 ioHybrid",
		localPairing = true,
		["0"] = var_0_6[777]
	},
	{
		var_0_4[339]
	},
	{
		name = "S&SO - RS100 ioHybrid",
		localPairing = true,
		["0"] = {
			["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutterWithLowSpeedManagement",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = {
						linkedHighLevelState = var_0_6[781],
						linkedStateIds = var_0_6[765]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[339],
							var_0_4[5],
							var_0_4[12],
							var_0_4[10]
						},
						linkedStateIds = var_0_6[767]
					},
					["84059671"] = {
						linkedHighLevelState = var_0_6[781],
						linkedStateIds = var_0_6[502]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[66],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setPositionAndLinearSpeed = var_0_6[422],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[771],
						converter = var_0_0[543],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[771],
						converter = var_0_0[544],
						extraDefinition = var_0_6[9]
					},
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					setClosureAndLinearSpeed = var_0_6[421],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17]
				}
			}
		}
	},
	{
		var_0_4[340]
	},
	{
		linkedHighLevelState = var_0_6[783],
		linkedStateIds = {
			"84059668",
			"84059669"
		}
	},
	{
		linkedHighLevelState = var_0_6[783],
		linkedStateIds = {
			"84059649",
			"84059669"
		}
	},
	{
		linkedHighLevelState = var_0_6[783],
		linkedStateIds = {
			"84059649",
			"84059668"
		}
	},
	{
		["16832512"] = var_0_6[31],
		["84059651"] = var_0_6[766],
		["65537"] = var_0_6[768],
		["84059671"] = var_0_6[769],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["65556"] = var_0_6[260],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["84059649"] = var_0_6[784],
		["84059668"] = var_0_6[785],
		["84059669"] = var_0_6[786],
		["2146500638"] = var_0_6[1],
		["67362619648"] = var_0_6[496]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[771],
		converter = var_0_0[547],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[771],
		converter = var_0_0[548],
		extraDefinition = var_0_6[9]
	},
	{
		name = "S&SO - RS100 solar io",
		localPairing = true,
		["1"] = {
			["io:DynamicRollerShutterIOComponent"] = {
				type = 1,
				widget = "DynamicRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[787],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[67],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0],
					["io:Features"] = var_0_5[37]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setPositionAndLinearSpeed = var_0_6[422],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = var_0_6[788],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[789],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					setClosureAndLinearSpeed = var_0_6[421],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17]
				}
			}
		},
		["2"] = var_0_6[497]
	},
	{
		["16832512"] = var_0_6[31],
		["84059651"] = var_0_6[766],
		["65537"] = var_0_6[768],
		["84059671"] = var_0_6[769],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["84059649"] = var_0_6[784],
		["84059668"] = var_0_6[785],
		["84059669"] = var_0_6[786],
		["2146500638"] = var_0_6[1]
	},
	{
		name = "S&SO - RS100 solar io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[791],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[67],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[788],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[789]
				}
			}
		}
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[771],
		converter = var_0_0[550],
		extraDefinition = var_0_6[45]
	},
	{
		name = "S&SO - RS100 solar io",
		localPairing = true,
		["1"] = {
			["io:DynamicRollerShutterIOComponent"] = {
				type = 1,
				widget = "DynamicRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[787],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[68],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0],
					["io:Features"] = var_0_5[37]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setPositionAndLinearSpeed = var_0_6[422],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = var_0_6[793],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[789],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					setClosureAndLinearSpeed = var_0_6[421],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17]
				}
			}
		},
		["2"] = var_0_6[497]
	},
	{
		name = "S&SO - RS100 solar io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[791],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[68],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[793],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[789]
				}
			}
		}
	},
	{
		rawStateId = "84059666"
	},
	{
		var_0_6[193],
		var_0_6[129],
		var_0_6[796]
	},
	{
		var_0_4[342]
	},
	{
		var_0_6[193],
		var_0_6[129],
		var_0_6[796],
		var_0_6[678]
	},
	{
		name = "Sliding window V1",
		localPairing = true,
		["0"] = {
			["io:PositionableAndLockableSlidingWindowComponent"] = {
				type = 1,
				widget = "PositionableAndLockableSlidingWindow",
				uiClass = "Window",
				uiProfiles = var_0_6[241],
				states = {
					["84059651"] = {
						linkedHighLevelState = {
							var_0_4[74],
							var_0_4[342],
							var_0_4[71],
							var_0_4[72],
							var_0_4[73],
							var_0_4[75]
						},
						linkedStateIds = {
							"65537",
							"84059658",
							"84059666"
						}
					},
					["16832512"] = var_0_6[69],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[342],
							var_0_4[5],
							var_0_4[70]
						},
						linkedStateIds = {
							"65801",
							"84059651",
							"84059658",
							"84059666"
						}
					},
					["84059666"] = {
						linkedHighLevelState = var_0_6[798],
						linkedStateIds = {
							"65537",
							"84059651",
							"84059658"
						}
					},
					["84059658"] = {
						linkedHighLevelState = var_0_6[798],
						linkedStateIds = {
							"65537",
							"84059651",
							"84059666"
						}
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["65546"] = var_0_6[242],
					["2"] = var_0_6[505],
					["65801"] = var_0_6[244],
					["2146500638"] = var_0_6[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[70],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setPosition = var_0_6[248],
					my = var_0_6[240],
					setPositionAndLinearSpeed = var_0_6[249],
					stopIdentify = var_0_6[22],
					deactivateTimer = var_0_6[246],
					lock = var_0_6[247],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[799],
						converter = var_0_0[557],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[19],
					close = var_0_6[237],
					open = var_0_6[238],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[799],
						converter = var_0_0[558],
						extraDefinition = var_0_6[9]
					},
					activateTimer = var_0_6[245],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unlock = var_0_6[250],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					setClosureAndLinearSpeed = var_0_6[239],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					setTimer = var_0_6[196],
					pairOneWayController = var_0_6[17]
				}
			}
		}
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[71],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[509],
		converter = var_0_0[560],
		extraDefinition = var_0_6[45]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		setDeployment = var_0_6[38],
		close = var_0_6[42],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[40],
		setClosure = var_0_6[201],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[802],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[510]
	},
	{
		var_0_4[343]
	},
	{
		linkedHighLevelState = var_0_6[804],
		linkedStateIds = var_0_6[499]
	},
	{
		linkedHighLevelState = var_0_6[804],
		linkedStateIds = var_0_6[502]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[802],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[510]
	},
	{
		["16832512"] = var_0_6[31],
		["84059651"] = var_0_6[805],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[343],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[20]
			},
			linkedStateIds = var_0_6[501]
		},
		["84059661"] = var_0_6[806],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		var_0_4[344]
	},
	{
		"65537",
		"84059657",
		"84059659",
		"84059661"
	},
	{
		linkedHighLevelState = var_0_6[809],
		linkedStateIds = var_0_6[810]
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
			var_0_4[344],
			var_0_4[10]
		},
		linkedStateIds = var_0_6[812]
	},
	{
		"65537",
		"84059651",
		"84059657",
		"84059659"
	},
	{
		linkedHighLevelState = var_0_6[809],
		linkedStateIds = var_0_6[814]
	},
	{
		"65537",
		"84059651",
		"84059659",
		"84059661"
	},
	{
		linkedHighLevelState = var_0_6[809],
		linkedStateIds = var_0_6[816]
	},
	{
		"65537",
		"84059651",
		"84059657",
		"84059661"
	},
	{
		linkedHighLevelState = var_0_6[809],
		linkedStateIds = var_0_6[818]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[72],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		var_0_6[193],
		var_0_6[129],
		var_0_6[508],
		{
			rawStateId = "84059657"
		},
		var_0_6[700]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[821],
		converter = var_0_0[563],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[821],
		converter = var_0_0[564],
		extraDefinition = var_0_6[9]
	},
	{
		var_0_4[345]
	},
	{
		linkedHighLevelState = var_0_6[824],
		linkedStateIds = var_0_6[810]
	},
	{
		linkedHighLevelState = var_0_6[824],
		linkedStateIds = var_0_6[814]
	},
	{
		linkedHighLevelState = var_0_6[824],
		linkedStateIds = var_0_6[816]
	},
	{
		linkedHighLevelState = var_0_6[824],
		linkedStateIds = var_0_6[818]
	},
	{
		["16832512"] = var_0_6[31],
		["84059651"] = var_0_6[825],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[345],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[20]
			},
			linkedStateIds = var_0_6[812]
		},
		["84059661"] = var_0_6[826],
		["84059657"] = var_0_6[827],
		["84059659"] = var_0_6[828],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[822],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[823]
	},
	{
		var_0_4[346]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[73],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		var_0_6[193],
		var_0_6[129],
		var_0_6[677],
		var_0_6[741]
	},
	{
		var_0_4[347]
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
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[74],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		var_0_6[193],
		var_0_6[129],
		var_0_6[677],
		var_0_6[741],
		var_0_6[679]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[840],
		converter = var_0_0[571],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[840],
		converter = var_0_0[572],
		extraDefinition = var_0_6[9]
	},
	{
		var_0_4[348]
	},
	{
		linkedHighLevelState = var_0_6[843],
		linkedStateIds = var_0_6[835]
	},
	{
		linkedHighLevelState = var_0_6[843],
		linkedStateIds = var_0_6[837]
	},
	{
		linkedHighLevelState = var_0_6[843],
		linkedStateIds = var_0_6[672]
	},
	{
		linkedHighLevelState = var_0_6[843],
		linkedStateIds = var_0_6[838]
	},
	{
		["16832512"] = var_0_6[31],
		["84059651"] = var_0_6[844],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[348],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[20]
			},
			linkedStateIds = var_0_6[836]
		},
		["48170496"] = var_0_6[845],
		["48171008"] = var_0_6[846],
		["84059664"] = var_0_6[847],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[841],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[842]
	},
	{
		var_0_4[349]
	},
	{
		linkedHighLevelState = var_0_6[850],
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
			var_0_4[349],
			var_0_4[5],
			var_0_4[12],
			var_0_4[10],
			var_0_4[20]
		},
		linkedStateIds = var_0_6[852]
	},
	{
		linkedHighLevelState = var_0_6[850],
		linkedStateIds = var_0_6[837]
	},
	{
		linkedHighLevelState = var_0_6[850],
		linkedStateIds = {
			"65537",
			"84059651",
			"84059659",
			"84059664"
		}
	},
	{
		linkedHighLevelState = var_0_6[850],
		linkedStateIds = {
			"48171008",
			"65537",
			"84059651",
			"84059659"
		}
	},
	{
		["16832512"] = var_0_6[31],
		["84059651"] = var_0_6[851],
		["65537"] = var_0_6[853],
		["84059659"] = var_0_6[854],
		["48171008"] = var_0_6[855],
		["84059664"] = var_0_6[856],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["65556"] = var_0_6[260],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		var_0_6[193],
		var_0_6[129],
		var_0_6[700],
		var_0_6[741],
		var_0_6[679]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = {
			prototype = "string,object",
			parameters = var_0_6[44],
			rawStates = var_0_6[858],
			converter = var_0_0[574],
			extraDefinition = var_0_6[45]
		},
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = {
			prototype = "string(normal;advanced;custom),*array",
			parameters = var_0_6[8],
			rawStates = var_0_6[858],
			converter = var_0_0[575],
			extraDefinition = var_0_6[9]
		}
	},
	{
		name = "Sunea 40 solar io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenWithBatteryIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[857],
				attributes = var_0_6[839],
				commands = var_0_6[859]
			}
		}
	},
	{
		name = "Sunea 40 solar io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceWithBatteryIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[857],
				attributes = var_0_6[839],
				commands = var_0_6[859]
			}
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[349],
			var_0_4[5],
			var_0_4[12],
			var_0_4[10],
			var_0_4[280]
		},
		linkedStateIds = var_0_6[852]
	},
	{
		name = "Sunea 40 solar io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningWithBatteryIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = var_0_6[851],
					["65537"] = var_0_6[862],
					["84059659"] = var_0_6[854],
					["48171008"] = var_0_6[855],
					["84059664"] = var_0_6[856],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["65556"] = var_0_6[260],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[839],
				commands = var_0_6[859]
			}
		}
	},
	{
		name = "Sunea 40 solar io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningWithBatteryIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = var_0_6[857],
				attributes = var_0_6[839],
				commands = var_0_6[859]
			}
		}
	},
	{
		["16832512"] = var_0_6[31],
		["84059651"] = var_0_6[851],
		["65537"] = var_0_6[853],
		["84059659"] = var_0_6[854],
		["48171008"] = var_0_6[855],
		["84059664"] = var_0_6[856],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		name = "Sunea 40 solar io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[865],
				attributes = var_0_6[839],
				commands = var_0_6[859]
			}
		}
	},
	{
		name = "Sunea 40 solar io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = var_0_6[851],
					["65537"] = var_0_6[862],
					["84059659"] = var_0_6[854],
					["48171008"] = var_0_6[855],
					["84059664"] = var_0_6[856],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[839],
				commands = var_0_6[859]
			}
		}
	},
	{
		name = "Sunea 40 solar io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[865],
				attributes = var_0_6[839],
				commands = var_0_6[859]
			}
		}
	},
	{
		var_0_4[350]
	},
	{
		linkedHighLevelState = var_0_6[869],
		linkedStateIds = var_0_6[737]
	},
	{
		linkedHighLevelState = var_0_6[869],
		linkedStateIds = var_0_6[739]
	},
	{
		linkedHighLevelState = var_0_6[869],
		linkedStateIds = var_0_6[740]
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = var_0_6[870],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[350],
				var_0_4[51],
				var_0_4[10],
				var_0_4[20]
			},
			linkedStateIds = var_0_6[738]
		},
		["48170496"] = var_0_6[871],
		["48171008"] = var_0_6[872],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[742],
		converter = var_0_0[577],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[742],
		converter = var_0_0[578],
		extraDefinition = var_0_6[9]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[742],
		converter = var_0_0[579],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[742],
		converter = var_0_0[580],
		extraDefinition = var_0_6[45]
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = var_0_6[870],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[350],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[20]
			},
			linkedStateIds = var_0_6[738]
		},
		["48170496"] = var_0_6[871],
		["48171008"] = var_0_6[872],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[874],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[875]
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = var_0_6[870],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[350],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[280]
			},
			linkedStateIds = var_0_6[738]
		},
		["48170496"] = var_0_6[871],
		["48171008"] = var_0_6[872],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[876],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[875]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[877],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[875]
	},
	{
		var_0_4[351]
	},
	{
		linkedHighLevelState = var_0_6[883],
		linkedStateIds = var_0_6[737]
	},
	{
		linkedHighLevelState = var_0_6[883],
		linkedStateIds = var_0_6[739]
	},
	{
		linkedHighLevelState = var_0_6[883],
		linkedStateIds = var_0_6[740]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[742],
		converter = var_0_0[582],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[742],
		converter = var_0_0[583],
		extraDefinition = var_0_6[9]
	},
	{
		var_0_4[352]
	},
	{
		linkedHighLevelState = var_0_6[889],
		linkedStateIds = var_0_6[737]
	},
	{
		linkedHighLevelState = var_0_6[889],
		linkedStateIds = var_0_6[739]
	},
	{
		linkedHighLevelState = var_0_6[889],
		linkedStateIds = var_0_6[740]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[742],
		converter = var_0_0[585],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[742],
		converter = var_0_0[586],
		extraDefinition = var_0_6[9]
	},
	{
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[199],
				states = {
					["16832512"] = var_0_6[31],
					["84082687"] = var_0_6[890],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[352],
							var_0_4[51],
							var_0_4[10],
							var_0_4[20]
						},
						linkedStateIds = var_0_6[738]
					},
					["48170496"] = var_0_6[891],
					["48171008"] = var_0_6[892],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[832],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[893],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[894]
				}
			}
		}
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = var_0_6[884],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[351],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[20]
			},
			linkedStateIds = var_0_6[738]
		},
		["48170496"] = var_0_6[885],
		["48171008"] = var_0_6[886],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[887],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[888]
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = var_0_6[890],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[352],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[20]
			},
			linkedStateIds = var_0_6[738]
		},
		["48170496"] = var_0_6[891],
		["48171008"] = var_0_6[892],
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[893],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[894]
	},
	{
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = var_0_6[898],
				attributes = var_0_6[832],
				commands = var_0_6[899]
			}
		}
	},
	{
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[898],
				attributes = var_0_6[832],
				commands = var_0_6[899]
			}
		}
	},
	{
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = {
					["16832512"] = var_0_6[31],
					["84082687"] = var_0_6[890],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[352],
							var_0_4[5],
							var_0_4[12],
							var_0_4[10],
							var_0_4[280]
						},
						linkedStateIds = var_0_6[738]
					},
					["48170496"] = var_0_6[891],
					["48171008"] = var_0_6[892],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[832],
				commands = var_0_6[899]
			}
		}
	},
	{
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[898],
				attributes = var_0_6[832],
				commands = var_0_6[899]
			}
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[353]
		},
		linkedStateIds = var_0_6[243]
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = var_0_6[904],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[353],
				var_0_4[51],
				var_0_4[10],
				var_0_4[20]
			},
			linkedStateIds = var_0_6[524]
		},
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = var_0_5[75],
		["core:Manufacturer"] = var_0_5[1],
		["core:FirmwareRevision"] = var_0_5[0]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[525],
		converter = var_0_0[589],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[525],
		converter = var_0_0[590],
		extraDefinition = var_0_6[9]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[525],
		converter = var_0_0[591],
		extraDefinition = var_0_6[45]
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = var_0_6[904],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[353],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[20]
			},
			linkedStateIds = var_0_6[524]
		},
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[907],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[908]
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = var_0_6[904],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[353],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[280]
			},
			linkedStateIds = var_0_6[524]
		},
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[909],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[908]
	},
	{
		linkedHighLevelState = {
			var_0_4[354]
		},
		linkedStateIds = var_0_6[243]
	},
	{
		prototype = "string,object",
		parameters = var_0_6[44],
		rawStates = var_0_6[525],
		converter = var_0_0[593],
		extraDefinition = var_0_6[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = var_0_6[8],
		rawStates = var_0_6[525],
		converter = var_0_0[594],
		extraDefinition = var_0_6[9]
	},
	{
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[199],
				states = {
					["16832512"] = var_0_6[31],
					["84082687"] = var_0_6[914],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[354],
							var_0_4[51],
							var_0_4[10],
							var_0_4[20]
						},
						linkedStateIds = var_0_6[524]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[906],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[915],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[916]
				}
			}
		}
	},
	{
		["16832512"] = var_0_6[31],
		["84082687"] = var_0_6[914],
		["65537"] = {
			linkedHighLevelState = {
				var_0_4[354],
				var_0_4[5],
				var_0_4[12],
				var_0_4[10],
				var_0_4[20]
			},
			linkedStateIds = var_0_6[524]
		},
		["2147426304"] = var_0_6[4],
		["1"] = var_0_6[3],
		["65557"] = var_0_6[36],
		["2146500645"] = var_0_6[57],
		["16830720"] = var_0_6[35],
		["16832522"] = var_0_6[504],
		["2"] = var_0_6[505],
		["2146500638"] = var_0_6[1]
	},
	{
		setName = var_0_6[20],
		sendIOKey = var_0_6[65],
		keepOneWayControllersAndDeleteNode = var_0_6[61],
		unpairOneWayController = var_0_6[24],
		getName = var_0_6[14],
		unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
		delayedStopIdentify = var_0_6[13],
		identify = var_0_6[15],
		unpairAllOneWayControllers = var_0_6[23],
		setSecuredPosition = var_0_6[53],
		setPosition = var_0_6[48],
		my = var_0_6[51],
		setConfigState = var_0_6[25],
		startIdentify = var_0_6[21],
		stop = var_0_6[63],
		setMemorized1Position = var_0_6[47],
		stopIdentify = var_0_6[22],
		wink = var_0_6[26],
		runManufacturerSettingsCommand = var_0_6[915],
		setClosure = var_0_6[38],
		close = var_0_6[40],
		deploy = var_0_6[40],
		down = var_0_6[40],
		open = var_0_6[42],
		setDeployment = var_0_6[38],
		undeploy = var_0_6[42],
		up = var_0_6[42],
		pairOneWayController = var_0_6[17],
		refreshMemorized1Position = var_0_6[37],
		advancedRefresh = var_0_6[916]
	},
	{
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = var_0_6[918],
				attributes = var_0_6[906],
				commands = var_0_6[919]
			}
		}
	},
	{
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[918],
				attributes = var_0_6[906],
				commands = var_0_6[919]
			}
		}
	},
	{
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = {
					["16832512"] = var_0_6[31],
					["84082687"] = var_0_6[914],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[354],
							var_0_4[5],
							var_0_4[12],
							var_0_4[10],
							var_0_4[280]
						},
						linkedStateIds = var_0_6[524]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[906],
				commands = var_0_6[919]
			}
		}
	},
	{
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[918],
				attributes = var_0_6[906],
				commands = var_0_6[919]
			}
		}
	},
	{
		name = "T3.5 BHZ",
		localPairing = true,
		["0"] = var_0_6[721]
	},
	{
		var_0_4[355]
	}
}

return {
	["0"] = {
		name = "Generic Product",
		localPairing = true,
		["0"] = var_0_6[27]
	},
	["65536"] = {
		name = "Venetian Blind",
		localPairing = true,
		["0"] = {
			["io:VenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableVenetianBlind",
				uiClass = "VenetianBlind",
				uiProfiles = var_0_6[28],
				states = {
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[5],
							var_0_4[7],
							var_0_4[10]
						},
						linkedStateIds = var_0_6[29]
					},
					["2146500638"] = var_0_6[1],
					["16832512"] = var_0_6[31],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[33],
					["65538"] = {
						linkedHighLevelState = {
							var_0_4[9]
						}
					},
					["2147426304"] = var_0_6[4],
					["16830720"] = var_0_6[35],
					["65557"] = var_0_6[36]
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					up = var_0_6[42],
					setClosureAndOrientation = {
						prototype = "integer[0;100],integer[0;100]",
						parameters = var_0_6[44],
						converter = var_0_0[25],
						extraDefinition = var_0_6[45]
					},
					setMemorized1Position = var_0_6[47],
					setName = var_0_6[20],
					setOrientation = {
						prototype = "integer[0;100]",
						parameters = var_0_6[11],
						converter = var_0_0[26],
						extraDefinition = var_0_6[45]
					},
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setSecuredPosition = var_0_6[53],
					startIdentify = var_0_6[21],
					stop = {
						converter = var_0_0[28],
						extraDefinition = var_0_6[45]
					},
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["131072"] = {
		name = "Roller Shutter",
		localPairing = true,
		["0"] = var_0_6[67]
	},
	["131073"] = {
		name = "Roller Shutter VELUX",
		localPairing = true,
		["0"] = {
			["io:RollerShutterVeluxIOComponent"] = {
				type = 1,
				widget = "PositionableTiltedRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[71],
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					setMemorized1Position = var_0_6[47],
					setName = var_0_6[20],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setSecuredPosition = var_0_6[53],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["131074"] = {
		name = "Roller Shutter SOMFY",
		localPairing = true,
		["0"] = var_0_6[67]
	},
	["131328"] = {
		name = "Adjustable Slats Roller Shutter",
		localPairing = true,
		["0"] = var_0_6[86]
	},
	["131330"] = {
		name = "Adj. Slats Roller Shutter SOMFY",
		localPairing = true,
		["0"] = var_0_6[86]
	},
	["131584"] = {
		name = "Projection Roller Shutter",
		localPairing = true,
		["0"] = {
			["io:ProjectionRollerShutterIOComponent"] = {
				type = 1,
				widget = "PositionableProjectionRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = {
					["65537"] = var_0_6[68],
					["2146500638"] = var_0_6[1],
					["16832512"] = var_0_6[69],
					["1"] = var_0_6[3],
					["65546"] = {
						linkedHighLevelState = {
							var_0_4[19]
						}
					},
					["16832522"] = var_0_6[70],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					setClosureAndProjectionAngle = {
						prototype = "integer[0;100],integer[0;100]",
						parameters = var_0_6[44],
						converter = var_0_0[43],
						extraDefinition = var_0_6[45]
					},
					setMemorized1Position = var_0_6[47],
					setName = var_0_6[20],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setProjectionAngle = {
						prototype = "any",
						parameters = var_0_6[11],
						converter = var_0_0[44],
						extraDefinition = var_0_6[45]
					},
					setSecuredPosition = var_0_6[53],
					startIdentify = var_0_6[21],
					stop = {
						converter = var_0_0[45],
						extraDefinition = var_0_6[45]
					},
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["196608"] = {
		name = "Vertical Exterior Awning",
		localPairing = true,
		["0"] = var_0_6[91]
	},
	["196609"] = {
		name = "Vertical Exterior Awning Velux",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningVeluxIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = {
					["65537"] = var_0_6[88],
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[33],
					["2147426304"] = var_0_6[4],
					["16830720"] = var_0_6[35],
					["16832512"] = var_0_6[74],
					["65557"] = var_0_6[36],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[59],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					runManufacturerSettingsCommand = var_0_6[62],
					pairOneWayController = var_0_6[17],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					setName = var_0_6[20],
					setPosition = {
						prototype = "string(secured)|integer[0;100]",
						parameters = var_0_6[11],
						converter = var_0_0[46],
						extraDefinition = var_0_6[18]
					},
					setSecuredPosition = var_0_6[53],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26],
					sendIOKey = var_0_6[65]
				}
			}
		}
	},
	["196610"] = {
		name = "Vertical Exterior Awning SOMFY",
		localPairing = true,
		["0"] = var_0_6[91]
	},
	["262144"] = {
		name = "Window Opener",
		localPairing = true,
		["0"] = {
			["io:WindowOpenerGenericIOComponent"] = {
				type = 1,
				widget = "PositionableWindow",
				uiClass = "Window",
				uiProfiles = var_0_6[92],
				states = var_0_6[93],
				attributes = var_0_6[5],
				commands = var_0_6[94]
			}
		}
	},
	["262145"] = {
		name = "Window Opener VELUX",
		localPairing = true,
		["0"] = var_0_6[95]
	},
	["262401"] = {
		name = "Window Opener with integrated rain sensor VELUX",
		localPairing = true,
		["0"] = var_0_6[95]
	},
	["327680"] = {
		name = "Garage Door Opener",
		localPairing = true,
		["0"] = var_0_6[96]
	},
	["327682"] = {
		name = "Garage Door Opener SOMFY",
		localPairing = true,
		["0"] = var_0_6[96]
	},
	["342528"] = {
		name = "Discrete Garage Door Opener",
		localPairing = true,
		["0"] = var_0_6[100]
	},
	["342530"] = {
		name = "Discrete Garage Door Opener SOMFY",
		localPairing = true,
		["0"] = var_0_6[100]
	},
	["393216"] = {
		name = "Dimmable Light",
		localPairing = true,
		["0"] = var_0_6[115]
	},
	["393218"] = {
		name = "Dimmable Light - Somfy",
		localPairing = true,
		["0"] = var_0_6[115]
	},
	["393471"] = {
		name = "FirstInnov Swimming Pool",
		localPairing = true,
		["0"] = {
			["io:SwimmingPoolIOComponent"] = {
				type = 1,
				widget = "SwimmingPool",
				uiClass = "SwimmingPool",
				uiProfiles = {
					"SwitchableLight",
					"StatefulSwitchable",
					"Switchable"
				},
				states = var_0_6[116],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					setName = var_0_6[20],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = var_0_6[11],
						converter = var_0_0[60],
						extraDefinition = var_0_6[18]
					},
					off = {
						parameters = var_0_6[117],
						converter = var_0_0[60],
						extraDefinition = var_0_6[18]
					},
					on = {
						parameters = var_0_6[118],
						converter = var_0_0[60],
						extraDefinition = var_0_6[18]
					},
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					wink = var_0_6[26]
				}
			}
		}
	},
	["393472"] = {
		name = "Dimmable RGB Light",
		localPairing = true,
		["0"] = var_0_6[127]
	},
	["393474"] = {
		name = "Dimmable RGB Light Somfy",
		localPairing = true,
		["0"] = var_0_6[127]
	},
	["393730"] = {
		name = "Tunable White Receiver",
		localPairing = true,
		["0"] = var_0_6[132]
	},
	["408064"] = {
		name = "On/Off Light",
		localPairing = true,
		["0"] = var_0_6[140]
	},
	["408066"] = {
		name = "On/Off Light - Somfy",
		localPairing = true,
		["0"] = var_0_6[140]
	},
	["2199023663618"] = {
		name = "On/Off Light - Somfy  - With battery status",
		localPairing = true,
		["0"] = {
			["io:OnOffLightMicroModuleSomfyIOComponent"] = var_0_6[139]
		}
	},
	["458752"] = {
		name = "Gate Opener",
		localPairing = true,
		["0"] = var_0_6[148]
	},
	["458754"] = {
		name = "Gate Opener Wardrobe SOMFY",
		localPairing = true,
		["0"] = var_0_6[148]
	},
	["473600"] = {
		name = "Discrete Gate Opener",
		localPairing = true,
		["0"] = var_0_6[152]
	},
	["473602"] = {
		name = "Discrete Gate Opener SOMFY",
		localPairing = true,
		["0"] = var_0_6[152]
	},
	["524288"] = {
		name = "Rolling Door Opener",
		localPairing = true,
		["0"] = var_0_6[155]
	},
	["524290"] = {
		name = "Rolling Door Opener SOMFY",
		localPairing = true,
		["0"] = var_0_6[155]
	},
	["589824"] = {
		name = "Door Lock",
		localPairing = true,
		["0"] = var_0_6[163]
	},
	["589826"] = {
		name = "Door Lock SOMFY",
		localPairing = true,
		["0"] = var_0_6[163]
	},
	["590080"] = {
		name = "Window Lock",
		localPairing = true,
		["0"] = var_0_6[166]
	},
	["590090"] = {
		name = "Window Lock SECUYOU",
		localPairing = true,
		["0"] = var_0_6[166]
	},
	["655360"] = {
		name = "Vertical Blind",
		localPairing = true,
		["0"] = var_0_6[169]
	},
	["655361"] = {
		name = "Blind VELUX",
		localPairing = true,
		["0"] = {
			["io:VerticalInteriorBlindVeluxIOComponent"] = {
				type = 1,
				widget = "PositionableTiltedScreen",
				uiClass = "Screen",
				uiProfiles = var_0_6[167],
				states = var_0_6[71],
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					up = var_0_6[42],
					setMemorized1Position = var_0_6[47],
					setName = var_0_6[20],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setSecuredPosition = var_0_6[53],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["655362"] = {
		name = "Sonesse 40",
		localPairing = true,
		["0"] = var_0_6[169]
	},
	["851968"] = {
		name = "Dual Roller Shutter",
		localPairing = true,
		["0"] = {
			["io:DualRollerShutterIOComponent"] = {
				type = 1,
				widget = "PositionableDualRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = {
					["65537"] = var_0_6[153],
					["2146500638"] = var_0_6[1],
					["65539"] = {
						linkedHighLevelState = {
							var_0_4[38],
							var_0_4[39]
						}
					},
					["16832512"] = var_0_6[69],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[70],
					["2147426304"] = var_0_6[4],
					["65538"] = {
						linkedHighLevelState = {
							var_0_4[40],
							var_0_4[41]
						}
					}
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getClosure = var_0_6[158],
					getLowerClosure = {
						extraDefinition = {
							access = "r",
							parameterId = "65539"
						}
					},
					getName = var_0_6[14],
					getUpperClosure = {
						extraDefinition = {
							access = "r",
							parameterId = "65538"
						}
					},
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					up = var_0_6[42],
					setLowerClosure = var_0_6[170],
					lowerClose = var_0_6[171],
					lowerDown = var_0_6[171],
					lowerOpen = var_0_6[172],
					lowerUp = var_0_6[172],
					setLowerPosition = var_0_6[170],
					setMemorized1Position = var_0_6[47],
					setName = var_0_6[20],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setSecuredPosition = var_0_6[53],
					setUpperAndLowerClosure = var_0_6[173],
					setUpperAndLowerPosition = var_0_6[173],
					setUpperClosure = var_0_6[174],
					upperClose = var_0_6[175],
					upperDown = var_0_6[175],
					upperOpen = var_0_6[176],
					upperUp = var_0_6[176],
					setUpperPosition = var_0_6[174],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["917504"] = {
		name = "Heating Temperature Interface",
		localPairing = true,
		["0"] = {
			["io:HeatingTemperatureInterfaceIOComponent"] = {
				type = 1,
				widget = "HeatingTemperatureInterface",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[177],
				states = {
					["16832527"] = {
						linkedHighLevelState = {
							var_0_4[42],
							var_0_4[45]
						},
						linkedStateIds = {
							"16830720",
							"16832522",
							"16832526",
							"65558",
							"65559"
						}
					},
					["65558"] = {
						linkedHighLevelState = var_0_6[178],
						linkedStateIds = {
							"16830720",
							"16832522",
							"16832526",
							"16832527",
							"65537",
							"65559"
						}
					},
					["65559"] = {
						linkedHighLevelState = var_0_6[178],
						linkedStateIds = {
							"16830720",
							"16832522",
							"16832526",
							"16832527",
							"65537",
							"65558"
						}
					},
					["2146500638"] = var_0_6[1],
					["16832526"] = {
						linkedHighLevelState = {
							var_0_4[43],
							var_0_4[45]
						},
						linkedStateIds = {
							"16830720",
							"16832522",
							"16832527",
							"65558",
							"65559"
						}
					},
					["1"] = var_0_6[3],
					["16832522"] = {
						linkedHighLevelState = {
							var_0_4[44],
							var_0_4[45]
						},
						linkedStateIds = {
							"16830720",
							"16832526",
							"16832527",
							"65558",
							"65559"
						}
					},
					["2147426304"] = var_0_6[4],
					["16830720"] = {
						linkedHighLevelState = {
							var_0_4[45],
							var_0_4[47]
						},
						linkedStateIds = {
							"16832522",
							"16832526",
							"16832527",
							"65558",
							"65559"
						}
					},
					["65537"] = var_0_6[179]
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					refreshActiveMode = {
						extraDefinition = {
							access = "r",
							parameterId = "65546"
						}
					},
					refreshComfortTemperature = var_0_6[180],
					refreshEcoTemperature = var_0_6[181],
					refreshSecuredPositionTemperature = {
						extraDefinition = {
							access = "r",
							parameterId = "16832522"
						}
					},
					refreshTemperature = var_0_6[158],
					refreshSetPointMode = var_0_6[158],
					refreshTargetTemperature = var_0_6[158],
					setActiveAndSetPointModes = {
						prototype = "any,any",
						parameters = var_0_6[44],
						rawStates = var_0_6[182],
						converter = var_0_0[93],
						extraDefinition = var_0_6[45]
					},
					setActiveMode = {
						prototype = "any",
						parameters = var_0_6[11],
						rawStates = {
							{
								rawStateId = "16830720"
							}
						},
						converter = var_0_0[94],
						extraDefinition = var_0_6[45]
					},
					setComfortTemperature = var_0_6[184],
					setEcoTemperature = {
						prototype = "any",
						parameters = var_0_6[11],
						rawStates = var_0_6[182],
						converter = var_0_0[95],
						extraDefinition = var_0_6[185]
					},
					setName = var_0_6[20],
					setOperatingMode = {
						prototype = "any",
						parameters = var_0_6[11],
						converter = var_0_0[96],
						extraDefinition = var_0_6[45]
					},
					setSecuredPosition = {
						prototype = "integer[0;100]",
						parameters = var_0_6[11],
						rawStates = var_0_6[182],
						converter = var_0_0[95],
						extraDefinition = var_0_6[52]
					},
					setSecuredPositionTemperature = {
						prototype = "any",
						parameters = var_0_6[11],
						rawStates = var_0_6[182],
						converter = var_0_0[95],
						extraDefinition = var_0_6[52]
					},
					setSetPointMode = {
						prototype = "any",
						parameters = var_0_6[11],
						rawStates = var_0_6[182],
						converter = var_0_0[97],
						extraDefinition = var_0_6[45]
					},
					setTargetTemperature = {
						prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
						parameters = var_0_6[11],
						rawStates = var_0_6[182],
						converter = var_0_0[97],
						extraDefinition = var_0_6[45]
					},
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["983040"] = {
		name = "Switch On/Off",
		localPairing = true,
		["0"] = {
			["io:OnOffIOComponent"] = {
				type = 1,
				widget = "StatefulOnOff",
				uiClass = "OnOff",
				uiProfiles = {
					"StatefulSwitchablePlug",
					"StatefulSwitchable",
					"Switchable"
				},
				states = var_0_6[116],
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					onWithTimer = {
						prototype = "integer[5;14400]",
						parameters = var_0_6[11],
						converter = var_0_0[98],
						extraDefinition = var_0_6[18]
					},
					pairOneWayController = var_0_6[17],
					setName = var_0_6[20],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = var_0_6[11],
						converter = var_0_0[99],
						extraDefinition = var_0_6[18]
					},
					off = {
						parameters = var_0_6[117],
						converter = var_0_0[99],
						extraDefinition = var_0_6[18]
					},
					on = {
						parameters = var_0_6[118],
						converter = var_0_0[99],
						extraDefinition = var_0_6[18]
					},
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["983552"] = {
		name = "Switch On/Off - micromodule",
		localPairing = true,
		["0"] = {
			["io:SwitchMicroModuleIOComponent"] = {
				type = 1,
				widget = "TimedOnOff",
				uiClass = "OnOff",
				uiProfiles = var_0_6[133],
				states = {
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["65537"] = var_0_6[134],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					onWithInternalTimer = var_0_6[186],
					onWithTimer = var_0_6[187],
					pairOneWayController = var_0_6[17],
					setName = var_0_6[20],
					setOnOff = var_0_6[188],
					off = var_0_6[189],
					on = var_0_6[190],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["983554"] = {
		name = "Light On/Off - micromodule SOMFY",
		localPairing = true,
		["0"] = {
			["io:LightMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "TimedOnOffLight",
				uiClass = "Light",
				uiProfiles = var_0_6[133],
				states = var_0_6[192],
				attributes = var_0_6[59],
				commands = var_0_6[198]
			}
		}
	},
	["1048576"] = {
		name = "Horizontal Awning",
		localPairing = true,
		["0"] = var_0_6[203]
	},
	["1048832"] = {
		name = "Pergola Rail Guided Awning",
		localPairing = true,
		["0"] = var_0_6[205]
	},
	["2199023648770"] = {
		name = "Dimmable Light - micromodule SOMFY",
		localPairing = true,
		["0"] = {
			["io:DimmableLightMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "DimmerLight",
				uiClass = "Light",
				uiProfiles = var_0_6[101],
				states = {
					["2146500638"] = var_0_6[1],
					["65537"] = var_0_6[102],
					["1"] = var_0_6[3],
					["2147426304"] = var_0_6[4],
					["16832512"] = var_0_6[103],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[59],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					runManufacturerSettingsCommand = var_0_6[62],
					pairOneWayController = var_0_6[17],
					setName = var_0_6[20],
					setIntensity = var_0_6[104],
					off = var_0_6[105],
					on = var_0_6[106],
					setOnOff = var_0_6[107],
					setIntensityWithTimer = var_0_6[109],
					onWithTimer = var_0_6[110],
					setMemorized1Position = var_0_6[111],
					refreshMemorized1Position = var_0_6[37],
					setPosition = var_0_6[112],
					my = var_0_6[113],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					unpairOneWayController = var_0_6[24],
					wink = var_0_6[26],
					setConfigState = var_0_6[25],
					increaseIntensityForBoundConfiguration = var_0_6[208],
					decreaseIntensityForBoundConfiguration = var_0_6[209],
					saveBound = var_0_6[210],
					sendIOKey = var_0_6[65]
				}
			}
		}
	},
	["1048834"] = {
		name = "Pergola Rail Guided Awning SOMFY",
		localPairing = true,
		["0"] = var_0_6[205]
	},
	["1114112"] = {
		name = "Exterior Venetian Blind",
		localPairing = true,
		["0"] = var_0_6[218]
	},
	["1179648"] = {
		name = "Louver Blind",
		localPairing = true,
		["0"] = var_0_6[27]
	},
	["1245184"] = {
		name = "Curtain track",
		localPairing = true,
		["0"] = var_0_6[27]
	},
	["1310720"] = {
		name = "Ventilation point",
		localPairing = true,
		["0"] = {
			["io:VentilationPointIOComponent"] = var_0_6[220]
		}
	},
	["1310976"] = {
		name = "Ventilation Inlet",
		localPairing = true,
		["0"] = {
			["io:VentilationPointAirInletIOComponent"] = var_0_6[220]
		}
	},
	["1311232"] = {
		name = "Ventilation Transfer",
		localPairing = true,
		["0"] = {
			["io:VentilationPointAirTransferIOComponent"] = {
				type = 1,
				widget = "VentilationTransfer",
				uiClass = "VentilationSystem",
				uiProfiles = var_0_6[219],
				states = {
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[54]
						}
					},
					["2146500638"] = var_0_6[1],
					["16832512"] = var_0_6[69],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[70],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					setAirTransfer = var_0_6[38],
					off = var_0_6[42],
					on = var_0_6[40],
					setName = var_0_6[20],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["1311488"] = {
		name = "Ventilation Outlet",
		localPairing = true,
		["0"] = {
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
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[55],
							var_0_4[56]
						}
					},
					["2146500638"] = var_0_6[1],
					["16832512"] = var_0_6[69],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[70],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					setAirOutput = var_0_6[38],
					off = var_0_6[42],
					on = var_0_6[40],
					setName = var_0_6[20],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["1376256"] = {
		name = "Exterior Heating",
		localPairing = true,
		["0"] = var_0_6[27]
	},
	["1376258"] = {
		name = "Exterior Heating SOMFY",
		localPairing = true,
		["0"] = {
			["io:ExteriorHeatingIOComponent"] = var_0_6[227]
		}
	},
	["1391106"] = {
		name = "Discrete Exterior Heating SOMFY",
		localPairing = true,
		["0"] = var_0_6[231]
	},
	["1441792"] = {
		name = "Heat Pump",
		localPairing = true,
		["0"] = {
			["io:HeatPumpIOComponent"] = {
				type = 1,
				widget = "HeatPump",
				uiClass = "HeatPumpSystem",
				uiProfiles = var_0_6[177],
				states = {
					["16832527"] = {
						linkedHighLevelState = {
							var_0_4[58]
						}
					},
					["2146500638"] = var_0_6[1],
					["16832530"] = {
						linkedHighLevelState = {
							var_0_4[59]
						}
					},
					["16832531"] = {
						linkedHighLevelState = {
							var_0_4[60]
						}
					},
					["1"] = var_0_6[3],
					["65545"] = {
						linkedHighLevelState = {
							var_0_4[61]
						}
					},
					["16832526"] = {
						linkedHighLevelState = {
							var_0_4[62]
						}
					},
					["2147426304"] = var_0_6[4],
					["16830720"] = {
						linkedHighLevelState = {
							var_0_4[63],
							var_0_4[64]
						}
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[65]
						}
					},
					["65553"] = {
						linkedHighLevelState = {
							var_0_4[66]
						}
					},
					["65552"] = {
						linkedHighLevelState = {
							var_0_4[67]
						}
					}
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					refreshActiveModes = var_0_6[233],
					refreshComfortTemperature = var_0_6[180],
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
					refreshSetBackTemperature = var_0_6[181],
					refreshTargetTemperature = var_0_6[158],
					refreshTemperature = var_0_6[158],
					setActiveMode = {
						prototype = "any",
						parameters = var_0_6[11],
						converter = var_0_0[123],
						extraDefinition = var_0_6[45]
					},
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[11],
						converter = var_0_0[124],
						extraDefinition = var_0_6[183]
					},
					setEcoTemperature = {
						prototype = "any",
						parameters = var_0_6[11],
						converter = var_0_0[124],
						extraDefinition = var_0_6[234]
					},
					setName = var_0_6[20],
					setSetBackTemperature = {
						prototype = "any",
						parameters = var_0_6[11],
						converter = var_0_0[124],
						extraDefinition = var_0_6[185]
					},
					setTargetTemperature = {
						prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
						parameters = var_0_6[11],
						converter = var_0_0[124],
						extraDefinition = var_0_6[18]
					},
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["1507328"] = {
		name = "Alarm System",
		localPairing = true,
		["0"] = {
			["io:AlarmIOComponent"] = {
				type = 1,
				widget = "StatefulAlarmController",
				uiClass = "Alarm",
				uiProfiles = {
					"Alarm"
				},
				states = {
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[68]
						}
					},
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					alarmOff = var_0_6[99],
					disarm = var_0_6[99],
					alarmOn = var_0_6[98],
					arm = var_0_6[98],
					alarmZoneOn = {
						prototype = "string(A;B;C;A\\,B;B\\,C;A\\,C;A\\,B\\,C)",
						parameters = var_0_6[11],
						converter = var_0_0[126],
						extraDefinition = var_0_6[18]
					},
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					refreshState = var_0_6[158],
					setName = var_0_6[20],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["1572864"] = {
		name = "Swinging Shutters",
		localPairing = true,
		["0"] = var_0_6[27]
	},
	["1572866"] = {
		name = "Swinging Shutter Somfy",
		localPairing = true,
		["0"] = {
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
					["65537"] = var_0_6[153],
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["2147426304"] = var_0_6[4],
					["16832512"] = var_0_6[69],
					["16832522"] = var_0_6[70],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[59],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					runManufacturerSettingsCommand = var_0_6[62],
					pairOneWayController = var_0_6[17],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					open = var_0_6[42],
					setName = var_0_6[20],
					setPosition = {
						prototype = "string(my;memorized1;secured)|integer[0;100]",
						parameters = var_0_6[11],
						converter = var_0_0[127],
						extraDefinition = var_0_6[18]
					},
					my = {
						parameters = var_0_6[50],
						converter = var_0_0[127],
						extraDefinition = var_0_6[18]
					},
					setMemorized1Position = var_0_6[47],
					refreshMemorized1Position = var_0_6[37],
					setSecuredPosition = var_0_6[53],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					stop = var_0_6[235],
					sendIOKey = var_0_6[65]
				}
			}
		}
	},
	["1587714"] = {
		name = "Discrete Swinging Shutter Somfy",
		localPairing = true,
		["0"] = {
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
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[7]
						}
					},
					["2147426304"] = var_0_6[4],
					["16832512"] = var_0_6[69],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[59],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					runManufacturerSettingsCommand = var_0_6[62],
					pairOneWayController = var_0_6[17],
					close = var_0_6[98],
					open = var_0_6[99],
					my = var_0_6[236],
					startIdentify = var_0_6[21],
					setName = var_0_6[20],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					setMemorized1Position = var_0_6[47],
					refreshMemorized1Position = var_0_6[37],
					stop = var_0_6[235],
					sendIOKey = var_0_6[65]
				}
			}
		}
	},
	["1573120"] = {
		name = "Independant Swinging Shutters",
		localPairing = true,
		["0"] = var_0_6[27]
	},
	["1769472"] = {
		name = "Sliding Window",
		localPairing = true,
		["0"] = {
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
					["16832512"] = var_0_6[69],
					["65537"] = var_0_6[153],
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					setClosure = var_0_6[19],
					close = var_0_6[237],
					open = var_0_6[238],
					setClosureAndLinearSpeed = var_0_6[239],
					setName = var_0_6[20],
					setPosition = {
						prototype = "string(my)|integer[0;100]",
						parameters = var_0_6[11],
						converter = var_0_0[131],
						extraDefinition = var_0_6[18]
					},
					my = var_0_6[240],
					setPositionAndLinearSpeed = {
						prototype = "string(my)|integer[0;100],*string(lowspeed)",
						parameters = var_0_6[8],
						converter = var_0_0[132],
						extraDefinition = var_0_6[45]
					},
					setMemorized1Position = var_0_6[47],
					refreshMemorized1Position = var_0_6[37],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["1769730"] = {
		name = "Sliding Window with lock SOMFY",
		localPairing = true,
		["0"] = var_0_6[251]
	},
	["2199025025282"] = {
		name = "Sliding Air Window io Portability Step 1",
		localPairing = true,
		["0"] = var_0_6[251]
	},
	["1900544"] = {
		name = "Bioclimatic Pergola",
		localPairing = true,
		["0"] = var_0_6[258]
	},
	["1900546"] = {
		name = "Bioclimatic Pergola Somfy",
		localPairing = true,
		["0"] = var_0_6[258]
	},
	["1966080"] = {
		name = "Siren",
		localPairing = true,
		["0"] = {
			["io:SirenIOComponent"] = {
				type = 1,
				widget = "IOSiren",
				uiClass = "Siren",
				uiProfiles = var_0_6[259],
				states = {
					["65556"] = var_0_6[260],
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["16830720"] = var_0_6[261],
					["2147426304"] = var_0_6[4],
					["io:MemorizedVolumeState"] = {
						linkedHighLevelState = {
							var_0_4[83]
						}
					}
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					off = var_0_6[262],
					stop = var_0_6[262],
					pairOneWayController = var_0_6[17],
					ringWithDoubleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default)",
						parameters = {
							var_0_6[6],
							var_0_6[43],
							var_0_6[122],
							var_0_6[124],
							var_0_6[263],
							var_0_6[264],
							var_0_6[265],
							var_0_6[266],
							var_0_6[267],
							var_0_6[268]
						},
						rawStates = var_0_6[269],
						converter = var_0_0[152],
						extraDefinition = var_0_6[45]
					},
					ringWithSingleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default)",
						parameters = {
							var_0_6[6],
							var_0_6[43],
							var_0_6[122],
							var_0_6[124],
							var_0_6[263]
						},
						rawStates = var_0_6[269],
						converter = var_0_0[153],
						extraDefinition = var_0_6[45]
					},
					ring = {
						parameters = {
							var_0_6[270],
							var_0_6[271],
							var_0_6[272],
							var_0_6[273],
							{
								value = "noVisualEffect",
								name = "p5"
							}
						},
						rawStates = var_0_6[269],
						converter = var_0_0[153],
						extraDefinition = var_0_6[45]
					},
					ringWithThreeSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default)",
						parameters = {
							var_0_6[6],
							var_0_6[43],
							var_0_6[122],
							var_0_6[124],
							var_0_6[263],
							var_0_6[264],
							var_0_6[265],
							var_0_6[266],
							var_0_6[267],
							var_0_6[268],
							var_0_6[274],
							var_0_6[275],
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
						rawStates = var_0_6[269],
						converter = var_0_0[154],
						extraDefinition = var_0_6[45]
					},
					setMemorizedVolume = {
						prototype = "string(default;highest;lowest;noSound;standard)",
						parameters = var_0_6[11],
						converter = var_0_0[155],
						extraDefinition = var_0_6[276]
					},
					setName = var_0_6[20],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["1966082"] = {
		name = "Indoor Siren SOMFY",
		localPairing = true,
		["0"] = {
			["io:SomfyIndoorSimpleSirenIOComponent"] = {
				type = 1,
				widget = "IOSiren",
				uiClass = "Siren",
				uiProfiles = var_0_6[259],
				states = {
					["65556"] = var_0_6[260],
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["16830720"] = var_0_6[261],
					["2147426304"] = var_0_6[4],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57],
					["io:MemorizedVolumeState"] = {
						linkedHighLevelState = {
							var_0_4[84]
						}
					}
				},
				attributes = var_0_6[59],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					runManufacturerSettingsCommand = var_0_6[62],
					off = var_0_6[262],
					stop = var_0_6[262],
					pairOneWayController = var_0_6[17],
					ringWithDoubleSimpleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume)",
						parameters = {
							var_0_6[6],
							var_0_6[43],
							var_0_6[122],
							var_0_6[124],
							var_0_6[263],
							var_0_6[264],
							var_0_6[265],
							var_0_6[266]
						},
						rawStates = var_0_6[269],
						converter = var_0_0[156],
						extraDefinition = var_0_6[45]
					},
					ringWithSingleSimpleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume)",
						parameters = var_0_6[125],
						rawStates = var_0_6[269],
						converter = var_0_0[157],
						extraDefinition = var_0_6[45]
					},
					ring = {
						parameters = {
							var_0_6[270],
							var_0_6[271],
							var_0_6[272],
							var_0_6[273]
						},
						rawStates = var_0_6[269],
						converter = var_0_0[157],
						extraDefinition = var_0_6[45]
					},
					ringWithThreeSimpleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume)",
						parameters = {
							var_0_6[6],
							var_0_6[43],
							var_0_6[122],
							var_0_6[124],
							var_0_6[263],
							var_0_6[264],
							var_0_6[265],
							var_0_6[266],
							var_0_6[267],
							var_0_6[268],
							var_0_6[274],
							var_0_6[275]
						},
						rawStates = var_0_6[269],
						converter = var_0_0[158],
						extraDefinition = var_0_6[45]
					},
					setMemorizedSimpleVolume = {
						prototype = "string(highest;standard)",
						parameters = var_0_6[11],
						converter = var_0_0[155],
						extraDefinition = var_0_6[276]
					},
					setName = var_0_6[20],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26],
					sendIOKey = var_0_6[65]
				}
			}
		}
	},
	["3342348"] = {
		name = "Domestic hot water production (Atlantic V2)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2IOComponent"] = var_0_6[355]
		},
		["2"] = var_0_6[358]
	},
	["3407872"] = {
		name = "Electrical heater",
		localPairing = true,
		["0"] = {
			["io:ElectricalHeaterGenericIOComponent"] = {
				type = 1,
				widget = "ElectricalHeater",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[359],
				states = {
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["16830720"] = var_0_6[360],
					["2147426304"] = var_0_6[4],
					["65547"] = var_0_6[361],
					["65548"] = var_0_6[362]
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					cancelHeatingLevel = var_0_6[363],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					refreshHeatingLevel = var_0_6[158],
					setHeatingLevel = var_0_6[364],
					off = var_0_6[365],
					setHeatingLevelWithTimer = var_0_6[366],
					setName = var_0_6[20],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["3407884"] = {
		name = "Electrical heater (Atlantic)",
		localPairing = true,
		["0"] = {
			["io:AtlanticElectricalHeaterIOComponent"] = {
				type = 1,
				widget = "AtlanticElectricalHeater",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[359],
				states = {
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["16830720"] = var_0_6[360],
					["2147426304"] = var_0_6[4],
					["65547"] = var_0_6[361],
					["65548"] = var_0_6[362],
					["core:AbsenceModeState"] = {
						linkedHighLevelState = {
							var_0_4[127]
						}
					}
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					cancelHeatingLevel = var_0_6[363],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					refreshHeatingLevel = var_0_6[158],
					setHeatingLevel = var_0_6[364],
					off = var_0_6[365],
					setHeatingLevelForTrigger = {
						prototype = "any",
						parameters = var_0_6[11],
						converter = var_0_0[208],
						extraDefinition = var_0_6[45]
					},
					setHeatingLevelWithTimer = var_0_6[366],
					setName = var_0_6[20],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					wink = var_0_6[26]
				}
			}
		}
	},
	["3473420"] = {
		localPairing = true,
		name = "Heat Recovery Ventilation (Atlantic)",
		["1"] = {
			["io:AtlanticHeatRecoveryVentilationIOComponent"] = {
				type = 1,
				widget = "AtlanticHeatRecoveryVentilation",
				uiClass = "VentilationSystem",
				uiProfiles = var_0_6[367],
				states = {
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[128]
						}
					},
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["218040320"] = {
						linkedHighLevelState = {
							var_0_4[129],
							var_0_4[134],
							var_0_4[135],
							var_0_4[136],
							var_0_4[137]
						}
					},
					["2147426304"] = var_0_6[4],
					["218041600"] = {
						linkedHighLevelState = {
							var_0_4[130]
						}
					},
					["16830720"] = {
						linkedHighLevelState = {
							var_0_4[131]
						}
					},
					["84672513"] = {
						linkedHighLevelState = {
							var_0_4[132]
						}
					},
					["84672514"] = {
						linkedHighLevelState = {
							var_0_4[133]
						}
					},
					["218040576"] = {
						linkedHighLevelState = {
							var_0_4[138]
						}
					},
					["65553"] = {
						linkedHighLevelState = {
							var_0_4[139]
						}
					},
					["218040064"] = {
						linkedHighLevelState = {
							var_0_4[140]
						}
					}
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					refreshCO2History = {
						converter = var_0_0[222],
						extraDefinition = var_0_6[368]
					},
					refreshEnergySaving = {
						converter = var_0_0[223],
						extraDefinition = var_0_6[368]
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
						converter = var_0_0[188],
						extraDefinition = var_0_6[232]
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
							var_0_6[206],
							var_0_6[7],
							var_0_6[108]
						},
						converter = var_0_0[224],
						extraDefinition = {
							access = "w",
							parameterId = "218041088"
						}
					},
					setAirDemandMode = {
						prototype = "any",
						parameters = var_0_6[11],
						converter = var_0_0[225],
						extraDefinition = var_0_6[18]
					},
					setName = var_0_6[20],
					setTimeProgram = {
						prototype = "any",
						parameters = var_0_6[11],
						converter = var_0_0[226],
						extraDefinition = {
							access = "w",
							parameterId = "218041856"
						}
					},
					setVentilationConfigurationMode = {
						prototype = "any",
						parameters = var_0_6[11],
						converter = var_0_0[227],
						extraDefinition = var_0_6[45]
					},
					setVentilationMode = {
						prototype = "any",
						parameters = var_0_6[11],
						converter = var_0_0[228],
						extraDefinition = {
							access = "w",
							parameterId = "218040064"
						}
					},
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					wink = var_0_6[26]
				}
			}
		},
		["2"] = {
			["io:CO2IOSystemDeviceSensor"] = {
				type = 2,
				widget = "CO2Sensor",
				uiClass = "AirSensor",
				uiProfiles = var_0_6[369],
				states = {
					["218040576"] = {
						linkedHighLevelState = {
							var_0_4[141]
						}
					},
					["2147426304"] = var_0_6[4]
				},
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:PowerSourceType"] = var_0_5[3]
				}
			}
		},
		["3"] = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[370],
				states = {
					["2147426304"] = var_0_6[4],
					["218040576"] = {
						linkedHighLevelState = {
							var_0_4[142]
						}
					}
				},
				attributes = var_0_6[371]
			}
		},
		["4"] = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[370],
				states = {
					["2147426304"] = var_0_6[4],
					["218040576"] = {
						linkedHighLevelState = {
							var_0_4[143]
						}
					}
				},
				attributes = var_0_6[371]
			}
		},
		["5"] = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[370],
				states = {
					["2147426304"] = var_0_6[4],
					["218040576"] = {
						linkedHighLevelState = {
							var_0_4[144]
						}
					}
				},
				attributes = var_0_6[371]
			}
		},
		["6"] = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[370],
				states = {
					["2147426304"] = var_0_6[4],
					["218040576"] = {
						linkedHighLevelState = {
							var_0_4[145]
						}
					}
				},
				attributes = var_0_6[371]
			}
		},
		["7"] = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = var_0_6[370],
				states = {
					["2147426304"] = var_0_6[4],
					["218040576"] = {
						linkedHighLevelState = {
							var_0_4[146]
						}
					}
				},
				attributes = var_0_6[371]
			}
		}
	},
	["16711691"] = {
		name = "Gateway RSOverkiz",
		localPairing = true,
		["0"] = {
			["io:RSOverkizIOComponent"] = {
				type = 1,
				widget = "unknown",
				uiClass = "Generic",
				uiProfiles = var_0_6[367],
				states = {
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					setName = var_0_6[20],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26]
				}
			}
		}
	},
	["4295032832"] = {
		name = "Light Inside Sensor",
		localPairing = true,
		["0"] = var_0_6[376]
	},
	["4295098368"] = {
		name = "Temperature Inside Sensor",
		localPairing = true,
		["0"] = var_0_6[378]
	},
	["4295163904"] = {
		name = "Temperature Outside Sensor",
		localPairing = true,
		["0"] = var_0_6[378]
	},
	["4295229440"] = {
		name = "Wind Sensor",
		localPairing = true,
		["0"] = {
			["io:WindIOSystemSensor"] = {
				type = 2,
				widget = "WindSpeedSensor",
				uiClass = "WindSensor",
				uiProfiles = {
					"WindSpeed"
				},
				states = {
					["2146500638"] = var_0_6[1],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4],
					["2415919106"] = {
						linkedHighLevelState = {
							var_0_4[150]
						}
					}
				},
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:PowerSourceType"] = var_0_5[9],
					["core:MeasuredValueType"] = var_0_5[11]
				},
				commands = var_0_6[375]
			}
		}
	},
	["4295360512"] = {
		name = "Sun Energy Outside Sensor",
		localPairing = true,
		["0"] = {
			["io:SunEnergyIOSystemSensor"] = {
				type = 2,
				widget = "SunEnergySensor",
				uiClass = "SunSensor",
				uiProfiles = var_0_6[367],
				states = {
					["2146500638"] = var_0_6[1],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4],
					["2415919106"] = {
						linkedHighLevelState = {
							var_0_4[151]
						}
					}
				},
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:PowerSourceType"] = var_0_5[9],
					["core:MeasuredValueType"] = var_0_5[12]
				},
				commands = var_0_6[375]
			}
		}
	},
	["4295426048"] = {
		name = "Relative Humidity Inside Sensor",
		localPairing = true,
		["0"] = var_0_6[381]
	},
	["4295491584"] = {
		name = "Relative Humidity Outside Sensor",
		localPairing = true,
		["0"] = var_0_6[381]
	},
	["4295557120"] = {
		name = "CO2 Sensor",
		localPairing = true,
		["0"] = {
			["io:CO2IOSystemSensor"] = {
				type = 2,
				widget = "CO2Sensor",
				uiClass = "AirSensor",
				uiProfiles = var_0_6[369],
				states = {
					["2415919106"] = {
						linkedHighLevelState = {
							var_0_4[153]
						}
					},
					["2146500638"] = var_0_6[1],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[382],
				commands = var_0_6[375]
			}
		}
	},
	["4295622656"] = {
		name = "CO Sensor",
		localPairing = true,
		["0"] = {
			["io:COIOSystemSensor"] = {
				type = 2,
				widget = "COSensor",
				uiClass = "AirSensor",
				uiProfiles = {
					"COConcentration"
				},
				states = {
					["2415919106"] = {
						linkedHighLevelState = {
							var_0_4[154]
						}
					},
					["2146500638"] = var_0_6[1],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[382],
				commands = var_0_6[375]
			}
		}
	},
	["4295688192"] = {
		name = "Light Outside Sensor",
		localPairing = true,
		["0"] = var_0_6[376]
	},
	["4295753728"] = {
		name = "Cumulated Gas Consumption Sensor",
		localPairing = true,
		["1"] = {
			["io:GasHeaterConsumptionSensor"] = {
				type = 2,
				widget = "GasHeaterConsumptionSensor",
				uiClass = "GasSensor",
				uiProfiles = var_0_6[383],
				states = var_0_6[385],
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:PeopleCount"] = var_0_5[15],
					["core:UsedForCooking"] = var_0_5[16],
					["core:UsedForDHW"] = var_0_5[17],
					["core:PowerSourceType"] = var_0_5[9],
					["core:GasThermalEfficiency"] = var_0_5[18],
					["core:MeasurementCategory"] = var_0_5[19],
					["core:MeasuredValueType"] = var_0_5[20]
				},
				commands = var_0_6[388]
			}
		},
		["2"] = {
			["io:GasDHWConsumptionSensor"] = {
				type = 2,
				widget = "GasDHWConsumptionSensor",
				uiClass = "GasSensor",
				uiProfiles = var_0_6[383],
				states = var_0_6[385],
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:PeopleCount"] = var_0_5[15],
					["core:UsedForCooking"] = var_0_5[16],
					["core:UsedForDHW"] = var_0_5[17],
					["core:PowerSourceType"] = var_0_5[9],
					["core:GasThermalEfficiency"] = var_0_5[18],
					["core:MeasurementCategory"] = var_0_5[21],
					["core:MeasuredValueType"] = var_0_5[20]
				},
				commands = var_0_6[388]
			}
		}
	},
	["4295819264"] = {
		name = "Cumulated Water Consumption Sensor",
		localPairing = true,
		["0"] = {
			["io:CumulatedWaterConsumptionIOSystemSensor"] = {
				type = 2,
				widget = "CumulativeWaterConsumptionSensor",
				uiClass = "WaterSensor",
				uiProfiles = {
					"WaterConsumption"
				},
				states = {
					["2146500638"] = var_0_6[1],
					["2415919105"] = var_0_6[384],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4],
					["83935248"] = {
						linkedHighLevelState = {
							var_0_4[157]
						}
					}
				},
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:PowerSourceType"] = var_0_5[9],
					["core:MeasuredValueType"] = var_0_5[20]
				},
				commands = var_0_6[388]
			}
		}
	},
	["4295884800"] = {
		name = "Cumulated Thermal Energy Consumption Sensor",
		localPairing = true,
		["0"] = {
			["io:CumulatedThermalEnergyConsumptionIOSystemSensor"] = {
				type = 2,
				widget = "CumulativeThermalEnergyConsumptionSensor",
				uiClass = "ThermalEnergySensor",
				uiProfiles = {
					"ThermalEnergyConsumption"
				},
				states = {
					["2146500638"] = var_0_6[1],
					["2415919105"] = var_0_6[384],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4],
					["83935248"] = {
						linkedHighLevelState = {
							var_0_4[158]
						}
					}
				},
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:PowerSourceType"] = var_0_5[9],
					["core:MeasuredValueType"] = var_0_5[4]
				},
				commands = var_0_6[388]
			}
		}
	},
	["4295950336"] = {
		name = "Cumulated Electrical Energy Consumption Sensor",
		localPairing = true,
		["0"] = {
			["io:CumulatedElectricalEnergyConsumptionIOSystemSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = var_0_6[356],
				states = {
					["2146500638"] = var_0_6[1],
					["83935248"] = {
						linkedHighLevelState = {
							var_0_4[159]
						}
					},
					["2415919105"] = var_0_6[384],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[357],
				commands = var_0_6[388]
			}
		}
	},
	["4295950348"] = {
		name = "Multi-Energy Consumption Sensor - GMDE (Atlantic)",
		localPairing = true,
		["1"] = {
			["io:TotalElectricalEnergyConsumptionIOSystemSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = var_0_6[356],
				states = {
					["2146500638"] = var_0_6[1],
					["83902467"] = {
						linkedHighLevelState = {
							var_0_4[160]
						}
					},
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4]
				},
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:MeasurementCategory"] = var_0_5[22],
					["core:PowerSourceType"] = var_0_5[3],
					["core:MeasuredValueType"] = var_0_5[4]
				},
				commands = {
					advancedRefresh = {
						prototype = "string(normal;advanced)",
						parameters = var_0_6[11],
						extraDefinition = {
							access = "r",
							parameterId = "83902467"
						}
					}
				}
			}
		},
		["2"] = {
			["io:HeatingElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = var_0_6[356],
				states = {
					["83902466"] = {
						linkedHighLevelState = var_0_6[389],
						linkedStateIds = var_0_6[390]
					},
					["83902467"] = {
						linkedHighLevelState = var_0_6[389],
						linkedStateIds = var_0_6[391]
					},
					["2146500638"] = var_0_6[1],
					["2415919105"] = var_0_6[384],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4]
				},
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:MeasurementCategory"] = var_0_5[23],
					["core:PowerSourceType"] = var_0_5[3],
					["core:MeasuredValueType"] = var_0_5[4]
				},
				commands = var_0_6[393]
			}
		},
		["3"] = {
			["io:DHWElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = var_0_6[356],
				states = {
					["83902466"] = {
						linkedHighLevelState = var_0_6[394],
						linkedStateIds = var_0_6[390]
					},
					["83902467"] = {
						linkedHighLevelState = var_0_6[394],
						linkedStateIds = var_0_6[391]
					},
					["2146500638"] = var_0_6[1],
					["2415919105"] = var_0_6[384],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4]
				},
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:MeasurementCategory"] = var_0_5[24],
					["core:PowerSourceType"] = var_0_5[3],
					["core:MeasuredValueType"] = var_0_5[4]
				},
				commands = var_0_6[393]
			}
		},
		["4"] = {
			["io:AirConditioningElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = var_0_6[356],
				states = {
					["83902466"] = {
						linkedHighLevelState = var_0_6[395],
						linkedStateIds = var_0_6[390]
					},
					["83902467"] = {
						linkedHighLevelState = var_0_6[395],
						linkedStateIds = var_0_6[391]
					},
					["2146500638"] = var_0_6[1],
					["2415919105"] = var_0_6[384],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4]
				},
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:MeasurementCategory"] = var_0_5[25],
					["core:PowerSourceType"] = var_0_5[3],
					["core:MeasuredValueType"] = var_0_5[4]
				},
				commands = var_0_6[393]
			}
		},
		["5"] = {
			["io:PlugsElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = var_0_6[356],
				states = {
					["83902466"] = {
						linkedHighLevelState = var_0_6[396],
						linkedStateIds = var_0_6[390]
					},
					["83902467"] = {
						linkedHighLevelState = var_0_6[396],
						linkedStateIds = var_0_6[391]
					},
					["2146500638"] = var_0_6[1],
					["2415919105"] = var_0_6[384],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4]
				},
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:MeasurementCategory"] = var_0_5[26],
					["core:PowerSourceType"] = var_0_5[3],
					["core:MeasuredValueType"] = var_0_5[4]
				},
				commands = var_0_6[393]
			}
		},
		["6"] = {
			["io:OtherElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = var_0_6[356],
				states = {
					["83902466"] = {
						linkedHighLevelState = var_0_6[397],
						linkedStateIds = var_0_6[390]
					},
					["83902467"] = {
						linkedHighLevelState = var_0_6[397],
						linkedStateIds = var_0_6[391]
					},
					["2146500638"] = var_0_6[1],
					["2415919105"] = var_0_6[384],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4]
				},
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:MeasurementCategory"] = var_0_5[27],
					["core:PowerSourceType"] = var_0_5[3],
					["core:MeasuredValueType"] = var_0_5[4]
				},
				commands = var_0_6[393]
			}
		},
		["7"] = {
			["io:DomesticHotWaterTankComponent"] = {
				type = 1,
				widget = "DomesticHotWaterTank",
				uiClass = "WaterHeatingSystem",
				uiProfiles = var_0_6[367],
				states = {
					["2147426304"] = var_0_6[4],
					["201392128"] = {
						linkedHighLevelState = {
							var_0_4[196]
						}
					},
					["201326592"] = {
						linkedHighLevelState = {
							var_0_4[197]
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
						parameters = var_0_6[11],
						converter = var_0_0[278],
						extraDefinition = {
							access = "w",
							parameterId = "201326592"
						}
					}
				}
			}
		},
		["8"] = {
			["io:ElectricityMeterComponent"] = {
				type = 1,
				widget = "AtlanticMultiMeterElectricSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = var_0_6[367],
				states = {
					["83902467"] = {
						linkedHighLevelState = {
							var_0_4[198]
						}
					},
					["201457664"] = {
						linkedHighLevelState = {
							var_0_4[199]
						}
					},
					["83902464"] = {
						linkedHighLevelState = {
							var_0_4[200],
							var_0_4[201]
						}
					},
					["2147426304"] = var_0_6[4]
				},
				commands = {
					setElectricalContractIntensity = {
						prototype = "integer[0;150]",
						parameters = var_0_6[11],
						converter = var_0_0[282],
						extraDefinition = {
							access = "w",
							parameterId = "201457664"
						}
					},
					advancedRefresh = var_0_6[392]
				}
			}
		},
		["9"] = {
			["io:EnergyConsumptionSensorsConfigurationComponent"] = {
				type = 1,
				widget = "AtlanticMultiMeterElectricConfiguration",
				uiClass = "ElectricitySensor",
				uiProfiles = var_0_6[367],
				states = {
					["2147426304"] = var_0_6[4],
					["io:HeatPumpActiveState"] = {
						linkedHighLevelState = {
							var_0_4[202]
						}
					}
				},
				commands = {
					advancedRefresh = var_0_6[392],
					activateHeatPumpMode = {
						extraDefinition = {
							access = "w",
							parameterId = "io:HeatPumpActiveState"
						}
					}
				}
			}
		},
		["10"] = {
			["io:EnergyConsumptionSensorsHeatPumpComponent"] = {
				type = 1,
				widget = "AtlanticMultiMeterElectricHeatPump",
				uiClass = "ElectricitySensor",
				uiProfiles = var_0_6[367],
				states = {
					["201588736"] = {
						linkedHighLevelState = {
							var_0_4[203]
						}
					},
					["2147426304"] = var_0_6[4],
					["201523200"] = {
						linkedHighLevelState = {
							var_0_4[204]
						}
					}
				},
				commands = {
					advancedRefresh = var_0_6[392],
					setConfigurationServices = {
						prototype = "string(config1;config2)",
						parameters = var_0_6[11],
						converter = var_0_0[285],
						extraDefinition = {
							access = "w",
							parameterId = "201523200"
						}
					},
					setDerogationOnOffState = {
						prototype = "string(on;off)",
						parameters = var_0_6[11],
						converter = var_0_0[286],
						extraDefinition = {
							access = "w",
							parameterId = "201588736"
						}
					}
				}
			}
		}
	},
	["4303355904"] = {
		name = "Smoke sensor",
		localPairing = true,
		["0"] = {
			["io:SmokeIOSystemSensor"] = {
				type = 2,
				widget = "SmokeSensor",
				uiClass = "SmokeSensor",
				uiProfiles = var_0_6[398],
				states = {
					["2146500638"] = var_0_6[1],
					["2415919110"] = var_0_6[373],
					["2415919106"] = var_0_6[399],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[400],
				commands = var_0_6[375]
			}
		}
	},
	["4303355906"] = {
		name = "Smoke sensor - Fumix SOMFY",
		localPairing = true,
		["0"] = {
			["io:SomfySmokeIOSystemSensor"] = {
				type = 2,
				widget = "SmokeSensor",
				uiClass = "SmokeSensor",
				uiProfiles = var_0_6[398],
				states = {
					["2146500638"] = var_0_6[1],
					["2415919110"] = {
						linkedHighLevelState = {
							var_0_4[148],
							var_0_4[208]
						}
					},
					["2415919106"] = var_0_6[399],
					["2147426304"] = var_0_6[4],
					["83902976"] = {
						linkedHighLevelState = {
							var_0_4[206],
							var_0_4[207]
						}
					}
				},
				attributes = var_0_6[400],
				commands = {
					advancedRefresh = var_0_6[374],
					checkEventTrigger = {
						prototype = "string(short;long)",
						parameters = var_0_6[11],
						converter = var_0_0[292],
						extraDefinition = {
							access = "w",
							parameterId = "33554650"
						}
					}
				}
			}
		}
	},
	["4303683584"] = {
		name = "Generic closure sensor",
		localPairing = true,
		["0"] = {
			["io:ContactIOSystemSensor"] = {
				type = 2,
				widget = "ContactSensor",
				uiClass = "ContactSensor",
				uiProfiles = var_0_6[401],
				states = {
					["2415919106"] = var_0_6[402],
					["2146500638"] = var_0_6[1],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[400],
				commands = var_0_6[375]
			}
		}
	},
	["4303683586"] = {
		name = "Closure sensor - DO SOMFY",
		localPairing = true,
		["0"] = {
			["io:SomfyContactIOSystemSensor"] = var_0_6[404]
		}
	},
	["4303749120"] = {
		name = "Motion sensor",
		localPairing = true,
		["0"] = {
			["io:OccupancyIOSystemSensor"] = {
				type = 2,
				widget = "OccupancySensor",
				uiClass = "OccupancySensor",
				uiProfiles = var_0_6[405],
				states = {
					["2146500638"] = var_0_6[1],
					["2415919106"] = var_0_6[406],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[400],
				commands = var_0_6[375]
			}
		}
	},
	["4303749122"] = {
		name = "Motion sensor - DM SOMFY",
		localPairing = true,
		["0"] = {
			["io:SomfyOccupancyIOSystemSensor"] = {
				type = 2,
				widget = "OccupancySensor",
				uiClass = "OccupancySensor",
				uiProfiles = var_0_6[405],
				states = {
					["2146500638"] = var_0_6[1],
					["2415919106"] = var_0_6[406],
					["2415919110"] = var_0_6[403],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[400],
				commands = var_0_6[375]
			}
		}
	},
	["4303880192"] = {
		name = "Rain sensor",
		localPairing = true,
		["0"] = {
			["io:RainIOSystemSensor"] = var_0_6[407]
		}
	},
	["4303880194"] = {
		name = "Rain sensor - ondeis SOMFY",
		localPairing = true,
		["0"] = {
			["io:SomfyRainIOSystemSensor"] = var_0_6[407]
		}
	},
	["4311613440"] = {
		name = "Multi Type Sensor (single channel per type)",
		localPairing = true,
		["1"] = {
			["io:WindowStateSensor"] = {
				type = 2,
				widget = "IntrusionEventSensor",
				uiClass = "ContactSensor",
				uiProfiles = var_0_6[408],
				states = {
					["2146500638"] = var_0_6[409],
					["2415919105"] = var_0_6[384],
					["18183012483074"] = var_0_6[410],
					["2147426304"] = var_0_6[4],
					["2415919110"] = var_0_6[373]
				},
				attributes = var_0_6[411],
				commands = var_0_6[412]
			}
		},
		["2"] = {
			["io:IntrusionSensor"] = {
				type = 2,
				widget = "IntrusionSensor",
				uiClass = "ContactSensor",
				uiProfiles = var_0_6[413],
				states = {
					["2146500638"] = var_0_6[409],
					["2415919110"] = var_0_6[373],
					["2147426304"] = var_0_6[4],
					["18152947712002"] = var_0_6[414]
				},
				attributes = var_0_6[415],
				commands = {
					advancedRefresh = var_0_6[416]
				}
			}
		}
	},
	["1103823241218"] = {
		name = "IDEOI somfy multi type sensor (open close tilt window and Intrusion)",
		localPairing = true,
		["1"] = {
			["io:WindowStateSensor"] = {
				type = 2,
				widget = "IntrusionEventSensor",
				uiClass = "ContactSensor",
				uiProfiles = var_0_6[408],
				states = {
					["2146500638"] = var_0_6[409],
					["2415919105"] = var_0_6[384],
					["18183012483074"] = var_0_6[410],
					["2147426304"] = var_0_6[4],
					["2415919110"] = var_0_6[403]
				},
				attributes = var_0_6[411],
				commands = var_0_6[412]
			}
		},
		["2"] = var_0_6[417]
	},
	["2203334868994"] = {
		name = "IDEOI somfy multi type sensor (sliding window and Intrusion)",
		localPairing = true,
		["1"] = {
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
					["2146500638"] = var_0_6[409],
					["2415919105"] = var_0_6[384],
					["18183012483074"] = {
						linkedHighLevelState = {
							var_0_4[214],
							var_0_4[215]
						}
					},
					["2147426304"] = var_0_6[4],
					["2415919110"] = var_0_6[403]
				},
				attributes = var_0_6[411],
				commands = var_0_6[412]
			}
		},
		["2"] = var_0_6[417]
	},
	["4311678976"] = {
		name = "Generic pulse sensor (virgin)",
		localPairing = true,
		["0"] = {
			["io:GenericPulseSensor"] = {
				type = 2,
				widget = "unknown",
				uiClass = "unknown",
				uiProfiles = var_0_6[367],
				states = {
					["2146500638"] = var_0_6[1],
					["2147426304"] = var_0_6[4]
				}
			}
		}
	},
	["8656978944"] = {
		name = "Stack Master (V2)",
		localPairing = true,
		["0"] = {
			["io:StackComponent"] = {
				type = 5,
				widget = "IOStack",
				uiClass = "ProtocolGateway",
				uiProfiles = var_0_6[367],
				commands = {
					advancedSomfyDiscover = {
						prototype = "string(dpcActuators;unsetActuators)",
						parameters = var_0_6[11],
						converter = var_0_0[307],
						extraDefinition = var_0_6[418]
					},
					discoverSomfyUnsetActuators = {
						converter = var_0_0[308],
						extraDefinition = var_0_6[418]
					},
					discoverActuators = {
						prototype = "string(alreadyInTheNetwork;inConfigurationState;all)",
						parameters = var_0_6[11],
						converter = var_0_0[309],
						extraDefinition = var_0_6[418]
					},
					discoverSensors = {
						prototype = "string(inConfigurationState;all)",
						parameters = var_0_6[11],
						converter = var_0_0[310],
						extraDefinition = {
							access = "w",
							parameterId = "2146566150"
						}
					},
					discover1WayController = {
						prototype = "*integer,*string(keygo;izymo;public default;v500;default;keypad)",
						parameters = {
							var_0_6[206],
							var_0_6[7]
						},
						converter = var_0_0[311],
						extraDefinition = {
							access = "w",
							parameterId = "2146566151"
						}
					},
					joinNetwork = {
						converter = var_0_0[312],
						extraDefinition = {
							access = "w",
							parameterId = "2146566148"
						}
					},
					resetNetworkSecurity = {
						converter = var_0_0[313],
						extraDefinition = {
							access = "w",
							parameterId = "2146500620"
						}
					},
					shareNetwork = {
						converter = var_0_0[314],
						extraDefinition = {
							access = "w",
							parameterId = "2146566147"
						}
					}
				}
			}
		}
	},
	["21475622912"] = {
		name = "Beacon",
		localPairing = true,
		["0"] = {
			["io:BeaconIOComponent"] = {
				type = 6,
				widget = "Repeater",
				uiClass = "NetworkComponent",
				uiProfiles = var_0_6[367],
				states = {
					["2146500638"] = var_0_6[1]
				},
				attributes = {
					["core:DefaultName"] = var_0_5[34]
				}
			}
		}
	},
	["25836847104"] = {
		name = "Remote Controller (1W)",
		localPairing = true,
		["0"] = {
			["io:IORemoteController"] = {
				type = 4,
				widget = "RemoteControllerOneWay",
				uiClass = "RemoteController",
				uiProfiles = var_0_6[367],
				states = {
					["33554442"] = {
						linkedHighLevelState = {
							var_0_4[219]
						}
					}
				},
				attributes = var_0_6[419]
			}
		}
	},
	["25836847616"] = {
		name = "Keygo Remote Controller",
		localPairing = true,
		["0"] = {
			["io:KeygoController"] = var_0_6[420]
		}
	},
	["25836847872"] = {
		name = "Izymo Remote Controller",
		localPairing = true,
		["0"] = {
			["io:IzymoController"] = {
				type = 4,
				widget = "RemoteControllerOneWay",
				uiClass = "RemoteController",
				uiProfiles = var_0_6[367],
				states = {
					["33554443"] = {
						linkedHighLevelState = {
							var_0_4[221]
						}
					}
				},
				attributes = var_0_6[419]
			}
		}
	},
	["1099511758850"] = {
		name = "Roller Shutter With Low Speed Management SOMFY",
		localPairing = true,
		["0"] = var_0_6[424]
	},
	["1099511759106"] = {
		name = "GradHermetic SOMFY",
		localPairing = true,
		["0"] = {
			["io:GradHermeticIOComponent"] = var_0_6[85]
		}
	},
	["1099511824386"] = {
		name = "Pergola Screen SOMFY",
		localPairing = true,
		["0"] = {
			["io:PergolaScreenIOComponent"] = {
				type = 1,
				widget = "PositionableAndStretchablePergolaScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[425],
				states = {
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[222],
							var_0_4[5],
							var_0_4[12]
						}
					},
					["2146500638"] = var_0_6[1],
					["16832512"] = var_0_6[69],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[70],
					["2147426304"] = var_0_6[4],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[59],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					runManufacturerSettingsCommand = var_0_6[62],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					setClosureOrTightPosition = var_0_6[426],
					setMemorized1Position = var_0_6[47],
					setName = var_0_6[20],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setSecuredPosition = var_0_6[53],
					setTightPosition = var_0_6[236],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26],
					sendIOKey = var_0_6[65]
				}
			}
		}
	},
	["1099511889922"] = {
		name = "Window Opener Uno",
		localPairing = true,
		["0"] = {
			["io:WindowOpenerUnoIOComponent"] = {
				type = 1,
				widget = "PositionableWindowUno",
				uiClass = "Window",
				uiProfiles = var_0_6[427],
				states = {
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["2147426304"] = var_0_6[4],
					["16830720"] = var_0_6[429],
					["65537"] = {
						linkedHighLevelState = var_0_6[428],
						linkedStateIds = {
							"120833",
							"120834",
							"120835",
							"120842",
							"16830720"
						}
					},
					["120842"] = var_0_6[430],
					["120833"] = var_0_6[431],
					["120834"] = var_0_6[432],
					["120835"] = var_0_6[433],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[59],
				commands = var_0_6[154]
			}
		}
	},
	["1099511970306"] = {
		name = "Discrete Garage Door Opener SOMFY (Dexxo Smart io 800)",
		localPairing = true,
		["0"] = var_0_6[438]
	},
	["1099512020994"] = {
		name = "Dimmable Light - Somfy  - Light Receiver 2017",
		localPairing = true,
		["0"] = var_0_6[115]
	},
	["1099512021250"] = {
		name = "Dimmable RGB Light Somfy - Light Receiver 2017",
		localPairing = true,
		["0"] = var_0_6[127]
	},
	["1099512021506"] = {
		name = "Tunable White Receiver - Light Receiver 2017",
		localPairing = true,
		["0"] = var_0_6[132]
	},
	["1099512035842"] = {
		name = "On/Off Light - Somfy  - Light Receiver 2017",
		localPairing = true,
		["0"] = var_0_6[140]
	},
	["1099512101378"] = {
		name = "Discrete Gate Opener SOMFY (Axovia 3S)",
		localPairing = true,
		["0"] = var_0_6[152]
	},
	["1099512217602"] = {
		name = "Door Lock With Unknown Position",
		localPairing = true,
		["0"] = {
			["io:LockUnlockDoorLockWithUnknownPositionIOComponent"] = {
				type = 1,
				widget = "LockUnlockDoorLockWithUnknownPosition",
				uiClass = "DoorLock",
				uiProfiles = var_0_6[156],
				states = {
					["2146500638"] = var_0_6[1],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[225]
						}
					},
					["1"] = var_0_6[3],
					["65556"] = {
						linkedHighLevelState = {
							var_0_4[226]
						}
					},
					["2147426304"] = var_0_6[4],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[59],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					getOpenClose = var_0_6[158],
					identify = var_0_6[15],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					runManufacturerSettingsCommand = var_0_6[62],
					pairOneWayController = var_0_6[17],
					refreshLockedUnlocked = var_0_6[158],
					setLockedUnlocked = {
						prototype = "string(locked;unlocked)",
						parameters = var_0_6[11],
						converter = var_0_0[327],
						extraDefinition = var_0_6[18]
					},
					close = var_0_6[439],
					lock = var_0_6[439],
					open = var_0_6[440],
					setOpenClosed = {
						prototype = "string(open;closed)",
						parameters = var_0_6[11],
						aliasConverter = var_0_0[328],
						converter = var_0_0[327],
						extraDefinition = var_0_6[18]
					},
					unlock = var_0_6[440],
					setName = var_0_6[20],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26],
					sendIOKey = var_0_6[65]
				}
			}
		}
	},
	["1099512283138"] = {
		name = "Vertical Blind Uno",
		localPairing = true,
		["0"] = {
			["io:VerticalInteriorBlindUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "Screen",
				uiProfiles = var_0_6[441],
				states = var_0_6[443],
				attributes = var_0_6[59],
				commands = var_0_6[168]
			}
		}
	},
	["1099512610818"] = {
		name = "Cyclic Standard Receiver SOMFY",
		localPairing = true,
		["0"] = {
			["io:CyclicStandardReceiverIOComponent"] = {
				type = 1,
				widget = "CyclicGeneric",
				uiClass = "Generic",
				uiProfiles = {
					"Cyclic",
					"Generic"
				},
				states = {
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["2147426304"] = var_0_6[4],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[59],
				commands = {
					advancedRefresh = var_0_6[10],
					cycle = {
						converter = var_0_0[329],
						extraDefinition = {
							access = "w",
							parameterId = "65786"
						}
					},
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					runManufacturerSettingsCommand = var_0_6[62],
					pairOneWayController = var_0_6[17],
					setName = var_0_6[20],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26],
					sendIOKey = var_0_6[65]
				}
			}
		}
	},
	["1099512611330"] = {
		name = "Switch On/Off - micromodule SOMFY",
		localPairing = true,
		["0"] = {
			["io:SwitchMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "TimedOnOff",
				uiClass = "OnOff",
				uiProfiles = var_0_6[133],
				states = var_0_6[192],
				attributes = var_0_6[59],
				commands = var_0_6[198]
			}
		}
	},
	["1099512676354"] = {
		name = "Horizontal Awning Uno",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningUnoIOComponent"] = var_0_6[445]
		}
	},
	["1099512676610"] = {
		name = "Pergola Warema SOMFY",
		localPairing = true,
		["0"] = {
			["io:PergolaHorizontalUnoIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwningUno",
				uiClass = "Pergola",
				uiProfiles = var_0_6[446],
				states = var_0_6[443],
				attributes = var_0_6[59],
				commands = var_0_6[202]
			}
		}
	},
	["1099512741888"] = {
		name = "Exterior Venetian Blind with WP",
		localPairing = true,
		["0"] = var_0_6[447]
	},
	["1099512872962"] = {
		name = "Curtain track Uno",
		localPairing = true,
		["0"] = {
			["io:CurtainTrackUnoIOComponent"] = {
				type = 1,
				widget = "CurtainTrackUno",
				uiClass = "Curtain",
				uiProfiles = var_0_6[448],
				states = {
					["2146500638"] = var_0_6[1],
					["1"] = var_0_6[3],
					["2147426304"] = var_0_6[4],
					["16832512"] = var_0_6[31],
					["16830720"] = var_0_6[35],
					["65537"] = var_0_6[442],
					["16832522"] = var_0_6[75],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[59],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					runManufacturerSettingsCommand = var_0_6[62],
					pairOneWayController = var_0_6[17],
					setClosure = var_0_6[449],
					close = var_0_6[450],
					open = var_0_6[451],
					my = var_0_6[452],
					setName = var_0_6[20],
					setMemorized1Position = var_0_6[47],
					refreshMemorized1Position = var_0_6[37],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26],
					sendIOKey = var_0_6[65]
				}
			}
		}
	},
	["1099513004034"] = {
		name = "Heating Receiver io Dimming SOMFY",
		localPairing = true,
		["0"] = {
			["io:SimpleExteriorHeatingIOComponent"] = var_0_6[227]
		}
	},
	["1099513018882"] = {
		name = "Heating Receiver io On Off SOMFY",
		localPairing = true,
		["0"] = var_0_6[231]
	},
	["1099513397506"] = {
		name = "Sliding Window with lock SOMFY - Air",
		localPairing = true,
		["0"] = var_0_6[251]
	},
	["1099513528322"] = {
		name = "Simple Bioclimatic Pergola Somfy",
		localPairing = true,
		["0"] = var_0_6[453]
	},
	["2199025156098"] = {
		name = "Pergola Louver io",
		localPairing = true,
		["0"] = var_0_6[453]
	},
	["1099514970124"] = {
		name = "Domestic hot water production (Atlantic)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionIOComponent"] = {
				type = 1,
				widget = "DomesticHotWaterProduction",
				uiClass = "WaterHeatingSystem",
				uiProfiles = var_0_6[277],
				states = {
					["201326593"] = var_0_6[278],
					["16832527"] = {
						linkedHighLevelState = {
							var_0_4[227],
							var_0_4[232]
						},
						linkedStateIds = var_0_6[454]
					},
					["2146500638"] = var_0_6[1],
					["16832530"] = {
						linkedHighLevelState = {
							var_0_4[228],
							var_0_4[232]
						},
						linkedStateIds = var_0_6[455]
					},
					["16832534"] = {
						linkedHighLevelState = {
							var_0_4[229],
							var_0_4[232]
						},
						linkedStateIds = var_0_6[456]
					},
					["16832531"] = {
						linkedHighLevelState = {
							var_0_4[230],
							var_0_4[232]
						},
						linkedStateIds = var_0_6[457]
					},
					["201328385"] = var_0_6[288],
					["1"] = var_0_6[3],
					["65553"] = var_0_6[292],
					["16832522"] = {
						linkedHighLevelState = {
							var_0_4[231],
							var_0_4[232]
						},
						linkedStateIds = var_0_6[458]
					},
					["2147426304"] = var_0_6[4],
					["16830720"] = {
						linkedHighLevelState = {
							var_0_4[232]
						},
						linkedStateIds = var_0_6[459]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[233]
						}
					},
					["201326849"] = var_0_6[295],
					["201327873"] = var_0_6[297],
					["201328641"] = {
						linkedHighLevelState = {
							var_0_4[234]
						}
					},
					["201327105"] = var_0_6[300],
					["201328129"] = var_0_6[301],
					["201327361"] = var_0_6[302],
					["65552"] = var_0_6[307],
					["65547"] = var_0_6[313]
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					refreshAwayModeDuration = var_0_6[316],
					refreshBoostModeDuration = var_0_6[318],
					refreshCurrentOperatingMode = var_0_6[233],
					refreshDHWCapacity = var_0_6[319],
					refreshDHWError = var_0_6[320],
					refreshDHWMode = var_0_6[321],
					refreshManufacturerName = var_0_6[325],
					refreshOperatingModeCapabilities = var_0_6[327],
					refreshOperatingTime = var_0_6[329],
					refreshRateManagement = var_0_6[331],
					refreshTargetTemperature = var_0_6[158],
					refreshWaterConsumption = var_0_6[333],
					setAwayModeDuration = var_0_6[335],
					setBoostModeDuration = var_0_6[337],
					setComfortTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[11],
						converter = var_0_0[334],
						extraDefinition = var_0_6[183]
					},
					setCurrentOperatingMode = var_0_6[338],
					setDHWMode = var_0_6[339],
					setEcoTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[11],
						converter = var_0_0[334],
						extraDefinition = var_0_6[234]
					},
					setFrostProtectionTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[11],
						converter = var_0_0[334],
						extraDefinition = var_0_6[344]
					},
					setHaltedTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[11],
						converter = var_0_0[334],
						extraDefinition = var_0_6[346]
					},
					setName = var_0_6[20],
					setRateManagement = var_0_6[351],
					setTargetTemperature = {
						prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
						parameters = var_0_6[11],
						converter = var_0_0[335],
						extraDefinition = var_0_6[18]
					},
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					wink = var_0_6[26]
				}
			}
		},
		["2"] = var_0_6[358]
	},
	["1103806726146"] = {
		name = "Thermostatic valve SOMFY",
		localPairing = true,
		["1"] = {
			["io:HeatingValveIOComponent"] = {
				type = 1,
				widget = "ValveHeatingTemperatureInterface",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[460],
				states = {
					["84059684"] = {
						linkedHighLevelState = {
							var_0_4[235],
							var_0_4[243],
							var_0_4[244],
							var_0_4[246],
							var_0_4[251],
							var_0_4[255],
							var_0_4[260]
						}
					},
					["84059682"] = var_0_6[461],
					["84059685"] = var_0_6[462],
					["84059681"] = var_0_6[463],
					["2146500638"] = var_0_6[1],
					["2415919105"] = var_0_6[384],
					["84059680"] = {
						linkedHighLevelState = {
							var_0_4[245],
							var_0_4[247],
							var_0_4[249],
							var_0_4[250],
							var_0_4[256]
						}
					},
					["2147426304"] = var_0_6[4],
					["84059686"] = var_0_6[464],
					["84059687"] = var_0_6[465]
				},
				commands = {
					advancedRefresh = var_0_6[374],
					delayedStopIdentify = var_0_6[13],
					exitDerogation = var_0_6[467],
					getName = var_0_6[386],
					identify = var_0_6[15],
					setAllModeTemperatures = var_0_6[468],
					setDerogation = var_0_6[469],
					setName = var_0_6[387],
					setTimeProgramById = var_0_6[470],
					setValveSettings = {
						prototype = "object",
						parameters = var_0_6[11],
						rawStates = {},
						converter = var_0_0[372],
						extraDefinition = var_0_6[195]
					},
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26]
				}
			}
		},
		["2"] = var_0_6[473]
	},
	["1103815311362"] = {
		name = "Closure sensor - Slim DO SOMFY",
		localPairing = true,
		["0"] = {
			["io:SomfyBasicContactIOSystemSensor"] = var_0_6[404]
		}
	},
	["2199023386626"] = {
		name = "Roller Shutter With Low Speed Management SOMFY (WT)",
		localPairing = true,
		["0"] = var_0_6[424]
	},
	["2199023386882"] = {
		name = "VR Holla SOMFY",
		localPairing = true,
		["0"] = {
			["io:VRHollaIOComponent"] = {
				type = 1,
				widget = "PositionableOrProgressiveOrientableRollerShutter",
				uiClass = "AdjustableSlatsRollerShutter",
				uiProfiles = var_0_6[474],
				states = var_0_6[76],
				attributes = var_0_6[59],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					runManufacturerSettingsCommand = var_0_6[62],
					pairOneWayController = var_0_6[17],
					setClosureAndOrientation = var_0_6[475],
					setClosureOrOrientation = var_0_6[77],
					setClosureOrRockerPosition = var_0_6[78],
					close = var_0_6[79],
					down = var_0_6[79],
					open = var_0_6[80],
					setClosure = var_0_6[81],
					setDeployment = var_0_6[81],
					setRockerPosition = var_0_6[82],
					up = var_0_6[80],
					setName = var_0_6[20],
					setOrientation = var_0_6[83],
					startIdentify = var_0_6[21],
					stop = var_0_6[84],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					unpairOneWayController = var_0_6[24],
					setConfigState = var_0_6[25],
					wink = var_0_6[26],
					sendIOKey = var_0_6[65]
				}
			}
		}
	},
	["2199023452162"] = {
		name = "Vertical Exterior Awning Uno",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[476],
				states = {
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[20],
							var_0_4[5],
							var_0_4[12],
							var_0_4[10]
						},
						linkedStateIds = var_0_6[29]
					},
					["2146500638"] = var_0_6[1],
					["16832512"] = var_0_6[31],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[33],
					["2147426304"] = var_0_6[4],
					["16830720"] = var_0_6[35],
					["2"] = var_0_6[56],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[59],
				commands = var_0_6[90]
			}
		}
	},
	["2199023598082"] = {
		name = "Discrete Garage Door Opener SOMFY (Rollixo IO)",
		localPairing = true,
		["0"] = var_0_6[100]
	},
	["2199023729154"] = {
		name = "Discrete Gate Opener SOMFY (Axovia 200 3S)",
		localPairing = true,
		["0"] = var_0_6[152]
	},
	["2199023910914"] = {
		name = "Sonesse 40 SOMFY",
		localPairing = true,
		["0"] = var_0_6[169]
	},
	["2199024304130"] = {
		name = "Awning Receiver Uno SOMFY",
		localPairing = true,
		["0"] = {
			["io:AwningReceiverUnoIOComponent"] = var_0_6[445]
		}
	},
	["2199024304386"] = {
		name = "Pergola Rail Guided Awning SOMFY - Pergola CQFD",
		localPairing = true,
		["0"] = var_0_6[205]
	},
	["3298535932162"] = {
		name = "Pergola RGS 50/60 SOMFY",
		localPairing = true,
		["0"] = var_0_6[205]
	},
	["2199024369666"] = {
		name = "Exterior Venetian Blind Uno",
		localPairing = true,
		["0"] = {
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
					["2146500638"] = var_0_6[1],
					["16832512"] = var_0_6[31],
					["17029120"] = var_0_6[211],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[33],
					["2147426304"] = var_0_6[4],
					["16830720"] = var_0_6[35],
					["65537"] = var_0_6[442],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[59],
				commands = var_0_6[217]
			}
		}
	},
	["2199026597900"] = {
		name = "Domestic hot water production (Atlantic V3)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV3IOComponent"] = {
				type = 1,
				widget = "DomesticHotWaterProduction",
				uiClass = "WaterHeatingSystem",
				uiProfiles = var_0_6[277],
				states = {
					["201326593"] = var_0_6[278],
					["16832527"] = {
						linkedHighLevelState = {
							var_0_4[265],
							var_0_4[270]
						},
						linkedStateIds = var_0_6[454]
					},
					["201330433"] = var_0_6[284],
					["2146500638"] = var_0_6[1],
					["16832530"] = {
						linkedHighLevelState = {
							var_0_4[266],
							var_0_4[270]
						},
						linkedStateIds = var_0_6[455]
					},
					["16832534"] = {
						linkedHighLevelState = {
							var_0_4[267],
							var_0_4[270]
						},
						linkedStateIds = var_0_6[456]
					},
					["16832531"] = {
						linkedHighLevelState = {
							var_0_4[268],
							var_0_4[270]
						},
						linkedStateIds = var_0_6[457]
					},
					["201328385"] = var_0_6[288],
					["1"] = var_0_6[3],
					["65553"] = var_0_6[292],
					["16832522"] = {
						linkedHighLevelState = {
							var_0_4[269],
							var_0_4[270]
						},
						linkedStateIds = var_0_6[458]
					},
					["2147426304"] = var_0_6[4],
					["16830720"] = {
						linkedHighLevelState = {
							var_0_4[270]
						},
						linkedStateIds = var_0_6[459]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[271]
						}
					},
					["201326849"] = var_0_6[295],
					["201329665"] = var_0_6[296],
					["201327873"] = var_0_6[297],
					["201330945"] = var_0_6[298],
					["201328641"] = var_0_6[299],
					["201327105"] = var_0_6[300],
					["201328129"] = var_0_6[301],
					["201327361"] = var_0_6[302],
					["201330177"] = var_0_6[303],
					["201331457"] = var_0_6[304],
					["201330689"] = var_0_6[305],
					["65552"] = var_0_6[307],
					["201329153"] = var_0_6[308],
					["201329409"] = var_0_6[312],
					["65547"] = var_0_6[313],
					["201331201"] = var_0_6[314]
				},
				attributes = var_0_6[5],
				commands = {
					advancedRefresh = var_0_6[10],
					delayedStopIdentify = var_0_6[13],
					getName = var_0_6[14],
					identify = var_0_6[15],
					pairOneWayController = var_0_6[17],
					refreshAntiLegionellosis = var_0_6[315],
					refreshAwayModeDuration = var_0_6[316],
					refreshBoilerInstallationOption = var_0_6[317],
					refreshBoostModeDuration = var_0_6[318],
					refreshCurrentOperatingMode = var_0_6[233],
					refreshDHWCapacity = var_0_6[319],
					refreshDHWError = var_0_6[320],
					refreshDHWMode = var_0_6[321],
					refreshElectricalExtraManagement = var_0_6[322],
					refreshExtractionOption = var_0_6[323],
					refreshInstallation = var_0_6[324],
					refreshManufacturerName = var_0_6[325],
					refreshOperatingModeCapabilities = var_0_6[327],
					refreshOperatingRange = var_0_6[328],
					refreshOperatingTime = var_0_6[329],
					refreshProgrammingSlots = var_0_6[330],
					refreshRateManagement = var_0_6[331],
					refreshSmartGridOption = var_0_6[332],
					refreshTargetTemperature = var_0_6[158],
					refreshWaterConsumption = var_0_6[333],
					setAntiLegionellosis = var_0_6[334],
					setAwayModeDuration = var_0_6[335],
					setBoilerInstallationOption = var_0_6[336],
					setBoostModeDuration = var_0_6[337],
					setComfortTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[11],
						converter = var_0_0[378],
						extraDefinition = var_0_6[183]
					},
					setCurrentOperatingMode = var_0_6[338],
					setDHWMode = var_0_6[339],
					setDateTime = var_0_6[340],
					setEcoTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[11],
						converter = var_0_0[378],
						extraDefinition = var_0_6[234]
					},
					setElectricalExtraManagement = var_0_6[342],
					setExtractionOption = var_0_6[343],
					setFrostProtectionTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[11],
						converter = var_0_0[378],
						extraDefinition = var_0_6[344]
					},
					setHaltedTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = var_0_6[11],
						converter = var_0_0[378],
						extraDefinition = var_0_6[346]
					},
					setInstallation = var_0_6[348],
					setName = var_0_6[20],
					setOperatingRange = var_0_6[349],
					setProgrammingSlots = var_0_6[350],
					setRateManagement = var_0_6[351],
					setSmartGridOption = var_0_6[352],
					setTargetTemperature = {
						prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
						parameters = var_0_6[11],
						converter = var_0_0[379],
						extraDefinition = var_0_6[18]
					},
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					unpairAllOneWayControllers = var_0_6[23],
					unpairOneWayController = var_0_6[24],
					wink = var_0_6[26]
				}
			}
		},
		["2"] = var_0_6[358]
	},
	["2203318353922"] = {
		name = "Thermostat SOMFY",
		localPairing = true,
		["1"] = {
			["io:HeatingThermostatIOComponent"] = {
				type = 1,
				widget = "ThermostatHeatingTemperatureInterface",
				uiClass = "HeatingSystem",
				uiProfiles = var_0_6[460],
				states = {
					["84059684"] = {
						linkedHighLevelState = {
							var_0_4[235],
							var_0_4[272],
							var_0_4[243],
							var_0_4[244],
							var_0_4[246],
							var_0_4[273],
							var_0_4[274],
							var_0_4[277],
							var_0_4[278],
							var_0_4[260]
						}
					},
					["84059682"] = var_0_6[461],
					["84059685"] = var_0_6[462],
					["84059681"] = var_0_6[463],
					["2146500638"] = var_0_6[1],
					["2415919105"] = var_0_6[384],
					["84059680"] = {
						linkedHighLevelState = {
							var_0_4[245],
							var_0_4[247],
							var_0_4[275],
							var_0_4[276],
							var_0_4[256]
						}
					},
					["2147426304"] = var_0_6[4],
					["84059686"] = var_0_6[464],
					["84059687"] = var_0_6[465]
				},
				commands = {
					advancedRefresh = var_0_6[374],
					delayedStopIdentify = var_0_6[13],
					exitDerogation = var_0_6[467],
					getName = var_0_6[386],
					identify = var_0_6[15],
					setAllModeTemperatures = var_0_6[468],
					setDerogation = var_0_6[469],
					setName = var_0_6[387],
					setThermostatSettings = {
						prototype = "object",
						parameters = var_0_6[11],
						rawStates = {},
						converter = var_0_0[386],
						extraDefinition = var_0_6[195]
					},
					setTimeProgramById = var_0_6[470],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26]
				}
			}
		},
		["2"] = var_0_6[473],
		["3"] = {
			["io:RelativeHumidityIOSystemSensor"] = {
				type = 2,
				widget = "RelativeHumiditySensor",
				uiClass = "HumiditySensor",
				uiProfiles = var_0_6[379],
				states = {
					["2146500638"] = var_0_6[1],
					["84059680"] = {
						linkedHighLevelState = {
							var_0_4[279]
						}
					},
					["84059682"] = var_0_6[471],
					["2147426304"] = var_0_6[4]
				},
				attributes = var_0_6[380],
				commands = var_0_6[472]
			}
		}
	},
	["3298535014402"] = {
		name = "Roller Shutter Uno SOMFY",
		localPairing = true,
		["0"] = var_0_6[478]
	},
	["3298535079938"] = {
		name = "Pergola Side Screen SOMFY",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = {
					["65537"] = var_0_6[480],
					["2146500638"] = var_0_6[1],
					["16832512"] = var_0_6[31],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[33],
					["2147426304"] = var_0_6[4],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57],
					["65557"] = var_0_6[36],
					["16830720"] = var_0_6[35]
				},
				attributes = var_0_6[59],
				commands = var_0_6[90]
			}
		}
	},
	["3298535225858"] = {
		name = "Discrete Garage Door Opener SOMFY (Metro Smart 800 IO)",
		localPairing = true,
		["0"] = var_0_6[438]
	},
	["3298535356930"] = {
		name = "Discrete Gate Opener SOMFY (Ixengo 3S)",
		localPairing = true,
		["0"] = var_0_6[152]
	},
	["3298535538690"] = {
		name = "Actuo 40 SOMFY",
		localPairing = true,
		["0"] = var_0_6[169]
	},
	["3298535931906"] = {
		name = "Horizontal Awning Somfy - Sunea Sunilus CQFD",
		localPairing = true,
		["0"] = var_0_6[203]
	},
	["3298535997442"] = {
		name = "Exterior Venetian Blind J4 with WP2",
		localPairing = true,
		["0"] = var_0_6[482]
	},
	["3298538225676"] = {
		name = "Domestic hot water production (Atlantic V2 - AEX)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_AEX_IOComponent"] = var_0_6[355]
		},
		["2"] = var_0_6[358]
	},
	["4398046642178"] = {
		name = "Roller Shutter Receiver Uno SOMFY",
		localPairing = true,
		["0"] = var_0_6[478]
	},
	["4398046707714"] = {
		name = "Drop Arm Awning SOMFY",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = {
					["65537"] = var_0_6[484],
					["2146500638"] = var_0_6[1],
					["16832512"] = var_0_6[31],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[33],
					["2147426304"] = var_0_6[4],
					["2"] = var_0_6[56],
					["65557"] = var_0_6[36],
					["16830720"] = var_0_6[35],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[59],
				commands = var_0_6[90]
			}
		}
	},
	["4398046853634"] = {
		name = "Discrete Garage Door Opener SOMFY (Metro Smart 1000 IO)",
		localPairing = true,
		["0"] = var_0_6[438]
	},
	["4398046984706"] = {
		name = "Discrete Gate Opener SOMFY (Invisio 3S)",
		localPairing = true,
		["0"] = var_0_6[152]
	},
	["4398047166466"] = {
		name = "Optuo 40 SOMFY",
		localPairing = true,
		["0"] = var_0_6[169]
	},
	["4398047559682"] = {
		name = "Horizontal Awning Somfy - Sunea Screen 40",
		localPairing = true,
		["0"] = var_0_6[203]
	},
	["4398049853452"] = {
		name = "Domestic hot water production (Atlantic V2 - MURAL)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_MURAL_IOComponent"] = var_0_6[486]
		},
		["2"] = var_0_6[358]
	},
	["5497558269954"] = {
		name = "Roller Shutter SOMFY - Altus RS",
		localPairing = true,
		["0"] = var_0_6[67]
	},
	["5497558335490"] = {
		name = "Awning Valance SOMFY",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[89],
				attributes = var_0_6[59],
				commands = var_0_6[90]
			}
		}
	},
	["5497558481410"] = {
		name = "Discrete Garage Door Opener SOMFY (Dexxo Smart io 1000)",
		localPairing = true,
		["0"] = var_0_6[438]
	},
	["5497558612482"] = {
		name = "Discrete Gate Opener SOMFY (Elixo 3S)",
		localPairing = true,
		["0"] = var_0_6[152]
	},
	["5497558794242"] = {
		name = "Sonesse Wirefree",
		localPairing = true,
		["0"] = {
			["io:VerticalInteriorBlindWithBatterySomfyIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "Screen",
				uiProfiles = var_0_6[167],
				states = var_0_6[488],
				attributes = var_0_6[59],
				commands = var_0_6[168]
			}
		}
	},
	["5497559187458"] = {
		name = "Horizontal Awning Somfy - Sunea 50 CSI",
		localPairing = true,
		["0"] = var_0_6[203]
	},
	["5497561481228"] = {
		name = "Domestic hot water production (Atlantic V2 - SPLIT)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_SPLIT_IOComponent"] = var_0_6[355]
		},
		["2"] = var_0_6[358]
	},
	["6597069897730"] = {
		name = "Roller Shutter SOMFY - Oximo 40",
		localPairing = true,
		["0"] = var_0_6[67]
	},
	["14293651292162"] = {
		name = "Roller Shutter SOMFY with battery",
		localPairing = true,
		["0"] = {
			["io:RollerShutterWithBatterySomfyIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[488],
				attributes = var_0_6[59],
				commands = var_0_6[66]
			}
		}
	},
	["6597069963266"] = {
		name = "Screen Receiver Uno SOMFY",
		localPairing = true,
		["0"] = {
			["io:ScreenReceiverUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[489],
				states = var_0_6[443],
				attributes = var_0_6[59],
				commands = var_0_6[90]
			}
		}
	},
	["6597070109186"] = {
		name = "Discrete Garage Door Opener SOMFY (Rollixo Smart IO)",
		localPairing = true,
		["0"] = var_0_6[100]
	},
	["6597070240258"] = {
		name = "Discrete Gate Opener SOMFY (Elixo Smart)",
		localPairing = true,
		["0"] = var_0_6[490]
	},
	["6597073109004"] = {
		name = "Domestic hot water production (Atlantic V2 - V2 TEC5)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_TEC5_IOComponent"] = var_0_6[355]
		},
		["2"] = var_0_6[358]
	},
	["7696581525506"] = {
		name = "Roller Shutter SOMFY - Awmio - Oximo CQFD",
		localPairing = true,
		["0"] = var_0_6[67]
	},
	["15393162919938"] = {
		name = "Roller Shutter SOMFY - Awmio - Oximo CQFD Redesign",
		localPairing = true,
		["0"] = var_0_6[67]
	},
	["7696581591042"] = {
		name = "Vertical Exterior Awning SOMFY - AWMIO",
		localPairing = true,
		["0"] = var_0_6[91]
	},
	["7696581868034"] = {
		name = "Discrete Gate Opener SOMFY (Roly Smart IO)",
		localPairing = true,
		["0"] = var_0_6[490]
	},
	["7696584736780"] = {
		name = "Domestic hot water production (Atlantic V2 - CE FLAT C2)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_CE_FLAT_C2_IOComponent"] = var_0_6[493]
		},
		["2"] = var_0_6[358]
	},
	["8796093153282"] = {
		name = "Roller Shutter SOMFY - Short Motor IO",
		localPairing = true,
		["0"] = var_0_6[67]
	},
	["8796093218818"] = {
		name = "Vertical Exterior Awning SOMFY - Sunea Sunilus",
		localPairing = true,
		["0"] = var_0_6[91]
	},
	["8796096364556"] = {
		name = "Domestic hot water production (Atlantic V2 - CE S4)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_CE_S4_IOComponent"] = var_0_6[493]
		},
		["2"] = var_0_6[358]
	},
	["9895604781058"] = {
		name = "Roller Shutter SOMFY - MicroModule IO",
		localPairing = true,
		["0"] = {
			["io:MicroModuleRollerShutterSomfyIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = {
					["65537"] = var_0_6[68],
					["2146500638"] = var_0_6[1],
					["16832512"] = var_0_6[69],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[70],
					["2147426304"] = var_0_6[4],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57],
					["84059655"] = var_0_6[191]
				},
				attributes = var_0_6[59],
				commands = var_0_6[66]
			}
		}
	},
	["9895604846594"] = {
		name = "Vertical Exterior Awning SOMFY - Slim Receiver",
		localPairing = true,
		["0"] = var_0_6[91]
	},
	["9895607992332"] = {
		name = "Domestic hot water production (Atlantic V2 - CETHI V4)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_CETHI_V4_IOComponent"] = var_0_6[486]
		},
		["2"] = var_0_6[358]
	},
	["10995116408834"] = {
		name = "Roller Shutter With Low Speed Management SOMFY (AIR)",
		localPairing = true,
		["0"] = var_0_6[424]
	},
	["10995116474370"] = {
		name = "Vertical Exterior Awning SOMFY - Universal Screen",
		localPairing = true,
		["0"] = var_0_6[91]
	},
	["10995119620108"] = {
		name = "Domestic hot water production (Atlantic V2 - CV4E)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_CV4E_IOComponent"] = var_0_6[486]
		},
		["2"] = var_0_6[358]
	},
	["12094628036610"] = {
		name = "Roller Shutter SOMFY - Ilmo 2 50",
		localPairing = true,
		["0"] = var_0_6[67]
	},
	["12094628102146"] = {
		name = "Sunea 40 - Vertical Exterior Awning SOMFY",
		localPairing = true,
		["0"] = var_0_6[91]
	},
	["13194139664386"] = {
		name = "Roller Shutter SOMFY - Solus P&P 50",
		localPairing = true,
		["0"] = var_0_6[67]
	},
	["17592187158530"] = {
		name = "Exterior Venetian Blind - J4 IO",
		localPairing = true,
		["0"] = var_0_6[218]
	},
	["18691698786306"] = {
		name = "Exterior Venetian Blind with WP - J4 IO",
		localPairing = true,
		["0"] = var_0_6[447]
	},
	["20890722041858"] = {
		name = "Exterior Venetian Blind J4 with WP2  - J4 IO",
		localPairing = true,
		["0"] = var_0_6[482]
	},
	["35184373202946"] = {
		name = "Exterior Venetian Blind - EVB RTX BRIDGE",
		localPairing = true,
		["0"] = var_0_6[218]
	},
	["36283884830722"] = {
		name = "Exterior Venetian Blind with WP - EVB RTX BRIDGE",
		localPairing = true,
		["0"] = var_0_6[447]
	},
	["38482908086274"] = {
		name = "Exterior Venetian Blind J4 with WP2 - EVB RTX BRIDGE",
		localPairing = true,
		["0"] = var_0_6[482]
	},
	["52776559247362"] = {
		name = "Exterior Venetian Blind - J4 IO PROTECT",
		localPairing = true,
		["0"] = var_0_6[218]
	},
	["53876070875138"] = {
		name = "Exterior Venetian Blind with WP - J4 IO PROTECT",
		localPairing = true,
		["0"] = var_0_6[447]
	},
	["56075094130690"] = {
		name = "Exterior Venetian Blind J4 with WP2 - J4 IO PROTECT",
		localPairing = true,
		["0"] = var_0_6[482]
	},
	["25836848128"] = {
		name = "Remote Controller (Public Trame)",
		localPairing = true,
		["0"] = {
			["io:GenericOneWayController"] = var_0_6[494]
		}
	},
	["25836848384"] = {
		name = "V500 Remote Controller",
		localPairing = true,
		["0"] = {
			["io:V500Controller"] = var_0_6[494]
		}
	},
	["25836848640"] = {
		name = "Keypad Remote Controller",
		localPairing = true,
		["0"] = {
			["io:KeypadController"] = var_0_6[420]
		}
	},
	["13194139729922"] = {
		name = "Pergola Side Screen With Battery SOMFY",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenWithBatteryIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = {
					["65537"] = var_0_6[480],
					["2146500638"] = var_0_6[1],
					["16832512"] = var_0_6[31],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[33],
					["2147426304"] = var_0_6[4],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57],
					["65556"] = var_0_6[260],
					["65557"] = var_0_6[36],
					["16830720"] = var_0_6[35]
				},
				attributes = var_0_6[59],
				commands = var_0_6[90]
			}
		}
	},
	["14293651357698"] = {
		name = "Awning Valance With Battery SOMFY",
		localPairing = true,
		["0"] = {
			["io:AwningValanceWithBatteryIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[495],
				attributes = var_0_6[59],
				commands = var_0_6[90]
			}
		}
	},
	["15393162985474"] = {
		name = "Drop Arm Awning With Battery SOMFY",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningWithBatteryIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = {
					["65537"] = var_0_6[484],
					["2146500638"] = var_0_6[1],
					["16832512"] = var_0_6[31],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[33],
					["2147426304"] = var_0_6[4],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57],
					["65556"] = var_0_6[260],
					["65557"] = var_0_6[36],
					["16830720"] = var_0_6[35]
				},
				attributes = var_0_6[59],
				commands = var_0_6[90]
			}
		}
	},
	["16492674613250"] = {
		name = "Vertical Exterior Awning With Battery SOMFY",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningWithBatteryIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = var_0_6[495],
				attributes = var_0_6[59],
				commands = var_0_6[90]
			}
		}
	},
	["16492674547714"] = {
		name = "Dynamic Roller Shutter",
		localPairing = true,
		["1"] = {
			["io:DynamicRollerShutterIOComponent"] = {
				type = 1,
				widget = "DynamicRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = {
					["65537"] = var_0_6[55],
					["2146500638"] = var_0_6[1],
					["16832512"] = var_0_6[31],
					["1"] = var_0_6[3],
					["16832522"] = var_0_6[33],
					["2147426304"] = var_0_6[4],
					["16830720"] = var_0_6[35],
					["65557"] = var_0_6[36],
					["2"] = var_0_6[56],
					["2146500645"] = var_0_6[57],
					["65556"] = var_0_6[260],
					["67362619648"] = var_0_6[496]
				},
				attributes = {
					["core:FirmwareRevision"] = var_0_5[0],
					["core:Manufacturer"] = var_0_5[1],
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[2],
					["io:Features"] = var_0_5[37]
				},
				commands = var_0_6[423]
			}
		},
		["2"] = var_0_6[497]
	},
	["4504699139653634"] = {
		name = "Actuo 40 io",
		localPairing = true,
		["0"] = var_0_6[511]
	},
	["4504699139129602"] = {
		name = "Altus GradHermetic io",
		localPairing = true,
		["0"] = {
			["io:GradHermeticIOComponent"] = {
				type = 1,
				widget = "PositionableOrOrientableRollerShutter",
				uiClass = "AdjustableSlatsRollerShutter",
				uiProfiles = var_0_6[72],
				states = {
					["84082687"] = {
						linkedHighLevelState = var_0_6[512],
						linkedStateIds = var_0_6[513]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[306],
							var_0_4[17],
							var_0_4[16],
							var_0_4[10]
						},
						linkedStateIds = var_0_6[514]
					},
					["65540"] = {
						linkedHighLevelState = {
							var_0_4[306],
							var_0_4[18]
						},
						linkedStateIds = var_0_6[515]
					},
					["48177664"] = {
						linkedHighLevelState = var_0_6[512],
						linkedStateIds = var_0_6[516]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832512"] = var_0_6[74],
					["16832522"] = var_0_6[75],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[517],
				commands = {
					setName = var_0_6[20],
					setOrientation = var_0_6[83],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setConfigState = var_0_6[25],
					setClosureOrRockerPosition = var_0_6[78],
					close = var_0_6[79],
					down = var_0_6[79],
					open = var_0_6[80],
					setClosure = var_0_6[81],
					setDeployment = var_0_6[81],
					setRockerPosition = var_0_6[82],
					up = var_0_6[80],
					startIdentify = var_0_6[21],
					stop = var_0_6[84],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					setClosureOrOrientation = var_0_6[77],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[521],
						converter = var_0_0[405],
						extraDefinition = var_0_6[45]
					},
					pairOneWayController = var_0_6[17],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[521],
						converter = var_0_0[406],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	["4505798650757378"] = {
		name = "Altus GradHermetic io",
		localPairing = true,
		["0"] = var_0_6[523]
	},
	["4504699139129346"] = {
		name = "Altus RS io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = {
					["16832512"] = var_0_6[31],
					["84082687"] = {
						linkedHighLevelState = {
							var_0_4[308]
						},
						linkedStateIds = var_0_6[243]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[308],
							var_0_4[5],
							var_0_4[12],
							var_0_4[10]
						},
						linkedStateIds = var_0_6[524]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[507],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[525],
						converter = var_0_0[411],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[525],
						converter = var_0_0[412],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	["4504699139471874"] = var_0_6[566],
	["4505798651099650"] = var_0_6[566],
	["4506898162727426"] = var_0_6[566],
	["4507997674355202"] = var_0_6[566],
	["4509097185982978"] = var_0_6[567],
	["4510196697610754"] = var_0_6[567],
	["4511296209238530"] = var_0_6[567],
	["4504699139340802"] = var_0_6[575],
	["4505798650968578"] = var_0_6[575],
	["4506898162596354"] = var_0_6[575],
	["4507997674224130"] = var_0_6[576],
	["4509097185851906"] = var_0_6[576],
	["4510196697479682"] = var_0_6[576],
	["4511296209107458"] = var_0_6[577],
	["4512395720735234"] = var_0_6[577],
	["4513495232363010"] = var_0_6[577],
	["4514594743990786"] = var_0_6[578],
	["4515694255618562"] = var_0_6[578],
	["4516793767246338"] = var_0_6[578],
	["4504699140112386"] = {
		name = "EVB-Slim Receiver for Variation WP IO Plug",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[583],
				attributes = var_0_6[584],
				commands = var_0_6[588]
			}
		}
	},
	["4505798651740162"] = var_0_6[589],
	["4506898163367938"] = var_0_6[589],
	["4507997674995714"] = {
		name = "EVB-Slim Receiver for Variation WP IO Plug",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[583],
				attributes = var_0_6[584],
				commands = var_0_6[588]
			}
		}
	},
	["4509097186623490"] = {
		name = "EVB-Slim Receiver for Variation",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[596],
				attributes = var_0_6[597],
				commands = var_0_6[601]
			}
		}
	},
	["4510196698251266"] = var_0_6[603],
	["4511296209879042"] = var_0_6[603],
	["4512395721506818"] = {
		name = "EVB-Slim Receiver for Variation",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[596],
				attributes = var_0_6[597],
				commands = var_0_6[601]
			}
		}
	},
	["4512395720866306"] = var_0_6[607],
	["4513495232494082"] = var_0_6[607],
	["4514594744121858"] = var_0_6[607],
	["4515694255749634"] = var_0_6[607],
	["4516793767377410"] = var_0_6[611],
	["4517893279005186"] = var_0_6[611],
	["4518992790632962"] = var_0_6[612],
	["4520092302260738"] = var_0_6[612],
	["4521191813888514"] = var_0_6[611],
	["4522291325516290"] = var_0_6[612],
	["4504699140389378"] = {
		name = "Heat Slim Rec io",
		localPairing = true,
		["0"] = {
			["io:DiscreteExteriorHeatingIOComponent"] = {
				type = 1,
				widget = "DiscreteExteriorHeating",
				uiClass = "ExteriorHeatingSystem",
				uiProfiles = var_0_6[228],
				states = {
					["84059651"] = var_0_6[613],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[315],
							var_0_4[57]
						},
						linkedStateIds = var_0_6[614]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[615],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					off = var_0_6[229],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[617],
					pairOneWayController = var_0_6[17],
					advancedRefresh = var_0_6[618],
					on = var_0_6[230]
				}
			}
		}
	},
	["4504699140374530"] = {
		name = "Heating Variation io",
		localPairing = true,
		["0"] = {
			["io:SimpleExteriorHeatingIOComponent"] = {
				type = 1,
				widget = "DimmerExteriorHeating",
				uiClass = "ExteriorHeatingSystem",
				uiProfiles = var_0_6[221],
				states = {
					["16832512"] = var_0_6[69],
					["84059651"] = var_0_6[613],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[315],
							var_0_4[1]
						},
						linkedStateIds = var_0_6[614]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[615],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setLevel = var_0_6[222],
					off = var_0_6[223],
					on = var_0_6[224],
					my = var_0_6[226],
					setConfigState = var_0_6[25],
					getLevel = var_0_6[158],
					startIdentify = var_0_6[21],
					stopIdentify = var_0_6[22],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[617],
					pairOneWayController = var_0_6[17],
					advancedRefresh = var_0_6[618]
				}
			}
		}
	},
	["4506898162385154"] = {
		name = "Holla Slateo B",
		localPairing = true,
		["0"] = {
			["io:VRHollaIOComponent"] = {
				type = 1,
				widget = "PositionableOrProgressiveOrientableRollerShutter",
				uiClass = "AdjustableSlatsRollerShutter",
				uiProfiles = var_0_6[474],
				states = {
					["84059651"] = var_0_6[500],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[305],
							var_0_4[17],
							var_0_4[16],
							var_0_4[10]
						},
						linkedStateIds = var_0_6[501]
					},
					["84059661"] = var_0_6[503],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["65540"] = var_0_6[73],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832512"] = var_0_6[74],
					["16832522"] = var_0_6[75],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[507],
				commands = {
					setName = var_0_6[20],
					setOrientation = var_0_6[83],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setClosureAndOrientation = var_0_6[475],
					setConfigState = var_0_6[25],
					setClosureOrRockerPosition = var_0_6[78],
					close = var_0_6[79],
					down = var_0_6[79],
					open = var_0_6[80],
					setClosure = var_0_6[81],
					setDeployment = var_0_6[81],
					setRockerPosition = var_0_6[82],
					up = var_0_6[80],
					startIdentify = var_0_6[21],
					stop = var_0_6[84],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					setClosureOrOrientation = var_0_6[77],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[509],
						converter = var_0_0[441],
						extraDefinition = var_0_6[45]
					},
					pairOneWayController = var_0_6[17],
					advancedRefresh = var_0_6[510]
				}
			}
		}
	},
	["4505798650757122"] = {
		name = "Ilmo io",
		localPairing = true,
		["0"] = var_0_6[619]
	},
	["4523390837144066"] = var_0_6[620],
	["4524490348771842"] = var_0_6[620],
	["4525589860399618"] = var_0_6[620],
	["4526689372027394"] = var_0_6[620],
	["4527788883655170"] = var_0_6[623],
	["4528888395282946"] = var_0_6[623],
	["4529987906910722"] = var_0_6[623],
	["4531087418538498"] = var_0_6[623],
	["4504699139981826"] = {
		name = "Izymo ON/OFF Micromodule io",
		localPairing = true,
		["0"] = {
			["io:SwitchMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "TimedOnOff",
				uiClass = "OnOff",
				uiProfiles = var_0_6[133],
				states = var_0_6[624],
				attributes = var_0_6[625],
				commands = var_0_6[627]
			}
		}
	},
	["4505798651609602"] = {
		name = "Izymo ON/OFF Micromodule io",
		localPairing = true,
		["0"] = {
			["io:LightMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "TimedOnOffLight",
				uiClass = "Light",
				uiProfiles = var_0_6[133],
				states = var_0_6[624],
				attributes = var_0_6[625],
				commands = var_0_6[627]
			}
		}
	},
	["4504699139391490"] = {
		name = "Izymo Dimmer Micromodule io",
		localPairing = true,
		["0"] = {
			["io:DimmableLightMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "DimmerLight",
				uiClass = "Light",
				uiProfiles = var_0_6[101],
				states = {
					["16832512"] = var_0_6[103],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[318],
							var_0_4[23],
							var_0_4[25]
						},
						linkedStateIds = {
							"84059651",
							"84059656"
						}
					},
					["84059656"] = {
						linkedHighLevelState = var_0_6[628],
						linkedStateIds = var_0_6[502]
					},
					["84059651"] = {
						linkedHighLevelState = var_0_6[628],
						linkedStateIds = {
							"65537",
							"84059656"
						}
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[50],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					increaseIntensityForBoundConfiguration = var_0_6[208],
					unpairAllOneWayControllers = var_0_6[23],
					setPosition = var_0_6[112],
					my = var_0_6[113],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[629],
						converter = var_0_0[454],
						extraDefinition = var_0_6[45]
					},
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[629],
						converter = var_0_0[455],
						extraDefinition = var_0_6[9]
					},
					saveBound = var_0_6[210],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					setIntensityWithTimer = var_0_6[109],
					onWithTimer = var_0_6[110],
					setIntensity = var_0_6[104],
					off = var_0_6[105],
					on = var_0_6[106],
					setOnOff = var_0_6[107],
					setMemorized1Position = var_0_6[111],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17],
					decreaseIntensityForBoundConfiguration = var_0_6[209]
				}
			}
		}
	},
	["4513495233134594"] = {
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[635],
				attributes = var_0_6[636],
				commands = var_0_6[640]
			}
		}
	},
	["4514594744762370"] = var_0_6[642],
	["4515694256390146"] = var_0_6[642],
	["4516793768017922"] = {
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[635],
				attributes = var_0_6[636],
				commands = var_0_6[640]
			}
		}
	},
	["4517893279645698"] = {
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[596],
				attributes = var_0_6[643],
				commands = var_0_6[645]
			}
		}
	},
	["4518992791273474"] = var_0_6[646],
	["4520092302901250"] = var_0_6[646],
	["4521191814529026"] = {
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[596],
				attributes = var_0_6[643],
				commands = var_0_6[645]
			}
		}
	},
	["4522291326156802"] = {
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[650],
				attributes = var_0_6[636],
				commands = var_0_6[653]
			}
		}
	},
	["4523390837784578"] = var_0_6[654],
	["4524490349412354"] = var_0_6[654],
	["4525589861040130"] = {
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[650],
				attributes = var_0_6[636],
				commands = var_0_6[653]
			}
		}
	},
	["4526689372667906"] = {
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[660],
				attributes = var_0_6[643],
				commands = var_0_6[664]
			}
		}
	},
	["4527788884295682"] = var_0_6[665],
	["4528888395923458"] = var_0_6[665],
	["4529987907551234"] = {
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[660],
				attributes = var_0_6[643],
				commands = var_0_6[664]
			}
		}
	},
	["4504699139391746"] = {
		name = "Lighting Variation io RGBW",
		localPairing = true,
		["0"] = {
			["io:DimmableRGBLightIOComponent"] = {
				type = 1,
				widget = "DimmerRGBColouredLight",
				uiClass = "Light",
				uiProfiles = var_0_6[101],
				states = {
					["16832512"] = var_0_6[103],
					["65547"] = {
						linkedHighLevelState = var_0_6[666],
						linkedStateIds = var_0_6[120]
					},
					["65548"] = {
						linkedHighLevelState = var_0_6[666],
						linkedStateIds = var_0_6[121]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[29],
							var_0_4[315],
							var_0_4[23],
							var_0_4[28],
							var_0_4[27],
							var_0_4[25]
						},
						linkedStateIds = {
							"65547",
							"65548",
							"84059651"
						}
					},
					["84059651"] = var_0_6[613],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["16832522"] = var_0_6[70],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[615],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setRGB = var_0_6[123],
					setSecuredPosition = var_0_6[114],
					setPosition = var_0_6[112],
					my = var_0_6[113],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = var_0_6[617],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[618],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					setIntensityWithTimer = var_0_6[109],
					onWithTimer = var_0_6[110],
					setIntensity = var_0_6[104],
					off = var_0_6[105],
					on = var_0_6[106],
					setOnOff = var_0_6[107],
					setMemorized1Position = var_0_6[111],
					wink = var_0_6[26],
					setRGBWithTimer = var_0_6[126],
					pairOneWayController = var_0_6[17]
				}
			}
		}
	},
	["4504699139392002"] = {
		name = "Lighting Variation io TW",
		localPairing = true,
		["0"] = {
			["io:DimmableColorTemperatureLightIOComponent"] = {
				type = 1,
				widget = "DimmerColorTemperatureLight",
				uiClass = "Light",
				uiProfiles = var_0_6[101],
				states = {
					["16832512"] = var_0_6[103],
					["84059651"] = var_0_6[613],
					["65537"] = var_0_6[667],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65551"] = var_0_6[128],
					["2146500645"] = var_0_6[57],
					["16832522"] = var_0_6[70],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[615],
				commands = {
					setColorTemperature = var_0_6[131],
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[114],
					setPosition = var_0_6[112],
					my = var_0_6[113],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					setIntensityWithTimer = var_0_6[109],
					onWithTimer = var_0_6[110],
					setIntensity = var_0_6[104],
					off = var_0_6[105],
					on = var_0_6[106],
					setOnOff = var_0_6[107],
					setMemorized1Position = var_0_6[111],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[617],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[618]
				}
			}
		}
	},
	["4504699139406338"] = {
		name = "Lighting Variation io White",
		localPairing = true,
		["0"] = {
			["io:OnOffLightIOComponent"] = {
				type = 1,
				widget = "StatefulOnOffLight",
				uiClass = "Light",
				uiProfiles = var_0_6[133],
				states = {
					["84059651"] = var_0_6[613],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[315],
							var_0_4[31]
						},
						linkedStateIds = var_0_6[614]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[615],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setConfigState = var_0_6[25],
					onWithTimer = var_0_6[135],
					startIdentify = var_0_6[21],
					setOnOff = var_0_6[136],
					off = var_0_6[137],
					on = var_0_6[138],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[617],
					pairOneWayController = var_0_6[17],
					advancedRefresh = var_0_6[618]
				}
			}
		}
	},
	["4505798651034114"] = {
		name = "Lighting receiver ONOFF io",
		localPairing = true,
		["0"] = {
			["io:OnOffLightIOComponent"] = {
				type = 1,
				widget = "StatefulOnOffLight",
				uiClass = "Light",
				uiProfiles = var_0_6[133],
				states = {
					["84059651"] = {
						linkedHighLevelState = {
							var_0_4[322]
						},
						linkedStateIds = var_0_6[243]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[322],
							var_0_4[31]
						},
						linkedStateIds = var_0_6[614]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1],
					["2146500645"] = var_0_6[57]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[53],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setConfigState = var_0_6[25],
					onWithTimer = var_0_6[135],
					startIdentify = var_0_6[21],
					setOnOff = var_0_6[136],
					off = var_0_6[137],
					on = var_0_6[138],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[616],
						converter = var_0_0[470],
						extraDefinition = var_0_6[45]
					},
					pairOneWayController = var_0_6[17],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[616],
						converter = var_0_0[471],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	["4505798651019266"] = {
		name = "Lighting receiver Variation io",
		localPairing = true,
		["0"] = {
			["io:DimmableLightIOComponent"] = {
				type = 1,
				widget = "DimmerLight",
				uiClass = "Light",
				uiProfiles = var_0_6[101],
				states = {
					["16832512"] = var_0_6[103],
					["84059651"] = var_0_6[613],
					["65537"] = var_0_6[667],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["16832522"] = var_0_6[70],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[615],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[114],
					setPosition = var_0_6[112],
					my = var_0_6[113],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					setIntensityWithTimer = var_0_6[109],
					onWithTimer = var_0_6[110],
					setIntensity = var_0_6[104],
					off = var_0_6[105],
					on = var_0_6[106],
					setOnOff = var_0_6[107],
					setMemorized1Position = var_0_6[111],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[617],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[618]
				}
			}
		}
	},
	["4504699139194882"] = {
		name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = var_0_6[675],
				attributes = var_0_6[676],
				commands = var_0_6[682]
			}
		}
	},
	["4505798650822658"] = {
		name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[675],
				attributes = var_0_6[676],
				commands = var_0_6[682]
			}
		}
	},
	["4506898162450434"] = {
		name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = var_0_6[683],
				attributes = var_0_6[676],
				commands = var_0_6[682]
			}
		}
	},
	["4507997674078210"] = {
		name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[675],
				attributes = var_0_6[676],
				commands = var_0_6[682]
			}
		}
	},
	["4509097185705986"] = {
		name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = var_0_6[675],
				attributes = var_0_6[684],
				commands = var_0_6[685]
			}
		}
	},
	["4510196697333762"] = {
		name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[675],
				attributes = var_0_6[684],
				commands = var_0_6[685]
			}
		}
	},
	["4511296208961538"] = {
		name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = var_0_6[683],
				attributes = var_0_6[684],
				commands = var_0_6[685]
			}
		}
	},
	["4512395720589314"] = {
		name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[675],
				attributes = var_0_6[684],
				commands = var_0_6[685]
			}
		}
	},
	["4531087419179010"] = {
		name = "My EVB Pro io",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[698],
				attributes = var_0_6[699],
				commands = var_0_6[704]
			}
		}
	},
	["4532186930806786"] = var_0_6[706],
	["4533286442434562"] = var_0_6[706],
	["4534385954062338"] = {
		name = "My EVB Pro io",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = var_0_6[28],
				states = var_0_6[698],
				attributes = var_0_6[699],
				commands = var_0_6[704]
			}
		}
	},
	["4535485465690114"] = var_0_6[718],
	["4536584977317890"] = var_0_6[719],
	["4537684488945666"] = var_0_6[719],
	["4538784000573442"] = var_0_6[720],
	["4539883512201218"] = var_0_6[718],
	["4540983023828994"] = var_0_6[719],
	["4542082535456770"] = var_0_6[719],
	["4543182047084546"] = var_0_6[720],
	["4506898162384898"] = {
		name = "OXIMO 40 io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[506],
				attributes = var_0_6[507],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[509],
						converter = var_0_0[485],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[510]
				}
			}
		}
	},
	["4507997674012674"] = {
		name = "OXIMO 40 io",
		localPairing = true,
		["0"] = var_0_6[721]
	},
	["4505798651281410"] = {
		name = "Optuo 40 io",
		localPairing = true,
		["0"] = var_0_6[511]
	},
	["4509097185640450"] = {
		name = "Oximo S Auto io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[723],
				attributes = var_0_6[507],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[724],
						converter = var_0_0[488],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[725]
				}
			}
		}
	},
	["4510196697268226"] = {
		name = "Oximo S Auto io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[723],
				attributes = var_0_6[507],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[724],
						converter = var_0_0[490],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[725]
				}
			}
		}
	},
	["4511296208896002"] = {
		name = "Oximo S Auto io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[727],
				attributes = var_0_6[507],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[724],
						converter = var_0_0[492],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[728]
				}
			}
		}
	},
	["4512395720523778"] = {
		name = "Oximo io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = {
					["16832512"] = var_0_6[31],
					["49020928"] = {
						linkedHighLevelState = {
							var_0_4[328]
						},
						linkedStateIds = var_0_6[243]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[328],
							var_0_4[5],
							var_0_4[12],
							var_0_4[10]
						},
						linkedStateIds = var_0_6[729]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[730],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[731],
						converter = var_0_0[496],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[731],
						converter = var_0_0[497],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	["4513495232151554"] = {
		name = "Oximo io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = {
					["16832512"] = var_0_6[31],
					["49020928"] = {
						linkedHighLevelState = {
							var_0_4[329]
						},
						linkedStateIds = var_0_6[243]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[329],
							var_0_4[5],
							var_0_4[12],
							var_0_4[10]
						},
						linkedStateIds = var_0_6[729]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[730],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[731],
						converter = var_0_0[499],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[731],
						converter = var_0_0[500],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	["4514594743779330"] = {
		name = "Oximo io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = {
					["16832512"] = var_0_6[31],
					["84082687"] = {
						linkedHighLevelState = {
							var_0_4[330]
						},
						linkedStateIds = var_0_6[243]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[330],
							var_0_4[5],
							var_0_4[12],
							var_0_4[10]
						},
						linkedStateIds = var_0_6[524]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[507],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[525],
						converter = var_0_0[502],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[525],
						converter = var_0_0[503],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	["4515694255407106"] = {
		name = "Oximo io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[732],
				attributes = var_0_6[507],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[525],
						converter = var_0_0[505],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[733]
				}
			}
		}
	},
	["4516793767034882"] = {
		name = "Oximo io",
		localPairing = true,
		["0"] = var_0_6[734]
	},
	["4517893278662658"] = var_0_6[735],
	["4518992790290434"] = var_0_6[735],
	["4504699140898818"] = {
		name = "Pergola Box io",
		localPairing = true,
		["0"] = {
			["io:SimpleBioclimaticPergolaIOComponent"] = {
				type = 1,
				widget = "BioclimaticPergola",
				uiClass = "Pergola",
				uiProfiles = var_0_6[252],
				states = {
					["16832512"] = var_0_6[253],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[78],
							var_0_4[305],
							var_0_4[80],
							var_0_4[79]
						},
						linkedStateIds = {
							"84059651",
							"84059661"
						}
					},
					["84059651"] = var_0_6[500],
					["84059661"] = var_0_6[503],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["16832522"] = var_0_6[254],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[507],
				commands = {
					setName = var_0_6[20],
					setOrientation = var_0_6[256],
					my = var_0_6[257],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					openSlats = var_0_6[99],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					refreshMemorized1Orientation = var_0_6[37],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[509],
						converter = var_0_0[508],
						extraDefinition = var_0_6[45]
					},
					closeSlats = var_0_6[98],
					pairOneWayController = var_0_6[17],
					setMemorized1Orientation = var_0_6[47],
					setSecuredOrientation = var_0_6[53],
					advancedRefresh = var_0_6[510]
				}
			}
		}
	},
	["4504699140047106"] = {
		name = "Pergola Gibus io",
		localPairing = true,
		["0"] = {
			["io:PergolaRailGuidedAwningIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwning",
				uiClass = "Pergola",
				uiProfiles = var_0_6[204],
				states = {
					["16832512"] = var_0_6[31],
					["84082687"] = {
						linkedHighLevelState = var_0_6[736],
						linkedStateIds = var_0_6[737]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[332],
							var_0_4[51],
							var_0_4[10],
							var_0_4[20]
						},
						linkedStateIds = var_0_6[738]
					},
					["48170496"] = {
						linkedHighLevelState = var_0_6[736],
						linkedStateIds = var_0_6[739]
					},
					["48171008"] = {
						linkedHighLevelState = var_0_6[736],
						linkedStateIds = var_0_6[740]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[58],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[742],
						converter = var_0_0[511],
						extraDefinition = var_0_6[45]
					},
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[742],
						converter = var_0_0[512],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	["4505798651674882"] = {
		name = "Pergola io",
		localPairing = true,
		["0"] = {
			["io:PergolaRailGuidedAwningIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwning",
				uiClass = "Pergola",
				uiProfiles = var_0_6[204],
				states = {
					["16832512"] = var_0_6[31],
					["84082687"] = {
						linkedHighLevelState = var_0_6[743],
						linkedStateIds = var_0_6[744]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[333],
							var_0_4[51],
							var_0_4[10],
							var_0_4[20]
						},
						linkedStateIds = var_0_6[745]
					},
					["48171008"] = {
						linkedHighLevelState = var_0_6[743],
						linkedStateIds = var_0_6[631]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[746],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[747],
						converter = var_0_0[515],
						extraDefinition = var_0_6[45]
					},
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[747],
						converter = var_0_0[516],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	["4506898163302658"] = {
		name = "Pergola io",
		localPairing = true,
		["0"] = {
			["io:PergolaRailGuidedAwningIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwning",
				uiClass = "Pergola",
				uiProfiles = var_0_6[204],
				states = {
					["16832512"] = var_0_6[31],
					["84082687"] = {
						linkedHighLevelState = var_0_6[748],
						linkedStateIds = var_0_6[744]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[334],
							var_0_4[51],
							var_0_4[10],
							var_0_4[20]
						},
						linkedStateIds = var_0_6[745]
					},
					["48171008"] = {
						linkedHighLevelState = var_0_6[748],
						linkedStateIds = var_0_6[631]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[746],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[747],
						converter = var_0_0[518],
						extraDefinition = var_0_6[45]
					},
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[747],
						converter = var_0_0[519],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	["4513495232217090"] = {
		name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaScreenIOComponent"] = {
				type = 1,
				widget = "PositionableAndStretchablePergolaScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[425],
				states = var_0_6[752],
				attributes = var_0_6[753],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setClosureOrTightPosition = var_0_6[426],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = var_0_6[754],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					setTightPosition = var_0_6[236],
					advancedRefresh = var_0_6[755],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17]
				}
			}
		}
	},
	["4514594743844866"] = {
		name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[756],
				attributes = var_0_6[753],
				commands = var_0_6[757]
			}
		}
	},
	["4515694255472642"] = {
		name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = var_0_6[758],
				attributes = var_0_6[753],
				commands = var_0_6[757]
			}
		}
	},
	["4516793767100418"] = {
		name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[756],
				attributes = var_0_6[753],
				commands = var_0_6[757]
			}
		}
	},
	["4517893278728194"] = {
		name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaScreenIOComponent"] = {
				type = 1,
				widget = "PositionableAndStretchablePergolaScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[425],
				states = var_0_6[752],
				attributes = var_0_6[753],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setClosureOrTightPosition = var_0_6[426],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					stopIdentify = var_0_6[22],
					runManufacturerSettingsCommand = var_0_6[759],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					refreshMemorized1Position = var_0_6[37],
					setTightPosition = var_0_6[236],
					advancedRefresh = var_0_6[755],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					pairOneWayController = var_0_6[17]
				}
			}
		}
	},
	["4518992790355970"] = {
		name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[756],
				attributes = var_0_6[753],
				commands = var_0_6[760]
			}
		}
	},
	["4520092301983746"] = {
		name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = var_0_6[758],
				attributes = var_0_6[753],
				commands = var_0_6[760]
			}
		}
	},
	["4521191813611522"] = {
		name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[756],
				attributes = var_0_6[753],
				commands = var_0_6[760]
			}
		}
	},
	["4520092301918210"] = {
		name = "RS Receiver io Manual",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[727],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[61],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[724],
						converter = var_0_0[526],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[728]
				}
			}
		}
	},
	["4517893278874114"] = var_0_6[763],
	["4518992790501890"] = var_0_6[763],
	["4520092302129666"] = var_0_6[763],
	["4521191813545986"] = var_0_6[773],
	["4522291325173762"] = var_0_6[773],
	["4523390836801538"] = var_0_6[773],
	["4524490348429314"] = var_0_6[773],
	["4525589860057090"] = var_0_6[776],
	["4526689371684866"] = var_0_6[776],
	["4527788883312642"] = var_0_6[776],
	["4528888394940418"] = var_0_6[776],
	["4529987906568194"] = var_0_6[776],
	["4531087418195970"] = var_0_6[778],
	["4532186929823746"] = var_0_6[776],
	["4533286441451522"] = var_0_6[778],
	["4534385953079298"] = var_0_6[776],
	["4535485464707074"] = var_0_6[778],
	["4536584976334850"] = var_0_6[778],
	["4537684487962626"] = var_0_6[778],
	["4538783999590402"] = var_0_6[778],
	["4539883511218178"] = var_0_6[778],
	["4540983022845954"] = var_0_6[778],
	["4542082534473730"] = var_0_6[778],
	["4543182046101506"] = var_0_6[778],
	["4544281557729282"] = var_0_6[778],
	["4545381069357058"] = var_0_6[778],
	["4546480580984834"] = var_0_6[778],
	["4547580092612610"] = var_0_6[779],
	["4548679604240386"] = var_0_6[779],
	["4549779115868162"] = var_0_6[779],
	["4550878627495938"] = var_0_6[779],
	["4551978139123714"] = var_0_6[779],
	["4553077650751490"] = var_0_6[780],
	["4554177162379266"] = var_0_6[782],
	["4555276674007042"] = var_0_6[779],
	["4556376185634818"] = var_0_6[780],
	["4557475697262594"] = var_0_6[782],
	["4558575208890370"] = var_0_6[779],
	["4559674720518146"] = var_0_6[780],
	["4560774232145922"] = var_0_6[782],
	["4561873743773698"] = var_0_6[780],
	["4562973255401474"] = var_0_6[782],
	["4564072767029250"] = var_0_6[782],
	["4565172278657026"] = var_0_6[782],
	["4566271790284802"] = var_0_6[782],
	["4567371301912578"] = var_0_6[782],
	["4568470813540354"] = var_0_6[782],
	["4569570325168130"] = var_0_6[782],
	["4584963487956994"] = var_0_6[790],
	["4570669836795906"] = var_0_6[792],
	["4586062999584770"] = var_0_6[790],
	["4571769348423682"] = var_0_6[792],
	["4587162511212546"] = var_0_6[794],
	["4572868860051458"] = var_0_6[795],
	["4588262022840322"] = var_0_6[794],
	["4573968371679234"] = var_0_6[795],
	["4589361534468098"] = var_0_6[794],
	["4575067883307010"] = var_0_6[795],
	["4504699140768002"] = {
		name = "Sliding window V0",
		localPairing = true,
		["0"] = {
			["io:PositionableAndLockableSlidingWindowComponent"] = {
				type = 1,
				widget = "PositionableAndLockableSlidingWindow",
				uiClass = "Window",
				uiProfiles = var_0_6[241],
				states = {
					["84059651"] = {
						linkedHighLevelState = {
							var_0_4[74],
							var_0_4[341],
							var_0_4[71],
							var_0_4[72],
							var_0_4[73],
							var_0_4[75]
						},
						linkedStateIds = {
							"65537",
							"84059666"
						}
					},
					["16832512"] = var_0_6[69],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[341],
							var_0_4[5],
							var_0_4[70]
						},
						linkedStateIds = {
							"65801",
							"84059651",
							"84059666"
						}
					},
					["84059666"] = {
						linkedHighLevelState = {
							var_0_4[341]
						},
						linkedStateIds = var_0_6[502]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["65546"] = var_0_6[242],
					["2"] = var_0_6[505],
					["65801"] = var_0_6[244],
					["2146500638"] = var_0_6[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[69],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					delayedStopIdentify = var_0_6[13],
					unpairAllOneWayControllers = var_0_6[23],
					setPosition = var_0_6[248],
					my = var_0_6[240],
					setPositionAndLinearSpeed = var_0_6[249],
					stopIdentify = var_0_6[22],
					deactivateTimer = var_0_6[246],
					lock = var_0_6[247],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[797],
						converter = var_0_0[553],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[19],
					close = var_0_6[237],
					open = var_0_6[238],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[797],
						converter = var_0_0[554],
						extraDefinition = var_0_6[9]
					},
					activateTimer = var_0_6[245],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unlock = var_0_6[250],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					identify = var_0_6[15],
					setClosureAndLinearSpeed = var_0_6[239],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					wink = var_0_6[26],
					setTimer = var_0_6[196],
					pairOneWayController = var_0_6[17]
				}
			}
		}
	},
	["4505798652395778"] = var_0_6[800],
	["4506898164023554"] = var_0_6[800],
	["4507997675651330"] = var_0_6[800],
	["4504699140046850"] = {
		name = "Slim Receiver Awning io",
		localPairing = true,
		["0"] = {
			["io:AwningReceiverUnoIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwningUno",
				uiClass = "Awning",
				uiProfiles = var_0_6[444],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = var_0_6[500],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[305],
							var_0_4[51],
							var_0_4[10],
							var_0_4[20]
						},
						linkedStateIds = var_0_6[501]
					},
					["84059661"] = var_0_6[503],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[801],
				commands = var_0_6[803]
			}
		}
	},
	["4507997674930434"] = {
		name = "Slim Receiver Pergola io",
		localPairing = true,
		["0"] = {
			["io:PergolaHorizontalUnoIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwningUno",
				uiClass = "Pergola",
				uiProfiles = var_0_6[446],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = var_0_6[500],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[305],
							var_0_4[10]
						},
						linkedStateIds = var_0_6[501]
					},
					["84059661"] = var_0_6[503],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[801],
				commands = var_0_6[803]
			}
		}
	},
	["4576167394934786"] = {
		name = "Slim Receiver RS io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterUnoIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutterUno",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[477],
				states = var_0_6[506],
				attributes = var_0_6[801],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[802],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[510]
				}
			}
		}
	},
	["4522291325239298"] = {
		name = "Slim Receiver Screen io",
		localPairing = true,
		["0"] = {
			["io:ScreenReceiverUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[489],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = var_0_6[805],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[343],
							var_0_4[10]
						},
						linkedStateIds = var_0_6[501]
					},
					["84059661"] = var_0_6[806],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[801],
				commands = var_0_6[807]
			}
		}
	},
	["4523390836867074"] = {
		name = "Slim Receiver Screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[808],
				attributes = var_0_6[801],
				commands = var_0_6[807]
			}
		}
	},
	["4524490348494850"] = {
		name = "Slim Receiver Screen io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = var_0_6[805],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[343],
							var_0_4[5],
							var_0_4[12],
							var_0_4[10],
							var_0_4[280]
						},
						linkedStateIds = var_0_6[501]
					},
					["84059661"] = var_0_6[806],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[801],
				commands = var_0_6[807]
			}
		}
	},
	["4525589860122626"] = {
		name = "Slim Receiver Screen io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[808],
				attributes = var_0_6[801],
				commands = var_0_6[807]
			}
		}
	},
	["4504699140243458"] = {
		name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:CurtainTrackUnoIOComponent"] = {
				type = 1,
				widget = "CurtainTrackUno",
				uiClass = "Curtain",
				uiProfiles = var_0_6[448],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = var_0_6[811],
					["65537"] = var_0_6[813],
					["84059661"] = var_0_6[815],
					["84059657"] = var_0_6[817],
					["84059659"] = var_0_6[819],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[75],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[820],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[822],
					setClosure = var_0_6[449],
					close = var_0_6[450],
					open = var_0_6[451],
					my = var_0_6[452],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[823]
				}
			}
		}
	},
	["4505798651674626"] = {
		name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningUnoIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwningUno",
				uiClass = "Awning",
				uiProfiles = var_0_6[444],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = var_0_6[811],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[344],
							var_0_4[51],
							var_0_4[10],
							var_0_4[20]
						},
						linkedStateIds = var_0_6[812]
					},
					["84059661"] = var_0_6[815],
					["84059657"] = var_0_6[817],
					["84059659"] = var_0_6[819],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[820],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[822],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[823]
				}
			}
		}
	},
	["4506898162909186"] = {
		name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:VerticalInteriorBlindUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "Screen",
				uiProfiles = var_0_6[441],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = var_0_6[811],
					["65537"] = var_0_6[813],
					["84059661"] = var_0_6[815],
					["84059657"] = var_0_6[817],
					["84059659"] = var_0_6[819],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[820],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[822],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[823]
				}
			}
		}
	},
	["4504699139260418"] = {
		name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:WindowOpenerUnoIOComponent"] = {
				type = 1,
				widget = "PositionableWindowUno",
				uiClass = "Window",
				uiProfiles = var_0_6[427],
				states = {
					["16830720"] = var_0_6[429],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[223],
							var_0_4[344]
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
					["120842"] = var_0_6[430],
					["120833"] = var_0_6[431],
					["120834"] = var_0_6[432],
					["120835"] = var_0_6[433],
					["84059651"] = var_0_6[811],
					["84059661"] = var_0_6[815],
					["84059657"] = var_0_6[817],
					["84059659"] = var_0_6[819],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1],
					["2146500645"] = var_0_6[57]
				},
				attributes = var_0_6[820],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[822],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					open = var_0_6[42],
					pairOneWayController = var_0_6[17],
					advancedRefresh = var_0_6[823]
				}
			}
		}
	},
	["4526689371750402"] = {
		name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[476],
				states = var_0_6[829],
				attributes = var_0_6[820],
				commands = var_0_6[830]
			}
		}
	},
	["4527788883378178"] = {
		name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[829],
				attributes = var_0_6[820],
				commands = var_0_6[830]
			}
		}
	},
	["4528888395005954"] = {
		name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = var_0_6[825],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[345],
							var_0_4[5],
							var_0_4[12],
							var_0_4[10],
							var_0_4[280]
						},
						linkedStateIds = var_0_6[812]
					},
					["84059661"] = var_0_6[826],
					["84059657"] = var_0_6[827],
					["84059659"] = var_0_6[828],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[820],
				commands = var_0_6[830]
			}
		}
	},
	["4529987906633730"] = {
		name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[829],
				attributes = var_0_6[820],
				commands = var_0_6[830]
			}
		}
	},
	["4577266906562562"] = {
		name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterUnoIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutterUno",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[477],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = var_0_6[811],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[344],
							var_0_4[5],
							var_0_4[12],
							var_0_4[10]
						},
						linkedStateIds = var_0_6[812]
					},
					["84059661"] = var_0_6[815],
					["84059657"] = var_0_6[817],
					["84059659"] = var_0_6[819],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[820],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[822],
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[823]
				}
			}
		}
	},
	["4578366418190338"] = {
		name = "Solus io",
		localPairing = true,
		["0"] = var_0_6[619]
	},
	["4507997674536962"] = {
		name = "Sonesse 40 io",
		localPairing = true,
		["0"] = var_0_6[511]
	},
	["4506898163302402"] = {
		name = "Sunea CSI io",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[199],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = {
						linkedHighLevelState = var_0_6[831],
						linkedStateIds = var_0_6[737]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[346],
							var_0_4[51],
							var_0_4[10],
							var_0_4[20]
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
					["48170496"] = {
						linkedHighLevelState = var_0_6[831],
						linkedStateIds = {
							"48171008",
							"65537",
							"84059651"
						}
					},
					["48171008"] = {
						linkedHighLevelState = var_0_6[831],
						linkedStateIds = {
							"48170496",
							"65537",
							"84059651"
						}
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[832],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[833],
						converter = var_0_0[567],
						extraDefinition = var_0_6[45]
					},
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[833],
						converter = var_0_0[568],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	["4507997674930178"] = {
		name = "Sunea Screen 40 io",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[199],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = {
						linkedHighLevelState = var_0_6[834],
						linkedStateIds = var_0_6[835]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[347],
							var_0_4[51],
							var_0_4[10],
							var_0_4[20]
						},
						linkedStateIds = var_0_6[836]
					},
					["48170496"] = {
						linkedHighLevelState = var_0_6[834],
						linkedStateIds = var_0_6[837]
					},
					["48171008"] = {
						linkedHighLevelState = var_0_6[834],
						linkedStateIds = var_0_6[672]
					},
					["84059664"] = {
						linkedHighLevelState = var_0_6[834],
						linkedStateIds = var_0_6[838]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[839],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[841],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[842]
				}
			}
		}
	},
	["4531087418261506"] = {
		name = "Sunea Screen 40 io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[848],
				attributes = var_0_6[839],
				commands = var_0_6[849]
			}
		}
	},
	["4532186929889282"] = {
		name = "Sunea Screen 40 io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = {
					["16832512"] = var_0_6[31],
					["84059651"] = var_0_6[844],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[348],
							var_0_4[5],
							var_0_4[12],
							var_0_4[10],
							var_0_4[280]
						},
						linkedStateIds = var_0_6[836]
					},
					["48170496"] = var_0_6[845],
					["48171008"] = var_0_6[846],
					["84059664"] = var_0_6[847],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[839],
				commands = var_0_6[849]
			}
		}
	},
	["4533286441517058"] = {
		name = "Sunea Screen 40 io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[848],
				attributes = var_0_6[839],
				commands = var_0_6[849]
			}
		}
	},
	["4534385953144834"] = {
		name = "Sunea Screen 40 io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = var_0_6[848],
				attributes = var_0_6[839],
				commands = var_0_6[849]
			}
		}
	},
	["4535485464772610"] = var_0_6[860],
	["4536584976400386"] = var_0_6[861],
	["4537684488028162"] = var_0_6[863],
	["4538783999655938"] = var_0_6[864],
	["4539883511283714"] = var_0_6[866],
	["4540983022911490"] = var_0_6[867],
	["4542082534539266"] = var_0_6[868],
	["4543182046167042"] = var_0_6[860],
	["4544281557794818"] = var_0_6[861],
	["4545381069422594"] = var_0_6[863],
	["4546480581050370"] = var_0_6[864],
	["4547580092678146"] = var_0_6[866],
	["4548679604305922"] = var_0_6[867],
	["4549779115933698"] = var_0_6[868],
	["4550878627561474"] = var_0_6[860],
	["4551978139189250"] = var_0_6[861],
	["4553077650817026"] = var_0_6[863],
	["4554177162444802"] = var_0_6[864],
	["4555276674072578"] = var_0_6[866],
	["4556376185700354"] = var_0_6[867],
	["4557475697328130"] = var_0_6[868],
	["4509097186557954"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[199],
				states = var_0_6[873],
				attributes = var_0_6[832],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[874],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[875]
				}
			}
		}
	},
	["4510196698185730"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[199],
				states = var_0_6[873],
				attributes = var_0_6[832],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[876],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[875]
				}
			}
		}
	},
	["4511296209813506"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[199],
				states = var_0_6[873],
				attributes = var_0_6[832],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[877],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[875]
				}
			}
		}
	},
	["4558575208955906"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = var_0_6[878],
				attributes = var_0_6[832],
				commands = var_0_6[879]
			}
		}
	},
	["4559674720583682"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[878],
				attributes = var_0_6[832],
				commands = var_0_6[879]
			}
		}
	},
	["4560774232211458"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = var_0_6[880],
				attributes = var_0_6[832],
				commands = var_0_6[879]
			}
		}
	},
	["4561873743839234"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[878],
				attributes = var_0_6[832],
				commands = var_0_6[879]
			}
		}
	},
	["4562973255467010"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = var_0_6[878],
				attributes = var_0_6[832],
				commands = var_0_6[881]
			}
		}
	},
	["4564072767094786"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[878],
				attributes = var_0_6[832],
				commands = var_0_6[881]
			}
		}
	},
	["4565172278722562"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = var_0_6[880],
				attributes = var_0_6[832],
				commands = var_0_6[881]
			}
		}
	},
	["4566271790350338"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[878],
				attributes = var_0_6[832],
				commands = var_0_6[881]
			}
		}
	},
	["4567371301978114"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = var_0_6[878],
				attributes = var_0_6[832],
				commands = var_0_6[882]
			}
		}
	},
	["4568470813605890"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[878],
				attributes = var_0_6[832],
				commands = var_0_6[882]
			}
		}
	},
	["4569570325233666"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = var_0_6[880],
				attributes = var_0_6[832],
				commands = var_0_6[882]
			}
		}
	},
	["4570669836861442"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[878],
				attributes = var_0_6[832],
				commands = var_0_6[882]
			}
		}
	},
	["4512395721441282"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[199],
				states = {
					["16832512"] = var_0_6[31],
					["84082687"] = var_0_6[884],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[351],
							var_0_4[51],
							var_0_4[10],
							var_0_4[20]
						},
						linkedStateIds = var_0_6[738]
					},
					["48170496"] = var_0_6[885],
					["48171008"] = var_0_6[886],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[832],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[887],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[888]
				}
			}
		}
	},
	["4513495233069058"] = var_0_6[895],
	["4571769348489218"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = var_0_6[896],
				attributes = var_0_6[832],
				commands = var_0_6[897]
			}
		}
	},
	["4572868860116994"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[896],
				attributes = var_0_6[832],
				commands = var_0_6[897]
			}
		}
	},
	["4573968371744770"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = {
					["16832512"] = var_0_6[31],
					["84082687"] = var_0_6[884],
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[351],
							var_0_4[5],
							var_0_4[12],
							var_0_4[10],
							var_0_4[280]
						},
						linkedStateIds = var_0_6[738]
					},
					["48170496"] = var_0_6[885],
					["48171008"] = var_0_6[886],
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832522"] = var_0_6[504],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[832],
				commands = var_0_6[897]
			}
		}
	},
	["4575067883372546"] = {
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[896],
				attributes = var_0_6[832],
				commands = var_0_6[897]
			}
		}
	},
	["4576167395000322"] = var_0_6[900],
	["4577266906628098"] = var_0_6[901],
	["4578366418255874"] = var_0_6[902],
	["4579465929883650"] = var_0_6[903],
	["4514594744696834"] = var_0_6[895],
	["4580565441511426"] = var_0_6[900],
	["4581664953139202"] = var_0_6[901],
	["4582764464766978"] = var_0_6[902],
	["4583863976394754"] = var_0_6[903],
	["4515694256324610"] = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[199],
				states = var_0_6[905],
				attributes = var_0_6[906],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[907],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[908]
				}
			}
		}
	},
	["4516793767952386"] = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[199],
				states = var_0_6[905],
				attributes = var_0_6[906],
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					setDeployment = var_0_6[38],
					close = var_0_6[42],
					deploy = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[40],
					setClosure = var_0_6[201],
					undeploy = var_0_6[42],
					up = var_0_6[42],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = var_0_6[909],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[908]
				}
			}
		}
	},
	["4584963488022530"] = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = var_0_6[910],
				attributes = var_0_6[906],
				commands = var_0_6[911]
			}
		}
	},
	["4586062999650306"] = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[910],
				attributes = var_0_6[906],
				commands = var_0_6[911]
			}
		}
	},
	["4587162511278082"] = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = var_0_6[912],
				attributes = var_0_6[906],
				commands = var_0_6[911]
			}
		}
	},
	["4588262022905858"] = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[910],
				attributes = var_0_6[906],
				commands = var_0_6[911]
			}
		}
	},
	["4589361534533634"] = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = var_0_6[87],
				states = var_0_6[910],
				attributes = var_0_6[906],
				commands = var_0_6[913]
			}
		}
	},
	["4590461046161410"] = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = var_0_6[479],
				states = var_0_6[910],
				attributes = var_0_6[906],
				commands = var_0_6[913]
			}
		}
	},
	["4591560557789186"] = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = var_0_6[483],
				states = var_0_6[912],
				attributes = var_0_6[906],
				commands = var_0_6[913]
			}
		}
	},
	["4592660069416962"] = {
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = var_0_6[487],
				states = var_0_6[910],
				attributes = var_0_6[906],
				commands = var_0_6[913]
			}
		}
	},
	["4517893279580162"] = var_0_6[917],
	["4593759581044738"] = var_0_6[920],
	["4594859092672514"] = var_0_6[921],
	["4595958604300290"] = var_0_6[922],
	["4597058115928066"] = var_0_6[923],
	["4518992791207938"] = var_0_6[917],
	["4598157627555842"] = var_0_6[920],
	["4599257139183618"] = var_0_6[921],
	["4600356650811394"] = var_0_6[922],
	["4601456162439170"] = var_0_6[923],
	["4579465929818114"] = var_0_6[924],
	["4580565441445890"] = var_0_6[924],
	["4581664953073666"] = {
		name = "T5 AS BHZ",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = var_0_6[54],
				states = var_0_6[727],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = var_0_5[76],
					["core:Manufacturer"] = var_0_5[1],
					["core:FirmwareRevision"] = var_0_5[0]
				},
				commands = {
					setName = var_0_6[20],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setSecuredPosition = var_0_6[53],
					setPosition = var_0_6[48],
					my = var_0_6[51],
					setConfigState = var_0_6[25],
					startIdentify = var_0_6[21],
					stop = var_0_6[63],
					setMemorized1Position = var_0_6[47],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[724],
						converter = var_0_0[596],
						extraDefinition = var_0_6[45]
					},
					setClosure = var_0_6[38],
					close = var_0_6[40],
					down = var_0_6[40],
					open = var_0_6[42],
					setDeployment = var_0_6[38],
					up = var_0_6[42],
					pairOneWayController = var_0_6[17],
					refreshMemorized1Position = var_0_6[37],
					advancedRefresh = var_0_6[728]
				}
			}
		}
	},
	["4582764464701442"] = {
		name = "T5 Auto BHz",
		localPairing = true,
		["0"] = var_0_6[619]
	},
	["4583863976329218"] = {
		name = "T5 BHZ",
		localPairing = true,
		["0"] = var_0_6[734]
	},
	["4507997674012930"] = {
		name = "Teba Slateo A",
		localPairing = true,
		["0"] = {
			["io:AdjustableSlatsRollerShutterIOComponent"] = {
				type = 1,
				widget = "PositionableOrOrientableRollerShutter",
				uiClass = "AdjustableSlatsRollerShutter",
				uiProfiles = var_0_6[72],
				states = {
					["84082687"] = {
						linkedHighLevelState = var_0_6[925],
						linkedStateIds = var_0_6[513]
					},
					["65537"] = {
						linkedHighLevelState = {
							var_0_4[355],
							var_0_4[17],
							var_0_4[16],
							var_0_4[10]
						},
						linkedStateIds = var_0_6[514]
					},
					["65540"] = {
						linkedHighLevelState = {
							var_0_4[355],
							var_0_4[18]
						},
						linkedStateIds = var_0_6[515]
					},
					["48177664"] = {
						linkedHighLevelState = var_0_6[925],
						linkedStateIds = var_0_6[516]
					},
					["2147426304"] = var_0_6[4],
					["1"] = var_0_6[3],
					["65557"] = var_0_6[36],
					["2146500645"] = var_0_6[57],
					["16830720"] = var_0_6[35],
					["16832512"] = var_0_6[74],
					["16832522"] = var_0_6[75],
					["2"] = var_0_6[505],
					["2146500638"] = var_0_6[1]
				},
				attributes = var_0_6[517],
				commands = {
					setName = var_0_6[20],
					setOrientation = var_0_6[83],
					sendIOKey = var_0_6[65],
					keepOneWayControllersAndDeleteNode = var_0_6[61],
					unpairOneWayController = var_0_6[24],
					getName = var_0_6[14],
					unpairAllOneWayControllersAndDeleteNode = var_0_6[64],
					delayedStopIdentify = var_0_6[13],
					identify = var_0_6[15],
					unpairAllOneWayControllers = var_0_6[23],
					setConfigState = var_0_6[25],
					setClosureOrRockerPosition = var_0_6[78],
					close = var_0_6[79],
					down = var_0_6[79],
					open = var_0_6[80],
					setClosure = var_0_6[81],
					setDeployment = var_0_6[81],
					setRockerPosition = var_0_6[82],
					up = var_0_6[80],
					startIdentify = var_0_6[21],
					stop = var_0_6[84],
					stopIdentify = var_0_6[22],
					wink = var_0_6[26],
					setClosureOrOrientation = var_0_6[77],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = var_0_6[44],
						rawStates = var_0_6[521],
						converter = var_0_0[598],
						extraDefinition = var_0_6[45]
					},
					pairOneWayController = var_0_6[17],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = var_0_6[8],
						rawStates = var_0_6[521],
						converter = var_0_0[599],
						extraDefinition = var_0_6[9]
					}
				}
			}
		}
	},
	["4509097185640706"] = {
		name = "Teba Slateo A",
		localPairing = true,
		["0"] = var_0_6[523]
	}
}
