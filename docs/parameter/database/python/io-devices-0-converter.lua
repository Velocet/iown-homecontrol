{
	'function(arg_1_0)
		return depends("io-utils").computeDiscreteRSSILevel(arg_1_0)
	end',
	'function(arg_2_0)
		return depends("io-utils").toPercentValue(arg_2_0)
	end',
	'function(arg_3_0)
		return depends("io-utils").fromRawName(arg_3_0)
	end',
	'function(arg_4_0)
		if arg_4_0 >= -50 then
			return 100
		elseif arg_4_0 < -100 then
			return 0
		else
			return 2 * (arg_4_0 + 100)
		end
	end',
	'function(arg_5_0)
		return depends("io-utils").fromRawStatusState(arg_5_0)
	end',
	'function(arg_6_0)
		return depends("io-utils").getSoftwareVersionFromRawGeneralInfo(bytearray(arg_6_0, "base64"))
	end',
	'function(arg_7_0)
		return depends("io-utils").fromRawManufacturer(arg_7_0)
	end',
	'function(arg_8_0, arg_8_1)
		return depends("io-utils").readActivateFunc({})
	end',
	'function(arg_9_0)
		return depends("io-utils").createWinkValue(false, arg_9_0)
	end',
	'function()
		return depends("io-utils").createWinkValue(true, 3)
	end',
	'function(arg_11_0, arg_11_1)
		return depends("io-utils").handleOneWayController(arg_11_0, arg_11_1, 0)
	end',
	'function(arg_12_0)
		return arg_12_0 * 512
	end',
	'function(arg_13_0)
		return depends("io-utils").toRawName(arg_13_0), nil, nil, {
			access = "r"
		}
	end',
	'function()
		return depends("io-utils").createWinkValue(true, "forever")
	end',
	'function()
		return depends("io-utils").createWinkValue(false)
	end',
	'function()
		return 1
	end',
	'function(arg_17_0, arg_17_1)
		return depends("io-utils").handleOneWayController(arg_17_0, arg_17_1, 1)
	end',
	'function(arg_18_0)
		if arg_18_0 == "configuration" then
			return 0
		elseif arg_18_0 == "virgin" then
			return 1
		elseif arg_18_0 == "close" then
			return 2
		elseif arg_18_0 == "transmitting" then
			return 3
		end
	end',
	'function(arg_19_0)
		return depends("io-utils").createWinkValue(true, arg_19_0)
	end',
	'function(arg_20_0)
		if arg_20_0 == 51200 then
			return "closed"
		else
			return "open"
		end
	end',
	'function(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
		return depends("io-utils").toPercentTargetValue(arg_21_0, arg_21_1, {
			[55296] = arg_21_2,
			[55306] = arg_21_3
		})
	end',
	'function(arg_22_0)
		return bit.band(arg_22_0, 7)
	end',
	'function(arg_23_0)
		if arg_23_0 == 4 then
			return true
		else
			return false
		end
	end',
	'function(arg_24_0)
		return arg_24_0 * 512
	end',
	'function(arg_25_0, arg_25_1)
		return depends("io-utils").createActivateFunc(arg_25_0 * 512, {
			{
				1,
				arg_25_1 * 512
			}
		})
	end',
	'function(arg_26_0)
		return depends("io-utils").createActivateFunc(nil, {
			{
				1,
				arg_26_0 * 512
			}
		})
	end',
	'function(arg_27_0)
		if type(arg_27_0) == "string" then
			if arg_27_0 == "memorized1" or arg_27_0 == "my" then
				return 55296
			elseif arg_27_0 == "secured" then
				return 55306
			end
		else
			return arg_27_0 * 512
		end
	end',
	'function()
		return depends("io-utils").createActivateFunc(53760, {
			{
				1,
				53760
			}
		})
	end',
	'function(arg_29_0)
		return depends("io-utils").motorRelativePositionToDiscreteOpenClosed(arg_29_0)
	end',
	'function(arg_30_0)
		return nil
	end',
	'function(arg_31_0)
		return depends("io-utils").updateAdditionalStatusState(arg_31_0)
	end',
	'function()
		return bytearray({
			1,
			1
		})
	end',
	'function(arg_33_0, arg_33_1)
		error("Unknown command name : " .. arg_33_0)
	end',
	'function()
		return 53760
	end',
	'function()
		return bytearray({
			2,
			1
		})
	end',
	'function()
		return 1
	end',
	'function(arg_37_0)
		if arg_37_0 == 55307 then
			return "rocker"
		else
			return depends("io-utils").toPercentValue(arg_37_0)
		end
	end',
	'function(arg_38_0)
		if arg_38_0 == 55307 then
			return 100
		else
			return depends("io-utils").toPercentValue(arg_38_0)
		end
	end',
	'function(arg_39_0, arg_39_1)
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
	end',
	'function(arg_40_0)
		if type(arg_40_0) == "string" and arg_40_0 == "rocker" then
			return 55307
		end

		if type(arg_40_0) == "number" then
			return arg_40_0 * 512
		end

		return nil
	end',
	'function(arg_41_0)
		return depends("io-utils").createActivateFunc(nil, {
			{
				3,
				arg_41_0 * 512
			}
		})
	end',
	'function()
		return depends("io-utils").createActivateFunc(53760, {
			{
				3,
				53760
			}
		})
	end',
	'function(arg_43_0, arg_43_1)
		return depends("io-utils").createActivateFunc(arg_43_0 * 512, {
			{
				9,
				arg_43_1 * 512
			}
		})
	end',
	'function(arg_44_0)
		return depends("io-utils").createActivateFunc(nil, {
			{
				9,
				arg_44_0 * 512
			}
		})
	end',
	'function()
		return depends("io-utils").createActivateFunc(53760, {
			{
				9,
				53760
			}
		})
	end',
	'function(arg_46_0)
		if type(arg_46_0) == "string" then
			if arg_46_0 == "secured" then
				return 55306
			end
		else
			return arg_46_0 * 512
		end
	end',
	'function(arg_47_0)
		if arg_47_0 == 54272 then
			return nil
		else
			return depends("io-utils").toPercentValue(arg_47_0)
		end
	end',
	'function(arg_48_0)
		if arg_48_0 == 54272 then
			return "unknown"
		end

		return depends("io-utils").motorRelativePositionToDiscreteOpenClosed(arg_48_0)
	end',
	'function()
		return 51200
	end',
	'function()
		return 0
	end',
	'function(arg_51_0)
		return depends("io-utils").toPercentValue(51200 - arg_51_0)
	end',
	'function(arg_52_0)
		if arg_52_0 == 51200 then
			return "off"
		else
			return "on"
		end
	end',
	'function(arg_53_0)
		return depends("io-utils").createActivateFunc((100 - arg_53_0) * 512, {
			{
				1,
				54016
			}
		}), {
			category = "lighting"
		}
	end',
	'function(arg_54_0)
		if arg_54_0 == "on" then
			return 100
		else
			return 0
		end
	end',
	'function(arg_55_0, arg_55_1, arg_55_2)
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
	end',
	'function(arg_56_0)
		return {
			100,
			arg_56_0,
			0
		}
	end',
	'function(arg_57_0)
		return (100 - arg_57_0) * 512
	end',
	'function(arg_58_0)
		if type(arg_58_0) == "string" then
			if arg_58_0 == "memorized1" or arg_58_0 == "my" then
				return 55296
			elseif arg_58_0 == "secured" then
				return 55306
			end
		else
			return (100 - arg_58_0) * 512
		end
	end',
	'function(arg_59_0)
		if arg_59_0 > 0 then
			return "off"
		else
			return "on"
		end
	end',
	'function(arg_60_0)
		if arg_60_0 == "on" then
			return 0
		else
			return 51200
		end
	end',
	'function(arg_61_0, arg_61_1, arg_61_2)
		if arg_61_0 == nil or arg_61_1 == nil or arg_61_2 == nil then
			return overkiz.magic.IGNORE
		end

		var_61_0, var_61_1, var_61_2 = depends("io-utils").vectorToRGB(arg_61_0 / 51200, arg_61_1 / 51200, (51200 - arg_61_2) * 100 / 51200)

		return var_61_2
	end',
	'function(arg_62_0, arg_62_1, arg_62_2)
		if arg_62_0 == nil or arg_62_1 == nil or arg_62_2 == nil then
			return overkiz.magic.IGNORE
		end

		var_62_0, var_62_1, var_62_2 = depends("io-utils").vectorToRGB(arg_62_0 / 51200, arg_62_1 / 51200, (51200 - arg_62_2) * 100 / 51200)

		return var_62_1
	end',
	'function(arg_63_0, arg_63_1, arg_63_2)
		if arg_63_0 == nil or arg_63_1 == nil or arg_63_2 == nil then
			return overkiz.magic.IGNORE
		end

		var_63_0, var_63_1, var_63_2 = depends("io-utils").vectorToRGB(arg_63_0 / 51200, arg_63_1 / 51200, (51200 - arg_63_2) * 100 / 51200)

		return var_63_0
	end',
	'function(arg_64_0, arg_64_1, arg_64_2)
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
	end',
	'function(arg_65_0, arg_65_1, arg_65_2, arg_65_3)
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
	end',
	'function(arg_66_0)
		return depends("common", "utils").round(arg_66_0 * 4500 / 51200 + 2000)
	end',
	'function(arg_67_0, arg_67_1)
		return depends("io-utils").createActivateFunc(arg_67_1, {
			{
				14,
				(arg_67_0 - 2000) / 4500 * 51200
			}
		})
	end',
	'function(arg_68_0)
		if arg_68_0 > 0 then
			return "off"
		else
			return "on"
		end
	end',
	'function(arg_69_0)
		return 0, {
			category = "lighting"
		}, 51200, {
			category = "lighting",
			delay = arg_69_0
		}
	end',
	'function(arg_70_0)
		var_70_0 = nil

		return arg_70_0 == "on" and 0 or 51200, {
			category = "lighting"
		}
	end',
	'function(arg_71_0)
		if arg_71_0 == 54272 then
			return nil
		elseif arg_71_0 == 55303 then
			return nil
		else
			return depends("io-utils").toPercentValue(arg_71_0)
		end
	end',
	'function(arg_72_0, arg_72_1, arg_72_2)
		return depends("io-utils").toOpenClosedPedestrianState(arg_72_0, arg_72_1, arg_72_2)
	end',
	'function(arg_73_0)
		if type(arg_73_0) == "string" and arg_73_0 == "pedestrian" then
			return 55303
		end

		if type(arg_73_0) == "number" then
			return arg_73_0 * 512
		end

		return nil
	end',
	'function()
		return 55303
	end',
	'function(arg_75_0)
		if arg_75_0 > 0 then
			return "locked"
		else
			return "unlocked"
		end
	end',
	'function(arg_76_0)
		if arg_76_0 > 0 then
			return "closed"
		else
			return "open"
		end
	end',
	'function(arg_77_0)
		var_77_0 = nil
		var_77_1 = arg_77_0 == "closed" and 51200 or 0
		var_77_2 = 0

		return var_77_1, {
			access = "w"
		}, var_77_2, {
			access = "r",
			delay = 30
		}
	end',
	'function(arg_78_0)
		if arg_78_0 == "locked" then
			return "closed"
		else
			return "open"
		end
	end',
	'function(arg_79_0)
		if arg_79_0 == 0 then
			return "daylocked"
		elseif arg_79_0 == 1 then
			return "homesecure"
		elseif arg_79_0 == 2 then
			return "secured"
		else
			return "unknown"
		end
	end',
	'function(arg_80_0)
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
	end',
	'function(arg_81_0)
		if arg_81_0 == "closed" then
			return 51200
		else
			return 0
		end
	end',
	'function(arg_82_0)
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
	end',
	'function(arg_83_0, arg_83_1)
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
	end',
	'function(arg_84_0)
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
	end',
	'function(arg_85_0, arg_85_1, arg_85_2)
		return depends("io-utils").fromRawTemperatureValue(arg_85_0, arg_85_1, arg_85_2)
	end',
	'function(arg_86_0, arg_86_1, arg_86_2, arg_86_3, arg_86_4, arg_86_5)
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
	end',
	'function(arg_87_0, arg_87_1, arg_87_2)
		var_87_0 = depends("io-utils")

		if arg_87_0 == nil then
			return nil
		else
			return var_87_0.fromRawTemperatureValue(arg_87_0, arg_87_1, arg_87_2)
		end
	end',
	'function()
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
	end',
	'function()
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
	end',
	'function()
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
	end',
	'function()
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
	end',
	'function(arg_92_0)
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
	end',
	'function(arg_93_0, arg_93_1, arg_93_2, arg_93_3)
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
	end',
	'function(arg_94_0, arg_94_1)
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
	end',
	'function(arg_95_0, arg_95_1, arg_95_2)
		return depends("io-utils").toRawTemperatureValue(arg_95_0, arg_95_1, arg_95_2)
	end',
	'function(arg_96_0)
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
	end',
	'function(arg_97_0, arg_97_1, arg_97_2)
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
	end',
	'function(arg_98_0)
		return 0, {
			category = "onoff"
		}, 51200, {
			category = "onoff",
			delay = arg_98_0
		}
	end',
	'function(arg_99_0)
		var_99_0 = nil

		return arg_99_0 == "on" and 0 or 51200, {
			category = "onoff"
		}
	end',
	'function()
		return depends("io-utils").createActivateFunc(0, {
			{
				13,
				55296
			}
		})
	end',
	'function(arg_101_0)
		return depends("io-utils").createActivateFunc(0, {
			{
				13,
				arg_101_0
			}
		})
	end',
	'function(arg_102_0)
		var_102_0 = depends("io-utils")
		var_102_1 = nil

		return arg_102_0 == "on" and 0 or 51200
	end',
	'function(arg_103_0)
		return depends("io-somfy-utils").getParamValue(arg_103_0, 136)
	end',
	'function(arg_104_0)
		return depends("io-utils").getMicroModuleLowBattery(arg_104_0)
	end',
	'function(arg_105_0)
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
	end',
	'function(arg_106_0, arg_106_1)
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
	end',
	'function(arg_107_0, arg_107_1)
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
	end',
	'function(arg_108_0)
		return depends("io-utils").motorRelativePositionToDiscreteOpenClosed(arg_108_0, true)
	end',
	'function(arg_109_0)
		return 100 - arg_109_0
	end',
	'function(arg_110_0)
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
	end',
	'function(arg_111_0)
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
	end',
	'function(arg_112_0)
		return depends("io-utils").saveBoundValue(arg_112_0)
	end',
	'function(arg_113_0, arg_113_1)
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
	end',
	'function(arg_114_0)
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
	end',
	'function(arg_115_0)
		if type(arg_115_0) == "string" and (arg_115_0 == "my" or arg_115_0 == "memorized1") then
			return 55296
		else
			return arg_115_0 * 512
		end
	end',
	'function(arg_116_0)
		if arg_116_0 == 0 then
			return "on"
		else
			return "off"
		end
	end',
	'function()
		return 51200
	end',
	'function()
		return 0
	end',
	'function(arg_119_0)
		return depends("common", "utils").round(0.0023437499999999999 * arg_119_0 - 40, 1)
	end',
	'function(arg_120_0)
		return depends("common", "utils").round(0.0023437499999999999 * arg_120_0 - 40)
	end',
	'function(arg_121_0)
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
	end',
	'function(arg_122_0)
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
	end',
	'function(arg_123_0)
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
	end',
	'function(arg_124_0)
		return depends("common", "utils").round(51200 * (arg_124_0 + 40) / 120)
	end',
	'function(arg_125_0)
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
	end',
	'function(arg_126_0)
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
	end',
	'function(arg_127_0)
		if arg_127_0 == "my" or arg_127_0 == "memorized1" then
			return 55296
		elseif arg_127_0 == "secured" then
			return 55306
		else
			return arg_127_0 * 512
		end
	end',
	'function()
		return 53760
	end',
	'function()
		return 55296
	end',
	'function(arg_130_0, arg_130_1)
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
	end',
	'function(arg_131_0)
		if arg_131_0 == "securedVentilation" then
			return 55299
		elseif arg_131_0 == "my" then
			return 55296
		else
			return arg_131_0 * 512
		end
	end',
	'function(arg_132_0, arg_132_1)
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
	end',
	'function(arg_133_0)
		if arg_133_0 == 51200 then
			return "locked"
		else
			return "unlocked"
		end
	end',
	'function(arg_134_0, arg_134_1)
		if arg_134_1 == 55299 then
			return "securedVentilation"
		elseif arg_134_0 == 51200 then
			return "closed"
		else
			return "open"
		end
	end',
	'function(arg_135_0)
		var_135_0 = depends("io-somfy-utils").getParamValue(arg_135_0, 26)

		if var_135_0 ~= nil and var_135_0 >= 0 and var_135_0 < 61 then
			return var_135_0
		end
	end',
	'function(arg_136_0)
		if arg_136_0 == 59 then
			return "left"
		elseif arg_136_0 == 60 then
			return "right"
		end
	end',
	'function(arg_137_0)
		return depends("io-somfy-utils").getParamValue(arg_137_0, 142)
	end',
	'function(arg_138_0)
		return depends("io-somfy-utils").getParamValue(arg_138_0, 32)
	end',
	'function(arg_139_0)
		if arg_139_0 == 1 then
			return "enabled"
		else
			return "disabled"
		end
	end',
	'function(arg_140_0)
		return depends("io-somfy-utils").getParamValue(arg_140_0, 135)
	end',
	'function(arg_141_0)
		if arg_141_0 == 1 then
			return "activated"
		else
			return "deactivated"
		end
	end',
	'function(arg_142_0)
		return depends("io-somfy-utils").getParamValue(arg_142_0, 136)
	end',
	'function(arg_143_0)
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
	end',
	'function(arg_144_0)
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
	end',
	'function(arg_145_0)
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
	end',
	'function(arg_146_0)
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
	end',
	'function(arg_147_0)
		if type(arg_147_0) == "string" then
			if arg_147_0 == "memorized1" then
				return 55296
			elseif arg_147_0 == "secured" then
				return 55306
			end
		else
			return arg_147_0 * 512
		end
	end',
	'function(arg_148_0, arg_148_1)
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
	end',
	'function(arg_149_0)
		var_149_0 = 5

		return depends("io-utils").getBatteryLevelValue(arg_149_0, var_149_0)
	end',
	'function(arg_150_0)
		if arg_150_0 == 51200 then
			return "off"
		else
			return "on"
		end
	end',
	'function()
		var_151_0 = depends("io-utils")

		return 51200, {
			priority = var_151_0.priority.VERYHIGH
		}
	end',
	'function(arg_152_0, arg_152_1, arg_152_2, arg_152_3, arg_152_4, arg_152_5, arg_152_6, arg_152_7, arg_152_8, arg_152_9, arg_152_10)
		return depends("io-utils").ringWithDoubleSequence(arg_152_0, arg_152_1, arg_152_2, arg_152_3, arg_152_4, arg_152_5, arg_152_6, arg_152_7, arg_152_8, arg_152_9, arg_152_10)
	end',
	'function(arg_153_0, arg_153_1, arg_153_2, arg_153_3, arg_153_4, arg_153_5)
		return depends("io-utils").ringWithSingleSequence(arg_153_0, arg_153_1, arg_153_2, arg_153_3, arg_153_4, arg_153_5)
	end',
	'function(arg_154_0, arg_154_1, arg_154_2, arg_154_3, arg_154_4, arg_154_5, arg_154_6, arg_154_7, arg_154_8, arg_154_9, arg_154_10, arg_154_11, arg_154_12, arg_154_13, arg_154_14, arg_154_15)
		return depends("io-utils").ringWithThreeSequence(arg_154_0, arg_154_1, arg_154_2, arg_154_3, arg_154_4, arg_154_5, arg_154_6, arg_154_7, arg_154_8, arg_154_9, arg_154_10, arg_154_11, arg_154_12, arg_154_13, arg_154_14, arg_154_15)
	end',
	'function(arg_155_0)
		return arg_155_0
	end',
	'function(arg_156_0, arg_156_1, arg_156_2, arg_156_3, arg_156_4, arg_156_5, arg_156_6, arg_156_7, arg_156_8)
		return depends("io-utils").ringWithDoubleSequence(arg_156_0, arg_156_1, arg_156_2, arg_156_3, nil, arg_156_4, arg_156_5, arg_156_6, arg_156_7, nil, arg_156_8)
	end',
	'function(arg_157_0, arg_157_1, arg_157_2, arg_157_3, arg_157_4)
		return depends("io-utils").ringWithSingleSequence(arg_157_0, arg_157_1, arg_157_2, arg_157_3, nil, arg_157_4)
	end',
	'function(arg_158_0, arg_158_1, arg_158_2, arg_158_3, arg_158_4, arg_158_5, arg_158_6, arg_158_7, arg_158_8, arg_158_9, arg_158_10, arg_158_11, arg_158_12)
		return depends("io-utils").ringWithThreeSequence(arg_158_0, arg_158_1, arg_158_2, arg_158_3, nil, arg_158_4, arg_158_5, arg_158_6, arg_158_7, nil, arg_158_8, arg_158_9, arg_158_10, arg_158_11, nil, arg_158_12)
	end',
	'function(arg_159_0)
		return arg_159_0:readInt8(1)
	end',
	'function(arg_160_0)
		return depends("io-atlantic-utils").bytesToString(arg_160_0)
	end',
	'function(arg_161_0)
		return depends("io-atlantic-utils").fromDHWRawDateTime(arg_161_0)
	end',
	'function(arg_162_0)
		return depends("io-atlantic-utils").getManufacturerName(arg_162_0)
	end',
	'function(arg_163_0)
		if arg_163_0 == nil or #arg_163_0 < 4 then
			return nil
		end

		return arg_163_0:readUInt16(3)
	end',
	'function(arg_164_0)
		if arg_164_0 == nil or #arg_164_0 < 4 then
			return nil
		end

		return arg_164_0:readUInt16(3) / 10
	end',
	'function(arg_165_0)
		if arg_165_0 == nil or #arg_165_0 < 2 then
			return nil
		end

		return arg_165_0:readUInt16(1)
	end',
	'function(arg_166_0)
		if arg_166_0 == nil or #arg_166_0 < 2 then
			return nil
		end

		return arg_166_0:readUInt16(1) / 10
	end',
	'function(arg_167_0)
		if arg_167_0 == nil or #arg_167_0 == 0 then
			return nil
		end

		return arg_167_0:readUInt8(1)
	end',
	'function(arg_168_0)
		return depends("io-atlantic-utils").getCurrentOperatingMode(arg_168_0)
	end',
	'function(arg_169_0, arg_169_1, arg_169_2, arg_169_3, arg_169_4, arg_169_5, arg_169_6, arg_169_7)
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
	end',
	'function()
		return depends("io-atlantic-utils").fromRawVersion(p1)
	end',
	'function(arg_171_0)
		return arg_171_0:readUInt16(1)
	end',
	'function(arg_172_0)
		var_172_0 = arg_172_0:readUInt8(1)

		if var_172_0 == 255 then
			return "always"
		else
			return tostring(var_172_0)
		end
	end',
	'function(arg_173_0)
		return depends("io-atlantic-utils").getBoilerInstallationOption(arg_173_0)
	end',
	'function(arg_174_0)
		return arg_174_0:readUInt16(1)
	end',
	'function(arg_175_0)
		return depends("io-atlantic-utils").getDHWError(arg_175_0)
	end',
	'function(arg_176_0)
		return arg_176_0:readUInt8(1)
	end',
	'function(arg_177_0)
		if arg_177_0 == 0 then
			return "autoMode"
		elseif arg_177_0 == 1 then
			return "manualEcoActive"
		elseif arg_177_0 == 2 then
			return "manualEcoInactive"
		end
	end',
	'function(arg_178_0)
		return arg_178_0:readUInt16(3)
	end',
	'function(arg_179_0)
		return depends("io-atlantic-utils").getElectricalExtraManagement(arg_179_0)
	end',
	'function(arg_180_0)
		return depends("io-atlantic-utils").getExtractionOption(arg_180_0)
	end',
	'function(arg_181_0)
		return depends("io-atlantic-utils").getInstallation(arg_181_0)
	end',
	'function(arg_182_0)
		if arg_182_0 == nil or #arg_182_0 < 2 then
			return nil
		end

		return arg_182_0:readInt16(1) / 10
	end',
	'function(arg_183_0)
		return depends("io-atlantic-utils").getOperatingModeCapabilities(arg_183_0)
	end',
	'function(arg_184_0)
		return depends("io-atlantic-utils").getOperatingRange(arg_184_0)
	end',
	'function(arg_185_0)
		return depends("io-atlantic-utils").getUserProgSlotsDHW(arg_185_0)
	end',
	'function(arg_186_0)
		return depends("io-atlantic-utils").getRateManagement(arg_186_0)
	end',
	'function(arg_187_0)
		return depends("io-atlantic-utils").getSmartGridOption(arg_187_0)
	end',
	'function()
		var_188_0 = depends("io-utils")

		return var_188_0.getRefreshMethod(var_188_0.extendedInformationType.CURRENT_USING_DISCRETE_VALUE)
	end',
	'function(arg_189_0)
		return bytearray({
			arg_189_0
		})
	end',
	'function(arg_190_0)
		var_190_0 = arg_190_0

		if arg_190_0 == "always" then
			var_190_0 = 255
		end

		return bytearray({
			var_190_0
		})
	end',
	'function(arg_191_0)
		var_191_0 = nil
		var_191_1 = arg_191_0 == "heatPumpPriority" and 0 or arg_191_0 == "heatPumpOptimising" and 1 or arg_191_0 == "boilerOptimising" and 2 or 3

		return bytearray({
			var_191_1
		})
	end',
	'function(arg_192_0)
		return depends("io-atlantic-utils").setCurrentOperatingMode(arg_192_0)
	end',
	'function(arg_193_0)
		var_193_0 = 0

		if arg_193_0 == "manualEcoActive" then
			var_193_0 = 1
		elseif arg_193_0 == "manualEcoInactive" then
			var_193_0 = 2
		end

		return bytearray({
			var_193_0
		})
	end',
	'function(arg_194_0)
		return depends("io-atlantic-utils").toDHWRawDateTime(arg_194_0)
	end',
	'function(arg_195_0)
		var_195_0 = 1

		if arg_195_0 == "auto" then
			var_195_0 = 0
		end

		return bytearray({
			var_195_0
		})
	end',
	'function(arg_196_0)
		var_196_0 = nil
		var_196_1 = arg_196_0 == "noExtraction" and 0 or arg_196_0 == "lowExtractionSpeed" and 1 or 2

		return bytearray({
			var_196_1
		})
	end',
	'function(arg_197_0)
		var_197_0 = nil
		var_197_1 = arg_197_0 == "onlyThermodynamic" and 0 or arg_197_0 == "extraBoiler" and 1 or 2

		return bytearray({
			var_197_1
		})
	end',
	'function(arg_198_0)
		var_198_0 = nil
		var_198_1 = arg_198_0 == "pacProg_elecProg" and 1 or 4

		return bytearray({
			var_198_1
		})
	end',
	'function(arg_199_0)
		return depends("io-atlantic-utils").setUserProgSlotsDHW(arg_199_0)
	end',
	'function(arg_200_0)
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
	end',
	'function(arg_201_0)
		var_201_0 = 0

		if arg_201_0 == "active" then
			var_201_0 = 1
		end

		return bytearray({
			var_201_0
		})
	end',
	'function(arg_202_0, arg_202_1, arg_202_2)
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
	end',
	'function(arg_203_0)
		return arg_203_0:readUInt32(1)
	end',
	'function(arg_204_0)
		if arg_204_0 == 64512 then
			return "off"
		else
			return "on"
		end
	end',
	'function(arg_205_0)
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
	end',
	'function(arg_206_0)
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
	end',
	'function(arg_207_0)
		var_207_0 = depends("io-utils")

		return var_207_0.createActivateFunc(var_207_0.toRawHeatingLevel(arg_207_0), {
			{
				11,
				0
			}
		}), {
			originator = 1
		}
	end',
	'function(arg_208_0)
		var_208_0 = depends("io-utils")

		return var_208_0.createActivateFunc(var_208_0.toRawHeatingLevel(arg_208_0), {
			{
				11,
				65535
			}
		}), {
			originator = 1
		}
	end',
	'function(arg_209_0, arg_209_1)
		var_209_0 = depends("io-utils")

		return var_209_0.createActivateFunc(var_209_0.toRawHeatingLevel(arg_209_0), {
			{
				11,
				arg_209_1
			}
		}), {
			originator = 1
		}
	end',
	'function(arg_210_0)
		return arg_210_0:readInt8(15)
	end',
	'function(arg_211_0)
		return depends("io-atlantic-utils").getTimeProgram(arg_211_0)
	end',
	'function(arg_212_0)
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
	end',
	'function(arg_213_0)
		return depends("io-atlantic-utils").getCO2History(arg_213_0)
	end',
	'function(arg_214_0)
		return bit.lshift(arg_214_0:readInt16(29), 16) + arg_214_0:readInt16(31)
	end',
	'function(arg_215_0)
		return arg_215_0:readUInt16(9)
	end',
	'function(arg_216_0)
		return arg_216_0:readUInt16(7)
	end',
	'function(arg_217_0)
		return arg_217_0:readInt8(16)
	end',
	'function(arg_218_0)
		return arg_218_0:readInt16(13)
	end',
	'function(arg_219_0)
		return depends("io-atlantic-utils").getSensorsErrorState(arg_219_0)
	end',
	'function(arg_220_0)
		if arg_220_0 == 64514 then
			return "eco"
		elseif arg_220_0 == 64513 then
			return "comfort"
		elseif arg_220_0 == 64512 then
			return "standard"
		else
			return "unknown"
		end
	end',
	'function(arg_221_0)
		return depends("io-atlantic-utils").getVentilationMode(arg_221_0)
	end',
	'function()
		return bytearray({
			12,
			0,
			1
		})
	end',
	'function()
		return bytearray({
			12,
			0,
			2
		})
	end',
	'function(arg_224_0, arg_224_1, arg_224_2)
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
	end',
	'function(arg_225_0)
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
	end',
	'function(arg_226_0)
		return depends("io-atlantic-utils").setTimeProgram(arg_226_0)
	end',
	'function(arg_227_0)
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
	end',
	'function(arg_228_0)
		return depends("io-atlantic-utils").setVentilationMode(arg_228_0)
	end',
	'function(arg_229_0)
		return arg_229_0:readInt16(11) / 10
	end',
	'function(arg_230_0)
		return arg_230_0:readInt16(3) / 10
	end',
	'function(arg_231_0)
		return arg_231_0:readInt16(7) / 10
	end',
	'function(arg_232_0)
		return arg_232_0:readInt16(5) / 10
	end',
	'function(arg_233_0)
		return arg_233_0:readInt16(9) / 10
	end',
	'function(arg_234_0)
		return depends("io-utils").getSensorDefect(arg_234_0)
	end',
	'function(arg_235_0)
		return arg_235_0
	end',
	'function(arg_236_0)
		return depends("io-utils").sensedUnit[arg_236_0]
	end',
	'function(arg_237_0)
		return arg_237_0 - 273.14999999999998
	end',
	'function(arg_238_0)
		var_238_0 = depends("io-utils").sensedUnit[arg_238_0]

		if var_238_0 == "core:TemperatureInKelvin" then
			return "core:TemperatureInCelcius"
		else
			return var_238_0
		end
	end',
	'function(arg_239_0)
		if arg_239_0 == nil or #arg_239_0 ~= 7 then
			return nil
		end

		var_239_0 = depends("io-utils").scaleFactors[arg_239_0[3]]

		if var_239_0 == nil then
			return nil
		end

		return arg_239_0:readUInt32(4) / var_239_0
	end',
	'function(arg_240_0)
		return depends("io-utils").fromRawName(arg_240_0)
	end',
	'function(arg_241_0)
		return depends("io-atlantic-utils").getTotal(arg_241_0)
	end',
	'function(arg_242_0, arg_242_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_242_0, arg_242_1, 0, 1)
	end',
	'function(arg_243_0, arg_243_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_243_0, arg_243_1, 0, 2)
	end',
	'function(arg_244_0, arg_244_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_244_0, arg_244_1, 0, 3)
	end',
	'function(arg_245_0, arg_245_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_245_0, arg_245_1, 0, 4)
	end',
	'function(arg_246_0, arg_246_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_246_0, arg_246_1, 0, 5)
	end',
	'function(arg_247_0, arg_247_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_247_0, arg_247_1, 0, 6)
	end',
	'function(arg_248_0, arg_248_1)
		return depends("io-atlantic-utils").getUsageTotalFor(arg_248_0, arg_248_1, 0)
	end',
	'function(arg_249_0, arg_249_1)
		error("advanced refresh not implemented")
	end',
	'function(arg_250_0, arg_250_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_250_0, arg_250_1, 1, 1)
	end',
	'function(arg_251_0, arg_251_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_251_0, arg_251_1, 1, 2)
	end',
	'function(arg_252_0, arg_252_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_252_0, arg_252_1, 1, 3)
	end',
	'function(arg_253_0, arg_253_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_253_0, arg_253_1, 1, 4)
	end',
	'function(arg_254_0, arg_254_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_254_0, arg_254_1, 1, 5)
	end',
	'function(arg_255_0, arg_255_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_255_0, arg_255_1, 1, 6)
	end',
	'function(arg_256_0, arg_256_1)
		return depends("io-atlantic-utils").getUsageTotalFor(arg_256_0, arg_256_1, 1)
	end',
	'function(arg_257_0, arg_257_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_257_0, arg_257_1, 2, 1)
	end',
	'function(arg_258_0, arg_258_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_258_0, arg_258_1, 2, 2)
	end',
	'function(arg_259_0, arg_259_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_259_0, arg_259_1, 2, 3)
	end',
	'function(arg_260_0, arg_260_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_260_0, arg_260_1, 2, 4)
	end',
	'function(arg_261_0, arg_261_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_261_0, arg_261_1, 2, 5)
	end',
	'function(arg_262_0, arg_262_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_262_0, arg_262_1, 2, 6)
	end',
	'function(arg_263_0, arg_263_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_263_0, arg_263_1, 3, 1)
	end',
	'function(arg_264_0, arg_264_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_264_0, arg_264_1, 3, 2)
	end',
	'function(arg_265_0, arg_265_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_265_0, arg_265_1, 3, 3)
	end',
	'function(arg_266_0, arg_266_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_266_0, arg_266_1, 3, 4)
	end',
	'function(arg_267_0, arg_267_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_267_0, arg_267_1, 3, 5)
	end',
	'function(arg_268_0, arg_268_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_268_0, arg_268_1, 3, 6)
	end',
	'function(arg_269_0, arg_269_1)
		return depends("io-atlantic-utils").getUsageTotalFor(arg_269_0, arg_269_1, 3)
	end',
	'function(arg_270_0, arg_270_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_270_0, arg_270_1, 15, 1)
	end',
	'function(arg_271_0, arg_271_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_271_0, arg_271_1, 15, 2)
	end',
	'function(arg_272_0, arg_272_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_272_0, arg_272_1, 15, 3)
	end',
	'function(arg_273_0, arg_273_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_273_0, arg_273_1, 15, 4)
	end',
	'function(arg_274_0, arg_274_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_274_0, arg_274_1, 15, 5)
	end',
	'function(arg_275_0, arg_275_1)
		return depends("io-atlantic-utils").getUsageByRateFor(arg_275_0, arg_275_1, 15, 6)
	end',
	'function(arg_276_0, arg_276_1)
		return depends("io-atlantic-utils").getUsageTotalFor(arg_276_0, arg_276_1, 15)
	end',
	'function(arg_277_0)
		if arg_277_0 == 1 then
			return "on"
		else
			return "off"
		end
	end',
	'function(arg_278_0)
		if arg_278_0 == "on" then
			return bytearray({
				1
			})
		else
			return bytearray({
				0
			})
		end
	end',
	'function(arg_279_0)
		return bit.rshift(arg_279_0[1], 4)
	end',
	'function(arg_280_0)
		return depends("io-atlantic-utils").fromRawName(arg_280_0:sub(1, 16))
	end',
	'function(arg_281_0)
		return arg_281_0[18]
	end',
	'function(arg_282_0)
		return bytearray(1):writeUInt8(1, arg_282_0)
	end',
	'function(arg_283_0)
		if arg_283_0 == 0 then
			return "on"
		elseif arg_283_0 == 1 then
			return "off"
		end
	end',
	'function(arg_284_0)
		if arg_284_0 == 0 then
			return "config1"
		elseif arg_284_0 == 1 then
			return "config2"
		end
	end',
	'function(arg_285_0)
		if arg_285_0 == "config1" then
			return bytearray({
				0
			})
		elseif arg_285_0 == "config2" then
			return bytearray({
				1
			})
		end
	end',
	'function(arg_286_0)
		if arg_286_0 == "on" then
			return bytearray({
				0
			})
		elseif arg_286_0 == "off" then
			return bytearray({
				1
			})
		end
	end',
	'function(arg_287_0)
		return arg_287_0 ~= nil and arg_287_0 ~= 0
	end',
	'function(arg_288_0)
		if arg_288_0 then
			return "detected"
		else
			return "notDetected"
		end
	end',
	'function(arg_289_0)
		return depends("io-fumix-utils").maintenanceRadioPartBatteryConverter(arg_289_0)
	end',
	'function(arg_290_0)
		return depends("io-fumix-utils").maintenanceSensorPartBatteryConverter(arg_290_0)
	end',
	'function(arg_291_0)
		return depends("io-utils").getDirtyRoomDefect(arg_291_0)
	end',
	'function(arg_292_0)
		if arg_292_0 == "short" then
			return 1
		elseif arg_292_0 == "long" then
			return 0
		else
			return nil
		end
	end',
	'function(arg_293_0)
		if arg_293_0 then
			return "open"
		else
			return "closed"
		end
	end',
	'function(arg_294_0)
		if arg_294_0 == "maintenanceRequired" then
			return "lowBattery"
		else
			return arg_294_0
		end
	end',
	'function(arg_295_0)
		if arg_295_0 then
			return "personInside"
		else
			return "noPersonInside"
		end
	end',
	'function(arg_296_0)
		return arg_296_0 ~= nil and arg_296_0 == 65535
	end',
	'function(arg_297_0)
		if arg_297_0 then
			return "detected"
		else
			return "notDetected"
		end
	end',
	'function(arg_298_0)
		return depends("io-utils").toMultiTypeSensorTiltedValue(arg_298_0)
	end',
	'function(arg_299_0)
		return depends("io-utils").toMultiTypeSensorOpenClosedValue(arg_299_0)
	end',
	'function(arg_300_0)
		return depends("io-utils").toMultiTypeSensorLockedUnlockedValue(arg_300_0)
	end',
	'function(arg_301_0)
		return arg_301_0.maxSensedValue
	end',
	'function(arg_302_0)
		return depends("io-utils").sensedUnit[arg_302_0.measuredValueType]
	end',
	'function(arg_303_0)
		return arg_303_0.minSensedValue
	end',
	'function(arg_304_0)
		return true
	end',
	'function(arg_305_0)
		return arg_305_0:readUInt8(13)
	end',
	'function(arg_306_0, arg_306_1)
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
	end',
	'function(arg_307_0)
		if arg_307_0 == "dpcActuators" then
			return 4
		elseif arg_307_0 == "unsetActuators" then
			return 5
		end

		return nil
	end',
	'function()
		return 4
	end',
	'function(arg_309_0)
		if arg_309_0 == "all" then
			return 1
		elseif arg_309_0 == "inConfigurationState" then
			return 2
		elseif arg_309_0 == "alreadyInTheNetwork" then
			return 3
		end

		return nil
	end',
	'function(arg_310_0)
		if arg_310_0 == "all" then
			return 1
		elseif arg_310_0 == "inConfigurationState" then
			return 2
		end

		return nil
	end',
	'function(arg_311_0, arg_311_1)
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
	end',
	'function()
		return 1
	end',
	'function()
		return depends("io-utils").generateIOKey()
	end',
	'function()
		return 630
	end',
	'function(arg_315_0)
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
	end',
	'function(arg_316_0)
		return tostring(arg_316_0)
	end',
	'function(arg_317_0)
		if arg_317_0 == 255 then
			return "released"
		elseif arg_317_0 == 256 then
			return "stop"
		else
			return "pressed"
		end
	end',
	'function(arg_318_0, arg_318_1)
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
	end',
	'function(arg_319_0, arg_319_1)
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
	end',
	'function(arg_320_0)
		if arg_320_0 == 55296 then
			return "tight"
		else
			return depends("io-utils").toPercentValue(arg_320_0)
		end
	end',
	'function(arg_321_0)
		if type(arg_321_0) == "string" then
			if arg_321_0 == "tight" then
				return 55296
			end
		else
			return arg_321_0 * 512
		end
	end',
	'function(arg_322_0, arg_322_1, arg_322_2, arg_322_3, arg_322_4, arg_322_5)
		return depends("io-utils").toPercentTargetValue(arg_322_0, arg_322_1, {
			[55306] = arg_322_2,
			[55297] = arg_322_3,
			[55298] = arg_322_4,
			[55299] = arg_322_5
		})
	end',
	'function(arg_323_0, arg_323_1)
		if arg_323_0 == 54272 then
			return "unknown"
		elseif arg_323_0 == arg_323_1 or arg_323_0 == 55305 then
			return "partial"
		end

		return depends("io-utils").motorRelativePositionToDiscreteOpenClosed(arg_323_0)
	end',
	'function()
		return 55305
	end',
	'function(arg_325_0)
		if arg_325_0 == 54272 then
			return "unknown"
		elseif arg_325_0 > 0 then
			return "locked"
		else
			return "unlocked"
		end
	end',
	'function(arg_326_0)
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
	end',
	'function(arg_327_0)
		var_327_0 = nil
		var_327_1 = arg_327_0 == "locked" and 51200 or 0
		var_327_2 = 0

		return var_327_1, {
			access = "w"
		}, var_327_2, {
			access = "r",
			delay = 30
		}
	end',
	'function(arg_328_0)
		if arg_328_0 == "closed" then
			return "locked"
		else
			return "unlocked"
		end
	end',
	'function()
		var_329_0 = depends("io-utils")

		return var_329_0.createActivateMode(var_329_0.standardReceiver.switchActivationMode, var_329_0.standardReceiver.temporizedOnModeParameter)
	end',
	'function(arg_330_0)
		if type(arg_330_0) == "string" then
			if arg_330_0 == "memorized1" or arg_330_0 == "my" then
				return 55296
			end
		else
			return arg_330_0 * 512
		end
	end',
	'function(arg_331_0)
		return arg_331_0 / 100 - 273.14999999999998
	end',
	'function(arg_332_0, arg_332_1, arg_332_2, arg_332_3, arg_332_4, arg_332_5)
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
	end',
	'function(arg_333_0)
		if arg_333_0 == 0 then
			return 200
		else
			return 270
		end
	end',
	'function(arg_334_0)
		return depends("common", "utils").round((arg_334_0 + 273.14999999999998) * 100)
	end',
	'function(arg_335_0)
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
	end',
	'function(arg_336_0)
		return bit.band(bit.rshift(arg_336_0[1], 6), 3)
	end',
	'function(arg_337_0)
		if arg_337_0 == 0 then
			return "none"
		else
			return arg_337_0
		end
	end',
	'function(arg_338_0)
		return arg_338_0[2]
	end',
	'function(arg_339_0)
		return arg_339_0[1] / 2
	end',
	'function(arg_340_0)
		return arg_340_0[2] / 2
	end',
	'function(arg_341_0)
		var_341_0 = arg_341_0:readUInt32(7)

		if var_341_0 == 0 then
			return nil
		else
			return var_341_0 * 1000
		end
	end',
	'function(arg_342_0)
		var_342_0 = arg_342_0:readUInt32(3)

		if var_342_0 == 0 then
			return nil
		else
			return var_342_0 * 1000
		end
	end',
	'function(arg_343_0)
		return arg_343_0[3] / 2
	end',
	'function(arg_344_0)
		return arg_344_0[5] / 2
	end',
	'function(arg_345_0)
		return arg_345_0:readUInt8(2) / 2
	end',
	'function(arg_346_0)
		return arg_346_0:readUInt8(3) / 2
	end',
	'function(arg_347_0)
		return bit.band(arg_347_0[1], 1)
	end',
	'function(arg_348_0)
		return ({
			[0] = "closed",
			"open"
		})[arg_348_0]
	end',
	'function(arg_349_0)
		return ({
			[0] = "inactive",
			"active"
		})[arg_349_0]
	end',
	'function(arg_350_0)
		return bit.band(bit.rshift(arg_350_0[1], 1), 1)
	end',
	'function(arg_351_0)
		return ({
			[0] = "auto",
			"manual"
		})[arg_351_0]
	end',
	'function(arg_352_0)
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
	end',
	'function(arg_353_0)
		return arg_353_0:readUInt8(6) / 2
	end',
	'function(arg_354_0)
		var_354_0 = bit.band(arg_354_0[4], 128) ~= 0
		arg_354_0[4] = bit.band(arg_354_0[4], 127)
		var_354_1 = arg_354_0:readInt16(4)

		if var_354_0 then
			var_354_1 = -1 * var_354_1
		end

		return var_354_1 / 10
	end',
	'function(arg_355_0)
		return depends("io-utils").SomfyHeatingSystem.getCalendar(arg_355_0)
	end',
	'function(arg_356_0)
		return depends("io-utils").SomfyHeatingSystem.expandCalendar(arg_356_0)
	end',
	'function(arg_357_0)
		return arg_357_0[2] / 2
	end',
	'function(arg_358_0)
		return bit.band(bit.rshift(arg_358_0[1], 2), 1)
	end',
	'function(arg_359_0)
		return ({
			[0] = "disable",
			"enable"
		})[arg_359_0]
	end',
	'function(arg_360_0)
		return bit.band(bit.rshift(arg_360_0[1], 3), 31)
	end',
	'function(arg_361_0)
		return depends("io-utils").SomfyHeatingSystem.modes[arg_361_0]
	end',
	'function(arg_362_0)
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
	end',
	'function(arg_363_0)
		var_363_0 = arg_363_0[1]
		var_363_1 = bit.band(var_363_0, 7)

		return ({
			[0] = "date",
			"further_notice",
			"next_mode"
		})[var_363_1]
	end',
	'function(arg_364_0)
		return arg_364_0[4] / 2
	end',
	'function(arg_365_0)
		return ({
			[0] = "disable",
			"enable"
		})[arg_365_0]
	end',
	'function(arg_366_0)
		return arg_366_0[6] / 2
	end',
	'function(arg_367_0)
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
	end',
	'function(arg_368_0, arg_368_1)
		var_368_0 = depends("io-utils")
		var_368_1 = var_368_0.SomfyHeatingSystem.setDerogation(0, "derog", arg_368_0, arg_368_1)

		return var_368_0.updateAndRefreshPublicState(var_368_1, 42529, 2)
	end',
	'function(arg_369_0, arg_369_1, arg_369_2, arg_369_3, arg_369_4, arg_369_5)
		var_369_0 = depends("io-utils")
		var_369_1 = var_369_0.SomfyHeatingSystem.updateAllModeTemperatures(arg_369_0, arg_369_1, arg_369_2, arg_369_3, arg_369_4, arg_369_5)

		return var_369_0.updateAndRefreshPublicState(var_369_1, 42533, 2)
	end',
	'function(arg_370_0, arg_370_1, arg_370_2, arg_370_3)
		var_370_0 = depends("io-utils")
		var_370_1 = var_370_0.SomfyHeatingSystem.updateDerogation(arg_370_0, arg_370_1, arg_370_2, arg_370_3)

		return var_370_0.updateAndRefreshPublicState(var_370_1, 42529, 2)
	end',
	'function(arg_371_0, arg_371_1)
		var_371_0 = depends("io-utils")
		var_371_1 = var_371_0.SomfyHeatingSystem.setCalendar(arg_371_1)

		return var_371_0.updateAndRefreshPublicState(var_371_1, var_371_0.SomfyHeatingSystem.getCalendarStateId(arg_371_0), 2)
	end',
	'function(arg_372_0, arg_372_1, arg_372_2)
		var_372_0 = depends("io-utils")
		var_372_1 = var_372_0.SomfyHeatingSystem.updateValveSettings(arg_372_0, arg_372_1, arg_372_2)

		return var_372_0.updateAndRefreshPublicState(var_372_1, 42532, 2)
	end',
	'function(arg_373_0)
		return arg_373_0:readInt16(2) / 10
	end',
	'function(arg_374_0, arg_374_1)
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
	end',
	'function(arg_375_0)
		return depends("io-utils").fromRawTemperatureValue(arg_375_0, 29315, 33515)
	end',
	'function(arg_376_0, arg_376_1, arg_376_2, arg_376_3, arg_376_4, arg_376_5)
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
	end',
	'function(arg_377_0)
		var_377_0 = depends("io-utils")

		if arg_377_0 == nil then
			return nil
		else
			return var_377_0.fromRawTemperatureValue(arg_377_0, 29315, 33515)
		end
	end',
	'function(arg_378_0)
		return depends("io-utils").toRawTemperatureValue(arg_378_0, 29315, 33515)
	end',
	'function(arg_379_0)
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
	end',
	'function(arg_380_0)
		return bit.band(bit.rshift(arg_380_0[1], 4), 3)
	end',
	'function(arg_381_0)
		return bit.band(bit.rshift(arg_381_0[1], 3), 1)
	end',
	'function(arg_382_0)
		return ({
			[0] = "heating",
			"cooling"
		})[arg_382_0]
	end',
	'function(arg_383_0)
		return arg_383_0:readInt8(6) / 2
	end',
	'function(arg_384_0)
		return arg_384_0:readInt8(5) / 10
	end',
	'function(arg_385_0)
		var_385_0 = bit.band(arg_385_0[4], 128) ~= 0
		arg_385_0[4] = bit.band(arg_385_0[4], 127)
		var_385_1 = arg_385_0:readInt8(4)

		if var_385_0 then
			var_385_1 = -1 * var_385_1
		end

		return var_385_1 / 10
	end',
	'function(arg_386_0, arg_386_1, arg_386_2)
		var_386_0 = depends("io-utils")
		var_386_1 = var_386_0.SomfyHeatingSystem.updateThermostatSettings(arg_386_0, arg_386_1, arg_386_2)

		return var_386_0.updateAndRefreshPublicState(var_386_1, 42532, 2)
	end',
	'function(arg_387_0)
		return arg_387_0:readInt8(9)
	end',
	'function(arg_388_0)
		return 100 - depends("io-utils").toPercentValue(arg_388_0)
	end',
	'function(arg_389_0)
		if arg_389_0 == nil or #arg_389_0 < 2 then
			return nil
		end

		return arg_389_0:readUInt16(1)
	end',
	'function(arg_390_0)
		return depends("io-atlantic-utils").readBit(arg_390_0[1], 1)
	end',
	'function(arg_391_0)
		if arg_391_0 == 0 then
			return "off"
		else
			return "Heating"
		end
	end',
	'function(arg_392_0)
		if arg_392_0 == 0 then
			return "Relaunch Disable"
		else
			return " Relaunch Enable"
		end
	end',
	'function(arg_393_0)
		if arg_393_0 == 0 then
			return "off"
		elseif arg_393_0 == 1 then
			return "on"
		else
			return "prog"
		end
	end',
	'function(arg_394_0)
		var_394_0 = nil
		var_394_1 = arg_394_0 == "off" and 0 or arg_394_0 == "on" and 1 or 2

		return bytearray({
			var_394_1
		})
	end',
	'function(arg_395_0)
		return bytearray(2):writeInt16(1, arg_395_0 * 10, true)
	end',
	'function(arg_396_0)
		if arg_396_0 == 0 then
			return "up"
		elseif arg_396_0 == 51200 then
			return "down"
		elseif arg_396_0 == 53760 then
			return "stop"
		end

		return nil
	end',
	'function(arg_397_0, arg_397_1, arg_397_2)
		return depends("io-dynamic-actuator-controllables-adapter-utils").getFeatures("io:DynamicRollerShutterIOComponent", arg_397_0, arg_397_1, arg_397_2)
	end',
	'function(arg_398_0)
		return arg_398_0 * 110
	end',
	'function(arg_399_0, arg_399_1, arg_399_2)
		var_399_0 = depends("io-devices-settings-utils")
		var_399_1 = depends("common_utils")
		var_399_2 = depends("io-somfy-devices-settings-utils")

		return var_399_0.aggregateConfig({
			["84059651"] = arg_399_0,
			["65537"] = arg_399_1,
			["84059661"] = arg_399_2
		}, var_399_1.deepCopy(var_399_2.states_4504699139653634))
	end',
	'function(arg_400_0)
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
	end',
	'function(arg_401_0, arg_401_1, arg_401_2, arg_401_3, arg_401_4)
		var_401_0 = depends("io-devices-settings-utils")
		var_401_1 = depends("io-somfy-devices-settings-utils")
		var_401_2 = depends("common_utils")

		return var_401_0.runConfig(arg_401_0, arg_401_1, var_401_2.deepCopy(var_401_1.commands_4504699139653634), {
			["84059651"] = arg_401_2,
			["65537"] = arg_401_3,
			["84059661"] = arg_401_4
		}, var_401_2.deepCopy(var_401_1.states_4504699139653634), var_401_2.deepCopy(var_401_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_402_0, arg_402_1, arg_402_2, arg_402_3, arg_402_4)
		var_402_0 = depends("io-devices-settings-utils")
		var_402_1 = depends("common_utils")
		var_402_2 = depends("io-somfy-devices-settings-utils")

		return var_402_0.advancedRefresh(arg_402_0, arg_402_1, {
			["84059651"] = arg_402_2,
			["65537"] = arg_402_3,
			["84059661"] = arg_402_4
		}, var_402_1.deepCopy(var_402_2.states_4504699139653634), {}, var_402_1.deepCopy(var_402_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_403_0, arg_403_1, arg_403_2, arg_403_3)
		var_403_0 = depends("io-devices-settings-utils")
		var_403_1 = depends("common_utils")
		var_403_2 = depends("io-somfy-devices-settings-utils")

		return var_403_0.aggregateConfig({
			["84082687"] = arg_403_0,
			["65537"] = arg_403_1,
			["65540"] = arg_403_2,
			["48177664"] = arg_403_3
		}, var_403_1.deepCopy(var_403_2.states_4504699139129602))
	end',
	'function(arg_404_0)
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
	end',
	'function(arg_405_0, arg_405_1, arg_405_2, arg_405_3, arg_405_4, arg_405_5)
		var_405_0 = depends("io-devices-settings-utils")
		var_405_1 = depends("io-somfy-devices-settings-utils")
		var_405_2 = depends("common_utils")

		return var_405_0.runConfig(arg_405_0, arg_405_1, var_405_2.deepCopy(var_405_1.commands_4504699139129602), {
			["84082687"] = arg_405_2,
			["65537"] = arg_405_3,
			["65540"] = arg_405_4,
			["48177664"] = arg_405_5
		}, var_405_2.deepCopy(var_405_1.states_4504699139129602), var_405_2.deepCopy(var_405_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_406_0, arg_406_1, arg_406_2, arg_406_3, arg_406_4, arg_406_5)
		var_406_0 = depends("io-devices-settings-utils")
		var_406_1 = depends("common_utils")
		var_406_2 = depends("io-somfy-devices-settings-utils")

		return var_406_0.advancedRefresh(arg_406_0, arg_406_1, {
			["84082687"] = arg_406_2,
			["65537"] = arg_406_3,
			["65540"] = arg_406_4,
			["48177664"] = arg_406_5
		}, var_406_1.deepCopy(var_406_2.states_4504699139129602), {}, var_406_1.deepCopy(var_406_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_407_0, arg_407_1, arg_407_2, arg_407_3)
		var_407_0 = depends("io-devices-settings-utils")
		var_407_1 = depends("common_utils")
		var_407_2 = depends("io-somfy-devices-settings-utils")

		return var_407_0.aggregateConfig({
			["84082687"] = arg_407_0,
			["65537"] = arg_407_1,
			["65540"] = arg_407_2,
			["48177664"] = arg_407_3
		}, var_407_1.deepCopy(var_407_2.states_4505798650757378))
	end',
	'function(arg_408_0, arg_408_1, arg_408_2, arg_408_3, arg_408_4, arg_408_5)
		var_408_0 = depends("io-devices-settings-utils")
		var_408_1 = depends("io-somfy-devices-settings-utils")
		var_408_2 = depends("common_utils")

		return var_408_0.runConfig(arg_408_0, arg_408_1, var_408_2.deepCopy(var_408_1.commands_4504699139129602), {
			["84082687"] = arg_408_2,
			["65537"] = arg_408_3,
			["65540"] = arg_408_4,
			["48177664"] = arg_408_5
		}, var_408_2.deepCopy(var_408_1.states_4505798650757378), var_408_2.deepCopy(var_408_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_409_0, arg_409_1, arg_409_2, arg_409_3, arg_409_4, arg_409_5)
		var_409_0 = depends("io-devices-settings-utils")
		var_409_1 = depends("common_utils")
		var_409_2 = depends("io-somfy-devices-settings-utils")

		return var_409_0.advancedRefresh(arg_409_0, arg_409_1, {
			["84082687"] = arg_409_2,
			["65537"] = arg_409_3,
			["65540"] = arg_409_4,
			["48177664"] = arg_409_5
		}, var_409_1.deepCopy(var_409_2.states_4505798650757378), {}, var_409_1.deepCopy(var_409_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_410_0, arg_410_1)
		var_410_0 = depends("io-devices-settings-utils")
		var_410_1 = depends("common_utils")
		var_410_2 = depends("io-somfy-devices-settings-utils")

		return var_410_0.aggregateConfig({
			["84082687"] = arg_410_0,
			["65537"] = arg_410_1
		}, var_410_1.deepCopy(var_410_2.states_4504699139129346))
	end',
	'function(arg_411_0, arg_411_1, arg_411_2, arg_411_3)
		var_411_0 = depends("io-devices-settings-utils")
		var_411_1 = depends("io-somfy-devices-settings-utils")
		var_411_2 = depends("common_utils")

		return var_411_0.runConfig(arg_411_0, arg_411_1, var_411_2.deepCopy(var_411_1.commands_4504699139129346), {
			["84082687"] = arg_411_2,
			["65537"] = arg_411_3
		}, var_411_2.deepCopy(var_411_1.states_4504699139129346), var_411_2.deepCopy(var_411_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_412_0, arg_412_1, arg_412_2, arg_412_3)
		var_412_0 = depends("io-devices-settings-utils")
		var_412_1 = depends("common_utils")
		var_412_2 = depends("io-somfy-devices-settings-utils")

		return var_412_0.advancedRefresh(arg_412_0, arg_412_1, {
			["84082687"] = arg_412_2,
			["65537"] = arg_412_3
		}, var_412_1.deepCopy(var_412_2.states_4504699139129346), {}, var_412_1.deepCopy(var_412_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_413_0, arg_413_1, arg_413_2, arg_413_3, arg_413_4, arg_413_5, arg_413_6, arg_413_7, arg_413_8, arg_413_9, arg_413_10, arg_413_11, arg_413_12, arg_413_13, arg_413_14, arg_413_15, arg_413_16, arg_413_17, arg_413_18, arg_413_19, arg_413_20, arg_413_21, arg_413_22, arg_413_23, arg_413_24, arg_413_25, arg_413_26, arg_413_27, arg_413_28, arg_413_29, arg_413_30, arg_413_31, arg_413_32, arg_413_33, arg_413_34, arg_413_35, arg_413_36)
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
	end',
	'function(arg_414_0)
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
	end',
	'function(arg_415_0, arg_415_1, arg_415_2, arg_415_3, arg_415_4, arg_415_5, arg_415_6, arg_415_7, arg_415_8, arg_415_9, arg_415_10, arg_415_11, arg_415_12, arg_415_13, arg_415_14, arg_415_15, arg_415_16, arg_415_17, arg_415_18, arg_415_19, arg_415_20, arg_415_21, arg_415_22, arg_415_23, arg_415_24, arg_415_25, arg_415_26, arg_415_27, arg_415_28, arg_415_29, arg_415_30, arg_415_31, arg_415_32, arg_415_33, arg_415_34, arg_415_35, arg_415_36, arg_415_37, arg_415_38)
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
	end',
	'function(arg_416_0, arg_416_1, arg_416_2, arg_416_3, arg_416_4, arg_416_5, arg_416_6, arg_416_7, arg_416_8, arg_416_9, arg_416_10, arg_416_11, arg_416_12, arg_416_13, arg_416_14, arg_416_15, arg_416_16, arg_416_17, arg_416_18, arg_416_19, arg_416_20, arg_416_21, arg_416_22, arg_416_23, arg_416_24, arg_416_25, arg_416_26, arg_416_27, arg_416_28, arg_416_29, arg_416_30, arg_416_31, arg_416_32, arg_416_33, arg_416_34, arg_416_35, arg_416_36, arg_416_37, arg_416_38)
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
	end',
	'function(arg_417_0, arg_417_1, arg_417_2, arg_417_3, arg_417_4, arg_417_5, arg_417_6, arg_417_7, arg_417_8, arg_417_9, arg_417_10, arg_417_11, arg_417_12, arg_417_13, arg_417_14)
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
	end',
	'function(arg_418_0)
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
	end',
	'function(arg_419_0, arg_419_1, arg_419_2, arg_419_3, arg_419_4, arg_419_5, arg_419_6, arg_419_7, arg_419_8, arg_419_9, arg_419_10, arg_419_11, arg_419_12, arg_419_13, arg_419_14, arg_419_15, arg_419_16)
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
	end',
	'function(arg_420_0, arg_420_1, arg_420_2, arg_420_3, arg_420_4, arg_420_5, arg_420_6, arg_420_7, arg_420_8, arg_420_9, arg_420_10, arg_420_11, arg_420_12, arg_420_13, arg_420_14, arg_420_15, arg_420_16)
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
	end',
	'function(arg_421_0, arg_421_1, arg_421_2, arg_421_3)
		var_421_0 = depends("io-devices-settings-utils")
		var_421_1 = depends("common_utils")
		var_421_2 = depends("io-somfy-devices-settings-utils")

		return var_421_0.aggregateConfig({
			["84059651"] = arg_421_0,
			["65537"] = arg_421_1,
			["84059661"] = arg_421_2,
			["48177664"] = arg_421_3
		}, var_421_1.deepCopy(var_421_2.states_4504699140112386))
	end',
	'function(arg_422_0)
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
	end',
	'function(arg_423_0, arg_423_1, arg_423_2, arg_423_3, arg_423_4, arg_423_5)
		var_423_0 = depends("io-devices-settings-utils")
		var_423_1 = depends("io-somfy-devices-settings-utils")
		var_423_2 = depends("common_utils")

		return var_423_0.runConfig(arg_423_0, arg_423_1, var_423_2.deepCopy(var_423_1.commands_4504699140112386), {
			["84059651"] = arg_423_2,
			["65537"] = arg_423_3,
			["84059661"] = arg_423_4,
			["48177664"] = arg_423_5
		}, var_423_2.deepCopy(var_423_1.states_4504699140112386), var_423_2.deepCopy(var_423_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_424_0, arg_424_1, arg_424_2, arg_424_3, arg_424_4, arg_424_5)
		var_424_0 = depends("io-devices-settings-utils")
		var_424_1 = depends("common_utils")
		var_424_2 = depends("io-somfy-devices-settings-utils")

		return var_424_0.advancedRefresh(arg_424_0, arg_424_1, {
			["84059651"] = arg_424_2,
			["65537"] = arg_424_3,
			["84059661"] = arg_424_4,
			["48177664"] = arg_424_5
		}, var_424_1.deepCopy(var_424_2.states_4504699140112386), {}, var_424_1.deepCopy(var_424_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_425_0, arg_425_1, arg_425_2, arg_425_3, arg_425_4)
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
	end',
	'function(arg_426_0)
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
	end',
	'function(arg_427_0, arg_427_1, arg_427_2, arg_427_3, arg_427_4, arg_427_5, arg_427_6)
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
	end',
	'function(arg_428_0, arg_428_1, arg_428_2, arg_428_3, arg_428_4, arg_428_5, arg_428_6)
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
	end',
	'function(arg_429_0, arg_429_1, arg_429_2, arg_429_3, arg_429_4, arg_429_5, arg_429_6, arg_429_7, arg_429_8, arg_429_9, arg_429_10, arg_429_11, arg_429_12, arg_429_13, arg_429_14, arg_429_15, arg_429_16, arg_429_17, arg_429_18, arg_429_19, arg_429_20, arg_429_21, arg_429_22, arg_429_23, arg_429_24, arg_429_25, arg_429_26, arg_429_27, arg_429_28, arg_429_29, arg_429_30, arg_429_31)
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
	end',
	'function(arg_430_0)
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
	end',
	'function(arg_431_0, arg_431_1, arg_431_2, arg_431_3, arg_431_4, arg_431_5, arg_431_6, arg_431_7, arg_431_8, arg_431_9, arg_431_10, arg_431_11, arg_431_12, arg_431_13, arg_431_14, arg_431_15, arg_431_16, arg_431_17, arg_431_18, arg_431_19, arg_431_20, arg_431_21, arg_431_22, arg_431_23, arg_431_24, arg_431_25, arg_431_26, arg_431_27, arg_431_28, arg_431_29, arg_431_30, arg_431_31, arg_431_32, arg_431_33)
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
	end',
	'function(arg_432_0, arg_432_1, arg_432_2, arg_432_3, arg_432_4, arg_432_5, arg_432_6, arg_432_7, arg_432_8, arg_432_9, arg_432_10, arg_432_11, arg_432_12, arg_432_13, arg_432_14, arg_432_15, arg_432_16, arg_432_17, arg_432_18, arg_432_19, arg_432_20, arg_432_21, arg_432_22, arg_432_23, arg_432_24, arg_432_25, arg_432_26, arg_432_27, arg_432_28, arg_432_29, arg_432_30, arg_432_31, arg_432_32, arg_432_33)
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
	end',
	'function(arg_433_0, arg_433_1, arg_433_2, arg_433_3, arg_433_4, arg_433_5, arg_433_6, arg_433_7, arg_433_8, arg_433_9, arg_433_10, arg_433_11, arg_433_12, arg_433_13, arg_433_14)
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
	end',
	'function(arg_434_0)
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
	end',
	'function(arg_435_0, arg_435_1, arg_435_2, arg_435_3, arg_435_4, arg_435_5, arg_435_6, arg_435_7, arg_435_8, arg_435_9, arg_435_10, arg_435_11, arg_435_12, arg_435_13, arg_435_14, arg_435_15, arg_435_16)
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
	end',
	'function(arg_436_0, arg_436_1, arg_436_2, arg_436_3, arg_436_4, arg_436_5, arg_436_6, arg_436_7, arg_436_8, arg_436_9, arg_436_10, arg_436_11, arg_436_12, arg_436_13, arg_436_14, arg_436_15, arg_436_16)
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
	end',
	'function(arg_437_0, arg_437_1)
		var_437_0 = depends("io-devices-settings-utils")
		var_437_1 = depends("common_utils")
		var_437_2 = depends("io-somfy-devices-settings-utils")

		return var_437_0.aggregateConfig({
			["84059651"] = arg_437_0,
			["65537"] = arg_437_1
		}, var_437_1.deepCopy(var_437_2.states_4504699140389378))
	end',
	'function(arg_438_0)
		return {
			"save_my_position",
			"delete_my_position",
			"set_timeout_timer",
			"set_timeout_timer_value",
			"reset_actuator",
			"double_power_cut"
		}
	end',
	'function(arg_439_0, arg_439_1, arg_439_2, arg_439_3)
		var_439_0 = depends("io-devices-settings-utils")
		var_439_1 = depends("io-somfy-devices-settings-utils")
		var_439_2 = depends("common_utils")

		return var_439_0.runConfig(arg_439_0, arg_439_1, var_439_2.deepCopy(var_439_1.commands_4504699140389378), {
			["84059651"] = arg_439_2,
			["65537"] = arg_439_3
		}, var_439_2.deepCopy(var_439_1.states_4504699140389378), var_439_2.deepCopy(var_439_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_440_0, arg_440_1, arg_440_2, arg_440_3)
		var_440_0 = depends("io-devices-settings-utils")
		var_440_1 = depends("common_utils")
		var_440_2 = depends("io-somfy-devices-settings-utils")

		return var_440_0.advancedRefresh(arg_440_0, arg_440_1, {
			["84059651"] = arg_440_2,
			["65537"] = arg_440_3
		}, var_440_1.deepCopy(var_440_2.states_4504699140389378), {}, var_440_1.deepCopy(var_440_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_441_0, arg_441_1, arg_441_2, arg_441_3, arg_441_4)
		var_441_0 = depends("io-devices-settings-utils")
		var_441_1 = depends("io-somfy-devices-settings-utils")
		var_441_2 = depends("common_utils")

		return var_441_0.runConfig(arg_441_0, arg_441_1, var_441_2.deepCopy(var_441_1.commands_4506898162385154), {
			["84059651"] = arg_441_2,
			["65537"] = arg_441_3,
			["84059661"] = arg_441_4
		}, var_441_2.deepCopy(var_441_1.states_4504699139653634), var_441_2.deepCopy(var_441_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_442_0)
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
	end',
	'function(arg_443_0, arg_443_1, arg_443_2, arg_443_3, arg_443_4)
		var_443_0 = depends("io-devices-settings-utils")
		var_443_1 = depends("io-somfy-devices-settings-utils")
		var_443_2 = depends("common_utils")

		return var_443_0.runConfig(arg_443_0, arg_443_1, var_443_2.deepCopy(var_443_1.commands_4505798650757122), {
			["84059651"] = arg_443_2,
			["65537"] = arg_443_3,
			["84059661"] = arg_443_4
		}, var_443_2.deepCopy(var_443_1.states_4504699139653634), var_443_2.deepCopy(var_443_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_444_0, arg_444_1, arg_444_2, arg_444_3, arg_444_4, arg_444_5, arg_444_6, arg_444_7, arg_444_8, arg_444_9, arg_444_10, arg_444_11, arg_444_12, arg_444_13, arg_444_14, arg_444_15, arg_444_16, arg_444_17, arg_444_18, arg_444_19, arg_444_20, arg_444_21, arg_444_22, arg_444_23, arg_444_24, arg_444_25, arg_444_26, arg_444_27, arg_444_28, arg_444_29, arg_444_30, arg_444_31, arg_444_32, arg_444_33, arg_444_34, arg_444_35, arg_444_36, arg_444_37)
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
	end',
	'function(arg_445_0)
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
	end',
	'function(arg_446_0, arg_446_1, arg_446_2, arg_446_3, arg_446_4, arg_446_5, arg_446_6, arg_446_7, arg_446_8, arg_446_9, arg_446_10, arg_446_11, arg_446_12, arg_446_13, arg_446_14, arg_446_15, arg_446_16, arg_446_17, arg_446_18, arg_446_19, arg_446_20, arg_446_21, arg_446_22, arg_446_23, arg_446_24, arg_446_25, arg_446_26, arg_446_27, arg_446_28, arg_446_29, arg_446_30, arg_446_31, arg_446_32, arg_446_33, arg_446_34, arg_446_35, arg_446_36, arg_446_37, arg_446_38, arg_446_39)
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
	end',
	'function(arg_447_0, arg_447_1, arg_447_2, arg_447_3, arg_447_4, arg_447_5, arg_447_6, arg_447_7, arg_447_8, arg_447_9, arg_447_10, arg_447_11, arg_447_12, arg_447_13, arg_447_14, arg_447_15, arg_447_16, arg_447_17, arg_447_18, arg_447_19, arg_447_20, arg_447_21, arg_447_22, arg_447_23, arg_447_24, arg_447_25, arg_447_26, arg_447_27, arg_447_28, arg_447_29, arg_447_30, arg_447_31, arg_447_32, arg_447_33, arg_447_34, arg_447_35, arg_447_36, arg_447_37, arg_447_38, arg_447_39)
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
	end',
	'function(arg_448_0, arg_448_1)
		var_448_0 = depends("io-devices-settings-utils")
		var_448_1 = depends("common_utils")
		var_448_2 = depends("io-somfy-devices-settings-utils")

		return var_448_0.aggregateConfig({
			["65537"] = arg_448_0,
			["84059651"] = arg_448_1
		}, var_448_1.deepCopy(var_448_2.states_4504699139981826))
	end',
	'function(arg_449_0)
		return {
			"save_my_position",
			"delete_my_position",
			"set_timeout_timer",
			"set_timeout_timer_value",
			"set_recovered_state_after_power_cut",
			"set_wired_input_type",
			"reset_actuator"
		}
	end',
	'function(arg_450_0, arg_450_1, arg_450_2, arg_450_3)
		var_450_0 = depends("io-devices-settings-utils")
		var_450_1 = depends("io-somfy-devices-settings-utils")
		var_450_2 = depends("common_utils")

		return var_450_0.runConfig(arg_450_0, arg_450_1, var_450_2.deepCopy(var_450_1.commands_4504699139981826), {
			["65537"] = arg_450_2,
			["84059651"] = arg_450_3
		}, var_450_2.deepCopy(var_450_1.states_4504699139981826), var_450_2.deepCopy(var_450_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_451_0, arg_451_1, arg_451_2, arg_451_3)
		var_451_0 = depends("io-devices-settings-utils")
		var_451_1 = depends("common_utils")
		var_451_2 = depends("io-somfy-devices-settings-utils")

		return var_451_0.advancedRefresh(arg_451_0, arg_451_1, {
			["65537"] = arg_451_2,
			["84059651"] = arg_451_3
		}, var_451_1.deepCopy(var_451_2.states_4504699139981826), {}, var_451_1.deepCopy(var_451_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_452_0, arg_452_1, arg_452_2)
		var_452_0 = depends("io-devices-settings-utils")
		var_452_1 = depends("common_utils")
		var_452_2 = depends("io-somfy-devices-settings-utils")

		return var_452_0.aggregateConfig({
			["65537"] = arg_452_0,
			["84059656"] = arg_452_1,
			["84059651"] = arg_452_2
		}, var_452_1.deepCopy(var_452_2.states_4504699139391490))
	end',
	'function(arg_453_0)
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
	end',
	'function(arg_454_0, arg_454_1, arg_454_2, arg_454_3, arg_454_4)
		var_454_0 = depends("io-devices-settings-utils")
		var_454_1 = depends("io-somfy-devices-settings-utils")
		var_454_2 = depends("common_utils")

		return var_454_0.runConfig(arg_454_0, arg_454_1, var_454_2.deepCopy(var_454_1.commands_4504699139391490), {
			["65537"] = arg_454_2,
			["84059656"] = arg_454_3,
			["84059651"] = arg_454_4
		}, var_454_2.deepCopy(var_454_1.states_4504699139391490), var_454_2.deepCopy(var_454_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_455_0, arg_455_1, arg_455_2, arg_455_3, arg_455_4)
		var_455_0 = depends("io-devices-settings-utils")
		var_455_1 = depends("common_utils")
		var_455_2 = depends("io-somfy-devices-settings-utils")

		return var_455_0.advancedRefresh(arg_455_0, arg_455_1, {
			["65537"] = arg_455_2,
			["84059656"] = arg_455_3,
			["84059651"] = arg_455_4
		}, var_455_1.deepCopy(var_455_2.states_4504699139391490), {}, var_455_1.deepCopy(var_455_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_456_0, arg_456_1, arg_456_2)
		var_456_0 = depends("io-devices-settings-utils")
		var_456_1 = depends("common_utils")
		var_456_2 = depends("io-somfy-devices-settings-utils")

		return var_456_0.aggregateConfig({
			["84059651"] = arg_456_0,
			["65537"] = arg_456_1,
			["84082687"] = arg_456_2
		}, var_456_1.deepCopy(var_456_2.states_4513495233134594))
	end',
	'function(arg_457_0)
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
	end',
	'function(arg_458_0, arg_458_1, arg_458_2, arg_458_3, arg_458_4)
		var_458_0 = depends("io-devices-settings-utils")
		var_458_1 = depends("io-somfy-devices-settings-utils")
		var_458_2 = depends("common_utils")

		return var_458_0.runConfig(arg_458_0, arg_458_1, var_458_2.deepCopy(var_458_1.commands_4513495233134594), {
			["84059651"] = arg_458_2,
			["65537"] = arg_458_3,
			["84082687"] = arg_458_4
		}, var_458_2.deepCopy(var_458_1.states_4513495233134594), var_458_2.deepCopy(var_458_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_459_0, arg_459_1, arg_459_2, arg_459_3, arg_459_4)
		var_459_0 = depends("io-devices-settings-utils")
		var_459_1 = depends("common_utils")
		var_459_2 = depends("io-somfy-devices-settings-utils")

		return var_459_0.advancedRefresh(arg_459_0, arg_459_1, {
			["84059651"] = arg_459_2,
			["65537"] = arg_459_3,
			["84082687"] = arg_459_4
		}, var_459_1.deepCopy(var_459_2.states_4513495233134594), {}, var_459_1.deepCopy(var_459_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_460_0)
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
	end',
	'function(arg_461_0, arg_461_1, arg_461_2, arg_461_3, arg_461_4, arg_461_5, arg_461_6)
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
	end',
	'function(arg_462_0, arg_462_1, arg_462_2)
		var_462_0 = depends("io-devices-settings-utils")
		var_462_1 = depends("common_utils")
		var_462_2 = depends("io-somfy-devices-settings-utils")

		return var_462_0.aggregateConfig({
			["84059651"] = arg_462_0,
			["65537"] = arg_462_1,
			["84082687"] = arg_462_2
		}, var_462_1.deepCopy(var_462_2.states_4522291326156802))
	end',
	'function(arg_463_0, arg_463_1, arg_463_2, arg_463_3, arg_463_4)
		var_463_0 = depends("io-devices-settings-utils")
		var_463_1 = depends("io-somfy-devices-settings-utils")
		var_463_2 = depends("common_utils")

		return var_463_0.runConfig(arg_463_0, arg_463_1, var_463_2.deepCopy(var_463_1.commands_4513495233134594), {
			["84059651"] = arg_463_2,
			["65537"] = arg_463_3,
			["84082687"] = arg_463_4
		}, var_463_2.deepCopy(var_463_1.states_4522291326156802), var_463_2.deepCopy(var_463_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_464_0, arg_464_1, arg_464_2, arg_464_3, arg_464_4)
		var_464_0 = depends("io-devices-settings-utils")
		var_464_1 = depends("common_utils")
		var_464_2 = depends("io-somfy-devices-settings-utils")

		return var_464_0.advancedRefresh(arg_464_0, arg_464_1, {
			["84059651"] = arg_464_2,
			["65537"] = arg_464_3,
			["84082687"] = arg_464_4
		}, var_464_1.deepCopy(var_464_2.states_4522291326156802), {}, var_464_1.deepCopy(var_464_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_465_0, arg_465_1, arg_465_2, arg_465_3, arg_465_4)
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
	end',
	'function(arg_466_0, arg_466_1, arg_466_2, arg_466_3, arg_466_4, arg_466_5, arg_466_6)
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
	end',
	'function(arg_467_0, arg_467_1, arg_467_2, arg_467_3, arg_467_4, arg_467_5, arg_467_6)
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
	end',
	'function(arg_468_0, arg_468_1)
		var_468_0 = depends("io-devices-settings-utils")
		var_468_1 = depends("common_utils")
		var_468_2 = depends("io-somfy-devices-settings-utils")

		return var_468_0.aggregateConfig({
			["84059651"] = arg_468_0,
			["65537"] = arg_468_1
		}, var_468_1.deepCopy(var_468_2.states_4505798651034114))
	end',
	'function(arg_469_0)
		return {
			"save_my_position",
			"delete_my_position",
			"reset_actuator",
			"double_power_cut"
		}
	end',
	'function(arg_470_0, arg_470_1, arg_470_2, arg_470_3)
		var_470_0 = depends("io-devices-settings-utils")
		var_470_1 = depends("io-somfy-devices-settings-utils")
		var_470_2 = depends("common_utils")

		return var_470_0.runConfig(arg_470_0, arg_470_1, var_470_2.deepCopy(var_470_1.commands_4505798651034114), {
			["84059651"] = arg_470_2,
			["65537"] = arg_470_3
		}, var_470_2.deepCopy(var_470_1.states_4505798651034114), var_470_2.deepCopy(var_470_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_471_0, arg_471_1, arg_471_2, arg_471_3)
		var_471_0 = depends("io-devices-settings-utils")
		var_471_1 = depends("common_utils")
		var_471_2 = depends("io-somfy-devices-settings-utils")

		return var_471_0.advancedRefresh(arg_471_0, arg_471_1, {
			["84059651"] = arg_471_2,
			["65537"] = arg_471_3
		}, var_471_1.deepCopy(var_471_2.states_4505798651034114), {}, var_471_1.deepCopy(var_471_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_472_0, arg_472_1, arg_472_2, arg_472_3, arg_472_4)
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
	end',
	'function(arg_473_0)
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
	end',
	'function(arg_474_0, arg_474_1, arg_474_2, arg_474_3, arg_474_4, arg_474_5, arg_474_6)
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
	end',
	'function(arg_475_0, arg_475_1, arg_475_2, arg_475_3, arg_475_4, arg_475_5, arg_475_6)
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
	end',
	'function(arg_476_0)
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
	end',
	'function(arg_477_0, arg_477_1, arg_477_2, arg_477_3, arg_477_4, arg_477_5, arg_477_6)
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
	end',
	'function(arg_478_0, arg_478_1, arg_478_2, arg_478_3, arg_478_4, arg_478_5)
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
	end',
	'function(arg_479_0)
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
	end',
	'function(arg_480_0, arg_480_1, arg_480_2, arg_480_3, arg_480_4, arg_480_5, arg_480_6, arg_480_7)
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
	end',
	'function(arg_481_0, arg_481_1, arg_481_2, arg_481_3, arg_481_4, arg_481_5, arg_481_6, arg_481_7)
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
	end',
	'function(arg_482_0, arg_482_1, arg_482_2, arg_482_3, arg_482_4, arg_482_5)
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
	end',
	'function(arg_483_0, arg_483_1, arg_483_2, arg_483_3, arg_483_4, arg_483_5, arg_483_6, arg_483_7)
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
	end',
	'function(arg_484_0, arg_484_1, arg_484_2, arg_484_3, arg_484_4, arg_484_5, arg_484_6, arg_484_7)
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
	end',
	'function(arg_485_0, arg_485_1, arg_485_2, arg_485_3, arg_485_4)
		var_485_0 = depends("io-devices-settings-utils")
		var_485_1 = depends("io-somfy-devices-settings-utils")
		var_485_2 = depends("common_utils")

		return var_485_0.runConfig(arg_485_0, arg_485_1, var_485_2.deepCopy(var_485_1.commands_4506898162384898), {
			["84059651"] = arg_485_2,
			["65537"] = arg_485_3,
			["84059661"] = arg_485_4
		}, var_485_2.deepCopy(var_485_1.states_4504699139653634), var_485_2.deepCopy(var_485_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_486_0, arg_486_1, arg_486_2, arg_486_3, arg_486_4)
		var_486_0 = depends("io-devices-settings-utils")
		var_486_1 = depends("io-somfy-devices-settings-utils")
		var_486_2 = depends("common_utils")

		return var_486_0.runConfig(arg_486_0, arg_486_1, var_486_2.deepCopy(var_486_1.commands_4507997674012674), {
			["84059651"] = arg_486_2,
			["65537"] = arg_486_3,
			["84059661"] = arg_486_4
		}, var_486_2.deepCopy(var_486_1.states_4504699139653634), var_486_2.deepCopy(var_486_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_487_0, arg_487_1, arg_487_2)
		var_487_0 = depends("io-devices-settings-utils")
		var_487_1 = depends("common_utils")
		var_487_2 = depends("io-somfy-devices-settings-utils")

		return var_487_0.aggregateConfig({
			["84082687"] = arg_487_0,
			["65537"] = arg_487_1,
			["84059651"] = arg_487_2
		}, var_487_1.deepCopy(var_487_2.states_4509097185640450))
	end',
	'function(arg_488_0, arg_488_1, arg_488_2, arg_488_3, arg_488_4)
		var_488_0 = depends("io-devices-settings-utils")
		var_488_1 = depends("io-somfy-devices-settings-utils")
		var_488_2 = depends("common_utils")

		return var_488_0.runConfig(arg_488_0, arg_488_1, var_488_2.deepCopy(var_488_1.commands_4504699139129346), {
			["84082687"] = arg_488_2,
			["65537"] = arg_488_3,
			["84059651"] = arg_488_4
		}, var_488_2.deepCopy(var_488_1.states_4509097185640450), var_488_2.deepCopy(var_488_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_489_0, arg_489_1, arg_489_2, arg_489_3, arg_489_4)
		var_489_0 = depends("io-devices-settings-utils")
		var_489_1 = depends("common_utils")
		var_489_2 = depends("io-somfy-devices-settings-utils")

		return var_489_0.advancedRefresh(arg_489_0, arg_489_1, {
			["84082687"] = arg_489_2,
			["65537"] = arg_489_3,
			["84059651"] = arg_489_4
		}, var_489_1.deepCopy(var_489_2.states_4509097185640450), {}, var_489_1.deepCopy(var_489_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_490_0, arg_490_1, arg_490_2, arg_490_3, arg_490_4)
		var_490_0 = depends("io-devices-settings-utils")
		var_490_1 = depends("io-somfy-devices-settings-utils")
		var_490_2 = depends("common_utils")

		return var_490_0.runConfig(arg_490_0, arg_490_1, var_490_2.deepCopy(var_490_1.commands_4510196697268226), {
			["84082687"] = arg_490_2,
			["65537"] = arg_490_3,
			["84059651"] = arg_490_4
		}, var_490_2.deepCopy(var_490_1.states_4509097185640450), var_490_2.deepCopy(var_490_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_491_0, arg_491_1, arg_491_2)
		var_491_0 = depends("io-devices-settings-utils")
		var_491_1 = depends("common_utils")
		var_491_2 = depends("io-somfy-devices-settings-utils")

		return var_491_0.aggregateConfig({
			["84082687"] = arg_491_0,
			["65537"] = arg_491_1,
			["84059651"] = arg_491_2
		}, var_491_1.deepCopy(var_491_2.states_4511296208896002))
	end',
	'function(arg_492_0, arg_492_1, arg_492_2, arg_492_3, arg_492_4)
		var_492_0 = depends("io-devices-settings-utils")
		var_492_1 = depends("io-somfy-devices-settings-utils")
		var_492_2 = depends("common_utils")

		return var_492_0.runConfig(arg_492_0, arg_492_1, var_492_2.deepCopy(var_492_1.commands_4510196697268226), {
			["84082687"] = arg_492_2,
			["65537"] = arg_492_3,
			["84059651"] = arg_492_4
		}, var_492_2.deepCopy(var_492_1.states_4511296208896002), var_492_2.deepCopy(var_492_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_493_0, arg_493_1, arg_493_2, arg_493_3, arg_493_4)
		var_493_0 = depends("io-devices-settings-utils")
		var_493_1 = depends("common_utils")
		var_493_2 = depends("io-somfy-devices-settings-utils")

		return var_493_0.advancedRefresh(arg_493_0, arg_493_1, {
			["84082687"] = arg_493_2,
			["65537"] = arg_493_3,
			["84059651"] = arg_493_4
		}, var_493_1.deepCopy(var_493_2.states_4511296208896002), {}, var_493_1.deepCopy(var_493_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_494_0, arg_494_1)
		var_494_0 = depends("io-devices-settings-utils")
		var_494_1 = depends("common_utils")
		var_494_2 = depends("io-somfy-devices-settings-utils")

		return var_494_0.aggregateConfig({
			["49020928"] = arg_494_0,
			["65537"] = arg_494_1
		}, var_494_1.deepCopy(var_494_2.states_4512395720523778))
	end',
	'function(arg_495_0)
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
	end',
	'function(arg_496_0, arg_496_1, arg_496_2, arg_496_3)
		var_496_0 = depends("io-devices-settings-utils")
		var_496_1 = depends("io-somfy-devices-settings-utils")
		var_496_2 = depends("common_utils")

		return var_496_0.runConfig(arg_496_0, arg_496_1, var_496_2.deepCopy(var_496_1.commands_4512395720523778), {
			["49020928"] = arg_496_2,
			["65537"] = arg_496_3
		}, var_496_2.deepCopy(var_496_1.states_4512395720523778), var_496_2.deepCopy(var_496_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_497_0, arg_497_1, arg_497_2, arg_497_3)
		var_497_0 = depends("io-devices-settings-utils")
		var_497_1 = depends("common_utils")
		var_497_2 = depends("io-somfy-devices-settings-utils")

		return var_497_0.advancedRefresh(arg_497_0, arg_497_1, {
			["49020928"] = arg_497_2,
			["65537"] = arg_497_3
		}, var_497_1.deepCopy(var_497_2.states_4512395720523778), {}, var_497_1.deepCopy(var_497_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_498_0, arg_498_1)
		var_498_0 = depends("io-devices-settings-utils")
		var_498_1 = depends("common_utils")
		var_498_2 = depends("io-somfy-devices-settings-utils")

		return var_498_0.aggregateConfig({
			["49020928"] = arg_498_0,
			["65537"] = arg_498_1
		}, var_498_1.deepCopy(var_498_2.states_4513495232151554))
	end',
	'function(arg_499_0, arg_499_1, arg_499_2, arg_499_3)
		var_499_0 = depends("io-devices-settings-utils")
		var_499_1 = depends("io-somfy-devices-settings-utils")
		var_499_2 = depends("common_utils")

		return var_499_0.runConfig(arg_499_0, arg_499_1, var_499_2.deepCopy(var_499_1.commands_4512395720523778), {
			["49020928"] = arg_499_2,
			["65537"] = arg_499_3
		}, var_499_2.deepCopy(var_499_1.states_4513495232151554), var_499_2.deepCopy(var_499_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_500_0, arg_500_1, arg_500_2, arg_500_3)
		var_500_0 = depends("io-devices-settings-utils")
		var_500_1 = depends("common_utils")
		var_500_2 = depends("io-somfy-devices-settings-utils")

		return var_500_0.advancedRefresh(arg_500_0, arg_500_1, {
			["49020928"] = arg_500_2,
			["65537"] = arg_500_3
		}, var_500_1.deepCopy(var_500_2.states_4513495232151554), {}, var_500_1.deepCopy(var_500_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_501_0, arg_501_1)
		var_501_0 = depends("io-devices-settings-utils")
		var_501_1 = depends("common_utils")
		var_501_2 = depends("io-somfy-devices-settings-utils")

		return var_501_0.aggregateConfig({
			["84082687"] = arg_501_0,
			["65537"] = arg_501_1
		}, var_501_1.deepCopy(var_501_2.states_4514594743779330))
	end',
	'function(arg_502_0, arg_502_1, arg_502_2, arg_502_3)
		var_502_0 = depends("io-devices-settings-utils")
		var_502_1 = depends("io-somfy-devices-settings-utils")
		var_502_2 = depends("common_utils")

		return var_502_0.runConfig(arg_502_0, arg_502_1, var_502_2.deepCopy(var_502_1.commands_4506898162385154), {
			["84082687"] = arg_502_2,
			["65537"] = arg_502_3
		}, var_502_2.deepCopy(var_502_1.states_4514594743779330), var_502_2.deepCopy(var_502_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_503_0, arg_503_1, arg_503_2, arg_503_3)
		var_503_0 = depends("io-devices-settings-utils")
		var_503_1 = depends("common_utils")
		var_503_2 = depends("io-somfy-devices-settings-utils")

		return var_503_0.advancedRefresh(arg_503_0, arg_503_1, {
			["84082687"] = arg_503_2,
			["65537"] = arg_503_3
		}, var_503_1.deepCopy(var_503_2.states_4514594743779330), {}, var_503_1.deepCopy(var_503_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_504_0, arg_504_1)
		var_504_0 = depends("io-devices-settings-utils")
		var_504_1 = depends("common_utils")
		var_504_2 = depends("io-somfy-devices-settings-utils")

		return var_504_0.aggregateConfig({
			["84082687"] = arg_504_0,
			["65537"] = arg_504_1
		}, var_504_1.deepCopy(var_504_2.states_4515694255407106))
	end',
	'function(arg_505_0, arg_505_1, arg_505_2, arg_505_3)
		var_505_0 = depends("io-devices-settings-utils")
		var_505_1 = depends("io-somfy-devices-settings-utils")
		var_505_2 = depends("common_utils")

		return var_505_0.runConfig(arg_505_0, arg_505_1, var_505_2.deepCopy(var_505_1.commands_4515694255407106), {
			["84082687"] = arg_505_2,
			["65537"] = arg_505_3
		}, var_505_2.deepCopy(var_505_1.states_4515694255407106), var_505_2.deepCopy(var_505_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_506_0, arg_506_1, arg_506_2, arg_506_3)
		var_506_0 = depends("io-devices-settings-utils")
		var_506_1 = depends("common_utils")
		var_506_2 = depends("io-somfy-devices-settings-utils")

		return var_506_0.advancedRefresh(arg_506_0, arg_506_1, {
			["84082687"] = arg_506_2,
			["65537"] = arg_506_3
		}, var_506_1.deepCopy(var_506_2.states_4515694255407106), {}, var_506_1.deepCopy(var_506_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_507_0, arg_507_1, arg_507_2, arg_507_3)
		var_507_0 = depends("io-devices-settings-utils")
		var_507_1 = depends("io-somfy-devices-settings-utils")
		var_507_2 = depends("common_utils")

		return var_507_0.runConfig(arg_507_0, arg_507_1, var_507_2.deepCopy(var_507_1.commands_4506898162385154), {
			["84082687"] = arg_507_2,
			["65537"] = arg_507_3
		}, var_507_2.deepCopy(var_507_1.states_4515694255407106), var_507_2.deepCopy(var_507_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_508_0, arg_508_1, arg_508_2, arg_508_3, arg_508_4)
		var_508_0 = depends("io-devices-settings-utils")
		var_508_1 = depends("io-somfy-devices-settings-utils")
		var_508_2 = depends("common_utils")

		return var_508_0.runConfig(arg_508_0, arg_508_1, var_508_2.deepCopy(var_508_1.commands_4504699140898818), {
			["84059651"] = arg_508_2,
			["65537"] = arg_508_3,
			["84059661"] = arg_508_4
		}, var_508_2.deepCopy(var_508_1.states_4504699139653634), var_508_2.deepCopy(var_508_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_509_0, arg_509_1, arg_509_2, arg_509_3)
		var_509_0 = depends("io-devices-settings-utils")
		var_509_1 = depends("common_utils")
		var_509_2 = depends("io-somfy-devices-settings-utils")

		return var_509_0.aggregateConfig({
			["84082687"] = arg_509_0,
			["65537"] = arg_509_1,
			["48170496"] = arg_509_2,
			["48171008"] = arg_509_3
		}, var_509_1.deepCopy(var_509_2.states_4504699140047106))
	end',
	'function(arg_510_0)
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
	end',
	'function(arg_511_0, arg_511_1, arg_511_2, arg_511_3, arg_511_4, arg_511_5)
		var_511_0 = depends("io-devices-settings-utils")
		var_511_1 = depends("io-somfy-devices-settings-utils")
		var_511_2 = depends("common_utils")

		return var_511_0.runConfig(arg_511_0, arg_511_1, var_511_2.deepCopy(var_511_1.commands_4504699140047106), {
			["84082687"] = arg_511_2,
			["65537"] = arg_511_3,
			["48170496"] = arg_511_4,
			["48171008"] = arg_511_5
		}, var_511_2.deepCopy(var_511_1.states_4504699140047106), var_511_2.deepCopy(var_511_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_512_0, arg_512_1, arg_512_2, arg_512_3, arg_512_4, arg_512_5)
		var_512_0 = depends("io-devices-settings-utils")
		var_512_1 = depends("common_utils")
		var_512_2 = depends("io-somfy-devices-settings-utils")

		return var_512_0.advancedRefresh(arg_512_0, arg_512_1, {
			["84082687"] = arg_512_2,
			["65537"] = arg_512_3,
			["48170496"] = arg_512_4,
			["48171008"] = arg_512_5
		}, var_512_1.deepCopy(var_512_2.states_4504699140047106), {}, var_512_1.deepCopy(var_512_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_513_0, arg_513_1, arg_513_2)
		var_513_0 = depends("io-devices-settings-utils")
		var_513_1 = depends("common_utils")
		var_513_2 = depends("io-somfy-devices-settings-utils")

		return var_513_0.aggregateConfig({
			["84082687"] = arg_513_0,
			["65537"] = arg_513_1,
			["48171008"] = arg_513_2
		}, var_513_1.deepCopy(var_513_2.states_4505798651674882))
	end',
	'function(arg_514_0)
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
	end',
	'function(arg_515_0, arg_515_1, arg_515_2, arg_515_3, arg_515_4)
		var_515_0 = depends("io-devices-settings-utils")
		var_515_1 = depends("io-somfy-devices-settings-utils")
		var_515_2 = depends("common_utils")

		return var_515_0.runConfig(arg_515_0, arg_515_1, var_515_2.deepCopy(var_515_1.commands_4505798651674882), {
			["84082687"] = arg_515_2,
			["65537"] = arg_515_3,
			["48171008"] = arg_515_4
		}, var_515_2.deepCopy(var_515_1.states_4505798651674882), var_515_2.deepCopy(var_515_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_516_0, arg_516_1, arg_516_2, arg_516_3, arg_516_4)
		var_516_0 = depends("io-devices-settings-utils")
		var_516_1 = depends("common_utils")
		var_516_2 = depends("io-somfy-devices-settings-utils")

		return var_516_0.advancedRefresh(arg_516_0, arg_516_1, {
			["84082687"] = arg_516_2,
			["65537"] = arg_516_3,
			["48171008"] = arg_516_4
		}, var_516_1.deepCopy(var_516_2.states_4505798651674882), {}, var_516_1.deepCopy(var_516_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_517_0, arg_517_1, arg_517_2)
		var_517_0 = depends("io-devices-settings-utils")
		var_517_1 = depends("common_utils")
		var_517_2 = depends("io-somfy-devices-settings-utils")

		return var_517_0.aggregateConfig({
			["84082687"] = arg_517_0,
			["65537"] = arg_517_1,
			["48171008"] = arg_517_2
		}, var_517_1.deepCopy(var_517_2.states_4506898163302658))
	end',
	'function(arg_518_0, arg_518_1, arg_518_2, arg_518_3, arg_518_4)
		var_518_0 = depends("io-devices-settings-utils")
		var_518_1 = depends("io-somfy-devices-settings-utils")
		var_518_2 = depends("common_utils")

		return var_518_0.runConfig(arg_518_0, arg_518_1, var_518_2.deepCopy(var_518_1.commands_4505798651674882), {
			["84082687"] = arg_518_2,
			["65537"] = arg_518_3,
			["48171008"] = arg_518_4
		}, var_518_2.deepCopy(var_518_1.states_4506898163302658), var_518_2.deepCopy(var_518_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_519_0, arg_519_1, arg_519_2, arg_519_3, arg_519_4)
		var_519_0 = depends("io-devices-settings-utils")
		var_519_1 = depends("common_utils")
		var_519_2 = depends("io-somfy-devices-settings-utils")

		return var_519_0.advancedRefresh(arg_519_0, arg_519_1, {
			["84082687"] = arg_519_2,
			["65537"] = arg_519_3,
			["48171008"] = arg_519_4
		}, var_519_1.deepCopy(var_519_2.states_4506898163302658), {}, var_519_1.deepCopy(var_519_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_520_0, arg_520_1, arg_520_2)
		var_520_0 = depends("io-devices-settings-utils")
		var_520_1 = depends("common_utils")
		var_520_2 = depends("io-somfy-devices-settings-utils")

		return var_520_0.aggregateConfig({
			["84082687"] = arg_520_0,
			["65537"] = arg_520_1,
			["48171008"] = arg_520_2
		}, var_520_1.deepCopy(var_520_2.states_4513495232217090))
	end',
	'function(arg_521_0)
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
	end',
	'function(arg_522_0, arg_522_1, arg_522_2, arg_522_3, arg_522_4)
		var_522_0 = depends("io-devices-settings-utils")
		var_522_1 = depends("io-somfy-devices-settings-utils")
		var_522_2 = depends("common_utils")

		return var_522_0.runConfig(arg_522_0, arg_522_1, var_522_2.deepCopy(var_522_1.commands_4513495232217090), {
			["84082687"] = arg_522_2,
			["65537"] = arg_522_3,
			["48171008"] = arg_522_4
		}, var_522_2.deepCopy(var_522_1.states_4513495232217090), var_522_2.deepCopy(var_522_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_523_0, arg_523_1, arg_523_2, arg_523_3, arg_523_4)
		var_523_0 = depends("io-devices-settings-utils")
		var_523_1 = depends("common_utils")
		var_523_2 = depends("io-somfy-devices-settings-utils")

		return var_523_0.advancedRefresh(arg_523_0, arg_523_1, {
			["84082687"] = arg_523_2,
			["65537"] = arg_523_3,
			["48171008"] = arg_523_4
		}, var_523_1.deepCopy(var_523_2.states_4513495232217090), {}, var_523_1.deepCopy(var_523_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_524_0, arg_524_1, arg_524_2, arg_524_3, arg_524_4)
		var_524_0 = depends("io-devices-settings-utils")
		var_524_1 = depends("io-somfy-devices-settings-utils")
		var_524_2 = depends("common_utils")

		return var_524_0.runConfig(arg_524_0, arg_524_1, var_524_2.deepCopy(var_524_1.commands_4517893278728194), {
			["84082687"] = arg_524_2,
			["65537"] = arg_524_3,
			["48171008"] = arg_524_4
		}, var_524_2.deepCopy(var_524_1.states_4513495232217090), var_524_2.deepCopy(var_524_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_525_0)
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
	end',
	'function(arg_526_0, arg_526_1, arg_526_2, arg_526_3, arg_526_4)
		var_526_0 = depends("io-devices-settings-utils")
		var_526_1 = depends("io-somfy-devices-settings-utils")
		var_526_2 = depends("common_utils")

		return var_526_0.runConfig(arg_526_0, arg_526_1, var_526_2.deepCopy(var_526_1.commands_4520092301918210), {
			["84082687"] = arg_526_2,
			["65537"] = arg_526_3,
			["84059651"] = arg_526_4
		}, var_526_2.deepCopy(var_526_1.states_4511296208896002), var_526_2.deepCopy(var_526_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_527_0, arg_527_1, arg_527_2, arg_527_3, arg_527_4, arg_527_5, arg_527_6, arg_527_7, arg_527_8, arg_527_9)
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
	end',
	'function(arg_528_0)
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
	end',
	'function(arg_529_0, arg_529_1, arg_529_2, arg_529_3, arg_529_4, arg_529_5, arg_529_6, arg_529_7, arg_529_8, arg_529_9, arg_529_10, arg_529_11)
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
	end',
	'function(arg_530_0, arg_530_1, arg_530_2, arg_530_3, arg_530_4, arg_530_5, arg_530_6, arg_530_7, arg_530_8, arg_530_9, arg_530_10, arg_530_11)
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
	end',
	'function(arg_531_0, arg_531_1, arg_531_2)
		var_531_0 = depends("io-devices-settings-utils")
		var_531_1 = depends("common_utils")
		var_531_2 = depends("io-somfy-devices-settings-utils")

		return var_531_0.aggregateConfig({
			["84059651"] = arg_531_0,
			["65537"] = arg_531_1,
			["84059671"] = arg_531_2
		}, var_531_1.deepCopy(var_531_2.states_4521191813545986))
	end',
	'function(arg_532_0)
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
	end',
	'function(arg_533_0, arg_533_1, arg_533_2, arg_533_3, arg_533_4)
		var_533_0 = depends("io-devices-settings-utils")
		var_533_1 = depends("io-somfy-devices-settings-utils")
		var_533_2 = depends("common_utils")

		return var_533_0.runConfig(arg_533_0, arg_533_1, var_533_2.deepCopy(var_533_1.commands_4521191813545986), {
			["84059651"] = arg_533_2,
			["65537"] = arg_533_3,
			["84059671"] = arg_533_4
		}, var_533_2.deepCopy(var_533_1.states_4521191813545986), var_533_2.deepCopy(var_533_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_534_0, arg_534_1, arg_534_2, arg_534_3, arg_534_4)
		var_534_0 = depends("io-devices-settings-utils")
		var_534_1 = depends("common_utils")
		var_534_2 = depends("io-somfy-devices-settings-utils")

		return var_534_0.advancedRefresh(arg_534_0, arg_534_1, {
			["84059651"] = arg_534_2,
			["65537"] = arg_534_3,
			["84059671"] = arg_534_4
		}, var_534_1.deepCopy(var_534_2.states_4521191813545986), {}, var_534_1.deepCopy(var_534_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_535_0, arg_535_1, arg_535_2)
		var_535_0 = depends("io-devices-settings-utils")
		var_535_1 = depends("common_utils")
		var_535_2 = depends("io-somfy-devices-settings-utils")

		return var_535_0.aggregateConfig({
			["84059651"] = arg_535_0,
			["65537"] = arg_535_1,
			["84059671"] = arg_535_2
		}, var_535_1.deepCopy(var_535_2.states_4525589860057090))
	end',
	'function(arg_536_0)
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
	end',
	'function(arg_537_0, arg_537_1, arg_537_2, arg_537_3, arg_537_4)
		var_537_0 = depends("io-devices-settings-utils")
		var_537_1 = depends("io-somfy-devices-settings-utils")
		var_537_2 = depends("common_utils")

		return var_537_0.runConfig(arg_537_0, arg_537_1, var_537_2.deepCopy(var_537_1.commands_4525589860057090), {
			["84059651"] = arg_537_2,
			["65537"] = arg_537_3,
			["84059671"] = arg_537_4
		}, var_537_2.deepCopy(var_537_1.states_4525589860057090), var_537_2.deepCopy(var_537_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_538_0, arg_538_1, arg_538_2, arg_538_3, arg_538_4)
		var_538_0 = depends("io-devices-settings-utils")
		var_538_1 = depends("common_utils")
		var_538_2 = depends("io-somfy-devices-settings-utils")

		return var_538_0.advancedRefresh(arg_538_0, arg_538_1, {
			["84059651"] = arg_538_2,
			["65537"] = arg_538_3,
			["84059671"] = arg_538_4
		}, var_538_1.deepCopy(var_538_2.states_4525589860057090), {}, var_538_1.deepCopy(var_538_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_539_0)
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
	end',
	'function(arg_540_0, arg_540_1, arg_540_2, arg_540_3, arg_540_4)
		var_540_0 = depends("io-devices-settings-utils")
		var_540_1 = depends("io-somfy-devices-settings-utils")
		var_540_2 = depends("common_utils")

		return var_540_0.runConfig(arg_540_0, arg_540_1, var_540_2.deepCopy(var_540_1.commands_4531087418195970), {
			["84059651"] = arg_540_2,
			["65537"] = arg_540_3,
			["84059671"] = arg_540_4
		}, var_540_2.deepCopy(var_540_1.states_4521191813545986), var_540_2.deepCopy(var_540_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_541_0, arg_541_1, arg_541_2)
		var_541_0 = depends("io-devices-settings-utils")
		var_541_1 = depends("common_utils")
		var_541_2 = depends("io-somfy-devices-settings-utils")

		return var_541_0.aggregateConfig({
			["84059651"] = arg_541_0,
			["65537"] = arg_541_1,
			["84059671"] = arg_541_2
		}, var_541_1.deepCopy(var_541_2.states_4554177162379266))
	end',
	'function(arg_542_0)
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
	end',
	'function(arg_543_0, arg_543_1, arg_543_2, arg_543_3, arg_543_4)
		var_543_0 = depends("io-devices-settings-utils")
		var_543_1 = depends("io-somfy-devices-settings-utils")
		var_543_2 = depends("common_utils")

		return var_543_0.runConfig(arg_543_0, arg_543_1, var_543_2.deepCopy(var_543_1.commands_4554177162379266), {
			["84059651"] = arg_543_2,
			["65537"] = arg_543_3,
			["84059671"] = arg_543_4
		}, var_543_2.deepCopy(var_543_1.states_4554177162379266), var_543_2.deepCopy(var_543_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_544_0, arg_544_1, arg_544_2, arg_544_3, arg_544_4)
		var_544_0 = depends("io-devices-settings-utils")
		var_544_1 = depends("common_utils")
		var_544_2 = depends("io-somfy-devices-settings-utils")

		return var_544_0.advancedRefresh(arg_544_0, arg_544_1, {
			["84059651"] = arg_544_2,
			["65537"] = arg_544_3,
			["84059671"] = arg_544_4
		}, var_544_1.deepCopy(var_544_2.states_4554177162379266), {}, var_544_1.deepCopy(var_544_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_545_0, arg_545_1, arg_545_2)
		var_545_0 = depends("io-devices-settings-utils")
		var_545_1 = depends("common_utils")
		var_545_2 = depends("io-somfy-devices-settings-utils")

		return var_545_0.aggregateConfig({
			["84059649"] = arg_545_0,
			["84059668"] = arg_545_1,
			["84059669"] = arg_545_2
		}, var_545_1.deepCopy(var_545_2.diagnosticStatesGroups_4584963487956994))
	end',
	'function(arg_546_0)
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
	end',
	'function(arg_547_0, arg_547_1, arg_547_2, arg_547_3, arg_547_4)
		var_547_0 = depends("io-devices-settings-utils")
		var_547_1 = depends("io-somfy-devices-settings-utils")
		var_547_2 = depends("common_utils")

		return var_547_0.runConfig(arg_547_0, arg_547_1, var_547_2.deepCopy(var_547_1.commands_4584963487956994), {
			["84059651"] = arg_547_2,
			["65537"] = arg_547_3,
			["84059671"] = arg_547_4
		}, var_547_2.deepCopy(var_547_1.states_4521191813545986), var_547_2.deepCopy(var_547_1.diagnosticStatesGroups_4584963487956994), context)
	end',
	'function(arg_548_0, arg_548_1, arg_548_2, arg_548_3, arg_548_4)
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
	end',
	'function(arg_549_0)
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
	end',
	'function(arg_550_0, arg_550_1, arg_550_2, arg_550_3, arg_550_4)
		var_550_0 = depends("io-devices-settings-utils")
		var_550_1 = depends("io-somfy-devices-settings-utils")
		var_550_2 = depends("common_utils")

		return var_550_0.runConfig(arg_550_0, arg_550_1, var_550_2.deepCopy(var_550_1.commands_4587162511212546), {
			["84059651"] = arg_550_2,
			["65537"] = arg_550_3,
			["84059671"] = arg_550_4
		}, var_550_2.deepCopy(var_550_1.states_4521191813545986), var_550_2.deepCopy(var_550_1.diagnosticStatesGroups_4584963487956994), context)
	end',
	'function(arg_551_0, arg_551_1, arg_551_2)
		var_551_0 = depends("io-devices-settings-utils")
		var_551_1 = depends("common_utils")
		var_551_2 = depends("io-somfy-devices-settings-utils")

		return var_551_0.aggregateConfig({
			["84059651"] = arg_551_0,
			["65537"] = arg_551_1,
			["84059666"] = arg_551_2
		}, var_551_1.deepCopy(var_551_2.states_4504699140768002))
	end',
	'function(arg_552_0)
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
	end',
	'function(arg_553_0, arg_553_1, arg_553_2, arg_553_3, arg_553_4)
		var_553_0 = depends("io-devices-settings-utils")
		var_553_1 = depends("io-somfy-devices-settings-utils")
		var_553_2 = depends("common_utils")

		return var_553_0.runConfig(arg_553_0, arg_553_1, var_553_2.deepCopy(var_553_1.commands_4504699140768002), {
			["84059651"] = arg_553_2,
			["65537"] = arg_553_3,
			["84059666"] = arg_553_4
		}, var_553_2.deepCopy(var_553_1.states_4504699140768002), var_553_2.deepCopy(var_553_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_554_0, arg_554_1, arg_554_2, arg_554_3, arg_554_4)
		var_554_0 = depends("io-devices-settings-utils")
		var_554_1 = depends("common_utils")
		var_554_2 = depends("io-somfy-devices-settings-utils")

		return var_554_0.advancedRefresh(arg_554_0, arg_554_1, {
			["84059651"] = arg_554_2,
			["65537"] = arg_554_3,
			["84059666"] = arg_554_4
		}, var_554_1.deepCopy(var_554_2.states_4504699140768002), {}, var_554_1.deepCopy(var_554_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_555_0, arg_555_1, arg_555_2, arg_555_3)
		var_555_0 = depends("io-devices-settings-utils")
		var_555_1 = depends("common_utils")
		var_555_2 = depends("io-somfy-devices-settings-utils")

		return var_555_0.aggregateConfig({
			["84059651"] = arg_555_0,
			["65537"] = arg_555_1,
			["84059666"] = arg_555_2,
			["84059658"] = arg_555_3
		}, var_555_1.deepCopy(var_555_2.states_4505798652395778))
	end',
	'function(arg_556_0)
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
	end',
	'function(arg_557_0, arg_557_1, arg_557_2, arg_557_3, arg_557_4, arg_557_5)
		var_557_0 = depends("io-devices-settings-utils")
		var_557_1 = depends("io-somfy-devices-settings-utils")
		var_557_2 = depends("common_utils")

		return var_557_0.runConfig(arg_557_0, arg_557_1, var_557_2.deepCopy(var_557_1.commands_4505798652395778), {
			["84059651"] = arg_557_2,
			["65537"] = arg_557_3,
			["84059666"] = arg_557_4,
			["84059658"] = arg_557_5
		}, var_557_2.deepCopy(var_557_1.states_4505798652395778), var_557_2.deepCopy(var_557_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_558_0, arg_558_1, arg_558_2, arg_558_3, arg_558_4, arg_558_5)
		var_558_0 = depends("io-devices-settings-utils")
		var_558_1 = depends("common_utils")
		var_558_2 = depends("io-somfy-devices-settings-utils")

		return var_558_0.advancedRefresh(arg_558_0, arg_558_1, {
			["84059651"] = arg_558_2,
			["65537"] = arg_558_3,
			["84059666"] = arg_558_4,
			["84059658"] = arg_558_5
		}, var_558_1.deepCopy(var_558_2.states_4505798652395778), {}, var_558_1.deepCopy(var_558_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_559_0)
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
	end',
	'function(arg_560_0, arg_560_1, arg_560_2, arg_560_3, arg_560_4)
		var_560_0 = depends("io-devices-settings-utils")
		var_560_1 = depends("io-somfy-devices-settings-utils")
		var_560_2 = depends("common_utils")

		return var_560_0.runConfig(arg_560_0, arg_560_1, var_560_2.deepCopy(var_560_1.commands_4504699140046850), {
			["84059651"] = arg_560_2,
			["65537"] = arg_560_3,
			["84059661"] = arg_560_4
		}, var_560_2.deepCopy(var_560_1.states_4504699139653634), var_560_2.deepCopy(var_560_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_561_0, arg_561_1, arg_561_2, arg_561_3, arg_561_4)
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
	end',
	'function(arg_562_0)
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
	end',
	'function(arg_563_0, arg_563_1, arg_563_2, arg_563_3, arg_563_4, arg_563_5, arg_563_6)
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
	end',
	'function(arg_564_0, arg_564_1, arg_564_2, arg_564_3, arg_564_4, arg_564_5, arg_564_6)
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
	end',
	'function(arg_565_0, arg_565_1, arg_565_2, arg_565_3)
		var_565_0 = depends("io-devices-settings-utils")
		var_565_1 = depends("common_utils")
		var_565_2 = depends("io-somfy-devices-settings-utils")

		return var_565_0.aggregateConfig({
			["84059651"] = arg_565_0,
			["65537"] = arg_565_1,
			["48170496"] = arg_565_2,
			["48171008"] = arg_565_3
		}, var_565_1.deepCopy(var_565_2.states_4506898163302402))
	end',
	'function(arg_566_0)
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
	end',
	'function(arg_567_0, arg_567_1, arg_567_2, arg_567_3, arg_567_4, arg_567_5)
		var_567_0 = depends("io-devices-settings-utils")
		var_567_1 = depends("io-somfy-devices-settings-utils")
		var_567_2 = depends("common_utils")

		return var_567_0.runConfig(arg_567_0, arg_567_1, var_567_2.deepCopy(var_567_1.commands_4506898163302402), {
			["84059651"] = arg_567_2,
			["65537"] = arg_567_3,
			["48170496"] = arg_567_4,
			["48171008"] = arg_567_5
		}, var_567_2.deepCopy(var_567_1.states_4506898163302402), var_567_2.deepCopy(var_567_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_568_0, arg_568_1, arg_568_2, arg_568_3, arg_568_4, arg_568_5)
		var_568_0 = depends("io-devices-settings-utils")
		var_568_1 = depends("common_utils")
		var_568_2 = depends("io-somfy-devices-settings-utils")

		return var_568_0.advancedRefresh(arg_568_0, arg_568_1, {
			["84059651"] = arg_568_2,
			["65537"] = arg_568_3,
			["48170496"] = arg_568_4,
			["48171008"] = arg_568_5
		}, var_568_1.deepCopy(var_568_2.states_4506898163302402), {}, var_568_1.deepCopy(var_568_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_569_0, arg_569_1, arg_569_2, arg_569_3, arg_569_4)
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
	end',
	'function(arg_570_0)
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
	end',
	'function(arg_571_0, arg_571_1, arg_571_2, arg_571_3, arg_571_4, arg_571_5, arg_571_6)
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
	end',
	'function(arg_572_0, arg_572_1, arg_572_2, arg_572_3, arg_572_4, arg_572_5, arg_572_6)
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
	end',
	'function(arg_573_0, arg_573_1, arg_573_2, arg_573_3, arg_573_4)
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
	end',
	'function(arg_574_0, arg_574_1, arg_574_2, arg_574_3, arg_574_4, arg_574_5, arg_574_6)
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
	end',
	'function(arg_575_0, arg_575_1, arg_575_2, arg_575_3, arg_575_4, arg_575_5, arg_575_6)
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
	end',
	'function(arg_576_0, arg_576_1, arg_576_2, arg_576_3)
		var_576_0 = depends("io-devices-settings-utils")
		var_576_1 = depends("common_utils")
		var_576_2 = depends("io-somfy-devices-settings-utils")

		return var_576_0.aggregateConfig({
			["84082687"] = arg_576_0,
			["65537"] = arg_576_1,
			["48170496"] = arg_576_2,
			["48171008"] = arg_576_3
		}, var_576_1.deepCopy(var_576_2.states_4509097186557954))
	end',
	'function(arg_577_0, arg_577_1, arg_577_2, arg_577_3, arg_577_4, arg_577_5)
		var_577_0 = depends("io-devices-settings-utils")
		var_577_1 = depends("io-somfy-devices-settings-utils")
		var_577_2 = depends("common_utils")

		return var_577_0.runConfig(arg_577_0, arg_577_1, var_577_2.deepCopy(var_577_1.commands_4509097186557954), {
			["84082687"] = arg_577_2,
			["65537"] = arg_577_3,
			["48170496"] = arg_577_4,
			["48171008"] = arg_577_5
		}, var_577_2.deepCopy(var_577_1.states_4509097186557954), var_577_2.deepCopy(var_577_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_578_0, arg_578_1, arg_578_2, arg_578_3, arg_578_4, arg_578_5)
		var_578_0 = depends("io-devices-settings-utils")
		var_578_1 = depends("common_utils")
		var_578_2 = depends("io-somfy-devices-settings-utils")

		return var_578_0.advancedRefresh(arg_578_0, arg_578_1, {
			["84082687"] = arg_578_2,
			["65537"] = arg_578_3,
			["48170496"] = arg_578_4,
			["48171008"] = arg_578_5
		}, var_578_1.deepCopy(var_578_2.states_4509097186557954), {}, var_578_1.deepCopy(var_578_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_579_0, arg_579_1, arg_579_2, arg_579_3, arg_579_4, arg_579_5)
		var_579_0 = depends("io-devices-settings-utils")
		var_579_1 = depends("io-somfy-devices-settings-utils")
		var_579_2 = depends("common_utils")

		return var_579_0.runConfig(arg_579_0, arg_579_1, var_579_2.deepCopy(var_579_1.commands_4510196698185730), {
			["84082687"] = arg_579_2,
			["65537"] = arg_579_3,
			["48170496"] = arg_579_4,
			["48171008"] = arg_579_5
		}, var_579_2.deepCopy(var_579_1.states_4509097186557954), var_579_2.deepCopy(var_579_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_580_0, arg_580_1, arg_580_2, arg_580_3, arg_580_4, arg_580_5)
		var_580_0 = depends("io-devices-settings-utils")
		var_580_1 = depends("io-somfy-devices-settings-utils")
		var_580_2 = depends("common_utils")

		return var_580_0.runConfig(arg_580_0, arg_580_1, var_580_2.deepCopy(var_580_1.commands_4511296209813506), {
			["84082687"] = arg_580_2,
			["65537"] = arg_580_3,
			["48170496"] = arg_580_4,
			["48171008"] = arg_580_5
		}, var_580_2.deepCopy(var_580_1.states_4509097186557954), var_580_2.deepCopy(var_580_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_581_0, arg_581_1, arg_581_2, arg_581_3)
		var_581_0 = depends("io-devices-settings-utils")
		var_581_1 = depends("common_utils")
		var_581_2 = depends("io-somfy-devices-settings-utils")

		return var_581_0.aggregateConfig({
			["84082687"] = arg_581_0,
			["65537"] = arg_581_1,
			["48170496"] = arg_581_2,
			["48171008"] = arg_581_3
		}, var_581_1.deepCopy(var_581_2.states_4512395721441282))
	end',
	'function(arg_582_0, arg_582_1, arg_582_2, arg_582_3, arg_582_4, arg_582_5)
		var_582_0 = depends("io-devices-settings-utils")
		var_582_1 = depends("io-somfy-devices-settings-utils")
		var_582_2 = depends("common_utils")

		return var_582_0.runConfig(arg_582_0, arg_582_1, var_582_2.deepCopy(var_582_1.commands_4512395721441282), {
			["84082687"] = arg_582_2,
			["65537"] = arg_582_3,
			["48170496"] = arg_582_4,
			["48171008"] = arg_582_5
		}, var_582_2.deepCopy(var_582_1.states_4512395721441282), var_582_2.deepCopy(var_582_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_583_0, arg_583_1, arg_583_2, arg_583_3, arg_583_4, arg_583_5)
		var_583_0 = depends("io-devices-settings-utils")
		var_583_1 = depends("common_utils")
		var_583_2 = depends("io-somfy-devices-settings-utils")

		return var_583_0.advancedRefresh(arg_583_0, arg_583_1, {
			["84082687"] = arg_583_2,
			["65537"] = arg_583_3,
			["48170496"] = arg_583_4,
			["48171008"] = arg_583_5
		}, var_583_1.deepCopy(var_583_2.states_4512395721441282), {}, var_583_1.deepCopy(var_583_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_584_0, arg_584_1, arg_584_2, arg_584_3)
		var_584_0 = depends("io-devices-settings-utils")
		var_584_1 = depends("common_utils")
		var_584_2 = depends("io-somfy-devices-settings-utils")

		return var_584_0.aggregateConfig({
			["84082687"] = arg_584_0,
			["65537"] = arg_584_1,
			["48170496"] = arg_584_2,
			["48171008"] = arg_584_3
		}, var_584_1.deepCopy(var_584_2.states_4513495233069058))
	end',
	'function(arg_585_0, arg_585_1, arg_585_2, arg_585_3, arg_585_4, arg_585_5)
		var_585_0 = depends("io-devices-settings-utils")
		var_585_1 = depends("io-somfy-devices-settings-utils")
		var_585_2 = depends("common_utils")

		return var_585_0.runConfig(arg_585_0, arg_585_1, var_585_2.deepCopy(var_585_1.commands_4512395721441282), {
			["84082687"] = arg_585_2,
			["65537"] = arg_585_3,
			["48170496"] = arg_585_4,
			["48171008"] = arg_585_5
		}, var_585_2.deepCopy(var_585_1.states_4513495233069058), var_585_2.deepCopy(var_585_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_586_0, arg_586_1, arg_586_2, arg_586_3, arg_586_4, arg_586_5)
		var_586_0 = depends("io-devices-settings-utils")
		var_586_1 = depends("common_utils")
		var_586_2 = depends("io-somfy-devices-settings-utils")

		return var_586_0.advancedRefresh(arg_586_0, arg_586_1, {
			["84082687"] = arg_586_2,
			["65537"] = arg_586_3,
			["48170496"] = arg_586_4,
			["48171008"] = arg_586_5
		}, var_586_1.deepCopy(var_586_2.states_4513495233069058), {}, var_586_1.deepCopy(var_586_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_587_0, arg_587_1)
		var_587_0 = depends("io-devices-settings-utils")
		var_587_1 = depends("common_utils")
		var_587_2 = depends("io-somfy-devices-settings-utils")

		return var_587_0.aggregateConfig({
			["84082687"] = arg_587_0,
			["65537"] = arg_587_1
		}, var_587_1.deepCopy(var_587_2.states_4515694256324610))
	end',
	'function(arg_588_0)
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
	end',
	'function(arg_589_0, arg_589_1, arg_589_2, arg_589_3)
		var_589_0 = depends("io-devices-settings-utils")
		var_589_1 = depends("io-somfy-devices-settings-utils")
		var_589_2 = depends("common_utils")

		return var_589_0.runConfig(arg_589_0, arg_589_1, var_589_2.deepCopy(var_589_1.commands_4515694256324610), {
			["84082687"] = arg_589_2,
			["65537"] = arg_589_3
		}, var_589_2.deepCopy(var_589_1.states_4515694256324610), var_589_2.deepCopy(var_589_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_590_0, arg_590_1, arg_590_2, arg_590_3)
		var_590_0 = depends("io-devices-settings-utils")
		var_590_1 = depends("common_utils")
		var_590_2 = depends("io-somfy-devices-settings-utils")

		return var_590_0.advancedRefresh(arg_590_0, arg_590_1, {
			["84082687"] = arg_590_2,
			["65537"] = arg_590_3
		}, var_590_1.deepCopy(var_590_2.states_4515694256324610), {}, var_590_1.deepCopy(var_590_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_591_0, arg_591_1, arg_591_2, arg_591_3)
		var_591_0 = depends("io-devices-settings-utils")
		var_591_1 = depends("io-somfy-devices-settings-utils")
		var_591_2 = depends("common_utils")

		return var_591_0.runConfig(arg_591_0, arg_591_1, var_591_2.deepCopy(var_591_1.commands_4516793767952386), {
			["84082687"] = arg_591_2,
			["65537"] = arg_591_3
		}, var_591_2.deepCopy(var_591_1.states_4515694256324610), var_591_2.deepCopy(var_591_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_592_0, arg_592_1)
		var_592_0 = depends("io-devices-settings-utils")
		var_592_1 = depends("common_utils")
		var_592_2 = depends("io-somfy-devices-settings-utils")

		return var_592_0.aggregateConfig({
			["84082687"] = arg_592_0,
			["65537"] = arg_592_1
		}, var_592_1.deepCopy(var_592_2.states_4517893279580162))
	end',
	'function(arg_593_0, arg_593_1, arg_593_2, arg_593_3)
		var_593_0 = depends("io-devices-settings-utils")
		var_593_1 = depends("io-somfy-devices-settings-utils")
		var_593_2 = depends("common_utils")

		return var_593_0.runConfig(arg_593_0, arg_593_1, var_593_2.deepCopy(var_593_1.commands_4516793767952386), {
			["84082687"] = arg_593_2,
			["65537"] = arg_593_3
		}, var_593_2.deepCopy(var_593_1.states_4517893279580162), var_593_2.deepCopy(var_593_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_594_0, arg_594_1, arg_594_2, arg_594_3)
		var_594_0 = depends("io-devices-settings-utils")
		var_594_1 = depends("common_utils")
		var_594_2 = depends("io-somfy-devices-settings-utils")

		return var_594_0.advancedRefresh(arg_594_0, arg_594_1, {
			["84082687"] = arg_594_2,
			["65537"] = arg_594_3
		}, var_594_1.deepCopy(var_594_2.states_4517893279580162), {}, var_594_1.deepCopy(var_594_2.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_595_0)
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
	end',
	'function(arg_596_0, arg_596_1, arg_596_2, arg_596_3, arg_596_4)
		var_596_0 = depends("io-devices-settings-utils")
		var_596_1 = depends("io-somfy-devices-settings-utils")
		var_596_2 = depends("common_utils")

		return var_596_0.runConfig(arg_596_0, arg_596_1, var_596_2.deepCopy(var_596_1.commands_4581664953073666), {
			["84082687"] = arg_596_2,
			["65537"] = arg_596_3,
			["84059651"] = arg_596_4
		}, var_596_2.deepCopy(var_596_1.states_4511296208896002), var_596_2.deepCopy(var_596_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_597_0, arg_597_1, arg_597_2, arg_597_3)
		var_597_0 = depends("io-devices-settings-utils")
		var_597_1 = depends("common_utils")
		var_597_2 = depends("io-somfy-devices-settings-utils")

		return var_597_0.aggregateConfig({
			["84082687"] = arg_597_0,
			["65537"] = arg_597_1,
			["65540"] = arg_597_2,
			["48177664"] = arg_597_3
		}, var_597_1.deepCopy(var_597_2.states_4507997674012930))
	end',
	'function(arg_598_0, arg_598_1, arg_598_2, arg_598_3, arg_598_4, arg_598_5)
		var_598_0 = depends("io-devices-settings-utils")
		var_598_1 = depends("io-somfy-devices-settings-utils")
		var_598_2 = depends("common_utils")

		return var_598_0.runConfig(arg_598_0, arg_598_1, var_598_2.deepCopy(var_598_1.commands_4504699139129602), {
			["84082687"] = arg_598_2,
			["65537"] = arg_598_3,
			["65540"] = arg_598_4,
			["48177664"] = arg_598_5
		}, var_598_2.deepCopy(var_598_1.states_4507997674012930), var_598_2.deepCopy(var_598_1.diagnosticStatesGroups_4504699139653634), context)
	end',
	'function(arg_599_0, arg_599_1, arg_599_2, arg_599_3, arg_599_4, arg_599_5)
		var_599_0 = depends("io-devices-settings-utils")
		var_599_1 = depends("common_utils")
		var_599_2 = depends("io-somfy-devices-settings-utils")

		return var_599_0.advancedRefresh(arg_599_0, arg_599_1, {
			["84082687"] = arg_599_2,
			["65537"] = arg_599_3,
			["65540"] = arg_599_4,
			["48177664"] = arg_599_5
		}, var_599_1.deepCopy(var_599_2.states_4507997674012930), {}, var_599_1.deepCopy(var_599_2.diagnosticStatesGroups_4504699139653634), context)
	end'
}
