-- chunkname: @./gateway/ogp-utils.module

local ogpUtils = {}

function ogpUtils.checkSetNodeDefinitionConsistency(type, subType, definition)
	if definition ~= nil and subType == nil then
		error("When a definition is defined, a subType must also be defined")
	end

	return {
		type = type,
		subType = subType,
		definition = definition
	}
end

return ogpUtils
