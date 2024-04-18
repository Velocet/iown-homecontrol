local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.asyncProcess")
local var_0_2 = require("Overkiz.UUID")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.update")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_5 = require("Overkiz.Time")
local var_0_6 = require("Overkiz.Timer")
local var_0_7 = require("pl.stringx")
local var_0_8 = {}
local var_0_9 = {
	applications = {
		"upgrade",
		"apps"
	},
	system = {
		"root"
	},
	bootloader = {
		"bootloader"
	},
	security = {
		"security"
	},
	bootstrap = {
		"bootstrap"
	}
}

function var_0_8.write(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = {
		target = {}
	}
	local var_1_1, var_1_2 = var_0_0.checkPath(arg_1_0, var_1_0)

	if not var_1_1 then
		return arg_1_2(var_1_2)
	end

	local var_1_3 = var_0_6.Monotonic()

	if arg_1_3 then
		function var_1_3.expired(arg_2_0, arg_2_1)
			arg_1_3()
			var_1_3:setTime(var_0_5.Monotonic(var_0_5.Elapsed(30, 0)), true)
			var_1_3:start()
		end

		var_1_3:setTime(var_0_5.Monotonic(var_0_5.Elapsed(30, 0)), true)
		var_1_3:start()
	end

	local var_1_4 = var_0_2.generate()

	var_0_3.callbacks[var_1_4] = {
		onSuccess = arg_1_1,
		onError = arg_1_2,
		onExit = function()
			var_1_3:stop()
		end
	}

	local var_1_5 = "image-update-deamon"
	local var_1_6 = {
		"-i",
		var_1_4
	}

	if arg_1_0.force then
		table.insert(var_1_6, "-f")
	end

	if arg_1_0.reboot then
		table.insert(var_1_6, "-r")
	end

	for iter_1_0, iter_1_1 in ipairs(arg_1_0.target) do
		for iter_1_2, iter_1_3 in pairs(var_0_9[iter_1_1]) do
			table.insert(var_1_6, iter_1_3)
		end
	end

	local var_1_7 = {
		detached = arg_1_0.reboot
	}
	local var_1_8 = var_0_7.join(" ", {
		var_1_5,
		unpack(var_1_6)
	})

	var_0_4:debug("Gonna run '" .. var_1_8 .. "'")
	table.insert(var_1_6, var_1_7)
	var_0_1.execute(var_1_5, unpack(var_1_6)):next(function(arg_4_0)
		if arg_4_0 ~= 0 then
			var_0_4:error("Error when executing '" .. var_1_8 .. "'. (", arg_4_0, ")")
			var_1_3:stop()
			arg_1_2("image-update-deamon exit with code: " .. arg_4_0)
		else
			var_0_4:debug("Execution ok '" .. var_1_8 .. "'")
		end
	end)
end

return var_0_8
