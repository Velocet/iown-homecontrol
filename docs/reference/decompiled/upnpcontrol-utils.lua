slot0 = depends("common", "utils")

({
	template = {},
	addTemplate = function (slot0, slot1)
		slot2 = {
			action = slot0,
			parameters = {}
		}

		if slot1 ~= nil then
			for slot6, slot7 in pairs(slot1) do
				assert(type(slot7) == "string", "wrong type in parameters name")

				slot2.parameters[slot7] = {}
			end
		end

		slot0.template[slot0] = slot2
	end,
	createTemplateCommand = function (slot0, slot1)
		assert(slot0.template[slot0] ~= nil, slot0 .. " is not in the command list")

		slot3 = 0

		for slot7, slot8 in pairs(slot1.deepCopy(slot0.template[slot0]).parameters) do
			slot2.parameters[slot7] = slot1[slot7]
		end

		return slot2
	end,
	getAllPlayingInfo = function ()
		return slot0.template.GetMediaInfo, nil, slot0.template.GetTransportInfo, nil, slot0.template.GetPositionInfo, nil, slot0.template.GetCurrentTransportActions, nil
	end,
	escapeString = function (slot0)
		return string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(slot0, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), "'", "&apos;"), "\"", "&quot;")
	end,
	sonos = {}
})["addTemplate"]("Play")
()["addTemplate"]("Pause")
()["addTemplate"]("Stop")
()["addTemplate"]("Next")
()["addTemplate"]("Previous")
()["addTemplate"]("GetMediaInfo")
()["addTemplate"]("GetTransportInfo")
()["addTemplate"]("GetPositionInfo")
()["addTemplate"]("GetCurrentTransportActions")
()["addTemplate"]("Mute")
()["addTemplate"]("Unmute")
()["addTemplate"]("GetMute")
()["addTemplate"]("SetVolume", {
	"DesiredVolume"
})
()["addTemplate"]("GetVolume")
()["addTemplate"]("MuteGroup")
()["addTemplate"]("UnmuteGroup")
()["addTemplate"]("GetGroupMute")
()["addTemplate"]("SetGroupVolume", {
	"DesiredVolume"
})
()["addTemplate"]("GetGroupVolume")
()["addTemplate"]("Rewind")
()["addTemplate"]("GetSonosFavorites")
()["addTemplate"]("GetSonosPlaylists")
()["addTemplate"]("RemoveAllTracksFromQueue")
()["addTemplate"]("SetAVTransportURI", {
	"CurrentURI",
	"CurrentURIMetaData"
})
()["addTemplate"]("AddURIToQueue", {
	"EnqueuedURI",
	"EnqueuedURIMetaData",
	"DesiredFirstTrackNumberEnqueued",
	"EnqueueAsNext"
})

()["sonos"].playURI = function (slot0, slot1, slot2)
	slot3, slot4 = string.find(slot1, "<upnp:class>")
	slot5, slot6 = string.find(slot1, "</upnp:class>")
	slot7 = string.sub(slot1, slot4 + 1, slot5 - 1)

	if string.match(slot1, "audioItem") then
		return slot0.sonos.streamURI(slot0, slot1)
	elseif string.match(slot1, "container") then
		return slot0.sonos.playPlaylist(slot0, slot1, slot2)
	end
end

()["sonos"].streamURI = function (slot0, slot1)
	slot2 = {
		CurrentURI = slot0:escapeString()
	}

	if slot1 ~= nil then
		slot2.CurrentURIMetaData = slot0.escapeString(slot1)
	else
		slot2.CurrentURIMetaData = ""
	end

	return slot0.createTemplateCommand("SetAVTransportURI", slot2), nil, slot0.template.Play, nil
end

()["sonos"].playPlaylist = function (slot0, slot1, slot2)
	return slot0.template.Stop, nil, slot0.template.RemoveAllTracksFromQueue, nil, slot0.createTemplateCommand("AddURIToQueue", slot3), nil, slot0.sonos.streamURI("x-rincon-queue:" .. string.sub(slot2, 6) .. "#0", nil)
end

return 
