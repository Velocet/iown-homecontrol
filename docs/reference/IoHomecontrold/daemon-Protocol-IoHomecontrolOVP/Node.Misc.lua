local var_0_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local var_0_1 = require("Overkiz.Log")()
local var_0_2 = {}
local var_0_3 = {
	"done",
	"paired",
	"discovered",
	"discover",
	"destroyed",
	"generalInfo1GotStatus",
	"generalInfo2GotStatus",
	"existingNode",
	"intermediateUnpaired",
	"unavailable",
	"partial",
	"unpaired"
}
local var_0_4 = {
	paired = 2,
	generalInfo1GotStatus = 6,
	destroyed = 5,
	existingNode = 8,
	unavailable = 10,
	intermediateUnpaired = 9,
	partial = 11,
	generalInfo2GotStatus = 7,
	discovered = 3,
	unpaired = 12,
	discover = 4,
	done = 1
}

function var_0_2.statusToVerbose(arg_1_0)
	return var_0_3[arg_1_0]
end

function var_0_2.statusToNumber(arg_2_0)
	return var_0_4[arg_2_0]
end

function var_0_2.isIntermediateStatus(arg_3_0)
	if arg_3_0 == var_0_0.status.Intermediate_Discover or arg_3_0 == var_0_0.status.Intermediate_Discovered or arg_3_0 == var_0_0.status.Intermediate_Paired or arg_3_0 == var_0_0.status.Intermediate_Unpaired or arg_3_0 == var_0_0.status.Intermediate_GeneralInfo1Got or arg_3_0 == var_0_0.status.Intermediate_GeneralInfo2Got then
		return true
	end

	return false
end

function var_0_2.isValidStatusTransition(arg_4_0, arg_4_1)
	if var_0_2.isIntermediateStatus(arg_4_0) then
		if var_0_2.isIntermediateStatus(arg_4_1) or arg_4_1 == var_0_0.status.Done or arg_4_1 == var_0_0.status.Partial or arg_4_1 == var_0_0.status.Unpaired then
			return true
		end
	elseif var_0_2.isIntermediateStatus(arg_4_1) == false then
		return true
	end

	return false
end

function var_0_2.checkNodeStatusTransition(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.status ~= arg_5_1.status

	if var_0_2.isValidStatusTransition(arg_5_0.status, arg_5_1.status) then
		return true, var_5_0
	else
		var_0_1:warning("[nodeUtils] invalid status transition detected from " .. var_0_2.statusToVerbose(arg_5_0.status) .. " to " .. var_0_2.statusToVerbose(arg_5_1.status) .. " on " .. tostring(arg_5_1.address))
	end

	return false, var_5_0
end

function var_0_2.nodeCanBeUpdated(arg_6_0, arg_6_1, arg_6_2)
	for iter_6_0, iter_6_1 in ipairs(arg_6_2) do
		if arg_6_0[iter_6_1] ~= arg_6_1[iter_6_1] then
			var_0_1:warning("[Misc][nodeCanBeUpdated][" .. iter_6_1 .. "] is different: " .. tostring(arg_6_0[iter_6_1]) .. "/" .. tostring(arg_6_1[iter_6_1]))

			return false
		end
	end

	return true
end

return var_0_2
