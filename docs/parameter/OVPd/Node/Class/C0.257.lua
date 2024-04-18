local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.Name")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.SubscribeEventGateway")
local var_0_2 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.PrivateGatewayMd5")
local var_0_3 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.PrivateGatewaySerialNumber")
local var_0_4 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.GetGatewaySubscriber")
local var_0_5 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Modbus.ModbusDevicesOnBus")
local var_0_6 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Modbus.DeDietrich.DerogationA")
local var_0_7 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Modbus.DeDietrich.DerogationB")
local var_0_8 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Modbus.DeDietrich.DerogationC")
local var_0_9 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.Private.Overkiz.Modbus.ModbusMemoryDump")
local var_0_10 = require("Overkiz.HomeAutomation.Protocol.OVP.Parameter.factory")
local var_0_11 = {}

var_0_11.name = "OverkizModbusGateway"

function var_0_11.create(arg_1_0)
	var_0_10:create(var_0_1, arg_1_0)
	var_0_10:create(var_0_9, arg_1_0)
	var_0_10:create(var_0_2, arg_1_0)
	var_0_10:create(var_0_3, arg_1_0)
	var_0_10:create(var_0_4, arg_1_0)
	var_0_10:create(var_0_5, arg_1_0)
	var_0_10:create(var_0_6, arg_1_0)
	var_0_10:create(var_0_7, arg_1_0)
	var_0_10:create(var_0_8, arg_1_0)
	var_0_10:create(var_0_0, arg_1_0)
end

return var_0_11
