{
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
