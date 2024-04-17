module("md5", package.seeall)

local function exec(cmd)
	local pp = io.popen(cmd)
	local res = pp:read("*a")
	pp:close()
	return res
end

function sumhexa(val)
	local res = exec(string.format('echo -n "%s" | md5sum', val))
	res = res:sub(1,32)
--	print("md5", '"'..val..'"', res)
	return res
end
