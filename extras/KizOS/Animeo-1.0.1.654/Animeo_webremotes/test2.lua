
local animeo = require("webremotes/uhttpd")

uhttpd = {}

local content = ""

local env = {
	SERVER_PROTOCOL = "1.1",
	REQUEST_URI = "/lua/xml/service_enabled",
	CONTENT_LENGTH = string.len(content),
	headers = {
		Cookie = "sid=1"
	}
}

function uhttpd.send(s)
	print(s)
end

function uhttpd.recv()
	return string.len(content), content
end

function uhttpd.urldecode(s)
	return s .. "."
end

temp_dir = "/tmp/"

handle_request(env, true)

