return {
	checkSetNodeDefinitionConsistency = function (slot0, slot1, slot2)
		if slot2 ~= nil and slot1 == nil then
			error("When a definition is defined, a subType must also be defined")
		end

		return {
			type = slot0,
			subType = slot1,
			definition = slot2
		}
	end
}
