return {
	buildTransportStateFromNotification = function(arg_1_0, arg_1_1)
		return {
			node = arg_1_1.nodeAddress,
			param = arg_1_1.rawStateId,
			value = arg_1_1.rawStatevalue
		}
	end,
	buildNotificationState = function(arg_2_0, arg_2_1)
		return {
			nodeAddress = arg_2_1.node,
			rawStateId = arg_2_1.param,
			rawStatevalue = arg_2_1.value
		}
	end,
	buildTransportState = function(arg_3_0, arg_3_1)
		return {
			node = arg_3_1.node,
			param = arg_3_1.param,
			value = arg_3_1.value
		}
	end,
	buildNodeFromTransport = function(arg_4_0, arg_4_1)
		return {
			id = arg_4_1.id,
			status = arg_4_1.status,
			type = arg_4_1.type
		}
	end,
	buildTransportNode = function(arg_5_0, arg_5_1)
		return {
			id = arg_5_1.id,
			status = arg_5_1.status,
			type = arg_5_1.type
		}
	end,
	buildTransportNodeFromNotification = function(arg_6_0, arg_6_1)
		return {
			id = arg_6_1.address,
			status = arg_6_1.status,
			type = arg_6_1.type
		}
	end,
	buildCommandFromTransport = function(arg_7_0, arg_7_1)
		return {
			access = arg_7_1.access,
			param = arg_7_1.param,
			index = arg_7_1.index,
			node = arg_7_1.node,
			value = arg_7_1.access == "w" and arg_7_1.value or nil
		}
	end,
	buildRawCommandResult = function(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
		return {
			groupid = arg_8_1,
			status = arg_8_3,
			index = arg_8_2,
			id = arg_8_2
		}
	end,
	buildGroupFromTransport = function(arg_9_0, arg_9_1)
		return {
			id = arg_9_1.id
		}
	end
}
