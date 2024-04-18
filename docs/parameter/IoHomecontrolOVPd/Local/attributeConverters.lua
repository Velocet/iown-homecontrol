local var_0_0 = require("Overkiz.HomeAutomation.Local.Model.reference")
local var_0_1 = {
	[0] = "Public",
	"VELUX",
	"Somfy",
	"Honeywell",
	"Hörmann",
	"ASSA ABLOY",
	"Niko",
	"Window Master",
	"Renson",
	"CIAT",
	"Secuyou",
	"OVERKIZ",
	"Atlantic Group",
	"Zehnder Group"
}

return {
	{
		output = "core:Manufacturer",
		input = "manufacturer",
		type = var_0_0.parameterType.STRING,
		converter = function(arg_1_0)
			return var_0_1[arg_1_0]
		end
	}
}
