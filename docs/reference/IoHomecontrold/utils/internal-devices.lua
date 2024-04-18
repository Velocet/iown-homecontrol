var_0_0 = {
	function(arg_1_0)
		return depends("Internal", "utils").fromRawAlarmMode(arg_1_0)
	end,
	function(arg_2_0)
		return depends("Internal", "utils").checkAlarmName(arg_2_0)
	end,
	function(arg_3_0)
		return depends("Internal", "utils").toRawAlarmMode(arg_3_0)
	end,
	function(arg_4_0)
		return depends("Internal", "utils").rssiSignalQuality(arg_4_0)
	end,
	function(arg_5_0)
		return depends("Internal", "utils").fromRawSirenStatus(arg_5_0)
	end,
	function(arg_6_0, arg_6_1)
		return depends("Internal", "utils").toRawBlinkModemLed(arg_6_0, arg_6_1)
	end,
	function(arg_7_0, arg_7_1)
		return depends("Internal", "utils").toRawIncreasingFrequencyBip(arg_7_0, arg_7_1)
	end,
	function(arg_8_0)
		return depends("Internal", "utils").toRawLongBip(arg_8_0)
	end,
	function(arg_9_0, arg_9_1, arg_9_2)
		return depends("Internal", "utils").toRawSirenStatus(arg_9_0, arg_9_1, arg_9_2)
	end,
	function(arg_10_0)
		return depends("Internal", "utils").toRawShortBip(arg_10_0)
	end,
	function(arg_11_0)
		return depends("Internal", "utils").fromRawConfigButton(arg_11_0)
	end,
	function()
		return depends("Internal", "utils").toRawUpdate()
	end,
	function(arg_13_0)
		return depends("Internal", "utils").fromRawTouchButton(arg_13_0)
	end,
	function(arg_14_0)
		return depends("Internal", "utils").getRSSILevel(arg_14_0)
	end,
	function(arg_15_0)
		if arg_15_0.ssidB64 == nil or arg_15_0.ssidB64 == "" then
			if arg_15_0.ssid == nil or arg_15_0.ssid == "" then
				return nil
			else
				return arg_15_0.ssid
			end
		else
			return bytearray(arg_15_0.ssidB64, "base64"):tostring("utf-8")
		end
	end,
	function(arg_16_0, arg_16_1)
		return {
			ssid = arg_16_0,
			passphrase = arg_16_1
		}
	end,
	function()
		return "remove"
	end
}
var_0_1 = {}
var_0_2 = {}
var_0_3 = {}
var_0_4 = {
	[0] = {
		stateName = "core:NameState",
		parameters = {
			{
				rawStateId = "name",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:AlarmDelayState",
		parameters = {
			{
				rawStateId = "delay",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:CurrentAlarmModeState",
		parameters = {
			{
				rawStateId = "currentMode",
				name = "p1"
			}
		},
		converter = var_0_0[1]
	},
	{
		stateName = "internal:IntrusionDetectedState",
		parameters = {
			{
				rawStateId = "intrusion",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:TargetAlarmModeState",
		parameters = {
			{
				rawStateId = "targetMode",
				name = "p1"
			}
		},
		converter = var_0_0[1]
	},
	{
		stateName = "core:BatteryLevelState",
		parameters = {
			{
				rawStateId = "batteryLevel",
				name = "p1"
			}
		}
	},
	{
		stateName = "core:RSSILevelState",
		parameters = {
			{
				rawStateId = "rssi",
				name = "p1"
			}
		},
		converter = var_0_0[4]
	},
	{
		stateName = "internal:AirplaneModeState",
		parameters = {
			{
				rawStateId = "airplane",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:BatteryStatusState",
		parameters = {
			{
				rawStateId = "batteryPowered",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:GPRSRegistrationState",
		parameters = {
			{
				rawStateId = "gprs",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:GSMRegistrationState",
		parameters = {
			{
				rawStateId = "gsm",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:LightingLedModemModeState",
		parameters = {
			{
				rawStateId = "lightingLedModemMode",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:ProviderNameState",
		parameters = {
			{
				rawStateId = "operator",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:SIMCardActivationState",
		parameters = {
			{
				rawStateId = "activation",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:SIMCardConnectivityState",
		parameters = {
			{
				rawStateId = "connectivity",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:SIMCardStatusState",
		parameters = {
			{
				rawStateId = "sim",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:SirenStatusState",
		parameters = {
			{
				rawStateId = "siren",
				name = "p1"
			}
		},
		converter = var_0_0[5]
	},
	{
		stateName = "core:ConnectivityState",
		parameters = {
			{
				rawStateId = "networkConnectivity",
				name = "p1"
			}
		}
	},
	{
		stateName = "core:CountryCodeState",
		parameters = {
			{
				rawStateId = "countryCode",
				name = "p1"
			}
		}
	},
	{
		stateName = "core:LocalIPv4AddressState",
		parameters = {
			{
				rawStateId = "ip",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:LastActionConfigButtonState",
		parameters = {
			{
				rawStateId = "configButton",
				name = "p1"
			}
		},
		converter = var_0_0[11]
	},
	{
		stateName = "internal:LightingLedPodModeState",
		parameters = {
			{
				rawStateId = "lightingLedPodMode",
				name = "p1"
			}
		}
	},
	{
		stateName = "core:CyclicButtonState",
		parameters = {
			{
				rawStateId = "touchButton",
				name = "p1"
			}
		},
		converter = var_0_0[13]
	},
	{
		stateName = "core:RSSILevelState",
		parameters = {
			{
				rawStateId = "rssi",
				name = "p1"
			}
		}
	},
	{
		stateName = "core:RSSIQualityState",
		parameters = {
			{
				rawStateId = "rssi",
				name = "p1"
			}
		},
		converter = var_0_0[14]
	},
	{
		stateName = "internal:CurrentInfraConfigState",
		parameters = {
			{
				rawStateId = "currentInfraConfig",
				name = "p1"
			}
		},
		converter = var_0_0[15]
	},
	{
		stateName = "internal:SignalStrengthState",
		parameters = {
			{
				rawStateId = "signalStrength",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:WifiModeState",
		parameters = {
			{
				rawStateId = "mode",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:Button1State",
		parameters = {
			{
				rawStateId = "button1",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:Button2State",
		parameters = {
			{
				rawStateId = "button2",
				name = "p1"
			}
		}
	},
	{
		stateName = "internal:Button3State",
		parameters = {
			{
				rawStateId = "button3",
				name = "p1"
			}
		}
	}
}
var_0_5 = {}
var_0_6 = {
	{
		linkedHighLevelState = {
			var_0_4[0]
		}
	},
	{
		extraDefinition = {
			access = "r",
			parameterId = "name"
		}
	},
	{
		isParameterRequired = true,
		name = "p1"
	},
	{
		var_0_6[3]
	},
	{
		access = "w",
		parameterId = "targetMode"
	},
	{
		parameters = {
			{
				value = "off",
				name = "p1"
			}
		},
		converter = var_0_0[3],
		extraDefinition = var_0_6[5]
	},
	{
		parameters = {
			{
				value = "total",
				name = "p1"
			}
		},
		converter = var_0_0[3],
		extraDefinition = var_0_6[5]
	},
	{
		"Specific"
	},
	{
		extraDefinition = {
			access = "r",
			parameterId = "mode"
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[8]
		}
	},
	{
		isParameterRequired = false,
		name = "p2"
	},
	{
		access = "w",
		parameterId = "modemLed"
	},
	{
		{
			value = 0,
			name = "p1"
		}
	},
	{
		var_0_6[3],
		{
			isParameterRequired = true,
			name = "p2"
		}
	},
	{
		access = "w",
		parameterId = "buzz"
	},
	{
		extraDefinition = {
			access = "r",
			parameterId = "batteryPowered"
		}
	},
	{
		access = "w",
		parameterId = "lightingLedModemMode"
	},
	{
		{
			value = 1,
			name = "p1"
		}
	},
	{
		access = "w",
		parameterId = "siren"
	},
	{
		"UpdatableComponent"
	},
	{
		linkedHighLevelState = {
			var_0_4[17]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[18]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[19]
		}
	},
	{
		linkedHighLevelState = {
			var_0_4[21]
		}
	},
	{
		extraDefinition = {
			access = "r",
			parameterId = "updateStatus"
		}
	},
	{
		access = "w",
		parameterId = "calendarTrigger"
	},
	{
		prototype = "string(yes;no)",
		parameters = var_0_6[4],
		extraDefinition = var_0_6[26]
	},
	{
		parameters = {
			{
				value = "yes",
				name = "p1"
			}
		},
		extraDefinition = var_0_6[26]
	},
	{
		parameters = {
			{
				value = "no",
				name = "p1"
			}
		},
		extraDefinition = var_0_6[26]
	},
	{
		prototype = "string",
		parameters = var_0_6[4],
		extraDefinition = {
			access = "w",
			parameterId = "countryCode"
		}
	},
	{
		access = "w",
		parameterId = "lightingLedPodMode"
	},
	{
		prototype = "float[0.0;1.0]",
		parameters = var_0_6[4],
		extraDefinition = var_0_6[31]
	},
	{
		parameters = var_0_6[13],
		extraDefinition = var_0_6[31]
	},
	{
		parameters = var_0_6[18],
		extraDefinition = var_0_6[31]
	},
	{
		converter = var_0_0[12],
		extraDefinition = {
			access = "w",
			parameterId = "update"
		}
	},
	{
		getName = var_0_6[2],
		refreshPodMode = var_0_6[9],
		refreshUpdateStatus = var_0_6[25],
		setCalendar = var_0_6[27],
		activateCalendar = var_0_6[28],
		deactivateCalendar = var_0_6[29],
		setCountryCode = var_0_6[30],
		setLightingLedPodMode = var_0_6[32],
		setPodLedOff = var_0_6[33],
		setPodLedOn = var_0_6[34],
		update = var_0_6[35]
	}
}

return {
	["1"] = {
		name = "Generic Alarm Controller",
		localPairing = true,
		["0"] = {
			["internal:TSKAlarmComponent"] = {
				type = 1,
				widget = "TSKAlarmController",
				uiClass = "Alarm",
				uiProfiles = {
					"Alarm",
					"Switchable"
				},
				states = {
					name = var_0_6[1],
					delay = {
						linkedHighLevelState = {
							var_0_4[1]
						}
					},
					currentMode = {
						linkedHighLevelState = {
							var_0_4[2]
						}
					},
					intrusion = {
						linkedHighLevelState = {
							var_0_4[3]
						}
					},
					targetMode = {
						linkedHighLevelState = {
							var_0_4[4]
						}
					}
				},
				commands = {
					getName = var_0_6[2],
					refreshAlarmDelay = {
						extraDefinition = {
							access = "r",
							parameterId = "delay"
						}
					},
					refreshCurrentAlarmMode = {
						extraDefinition = {
							access = "r",
							parameterId = "currentMode"
						}
					},
					refreshIntrusionDetected = {
						extraDefinition = {
							access = "r",
							parameterId = "intrusion"
						}
					},
					setAlarmDelay = {
						prototype = "integer[0;255]",
						parameters = var_0_6[4],
						extraDefinition = {
							access = "w",
							parameterId = "delay"
						}
					},
					setIntrusionDetected = {
						prototype = "string(detected;notDetected;pending;sos)",
						parameters = var_0_6[4],
						extraDefinition = {
							access = "w",
							parameterId = "intrusion"
						}
					},
					setName = {
						prototype = "string",
						parameters = var_0_6[4],
						converter = var_0_0[2],
						extraDefinition = {
							access = "w",
							parameterId = "name"
						}
					},
					setTargetAlarmMode = {
						prototype = "string(off;partial1;partial2;sos;total)",
						parameters = var_0_6[4],
						converter = var_0_0[3],
						extraDefinition = var_0_6[5]
					},
					alarmOff = var_0_6[6],
					alarmOn = var_0_6[7],
					alarmPartial1 = {
						parameters = {
							{
								value = "partial1",
								name = "p1"
							}
						},
						converter = var_0_0[3],
						extraDefinition = var_0_6[5]
					},
					alarmPartial2 = {
						parameters = {
							{
								value = "partial2",
								name = "p1"
							}
						},
						converter = var_0_0[3],
						extraDefinition = var_0_6[5]
					},
					off = var_0_6[6],
					on = var_0_6[7],
					disarm = var_0_6[6],
					arm = var_0_6[7]
				}
			}
		}
	},
	["2"] = {
		name = "Pod",
		localPairing = true,
		["0"] = {
			["internal:PodComponent"] = {
				type = 1,
				widget = "Pod",
				uiClass = "Pod",
				uiProfiles = var_0_6[8],
				states = {
					name = var_0_6[1]
				},
				commands = {
					getName = var_0_6[2],
					refreshPodMode = var_0_6[9]
				}
			}
		}
	},
	["3"] = {
		name = "TSK Dock",
		localPairing = true,
		["0"] = {
			["internal:TSKDockComponent"] = {
				type = 1,
				widget = "Dock",
				uiClass = "Dock",
				uiProfiles = var_0_6[8],
				states = {
					batteryLevel = {
						linkedHighLevelState = {
							var_0_4[5]
						}
					},
					name = var_0_6[1],
					rssi = {
						linkedHighLevelState = {
							var_0_4[6]
						}
					},
					airplane = {
						linkedHighLevelState = {
							var_0_4[7]
						}
					},
					batteryPowered = var_0_6[10],
					gprs = {
						linkedHighLevelState = {
							var_0_4[9]
						}
					},
					gsm = {
						linkedHighLevelState = {
							var_0_4[10]
						}
					},
					lightingLedModemMode = {
						linkedHighLevelState = {
							var_0_4[11]
						}
					},
					operator = {
						linkedHighLevelState = {
							var_0_4[12]
						}
					},
					activation = {
						linkedHighLevelState = {
							var_0_4[13]
						}
					},
					connectivity = {
						linkedHighLevelState = {
							var_0_4[14]
						}
					},
					sim = {
						linkedHighLevelState = {
							var_0_4[15]
						}
					},
					siren = {
						linkedHighLevelState = {
							var_0_4[16]
						}
					}
				},
				commands = {
					blinkModemLed = {
						prototype = "integer(0;100;200;300;400;500;600;700;800;900;1000),*integer(100;200;300;400;500;600;700;800;900;1000)",
						parameters = {
							var_0_6[3],
							var_0_6[11]
						},
						converter = var_0_0[6],
						extraDefinition = var_0_6[12]
					},
					stopBlinkModemLed = {
						parameters = var_0_6[13],
						converter = var_0_0[6],
						extraDefinition = var_0_6[12]
					},
					getName = var_0_6[2],
					increasingFrequencyBip = {
						prototype = "integer[0;255],integer[0;255]",
						parameters = var_0_6[14],
						converter = var_0_0[7],
						extraDefinition = {
							access = "w",
							parameterId = "increasingFrequencyBip"
						}
					},
					longBip = {
						prototype = "integer[0;255]",
						parameters = var_0_6[4],
						converter = var_0_0[8],
						extraDefinition = var_0_6[15]
					},
					rebootModem = {
						extraDefinition = {
							access = "w",
							parameterId = "reboot"
						}
					},
					refreshAirplaneMode = {
						extraDefinition = {
							access = "r",
							parameterId = "airplane"
						}
					},
					refreshBatteryLevel = {
						extraDefinition = {
							access = "r",
							parameterId = "batteryLevel"
						}
					},
					refreshBatteryStatus = var_0_6[16],
					refreshGPRSRegistration = {
						extraDefinition = {
							access = "r",
							parameterId = "gprs"
						}
					},
					refreshGSMRegistration = {
						extraDefinition = {
							access = "r",
							parameterId = "gsm"
						}
					},
					refreshOperatorConfig = {
						extraDefinition = {
							access = "r",
							parameterId = "operatorConfig"
						}
					},
					refreshOperatorName = {
						extraDefinition = {
							access = "r",
							parameterId = "operator"
						}
					},
					refreshRSSILevel = {
						extraDefinition = {
							access = "r",
							parameterId = "rssi"
						}
					},
					refreshSIMCardStatus = {
						extraDefinition = {
							access = "r",
							parameterId = "sim"
						}
					},
					refreshSirenStatus = {
						extraDefinition = {
							access = "r",
							parameterId = "siren"
						}
					},
					setAirplaneMode = {
						prototype = "string",
						parameters = var_0_6[4],
						extraDefinition = {
							access = "w",
							parameterId = "airplane"
						}
					},
					setLightingLedModemMode = {
						prototype = "integer(0;1)",
						parameters = var_0_6[4],
						extraDefinition = var_0_6[17]
					},
					setModemLedOff = {
						parameters = var_0_6[13],
						extraDefinition = var_0_6[17]
					},
					setModemLedOn = {
						parameters = var_0_6[18],
						extraDefinition = var_0_6[17]
					},
					setOperatorConfig = {
						prototype = "string",
						parameters = var_0_6[4],
						extraDefinition = {
							access = "w",
							parameterId = "operatorConfig"
						}
					},
					setSIMPinCode = {
						prototype = "string",
						parameters = var_0_6[4],
						extraDefinition = {
							access = "w",
							parameterId = "sim"
						}
					},
					setSirenStatus = {
						prototype = "string(on;off)|string(cyclic),*integer,*integer",
						parameters = {
							var_0_6[3],
							var_0_6[11],
							{
								isParameterRequired = false,
								name = "p3"
							}
						},
						converter = var_0_0[9],
						extraDefinition = var_0_6[19]
					},
					shortBip = {
						prototype = "integer[0;255]",
						parameters = var_0_6[4],
						converter = var_0_0[10],
						extraDefinition = var_0_6[15]
					},
					siren = {
						prototype = "string(cyclic;off;on)",
						parameters = var_0_6[4],
						extraDefinition = var_0_6[19]
					}
				}
			}
		}
	},
	["4"] = {
		name = "PodMini",
		localPairing = true,
		["0"] = {
			["internal:PodMiniComponent"] = {
				type = 1,
				widget = "Pod",
				uiClass = "Pod",
				uiProfiles = var_0_6[20],
				states = {
					networkConnectivity = var_0_6[21],
					countryCode = var_0_6[22],
					ip = var_0_6[23],
					name = var_0_6[1],
					configButton = {
						linkedHighLevelState = {
							var_0_4[20]
						}
					},
					lightingLedPodMode = var_0_6[24]
				},
				commands = var_0_6[36]
			}
		}
	},
	["5"] = {
		name = "PodV2",
		localPairing = true,
		["0"] = {
			["internal:PodV2Component"] = {
				type = 1,
				widget = "Pod",
				uiClass = "Pod",
				uiProfiles = var_0_6[20],
				states = {
					networkConnectivity = var_0_6[21],
					countryCode = var_0_6[22],
					touchButton = {
						linkedHighLevelState = {
							var_0_4[22]
						}
					},
					ip = var_0_6[23],
					name = var_0_6[1],
					batteryPowered = var_0_6[10],
					lightingLedPodMode = var_0_6[24]
				},
				commands = {
					getName = var_0_6[2],
					refreshBatteryStatus = var_0_6[16],
					refreshPodMode = var_0_6[9],
					refreshUpdateStatus = var_0_6[25],
					setCalendar = var_0_6[27],
					activateCalendar = var_0_6[28],
					deactivateCalendar = var_0_6[29],
					setCountryCode = var_0_6[30],
					setLightingLedPodMode = var_0_6[32],
					setPodLedOff = var_0_6[33],
					setPodLedOn = var_0_6[34],
					update = var_0_6[35]
				}
			}
		}
	},
	["6"] = {
		name = "uPod",
		localPairing = true,
		["0"] = {
			["internal:UPodComponent"] = {
				widget = "Pod",
				uiClass = "Pod",
				type = 1,
				uiProfiles = var_0_6[8]
			}
		}
	},
	["7"] = {
		name = "uPodNetwork",
		localPairing = true,
		["0"] = {
			["internal:UPodNetWorkComponent"] = {
				type = 1,
				widget = "Pod",
				uiClass = "Pod",
				uiProfiles = var_0_6[8],
				states = {
					rssi = {
						linkedHighLevelState = {
							var_0_4[23],
							var_0_4[24]
						}
					}
				}
			}
		}
	},
	["9"] = {
		name = "wifi",
		localPairing = true,
		["0"] = {
			["internal:WifiComponent"] = {
				type = 1,
				widget = "Wifi",
				uiClass = "Wifi",
				uiProfiles = var_0_6[8],
				states = {
					currentInfraConfig = {
						linkedHighLevelState = {
							var_0_4[25]
						}
					},
					signalStrength = {
						linkedHighLevelState = {
							var_0_4[26]
						}
					},
					mode = {
						linkedHighLevelState = {
							var_0_4[27]
						}
					}
				},
				commands = {
					setTargetInfraConfig = {
						prototype = "string,!string",
						parameters = var_0_6[14],
						converter = var_0_0[16],
						extraDefinition = {
							access = "w",
							parameterId = "targetInfraConfig"
						}
					},
					setWifiMode = {
						prototype = "string(infrastructure;accesspoint)",
						parameters = var_0_6[4],
						extraDefinition = {
							access = "w",
							parameterId = "mode"
						}
					},
					clearCredentials = {
						converter = var_0_0[17],
						extraDefinition = {
							access = "w",
							parameterId = "credentials"
						}
					}
				}
			}
		}
	},
	["10"] = {
		name = "PodV3",
		localPairing = true,
		["0"] = {
			["internal:PodV3Component"] = {
				type = 1,
				widget = "Pod",
				uiClass = "Pod",
				uiProfiles = var_0_6[20],
				states = {
					networkConnectivity = var_0_6[21],
					countryCode = var_0_6[22],
					ip = var_0_6[23],
					name = var_0_6[1],
					button1 = {
						linkedHighLevelState = {
							var_0_4[28]
						}
					},
					button2 = {
						linkedHighLevelState = {
							var_0_4[29]
						}
					},
					button3 = {
						linkedHighLevelState = {
							var_0_4[30]
						}
					},
					lightingLedPodMode = var_0_6[24]
				},
				commands = var_0_6[36]
			}
		}
	},
	["11"] = {
		name = "PodV3RD",
		localPairing = true,
		["0"] = {
			["internal:PodV3RDComponent"] = {
				type = 1,
				widget = "Pod",
				uiClass = "Pod",
				uiProfiles = var_0_6[20],
				states = {
					networkConnectivity = var_0_6[21],
					countryCode = var_0_6[22],
					ip = var_0_6[23],
					name = var_0_6[1],
					lightingLedPodMode = var_0_6[24]
				},
				commands = var_0_6[36]
			}
		}
	}
}
