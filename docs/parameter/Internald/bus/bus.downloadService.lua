local var_0_0 = require("Overkiz.utilities")
local var_0_1 = require("Overkiz.Bus.Object")
local var_0_2 = require("Overkiz.Bus.Connection")
local var_0_3 = require("Overkiz.Bus.Message")
local var_0_4 = require("Overkiz.HomeAutomation.Common.FileHandler.DownloadManager")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_6 = require("Overkiz.HomeAutomation.Common.Connectivity.DispatcherInfo")
local var_0_7 = "/com/overkiz/Application/Internal/Download"
local var_0_8 = "com.overkiz.Application.Internal.Download"
local var_0_9 = var_0_1.Server(var_0_7)
local var_0_10 = var_0_4(var_0_5)

local function var_0_11(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = var_0_3.Method.Return(arg_1_2)
	local var_1_1 = var_1_0:begin()

	var_1_1:push("string", arg_1_0)
	var_1_1:push("string", arg_1_1)
	arg_1_3:send(var_1_0)
end

local function var_0_12(arg_2_0)
	local var_2_0 = var_0_6():getHttpsUrl()
	local var_2_1

	if not var_2_0 then
		var_0_5:error("could not get a download url from the dispatcher")
	else
		var_2_1 = var_2_0 .. "/" .. arg_2_0
	end

	return var_2_1
end

local function var_0_13(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
	local function var_3_0()
		var_0_11("success", "", arg_3_4, arg_3_5)
	end

	local function var_3_1(arg_5_0, arg_5_1)
		var_0_11(arg_5_0, arg_5_1, arg_3_4, arg_3_5)
	end

	if arg_3_3.urlAlreadyComplete == true then
		var_0_5:debug("URL is already complete, not formatting it with dispatcher info")
	else
		arg_3_0 = var_0_12(arg_3_0)

		if not arg_3_0 then
			var_3_1("error", "dispatcher is not reachable")

			return false
		end
	end

	return var_0_10:download(arg_3_0, arg_3_1, arg_3_2, arg_3_3, var_3_0, var_3_1)
end

function var_0_9.method(arg_6_0, arg_6_1)
	if arg_6_1:getInterface() == var_0_8 and arg_6_1:getMember() == "download" then
		if arg_6_1:getSignature() == "ssss" then
			local var_6_0 = arg_6_1:constbegin()
			local var_6_1 = var_6_0:get("string")
			local var_6_2 = var_6_0:get("string")
			local var_6_3 = var_6_0:get("string")
			local var_6_4 = var_0_0.decode(var_6_0:get("string"))

			var_0_13(var_6_1, var_6_2, var_6_3, var_6_4, arg_6_1, arg_6_0)

			return true
		else
			var_0_5:error("DownloadService: Bad signature for bus download method")

			return false
		end
	end

	return false
end

var_0_9:start()
var_0_2.get():bind(var_0_8)

return var_0_9
