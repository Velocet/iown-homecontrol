-- chunkname: @./gateway/io-atlantic-utils.module

local extend = {}
local IOUtils = depends("io-utils")
local AtlanticUtils = depends("common-atlantic-utils")(extend)

function AtlanticUtils.setElectricalHeaterComfortTemperature(value, holidaysOrPreviousComfortTemperature, context)
	if value == "holidays" or value == "previous" then
		if context ~= nil and context.groupDef then
			return value
		else
			local b = bytearray(2)

			if holidaysOrPreviousComfortTemperature == nil then
				return IOUtils.createActivateFunc(54272, {
					{
						12,
						IOUtils.toRawTemperatureValue(15, 28015, 30115)
					}
				})
			else
				return IOUtils.createActivateFunc(54272, {
					{
						12,
						IOUtils.toRawTemperatureValue(holidaysOrPreviousComfortTemperature, 28015, 30115)
					}
				})
			end
		end
	else
		return IOUtils.createActivateFunc(54272, {
			{
				12,
				IOUtils.toRawTemperatureValue(value, 28015, 30115)
			}
		})
	end
end

function AtlanticUtils.setCurrentOperatingMode(p1)
	if p1 == nil then
		error("Missing mode parameter")
	end

	if p1.absence == "on" and p1.relaunch == "off" then
		return IOUtils.createActivateFunc(54272, {
			{
				16,
				17920
			}
		})
	end

	if p1.absence == "off" and p1.relaunch == "off" then
		return IOUtils.createActivateFunc(54272, {
			{
				16,
				18944
			}
		})
	end

	if p1.absence == "off" and p1.relaunch == "on" then
		return IOUtils.createActivateFunc(54272, {
			{
				16,
				18688
			}
		})
	end

	error("Invalid mode")
end

return AtlanticUtils
