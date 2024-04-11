return 
-- Decompilation error in this vicinity:
depends("RTx-utils")({
	setProtocolSpecificCommandParameters = function (slot0)
		slot0.type = "vendor"
		slot0.vendorid = 128 + slot0.command + 4
		slot0.command = 15
	end
})
