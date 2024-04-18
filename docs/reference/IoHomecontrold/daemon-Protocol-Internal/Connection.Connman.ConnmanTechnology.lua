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
		["net.connman.Technology"] = {
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
				Scan = {}
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
		["net.connman.Technology"] = {
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

function var_0_4.scan(arg_4_0)
	return arg_4_0._proxy:Scan()
end

return var_0_4
