local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.timeUtils")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Definition")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_3 = {
	startup = true,
	oncommand = true,
	onRecurrence = var_0_0.recurrent.oncePerDayRandom,
	infos = {
		{
			parameter = 201399809,
			access = var_0_2.access.READ,
			value = {
				type = "ay",
				data = {
					0
				}
			}
		},
		{
			parameter = 201399809,
			access = var_0_2.access.READ,
			value = {
				type = "ay",
				data = {
					1
				}
			}
		},
		{
			parameter = 201399809,
			access = var_0_2.access.READ,
			value = {
				type = "ay",
				data = {
					2
				}
			}
		},
		{
			parameter = 201399809,
			access = var_0_2.access.READ,
			value = {
				type = "ay",
				data = {
					3
				}
			}
		},
		{
			parameter = 201399809,
			access = var_0_2.access.READ,
			value = {
				type = "ay",
				data = {
					4
				}
			}
		},
		{
			parameter = 201399809,
			access = var_0_2.access.READ,
			value = {
				type = "ay",
				data = {
					5
				}
			}
		},
		{
			parameter = 201399809,
			access = var_0_2.access.READ,
			value = {
				type = "ay",
				data = {
					6
				}
			}
		}
	}
}

return (var_0_1(201399809, var_0_2.access.READ, var_0_3))
