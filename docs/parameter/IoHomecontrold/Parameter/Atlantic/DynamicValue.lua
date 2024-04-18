local var_0_0 = require("Overkiz.Type.ByteArray")

return {
	getTime = function()
		local var_1_0 = os.date("*t")
		local var_1_1 = var_1_0.wday - 2

		if var_1_1 == -1 then
			var_1_1 = 6
		end

		local var_1_2 = var_0_0({
			var_1_0.sec
		}):append(var_0_0({
			var_1_0.min
		})):append(var_0_0({
			var_1_0.hour
		})):append(var_0_0({
			var_1_0.day
		})):append(var_0_0({
			var_1_1
		})):append(var_0_0({
			var_1_0.month
		})):append(var_0_0({
			var_1_0.year - 256 * math.floor(var_1_0.year / 256)
		})):append(var_0_0({
			var_1_0.year / 256
		}))

		return {
			type = "ay",
			data = var_1_2
		}
	end
}
