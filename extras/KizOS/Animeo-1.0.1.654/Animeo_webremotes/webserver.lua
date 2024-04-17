
require("string")
require("md5")

local M = {}

local animeo = require("webremotes/animeo")

M.cookie_dir = "tmp/"
M.cookie_ext = ".sess"

M.nonce_dir = "tmp/"
M.nonce_ext = ".nonce"

M.log_msg_func = nil

function ssplit(str, sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	str:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end

local function log_msg(msg)
	if M.log_msg_func ~= nil then
		M.log_msg_func(msg)
	end
end

local function starts_with(str,start)
	return string.sub(str,1,string.len(start)) == start
end

local function trim(s)
	local n = s:find("%S")
	return n and s:match(".*%S", n) or ""
end

function M.read_session(sid)
	local f = io.open(M.cookie_dir .. sid .. M.cookie_ext, "r")
	if (f ~= nil) then
		local user = f:read("*l")
		f:close()

		if user == "" then
			user = nil
		end

		return true, user
	end
	return false, nil
end

function M.write_session(sid, user)
	if user == nil then
		user = ""
	end

	f = io.open(M.cookie_dir .. sid .. M.cookie_ext, "w")
	f:write(string.format("%s", user))
	f:close()
end

function M.create_sid()
	local sid = math.random(1, 2000000)
	while M.read_session(sid) do
		sid = math.random(1, 2000000)
	end
	
	return sid
end

function M.get_sid(cookies, getvars)
	local sid
	
	if cookies ~= nil then
		for i,c in pairs(cookies) do
			if starts_with(c, "sid=") then
				sid = tonumber(c:sub(5))
			end
		end
	else
		if getvars['sid'] ~= nil then
			sid = tonumber(getvars['sid'])
		end
	end

	return sid
end

function M.parse_uri(uri)
	if starts_with(uri, "/xml/") then
		return "xml", uri:sub(10):lower()
	elseif starts_with(uri, "/html/") then
		return "html", uri:sub(11):lower()
	else
		return "unknown", uri
	end
end


function M.validate_nonce(nonce)
	-- if (nonce == nil) or (string.len(nonce) ~= 16) then
		-- return false
	-- end
	
	local f = io.open(M.nonce_dir..nonce..M.nonce_ext, "r")
	local t = os.time()
	if (f ~= nil) then
		local nt = f:read("*n")
		f:close()
		
		if (nt ~= nil) and (nt + 2600 > t) then
			f = io.open(M.nonce_dir..nonce..M.nonce_ext, "w")
			f:write(string.format("%d", t))
			f:close()
			return true
		end
		os.remove(f)
	end
	return false
end

function M.create_nonce()
	local t = os.time()
	local nonce = md5.sumhexa(t .. ":" .. math.random(1, 2000000) .. ":435hwe9df8nGh!#")

	f = io.open(M.nonce_dir..nonce..M.nonce_ext, "w")
	f:write(string.format("%d", t))
	f:close()
	
	return nonce
end


local function calc_digest(ha1, method, uri, nonce, nc, cnonce, auth)
	local a2 = method..":"..uri
	local resp = md5.sumhexa(ha1..":"..nonce..":"..nc..":"..cnonce..":"..auth..":".. md5.sumhexa(a2))
	
	return resp
end

function M.parse_authorization(auth, validate)
	if auth == nil then
		return nil
	end

	if starts_with(auth, "xDigest") then
		auth = auth:sub(8)
	elseif starts_with(auth, "Digest") then
		auth = auth:sub(7)
	end

	local fields = ssplit(auth, ",")
	local values = {}
	for i,v in pairs(fields) do
		v = trim(v)
		local pos = v:find("=")
		if pos ~= nil then
			values[v:sub(1, pos-1)] = v:sub(pos+1, -1)
		end
	end
	
	-- for k,v in pairs(values) do
		-- print("values", k, v)
	-- end
	
	values['nonce'] = values['nonce']:sub(2, -2)
	if (not validate) or M.validate_nonce(values['nonce']) then
		values['username'] = values['username']:sub(2, -2)
		values['realm'] = values['realm']:sub(2, -2)
		values['uri'] = values['uri']:sub(2, -2)
		values['cnonce'] = values['cnonce']:sub(2, -2)
		values['response'] = values['response']:sub(2, -2)
		return values
	else
		return nil
	end
end

function M.logout(sid, auth, nonce)
	local values = parse_authorization(auth, true)
	if values ~= nil then
		os.execute("rm "..M.nonce_dir..nonce..M.nonce_ext)
	end
	
	if sid ~= nil then
		os.execute("rm "..M.cookie_dir..tostring(tonumber(sid))..M.cookie_ext)
	end
end

local function remove_sessions()
-- TODO: remove expired session
end

function M.handle_auth(sid, auth, method)
	local authed = false
	local nonce

	if math.random(1, 100) == 1 then
		remove_sessions()
	end
	
	if auth ~= nil then
		
		local values = parse_authorization(auth, true)
		
		if values ~= nil then
			local ha1 = animeo.get_user_digest_ha1(values['username'], values['realm'])
			if ha1 ~= nil then
				local resp = calc_digest(ha1, method, values['uri'], values['nonce'], values['nc'], values['cnonce'], "auth")
				
				if resp == values['response'] then
					authed = true
					user = values['username']
					nonce = values['nonce']
					if sid ~= nil then
						M.write_session(sid, user)
					end
				end
			end
		end
	end
	
	return authed, user, nonce
end

function M.request_requires_auth(variant, uri, getvars)
	if variant == "xml" and uri == "service_info" then
		return false
	else
		return true
	end
end

function M.handle_request(variant, uri, sid, user, getvars, auth, nonce)
	local status
	local content_type
	local body

	if variant == "xml" then
	
		if uri ~= 'logout' then
			local xml = require("webremotes/animeoxml")
			status, content_type, body = xml.handle_request(uri, sid, user, getvars)
		else
			M.logout(sid, auth, nonce)
			content_type = 'application/xml; charset=utf-8'
			body = '<?xml version="1.0" encoding="UTF-8"?>\n<logout action_status result="true"/>'
			status = 200
		end
	else
		content_type = "text/html"
		status = 400
		body = variant .. ":" .. uri
	end
	
	return status, content_type, body
end

return M
