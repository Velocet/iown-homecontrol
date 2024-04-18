local nodeModel              = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
local ParameterFactory       = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
local oemParamsFactory       = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Factory.manufacturerParametersFactory")
local log                    = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.log")
local ParamsPrvSfyConst      = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy.constants")
local utilities              = require("Overkiz.utilities")
local plList                 = require("pl.List")
local ParametersPrivateSomfy = {}
local weekdays               = {Saturday = 6,Wednesday = 3,Thursday = 4,Sunday = 7,Monday = 1,Tuesday = 2,Friday = 5}
local hours                  = {randomRange = 360,hour = 0,weekday = weekdays.everyday}
local RecurrenceDate         = {weekday     = weekdays.Monday,hour = hours.hour,randomRange = hours.randomRange}
local RecurrenceDateMonth    = {monthday    = 15,hour = hours.hour,randomRange = hours.randomRange}
local randomRange20          = {randomRange = 20}
local randomRange0           = {randomRange = 0}
local SERVEGO                = {SERVEGO     = "serv-e-go"}

-- Template: ["0xnnnn"] = {parameter = n, name = "...", data = {n,n,n}, refresh = {technical = {"serv-e-go"},onDelayedStart = randomRange20}},
ParametersPrivateSomfy.objects = {
["0x0000"] = {parameter = 5, name = "List of objects arrays managed", data = { 2,   0,  0}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0x1000"] = {parameter = 5, name = "Hardware platform",              data = { 2,  16,  0}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0x6100"] = {parameter = 5, name = "Product Identification",         data = { 2,  97,  0}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0x6101"] = {parameter = 5, name = "General information",            data = { 2,  97,  1}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0x6102"] = {parameter = 5, name = "Memory dump",                    data = { 2,   7,  2}, refresh = {technical = {SERVEGO.SERVEGO}}},
["0x6103"] = {parameter = 5, name = "Two way configuration data",     data = { 2,  97,  3}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0x6104"] = {parameter = 5, name = "Settings",                       data = { 2,  97,  4}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0x6105"] = {parameter = 5, name = "Advanced feedback",              data = { 2,  97,  5}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0x8001"] = {parameter = 5, name = "Software version",               data = { 0, 128,  1}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0x8002"] = {parameter = 5, name = "General Info 2",                 data = { 0, 128,  2}, refresh = {technical = {SERVEGO.SERVEGO}}},
["0x8003"] = {parameter = 5, name = "Name",                           data = { 0, 128,  3}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0x8101"] = {parameter = 5, name = "Gate type",                      data = { 0, 129,  1}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},

["0xA100"] = {parameter = 8, name = "Operating mode", data = { 2, 161, 0}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA101"] = {parameter = 8, name = "Total control timed closing", data = { 2, 161, 1}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA102"] = {parameter = 8, name = "Pedestrian control operating mode", data = { 2, 161, 2}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA103"] = {parameter = 8, name = "Pedestrian control short timed mode", data = { 2, 161, 3}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA104"] = {parameter = 8, name = "Pedestrian control long timed mode", data = { 2, 161, 4}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA105"] = {parameter = 8, name = "Orange light warning", data = { 2, 161, 5}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA106"] = {parameter = 8, name = "Closing speed", data = { 2, 161, 6}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA107"] = {parameter = 8, name = "Opening speed", data = { 2, 161, 7}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA108"] = {parameter = 8, name = "Closing slowdown zone", data = { 2, 161, 8}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA109"] = {parameter = 8, name = "Opening slowdown zone", data = { 2, 161, 9}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA10A"] = {parameter = 8, name = "Motor1/Motor2 offset when closing", data = { 2, 161, 10}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA10B"] = {parameter = 8, name = "Motor1/Motor2 offset when opening", data = { 2, 161, 11}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA10C"] = {parameter = 8, name = "Motor1 closing torque", data = { 2, 161, 12}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA10D"] = {parameter = 8, name = "Motor1 opening torque", data = { 2, 161, 13}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA10E"] = {parameter = 8, name = "Motor1 closing slowdown torque", data = { 2, 161, 14}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA10F"] = {parameter = 8, name = "Motor1 opening slowdown torque limitation", data = { 2, 161, 15}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA110"] = {parameter = 8, name = "Motor2 closing torque", data = { 2, 161, 16}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA111"] = {parameter = 8, name = "Motor2 opening torque", data = { 2, 161, 17}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA112"] = {parameter = 8, name = "Motor2 closing slowdown torque", data = { 2, 161, 18}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA113"] = {parameter = 8, name = "Motor2 opening slowdown torque", data = { 2, 161, 19}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA114"] = {parameter = 8, name = "Id of motor direction", data = { 2, 161, 20}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA116"] = {parameter = 8, name = "Obstacle detection sensivity", data = { 2, 161, 22}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA117"] = {parameter = 8, name = "Photocells activation", data = { 2, 161, 23}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA118"] = {parameter = 8, name = "Safety edge activation", data = { 2, 161, 24}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA119"] = {parameter = 8, name = "Programmable activation", data = { 2, 161, 25}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA11A"] = {parameter = 8, name = "Programmable safety input - Functionning", data = { 2, 161, 26}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA11B"] = {parameter = 8, name = "Programmable safety input - Action", data = { 2, 161, 27}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA11C"] = {parameter = 8, name = "Wired control inputs mode", data = { 2, 161, 28}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA11D"] = {parameter = 8, name = "Lighting area output", data = { 2, 161, 29}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA11E"] = {parameter = 8, name = "Lighting area time delay", data = { 2, 161, 30}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA11F"] = {parameter = 8, name = "Auxiliary output", data = { 2, 161, 31}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA120"] = {parameter = 8, name = "Auxiliary output time delay", data = { 2, 161, 32}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA121"] = {parameter = 8, name = "Electric lock output", data = { 2, 161, 33}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA122"] = {parameter = 8, name = "Gate type", data = { 2, 161, 34}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA124"] = {parameter = 8, name = "Additional thrust when closing", data = { 2, 161, 36}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA126"] = {parameter = 8, name = "Pedestrian opening position", data = { 2, 161, 38}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA129"] = {parameter = 8, name = "Product programming interface", data = { 2, 161, 41}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA12B"] = {parameter = 8, name = "Closing slowdown speed", data = { 2, 161, 43}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA12C"] = {parameter = 8, name = "Opening slowdown speed", data = { 2, 161, 44}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA132"] = {parameter = 8, name = "Id of action control", data = { 2, 161, 50}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA133"] = {parameter = 8, name = "Id of Intermediary position", data = { 2, 161, 51}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA134"] = {parameter = 8, name = "Timed closing", data = { 2, 161, 52}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA137"] = {parameter = 8, name = "Id of Pop position", data = { 2, 161, 55}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA138"] = {parameter = 8, name = "Id of Access Actuator location of current position", data = { 2, 161, 56}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA12A"] = {parameter = 8, name = "Anti-trapping activaction", data = { 2, 161, 42}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA203"] = {parameter = 8, name = "Safety Edge - Type", data = { 2, 162, 3}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA205"] = {parameter = 8, name = "Motor travel length mm", data = { 2, 162, 5}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA223"] = {parameter = 8, name = "Aditional thrust when closing", data = { 2, 162, 35}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA224"] = {parameter = 8, name = "Photocells latest autotest status", data = { 2, 162, 36}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA226"] = {parameter = 8, name = "Product setting status", data = { 2, 162, 38}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA227"] = {parameter = 8, name = "Active power supply", data = { 2, 162, 39}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA228"] = {parameter = 8, name = "Wired total control input status", data = { 2, 162, 40}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA229"] = {parameter = 8, name = "Wired pedestrian control input status", data = { 2, 162, 41}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA22A"] = {parameter = 8, name = "Photocells input status", data = { 2, 162, 42}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA22B"] = {parameter = 8, name = "Safety edge input status", data = { 2, 162, 43}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA22C"] = {parameter = 8, name = "Wicket door safety input status", data = { 2, 162, 44}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA232"] = {parameter = 8, name = "Garage door type", data = { 2, 162, 50}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA233"] = {parameter = 8, name = "Photocells latest autotest status", data = { 2, 162, 51}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA234"] = {parameter = 8, name = "Latest programmable autotest status", data = { 2, 162, 52}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA235"] = {parameter = 8, name = "Software version", data = { 2, 162, 53}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA236"] = {parameter = 8, name = "Technical reference", data = { 2, 162, 54}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA237"] = {parameter = 8, name = "Number of RTX 1W remote", data = { 2, 162, 55}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA238"] = {parameter = 8, name = "Id of industrialisation of manufacturing date", data = { 2, 162, 56}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA239"] = {parameter = 8, name = "Commercial name", data = { 2, 162, 57}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA23A"] = {parameter = 8, name = "Technical product", data = { 2, 162, 58}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA23C"] = {parameter = 8, name = "Daughter board sofware version", data = { 2, 162, 60}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA23D"] = {parameter = 8, name = "Daughter board hardware version", data = { 2, 162, 61}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA23E"] = {parameter = 8, name = "Hardware version", data = { 2, 162, 62}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA246"] = {parameter = 8, name = "Safety edge latest autotest status", data = { 2, 162, 70}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA247"] = {parameter = 8, name = "Wicket door safety input latest autotest status", data = { 2, 162, 71}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA249"] = {parameter = 8, name = "24v power supply for accessories", data = { 2, 162, 73}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA24A"] = {parameter = 8, name = "Last results on fall autotests", data = { 2, 162, 74}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA318"] = {parameter = 8, name = "Number of local orders", data = { 2, 163, 24}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA319"] = {parameter = 8, name = "Number of remote orders", data = { 2, 163, 25}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA328"] = {parameter = 8, name = "fall prevention input state", data = { 2, 163, 40}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA332"] = {parameter = 8, name = "Public event list", data = { 2, 163, 50}, refresh = {technical = {SERVEGO.SERVEGO}}},
["0xA400"] = {parameter = 8, name = "Total number of cycles", data = { 2, 164, 0}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA401"] = {parameter = 8, name = "Number of cycles for pedestrian control", data = { 2, 164, 1}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA402"] = {parameter = 8, name = "Number of cycles since latest self learning", data = { 2, 164, 2}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA403"] = {parameter = 8, name = "Number of global rescaling", data = { 2, 164, 3}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA404"] = {parameter = 8, name = "Number of global obstacle detections", data = { 2, 164, 4}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA405"] = {parameter = 8, name = "Number of obstacle detections in opening", data = { 2, 164, 5}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA406"] = {parameter = 8, name = "Number of obstacle detections in closing", data = { 2, 164, 6}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA407"] = {parameter = 8, name = "Number of obstacle dectections since latest self learning", data = { 2, 164, 7}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA409"] = {parameter = 8, name = "List of last 10 defaults", data = { 2, 164, 9}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA40E"] = {parameter = 8, name = "Id of RTX info request", data = { 2, 164, 14}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA40F"] = {parameter = 8, name = "Number of 1w remote controls paired to lighting", data = { 2, 164, 15}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA410"] = {parameter = 8, name = "Number of 1w remote controls paired to auxiliary", data = { 2, 164, 16}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA411"] = {parameter = 8, name = "Number of 1w remote controls paired to auxiliary output", data = { 2, 164, 17}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA416"] = {parameter = 8, name = "Number of remote orders for motor 3S", data = { 2, 164, 22}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA417"] = {parameter = 8, name = "Number of remote orders for light and auxiliary 3S", data = { 2, 164, 23}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA418"] = {parameter = 8, name = "Number of obstacle detections", data = { 2, 164, 24}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA419"] = {parameter = 8, name = "Number of obstacle dectections since latest learning", data = { 2, 164, 25}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA41C"] = {parameter = 8, name = "Total number of cycles", data = { 2, 164, 28}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA41D"] = {parameter = 8, name = "Number of cycles for pedestrian control", data = { 2, 164, 29}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA41E"] = {parameter = 8, name = "Number of cycles since latest self learning", data = { 2, 164, 30}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA41F"] = {parameter = 8, name = "Number of global rescaling for 3S", data = { 2, 164, 31}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},

["0xA44D"] = {parameter = 8, name = "Number of 1w remote controls paired to motor for total control", data = { 2, 164, 77}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA44E"] = {parameter = 8, name = "Number of 1w remote controls paired to motor for pedestrian control", data = { 2, 164, 78}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA450"] = {parameter = 8, name = "Id system key 2 stored", data = { 2, 164, 80}, refresh = {technical = {SERVEGO.SERVEGO}}},
["0xA451"] = {parameter = 8, name = "Name", data = { 2, 164, 81}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},

["0xA503"] = {parameter = 8, name = "Reset historical counters", data = { 2, 165, 3}, refresh = {technical = {SERVEGO.SERVEGO}}},
["0xA504"] = {parameter = 8, name = "Go into Factory mode",      data = { 2, 165, 4}, refresh = {technical = {SERVEGO.SERVEGO}}},
["0xA600"] = {parameter = 8, name = "1W transmitter address",    data = { 2, 166, 0}, refresh = {technical = {SERVEGO.SERVEGO}}},

["0xA601"] = {parameter = 5, name = "Power Line measurement", data = { 2, 166, 1}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA602"] = {parameter = 5, name = "Statistics data", data = { 2, 166, 2}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA603"] = {parameter = 5, name = "Product setting data", data = { 2, 166, 3}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA604"] = {parameter = 5, name = "Profile io", data = { 2, 166, 4}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA606"] = {parameter = 5, name = "Operating temperature data", data = { 2, 166, 6}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA607"] = {parameter = 5, name = "One way pairing data", data = { 2, 166, 7}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence   = hours}},
["0xA608"] = {parameter = 5, name = "", data = { 2, 166, 8}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA609"] = {parameter = 5, name = "Travel control Positions", data = { 2, 166, 9}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence   = hours}},
["0xA60A"] = {parameter = 5, name = "End limit detection", data = { 2, 166, 10}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA60B"] = {parameter = 5, name = "Position Adjustement", data = { 2, 166, 11}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA60C"] = {parameter = 5, name = "10 lines of 16 char", data = {2,166,12,0,0,0,163}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence   = hours}},
["0xA60D"] = {parameter = 5, name = "number of paired masters 1W", data = { 2, 166, 13}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA60E"] = {parameter = 5, name = "Sensors settings", data = { 2, 166, 14}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA60F"] = {parameter = 5, name = "Reset statistic informations", data = { 2, 166, 15}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA610"] = {parameter = 5, name = "OEM initial settings", data = { 2, 166, 16}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA612"] = {parameter = 5, name = "Actuator P&P current mode", data = { 2, 166, 18}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence = RecurrenceDate}},
["0xA613"] = {parameter = 5, name = "Last Events", data = { 2, 166, 19}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20,onRecurrence   = hours}},
["0xA614"] = {parameter = 5, name = "Production Info", data = { 2, 166, 20}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange0}},
["0xA615"] = {parameter = 5, name = "OEM tracability", data = { 2, 166, 21}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange0}},
["0xA617"] = {parameter = 5, name = "Speed management", data = { 2, 166, 23}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA618"] = {parameter = 5, name = "Back to Factory Mode Informations", data = { 2, 166, 24}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xA619"] = {parameter = 5, name = "Torque Curves", data = { 2, 166, 25}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA61A"] = {parameter = 5, name = "Product life history", data = { 2, 166, 26}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA61B"] = {parameter = 5, name = "Number of hard/soft obstacles motorisations", data = { 2, 166, 27}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xA61C"] = {parameter = 5, name = "Sliding window motorisation", data = { 2, 166, 28}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},

["0xB000"] = {parameter = 5, name = "Window static description", data = { 2, 176, 0}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange0,onRecurrence = RecurrenceDateMonth}},
["0xB001"] = {parameter = 5, name = "Window dynamic description", data = { 2, 176, 1}, refresh = {technical = {SERVEGO.SERVEGO},onRecurrence   = hours}},
["0xB002"] = {parameter = 5, name = "Horizontal rotation direction", data = { 2, 176, 2}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange0}},

["0xFFFD"] = {parameter = 5, name = "DEBUG", data = { 2, 255, 253}, refresh = {technical = {SERVEGO.SERVEGO},onDelayedStart = randomRange20}},
["0xFFFF"] = {parameter = 5, name = "Data from PDG structure",data = { 2, 255, 255},refresh = {technical = {SERVEGO.SERVEGO}}}
}

local function GetIndex(arg1, arg2)
	if #arg2 == #arg1 then
		for i=1, #arg2 do
			    if arg2[i] < arg1:byte(i) then return true
			elseif arg2[i] > arg1:byte(i) then return false
			end
		end
	end
	return false
end

function ParametersPrivateSomfy.createFactoryParameters(FactoryParameters)
	local Profile = tostring(nodeModel.getProfile(FactoryParameters))
	local SoftwareVersion = plList(utilities.tableExtract(FactoryParameters.generalinfo[1],1,7)):map(string.char):join()
	local SoftwareIndex =          utilities.tableExtract(FactoryParameters.generalinfo[1],8,3)
	local "Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy." = "Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy."

  local function GetNodeClass(argNodeClass)
		if     argNodeClass == nodeModel.class.ACTUATOR then return "Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy." .. "C0."
		elseif argNodeClass == nodeModel.class.SENSOR   then return "Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Somfy." .. "C1."
    else error("node class " .. tostring(argNodeClass) .. "isn't handled") end
	end

	local NodeClassValue, NodeProfile = pcall(require, GetNodeClass(FactoryParameters.class) .. Profile)

  if NodeClassValue then
		local NodeParameters = NodeProfile[SoftwareVersion]
		if NodeParameters then
			if NodeParameters.index then
				if not SoftwareIndex or not next(SoftwareIndex) then log:error("Factory: Index nil or empty for this device with software version (" .. SoftwareVersion .. "). Index registered for serv-e-go: " .. NodeParameters.index) return false end
				if GetIndex(NodeParameters.index, SoftwareIndex) then log:info("Factory: Found an index: " .. NodeParameters.index .. ". It should be greater than " .. plList(SoftwareIndex):map(string.char):join() .. " to support this device in serv-e-go.") return false end
			end
			local oemParams = oemParamsFactory:create(NodeParameters)
			if oemParams then
				for i, j in pairs(oemParams) do
					log:info("Factory : Create object parameter " .. string.format("0x%02X", j.id) .. "(" .. j.id .. ")-'" .. j.name .. "' for node " .. FactoryParameters.address)
					ParameterFactory:create(utilities.tableDeepCopy(j), FactoryParameters)
				end
			end
			return true
		else log:warning("Factory: unknown software version (" .. SoftwareVersion .. ") for device profile " .. Profile .. ".")
		end
	end
	return false
end
return ParametersPrivateSomfy
