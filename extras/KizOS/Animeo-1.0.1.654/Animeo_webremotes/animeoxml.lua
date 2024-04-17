
local M = {}

local animeo = require("webremotes/animeo")

local xml_head = '<?xml version="1.0" encoding="UTF-8"?>\n'
local xml_type = 'application/xml; charset=utf-8'
local error_msg = '%s<error status="%d" message="%s"/>'
local xmlversion = 1

local actuator_types = {
	[0]  = "Unknown",
	[1]  = "VenetianBlind",
	[2]  = "RollingShutter",
	[3]  = "VerticalAwning",
	[4]  = "WindowOpener",
	[5]  = "GarageDoorOpener",
	[6]  = "Light",
	[7]  = "GateOpener",
	[8]  = "RollingDoorOpener",
	[9]  = "MotorizedBolt",
	[10] = "InteriorBlind",
	[11] = "SCD",
	[12] = "Beacon",
	[13] = "DualShutter",
	[14] = "TemperatureControlInterface",
	[15] = "OnOffSwitch",
	[16] = "HorizontalAwning",
	[17] = "ExternalVenetianBlind",
	[18] = "LouvreBlind",
	[19] = "CurtainTrack",
	[20] = "VentilationPoint",
	[21] = "ExteriorHeating",
	[22] = "HeatPump",
	[23] = "IntrusionAlarm",
	[24] = "SwingingShutter"
}

local block_cmd = {
	BLOCK_CMD_NONE=0,
	BLOCK_CMD_ADD=1,
	BLOCK_CMD_REMOVE=2,
	BLOCK_CMD_LIST=3,
	BLOCK_CMD_GET=4,
	BLOCK_CMD_UPDATE=5,
}

function log_animeoxml(msg)
	local file = io.open("/tmp/error_log_animeoxml.txt","a")
	file:write(msg)
	file:close()
end

local function make_error_message(status, message)
	return string.format(error_msg, xml_head, status, message)
end

local function handle_remote_action(user, remote_id, action, position, angle)

	angle = tonumber(angle)
	position = tonumber(position)
	if (action == nil) or (action:lower() == "absolute" and (position == nil) and (angle == nil)) then
		return 400, make_error_message(400, "Bad Request")
	end
	action = action:lower()

	local result = false
	if action == "up" then
		result = animeo.control_remote(remote_id, user, 1, 1)
	elseif action == "stop" then
		result = animeo.control_remote(remote_id, user, 1, 2)
	elseif action == "down" then
		result = animeo.control_remote(remote_id, user, 1, 4)
	elseif action == "absolute" then
		result = animeo.control_remote_pos(remote_id, user, position or -1, angle or -1)
	elseif action == "reset" then
		result = animeo.reset_local(remote_id, user)
	else
		return 400, make_error_message(400, "Bad Request")
	end

	return 200, string.format('%s<action_status result="%s" />', xml_head, tostring(result))
end

local function handle_actuator_action(user, actuator_id, remote_id, action, position, angle)
	return 501, make_error_message(501, "Not Implemented")
end

local function lua_to_xml(root, elt, data)
	local result = xml_head.."<"..root..">\n"
	for k, v in pairs(data) do
		result = result.."\t<"..elt
			for name, value in pairs(v) do
				result = result.." "..tostring(name).."=\""..tostring(value).."\""
			end
		result = result.."/>\n"
	end
	result = result.."</"..root..">\n"
	return result
end


local function handle_generic_get(user, id, cmd, root, elt)
	if id == nil then
		return 400, make_error_message(400, "Bad Request")
	end

	local data = animeo.generic_get(user, id, cmd)
	if data == nil then
		return 500, make_error_message(500, "Internal Server Error")
	end

	result = lua_to_xml(root, elt, data)
	return 200, result
end

local function handle_generic_list(user, cmd, root, elt)
	local data = animeo.generic_get(user, nil, cmd)
	if data == nil then
		return 500, make_error_message(500, "Internal Server Error")
	end

	result = lua_to_xml(root, elt, data)
	return 200, result
end

local function handle_sensors()
	local sensors = animeo.get_sensor_all_values()

	if sensors == nil then
		return 500, make_error_message(500, "Internal Server Error")
	end

	local body = "<sensors>\n"
	for i,sensor in pairs(sensors) do
		local sensorxml = "\t<sensor"
		for key,value in pairs(sensor) do
			sensorxml = string.format('%s %s="%s"',
				sensorxml, tostring(key), tostring(value))
		end
		body = body..sensorxml.." />\n"
	end
	body = body.."</sensors>"

	return 200, body
end

local function handle_service_info()
	local enabled = "true";
	local expire = animeo.get_parameter("VIRTUAL_REMOTE_EXPIRE")
	if expire ~= nil then
		local num = tonumber(expire.parameter_value)
		if (os.time() > num) and (num ~= 0) then
			enabled = "false"
		end
	end
	return 200, string.format('%s<service_info webserviceenabled="%s" webserviceversion="%s" />', xml_head, enabled, tostring(xmlversion))
end

local function handle_block(user, action, vars)
	action = action:lower()

	if (action == nil) then
		-- action is not specified
		-- or action is 'add' but neither position nor angle are specified
		return 400, make_error_message(400, "Bad Request")
	end

	local cmd
	local result
	local blocks
	if action == "add" then
		cmd = block_cmd.BLOCK_CMD_ADD
	elseif action == "remove" then
		cmd = block_cmd.BLOCK_CMD_REMOVE
	elseif action == "get" then
		cmd = block_cmd.BLOCK_CMD_GET
	elseif action == "list" then
		cmd = block_cmd.BLOCK_CMD_LIST
	elseif action == "update" then
		cmd = block_cmd.BLOCK_CMD_UPDATE
	else
		result = tostring(false)
		return 400, make_error_message(400, "Bad Request")
	end

	blocks = animeo.control_block(cmd, vars)
	if blocks == nil then
		return 500, 'Invalid command'
	else
		return 200, lua_to_xml('blocks', 'block', blocks)
	end
end

function M.handle_request(uri, sid, user, getvars)
	local status
	local body

	if uri == "remote" then
		status, body = handle_remote_action(user, getvars['id'], getvars['action'], getvars['position'], getvars['angle'])
	elseif uri == "actuator" then
		status, body = handle_actuator_action(user, getvars['actuator_id'], getvars['remote_id'], getvars['action'], getvars['position'], getvars['angle'])
	elseif uri == "actuators_list" then
		status, body = handle_generic_list(user,
			animeo.packets.msg_lua_actuators_list, "actuators", "actuator")
	elseif uri == "actuators_info" then
		status, body = handle_generic_get(user, getvars['id'],
			animeo.packets.msg_lua_actuators_info, "actuators", "actuator")
	elseif uri == "actuators_status" then
		status, body = handle_generic_get(user, getvars['id'],
			animeo.packets.msg_lua_actuators_status, "actuators", "actuator")
	elseif uri == "groups_list" then
		status, body = handle_generic_list(user,
			animeo.packets.msg_lua_groups_list, "groups", "group")
	elseif uri == "groups_info" then
		status, body = handle_generic_get(user, getvars['id'],
			animeo.packets.msg_lua_groups_info, "groups", "group")
	elseif uri == "group_members" then
		status, body = handle_generic_get(user, getvars['id'],
			animeo.packets.msg_lua_group_members, "actuators", "actuator")
	elseif uri == "remotes_list" then
		status, body = handle_generic_get(user, user,
			animeo.packets.msg_lua_remotes_list, "remotes", "remote")
	elseif uri == "remotes_info" then
		status, body = handle_generic_get(user, getvars['id'],
			animeo.packets.msg_lua_remotes_info, "remotes", "remote")
	elseif uri == "remotes_status" then
		status, body = handle_generic_get(user, getvars['id'],
			animeo.packets.msg_lua_remote_status, "remotes", "remote")
	elseif uri == "remote_members" then
		status, body = handle_generic_get(user, getvars['id'],
			animeo.packets.msg_lua_remote_members, "actuators", "actuator")
	elseif uri == "block" then
		status, body = handle_block(user, getvars['action'], getvars)
	elseif uri == "sensors" then
		status, body = handle_sensors()
	elseif uri == "sensors_list" then
		status, body = handle_generic_list(user,
			animeo.packets.msg_lua_sensors_list, "sensors", "sensor")
	elseif uri == "sensors_info" then
		status, body = handle_generic_get(user, getvars['id'],
			animeo.packets.msg_lua_sensors_info, "sensors", "sensor")
	elseif uri == "sensors_status" then
		status, body = handle_generic_get(user, getvars['id'],
			animeo.packets.msg_lua_sensors_status, "sensors", "sensor")
	elseif uri == "service_info" then
		status, body = handle_service_info()
	elseif uri == "dologin" then
		-- Apache is handling the login, this is an empty page we try to reach
		status = 200
		body = ""
	else
		status = 400
		body = make_error_message(400, "Bad Request")
	end

	return status, xml_type, body
end

return M
