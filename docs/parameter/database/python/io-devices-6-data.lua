{
  { nil }, -- dummy to act a index 0
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
