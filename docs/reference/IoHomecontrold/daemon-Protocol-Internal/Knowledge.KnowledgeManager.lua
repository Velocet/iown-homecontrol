require("Overkiz.utilities")

local var_0_0 = require("Overkiz.conf")
local var_0_1 = require("Overkiz.TableStorage")
local var_0_2 = require("Overkiz.Subject")
local var_0_3 = require("Overkiz.HomeAutomation.Common.Connectivity.DispatcherInfo")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.Internal.log")
local var_0_5 = require("Overkiz.HomeAutomation.Common.FileHandler.DownloadManager")
local var_0_6 = require("pl.path")
local var_0_7 = require("pl.dir")
local var_0_8 = require("pl.stringx")
local var_0_9 = require("Overkiz.OOP.Class")
local var_0_10 = var_0_0.TMP_DIR .. "knowledge"
local var_0_11 = var_0_0.KNOWLEDGE.AUTHORIZED_MODULES
local var_0_12 = var_0_9()

function var_0_12.new(arg_1_0)
	arg_1_0.onUpdated = var_0_2()
	arg_1_0._store = var_0_1("knowledge")
	arg_1_0._pendingModules = {}
	arg_1_0._downloadManager = var_0_5(var_0_4)
end

function var_0_12.listElements(arg_2_0)
	local var_2_0 = {}

	for iter_2_0, iter_2_1 in var_0_1.pairs(arg_2_0._store) do
		table.insert(var_2_0, iter_2_1)
	end

	return var_2_0
end

function var_0_12.update(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
	local var_3_0 = arg_3_1 .. "-" .. arg_3_2
	local var_3_1 = {
		category = arg_3_1,
		name = arg_3_2,
		hash = arg_3_4
	}

	arg_3_0._pendingModules[var_3_0] = arg_3_0._pendingModules[var_3_0] or {}

	local function var_3_2()
		arg_3_0._store[var_3_0] = var_3_1

		var_0_1.finalize(arg_3_0._store)

		if arg_3_0._pendingModules[var_3_0] then
			arg_3_0._pendingModules[var_3_0].pending = nil
		end
	end

	local function var_3_3(arg_5_0, arg_5_1)
		var_0_4:error("[KnowledgeManager]: " .. arg_5_0 .. ": " .. arg_5_1)

		var_3_1.hash = "[" .. arg_5_0 .. "] error. (" .. arg_5_1 .. ")"

		arg_3_5(false, nil, var_3_1.hash)
		var_3_2()
	end

	local var_3_4 = var_0_3():getHttpsUrl()

	if var_3_4 == nil then
		var_3_3("config", "no base url found for downloading")

		return
	end

	arg_3_3 = var_3_4 .. arg_3_3

	if not var_0_11[var_3_0] then
		var_3_3("install", "Any handler to install")
	elseif arg_3_0._pendingModules[var_3_0].pending then
		arg_3_5(false)
	else
		local var_3_5 = var_0_11[var_3_0]
		local var_3_6 = var_0_8.rstrip(var_3_5, "/") .. "_tmp"

		if var_0_6.isdir(var_3_6) then
			var_0_7.rmtree(var_3_6)
		end

		local function var_3_7()
			arg_3_0.onUpdated:notify(arg_3_2)
			arg_3_5(true, var_3_1)
			var_3_2()
		end

		local var_3_8 = {
			createDestFolder = true,
			extract = true,
			extractPath = var_3_5
		}

		arg_3_0._pendingModules[var_3_0].pending = arg_3_0._downloadManager:download(arg_3_3, var_0_10, var_3_0 .. ".tar", var_3_8, var_3_7, var_3_3)
	end
end

return var_0_12
