return {
	executeWithResult = function(arg_1_0, arg_1_1)
		local var_1_0

		if arg_1_1 then
			var_1_0 = arg_1_0 .. "&"

			os.execute(var_1_0)

			return true
		else
			var_1_0 = arg_1_0 .. " ; echo $?"
		end

		local var_1_1 = io.popen(var_1_0)
		local var_1_2 = {}

		while true do
			local var_1_3 = var_1_1:read("*line")

			if var_1_3 then
				table.insert(var_1_2, var_1_3)
			else
				break
			end
		end

		var_1_1:close()

		local var_1_4 = var_1_2[#var_1_2] == "0"
		local var_1_5 = var_1_2[#var_1_2 - 1]

		return var_1_4, var_1_5
	end
}
