-- same as 'io-devices.lua' with minor changes to make it python parsable
--   or use the extracted 'io-devices-n-name.lua' files
-- changes:
--   renamed 'var_0_*' for easier parsing with 'iown-iodevices-parser.py'
--   inserted nulled zero element: python array index starts with 0 instead of 1 as used by LuaJIT

ioDevices_Converter = {
  function(dummy)
    return nil
  end
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
ioDevices_calendar = {
	{
		kind = "DAILY",
		startHour = 0,
		endHour = 24
	}
}
ioDevices_Filter = {
	{reportingInterval = "4h"},
	{absoluteVariation = 0}
}
ioDevices_Refresh = {
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
		calendar = ioDevices_Filter[0]
	},
	{
		periodic = "10m",
		onRefreshAll = true,
		onStart = true
	},
	{
		onRefreshAll = false,
		onStart = false,
		calendar = ioDevices_Filter[0]
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
ioDevices_HighLevelStates = {
	{
		stateName = "core:DiscreteRSSILevelState",
		parameters = {
			{
				rawStateId = "2146500638",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[1]
	},
	{
		stateName = "core:LevelState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:NameState",
		parameters = {
			{
				rawStateId = "1",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[3]
	},
	{
		stateName = "core:RSSILevelState",
		parameters = {
			{
				rawStateId = "2146500638",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[4]
	},
	{
		stateName = "core:StatusState",
		parameters = {
			{
				rawStateId = "2147426304",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[5]
	},
	{
		stateName = "core:ClosureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:Memorized1PositionState",
		parameters = {
			{
				rawStateId = "16832512",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[2],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:OpenClosedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[20]
	},
	{
		stateName = "core:SecuredPositionState",
		parameters = {
			{
				rawStateId = "16832522",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:SlateOrientationState",
		parameters = {
			{
				rawStateId = "65538",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[2]
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
		converter = ioDevices_Converter[21]
	},
	{
		stateName = "core:MovingState",
		parameters = {
			{
				name = "p1",
				rawStateId = "65557",
				converter = ioDevices_Converter[22]
			}
		},
		converter = ioDevices_Converter[23]
	},
	{
		stateName = "core:OpenClosedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[29]
	},
	{
		stateName = "core:ManufacturerSettingsState",
		parameters = {
			{
				rawStateId = "2",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[30]
	},
	{
		stateName = "core:ManufacturerDiagnosticsState",
		parameters = {
			{
				rawStateId = "2",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[30]
	},
	{
		stateName = "core:AdditionalStatusState",
		parameters = {
			{
				rawStateId = "2146500645",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[31]
	},
	{
		stateName = "core:ClosureOrRockerPositionState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[37]
	},
	{
		stateName = "core:ClosureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[38]
	},
	{
		stateName = "core:SlateOrientationState",
		parameters = {
			{
				rawStateId = "65540",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:ProjectionAngleState",
		parameters = {
			{
				rawStateId = "65546",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:DeploymentState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:ClosureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[47]
	},
	{
		stateName = "core:OpenClosedUnknownState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[48]
	},
	{
		stateName = "core:LightIntensityState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[51]
	},
	{
		stateName = "core:Memorized1PositionState",
		parameters = {
			{
				rawStateId = "16832512",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[2],
		converter = ioDevices_Converter[51]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[52]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[59]
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
		converter = ioDevices_Converter[61]
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
		converter = ioDevices_Converter[62]
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
		converter = ioDevices_Converter[63]
	},
	{
		stateName = "core:ColorTemperatureState",
		parameters = {
			{
				rawStateId = "65551",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[66]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[68]
	},
	{
		stateName = "core:ClosureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[71]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[72]
	},
	{
		stateName = "core:PedestrianPositionState",
		parameters = {
			{
				rawStateId = "16832519",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[4],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:LockedUnlockedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[75]
	},
	{
		stateName = "core:OpenClosedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[76]
	},
	{
		stateName = "core:WindowLockedState",
		parameters = {
			{
				rawStateId = "65538",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[79]
	},
	{
		stateName = "core:LowerClosureState",
		parameters = {
			{
				rawStateId = "65539",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:LowerOpenClosedState",
		parameters = {
			{
				rawStateId = "65539",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[20]
	},
	{
		stateName = "core:UpperClosureState",
		parameters = {
			{
				rawStateId = "65538",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:UpperOpenClosedState",
		parameters = {
			{
				rawStateId = "65538",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[20]
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
		converter = ioDevices_Converter[85]
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
		converter = ioDevices_Converter[85]
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
		converter = ioDevices_Converter[85]
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
		converter = ioDevices_Converter[86]
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
		converter = ioDevices_Converter[87]
	},
	{
		stateName = "io:HeatingTemperatureInterfaceSetPointModeState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[92]
	},
	{
		stateName = "core:TimerState",
		parameters = {
			{
				rawStateId = "84059651",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[103],
		refresh = ioDevices_Refresh[0]
	},
	{
		stateName = "io:PairedMicroModuleWithLowBatteryState",
		parameters = {
			{
				rawStateId = "84059655",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[104],
		refresh = ioDevices_Refresh[0]
	},
	{
		stateName = "io:PictoState",
		parameters = {
			{
				rawStateId = "84059651",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[105],
		refresh = ioDevices_Refresh[0]
	},
	{
		stateName = "core:OpenClosedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[108]
	},
	{
		stateName = "core:Memorized1OrientationState",
		parameters = {
			{
				rawStateId = "17029120",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[4],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:AirInputState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:AirTransferState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:AirOutputState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:AirOutputLevelState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[116]
	},
	{
		stateName = "core:ComfortRoomTemperatureState",
		parameters = {
			{
				rawStateId = "16832527",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[119]
	},
	{
		stateName = "core:EcoRoomTemperatureState",
		parameters = {
			{
				rawStateId = "16832530",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[119]
	},
	{
		stateName = "core:HaltedRoomTemperatureState",
		parameters = {
			{
				rawStateId = "16832531",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[119]
	},
	{
		stateName = "core:SecondaryTemperatureState",
		parameters = {
			{
				rawStateId = "65545",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[120]
	},
	{
		stateName = "core:SetBackRoomTemperatureState",
		parameters = {
			{
				rawStateId = "16832526",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[119]
	},
	{
		stateName = "core:TargetRoomTemperatureState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[119]
	},
	{
		stateName = "core:TargetTemperatureState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[119]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[119]
	},
	{
		stateName = "io:HeatPumpActivesModesState",
		parameters = {
			{
				rawStateId = "65553",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[121]
	},
	{
		stateName = "io:HeatPumpCapabilitiesState",
		parameters = {
			{
				rawStateId = "65552",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[122]
	},
	{
		stateName = "core:ActiveZonesState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[125]
	},
	{
		stateName = "core:LockedUnlockedState",
		parameters = {
			{
				rawStateId = "65546",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[133]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[134]
	},
	{
		stateName = "core:OpeningDirectionState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059651",
				converter = ioDevices_Converter[135]
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[136]
	},
	{
		stateName = "core:RemainingTimeState",
		parameters = {
			{
				rawStateId = "84059651",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[137],
		refresh = ioDevices_Refresh[0]
	},
	{
		stateName = "core:SecuredVentilationFeatureState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059651",
				converter = ioDevices_Converter[138]
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[139]
	},
	{
		stateName = "core:TimerActivationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059651",
				converter = ioDevices_Converter[140]
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[141]
	},
	{
		stateName = "core:TimerState",
		parameters = {
			{
				rawStateId = "84059651",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[142],
		refresh = ioDevices_Refresh[0]
	},
	{
		stateName = "core:Memorized1OrientationState",
		parameters = {
			{
				rawStateId = "16832512",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[2],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:SecuredOrientationState",
		parameters = {
			{
				rawStateId = "16832522",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:SlatsOpenClosedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[20]
	},
	{
		stateName = "core:SlatsOrientationState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:SlateOrientationState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:BatteryState",
		parameters = {
			{
				rawStateId = "65556",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[149]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[150],
		refresh = ioDevices_Refresh[3]
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
		converter = ioDevices_Converter[159],
		refresh = ioDevices_Refresh[5]
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
		converter = ioDevices_Converter[85]
	},
	{
		stateName = "core:DHWPSoftwareVersionState",
		parameters = {
			{
				rawStateId = "201342977",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[160],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:DateTimeState",
		parameters = {
			{
				rawStateId = "201330433",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[161]
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
		converter = ioDevices_Converter[85]
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
		converter = ioDevices_Converter[85]
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
		converter = ioDevices_Converter[85]
	},
	{
		stateName = "core:ManufacturerNameState",
		parameters = {
			{
				rawStateId = "201328385",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[162],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:MaximalShowerManualModeState",
		parameters = {
			{
				rawStateId = "201343489",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[163],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:MaximalTemperatureManualModeState",
		parameters = {
			{
				rawStateId = "201343233",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[164],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:MinimalShowerManualModeState",
		parameters = {
			{
				rawStateId = "201343489",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[165],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:MinimalTemperatureManualModeState",
		parameters = {
			{
				rawStateId = "201343233",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[166],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:NumberOfTankState",
		parameters = {
			{
				rawStateId = "201341185",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[167],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:OperatingModeState",
		parameters = {
			{
				rawStateId = "65553",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[168],
		refresh = ioDevices_Refresh[0]
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
		converter = ioDevices_Converter[169]
	},
	{
		stateName = "core:WaterConsumptionState",
		parameters = {
			{
				rawStateId = "201326849",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[171],
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "io:AntiLegionellosisState",
		parameters = {
			{
				rawStateId = "201329665",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[167],
		refresh = ioDevices_Refresh[7],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "io:AwayModeDurationState",
		parameters = {
			{
				rawStateId = "201327873",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[172],
		refresh = ioDevices_Refresh[5]
	},
	{
		stateName = "io:BoilerInstallationOptionState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201330945",
				converter = ioDevices_Converter[167]
			}
		},
		refresh = ioDevices_Refresh[7],
		converter = ioDevices_Converter[173]
	},
	{
		stateName = "io:DHWCapacityState",
		parameters = {
			{
				rawStateId = "201328641",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[174]
	},
	{
		stateName = "io:DHWErrorState",
		parameters = {
			{
				rawStateId = "201327105",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[8],
		filter = ioDevices_Filter[1],
		converter = ioDevices_Converter[175]
	},
	{
		stateName = "io:DHWModeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201328129",
				converter = ioDevices_Converter[176]
			}
		},
		refresh = ioDevices_Refresh[8],
		filter = ioDevices_Filter[0],
		converter = ioDevices_Converter[177]
	},
	{
		stateName = "io:ElectricBoosterOperatingTimeState",
		parameters = {
			{
				rawStateId = "201327361",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[178],
		refresh = ioDevices_Refresh[0],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "io:ElectricalExtraManagementState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201330177",
				converter = ioDevices_Converter[167]
			}
		},
		refresh = ioDevices_Refresh[7],
		converter = ioDevices_Converter[179]
	},
	{
		stateName = "io:ExtractionOptionState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201331457",
				converter = ioDevices_Converter[167]
			}
		},
		refresh = ioDevices_Refresh[7],
		converter = ioDevices_Converter[180]
	},
	{
		stateName = "io:HeatPumpOperatingTimeState",
		parameters = {
			{
				rawStateId = "201327361",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[171],
		refresh = ioDevices_Refresh[0],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "io:InstallationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201330689",
				converter = ioDevices_Converter[167]
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[181]
	},
	{
		stateName = "io:MiddleWaterTemperatureState",
		parameters = {
			{
				rawStateId = "201332481",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[182],
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "io:OperatingModeCapabilitiesState",
		parameters = {
			{
				rawStateId = "65552",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[183],
		refresh = ioDevices_Refresh[0]
	},
	{
		stateName = "io:OperatingRangeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201329153",
				converter = ioDevices_Converter[176]
			}
		},
		refresh = ioDevices_Refresh[7],
		filter = ioDevices_Filter[0],
		converter = ioDevices_Converter[184]
	},
	{
		stateName = "io:PowerConsumptionFanState",
		parameters = {
			{
				rawStateId = "201337601",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[165],
		refresh = ioDevices_Refresh[9],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "io:PowerHeatElectricalState",
		parameters = {
			{
				rawStateId = "201339649",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[165],
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "io:PowerHeatPumpState",
		parameters = {
			{
				rawStateId = "201339905",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[165],
		refresh = ioDevices_Refresh[10],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "io:ProgrammingSlotsState",
		parameters = {
			{
				rawStateId = "201329409",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[185],
		refresh = ioDevices_Refresh[5]
	},
	{
		stateName = "io:RateManagementState",
		parameters = {
			{
				rawStateId = "65547",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[186],
		refresh = ioDevices_Refresh[0]
	},
	{
		stateName = "io:SmartGridOptionState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201331201",
				converter = ioDevices_Converter[167]
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[187]
	},
	{
		stateName = "core:ElectricEnergyConsumptionState",
		parameters = {
			{
				rawStateId = "201327617",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[203],
		refresh = ioDevices_Refresh[0],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:OnOffState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[204]
	},
	{
		stateName = "io:MaximumHeatingLevelState",
		parameters = {
			{
				rawStateId = "65547",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[205]
	},
	{
		stateName = "io:TargetHeatingLevelState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[206]
	},
	{
		stateName = "core:TargetHeatingLevelState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[206]
	},
	{
		stateName = "io:TimerForTransitoryStateState",
		parameters = {
			{
				rawStateId = "65548",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[2]
	},
	{
		stateName = "core:OperatingStateState",
		parameters = {
			{
				rawStateId = "218040320",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[210],
		refresh = ioDevices_Refresh[8]
	},
	{
		stateName = "core:TimeProgramState",
		parameters = {
			{
				rawStateId = "218041600",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[211]
	},
	{
		stateName = "io:AirDemandModeState",
		parameters = {
			{
				rawStateId = "16830720",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[212],
		refresh = ioDevices_Refresh[3]
	},
	{
		stateName = "io:CO2HistoryState",
		parameters = {
			{
				rawStateId = "84672513",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[6],
		converter = ioDevices_Converter[213]
	},
	{
		stateName = "io:EnergySavingState",
		parameters = {
			{
				rawStateId = "84672514",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[214],
		refresh = ioDevices_Refresh[11],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "io:InletEngineState",
		parameters = {
			{
				rawStateId = "218040320",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[215],
		refresh = ioDevices_Refresh[8]
	},
	{
		stateName = "io:OutletEngineState",
		parameters = {
			{
				rawStateId = "218040320",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[216],
		refresh = ioDevices_Refresh[8]
	},
	{
		stateName = "io:ProgCommandState",
		parameters = {
			{
				rawStateId = "218040320",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[217],
		refresh = ioDevices_Refresh[8]
	},
	{
		stateName = "io:RemainingTimeBeforeFilterChangeState",
		parameters = {
			{
				rawStateId = "218040320",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[218],
		refresh = ioDevices_Refresh[8]
	},
	{
		stateName = "io:SensorsErrorState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0],
		converter = ioDevices_Converter[219]
	},
	{
		stateName = "io:VentilationConfigurationModeState",
		parameters = {
			{
				rawStateId = "65553",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[220],
		refresh = ioDevices_Refresh[0]
	},
	{
		stateName = "io:VentilationModeState",
		parameters = {
			{
				rawStateId = "218040064",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[221]
	},
	{
		stateName = "core:CO2ConcentrationState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[171],
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[229],
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[230],
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[231],
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[232],
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "218040576",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[233],
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0]
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
		converter = ioDevices_Converter[234]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "2415919106",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[237]
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
		converter = ioDevices_Converter[239],
		refresh = ioDevices_Refresh[6]
	},
	{
		stateName = "core:NameState",
		parameters = {
			{
				rawStateId = "2415919105",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[240],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:WaterConsumptionState",
		parameters = {
			{
				rawStateId = "83935248",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[239],
		refresh = ioDevices_Refresh[6]
	},
	{
		stateName = "core:ThermalEnergyConsumptionState",
		parameters = {
			{
				rawStateId = "83935248",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[239],
		refresh = ioDevices_Refresh[6]
	},
	{
		stateName = "core:ElectricEnergyConsumptionState",
		parameters = {
			{
				rawStateId = "83935248",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[239],
		refresh = ioDevices_Refresh[6]
	},
	{
		stateName = "core:ElectricEnergyConsumptionState",
		parameters = {
			{
				rawStateId = "83902467",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[241],
		refresh = ioDevices_Refresh[0]
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
		converter = ioDevices_Converter[242]
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
		converter = ioDevices_Converter[243]
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
		converter = ioDevices_Converter[244]
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
		converter = ioDevices_Converter[245]
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
		converter = ioDevices_Converter[246]
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
		converter = ioDevices_Converter[247]
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
		converter = ioDevices_Converter[248]
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
		converter = ioDevices_Converter[250]
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
		converter = ioDevices_Converter[251]
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
		converter = ioDevices_Converter[252]
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
		converter = ioDevices_Converter[253]
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
		converter = ioDevices_Converter[254]
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
		converter = ioDevices_Converter[255]
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
		converter = ioDevices_Converter[256]
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
		converter = ioDevices_Converter[257]
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
		converter = ioDevices_Converter[258]
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
		converter = ioDevices_Converter[259]
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
		converter = ioDevices_Converter[260]
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
		converter = ioDevices_Converter[261]
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
		converter = ioDevices_Converter[262]
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
		converter = ioDevices_Converter[244]
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
		converter = ioDevices_Converter[263]
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
		converter = ioDevices_Converter[264]
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
		converter = ioDevices_Converter[265]
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
		converter = ioDevices_Converter[266]
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
		converter = ioDevices_Converter[267]
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
		converter = ioDevices_Converter[268]
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
		converter = ioDevices_Converter[269]
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
		converter = ioDevices_Converter[270]
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
		converter = ioDevices_Converter[271]
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
		converter = ioDevices_Converter[272]
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
		converter = ioDevices_Converter[273]
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
		converter = ioDevices_Converter[274]
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
		converter = ioDevices_Converter[275]
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
		converter = ioDevices_Converter[276]
	},
	{
		stateName = "io:AllowForceHeatingState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201392128",
				converter = ioDevices_Converter[159]
			}
		},
		refresh = ioDevices_Refresh[5],
		converter = ioDevices_Converter[277]
	},
	{
		stateName = "io:ForceHeatingState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201326592",
				converter = ioDevices_Converter[159]
			}
		},
		converter = ioDevices_Converter[277]
	},
	{
		stateName = "core:CurrentTariffNumberState",
		parameters = {
			{
				rawStateId = "83902467",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[279],
		refresh = ioDevices_Refresh[0]
	},
	{
		stateName = "core:ElectricalContractIntensityState",
		parameters = {
			{
				rawStateId = "201457664",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[176]
	},
	{
		stateName = "core:ElectricalContractNameState",
		parameters = {
			{
				rawStateId = "83902464",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[280],
		refresh = ioDevices_Refresh[0]
	},
	{
		stateName = "core:ElectricalMeterTypeState",
		parameters = {
			{
				rawStateId = "83902464",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[281],
		refresh = ioDevices_Refresh[0]
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
				converter = ioDevices_Converter[159]
			}
		},
		converter = ioDevices_Converter[283]
	},
	{
		stateName = "io:ConfigurationServicesState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201523200",
				converter = ioDevices_Converter[159]
			}
		},
		converter = ioDevices_Converter[284]
	},
	{
		stateName = "core:SmokeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "2415919106",
				converter = ioDevices_Converter[287]
			}
		},
		converter = ioDevices_Converter[288]
	},
	{
		stateName = "io:MaintenanceRadioPartBatteryState",
		parameters = {
			{
				rawStateId = "83902976",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[289]
	},
	{
		stateName = "io:MaintenanceSensorPartBatteryState",
		parameters = {
			{
				rawStateId = "83902976",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[290]
	},
	{
		stateName = "io:SensorRoomState",
		parameters = {
			{
				rawStateId = "2415919110",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[291]
	},
	{
		stateName = "core:ContactState",
		parameters = {
			{
				name = "p1",
				rawStateId = "2415919106",
				converter = ioDevices_Converter[287]
			}
		},
		converter = ioDevices_Converter[293]
	},
	{
		stateName = "core:SensorDefectState",
		parameters = {
			{
				name = "p1",
				rawStateId = "2415919110",
				converter = ioDevices_Converter[234]
			}
		},
		converter = ioDevices_Converter[294]
	},
	{
		stateName = "core:OccupancyState",
		parameters = {
			{
				name = "p1",
				rawStateId = "2415919106",
				converter = ioDevices_Converter[287]
			}
		},
		converter = ioDevices_Converter[295]
	},
	{
		stateName = "core:RainState",
		parameters = {
			{
				name = "p1",
				rawStateId = "2415919106",
				converter = ioDevices_Converter[296]
			}
		},
		converter = ioDevices_Converter[297]
	},
	{
		stateName = "core:TiltedState",
		parameters = {
			{
				rawStateId = "18183012483074",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[298]
	},
	{
		stateName = "core:OpenClosedState",
		parameters = {
			{
				rawStateId = "18183012483074",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[299]
	},
	{
		stateName = "core:LockedUnlockedState",
		parameters = {
			{
				rawStateId = "18183012483074",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[300]
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
		converter = ioDevices_Converter[304]
	},
	{
		stateName = "core:VibrationLevelThresholdState",
		parameters = {
			{
				rawStateId = "83903234",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[305],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "io:OneWayControllerButtonState",
		parameters = {
			{
				rawStateId = "33554442",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[315]
	},
	{
		stateName = "io:OneWayStoppableButtonState",
		parameters = {
			{
				rawStateId = "33554442",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[317]
	},
	{
		stateName = "io:OneWayStoppableButtonState",
		parameters = {
			{
				rawStateId = "33554443",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[317]
	},
	{
		stateName = "core:ClosureOrTightPositionState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[320]
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
		converter = ioDevices_Converter[322]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[323]
	},
	{
		stateName = "core:LockedUnlockedState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[325]
	},
	{
		stateName = "core:OpenClosedState",
		parameters = {
			{
				rawStateId = "65556",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[326]
	},
	{
		stateName = "core:ComfortTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832527",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[331]
	},
	{
		stateName = "core:EcoTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832530",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[331]
	},
	{
		stateName = "core:FrostProtectionTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832534",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[331]
	},
	{
		stateName = "core:HaltedTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832531",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[331]
	},
	{
		stateName = "core:SecuredPositionTemperatureState",
		parameters = {
			{
				rawStateId = "16832522",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[331]
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
		converter = ioDevices_Converter[332]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[331]
	},
	{
		stateName = "io:DHWCapacityState",
		parameters = {
			{
				rawStateId = "201328641",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[333]
	},
	{
		stateName = "core:ActiveTimeProgramState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = ioDevices_Converter[336]
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[337]
	},
	{
		stateName = "core:BatteryLevelState",
		parameters = {
			{
				rawStateId = "84059682",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[338],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:ComfortRoomTemperatureState",
		parameters = {
			{
				rawStateId = "84059685",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[339],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:DerogatedTargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059681",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[340],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:DerogationEndDateTimeState",
		parameters = {
			{
				rawStateId = "84059681",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[341],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:DerogationStartDateTimeState",
		parameters = {
			{
				rawStateId = "84059681",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[342],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:EcoTargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059685",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[343],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:FrostProtectionRoomTemperatureState",
		parameters = {
			{
				rawStateId = "84059685",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[344],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:MaxSetpointState",
		parameters = {
			{
				rawStateId = "84059684",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[345],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:MinSetpointState",
		parameters = {
			{
				rawStateId = "84059684",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[346],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:OpenClosedValveState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059680",
				converter = ioDevices_Converter[347]
			}
		},
		refresh = ioDevices_Refresh[1],
		filter = ioDevices_Filter[1],
		converter = ioDevices_Converter[348]
	},
	{
		stateName = "core:OpenWindowDetectionActivationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = ioDevices_Converter[347]
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[349]
	},
	{
		stateName = "core:OperatingModeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059680",
				converter = ioDevices_Converter[350]
			}
		},
		refresh = ioDevices_Refresh[1],
		filter = ioDevices_Filter[1],
		converter = ioDevices_Converter[351]
	},
	{
		stateName = "core:SensorDefectState",
		parameters = {
			{
				rawStateId = "84059682",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[352],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:TargetRoomTemperatureState",
		parameters = {
			{
				rawStateId = "84059680",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[353],
		refresh = ioDevices_Refresh[1],
		filter = ioDevices_Filter[1]
	},
	{
		stateName = "core:TargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059680",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[353],
		refresh = ioDevices_Refresh[1],
		filter = ioDevices_Filter[1]
	},
	{
		stateName = "core:TemperatureOffsetConfigurationState",
		parameters = {
			{
				rawStateId = "84059684",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[354],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:TimeProgram1State",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059686",
				converter = ioDevices_Converter[355]
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[356]
	},
	{
		stateName = "core:TimeProgram2State",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059687",
				converter = ioDevices_Converter[355]
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[356]
	},
	{
		stateName = "io:AwayModeTargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059685",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[357],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "io:ByPassActivationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = ioDevices_Converter[358]
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[359]
	},
	{
		stateName = "io:CurrentHeatingModeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059680",
				converter = ioDevices_Converter[360]
			}
		},
		refresh = ioDevices_Refresh[1],
		filter = ioDevices_Filter[1],
		converter = ioDevices_Converter[361]
	},
	{
		stateName = "io:DerogationHeatingModeState",
		parameters = {
			{
				rawStateId = "84059681",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[362],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "io:DerogationTypeState",
		parameters = {
			{
				rawStateId = "84059681",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[363],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "io:GeofencingModeTargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059685",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[364],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "io:LockKeyActivationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = ioDevices_Converter[350]
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[365]
	},
	{
		stateName = "io:ManualModeTargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059681",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[340],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "io:OpenWindowDetectedTargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059685",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[366],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "io:ValveInstallationModeState",
		parameters = {
			{
				rawStateId = "84059682",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[367],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "84059680",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[373],
		refresh = ioDevices_Refresh[1],
		filter = ioDevices_Filter[1]
	},
	{
		stateName = "core:ComfortTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832527",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[375]
	},
	{
		stateName = "core:EcoTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832530",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[375]
	},
	{
		stateName = "core:FrostProtectionTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832534",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[375]
	},
	{
		stateName = "core:HaltedTargetTemperatureState",
		parameters = {
			{
				rawStateId = "16832531",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[375]
	},
	{
		stateName = "core:SecuredPositionTemperatureState",
		parameters = {
			{
				rawStateId = "16832522",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[375]
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
		refresh = ioDevices_Refresh[3],
		converter = ioDevices_Converter[376]
	},
	{
		stateName = "core:TemperatureState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[377]
	},
	{
		stateName = "core:HeatingAnticipationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = ioDevices_Converter[380]
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[365]
	},
	{
		stateName = "core:PermanentDisplayState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = ioDevices_Converter[358]
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[365]
	},
	{
		stateName = "core:ThermalConfigurationState",
		parameters = {
			{
				name = "p1",
				rawStateId = "84059684",
				converter = ioDevices_Converter[381]
			}
		},
		refresh = ioDevices_Refresh[1],
		converter = ioDevices_Converter[382]
	},
	{
		stateName = "core:TargetRoomTemperatureState",
		parameters = {
			{
				rawStateId = "84059680",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[383],
		refresh = ioDevices_Refresh[1],
		filter = ioDevices_Filter[1]
	},
	{
		stateName = "core:TargetTemperatureState",
		parameters = {
			{
				rawStateId = "84059680",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[383],
		refresh = ioDevices_Refresh[1],
		filter = ioDevices_Filter[1]
	},
	{
		stateName = "core:TargetTemperatureHysteresisState",
		parameters = {
			{
				rawStateId = "84059684",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[384],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:TemperatureOffsetConfigurationState",
		parameters = {
			{
				rawStateId = "84059684",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[385],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:RelativeHumidityState",
		parameters = {
			{
				rawStateId = "84059680",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[387],
		refresh = ioDevices_Refresh[1],
		filter = ioDevices_Filter[1]
	},
	{
		stateName = "core:DeploymentState",
		parameters = {
			{
				rawStateId = "65537",
				name = "p1"
			}
		},
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[388]
	},
	{
		stateName = "core:V40WaterVolumeEstimationState",
		parameters = {
			{
				rawStateId = "201339137",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[389],
		refresh = ioDevices_Refresh[12],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:AbsenceEndDateState",
		parameters = {
			{
				rawStateId = "201351937",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[161]
	},
	{
		stateName = "core:AbsenceStartDateState",
		parameters = {
			{
				rawStateId = "201351681",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[161]
	},
	{
		stateName = "core:BoostElectricPowerConsumptionState",
		parameters = {
			{
				rawStateId = "201343745",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[165],
		refresh = ioDevices_Refresh[6]
	},
	{
		stateName = "core:BoostEndDateState",
		parameters = {
			{
				rawStateId = "201351425",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[161]
	},
	{
		stateName = "core:BoostStartDateState",
		parameters = {
			{
				rawStateId = "201351169",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[161]
	},
	{
		stateName = "core:BottomTankWaterTemperatureState",
		parameters = {
			{
				rawStateId = "201332993",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[182],
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:ControlWaterTargetTemperatureState",
		parameters = {
			{
				rawStateId = "201345281",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[166],
		refresh = ioDevices_Refresh[0],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:ExpectedNumberOfShowerState",
		parameters = {
			{
				rawStateId = "201345025",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[167],
		refresh = ioDevices_Refresh[0],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:HeatingStatusState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201352193",
				converter = ioDevices_Converter[390]
			}
		},
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0],
		converter = ioDevices_Converter[391]
	},
	{
		stateName = "core:MiddleWaterTemperatureInState",
		parameters = {
			{
				rawStateId = "201344257",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[166],
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:NumberOfShowerRemainingState",
		parameters = {
			{
				rawStateId = "201344513",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[167],
		refresh = ioDevices_Refresh[6],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:PowerHeatElectricalInState",
		parameters = {
			{
				rawStateId = "201344001",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[165],
		refresh = ioDevices_Refresh[6]
	},
	{
		stateName = "core:ProgrammingAvailableState",
		parameters = {
			{
				rawStateId = "201340929",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[167],
		refresh = ioDevices_Refresh[1]
	},
	{
		stateName = "core:StopRelaunchState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201340417",
				converter = ioDevices_Converter[167]
			}
		},
		refresh = ioDevices_Refresh[0],
		filter = ioDevices_Filter[0],
		converter = ioDevices_Converter[392]
	},
	{
		stateName = "core:WaterTargetTemperatureState",
		parameters = {
			{
				rawStateId = "201344769",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[166],
		refresh = ioDevices_Refresh[0],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:TargetDHWTemperatureState",
		parameters = {
			{
				rawStateId = "201344769",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[166],
		refresh = ioDevices_Refresh[0],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "core:WaterTemperatureState",
		parameters = {
			{
				rawStateId = "201344769",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[166],
		refresh = ioDevices_Refresh[0],
		filter = ioDevices_Filter[0]
	},
	{
		stateName = "io:DHWAbsenceModeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201347841",
				converter = ioDevices_Converter[167]
			}
		},
		refresh = ioDevices_Refresh[5],
		filter = ioDevices_Filter[0],
		converter = ioDevices_Converter[393]
	},
	{
		stateName = "io:DHWBoostModeState",
		parameters = {
			{
				name = "p1",
				rawStateId = "201347585",
				converter = ioDevices_Converter[167]
			}
		},
		refresh = ioDevices_Refresh[5],
		filter = ioDevices_Filter[0],
		converter = ioDevices_Converter[393]
	},
	{
		stateName = "io:OneWayControllerButtonState",
		parameters = {
			{
				rawStateId = "65555",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[396]
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
		converter = ioDevices_Converter[398]
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
		converter = ioDevices_Converter[399]
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
		converter = ioDevices_Converter[403]
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
		converter = ioDevices_Converter[407]
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
		converter = ioDevices_Converter[410]
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
		converter = ioDevices_Converter[413]
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
		converter = ioDevices_Converter[417]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[421]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[425]
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
		converter = ioDevices_Converter[429]
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
		converter = ioDevices_Converter[433]
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
		converter = ioDevices_Converter[437]
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
		converter = ioDevices_Converter[444]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[448]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[452]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[456]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[462]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[465]
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
		converter = ioDevices_Converter[468]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[472]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[478]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[482]
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
		converter = ioDevices_Converter[487]
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
		converter = ioDevices_Converter[491]
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
		converter = ioDevices_Converter[494]
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
		converter = ioDevices_Converter[498]
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
		converter = ioDevices_Converter[501]
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
		converter = ioDevices_Converter[504]
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
		converter = ioDevices_Converter[509]
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
		converter = ioDevices_Converter[513]
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
		converter = ioDevices_Converter[517]
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
		converter = ioDevices_Converter[520]
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
		converter = ioDevices_Converter[527]
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
		converter = ioDevices_Converter[531]
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
		converter = ioDevices_Converter[535]
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
		converter = ioDevices_Converter[541]
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
		converter = ioDevices_Converter[545]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[551]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[555]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[399]
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
		converter = ioDevices_Converter[561]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[561]
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
		converter = ioDevices_Converter[565]
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
		converter = ioDevices_Converter[569]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[569]
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
		refresh = ioDevices_Refresh[0],
		converter = ioDevices_Converter[573]
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
		converter = ioDevices_Converter[576]
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
		converter = ioDevices_Converter[581]
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
		converter = ioDevices_Converter[584]
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
		converter = ioDevices_Converter[587]
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
		converter = ioDevices_Converter[592]
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
		converter = ioDevices_Converter[597]
	}
}
ioDevices_Attributes = {
	{
		rawName = "io:generalinfo1",
		type = 3,
		converter = ioDevices_Converter[6]
	},
	{
		rawName = "io:manufacturerid",
		type = 3,
		converter = ioDevices_Converter[7]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[30]
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
		converter = ioDevices_Converter[235]
	},
	{
		rawName = "io:measuredvaluetype",
		type = 3,
		converter = ioDevices_Converter[236]
	},
	{
		rawName = "_io:minsensedvalue",
		type = 2,
		converter = ioDevices_Converter[235]
	},
	{
		defaultValue = "battery",
		type = 3
	},
	{
		rawName = "io:measuredvaluetype",
		type = 3,
		converter = ioDevices_Converter[238]
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
		converter = ioDevices_Converter[235]
	},
	{
		rawName = "io:gas-cooking",
		type = 6,
		converter = ioDevices_Converter[235]
	},
	{
		rawName = "io:gas-dhw",
		type = 6,
		converter = ioDevices_Converter[235]
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
		converter = ioDevices_Converter[301]
	},
	{
		rawName = "_io:configuration-window",
		type = 3,
		converter = ioDevices_Converter[302]
	},
	{
		rawName = "_io:configuration-window",
		type = 2,
		converter = ioDevices_Converter[303]
	},
	{
		rawName = "_io:configuration-intrusion",
		type = 2,
		converter = ioDevices_Converter[301]
	},
	{
		rawName = "_io:configuration-intrusion",
		type = 3,
		converter = ioDevices_Converter[302]
	},
	{
		rawName = "_io:configuration-intrusion",
		type = 2,
		converter = ioDevices_Converter[303]
	},
	{
		defaultValue = "IO Repeater",
		type = 3
	},
	{
		rawName = "core:groupid",
		type = 3,
		converter = ioDevices_Converter[316]
	},
	{
		rawName = "core:groupindex",
		type = 3,
		converter = ioDevices_Converter[316]
	},
	{
		rawName = "io:parametersManagement",
		type = 10,
		extraRawNames = {
			"io:eventingSystem",
			"io:autonomy"
		},
		converter = ioDevices_Converter[397]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[400]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[404]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[414]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[418]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[422]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[426]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[430]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[434]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[438]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[442]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[445]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[449]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[453]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[457]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[460]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[469]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[473]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[476]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[479]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[495]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[510]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[514]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[521]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[525]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[528]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[532]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[536]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[539]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[542]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[546]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[549]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[552]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[556]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[559]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[562]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[566]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[570]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[588]
	},
	{
		rawName = "io:generalinfo1",
		type = 10,
		converter = ioDevices_Converter[595]
	}
}
ioDevices_Data = {
  { dummy = nil },
  {
		linkedHighLevelState = {
			ioDevices_HighLevelStates[0],
			ioDevices_HighLevelStates[3]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[1]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[2]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[4]
		}
	},
	{
		["core:FirmwareRevision"] = ioDevices_Attributes[0],
		["core:Manufacturer"] = ioDevices_Attributes[1]
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
		ioDevices_Data[6],
		ioDevices_Data[7]
	},
	{
		access = "r",
		parameterId = "65554"
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		converter = ioDevices_Converter[8],
		extraDefinition = ioDevices_Data[9]
	},
	{
		ioDevices_Data[6]
	},
	{
		access = "w",
		parameterId = "4"
	},
	{
		prototype = "integer[1;254]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[9],
		extraDefinition = ioDevices_Data[12]
	},
	{
		extraDefinition = {
			access = "r",
			parameterId = "1"
		}
	},
	{
		converter = ioDevices_Converter[10],
		extraDefinition = ioDevices_Data[12]
	},
	{
		access = "w",
		parameterId = "2146500642"
	},
	{
		prototype = "string,*integer[1;5]",
		parameters = ioDevices_Data[8],
		converter = ioDevices_Converter[11],
		extraDefinition = ioDevices_Data[16]
	},
	{
		access = "w",
		parameterId = "65537"
	},
	{
		prototype = "integer[0;100]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[12],
		extraDefinition = ioDevices_Data[18]
	},
	{
		prototype = "string",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[13],
		extraDefinition = {
			access = "w",
			parameterId = "1"
		}
	},
	{
		converter = ioDevices_Converter[14],
		extraDefinition = ioDevices_Data[12]
	},
	{
		converter = ioDevices_Converter[15],
		extraDefinition = ioDevices_Data[12]
	},
	{
		converter = ioDevices_Converter[16],
		extraDefinition = {
			access = "w",
			parameterId = "2146500643"
		}
	},
	{
		prototype = "string,*integer[1;5]",
		parameters = ioDevices_Data[8],
		converter = ioDevices_Converter[17],
		extraDefinition = ioDevices_Data[16]
	},
	{
		prototype = "string(configuration;virgin;close;transmitting)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[18],
		extraDefinition = {
			access = "w",
			parameterId = "11"
		}
	},
	{
		prototype = "integer[1;254]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[19],
		extraDefinition = ioDevices_Data[12]
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
				["2146500638"] = ioDevices_Data[1],
				["65537"] = ioDevices_Data[2],
				["1"] = ioDevices_Data[3],
				["2147426304"] = ioDevices_Data[4]
			},
			attributes = ioDevices_Data[5],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				delayedStopIdentify = ioDevices_Data[13],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				pairOneWayController = ioDevices_Data[17],
				setLevel = ioDevices_Data[19],
				setName = ioDevices_Data[20],
				startIdentify = ioDevices_Data[21],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				wink = ioDevices_Data[26]
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
			ioDevices_HighLevelStates[6],
			ioDevices_HighLevelStates[10]
		},
		linkedStateIds = ioDevices_Data[30]
	},
	{
		"16830720",
		"16832512",
		"65537"
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[8],
			ioDevices_HighLevelStates[10]
		},
		linkedStateIds = ioDevices_Data[32]
	},
	{
		ioDevices_HighLevelStates[10]
	},
	{
		linkedHighLevelState = ioDevices_Data[34],
		linkedStateIds = {
			"16832512",
			"16832522",
			"65537"
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[11]
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
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[24],
		extraDefinition = ioDevices_Data[18]
	},
	{
		{
			value = 100,
			name = "p1"
		}
	},
	{
		parameters = ioDevices_Data[39],
		converter = ioDevices_Converter[24],
		extraDefinition = ioDevices_Data[18]
	},
	{
		{
			value = 0,
			name = "p1"
		}
	},
	{
		parameters = ioDevices_Data[41],
		converter = ioDevices_Converter[24],
		extraDefinition = ioDevices_Data[18]
	},
	{
		isParameterRequired = true,
		name = "p2"
	},
	{
		ioDevices_Data[6],
		ioDevices_Data[43]
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
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[24],
		extraDefinition = ioDevices_Data[46]
	},
	{
		prototype = "string(my;memorized1;secured)|integer[0;100]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[27],
		extraDefinition = ioDevices_Data[18]
	},
	{
		value = "my",
		name = "p1"
	},
	{
		ioDevices_Data[49]
	},
	{
		parameters = ioDevices_Data[50],
		converter = ioDevices_Converter[27],
		extraDefinition = ioDevices_Data[18]
	},
	{
		access = "w",
		parameterId = "16832522"
	},
	{
		prototype = "integer[0;100]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[24],
		extraDefinition = ioDevices_Data[52]
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
			ioDevices_HighLevelStates[5],
			ioDevices_HighLevelStates[12],
			ioDevices_HighLevelStates[10]
		},
		linkedStateIds = ioDevices_Data[29]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[13],
			ioDevices_HighLevelStates[14]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[15]
		}
	},
	{
		["65537"] = ioDevices_Data[55],
		["2146500638"] = ioDevices_Data[1],
		["16832512"] = ioDevices_Data[31],
		["1"] = ioDevices_Data[3],
		["16832522"] = ioDevices_Data[33],
		["2147426304"] = ioDevices_Data[4],
		["16830720"] = ioDevices_Data[35],
		["65557"] = ioDevices_Data[36],
		["2"] = ioDevices_Data[56],
		["2146500645"] = ioDevices_Data[57]
	},
	{
		["core:FirmwareRevision"] = ioDevices_Attributes[0],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[2]
	},
	{
		access = "w",
		parameterId = "49414656"
	},
	{
		converter = ioDevices_Converter[32],
		extraDefinition = ioDevices_Data[60]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		converter = ioDevices_Converter[33],
		extraDefinition = ioDevices_Data[45]
	},
	{
		converter = ioDevices_Converter[34],
		extraDefinition = ioDevices_Data[18]
	},
	{
		converter = ioDevices_Converter[35],
		extraDefinition = ioDevices_Data[60]
	},
	{
		converter = ioDevices_Converter[36],
		extraDefinition = {
			access = "w",
			parameterId = "2146500637"
		}
	},
	{
		advancedRefresh = ioDevices_Data[10],
		delayedStopIdentify = ioDevices_Data[13],
		getName = ioDevices_Data[14],
		identify = ioDevices_Data[15],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		runManufacturerSettingsCommand = ioDevices_Data[62],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		up = ioDevices_Data[42],
		setMemorized1Position = ioDevices_Data[47],
		setName = ioDevices_Data[20],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setSecuredPosition = ioDevices_Data[53],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		stopIdentify = ioDevices_Data[22],
		unpairAllOneWayControllers = ioDevices_Data[23],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		unpairOneWayController = ioDevices_Data[24],
		setConfigState = ioDevices_Data[25],
		wink = ioDevices_Data[26],
		sendIOKey = ioDevices_Data[65]
	},
	{
		["io:RollerShutterGenericIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutter",
			uiClass = "RollerShutter",
			uiProfiles = ioDevices_Data[54],
			states = ioDevices_Data[58],
			attributes = ioDevices_Data[59],
			commands = ioDevices_Data[66]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[5],
			ioDevices_HighLevelStates[12]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[6]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[8]
		}
	},
	{
		["65537"] = ioDevices_Data[68],
		["2146500638"] = ioDevices_Data[1],
		["16832512"] = ioDevices_Data[69],
		["1"] = ioDevices_Data[3],
		["16832522"] = ioDevices_Data[70],
		["2147426304"] = ioDevices_Data[4]
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
			ioDevices_HighLevelStates[18]
		}
	},
	{
		linkedHighLevelState = ioDevices_Data[34],
		linkedStateIds = ioDevices_Data[30]
	},
	{
		linkedHighLevelState = ioDevices_Data[34],
		linkedStateIds = ioDevices_Data[32]
	},
	{
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[16],
				ioDevices_HighLevelStates[17],
				ioDevices_HighLevelStates[10]
			},
			linkedStateIds = ioDevices_Data[29]
		},
		["2146500638"] = ioDevices_Data[1],
		["1"] = ioDevices_Data[3],
		["65540"] = ioDevices_Data[73],
		["2147426304"] = ioDevices_Data[4],
		["16830720"] = ioDevices_Data[35],
		["16832512"] = ioDevices_Data[74],
		["16832522"] = ioDevices_Data[75],
		["65557"] = ioDevices_Data[36],
		["2"] = ioDevices_Data[56],
		["2146500645"] = ioDevices_Data[57]
	},
	{
		prototype = "integer[0;100]|string(rocker),*integer[0;100]",
		parameters = ioDevices_Data[8],
		converter = ioDevices_Converter[39],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "integer[0;100]|string(rocker)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[40],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[39],
		converter = ioDevices_Converter[40],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[41],
		converter = ioDevices_Converter[40],
		extraDefinition = ioDevices_Data[18]
	},
	{
		prototype = "integer[0;100]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[40],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = {
			{
				value = "rocker",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[40],
		extraDefinition = ioDevices_Data[18]
	},
	{
		prototype = "integer[0;100]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[41],
		extraDefinition = ioDevices_Data[45]
	},
	{
		converter = ioDevices_Converter[42],
		extraDefinition = ioDevices_Data[45]
	},
	{
		type = 1,
		widget = "PositionableOrOrientableRollerShutter",
		uiClass = "AdjustableSlatsRollerShutter",
		uiProfiles = ioDevices_Data[72],
		states = ioDevices_Data[76],
		attributes = ioDevices_Data[59],
		commands = {
			advancedRefresh = ioDevices_Data[10],
			delayedStopIdentify = ioDevices_Data[13],
			getName = ioDevices_Data[14],
			identify = ioDevices_Data[15],
			keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
			runManufacturerSettingsCommand = ioDevices_Data[62],
			pairOneWayController = ioDevices_Data[17],
			setClosureOrOrientation = ioDevices_Data[77],
			setClosureOrRockerPosition = ioDevices_Data[78],
			close = ioDevices_Data[79],
			down = ioDevices_Data[79],
			open = ioDevices_Data[80],
			setClosure = ioDevices_Data[81],
			setDeployment = ioDevices_Data[81],
			setRockerPosition = ioDevices_Data[82],
			up = ioDevices_Data[80],
			setName = ioDevices_Data[20],
			setOrientation = ioDevices_Data[83],
			startIdentify = ioDevices_Data[21],
			stop = ioDevices_Data[84],
			stopIdentify = ioDevices_Data[22],
			unpairAllOneWayControllers = ioDevices_Data[23],
			unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
			unpairOneWayController = ioDevices_Data[24],
			setConfigState = ioDevices_Data[25],
			wink = ioDevices_Data[26],
			sendIOKey = ioDevices_Data[65]
		}
	},
	{
		["io:AdjustableSlatsRollerShutterIOComponent"] = ioDevices_Data[85]
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
			ioDevices_HighLevelStates[5],
			ioDevices_HighLevelStates[20],
			ioDevices_HighLevelStates[12],
			ioDevices_HighLevelStates[10]
		},
		linkedStateIds = ioDevices_Data[29]
	},
	{
		["65537"] = ioDevices_Data[88],
		["2146500638"] = ioDevices_Data[1],
		["16832512"] = ioDevices_Data[31],
		["1"] = ioDevices_Data[3],
		["16832522"] = ioDevices_Data[33],
		["2147426304"] = ioDevices_Data[4],
		["16830720"] = ioDevices_Data[35],
		["65557"] = ioDevices_Data[36],
		["2"] = ioDevices_Data[56],
		["2146500645"] = ioDevices_Data[57]
	},
	{
		advancedRefresh = ioDevices_Data[10],
		delayedStopIdentify = ioDevices_Data[13],
		getName = ioDevices_Data[14],
		identify = ioDevices_Data[15],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		runManufacturerSettingsCommand = ioDevices_Data[62],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		setMemorized1Position = ioDevices_Data[47],
		setName = ioDevices_Data[20],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setSecuredPosition = ioDevices_Data[53],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		stopIdentify = ioDevices_Data[22],
		unpairAllOneWayControllers = ioDevices_Data[23],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		unpairOneWayController = ioDevices_Data[24],
		setConfigState = ioDevices_Data[25],
		wink = ioDevices_Data[26],
		sendIOKey = ioDevices_Data[65]
	},
	{
		["io:VerticalExteriorAwningIOComponent"] = {
			type = 1,
			widget = "PositionableScreen",
			uiClass = "ExteriorScreen",
			uiProfiles = ioDevices_Data[87],
			states = ioDevices_Data[89],
			attributes = ioDevices_Data[59],
			commands = ioDevices_Data[90]
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
		["65537"] = ioDevices_Data[68],
		["2146500638"] = ioDevices_Data[1],
		["1"] = ioDevices_Data[3],
		["2147426304"] = ioDevices_Data[4]
	},
	{
		advancedRefresh = ioDevices_Data[10],
		delayedStopIdentify = ioDevices_Data[13],
		getName = ioDevices_Data[14],
		identify = ioDevices_Data[15],
		pairOneWayController = ioDevices_Data[17],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setName = ioDevices_Data[20],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		stopIdentify = ioDevices_Data[22],
		unpairAllOneWayControllers = ioDevices_Data[23],
		unpairOneWayController = ioDevices_Data[24],
		setConfigState = ioDevices_Data[25],
		wink = ioDevices_Data[26]
	},
	{
		["io:WindowOpenerVeluxIOComponent"] = {
			type = 1,
			widget = "PositionableTiltedWindow",
			uiClass = "Window",
			uiProfiles = ioDevices_Data[92],
			states = ioDevices_Data[93],
			attributes = ioDevices_Data[5],
			commands = ioDevices_Data[94]
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
						ioDevices_HighLevelStates[21],
						ioDevices_HighLevelStates[22]
					}
				},
				["2146500638"] = ioDevices_Data[1],
				["1"] = ioDevices_Data[3],
				["2147426304"] = ioDevices_Data[4],
				["2"] = ioDevices_Data[56],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = ioDevices_Data[59],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				delayedStopIdentify = ioDevices_Data[13],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				runManufacturerSettingsCommand = ioDevices_Data[62],
				pairOneWayController = ioDevices_Data[17],
				setClosure = ioDevices_Data[38],
				close = ioDevices_Data[40],
				down = ioDevices_Data[40],
				open = ioDevices_Data[42],
				up = ioDevices_Data[42],
				setName = ioDevices_Data[20],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				wink = ioDevices_Data[26],
				sendIOKey = ioDevices_Data[65]
			}
		}
	},
	{
		"OpenCloseGarageOpener",
		"OpenClose"
	},
	{
		converter = ioDevices_Converter[49],
		extraDefinition = ioDevices_Data[18]
	},
	{
		converter = ioDevices_Converter[50],
		extraDefinition = ioDevices_Data[18]
	},
	{
		["io:DiscreteGarageOpenerIOComponent"] = {
			type = 1,
			widget = "DiscretePositionableGarageDoor",
			uiClass = "GarageDoor",
			uiProfiles = ioDevices_Data[97],
			states = {
				["2146500638"] = ioDevices_Data[1],
				["1"] = ioDevices_Data[3],
				["65537"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[22]
					}
				},
				["2147426304"] = ioDevices_Data[4],
				["2"] = ioDevices_Data[56],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = ioDevices_Data[59],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				close = ioDevices_Data[98],
				delayedStopIdentify = ioDevices_Data[13],
				down = ioDevices_Data[98],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				runManufacturerSettingsCommand = ioDevices_Data[62],
				open = ioDevices_Data[99],
				pairOneWayController = ioDevices_Data[17],
				setName = ioDevices_Data[20],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				up = ioDevices_Data[99],
				wink = ioDevices_Data[26],
				sendIOKey = ioDevices_Data[65]
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
			ioDevices_HighLevelStates[23],
			ioDevices_HighLevelStates[25]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[24]
		}
	},
	{
		prototype = "integer[0;100]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[53],
		extraDefinition = ioDevices_Data[45]
	},
	{
		parameters = ioDevices_Data[41],
		converter = ioDevices_Converter[53],
		extraDefinition = ioDevices_Data[45]
	},
	{
		parameters = ioDevices_Data[39],
		converter = ioDevices_Converter[53],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(off;on)",
		parameters = ioDevices_Data[11],
		aliasConverter = ioDevices_Converter[54],
		converter = ioDevices_Converter[53],
		extraDefinition = ioDevices_Data[45]
	},
	{
		isParameterRequired = false,
		name = "p3"
	},
	{
		prototype = "integer[0;100],integer[5;14400],*integer[0;100]",
		parameters = {
			ioDevices_Data[6],
			ioDevices_Data[43],
			ioDevices_Data[108]
		},
		converter = ioDevices_Converter[55],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "integer[5;14400]",
		parameters = ioDevices_Data[11],
		aliasConverter = ioDevices_Converter[56],
		converter = ioDevices_Converter[55],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "integer[0;100]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[57],
		extraDefinition = ioDevices_Data[46]
	},
	{
		prototype = "string(my;memorized1;secured)|integer[0;100]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[58],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[50],
		converter = ioDevices_Converter[58],
		extraDefinition = ioDevices_Data[18]
	},
	{
		prototype = "integer[0;100]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[57],
		extraDefinition = ioDevices_Data[52]
	},
	{
		["io:DimmableLightIOComponent"] = {
			type = 1,
			widget = "DimmerLight",
			uiClass = "Light",
			uiProfiles = ioDevices_Data[101],
			states = {
				["2146500638"] = ioDevices_Data[1],
				["65537"] = ioDevices_Data[102],
				["16832512"] = ioDevices_Data[103],
				["1"] = ioDevices_Data[3],
				["16832522"] = ioDevices_Data[70],
				["2147426304"] = ioDevices_Data[4],
				["2"] = ioDevices_Data[56],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = ioDevices_Data[59],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				delayedStopIdentify = ioDevices_Data[13],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				runManufacturerSettingsCommand = ioDevices_Data[62],
				pairOneWayController = ioDevices_Data[17],
				refreshMemorized1Position = ioDevices_Data[37],
				setIntensity = ioDevices_Data[104],
				off = ioDevices_Data[105],
				on = ioDevices_Data[106],
				setOnOff = ioDevices_Data[107],
				setIntensityWithTimer = ioDevices_Data[109],
				onWithTimer = ioDevices_Data[110],
				setMemorized1Position = ioDevices_Data[111],
				setName = ioDevices_Data[20],
				setPosition = ioDevices_Data[112],
				my = ioDevices_Data[113],
				setSecuredPosition = ioDevices_Data[114],
				startIdentify = ioDevices_Data[21],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				wink = ioDevices_Data[26],
				sendIOKey = ioDevices_Data[65]
			}
		}
	},
	{
		["2146500638"] = ioDevices_Data[1],
		["1"] = ioDevices_Data[3],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[26]
			}
		},
		["2147426304"] = ioDevices_Data[4]
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
		ioDevices_HighLevelStates[27],
		ioDevices_HighLevelStates[28],
		ioDevices_HighLevelStates[29]
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
			ioDevices_Data[6],
			ioDevices_Data[43],
			ioDevices_Data[122]
		},
		converter = ioDevices_Converter[64],
		extraDefinition = ioDevices_Data[45]
	},
	{
		isParameterRequired = true,
		name = "p4"
	},
	{
		ioDevices_Data[6],
		ioDevices_Data[43],
		ioDevices_Data[122],
		ioDevices_Data[124]
	},
	{
		prototype = "integer[0;255],integer[0;255],integer[0;255],integer[5;14400]",
		parameters = ioDevices_Data[125],
		converter = ioDevices_Converter[65],
		extraDefinition = ioDevices_Data[45]
	},
	{
		["io:DimmableRGBLightIOComponent"] = {
			type = 1,
			widget = "DimmerRGBColouredLight",
			uiClass = "Light",
			uiProfiles = ioDevices_Data[101],
			states = {
				["65547"] = {
					linkedHighLevelState = ioDevices_Data[119],
					linkedStateIds = ioDevices_Data[120]
				},
				["65548"] = {
					linkedHighLevelState = ioDevices_Data[119],
					linkedStateIds = ioDevices_Data[121]
				},
				["65537"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[27],
						ioDevices_HighLevelStates[28],
						ioDevices_HighLevelStates[23],
						ioDevices_HighLevelStates[25],
						ioDevices_HighLevelStates[29]
					},
					linkedStateIds = {
						"65547",
						"65548"
					}
				},
				["2146500638"] = ioDevices_Data[1],
				["16832512"] = ioDevices_Data[103],
				["1"] = ioDevices_Data[3],
				["16832522"] = ioDevices_Data[70],
				["2147426304"] = ioDevices_Data[4],
				["2"] = ioDevices_Data[56],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = ioDevices_Data[59],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				delayedStopIdentify = ioDevices_Data[13],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				runManufacturerSettingsCommand = ioDevices_Data[62],
				pairOneWayController = ioDevices_Data[17],
				refreshMemorized1Position = ioDevices_Data[37],
				setIntensity = ioDevices_Data[104],
				off = ioDevices_Data[105],
				on = ioDevices_Data[106],
				setOnOff = ioDevices_Data[107],
				setIntensityWithTimer = ioDevices_Data[109],
				onWithTimer = ioDevices_Data[110],
				setMemorized1Position = ioDevices_Data[111],
				setName = ioDevices_Data[20],
				setPosition = ioDevices_Data[112],
				my = ioDevices_Data[113],
				setRGB = ioDevices_Data[123],
				setRGBWithTimer = ioDevices_Data[126],
				setSecuredPosition = ioDevices_Data[114],
				startIdentify = ioDevices_Data[21],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				wink = ioDevices_Data[26],
				sendIOKey = ioDevices_Data[65]
			}
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[30]
		}
	},
	{
		rawStateId = "65537"
	},
	{
		ioDevices_Data[129]
	},
	{
		prototype = "integer[2000;6500]",
		parameters = ioDevices_Data[11],
		rawStates = ioDevices_Data[130],
		converter = ioDevices_Converter[67],
		extraDefinition = ioDevices_Data[45]
	},
	{
		["io:DimmableColorTemperatureLightIOComponent"] = {
			type = 1,
			widget = "DimmerColorTemperatureLight",
			uiClass = "Light",
			uiProfiles = ioDevices_Data[101],
			states = {
				["65551"] = ioDevices_Data[128],
				["2146500638"] = ioDevices_Data[1],
				["65537"] = ioDevices_Data[102],
				["16832512"] = ioDevices_Data[103],
				["1"] = ioDevices_Data[3],
				["16832522"] = ioDevices_Data[70],
				["2147426304"] = ioDevices_Data[4],
				["2"] = ioDevices_Data[56],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = ioDevices_Data[59],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				delayedStopIdentify = ioDevices_Data[13],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				runManufacturerSettingsCommand = ioDevices_Data[62],
				pairOneWayController = ioDevices_Data[17],
				refreshMemorized1Position = ioDevices_Data[37],
				setColorTemperature = ioDevices_Data[131],
				setIntensity = ioDevices_Data[104],
				off = ioDevices_Data[105],
				on = ioDevices_Data[106],
				setOnOff = ioDevices_Data[107],
				setIntensityWithTimer = ioDevices_Data[109],
				onWithTimer = ioDevices_Data[110],
				setMemorized1Position = ioDevices_Data[111],
				setName = ioDevices_Data[20],
				setPosition = ioDevices_Data[112],
				my = ioDevices_Data[113],
				setSecuredPosition = ioDevices_Data[114],
				startIdentify = ioDevices_Data[21],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				wink = ioDevices_Data[26],
				sendIOKey = ioDevices_Data[65]
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
			ioDevices_HighLevelStates[31]
		}
	},
	{
		prototype = "integer[5;14400]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[69],
		extraDefinition = ioDevices_Data[18]
	},
	{
		prototype = "string(off;on)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[70],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[117],
		converter = ioDevices_Converter[70],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[118],
		converter = ioDevices_Converter[70],
		extraDefinition = ioDevices_Data[18]
	},
	{
		type = 1,
		widget = "StatefulOnOffLight",
		uiClass = "Light",
		uiProfiles = ioDevices_Data[133],
		states = {
			["2146500638"] = ioDevices_Data[1],
			["1"] = ioDevices_Data[3],
			["65537"] = ioDevices_Data[134],
			["2147426304"] = ioDevices_Data[4],
			["2"] = ioDevices_Data[56],
			["2146500645"] = ioDevices_Data[57]
		},
		attributes = ioDevices_Data[59],
		commands = {
			advancedRefresh = ioDevices_Data[10],
			delayedStopIdentify = ioDevices_Data[13],
			getName = ioDevices_Data[14],
			identify = ioDevices_Data[15],
			keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
			runManufacturerSettingsCommand = ioDevices_Data[62],
			onWithTimer = ioDevices_Data[135],
			pairOneWayController = ioDevices_Data[17],
			setName = ioDevices_Data[20],
			setOnOff = ioDevices_Data[136],
			off = ioDevices_Data[137],
			on = ioDevices_Data[138],
			startIdentify = ioDevices_Data[21],
			stopIdentify = ioDevices_Data[22],
			unpairAllOneWayControllers = ioDevices_Data[23],
			unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
			unpairOneWayController = ioDevices_Data[24],
			setConfigState = ioDevices_Data[25],
			wink = ioDevices_Data[26],
			sendIOKey = ioDevices_Data[65]
		}
	},
	{
		["io:OnOffLightIOComponent"] = ioDevices_Data[139]
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
			ioDevices_HighLevelStates[33],
			ioDevices_HighLevelStates[34]
		},
		linkedStateIds = ioDevices_Data[142]
	},
	{
		ioDevices_HighLevelStates[33]
	},
	{
		linkedHighLevelState = ioDevices_Data[144],
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
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[73],
		extraDefinition = ioDevices_Data[18]
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
						ioDevices_HighLevelStates[32],
						ioDevices_HighLevelStates[33]
					},
					linkedStateIds = ioDevices_Data[141]
				},
				["2146500638"] = ioDevices_Data[1],
				["1"] = ioDevices_Data[3],
				["16832519"] = ioDevices_Data[143],
				["16830720"] = ioDevices_Data[145],
				["2147426304"] = ioDevices_Data[4],
				["2"] = ioDevices_Data[56],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = ioDevices_Data[59],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				delayedStopIdentify = ioDevices_Data[13],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				runManufacturerSettingsCommand = ioDevices_Data[62],
				pairOneWayController = ioDevices_Data[17],
				refreshPedestrianPosition = ioDevices_Data[146],
				setClosureOrPedestrianPosition = {
					prototype = "integer[0;100]|string(pedestrian)",
					parameters = ioDevices_Data[11],
					converter = ioDevices_Converter[73],
					extraDefinition = ioDevices_Data[18]
				},
				close = {
					parameters = ioDevices_Data[39],
					converter = ioDevices_Converter[73],
					extraDefinition = ioDevices_Data[18]
				},
				open = {
					parameters = ioDevices_Data[41],
					converter = ioDevices_Converter[73],
					extraDefinition = ioDevices_Data[18]
				},
				setClosure = ioDevices_Data[147],
				setDeployment = ioDevices_Data[147],
				setPedestrianPosition = {
					parameters = {
						{
							value = "pedestrian",
							name = "p1"
						}
					},
					converter = ioDevices_Converter[73],
					extraDefinition = ioDevices_Data[18]
				},
				setName = ioDevices_Data[20],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				wink = ioDevices_Data[26],
				sendIOKey = ioDevices_Data[65]
			}
		}
	},
	{
		"OpenCloseSlidingGateOpener",
		"OpenClose"
	},
	{
		converter = ioDevices_Converter[74],
		extraDefinition = ioDevices_Data[18]
	},
	{
		type = 1,
		widget = "SlidingDiscreteGateWithPedestrianPosition",
		uiClass = "Gate",
		uiProfiles = ioDevices_Data[149],
		states = {
			["2146500638"] = ioDevices_Data[1],
			["1"] = ioDevices_Data[3],
			["65537"] = {
				linkedHighLevelState = ioDevices_Data[144],
				linkedStateIds = ioDevices_Data[141]
			},
			["16832519"] = ioDevices_Data[143],
			["16830720"] = ioDevices_Data[145],
			["2147426304"] = ioDevices_Data[4],
			["2"] = ioDevices_Data[56],
			["2146500645"] = ioDevices_Data[57]
		},
		attributes = ioDevices_Data[59],
		commands = {
			advancedRefresh = ioDevices_Data[10],
			close = ioDevices_Data[98],
			delayedStopIdentify = ioDevices_Data[13],
			getName = ioDevices_Data[14],
			identify = ioDevices_Data[15],
			keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
			runManufacturerSettingsCommand = ioDevices_Data[62],
			open = ioDevices_Data[99],
			pairOneWayController = ioDevices_Data[17],
			refreshPedestrianPosition = ioDevices_Data[146],
			setName = ioDevices_Data[20],
			setPedestrianPosition = ioDevices_Data[150],
			startIdentify = ioDevices_Data[21],
			stop = ioDevices_Data[63],
			stopIdentify = ioDevices_Data[22],
			unpairAllOneWayControllers = ioDevices_Data[23],
			unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
			unpairOneWayController = ioDevices_Data[24],
			setConfigState = ioDevices_Data[25],
			wink = ioDevices_Data[26],
			sendIOKey = ioDevices_Data[65]
		}
	},
	{
		["io:SlidingDiscreteGateOpenerIOComponent"] = ioDevices_Data[151]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[5],
			ioDevices_HighLevelStates[7]
		}
	},
	{
		advancedRefresh = ioDevices_Data[10],
		delayedStopIdentify = ioDevices_Data[13],
		getName = ioDevices_Data[14],
		identify = ioDevices_Data[15],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		runManufacturerSettingsCommand = ioDevices_Data[62],
		pairOneWayController = ioDevices_Data[17],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setName = ioDevices_Data[20],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		stopIdentify = ioDevices_Data[22],
		unpairAllOneWayControllers = ioDevices_Data[23],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		unpairOneWayController = ioDevices_Data[24],
		setConfigState = ioDevices_Data[25],
		wink = ioDevices_Data[26],
		sendIOKey = ioDevices_Data[65]
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
				["65537"] = ioDevices_Data[153],
				["2146500638"] = ioDevices_Data[1],
				["1"] = ioDevices_Data[3],
				["2147426304"] = ioDevices_Data[4],
				["2"] = ioDevices_Data[56],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = ioDevices_Data[59],
			commands = ioDevices_Data[154]
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
			ioDevices_HighLevelStates[35],
			ioDevices_HighLevelStates[36]
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
		parameters = ioDevices_Data[159],
		converter = ioDevices_Converter[77],
		extraDefinition = ioDevices_Data[18]
	},
	{
		{
			value = "open",
			name = "p1"
		}
	},
	{
		parameters = ioDevices_Data[161],
		converter = ioDevices_Converter[77],
		extraDefinition = ioDevices_Data[18]
	},
	{
		["io:DoorLockIOComponent"] = {
			type = 1,
			widget = "DoorLock",
			uiClass = "DoorLock",
			uiProfiles = ioDevices_Data[156],
			states = {
				["2146500638"] = ioDevices_Data[1],
				["65537"] = ioDevices_Data[157],
				["1"] = ioDevices_Data[3],
				["2147426304"] = ioDevices_Data[4],
				["2"] = ioDevices_Data[56],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = ioDevices_Data[59],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				delayedStopIdentify = ioDevices_Data[13],
				getName = ioDevices_Data[14],
				getOpenClose = ioDevices_Data[158],
				identify = ioDevices_Data[15],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				runManufacturerSettingsCommand = ioDevices_Data[62],
				pairOneWayController = ioDevices_Data[17],
				refreshLockedUnlocked = ioDevices_Data[158],
				setName = ioDevices_Data[20],
				setOpenClosed = {
					prototype = "string(open;closed)",
					parameters = ioDevices_Data[11],
					converter = ioDevices_Converter[77],
					extraDefinition = ioDevices_Data[18]
				},
				close = ioDevices_Data[160],
				lock = ioDevices_Data[160],
				open = ioDevices_Data[162],
				setLockedUnlocked = {
					prototype = "string(locked;unlocked)",
					parameters = ioDevices_Data[11],
					aliasConverter = ioDevices_Converter[78],
					converter = ioDevices_Converter[77],
					extraDefinition = ioDevices_Data[18]
				},
				unlock = ioDevices_Data[162],
				startIdentify = ioDevices_Data[21],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				wink = ioDevices_Data[26],
				sendIOKey = ioDevices_Data[65]
			}
		}
	},
	{
		parameters = ioDevices_Data[159],
		converter = ioDevices_Converter[81],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[161],
		converter = ioDevices_Converter[81],
		extraDefinition = ioDevices_Data[18]
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
				["2146500638"] = ioDevices_Data[1],
				["65537"] = ioDevices_Data[157],
				["1"] = ioDevices_Data[3],
				["2147426304"] = ioDevices_Data[4],
				["65538"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[37]
					}
				}
			},
			attributes = ioDevices_Data[5],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				delayedStopIdentify = ioDevices_Data[13],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				pairOneWayController = ioDevices_Data[17],
				setLockPosition = {
					prototype = "any",
					parameters = ioDevices_Data[11],
					converter = ioDevices_Converter[80],
					extraDefinition = ioDevices_Data[45]
				},
				setName = ioDevices_Data[20],
				setOpenClosed = {
					prototype = "string(open;closed)",
					parameters = ioDevices_Data[11],
					converter = ioDevices_Converter[81],
					extraDefinition = ioDevices_Data[18]
				},
				close = ioDevices_Data[164],
				lock = ioDevices_Data[164],
				open = ioDevices_Data[165],
				setLockedUnlocked = {
					prototype = "string(locked;unlocked)",
					parameters = ioDevices_Data[11],
					aliasConverter = ioDevices_Converter[78],
					converter = ioDevices_Converter[81],
					extraDefinition = ioDevices_Data[18]
				},
				unlock = ioDevices_Data[165],
				startIdentify = ioDevices_Data[21],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				wink = ioDevices_Data[26]
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
		advancedRefresh = ioDevices_Data[10],
		delayedStopIdentify = ioDevices_Data[13],
		getName = ioDevices_Data[14],
		identify = ioDevices_Data[15],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		runManufacturerSettingsCommand = ioDevices_Data[62],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		up = ioDevices_Data[42],
		setMemorized1Position = ioDevices_Data[47],
		setName = ioDevices_Data[20],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setSecuredPosition = ioDevices_Data[53],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		stopIdentify = ioDevices_Data[22],
		unpairAllOneWayControllers = ioDevices_Data[23],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		unpairOneWayController = ioDevices_Data[24],
		setConfigState = ioDevices_Data[25],
		wink = ioDevices_Data[26],
		sendIOKey = ioDevices_Data[65]
	},
	{
		["io:VerticalInteriorBlindGenericIOComponent"] = {
			type = 1,
			widget = "PositionableScreen",
			uiClass = "Screen",
			uiProfiles = ioDevices_Data[167],
			states = ioDevices_Data[58],
			attributes = ioDevices_Data[59],
			commands = ioDevices_Data[168]
		}
	},
	{
		prototype = "any",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[82],
		extraDefinition = ioDevices_Data[45]
	},
	{
		parameters = ioDevices_Data[39],
		converter = ioDevices_Converter[82],
		extraDefinition = ioDevices_Data[45]
	},
	{
		parameters = ioDevices_Data[41],
		converter = ioDevices_Converter[82],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "integer[0;100],integer[0;100]",
		parameters = ioDevices_Data[44],
		converter = ioDevices_Converter[83],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "any",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[84],
		extraDefinition = ioDevices_Data[45]
	},
	{
		parameters = ioDevices_Data[39],
		converter = ioDevices_Converter[84],
		extraDefinition = ioDevices_Data[45]
	},
	{
		parameters = ioDevices_Data[41],
		converter = ioDevices_Converter[84],
		extraDefinition = ioDevices_Data[45]
	},
	{
		"StatefulThermostatWithSensor",
		"StatefulThermostat",
		"Thermostat"
	},
	{
		ioDevices_HighLevelStates[42],
		ioDevices_HighLevelStates[43],
		ioDevices_HighLevelStates[44],
		ioDevices_HighLevelStates[45],
		ioDevices_HighLevelStates[46]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[46]
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
		parameters = ioDevices_Data[11],
		rawStates = ioDevices_Data[182],
		converter = ioDevices_Converter[95],
		extraDefinition = ioDevices_Data[183]
	},
	{
		access = "w",
		parameterId = "16832526"
	},
	{
		converter = ioDevices_Converter[100],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "integer[5;14400]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[101],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(off;on)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[102],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[117],
		converter = ioDevices_Converter[102],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[118],
		converter = ioDevices_Converter[102],
		extraDefinition = ioDevices_Data[18]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[49]
		}
	},
	{
		["2146500638"] = ioDevices_Data[1],
		["1"] = ioDevices_Data[3],
		["65537"] = ioDevices_Data[134],
		["2147426304"] = ioDevices_Data[4],
		["84059651"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[48],
				ioDevices_HighLevelStates[50]
			}
		},
		["2"] = ioDevices_Data[56],
		["2146500645"] = ioDevices_Data[57],
		["84059655"] = ioDevices_Data[191]
	},
	{
		rawStateId = "84059651"
	},
	{
		ioDevices_Data[193]
	},
	{
		access = "w",
		parameterId = "5"
	},
	{
		prototype = "integer[0;65535]",
		parameters = ioDevices_Data[11],
		rawStates = ioDevices_Data[194],
		converter = ioDevices_Converter[106],
		extraDefinition = ioDevices_Data[195]
	},
	{
		prototype = "string(onOffLight;onOffSwitch)",
		parameters = ioDevices_Data[11],
		rawStates = ioDevices_Data[194],
		converter = ioDevices_Converter[107],
		extraDefinition = ioDevices_Data[195]
	},
	{
		advancedRefresh = ioDevices_Data[10],
		delayedStopIdentify = ioDevices_Data[13],
		getName = ioDevices_Data[14],
		identify = ioDevices_Data[15],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		runManufacturerSettingsCommand = ioDevices_Data[62],
		onWithInternalTimer = ioDevices_Data[186],
		onWithTimer = ioDevices_Data[187],
		pairOneWayController = ioDevices_Data[17],
		setInternalTimer = ioDevices_Data[196],
		setName = ioDevices_Data[20],
		setOnOff = ioDevices_Data[188],
		off = ioDevices_Data[189],
		on = ioDevices_Data[190],
		setPictoValue = ioDevices_Data[197],
		startIdentify = ioDevices_Data[21],
		stopIdentify = ioDevices_Data[22],
		unpairAllOneWayControllers = ioDevices_Data[23],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		unpairOneWayController = ioDevices_Data[24],
		setConfigState = ioDevices_Data[25],
		wink = ioDevices_Data[26],
		sendIOKey = ioDevices_Data[65]
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
				ioDevices_HighLevelStates[20],
				ioDevices_HighLevelStates[51],
				ioDevices_HighLevelStates[10]
			},
			linkedStateIds = ioDevices_Data[29]
		},
		["2146500638"] = ioDevices_Data[1],
		["16832512"] = ioDevices_Data[31],
		["1"] = ioDevices_Data[3],
		["16832522"] = ioDevices_Data[33],
		["2147426304"] = ioDevices_Data[4],
		["16830720"] = ioDevices_Data[35],
		["65557"] = ioDevices_Data[36],
		["2"] = ioDevices_Data[56],
		["2146500645"] = ioDevices_Data[57]
	},
	{
		prototype = "integer[0;100]",
		parameters = ioDevices_Data[11],
		aliasConverter = ioDevices_Converter[109],
		converter = ioDevices_Converter[24],
		extraDefinition = ioDevices_Data[18]
	},
	{
		advancedRefresh = ioDevices_Data[10],
		delayedStopIdentify = ioDevices_Data[13],
		getName = ioDevices_Data[14],
		identify = ioDevices_Data[15],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		runManufacturerSettingsCommand = ioDevices_Data[62],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		setDeployment = ioDevices_Data[38],
		close = ioDevices_Data[42],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[40],
		setClosure = ioDevices_Data[201],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		setMemorized1Position = ioDevices_Data[47],
		setName = ioDevices_Data[20],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setSecuredPosition = ioDevices_Data[53],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		stopIdentify = ioDevices_Data[22],
		unpairAllOneWayControllers = ioDevices_Data[23],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		unpairOneWayController = ioDevices_Data[24],
		setConfigState = ioDevices_Data[25],
		wink = ioDevices_Data[26],
		sendIOKey = ioDevices_Data[65]
	},
	{
		["io:HorizontalAwningIOComponent"] = {
			type = 1,
			widget = "PositionableHorizontalAwning",
			uiClass = "Awning",
			uiProfiles = ioDevices_Data[199],
			states = ioDevices_Data[200],
			attributes = ioDevices_Data[59],
			commands = ioDevices_Data[202]
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
			uiProfiles = ioDevices_Data[204],
			states = ioDevices_Data[200],
			attributes = ioDevices_Data[59],
			commands = ioDevices_Data[202]
		}
	},
	{
		isParameterRequired = false,
		name = "p1"
	},
	{
		ioDevices_Data[206]
	},
	{
		prototype = "*integer[25;3200]",
		parameters = ioDevices_Data[207],
		converter = ioDevices_Converter[110],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "*integer[25;3175]",
		parameters = ioDevices_Data[207],
		converter = ioDevices_Converter[111],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(lower;upper)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[112],
		extraDefinition = {
			access = "w",
			parameterId = "2146500644"
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[52]
		}
	},
	{
		["65537"] = ioDevices_Data[55],
		["2146500638"] = ioDevices_Data[1],
		["16832512"] = ioDevices_Data[31],
		["17029120"] = ioDevices_Data[211],
		["1"] = ioDevices_Data[3],
		["16832522"] = ioDevices_Data[33],
		["65540"] = ioDevices_Data[73],
		["2147426304"] = ioDevices_Data[4],
		["16830720"] = ioDevices_Data[35],
		["65557"] = ioDevices_Data[36],
		["2"] = ioDevices_Data[56],
		["2146500645"] = ioDevices_Data[57]
	},
	{
		prototype = "string(my;memorized1;secured)|integer[0;100],string(my;memorized1)|integer[0;100]",
		parameters = ioDevices_Data[44],
		converter = ioDevices_Converter[113],
		extraDefinition = ioDevices_Data[45]
	},
	{
		parameters = {
			ioDevices_Data[49],
			{
				value = "my",
				name = "p2"
			}
		},
		converter = ioDevices_Converter[113],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(my;memorized1)|integer[0;100]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[114],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "integer[0;100]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[24],
		extraDefinition = {
			access = "w",
			parameterId = "17029120"
		}
	},
	{
		advancedRefresh = ioDevices_Data[10],
		delayedStopIdentify = ioDevices_Data[13],
		getName = ioDevices_Data[14],
		identify = ioDevices_Data[15],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		runManufacturerSettingsCommand = ioDevices_Data[62],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		up = ioDevices_Data[42],
		setClosureAndOrientation = ioDevices_Data[213],
		my = ioDevices_Data[214],
		setMemorized1Position = ioDevices_Data[47],
		setName = ioDevices_Data[20],
		setOrientation = ioDevices_Data[215],
		setMemorized1Orientation = ioDevices_Data[216],
		setPosition = ioDevices_Data[48],
		setSecuredPosition = ioDevices_Data[53],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		stopIdentify = ioDevices_Data[22],
		unpairAllOneWayControllers = ioDevices_Data[23],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		unpairOneWayController = ioDevices_Data[24],
		setConfigState = ioDevices_Data[25],
		wink = ioDevices_Data[26],
		sendIOKey = ioDevices_Data[65]
	},
	{
		["io:ExteriorVenetianBlindIOComponent"] = {
			type = 1,
			widget = "PositionableExteriorVenetianBlind",
			uiClass = "ExteriorVenetianBlind",
			uiProfiles = ioDevices_Data[28],
			states = ioDevices_Data[212],
			attributes = ioDevices_Data[59],
			commands = ioDevices_Data[217]
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
		uiProfiles = ioDevices_Data[219],
		states = {
			["65537"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[53]
				}
			},
			["2146500638"] = ioDevices_Data[1],
			["16832512"] = ioDevices_Data[69],
			["1"] = ioDevices_Data[3],
			["16832522"] = ioDevices_Data[70],
			["2147426304"] = ioDevices_Data[4]
		},
		attributes = ioDevices_Data[5],
		commands = {
			advancedRefresh = ioDevices_Data[10],
			delayedStopIdentify = ioDevices_Data[13],
			getName = ioDevices_Data[14],
			identify = ioDevices_Data[15],
			pairOneWayController = ioDevices_Data[17],
			setAirInput = ioDevices_Data[38],
			off = ioDevices_Data[42],
			on = ioDevices_Data[40],
			setName = ioDevices_Data[20],
			startIdentify = ioDevices_Data[21],
			stopIdentify = ioDevices_Data[22],
			unpairAllOneWayControllers = ioDevices_Data[23],
			unpairOneWayController = ioDevices_Data[24],
			setConfigState = ioDevices_Data[25],
			wink = ioDevices_Data[26]
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
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[115],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[39],
		converter = ioDevices_Converter[115],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[41],
		converter = ioDevices_Converter[115],
		extraDefinition = ioDevices_Data[18]
	},
	{
		{
			value = "memorized1",
			name = "p1"
		}
	},
	{
		parameters = ioDevices_Data[225],
		converter = ioDevices_Converter[115],
		extraDefinition = ioDevices_Data[18]
	},
	{
		type = 1,
		widget = "DimmerExteriorHeating",
		uiClass = "ExteriorHeatingSystem",
		uiProfiles = ioDevices_Data[221],
		states = {
			["2146500638"] = ioDevices_Data[1],
			["65537"] = ioDevices_Data[2],
			["1"] = ioDevices_Data[3],
			["16832512"] = ioDevices_Data[69],
			["2147426304"] = ioDevices_Data[4],
			["2"] = ioDevices_Data[56],
			["2146500645"] = ioDevices_Data[57]
		},
		attributes = ioDevices_Data[59],
		commands = {
			advancedRefresh = ioDevices_Data[10],
			delayedStopIdentify = ioDevices_Data[13],
			getLevel = ioDevices_Data[158],
			getName = ioDevices_Data[14],
			identify = ioDevices_Data[15],
			keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
			runManufacturerSettingsCommand = ioDevices_Data[62],
			pairOneWayController = ioDevices_Data[17],
			setLevel = ioDevices_Data[222],
			off = ioDevices_Data[223],
			on = ioDevices_Data[224],
			my = ioDevices_Data[226],
			setName = ioDevices_Data[20],
			startIdentify = ioDevices_Data[21],
			stopIdentify = ioDevices_Data[22],
			unpairAllOneWayControllers = ioDevices_Data[23],
			unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
			unpairOneWayController = ioDevices_Data[24],
			setConfigState = ioDevices_Data[25],
			wink = ioDevices_Data[26],
			sendIOKey = ioDevices_Data[65],
			setMemorized1Position = ioDevices_Data[47]
		}
	},
	{
		"StatefulSwitchableHeating",
		"StatefulSwitchable",
		"Switchable"
	},
	{
		converter = ioDevices_Converter[117],
		extraDefinition = ioDevices_Data[18]
	},
	{
		converter = ioDevices_Converter[118],
		extraDefinition = ioDevices_Data[18]
	},
	{
		["io:DiscreteExteriorHeatingIOComponent"] = {
			type = 1,
			widget = "DiscreteExteriorHeating",
			uiClass = "ExteriorHeatingSystem",
			uiProfiles = ioDevices_Data[228],
			states = {
				["2146500638"] = ioDevices_Data[1],
				["1"] = ioDevices_Data[3],
				["65537"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[57]
					}
				},
				["2147426304"] = ioDevices_Data[4],
				["2"] = ioDevices_Data[56],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = ioDevices_Data[59],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				delayedStopIdentify = ioDevices_Data[13],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				runManufacturerSettingsCommand = ioDevices_Data[62],
				off = ioDevices_Data[229],
				on = ioDevices_Data[230],
				pairOneWayController = ioDevices_Data[17],
				setName = ioDevices_Data[20],
				startIdentify = ioDevices_Data[21],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				wink = ioDevices_Data[26],
				sendIOKey = ioDevices_Data[65]
			}
		}
	},
	{
		access = "r",
		parameterId = "65553"
	},
	{
		extraDefinition = ioDevices_Data[232]
	},
	{
		access = "w",
		parameterId = "16832530"
	},
	{
		converter = ioDevices_Converter[128],
		extraDefinition = ioDevices_Data[18]
	},
	{
		converter = ioDevices_Converter[129],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[39],
		converter = ioDevices_Converter[12],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[41],
		converter = ioDevices_Converter[12],
		extraDefinition = ioDevices_Data[18]
	},
	{
		prototype = "integer[0;100],*string(lowspeed)",
		parameters = ioDevices_Data[8],
		converter = ioDevices_Converter[130],
		extraDefinition = ioDevices_Data[45]
	},
	{
		parameters = ioDevices_Data[50],
		converter = ioDevices_Converter[131],
		extraDefinition = ioDevices_Data[18]
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
			ioDevices_HighLevelStates[69]
		}
	},
	{
		"65537"
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[70]
		},
		linkedStateIds = ioDevices_Data[243]
	},
	{
		rawStates = ioDevices_Data[194],
		converter = ioDevices_Converter[143],
		extraDefinition = ioDevices_Data[195]
	},
	{
		rawStates = ioDevices_Data[194],
		converter = ioDevices_Converter[144],
		extraDefinition = ioDevices_Data[195]
	},
	{
		rawStates = ioDevices_Data[130],
		converter = ioDevices_Converter[145],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(my;securedVentilation)|integer[0;100]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[131],
		extraDefinition = ioDevices_Data[18]
	},
	{
		prototype = "string(my;securedVentilation)|integer[0;100],*string(lowspeed)",
		parameters = ioDevices_Data[8],
		converter = ioDevices_Converter[132],
		extraDefinition = ioDevices_Data[45]
	},
	{
		rawStates = ioDevices_Data[130],
		converter = ioDevices_Converter[146],
		extraDefinition = ioDevices_Data[45]
	},
	{
		["io:PositionableAndLockableSlidingWindowComponent"] = {
			type = 1,
			widget = "PositionableAndLockableSlidingWindow",
			uiClass = "Window",
			uiProfiles = ioDevices_Data[241],
			states = {
				["65537"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[5],
						ioDevices_HighLevelStates[70]
					},
					linkedStateIds = {
						"65801"
					}
				},
				["2146500638"] = ioDevices_Data[1],
				["65546"] = ioDevices_Data[242],
				["1"] = ioDevices_Data[3],
				["65801"] = ioDevices_Data[244],
				["84059651"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[71],
						ioDevices_HighLevelStates[72],
						ioDevices_HighLevelStates[73],
						ioDevices_HighLevelStates[74],
						ioDevices_HighLevelStates[75]
					}
				},
				["2147426304"] = ioDevices_Data[4],
				["2"] = ioDevices_Data[56],
				["16832512"] = ioDevices_Data[69],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = ioDevices_Data[59],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				activateTimer = ioDevices_Data[245],
				deactivateTimer = ioDevices_Data[246],
				delayedStopIdentify = ioDevices_Data[13],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				runManufacturerSettingsCommand = ioDevices_Data[62],
				lock = ioDevices_Data[247],
				pairOneWayController = ioDevices_Data[17],
				setClosure = ioDevices_Data[19],
				close = ioDevices_Data[237],
				open = ioDevices_Data[238],
				setClosureAndLinearSpeed = ioDevices_Data[239],
				setName = ioDevices_Data[20],
				setPosition = ioDevices_Data[248],
				my = ioDevices_Data[240],
				setPositionAndLinearSpeed = ioDevices_Data[249],
				setTimer = ioDevices_Data[196],
				setMemorized1Position = ioDevices_Data[47],
				refreshMemorized1Position = ioDevices_Data[37],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				stopIdentify = ioDevices_Data[22],
				unlock = ioDevices_Data[250],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				wink = ioDevices_Data[26],
				sendIOKey = ioDevices_Data[65]
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
			ioDevices_HighLevelStates[76]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[77]
		}
	},
	{
		["2146500638"] = ioDevices_Data[1],
		["16832512"] = ioDevices_Data[253],
		["1"] = ioDevices_Data[3],
		["16832522"] = ioDevices_Data[254],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[78],
				ioDevices_HighLevelStates[79],
				ioDevices_HighLevelStates[80]
			}
		},
		["2147426304"] = ioDevices_Data[4],
		["2"] = ioDevices_Data[56],
		["2146500645"] = ioDevices_Data[57]
	},
	{
		prototype = "integer[0;100]|string(memorized1;secured)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[147],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[225],
		converter = ioDevices_Converter[147],
		extraDefinition = ioDevices_Data[18]
	},
	{
		["io:BioclimaticPergolaIOComponent"] = {
			type = 1,
			widget = "BioclimaticPergola",
			uiClass = "Pergola",
			uiProfiles = ioDevices_Data[252],
			states = ioDevices_Data[255],
			attributes = ioDevices_Data[59],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				closeSlats = ioDevices_Data[98],
				delayedStopIdentify = ioDevices_Data[13],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				runManufacturerSettingsCommand = ioDevices_Data[62],
				openSlats = ioDevices_Data[99],
				pairOneWayController = ioDevices_Data[17],
				refreshMemorized1Orientation = ioDevices_Data[37],
				setMemorized1Orientation = ioDevices_Data[47],
				setName = ioDevices_Data[20],
				setOrientation = ioDevices_Data[256],
				my = ioDevices_Data[257],
				setSecuredOrientation = ioDevices_Data[53],
				setSlatsOrientationWithSpeed = {
					prototype = "integer[0;100]|string(memorized1;secured),integer[0;100]",
					parameters = ioDevices_Data[44],
					converter = ioDevices_Converter[148],
					extraDefinition = ioDevices_Data[45]
				},
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				wink = ioDevices_Data[26],
				sendIOKey = ioDevices_Data[65]
			}
		}
	},
	{
		"StatefulSiren",
		"Siren"
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[81]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[82]
		}
	},
	{
		converter = ioDevices_Converter[151],
		extraDefinition = ioDevices_Data[18]
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
			ioDevices_HighLevelStates[85]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[86],
			ioDevices_HighLevelStates[99]
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
		ioDevices_HighLevelStates[86],
		ioDevices_HighLevelStates[89],
		ioDevices_HighLevelStates[90],
		ioDevices_HighLevelStates[91],
		ioDevices_HighLevelStates[44],
		ioDevices_HighLevelStates[99],
		ioDevices_HighLevelStates[46]
	},
	{
		linkedHighLevelState = ioDevices_Data[280],
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
		linkedHighLevelState = ioDevices_Data[280],
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
			ioDevices_HighLevelStates[87]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[88]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[89],
			ioDevices_HighLevelStates[99]
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
			ioDevices_HighLevelStates[90],
			ioDevices_HighLevelStates[99]
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
			ioDevices_HighLevelStates[91],
			ioDevices_HighLevelStates[99]
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
			ioDevices_HighLevelStates[92]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[93],
			ioDevices_HighLevelStates[95]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[94],
			ioDevices_HighLevelStates[96]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[97]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[98]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[44],
			ioDevices_HighLevelStates[99]
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
			ioDevices_HighLevelStates[99]
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
			ioDevices_HighLevelStates[100]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[101]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[102]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[103]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[104]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[105]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[106]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[107],
			ioDevices_HighLevelStates[110]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[108]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[109]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[111]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[112]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[113]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[114]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[115]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[116]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[117]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[118]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[119]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[120]
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
		converter = ioDevices_Converter[188],
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
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[189],
		extraDefinition = {
			access = "w",
			parameterId = "201329665"
		}
	},
	{
		prototype = "integer[0;99]|string(always)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[190],
		extraDefinition = {
			access = "w",
			parameterId = "201327873"
		}
	},
	{
		prototype = "string(boilerOptimising;boilerPriority;heatPumpOptimising;heatPumpPriority)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[191],
		extraDefinition = {
			access = "w",
			parameterId = "201330945"
		}
	},
	{
		prototype = "integer[1;7]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[189],
		extraDefinition = {
			access = "w",
			parameterId = "201326593"
		}
	},
	{
		prototype = "object",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[192],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(autoMode;manualEcoActive;manualEcoInactive)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[193],
		extraDefinition = {
			access = "w",
			parameterId = "201328129"
		}
	},
	{
		prototype = "object",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[194],
		extraDefinition = {
			access = "w",
			parameterId = "201330433"
		}
	},
	{
		prototype = "float[0.0;100.0]",
		parameters = ioDevices_Data[11],
		rawStates = ioDevices_Data[182],
		converter = ioDevices_Converter[95],
		extraDefinition = ioDevices_Data[234]
	},
	{
		prototype = "string(auto;deactive)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[195],
		extraDefinition = {
			access = "w",
			parameterId = "201330177"
		}
	},
	{
		prototype = "string(fastExtractionSpeed;lowExtractionSpeed;noExtraction)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[196],
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
		parameters = ioDevices_Data[11],
		rawStates = ioDevices_Data[182],
		converter = ioDevices_Converter[95],
		extraDefinition = ioDevices_Data[344]
	},
	{
		access = "w",
		parameterId = "16832531"
	},
	{
		prototype = "float[0.0;100.0]",
		parameters = ioDevices_Data[11],
		rawStates = ioDevices_Data[182],
		converter = ioDevices_Converter[95],
		extraDefinition = ioDevices_Data[346]
	},
	{
		prototype = "string(extraBoiler;extraSolar;onlyThermodynamic)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[197],
		extraDefinition = {
			access = "w",
			parameterId = "201330689"
		}
	},
	{
		prototype = "string(pac24h_elec24h;pacProg_elecProg)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[198],
		extraDefinition = {
			access = "w",
			parameterId = "201329153"
		}
	},
	{
		prototype = "object",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[199],
		extraDefinition = {
			access = "w",
			parameterId = "201329409"
		}
	},
	{
		prototype = "string(forbidden;no;recommended;unsuitable;wanted)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[200],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(active;deactive)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[201],
		extraDefinition = {
			access = "w",
			parameterId = "201331201"
		}
	},
	{
		prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
		parameters = ioDevices_Data[11],
		rawStates = ioDevices_Data[182],
		converter = ioDevices_Converter[202],
		extraDefinition = ioDevices_Data[18]
	},
	{
		advancedRefresh = ioDevices_Data[10],
		delayedStopIdentify = ioDevices_Data[13],
		getName = ioDevices_Data[14],
		identify = ioDevices_Data[15],
		pairOneWayController = ioDevices_Data[17],
		refreshAntiLegionellosis = ioDevices_Data[315],
		refreshAwayModeDuration = ioDevices_Data[316],
		refreshBoilerInstallationOption = ioDevices_Data[317],
		refreshBoostModeDuration = ioDevices_Data[318],
		refreshCurrentOperatingMode = ioDevices_Data[233],
		refreshDHWCapacity = ioDevices_Data[319],
		refreshDHWError = ioDevices_Data[320],
		refreshDHWMode = ioDevices_Data[321],
		refreshElectricalExtraManagement = ioDevices_Data[322],
		refreshExtractionOption = ioDevices_Data[323],
		refreshInstallation = ioDevices_Data[324],
		refreshManufacturerName = ioDevices_Data[325],
		refreshMiddleWaterTemperature = ioDevices_Data[326],
		refreshOperatingModeCapabilities = ioDevices_Data[327],
		refreshOperatingRange = ioDevices_Data[328],
		refreshOperatingTime = ioDevices_Data[329],
		refreshProgrammingSlots = ioDevices_Data[330],
		refreshRateManagement = ioDevices_Data[331],
		refreshSmartGridOption = ioDevices_Data[332],
		refreshTargetTemperature = ioDevices_Data[158],
		refreshWaterConsumption = ioDevices_Data[333],
		setAntiLegionellosis = ioDevices_Data[334],
		setAwayModeDuration = ioDevices_Data[335],
		setBoilerInstallationOption = ioDevices_Data[336],
		setBoostModeDuration = ioDevices_Data[337],
		setComfortTargetTemperature = ioDevices_Data[184],
		setCurrentOperatingMode = ioDevices_Data[338],
		setDHWMode = ioDevices_Data[339],
		setDateTime = ioDevices_Data[340],
		setEcoTargetTemperature = ioDevices_Data[341],
		setElectricalExtraManagement = ioDevices_Data[342],
		setExtractionOption = ioDevices_Data[343],
		setFrostProtectionTargetTemperature = ioDevices_Data[345],
		setHaltedTargetTemperature = ioDevices_Data[347],
		setInstallation = ioDevices_Data[348],
		setName = ioDevices_Data[20],
		setOperatingRange = ioDevices_Data[349],
		setProgrammingSlots = ioDevices_Data[350],
		setRateManagement = ioDevices_Data[351],
		setSmartGridOption = ioDevices_Data[352],
		setTargetTemperature = ioDevices_Data[353],
		startIdentify = ioDevices_Data[21],
		stopIdentify = ioDevices_Data[22],
		unpairAllOneWayControllers = ioDevices_Data[23],
		unpairOneWayController = ioDevices_Data[24],
		wink = ioDevices_Data[26]
	},
	{
		type = 1,
		widget = "DomesticHotWaterProduction",
		uiClass = "WaterHeatingSystem",
		uiProfiles = ioDevices_Data[277],
		states = {
			["201326593"] = ioDevices_Data[278],
			["16832527"] = ioDevices_Data[279],
			["65558"] = ioDevices_Data[281],
			["65559"] = ioDevices_Data[282],
			["201342977"] = ioDevices_Data[283],
			["201330433"] = ioDevices_Data[284],
			["2146500638"] = ioDevices_Data[1],
			["16832530"] = ioDevices_Data[285],
			["16832534"] = ioDevices_Data[286],
			["16832531"] = ioDevices_Data[287],
			["201328385"] = ioDevices_Data[288],
			["201343489"] = ioDevices_Data[289],
			["201343233"] = ioDevices_Data[290],
			["1"] = ioDevices_Data[3],
			["201341185"] = ioDevices_Data[291],
			["65553"] = ioDevices_Data[292],
			["16832522"] = ioDevices_Data[293],
			["2147426304"] = ioDevices_Data[4],
			["16830720"] = ioDevices_Data[294],
			["65537"] = ioDevices_Data[179],
			["201326849"] = ioDevices_Data[295],
			["201329665"] = ioDevices_Data[296],
			["201327873"] = ioDevices_Data[297],
			["201330945"] = ioDevices_Data[298],
			["201328641"] = ioDevices_Data[299],
			["201327105"] = ioDevices_Data[300],
			["201328129"] = ioDevices_Data[301],
			["201327361"] = ioDevices_Data[302],
			["201330177"] = ioDevices_Data[303],
			["201331457"] = ioDevices_Data[304],
			["201330689"] = ioDevices_Data[305],
			["201332481"] = ioDevices_Data[306],
			["65552"] = ioDevices_Data[307],
			["201329153"] = ioDevices_Data[308],
			["201337601"] = ioDevices_Data[309],
			["201339649"] = ioDevices_Data[310],
			["201339905"] = ioDevices_Data[311],
			["201329409"] = ioDevices_Data[312],
			["65547"] = ioDevices_Data[313],
			["201331201"] = ioDevices_Data[314]
		},
		attributes = ioDevices_Data[5],
		commands = ioDevices_Data[354]
	},
	{
		"ElectricEnergyConsumption"
	},
	{
		["core:FirmwareRevision"] = ioDevices_Attributes[0],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:PowerSourceType"] = ioDevices_Attributes[3],
		["core:MeasuredValueType"] = ioDevices_Attributes[4]
	},
	{
		["io:DHWCumulatedElectricalEnergyConsumptionIOSystemDeviceSensor"] = {
			type = 2,
			widget = "CumulativeElectricPowerConsumptionSensor",
			uiClass = "ElectricitySensor",
			uiProfiles = ioDevices_Data[356],
			states = {
				["201327617"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[121]
					}
				},
				["2147426304"] = ioDevices_Data[4]
			},
			attributes = ioDevices_Data[357],
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
			ioDevices_HighLevelStates[122],
			ioDevices_HighLevelStates[124],
			ioDevices_HighLevelStates[125]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[123]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[126]
		}
	},
	{
		prototype = "*string",
		parameters = ioDevices_Data[207],
		converter = ioDevices_Converter[207],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(boost;comfort;comfort-1;comfort-2;eco;frostprotection;off;secured)",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[208],
		extraDefinition = ioDevices_Data[45]
	},
	{
		parameters = ioDevices_Data[117],
		converter = ioDevices_Converter[208],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(boost;comfort;comfort-1;comfort-2;eco;frostprotection;off;secured),integer[1;65534]",
		parameters = ioDevices_Data[44],
		converter = ioDevices_Converter[209],
		extraDefinition = ioDevices_Data[45]
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
		["core:FirmwareRevision"] = ioDevices_Attributes[0],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:MeasuredValueType"] = ioDevices_Attributes[5],
		["core:PowerSourceType"] = ioDevices_Attributes[3]
	},
	{
		"Luminance"
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[148]
		}
	},
	{
		prototype = "string(normal;advanced)",
		parameters = ioDevices_Data[11],
		extraDefinition = {
			access = "r",
			parameterId = "2415919106"
		}
	},
	{
		advancedRefresh = ioDevices_Data[374]
	},
	{
		["io:LightIOSystemSensor"] = {
			type = 2,
			widget = "LuminanceSensor",
			uiClass = "LightSensor",
			uiProfiles = ioDevices_Data[372],
			states = {
				["2146500638"] = ioDevices_Data[1],
				["2415919106"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[147]
					}
				},
				["2415919110"] = ioDevices_Data[373],
				["2147426304"] = ioDevices_Data[4]
			},
			attributes = {
				["core:FirmwareRevision"] = ioDevices_Attributes[0],
				["core:Manufacturer"] = ioDevices_Attributes[1],
				["core:MaxSensedValue"] = ioDevices_Attributes[6],
				["core:MeasuredValueType"] = ioDevices_Attributes[7],
				["core:MinSensedValue"] = ioDevices_Attributes[8],
				["core:PowerSourceType"] = ioDevices_Attributes[9]
			},
			commands = ioDevices_Data[375]
		}
	},
	{
		["core:FirmwareRevision"] = ioDevices_Attributes[0],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:MaxSensedValue"] = ioDevices_Attributes[6],
		["core:MeasuredValueType"] = ioDevices_Attributes[10],
		["core:MinSensedValue"] = ioDevices_Attributes[8],
		["core:PowerSourceType"] = ioDevices_Attributes[9]
	},
	{
		["io:TemperatureIOSystemSensor"] = {
			type = 2,
			widget = "TemperatureSensor",
			uiClass = "TemperatureSensor",
			uiProfiles = ioDevices_Data[370],
			states = {
				["2146500638"] = ioDevices_Data[1],
				["2415919110"] = ioDevices_Data[373],
				["2147426304"] = ioDevices_Data[4],
				["2415919106"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[149]
					}
				}
			},
			attributes = ioDevices_Data[377],
			commands = ioDevices_Data[375]
		}
	},
	{
		"RelativeHumidity"
	},
	{
		["core:FirmwareRevision"] = ioDevices_Attributes[0],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:PowerSourceType"] = ioDevices_Attributes[9],
		["core:MeasuredValueType"] = ioDevices_Attributes[13]
	},
	{
		["io:RelativeHumidityIOSystemSensor"] = {
			type = 2,
			widget = "RelativeHumiditySensor",
			uiClass = "HumiditySensor",
			uiProfiles = ioDevices_Data[379],
			states = {
				["2146500638"] = ioDevices_Data[1],
				["2415919106"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[152]
					}
				},
				["2415919110"] = ioDevices_Data[373],
				["2147426304"] = ioDevices_Data[4]
			},
			attributes = ioDevices_Data[380],
			commands = ioDevices_Data[375]
		}
	},
	{
		["core:FirmwareRevision"] = ioDevices_Attributes[0],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:PowerSourceType"] = ioDevices_Attributes[9],
		["core:MeasuredValueType"] = ioDevices_Attributes[14]
	},
	{
		"GasConsumption"
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[156]
		}
	},
	{
		["2146500638"] = ioDevices_Data[1],
		["83935248"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[155]
			}
		},
		["2415919105"] = ioDevices_Data[384],
		["2415919110"] = ioDevices_Data[373],
		["2147426304"] = ioDevices_Data[4]
	},
	{
		extraDefinition = {
			access = "r",
			parameterId = "2415919105"
		}
	},
	{
		prototype = "string",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[13],
		extraDefinition = {
			access = "w",
			parameterId = "2415919105"
		}
	},
	{
		advancedRefresh = ioDevices_Data[374],
		getSensorName = ioDevices_Data[386],
		putSensorName = ioDevices_Data[387]
	},
	{
		ioDevices_HighLevelStates[161],
		ioDevices_HighLevelStates[162],
		ioDevices_HighLevelStates[163],
		ioDevices_HighLevelStates[164],
		ioDevices_HighLevelStates[165],
		ioDevices_HighLevelStates[166],
		ioDevices_HighLevelStates[167]
	},
	{
		"83902467"
	},
	{
		"83902466"
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		converter = ioDevices_Converter[249],
		extraDefinition = ioDevices_Data[368]
	},
	{
		advancedRefresh = ioDevices_Data[392],
		getSensorName = ioDevices_Data[386],
		putSensorName = ioDevices_Data[387]
	},
	{
		ioDevices_HighLevelStates[168],
		ioDevices_HighLevelStates[169],
		ioDevices_HighLevelStates[170],
		ioDevices_HighLevelStates[171],
		ioDevices_HighLevelStates[172],
		ioDevices_HighLevelStates[173],
		ioDevices_HighLevelStates[174]
	},
	{
		ioDevices_HighLevelStates[175],
		ioDevices_HighLevelStates[176],
		ioDevices_HighLevelStates[177],
		ioDevices_HighLevelStates[178],
		ioDevices_HighLevelStates[179],
		ioDevices_HighLevelStates[180],
		ioDevices_HighLevelStates[181]
	},
	{
		ioDevices_HighLevelStates[182],
		ioDevices_HighLevelStates[183],
		ioDevices_HighLevelStates[184],
		ioDevices_HighLevelStates[185],
		ioDevices_HighLevelStates[186],
		ioDevices_HighLevelStates[187],
		ioDevices_HighLevelStates[188]
	},
	{
		ioDevices_HighLevelStates[189],
		ioDevices_HighLevelStates[190],
		ioDevices_HighLevelStates[191],
		ioDevices_HighLevelStates[192],
		ioDevices_HighLevelStates[193],
		ioDevices_HighLevelStates[194],
		ioDevices_HighLevelStates[195]
	},
	{
		"SmokeDetector"
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[205]
		}
	},
	{
		["core:FirmwareRevision"] = ioDevices_Attributes[0],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:MeasuredValueType"] = ioDevices_Attributes[7],
		["core:PowerSourceType"] = ioDevices_Attributes[9]
	},
	{
		"DoorContactSensor",
		"ContactDetector"
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[209]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[210]
		}
	},
	{
		type = 2,
		widget = "ContactSensor",
		uiClass = "ContactSensor",
		uiProfiles = ioDevices_Data[401],
		states = {
			["2415919106"] = ioDevices_Data[402],
			["2146500638"] = ioDevices_Data[1],
			["2415919110"] = ioDevices_Data[403],
			["2147426304"] = ioDevices_Data[4]
		},
		attributes = ioDevices_Data[400],
		commands = ioDevices_Data[375]
	},
	{
		"OccupancyDetector"
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[211]
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
			["2146500638"] = ioDevices_Data[1],
			["2415919106"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[212]
				}
			},
			["2415919110"] = ioDevices_Data[373],
			["2147426304"] = ioDevices_Data[4]
		},
		attributes = {
			["core:FirmwareRevision"] = ioDevices_Attributes[0],
			["core:Manufacturer"] = ioDevices_Attributes[1],
			["core:MeasuredValueType"] = ioDevices_Attributes[7]
		},
		commands = ioDevices_Data[375]
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
			ioDevices_HighLevelStates[0],
			ioDevices_HighLevelStates[216]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[213],
			ioDevices_HighLevelStates[214],
			ioDevices_HighLevelStates[215]
		}
	},
	{
		["core:FirmwareRevision"] = ioDevices_Attributes[0],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:MaxSensedValue"] = ioDevices_Attributes[28],
		["core:MeasuredValueType"] = ioDevices_Attributes[29],
		["core:MinSensedValue"] = ioDevices_Attributes[30]
	},
	{
		advancedRefresh = {
			prototype = "string(normal;advanced)",
			parameters = ioDevices_Data[11],
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
			ioDevices_HighLevelStates[217]
		}
	},
	{
		["core:FirmwareRevision"] = ioDevices_Attributes[0],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:MaxSensedValue"] = ioDevices_Attributes[31],
		["core:MeasuredValueType"] = ioDevices_Attributes[32],
		["core:MinSensedValue"] = ioDevices_Attributes[33],
		["core:PowerSourceType"] = ioDevices_Attributes[9]
	},
	{
		prototype = "string(normal;advanced)",
		parameters = ioDevices_Data[11],
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
			uiProfiles = ioDevices_Data[413],
			states = {
				["2146500638"] = ioDevices_Data[409],
				["2415919110"] = ioDevices_Data[403],
				["2147426304"] = ioDevices_Data[4],
				["18152947712002"] = ioDevices_Data[414],
				["83903234"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[218]
					}
				}
			},
			attributes = ioDevices_Data[415],
			commands = {
				setVibrationLevelThreshold = {
					prototype = "integer[1;9]",
					parameters = ioDevices_Data[11],
					rawStates = {
						{
							rawStateId = "83903234"
						}
					},
					converter = ioDevices_Converter[306],
					extraDefinition = ioDevices_Data[195]
				},
				advancedRefresh = ioDevices_Data[416]
			}
		}
	},
	{
		access = "w",
		parameterId = "2146566149"
	},
	{
		["core:GroupId"] = ioDevices_Attributes[35],
		["core:GroupIndex"] = ioDevices_Attributes[36]
	},
	{
		type = 4,
		widget = "RemoteControllerOneWay",
		uiClass = "RemoteController",
		uiProfiles = ioDevices_Data[367],
		states = {
			["33554442"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[220]
				}
			}
		},
		attributes = ioDevices_Data[419]
	},
	{
		prototype = "integer[0;100],*string(lowspeed)",
		parameters = ioDevices_Data[8],
		converter = ioDevices_Converter[318],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(my)|integer[0;100],*string(lowspeed)",
		parameters = ioDevices_Data[8],
		converter = ioDevices_Converter[319],
		extraDefinition = ioDevices_Data[45]
	},
	{
		advancedRefresh = ioDevices_Data[10],
		delayedStopIdentify = ioDevices_Data[13],
		getName = ioDevices_Data[14],
		identify = ioDevices_Data[15],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		runManufacturerSettingsCommand = ioDevices_Data[62],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		up = ioDevices_Data[42],
		setClosureAndLinearSpeed = ioDevices_Data[421],
		setMemorized1Position = ioDevices_Data[47],
		setName = ioDevices_Data[20],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setPositionAndLinearSpeed = ioDevices_Data[422],
		setSecuredPosition = ioDevices_Data[53],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		stopIdentify = ioDevices_Data[22],
		unpairAllOneWayControllers = ioDevices_Data[23],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		unpairOneWayController = ioDevices_Data[24],
		setConfigState = ioDevices_Data[25],
		wink = ioDevices_Data[26],
		sendIOKey = ioDevices_Data[65]
	},
	{
		["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutterWithLowSpeedManagement",
			uiClass = "RollerShutter",
			uiProfiles = ioDevices_Data[54],
			states = ioDevices_Data[58],
			attributes = ioDevices_Data[59],
			commands = ioDevices_Data[423]
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
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[321],
		extraDefinition = ioDevices_Data[18]
	},
	{
		"CloseableWindow",
		"Closeable",
		"OpenClose"
	},
	{
		ioDevices_HighLevelStates[223]
	},
	{
		linkedHighLevelState = ioDevices_Data[428],
		linkedStateIds = {
			"120833",
			"120834",
			"120835",
			"120842",
			"65537"
		}
	},
	{
		linkedHighLevelState = ioDevices_Data[428],
		linkedStateIds = {
			"120833",
			"120834",
			"120835",
			"16830720",
			"65537"
		}
	},
	{
		linkedHighLevelState = ioDevices_Data[428],
		linkedStateIds = {
			"120834",
			"120835",
			"120842",
			"16830720",
			"65537"
		}
	},
	{
		linkedHighLevelState = ioDevices_Data[428],
		linkedStateIds = {
			"120833",
			"120835",
			"120842",
			"16830720",
			"65537"
		}
	},
	{
		linkedHighLevelState = ioDevices_Data[428],
		linkedStateIds = {
			"120833",
			"120834",
			"120842",
			"16830720",
			"65537"
		}
	},
	{
		ioDevices_HighLevelStates[224]
	},
	{
		linkedHighLevelState = ioDevices_Data[434],
		linkedStateIds = ioDevices_Data[243]
	},
	{
		converter = ioDevices_Converter[324],
		extraDefinition = ioDevices_Data[18]
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
			uiProfiles = ioDevices_Data[97],
			states = {
				["2146500638"] = ioDevices_Data[1],
				["1"] = ioDevices_Data[3],
				["65537"] = {
					linkedHighLevelState = ioDevices_Data[434],
					linkedStateIds = {
						"16832521"
					}
				},
				["16832521"] = ioDevices_Data[435],
				["2147426304"] = ioDevices_Data[4],
				["2"] = ioDevices_Data[56],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = ioDevices_Data[59],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				close = ioDevices_Data[98],
				delayedStopIdentify = ioDevices_Data[13],
				down = ioDevices_Data[98],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				runManufacturerSettingsCommand = ioDevices_Data[62],
				open = ioDevices_Data[99],
				pairOneWayController = ioDevices_Data[17],
				partialPosition = ioDevices_Data[436],
				refreshPartialPosition = ioDevices_Data[437],
				setName = ioDevices_Data[20],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				up = ioDevices_Data[99],
				wink = ioDevices_Data[26],
				sendIOKey = ioDevices_Data[65]
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
		converter = ioDevices_Converter[327],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = {
			{
				value = "unlocked",
				name = "p1"
			}
		},
		converter = ioDevices_Converter[327],
		extraDefinition = ioDevices_Data[18]
	},
	{
		"CloseableBlind",
		"Closeable",
		"OpenClose"
	},
	{
		linkedHighLevelState = ioDevices_Data[34],
		linkedStateIds = ioDevices_Data[29]
	},
	{
		["2146500638"] = ioDevices_Data[1],
		["16832512"] = ioDevices_Data[31],
		["1"] = ioDevices_Data[3],
		["16832522"] = ioDevices_Data[33],
		["2147426304"] = ioDevices_Data[4],
		["16830720"] = ioDevices_Data[35],
		["65537"] = ioDevices_Data[442],
		["2"] = ioDevices_Data[56],
		["2146500645"] = ioDevices_Data[57]
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
		uiProfiles = ioDevices_Data[444],
		states = {
			["65537"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[20],
					ioDevices_HighLevelStates[10],
					ioDevices_HighLevelStates[51]
				},
				linkedStateIds = ioDevices_Data[29]
			},
			["2146500638"] = ioDevices_Data[1],
			["16832512"] = ioDevices_Data[31],
			["1"] = ioDevices_Data[3],
			["16832522"] = ioDevices_Data[33],
			["2147426304"] = ioDevices_Data[4],
			["16830720"] = ioDevices_Data[35],
			["2"] = ioDevices_Data[56],
			["65557"] = ioDevices_Data[36],
			["2146500645"] = ioDevices_Data[57]
		},
		attributes = ioDevices_Data[59],
		commands = ioDevices_Data[202]
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
			uiProfiles = ioDevices_Data[28],
			states = ioDevices_Data[212],
			attributes = ioDevices_Data[59],
			commands = ioDevices_Data[217]
		}
	},
	{
		"CloseableCurtain",
		"Closeable",
		"OpenClose"
	},
	{
		prototype = "string(my;memorized1)|integer[0;100]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[330],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[39],
		converter = ioDevices_Converter[330],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[41],
		converter = ioDevices_Converter[330],
		extraDefinition = ioDevices_Data[18]
	},
	{
		parameters = ioDevices_Data[50],
		converter = ioDevices_Converter[330],
		extraDefinition = ioDevices_Data[18]
	},
	{
		["io:SimpleBioclimaticPergolaIOComponent"] = {
			type = 1,
			widget = "BioclimaticPergola",
			uiClass = "Pergola",
			uiProfiles = ioDevices_Data[252],
			states = ioDevices_Data[255],
			attributes = ioDevices_Data[59],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				closeSlats = ioDevices_Data[98],
				delayedStopIdentify = ioDevices_Data[13],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				runManufacturerSettingsCommand = ioDevices_Data[62],
				openSlats = ioDevices_Data[99],
				pairOneWayController = ioDevices_Data[17],
				refreshMemorized1Orientation = ioDevices_Data[37],
				setMemorized1Orientation = ioDevices_Data[47],
				setName = ioDevices_Data[20],
				setOrientation = ioDevices_Data[256],
				my = ioDevices_Data[257],
				setSecuredOrientation = ioDevices_Data[53],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				wink = ioDevices_Data[26],
				sendIOKey = ioDevices_Data[65]
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
			ioDevices_HighLevelStates[236],
			ioDevices_HighLevelStates[248],
			ioDevices_HighLevelStates[263]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[237],
			ioDevices_HighLevelStates[241],
			ioDevices_HighLevelStates[242],
			ioDevices_HighLevelStates[254],
			ioDevices_HighLevelStates[259],
			ioDevices_HighLevelStates[262]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[238],
			ioDevices_HighLevelStates[239],
			ioDevices_HighLevelStates[240],
			ioDevices_HighLevelStates[257],
			ioDevices_HighLevelStates[258],
			ioDevices_HighLevelStates[261]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[252]
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[253]
		}
	},
	{
		{
			rawStateId = "84059684",
			converter = ioDevices_Converter[346]
		},
		{
			rawStateId = "84059684",
			converter = ioDevices_Converter[345]
		}
	},
	{
		rawStates = ioDevices_Data[466],
		converter = ioDevices_Converter[368],
		extraDefinition = ioDevices_Data[195]
	},
	{
		prototype = "float[5.0;26.0],float[5.0;26.0],float[5.0;26.0],float[5.0;26.0]",
		parameters = ioDevices_Data[125],
		rawStates = {},
		converter = ioDevices_Converter[369],
		extraDefinition = ioDevices_Data[195]
	},
	{
		prototype = "string(comfort;eco;away;frostprotection;geofencingMode)|float[5.0;26.0],string(further_notice;next_mode)|integer[0;]",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[466],
		converter = ioDevices_Converter[370],
		extraDefinition = ioDevices_Data[195]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		converter = ioDevices_Converter[371],
		extraDefinition = ioDevices_Data[195]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[248]
		}
	},
	{
		advancedRefresh = {
			prototype = "string(normal;advanced)",
			parameters = ioDevices_Data[11],
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
			uiProfiles = ioDevices_Data[370],
			states = {
				["2146500638"] = ioDevices_Data[1],
				["84059682"] = ioDevices_Data[471],
				["2147426304"] = ioDevices_Data[4],
				["84059680"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[264]
					}
				}
			},
			attributes = ioDevices_Data[377],
			commands = ioDevices_Data[472]
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
		parameters = ioDevices_Data[44],
		converter = ioDevices_Converter[374],
		extraDefinition = ioDevices_Data[45]
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
			uiProfiles = ioDevices_Data[477],
			states = {
				["2146500638"] = ioDevices_Data[1],
				["16832512"] = ioDevices_Data[31],
				["1"] = ioDevices_Data[3],
				["16832522"] = ioDevices_Data[33],
				["2147426304"] = ioDevices_Data[4],
				["16830720"] = ioDevices_Data[35],
				["65537"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[10],
						ioDevices_HighLevelStates[12],
						ioDevices_HighLevelStates[5]
					},
					linkedStateIds = ioDevices_Data[29]
				},
				["65557"] = ioDevices_Data[36],
				["2"] = ioDevices_Data[56],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = ioDevices_Data[59],
			commands = ioDevices_Data[66]
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
			ioDevices_HighLevelStates[5],
			ioDevices_HighLevelStates[12],
			ioDevices_HighLevelStates[10],
			ioDevices_HighLevelStates[20]
		},
		linkedStateIds = ioDevices_Data[29]
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
			uiProfiles = ioDevices_Data[28],
			states = {
				["65537"] = ioDevices_Data[68],
				["2146500638"] = ioDevices_Data[1],
				["17029120"] = ioDevices_Data[211],
				["16832512"] = ioDevices_Data[69],
				["1"] = ioDevices_Data[3],
				["16832522"] = ioDevices_Data[70],
				["65540"] = ioDevices_Data[73],
				["2147426304"] = ioDevices_Data[4],
				["2"] = ioDevices_Data[56],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = ioDevices_Data[59],
			commands = {
				advancedRefresh = ioDevices_Data[10],
				delayedStopIdentify = ioDevices_Data[13],
				getName = ioDevices_Data[14],
				identify = ioDevices_Data[15],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				runManufacturerSettingsCommand = ioDevices_Data[62],
				pairOneWayController = ioDevices_Data[17],
				refreshMemorized1Orientation = ioDevices_Data[481],
				refreshMemorized1Position = ioDevices_Data[37],
				setClosure = ioDevices_Data[38],
				close = ioDevices_Data[40],
				down = ioDevices_Data[40],
				open = ioDevices_Data[42],
				up = ioDevices_Data[42],
				setClosureAndOrientation = ioDevices_Data[213],
				my = ioDevices_Data[214],
				setMemorized1Orientation = ioDevices_Data[216],
				setMemorized1Position = ioDevices_Data[47],
				setName = ioDevices_Data[20],
				setOrientation = ioDevices_Data[215],
				setPosition = ioDevices_Data[48],
				setSecuredPosition = ioDevices_Data[53],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				stopIdentify = ioDevices_Data[22],
				unpairAllOneWayControllers = ioDevices_Data[23],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				unpairOneWayController = ioDevices_Data[24],
				setConfigState = ioDevices_Data[25],
				wink = ioDevices_Data[26],
				sendIOKey = ioDevices_Data[65]
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
			ioDevices_HighLevelStates[5],
			ioDevices_HighLevelStates[280],
			ioDevices_HighLevelStates[12],
			ioDevices_HighLevelStates[10]
		},
		linkedStateIds = ioDevices_Data[29]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[281]
		}
	},
	{
		type = 1,
		widget = "DomesticHotWaterProduction",
		uiClass = "WaterHeatingSystem",
		uiProfiles = ioDevices_Data[277],
		states = {
			["201326593"] = ioDevices_Data[278],
			["16832527"] = ioDevices_Data[279],
			["65558"] = ioDevices_Data[281],
			["65559"] = ioDevices_Data[282],
			["201342977"] = ioDevices_Data[283],
			["201330433"] = ioDevices_Data[284],
			["2146500638"] = ioDevices_Data[1],
			["16832530"] = ioDevices_Data[285],
			["16832534"] = ioDevices_Data[286],
			["16832531"] = ioDevices_Data[287],
			["201328385"] = ioDevices_Data[288],
			["201343489"] = ioDevices_Data[289],
			["201343233"] = ioDevices_Data[290],
			["1"] = ioDevices_Data[3],
			["201341185"] = ioDevices_Data[291],
			["65553"] = ioDevices_Data[292],
			["16832522"] = ioDevices_Data[293],
			["2147426304"] = ioDevices_Data[4],
			["16830720"] = ioDevices_Data[294],
			["65537"] = ioDevices_Data[179],
			["201339137"] = ioDevices_Data[485],
			["201326849"] = ioDevices_Data[295],
			["201329665"] = ioDevices_Data[296],
			["201327873"] = ioDevices_Data[297],
			["201330945"] = ioDevices_Data[298],
			["201328641"] = ioDevices_Data[299],
			["201327105"] = ioDevices_Data[300],
			["201328129"] = ioDevices_Data[301],
			["201327361"] = ioDevices_Data[302],
			["201330177"] = ioDevices_Data[303],
			["201331457"] = ioDevices_Data[304],
			["201330689"] = ioDevices_Data[305],
			["201332481"] = ioDevices_Data[306],
			["65552"] = ioDevices_Data[307],
			["201329153"] = ioDevices_Data[308],
			["201337601"] = ioDevices_Data[309],
			["201339649"] = ioDevices_Data[310],
			["201339905"] = ioDevices_Data[311],
			["201329409"] = ioDevices_Data[312],
			["65547"] = ioDevices_Data[313],
			["201331201"] = ioDevices_Data[314]
		},
		attributes = ioDevices_Data[5],
		commands = ioDevices_Data[354]
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
		["65537"] = ioDevices_Data[55],
		["2146500638"] = ioDevices_Data[1],
		["16832512"] = ioDevices_Data[31],
		["1"] = ioDevices_Data[3],
		["16832522"] = ioDevices_Data[33],
		["2147426304"] = ioDevices_Data[4],
		["16830720"] = ioDevices_Data[35],
		["65557"] = ioDevices_Data[36],
		["2"] = ioDevices_Data[56],
		["2146500645"] = ioDevices_Data[57],
		["65556"] = ioDevices_Data[260]
	},
	{
		"CloseableScreen",
		"Closeable",
		"Deployable",
		"DeployUndeploy",
		"OpenClose"
	},
	{
		["io:SlidingDiscreteFullyPedestriableGateOpenerIOComponent"] = ioDevices_Data[151]
	},
	{
		extraDefinition = {
			access = "r",
			parameterId = "201344769"
		}
	},
	{
		prototype = "float[0.0;100.0]",
		parameters = ioDevices_Data[11],
		converter = ioDevices_Converter[395],
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
					ioDevices_HighLevelStates[282]
				}
			},
			["201351681"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[283]
				}
			},
			["201343745"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[284]
				}
			},
			["201351425"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[285]
				}
			},
			["201326593"] = ioDevices_Data[278],
			["201351169"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[286]
				}
			},
			["201332993"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[287]
				}
			},
			["16832527"] = ioDevices_Data[279],
			["65558"] = ioDevices_Data[281],
			["65559"] = ioDevices_Data[282],
			["201345281"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[288]
				}
			},
			["201342977"] = ioDevices_Data[283],
			["201330433"] = ioDevices_Data[284],
			["2146500638"] = ioDevices_Data[1],
			["16832530"] = ioDevices_Data[285],
			["201345025"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[289]
				}
			},
			["16832534"] = ioDevices_Data[286],
			["16832531"] = ioDevices_Data[287],
			["201352193"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[290]
				}
			},
			["201328385"] = ioDevices_Data[288],
			["201343489"] = ioDevices_Data[289],
			["201343233"] = ioDevices_Data[290],
			["201344257"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[291]
				}
			},
			["1"] = ioDevices_Data[3],
			["201344513"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[292]
				}
			},
			["201341185"] = ioDevices_Data[291],
			["65553"] = ioDevices_Data[292],
			["201344001"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[293]
				}
			},
			["201340929"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[294]
				}
			},
			["16832522"] = ioDevices_Data[293],
			["2147426304"] = ioDevices_Data[4],
			["201340417"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[295]
				}
			},
			["16830720"] = ioDevices_Data[294],
			["65537"] = ioDevices_Data[179],
			["201339137"] = ioDevices_Data[485],
			["201326849"] = ioDevices_Data[295],
			["201344769"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[296],
					ioDevices_HighLevelStates[297],
					ioDevices_HighLevelStates[298]
				}
			},
			["201329665"] = ioDevices_Data[296],
			["201327873"] = ioDevices_Data[297],
			["201330945"] = ioDevices_Data[298],
			["201347841"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[299]
				}
			},
			["201347585"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[300]
				}
			},
			["201328641"] = ioDevices_Data[299],
			["201327105"] = ioDevices_Data[300],
			["201328129"] = ioDevices_Data[301],
			["201327361"] = ioDevices_Data[302],
			["201330177"] = ioDevices_Data[303],
			["201331457"] = ioDevices_Data[304],
			["201330689"] = ioDevices_Data[305],
			["201332481"] = ioDevices_Data[306],
			["65552"] = ioDevices_Data[307],
			["201329153"] = ioDevices_Data[308],
			["201337601"] = ioDevices_Data[309],
			["201339649"] = ioDevices_Data[310],
			["201339905"] = ioDevices_Data[311],
			["201329409"] = ioDevices_Data[312],
			["65547"] = ioDevices_Data[313],
			["201331201"] = ioDevices_Data[314]
		},
		attributes = ioDevices_Data[5],
		commands = {
			advancedRefresh = ioDevices_Data[10],
			delayedStopIdentify = ioDevices_Data[13],
			getName = ioDevices_Data[14],
			identify = ioDevices_Data[15],
			pairOneWayController = ioDevices_Data[17],
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
			refreshAntiLegionellosis = ioDevices_Data[315],
			refreshAwayModeDuration = ioDevices_Data[316],
			refreshBoilerInstallationOption = ioDevices_Data[317],
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
			refreshBoostModeDuration = ioDevices_Data[318],
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
			refreshCurrentOperatingMode = ioDevices_Data[233],
			refreshDHWCapacity = ioDevices_Data[319],
			refreshDHWError = ioDevices_Data[320],
			refreshDHWMode = ioDevices_Data[321],
			refreshElectricalExtraManagement = ioDevices_Data[322],
			refreshExpectedNumberOfShower = {
				extraDefinition = {
					access = "r",
					parameterId = "201345025"
				}
			},
			refreshExtractionOption = ioDevices_Data[323],
			refreshInstallation = ioDevices_Data[324],
			refreshManufacturerName = ioDevices_Data[325],
			refreshMiddleWaterTemperature = ioDevices_Data[326],
			refreshMiddleWaterTemperatureIn = {
				extraDefinition = {
					access = "r",
					parameterId = "201344257"
				}
			},
			refreshOperatingModeCapabilities = ioDevices_Data[327],
			refreshOperatingRange = ioDevices_Data[328],
			refreshOperatingTime = ioDevices_Data[329],
			refreshProgrammingSlots = ioDevices_Data[330],
			refreshRateManagement = ioDevices_Data[331],
			refreshSmartGridOption = ioDevices_Data[332],
			refreshTargetTemperature = ioDevices_Data[158],
			refreshWaterConsumption = ioDevices_Data[333],
			refreshWaterTargetTemperature = ioDevices_Data[491],
			refreshWaterTemperature = ioDevices_Data[491],
			setAbsenceEndDate = {
				prototype = "object",
				parameters = ioDevices_Data[11],
				converter = ioDevices_Converter[194],
				extraDefinition = {
					access = "w",
					parameterId = "201351937"
				}
			},
			setAbsenceMode = {
				prototype = "string(off;on;prog)",
				parameters = ioDevices_Data[11],
				converter = ioDevices_Converter[394],
				extraDefinition = {
					access = "w",
					parameterId = "201347841"
				}
			},
			setAbsenceStartDate = {
				prototype = "object",
				parameters = ioDevices_Data[11],
				converter = ioDevices_Converter[194],
				extraDefinition = {
					access = "w",
					parameterId = "201351681"
				}
			},
			setAntiLegionellosis = ioDevices_Data[334],
			setAwayModeDuration = ioDevices_Data[335],
			setBoilerInstallationOption = ioDevices_Data[336],
			setBoostEndDate = {
				prototype = "object",
				parameters = ioDevices_Data[11],
				converter = ioDevices_Converter[194],
				extraDefinition = {
					access = "w",
					parameterId = "201351425"
				}
			},
			setBoostMode = {
				prototype = "string(off;on;prog)",
				parameters = ioDevices_Data[11],
				converter = ioDevices_Converter[394],
				extraDefinition = {
					access = "w",
					parameterId = "201347585"
				}
			},
			setBoostModeDuration = ioDevices_Data[337],
			setBoostStartDate = {
				prototype = "object",
				parameters = ioDevices_Data[11],
				converter = ioDevices_Converter[194],
				extraDefinition = {
					access = "w",
					parameterId = "201351169"
				}
			},
			setComfortTargetTemperature = ioDevices_Data[184],
			setCurrentOperatingMode = ioDevices_Data[338],
			setDHWMode = ioDevices_Data[339],
			setDateTime = ioDevices_Data[340],
			setEcoTargetTemperature = ioDevices_Data[341],
			setElectricalExtraManagement = ioDevices_Data[342],
			setExpectedNumberOfShower = {
				prototype = "integer[0;10]",
				parameters = ioDevices_Data[11],
				converter = ioDevices_Converter[189],
				extraDefinition = {
					access = "w",
					parameterId = "201345025"
				}
			},
			setExtractionOption = ioDevices_Data[343],
			setFrostProtectionTargetTemperature = ioDevices_Data[345],
			setHaltedTargetTemperature = ioDevices_Data[347],
			setInstallation = ioDevices_Data[348],
			setName = ioDevices_Data[20],
			setOperatingRange = ioDevices_Data[349],
			setProgrammingSlots = ioDevices_Data[350],
			setRateManagement = ioDevices_Data[351],
			setSmartGridOption = ioDevices_Data[352],
			setTargetTemperature = ioDevices_Data[353],
			setWaterTargetTemperature = ioDevices_Data[492],
			setTargetDHWTemperature = ioDevices_Data[492],
			setWaterTemperature = ioDevices_Data[492],
			startIdentify = ioDevices_Data[21],
			stopIdentify = ioDevices_Data[22],
			unpairAllOneWayControllers = ioDevices_Data[23],
			unpairOneWayController = ioDevices_Data[24],
			wink = ioDevices_Data[26]
		}
	},
	{
		type = 4,
		widget = "RemoteControllerOneWay",
		uiClass = "RemoteController",
		uiProfiles = ioDevices_Data[367],
		states = {
			["65555"] = {
				linkedHighLevelState = {
					ioDevices_HighLevelStates[301]
				}
			}
		},
		attributes = ioDevices_Data[419]
	},
	{
		["65537"] = ioDevices_Data[88],
		["2146500638"] = ioDevices_Data[1],
		["16832512"] = ioDevices_Data[31],
		["1"] = ioDevices_Data[3],
		["16832522"] = ioDevices_Data[33],
		["2147426304"] = ioDevices_Data[4],
		["2"] = ioDevices_Data[56],
		["2146500645"] = ioDevices_Data[57],
		["65556"] = ioDevices_Data[260],
		["65557"] = ioDevices_Data[36],
		["16830720"] = ioDevices_Data[35]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[302]
		}
	},
	{
		["io:SunEnergyActuatorSensor"] = {
			type = 2,
			widget = "LuminanceSensor",
			uiClass = "LightSensor",
			uiProfiles = ioDevices_Data[372],
			states = {
				["67362620678"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[303],
						ioDevices_HighLevelStates[304]
					}
				}
			}
		}
	},
	{
		ioDevices_HighLevelStates[305]
	},
	{
		"65537",
		"84059661"
	},
	{
		linkedHighLevelState = ioDevices_Data[498],
		linkedStateIds = ioDevices_Data[499]
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
		linkedHighLevelState = ioDevices_Data[498],
		linkedStateIds = ioDevices_Data[502]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[10],
			ioDevices_HighLevelStates[8]
		},
		linkedStateIds = ioDevices_Data[32]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[14]
		}
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84059651"] = ioDevices_Data[500],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[305],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10]
			},
			linkedStateIds = ioDevices_Data[501]
		},
		["84059661"] = ioDevices_Data[503],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[38],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		rawStateId = "84059661"
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[508]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[509],
		converter = ioDevices_Converter[402],
		extraDefinition = ioDevices_Data[9]
	},
	{
		["io:VerticalInteriorBlindGenericIOComponent"] = {
			type = 1,
			widget = "PositionableScreen",
			uiClass = "Screen",
			uiProfiles = ioDevices_Data[167],
			states = ioDevices_Data[506],
			attributes = ioDevices_Data[507],
			commands = {
				setName = ioDevices_Data[20],
				sendIOKey = ioDevices_Data[65],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				unpairOneWayController = ioDevices_Data[24],
				getName = ioDevices_Data[14],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				delayedStopIdentify = ioDevices_Data[13],
				identify = ioDevices_Data[15],
				unpairAllOneWayControllers = ioDevices_Data[23],
				setSecuredPosition = ioDevices_Data[53],
				setPosition = ioDevices_Data[48],
				my = ioDevices_Data[51],
				setConfigState = ioDevices_Data[25],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				setMemorized1Position = ioDevices_Data[47],
				stopIdentify = ioDevices_Data[22],
				wink = ioDevices_Data[26],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ioDevices_Data[44],
					rawStates = ioDevices_Data[509],
					converter = ioDevices_Converter[401],
					extraDefinition = ioDevices_Data[45]
				},
				setClosure = ioDevices_Data[38],
				close = ioDevices_Data[40],
				down = ioDevices_Data[40],
				open = ioDevices_Data[42],
				up = ioDevices_Data[42],
				pairOneWayController = ioDevices_Data[17],
				refreshMemorized1Position = ioDevices_Data[37],
				advancedRefresh = ioDevices_Data[510]
			}
		}
	},
	{
		ioDevices_HighLevelStates[306]
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
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[39],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
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
		ioDevices_Data[518],
		ioDevices_Data[129],
		ioDevices_Data[519],
		ioDevices_Data[520]
	},
	{
		ioDevices_HighLevelStates[307]
	},
	{
		["io:AdjustableSlatsRollerShutterIOComponent"] = {
			type = 1,
			widget = "PositionableOrOrientableRollerShutter",
			uiClass = "AdjustableSlatsRollerShutter",
			uiProfiles = ioDevices_Data[72],
			states = {
				["84082687"] = {
					linkedHighLevelState = ioDevices_Data[522],
					linkedStateIds = ioDevices_Data[513]
				},
				["65537"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[307],
						ioDevices_HighLevelStates[17],
						ioDevices_HighLevelStates[16],
						ioDevices_HighLevelStates[10]
					},
					linkedStateIds = ioDevices_Data[514]
				},
				["65540"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[307],
						ioDevices_HighLevelStates[18]
					},
					linkedStateIds = ioDevices_Data[515]
				},
				["48177664"] = {
					linkedHighLevelState = ioDevices_Data[522],
					linkedStateIds = ioDevices_Data[516]
				},
				["2147426304"] = ioDevices_Data[4],
				["1"] = ioDevices_Data[3],
				["65557"] = ioDevices_Data[36],
				["2146500645"] = ioDevices_Data[57],
				["16830720"] = ioDevices_Data[35],
				["16832512"] = ioDevices_Data[74],
				["16832522"] = ioDevices_Data[75],
				["2"] = ioDevices_Data[505],
				["2146500638"] = ioDevices_Data[1]
			},
			attributes = ioDevices_Data[517],
			commands = {
				setName = ioDevices_Data[20],
				setOrientation = ioDevices_Data[83],
				sendIOKey = ioDevices_Data[65],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				unpairOneWayController = ioDevices_Data[24],
				getName = ioDevices_Data[14],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				delayedStopIdentify = ioDevices_Data[13],
				identify = ioDevices_Data[15],
				unpairAllOneWayControllers = ioDevices_Data[23],
				setConfigState = ioDevices_Data[25],
				setClosureOrRockerPosition = ioDevices_Data[78],
				close = ioDevices_Data[79],
				down = ioDevices_Data[79],
				open = ioDevices_Data[80],
				setClosure = ioDevices_Data[81],
				setDeployment = ioDevices_Data[81],
				setRockerPosition = ioDevices_Data[82],
				up = ioDevices_Data[80],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[84],
				stopIdentify = ioDevices_Data[22],
				wink = ioDevices_Data[26],
				setClosureOrOrientation = ioDevices_Data[77],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ioDevices_Data[44],
					rawStates = ioDevices_Data[521],
					converter = ioDevices_Converter[408],
					extraDefinition = ioDevices_Data[45]
				},
				pairOneWayController = ioDevices_Data[17],
				advancedRefresh = {
					prototype = "string(normal;advanced;custom),*array",
					parameters = ioDevices_Data[8],
					rawStates = ioDevices_Data[521],
					converter = ioDevices_Converter[409],
					extraDefinition = ioDevices_Data[9]
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
		ioDevices_Data[518],
		ioDevices_Data[129]
	},
	{
		ioDevices_HighLevelStates[309]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[34],
			ioDevices_HighLevelStates[33]
		},
		linkedStateIds = ioDevices_Data[142]
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
		ioDevices_Data[528],
		ioDevices_Data[129],
		ioDevices_Data[529],
		ioDevices_Data[530],
		ioDevices_Data[531],
		ioDevices_Data[532],
		ioDevices_Data[533],
		ioDevices_Data[534],
		ioDevices_Data[535],
		ioDevices_Data[536],
		ioDevices_Data[537],
		ioDevices_Data[538],
		ioDevices_Data[539],
		ioDevices_Data[540],
		ioDevices_Data[541],
		ioDevices_Data[542],
		ioDevices_Data[543],
		ioDevices_Data[544],
		ioDevices_Data[545],
		ioDevices_Data[546],
		ioDevices_Data[547],
		ioDevices_Data[548],
		ioDevices_Data[549],
		ioDevices_Data[550],
		ioDevices_Data[551],
		ioDevices_Data[552],
		ioDevices_Data[553],
		ioDevices_Data[554],
		ioDevices_Data[555],
		ioDevices_Data[556],
		ioDevices_Data[557],
		ioDevices_Data[558],
		ioDevices_Data[559],
		ioDevices_Data[560],
		ioDevices_Data[561],
		ioDevices_Data[562],
		ioDevices_Data[563]
	},
	{
		["io:SlidingDiscreteGateOpenerIOComponent"] = {
			type = 1,
			widget = "SlidingDiscreteGateWithPedestrianPosition",
			uiClass = "Gate",
			uiProfiles = ioDevices_Data[149],
			states = {
				["84058662"] = {
					linkedHighLevelState = ioDevices_Data[526],
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
						ioDevices_HighLevelStates[309],
						ioDevices_HighLevelStates[33]
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
					linkedHighLevelState = ioDevices_Data[526],
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
				["16832519"] = ioDevices_Data[527],
				["2147426304"] = ioDevices_Data[4],
				["1"] = ioDevices_Data[3],
				["2146500645"] = ioDevices_Data[57],
				["16830720"] = ioDevices_Data[145],
				["2"] = ioDevices_Data[505],
				["2146500638"] = ioDevices_Data[1]
			},
			attributes = {
				["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[40],
				["core:Manufacturer"] = ioDevices_Attributes[1],
				["core:FirmwareRevision"] = ioDevices_Attributes[0]
			},
			commands = {
				setName = ioDevices_Data[20],
				sendIOKey = ioDevices_Data[65],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				unpairOneWayController = ioDevices_Data[24],
				getName = ioDevices_Data[14],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				delayedStopIdentify = ioDevices_Data[13],
				identify = ioDevices_Data[15],
				unpairAllOneWayControllers = ioDevices_Data[23],
				setConfigState = ioDevices_Data[25],
				startIdentify = ioDevices_Data[21],
				refreshPedestrianPosition = ioDevices_Data[146],
				stop = ioDevices_Data[63],
				stopIdentify = ioDevices_Data[22],
				wink = ioDevices_Data[26],
				setPedestrianPosition = ioDevices_Data[150],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ioDevices_Data[44],
					rawStates = ioDevices_Data[564],
					converter = ioDevices_Converter[415],
					extraDefinition = ioDevices_Data[45]
				},
				close = ioDevices_Data[98],
				pairOneWayController = ioDevices_Data[17],
				open = ioDevices_Data[99],
				advancedRefresh = {
					prototype = "string(normal;advanced;custom),*array",
					parameters = ioDevices_Data[8],
					rawStates = ioDevices_Data[564],
					converter = ioDevices_Converter[416],
					extraDefinition = ioDevices_Data[9]
				}
			}
		}
	},
	{
		name = "Axovia 3S io V2",
		localPairing = true,
		["0"] = ioDevices_Data[565]
	},
	{
		name = "Axovia 200 3S io V2",
		localPairing = true,
		["0"] = ioDevices_Data[565]
	},
	{
		ioDevices_HighLevelStates[310]
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
		ioDevices_Data[528],
		ioDevices_Data[129],
		{
			rawStateId = "84058674"
		},
		ioDevices_Data[529],
		ioDevices_Data[570],
		ioDevices_Data[530],
		ioDevices_Data[531],
		ioDevices_Data[571],
		ioDevices_Data[546],
		ioDevices_Data[547],
		ioDevices_Data[548],
		ioDevices_Data[549],
		ioDevices_Data[551],
		ioDevices_Data[572],
		ioDevices_Data[563]
	},
	{
		["io:DiscreteGarageOpenerWithPartialPositionIOComponent"] = {
			type = 1,
			widget = "PositionableGarageDoorWithPartialPosition",
			uiClass = "GarageDoor",
			uiProfiles = ioDevices_Data[97],
			states = {
				["84058662"] = {
					linkedHighLevelState = ioDevices_Data[568],
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
						ioDevices_HighLevelStates[310],
						ioDevices_HighLevelStates[224]
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
					linkedHighLevelState = ioDevices_Data[568],
					linkedStateIds = ioDevices_Data[569]
				},
				["84058391"] = {
					linkedHighLevelState = ioDevices_Data[568],
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
					linkedHighLevelState = ioDevices_Data[568],
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
					linkedHighLevelState = ioDevices_Data[568],
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
					linkedHighLevelState = ioDevices_Data[568],
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
					linkedHighLevelState = ioDevices_Data[568],
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
					linkedHighLevelState = ioDevices_Data[568],
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
					linkedHighLevelState = ioDevices_Data[568],
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
					linkedHighLevelState = ioDevices_Data[568],
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
					linkedHighLevelState = ioDevices_Data[568],
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
					linkedHighLevelState = ioDevices_Data[568],
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
					linkedHighLevelState = ioDevices_Data[568],
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
					linkedHighLevelState = ioDevices_Data[568],
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
				["16832521"] = ioDevices_Data[435],
				["2147426304"] = ioDevices_Data[4],
				["1"] = ioDevices_Data[3],
				["2"] = ioDevices_Data[505],
				["2146500638"] = ioDevices_Data[1],
				["2146500645"] = ioDevices_Data[57]
			},
			attributes = {
				["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[41],
				["core:Manufacturer"] = ioDevices_Attributes[1],
				["core:FirmwareRevision"] = ioDevices_Attributes[0]
			},
			commands = {
				setName = ioDevices_Data[20],
				sendIOKey = ioDevices_Data[65],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				unpairOneWayController = ioDevices_Data[24],
				getName = ioDevices_Data[14],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				delayedStopIdentify = ioDevices_Data[13],
				identify = ioDevices_Data[15],
				partialPosition = ioDevices_Data[436],
				unpairAllOneWayControllers = ioDevices_Data[23],
				down = ioDevices_Data[98],
				refreshPartialPosition = ioDevices_Data[437],
				setConfigState = ioDevices_Data[25],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				stopIdentify = ioDevices_Data[22],
				wink = ioDevices_Data[26],
				up = ioDevices_Data[99],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ioDevices_Data[44],
					rawStates = ioDevices_Data[573],
					converter = ioDevices_Converter[419],
					extraDefinition = ioDevices_Data[45]
				},
				close = ioDevices_Data[98],
				pairOneWayController = ioDevices_Data[17],
				open = ioDevices_Data[99],
				advancedRefresh = {
					prototype = "string(normal;advanced;custom),*array",
					parameters = ioDevices_Data[8],
					rawStates = ioDevices_Data[573],
					converter = ioDevices_Converter[420],
					extraDefinition = ioDevices_Data[9]
				}
			}
		}
	},
	{
		name = "Dexxo Smart 800 io",
		localPairing = true,
		["0"] = ioDevices_Data[574]
	},
	{
		name = "Dexxo Smart 1000 io",
		localPairing = true,
		["0"] = ioDevices_Data[574]
	},
	{
		name = "Metro Smart 800 io",
		localPairing = true,
		["0"] = ioDevices_Data[574]
	},
	{
		name = "Metro Smart 1000 io",
		localPairing = true,
		["0"] = ioDevices_Data[574]
	},
	{
		ioDevices_HighLevelStates[311]
	},
	{
		linkedHighLevelState = ioDevices_Data[579],
		linkedStateIds = {
			"48177664",
			"65537",
			"84059661"
		}
	},
	{
		linkedHighLevelState = ioDevices_Data[579],
		linkedStateIds = {
			"48177664",
			"65537",
			"84059651"
		}
	},
	{
		linkedHighLevelState = ioDevices_Data[579],
		linkedStateIds = {
			"65537",
			"84059651",
			"84059661"
		}
	},
	{
		["16832512"] = ioDevices_Data[31],
		["17029120"] = ioDevices_Data[211],
		["84059651"] = ioDevices_Data[580],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[311],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10]
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
		["84059661"] = ioDevices_Data[581],
		["48177664"] = ioDevices_Data[582],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["65540"] = ioDevices_Data[73],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[42],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[508],
		ioDevices_Data[520]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[585],
		converter = ioDevices_Converter[423],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[585],
		converter = ioDevices_Converter[424],
		extraDefinition = ioDevices_Data[9]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		delayedStopIdentify = ioDevices_Data[13],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setClosureAndOrientation = ioDevices_Data[213],
		my = ioDevices_Data[214],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		stopIdentify = ioDevices_Data[22],
		runManufacturerSettingsCommand = ioDevices_Data[586],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		up = ioDevices_Data[42],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[587],
		setOrientation = ioDevices_Data[215],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		identify = ioDevices_Data[15],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		wink = ioDevices_Data[26],
		pairOneWayController = ioDevices_Data[17],
		setMemorized1Orientation = ioDevices_Data[216]
	},
	{
		name = "EVB-Slim Receiver for Variation WP IO Plug",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP2",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = {
					["16832512"] = ioDevices_Data[69],
					["17029120"] = ioDevices_Data[211],
					["84059651"] = ioDevices_Data[580],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[311],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12]
						},
						linkedStateIds = {
							"48177664",
							"84059651",
							"84059661"
						}
					},
					["84059661"] = ioDevices_Data[581],
					["48177664"] = ioDevices_Data[582],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65540"] = ioDevices_Data[73],
					["2146500645"] = ioDevices_Data[57],
					["16832522"] = ioDevices_Data[70],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[584],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setClosureAndOrientation = ioDevices_Data[213],
					my = ioDevices_Data[214],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = ioDevices_Data[586],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[587],
					setOrientation = ioDevices_Data[215],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					refreshMemorized1Orientation = ioDevices_Data[481],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17],
					setMemorized1Orientation = ioDevices_Data[216]
				}
			}
		}
	},
	{
		ioDevices_HighLevelStates[312]
	},
	{
		linkedHighLevelState = ioDevices_Data[590],
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
		linkedHighLevelState = ioDevices_Data[590],
		linkedStateIds = ioDevices_Data[592]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[312],
			ioDevices_HighLevelStates[18]
		},
		linkedStateIds = {
			"48177664",
			"65537",
			"84059651",
			"84059661"
		}
	},
	{
		linkedHighLevelState = ioDevices_Data[590],
		linkedStateIds = {
			"65537",
			"65540",
			"84059651",
			"84059661"
		}
	},
	{
		["16832512"] = ioDevices_Data[31],
		["17029120"] = ioDevices_Data[211],
		["84059651"] = ioDevices_Data[591],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[312],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10]
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
		["84059661"] = ioDevices_Data[593],
		["65540"] = ioDevices_Data[594],
		["48177664"] = ioDevices_Data[595],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[43],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[508],
		ioDevices_Data[519],
		ioDevices_Data[520]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[598],
		converter = ioDevices_Converter[427],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[598],
		converter = ioDevices_Converter[428],
		extraDefinition = ioDevices_Data[9]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		delayedStopIdentify = ioDevices_Data[13],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setClosureAndOrientation = ioDevices_Data[213],
		my = ioDevices_Data[214],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		stopIdentify = ioDevices_Data[22],
		runManufacturerSettingsCommand = ioDevices_Data[599],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		up = ioDevices_Data[42],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[600],
		setOrientation = ioDevices_Data[215],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		identify = ioDevices_Data[15],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		wink = ioDevices_Data[26],
		pairOneWayController = ioDevices_Data[17],
		setMemorized1Orientation = ioDevices_Data[216]
	},
	{
		["16832512"] = ioDevices_Data[69],
		["17029120"] = ioDevices_Data[211],
		["84059651"] = ioDevices_Data[591],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[312],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12]
			},
			linkedStateIds = {
				"48177664",
				"65540",
				"84059651",
				"84059661"
			}
		},
		["84059661"] = ioDevices_Data[593],
		["65540"] = ioDevices_Data[594],
		["48177664"] = ioDevices_Data[595],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["2146500645"] = ioDevices_Data[57],
		["16832522"] = ioDevices_Data[70],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		name = "EVB-Slim Receiver for Variation",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP2",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[602],
				attributes = ioDevices_Data[597],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setClosureAndOrientation = ioDevices_Data[213],
					my = ioDevices_Data[214],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = ioDevices_Data[599],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[600],
					setOrientation = ioDevices_Data[215],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					refreshMemorized1Orientation = ioDevices_Data[481],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17],
					setMemorized1Orientation = ioDevices_Data[216]
				}
			}
		}
	},
	{
		ioDevices_HighLevelStates[313]
	},
	{
		rawStateId = "84058392"
	},
	{
		ioDevices_Data[528],
		ioDevices_Data[129],
		ioDevices_Data[529],
		ioDevices_Data[530],
		ioDevices_Data[531],
		ioDevices_Data[532],
		ioDevices_Data[533],
		ioDevices_Data[534],
		ioDevices_Data[535],
		{
			rawStateId = "84058406"
		},
		ioDevices_Data[605],
		ioDevices_Data[536],
		ioDevices_Data[537],
		ioDevices_Data[538],
		ioDevices_Data[539],
		ioDevices_Data[540],
		ioDevices_Data[541],
		ioDevices_Data[542],
		ioDevices_Data[543],
		ioDevices_Data[544],
		ioDevices_Data[546],
		ioDevices_Data[547],
		ioDevices_Data[548],
		ioDevices_Data[549],
		ioDevices_Data[550],
		ioDevices_Data[551],
		ioDevices_Data[555],
		ioDevices_Data[556],
		ioDevices_Data[557],
		ioDevices_Data[558],
		ioDevices_Data[572],
		ioDevices_Data[563]
	},
	{
		name = "Elixo 3S io V2",
		localPairing = true,
		["0"] = {
			["io:SlidingDiscreteGateOpenerIOComponent"] = {
				type = 1,
				widget = "SlidingDiscreteGateWithPedestrianPosition",
				uiClass = "Gate",
				uiProfiles = ioDevices_Data[149],
				states = {
					["84058662"] = {
						linkedHighLevelState = ioDevices_Data[604],
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
							ioDevices_HighLevelStates[313],
							ioDevices_HighLevelStates[33]
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
						linkedHighLevelState = ioDevices_Data[604],
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
					["16832519"] = ioDevices_Data[527],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[145],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[44],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					refreshPedestrianPosition = ioDevices_Data[146],
					stop = ioDevices_Data[63],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					setPedestrianPosition = ioDevices_Data[150],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[606],
						converter = ioDevices_Converter[431],
						extraDefinition = ioDevices_Data[45]
					},
					close = ioDevices_Data[98],
					pairOneWayController = ioDevices_Data[17],
					open = ioDevices_Data[99],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[606],
						converter = ioDevices_Converter[432],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	{
		ioDevices_HighLevelStates[314]
	},
	{
		ioDevices_Data[528],
		ioDevices_Data[129],
		ioDevices_Data[529],
		ioDevices_Data[605],
		ioDevices_Data[570],
		ioDevices_Data[530],
		ioDevices_Data[531],
		ioDevices_Data[571],
		ioDevices_Data[546],
		ioDevices_Data[547],
		ioDevices_Data[548],
		ioDevices_Data[549],
		ioDevices_Data[551],
		ioDevices_Data[572],
		ioDevices_Data[563]
	},
	{
		["io:SlidingDiscreteFullyPedestriableGateOpenerIOComponent"] = {
			type = 1,
			widget = "SlidingDiscreteGateWithPedestrianPosition",
			uiClass = "Gate",
			uiProfiles = ioDevices_Data[149],
			states = {
				["84058662"] = {
					linkedHighLevelState = ioDevices_Data[608],
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
						ioDevices_HighLevelStates[314],
						ioDevices_HighLevelStates[33]
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
					linkedHighLevelState = ioDevices_Data[608],
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
					linkedHighLevelState = ioDevices_Data[608],
					linkedStateIds = ioDevices_Data[569]
				},
				["84058697"] = {
					linkedHighLevelState = ioDevices_Data[608],
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
					linkedHighLevelState = ioDevices_Data[608],
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
					linkedHighLevelState = ioDevices_Data[608],
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
					linkedHighLevelState = ioDevices_Data[608],
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
					linkedHighLevelState = ioDevices_Data[608],
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
					linkedHighLevelState = ioDevices_Data[608],
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
					linkedHighLevelState = ioDevices_Data[608],
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
					linkedHighLevelState = ioDevices_Data[608],
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
					linkedHighLevelState = ioDevices_Data[608],
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
					linkedHighLevelState = ioDevices_Data[608],
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
					linkedHighLevelState = ioDevices_Data[608],
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
				["16832519"] = ioDevices_Data[527],
				["2147426304"] = ioDevices_Data[4],
				["1"] = ioDevices_Data[3],
				["2146500645"] = ioDevices_Data[57],
				["16830720"] = ioDevices_Data[145],
				["2"] = ioDevices_Data[505],
				["2146500638"] = ioDevices_Data[1]
			},
			attributes = {
				["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[45],
				["core:Manufacturer"] = ioDevices_Attributes[1],
				["core:FirmwareRevision"] = ioDevices_Attributes[0]
			},
			commands = {
				setName = ioDevices_Data[20],
				sendIOKey = ioDevices_Data[65],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				unpairOneWayController = ioDevices_Data[24],
				getName = ioDevices_Data[14],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				delayedStopIdentify = ioDevices_Data[13],
				identify = ioDevices_Data[15],
				unpairAllOneWayControllers = ioDevices_Data[23],
				setConfigState = ioDevices_Data[25],
				startIdentify = ioDevices_Data[21],
				refreshPedestrianPosition = ioDevices_Data[146],
				stop = ioDevices_Data[63],
				stopIdentify = ioDevices_Data[22],
				wink = ioDevices_Data[26],
				setPedestrianPosition = ioDevices_Data[150],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ioDevices_Data[44],
					rawStates = ioDevices_Data[609],
					converter = ioDevices_Converter[435],
					extraDefinition = ioDevices_Data[45]
				},
				close = ioDevices_Data[98],
				pairOneWayController = ioDevices_Data[17],
				open = ioDevices_Data[99],
				advancedRefresh = {
					prototype = "string(normal;advanced;custom),*array",
					parameters = ioDevices_Data[8],
					rawStates = ioDevices_Data[609],
					converter = ioDevices_Converter[436],
					extraDefinition = ioDevices_Data[9]
				}
			}
		}
	},
	{
		name = "Elixo Smart io",
		localPairing = true,
		["0"] = ioDevices_Data[610]
	},
	{
		name = "Roly Smart io",
		localPairing = true,
		["0"] = ioDevices_Data[610]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[315]
		},
		linkedStateIds = ioDevices_Data[243]
	},
	{
		"84059651"
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[46],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[616],
		converter = ioDevices_Converter[439],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[616],
		converter = ioDevices_Converter[440],
		extraDefinition = ioDevices_Data[9]
	},
	{
		["io:RollerShutterGenericIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutter",
			uiClass = "RollerShutter",
			uiProfiles = ioDevices_Data[54],
			states = ioDevices_Data[506],
			attributes = {
				["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[47],
				["core:Manufacturer"] = ioDevices_Attributes[1],
				["core:FirmwareRevision"] = ioDevices_Attributes[0]
			},
			commands = {
				setName = ioDevices_Data[20],
				sendIOKey = ioDevices_Data[65],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				unpairOneWayController = ioDevices_Data[24],
				getName = ioDevices_Data[14],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				delayedStopIdentify = ioDevices_Data[13],
				identify = ioDevices_Data[15],
				unpairAllOneWayControllers = ioDevices_Data[23],
				setSecuredPosition = ioDevices_Data[53],
				setPosition = ioDevices_Data[48],
				my = ioDevices_Data[51],
				setConfigState = ioDevices_Data[25],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				setMemorized1Position = ioDevices_Data[47],
				stopIdentify = ioDevices_Data[22],
				wink = ioDevices_Data[26],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ioDevices_Data[44],
					rawStates = ioDevices_Data[509],
					converter = ioDevices_Converter[443],
					extraDefinition = ioDevices_Data[45]
				},
				setClosure = ioDevices_Data[38],
				close = ioDevices_Data[40],
				down = ioDevices_Data[40],
				open = ioDevices_Data[42],
				setDeployment = ioDevices_Data[38],
				up = ioDevices_Data[42],
				pairOneWayController = ioDevices_Data[17],
				refreshMemorized1Position = ioDevices_Data[37],
				advancedRefresh = ioDevices_Data[510]
			}
		}
	},
	{
		name = "Invisio 3S io V2",
		localPairing = true,
		["0"] = ioDevices_Data[565]
	},
	{
		ioDevices_HighLevelStates[316]
	},
	{
		ioDevices_Data[528],
		ioDevices_Data[129],
		ioDevices_Data[529],
		ioDevices_Data[530],
		ioDevices_Data[531],
		ioDevices_Data[532],
		ioDevices_Data[533],
		ioDevices_Data[534],
		ioDevices_Data[535],
		ioDevices_Data[536],
		ioDevices_Data[537],
		ioDevices_Data[538],
		ioDevices_Data[539],
		ioDevices_Data[540],
		ioDevices_Data[541],
		ioDevices_Data[542],
		ioDevices_Data[543],
		ioDevices_Data[544],
		ioDevices_Data[545],
		ioDevices_Data[546],
		ioDevices_Data[547],
		ioDevices_Data[548],
		ioDevices_Data[549],
		ioDevices_Data[550],
		ioDevices_Data[551],
		ioDevices_Data[552],
		ioDevices_Data[553],
		ioDevices_Data[554],
		{
			rawStateId = "84058404"
		},
		ioDevices_Data[555],
		ioDevices_Data[556],
		ioDevices_Data[557],
		ioDevices_Data[558],
		ioDevices_Data[559],
		ioDevices_Data[560],
		ioDevices_Data[561],
		ioDevices_Data[562],
		ioDevices_Data[563]
	},
	{
		name = "Ixengo 3S io V2",
		localPairing = true,
		["0"] = {
			["io:SlidingDiscreteGateOpenerIOComponent"] = {
				type = 1,
				widget = "SlidingDiscreteGateWithPedestrianPosition",
				uiClass = "Gate",
				uiProfiles = ioDevices_Data[149],
				states = {
					["84058662"] = {
						linkedHighLevelState = ioDevices_Data[621],
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
							ioDevices_HighLevelStates[316],
							ioDevices_HighLevelStates[33]
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
						linkedHighLevelState = ioDevices_Data[621],
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
					["16832519"] = ioDevices_Data[527],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[145],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[48],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					refreshPedestrianPosition = ioDevices_Data[146],
					stop = ioDevices_Data[63],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					setPedestrianPosition = ioDevices_Data[150],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[622],
						converter = ioDevices_Converter[446],
						extraDefinition = ioDevices_Data[45]
					},
					close = ioDevices_Data[98],
					pairOneWayController = ioDevices_Data[17],
					open = ioDevices_Data[99],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[622],
						converter = ioDevices_Converter[447],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	{
		["84059655"] = ioDevices_Data[191],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[317],
				ioDevices_HighLevelStates[31]
			},
			linkedStateIds = ioDevices_Data[614]
		},
		["84059651"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[317],
				ioDevices_HighLevelStates[50],
				ioDevices_HighLevelStates[48]
			},
			linkedStateIds = ioDevices_Data[243]
		},
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["2146500645"] = ioDevices_Data[57],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[49],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		ioDevices_Data[129],
		ioDevices_Data[193]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		onWithInternalTimer = ioDevices_Data[186],
		setConfigState = ioDevices_Data[25],
		onWithTimer = ioDevices_Data[187],
		setInternalTimer = ioDevices_Data[196],
		startIdentify = ioDevices_Data[21],
		setOnOff = ioDevices_Data[188],
		off = ioDevices_Data[189],
		on = ioDevices_Data[190],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = {
			prototype = "string,object",
			parameters = ioDevices_Data[44],
			rawStates = ioDevices_Data[626],
			converter = ioDevices_Converter[450],
			extraDefinition = ioDevices_Data[45]
		},
		setPictoValue = ioDevices_Data[197],
		pairOneWayController = ioDevices_Data[17],
		advancedRefresh = {
			prototype = "string(normal;advanced;custom),*array",
			parameters = ioDevices_Data[8],
			rawStates = ioDevices_Data[626],
			converter = ioDevices_Converter[451],
			extraDefinition = ioDevices_Data[9]
		}
	},
	{
		ioDevices_HighLevelStates[318]
	},
	{
		ioDevices_Data[129],
		{
			rawStateId = "84059656"
		},
		ioDevices_Data[193]
	},
	{
		ioDevices_HighLevelStates[319]
	},
	{
		"65537",
		"84082687"
	},
	{
		linkedHighLevelState = ioDevices_Data[630],
		linkedStateIds = ioDevices_Data[631]
	},
	{
		"16830720",
		"16832512",
		"16832522",
		"84059651",
		"84082687"
	},
	{
		linkedHighLevelState = ioDevices_Data[630],
		linkedStateIds = ioDevices_Data[502]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["17029120"] = ioDevices_Data[211],
		["84059651"] = ioDevices_Data[632],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[319],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10]
			},
			linkedStateIds = ioDevices_Data[633]
		},
		["84082687"] = ioDevices_Data[634],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["65540"] = ioDevices_Data[73],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[51],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[518]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[637],
		converter = ioDevices_Converter[458],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[637],
		converter = ioDevices_Converter[459],
		extraDefinition = ioDevices_Data[9]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		delayedStopIdentify = ioDevices_Data[13],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setClosureAndOrientation = ioDevices_Data[213],
		my = ioDevices_Data[214],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		stopIdentify = ioDevices_Data[22],
		runManufacturerSettingsCommand = ioDevices_Data[638],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		up = ioDevices_Data[42],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[639],
		setOrientation = ioDevices_Data[215],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		identify = ioDevices_Data[15],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		wink = ioDevices_Data[26],
		pairOneWayController = ioDevices_Data[17],
		setMemorized1Orientation = ioDevices_Data[216]
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
				uiProfiles = ioDevices_Data[28],
				states = {
					["16832512"] = ioDevices_Data[69],
					["17029120"] = ioDevices_Data[211],
					["84059651"] = ioDevices_Data[632],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[319],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12]
						},
						linkedStateIds = ioDevices_Data[641]
					},
					["84082687"] = ioDevices_Data[634],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65540"] = ioDevices_Data[73],
					["2146500645"] = ioDevices_Data[57],
					["16832522"] = ioDevices_Data[70],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[636],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setClosureAndOrientation = ioDevices_Data[213],
					my = ioDevices_Data[214],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = ioDevices_Data[638],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[639],
					setOrientation = ioDevices_Data[215],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					refreshMemorized1Orientation = ioDevices_Data[481],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17],
					setMemorized1Orientation = ioDevices_Data[216]
				}
			}
		}
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[52],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[598],
		converter = ioDevices_Converter[461],
		extraDefinition = ioDevices_Data[45]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		delayedStopIdentify = ioDevices_Data[13],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setClosureAndOrientation = ioDevices_Data[213],
		my = ioDevices_Data[214],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		stopIdentify = ioDevices_Data[22],
		runManufacturerSettingsCommand = ioDevices_Data[644],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		up = ioDevices_Data[42],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[600],
		setOrientation = ioDevices_Data[215],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		identify = ioDevices_Data[15],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		wink = ioDevices_Data[26],
		pairOneWayController = ioDevices_Data[17],
		setMemorized1Orientation = ioDevices_Data[216]
	},
	{
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP2",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[602],
				attributes = ioDevices_Data[643],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setClosureAndOrientation = ioDevices_Data[213],
					my = ioDevices_Data[214],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = ioDevices_Data[644],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[600],
					setOrientation = ioDevices_Data[215],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					refreshMemorized1Orientation = ioDevices_Data[481],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17],
					setMemorized1Orientation = ioDevices_Data[216]
				}
			}
		}
	},
	{
		ioDevices_HighLevelStates[320]
	},
	{
		linkedHighLevelState = ioDevices_Data[647],
		linkedStateIds = ioDevices_Data[631]
	},
	{
		linkedHighLevelState = ioDevices_Data[647],
		linkedStateIds = ioDevices_Data[502]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["17029120"] = ioDevices_Data[211],
		["84059651"] = ioDevices_Data[648],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[320],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10]
			},
			linkedStateIds = ioDevices_Data[633]
		},
		["84082687"] = ioDevices_Data[649],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["65540"] = ioDevices_Data[73],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[637],
		converter = ioDevices_Converter[463],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[637],
		converter = ioDevices_Converter[464],
		extraDefinition = ioDevices_Data[9]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		delayedStopIdentify = ioDevices_Data[13],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setClosureAndOrientation = ioDevices_Data[213],
		my = ioDevices_Data[214],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		stopIdentify = ioDevices_Data[22],
		runManufacturerSettingsCommand = ioDevices_Data[651],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		up = ioDevices_Data[42],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[652],
		setOrientation = ioDevices_Data[215],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		identify = ioDevices_Data[15],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		wink = ioDevices_Data[26],
		pairOneWayController = ioDevices_Data[17],
		setMemorized1Orientation = ioDevices_Data[216]
	},
	{
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP2",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = {
					["16832512"] = ioDevices_Data[69],
					["17029120"] = ioDevices_Data[211],
					["84059651"] = ioDevices_Data[648],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[320],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12]
						},
						linkedStateIds = ioDevices_Data[641]
					},
					["84082687"] = ioDevices_Data[649],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65540"] = ioDevices_Data[73],
					["2146500645"] = ioDevices_Data[57],
					["16832522"] = ioDevices_Data[70],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[636],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setClosureAndOrientation = ioDevices_Data[213],
					my = ioDevices_Data[214],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = ioDevices_Data[651],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[652],
					setOrientation = ioDevices_Data[215],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					refreshMemorized1Orientation = ioDevices_Data[481],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17],
					setMemorized1Orientation = ioDevices_Data[216]
				}
			}
		}
	},
	{
		ioDevices_HighLevelStates[321]
	},
	{
		linkedHighLevelState = ioDevices_Data[655],
		linkedStateIds = {
			"48177664",
			"65537",
			"65540",
			"84082687"
		}
	},
	{
		linkedHighLevelState = ioDevices_Data[655],
		linkedStateIds = ioDevices_Data[592]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[321],
			ioDevices_HighLevelStates[18]
		},
		linkedStateIds = {
			"48177664",
			"65537",
			"84059651",
			"84082687"
		}
	},
	{
		linkedHighLevelState = ioDevices_Data[655],
		linkedStateIds = {
			"65537",
			"65540",
			"84059651",
			"84082687"
		}
	},
	{
		["16832512"] = ioDevices_Data[31],
		["17029120"] = ioDevices_Data[211],
		["84059651"] = ioDevices_Data[656],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[321],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10]
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
		["84082687"] = ioDevices_Data[657],
		["65540"] = ioDevices_Data[658],
		["48177664"] = ioDevices_Data[659],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[518],
		ioDevices_Data[519],
		ioDevices_Data[520]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[661],
		converter = ioDevices_Converter[466],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[661],
		converter = ioDevices_Converter[467],
		extraDefinition = ioDevices_Data[9]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		delayedStopIdentify = ioDevices_Data[13],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setClosureAndOrientation = ioDevices_Data[213],
		my = ioDevices_Data[214],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		stopIdentify = ioDevices_Data[22],
		runManufacturerSettingsCommand = ioDevices_Data[662],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		up = ioDevices_Data[42],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[663],
		setOrientation = ioDevices_Data[215],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		identify = ioDevices_Data[15],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		wink = ioDevices_Data[26],
		pairOneWayController = ioDevices_Data[17],
		setMemorized1Orientation = ioDevices_Data[216]
	},
	{
		name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWP2IOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP2",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = {
					["16832512"] = ioDevices_Data[69],
					["17029120"] = ioDevices_Data[211],
					["84059651"] = ioDevices_Data[656],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[321],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12]
						},
						linkedStateIds = {
							"48177664",
							"65540",
							"84059651",
							"84082687"
						}
					},
					["84082687"] = ioDevices_Data[657],
					["65540"] = ioDevices_Data[658],
					["48177664"] = ioDevices_Data[659],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["16832522"] = ioDevices_Data[70],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[643],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setClosureAndOrientation = ioDevices_Data[213],
					my = ioDevices_Data[214],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = ioDevices_Data[662],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[663],
					setOrientation = ioDevices_Data[215],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					refreshMemorized1Orientation = ioDevices_Data[481],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17],
					setMemorized1Orientation = ioDevices_Data[216]
				}
			}
		}
	},
	{
		ioDevices_HighLevelStates[29],
		ioDevices_HighLevelStates[28],
		ioDevices_HighLevelStates[27]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[315],
			ioDevices_HighLevelStates[23],
			ioDevices_HighLevelStates[25]
		},
		linkedStateIds = ioDevices_Data[614]
	},
	{
		ioDevices_HighLevelStates[323]
	},
	{
		linkedHighLevelState = ioDevices_Data[668],
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
		linkedHighLevelState = ioDevices_Data[668],
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
		linkedHighLevelState = ioDevices_Data[668],
		linkedStateIds = ioDevices_Data[672]
	},
	{
		linkedHighLevelState = ioDevices_Data[668],
		linkedStateIds = {
			"48170496",
			"65537",
			"84059651",
			"84059658"
		}
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84059651"] = ioDevices_Data[669],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[323],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[20]
			},
			linkedStateIds = ioDevices_Data[670]
		},
		["48170496"] = ioDevices_Data[671],
		["84059658"] = ioDevices_Data[673],
		["84059664"] = ioDevices_Data[674],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[54],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
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
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[677],
		ioDevices_Data[678],
		ioDevices_Data[679]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[680],
		converter = ioDevices_Converter[475],
		extraDefinition = ioDevices_Data[9]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = {
			prototype = "string,object",
			parameters = ioDevices_Data[44],
			rawStates = ioDevices_Data[680],
			converter = ioDevices_Converter[474],
			extraDefinition = ioDevices_Data[45]
		},
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[681]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84059651"] = ioDevices_Data[669],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[323],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[280]
			},
			linkedStateIds = ioDevices_Data[670]
		},
		["48170496"] = ioDevices_Data[671],
		["84059658"] = ioDevices_Data[673],
		["84059664"] = ioDevices_Data[674],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[55],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = {
			prototype = "string,object",
			parameters = ioDevices_Data[44],
			rawStates = ioDevices_Data[680],
			converter = ioDevices_Converter[477],
			extraDefinition = ioDevices_Data[45]
		},
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[681]
	},
	{
		ioDevices_HighLevelStates[324]
	},
	{
		"65537",
		"65540",
		"84059658",
		"84059659",
		"84059664"
	},
	{
		linkedHighLevelState = ioDevices_Data[686],
		linkedStateIds = ioDevices_Data[687]
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
		linkedHighLevelState = ioDevices_Data[686],
		linkedStateIds = ioDevices_Data[690]
	},
	{
		"65537",
		"65540",
		"84059651",
		"84059658",
		"84059664"
	},
	{
		linkedHighLevelState = ioDevices_Data[686],
		linkedStateIds = ioDevices_Data[692]
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
			ioDevices_HighLevelStates[324],
			ioDevices_HighLevelStates[18]
		},
		linkedStateIds = ioDevices_Data[694]
	},
	{
		"65537",
		"65540",
		"84059651",
		"84059659",
		"84059664"
	},
	{
		linkedHighLevelState = ioDevices_Data[686],
		linkedStateIds = ioDevices_Data[696]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["17029120"] = ioDevices_Data[211],
		["84059651"] = ioDevices_Data[688],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[324],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10]
			},
			linkedStateIds = ioDevices_Data[689]
		},
		["84059664"] = ioDevices_Data[691],
		["84059659"] = ioDevices_Data[693],
		["65540"] = ioDevices_Data[695],
		["84059658"] = ioDevices_Data[697],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[56],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		rawStateId = "84059659"
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[679],
		ioDevices_Data[700],
		ioDevices_Data[519],
		ioDevices_Data[678]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[701],
		converter = ioDevices_Converter[480],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[701],
		converter = ioDevices_Converter[481],
		extraDefinition = ioDevices_Data[9]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		delayedStopIdentify = ioDevices_Data[13],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setClosureAndOrientation = ioDevices_Data[213],
		my = ioDevices_Data[214],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		stopIdentify = ioDevices_Data[22],
		runManufacturerSettingsCommand = ioDevices_Data[702],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		up = ioDevices_Data[42],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[703],
		setOrientation = ioDevices_Data[215],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		identify = ioDevices_Data[15],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		wink = ioDevices_Data[26],
		pairOneWayController = ioDevices_Data[17],
		setMemorized1Orientation = ioDevices_Data[216]
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
				uiProfiles = ioDevices_Data[28],
				states = {
					["16832512"] = ioDevices_Data[69],
					["17029120"] = ioDevices_Data[211],
					["84059651"] = ioDevices_Data[688],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[324],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12]
						},
						linkedStateIds = ioDevices_Data[705]
					},
					["84059664"] = ioDevices_Data[691],
					["84059659"] = ioDevices_Data[693],
					["65540"] = ioDevices_Data[695],
					["84059658"] = ioDevices_Data[697],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["16832522"] = ioDevices_Data[70],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[699],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setClosureAndOrientation = ioDevices_Data[213],
					my = ioDevices_Data[214],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = ioDevices_Data[702],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[703],
					setOrientation = ioDevices_Data[215],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					refreshMemorized1Orientation = ioDevices_Data[481],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17],
					setMemorized1Orientation = ioDevices_Data[216]
				}
			}
		}
	},
	{
		ioDevices_HighLevelStates[325]
	},
	{
		linkedHighLevelState = ioDevices_Data[707],
		linkedStateIds = ioDevices_Data[687]
	},
	{
		linkedHighLevelState = ioDevices_Data[707],
		linkedStateIds = ioDevices_Data[690]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[325],
			ioDevices_HighLevelStates[18]
		},
		linkedStateIds = ioDevices_Data[694]
	},
	{
		linkedHighLevelState = ioDevices_Data[707],
		linkedStateIds = ioDevices_Data[696]
	},
	{
		linkedHighLevelState = ioDevices_Data[707],
		linkedStateIds = ioDevices_Data[692]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["17029120"] = ioDevices_Data[211],
		["84059651"] = ioDevices_Data[708],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[325],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10]
			},
			linkedStateIds = ioDevices_Data[689]
		},
		["84059664"] = ioDevices_Data[709],
		["65540"] = ioDevices_Data[710],
		["84059658"] = ioDevices_Data[711],
		["84059659"] = ioDevices_Data[712],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[679],
		ioDevices_Data[519],
		ioDevices_Data[678],
		ioDevices_Data[700]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[714],
		converter = ioDevices_Converter[483],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[714],
		converter = ioDevices_Converter[484],
		extraDefinition = ioDevices_Data[9]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		delayedStopIdentify = ioDevices_Data[13],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setClosureAndOrientation = ioDevices_Data[213],
		my = ioDevices_Data[214],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		stopIdentify = ioDevices_Data[22],
		runManufacturerSettingsCommand = ioDevices_Data[715],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		up = ioDevices_Data[42],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[716],
		setOrientation = ioDevices_Data[215],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		identify = ioDevices_Data[15],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		wink = ioDevices_Data[26],
		pairOneWayController = ioDevices_Data[17],
		setMemorized1Orientation = ioDevices_Data[216]
	},
	{
		name = "My EVB Pro io",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[713],
				attributes = ioDevices_Data[699],
				commands = ioDevices_Data[717]
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
				uiProfiles = ioDevices_Data[28],
				states = {
					["16832512"] = ioDevices_Data[69],
					["17029120"] = ioDevices_Data[211],
					["84059651"] = ioDevices_Data[708],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[325],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12]
						},
						linkedStateIds = ioDevices_Data[705]
					},
					["84059664"] = ioDevices_Data[709],
					["65540"] = ioDevices_Data[710],
					["84059658"] = ioDevices_Data[711],
					["84059659"] = ioDevices_Data[712],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["16832522"] = ioDevices_Data[70],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[699],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setClosureAndOrientation = ioDevices_Data[213],
					my = ioDevices_Data[214],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = ioDevices_Data[715],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[716],
					setOrientation = ioDevices_Data[215],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					refreshMemorized1Orientation = ioDevices_Data[481],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17],
					setMemorized1Orientation = ioDevices_Data[216]
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
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[713],
				attributes = ioDevices_Data[699],
				commands = ioDevices_Data[717]
			}
		}
	},
	{
		["io:RollerShutterGenericIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutter",
			uiClass = "RollerShutter",
			uiProfiles = ioDevices_Data[54],
			states = ioDevices_Data[506],
			attributes = ioDevices_Data[507],
			commands = {
				setName = ioDevices_Data[20],
				sendIOKey = ioDevices_Data[65],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				unpairOneWayController = ioDevices_Data[24],
				getName = ioDevices_Data[14],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				delayedStopIdentify = ioDevices_Data[13],
				identify = ioDevices_Data[15],
				unpairAllOneWayControllers = ioDevices_Data[23],
				setSecuredPosition = ioDevices_Data[53],
				setPosition = ioDevices_Data[48],
				my = ioDevices_Data[51],
				setConfigState = ioDevices_Data[25],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				setMemorized1Position = ioDevices_Data[47],
				stopIdentify = ioDevices_Data[22],
				wink = ioDevices_Data[26],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ioDevices_Data[44],
					rawStates = ioDevices_Data[509],
					converter = ioDevices_Converter[486],
					extraDefinition = ioDevices_Data[45]
				},
				setClosure = ioDevices_Data[38],
				close = ioDevices_Data[40],
				down = ioDevices_Data[40],
				open = ioDevices_Data[42],
				setDeployment = ioDevices_Data[38],
				up = ioDevices_Data[42],
				pairOneWayController = ioDevices_Data[17],
				refreshMemorized1Position = ioDevices_Data[37],
				advancedRefresh = ioDevices_Data[510]
			}
		}
	},
	{
		ioDevices_HighLevelStates[326]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = {
			linkedHighLevelState = ioDevices_Data[722],
			linkedStateIds = ioDevices_Data[502]
		},
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[326],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10]
			},
			linkedStateIds = ioDevices_Data[633]
		},
		["84059651"] = {
			linkedHighLevelState = ioDevices_Data[722],
			linkedStateIds = ioDevices_Data[631]
		},
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		ioDevices_Data[518],
		ioDevices_Data[129],
		ioDevices_Data[193]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[724],
		converter = ioDevices_Converter[489],
		extraDefinition = ioDevices_Data[9]
	},
	{
		ioDevices_HighLevelStates[327]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = {
			linkedHighLevelState = ioDevices_Data[726],
			linkedStateIds = ioDevices_Data[502]
		},
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[327],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10]
			},
			linkedStateIds = ioDevices_Data[633]
		},
		["84059651"] = {
			linkedHighLevelState = ioDevices_Data[726],
			linkedStateIds = ioDevices_Data[631]
		},
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[724],
		converter = ioDevices_Converter[493],
		extraDefinition = ioDevices_Data[9]
	},
	{
		"16830720",
		"16832512",
		"16832522",
		"49020928"
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[57],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		{
			rawStateId = "49020928"
		},
		ioDevices_Data[129]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[331]
			},
			linkedStateIds = ioDevices_Data[243]
		},
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[331],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10]
			},
			linkedStateIds = ioDevices_Data[524]
		},
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[525],
		converter = ioDevices_Converter[506],
		extraDefinition = ioDevices_Data[9]
	},
	{
		["io:RollerShutterGenericIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutter",
			uiClass = "RollerShutter",
			uiProfiles = ioDevices_Data[54],
			states = ioDevices_Data[732],
			attributes = ioDevices_Data[507],
			commands = {
				setName = ioDevices_Data[20],
				sendIOKey = ioDevices_Data[65],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				unpairOneWayController = ioDevices_Data[24],
				getName = ioDevices_Data[14],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				delayedStopIdentify = ioDevices_Data[13],
				identify = ioDevices_Data[15],
				unpairAllOneWayControllers = ioDevices_Data[23],
				setSecuredPosition = ioDevices_Data[53],
				setPosition = ioDevices_Data[48],
				my = ioDevices_Data[51],
				setConfigState = ioDevices_Data[25],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				setMemorized1Position = ioDevices_Data[47],
				stopIdentify = ioDevices_Data[22],
				wink = ioDevices_Data[26],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ioDevices_Data[44],
					rawStates = ioDevices_Data[525],
					converter = ioDevices_Converter[507],
					extraDefinition = ioDevices_Data[45]
				},
				setClosure = ioDevices_Data[38],
				close = ioDevices_Data[40],
				down = ioDevices_Data[40],
				open = ioDevices_Data[42],
				setDeployment = ioDevices_Data[38],
				up = ioDevices_Data[42],
				pairOneWayController = ioDevices_Data[17],
				refreshMemorized1Position = ioDevices_Data[37],
				advancedRefresh = ioDevices_Data[733]
			}
		}
	},
	{
		name = "Oximo io",
		localPairing = true,
		["0"] = ioDevices_Data[721]
	},
	{
		ioDevices_HighLevelStates[332]
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
		ioDevices_Data[518],
		ioDevices_Data[129],
		ioDevices_Data[677],
		ioDevices_Data[741]
	},
	{
		ioDevices_HighLevelStates[333]
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
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[59],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		ioDevices_Data[518],
		ioDevices_Data[129],
		ioDevices_Data[741]
	},
	{
		ioDevices_HighLevelStates[334]
	},
	{
		ioDevices_HighLevelStates[335]
	},
	{
		linkedHighLevelState = ioDevices_Data[749],
		linkedStateIds = ioDevices_Data[744]
	},
	{
		linkedHighLevelState = ioDevices_Data[749],
		linkedStateIds = ioDevices_Data[631]
	},
	{
		["16832512"] = ioDevices_Data[69],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[222],
				ioDevices_HighLevelStates[335],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12]
			},
			linkedStateIds = {
				"48171008",
				"84082687"
			}
		},
		["84082687"] = ioDevices_Data[750],
		["48171008"] = ioDevices_Data[751],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["2146500645"] = ioDevices_Data[57],
		["16832522"] = ioDevices_Data[70],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[60],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[747],
		converter = ioDevices_Converter[522],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[747],
		converter = ioDevices_Converter[523],
		extraDefinition = ioDevices_Data[9]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = ioDevices_Data[750],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[335],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[20]
			},
			linkedStateIds = ioDevices_Data[745]
		},
		["48171008"] = ioDevices_Data[751],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[754],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[755]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = ioDevices_Data[750],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[335],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[280]
			},
			linkedStateIds = ioDevices_Data[745]
		},
		["48171008"] = ioDevices_Data[751],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[747],
		converter = ioDevices_Converter[524],
		extraDefinition = ioDevices_Data[45]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[759],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[755]
	},
	{
		ioDevices_HighLevelStates[336]
	},
	{
		ioDevices_Data[528],
		ioDevices_Data[129],
		ioDevices_Data[530],
		ioDevices_Data[531],
		ioDevices_Data[571],
		ioDevices_Data[529],
		ioDevices_Data[570],
		{
			rawStateId = "84058627"
		},
		ioDevices_Data[543],
		ioDevices_Data[563]
	},
	{
		name = "Rollixo Smart io",
		localPairing = true,
		["0"] = {
			["io:DiscreteGarageOpenerIOComponent"] = {
				type = 1,
				widget = "DiscretePositionableGarageDoor",
				uiClass = "GarageDoor",
				uiProfiles = ioDevices_Data[97],
				states = {
					["84058662"] = {
						linkedHighLevelState = ioDevices_Data[761],
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
							ioDevices_HighLevelStates[336],
							ioDevices_HighLevelStates[22]
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
						linkedHighLevelState = ioDevices_Data[761],
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
						linkedHighLevelState = ioDevices_Data[761],
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
						linkedHighLevelState = ioDevices_Data[761],
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
						linkedHighLevelState = ioDevices_Data[761],
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
						linkedHighLevelState = ioDevices_Data[761],
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
						linkedHighLevelState = ioDevices_Data[761],
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
						linkedHighLevelState = ioDevices_Data[761],
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
						linkedHighLevelState = ioDevices_Data[761],
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
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[62],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					down = ioDevices_Data[98],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					up = ioDevices_Data[99],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[762],
						converter = ioDevices_Converter[529],
						extraDefinition = ioDevices_Data[45]
					},
					close = ioDevices_Data[98],
					pairOneWayController = ioDevices_Data[17],
					open = ioDevices_Data[99],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[762],
						converter = ioDevices_Converter[530],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	{
		ioDevices_HighLevelStates[337]
	},
	{
		"65537",
		"84059671"
	},
	{
		linkedHighLevelState = ioDevices_Data[764],
		linkedStateIds = ioDevices_Data[765]
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
			ioDevices_HighLevelStates[337],
			ioDevices_HighLevelStates[5],
			ioDevices_HighLevelStates[12],
			ioDevices_HighLevelStates[10]
		},
		linkedStateIds = ioDevices_Data[767]
	},
	{
		linkedHighLevelState = ioDevices_Data[764],
		linkedStateIds = ioDevices_Data[502]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84059651"] = ioDevices_Data[766],
		["65537"] = ioDevices_Data[768],
		["84059671"] = ioDevices_Data[769],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		{
			rawStateId = "84059671"
		}
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[771],
		converter = ioDevices_Converter[534],
		extraDefinition = ioDevices_Data[9]
	},
	{
		name = "S&SO - RS100 AIR",
		localPairing = true,
		["0"] = {
			["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutterWithLowSpeedManagement",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[770],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[63],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setPositionAndLinearSpeed = ioDevices_Data[422],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[771],
						converter = ioDevices_Converter[533],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[772],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					setClosureAndLinearSpeed = ioDevices_Data[421],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17]
				}
			}
		}
	},
	{
		ioDevices_HighLevelStates[338]
	},
	{
		["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutterWithLowSpeedManagement",
			uiClass = "RollerShutter",
			uiProfiles = ioDevices_Data[54],
			states = {
				["16832512"] = ioDevices_Data[31],
				["84059651"] = {
					linkedHighLevelState = ioDevices_Data[774],
					linkedStateIds = ioDevices_Data[765]
				},
				["65537"] = {
					linkedHighLevelState = {
						ioDevices_HighLevelStates[338],
						ioDevices_HighLevelStates[5],
						ioDevices_HighLevelStates[12],
						ioDevices_HighLevelStates[10]
					},
					linkedStateIds = ioDevices_Data[767]
				},
				["84059671"] = {
					linkedHighLevelState = ioDevices_Data[774],
					linkedStateIds = ioDevices_Data[502]
				},
				["2147426304"] = ioDevices_Data[4],
				["1"] = ioDevices_Data[3],
				["65557"] = ioDevices_Data[36],
				["2146500645"] = ioDevices_Data[57],
				["16830720"] = ioDevices_Data[35],
				["16832522"] = ioDevices_Data[504],
				["2"] = ioDevices_Data[505],
				["2146500638"] = ioDevices_Data[1]
			},
			attributes = {
				["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[64],
				["core:Manufacturer"] = ioDevices_Attributes[1],
				["core:FirmwareRevision"] = ioDevices_Attributes[0]
			},
			commands = {
				setName = ioDevices_Data[20],
				sendIOKey = ioDevices_Data[65],
				unpairOneWayController = ioDevices_Data[24],
				getName = ioDevices_Data[14],
				delayedStopIdentify = ioDevices_Data[13],
				unpairAllOneWayControllers = ioDevices_Data[23],
				setSecuredPosition = ioDevices_Data[53],
				setPosition = ioDevices_Data[48],
				my = ioDevices_Data[51],
				setPositionAndLinearSpeed = ioDevices_Data[422],
				stopIdentify = ioDevices_Data[22],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ioDevices_Data[44],
					rawStates = ioDevices_Data[771],
					converter = ioDevices_Converter[537],
					extraDefinition = ioDevices_Data[45]
				},
				setClosure = ioDevices_Data[38],
				close = ioDevices_Data[40],
				down = ioDevices_Data[40],
				open = ioDevices_Data[42],
				setDeployment = ioDevices_Data[38],
				up = ioDevices_Data[42],
				refreshMemorized1Position = ioDevices_Data[37],
				advancedRefresh = {
					prototype = "string(normal;advanced;custom),*array",
					parameters = ioDevices_Data[8],
					rawStates = ioDevices_Data[771],
					converter = ioDevices_Converter[538],
					extraDefinition = ioDevices_Data[9]
				},
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				identify = ioDevices_Data[15],
				setClosureAndLinearSpeed = ioDevices_Data[421],
				setConfigState = ioDevices_Data[25],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				setMemorized1Position = ioDevices_Data[47],
				wink = ioDevices_Data[26],
				pairOneWayController = ioDevices_Data[17]
			}
		}
	},
	{
		name = "S&SO - RS100 io",
		localPairing = true,
		["0"] = ioDevices_Data[775]
	},
	{
		["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
			type = 1,
			widget = "PositionableRollerShutterWithLowSpeedManagement",
			uiClass = "RollerShutter",
			uiProfiles = ioDevices_Data[54],
			states = ioDevices_Data[770],
			attributes = {
				["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[65],
				["core:Manufacturer"] = ioDevices_Attributes[1],
				["core:FirmwareRevision"] = ioDevices_Attributes[0]
			},
			commands = {
				setName = ioDevices_Data[20],
				sendIOKey = ioDevices_Data[65],
				unpairOneWayController = ioDevices_Data[24],
				getName = ioDevices_Data[14],
				delayedStopIdentify = ioDevices_Data[13],
				unpairAllOneWayControllers = ioDevices_Data[23],
				setSecuredPosition = ioDevices_Data[53],
				setPosition = ioDevices_Data[48],
				my = ioDevices_Data[51],
				setPositionAndLinearSpeed = ioDevices_Data[422],
				stopIdentify = ioDevices_Data[22],
				runManufacturerSettingsCommand = {
					prototype = "string,object",
					parameters = ioDevices_Data[44],
					rawStates = ioDevices_Data[771],
					converter = ioDevices_Converter[540],
					extraDefinition = ioDevices_Data[45]
				},
				setClosure = ioDevices_Data[38],
				close = ioDevices_Data[40],
				down = ioDevices_Data[40],
				open = ioDevices_Data[42],
				setDeployment = ioDevices_Data[38],
				up = ioDevices_Data[42],
				refreshMemorized1Position = ioDevices_Data[37],
				advancedRefresh = ioDevices_Data[772],
				keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
				unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
				identify = ioDevices_Data[15],
				setClosureAndLinearSpeed = ioDevices_Data[421],
				setConfigState = ioDevices_Data[25],
				startIdentify = ioDevices_Data[21],
				stop = ioDevices_Data[63],
				setMemorized1Position = ioDevices_Data[47],
				wink = ioDevices_Data[26],
				pairOneWayController = ioDevices_Data[17]
			}
		}
	},
	{
		name = "S&SO - RS100 io",
		localPairing = true,
		["0"] = ioDevices_Data[777]
	},
	{
		name = "S&SO - RS100 ioHybrid",
		localPairing = true,
		["0"] = ioDevices_Data[775]
	},
	{
		name = "S&SO - RS100 ioHybrid",
		localPairing = true,
		["0"] = ioDevices_Data[777]
	},
	{
		ioDevices_HighLevelStates[339]
	},
	{
		name = "S&SO - RS100 ioHybrid",
		localPairing = true,
		["0"] = {
			["io:RollerShutterWithLowSpeedManagementIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutterWithLowSpeedManagement",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = {
						linkedHighLevelState = ioDevices_Data[781],
						linkedStateIds = ioDevices_Data[765]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[339],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12],
							ioDevices_HighLevelStates[10]
						},
						linkedStateIds = ioDevices_Data[767]
					},
					["84059671"] = {
						linkedHighLevelState = ioDevices_Data[781],
						linkedStateIds = ioDevices_Data[502]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[66],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setPositionAndLinearSpeed = ioDevices_Data[422],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[771],
						converter = ioDevices_Converter[543],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[771],
						converter = ioDevices_Converter[544],
						extraDefinition = ioDevices_Data[9]
					},
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					setClosureAndLinearSpeed = ioDevices_Data[421],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17]
				}
			}
		}
	},
	{
		ioDevices_HighLevelStates[340]
	},
	{
		linkedHighLevelState = ioDevices_Data[783],
		linkedStateIds = {
			"84059668",
			"84059669"
		}
	},
	{
		linkedHighLevelState = ioDevices_Data[783],
		linkedStateIds = {
			"84059649",
			"84059669"
		}
	},
	{
		linkedHighLevelState = ioDevices_Data[783],
		linkedStateIds = {
			"84059649",
			"84059668"
		}
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84059651"] = ioDevices_Data[766],
		["65537"] = ioDevices_Data[768],
		["84059671"] = ioDevices_Data[769],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["65556"] = ioDevices_Data[260],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["84059649"] = ioDevices_Data[784],
		["84059668"] = ioDevices_Data[785],
		["84059669"] = ioDevices_Data[786],
		["2146500638"] = ioDevices_Data[1],
		["67362619648"] = ioDevices_Data[496]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[771],
		converter = ioDevices_Converter[547],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[771],
		converter = ioDevices_Converter[548],
		extraDefinition = ioDevices_Data[9]
	},
	{
		name = "S&SO - RS100 solar io",
		localPairing = true,
		["1"] = {
			["io:DynamicRollerShutterIOComponent"] = {
				type = 1,
				widget = "DynamicRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[787],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[67],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["io:Features"] = ioDevices_Attributes[37]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setPositionAndLinearSpeed = ioDevices_Data[422],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = ioDevices_Data[788],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[789],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					setClosureAndLinearSpeed = ioDevices_Data[421],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17]
				}
			}
		},
		["2"] = ioDevices_Data[497]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84059651"] = ioDevices_Data[766],
		["65537"] = ioDevices_Data[768],
		["84059671"] = ioDevices_Data[769],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["84059649"] = ioDevices_Data[784],
		["84059668"] = ioDevices_Data[785],
		["84059669"] = ioDevices_Data[786],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		name = "S&SO - RS100 solar io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[791],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[67],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[788],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[789]
				}
			}
		}
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[771],
		converter = ioDevices_Converter[550],
		extraDefinition = ioDevices_Data[45]
	},
	{
		name = "S&SO - RS100 solar io",
		localPairing = true,
		["1"] = {
			["io:DynamicRollerShutterIOComponent"] = {
				type = 1,
				widget = "DynamicRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[787],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[68],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["io:Features"] = ioDevices_Attributes[37]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setPositionAndLinearSpeed = ioDevices_Data[422],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = ioDevices_Data[793],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[789],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					setClosureAndLinearSpeed = ioDevices_Data[421],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17]
				}
			}
		},
		["2"] = ioDevices_Data[497]
	},
	{
		name = "S&SO - RS100 solar io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[791],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[68],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[793],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[789]
				}
			}
		}
	},
	{
		rawStateId = "84059666"
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[796]
	},
	{
		ioDevices_HighLevelStates[342]
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[796],
		ioDevices_Data[678]
	},
	{
		name = "Sliding window V1",
		localPairing = true,
		["0"] = {
			["io:PositionableAndLockableSlidingWindowComponent"] = {
				type = 1,
				widget = "PositionableAndLockableSlidingWindow",
				uiClass = "Window",
				uiProfiles = ioDevices_Data[241],
				states = {
					["84059651"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[74],
							ioDevices_HighLevelStates[342],
							ioDevices_HighLevelStates[71],
							ioDevices_HighLevelStates[72],
							ioDevices_HighLevelStates[73],
							ioDevices_HighLevelStates[75]
						},
						linkedStateIds = {
							"65537",
							"84059658",
							"84059666"
						}
					},
					["16832512"] = ioDevices_Data[69],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[342],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[70]
						},
						linkedStateIds = {
							"65801",
							"84059651",
							"84059658",
							"84059666"
						}
					},
					["84059666"] = {
						linkedHighLevelState = ioDevices_Data[798],
						linkedStateIds = {
							"65537",
							"84059651",
							"84059658"
						}
					},
					["84059658"] = {
						linkedHighLevelState = ioDevices_Data[798],
						linkedStateIds = {
							"65537",
							"84059651",
							"84059666"
						}
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["65546"] = ioDevices_Data[242],
					["2"] = ioDevices_Data[505],
					["65801"] = ioDevices_Data[244],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[70],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setPosition = ioDevices_Data[248],
					my = ioDevices_Data[240],
					setPositionAndLinearSpeed = ioDevices_Data[249],
					stopIdentify = ioDevices_Data[22],
					deactivateTimer = ioDevices_Data[246],
					lock = ioDevices_Data[247],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[799],
						converter = ioDevices_Converter[557],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[19],
					close = ioDevices_Data[237],
					open = ioDevices_Data[238],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[799],
						converter = ioDevices_Converter[558],
						extraDefinition = ioDevices_Data[9]
					},
					activateTimer = ioDevices_Data[245],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unlock = ioDevices_Data[250],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					setClosureAndLinearSpeed = ioDevices_Data[239],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					setTimer = ioDevices_Data[196],
					pairOneWayController = ioDevices_Data[17]
				}
			}
		}
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[71],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[509],
		converter = ioDevices_Converter[560],
		extraDefinition = ioDevices_Data[45]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		setDeployment = ioDevices_Data[38],
		close = ioDevices_Data[42],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[40],
		setClosure = ioDevices_Data[201],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[802],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[510]
	},
	{
		ioDevices_HighLevelStates[343]
	},
	{
		linkedHighLevelState = ioDevices_Data[804],
		linkedStateIds = ioDevices_Data[499]
	},
	{
		linkedHighLevelState = ioDevices_Data[804],
		linkedStateIds = ioDevices_Data[502]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[802],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[510]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84059651"] = ioDevices_Data[805],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[343],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[20]
			},
			linkedStateIds = ioDevices_Data[501]
		},
		["84059661"] = ioDevices_Data[806],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		ioDevices_HighLevelStates[344]
	},
	{
		"65537",
		"84059657",
		"84059659",
		"84059661"
	},
	{
		linkedHighLevelState = ioDevices_Data[809],
		linkedStateIds = ioDevices_Data[810]
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
			ioDevices_HighLevelStates[344],
			ioDevices_HighLevelStates[10]
		},
		linkedStateIds = ioDevices_Data[812]
	},
	{
		"65537",
		"84059651",
		"84059657",
		"84059659"
	},
	{
		linkedHighLevelState = ioDevices_Data[809],
		linkedStateIds = ioDevices_Data[814]
	},
	{
		"65537",
		"84059651",
		"84059659",
		"84059661"
	},
	{
		linkedHighLevelState = ioDevices_Data[809],
		linkedStateIds = ioDevices_Data[816]
	},
	{
		"65537",
		"84059651",
		"84059657",
		"84059661"
	},
	{
		linkedHighLevelState = ioDevices_Data[809],
		linkedStateIds = ioDevices_Data[818]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[72],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[508],
		{
			rawStateId = "84059657"
		},
		ioDevices_Data[700]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[821],
		converter = ioDevices_Converter[563],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[821],
		converter = ioDevices_Converter[564],
		extraDefinition = ioDevices_Data[9]
	},
	{
		ioDevices_HighLevelStates[345]
	},
	{
		linkedHighLevelState = ioDevices_Data[824],
		linkedStateIds = ioDevices_Data[810]
	},
	{
		linkedHighLevelState = ioDevices_Data[824],
		linkedStateIds = ioDevices_Data[814]
	},
	{
		linkedHighLevelState = ioDevices_Data[824],
		linkedStateIds = ioDevices_Data[816]
	},
	{
		linkedHighLevelState = ioDevices_Data[824],
		linkedStateIds = ioDevices_Data[818]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84059651"] = ioDevices_Data[825],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[345],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[20]
			},
			linkedStateIds = ioDevices_Data[812]
		},
		["84059661"] = ioDevices_Data[826],
		["84059657"] = ioDevices_Data[827],
		["84059659"] = ioDevices_Data[828],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[822],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[823]
	},
	{
		ioDevices_HighLevelStates[346]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[73],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[677],
		ioDevices_Data[741]
	},
	{
		ioDevices_HighLevelStates[347]
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
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[74],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[677],
		ioDevices_Data[741],
		ioDevices_Data[679]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[840],
		converter = ioDevices_Converter[571],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[840],
		converter = ioDevices_Converter[572],
		extraDefinition = ioDevices_Data[9]
	},
	{
		ioDevices_HighLevelStates[348]
	},
	{
		linkedHighLevelState = ioDevices_Data[843],
		linkedStateIds = ioDevices_Data[835]
	},
	{
		linkedHighLevelState = ioDevices_Data[843],
		linkedStateIds = ioDevices_Data[837]
	},
	{
		linkedHighLevelState = ioDevices_Data[843],
		linkedStateIds = ioDevices_Data[672]
	},
	{
		linkedHighLevelState = ioDevices_Data[843],
		linkedStateIds = ioDevices_Data[838]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84059651"] = ioDevices_Data[844],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[348],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[20]
			},
			linkedStateIds = ioDevices_Data[836]
		},
		["48170496"] = ioDevices_Data[845],
		["48171008"] = ioDevices_Data[846],
		["84059664"] = ioDevices_Data[847],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[841],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[842]
	},
	{
		ioDevices_HighLevelStates[349]
	},
	{
		linkedHighLevelState = ioDevices_Data[850],
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
			ioDevices_HighLevelStates[349],
			ioDevices_HighLevelStates[5],
			ioDevices_HighLevelStates[12],
			ioDevices_HighLevelStates[10],
			ioDevices_HighLevelStates[20]
		},
		linkedStateIds = ioDevices_Data[852]
	},
	{
		linkedHighLevelState = ioDevices_Data[850],
		linkedStateIds = ioDevices_Data[837]
	},
	{
		linkedHighLevelState = ioDevices_Data[850],
		linkedStateIds = {
			"65537",
			"84059651",
			"84059659",
			"84059664"
		}
	},
	{
		linkedHighLevelState = ioDevices_Data[850],
		linkedStateIds = {
			"48171008",
			"65537",
			"84059651",
			"84059659"
		}
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84059651"] = ioDevices_Data[851],
		["65537"] = ioDevices_Data[853],
		["84059659"] = ioDevices_Data[854],
		["48171008"] = ioDevices_Data[855],
		["84059664"] = ioDevices_Data[856],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["65556"] = ioDevices_Data[260],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		ioDevices_Data[193],
		ioDevices_Data[129],
		ioDevices_Data[700],
		ioDevices_Data[741],
		ioDevices_Data[679]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = {
			prototype = "string,object",
			parameters = ioDevices_Data[44],
			rawStates = ioDevices_Data[858],
			converter = ioDevices_Converter[574],
			extraDefinition = ioDevices_Data[45]
		},
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = {
			prototype = "string(normal;advanced;custom),*array",
			parameters = ioDevices_Data[8],
			rawStates = ioDevices_Data[858],
			converter = ioDevices_Converter[575],
			extraDefinition = ioDevices_Data[9]
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
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[857],
				attributes = ioDevices_Data[839],
				commands = ioDevices_Data[859]
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
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[857],
				attributes = ioDevices_Data[839],
				commands = ioDevices_Data[859]
			}
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[349],
			ioDevices_HighLevelStates[5],
			ioDevices_HighLevelStates[12],
			ioDevices_HighLevelStates[10],
			ioDevices_HighLevelStates[280]
		},
		linkedStateIds = ioDevices_Data[852]
	},
	{
		name = "Sunea 40 solar io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningWithBatteryIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = ioDevices_Data[851],
					["65537"] = ioDevices_Data[862],
					["84059659"] = ioDevices_Data[854],
					["48171008"] = ioDevices_Data[855],
					["84059664"] = ioDevices_Data[856],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["65556"] = ioDevices_Data[260],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[839],
				commands = ioDevices_Data[859]
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
				uiProfiles = ioDevices_Data[87],
				states = ioDevices_Data[857],
				attributes = ioDevices_Data[839],
				commands = ioDevices_Data[859]
			}
		}
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84059651"] = ioDevices_Data[851],
		["65537"] = ioDevices_Data[853],
		["84059659"] = ioDevices_Data[854],
		["48171008"] = ioDevices_Data[855],
		["84059664"] = ioDevices_Data[856],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		name = "Sunea 40 solar io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[865],
				attributes = ioDevices_Data[839],
				commands = ioDevices_Data[859]
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
				uiProfiles = ioDevices_Data[483],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = ioDevices_Data[851],
					["65537"] = ioDevices_Data[862],
					["84059659"] = ioDevices_Data[854],
					["48171008"] = ioDevices_Data[855],
					["84059664"] = ioDevices_Data[856],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[839],
				commands = ioDevices_Data[859]
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
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[865],
				attributes = ioDevices_Data[839],
				commands = ioDevices_Data[859]
			}
		}
	},
	{
		ioDevices_HighLevelStates[350]
	},
	{
		linkedHighLevelState = ioDevices_Data[869],
		linkedStateIds = ioDevices_Data[737]
	},
	{
		linkedHighLevelState = ioDevices_Data[869],
		linkedStateIds = ioDevices_Data[739]
	},
	{
		linkedHighLevelState = ioDevices_Data[869],
		linkedStateIds = ioDevices_Data[740]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = ioDevices_Data[870],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[350],
				ioDevices_HighLevelStates[51],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[20]
			},
			linkedStateIds = ioDevices_Data[738]
		},
		["48170496"] = ioDevices_Data[871],
		["48171008"] = ioDevices_Data[872],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[742],
		converter = ioDevices_Converter[577],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[742],
		converter = ioDevices_Converter[578],
		extraDefinition = ioDevices_Data[9]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[742],
		converter = ioDevices_Converter[579],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[742],
		converter = ioDevices_Converter[580],
		extraDefinition = ioDevices_Data[45]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = ioDevices_Data[870],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[350],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[20]
			},
			linkedStateIds = ioDevices_Data[738]
		},
		["48170496"] = ioDevices_Data[871],
		["48171008"] = ioDevices_Data[872],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[874],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[875]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = ioDevices_Data[870],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[350],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[280]
			},
			linkedStateIds = ioDevices_Data[738]
		},
		["48170496"] = ioDevices_Data[871],
		["48171008"] = ioDevices_Data[872],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[876],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[875]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[877],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[875]
	},
	{
		ioDevices_HighLevelStates[351]
	},
	{
		linkedHighLevelState = ioDevices_Data[883],
		linkedStateIds = ioDevices_Data[737]
	},
	{
		linkedHighLevelState = ioDevices_Data[883],
		linkedStateIds = ioDevices_Data[739]
	},
	{
		linkedHighLevelState = ioDevices_Data[883],
		linkedStateIds = ioDevices_Data[740]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[742],
		converter = ioDevices_Converter[582],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[742],
		converter = ioDevices_Converter[583],
		extraDefinition = ioDevices_Data[9]
	},
	{
		ioDevices_HighLevelStates[352]
	},
	{
		linkedHighLevelState = ioDevices_Data[889],
		linkedStateIds = ioDevices_Data[737]
	},
	{
		linkedHighLevelState = ioDevices_Data[889],
		linkedStateIds = ioDevices_Data[739]
	},
	{
		linkedHighLevelState = ioDevices_Data[889],
		linkedStateIds = ioDevices_Data[740]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[742],
		converter = ioDevices_Converter[585],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[742],
		converter = ioDevices_Converter[586],
		extraDefinition = ioDevices_Data[9]
	},
	{
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[199],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84082687"] = ioDevices_Data[890],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[352],
							ioDevices_HighLevelStates[51],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[20]
						},
						linkedStateIds = ioDevices_Data[738]
					},
					["48170496"] = ioDevices_Data[891],
					["48171008"] = ioDevices_Data[892],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[832],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[893],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[894]
				}
			}
		}
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = ioDevices_Data[884],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[351],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[20]
			},
			linkedStateIds = ioDevices_Data[738]
		},
		["48170496"] = ioDevices_Data[885],
		["48171008"] = ioDevices_Data[886],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[887],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[888]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = ioDevices_Data[890],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[352],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[20]
			},
			linkedStateIds = ioDevices_Data[738]
		},
		["48170496"] = ioDevices_Data[891],
		["48171008"] = ioDevices_Data[892],
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[893],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[894]
	},
	{
		name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[87],
				states = ioDevices_Data[898],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[899]
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
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[898],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[899]
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
				uiProfiles = ioDevices_Data[483],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84082687"] = ioDevices_Data[890],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[352],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[280]
						},
						linkedStateIds = ioDevices_Data[738]
					},
					["48170496"] = ioDevices_Data[891],
					["48171008"] = ioDevices_Data[892],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[899]
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
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[898],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[899]
			}
		}
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[353]
		},
		linkedStateIds = ioDevices_Data[243]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = ioDevices_Data[904],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[353],
				ioDevices_HighLevelStates[51],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[20]
			},
			linkedStateIds = ioDevices_Data[524]
		},
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[75],
		["core:Manufacturer"] = ioDevices_Attributes[1],
		["core:FirmwareRevision"] = ioDevices_Attributes[0]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[525],
		converter = ioDevices_Converter[589],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[525],
		converter = ioDevices_Converter[590],
		extraDefinition = ioDevices_Data[9]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[525],
		converter = ioDevices_Converter[591],
		extraDefinition = ioDevices_Data[45]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = ioDevices_Data[904],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[353],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[20]
			},
			linkedStateIds = ioDevices_Data[524]
		},
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[907],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[908]
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = ioDevices_Data[904],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[353],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[280]
			},
			linkedStateIds = ioDevices_Data[524]
		},
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[909],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[908]
	},
	{
		linkedHighLevelState = {
			ioDevices_HighLevelStates[354]
		},
		linkedStateIds = ioDevices_Data[243]
	},
	{
		prototype = "string,object",
		parameters = ioDevices_Data[44],
		rawStates = ioDevices_Data[525],
		converter = ioDevices_Converter[593],
		extraDefinition = ioDevices_Data[45]
	},
	{
		prototype = "string(normal;advanced;custom),*array",
		parameters = ioDevices_Data[8],
		rawStates = ioDevices_Data[525],
		converter = ioDevices_Converter[594],
		extraDefinition = ioDevices_Data[9]
	},
	{
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[199],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84082687"] = ioDevices_Data[914],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[354],
							ioDevices_HighLevelStates[51],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[20]
						},
						linkedStateIds = ioDevices_Data[524]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[906],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[915],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[916]
				}
			}
		}
	},
	{
		["16832512"] = ioDevices_Data[31],
		["84082687"] = ioDevices_Data[914],
		["65537"] = {
			linkedHighLevelState = {
				ioDevices_HighLevelStates[354],
				ioDevices_HighLevelStates[5],
				ioDevices_HighLevelStates[12],
				ioDevices_HighLevelStates[10],
				ioDevices_HighLevelStates[20]
			},
			linkedStateIds = ioDevices_Data[524]
		},
		["2147426304"] = ioDevices_Data[4],
		["1"] = ioDevices_Data[3],
		["65557"] = ioDevices_Data[36],
		["2146500645"] = ioDevices_Data[57],
		["16830720"] = ioDevices_Data[35],
		["16832522"] = ioDevices_Data[504],
		["2"] = ioDevices_Data[505],
		["2146500638"] = ioDevices_Data[1]
	},
	{
		setName = ioDevices_Data[20],
		sendIOKey = ioDevices_Data[65],
		keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
		unpairOneWayController = ioDevices_Data[24],
		getName = ioDevices_Data[14],
		unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
		delayedStopIdentify = ioDevices_Data[13],
		identify = ioDevices_Data[15],
		unpairAllOneWayControllers = ioDevices_Data[23],
		setSecuredPosition = ioDevices_Data[53],
		setPosition = ioDevices_Data[48],
		my = ioDevices_Data[51],
		setConfigState = ioDevices_Data[25],
		startIdentify = ioDevices_Data[21],
		stop = ioDevices_Data[63],
		setMemorized1Position = ioDevices_Data[47],
		stopIdentify = ioDevices_Data[22],
		wink = ioDevices_Data[26],
		runManufacturerSettingsCommand = ioDevices_Data[915],
		setClosure = ioDevices_Data[38],
		close = ioDevices_Data[40],
		deploy = ioDevices_Data[40],
		down = ioDevices_Data[40],
		open = ioDevices_Data[42],
		setDeployment = ioDevices_Data[38],
		undeploy = ioDevices_Data[42],
		up = ioDevices_Data[42],
		pairOneWayController = ioDevices_Data[17],
		refreshMemorized1Position = ioDevices_Data[37],
		advancedRefresh = ioDevices_Data[916]
	},
	{
		name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[87],
				states = ioDevices_Data[918],
				attributes = ioDevices_Data[906],
				commands = ioDevices_Data[919]
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
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[918],
				attributes = ioDevices_Data[906],
				commands = ioDevices_Data[919]
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
				uiProfiles = ioDevices_Data[483],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84082687"] = ioDevices_Data[914],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[354],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[280]
						},
						linkedStateIds = ioDevices_Data[524]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[906],
				commands = ioDevices_Data[919]
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
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[918],
				attributes = ioDevices_Data[906],
				commands = ioDevices_Data[919]
			}
		}
	},
	{
		name = "T3.5 BHZ",
		localPairing = true,
		["0"] = ioDevices_Data[721]
	},
	{
		ioDevices_HighLevelStates[355]
	}
}

ioDevices = {
	["0"] = { name = "Generic Product",
		localPairing = true,
		["0"] = ioDevices_Data[27]
	},
	["65536"] = { name = "Venetian Blind",
		localPairing = true,
		["0"] = {
			["io:VenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableVenetianBlind",
				uiClass = "VenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = {
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[7],
							ioDevices_HighLevelStates[10]
						},
						linkedStateIds = ioDevices_Data[29]
					},
					["2146500638"] = ioDevices_Data[1],
					["16832512"] = ioDevices_Data[31],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[33],
					["65538"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[9]
						}
					},
					["2147426304"] = ioDevices_Data[4],
					["16830720"] = ioDevices_Data[35],
					["65557"] = ioDevices_Data[36]
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					up = ioDevices_Data[42],
					setClosureAndOrientation = {
						prototype = "integer[0;100],integer[0;100]",
						parameters = ioDevices_Data[44],
						converter = ioDevices_Converter[25],
						extraDefinition = ioDevices_Data[45]
					},
					setMemorized1Position = ioDevices_Data[47],
					setName = ioDevices_Data[20],
					setOrientation = {
						prototype = "integer[0;100]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[26],
						extraDefinition = ioDevices_Data[45]
					},
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setSecuredPosition = ioDevices_Data[53],
					startIdentify = ioDevices_Data[21],
					stop = {
						converter = ioDevices_Converter[28],
						extraDefinition = ioDevices_Data[45]
					},
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["131072"] = { name = "Roller Shutter",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["131073"] = { name = "Roller Shutter VELUX",
		localPairing = true,
		["0"] = {
			["io:RollerShutterVeluxIOComponent"] = {
				type = 1,
				widget = "PositionableTiltedRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[71],
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					setMemorized1Position = ioDevices_Data[47],
					setName = ioDevices_Data[20],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setSecuredPosition = ioDevices_Data[53],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["131074"] = { name = "Roller Shutter SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["131328"] = { name = "Adjustable Slats Roller Shutter",
		localPairing = true,
		["0"] = ioDevices_Data[86]
	},
	["131330"] = { name = "Adj. Slats Roller Shutter SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[86]
	},
	["131584"] = { name = "Projection Roller Shutter",
		localPairing = true,
		["0"] = {
			["io:ProjectionRollerShutterIOComponent"] = {
				type = 1,
				widget = "PositionableProjectionRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = {
					["65537"] = ioDevices_Data[68],
					["2146500638"] = ioDevices_Data[1],
					["16832512"] = ioDevices_Data[69],
					["1"] = ioDevices_Data[3],
					["65546"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[19]
						}
					},
					["16832522"] = ioDevices_Data[70],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					setClosureAndProjectionAngle = {
						prototype = "integer[0;100],integer[0;100]",
						parameters = ioDevices_Data[44],
						converter = ioDevices_Converter[43],
						extraDefinition = ioDevices_Data[45]
					},
					setMemorized1Position = ioDevices_Data[47],
					setName = ioDevices_Data[20],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setProjectionAngle = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[44],
						extraDefinition = ioDevices_Data[45]
					},
					setSecuredPosition = ioDevices_Data[53],
					startIdentify = ioDevices_Data[21],
					stop = {
						converter = ioDevices_Converter[45],
						extraDefinition = ioDevices_Data[45]
					},
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["196608"] = { name = "Vertical Exterior Awning",
		localPairing = true,
		["0"] = ioDevices_Data[91]
	},
	["196609"] = { name = "Vertical Exterior Awning Velux",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningVeluxIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[87],
				states = {
					["65537"] = ioDevices_Data[88],
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[33],
					["2147426304"] = ioDevices_Data[4],
					["16830720"] = ioDevices_Data[35],
					["16832512"] = ioDevices_Data[74],
					["65557"] = ioDevices_Data[36],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[59],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					runManufacturerSettingsCommand = ioDevices_Data[62],
					pairOneWayController = ioDevices_Data[17],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					setName = ioDevices_Data[20],
					setPosition = {
						prototype = "string(secured)|integer[0;100]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[46],
						extraDefinition = ioDevices_Data[18]
					},
					setSecuredPosition = ioDevices_Data[53],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26],
					sendIOKey = ioDevices_Data[65]
				}
			}
		}
	},
	["196610"] = { name = "Vertical Exterior Awning SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[91]
	},
	["262144"] = { name = "Window Opener",
		localPairing = true,
		["0"] = {
			["io:WindowOpenerGenericIOComponent"] = {
				type = 1,
				widget = "PositionableWindow",
				uiClass = "Window",
				uiProfiles = ioDevices_Data[92],
				states = ioDevices_Data[93],
				attributes = ioDevices_Data[5],
				commands = ioDevices_Data[94]
			}
		}
	},
	["262145"] = { name = "Window Opener VELUX",
		localPairing = true,
		["0"] = ioDevices_Data[95]
	},
	["262401"] = { name = "Window Opener with integrated rain sensor VELUX",
		localPairing = true,
		["0"] = ioDevices_Data[95]
	},
	["327680"] = { name = "Garage Door Opener",
		localPairing = true,
		["0"] = ioDevices_Data[96]
	},
	["327682"] = { name = "Garage Door Opener SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[96]
	},
	["342528"] = { name = "Discrete Garage Door Opener",
		localPairing = true,
		["0"] = ioDevices_Data[100]
	},
	["342530"] = { name = "Discrete Garage Door Opener SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[100]
	},
	["393216"] = { name = "Dimmable Light",
		localPairing = true,
		["0"] = ioDevices_Data[115]
	},
	["393218"] = { name = "Dimmable Light - Somfy",
		localPairing = true,
		["0"] = ioDevices_Data[115]
	},
	["393471"] = { name = "FirstInnov Swimming Pool",
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
				states = ioDevices_Data[116],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					setName = ioDevices_Data[20],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[60],
						extraDefinition = ioDevices_Data[18]
					},
					off = {
						parameters = ioDevices_Data[117],
						converter = ioDevices_Converter[60],
						extraDefinition = ioDevices_Data[18]
					},
					on = {
						parameters = ioDevices_Data[118],
						converter = ioDevices_Converter[60],
						extraDefinition = ioDevices_Data[18]
					},
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["393472"] = { name = "Dimmable RGB Light",
		localPairing = true,
		["0"] = ioDevices_Data[127]
	},
	["393474"] = { name = "Dimmable RGB Light Somfy",
		localPairing = true,
		["0"] = ioDevices_Data[127]
	},
	["393730"] = { name = "Tunable White Receiver",
		localPairing = true,
		["0"] = ioDevices_Data[132]
	},
	["408064"] = { name = "On/Off Light",
		localPairing = true,
		["0"] = ioDevices_Data[140]
	},
	["408066"] = { name = "On/Off Light - Somfy",
		localPairing = true,
		["0"] = ioDevices_Data[140]
	},
	["2199023663618"] = { name = "On/Off Light - Somfy  - With battery status",
		localPairing = true,
		["0"] = {
			["io:OnOffLightMicroModuleSomfyIOComponent"] = ioDevices_Data[139]
		}
	},
	["458752"] = { name = "Gate Opener",
		localPairing = true,
		["0"] = ioDevices_Data[148]
	},
	["458754"] = { name = "Gate Opener Wardrobe SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[148]
	},
	["473600"] = { name = "Discrete Gate Opener",
		localPairing = true,
		["0"] = ioDevices_Data[152]
	},
	["473602"] = { name = "Discrete Gate Opener SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[152]
	},
	["524288"] = { name = "Rolling Door Opener",
		localPairing = true,
		["0"] = ioDevices_Data[155]
	},
	["524290"] = { name = "Rolling Door Opener SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[155]
	},
	["589824"] = { name = "Door Lock",
		localPairing = true,
		["0"] = ioDevices_Data[163]
	},
	["589826"] = { name = "Door Lock SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[163]
	},
	["590080"] = { name = "Window Lock",
		localPairing = true,
		["0"] = ioDevices_Data[166]
	},
	["590090"] = { name = "Window Lock SECUYOU",
		localPairing = true,
		["0"] = ioDevices_Data[166]
	},
	["655360"] = { name = "Vertical Blind",
		localPairing = true,
		["0"] = ioDevices_Data[169]
	},
	["655361"] = { name = "Blind VELUX",
		localPairing = true,
		["0"] = {
			["io:VerticalInteriorBlindVeluxIOComponent"] = {
				type = 1,
				widget = "PositionableTiltedScreen",
				uiClass = "Screen",
				uiProfiles = ioDevices_Data[167],
				states = ioDevices_Data[71],
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					up = ioDevices_Data[42],
					setMemorized1Position = ioDevices_Data[47],
					setName = ioDevices_Data[20],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setSecuredPosition = ioDevices_Data[53],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["655362"] = { name = "Sonesse 40",
		localPairing = true,
		["0"] = ioDevices_Data[169]
	},
	["851968"] = { name = "Dual Roller Shutter",
		localPairing = true,
		["0"] = {
			["io:DualRollerShutterIOComponent"] = {
				type = 1,
				widget = "PositionableDualRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = {
					["65537"] = ioDevices_Data[153],
					["2146500638"] = ioDevices_Data[1],
					["65539"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[38],
							ioDevices_HighLevelStates[39]
						}
					},
					["16832512"] = ioDevices_Data[69],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[70],
					["2147426304"] = ioDevices_Data[4],
					["65538"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[40],
							ioDevices_HighLevelStates[41]
						}
					}
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getClosure = ioDevices_Data[158],
					getLowerClosure = {
						extraDefinition = {
							access = "r",
							parameterId = "65539"
						}
					},
					getName = ioDevices_Data[14],
					getUpperClosure = {
						extraDefinition = {
							access = "r",
							parameterId = "65538"
						}
					},
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					up = ioDevices_Data[42],
					setLowerClosure = ioDevices_Data[170],
					lowerClose = ioDevices_Data[171],
					lowerDown = ioDevices_Data[171],
					lowerOpen = ioDevices_Data[172],
					lowerUp = ioDevices_Data[172],
					setLowerPosition = ioDevices_Data[170],
					setMemorized1Position = ioDevices_Data[47],
					setName = ioDevices_Data[20],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setSecuredPosition = ioDevices_Data[53],
					setUpperAndLowerClosure = ioDevices_Data[173],
					setUpperAndLowerPosition = ioDevices_Data[173],
					setUpperClosure = ioDevices_Data[174],
					upperClose = ioDevices_Data[175],
					upperDown = ioDevices_Data[175],
					upperOpen = ioDevices_Data[176],
					upperUp = ioDevices_Data[176],
					setUpperPosition = ioDevices_Data[174],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["917504"] = { name = "Heating Temperature Interface",
		localPairing = true,
		["0"] = {
			["io:HeatingTemperatureInterfaceIOComponent"] = {
				type = 1,
				widget = "HeatingTemperatureInterface",
				uiClass = "HeatingSystem",
				uiProfiles = ioDevices_Data[177],
				states = {
					["16832527"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[42],
							ioDevices_HighLevelStates[45]
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
						linkedHighLevelState = ioDevices_Data[178],
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
						linkedHighLevelState = ioDevices_Data[178],
						linkedStateIds = {
							"16830720",
							"16832522",
							"16832526",
							"16832527",
							"65537",
							"65558"
						}
					},
					["2146500638"] = ioDevices_Data[1],
					["16832526"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[43],
							ioDevices_HighLevelStates[45]
						},
						linkedStateIds = {
							"16830720",
							"16832522",
							"16832527",
							"65558",
							"65559"
						}
					},
					["1"] = ioDevices_Data[3],
					["16832522"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[44],
							ioDevices_HighLevelStates[45]
						},
						linkedStateIds = {
							"16830720",
							"16832526",
							"16832527",
							"65558",
							"65559"
						}
					},
					["2147426304"] = ioDevices_Data[4],
					["16830720"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[45],
							ioDevices_HighLevelStates[47]
						},
						linkedStateIds = {
							"16832522",
							"16832526",
							"16832527",
							"65558",
							"65559"
						}
					},
					["65537"] = ioDevices_Data[179]
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					refreshActiveMode = {
						extraDefinition = {
							access = "r",
							parameterId = "65546"
						}
					},
					refreshComfortTemperature = ioDevices_Data[180],
					refreshEcoTemperature = ioDevices_Data[181],
					refreshSecuredPositionTemperature = {
						extraDefinition = {
							access = "r",
							parameterId = "16832522"
						}
					},
					refreshTemperature = ioDevices_Data[158],
					refreshSetPointMode = ioDevices_Data[158],
					refreshTargetTemperature = ioDevices_Data[158],
					setActiveAndSetPointModes = {
						prototype = "any,any",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[182],
						converter = ioDevices_Converter[93],
						extraDefinition = ioDevices_Data[45]
					},
					setActiveMode = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						rawStates = {
							{
								rawStateId = "16830720"
							}
						},
						converter = ioDevices_Converter[94],
						extraDefinition = ioDevices_Data[45]
					},
					setComfortTemperature = ioDevices_Data[184],
					setEcoTemperature = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						rawStates = ioDevices_Data[182],
						converter = ioDevices_Converter[95],
						extraDefinition = ioDevices_Data[185]
					},
					setName = ioDevices_Data[20],
					setOperatingMode = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[96],
						extraDefinition = ioDevices_Data[45]
					},
					setSecuredPosition = {
						prototype = "integer[0;100]",
						parameters = ioDevices_Data[11],
						rawStates = ioDevices_Data[182],
						converter = ioDevices_Converter[95],
						extraDefinition = ioDevices_Data[52]
					},
					setSecuredPositionTemperature = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						rawStates = ioDevices_Data[182],
						converter = ioDevices_Converter[95],
						extraDefinition = ioDevices_Data[52]
					},
					setSetPointMode = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						rawStates = ioDevices_Data[182],
						converter = ioDevices_Converter[97],
						extraDefinition = ioDevices_Data[45]
					},
					setTargetTemperature = {
						prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
						parameters = ioDevices_Data[11],
						rawStates = ioDevices_Data[182],
						converter = ioDevices_Converter[97],
						extraDefinition = ioDevices_Data[45]
					},
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["983040"] = { name = "Switch On/Off",
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
				states = ioDevices_Data[116],
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					onWithTimer = {
						prototype = "integer[5;14400]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[98],
						extraDefinition = ioDevices_Data[18]
					},
					pairOneWayController = ioDevices_Data[17],
					setName = ioDevices_Data[20],
					setOnOff = {
						prototype = "string(off;on)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[99],
						extraDefinition = ioDevices_Data[18]
					},
					off = {
						parameters = ioDevices_Data[117],
						converter = ioDevices_Converter[99],
						extraDefinition = ioDevices_Data[18]
					},
					on = {
						parameters = ioDevices_Data[118],
						converter = ioDevices_Converter[99],
						extraDefinition = ioDevices_Data[18]
					},
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["983552"] = { name = "Switch On/Off - micromodule",
		localPairing = true,
		["0"] = {
			["io:SwitchMicroModuleIOComponent"] = {
				type = 1,
				widget = "TimedOnOff",
				uiClass = "OnOff",
				uiProfiles = ioDevices_Data[133],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["65537"] = ioDevices_Data[134],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					onWithInternalTimer = ioDevices_Data[186],
					onWithTimer = ioDevices_Data[187],
					pairOneWayController = ioDevices_Data[17],
					setName = ioDevices_Data[20],
					setOnOff = ioDevices_Data[188],
					off = ioDevices_Data[189],
					on = ioDevices_Data[190],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["983554"] = { name = "Light On/Off - micromodule SOMFY",
		localPairing = true,
		["0"] = {
			["io:LightMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "TimedOnOffLight",
				uiClass = "Light",
				uiProfiles = ioDevices_Data[133],
				states = ioDevices_Data[192],
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[198]
			}
		}
	},
	["1048576"] = { name = "Horizontal Awning",
		localPairing = true,
		["0"] = ioDevices_Data[203]
	},
	["1048832"] = { name = "Pergola Rail Guided Awning",
		localPairing = true,
		["0"] = ioDevices_Data[205]
	},
	["2199023648770"] = { name = "Dimmable Light - micromodule SOMFY",
		localPairing = true,
		["0"] = {
			["io:DimmableLightMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "DimmerLight",
				uiClass = "Light",
				uiProfiles = ioDevices_Data[101],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["65537"] = ioDevices_Data[102],
					["1"] = ioDevices_Data[3],
					["2147426304"] = ioDevices_Data[4],
					["16832512"] = ioDevices_Data[103],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[59],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					runManufacturerSettingsCommand = ioDevices_Data[62],
					pairOneWayController = ioDevices_Data[17],
					setName = ioDevices_Data[20],
					setIntensity = ioDevices_Data[104],
					off = ioDevices_Data[105],
					on = ioDevices_Data[106],
					setOnOff = ioDevices_Data[107],
					setIntensityWithTimer = ioDevices_Data[109],
					onWithTimer = ioDevices_Data[110],
					setMemorized1Position = ioDevices_Data[111],
					refreshMemorized1Position = ioDevices_Data[37],
					setPosition = ioDevices_Data[112],
					my = ioDevices_Data[113],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					unpairOneWayController = ioDevices_Data[24],
					wink = ioDevices_Data[26],
					setConfigState = ioDevices_Data[25],
					increaseIntensityForBoundConfiguration = ioDevices_Data[208],
					decreaseIntensityForBoundConfiguration = ioDevices_Data[209],
					saveBound = ioDevices_Data[210],
					sendIOKey = ioDevices_Data[65]
				}
			}
		}
	},
	["1048834"] = { name = "Pergola Rail Guided Awning SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[205]
	},
	["1114112"] = { name = "Exterior Venetian Blind",
		localPairing = true,
		["0"] = ioDevices_Data[218]
	},
	["1179648"] = { name = "Louver Blind",
		localPairing = true,
		["0"] = ioDevices_Data[27]
	},
	["1245184"] = { name = "Curtain track",
		localPairing = true,
		["0"] = ioDevices_Data[27]
	},
	["1310720"] = { name = "Ventilation point",
		localPairing = true,
		["0"] = {
			["io:VentilationPointIOComponent"] = ioDevices_Data[220]
		}
	},
	["1310976"] = { name = "Ventilation Inlet",
		localPairing = true,
		["0"] = {
			["io:VentilationPointAirInletIOComponent"] = ioDevices_Data[220]
		}
	},
	["1311232"] = { name = "Ventilation Transfer",
		localPairing = true,
		["0"] = {
			["io:VentilationPointAirTransferIOComponent"] = {
				type = 1,
				widget = "VentilationTransfer",
				uiClass = "VentilationSystem",
				uiProfiles = ioDevices_Data[219],
				states = {
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[54]
						}
					},
					["2146500638"] = ioDevices_Data[1],
					["16832512"] = ioDevices_Data[69],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[70],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					setAirTransfer = ioDevices_Data[38],
					off = ioDevices_Data[42],
					on = ioDevices_Data[40],
					setName = ioDevices_Data[20],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["1311488"] = { name = "Ventilation Outlet",
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
							ioDevices_HighLevelStates[55],
							ioDevices_HighLevelStates[56]
						}
					},
					["2146500638"] = ioDevices_Data[1],
					["16832512"] = ioDevices_Data[69],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[70],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					setAirOutput = ioDevices_Data[38],
					off = ioDevices_Data[42],
					on = ioDevices_Data[40],
					setName = ioDevices_Data[20],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["1376256"] = { name = "Exterior Heating",
		localPairing = true,
		["0"] = ioDevices_Data[27]
	},
	["1376258"] = { name = "Exterior Heating SOMFY",
		localPairing = true,
		["0"] = {
			["io:ExteriorHeatingIOComponent"] = ioDevices_Data[227]
		}
	},
	["1391106"] = { name = "Discrete Exterior Heating SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[231]
	},
	["1441792"] = { name = "Heat Pump",
		localPairing = true,
		["0"] = {
			["io:HeatPumpIOComponent"] = {
				type = 1,
				widget = "HeatPump",
				uiClass = "HeatPumpSystem",
				uiProfiles = ioDevices_Data[177],
				states = {
					["16832527"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[58]
						}
					},
					["2146500638"] = ioDevices_Data[1],
					["16832530"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[59]
						}
					},
					["16832531"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[60]
						}
					},
					["1"] = ioDevices_Data[3],
					["65545"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[61]
						}
					},
					["16832526"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[62]
						}
					},
					["2147426304"] = ioDevices_Data[4],
					["16830720"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[63],
							ioDevices_HighLevelStates[64]
						}
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[65]
						}
					},
					["65553"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[66]
						}
					},
					["65552"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[67]
						}
					}
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					refreshActiveModes = ioDevices_Data[233],
					refreshComfortTemperature = ioDevices_Data[180],
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
					refreshSetBackTemperature = ioDevices_Data[181],
					refreshTargetTemperature = ioDevices_Data[158],
					refreshTemperature = ioDevices_Data[158],
					setActiveMode = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[123],
						extraDefinition = ioDevices_Data[45]
					},
					setComfortTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[124],
						extraDefinition = ioDevices_Data[183]
					},
					setEcoTemperature = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[124],
						extraDefinition = ioDevices_Data[234]
					},
					setName = ioDevices_Data[20],
					setSetBackTemperature = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[124],
						extraDefinition = ioDevices_Data[185]
					},
					setTargetTemperature = {
						prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[124],
						extraDefinition = ioDevices_Data[18]
					},
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["1507328"] = { name = "Alarm System",
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
							ioDevices_HighLevelStates[68]
						}
					},
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					alarmOff = ioDevices_Data[99],
					disarm = ioDevices_Data[99],
					alarmOn = ioDevices_Data[98],
					arm = ioDevices_Data[98],
					alarmZoneOn = {
						prototype = "string(A;B;C;A\\,B;B\\,C;A\\,C;A\\,B\\,C)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[126],
						extraDefinition = ioDevices_Data[18]
					},
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					refreshState = ioDevices_Data[158],
					setName = ioDevices_Data[20],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["1572864"] = { name = "Swinging Shutters",
		localPairing = true,
		["0"] = ioDevices_Data[27]
	},
	["1572866"] = { name = "Swinging Shutter Somfy",
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
					["65537"] = ioDevices_Data[153],
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["2147426304"] = ioDevices_Data[4],
					["16832512"] = ioDevices_Data[69],
					["16832522"] = ioDevices_Data[70],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[59],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					runManufacturerSettingsCommand = ioDevices_Data[62],
					pairOneWayController = ioDevices_Data[17],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setName = ioDevices_Data[20],
					setPosition = {
						prototype = "string(my;memorized1;secured)|integer[0;100]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[127],
						extraDefinition = ioDevices_Data[18]
					},
					my = {
						parameters = ioDevices_Data[50],
						converter = ioDevices_Converter[127],
						extraDefinition = ioDevices_Data[18]
					},
					setMemorized1Position = ioDevices_Data[47],
					refreshMemorized1Position = ioDevices_Data[37],
					setSecuredPosition = ioDevices_Data[53],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					stop = ioDevices_Data[235],
					sendIOKey = ioDevices_Data[65]
				}
			}
		}
	},
	["1587714"] = { name = "Discrete Swinging Shutter Somfy",
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
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[7]
						}
					},
					["2147426304"] = ioDevices_Data[4],
					["16832512"] = ioDevices_Data[69],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[59],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					runManufacturerSettingsCommand = ioDevices_Data[62],
					pairOneWayController = ioDevices_Data[17],
					close = ioDevices_Data[98],
					open = ioDevices_Data[99],
					my = ioDevices_Data[236],
					startIdentify = ioDevices_Data[21],
					setName = ioDevices_Data[20],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					setMemorized1Position = ioDevices_Data[47],
					refreshMemorized1Position = ioDevices_Data[37],
					stop = ioDevices_Data[235],
					sendIOKey = ioDevices_Data[65]
				}
			}
		}
	},
	["1573120"] = { name = "Independant Swinging Shutters",
		localPairing = true,
		["0"] = ioDevices_Data[27]
	},
	["1769472"] = { name = "Sliding Window",
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
					["16832512"] = ioDevices_Data[69],
					["65537"] = ioDevices_Data[153],
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					setClosure = ioDevices_Data[19],
					close = ioDevices_Data[237],
					open = ioDevices_Data[238],
					setClosureAndLinearSpeed = ioDevices_Data[239],
					setName = ioDevices_Data[20],
					setPosition = {
						prototype = "string(my)|integer[0;100]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[131],
						extraDefinition = ioDevices_Data[18]
					},
					my = ioDevices_Data[240],
					setPositionAndLinearSpeed = {
						prototype = "string(my)|integer[0;100],*string(lowspeed)",
						parameters = ioDevices_Data[8],
						converter = ioDevices_Converter[132],
						extraDefinition = ioDevices_Data[45]
					},
					setMemorized1Position = ioDevices_Data[47],
					refreshMemorized1Position = ioDevices_Data[37],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["1769730"] = { name = "Sliding Window with lock SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[251]
	},
	["2199025025282"] = { name = "Sliding Air Window io Portability Step 1",
		localPairing = true,
		["0"] = ioDevices_Data[251]
	},
	["1900544"] = { name = "Bioclimatic Pergola",
		localPairing = true,
		["0"] = ioDevices_Data[258]
	},
	["1900546"] = { name = "Bioclimatic Pergola Somfy",
		localPairing = true,
		["0"] = ioDevices_Data[258]
	},
	["1966080"] = { name = "Siren",
		localPairing = true,
		["0"] = {
			["io:SirenIOComponent"] = {
				type = 1,
				widget = "IOSiren",
				uiClass = "Siren",
				uiProfiles = ioDevices_Data[259],
				states = {
					["65556"] = ioDevices_Data[260],
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["16830720"] = ioDevices_Data[261],
					["2147426304"] = ioDevices_Data[4],
					["io:MemorizedVolumeState"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[83]
						}
					}
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					off = ioDevices_Data[262],
					stop = ioDevices_Data[262],
					pairOneWayController = ioDevices_Data[17],
					ringWithDoubleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default)",
						parameters = {
							ioDevices_Data[6],
							ioDevices_Data[43],
							ioDevices_Data[122],
							ioDevices_Data[124],
							ioDevices_Data[263],
							ioDevices_Data[264],
							ioDevices_Data[265],
							ioDevices_Data[266],
							ioDevices_Data[267],
							ioDevices_Data[268]
						},
						rawStates = ioDevices_Data[269],
						converter = ioDevices_Converter[152],
						extraDefinition = ioDevices_Data[45]
					},
					ringWithSingleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default)",
						parameters = {
							ioDevices_Data[6],
							ioDevices_Data[43],
							ioDevices_Data[122],
							ioDevices_Data[124],
							ioDevices_Data[263]
						},
						rawStates = ioDevices_Data[269],
						converter = ioDevices_Converter[153],
						extraDefinition = ioDevices_Data[45]
					},
					ring = {
						parameters = {
							ioDevices_Data[270],
							ioDevices_Data[271],
							ioDevices_Data[272],
							ioDevices_Data[273],
							{
								value = "noVisualEffect",
								name = "p5"
							}
						},
						rawStates = ioDevices_Data[269],
						converter = ioDevices_Converter[153],
						extraDefinition = ioDevices_Data[45]
					},
					ringWithThreeSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;lowest;noSound;default;memorizedVolume),string(noVisualEffect;slowBlinking;quickBlinking;linkedSonorousSequence;default)",
						parameters = {
							ioDevices_Data[6],
							ioDevices_Data[43],
							ioDevices_Data[122],
							ioDevices_Data[124],
							ioDevices_Data[263],
							ioDevices_Data[264],
							ioDevices_Data[265],
							ioDevices_Data[266],
							ioDevices_Data[267],
							ioDevices_Data[268],
							ioDevices_Data[274],
							ioDevices_Data[275],
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
						rawStates = ioDevices_Data[269],
						converter = ioDevices_Converter[154],
						extraDefinition = ioDevices_Data[45]
					},
					setMemorizedVolume = {
						prototype = "string(default;highest;lowest;noSound;standard)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[155],
						extraDefinition = ioDevices_Data[276]
					},
					setName = ioDevices_Data[20],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["1966082"] = { name = "Indoor Siren SOMFY",
		localPairing = true,
		["0"] = {
			["io:SomfyIndoorSimpleSirenIOComponent"] = {
				type = 1,
				widget = "IOSiren",
				uiClass = "Siren",
				uiProfiles = ioDevices_Data[259],
				states = {
					["65556"] = ioDevices_Data[260],
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["16830720"] = ioDevices_Data[261],
					["2147426304"] = ioDevices_Data[4],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57],
					["io:MemorizedVolumeState"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[84]
						}
					}
				},
				attributes = ioDevices_Data[59],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					runManufacturerSettingsCommand = ioDevices_Data[62],
					off = ioDevices_Data[262],
					stop = ioDevices_Data[262],
					pairOneWayController = ioDevices_Data[17],
					ringWithDoubleSimpleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume)",
						parameters = {
							ioDevices_Data[6],
							ioDevices_Data[43],
							ioDevices_Data[122],
							ioDevices_Data[124],
							ioDevices_Data[263],
							ioDevices_Data[264],
							ioDevices_Data[265],
							ioDevices_Data[266]
						},
						rawStates = ioDevices_Data[269],
						converter = ioDevices_Converter[156],
						extraDefinition = ioDevices_Data[45]
					},
					ringWithSingleSimpleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume)",
						parameters = ioDevices_Data[125],
						rawStates = ioDevices_Data[269],
						converter = ioDevices_Converter[157],
						extraDefinition = ioDevices_Data[45]
					},
					ring = {
						parameters = {
							ioDevices_Data[270],
							ioDevices_Data[271],
							ioDevices_Data[272],
							ioDevices_Data[273]
						},
						rawStates = ioDevices_Data[269],
						converter = ioDevices_Converter[157],
						extraDefinition = ioDevices_Data[45]
					},
					ringWithThreeSimpleSequence = {
						prototype = "integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume),integer[100;204600]|string(defaultDuration;defaultSoundPattern),integer[0;100],integer[0;1022]|string(noRepetition;unlimited),string(highest;standard;memorizedVolume)",
						parameters = {
							ioDevices_Data[6],
							ioDevices_Data[43],
							ioDevices_Data[122],
							ioDevices_Data[124],
							ioDevices_Data[263],
							ioDevices_Data[264],
							ioDevices_Data[265],
							ioDevices_Data[266],
							ioDevices_Data[267],
							ioDevices_Data[268],
							ioDevices_Data[274],
							ioDevices_Data[275]
						},
						rawStates = ioDevices_Data[269],
						converter = ioDevices_Converter[158],
						extraDefinition = ioDevices_Data[45]
					},
					setMemorizedSimpleVolume = {
						prototype = "string(highest;standard)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[155],
						extraDefinition = ioDevices_Data[276]
					},
					setName = ioDevices_Data[20],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26],
					sendIOKey = ioDevices_Data[65]
				}
			}
		}
	},
	["3342348"] = { name = "Domestic hot water production (Atlantic V2)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2IOComponent"] = ioDevices_Data[355]
		},
		["2"] = ioDevices_Data[358]
	},
	["3407872"] = { name = "Electrical heater",
		localPairing = true,
		["0"] = {
			["io:ElectricalHeaterGenericIOComponent"] = {
				type = 1,
				widget = "ElectricalHeater",
				uiClass = "HeatingSystem",
				uiProfiles = ioDevices_Data[359],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["16830720"] = ioDevices_Data[360],
					["2147426304"] = ioDevices_Data[4],
					["65547"] = ioDevices_Data[361],
					["65548"] = ioDevices_Data[362]
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					cancelHeatingLevel = ioDevices_Data[363],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					refreshHeatingLevel = ioDevices_Data[158],
					setHeatingLevel = ioDevices_Data[364],
					off = ioDevices_Data[365],
					setHeatingLevelWithTimer = ioDevices_Data[366],
					setName = ioDevices_Data[20],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["3407884"] = { name = "Electrical heater (Atlantic)",
		localPairing = true,
		["0"] = {
			["io:AtlanticElectricalHeaterIOComponent"] = {
				type = 1,
				widget = "AtlanticElectricalHeater",
				uiClass = "HeatingSystem",
				uiProfiles = ioDevices_Data[359],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["16830720"] = ioDevices_Data[360],
					["2147426304"] = ioDevices_Data[4],
					["65547"] = ioDevices_Data[361],
					["65548"] = ioDevices_Data[362],
					["core:AbsenceModeState"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[127]
						}
					}
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					cancelHeatingLevel = ioDevices_Data[363],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					refreshHeatingLevel = ioDevices_Data[158],
					setHeatingLevel = ioDevices_Data[364],
					off = ioDevices_Data[365],
					setHeatingLevelForTrigger = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[208],
						extraDefinition = ioDevices_Data[45]
					},
					setHeatingLevelWithTimer = ioDevices_Data[366],
					setName = ioDevices_Data[20],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					wink = ioDevices_Data[26]
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
				uiProfiles = ioDevices_Data[367],
				states = {
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[128]
						}
					},
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["218040320"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[129],
							ioDevices_HighLevelStates[134],
							ioDevices_HighLevelStates[135],
							ioDevices_HighLevelStates[136],
							ioDevices_HighLevelStates[137]
						}
					},
					["2147426304"] = ioDevices_Data[4],
					["218041600"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[130]
						}
					},
					["16830720"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[131]
						}
					},
					["84672513"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[132]
						}
					},
					["84672514"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[133]
						}
					},
					["218040576"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[138]
						}
					},
					["65553"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[139]
						}
					},
					["218040064"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[140]
						}
					}
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					refreshCO2History = {
						converter = ioDevices_Converter[222],
						extraDefinition = ioDevices_Data[368]
					},
					refreshEnergySaving = {
						converter = ioDevices_Converter[223],
						extraDefinition = ioDevices_Data[368]
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
						converter = ioDevices_Converter[188],
						extraDefinition = ioDevices_Data[232]
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
							ioDevices_Data[206],
							ioDevices_Data[7],
							ioDevices_Data[108]
						},
						converter = ioDevices_Converter[224],
						extraDefinition = {
							access = "w",
							parameterId = "218041088"
						}
					},
					setAirDemandMode = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[225],
						extraDefinition = ioDevices_Data[18]
					},
					setName = ioDevices_Data[20],
					setTimeProgram = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[226],
						extraDefinition = {
							access = "w",
							parameterId = "218041856"
						}
					},
					setVentilationConfigurationMode = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[227],
						extraDefinition = ioDevices_Data[45]
					},
					setVentilationMode = {
						prototype = "any",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[228],
						extraDefinition = {
							access = "w",
							parameterId = "218040064"
						}
					},
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					wink = ioDevices_Data[26]
				}
			}
		},
		["2"] = {
			["io:CO2IOSystemDeviceSensor"] = {
				type = 2,
				widget = "CO2Sensor",
				uiClass = "AirSensor",
				uiProfiles = ioDevices_Data[369],
				states = {
					["218040576"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[141]
						}
					},
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:PowerSourceType"] = ioDevices_Attributes[3]
				}
			}
		},
		["3"] = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ioDevices_Data[370],
				states = {
					["2147426304"] = ioDevices_Data[4],
					["218040576"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[142]
						}
					}
				},
				attributes = ioDevices_Data[371]
			}
		},
		["4"] = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ioDevices_Data[370],
				states = {
					["2147426304"] = ioDevices_Data[4],
					["218040576"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[143]
						}
					}
				},
				attributes = ioDevices_Data[371]
			}
		},
		["5"] = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ioDevices_Data[370],
				states = {
					["2147426304"] = ioDevices_Data[4],
					["218040576"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[144]
						}
					}
				},
				attributes = ioDevices_Data[371]
			}
		},
		["6"] = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ioDevices_Data[370],
				states = {
					["2147426304"] = ioDevices_Data[4],
					["218040576"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[145]
						}
					}
				},
				attributes = ioDevices_Data[371]
			}
		},
		["7"] = {
			["io:TemperatureInCelciusIOSystemDeviceSensor"] = {
				type = 2,
				widget = "TemperatureSensor",
				uiClass = "TemperatureSensor",
				uiProfiles = ioDevices_Data[370],
				states = {
					["2147426304"] = ioDevices_Data[4],
					["218040576"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[146]
						}
					}
				},
				attributes = ioDevices_Data[371]
			}
		}
	},
	["16711691"] = { name = "Gateway RSOverkiz",
		localPairing = true,
		["0"] = {
			["io:RSOverkizIOComponent"] = {
				type = 1,
				widget = "unknown",
				uiClass = "Generic",
				uiProfiles = ioDevices_Data[367],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					setName = ioDevices_Data[20],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26]
				}
			}
		}
	},
	["4295032832"] = { name = "Light Inside Sensor",
		localPairing = true,
		["0"] = ioDevices_Data[376]
	},
	["4295098368"] = { name = "Temperature Inside Sensor",
		localPairing = true,
		["0"] = ioDevices_Data[378]
	},
	["4295163904"] = { name = "Temperature Outside Sensor",
		localPairing = true,
		["0"] = ioDevices_Data[378]
	},
	["4295229440"] = { name = "Wind Sensor",
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
					["2146500638"] = ioDevices_Data[1],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4],
					["2415919106"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[150]
						}
					}
				},
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:PowerSourceType"] = ioDevices_Attributes[9],
					["core:MeasuredValueType"] = ioDevices_Attributes[11]
				},
				commands = ioDevices_Data[375]
			}
		}
	},
	["4295360512"] = { name = "Sun Energy Outside Sensor",
		localPairing = true,
		["0"] = {
			["io:SunEnergyIOSystemSensor"] = {
				type = 2,
				widget = "SunEnergySensor",
				uiClass = "SunSensor",
				uiProfiles = ioDevices_Data[367],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4],
					["2415919106"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[151]
						}
					}
				},
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:PowerSourceType"] = ioDevices_Attributes[9],
					["core:MeasuredValueType"] = ioDevices_Attributes[12]
				},
				commands = ioDevices_Data[375]
			}
		}
	},
	["4295426048"] = { name = "Relative Humidity Inside Sensor",
		localPairing = true,
		["0"] = ioDevices_Data[381]
	},
	["4295491584"] = { name = "Relative Humidity Outside Sensor",
		localPairing = true,
		["0"] = ioDevices_Data[381]
	},
	["4295557120"] = { name = "CO2 Sensor",
		localPairing = true,
		["0"] = {
			["io:CO2IOSystemSensor"] = {
				type = 2,
				widget = "CO2Sensor",
				uiClass = "AirSensor",
				uiProfiles = ioDevices_Data[369],
				states = {
					["2415919106"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[153]
						}
					},
					["2146500638"] = ioDevices_Data[1],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[382],
				commands = ioDevices_Data[375]
			}
		}
	},
	["4295622656"] = { name = "CO Sensor",
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
							ioDevices_HighLevelStates[154]
						}
					},
					["2146500638"] = ioDevices_Data[1],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[382],
				commands = ioDevices_Data[375]
			}
		}
	},
	["4295688192"] = { name = "Light Outside Sensor",
		localPairing = true,
		["0"] = ioDevices_Data[376]
	},
	["4295753728"] = { name = "Cumulated Gas Consumption Sensor",
		localPairing = true,
		["1"] = {
			["io:GasHeaterConsumptionSensor"] = {
				type = 2,
				widget = "GasHeaterConsumptionSensor",
				uiClass = "GasSensor",
				uiProfiles = ioDevices_Data[383],
				states = ioDevices_Data[385],
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:PeopleCount"] = ioDevices_Attributes[15],
					["core:UsedForCooking"] = ioDevices_Attributes[16],
					["core:UsedForDHW"] = ioDevices_Attributes[17],
					["core:PowerSourceType"] = ioDevices_Attributes[9],
					["core:GasThermalEfficiency"] = ioDevices_Attributes[18],
					["core:MeasurementCategory"] = ioDevices_Attributes[19],
					["core:MeasuredValueType"] = ioDevices_Attributes[20]
				},
				commands = ioDevices_Data[388]
			}
		},
		["2"] = {
			["io:GasDHWConsumptionSensor"] = {
				type = 2,
				widget = "GasDHWConsumptionSensor",
				uiClass = "GasSensor",
				uiProfiles = ioDevices_Data[383],
				states = ioDevices_Data[385],
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:PeopleCount"] = ioDevices_Attributes[15],
					["core:UsedForCooking"] = ioDevices_Attributes[16],
					["core:UsedForDHW"] = ioDevices_Attributes[17],
					["core:PowerSourceType"] = ioDevices_Attributes[9],
					["core:GasThermalEfficiency"] = ioDevices_Attributes[18],
					["core:MeasurementCategory"] = ioDevices_Attributes[21],
					["core:MeasuredValueType"] = ioDevices_Attributes[20]
				},
				commands = ioDevices_Data[388]
			}
		}
	},
	["4295819264"] = { name = "Cumulated Water Consumption Sensor",
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
					["2146500638"] = ioDevices_Data[1],
					["2415919105"] = ioDevices_Data[384],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4],
					["83935248"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[157]
						}
					}
				},
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:PowerSourceType"] = ioDevices_Attributes[9],
					["core:MeasuredValueType"] = ioDevices_Attributes[20]
				},
				commands = ioDevices_Data[388]
			}
		}
	},
	["4295884800"] = { name = "Cumulated Thermal Energy Consumption Sensor",
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
					["2146500638"] = ioDevices_Data[1],
					["2415919105"] = ioDevices_Data[384],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4],
					["83935248"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[158]
						}
					}
				},
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:PowerSourceType"] = ioDevices_Attributes[9],
					["core:MeasuredValueType"] = ioDevices_Attributes[4]
				},
				commands = ioDevices_Data[388]
			}
		}
	},
	["4295950336"] = { name = "Cumulated Electrical Energy Consumption Sensor",
		localPairing = true,
		["0"] = {
			["io:CumulatedElectricalEnergyConsumptionIOSystemSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ioDevices_Data[356],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["83935248"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[159]
						}
					},
					["2415919105"] = ioDevices_Data[384],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[357],
				commands = ioDevices_Data[388]
			}
		}
	},
	["4295950348"] = { name = "Multi-Energy Consumption Sensor - GMDE (Atlantic)",
		localPairing = true,
		["1"] = {
			["io:TotalElectricalEnergyConsumptionIOSystemSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ioDevices_Data[356],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["83902467"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[160]
						}
					},
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:MeasurementCategory"] = ioDevices_Attributes[22],
					["core:PowerSourceType"] = ioDevices_Attributes[3],
					["core:MeasuredValueType"] = ioDevices_Attributes[4]
				},
				commands = {
					advancedRefresh = {
						prototype = "string(normal;advanced)",
						parameters = ioDevices_Data[11],
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
				uiProfiles = ioDevices_Data[356],
				states = {
					["83902466"] = {
						linkedHighLevelState = ioDevices_Data[389],
						linkedStateIds = ioDevices_Data[390]
					},
					["83902467"] = {
						linkedHighLevelState = ioDevices_Data[389],
						linkedStateIds = ioDevices_Data[391]
					},
					["2146500638"] = ioDevices_Data[1],
					["2415919105"] = ioDevices_Data[384],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:MeasurementCategory"] = ioDevices_Attributes[23],
					["core:PowerSourceType"] = ioDevices_Attributes[3],
					["core:MeasuredValueType"] = ioDevices_Attributes[4]
				},
				commands = ioDevices_Data[393]
			}
		},
		["3"] = {
			["io:DHWElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ioDevices_Data[356],
				states = {
					["83902466"] = {
						linkedHighLevelState = ioDevices_Data[394],
						linkedStateIds = ioDevices_Data[390]
					},
					["83902467"] = {
						linkedHighLevelState = ioDevices_Data[394],
						linkedStateIds = ioDevices_Data[391]
					},
					["2146500638"] = ioDevices_Data[1],
					["2415919105"] = ioDevices_Data[384],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:MeasurementCategory"] = ioDevices_Attributes[24],
					["core:PowerSourceType"] = ioDevices_Attributes[3],
					["core:MeasuredValueType"] = ioDevices_Attributes[4]
				},
				commands = ioDevices_Data[393]
			}
		},
		["4"] = {
			["io:AirConditioningElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ioDevices_Data[356],
				states = {
					["83902466"] = {
						linkedHighLevelState = ioDevices_Data[395],
						linkedStateIds = ioDevices_Data[390]
					},
					["83902467"] = {
						linkedHighLevelState = ioDevices_Data[395],
						linkedStateIds = ioDevices_Data[391]
					},
					["2146500638"] = ioDevices_Data[1],
					["2415919105"] = ioDevices_Data[384],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:MeasurementCategory"] = ioDevices_Attributes[25],
					["core:PowerSourceType"] = ioDevices_Attributes[3],
					["core:MeasuredValueType"] = ioDevices_Attributes[4]
				},
				commands = ioDevices_Data[393]
			}
		},
		["5"] = {
			["io:PlugsElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ioDevices_Data[356],
				states = {
					["83902466"] = {
						linkedHighLevelState = ioDevices_Data[396],
						linkedStateIds = ioDevices_Data[390]
					},
					["83902467"] = {
						linkedHighLevelState = ioDevices_Data[396],
						linkedStateIds = ioDevices_Data[391]
					},
					["2146500638"] = ioDevices_Data[1],
					["2415919105"] = ioDevices_Data[384],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:MeasurementCategory"] = ioDevices_Attributes[26],
					["core:PowerSourceType"] = ioDevices_Attributes[3],
					["core:MeasuredValueType"] = ioDevices_Attributes[4]
				},
				commands = ioDevices_Data[393]
			}
		},
		["6"] = {
			["io:OtherElectricalEnergyConsumptionSensor"] = {
				type = 2,
				widget = "CumulativeElectricPowerConsumptionSensor",
				uiClass = "ElectricitySensor",
				uiProfiles = ioDevices_Data[356],
				states = {
					["83902466"] = {
						linkedHighLevelState = ioDevices_Data[397],
						linkedStateIds = ioDevices_Data[390]
					},
					["83902467"] = {
						linkedHighLevelState = ioDevices_Data[397],
						linkedStateIds = ioDevices_Data[391]
					},
					["2146500638"] = ioDevices_Data[1],
					["2415919105"] = ioDevices_Data[384],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:MeasurementCategory"] = ioDevices_Attributes[27],
					["core:PowerSourceType"] = ioDevices_Attributes[3],
					["core:MeasuredValueType"] = ioDevices_Attributes[4]
				},
				commands = ioDevices_Data[393]
			}
		},
		["7"] = {
			["io:DomesticHotWaterTankComponent"] = {
				type = 1,
				widget = "DomesticHotWaterTank",
				uiClass = "WaterHeatingSystem",
				uiProfiles = ioDevices_Data[367],
				states = {
					["2147426304"] = ioDevices_Data[4],
					["201392128"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[196]
						}
					},
					["201326592"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[197]
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
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[278],
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
				uiProfiles = ioDevices_Data[367],
				states = {
					["83902467"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[198]
						}
					},
					["201457664"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[199]
						}
					},
					["83902464"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[200],
							ioDevices_HighLevelStates[201]
						}
					},
					["2147426304"] = ioDevices_Data[4]
				},
				commands = {
					setElectricalContractIntensity = {
						prototype = "integer[0;150]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[282],
						extraDefinition = {
							access = "w",
							parameterId = "201457664"
						}
					},
					advancedRefresh = ioDevices_Data[392]
				}
			}
		},
		["9"] = {
			["io:EnergyConsumptionSensorsConfigurationComponent"] = {
				type = 1,
				widget = "AtlanticMultiMeterElectricConfiguration",
				uiClass = "ElectricitySensor",
				uiProfiles = ioDevices_Data[367],
				states = {
					["2147426304"] = ioDevices_Data[4],
					["io:HeatPumpActiveState"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[202]
						}
					}
				},
				commands = {
					advancedRefresh = ioDevices_Data[392],
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
				uiProfiles = ioDevices_Data[367],
				states = {
					["201588736"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[203]
						}
					},
					["2147426304"] = ioDevices_Data[4],
					["201523200"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[204]
						}
					}
				},
				commands = {
					advancedRefresh = ioDevices_Data[392],
					setConfigurationServices = {
						prototype = "string(config1;config2)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[285],
						extraDefinition = {
							access = "w",
							parameterId = "201523200"
						}
					},
					setDerogationOnOffState = {
						prototype = "string(on;off)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[286],
						extraDefinition = {
							access = "w",
							parameterId = "201588736"
						}
					}
				}
			}
		}
	},
	["4303355904"] = { name = "Smoke sensor",
		localPairing = true,
		["0"] = {
			["io:SmokeIOSystemSensor"] = {
				type = 2,
				widget = "SmokeSensor",
				uiClass = "SmokeSensor",
				uiProfiles = ioDevices_Data[398],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["2415919110"] = ioDevices_Data[373],
					["2415919106"] = ioDevices_Data[399],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[400],
				commands = ioDevices_Data[375]
			}
		}
	},
	["4303355906"] = { name = "Smoke sensor - Fumix SOMFY",
		localPairing = true,
		["0"] = {
			["io:SomfySmokeIOSystemSensor"] = {
				type = 2,
				widget = "SmokeSensor",
				uiClass = "SmokeSensor",
				uiProfiles = ioDevices_Data[398],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["2415919110"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[148],
							ioDevices_HighLevelStates[208]
						}
					},
					["2415919106"] = ioDevices_Data[399],
					["2147426304"] = ioDevices_Data[4],
					["83902976"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[206],
							ioDevices_HighLevelStates[207]
						}
					}
				},
				attributes = ioDevices_Data[400],
				commands = {
					advancedRefresh = ioDevices_Data[374],
					checkEventTrigger = {
						prototype = "string(short;long)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[292],
						extraDefinition = {
							access = "w",
							parameterId = "33554650"
						}
					}
				}
			}
		}
	},
	["4303683584"] = { name = "Generic closure sensor",
		localPairing = true,
		["0"] = {
			["io:ContactIOSystemSensor"] = {
				type = 2,
				widget = "ContactSensor",
				uiClass = "ContactSensor",
				uiProfiles = ioDevices_Data[401],
				states = {
					["2415919106"] = ioDevices_Data[402],
					["2146500638"] = ioDevices_Data[1],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[400],
				commands = ioDevices_Data[375]
			}
		}
	},
	["4303683586"] = { name = "Closure sensor - DO SOMFY",
		localPairing = true,
		["0"] = {
			["io:SomfyContactIOSystemSensor"] = ioDevices_Data[404]
		}
	},
	["4303749120"] = { name = "Motion sensor",
		localPairing = true,
		["0"] = {
			["io:OccupancyIOSystemSensor"] = {
				type = 2,
				widget = "OccupancySensor",
				uiClass = "OccupancySensor",
				uiProfiles = ioDevices_Data[405],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["2415919106"] = ioDevices_Data[406],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[400],
				commands = ioDevices_Data[375]
			}
		}
	},
	["4303749122"] = { name = "Motion sensor - DM SOMFY",
		localPairing = true,
		["0"] = {
			["io:SomfyOccupancyIOSystemSensor"] = {
				type = 2,
				widget = "OccupancySensor",
				uiClass = "OccupancySensor",
				uiProfiles = ioDevices_Data[405],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["2415919106"] = ioDevices_Data[406],
					["2415919110"] = ioDevices_Data[403],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[400],
				commands = ioDevices_Data[375]
			}
		}
	},
	["4303880192"] = { name = "Rain sensor",
		localPairing = true,
		["0"] = {
			["io:RainIOSystemSensor"] = ioDevices_Data[407]
		}
	},
	["4303880194"] = { name = "Rain sensor - ondeis SOMFY",
		localPairing = true,
		["0"] = {
			["io:SomfyRainIOSystemSensor"] = ioDevices_Data[407]
		}
	},
	["4311613440"] = { name = "Multi Type Sensor (single channel per type)",
		localPairing = true,
		["1"] = {
			["io:WindowStateSensor"] = {
				type = 2,
				widget = "IntrusionEventSensor",
				uiClass = "ContactSensor",
				uiProfiles = ioDevices_Data[408],
				states = {
					["2146500638"] = ioDevices_Data[409],
					["2415919105"] = ioDevices_Data[384],
					["18183012483074"] = ioDevices_Data[410],
					["2147426304"] = ioDevices_Data[4],
					["2415919110"] = ioDevices_Data[373]
				},
				attributes = ioDevices_Data[411],
				commands = ioDevices_Data[412]
			}
		},
		["2"] = {
			["io:IntrusionSensor"] = {
				type = 2,
				widget = "IntrusionSensor",
				uiClass = "ContactSensor",
				uiProfiles = ioDevices_Data[413],
				states = {
					["2146500638"] = ioDevices_Data[409],
					["2415919110"] = ioDevices_Data[373],
					["2147426304"] = ioDevices_Data[4],
					["18152947712002"] = ioDevices_Data[414]
				},
				attributes = ioDevices_Data[415],
				commands = {
					advancedRefresh = ioDevices_Data[416]
				}
			}
		}
	},
	["1103823241218"] = { name = "IDEOI somfy multi type sensor (open close tilt window and Intrusion)",
		localPairing = true,
		["1"] = {
			["io:WindowStateSensor"] = {
				type = 2,
				widget = "IntrusionEventSensor",
				uiClass = "ContactSensor",
				uiProfiles = ioDevices_Data[408],
				states = {
					["2146500638"] = ioDevices_Data[409],
					["2415919105"] = ioDevices_Data[384],
					["18183012483074"] = ioDevices_Data[410],
					["2147426304"] = ioDevices_Data[4],
					["2415919110"] = ioDevices_Data[403]
				},
				attributes = ioDevices_Data[411],
				commands = ioDevices_Data[412]
			}
		},
		["2"] = ioDevices_Data[417]
	},
	["2203334868994"] = { name = "IDEOI somfy multi type sensor (sliding window and Intrusion)",
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
					["2146500638"] = ioDevices_Data[409],
					["2415919105"] = ioDevices_Data[384],
					["18183012483074"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[214],
							ioDevices_HighLevelStates[215]
						}
					},
					["2147426304"] = ioDevices_Data[4],
					["2415919110"] = ioDevices_Data[403]
				},
				attributes = ioDevices_Data[411],
				commands = ioDevices_Data[412]
			}
		},
		["2"] = ioDevices_Data[417]
	},
	["4311678976"] = { name = "Generic pulse sensor (virgin)",
		localPairing = true,
		["0"] = {
			["io:GenericPulseSensor"] = {
				type = 2,
				widget = "unknown",
				uiClass = "unknown",
				uiProfiles = ioDevices_Data[367],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["2147426304"] = ioDevices_Data[4]
				}
			}
		}
	},
	["8656978944"] = { name = "Stack Master (V2)",
		localPairing = true,
		["0"] = {
			["io:StackComponent"] = {
				type = 5,
				widget = "IOStack",
				uiClass = "ProtocolGateway",
				uiProfiles = ioDevices_Data[367],
				commands = {
					advancedSomfyDiscover = {
						prototype = "string(dpcActuators;unsetActuators)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[307],
						extraDefinition = ioDevices_Data[418]
					},
					discoverSomfyUnsetActuators = {
						converter = ioDevices_Converter[308],
						extraDefinition = ioDevices_Data[418]
					},
					discoverActuators = {
						prototype = "string(alreadyInTheNetwork;inConfigurationState;all)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[309],
						extraDefinition = ioDevices_Data[418]
					},
					discoverSensors = {
						prototype = "string(inConfigurationState;all)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[310],
						extraDefinition = {
							access = "w",
							parameterId = "2146566150"
						}
					},
					discover1WayController = {
						prototype = "*integer,*string(keygo;izymo;public default;v500;default;keypad)",
						parameters = {
							ioDevices_Data[206],
							ioDevices_Data[7]
						},
						converter = ioDevices_Converter[311],
						extraDefinition = {
							access = "w",
							parameterId = "2146566151"
						}
					},
					joinNetwork = {
						converter = ioDevices_Converter[312],
						extraDefinition = {
							access = "w",
							parameterId = "2146566148"
						}
					},
					resetNetworkSecurity = {
						converter = ioDevices_Converter[313],
						extraDefinition = {
							access = "w",
							parameterId = "2146500620"
						}
					},
					shareNetwork = {
						converter = ioDevices_Converter[314],
						extraDefinition = {
							access = "w",
							parameterId = "2146566147"
						}
					}
				}
			}
		}
	},
	["21475622912"] = { name = "Beacon",
		localPairing = true,
		["0"] = {
			["io:BeaconIOComponent"] = {
				type = 6,
				widget = "Repeater",
				uiClass = "NetworkComponent",
				uiProfiles = ioDevices_Data[367],
				states = {
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = {
					["core:DefaultName"] = ioDevices_Attributes[34]
				}
			}
		}
	},
	["25836847104"] = { name = "Remote Controller (1W)",
		localPairing = true,
		["0"] = {
			["io:IORemoteController"] = {
				type = 4,
				widget = "RemoteControllerOneWay",
				uiClass = "RemoteController",
				uiProfiles = ioDevices_Data[367],
				states = {
					["33554442"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[219]
						}
					}
				},
				attributes = ioDevices_Data[419]
			}
		}
	},
	["25836847616"] = { name = "Keygo Remote Controller",
		localPairing = true,
		["0"] = {
			["io:KeygoController"] = ioDevices_Data[420]
		}
	},
	["25836847872"] = { name = "Izymo Remote Controller",
		localPairing = true,
		["0"] = {
			["io:IzymoController"] = {
				type = 4,
				widget = "RemoteControllerOneWay",
				uiClass = "RemoteController",
				uiProfiles = ioDevices_Data[367],
				states = {
					["33554443"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[221]
						}
					}
				},
				attributes = ioDevices_Data[419]
			}
		}
	},
	["1099511758850"] = { name = "Roller Shutter With Low Speed Management SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[424]
	},
	["1099511759106"] = { name = "GradHermetic SOMFY",
		localPairing = true,
		["0"] = {
			["io:GradHermeticIOComponent"] = ioDevices_Data[85]
		}
	},
	["1099511824386"] = { name = "Pergola Screen SOMFY",
		localPairing = true,
		["0"] = {
			["io:PergolaScreenIOComponent"] = {
				type = 1,
				widget = "PositionableAndStretchablePergolaScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[425],
				states = {
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[222],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12]
						}
					},
					["2146500638"] = ioDevices_Data[1],
					["16832512"] = ioDevices_Data[69],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[70],
					["2147426304"] = ioDevices_Data[4],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[59],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					runManufacturerSettingsCommand = ioDevices_Data[62],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					setClosureOrTightPosition = ioDevices_Data[426],
					setMemorized1Position = ioDevices_Data[47],
					setName = ioDevices_Data[20],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setSecuredPosition = ioDevices_Data[53],
					setTightPosition = ioDevices_Data[236],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26],
					sendIOKey = ioDevices_Data[65]
				}
			}
		}
	},
	["1099511889922"] = { name = "Window Opener Uno",
		localPairing = true,
		["0"] = {
			["io:WindowOpenerUnoIOComponent"] = {
				type = 1,
				widget = "PositionableWindowUno",
				uiClass = "Window",
				uiProfiles = ioDevices_Data[427],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["2147426304"] = ioDevices_Data[4],
					["16830720"] = ioDevices_Data[429],
					["65537"] = {
						linkedHighLevelState = ioDevices_Data[428],
						linkedStateIds = {
							"120833",
							"120834",
							"120835",
							"120842",
							"16830720"
						}
					},
					["120842"] = ioDevices_Data[430],
					["120833"] = ioDevices_Data[431],
					["120834"] = ioDevices_Data[432],
					["120835"] = ioDevices_Data[433],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[154]
			}
		}
	},
	["1099511970306"] = { name = "Discrete Garage Door Opener SOMFY (Dexxo Smart io 800)",
		localPairing = true,
		["0"] = ioDevices_Data[438]
	},
	["1099512020994"] = { name = "Dimmable Light - Somfy  - Light Receiver 2017",
		localPairing = true,
		["0"] = ioDevices_Data[115]
	},
	["1099512021250"] = { name = "Dimmable RGB Light Somfy - Light Receiver 2017",
		localPairing = true,
		["0"] = ioDevices_Data[127]
	},
	["1099512021506"] = { name = "Tunable White Receiver - Light Receiver 2017",
		localPairing = true,
		["0"] = ioDevices_Data[132]
	},
	["1099512035842"] = { name = "On/Off Light - Somfy  - Light Receiver 2017",
		localPairing = true,
		["0"] = ioDevices_Data[140]
	},
	["1099512101378"] = { name = "Discrete Gate Opener SOMFY (Axovia 3S)",
		localPairing = true,
		["0"] = ioDevices_Data[152]
	},
	["1099512217602"] = { name = "Door Lock With Unknown Position",
		localPairing = true,
		["0"] = {
			["io:LockUnlockDoorLockWithUnknownPositionIOComponent"] = {
				type = 1,
				widget = "LockUnlockDoorLockWithUnknownPosition",
				uiClass = "DoorLock",
				uiProfiles = ioDevices_Data[156],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[225]
						}
					},
					["1"] = ioDevices_Data[3],
					["65556"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[226]
						}
					},
					["2147426304"] = ioDevices_Data[4],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[59],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					getOpenClose = ioDevices_Data[158],
					identify = ioDevices_Data[15],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					runManufacturerSettingsCommand = ioDevices_Data[62],
					pairOneWayController = ioDevices_Data[17],
					refreshLockedUnlocked = ioDevices_Data[158],
					setLockedUnlocked = {
						prototype = "string(locked;unlocked)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[327],
						extraDefinition = ioDevices_Data[18]
					},
					close = ioDevices_Data[439],
					lock = ioDevices_Data[439],
					open = ioDevices_Data[440],
					setOpenClosed = {
						prototype = "string(open;closed)",
						parameters = ioDevices_Data[11],
						aliasConverter = ioDevices_Converter[328],
						converter = ioDevices_Converter[327],
						extraDefinition = ioDevices_Data[18]
					},
					unlock = ioDevices_Data[440],
					setName = ioDevices_Data[20],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26],
					sendIOKey = ioDevices_Data[65]
				}
			}
		}
	},
	["1099512283138"] = { name = "Vertical Blind Uno",
		localPairing = true,
		["0"] = {
			["io:VerticalInteriorBlindUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "Screen",
				uiProfiles = ioDevices_Data[441],
				states = ioDevices_Data[443],
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[168]
			}
		}
	},
	["1099512610818"] = { name = "Cyclic Standard Receiver SOMFY",
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
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["2147426304"] = ioDevices_Data[4],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[59],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					cycle = {
						converter = ioDevices_Converter[329],
						extraDefinition = {
							access = "w",
							parameterId = "65786"
						}
					},
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					runManufacturerSettingsCommand = ioDevices_Data[62],
					pairOneWayController = ioDevices_Data[17],
					setName = ioDevices_Data[20],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26],
					sendIOKey = ioDevices_Data[65]
				}
			}
		}
	},
	["1099512611330"] = { name = "Switch On/Off - micromodule SOMFY",
		localPairing = true,
		["0"] = {
			["io:SwitchMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "TimedOnOff",
				uiClass = "OnOff",
				uiProfiles = ioDevices_Data[133],
				states = ioDevices_Data[192],
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[198]
			}
		}
	},
	["1099512676354"] = { name = "Horizontal Awning Uno",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningUnoIOComponent"] = ioDevices_Data[445]
		}
	},
	["1099512676610"] = { name = "Pergola Warema SOMFY",
		localPairing = true,
		["0"] = {
			["io:PergolaHorizontalUnoIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwningUno",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[446],
				states = ioDevices_Data[443],
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[202]
			}
		}
	},
	["1099512741888"] = { name = "Exterior Venetian Blind with WP",
		localPairing = true,
		["0"] = ioDevices_Data[447]
	},
	["1099512872962"] = { name = "Curtain track Uno",
		localPairing = true,
		["0"] = {
			["io:CurtainTrackUnoIOComponent"] = {
				type = 1,
				widget = "CurtainTrackUno",
				uiClass = "Curtain",
				uiProfiles = ioDevices_Data[448],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["1"] = ioDevices_Data[3],
					["2147426304"] = ioDevices_Data[4],
					["16832512"] = ioDevices_Data[31],
					["16830720"] = ioDevices_Data[35],
					["65537"] = ioDevices_Data[442],
					["16832522"] = ioDevices_Data[75],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[59],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					runManufacturerSettingsCommand = ioDevices_Data[62],
					pairOneWayController = ioDevices_Data[17],
					setClosure = ioDevices_Data[449],
					close = ioDevices_Data[450],
					open = ioDevices_Data[451],
					my = ioDevices_Data[452],
					setName = ioDevices_Data[20],
					setMemorized1Position = ioDevices_Data[47],
					refreshMemorized1Position = ioDevices_Data[37],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26],
					sendIOKey = ioDevices_Data[65]
				}
			}
		}
	},
	["1099513004034"] = { name = "Heating Receiver io Dimming SOMFY",
		localPairing = true,
		["0"] = {
			["io:SimpleExteriorHeatingIOComponent"] = ioDevices_Data[227]
		}
	},
	["1099513018882"] = { name = "Heating Receiver io On Off SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[231]
	},
	["1099513397506"] = { name = "Sliding Window with lock SOMFY - Air",
		localPairing = true,
		["0"] = ioDevices_Data[251]
	},
	["1099513528322"] = { name = "Simple Bioclimatic Pergola Somfy",
		localPairing = true,
		["0"] = ioDevices_Data[453]
	},
	["2199025156098"] = { name = "Pergola Louver io",
		localPairing = true,
		["0"] = ioDevices_Data[453]
	},
	["1099514970124"] = { name = "Domestic hot water production (Atlantic)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionIOComponent"] = {
				type = 1,
				widget = "DomesticHotWaterProduction",
				uiClass = "WaterHeatingSystem",
				uiProfiles = ioDevices_Data[277],
				states = {
					["201326593"] = ioDevices_Data[278],
					["16832527"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[227],
							ioDevices_HighLevelStates[232]
						},
						linkedStateIds = ioDevices_Data[454]
					},
					["2146500638"] = ioDevices_Data[1],
					["16832530"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[228],
							ioDevices_HighLevelStates[232]
						},
						linkedStateIds = ioDevices_Data[455]
					},
					["16832534"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[229],
							ioDevices_HighLevelStates[232]
						},
						linkedStateIds = ioDevices_Data[456]
					},
					["16832531"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[230],
							ioDevices_HighLevelStates[232]
						},
						linkedStateIds = ioDevices_Data[457]
					},
					["201328385"] = ioDevices_Data[288],
					["1"] = ioDevices_Data[3],
					["65553"] = ioDevices_Data[292],
					["16832522"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[231],
							ioDevices_HighLevelStates[232]
						},
						linkedStateIds = ioDevices_Data[458]
					},
					["2147426304"] = ioDevices_Data[4],
					["16830720"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[232]
						},
						linkedStateIds = ioDevices_Data[459]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[233]
						}
					},
					["201326849"] = ioDevices_Data[295],
					["201327873"] = ioDevices_Data[297],
					["201328641"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[234]
						}
					},
					["201327105"] = ioDevices_Data[300],
					["201328129"] = ioDevices_Data[301],
					["201327361"] = ioDevices_Data[302],
					["65552"] = ioDevices_Data[307],
					["65547"] = ioDevices_Data[313]
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					refreshAwayModeDuration = ioDevices_Data[316],
					refreshBoostModeDuration = ioDevices_Data[318],
					refreshCurrentOperatingMode = ioDevices_Data[233],
					refreshDHWCapacity = ioDevices_Data[319],
					refreshDHWError = ioDevices_Data[320],
					refreshDHWMode = ioDevices_Data[321],
					refreshManufacturerName = ioDevices_Data[325],
					refreshOperatingModeCapabilities = ioDevices_Data[327],
					refreshOperatingTime = ioDevices_Data[329],
					refreshRateManagement = ioDevices_Data[331],
					refreshTargetTemperature = ioDevices_Data[158],
					refreshWaterConsumption = ioDevices_Data[333],
					setAwayModeDuration = ioDevices_Data[335],
					setBoostModeDuration = ioDevices_Data[337],
					setComfortTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[334],
						extraDefinition = ioDevices_Data[183]
					},
					setCurrentOperatingMode = ioDevices_Data[338],
					setDHWMode = ioDevices_Data[339],
					setEcoTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[334],
						extraDefinition = ioDevices_Data[234]
					},
					setFrostProtectionTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[334],
						extraDefinition = ioDevices_Data[344]
					},
					setHaltedTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[334],
						extraDefinition = ioDevices_Data[346]
					},
					setName = ioDevices_Data[20],
					setRateManagement = ioDevices_Data[351],
					setTargetTemperature = {
						prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[335],
						extraDefinition = ioDevices_Data[18]
					},
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					wink = ioDevices_Data[26]
				}
			}
		},
		["2"] = ioDevices_Data[358]
	},
	["1103806726146"] = { name = "Thermostatic valve SOMFY",
		localPairing = true,
		["1"] = {
			["io:HeatingValveIOComponent"] = {
				type = 1,
				widget = "ValveHeatingTemperatureInterface",
				uiClass = "HeatingSystem",
				uiProfiles = ioDevices_Data[460],
				states = {
					["84059684"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[235],
							ioDevices_HighLevelStates[243],
							ioDevices_HighLevelStates[244],
							ioDevices_HighLevelStates[246],
							ioDevices_HighLevelStates[251],
							ioDevices_HighLevelStates[255],
							ioDevices_HighLevelStates[260]
						}
					},
					["84059682"] = ioDevices_Data[461],
					["84059685"] = ioDevices_Data[462],
					["84059681"] = ioDevices_Data[463],
					["2146500638"] = ioDevices_Data[1],
					["2415919105"] = ioDevices_Data[384],
					["84059680"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[245],
							ioDevices_HighLevelStates[247],
							ioDevices_HighLevelStates[249],
							ioDevices_HighLevelStates[250],
							ioDevices_HighLevelStates[256]
						}
					},
					["2147426304"] = ioDevices_Data[4],
					["84059686"] = ioDevices_Data[464],
					["84059687"] = ioDevices_Data[465]
				},
				commands = {
					advancedRefresh = ioDevices_Data[374],
					delayedStopIdentify = ioDevices_Data[13],
					exitDerogation = ioDevices_Data[467],
					getName = ioDevices_Data[386],
					identify = ioDevices_Data[15],
					setAllModeTemperatures = ioDevices_Data[468],
					setDerogation = ioDevices_Data[469],
					setName = ioDevices_Data[387],
					setTimeProgramById = ioDevices_Data[470],
					setValveSettings = {
						prototype = "object",
						parameters = ioDevices_Data[11],
						rawStates = {},
						converter = ioDevices_Converter[372],
						extraDefinition = ioDevices_Data[195]
					},
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26]
				}
			}
		},
		["2"] = ioDevices_Data[473]
	},
	["1103815311362"] = { name = "Closure sensor - Slim DO SOMFY",
		localPairing = true,
		["0"] = {
			["io:SomfyBasicContactIOSystemSensor"] = ioDevices_Data[404]
		}
	},
	["2199023386626"] = { name = "Roller Shutter With Low Speed Management SOMFY (WT)",
		localPairing = true,
		["0"] = ioDevices_Data[424]
	},
	["2199023386882"] = { name = "VR Holla SOMFY",
		localPairing = true,
		["0"] = {
			["io:VRHollaIOComponent"] = {
				type = 1,
				widget = "PositionableOrProgressiveOrientableRollerShutter",
				uiClass = "AdjustableSlatsRollerShutter",
				uiProfiles = ioDevices_Data[474],
				states = ioDevices_Data[76],
				attributes = ioDevices_Data[59],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					runManufacturerSettingsCommand = ioDevices_Data[62],
					pairOneWayController = ioDevices_Data[17],
					setClosureAndOrientation = ioDevices_Data[475],
					setClosureOrOrientation = ioDevices_Data[77],
					setClosureOrRockerPosition = ioDevices_Data[78],
					close = ioDevices_Data[79],
					down = ioDevices_Data[79],
					open = ioDevices_Data[80],
					setClosure = ioDevices_Data[81],
					setDeployment = ioDevices_Data[81],
					setRockerPosition = ioDevices_Data[82],
					up = ioDevices_Data[80],
					setName = ioDevices_Data[20],
					setOrientation = ioDevices_Data[83],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[84],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					unpairOneWayController = ioDevices_Data[24],
					setConfigState = ioDevices_Data[25],
					wink = ioDevices_Data[26],
					sendIOKey = ioDevices_Data[65]
				}
			}
		}
	},
	["2199023452162"] = { name = "Vertical Exterior Awning Uno",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[476],
				states = {
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[20],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12],
							ioDevices_HighLevelStates[10]
						},
						linkedStateIds = ioDevices_Data[29]
					},
					["2146500638"] = ioDevices_Data[1],
					["16832512"] = ioDevices_Data[31],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[33],
					["2147426304"] = ioDevices_Data[4],
					["16830720"] = ioDevices_Data[35],
					["2"] = ioDevices_Data[56],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[90]
			}
		}
	},
	["2199023598082"] = { name = "Discrete Garage Door Opener SOMFY (Rollixo IO)",
		localPairing = true,
		["0"] = ioDevices_Data[100]
	},
	["2199023729154"] = { name = "Discrete Gate Opener SOMFY (Axovia 200 3S)",
		localPairing = true,
		["0"] = ioDevices_Data[152]
	},
	["2199023910914"] = { name = "Sonesse 40 SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[169]
	},
	["2199024304130"] = { name = "Awning Receiver Uno SOMFY",
		localPairing = true,
		["0"] = {
			["io:AwningReceiverUnoIOComponent"] = ioDevices_Data[445]
		}
	},
	["2199024304386"] = { name = "Pergola Rail Guided Awning SOMFY - Pergola CQFD",
		localPairing = true,
		["0"] = ioDevices_Data[205]
	},
	["3298535932162"] = { name = "Pergola RGS 50/60 SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[205]
	},
	["2199024369666"] = { name = "Exterior Venetian Blind Uno",
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
					["2146500638"] = ioDevices_Data[1],
					["16832512"] = ioDevices_Data[31],
					["17029120"] = ioDevices_Data[211],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[33],
					["2147426304"] = ioDevices_Data[4],
					["16830720"] = ioDevices_Data[35],
					["65537"] = ioDevices_Data[442],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[217]
			}
		}
	},
	["2199026597900"] = { name = "Domestic hot water production (Atlantic V3)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV3IOComponent"] = {
				type = 1,
				widget = "DomesticHotWaterProduction",
				uiClass = "WaterHeatingSystem",
				uiProfiles = ioDevices_Data[277],
				states = {
					["201326593"] = ioDevices_Data[278],
					["16832527"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[265],
							ioDevices_HighLevelStates[270]
						},
						linkedStateIds = ioDevices_Data[454]
					},
					["201330433"] = ioDevices_Data[284],
					["2146500638"] = ioDevices_Data[1],
					["16832530"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[266],
							ioDevices_HighLevelStates[270]
						},
						linkedStateIds = ioDevices_Data[455]
					},
					["16832534"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[267],
							ioDevices_HighLevelStates[270]
						},
						linkedStateIds = ioDevices_Data[456]
					},
					["16832531"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[268],
							ioDevices_HighLevelStates[270]
						},
						linkedStateIds = ioDevices_Data[457]
					},
					["201328385"] = ioDevices_Data[288],
					["1"] = ioDevices_Data[3],
					["65553"] = ioDevices_Data[292],
					["16832522"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[269],
							ioDevices_HighLevelStates[270]
						},
						linkedStateIds = ioDevices_Data[458]
					},
					["2147426304"] = ioDevices_Data[4],
					["16830720"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[270]
						},
						linkedStateIds = ioDevices_Data[459]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[271]
						}
					},
					["201326849"] = ioDevices_Data[295],
					["201329665"] = ioDevices_Data[296],
					["201327873"] = ioDevices_Data[297],
					["201330945"] = ioDevices_Data[298],
					["201328641"] = ioDevices_Data[299],
					["201327105"] = ioDevices_Data[300],
					["201328129"] = ioDevices_Data[301],
					["201327361"] = ioDevices_Data[302],
					["201330177"] = ioDevices_Data[303],
					["201331457"] = ioDevices_Data[304],
					["201330689"] = ioDevices_Data[305],
					["65552"] = ioDevices_Data[307],
					["201329153"] = ioDevices_Data[308],
					["201329409"] = ioDevices_Data[312],
					["65547"] = ioDevices_Data[313],
					["201331201"] = ioDevices_Data[314]
				},
				attributes = ioDevices_Data[5],
				commands = {
					advancedRefresh = ioDevices_Data[10],
					delayedStopIdentify = ioDevices_Data[13],
					getName = ioDevices_Data[14],
					identify = ioDevices_Data[15],
					pairOneWayController = ioDevices_Data[17],
					refreshAntiLegionellosis = ioDevices_Data[315],
					refreshAwayModeDuration = ioDevices_Data[316],
					refreshBoilerInstallationOption = ioDevices_Data[317],
					refreshBoostModeDuration = ioDevices_Data[318],
					refreshCurrentOperatingMode = ioDevices_Data[233],
					refreshDHWCapacity = ioDevices_Data[319],
					refreshDHWError = ioDevices_Data[320],
					refreshDHWMode = ioDevices_Data[321],
					refreshElectricalExtraManagement = ioDevices_Data[322],
					refreshExtractionOption = ioDevices_Data[323],
					refreshInstallation = ioDevices_Data[324],
					refreshManufacturerName = ioDevices_Data[325],
					refreshOperatingModeCapabilities = ioDevices_Data[327],
					refreshOperatingRange = ioDevices_Data[328],
					refreshOperatingTime = ioDevices_Data[329],
					refreshProgrammingSlots = ioDevices_Data[330],
					refreshRateManagement = ioDevices_Data[331],
					refreshSmartGridOption = ioDevices_Data[332],
					refreshTargetTemperature = ioDevices_Data[158],
					refreshWaterConsumption = ioDevices_Data[333],
					setAntiLegionellosis = ioDevices_Data[334],
					setAwayModeDuration = ioDevices_Data[335],
					setBoilerInstallationOption = ioDevices_Data[336],
					setBoostModeDuration = ioDevices_Data[337],
					setComfortTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[378],
						extraDefinition = ioDevices_Data[183]
					},
					setCurrentOperatingMode = ioDevices_Data[338],
					setDHWMode = ioDevices_Data[339],
					setDateTime = ioDevices_Data[340],
					setEcoTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[378],
						extraDefinition = ioDevices_Data[234]
					},
					setElectricalExtraManagement = ioDevices_Data[342],
					setExtractionOption = ioDevices_Data[343],
					setFrostProtectionTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[378],
						extraDefinition = ioDevices_Data[344]
					},
					setHaltedTargetTemperature = {
						prototype = "float[0.0;100.0]",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[378],
						extraDefinition = ioDevices_Data[346]
					},
					setInstallation = ioDevices_Data[348],
					setName = ioDevices_Data[20],
					setOperatingRange = ioDevices_Data[349],
					setProgrammingSlots = ioDevices_Data[350],
					setRateManagement = ioDevices_Data[351],
					setSmartGridOption = ioDevices_Data[352],
					setTargetTemperature = {
						prototype = "float[0.0;100.0]|string(eco;secured;comfort;halted;antifrost)",
						parameters = ioDevices_Data[11],
						converter = ioDevices_Converter[379],
						extraDefinition = ioDevices_Data[18]
					},
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					unpairAllOneWayControllers = ioDevices_Data[23],
					unpairOneWayController = ioDevices_Data[24],
					wink = ioDevices_Data[26]
				}
			}
		},
		["2"] = ioDevices_Data[358]
	},
	["2203318353922"] = { name = "Thermostat SOMFY",
		localPairing = true,
		["1"] = {
			["io:HeatingThermostatIOComponent"] = {
				type = 1,
				widget = "ThermostatHeatingTemperatureInterface",
				uiClass = "HeatingSystem",
				uiProfiles = ioDevices_Data[460],
				states = {
					["84059684"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[235],
							ioDevices_HighLevelStates[272],
							ioDevices_HighLevelStates[243],
							ioDevices_HighLevelStates[244],
							ioDevices_HighLevelStates[246],
							ioDevices_HighLevelStates[273],
							ioDevices_HighLevelStates[274],
							ioDevices_HighLevelStates[277],
							ioDevices_HighLevelStates[278],
							ioDevices_HighLevelStates[260]
						}
					},
					["84059682"] = ioDevices_Data[461],
					["84059685"] = ioDevices_Data[462],
					["84059681"] = ioDevices_Data[463],
					["2146500638"] = ioDevices_Data[1],
					["2415919105"] = ioDevices_Data[384],
					["84059680"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[245],
							ioDevices_HighLevelStates[247],
							ioDevices_HighLevelStates[275],
							ioDevices_HighLevelStates[276],
							ioDevices_HighLevelStates[256]
						}
					},
					["2147426304"] = ioDevices_Data[4],
					["84059686"] = ioDevices_Data[464],
					["84059687"] = ioDevices_Data[465]
				},
				commands = {
					advancedRefresh = ioDevices_Data[374],
					delayedStopIdentify = ioDevices_Data[13],
					exitDerogation = ioDevices_Data[467],
					getName = ioDevices_Data[386],
					identify = ioDevices_Data[15],
					setAllModeTemperatures = ioDevices_Data[468],
					setDerogation = ioDevices_Data[469],
					setName = ioDevices_Data[387],
					setThermostatSettings = {
						prototype = "object",
						parameters = ioDevices_Data[11],
						rawStates = {},
						converter = ioDevices_Converter[386],
						extraDefinition = ioDevices_Data[195]
					},
					setTimeProgramById = ioDevices_Data[470],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26]
				}
			}
		},
		["2"] = ioDevices_Data[473],
		["3"] = {
			["io:RelativeHumidityIOSystemSensor"] = {
				type = 2,
				widget = "RelativeHumiditySensor",
				uiClass = "HumiditySensor",
				uiProfiles = ioDevices_Data[379],
				states = {
					["2146500638"] = ioDevices_Data[1],
					["84059680"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[279]
						}
					},
					["84059682"] = ioDevices_Data[471],
					["2147426304"] = ioDevices_Data[4]
				},
				attributes = ioDevices_Data[380],
				commands = ioDevices_Data[472]
			}
		}
	},
	["3298535014402"] = { name = "Roller Shutter Uno SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[478]
	},
	["3298535079938"] = { name = "Pergola Side Screen SOMFY",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = {
					["65537"] = ioDevices_Data[480],
					["2146500638"] = ioDevices_Data[1],
					["16832512"] = ioDevices_Data[31],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[33],
					["2147426304"] = ioDevices_Data[4],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57],
					["65557"] = ioDevices_Data[36],
					["16830720"] = ioDevices_Data[35]
				},
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[90]
			}
		}
	},
	["3298535225858"] = { name = "Discrete Garage Door Opener SOMFY (Metro Smart 800 IO)",
		localPairing = true,
		["0"] = ioDevices_Data[438]
	},
	["3298535356930"] = { name = "Discrete Gate Opener SOMFY (Ixengo 3S)",
		localPairing = true,
		["0"] = ioDevices_Data[152]
	},
	["3298535538690"] = { name = "Actuo 40 SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[169]
	},
	["3298535931906"] = { name = "Horizontal Awning Somfy - Sunea Sunilus CQFD",
		localPairing = true,
		["0"] = ioDevices_Data[203]
	},
	["3298535997442"] = { name = "Exterior Venetian Blind J4 with WP2",
		localPairing = true,
		["0"] = ioDevices_Data[482]
	},
	["3298538225676"] = { name = "Domestic hot water production (Atlantic V2 - AEX)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_AEX_IOComponent"] = ioDevices_Data[355]
		},
		["2"] = ioDevices_Data[358]
	},
	["4398046642178"] = { name = "Roller Shutter Receiver Uno SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[478]
	},
	["4398046707714"] = { name = "Drop Arm Awning SOMFY",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = {
					["65537"] = ioDevices_Data[484],
					["2146500638"] = ioDevices_Data[1],
					["16832512"] = ioDevices_Data[31],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[33],
					["2147426304"] = ioDevices_Data[4],
					["2"] = ioDevices_Data[56],
					["65557"] = ioDevices_Data[36],
					["16830720"] = ioDevices_Data[35],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[90]
			}
		}
	},
	["4398046853634"] = { name = "Discrete Garage Door Opener SOMFY (Metro Smart 1000 IO)",
		localPairing = true,
		["0"] = ioDevices_Data[438]
	},
	["4398046984706"] = { name = "Discrete Gate Opener SOMFY (Invisio 3S)",
		localPairing = true,
		["0"] = ioDevices_Data[152]
	},
	["4398047166466"] = { name = "Optuo 40 SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[169]
	},
	["4398047559682"] = { name = "Horizontal Awning Somfy - Sunea Screen 40",
		localPairing = true,
		["0"] = ioDevices_Data[203]
	},
	["4398049853452"] = { name = "Domestic hot water production (Atlantic V2 - MURAL)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_MURAL_IOComponent"] = ioDevices_Data[486]
		},
		["2"] = ioDevices_Data[358]
	},
	["5497558269954"] = { name = "Roller Shutter SOMFY - Altus RS",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["5497558335490"] = { name = "Awning Valance SOMFY",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[89],
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[90]
			}
		}
	},
	["5497558481410"] = { name = "Discrete Garage Door Opener SOMFY (Dexxo Smart io 1000)",
		localPairing = true,
		["0"] = ioDevices_Data[438]
	},
	["5497558612482"] = { name = "Discrete Gate Opener SOMFY (Elixo 3S)",
		localPairing = true,
		["0"] = ioDevices_Data[152]
	},
	["5497558794242"] = { name = "Sonesse Wirefree",
		localPairing = true,
		["0"] = {
			["io:VerticalInteriorBlindWithBatterySomfyIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "Screen",
				uiProfiles = ioDevices_Data[167],
				states = ioDevices_Data[488],
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[168]
			}
		}
	},
	["5497559187458"] = { name = "Horizontal Awning Somfy - Sunea 50 CSI",
		localPairing = true,
		["0"] = ioDevices_Data[203]
	},
	["5497561481228"] = { name = "Domestic hot water production (Atlantic V2 - SPLIT)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_SPLIT_IOComponent"] = ioDevices_Data[355]
		},
		["2"] = ioDevices_Data[358]
	},
	["6597069897730"] = { name = "Roller Shutter SOMFY - Oximo 40",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["14293651292162"] = { name = "Roller Shutter SOMFY with battery",
		localPairing = true,
		["0"] = {
			["io:RollerShutterWithBatterySomfyIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[488],
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[66]
			}
		}
	},
	["6597069963266"] = { name = "Screen Receiver Uno SOMFY",
		localPairing = true,
		["0"] = {
			["io:ScreenReceiverUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[489],
				states = ioDevices_Data[443],
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[90]
			}
		}
	},
	["6597070109186"] = { name = "Discrete Garage Door Opener SOMFY (Rollixo Smart IO)",
		localPairing = true,
		["0"] = ioDevices_Data[100]
	},
	["6597070240258"] = { name = "Discrete Gate Opener SOMFY (Elixo Smart)",
		localPairing = true,
		["0"] = ioDevices_Data[490]
	},
	["6597073109004"] = { name = "Domestic hot water production (Atlantic V2 - V2 TEC5)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_TEC5_IOComponent"] = ioDevices_Data[355]
		},
		["2"] = ioDevices_Data[358]
	},
	["7696581525506"] = { name = "Roller Shutter SOMFY - Awmio - Oximo CQFD",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["15393162919938"] = { name = "Roller Shutter SOMFY - Awmio - Oximo CQFD Redesign",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["7696581591042"] = { name = "Vertical Exterior Awning SOMFY - AWMIO",
		localPairing = true,
		["0"] = ioDevices_Data[91]
	},
	["7696581868034"] = { name = "Discrete Gate Opener SOMFY (Roly Smart IO)",
		localPairing = true,
		["0"] = ioDevices_Data[490]
	},
	["7696584736780"] = { name = "Domestic hot water production (Atlantic V2 - CE FLAT C2)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_CE_FLAT_C2_IOComponent"] = ioDevices_Data[493]
		},
		["2"] = ioDevices_Data[358]
	},
	["8796093153282"] = { name = "Roller Shutter SOMFY - Short Motor IO",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["8796093218818"] = { name = "Vertical Exterior Awning SOMFY - Sunea Sunilus",
		localPairing = true,
		["0"] = ioDevices_Data[91]
	},
	["8796096364556"] = { name = "Domestic hot water production (Atlantic V2 - CE S4)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_CE_S4_IOComponent"] = ioDevices_Data[493]
		},
		["2"] = ioDevices_Data[358]
	},
	["9895604781058"] = { name = "Roller Shutter SOMFY - MicroModule IO",
		localPairing = true,
		["0"] = {
			["io:MicroModuleRollerShutterSomfyIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = {
					["65537"] = ioDevices_Data[68],
					["2146500638"] = ioDevices_Data[1],
					["16832512"] = ioDevices_Data[69],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[70],
					["2147426304"] = ioDevices_Data[4],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57],
					["84059655"] = ioDevices_Data[191]
				},
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[66]
			}
		}
	},
	["9895604846594"] = { name = "Vertical Exterior Awning SOMFY - Slim Receiver",
		localPairing = true,
		["0"] = ioDevices_Data[91]
	},
	["9895607992332"] = { name = "Domestic hot water production (Atlantic V2 - CETHI V4)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_CETHI_V4_IOComponent"] = ioDevices_Data[486]
		},
		["2"] = ioDevices_Data[358]
	},
	["10995116408834"] = { name = "Roller Shutter With Low Speed Management SOMFY (AIR)",
		localPairing = true,
		["0"] = ioDevices_Data[424]
	},
	["10995116474370"] = { name = "Vertical Exterior Awning SOMFY - Universal Screen",
		localPairing = true,
		["0"] = ioDevices_Data[91]
	},
	["10995119620108"] = { name = "Domestic hot water production (Atlantic V2 - CV4E)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_CV4E_IOComponent"] = ioDevices_Data[486]
		},
		["2"] = ioDevices_Data[358]
	},
	["12094628036610"] = { name = "Roller Shutter SOMFY - Ilmo 2 50",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["12094628102146"] = { name = "Sunea 40 - Vertical Exterior Awning SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[91]
	},
	["13194139664386"] = { name = "Roller Shutter SOMFY - Solus P&P 50",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["17592187158530"] = { name = "Exterior Venetian Blind - J4 IO",
		localPairing = true,
		["0"] = ioDevices_Data[218]
	},
	["18691698786306"] = { name = "Exterior Venetian Blind with WP - J4 IO",
		localPairing = true,
		["0"] = ioDevices_Data[447]
	},
	["20890722041858"] = { name = "Exterior Venetian Blind J4 with WP2  - J4 IO",
		localPairing = true,
		["0"] = ioDevices_Data[482]
	},
	["35184373202946"] = { name = "Exterior Venetian Blind - EVB RTX BRIDGE",
		localPairing = true,
		["0"] = ioDevices_Data[218]
	},
	["36283884830722"] = { name = "Exterior Venetian Blind with WP - EVB RTX BRIDGE",
		localPairing = true,
		["0"] = ioDevices_Data[447]
	},
	["38482908086274"] = { name = "Exterior Venetian Blind J4 with WP2 - EVB RTX BRIDGE",
		localPairing = true,
		["0"] = ioDevices_Data[482]
	},
	["52776559247362"] = { name = "Exterior Venetian Blind - J4 IO PROTECT",
		localPairing = true,
		["0"] = ioDevices_Data[218]
	},
	["53876070875138"] = { name = "Exterior Venetian Blind with WP - J4 IO PROTECT",
		localPairing = true,
		["0"] = ioDevices_Data[447]
	},
	["56075094130690"] = { name = "Exterior Venetian Blind J4 with WP2 - J4 IO PROTECT",
		localPairing = true,
		["0"] = ioDevices_Data[482]
	},
	["25836848128"] = { name = "Remote Controller (Public Trame)",
		localPairing = true,
		["0"] = {
			["io:GenericOneWayController"] = ioDevices_Data[494]
		}
	},
	["25836848384"] = { name = "V500 Remote Controller",
		localPairing = true,
		["0"] = {
			["io:V500Controller"] = ioDevices_Data[494]
		}
	},
	["25836848640"] = { name = "Keypad Remote Controller",
		localPairing = true,
		["0"] = {
			["io:KeypadController"] = ioDevices_Data[420]
		}
	},
	["13194139729922"] = { name = "Pergola Side Screen With Battery SOMFY",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenWithBatteryIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = {
					["65537"] = ioDevices_Data[480],
					["2146500638"] = ioDevices_Data[1],
					["16832512"] = ioDevices_Data[31],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[33],
					["2147426304"] = ioDevices_Data[4],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57],
					["65556"] = ioDevices_Data[260],
					["65557"] = ioDevices_Data[36],
					["16830720"] = ioDevices_Data[35]
				},
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[90]
			}
		}
	},
	["14293651357698"] = { name = "Awning Valance With Battery SOMFY",
		localPairing = true,
		["0"] = {
			["io:AwningValanceWithBatteryIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[495],
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[90]
			}
		}
	},
	["15393162985474"] = { name = "Drop Arm Awning With Battery SOMFY",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningWithBatteryIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = {
					["65537"] = ioDevices_Data[484],
					["2146500638"] = ioDevices_Data[1],
					["16832512"] = ioDevices_Data[31],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[33],
					["2147426304"] = ioDevices_Data[4],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57],
					["65556"] = ioDevices_Data[260],
					["65557"] = ioDevices_Data[36],
					["16830720"] = ioDevices_Data[35]
				},
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[90]
			}
		}
	},
	["16492674613250"] = { name = "Vertical Exterior Awning With Battery SOMFY",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningWithBatteryIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[87],
				states = ioDevices_Data[495],
				attributes = ioDevices_Data[59],
				commands = ioDevices_Data[90]
			}
		}
	},
	["16492674547714"] = { name = "Dynamic Roller Shutter",
		localPairing = true,
		["1"] = {
			["io:DynamicRollerShutterIOComponent"] = {
				type = 1,
				widget = "DynamicRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = {
					["65537"] = ioDevices_Data[55],
					["2146500638"] = ioDevices_Data[1],
					["16832512"] = ioDevices_Data[31],
					["1"] = ioDevices_Data[3],
					["16832522"] = ioDevices_Data[33],
					["2147426304"] = ioDevices_Data[4],
					["16830720"] = ioDevices_Data[35],
					["65557"] = ioDevices_Data[36],
					["2"] = ioDevices_Data[56],
					["2146500645"] = ioDevices_Data[57],
					["65556"] = ioDevices_Data[260],
					["67362619648"] = ioDevices_Data[496]
				},
				attributes = {
					["core:FirmwareRevision"] = ioDevices_Attributes[0],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[2],
					["io:Features"] = ioDevices_Attributes[37]
				},
				commands = ioDevices_Data[423]
			}
		},
		["2"] = ioDevices_Data[497]
	},
	["4504699139653634"] = { name = "Actuo 40 io",
		localPairing = true,
		["0"] = ioDevices_Data[511]
	},
	["4504699139129602"] = { name = "Altus GradHermetic io",
		localPairing = true,
		["0"] = {
			["io:GradHermeticIOComponent"] = {
				type = 1,
				widget = "PositionableOrOrientableRollerShutter",
				uiClass = "AdjustableSlatsRollerShutter",
				uiProfiles = ioDevices_Data[72],
				states = {
					["84082687"] = {
						linkedHighLevelState = ioDevices_Data[512],
						linkedStateIds = ioDevices_Data[513]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[306],
							ioDevices_HighLevelStates[17],
							ioDevices_HighLevelStates[16],
							ioDevices_HighLevelStates[10]
						},
						linkedStateIds = ioDevices_Data[514]
					},
					["65540"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[306],
							ioDevices_HighLevelStates[18]
						},
						linkedStateIds = ioDevices_Data[515]
					},
					["48177664"] = {
						linkedHighLevelState = ioDevices_Data[512],
						linkedStateIds = ioDevices_Data[516]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832512"] = ioDevices_Data[74],
					["16832522"] = ioDevices_Data[75],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[517],
				commands = {
					setName = ioDevices_Data[20],
					setOrientation = ioDevices_Data[83],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setConfigState = ioDevices_Data[25],
					setClosureOrRockerPosition = ioDevices_Data[78],
					close = ioDevices_Data[79],
					down = ioDevices_Data[79],
					open = ioDevices_Data[80],
					setClosure = ioDevices_Data[81],
					setDeployment = ioDevices_Data[81],
					setRockerPosition = ioDevices_Data[82],
					up = ioDevices_Data[80],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[84],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					setClosureOrOrientation = ioDevices_Data[77],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[521],
						converter = ioDevices_Converter[405],
						extraDefinition = ioDevices_Data[45]
					},
					pairOneWayController = ioDevices_Data[17],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[521],
						converter = ioDevices_Converter[406],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	["4505798650757378"] = { name = "Altus GradHermetic io",
		localPairing = true,
		["0"] = ioDevices_Data[523]
	},
	["4504699139129346"] = { name = "Altus RS io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84082687"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[308]
						},
						linkedStateIds = ioDevices_Data[243]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[308],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12],
							ioDevices_HighLevelStates[10]
						},
						linkedStateIds = ioDevices_Data[524]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[507],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[525],
						converter = ioDevices_Converter[411],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[525],
						converter = ioDevices_Converter[412],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	["4504699139471874"] = ioDevices_Data[566],
	["4505798651099650"] = ioDevices_Data[566],
	["4506898162727426"] = ioDevices_Data[566],
	["4507997674355202"] = ioDevices_Data[566],
	["4509097185982978"] = ioDevices_Data[567],
	["4510196697610754"] = ioDevices_Data[567],
	["4511296209238530"] = ioDevices_Data[567],
	["4504699139340802"] = ioDevices_Data[575],
	["4505798650968578"] = ioDevices_Data[575],
	["4506898162596354"] = ioDevices_Data[575],
	["4507997674224130"] = ioDevices_Data[576],
	["4509097185851906"] = ioDevices_Data[576],
	["4510196697479682"] = ioDevices_Data[576],
	["4511296209107458"] = ioDevices_Data[577],
	["4512395720735234"] = ioDevices_Data[577],
	["4513495232363010"] = ioDevices_Data[577],
	["4514594743990786"] = ioDevices_Data[578],
	["4515694255618562"] = ioDevices_Data[578],
	["4516793767246338"] = ioDevices_Data[578],
	["4504699140112386"] = { name = "EVB-Slim Receiver for Variation WP IO Plug",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[583],
				attributes = ioDevices_Data[584],
				commands = ioDevices_Data[588]
			}
		}
	},
	["4505798651740162"] = ioDevices_Data[589],
	["4506898163367938"] = ioDevices_Data[589],
	["4507997674995714"] = { name = "EVB-Slim Receiver for Variation WP IO Plug",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[583],
				attributes = ioDevices_Data[584],
				commands = ioDevices_Data[588]
			}
		}
	},
	["4509097186623490"] = { name = "EVB-Slim Receiver for Variation",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[596],
				attributes = ioDevices_Data[597],
				commands = ioDevices_Data[601]
			}
		}
	},
	["4510196698251266"] = ioDevices_Data[603],
	["4511296209879042"] = ioDevices_Data[603],
	["4512395721506818"] = { name = "EVB-Slim Receiver for Variation",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[596],
				attributes = ioDevices_Data[597],
				commands = ioDevices_Data[601]
			}
		}
	},
	["4512395720866306"] = ioDevices_Data[607],
	["4513495232494082"] = ioDevices_Data[607],
	["4514594744121858"] = ioDevices_Data[607],
	["4515694255749634"] = ioDevices_Data[607],
	["4516793767377410"] = ioDevices_Data[611],
	["4517893279005186"] = ioDevices_Data[611],
	["4518992790632962"] = ioDevices_Data[612],
	["4520092302260738"] = ioDevices_Data[612],
	["4521191813888514"] = ioDevices_Data[611],
	["4522291325516290"] = ioDevices_Data[612],
	["4504699140389378"] = { name = "Heat Slim Rec io",
		localPairing = true,
		["0"] = {
			["io:DiscreteExteriorHeatingIOComponent"] = {
				type = 1,
				widget = "DiscreteExteriorHeating",
				uiClass = "ExteriorHeatingSystem",
				uiProfiles = ioDevices_Data[228],
				states = {
					["84059651"] = ioDevices_Data[613],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[315],
							ioDevices_HighLevelStates[57]
						},
						linkedStateIds = ioDevices_Data[614]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[615],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					off = ioDevices_Data[229],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[617],
					pairOneWayController = ioDevices_Data[17],
					advancedRefresh = ioDevices_Data[618],
					on = ioDevices_Data[230]
				}
			}
		}
	},
	["4504699140374530"] = { name = "Heating Variation io",
		localPairing = true,
		["0"] = {
			["io:SimpleExteriorHeatingIOComponent"] = {
				type = 1,
				widget = "DimmerExteriorHeating",
				uiClass = "ExteriorHeatingSystem",
				uiProfiles = ioDevices_Data[221],
				states = {
					["16832512"] = ioDevices_Data[69],
					["84059651"] = ioDevices_Data[613],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[315],
							ioDevices_HighLevelStates[1]
						},
						linkedStateIds = ioDevices_Data[614]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[615],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setLevel = ioDevices_Data[222],
					off = ioDevices_Data[223],
					on = ioDevices_Data[224],
					my = ioDevices_Data[226],
					setConfigState = ioDevices_Data[25],
					getLevel = ioDevices_Data[158],
					startIdentify = ioDevices_Data[21],
					stopIdentify = ioDevices_Data[22],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[617],
					pairOneWayController = ioDevices_Data[17],
					advancedRefresh = ioDevices_Data[618]
				}
			}
		}
	},
	["4506898162385154"] = { name = "Holla Slateo B",
		localPairing = true,
		["0"] = {
			["io:VRHollaIOComponent"] = {
				type = 1,
				widget = "PositionableOrProgressiveOrientableRollerShutter",
				uiClass = "AdjustableSlatsRollerShutter",
				uiProfiles = ioDevices_Data[474],
				states = {
					["84059651"] = ioDevices_Data[500],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[305],
							ioDevices_HighLevelStates[17],
							ioDevices_HighLevelStates[16],
							ioDevices_HighLevelStates[10]
						},
						linkedStateIds = ioDevices_Data[501]
					},
					["84059661"] = ioDevices_Data[503],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["65540"] = ioDevices_Data[73],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832512"] = ioDevices_Data[74],
					["16832522"] = ioDevices_Data[75],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[507],
				commands = {
					setName = ioDevices_Data[20],
					setOrientation = ioDevices_Data[83],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setClosureAndOrientation = ioDevices_Data[475],
					setConfigState = ioDevices_Data[25],
					setClosureOrRockerPosition = ioDevices_Data[78],
					close = ioDevices_Data[79],
					down = ioDevices_Data[79],
					open = ioDevices_Data[80],
					setClosure = ioDevices_Data[81],
					setDeployment = ioDevices_Data[81],
					setRockerPosition = ioDevices_Data[82],
					up = ioDevices_Data[80],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[84],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					setClosureOrOrientation = ioDevices_Data[77],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[509],
						converter = ioDevices_Converter[441],
						extraDefinition = ioDevices_Data[45]
					},
					pairOneWayController = ioDevices_Data[17],
					advancedRefresh = ioDevices_Data[510]
				}
			}
		}
	},
	["4505798650757122"] = { name = "Ilmo io",
		localPairing = true,
		["0"] = ioDevices_Data[619]
	},
	["4523390837144066"] = ioDevices_Data[620],
	["4524490348771842"] = ioDevices_Data[620],
	["4525589860399618"] = ioDevices_Data[620],
	["4526689372027394"] = ioDevices_Data[620],
	["4527788883655170"] = ioDevices_Data[623],
	["4528888395282946"] = ioDevices_Data[623],
	["4529987906910722"] = ioDevices_Data[623],
	["4531087418538498"] = ioDevices_Data[623],
	["4504699139981826"] = { name = "Izymo ON/OFF Micromodule io",
		localPairing = true,
		["0"] = {
			["io:SwitchMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "TimedOnOff",
				uiClass = "OnOff",
				uiProfiles = ioDevices_Data[133],
				states = ioDevices_Data[624],
				attributes = ioDevices_Data[625],
				commands = ioDevices_Data[627]
			}
		}
	},
	["4505798651609602"] = { name = "Izymo ON/OFF Micromodule io",
		localPairing = true,
		["0"] = {
			["io:LightMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "TimedOnOffLight",
				uiClass = "Light",
				uiProfiles = ioDevices_Data[133],
				states = ioDevices_Data[624],
				attributes = ioDevices_Data[625],
				commands = ioDevices_Data[627]
			}
		}
	},
	["4504699139391490"] = { name = "Izymo Dimmer Micromodule io",
		localPairing = true,
		["0"] = {
			["io:DimmableLightMicroModuleSomfyIOComponent"] = {
				type = 1,
				widget = "DimmerLight",
				uiClass = "Light",
				uiProfiles = ioDevices_Data[101],
				states = {
					["16832512"] = ioDevices_Data[103],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[318],
							ioDevices_HighLevelStates[23],
							ioDevices_HighLevelStates[25]
						},
						linkedStateIds = {
							"84059651",
							"84059656"
						}
					},
					["84059656"] = {
						linkedHighLevelState = ioDevices_Data[628],
						linkedStateIds = ioDevices_Data[502]
					},
					["84059651"] = {
						linkedHighLevelState = ioDevices_Data[628],
						linkedStateIds = {
							"65537",
							"84059656"
						}
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[50],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					increaseIntensityForBoundConfiguration = ioDevices_Data[208],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setPosition = ioDevices_Data[112],
					my = ioDevices_Data[113],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[629],
						converter = ioDevices_Converter[454],
						extraDefinition = ioDevices_Data[45]
					},
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[629],
						converter = ioDevices_Converter[455],
						extraDefinition = ioDevices_Data[9]
					},
					saveBound = ioDevices_Data[210],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					setIntensityWithTimer = ioDevices_Data[109],
					onWithTimer = ioDevices_Data[110],
					setIntensity = ioDevices_Data[104],
					off = ioDevices_Data[105],
					on = ioDevices_Data[106],
					setOnOff = ioDevices_Data[107],
					setMemorized1Position = ioDevices_Data[111],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17],
					decreaseIntensityForBoundConfiguration = ioDevices_Data[209]
				}
			}
		}
	},
	["4513495233134594"] = { name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[635],
				attributes = ioDevices_Data[636],
				commands = ioDevices_Data[640]
			}
		}
	},
	["4514594744762370"] = ioDevices_Data[642],
	["4515694256390146"] = ioDevices_Data[642],
	["4516793768017922"] = { name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[635],
				attributes = ioDevices_Data[636],
				commands = ioDevices_Data[640]
			}
		}
	},
	["4517893279645698"] = { name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[596],
				attributes = ioDevices_Data[643],
				commands = ioDevices_Data[645]
			}
		}
	},
	["4518992791273474"] = ioDevices_Data[646],
	["4520092302901250"] = ioDevices_Data[646],
	["4521191814529026"] = { name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[596],
				attributes = ioDevices_Data[643],
				commands = ioDevices_Data[645]
			}
		}
	},
	["4522291326156802"] = { name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[650],
				attributes = ioDevices_Data[636],
				commands = ioDevices_Data[653]
			}
		}
	},
	["4523390837784578"] = ioDevices_Data[654],
	["4524490349412354"] = ioDevices_Data[654],
	["4525589861040130"] = { name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[650],
				attributes = ioDevices_Data[636],
				commands = ioDevices_Data[653]
			}
		}
	},
	["4526689372667906"] = { name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[660],
				attributes = ioDevices_Data[643],
				commands = ioDevices_Data[664]
			}
		}
	},
	["4527788884295682"] = ioDevices_Data[665],
	["4528888395923458"] = ioDevices_Data[665],
	["4529987907551234"] = { name = "J4 io Plate",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[660],
				attributes = ioDevices_Data[643],
				commands = ioDevices_Data[664]
			}
		}
	},
	["4504699139391746"] = { name = "Lighting Variation io RGBW",
		localPairing = true,
		["0"] = {
			["io:DimmableRGBLightIOComponent"] = {
				type = 1,
				widget = "DimmerRGBColouredLight",
				uiClass = "Light",
				uiProfiles = ioDevices_Data[101],
				states = {
					["16832512"] = ioDevices_Data[103],
					["65547"] = {
						linkedHighLevelState = ioDevices_Data[666],
						linkedStateIds = ioDevices_Data[120]
					},
					["65548"] = {
						linkedHighLevelState = ioDevices_Data[666],
						linkedStateIds = ioDevices_Data[121]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[29],
							ioDevices_HighLevelStates[315],
							ioDevices_HighLevelStates[23],
							ioDevices_HighLevelStates[28],
							ioDevices_HighLevelStates[27],
							ioDevices_HighLevelStates[25]
						},
						linkedStateIds = {
							"65547",
							"65548",
							"84059651"
						}
					},
					["84059651"] = ioDevices_Data[613],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["16832522"] = ioDevices_Data[70],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[615],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setRGB = ioDevices_Data[123],
					setSecuredPosition = ioDevices_Data[114],
					setPosition = ioDevices_Data[112],
					my = ioDevices_Data[113],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = ioDevices_Data[617],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[618],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					setIntensityWithTimer = ioDevices_Data[109],
					onWithTimer = ioDevices_Data[110],
					setIntensity = ioDevices_Data[104],
					off = ioDevices_Data[105],
					on = ioDevices_Data[106],
					setOnOff = ioDevices_Data[107],
					setMemorized1Position = ioDevices_Data[111],
					wink = ioDevices_Data[26],
					setRGBWithTimer = ioDevices_Data[126],
					pairOneWayController = ioDevices_Data[17]
				}
			}
		}
	},
	["4504699139392002"] = { name = "Lighting Variation io TW",
		localPairing = true,
		["0"] = {
			["io:DimmableColorTemperatureLightIOComponent"] = {
				type = 1,
				widget = "DimmerColorTemperatureLight",
				uiClass = "Light",
				uiProfiles = ioDevices_Data[101],
				states = {
					["16832512"] = ioDevices_Data[103],
					["84059651"] = ioDevices_Data[613],
					["65537"] = ioDevices_Data[667],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65551"] = ioDevices_Data[128],
					["2146500645"] = ioDevices_Data[57],
					["16832522"] = ioDevices_Data[70],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[615],
				commands = {
					setColorTemperature = ioDevices_Data[131],
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[114],
					setPosition = ioDevices_Data[112],
					my = ioDevices_Data[113],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					setIntensityWithTimer = ioDevices_Data[109],
					onWithTimer = ioDevices_Data[110],
					setIntensity = ioDevices_Data[104],
					off = ioDevices_Data[105],
					on = ioDevices_Data[106],
					setOnOff = ioDevices_Data[107],
					setMemorized1Position = ioDevices_Data[111],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[617],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[618]
				}
			}
		}
	},
	["4504699139406338"] = { name = "Lighting Variation io White",
		localPairing = true,
		["0"] = {
			["io:OnOffLightIOComponent"] = {
				type = 1,
				widget = "StatefulOnOffLight",
				uiClass = "Light",
				uiProfiles = ioDevices_Data[133],
				states = {
					["84059651"] = ioDevices_Data[613],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[315],
							ioDevices_HighLevelStates[31]
						},
						linkedStateIds = ioDevices_Data[614]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[615],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setConfigState = ioDevices_Data[25],
					onWithTimer = ioDevices_Data[135],
					startIdentify = ioDevices_Data[21],
					setOnOff = ioDevices_Data[136],
					off = ioDevices_Data[137],
					on = ioDevices_Data[138],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[617],
					pairOneWayController = ioDevices_Data[17],
					advancedRefresh = ioDevices_Data[618]
				}
			}
		}
	},
	["4505798651034114"] = { name = "Lighting receiver ONOFF io",
		localPairing = true,
		["0"] = {
			["io:OnOffLightIOComponent"] = {
				type = 1,
				widget = "StatefulOnOffLight",
				uiClass = "Light",
				uiProfiles = ioDevices_Data[133],
				states = {
					["84059651"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[322]
						},
						linkedStateIds = ioDevices_Data[243]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[322],
							ioDevices_HighLevelStates[31]
						},
						linkedStateIds = ioDevices_Data[614]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[53],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setConfigState = ioDevices_Data[25],
					onWithTimer = ioDevices_Data[135],
					startIdentify = ioDevices_Data[21],
					setOnOff = ioDevices_Data[136],
					off = ioDevices_Data[137],
					on = ioDevices_Data[138],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[616],
						converter = ioDevices_Converter[470],
						extraDefinition = ioDevices_Data[45]
					},
					pairOneWayController = ioDevices_Data[17],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[616],
						converter = ioDevices_Converter[471],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	["4505798651019266"] = { name = "Lighting receiver Variation io",
		localPairing = true,
		["0"] = {
			["io:DimmableLightIOComponent"] = {
				type = 1,
				widget = "DimmerLight",
				uiClass = "Light",
				uiProfiles = ioDevices_Data[101],
				states = {
					["16832512"] = ioDevices_Data[103],
					["84059651"] = ioDevices_Data[613],
					["65537"] = ioDevices_Data[667],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["16832522"] = ioDevices_Data[70],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[615],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[114],
					setPosition = ioDevices_Data[112],
					my = ioDevices_Data[113],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					setIntensityWithTimer = ioDevices_Data[109],
					onWithTimer = ioDevices_Data[110],
					setIntensity = ioDevices_Data[104],
					off = ioDevices_Data[105],
					on = ioDevices_Data[106],
					setOnOff = ioDevices_Data[107],
					setMemorized1Position = ioDevices_Data[111],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[617],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[618]
				}
			}
		}
	},
	["4504699139194882"] = { name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[87],
				states = ioDevices_Data[675],
				attributes = ioDevices_Data[676],
				commands = ioDevices_Data[682]
			}
		}
	},
	["4505798650822658"] = { name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[675],
				attributes = ioDevices_Data[676],
				commands = ioDevices_Data[682]
			}
		}
	},
	["4506898162450434"] = { name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = ioDevices_Data[683],
				attributes = ioDevices_Data[676],
				commands = ioDevices_Data[682]
			}
		}
	},
	["4507997674078210"] = { name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[675],
				attributes = ioDevices_Data[676],
				commands = ioDevices_Data[682]
			}
		}
	},
	["4509097185705986"] = { name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[87],
				states = ioDevices_Data[675],
				attributes = ioDevices_Data[684],
				commands = ioDevices_Data[685]
			}
		}
	},
	["4510196697333762"] = { name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[675],
				attributes = ioDevices_Data[684],
				commands = ioDevices_Data[685]
			}
		}
	},
	["4511296208961538"] = { name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = ioDevices_Data[683],
				attributes = ioDevices_Data[684],
				commands = ioDevices_Data[685]
			}
		}
	},
	["4512395720589314"] = { name = "Maestria+ io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[675],
				attributes = ioDevices_Data[684],
				commands = ioDevices_Data[685]
			}
		}
	},
	["4531087419179010"] = { name = "My EVB Pro io",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindWithWPIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlindWithWP",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[698],
				attributes = ioDevices_Data[699],
				commands = ioDevices_Data[704]
			}
		}
	},
	["4532186930806786"] = ioDevices_Data[706],
	["4533286442434562"] = ioDevices_Data[706],
	["4534385954062338"] = { name = "My EVB Pro io",
		localPairing = true,
		["0"] = {
			["io:ExteriorVenetianBlindIOComponent"] = {
				type = 1,
				widget = "PositionableExteriorVenetianBlind",
				uiClass = "ExteriorVenetianBlind",
				uiProfiles = ioDevices_Data[28],
				states = ioDevices_Data[698],
				attributes = ioDevices_Data[699],
				commands = ioDevices_Data[704]
			}
		}
	},
	["4535485465690114"] = ioDevices_Data[718],
	["4536584977317890"] = ioDevices_Data[719],
	["4537684488945666"] = ioDevices_Data[719],
	["4538784000573442"] = ioDevices_Data[720],
	["4539883512201218"] = ioDevices_Data[718],
	["4540983023828994"] = ioDevices_Data[719],
	["4542082535456770"] = ioDevices_Data[719],
	["4543182047084546"] = ioDevices_Data[720],
	["4506898162384898"] = { name = "OXIMO 40 io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[506],
				attributes = ioDevices_Data[507],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[509],
						converter = ioDevices_Converter[485],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[510]
				}
			}
		}
	},
	["4507997674012674"] = { name = "OXIMO 40 io",
		localPairing = true,
		["0"] = ioDevices_Data[721]
	},
	["4505798651281410"] = { name = "Optuo 40 io",
		localPairing = true,
		["0"] = ioDevices_Data[511]
	},
	["4509097185640450"] = { name = "Oximo S Auto io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[723],
				attributes = ioDevices_Data[507],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[724],
						converter = ioDevices_Converter[488],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[725]
				}
			}
		}
	},
	["4510196697268226"] = { name = "Oximo S Auto io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[723],
				attributes = ioDevices_Data[507],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[724],
						converter = ioDevices_Converter[490],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[725]
				}
			}
		}
	},
	["4511296208896002"] = { name = "Oximo S Auto io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[727],
				attributes = ioDevices_Data[507],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[724],
						converter = ioDevices_Converter[492],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[728]
				}
			}
		}
	},
	["4512395720523778"] = { name = "Oximo io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = {
					["16832512"] = ioDevices_Data[31],
					["49020928"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[328]
						},
						linkedStateIds = ioDevices_Data[243]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[328],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12],
							ioDevices_HighLevelStates[10]
						},
						linkedStateIds = ioDevices_Data[729]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[730],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[731],
						converter = ioDevices_Converter[496],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[731],
						converter = ioDevices_Converter[497],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	["4513495232151554"] = { name = "Oximo io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = {
					["16832512"] = ioDevices_Data[31],
					["49020928"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[329]
						},
						linkedStateIds = ioDevices_Data[243]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[329],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12],
							ioDevices_HighLevelStates[10]
						},
						linkedStateIds = ioDevices_Data[729]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[730],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[731],
						converter = ioDevices_Converter[499],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[731],
						converter = ioDevices_Converter[500],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	["4514594743779330"] = { name = "Oximo io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84082687"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[330]
						},
						linkedStateIds = ioDevices_Data[243]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[330],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12],
							ioDevices_HighLevelStates[10]
						},
						linkedStateIds = ioDevices_Data[524]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[507],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[525],
						converter = ioDevices_Converter[502],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[525],
						converter = ioDevices_Converter[503],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	["4515694255407106"] = { name = "Oximo io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[732],
				attributes = ioDevices_Data[507],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[525],
						converter = ioDevices_Converter[505],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[733]
				}
			}
		}
	},
	["4516793767034882"] = { name = "Oximo io",
		localPairing = true,
		["0"] = ioDevices_Data[734]
	},
	["4517893278662658"] = ioDevices_Data[735],
	["4518992790290434"] = ioDevices_Data[735],
	["4504699140898818"] = { name = "Pergola Box io",
		localPairing = true,
		["0"] = {
			["io:SimpleBioclimaticPergolaIOComponent"] = {
				type = 1,
				widget = "BioclimaticPergola",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[252],
				states = {
					["16832512"] = ioDevices_Data[253],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[78],
							ioDevices_HighLevelStates[305],
							ioDevices_HighLevelStates[80],
							ioDevices_HighLevelStates[79]
						},
						linkedStateIds = {
							"84059651",
							"84059661"
						}
					},
					["84059651"] = ioDevices_Data[500],
					["84059661"] = ioDevices_Data[503],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["16832522"] = ioDevices_Data[254],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[507],
				commands = {
					setName = ioDevices_Data[20],
					setOrientation = ioDevices_Data[256],
					my = ioDevices_Data[257],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					openSlats = ioDevices_Data[99],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					refreshMemorized1Orientation = ioDevices_Data[37],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[509],
						converter = ioDevices_Converter[508],
						extraDefinition = ioDevices_Data[45]
					},
					closeSlats = ioDevices_Data[98],
					pairOneWayController = ioDevices_Data[17],
					setMemorized1Orientation = ioDevices_Data[47],
					setSecuredOrientation = ioDevices_Data[53],
					advancedRefresh = ioDevices_Data[510]
				}
			}
		}
	},
	["4504699140047106"] = { name = "Pergola Gibus io",
		localPairing = true,
		["0"] = {
			["io:PergolaRailGuidedAwningIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwning",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[204],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84082687"] = {
						linkedHighLevelState = ioDevices_Data[736],
						linkedStateIds = ioDevices_Data[737]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[332],
							ioDevices_HighLevelStates[51],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[20]
						},
						linkedStateIds = ioDevices_Data[738]
					},
					["48170496"] = {
						linkedHighLevelState = ioDevices_Data[736],
						linkedStateIds = ioDevices_Data[739]
					},
					["48171008"] = {
						linkedHighLevelState = ioDevices_Data[736],
						linkedStateIds = ioDevices_Data[740]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[58],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[742],
						converter = ioDevices_Converter[511],
						extraDefinition = ioDevices_Data[45]
					},
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[742],
						converter = ioDevices_Converter[512],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	["4505798651674882"] = { name = "Pergola io",
		localPairing = true,
		["0"] = {
			["io:PergolaRailGuidedAwningIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwning",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[204],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84082687"] = {
						linkedHighLevelState = ioDevices_Data[743],
						linkedStateIds = ioDevices_Data[744]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[333],
							ioDevices_HighLevelStates[51],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[20]
						},
						linkedStateIds = ioDevices_Data[745]
					},
					["48171008"] = {
						linkedHighLevelState = ioDevices_Data[743],
						linkedStateIds = ioDevices_Data[631]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[746],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[747],
						converter = ioDevices_Converter[515],
						extraDefinition = ioDevices_Data[45]
					},
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[747],
						converter = ioDevices_Converter[516],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	["4506898163302658"] = { name = "Pergola io",
		localPairing = true,
		["0"] = {
			["io:PergolaRailGuidedAwningIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwning",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[204],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84082687"] = {
						linkedHighLevelState = ioDevices_Data[748],
						linkedStateIds = ioDevices_Data[744]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[334],
							ioDevices_HighLevelStates[51],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[20]
						},
						linkedStateIds = ioDevices_Data[745]
					},
					["48171008"] = {
						linkedHighLevelState = ioDevices_Data[748],
						linkedStateIds = ioDevices_Data[631]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[746],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[747],
						converter = ioDevices_Converter[518],
						extraDefinition = ioDevices_Data[45]
					},
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[747],
						converter = ioDevices_Converter[519],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	["4513495232217090"] = { name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaScreenIOComponent"] = {
				type = 1,
				widget = "PositionableAndStretchablePergolaScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[425],
				states = ioDevices_Data[752],
				attributes = ioDevices_Data[753],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setClosureOrTightPosition = ioDevices_Data[426],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = ioDevices_Data[754],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					setTightPosition = ioDevices_Data[236],
					advancedRefresh = ioDevices_Data[755],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17]
				}
			}
		}
	},
	["4514594743844866"] = { name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[756],
				attributes = ioDevices_Data[753],
				commands = ioDevices_Data[757]
			}
		}
	},
	["4515694255472642"] = { name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = ioDevices_Data[758],
				attributes = ioDevices_Data[753],
				commands = ioDevices_Data[757]
			}
		}
	},
	["4516793767100418"] = { name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[756],
				attributes = ioDevices_Data[753],
				commands = ioDevices_Data[757]
			}
		}
	},
	["4517893278728194"] = { name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaScreenIOComponent"] = {
				type = 1,
				widget = "PositionableAndStretchablePergolaScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[425],
				states = ioDevices_Data[752],
				attributes = ioDevices_Data[753],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setClosureOrTightPosition = ioDevices_Data[426],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					stopIdentify = ioDevices_Data[22],
					runManufacturerSettingsCommand = ioDevices_Data[759],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					refreshMemorized1Position = ioDevices_Data[37],
					setTightPosition = ioDevices_Data[236],
					advancedRefresh = ioDevices_Data[755],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					pairOneWayController = ioDevices_Data[17]
				}
			}
		}
	},
	["4518992790355970"] = { name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[756],
				attributes = ioDevices_Data[753],
				commands = ioDevices_Data[760]
			}
		}
	},
	["4520092301983746"] = { name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = ioDevices_Data[758],
				attributes = ioDevices_Data[753],
				commands = ioDevices_Data[760]
			}
		}
	},
	["4521191813611522"] = { name = "Pergola screen io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[756],
				attributes = ioDevices_Data[753],
				commands = ioDevices_Data[760]
			}
		}
	},
	["4520092301918210"] = { name = "RS Receiver io Manual",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[727],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[61],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[724],
						converter = ioDevices_Converter[526],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[728]
				}
			}
		}
	},
	["4517893278874114"] = ioDevices_Data[763],
	["4518992790501890"] = ioDevices_Data[763],
	["4520092302129666"] = ioDevices_Data[763],
	["4521191813545986"] = ioDevices_Data[773],
	["4522291325173762"] = ioDevices_Data[773],
	["4523390836801538"] = ioDevices_Data[773],
	["4524490348429314"] = ioDevices_Data[773],
	["4525589860057090"] = ioDevices_Data[776],
	["4526689371684866"] = ioDevices_Data[776],
	["4527788883312642"] = ioDevices_Data[776],
	["4528888394940418"] = ioDevices_Data[776],
	["4529987906568194"] = ioDevices_Data[776],
	["4531087418195970"] = ioDevices_Data[778],
	["4532186929823746"] = ioDevices_Data[776],
	["4533286441451522"] = ioDevices_Data[778],
	["4534385953079298"] = ioDevices_Data[776],
	["4535485464707074"] = ioDevices_Data[778],
	["4536584976334850"] = ioDevices_Data[778],
	["4537684487962626"] = ioDevices_Data[778],
	["4538783999590402"] = ioDevices_Data[778],
	["4539883511218178"] = ioDevices_Data[778],
	["4540983022845954"] = ioDevices_Data[778],
	["4542082534473730"] = ioDevices_Data[778],
	["4543182046101506"] = ioDevices_Data[778],
	["4544281557729282"] = ioDevices_Data[778],
	["4545381069357058"] = ioDevices_Data[778],
	["4546480580984834"] = ioDevices_Data[778],
	["4547580092612610"] = ioDevices_Data[779],
	["4548679604240386"] = ioDevices_Data[779],
	["4549779115868162"] = ioDevices_Data[779],
	["4550878627495938"] = ioDevices_Data[779],
	["4551978139123714"] = ioDevices_Data[779],
	["4553077650751490"] = ioDevices_Data[780],
	["4554177162379266"] = ioDevices_Data[782],
	["4555276674007042"] = ioDevices_Data[779],
	["4556376185634818"] = ioDevices_Data[780],
	["4557475697262594"] = ioDevices_Data[782],
	["4558575208890370"] = ioDevices_Data[779],
	["4559674720518146"] = ioDevices_Data[780],
	["4560774232145922"] = ioDevices_Data[782],
	["4561873743773698"] = ioDevices_Data[780],
	["4562973255401474"] = ioDevices_Data[782],
	["4564072767029250"] = ioDevices_Data[782],
	["4565172278657026"] = ioDevices_Data[782],
	["4566271790284802"] = ioDevices_Data[782],
	["4567371301912578"] = ioDevices_Data[782],
	["4568470813540354"] = ioDevices_Data[782],
	["4569570325168130"] = ioDevices_Data[782],
	["4584963487956994"] = ioDevices_Data[790],
	["4570669836795906"] = ioDevices_Data[792],
	["4586062999584770"] = ioDevices_Data[790],
	["4571769348423682"] = ioDevices_Data[792],
	["4587162511212546"] = ioDevices_Data[794],
	["4572868860051458"] = ioDevices_Data[795],
	["4588262022840322"] = ioDevices_Data[794],
	["4573968371679234"] = ioDevices_Data[795],
	["4589361534468098"] = ioDevices_Data[794],
	["4575067883307010"] = ioDevices_Data[795],
	["4504699140768002"] = { name = "Sliding window V0",
		localPairing = true,
		["0"] = {
			["io:PositionableAndLockableSlidingWindowComponent"] = {
				type = 1,
				widget = "PositionableAndLockableSlidingWindow",
				uiClass = "Window",
				uiProfiles = ioDevices_Data[241],
				states = {
					["84059651"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[74],
							ioDevices_HighLevelStates[341],
							ioDevices_HighLevelStates[71],
							ioDevices_HighLevelStates[72],
							ioDevices_HighLevelStates[73],
							ioDevices_HighLevelStates[75]
						},
						linkedStateIds = {
							"65537",
							"84059666"
						}
					},
					["16832512"] = ioDevices_Data[69],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[341],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[70]
						},
						linkedStateIds = {
							"65801",
							"84059651",
							"84059666"
						}
					},
					["84059666"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[341]
						},
						linkedStateIds = ioDevices_Data[502]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["65546"] = ioDevices_Data[242],
					["2"] = ioDevices_Data[505],
					["65801"] = ioDevices_Data[244],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[69],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					delayedStopIdentify = ioDevices_Data[13],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setPosition = ioDevices_Data[248],
					my = ioDevices_Data[240],
					setPositionAndLinearSpeed = ioDevices_Data[249],
					stopIdentify = ioDevices_Data[22],
					deactivateTimer = ioDevices_Data[246],
					lock = ioDevices_Data[247],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[797],
						converter = ioDevices_Converter[553],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[19],
					close = ioDevices_Data[237],
					open = ioDevices_Data[238],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[797],
						converter = ioDevices_Converter[554],
						extraDefinition = ioDevices_Data[9]
					},
					activateTimer = ioDevices_Data[245],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unlock = ioDevices_Data[250],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					identify = ioDevices_Data[15],
					setClosureAndLinearSpeed = ioDevices_Data[239],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					wink = ioDevices_Data[26],
					setTimer = ioDevices_Data[196],
					pairOneWayController = ioDevices_Data[17]
				}
			}
		}
	},
	["4505798652395778"] = ioDevices_Data[800],
	["4506898164023554"] = ioDevices_Data[800],
	["4507997675651330"] = ioDevices_Data[800],
	["4504699140046850"] = { name = "Slim Receiver Awning io",
		localPairing = true,
		["0"] = {
			["io:AwningReceiverUnoIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwningUno",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[444],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = ioDevices_Data[500],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[305],
							ioDevices_HighLevelStates[51],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[20]
						},
						linkedStateIds = ioDevices_Data[501]
					},
					["84059661"] = ioDevices_Data[503],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[801],
				commands = ioDevices_Data[803]
			}
		}
	},
	["4507997674930434"] = { name = "Slim Receiver Pergola io",
		localPairing = true,
		["0"] = {
			["io:PergolaHorizontalUnoIOComponent"] = {
				type = 1,
				widget = "PergolaHorizontalAwningUno",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[446],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = ioDevices_Data[500],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[305],
							ioDevices_HighLevelStates[10]
						},
						linkedStateIds = ioDevices_Data[501]
					},
					["84059661"] = ioDevices_Data[503],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[801],
				commands = ioDevices_Data[803]
			}
		}
	},
	["4576167394934786"] = { name = "Slim Receiver RS io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterUnoIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutterUno",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[477],
				states = ioDevices_Data[506],
				attributes = ioDevices_Data[801],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[802],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[510]
				}
			}
		}
	},
	["4522291325239298"] = { name = "Slim Receiver Screen io",
		localPairing = true,
		["0"] = {
			["io:ScreenReceiverUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[489],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = ioDevices_Data[805],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[343],
							ioDevices_HighLevelStates[10]
						},
						linkedStateIds = ioDevices_Data[501]
					},
					["84059661"] = ioDevices_Data[806],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[801],
				commands = ioDevices_Data[807]
			}
		}
	},
	["4523390836867074"] = { name = "Slim Receiver Screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[808],
				attributes = ioDevices_Data[801],
				commands = ioDevices_Data[807]
			}
		}
	},
	["4524490348494850"] = { name = "Slim Receiver Screen io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = ioDevices_Data[805],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[343],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[280]
						},
						linkedStateIds = ioDevices_Data[501]
					},
					["84059661"] = ioDevices_Data[806],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[801],
				commands = ioDevices_Data[807]
			}
		}
	},
	["4525589860122626"] = { name = "Slim Receiver Screen io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[808],
				attributes = ioDevices_Data[801],
				commands = ioDevices_Data[807]
			}
		}
	},
	["4504699140243458"] = { name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:CurtainTrackUnoIOComponent"] = {
				type = 1,
				widget = "CurtainTrackUno",
				uiClass = "Curtain",
				uiProfiles = ioDevices_Data[448],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = ioDevices_Data[811],
					["65537"] = ioDevices_Data[813],
					["84059661"] = ioDevices_Data[815],
					["84059657"] = ioDevices_Data[817],
					["84059659"] = ioDevices_Data[819],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[75],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[820],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[822],
					setClosure = ioDevices_Data[449],
					close = ioDevices_Data[450],
					open = ioDevices_Data[451],
					my = ioDevices_Data[452],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[823]
				}
			}
		}
	},
	["4505798651674626"] = { name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningUnoIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwningUno",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[444],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = ioDevices_Data[811],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[344],
							ioDevices_HighLevelStates[51],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[20]
						},
						linkedStateIds = ioDevices_Data[812]
					},
					["84059661"] = ioDevices_Data[815],
					["84059657"] = ioDevices_Data[817],
					["84059659"] = ioDevices_Data[819],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[820],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[822],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[823]
				}
			}
		}
	},
	["4506898162909186"] = { name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:VerticalInteriorBlindUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "Screen",
				uiProfiles = ioDevices_Data[441],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = ioDevices_Data[811],
					["65537"] = ioDevices_Data[813],
					["84059661"] = ioDevices_Data[815],
					["84059657"] = ioDevices_Data[817],
					["84059659"] = ioDevices_Data[819],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[820],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[822],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[823]
				}
			}
		}
	},
	["4504699139260418"] = { name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:WindowOpenerUnoIOComponent"] = {
				type = 1,
				widget = "PositionableWindowUno",
				uiClass = "Window",
				uiProfiles = ioDevices_Data[427],
				states = {
					["16830720"] = ioDevices_Data[429],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[223],
							ioDevices_HighLevelStates[344]
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
					["120842"] = ioDevices_Data[430],
					["120833"] = ioDevices_Data[431],
					["120834"] = ioDevices_Data[432],
					["120835"] = ioDevices_Data[433],
					["84059651"] = ioDevices_Data[811],
					["84059661"] = ioDevices_Data[815],
					["84059657"] = ioDevices_Data[817],
					["84059659"] = ioDevices_Data[819],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1],
					["2146500645"] = ioDevices_Data[57]
				},
				attributes = ioDevices_Data[820],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[822],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					open = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					advancedRefresh = ioDevices_Data[823]
				}
			}
		}
	},
	["4526689371750402"] = { name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningUnoIOComponent"] = {
				type = 1,
				widget = "PositionableScreenUno",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[476],
				states = ioDevices_Data[829],
				attributes = ioDevices_Data[820],
				commands = ioDevices_Data[830]
			}
		}
	},
	["4527788883378178"] = { name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[829],
				attributes = ioDevices_Data[820],
				commands = ioDevices_Data[830]
			}
		}
	},
	["4528888395005954"] = { name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = ioDevices_Data[825],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[345],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[280]
						},
						linkedStateIds = ioDevices_Data[812]
					},
					["84059661"] = ioDevices_Data[826],
					["84059657"] = ioDevices_Data[827],
					["84059659"] = ioDevices_Data[828],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[820],
				commands = ioDevices_Data[830]
			}
		}
	},
	["4529987906633730"] = { name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[829],
				attributes = ioDevices_Data[820],
				commands = ioDevices_Data[830]
			}
		}
	},
	["4577266906562562"] = { name = "Smoove UNO io",
		localPairing = true,
		["0"] = {
			["io:RollerShutterUnoIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutterUno",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[477],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = ioDevices_Data[811],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[344],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12],
							ioDevices_HighLevelStates[10]
						},
						linkedStateIds = ioDevices_Data[812]
					},
					["84059661"] = ioDevices_Data[815],
					["84059657"] = ioDevices_Data[817],
					["84059659"] = ioDevices_Data[819],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[820],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[822],
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[823]
				}
			}
		}
	},
	["4578366418190338"] = { name = "Solus io",
		localPairing = true,
		["0"] = ioDevices_Data[619]
	},
	["4507997674536962"] = { name = "Sonesse 40 io",
		localPairing = true,
		["0"] = ioDevices_Data[511]
	},
	["4506898163302402"] = { name = "Sunea CSI io",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[199],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = {
						linkedHighLevelState = ioDevices_Data[831],
						linkedStateIds = ioDevices_Data[737]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[346],
							ioDevices_HighLevelStates[51],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[20]
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
						linkedHighLevelState = ioDevices_Data[831],
						linkedStateIds = {
							"48171008",
							"65537",
							"84059651"
						}
					},
					["48171008"] = {
						linkedHighLevelState = ioDevices_Data[831],
						linkedStateIds = {
							"48170496",
							"65537",
							"84059651"
						}
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[832],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[833],
						converter = ioDevices_Converter[567],
						extraDefinition = ioDevices_Data[45]
					},
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[833],
						converter = ioDevices_Converter[568],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	["4507997674930178"] = { name = "Sunea Screen 40 io",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[199],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = {
						linkedHighLevelState = ioDevices_Data[834],
						linkedStateIds = ioDevices_Data[835]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[347],
							ioDevices_HighLevelStates[51],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[20]
						},
						linkedStateIds = ioDevices_Data[836]
					},
					["48170496"] = {
						linkedHighLevelState = ioDevices_Data[834],
						linkedStateIds = ioDevices_Data[837]
					},
					["48171008"] = {
						linkedHighLevelState = ioDevices_Data[834],
						linkedStateIds = ioDevices_Data[672]
					},
					["84059664"] = {
						linkedHighLevelState = ioDevices_Data[834],
						linkedStateIds = ioDevices_Data[838]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[839],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[841],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[842]
				}
			}
		}
	},
	["4531087418261506"] = { name = "Sunea Screen 40 io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[848],
				attributes = ioDevices_Data[839],
				commands = ioDevices_Data[849]
			}
		}
	},
	["4532186929889282"] = { name = "Sunea Screen 40 io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84059651"] = ioDevices_Data[844],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[348],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[280]
						},
						linkedStateIds = ioDevices_Data[836]
					},
					["48170496"] = ioDevices_Data[845],
					["48171008"] = ioDevices_Data[846],
					["84059664"] = ioDevices_Data[847],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[839],
				commands = ioDevices_Data[849]
			}
		}
	},
	["4533286441517058"] = { name = "Sunea Screen 40 io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[848],
				attributes = ioDevices_Data[839],
				commands = ioDevices_Data[849]
			}
		}
	},
	["4534385953144834"] = { name = "Sunea Screen 40 io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[87],
				states = ioDevices_Data[848],
				attributes = ioDevices_Data[839],
				commands = ioDevices_Data[849]
			}
		}
	},
	["4535485464772610"] = ioDevices_Data[860],
	["4536584976400386"] = ioDevices_Data[861],
	["4537684488028162"] = ioDevices_Data[863],
	["4538783999655938"] = ioDevices_Data[864],
	["4539883511283714"] = ioDevices_Data[866],
	["4540983022911490"] = ioDevices_Data[867],
	["4542082534539266"] = ioDevices_Data[868],
	["4543182046167042"] = ioDevices_Data[860],
	["4544281557794818"] = ioDevices_Data[861],
	["4545381069422594"] = ioDevices_Data[863],
	["4546480581050370"] = ioDevices_Data[864],
	["4547580092678146"] = ioDevices_Data[866],
	["4548679604305922"] = ioDevices_Data[867],
	["4549779115933698"] = ioDevices_Data[868],
	["4550878627561474"] = ioDevices_Data[860],
	["4551978139189250"] = ioDevices_Data[861],
	["4553077650817026"] = ioDevices_Data[863],
	["4554177162444802"] = ioDevices_Data[864],
	["4555276674072578"] = ioDevices_Data[866],
	["4556376185700354"] = ioDevices_Data[867],
	["4557475697328130"] = ioDevices_Data[868],
	["4509097186557954"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[199],
				states = ioDevices_Data[873],
				attributes = ioDevices_Data[832],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[874],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[875]
				}
			}
		}
	},
	["4510196698185730"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[199],
				states = ioDevices_Data[873],
				attributes = ioDevices_Data[832],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[876],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[875]
				}
			}
		}
	},
	["4511296209813506"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[199],
				states = ioDevices_Data[873],
				attributes = ioDevices_Data[832],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[877],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[875]
				}
			}
		}
	},
	["4558575208955906"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[87],
				states = ioDevices_Data[878],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[879]
			}
		}
	},
	["4559674720583682"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[878],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[879]
			}
		}
	},
	["4560774232211458"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = ioDevices_Data[880],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[879]
			}
		}
	},
	["4561873743839234"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[878],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[879]
			}
		}
	},
	["4562973255467010"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[87],
				states = ioDevices_Data[878],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[881]
			}
		}
	},
	["4564072767094786"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[878],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[881]
			}
		}
	},
	["4565172278722562"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = ioDevices_Data[880],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[881]
			}
		}
	},
	["4566271790350338"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[878],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[881]
			}
		}
	},
	["4567371301978114"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[87],
				states = ioDevices_Data[878],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[882]
			}
		}
	},
	["4568470813605890"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[878],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[882]
			}
		}
	},
	["4569570325233666"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = ioDevices_Data[880],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[882]
			}
		}
	},
	["4570669836861442"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[878],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[882]
			}
		}
	},
	["4512395721441282"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[199],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84082687"] = ioDevices_Data[884],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[351],
							ioDevices_HighLevelStates[51],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[20]
						},
						linkedStateIds = ioDevices_Data[738]
					},
					["48170496"] = ioDevices_Data[885],
					["48171008"] = ioDevices_Data[886],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[832],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[887],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[888]
				}
			}
		}
	},
	["4513495233069058"] = ioDevices_Data[895],
	["4571769348489218"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[87],
				states = ioDevices_Data[896],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[897]
			}
		}
	},
	["4572868860116994"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[896],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[897]
			}
		}
	},
	["4573968371744770"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = {
					["16832512"] = ioDevices_Data[31],
					["84082687"] = ioDevices_Data[884],
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[351],
							ioDevices_HighLevelStates[5],
							ioDevices_HighLevelStates[12],
							ioDevices_HighLevelStates[10],
							ioDevices_HighLevelStates[280]
						},
						linkedStateIds = ioDevices_Data[738]
					},
					["48170496"] = ioDevices_Data[885],
					["48171008"] = ioDevices_Data[886],
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832522"] = ioDevices_Data[504],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[897]
			}
		}
	},
	["4575067883372546"] = { name = "Sunea,Sunea Screen",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[896],
				attributes = ioDevices_Data[832],
				commands = ioDevices_Data[897]
			}
		}
	},
	["4576167395000322"] = ioDevices_Data[900],
	["4577266906628098"] = ioDevices_Data[901],
	["4578366418255874"] = ioDevices_Data[902],
	["4579465929883650"] = ioDevices_Data[903],
	["4514594744696834"] = ioDevices_Data[895],
	["4580565441511426"] = ioDevices_Data[900],
	["4581664953139202"] = ioDevices_Data[901],
	["4582764464766978"] = ioDevices_Data[902],
	["4583863976394754"] = ioDevices_Data[903],
	["4515694256324610"] = { name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[199],
				states = ioDevices_Data[905],
				attributes = ioDevices_Data[906],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[907],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[908]
				}
			}
		}
	},
	["4516793767952386"] = { name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:HorizontalAwningIOComponent"] = {
				type = 1,
				widget = "PositionableHorizontalAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[199],
				states = ioDevices_Data[905],
				attributes = ioDevices_Data[906],
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					setDeployment = ioDevices_Data[38],
					close = ioDevices_Data[42],
					deploy = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[40],
					setClosure = ioDevices_Data[201],
					undeploy = ioDevices_Data[42],
					up = ioDevices_Data[42],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = ioDevices_Data[909],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[908]
				}
			}
		}
	},
	["4584963488022530"] = { name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[87],
				states = ioDevices_Data[910],
				attributes = ioDevices_Data[906],
				commands = ioDevices_Data[911]
			}
		}
	},
	["4586062999650306"] = { name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[910],
				attributes = ioDevices_Data[906],
				commands = ioDevices_Data[911]
			}
		}
	},
	["4587162511278082"] = { name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = ioDevices_Data[912],
				attributes = ioDevices_Data[906],
				commands = ioDevices_Data[911]
			}
		}
	},
	["4588262022905858"] = { name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[910],
				attributes = ioDevices_Data[906],
				commands = ioDevices_Data[911]
			}
		}
	},
	["4589361534533634"] = { name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:VerticalExteriorAwningIOComponent"] = {
				type = 1,
				widget = "PositionableScreen",
				uiClass = "ExteriorScreen",
				uiProfiles = ioDevices_Data[87],
				states = ioDevices_Data[910],
				attributes = ioDevices_Data[906],
				commands = ioDevices_Data[913]
			}
		}
	},
	["4590461046161410"] = { name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:PergolaSideScreenIOComponent"] = {
				type = 1,
				widget = "PergolaSideScreen",
				uiClass = "Pergola",
				uiProfiles = ioDevices_Data[479],
				states = ioDevices_Data[910],
				attributes = ioDevices_Data[906],
				commands = ioDevices_Data[913]
			}
		}
	},
	["4591560557789186"] = { name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:DropArmAwningIOComponent"] = {
				type = 1,
				widget = "DropArmAwning",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[483],
				states = ioDevices_Data[912],
				attributes = ioDevices_Data[906],
				commands = ioDevices_Data[913]
			}
		}
	},
	["4592660069416962"] = { name = "Sunilus,Sunilus Screen io",
		localPairing = true,
		["0"] = {
			["io:AwningValanceIOComponent"] = {
				type = 1,
				widget = "AwningValance",
				uiClass = "Awning",
				uiProfiles = ioDevices_Data[487],
				states = ioDevices_Data[910],
				attributes = ioDevices_Data[906],
				commands = ioDevices_Data[913]
			}
		}
	},
	["4517893279580162"] = ioDevices_Data[917],
	["4593759581044738"] = ioDevices_Data[920],
	["4594859092672514"] = ioDevices_Data[921],
	["4595958604300290"] = ioDevices_Data[922],
	["4597058115928066"] = ioDevices_Data[923],
	["4518992791207938"] = ioDevices_Data[917],
	["4598157627555842"] = ioDevices_Data[920],
	["4599257139183618"] = ioDevices_Data[921],
	["4600356650811394"] = ioDevices_Data[922],
	["4601456162439170"] = ioDevices_Data[923],
	["4579465929818114"] = ioDevices_Data[924],
	["4580565441445890"] = ioDevices_Data[924],
	["4581664953073666"] = { name = "T5 AS BHZ",
		localPairing = true,
		["0"] = {
			["io:RollerShutterGenericIOComponent"] = {
				type = 1,
				widget = "PositionableRollerShutter",
				uiClass = "RollerShutter",
				uiProfiles = ioDevices_Data[54],
				states = ioDevices_Data[727],
				attributes = {
					["core:SupportedManufacturerSettingsCommands"] = ioDevices_Attributes[76],
					["core:Manufacturer"] = ioDevices_Attributes[1],
					["core:FirmwareRevision"] = ioDevices_Attributes[0]
				},
				commands = {
					setName = ioDevices_Data[20],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setSecuredPosition = ioDevices_Data[53],
					setPosition = ioDevices_Data[48],
					my = ioDevices_Data[51],
					setConfigState = ioDevices_Data[25],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[63],
					setMemorized1Position = ioDevices_Data[47],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[724],
						converter = ioDevices_Converter[596],
						extraDefinition = ioDevices_Data[45]
					},
					setClosure = ioDevices_Data[38],
					close = ioDevices_Data[40],
					down = ioDevices_Data[40],
					open = ioDevices_Data[42],
					setDeployment = ioDevices_Data[38],
					up = ioDevices_Data[42],
					pairOneWayController = ioDevices_Data[17],
					refreshMemorized1Position = ioDevices_Data[37],
					advancedRefresh = ioDevices_Data[728]
				}
			}
		}
	},
	["4582764464701442"] = { name = "T5 Auto BHz",
		localPairing = true,
		["0"] = ioDevices_Data[619]
	},
	["4583863976329218"] = { name = "T5 BHZ",
		localPairing = true,
		["0"] = ioDevices_Data[734]
	},
	["4507997674012930"] = { name = "Teba Slateo A",
		localPairing = true,
		["0"] = {
			["io:AdjustableSlatsRollerShutterIOComponent"] = {
				type = 1,
				widget = "PositionableOrOrientableRollerShutter",
				uiClass = "AdjustableSlatsRollerShutter",
				uiProfiles = ioDevices_Data[72],
				states = {
					["84082687"] = {
						linkedHighLevelState = ioDevices_Data[925],
						linkedStateIds = ioDevices_Data[513]
					},
					["65537"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[355],
							ioDevices_HighLevelStates[17],
							ioDevices_HighLevelStates[16],
							ioDevices_HighLevelStates[10]
						},
						linkedStateIds = ioDevices_Data[514]
					},
					["65540"] = {
						linkedHighLevelState = {
							ioDevices_HighLevelStates[355],
							ioDevices_HighLevelStates[18]
						},
						linkedStateIds = ioDevices_Data[515]
					},
					["48177664"] = {
						linkedHighLevelState = ioDevices_Data[925],
						linkedStateIds = ioDevices_Data[516]
					},
					["2147426304"] = ioDevices_Data[4],
					["1"] = ioDevices_Data[3],
					["65557"] = ioDevices_Data[36],
					["2146500645"] = ioDevices_Data[57],
					["16830720"] = ioDevices_Data[35],
					["16832512"] = ioDevices_Data[74],
					["16832522"] = ioDevices_Data[75],
					["2"] = ioDevices_Data[505],
					["2146500638"] = ioDevices_Data[1]
				},
				attributes = ioDevices_Data[517],
				commands = {
					setName = ioDevices_Data[20],
					setOrientation = ioDevices_Data[83],
					sendIOKey = ioDevices_Data[65],
					keepOneWayControllersAndDeleteNode = ioDevices_Data[61],
					unpairOneWayController = ioDevices_Data[24],
					getName = ioDevices_Data[14],
					unpairAllOneWayControllersAndDeleteNode = ioDevices_Data[64],
					delayedStopIdentify = ioDevices_Data[13],
					identify = ioDevices_Data[15],
					unpairAllOneWayControllers = ioDevices_Data[23],
					setConfigState = ioDevices_Data[25],
					setClosureOrRockerPosition = ioDevices_Data[78],
					close = ioDevices_Data[79],
					down = ioDevices_Data[79],
					open = ioDevices_Data[80],
					setClosure = ioDevices_Data[81],
					setDeployment = ioDevices_Data[81],
					setRockerPosition = ioDevices_Data[82],
					up = ioDevices_Data[80],
					startIdentify = ioDevices_Data[21],
					stop = ioDevices_Data[84],
					stopIdentify = ioDevices_Data[22],
					wink = ioDevices_Data[26],
					setClosureOrOrientation = ioDevices_Data[77],
					runManufacturerSettingsCommand = {
						prototype = "string,object",
						parameters = ioDevices_Data[44],
						rawStates = ioDevices_Data[521],
						converter = ioDevices_Converter[598],
						extraDefinition = ioDevices_Data[45]
					},
					pairOneWayController = ioDevices_Data[17],
					advancedRefresh = {
						prototype = "string(normal;advanced;custom),*array",
						parameters = ioDevices_Data[8],
						rawStates = ioDevices_Data[521],
						converter = ioDevices_Converter[599],
						extraDefinition = ioDevices_Data[9]
					}
				}
			}
		}
	},
	["4509097185640706"] = { name = "Teba Slateo A",
		localPairing = true,
		["0"] = ioDevices_Data[523]
	}
}
