-- chunkname: @./gateway/RTW-utils.module

local extend = {}

function extend.setProtocolSpecificCommandParameters(command)
	command.type = "vendor"
	command.vendorid = 128 + command.command + 4
	command.command = 15
end

return depends("RTx-utils")(extend)
