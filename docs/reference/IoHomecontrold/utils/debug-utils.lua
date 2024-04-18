slot0 = {
	isDebugEnabled = function ()
		return debug ~= nil
	end,
	log = function (slot0, ...)
		print(slot0, ...)
	end,
	printTable = function (slot0, slot1, slot2)
		if slot1 == nil then
			slot1 = "    "
		end

		if slot2 == nil then
			slot2 = 0
		end

		slot4 = slot3 .. slot1

		if type(slot0) == "table" then
			print(slot3 .. "{")

			for slot8, slot9 in pairs(slot0) do
				if type(slot9) == "table" then
					if slot2 < 20 then
						print(slot4 .. slot8 .. " = ")
						slot0.printTable(slot9, slot1, slot2 + 1)
					else
						print(slot4 .. slot8 .. " = skipped (max deep reached)")
					end
				else
					print(slot4 .. slot8 .. " = " .. tostring(slot9))
				end
			end

			print(slot3 .. "}")
		else
			print(slot3 .. tostring(slot0))
		end
	end
}

if debug == nil then
	slot0.printTable = function ()
		print("debug disabled but used")
	end

	slot0.log = function ()
		print("debug disabled but used")
	end
end

return slot0
