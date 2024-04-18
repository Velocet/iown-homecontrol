local var_0_0 = require("Overkiz.Time")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = require("bit")

local function var_0_3(arg_1_0)
	return function(arg_2_0, arg_2_1)
		return arg_2_1[1] * var_0_2.shiftByte(1) + arg_2_1[2] == arg_1_0
	end
end

local var_0_4 = var_0_0.Monotonic(var_0_0.Elapsed(1800, 0))
local var_0_5 = var_0_0.Monotonic(var_0_0.Elapsed(3600, 0))
local var_0_6 = var_0_0.Monotonic(var_0_0.Elapsed(86400, 0))

return {
	["100"] = {
		name = "100 T° ECS",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 100
			},
			matchStateFunction = var_0_3(100),
			interval = var_0_4
		}
	},
	["200"] = {
		name = "200 T° ECS",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 200
			},
			matchStateFunction = var_0_3(200),
			interval = var_0_4
		}
	},
	["300"] = {
		name = "300 T° retour chauffage + ECS",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 300
			},
			matchStateFunction = var_0_3(300),
			interval = var_0_4
		}
	},
	["303"] = {
		name = "303 Nombre de démarrage bruleur en chauffage",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 303
			},
			matchStateFunction = var_0_3(303),
			interval = var_0_6
		}
	},
	["304"] = {
		name = "304 Nombre de démarrage bruleur en ECS",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 304
			},
			matchStateFunction = var_0_3(304),
			interval = var_0_6
		}
	},
	["306"] = {
		name = "306 Nombre de pertes de flamme",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 306
			},
			matchStateFunction = var_0_3(306),
			interval = var_0_6
		}
	},
	["400"] = {
		name = "400 T° retour chauffage + ECS",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 400
			},
			matchStateFunction = var_0_3(400),
			interval = var_0_4
		}
	},
	["405"] = {
		name = "405 Duree fonctionnement / jour compresseur",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 405
			},
			matchStateFunction = var_0_3(405),
			interval = var_0_6
		}
	},
	["406"] = {
		name = "406 Nombre de démarrage / jour compresseur",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 406
			},
			matchStateFunction = var_0_3(406),
			interval = var_0_6
		}
	},
	["415"] = {
		name = "415 Durée de fonctionnement / jour appoint principal",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 415
			},
			matchStateFunction = var_0_3(415),
			interval = var_0_6
		}
	},
	["416"] = {
		name = "416 Nombre de démarrage / jour appoint principal",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 416
			},
			matchStateFunction = var_0_3(416),
			interval = var_0_6
		}
	},
	["417"] = {
		name = "417 Durée de fonctionnement / jour appoints ECS",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 417
			},
			matchStateFunction = var_0_3(417),
			interval = var_0_6
		}
	},
	["418"] = {
		name = "418 Nombre de démarrage / jour appoint ECS",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 418
			},
			matchStateFunction = var_0_3(418),
			interval = var_0_6
		}
	},
	["500"] = {
		name = "500 Consigne de T° départ chauffage (zone 1)",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 500
			},
			matchStateFunction = var_0_3(500),
			interval = var_0_5
		}
	},
	["501"] = {
		name = "501 Consigne de T° départ chauffage (zone 2)",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 501
			},
			matchStateFunction = var_0_3(501),
			interval = var_0_5
		}
	},
	["502"] = {
		name = "502 T° dépar chauffage (zone 1)",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 502
			},
			matchStateFunction = var_0_3(502),
			interval = var_0_4
		}
	},
	["503"] = {
		name = "503 T° dépar chauffage (zone 2)",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 503
			},
			matchStateFunction = var_0_3(503),
			interval = var_0_4
		}
	},
	["510"] = {
		name = "510 Pression circuit chauffage",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 510
			},
			matchStateFunction = var_0_3(510),
			interval = var_0_5
		}
	},
	["600"] = {
		name = "600 Consigne de T° départ chauffage (zone 1)",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 600
			},
			matchStateFunction = var_0_3(600),
			interval = var_0_5
		}
	},
	["601"] = {
		name = "601 Consigne de T° départ chauffage (zone 2)",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 601
			},
			matchStateFunction = var_0_3(601),
			interval = var_0_5
		}
	},
	["602"] = {
		name = "602 T° dépar chauffage (zone 1)",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 602
			},
			matchStateFunction = var_0_3(602),
			interval = var_0_4
		}
	},
	["603"] = {
		name = "603 T° dépar chauffage (zone 2)",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 603
			},
			matchStateFunction = var_0_3(603),
			interval = var_0_4
		}
	},
	["701"] = {
		name = "701 T° ECS dans le ballon / instantanée",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 701
			},
			matchStateFunction = var_0_3(701),
			interval = var_0_4
		}
	},
	["702"] = {
		name = "702 T° ECS dans le ballon / instantanée",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 702
			},
			matchStateFunction = var_0_3(702),
			interval = var_0_4
		}
	},
	["703"] = {
		name = "703 Consigne de T° départ chauffage (zone 2)",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 703
			},
			matchStateFunction = var_0_3(703),
			interval = var_0_5
		}
	},
	["704"] = {
		name = "704 Consigne de T° départ chauffage (zone 2)",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 704
			},
			matchStateFunction = var_0_3(704),
			interval = var_0_5
		}
	},
	["705"] = {
		name = "705 Consigne de T° départ chauffage (zone 1)",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 705
			},
			matchStateFunction = var_0_3(705),
			interval = var_0_5
		}
	},
	["706"] = {
		name = "706 Consigne de T° départ chauffage (zone 1)",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 706
			},
			matchStateFunction = var_0_3(706),
			interval = var_0_5
		}
	},
	["800"] = {
		name = "800 Code d'erreur de l'UE",
		parameter = 202116097,
		data = {
			1,
			159
		},
		access = var_0_1.access.WRITE,
		refresh = {
			delayedIntervalStart = true,
			dynamicRefresh = true,
			manufacturerSpecific = {
				encapsulatedServiceId = 800
			},
			matchStateFunction = var_0_3(800),
			interval = var_0_5
		}
	}
}
