local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.log")

return {
	readInfoFile = function(arg_1_0, arg_1_1)
		local var_1_0 = io.open(arg_1_0, "r")

		if not var_1_0 then
			var_0_0:warning("File " .. tostring(arg_1_0) .. " open error")

			return "File open error"
		end

		io.input(var_1_0)

		local var_1_1 = "*l"

		if arg_1_1 then
			var_1_1 = "*a"
		end

		local var_1_2 = var_1_0:read(var_1_1)

		if not var_1_2 then
			var_0_0:warning("File " .. tostring(arg_1_0) .. " read error")

			return "File read error"
		end

		io.close(var_1_0)

		return var_1_2
	end,
	writeInfoFile = function(arg_2_0, arg_2_1)
		local var_2_0 = io.open(arg_2_0, "w+")

		if not var_2_0 then
			var_0_0:warning("File " .. tostring(arg_2_0) .. " open error")

			return "File open error"
		end

		local var_2_1 = var_2_0:write(arg_2_1)

		if not var_2_1 then
			var_0_0:warning("File " .. tostring(arg_2_0) .. " write error")

			return "File write error"
		end

		io.close(var_2_0)

		return var_2_1
	end
}
