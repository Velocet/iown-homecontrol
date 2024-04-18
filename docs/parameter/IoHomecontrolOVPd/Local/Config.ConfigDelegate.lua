local var_0_0 = require("Overkiz.HomeAutomation.Local.Model.Protocol.Delegation.DelegationServer")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Command.commandModel")
local var_0_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DiscoverActuator")
local var_0_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DiscoverActuatorSimple")
local var_0_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DiscoverSensor")
local var_0_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DiscoverSensorSimple")
local var_0_6 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DiscoverPulseSensor")
local var_0_7 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.IoTransferKeyUseCase")
local var_0_8 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.Discover1WayController")
local var_0_9 = {}
local var_0_10 = {}

function var_0_9.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	if arg_1_1 == nil or arg_1_2 == nil or arg_1_3 == nil or arg_1_4 == nil then
		arg_1_4:warning("Config protocol delegate: invalid or missing arguments")

		return
	end

	local var_1_0 = var_0_0(arg_1_1, "config")

	function var_1_0.initializeProtocol(arg_2_0)
		arg_1_4:info("[CONFIG] initialize protocol")

		if not arg_1_3:getStackNode(false) then
			arg_1_3:createStackNode()
		end
	end

	function var_1_0.discover(arg_3_0)
		arg_1_4:info("[CONFIG] discover actuator complete")

		return var_1_0.callParameterOnStack(var_0_2)
	end

	function var_1_0.discoverSimple(arg_4_0)
		arg_1_4:info("[CONFIG] discover actuator simple")

		return var_1_0.callParameterOnStack(var_0_3)
	end

	function var_1_0.discoverSensors(arg_5_0)
		arg_1_4:info("[CONFIG] discover sensor complete")

		return var_1_0.callParameterOnStack(var_0_4)
	end

	function var_1_0.discoverSensorsSimple(arg_6_0)
		arg_1_4:info("[CONFIG] discover sensor simple")

		return var_1_0.callParameterOnStack(var_0_5)
	end

	function var_1_0.discover1WayController(arg_7_0)
		arg_1_4:info("[CONFIG] discover 1-way controller")

		local var_7_0

		if arg_7_0.type then
			var_7_0 = {
				value = {}
			}
			var_7_0.value.type = "ay"
			var_7_0.value.data = {}
			var_7_0.value.data[1] = arg_7_0.type
		end

		return var_1_0.callParameterOnStack(var_0_8, var_7_0)
	end

	function var_1_0.discoverGenericPulseSensor(arg_8_0)
		arg_1_4:info("[CONFIG] discoverGenericPulseSensor")

		local var_8_0
		local var_8_1 = {
			value = {}
		}

		var_8_1.value.type = "ay"

		local var_8_2

		var_8_1.value.data, var_8_2 = var_0_6.buildData(arg_8_0.category, arg_8_0.scaleFactor)

		if not var_8_1.value.data then
			return var_8_2
		else
			return var_1_0.callParameterOnStack(var_0_6, var_8_1)
		end
	end

	function var_1_0.propagateTransferKey(arg_9_0)
		arg_1_4:info("[CONFIG] propagateTransferKey")

		local var_9_0 = 0

		if arg_9_0.propagate then
			arg_1_4:debug("[CONFIG] -- propagate option")

			var_9_0 = 1
		end

		if arg_9_0.saveMasterNode then
			arg_1_4:debug("[CONFIG] -- saveMasterNode option")

			var_9_0 = var_9_0 + 2
		end

		local var_9_1 = {
			value = {}
		}

		var_9_1.value.type = "y"
		var_9_1.value.data = var_9_0

		return var_1_0.callParameterOnStack(var_0_7, var_9_1)
	end

	function var_1_0.callParameterOnStack(arg_10_0, arg_10_1)
		local var_10_0 = arg_1_3:getStackNodeOrCreate()
		local var_10_1 = var_0_1:buildParameterCommand(arg_10_0, var_10_0.address, arg_10_1)
		local var_10_2 = arg_1_2:addNewExecFromCommands({
			var_10_1
		}, 120)

		return {
			execId = var_10_2
		}
	end

	return var_1_0
end

setmetatable(var_0_10, var_0_9)

return var_0_10
