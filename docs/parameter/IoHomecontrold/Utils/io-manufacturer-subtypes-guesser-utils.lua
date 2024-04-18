-- chunkname: @./gateway/io-manufacturer-subtypes-guesser-utils.module

local IOManufacturerSubTypeGuesserUtils = {}
local GeneratedIOManufacturerSubTypeList = depends("io-somfy-manufacturer-subtypes-utils")
local IOManufacturerSubTypeUtils = depends("io-manufacturer-subtypes-utils")

IOManufacturerSubTypeGuesserUtils.manufacturerSubType = GeneratedIOManufacturerSubTypeList.getManufacturerSubTypes()

for i, v in ipairs(IOManufacturerSubTypeUtils.getManufacturerSubTypes()) do
	IOManufacturerSubTypeGuesserUtils.manufacturerSubType[#IOManufacturerSubTypeGuesserUtils.manufacturerSubType + 1] = v
end

function IOManufacturerSubTypeGuesserUtils.guessManufacturerSubType(nodeClass, nodeType, nodeSubType, manufacturerId, generalInfo1, generalInfo2)
	local softwareVersion = IOManufacturerSubTypeGuesserUtils.getSoftwareVersion(nodeClass, nodeType, nodeSubType, manufacturerId, generalInfo1, generalInfo2)

	for i, v in ipairs(IOManufacturerSubTypeGuesserUtils.manufacturerSubType) do
		if v.class == nodeClass and v.profile == nodeType and v.subProfile == nodeSubType and v.manufacturer == manufacturerId and IOManufacturerSubTypeGuesserUtils.compareSoftwareVersion(v.softwareVersion, softwareVersion) then
			return v.manufacturerSubType
		end
	end

	return 0
end

function IOManufacturerSubTypeGuesserUtils.getSoftwareVersion(class, profile, subProfile, manufacturer, generalInfo1, generalInfo2)
	if class == 0 and (profile == 52 or profile == 22) and subProfile == 1 and manufacturer == 12 then
		return IOManufacturerSubTypeGuesserUtils.extractSoftVersionFromGeneralInfo(generalInfo2)
	end

	return IOManufacturerSubTypeGuesserUtils.extractSoftVersionFromGeneralInfo(generalInfo1)
end

function IOManufacturerSubTypeGuesserUtils.extractSoftVersionFromGeneralInfo(generalInfo)
	return bytearray(generalInfo, "base64"):sub(1, 10)
end

function IOManufacturerSubTypeGuesserUtils.compareSoftwareVersion(pattern, softwareVersion)
	if #pattern ~= #softwareVersion then
		return false
	end

	for i = 1, #pattern do
		if softwareVersion[i] ~= pattern[i] and pattern[i] ~= 63 then
			return false
		end
	end

	return true
end

return IOManufacturerSubTypeGuesserUtils
