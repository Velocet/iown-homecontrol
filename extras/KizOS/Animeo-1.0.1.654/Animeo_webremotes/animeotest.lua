 
local M = {}

M.anime_path = "/usr/bin/"

local function exec(command)
	local pp   = io.popen(command)
	local data = pp:read("*a")
	pp:close()

	return data
end

function M.get_user_digest_ha1(username, realm)
	local password = "test"
	local ha1 = md5.sumhexa(string.format("%s:%s:%s", username, realm, password))

	return ha1
end

function M.get_user_remote(user, remote_id)
	return { remote_id=remote_id, remote_disabled=0, group_id="0004B1", name="Web remote 177", priority=14000, timeout=30, script_id="", public=false }
end
 
function M.control_remote(remote_id, user, event, code)
	exec(string.format("%s/animeoremotesenduser %s %s %s %s %s", anime_path, remote_id, event, code, user))
	return true
end

function M.reset_local(remote_id, user)
	return true
end

function M.get_user_remotes(user)
	local cmd = exec(anime_path.."animeoremotecgiscript --lua "..user.." 10000")
	local f = assert(loadstring(cmd))
	local remotes = f()
	
	return remotes
end

function M.get_user_remotes(user)
	return {
		{ remote_id="000401", remote_disabled=0, group_id="000401", name="Web remote 1", priority=14000, timeout=30, script_id="", public=false },
		{ remote_id="000402", remote_disabled=0, group_id="000402", name="Web remote 2", priority=14000, timeout=30, script_id="", public=true },
		{ remote_id="000403", remote_disabled=1, group_id="000403", name="Web remote 3", priority=14000, timeout=30, script_id="", public=false }
	}
end

return M