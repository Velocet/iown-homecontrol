local var_0_0 = require("Overkiz.Bus.DBusFactory")
local var_0_1 = require("Overkiz.OOP.Class")
local var_0_2 = require("Overkiz.EventEmitter")
local var_0_3 = require("Overkiz.Logger")()
local var_0_4 = {
	WrongPassphrase = "WrongPassphrase"
}
local var_0_5 = var_0_1(var_0_2)

var_0_5.Events = var_0_4

function var_0_5.new(arg_1_0, arg_1_1)
	var_0_2.new(arg_1_0)

	local var_1_0 = {
		["net.connman.Agent"] = {
			methods = {
				Release = {},
				ReportError = {
					args = {
						{
							name = "service",
							direction = "in",
							type = "o"
						},
						{
							name = "error",
							direction = "in",
							type = "s"
						}
					}
				},
				ReportPeerError = {
					args = {
						{
							name = "peer",
							direction = "in",
							type = "o"
						},
						{
							name = "error",
							direction = "in",
							type = "s"
						}
					}
				},
				RequestBrowser = {
					args = {
						{
							name = "service",
							direction = "in",
							type = "o"
						},
						{
							name = "url",
							direction = "in",
							type = "s"
						}
					}
				},
				RequestInput = {
					args = {
						{
							name = "service",
							direction = "in",
							type = "o"
						},
						{
							name = "fields",
							direction = "in",
							type = "a{sv}"
						},
						{
							direction = "out",
							type = "a{sv}"
						}
					}
				},
				Cancel = {}
			}
		}
	}

	arg_1_0._server = var_0_0.createServer("com.overkiz.connman", arg_1_1, var_1_0, {
		["net.connman.Agent"] = arg_1_0
	})
end

function var_0_5.Release(arg_2_0)
	return
end

function var_0_5.ReportError(arg_3_0, arg_3_1, arg_3_2)
	var_0_3:warning("Connman reported an error on service '" .. arg_3_1 .. "': " .. arg_3_2)

	if arg_3_2 == "invalid-key" then
		arg_3_0:emit(var_0_4.WrongPassphrase)
	end
end

function var_0_5.ReportPeerError(arg_4_0, arg_4_1, arg_4_2)
	var_0_3:warning("Connman reported an error on peer '" .. arg_4_1 .. "': " .. arg_4_2)
end

function var_0_5.RequestBrowser(arg_5_0, arg_5_1, arg_5_2)
	var_0_3:debug("Connman tell us to browse: '" .. arg_5_2 .. "'")
end

function var_0_5.RequestInput(arg_6_0, arg_6_1, arg_6_2)
	var_0_3:debug("RequestInput", arg_6_1)

	local var_6_0 = {}

	for iter_6_0, iter_6_1 in pairs(arg_6_2) do
		var_0_3:debug("Connman requested a value for: ", iter_6_0)

		if iter_6_0 == "Name" then
			local var_6_1 = arg_6_0:getName(arg_6_1)

			if var_6_1 then
				var_0_3:debug("RequestInput, name found, send it to connman")

				var_6_0.Name = var_6_1
			end
		elseif iter_6_0 == "Passphrase" then
			local var_6_2 = arg_6_0:getPassphrase(arg_6_1)

			if var_6_2 then
				var_0_3:debug("RequestInput, passphrase found, send it to connman")

				var_6_0.Passphrase = var_6_2
			end
		end
	end

	if next(var_6_0) ~= nil then
		return var_6_0
	end

	error({
		message = "No passphrase provided yet.",
		name = "net.connman.Agent.Error.Canceled"
	})
end

function var_0_5.Cancel(arg_7_0)
	var_0_3:debug("Connman requested to cancel a request")
end

return var_0_5
