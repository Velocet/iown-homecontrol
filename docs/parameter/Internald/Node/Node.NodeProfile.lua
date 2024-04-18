local var_0_0 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_1 = require("Overkiz.HomeAutomation.Trigger.Proxy.Device")
local var_0_2 = require("Overkiz.Kizbox.id")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Class.Alarm")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Class.Modem")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Class.Pod")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.Internal.Node.Class.Wifi")
local var_0_7 = {}
local var_0_8 = {}

function var_0_7.__call(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}

	if arg_1_1.type == "alarm" then
		var_1_0 = var_0_3()
	elseif arg_1_1.type == "modem" then
		var_1_0 = var_0_4()
	elseif arg_1_1.type == "wifi" then
		var_1_0 = var_0_6()
	elseif arg_1_1.type:match("pod") then
		var_1_0 = var_0_5(arg_1_1.type)
	end

	var_1_0.delegate = {}
	var_1_0.delegate.modified = arg_1_2

	local var_1_1 = "internal://" .. var_0_2() .. "/" .. arg_1_1.id

	var_1_0.device = var_0_1(var_1_1)

	local var_1_2 = true

	function var_1_0.updated(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
		if arg_2_2 == nil then
			return
		end

		arg_2_4 = arg_2_4 or {
			"internal",
			arg_2_1,
			arg_2_2
		}

		var_0_0:notice("Node state " .. tostring(arg_2_1) .. " updated to: " .. tostring(arg_2_2) .. ".")

		if arg_2_0.delegate and arg_2_0.delegate.modified then
			local var_2_0 = {}

			arg_2_0.delegate.modified(arg_2_0.id, arg_2_1, arg_2_2, arg_2_0.type, arg_2_3)
		else
			var_0_0:warning("State modified delegate not set")
		end

		arg_2_0.device:update(arg_2_4[1], arg_2_4[2], arg_2_4[3])
	end

	function var_1_0.write(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
		var_0_0:info("Starting write " .. tostring(arg_3_1) .. ".")

		local var_3_0 = arg_3_0.parameters[arg_3_1]

		if arg_3_0.status ~= "done" then
			arg_3_4("Node unavailable to write " .. arg_3_1)

			return
		end

		if not var_3_0 then
			arg_3_4("Unknown parameter " .. arg_3_1)

			return
		end

		if not var_3_0.write then
			arg_3_4("Bad access for " .. arg_3_1)

			return
		end

		local function var_3_1(arg_4_0, arg_4_1)
			arg_3_0:updated(arg_3_1, arg_4_0, true, arg_4_1)

			if arg_3_3 then
				arg_3_3(arg_4_0)
			end
		end

		var_3_0.write(arg_3_2, var_3_1, arg_3_4, arg_3_5)
	end

	function var_1_0.read(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
		var_0_0:info("Starting read " .. tostring(arg_5_1) .. ".")

		local var_5_0 = arg_5_0.parameters[arg_5_1]

		if arg_5_0.status ~= "done" then
			arg_5_3("Node unavailable to read " .. arg_5_1)

			return
		end

		if not var_5_0 then
			arg_5_3("Unknown parameter " .. arg_5_1)

			return
		end

		if not var_5_0.read then
			arg_5_3("Bad access " .. arg_5_1)

			return
		end

		local function var_5_1(arg_6_0, arg_6_1)
			arg_5_0:updated(arg_5_1, arg_6_0, true, arg_6_1)

			if arg_5_2 then
				arg_5_2(arg_6_0)
			end
		end

		var_5_0.read(var_5_1, arg_5_3, arg_5_4)
	end

	function var_1_0.update(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_1.status ~= arg_7_0.status

		arg_7_0.id = arg_7_1.id
		arg_7_0.address = arg_7_1.id
		arg_7_0.type = arg_7_1.type
		arg_7_0.status = arg_7_1.status

		if var_7_0 or var_1_2 then
			arg_7_0:initParameters()

			var_1_2 = nil
		end
	end

	function var_1_0.refreshAll(arg_8_0)
		local var_8_0 = true

		for iter_8_0, iter_8_1 in pairs(arg_8_0.parameters) do
			local function var_8_1()
				return
			end

			arg_8_0:read(iter_8_0, var_8_1, var_8_1, var_8_0)
		end
	end

	function var_1_0.initParameters(arg_10_0)
		for iter_10_0, iter_10_1 in pairs(arg_10_0.parameters) do
			local function var_10_0(arg_11_0, arg_11_1, arg_11_2)
				arg_10_0:updated(iter_10_0, arg_11_0, arg_11_1, arg_11_2)
			end

			iter_10_1:setRefresh(var_10_0, arg_10_0.status == "done")
		end
	end

	var_1_0:update(arg_1_1)

	return var_1_0
end

setmetatable(var_0_8, var_0_7)

return var_0_8
