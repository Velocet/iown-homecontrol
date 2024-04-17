import("Overkiz.Bus")
import("Overkiz.FileSystem")
import("Overkiz.HomeAutomation.Protocol.RTD.Command")
import("Overkiz.HomeAutomation.Protocol.RTD.groups")

local var_0_0 = Bus.Object.Server("/com/overkiz/Application/Lua/HomeAutomation/Protocol/RTD/Group")
local var_0_1 = Bus.Connection.get()

var_0_0:setStackSize(16384)
var_0_1:bind("com.overkiz.Application.Lua.HomeAutomation.Protocol.RTD.Group")

function var_0_0.progress(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = Bus.Message.Signal()
	local var_1_1 = var_1_0:begin()

	var_1_0:setMember("progress")
	var_1_0:setInterface("com.overkiz.Application.Lua.HomeAutomation.Protocol.RTD.Group")

	local var_1_2 = var_1_1:begin("struct")

	var_1_2:push("string", arg_1_1)
	var_1_1:close(var_1_2)

	local var_1_3 = var_1_1:begin("struct", var_1_2)

	var_1_3:push("uint32", arg_1_2.address)
	var_1_3:push("uint32", arg_1_2.data)
	var_1_3:push("boolean", arg_1_2.extended)
	var_1_3:push("byte", arg_1_2.extension)
	var_1_1:close(var_1_3)
	var_1_1:push("int32", arg_1_3)
	arg_1_0:send(var_1_0)
end

function var_0_0.method(arg_2_0, arg_2_1)
	if arg_2_1:getInterface() == "com.overkiz.Application.Lua.HomeAutomation.Protocol.RTD.Group" then
		if arg_2_1:getMember() == "add" and arg_2_1:getSignature() == "sa(uuby)" then
			local var_2_0 = arg_2_1:constbegin()
			local var_2_1 = var_2_0:get("string")
			local var_2_2 = {}
			local var_2_3 = (("import \"Overkiz.HomeAutomation.Protocol.RTD.Command\"\n" .. "import \"Overkiz.HomeAutomation.Protocol.RTD.Group.Container\"\n") .. "local id = \"" .. var_2_1 .. "\";\n") .. "local container = Container ({\n"
			local var_2_4 = var_2_0:begin()
			local var_2_5

			while var_2_4 ~= nil and var_2_4:valid() == true do
				var_2_5 = var_2_4:begin(var_2_5)

				local var_2_6 = var_2_5:get("uint32")
				local var_2_7 = var_2_5:get("uint32")
				local var_2_8 = var_2_5:get("boolean")
				local var_2_9 = var_2_5:get("byte")

				var_2_3 = var_2_3 .. "    {\n"
				var_2_3 = var_2_3 .. "      address = " .. tostring(var_2_6) .. ",\n"
				var_2_3 = var_2_3 .. "      data = " .. tostring(var_2_7) .. ",\n"
				var_2_3 = var_2_3 .. "      extended = " .. tostring(var_2_8) .. ",\n"
				var_2_3 = var_2_3 .. "      extension = " .. tostring(var_2_9) .. ",\n"
				var_2_3 = var_2_3 .. "    },\n"
			end

			local var_2_10 = (var_2_3 .. "  });\n") .. "return container;\n"
			local var_2_11 = "Overkiz/HomeAutomation/Protocol/RTD/groups/" .. var_2_1 .. ".lua"
			local var_2_12 = io.open(var_2_11, "w+")

			if var_2_12 ~= nil then
				var_2_12:write(var_2_10)
				var_2_12:flush()
				var_2_12:close()
				FileSystem.sync()
			end

			local var_2_13 = "Overkiz.HomeAutomation.Protocol.RTD.groups." .. var_2_1

			import(var_2_13)

			local var_2_14 = Bus.Message.Method.Return(arg_2_1)

			arg_2_0:send(var_2_14)

			return true
		elseif arg_2_1:getMember() == "remove" and arg_2_1:getSignature() == "s" then
			local var_2_15 = arg_2_1:constbegin():get("string")
			local var_2_16 = "Overkiz/HomeAutomation/Protocol/RTD/groups/" .. var_2_15 .. ".lua"

			FileSystem.INode.remove(var_2_16)

			groups[var_2_15] = nil

			local var_2_17 = Bus.Message.Method.Return(arg_2_1)

			arg_2_0:send(var_2_17)

			return true
		end
	end

	return false
end

var_0_0:start()
Command.originator:add("Bus", var_0_0)

return var_0_0
