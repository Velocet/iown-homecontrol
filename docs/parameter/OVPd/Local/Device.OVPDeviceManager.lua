local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Local.Device.DeviceManager")
local var_0_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_2 = require("pl.List")
local var_0_3 = require("Overkiz.utilities")
local var_0_4 = {}
local var_0_5 = {}

function var_0_4.__call(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = var_0_0(arg_1_1, arg_1_2, arg_1_3, arg_1_4)

	local function var_1_1(arg_2_0)
		local var_2_0 = var_0_2({
			5,
			1,
			2,
			0,
			1,
			0,
			0
		}):map(string.byte)
		local var_2_1 = var_0_3.tableExtract(arg_2_0.generalinfo[1], 1, 7)

		if var_0_3.tableCompare(var_2_0, var_2_1) then
			return 1
		end
	end

	local function var_1_2(arg_3_0)
		local var_3_0 = {
			{
				id = 1,
				payload = var_0_2({
					2,
					8,
					1,
					1,
					2,
					0,
					1,
					2
				}):map(string.byte)
			},
			{
				id = 2,
				payload = var_0_2({
					1,
					3,
					0,
					3,
					2,
					0,
					1,
					3
				}):map(string.byte)
			}
		}

		for iter_3_0, iter_3_1 in pairs(var_3_0) do
			local var_3_1 = var_0_3.tableExtract(arg_3_0.generalinfo[1], 1, 8)

			if var_0_3.tableCompare(var_3_1, iter_3_1.payload) then
				return iter_3_1.id
			end
		end

		return 0
	end

	local function var_1_3(arg_4_0)
		local var_4_0 = var_0_2({
			1,
			9,
			0,
			3,
			2,
			0,
			1,
			6
		}):map(string.byte):extend(var_0_2({
			0,
			0,
			0,
			0,
			1,
			11
		}))

		if var_0_3.tableCompare(var_4_0, arg_4_0.generalinfo[1]) then
			return 1
		end

		return 0
	end

	local var_1_4 = {
		{
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			profile = 52,
			extraType = var_1_1
		},
		{
			subProfile = 0,
			extraType = 1,
			class = 0,
			manufacturer = 11,
			profile = 22
		},
		{
			subProfile = 0,
			extraType = 1,
			class = 0,
			manufacturer = 11,
			profile = 15
		},
		{
			subProfile = 0,
			class = 1,
			manufacturer = 2,
			profile = 2,
			extraType = var_1_1
		},
		{
			subProfile = 1,
			class = 0,
			manufacturer = 11,
			profile = 0,
			extraType = var_1_2
		},
		{
			subProfile = 1,
			class = 0,
			manufacturer = 11,
			profile = 0,
			extraType = var_1_2
		},
		{
			subProfile = 1,
			class = 0,
			manufacturer = 11,
			profile = 257,
			extraType = var_1_3
		}
	}

	function var_1_0.guessManufacturerSubType(arg_5_0, arg_5_1)
		for iter_5_0, iter_5_1 in pairs(var_1_4) do
			if iter_5_1.class == arg_5_1.class and iter_5_1.manufacturer == arg_5_1.manufacturer and iter_5_1.profile == var_0_1.getProfile(arg_5_1) and iter_5_1.subProfile == var_0_1.getSubProfile(arg_5_1) then
				arg_1_4:info("[OvpDeviceManager][guessManufacturerSubType] overload for class(" .. tostring(iter_5_1.class) .. ") manufacturer(" .. tostring(iter_5_1.manufacturer) .. ") profile(" .. tostring(iter_5_1.profile) .. ") subProfile(" .. tostring(iter_5_1.subProfile) .. ")")

				if type(iter_5_1.extraType) == "function" then
					return iter_5_1.extraType(arg_5_1) or 0
				else
					return iter_5_1.extraType
				end
			end
		end

		return 0
	end

	var_1_0:checkImplementation()

	return var_1_0
end

setmetatable(var_0_5, var_0_4)

return var_0_5
