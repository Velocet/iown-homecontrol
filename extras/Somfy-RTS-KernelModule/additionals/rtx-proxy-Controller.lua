local var_0_0 = require("Overkiz.Bus.Object")
local var_0_1 = require("Overkiz.Bus.Message")
local var_0_2 = require("Overkiz.Bus.Manager")
local var_0_3 = require("Overkiz.Subject")
local var_0_4 = require("Overkiz.HomeAutomation.RTX.Proxy.Driver")
local var_0_5 = {}
local var_0_6 = {
	protocols = {
		RTN = 4,
		RTD = 1,
		RTDS = 2,
		RTS = 0,
		RTS_JP = 3,
		RTS_AUS = 5
	},
	notifications = {
		CREATED = "created",
		DELETED = "deleted"
	}
}

function var_0_5.__call(arg_1_0, arg_1_1)
	local var_1_0 = var_0_0.Proxy("/com/overkiz/Application/RTx/Controller", "com.overkiz.Application.RTx")

	var_1_0.watcher = var_0_2()
	arg_1_1 = arg_1_1 or require("Overkiz.Log")()
	var_1_0.changedNotifications = var_0_3()

	local var_1_1 = {}
	local var_1_2 = {}

	local function var_1_3(arg_2_0)
		local var_2_0 = var_0_1.Method.Call()

		var_2_0:setInterface("com.overkiz.Application.RTx.Controller")
		var_2_0:setMember("get")
		var_2_0:setTimeout(30)
		var_2_0:begin():push("int32", tonumber(arg_2_0))

		local function var_2_1(arg_3_0, arg_3_1)
			if arg_3_1:isException() then
				arg_1_1:warning("RTX: Bus exception on controller get.")
				var_1_0.changedNotifications:notify({
					var_0_6.notifications.DELETED,
					arg_2_0
				})

				return
			end

			if arg_3_1:getSignature() == "(os)" then
				local var_3_0 = arg_3_1:constbegin():begin("struct")
				local var_3_1 = var_3_0:get("path")
				local var_3_2 = var_3_0:get("string")

				var_1_2[tostring(arg_2_0)] = var_0_4(var_3_1, var_3_2, arg_1_1)

				var_1_0.changedNotifications:notify({
					var_0_6.notifications.CREATED,
					arg_2_0
				})
			else
				arg_1_1:error("RTX: Bad signature for bus get response")
			end
		end

		var_1_0:send(var_2_0, var_2_1)
	end

	local function var_1_4(arg_4_0, arg_4_1)
		local var_4_0 = var_0_1.Method.Call()

		var_4_0:setInterface("com.overkiz.Application.RTx.Controller")
		var_4_0:setMember("getStackInfo")

		local var_4_1 = var_4_0:begin()

		var_4_1:push("string", arg_4_0)
		var_4_1:push("string", arg_4_1)
		var_1_0:send(var_4_0)
	end

	local function var_1_5(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = var_0_1.Method.Call()

		var_5_0:setInterface("com.overkiz.Application.RTx.Controller")
		var_5_0:setMember("setStackInfo")

		local var_5_1 = var_5_0:begin()

		var_5_1:push("string", arg_5_0)
		var_5_1:push("string", arg_5_1)

		local var_5_2 = var_5_1:begin("array", "y")

		for iter_5_0 = 1, #arg_5_2 do
			var_5_2:push("byte", arg_5_2[iter_5_0])
		end

		var_5_1:close(var_5_2)
		var_1_0:send(var_5_0)
	end

	function var_1_0.watcher.nameOwnerChanged(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
		if arg_6_1 == "com.overkiz.Application.RTx" and arg_6_3 ~= "" then
			for iter_6_0, iter_6_1 in pairs(var_1_1) do
				var_1_3(tonumber(iter_6_0))
			end
		elseif arg_6_1 == "com.overkiz.Application.RTx" and arg_6_3 == "" then
			for iter_6_2, iter_6_3 in pairs(var_1_2) do
				iter_6_3:stop()

				iter_6_3.delegate = nil

				var_1_0.changedNotifications:notify({
					var_0_6.notifications.DELETED,
					tonumber(iter_6_2)
				})
			end

			var_1_2 = {}
		end
	end

	function var_1_0.requestProtocol(arg_7_0, arg_7_1)
		if var_1_1[tostring(arg_7_1)] then
			if arg_1_1 then
				arg_1_1:warning("Protocol already requested")
			end
		else
			var_1_1[tostring(arg_7_1)] = true

			if not var_1_0.watcher:nameHasOwner("com.overkiz.Application.RTx") then
				return
			end

			var_1_3(arg_7_1)
		end
	end

	function var_1_0.get(arg_8_0, arg_8_1)
		return var_1_2[tostring(arg_8_1)]
	end

	function var_1_0.release(arg_9_0, arg_9_1)
		return
	end

	function var_1_0.getStackInfo(arg_10_0, arg_10_1, arg_10_2)
		arg_1_1:debug("RTX: calling controller:getStackInfo - " .. arg_10_2)
		var_1_4(arg_10_1, arg_10_2)
	end

	function var_1_0.setStackInfo(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
		arg_1_1:debug("RTX: calling controller:setStackInfo - " .. arg_11_2 .. " = " .. tostring(arg_11_3))
		var_1_5(arg_11_1, arg_11_2, arg_11_3)
	end

	var_1_0:start()
	var_1_0.watcher:start()

	return var_1_0
end

setmetatable(var_0_6, var_0_5)

return var_0_6
