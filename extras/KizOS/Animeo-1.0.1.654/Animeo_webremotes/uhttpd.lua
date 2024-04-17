
local animeo = require("webremotes/animeo")
local serv = require("webremotes/webserver")

temp_dir = "/tmp/"

function ssplit(str, sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	str:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end

local logfile = nil

local function log_open()
	logfile = io.open(temp_dir.."uhttpd.log", "a+")
	logfile:write(string.format("+++\n", msg))
end

local function log_msg(msg)
	--logfile:write(string.format("%s\n", msg))
end

local function log_close()
	logfile:write(string.format("---\n\n", msg))
	logfile:close()
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

local function exec(uri, env)
	local variant
	local sid
	local authed
	local user
	local body
	local content_type
	local status = 200
	local sess_valid = false
	local headers_out = {}

	serv.cookie_dir = temp_dir
	serv.nonce_dir = temp_dir
	
	serv.log_msg_func = function(msg)
		--print(msg)
	end

	--print("uri", uri)
	
	local getvars = {}
	
	local indx = uri:find("?")
	if indx ~= nil then
		local getstr = uri:sub(indx+1)
		uri = uri:sub(1, indx-1)
		for i,v in pairs(ssplit(getstr, '&')) do
			indx = v:find("=")
			if indx ~= nil then
				getvars[v:sub(1,indx-1)] = v:sub(indx+1)
			else
				getvars[v] = ""
			end
		end
	end
	
	if uri == "/lua/animeo.appcache" then
		local f = io.open("/www/animeo.appcache", "r")
		body = f:read("*all")
		f:close()

		return 200, "Cache-Control: no-cache\r\nExpires: 0\r\nContent-Type: text/cache-manifest\r\n", body
	end
	
	variant, uri = serv.parse_uri(uri)
	--print("variant", variant, "uri", uri)
	
	local require_auth = serv.request_requires_auth(variant, uri, getvars)
	
	if require_auth then
		log_msg(string.format("++ handle request ++\nvariant: %s uri: %s", variant, uri))

		for k, v in pairs(env.headers) do
			log_msg(string.format("header %s='%s'", k, v))
		end
			
		local cookies = {}
		if (env.headers['Cookie'] ~= nil) then
			cookies = ssplit(env.headers['Cookie'], "; ")
		end
		
		for k, v in pairs(cookies) do
			log_msg(string.format("cookie %s", v))
		end
		
		sid = serv.get_sid(cookies, getvars)
		
		if (sid == nil) then --and (env.headers['Authorization'] == nil)
			sid = serv.create_sid()
			log_msg("sid created: %d", sid)
		end

		if sid ~= nil then
			headers_out['Set-Cookie'] = "sid="..tostring(sid).."; path=/";
			sess_valid, user = serv.read_session(sid)
		end

		if sess_valid and user ~= nil then
			authed = true
		else
			authed, user = serv.handle_auth(sid, env.headers['Authorization'], "GET")
		end
	end

	
	if (not require_auth) or (authed and user ~= nil) then
		status, content_type, body = serv.handle_request(variant, uri, sid, user, getvars, env.headers['Authorization'])
	else
		local nonce = serv.create_nonce()
		status = 401
		headers_out['WWW-Authenticate'] = 'Digest realm="AnimeoIP:Remotes", nonce="' .. nonce .. '", qop="auth"'
		
		log_msg("request auth (401)")
	end

	local headers = "Cache-Control: no-cache\r\nExpires: 0\r\n"
	if content_type ~= nil then
		headers = string.format("%sContent-Type: %s\r\n", headers, content_type)
	end

	for k,v in pairs(headers_out) do
		headers = string.format("%s%s: %s\r\n", headers, k, v)
	end

	if body == nil then
		body = ""
	end
	
	return status, headers, body
end

function handle_request(env, debugmode)
	local tmp = ""
	local post = ""
	local postkv = {}
	local res, status, header, content

	log_open()
	
	env.log = "/var/log/lua_http.log"
	
	if debugmode then
		status, header, content = exec(env.REQUEST_URI, env)
		uhttpd.send(string.format("%s %s\r\n%s\r\n", env.SERVER_PROTOCOL, tostring(status), tostring(header)))
		uhttpd.send(tostring(content))
		uhttpd.send("\r\n")
	else
	
		local co = coroutine.create(exec)

		while coroutine.status(co) ~= "dead" do
			res, status, header, content = coroutine.resume(co, env.REQUEST_URI, env)

			if not res then
				uhttpd.send(env.SERVER_PROTOCOL)
				uhttpd.send(" 500 Internal Server Error\r\n")
				uhttpd.send("Content-Type: text/plain\r\n\r\n")
				uhttpd.send(" 500 Internal Server Error :(\r\n"..status)
				
				log_msg("!!! ERROR: "..status)
				break
			else
				uhttpd.send(string.format("%s %s\r\n%s\r\n", env.SERVER_PROTOCOL, tostring(status), tostring(header)))
				uhttpd.send(tostring(content))
				--uhttpd.send("\r\n")
			end
		end
	end
	
	log_close()

end
