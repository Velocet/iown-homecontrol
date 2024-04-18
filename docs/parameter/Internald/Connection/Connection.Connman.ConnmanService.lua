local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.EventEmitter")
local var_0_2 = require("Overkiz.Bus.DBusFactory")
local var_0_3 = {
	PropertyChanged = "PropertyChanged"
}
local var_0_4 = var_0_0(var_0_1)

var_0_4.Events = var_0_3

function var_0_4.new(arg_1_0, arg_1_1)
	var_0_1.new(arg_1_0)

	local var_1_0 = {
		["net.connman.Service"] = {
			methods = {
				SetProperty = {
					args = {
						{
							name = "name",
							direction = "in",
							type = "s"
						},
						{
							name = "value",
							direction = "in",
							type = "v"
						}
					}
				},
				ClearProperty = {
					args = {
						{
							name = "name",
							direction = "in",
							type = "s"
						}
					}
				},
				Connect = {},
				Disconnect = {},
				Remove = {},
				MoveBefore = {
					args = {
						{
							name = "service",
							direction = "in",
							type = "o"
						}
					}
				},
				MoveAfter = {
					args = {
						{
							name = "service",
							direction = "in",
							type = "o"
						}
					}
				}
			},
			signals = {
				PropertyChanged = {
					args = {
						{
							type = "s",
							name = "name"
						},
						{
							type = "v",
							name = "value"
						}
					}
				}
			}
		}
	}
	local var_1_1 = setmetatable({
		arg_1_0
	}, {
		__mode = "v"
	})

	arg_1_0._proxy = var_0_2.createProxy("net.connman", arg_1_1, var_1_0, {
		["net.connman.Service"] = {
			PropertyChanged = function(arg_2_0, arg_2_1, arg_2_2)
				if var_1_1[1] then
					var_1_1[1]:emit(var_0_3.PropertyChanged, arg_2_1, arg_2_2)
				end
			end
		}
	})
end

function var_0_4.setProperty(arg_3_0, arg_3_1, arg_3_2)
	return arg_3_0._proxy:SetProperty(arg_3_1, arg_3_2)
end

function var_0_4.clearProperty(arg_4_0, arg_4_1)
	return arg_4_0._proxy:ClearProperty(arg_4_1)
end

function var_0_4.connect(arg_5_0)
	return arg_5_0._proxy:Connect()
end

function var_0_4.disconnect(arg_6_0)
	return arg_6_0._proxy:Disconnect()
end

function var_0_4.remove(arg_7_0)
	return arg_7_0._proxy:Remove()
end

function var_0_4.moveBefore(arg_8_0, arg_8_1)
	return arg_8_0._proxy:MoveBefore(arg_8_1)
end

function var_0_4.moveAfter(arg_9_0, arg_9_1)
	return arg_9_0._proxy:MoveAfter(arg_9_1)
end

return var_0_4
