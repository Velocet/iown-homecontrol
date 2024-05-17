-- stripped io-devices for parsing with python

{
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
	["393218"] = { name = "Dimmable Light-Somfy",
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
	["408066"] = { name = "On/Off Light-Somfy",
		localPairing = true,
		["0"] = ioDevices_Data[140]
	},
	["2199023663618"] = { name = "On/Off Light-Somfy-With battery status",
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
	["983552"] = { name = "Switch On/Off-micromodule",
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
	["983554"] = { name = "Light On/Off-micromodule SOMFY",
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
	["2199023648770"] = { name = "Dimmable Light-micromodule SOMFY",
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
	["4295950348"] = { name = "Multi-Energy Consumption Sensor-GMDE (Atlantic)",
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
	["4303355906"] = { name = "Smoke sensor-Fumix SOMFY",
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
	["4303683586"] = { name = "Closure sensor-DO SOMFY",
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
	["4303749122"] = { name = "Motion sensor-DM SOMFY",
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
	["4303880194"] = { name = "Rain sensor-ondeis SOMFY",
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
	["1099512020994"] = { name = "Dimmable Light-Somfy-Light Receiver 2017",
		localPairing = true,
		["0"] = ioDevices_Data[115]
	},
	["1099512021250"] = { name = "Dimmable RGB Light Somfy-Light Receiver 2017",
		localPairing = true,
		["0"] = ioDevices_Data[127]
	},
	["1099512021506"] = { name = "Tunable White Receiver-Light Receiver 2017",
		localPairing = true,
		["0"] = ioDevices_Data[132]
	},
	["1099512035842"] = { name = "On/Off Light-Somfy-Light Receiver 2017",
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
	["1099512611330"] = { name = "Switch On/Off-micromodule SOMFY",
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
	["1099513397506"] = { name = "Sliding Window with lock SOMFY-Air",
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
	["1103815311362"] = { name = "Closure sensor-Slim DO SOMFY",
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
	["2199024304386"] = { name = "Pergola Rail Guided Awning SOMFY-Pergola CQFD",
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
	["3298535931906"] = { name = "Horizontal Awning Somfy-Sunea Sunilus CQFD",
		localPairing = true,
		["0"] = ioDevices_Data[203]
	},
	["3298535997442"] = { name = "Exterior Venetian Blind J4 with WP2",
		localPairing = true,
		["0"] = ioDevices_Data[482]
	},
	["3298538225676"] = { name = "Domestic hot water production (Atlantic V2-AEX)",
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
	["4398047559682"] = { name = "Horizontal Awning Somfy-Sunea Screen 40",
		localPairing = true,
		["0"] = ioDevices_Data[203]
	},
	["4398049853452"] = { name = "Domestic hot water production (Atlantic V2-MURAL)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_MURAL_IOComponent"] = ioDevices_Data[486]
		},
		["2"] = ioDevices_Data[358]
	},
	["5497558269954"] = { name = "Roller Shutter SOMFY-Altus RS",
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
	["5497559187458"] = { name = "Horizontal Awning Somfy-Sunea 50 CSI",
		localPairing = true,
		["0"] = ioDevices_Data[203]
	},
	["5497561481228"] = { name = "Domestic hot water production (Atlantic V2-SPLIT)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_SPLIT_IOComponent"] = ioDevices_Data[355]
		},
		["2"] = ioDevices_Data[358]
	},
	["6597069897730"] = { name = "Roller Shutter SOMFY-Oximo 40",
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
	["6597073109004"] = { name = "Domestic hot water production (Atlantic V2-V2 TEC5)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_TEC5_IOComponent"] = ioDevices_Data[355]
		},
		["2"] = ioDevices_Data[358]
	},
	["7696581525506"] = { name = "Roller Shutter SOMFY-Awmio-Oximo CQFD",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["15393162919938"] = { name = "Roller Shutter SOMFY-Awmio-Oximo CQFD Redesign",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["7696581591042"] = { name = "Vertical Exterior Awning SOMFY-AWMIO",
		localPairing = true,
		["0"] = ioDevices_Data[91]
	},
	["7696581868034"] = { name = "Discrete Gate Opener SOMFY (Roly Smart IO)",
		localPairing = true,
		["0"] = ioDevices_Data[490]
	},
	["7696584736780"] = { name = "Domestic hot water production (Atlantic V2-CE FLAT C2)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_CE_FLAT_C2_IOComponent"] = ioDevices_Data[493]
		},
		["2"] = ioDevices_Data[358]
	},
	["8796093153282"] = { name = "Roller Shutter SOMFY-Short Motor IO",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["8796093218818"] = { name = "Vertical Exterior Awning SOMFY-Sunea Sunilus",
		localPairing = true,
		["0"] = ioDevices_Data[91]
	},
	["8796096364556"] = { name = "Domestic hot water production (Atlantic V2-CE S4)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_CE_S4_IOComponent"] = ioDevices_Data[493]
		},
		["2"] = ioDevices_Data[358]
	},
	["9895604781058"] = { name = "Roller Shutter SOMFY-MicroModule IO",
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
	["9895604846594"] = { name = "Vertical Exterior Awning SOMFY-Slim Receiver",
		localPairing = true,
		["0"] = ioDevices_Data[91]
	},
	["9895607992332"] = { name = "Domestic hot water production (Atlantic V2-CETHI V4)",
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
	["10995116474370"] = { name = "Vertical Exterior Awning SOMFY-Universal Screen",
		localPairing = true,
		["0"] = ioDevices_Data[91]
	},
	["10995119620108"] = { name = "Domestic hot water production (Atlantic V2-CV4E)",
		localPairing = true,
		["1"] = {
			["io:AtlanticDomesticHotWaterProductionV2_CV4E_IOComponent"] = ioDevices_Data[486]
		},
		["2"] = ioDevices_Data[358]
	},
	["12094628036610"] = { name = "Roller Shutter SOMFY-Ilmo 2 50",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["12094628102146"] = { name = "Sunea 40-Vertical Exterior Awning SOMFY",
		localPairing = true,
		["0"] = ioDevices_Data[91]
	},
	["13194139664386"] = { name = "Roller Shutter SOMFY-Solus P&P 50",
		localPairing = true,
		["0"] = ioDevices_Data[67]
	},
	["17592187158530"] = { name = "Exterior Venetian Blind-J4 IO",
		localPairing = true,
		["0"] = ioDevices_Data[218]
	},
	["18691698786306"] = { name = "Exterior Venetian Blind with WP-J4 IO",
		localPairing = true,
		["0"] = ioDevices_Data[447]
	},
	["20890722041858"] = { name = "Exterior Venetian Blind J4 with WP2-J4 IO",
		localPairing = true,
		["0"] = ioDevices_Data[482]
	},
	["35184373202946"] = { name = "Exterior Venetian Blind-EVB RTX BRIDGE",
		localPairing = true,
		["0"] = ioDevices_Data[218]
	},
	["36283884830722"] = { name = "Exterior Venetian Blind with WP-EVB RTX BRIDGE",
		localPairing = true,
		["0"] = ioDevices_Data[447]
	},
	["38482908086274"] = { name = "Exterior Venetian Blind J4 with WP2-EVB RTX BRIDGE",
		localPairing = true,
		["0"] = ioDevices_Data[482]
	},
	["52776559247362"] = { name = "Exterior Venetian Blind-J4 IO PROTECT",
		localPairing = true,
		["0"] = ioDevices_Data[218]
	},
	["53876070875138"] = { name = "Exterior Venetian Blind with WP-J4 IO PROTECT",
		localPairing = true,
		["0"] = ioDevices_Data[447]
	},
	["56075094130690"] = { name = "Exterior Venetian Blind J4 with WP2-J4 IO PROTECT",
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
