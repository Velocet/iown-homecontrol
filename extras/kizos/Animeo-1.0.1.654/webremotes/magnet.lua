
local animeo = require("webremotes/animeo")
local serv = require("webremotes/webserver")

local sess_dir = "/tmp/"
local printdebug = false

local debuglog = ""

function log(msg)
	if printdebug then
		print(msg)
	end
end

local function starts_with(str,start)
	return string.sub(str,1,string.len(start)) == start
end

local function ssplit(str, sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	str:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end

local function file_exists(file)
	local f = io.open(file)
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local function exec(script, query, env)
	local variant
	local sid
	local authed
	local user
	local body
	local nonce
	local content_type
	local status = 200
	local sess_valid = false

	serv.cookie_dir = sess_dir
	serv.nonce_dir = sess_dir

	serv.log_msg_func = function(msg)
		log(msg)
	end

	log("script: " .. script .. " query: " .. query)

	local getvars = {}

	for i,v in pairs(ssplit(query, '&')) do
		indx = v:find("=")
		if indx ~= nil then
			getvars[v:sub(1,indx-1)] = v:sub(indx+1)
			log("getvar: " .. (v:sub(1,indx-1)) .. "=" .. getvars[v:sub(1,indx-1)])
		else
			getvars[v] = ""
			log("getvar: " .. v)
		end
	end

	if starts_with(script, "/xml/") then
		uri = string.sub(script, 6)
	elseif starts_with(script, "/xxml/") then
		uri = string.sub(script, 7)
	else
		uri = script
	end

	variant = "xml"
	log("uri: " .. uri)

	if lighty.no_auth == nil then
		log("auth: " .. tostring(env.headers['Authorization']))
		local auth = serv.parse_authorization(env.headers['Authorization'])
		if auth ~= nil then
			log("auth username: " .. tostring(auth['username']))
			user = auth['username']
			authed = (user ~= nil and user ~= "" and auth['realm'] == "AnimeoIP")
		else
			log("auth res: nil")
			user = nil
			authed = false
		end
	else
		user = lighty.no_auth
		authed = true
	end

	if authed and user ~= nil then
		status, content_type, body = serv.handle_request(variant, uri, sid, user, getvars)
	else
		status = 401
		log("request auth (401)")
	end

	local headers = {}
	headers["Cache-Control"] = "no-cache"
	headers["Expires"] = "0"

	if content_type ~= nil then
		headers["Content-Type"] = content_type
	end

	if body == nil then
		body = ""
	end
	
	return status, headers, body
end

local tmp = ""
local post = ""
local postkv = {}
local res, status, headers, content

content = ""

local env = {}
env.QUERY_STRING = lighty.env['uri.query'] or ""
env.SERVER_PROTOCOL = lighty.env['request.protocol']
env.SCRIPT_NAME = lighty.env['uri.path'] or ""

env.headers = {}
env.headers.Cookie = lighty.request['Cookie'] or ""
env.headers.Authorization = lighty.request['Authorization']

local co = coroutine.create(exec)
while coroutine.status(co) ~= "dead" do
	res, status, headers, content = coroutine.resume(co, env.SCRIPT_NAME, env.QUERY_STRING, env)

	if not res then
		log("!!! ERROR: "..status)
		status = 500
		headers = {}
		headers["Content-Type"] = "text/plain"
		content = "Internal Server Error :("
		break
	end
end

if printdebug then

	content = content .. "\r\n<!--\r\nDebug:\r\n"

	content = content .. debuglog

	content = content .. "\r\n\r\nHeaders:\r\n"

	content = content .. tostring(header)

	content = content .. "\r\n\r\nLighty Env:\r\n"

	for k,v in pairs(lighty.env) do
		content = content .. tostring(k) .. " = " .. tostring(v) .. "\r\n"
	end

	content = content .. "\r\n\r\nLighty Req:\r\n"

	for k,v in pairs(lighty.request) do
		content = content .. tostring(k) .. " = " .. tostring(v) .. "\r\n"
	end

	content = content .. "\r\n-->"

	print(content)
end

if headers ~= nil then
	for k,v in pairs(headers) do
		lighty.header[tostring(k)] = tostring(v)
	end
end

lighty.content = { content or "" }

return status or 500
