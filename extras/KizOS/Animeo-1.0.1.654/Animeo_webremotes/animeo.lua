
local M = {}

require("webremotes/md5")
struct = require("struct")
socket = require("socket")

M.packets = {
	msg_lua_remotes_list = 14,
	msg_lua_remotes_info = 15,
	msg_lua_remote_status = 16,
	msg_lua_remote_members = 17,

	msg_lua_actuators_list = 12,
	msg_lua_actuators_info = 13,
	msg_lua_actuators_status = 9,

	msg_lua_groups_list = 10,
	msg_lua_groups_info = 11,
	msg_lua_group_members = 18,

	msg_lua_sensors_list = 154,
	msg_lua_sensors_info = 155,
	msg_lua_sensors_status = 156,

	msg_sensor_value = 25,
	msg_command_list = 48,
	msg_command_reset = 50,
	msg_remote_send = 65,
	msg_block = 68,
	msg_remote_reset = 69,
	msg_download_running_config = 95,
	msg_remote_cgiscript = 120,
}

function log_animeo(msg)
	local file = io.open("/tmp/error_log_animeo.txt","a")
	file:write(msg)
	file:close()
end

local function build_requestpacket(version, length, cmd, flags)
	return struct.pack(">i4i4i4i4i4i4", version, length, cmd, flags, 32768, 0)
end

local function parse_responsepacket(data)
	local ret = {}
	ret.version, ret.payload, ret.ret, ret.sg, ret.size, ret.offset = struct.unpack(">i4i4i4i4i4i4", data)
	return ret
end

local function receive_package(sock)
	local ret = nil
	line,err = sock:receive(24)
	if line then
		pkg = parse_responsepacket(line)
		ret = {}
		if pkg.payload >= 0 then
			ret.ret = pkg.ret
			ret.data = ""
			while pkg.payload > 0 do
				line,err = sock:receive(pkg.payload)
				if line then
					ret.data = ret.data .. line
					pkg.payload = pkg.payload - string.len(line)
				else
					return nil
				end
			end

			-- need to remove any trailing '\0'
			local l = string.len(ret.data)
			if string.byte(ret.data, l) == 0 then
				ret.data = string.sub(ret.data, 1, l-1)
			end

		else
			ret.ret = -1
		end
	end
	return ret
end

function M.transceive(cmd, path, data)
	local i = 0
	local packet = build_requestpacket(0, string.len(path) + 1 + string.len(data), cmd, 135) .. path .. "\0" .. data

	if client == nil then
		client = socket.connect("localhost",10000)
		if client == nil then
			return nil
		end
	end

	client:send(packet)
	client:settimeout(10)
	local pkg = receive_package(client)
	if (pkg ~= nil) and (pkg.ret >= 0) then
		return pkg
	end

	client:close()
	client = nil

	return nil
end


function ssplit(str, sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	str:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end

local function starts_with(str,start)
	return string.sub(str,1,string.len(start)) == start
end

local function get_remotes_state(remotes)
	local function_name = "default"
	local function_type = "COMFORT"
	local function_owner = ""
	local function_prio = 65535

	for k,v in ipairs(remotes) do
		function_prio = v.func_prio
		function_name = v.func_name
		function_type = v.func_type
		function_owner = v.func_owner
	end

	return function_type, function_owner, function_prio, function_name
end

function M.get_config(list, match_id)
	local pkg = M.transceive(M.packets.msg_download_running_config, list, match_id)

	if pkg == nil or pkg.ret < 0 or pkg.data == nil then
		return nil
	end

	local list_result = assert(loadstring(pkg.data))()

	if list_result ~= nil then
		local match_param = list .. "_id"
		for i,v in pairs(list_result) do
			if v[match_param] == match_id then return v end
		end
	end

	return nil
end

function M.get_parameter(parameter_id)
	return M.get_config("parameter", parameter_id)
end

local function get_user(user_id)
	return M.get_config("user", user_id)
end

local function get_param(line, param)
	local indx = line:find(param..'=')
	if indx == nil then
		return nil
	end
	line = line:sub(indx+param:len() + 1)
	indx = line:find(',')
	line = line:sub(1, indx-1)
	return line
end

local function parse_sensor_id(sensor_id)
	local values = ssplit(sensor_id:lower(), '_')

	local inside = values[2]:sub(1,-2) == "isb"
	local sensor_type = values[4]

	if (sensor_type ~= "winddir") and (sensor_type ~= "temp") and (sensor_type ~= "rain") and (sensor_type ~= "windspeed") then
		if starts_with(sensor_type, "sun") then
			sensor_type = "sun"
		elseif starts_with(sensor_type, "windspeed") then
			sensor_type = "windspeed"
		elseif starts_with(sensor_type, "temp") then
			sensor_type = "temp"
		elseif starts_with(sensor_type, "button") then
			sensor_type = "button"
		end
	end

	return sensor_type, inside
end

function M.get_sensor_all_values()
	local pkg = M.transceive(M.packets.msg_sensor_value, "all", "")

	local sensor
	local sensors = {}

	if pkg == nil or pkg.data == "" or pkg.data == nil then
		return sensors
	end

	for i,line in pairs(ssplit(pkg.data, "\n")) do
		local val = get_param(line, "sensor_id")
		sensor = {}
		sensor.id = val
		sensor.type, sensor.inside = parse_sensor_id(val)
		sensor.error = get_param(line, "error")
		sensor.value = tonumber(get_param(line, "value"))

		table.insert(sensors, sensor)
	end

	return sensors
end

function M.get_user_digest_ha1(username, realm)
	local user = get_user(username)
	if user ~= nil and tonumber(user.locked) == 0 then
		return md5.sumhexa(string.format("%s:%s:%s", username, realm, user.password))
	else
		return nil
	end
end

function M.control_remote(remote_id, user, event, code)
	-- TODO: Check if this user has the permissoin to use this remote.
	M.transceive(M.packets.msg_remote_send, remote_id, string.format("user=%s,event=%d,code=%d", user, event, code))
	return true
end

function M.control_remote_pos(remote_id, user, pos, angle)
	-- TODO: Check if this user has the permissoin to use this remote.
	M.transceive(M.packets.msg_remote_send, remote_id, string.format("user=%s,event=5,code=0,position=%s,angle=%s", user, pos, angle))
	return true
end

function M.reset_local(remote_id, user)
	-- TODO: Check if this user has the permissoin to use this remote.
	M.transceive(M.packets.msg_remote_reset, remote_id, "")
	return true
end

function M.get_remotes_list(user)
	local pkg = M.transceive(M.packets.msg_lua_remotes_list,user,"max_users=200,public=1")

	if pkg == nil or pkg.ret<0 or pkg.data == nil then
		return nil
	end

	local f = assert(loadstring(pkg.data))
	local remotes = f()

	return remotes
end

function M.generic_get(user, id, cmd)
	local pkg = M.transceive(cmd, id or "", string.format("user=%s", user or ""))

	if pkg == nil or pkg.ret < 0 or pkg.data == nil then
		return nil
	end

	local f = assert(loadstring(pkg.data))
	local status = f()

	return status;
end

function M.control_block(cmd, vars)
	-- TODO: Check if this user has the permission to use this block.
	local id = vars['id']
	params = 'cmd='..tostring(cmd)
	for k, v in pairs(vars) do
		if k != 'id' and k != 'cmd' then
			params = params..','..k..'='..v
		end
	end

	local pkg = M.transceive(M.packets.msg_block, id or "", params)
	if pkg == nil or pkg.ret < 0 or pkg.data == nil then
		return nil
	end

	local f = assert(loadstring(pkg.data))
	local blocks = f()

	return blocks
end

return M
