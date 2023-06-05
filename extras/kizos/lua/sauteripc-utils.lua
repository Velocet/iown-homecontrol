return {
	refreshInstallation = function ()
		slot0 = "<body><version>1.2</version><client>COMAP-Biofloor</client><client_ver>1.0.0</client_ver><file_name>V_Main</file_name><action>Read</action><item_list><i><n>totalNumberOfDevices</n></i><i><n>R0.HeatCool</n></i><i><n>R0.OutTemp</n></i><i><n>R0.Alarm1</n></i><i><n>R0.Taupunkt</n></i><i><n>R0.Safety</n></i><i><n>R0.SystemStatus</n></i><i><n>CD.uname</n></i><i><n>isMaster</n></i><i><n>CD.upass</n></i><i><n>R0.Alarm1</n></i>"

		for slot4 = 0, 2, 1 do
			for slot8 = 0, 19, 1 do
				slot0 = slot0 .. "<i><n>R" .. slot4 .. ".G" .. slot8 .. ".RaumTemp</n></i>" .. "<i><n>R" .. slot4 .. ".G" .. slot8 .. ".name</n></i>" .. "<i><n>R" .. slot4 .. ".G" .. slot8 .. ".OPMode</n></i>" .. "<i><n>R" .. slot4 .. ".G" .. slot8 .. ".WeekProg</n></i>" .. "<i><n>R" .. slot4 .. ".G" .. slot8 .. ".kurzID</n></i>"
			end
		end

		return slot0 .. "</item_list></body>"
	end,
	getThermalConfigurationModeToNumber = function (slot0)
		if slot0 == nil then
			return nil
		end

		if slot0 == "heating" then
			return "${deviceId}.HeatCool=" .. 0
		elseif slot0 == "cooling" then
			return "${deviceId}.HeatCool=" .. 1
		else
			return nil
		end
	end,
	getThermalConfigurationModeToSring = function (slot0)
		if slot0 == nil then
			return nil
		end

		if slot0 == 0 then
			return "heating"
		elseif slot0 == 1 then
			return "cooling"
		else
			return nil
		end
	end,
	systemStatusTypes = {
		[0] = "noChange",
		"pairingChange",
		"paratmeterUpdated",
		"breakRadio",
		"dataNotValid"
	},
	operatingMode = {
		[0] = "normal",
		"eco",
		"antifreeze"
	},
	alarmMode = {
		[0] = "ok",
		"overTemperature",
		"dewPoint",
		"breakRadio"
	},
	getOperatingModeToNumber = function (slot0)
		if slot0 == nil then
			return nil
		end

		if slot0 == "normal" then
			return 0
		elseif slot0 == "eco" then
			return 1
		elseif slot0 == "antifreeze" then
			return 2
		else
			return nil
		end
	end
}
