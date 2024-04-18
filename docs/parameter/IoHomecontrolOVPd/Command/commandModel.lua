local var_0_0 = {
	valueType = {}
}

var_0_0.valueType.RAW_VALUE = 0
var_0_0.valueType.LUA_EXPRESSION = 1
var_0_0.status = {}
var_0_0.status.DETAILED_ERROR = -254
var_0_0.status.INVALID_VALUE = -58
var_0_0.status.NO_ANSWER = -2
var_0_0.status.NON_EXECUTING = 0
var_0_0.status.ERROR_WHILE_EXECUTING = 1
var_0_0.status.PENDING = 2
var_0_0.status.USECASE = 3
var_0_0.status.EXECUTING = 4
var_0_0.status.DONE = 5
var_0_0.status.QUEUED = 6
var_0_0.status.DEPRECATED = 7
var_0_0.status.TRANSMITTING = 22
var_0_0.progressEvent = {
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

function var_0_0.isErrorStatus(arg_1_0)
	return arg_1_0 <= var_0_0.status.ERROR_WHILE_EXECUTING
end

function var_0_0.isFinalStatus(arg_2_0)
	if arg_2_0 == var_0_0.status.DONE or arg_2_0 == var_0_0.status.DEPRECATED or var_0_0.isErrorStatus(arg_2_0) then
		return true
	else
		return false
	end
end

var_0_0.originator = {}
var_0_0.originator.UNKNOWN = 200
var_0_0.originator.USER = 1
var_0_0.originator.TIMER = 3
var_0_0.originator.SAAC = 8
var_0_0.acei = {}
var_0_0.acei.UNKNOWN = 0
var_0_0.acei.DEFAULT_WITH_COMFORT_LEVEL_4 = 231
var_0_0.priority = {}
var_0_0.priority.LOWEST = 0
var_0_0.priority.MEDIUM = 256
var_0_0.priority.HIGH = 1048576
var_0_0.access = {}
var_0_0.access.WRITE = false
var_0_0.access.READ = true

function var_0_0.buildParameterCommand(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_1 == nil or arg_3_2 == nil then
		return nil
	end

	local var_3_0 = {}

	var_3_0.id = 0
	var_3_0.address = tonumber(arg_3_2)

	if arg_3_3 == nil and arg_3_1.resync ~= nil then
		arg_3_3 = arg_3_1.resync.info
	end

	if arg_3_3 ~= nil then
		var_3_0.parameter = arg_3_3.parameter
		var_3_0.priority = arg_3_3.priority
		var_3_0.access = arg_3_3.access
		var_3_0.acei = arg_3_3.acei
		var_3_0.originator = arg_3_3.originator
		var_3_0.value = arg_3_3.value
		var_3_0.getDynamicValue = arg_3_3.getDynamicValue
	end

	if var_3_0.parameter == nil then
		var_3_0.parameter = arg_3_1.id
	end

	if var_3_0.priority == nil then
		var_3_0.priority = var_0_0.priority.MEDIUM
	end

	if var_3_0.access == nil then
		var_3_0.access = arg_3_1.defaultAccess
	end

	if var_3_0.acei == nil then
		var_3_0.acei = var_0_0.acei.DEFAULT_WITH_COMFORT_LEVEL_4
	end

	if var_3_0.originator == nil then
		var_3_0.originator = var_0_0.originator.SAAC
	end

	if var_3_0.value == nil then
		if var_3_0.getDynamicValue then
			var_3_0.value = var_3_0.getDynamicValue()
		else
			var_3_0.value = {}
			var_3_0.value.type = "ay"
			var_3_0.value.data = {}
		end
	end

	var_3_0.valueType = var_0_0.valueType.RAW_VALUE
	var_3_0.status = var_0_0.status.PENDING
	var_3_0.errorType = 0
	var_3_0.errorId = 0
	var_3_0.detailedError = ""
	var_3_0.delay = 0
	var_3_0.category = ""

	return var_3_0
end

return var_0_0
