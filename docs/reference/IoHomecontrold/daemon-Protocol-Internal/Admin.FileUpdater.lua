local var_0_0 = require("Overkiz.Type.ByteArray")
local var_0_1 = require("Overkiz.OOP.Class")
local var_0_2 = require("Overkiz.HomeAutomation.Common.FileHandler.fileUtilities")
local var_0_3 = require("Overkiz.Promise")
local var_0_4 = require("Overkiz.Time")
local var_0_5 = require("Overkiz.Network.Transfer")
local var_0_6 = require("Overkiz.asyncFs")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_8 = require("pl.file")
local var_0_9 = require("pl.path")
local var_0_10 = require("pl.stringx")

local function var_0_11()
	return var_0_3.resolve()
end

local var_0_12 = var_0_1()

var_0_12.SuccessCode = {
	NO_NEW_VERSION = {},
	UPDATED = {}
}
var_0_12.ErrorCode = {
	MD5 = {},
	DOWNLOAD = {},
	BAD_MD5 = {},
	SANITY = {},
	DIRECTORY = {},
	MOVE = {}
}

function var_0_12.new(arg_2_0, arg_2_1)
	arg_2_0.localFile = arg_2_1
	arg_2_0.sanityCheck = var_0_11
end

function var_0_12.setSanityCheck(arg_3_0, arg_3_1)
	arg_3_0.sanityCheck = arg_3_1

	return arg_3_0
end

function var_0_12.update(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = var_0_3()
	local var_4_1 = arg_4_0._initTransfer()
	local var_4_2 = ""

	var_4_1:request({
		method = "GET",
		url = arg_4_2
	}, function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_1 ~= 200 then
			var_4_0:reject({
				code = var_0_12.ErrorCode.MD5,
				httpCode = arg_5_1,
				reason = arg_5_2
			})

			return
		end

		var_0_7:debug("[FileUpdater]: received MD5 is " .. var_4_2)
		arg_4_0:_update(var_4_2, arg_4_1):next(function(arg_6_0)
			var_4_0:resolve(arg_6_0)
		end):catch(function(arg_7_0)
			var_4_0:reject(arg_7_0)
		end)
	end, function(arg_8_0)
		var_4_2 = var_4_2 .. var_0_0(arg_8_0, "base64"):tostring("utf-8")
		var_4_2 = var_0_10.strip(var_4_2)
	end)

	return var_4_0
end

function var_0_12._update(arg_9_0, arg_9_1, arg_9_2)
	return var_0_2.checkMd5(arg_9_0.localFile, arg_9_1):next(function()
		var_0_7:debug("[FileUpdater]: no newer version")

		return var_0_3.resolve(var_0_12.SuccessCode.NO_NEW_VERSION)
	end):catch(function()
		return arg_9_0:_processUpdate(arg_9_1, arg_9_2)
	end)
end

function var_0_12._processUpdate(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = var_0_9.tmpname()
	local var_12_1 = var_0_3()

	arg_12_0._initTransfer():request({
		method = "GET",
		url = arg_12_2,
		fileOutput = var_12_0
	}, function(arg_13_0, arg_13_1, arg_13_2)
		var_0_3.resolve():next(function()
			if arg_13_1 ~= 200 then
				return var_0_3.reject({
					code = var_0_12.ErrorCode.DOWNLOAD,
					httpCode = arg_13_1,
					reason = arg_13_2
				})
			end
		end):next(function()
			return var_0_2.checkMd5(var_12_0, arg_12_1):catch(function()
				return var_0_3.reject({
					reason = "md5 of downloaded file differs",
					code = var_0_12.ErrorCode.BAD_MD5
				})
			end)
		end):next(function()
			return arg_12_0.sanityCheck(var_12_0):catch(function(arg_18_0)
				return var_0_3.reject({
					code = var_0_12.ErrorCode.SANITY,
					reason = arg_18_0
				})
			end)
		end):next(function()
			return var_0_6.mkdirp(var_0_9.dirname(arg_12_0.localFile)):catch(function(arg_20_0)
				return var_0_3.reject({
					code = var_0_12.ErrorCode.DIRECTORY,
					reason = "directory creation error: " .. arg_20_0
				})
			end)
		end):next(function()
			local var_21_0, var_21_1 = var_0_8.move(var_12_0, arg_12_0.localFile)

			var_0_8.delete(var_12_0)

			if not var_21_0 then
				return var_0_3.reject({
					code = var_0_12.ErrorCode.MOVE,
					reason = "move error: " .. var_21_1
				})
			end
		end):next(function()
			var_12_1:resolve(var_0_12.SuccessCode.UPDATED)
		end):catch(function(arg_23_0)
			var_12_1:reject(arg_23_0)
		end)
	end)

	return var_12_1
end

function var_0_12._initTransfer()
	local var_24_0 = var_0_5()

	var_24_0:setTimeout(var_0_4.Elapsed(20, 0))
	var_24_0:setConnectionTimeout(var_0_4.Elapsed(20, 0))
	var_24_0:setClientCertificate("/etc/security/client.crt")
	var_24_0:setCertificateOfAuthority("/etc/security/ca.crt")
	var_24_0:setPrivateKey("/etc/security/client.key")

	return var_24_0
end

return var_0_12
