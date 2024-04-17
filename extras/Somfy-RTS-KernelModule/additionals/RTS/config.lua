return function(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	return {
		driver = (arg_1_2 == "smartkiz" or arg_1_2 == "kizbox3") and "linux" or "rtx",
		variant = ({
			minirta = "australia",
			minirtj = "japan"
		})[arg_1_3],
		region = (arg_1_2 == "smartkiz" or arg_1_2 == "kizbox3") and {
			power = {
				default = 10,
				US = 0,
				CA = 0,
				min = 0
			},
			tiltRepeatNbOverride = {
				CA = 4,
				US = 4
			}
		} or nil
	}
end, {
	"RTS",
	"RTS.RTS",
	"RTS.RTW"
}
