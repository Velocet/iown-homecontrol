local var_0_0 = require("Overkiz.OOP.Class")
local var_0_1 = require("Overkiz.EventEmitter")
local var_0_2 = require("Overkiz.Bus.DBusFactory")
local var_0_3 = {
	PropertyChanged = "PropertyChanged",
	TechnologyRemoved = "TechnologyRemoved",
	ServicesChanged = "ServicesChanged",
	TechnologyAdded = "TechnologyAdded"
}
local var_0_4 = var_0_0(var_0_1)

var_0_4.Events = var_0_3

function var_0_4.new(arg_1_0)
	var_0_1.new(arg_1_0)

	local var_1_0 = {
		["net.connman.Manager"] = {
			methods = {
				GetProperties = {
					args = {
						{
							direction = "out",
							type = "a{sv}"
						}
					}
				},
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
				GetTechnologies = {
					args = {
						{
							direction = "out",
							type = "a(oa{sv})"
						}
					}
				},
				GetServices = {
					args = {
						{
							direction = "out",
							type = "a(oa{sv})"
						}
					}
				},
				RegisterAgent = {
					args = {
						{
							name = "path",
							direction = "in",
							type = "o"
						}
					}
				},
				UnregisterAgent = {
					args = {
						{
							name = "path",
							direction = "in",
							type = "o"
						}
					}
				}
			},
			signals = {
				TechnologyAdded = {
					args = {
						{
							type = "o",
							name = "path"
						},
						{
							type = "a{sv}",
							name = "properties"
						}
					}
				},
				TechnologyRemoved = {
					args = {
						{
							type = "o",
							name = "path"
						}
					}
				},
				ServicesChanged = {
					args = {
						{
							type = "a(oa{sv})"
						},
						{
							type = "ao"
						}
					}
				},
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

	arg_1_0._proxy = var_0_2.createProxy("net.connman", "/", var_1_0, {
		["net.connman.Manager"] = {
			TechnologyAdded = function(arg_2_0, arg_2_1, arg_2_2)
				arg_1_0:emit(var_0_3.TechnologyAdded, arg_2_1, arg_2_2)
			end,
			TechnologyRemoved = function(arg_3_0, arg_3_1)
				arg_1_0:emit(var_0_3.TechnologyRemoved, arg_3_1)
			end,
			ServicesChanged = function(arg_4_0, arg_4_1, arg_4_2)
				arg_1_0:emit(var_0_3.ServicesChanged, arg_4_1, arg_4_2)
			end,
			PropertyChanged = function(arg_5_0, arg_5_1, arg_5_2)
				arg_1_0:emit(var_0_3.PropertyChanged, arg_5_1, arg_5_2)
			end
		}
	})
end

function var_0_4.getProperties(arg_6_0)
	return arg_6_0._proxy:GetProperties()
end

function var_0_4.setProperty(arg_7_0, arg_7_1, arg_7_2)
	return arg_7_0._proxy:SetProperty(arg_7_1, arg_7_2)
end

function var_0_4.getTechnologies(arg_8_0)
	return arg_8_0._proxy:GetTechnologies()
end

function var_0_4.getServices(arg_9_0)
	return arg_9_0._proxy:GetServices()
end

function var_0_4.registerAgent(arg_10_0, arg_10_1)
	return arg_10_0._proxy:RegisterAgent(arg_10_1)
end

function var_0_4.unregisterAgent(arg_11_0, arg_11_1)
	return arg_11_0._proxy:UnregisterAgent(arg_11_1)
end

return var_0_4
