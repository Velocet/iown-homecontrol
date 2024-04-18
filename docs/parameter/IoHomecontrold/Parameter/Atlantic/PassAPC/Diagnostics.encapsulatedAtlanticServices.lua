local var_0_0 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.PassAPC.RefreshUtils")
local var_0_1 = require("Overkiz.HomeAutomation.Protocol.IoHomecontrol.Parameter.Private.Atlantic.atlanticProductFamilyNames")
local var_0_2 = require("Overkiz.Type.ByteArray")
local var_0_3 = {}
local var_0_4 = {
	[100] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 100, var_0_2({
			1,
			1,
			65,
			68,
			24,
			22,
			198,
			39
		}))
	},
	[200] = {
		[var_0_1.PACALFEA] = var_0_0:buildDataWithCorrelationRemapping(415, 200, var_0_2({
			0,
			220,
			180,
			0,
			11,
			6,
			5,
			49,
			5,
			47,
			216,
			58
		}))
	},
	[300] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 300, var_0_2({
			1,
			1,
			65,
			198,
			105,
			91,
			130,
			106
		}))
	},
	[303] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 303, var_0_2({
			1,
			1,
			65,
			135,
			132,
			128,
			223,
			117
		}))
	},
	[304] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 304, var_0_2({
			1,
			1,
			65,
			135,
			132,
			132,
			222,
			182
		}))
	},
	[306] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 306, var_0_2({
			1,
			1,
			65,
			7,
			21,
			19,
			243,
			96
		}))
	},
	[400] = {
		[var_0_1.PACALFEA] = var_0_0:buildDataWithCorrelationRemapping(415, 400, var_0_2({
			0,
			220,
			180,
			0,
			11,
			6,
			5,
			45,
			5,
			30,
			200,
			74
		}))
	},
	[405] = {
		[var_0_1.PACALFEA] = var_0_0:buildDataWithCorrelationRemapping(415, 405, var_0_2({
			0,
			220,
			180,
			0,
			11,
			6,
			5,
			89,
			8,
			151,
			186,
			127
		}))
	},
	[406] = {
		[var_0_1.PACALFEA] = var_0_0:buildDataWithCorrelationRemapping(415, 406, var_0_2({
			0,
			220,
			180,
			0,
			11,
			6,
			5,
			89,
			8,
			155,
			123,
			243
		}))
	},
	[415] = {
		[var_0_1.PACALFEA] = var_0_0:buildDataWithCorrelationRemapping(415, 415, var_0_2({
			0,
			220,
			180,
			0,
			11,
			6,
			5,
			89,
			6,
			197,
			227,
			199
		}))
	},
	[416] = {
		[var_0_1.PACALFEA] = var_0_0:buildDataWithCorrelationRemapping(415, 416, var_0_2({
			0,
			220,
			180,
			0,
			11,
			6,
			5,
			89,
			6,
			192,
			179,
			98
		}))
	},
	[417] = {
		[var_0_1.PACALFEA] = var_0_0:buildDataWithCorrelationRemapping(415, 417, var_0_2({
			0,
			220,
			180,
			0,
			11,
			6,
			5,
			37,
			6,
			195,
			46,
			104
		}))
	},
	[418] = {
		[var_0_1.PACALFEA] = var_0_0:buildDataWithCorrelationRemapping(415, 418, var_0_2({
			0,
			220,
			180,
			0,
			11,
			6,
			5,
			37,
			6,
			190,
			129,
			82
		}))
	},
	[500] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 500, var_0_2({
			1,
			1,
			65,
			198,
			21,
			4,
			226,
			146
		}))
	},
	[501] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 501, var_0_2({
			1,
			1,
			65,
			198,
			21,
			5,
			35,
			82
		}))
	},
	[502] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 502, var_0_2({
			1,
			1,
			65,
			198,
			105,
			84,
			194,
			110
		}))
	},
	[503] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 503, var_0_2({
			1,
			1,
			65,
			198,
			105,
			194,
			66,
			0
		}))
	},
	[510] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 510, var_0_2({
			1,
			1,
			65,
			68,
			17,
			16,
			64,
			117
		}))
	},
	[600] = {
		[var_0_1.PACALFEA] = var_0_0:buildDataWithCorrelationRemapping(415, 600, var_0_2({
			0,
			220,
			180,
			0,
			11,
			6,
			5,
			33,
			6,
			103,
			7,
			198
		}))
	},
	[601] = {
		[var_0_1.PACALFEA] = var_0_0:buildDataWithCorrelationRemapping(415, 601, var_0_2({
			0,
			220,
			180,
			0,
			11,
			6,
			5,
			34,
			6,
			103,
			94,
			150
		}))
	},
	[602] = {
		[var_0_1.PACALFEA] = var_0_0:buildDataWithCorrelationRemapping(415, 602, var_0_2({
			0,
			220,
			180,
			0,
			11,
			6,
			5,
			33,
			5,
			24,
			221,
			237
		}))
	},
	[603] = {
		[var_0_1.PACALFEA] = var_0_0:buildDataWithCorrelationRemapping(415, 603, var_0_2({
			0,
			220,
			180,
			0,
			11,
			6,
			5,
			34,
			5,
			24,
			132,
			189
		}))
	},
	[701] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 701, var_0_2({
			1,
			1,
			65,
			5,
			19,
			39,
			80,
			215
		}))
	},
	[702] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 702, var_0_2({
			1,
			1,
			65,
			5,
			19,
			38,
			145,
			23
		}))
	},
	[703] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 703, var_0_2({
			1,
			1,
			65,
			5,
			19,
			40,
			16,
			211
		}))
	},
	[704] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 704, var_0_2({
			1,
			1,
			65,
			129,
			21,
			3,
			19,
			69
		}))
	},
	[705] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 705, var_0_2({
			1,
			1,
			65,
			5,
			18,
			54,
			145,
			75
		}))
	},
	[706] = {
		[var_0_1.NAIANAEMA] = var_0_0:buildDataWithCorrelationRemapping(415, 706, var_0_2({
			1,
			1,
			65,
			5,
			18,
			53,
			209,
			74
		}))
	},
	[800] = {
		[var_0_1.PACALFEA] = var_0_0:buildDataWithCorrelationRemapping(415, 800, var_0_2({
			0,
			220,
			180,
			0,
			11,
			6,
			5,
			5,
			26,
			200,
			95,
			219
		}))
	}
}

function var_0_3.getEncapsulatedDataForProductFamily(arg_1_0, arg_1_1)
	return var_0_4[arg_1_1][arg_1_0]
end

return var_0_3
