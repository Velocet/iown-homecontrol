local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.asyncProcess")
local var_0_2 = require("Overkiz.UUID")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.update")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_5 = require("Overkiz.Timer")
local var_0_6 = require("Overkiz.Time")
local var_0_7 = require("pl.stringx")

return {
	write = function(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
		local var_1_0 = {
			target = "string"
		}
		local var_1_1, var_1_2 = var_0_0.checkPath(arg_1_0, var_1_0)

		if not var_1_1 then
			var_0_4:error("Cannot download things: " .. var_1_2)

			return arg_1_2(var_1_2)
		end

		local var_1_3 = var_0_2.generate()

		var_0_3.callbacks[var_1_3] = {
			onSuccess = arg_1_1,
			onError = arg_1_2
		}

		local var_1_4 = "image-update-deamon"
		local var_1_5 = {
			"-i",
			var_1_3
		}

		if arg_1_0.target == "system" then
			table.insert(var_1_5, "root")
			table.insert(var_1_5, "apps")
		elseif arg_1_0.target == "applications" then
			table.insert(var_1_5, "apps")
		else
			return arg_1_2("Bad argument for target (" .. arg_1_0.target .. ")")
		end

		if arg_1_0.force then
			table.insert(var_1_5, "-f")
		end

		local var_1_6 = var_0_7.join(" ", {
			var_1_4,
			unpack(var_1_5)
		})

		var_0_4:debug("Gonna run '" .. var_1_6 .. "'")

		local var_1_7 = var_0_5.Monotonic()

		if arg_1_3 then
			function var_1_7.expired(arg_2_0, arg_2_1)
				arg_1_3()
				var_1_7:setTime(var_0_6.Monotonic(var_0_6.Elapsed(30, 0)), true)
				var_1_7:start()
			end

			var_1_7:setTime(var_0_6.Monotonic(var_0_6.Elapsed(30, 0)), true)
			var_1_7:start()
		end

		var_0_1.execute(var_1_4, unpack(var_1_5)):next(function(arg_3_0)
			var_1_7:stop()

			if arg_3_0 ~= 0 then
				var_0_4:error("Error when executing '" .. var_1_6 .. "'")
				arg_1_2("image-update-deamon exit with code: " .. arg_3_0)
			else
				var_0_4:debug("Execution ok '" .. var_1_6 .. "'")
			end
		end)
	end
}
