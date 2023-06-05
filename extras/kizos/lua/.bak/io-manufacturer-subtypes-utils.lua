return {
	hasStateValue = function (slot0, slot1, slot2)
		return function (slot0, slot1)
			return slot1 ~= nil and slot1["state:" .. slot0 .. ":" .. slot1] ~= nil and slot1["state:" .. slot0 .. ":" .. slot1] == "state:" .. slot0 .. ":" .. slot1
		end
	end,
	isDynamicActuator = function ()
		return function (slot0, slot1)
			return (slot1 ~= nil and slot1["attribute:io:sensorTypesIdentification"] ~= nil) or slot1["attribute:io:parametersManagement"] ~= nil
		end
	end,
	somfyRevisionGreaterThanOrEquals = function (slot0)
		return function (slot0, slot1)
			if #slot0 < 10 then
				return false
			end

			return slot0 <= tonumber(slot2)
		end
	end,
	somfyRevisionLowererThanOrEquals = function (slot0)
		return function (slot0, slot1)
			if #slot0 < 10 then
				return false
			end

			return tonumber(slot2) <= slot0
		end
	end,
	manufacturerSubType = {
		[# + 1] = {
			subProfile = 0,
			class = 1,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5145198???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 1,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 2,
			softwareVersion = bytearray("5153107???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 1,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 2,
			softwareVersion = bytearray("5155003???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 1,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 133,
			softwareVersion = bytearray("5137557???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 1,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 254,
			softwareVersion = bytearray("5151415???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 1,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 254,
			softwareVersion = bytearray("5155011???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5113386???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5113387???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5113388???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5113389???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5113390???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5113391???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5113392???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5113393???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5063303???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5063307???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5120680???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5120725???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5120726???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5120727???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5120728???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5164236???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5164237???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5164238???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5128569???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5128570???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5128571???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5128572???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5128573???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5128574???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 2,
			softwareVersion = bytearray("5120681???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 2,
			softwareVersion = bytearray("5120729???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 2,
			softwareVersion = bytearray("5120730???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 2,
			softwareVersion = bytearray("5120731???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 2,
			softwareVersion = bytearray("5120732???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 2,
			softwareVersion = bytearray("5125936???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 4,
			profile = 2,
			softwareVersion = bytearray("5137459???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 5,
			profile = 2,
			softwareVersion = bytearray("5129486???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 6,
			profile = 2,
			softwareVersion = bytearray("5120877???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 7,
			profile = 2,
			softwareVersion = bytearray("5012597???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 7,
			profile = 2,
			softwareVersion = bytearray("5100394???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 8,
			profile = 2,
			softwareVersion = bytearray("5117737???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 8,
			profile = 2,
			softwareVersion = bytearray("5067346???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 9,
			profile = 2,
			softwareVersion = bytearray("5141146???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 10,
			profile = 2,
			softwareVersion = bytearray("5139319???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 10,
			profile = 2,
			softwareVersion = bytearray("5139320???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 10,
			profile = 2,
			softwareVersion = bytearray("5139321???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 10,
			profile = 2,
			softwareVersion = bytearray("5139322???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 11,
			profile = 2,
			softwareVersion = bytearray("5140201???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 12,
			profile = 2,
			softwareVersion = bytearray("5140200???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 13,
			profile = 2,
			softwareVersion = bytearray("5151297???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 13,
			profile = 2,
			softwareVersion = bytearray("5151298???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 13,
			profile = 2,
			softwareVersion = bytearray("5151299???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 14,
			profile = 2,
			softwareVersion = bytearray("5148350???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 14,
			profile = 2,
			softwareVersion = bytearray("5145654???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 15,
			profile = 2,
			protocolVersion = 4,
			softwareVersion = bytearray("??????????", "utf-8"),
			additionalConstraint = ()["isDynamicActuator"]()
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 2,
			softwareVersion = bytearray("5067206???", "utf-8")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 2,
			softwareVersion = bytearray("5105841???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 3,
			softwareVersion = bytearray("5068815???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 3,
			softwareVersion = bytearray("5125936???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 6,
			profile = 3,
			softwareVersion = bytearray("5137136???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 7,
			profile = 3,
			softwareVersion = bytearray("5052774???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 8,
			profile = 3,
			softwareVersion = bytearray("5071665???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 8,
			profile = 3,
			softwareVersion = bytearray("5164665???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 8,
			profile = 3,
			softwareVersion = bytearray("5066543???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 8,
			profile = 3,
			softwareVersion = bytearray("5104761???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 8,
			profile = 3,
			softwareVersion = bytearray("5164666???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 9,
			profile = 3,
			softwareVersion = bytearray("5111165???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 10,
			profile = 3,
			softwareVersion = bytearray("5121525???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 12,
			profile = 3,
			softwareVersion = bytearray("5156129???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](50570755, 26, "10")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 12,
			profile = 3,
			softwareVersion = bytearray("5156130???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](50570755, 26, "10")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 12,
			profile = 3,
			softwareVersion = bytearray("5156131???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](50570755, 26, "10")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 13,
			profile = 3,
			softwareVersion = bytearray("5156129???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](50570755, 26, "44")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 13,
			profile = 3,
			softwareVersion = bytearray("5156130???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](50570755, 26, "44")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 13,
			profile = 3,
			softwareVersion = bytearray("5156131???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](50570755, 26, "44")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 14,
			profile = 3,
			softwareVersion = bytearray("5156129???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](50570755, 26, "58")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 14,
			profile = 3,
			softwareVersion = bytearray("5156130???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](50570755, 26, "58")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 14,
			profile = 3,
			softwareVersion = bytearray("5156131???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](50570755, 26, "58")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 15,
			profile = 3,
			softwareVersion = bytearray("5156129???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 15,
			profile = 3,
			softwareVersion = bytearray("5156130???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 15,
			profile = 3,
			softwareVersion = bytearray("5156131???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 3,
			softwareVersion = bytearray("??????????", "utf-8"),
			additionalConstraint = ()["hasStateValue"](50505219, 26, "10")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 4,
			profile = 3,
			softwareVersion = bytearray("??????????", "utf-8"),
			additionalConstraint = ()["hasStateValue"](50505219, 26, "58")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 5,
			profile = 3,
			softwareVersion = bytearray("??????????", "utf-8"),
			additionalConstraint = ()["hasStateValue"](50505219, 26, "44")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 11,
			profile = 3,
			softwareVersion = bytearray("5118126???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 4,
			softwareVersion = bytearray("5125936???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 5,
			softwareVersion = bytearray("5134086???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 5,
			softwareVersion = bytearray("5163744???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 5,
			softwareVersion = bytearray("5105491???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 5,
			softwareVersion = bytearray("5153331???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 5,
			softwareVersion = bytearray("5163751???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 4,
			profile = 5,
			softwareVersion = bytearray("5153439???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 4,
			profile = 5,
			softwareVersion = bytearray("5163752???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 5,
			profile = 5,
			softwareVersion = bytearray("5156018???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 5,
			profile = 5,
			softwareVersion = bytearray("5163750???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 6,
			profile = 5,
			softwareVersion = bytearray("5143939???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 6,
			profile = 5,
			softwareVersion = bytearray("5163758???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 6,
			softwareVersion = bytearray("5109156???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 6,
			softwareVersion = bytearray("5143804???", "utf-8")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 6,
			softwareVersion = bytearray("5135418???", "utf-8")
		},
		[# + 1] = {
			subProfile = 2,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 6,
			softwareVersion = bytearray("5135669???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 6,
			softwareVersion = bytearray("5113142???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 6,
			softwareVersion = bytearray("5133033???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 6,
			softwareVersion = bytearray("5154604???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 7,
			softwareVersion = bytearray("5101985F??", "utf-8"),
			additionalConstraint = ()["somfyRevisionGreaterThanOrEquals"](5)
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 7,
			softwareVersion = bytearray("5140784A??", "utf-8"),
			additionalConstraint = ()["somfyRevisionGreaterThanOrEquals"](1)
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 7,
			softwareVersion = bytearray("5102007G??", "utf-8"),
			additionalConstraint = ()["somfyRevisionGreaterThanOrEquals"](6)
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 4,
			profile = 7,
			softwareVersion = bytearray("5112334G??", "utf-8"),
			additionalConstraint = ()["somfyRevisionGreaterThanOrEquals"](6)
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 5,
			profile = 7,
			softwareVersion = bytearray("5107456G??", "utf-8"),
			additionalConstraint = ()["somfyRevisionGreaterThanOrEquals"](5)
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 6,
			profile = 7,
			softwareVersion = bytearray("5134085???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 6,
			profile = 7,
			softwareVersion = bytearray("5163753???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 7,
			profile = 7,
			softwareVersion = bytearray("5153765???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 7,
			profile = 7,
			softwareVersion = bytearray("5163754???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 9,
			softwareVersion = bytearray("5117834???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 10,
			softwareVersion = bytearray("5125936???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 10,
			softwareVersion = bytearray("5134524???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 10,
			softwareVersion = bytearray("5133431???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 4,
			profile = 10,
			softwareVersion = bytearray("5140569???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 5,
			profile = 10,
			softwareVersion = bytearray("5150310???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 15,
			softwareVersion = bytearray("5127170???", "utf-8")
		},
		[# + 1] = {
			subProfile = 2,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 15,
			softwareVersion = bytearray("??????????", "utf-8"),
			additionalConstraint = ()["hasStateValue"](251831811, 26, "onOffSwitch")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 16,
			softwareVersion = bytearray("5131572???", "utf-8")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 16,
			softwareVersion = bytearray("5126234???", "utf-8")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 16,
			softwareVersion = bytearray("5067331???", "utf-8")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 16,
			softwareVersion = bytearray("5104296???", "utf-8")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 16,
			softwareVersion = bytearray("5159347???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 16,
			softwareVersion = bytearray("5125936???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 16,
			softwareVersion = bytearray("5137134???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 16,
			softwareVersion = bytearray("5052774???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 16,
			softwareVersion = bytearray("5071665???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 16,
			softwareVersion = bytearray("5164665???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 16,
			softwareVersion = bytearray("5066543???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 16,
			softwareVersion = bytearray("5104761???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 16,
			softwareVersion = bytearray("5164666???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 4,
			profile = 16,
			softwareVersion = bytearray("5118126???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 5,
			profile = 16,
			softwareVersion = bytearray("5138672???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 17,
			profile = 17,
			softwareVersion = bytearray("5066738???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "2")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 33,
			profile = 17,
			softwareVersion = bytearray("5109538???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "2")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 33,
			profile = 17,
			softwareVersion = bytearray("5111501???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "2")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 33,
			profile = 17,
			softwareVersion = bytearray("5116661???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "2")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 33,
			profile = 17,
			softwareVersion = bytearray("5116659???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "2")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 49,
			profile = 17,
			softwareVersion = bytearray("5128194???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "2")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 49,
			profile = 17,
			softwareVersion = bytearray("5162904???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "2")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 19,
			profile = 17,
			softwareVersion = bytearray("5066738???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "3")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 35,
			profile = 17,
			softwareVersion = bytearray("5109538???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "3")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 35,
			profile = 17,
			softwareVersion = bytearray("5111501???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "3")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 35,
			profile = 17,
			softwareVersion = bytearray("5116661???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "3")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 35,
			profile = 17,
			softwareVersion = bytearray("5116659???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "3")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 51,
			profile = 17,
			softwareVersion = bytearray("5128194???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "3")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 51,
			profile = 17,
			softwareVersion = bytearray("5162904???", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "3")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 3,
			profile = 17,
			softwareVersion = bytearray("??????????", "utf-8"),
			additionalConstraint = ()["hasStateValue"](84059651, 7, "3")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 16,
			profile = 17,
			softwareVersion = bytearray("5066738???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 32,
			profile = 17,
			softwareVersion = bytearray("5109538???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 32,
			profile = 17,
			softwareVersion = bytearray("5111501???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 32,
			profile = 17,
			softwareVersion = bytearray("5116661???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 32,
			profile = 17,
			softwareVersion = bytearray("5116659???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 48,
			profile = 17,
			softwareVersion = bytearray("5128194???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 48,
			profile = 17,
			softwareVersion = bytearray("5162904???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 17,
			softwareVersion = bytearray("5125936???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 19,
			softwareVersion = bytearray("5125936???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 21,
			softwareVersion = bytearray("5132777???", "utf-8")
		},
		[# + 1] = {
			subProfile = 58,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 21,
			softwareVersion = bytearray("5124182???", "utf-8")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 27,
			softwareVersion = bytearray("5137569???", "utf-8")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 27,
			softwareVersion = bytearray("5157590???", "utf-8")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 27,
			softwareVersion = bytearray("5157591???", "utf-8")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 27,
			softwareVersion = bytearray("5157592???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 1,
			profile = 29,
			softwareVersion = bytearray("5133756???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 2,
			manufacturerSubType = 2,
			profile = 29,
			softwareVersion = bytearray("5145655???", "utf-8")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 11,
			manufacturerSubType = 1,
			profile = 0,
			softwareVersion = bytearray("28112012??", "utf-8")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 1,
			profile = 22,
			softwareVersion = bytearray({
				63,
				63,
				63,
				63,
				63,
				63,
				63,
				82,
				0,
				1
			})
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 2,
			profile = 51,
			softwareVersion = bytearray("?686008???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 3,
			profile = 51,
			softwareVersion = bytearray("?722802???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 4,
			profile = 51,
			softwareVersion = bytearray("?722803???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 5,
			profile = 51,
			softwareVersion = bytearray("?722801???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 6,
			profile = 51,
			softwareVersion = bytearray("?751001???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 7,
			profile = 51,
			softwareVersion = bytearray("?752001???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 8,
			profile = 51,
			softwareVersion = bytearray("?754001???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 9,
			profile = 51,
			softwareVersion = bytearray("?722804???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 10,
			profile = 51,
			softwareVersion = bytearray("?668008???", "utf-8")
		},
		[# + 1] = {
			subProfile = 0,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 1,
			profile = 51,
			softwareVersion = bytearray("??????????", "utf-8")
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 1,
			profile = 52,
			softwareVersion = bytearray({
				63,
				63,
				63,
				63,
				63,
				63,
				63,
				33,
				0,
				2
			})
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 2,
			profile = 52,
			softwareVersion = bytearray({
				63,
				63,
				63,
				63,
				63,
				63,
				63,
				36,
				0,
				1
			})
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 3,
			profile = 52,
			softwareVersion = bytearray({
				63,
				63,
				63,
				63,
				63,
				63,
				63,
				36,
				0,
				2
			})
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 4,
			profile = 52,
			softwareVersion = bytearray({
				63,
				63,
				63,
				63,
				63,
				63,
				63,
				38,
				0,
				0
			})
		},
		[# + 1] = {
			subProfile = 1,
			class = 0,
			manufacturer = 12,
			manufacturerSubType = 5,
			profile = 52,
			softwareVersion = bytearray({
				63,
				63,
				63,
				63,
				63,
				63,
				63,
				36,
				0,
				3
			})
		}
	},
	getManufacturerSubTypes = function ()
		return slot0.manufacturerSubType
	end
}
