local commandModel = {valueType = {}}

commandModel.valueType.RAW_VALUE = 0
commandModel.valueType.LUA_EXPRESSION = 1

commandModel.status = {}
commandModel.status.DETAILED_ERROR        = -254
commandModel.status.INVALID_VALUE         = -58
commandModel.status.NO_ANSWER             = -2
commandModel.status.NON_EXECUTING         = 0
commandModel.status.ERROR_WHILE_EXECUTING = 1
commandModel.status.PENDING               = 2
commandModel.status.USECASE               = 3
commandModel.status.EXECUTING             = 4
commandModel.status.DONE                  = 5
commandModel.status.QUEUED                = 6
commandModel.status.DEPRECATED            = 7
commandModel.status.TRANSMITTING          = 22

commandModel.progressEvent = {
	QUEUED = 6,
	TRANSMITTING = 1,
	NO_ANSWER = -2,
	SETUP_REQUIRED = -35,
	DONE = 4,
	TRANSMITTED = 2,
	DEPRECATED = 7,
	BUSY_RADIO_ERROR = -33,
	CANCELLED = -6,
	PENDING = 0,
	EXECUTING = 3,
	ERROR = 5
}

function commandModel.isErrorStatus(arg_1_0) return arg_1_0 <= commandModel.status.ERROR_WHILE_EXECUTING end
function commandModel.isFinalStatus(arg_2_0)
	if arg_2_0 == commandModel.status.DONE or arg_2_0 == commandModel.status.DEPRECATED or commandModel.isErrorStatus(arg_2_0) then return true
  else return false	end
end

commandModel.originator         = {}
commandModel.originator.UNKNOWN = 200 -- 0xC8
commandModel.originator.USER    = 1
commandModel.originator.TIMER   = 3
commandModel.originator.SAAC    = 8

commandModel.acei                              = {}
commandModel.acei.UNKNOWN                      = 0
commandModel.acei.DEFAULT_WITH_COMFORT_LEVEL_4 = 231

commandModel.priority        = {}
commandModel.priority.LOWEST = 0
commandModel.priority.MEDIUM = 256
commandModel.priority.HIGH   = 1048576

commandModel.access       = {}
commandModel.access.WRITE = false
commandModel.access.READ  = true

function commandModel.buildParameterCommand(self, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_1 == nil or arg_3_2 == nil then return nil	end

	local var_3_0 = {}

	var_3_0.id = 0
	var_3_0.address = tonumber(arg_3_2)

	if arg_3_3 == nil and arg_3_1.resync ~= nil then	arg_3_3 = arg_3_1.resync.info	end

	if arg_3_3 ~= nil then
		var_3_0.parameter       = arg_3_3.parameter
		var_3_0.priority        = arg_3_3.priority
		var_3_0.access          = arg_3_3.access
		var_3_0.acei            = arg_3_3.acei
		var_3_0.originator      = arg_3_3.originator
		var_3_0.value           = arg_3_3.value
		var_3_0.getDynamicValue = arg_3_3.getDynamicValue
	end

	if var_3_0.parameter  == nil then var_3_0.Parameter  = arg_3_1.id	end
	if var_3_0.priority   == nil then var_3_0.priority   = commandModel.priority.MEDIUM	end
	if var_3_0.access     == nil then var_3_0.access     = arg_3_1.defaultAccess	end
	if var_3_0.acei       == nil then var_3_0.acei       = commandModel.acei.DEFAULT_WITH_COMFORT_LEVEL_4	end
	if var_3_0.originator == nil then var_3_0.originator = commandModel.originator.SAAC	end

  if var_3_0.value      == nil then
		if var_3_0.getDynamicValue then var_3_0.value      = var_3_0.getDynamicValue()
		else
                                    var_3_0.value      = {}
                                    var_3_0.value.type = "ay"
                                    var_3_0.value.data = {}
		end
	end

	var_3_0.valueType     = commandModel.valueType.RAW_VALUE
	var_3_0.status        = commandModel.status.PENDING
	var_3_0.errorType     = 0
	var_3_0.errorId       = 0
	var_3_0.detailedError = ""
	var_3_0.delay         = 0
	var_3_0.category      = ""

	return var_3_0
end

return commandModel
