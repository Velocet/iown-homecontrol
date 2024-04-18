local var_0_0 = {}

var_0_0.name = "DomesticHotWaterProfile"
var_0_0.VERSION_1 = 1
var_0_0.VERSION_2 = 2
var_0_0.VERSION_2_1 = 2.1
var_0_0.VERSION_3 = 3
var_0_0.SOFT_VERSION_ATLANTIC_DHW_V3 = "686008"
var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CV4E = "668008"
var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_AEX = "722802"
var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_MURAL = "722803"
var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CETHI_V4 = "722804"
var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_SPLIT = "722801"
var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_TEC5 = "751001"
var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_FLAT_C2 = "752001"
var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_S4 = "753001"
var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CE_S4 = "754001"

local function var_0_1(arg_1_0)
	return (string.char(arg_1_0.generalinfo[1][2], arg_1_0.generalinfo[1][3], arg_1_0.generalinfo[1][4], arg_1_0.generalinfo[1][5], arg_1_0.generalinfo[1][6], arg_1_0.generalinfo[1][7]))
end

local function var_0_2(arg_2_0)
	local var_2_0 = var_0_0.VERSION_2
	local var_2_1 = var_0_1(arg_2_0)

	if arg_2_0.generalinfo[1] ~= nil then
		if var_2_1 == var_0_0.SOFT_VERSION_ATLANTIC_DHW_V3 then
			var_2_0 = var_0_0.VERSION_3
		elseif var_2_1 == var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_AEX or var_2_1 == var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_MURAL or var_2_1 == var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CETHI_V4 or var_2_1 == var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CV4E or var_2_1 == var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_SPLIT then
			var_2_0 = var_0_0.VERSION_2
		elseif var_2_1 == var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_TEC5 or var_2_1 == var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_FLAT_C2 or var_2_1 == var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_S4 or var_2_1 == var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CE_S4 then
			var_2_0 = var_0_0.VERSION_2_1
		else
			var_2_0 = var_0_0.VERSION_1
		end
	end

	return var_2_0
end

function var_0_0.create(arg_3_0, arg_3_1)
	local var_3_0 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Node.nodeModel")
	local var_3_1 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter10")
	local var_3_2 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter15")
	local var_3_3 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.FunctionalParameter16")
	local var_3_4 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.MainParameter")
	local var_3_5 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.AliasTargetOnMP")
	local var_3_6 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DefaultValueMin")
	local var_3_7 = require("Overkiz.HomeAutomation.Shared.IoHomecontrolOvp.Parameter.Public.DefaultValueMax")
	local var_3_8 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.Absence")
	local var_3_9 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.AntiLegionnelle")
	local var_3_10 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.AppointElectrique")
	local var_3_11 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.BoostAvailable")
	local var_3_12 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.Capacite")
	local var_3_13 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.CommandeBuzzer")
	local var_3_14 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.CompteurFiltre")
	local var_3_15 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.ConfigurationHybride")
	local var_3_16 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.ConfigurationSerpentin")
	local var_3_17 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.Consommation")
	local var_3_18 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.ControlMode")
	local var_3_19 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.ControlShowerNumberRequest")
	local var_3_20 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.ControlWaterTemperatureRequest")
	local var_3_21 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.CreneauxProg")
	local var_3_22 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.DataModel")
	local var_3_23 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.DateHeureEcs")
	local var_3_24 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.DeviceIdentificationN0")
	local var_3_25 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.DeviceIdentificationN1")
	local var_3_26 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.DeviceIdentificationN2")
	local var_3_27 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.DureeFonctionnementPacEtElec")
	local var_3_28 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.Erreurs")
	local var_3_29 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.EtatCommunicationInverter")
	local var_3_30 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.EtatsActionneurs")
	local var_3_31 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.EtatsEntrees")
	local var_3_32 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.EtatVentilation")
	local var_3_33 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.Extraction")
	local var_3_34 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.FamilyProductDefinition")
	local var_3_35 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.Gainage")
	local var_3_36 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.HeatingStatus")
	local var_3_37 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.InputTankWaterTemperature")
	local var_3_38 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.Installation")
	local var_3_39 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.InstallationChaudiere")
	local var_3_40 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.ManualModeShowerTemperature")
	local var_3_41 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.ManualModeWaterTemperature")
	local var_3_42 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.MarqueProduit")
	local var_3_43 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.Mode")
	local var_3_44 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.ModeAbsenceRequest")
	local var_3_45 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.ModeBoost")
	local var_3_46 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.ModeBoostRequest")
	local var_3_47 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.ModeRegulation")
	local var_3_48 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.NbElectronicDevice")
	local var_3_49 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.NombreCuve")
	local var_3_50 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.NrjFan")
	local var_3_51 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.NumeroSoft")
	local var_3_52 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.OffsetFanRequest")
	local var_3_53 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.OptionBoucleRecirculation")
	local var_3_54 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.PlageFonctionnement")
	local var_3_55 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.PowerElecTotal")
	local var_3_56 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.PowerHeatElec")
	local var_3_57 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.PowerHeatElecBoost")
	local var_3_58 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.PowerHeatElecIn")
	local var_3_59 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.PowerHeatPump")
	local var_3_60 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.ProgrammationAvailable")
	local var_3_61 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.QuantiteEauChaude")
	local var_3_62 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.RatioFiltre")
	local var_3_63 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.RemainingNumberOfShower")
	local var_3_64 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.SmartGrid")
	local var_3_65 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.SondeAirEntrant")
	local var_3_66 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.SondeEauChaude1")
	local var_3_67 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.SondeEauChaude2")
	local var_3_68 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.SondeEauChaude3")
	local var_3_69 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.SondeEvaporateurBas")
	local var_3_70 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.SondeEvaporateurHaut")
	local var_3_71 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.SondeRefoulementCompresseur")
	local var_3_72 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.TemperatureCompresseur")
	local var_3_73 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.TimeSlotExternal")
	local var_3_74 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.TiRunTotal")
	local var_3_75 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.UserNumberOfShowerRequest")
	local var_3_76 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.UserWaterTemperatureRequest")
	local var_3_77 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.ECS.V40ConsumEst")
	local var_3_78 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.factory")
	local var_3_79 = {
		{
			value = var_3_45,
			atlanticVersion = {
				var_0_0.VERSION_1,
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_28,
			atlanticVersion = {
				var_0_0.VERSION_1,
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_27,
			atlanticVersion = {
				var_0_0.VERSION_1,
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_17,
			atlanticVersion = {
				var_0_0.VERSION_1,
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_8,
			atlanticVersion = {
				var_0_0.VERSION_1,
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_43,
			atlanticVersion = {
				var_0_0.VERSION_1,
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_42,
			atlanticVersion = {
				var_0_0.VERSION_1,
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_23,
			atlanticVersion = {
				var_0_0.VERSION_1,
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_61,
			atlanticVersion = {
				var_0_0.VERSION_1,
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_6,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_7,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_12,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_9,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_10,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_21,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_54,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_18,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_30,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_31,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_47,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_66,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_74,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_55,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_56,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_59,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_11,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_19,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_20,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_36,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_37,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_40,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_41,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_49,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_51,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_57,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_58,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_63,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_75,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_76,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_68,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_44,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_46,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_48,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_60,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_73,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_26,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_25,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_24,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_22,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_13,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_34,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_38,
			atlanticVersion = {
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_39,
			atlanticVersion = {
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_33,
			atlanticVersion = {
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_53,
			atlanticVersion = {
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_15,
			atlanticVersion = {
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_16,
			atlanticVersion = {
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_65,
			atlanticVersion = {
				var_0_0.VERSION_2,
				var_0_0.VERSION_3
			}
		},
		{
			value = var_3_35,
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V3,
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_MURAL,
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CETHI_V4,
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CV4E
			}
		},
		{
			value = var_3_64,
			atlanticVersion = {
				var_0_0.VERSION_3
			},
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_MURAL,
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CETHI_V4,
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CV4E,
				var_0_0.VERSION_2_1
			}
		},
		{
			value = var_3_67,
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_SPLIT
			}
		},
		{
			value = var_3_69,
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_AEX
			}
		},
		{
			value = var_3_52,
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_AEX
			}
		},
		{
			value = var_3_50,
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_AEX
			}
		},
		{
			value = var_3_72,
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_AEX
			}
		},
		{
			value = var_3_14,
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_AEX
			}
		},
		{
			value = var_3_62,
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_AEX
			}
		},
		{
			value = var_3_32,
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_AEX
			}
		},
		{
			value = var_3_29,
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_AEX
			}
		},
		{
			value = var_3_70,
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_AEX,
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_MURAL,
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CETHI_V4,
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CV4E,
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V3
			}
		},
		{
			value = var_3_71,
			atlanticVersion = {
				var_0_0.VERSION_3
			},
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_AEX
			}
		},
		{
			value = var_3_77,
			atlanticVersion = {
				var_0_0.VERSION_2_1
			},
			softwareVersion = {
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_MURAL,
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CETHI_V4,
				var_0_0.SOFT_VERSION_ATLANTIC_DHW_V2_CV4E
			}
		}
	}

	if arg_3_0.manufacturer == var_3_0.manufacturers.Atlantic then
		local var_3_80 = var_0_2(arg_3_0)
		local var_3_81 = var_0_1(arg_3_0)

		for iter_3_0, iter_3_1 in ipairs(var_3_79) do
			local var_3_82 = false

			if iter_3_1.atlanticVersion then
				for iter_3_2, iter_3_3 in ipairs(iter_3_1.atlanticVersion) do
					if iter_3_3 == var_3_80 then
						var_3_78:create(iter_3_1.value, arg_3_0)

						var_3_82 = true

						break
					end
				end
			end

			if not var_3_82 and iter_3_1.softwareVersion then
				for iter_3_4, iter_3_5 in ipairs(iter_3_1.softwareVersion) do
					if iter_3_5 == var_3_81 then
						var_3_78:create(iter_3_1.value, arg_3_0)

						break
					end
				end
			end
		end
	else
		var_3_78:create(var_3_6, arg_3_0)
		var_3_78:create(var_3_7, arg_3_0)
	end

	var_3_78:create(var_3_4, arg_3_0)
	var_3_78:create(var_3_5, arg_3_0)
	var_3_78:create(var_3_1, arg_3_0, var_3_1.discreteRefresh)
	var_3_78:create(var_3_2, arg_3_0)
	var_3_78:create(var_3_3, arg_3_0)
end

return var_0_0
