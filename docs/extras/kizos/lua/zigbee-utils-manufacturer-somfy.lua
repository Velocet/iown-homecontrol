return {
	SOMFY_ENDPRODUCT_1D_SKYLIGHT = 5,
	SOMFY_ENDPRODUCT_1D_PLEATED_SHADE = 7,
	SOMFY_ENDPRODUCT_2D_EXTERIOR_BLIND_180 = 22,
	SOMFY_ENDPRODUCT_2D_LAYERED_SHADE = 10,
	SOMFY_ENDPRODUCT_1D_LAYERED_SHADE = 9,
	SOMFY_ENDPRODUCT_1D_ROMAN_SHADE = 1,
	SOMFY_ENDPRODUCT_1D_PROJECTION_SCREEN = 6,
	SOMFY_ENDPRODUCT_1D_CENTRAL_CURTAIN = 16,
	SOMFY_ENDPRODUCT_1D_EXTERIOR_SCREEN = 18,
	SOMFY_ENDPRODUCT_1D_BALLOON_SHADE = 2,
	SOMFY_ENDPRODUCT_1D_AWNING = 19,
	SOMFY_ENDPRODUCT_1D_TILT_ONLY_PERGOLA = 21,
	SOMFY_ENDPRODUCT_1D_WOVEN_WOOD = 3,
	SOMFY_ENDPRODUCT_1D_LATERAL_LEFT_CURTAIN = 14,
	SOMFY_ENDPRODUCT_2D_SHEER_SHADE = 11,
	SOMFY_ENDPRODUCT_2D_EXTERIOR_BLIND_90 = 20,
	SOMFY_ENDPRODUCT_2D_INTERIOR_BLIND = 13,
	SOMFY_ENDPRODUCT_1D_TILT_ONLY_INTERIOR_BLIND = 12,
	SOMFY_ENDPRODUCT_1D_ROLLER_SHADE = 0,
	SOMFY_ENDPRODUCT_1D_CELLULAR_SHADE = 8,
	SOMFY_ENDPRODUCT_1D_ROOF_WINDOW = 4,
	SOMFY_ENDPRODUCT_1D_LATERAL_RIGHT_CURTAIN = 15,
	SOMFY_ENDPRODUCT_1D_ROLLER_SHUTTER = 17,
	SubTypeEndProductMapping = {
		[()["SOMFY_ENDPRODUCT_1D_LAYERED_SHADE"]] = 10,
		[()["SOMFY_ENDPRODUCT_2D_LAYERED_SHADE"]] = 11,
		[()["SOMFY_ENDPRODUCT_2D_SHEER_SHADE"]] = 12,
		[()["SOMFY_ENDPRODUCT_1D_TILT_ONLY_INTERIOR_BLIND"]] = 13,
		[()["SOMFY_ENDPRODUCT_1D_ROLLER_SHUTTER"]] = 14,
		[()["SOMFY_ENDPRODUCT_1D_EXTERIOR_SCREEN"]] = 15,
		[()["SOMFY_ENDPRODUCT_1D_AWNING"]] = 16,
		[()["SOMFY_ENDPRODUCT_2D_EXTERIOR_BLIND_90"]] = 17,
		[()["SOMFY_ENDPRODUCT_1D_TILT_ONLY_PERGOLA"]] = 18,
		[()["SOMFY_ENDPRODUCT_2D_EXTERIOR_BLIND_180"]] = 17
	},
	windowCoveringSubTypeId = function (slot0, slot1)
		if slot0.SubTypeEndProductMapping[slot1] then
			return slot0.SubTypeEndProductMapping[slot1]
		end

		return slot0
	end,
	EndProductName = {
		[()["SOMFY_ENDPRODUCT_1D_ROLLER_SHADE"]] = "1DRollerShade",
		[()["SOMFY_ENDPRODUCT_1D_ROMAN_SHADE"]] = "1DRomanShade",
		[()["SOMFY_ENDPRODUCT_1D_BALLOON_SHADE"]] = "1DBalloonShade",
		[()["SOMFY_ENDPRODUCT_1D_WOVEN_WOOD"]] = "1DWovenWood",
		[()["SOMFY_ENDPRODUCT_1D_ROOF_WINDOW"]] = "1DRoofWindow",
		[()["SOMFY_ENDPRODUCT_1D_SKYLIGHT"]] = "1DSkylight",
		[()["SOMFY_ENDPRODUCT_1D_PROJECTION_SCREEN"]] = "1DProjectionScreen",
		[()["SOMFY_ENDPRODUCT_1D_PLEATED_SHADE"]] = "1DPleatedShade",
		[()["SOMFY_ENDPRODUCT_1D_CELLULAR_SHADE"]] = "1DCellularShade",
		[()["SOMFY_ENDPRODUCT_1D_LAYERED_SHADE"]] = "1DLayeredShade",
		[()["SOMFY_ENDPRODUCT_2D_LAYERED_SHADE"]] = "2DLayeredShade",
		[()["SOMFY_ENDPRODUCT_2D_SHEER_SHADE"]] = "2DSheerShade",
		[()["SOMFY_ENDPRODUCT_1D_TILT_ONLY_INTERIOR_BLIND"]] = "TiltOnlyInteriorBlind",
		[()["SOMFY_ENDPRODUCT_2D_INTERIOR_BLIND"]] = "2DInteriorBlind",
		[()["SOMFY_ENDPRODUCT_1D_LATERAL_LEFT_CURTAIN"]] = "1DLateralLeftCurtain",
		[()["SOMFY_ENDPRODUCT_1D_LATERAL_RIGHT_CURTAIN"]] = "1DLateralRightCurtain",
		[()["SOMFY_ENDPRODUCT_1D_CENTRAL_CURTAIN"]] = "1DCentralCurtain",
		[()["SOMFY_ENDPRODUCT_1D_ROLLER_SHUTTER"]] = "1DRollerShutter",
		[()["SOMFY_ENDPRODUCT_1D_EXTERIOR_SCREEN"]] = "1DExteriorScreen",
		[()["SOMFY_ENDPRODUCT_1D_AWNING"]] = "1DAwning",
		[()["SOMFY_ENDPRODUCT_2D_EXTERIOR_BLIND_90"]] = "2DExteriorBlind90",
		[()["SOMFY_ENDPRODUCT_1D_TILT_ONLY_PERGOLA"]] = "TiltOnlyPergola",
		[()["SOMFY_ENDPRODUCT_2D_EXTERIOR_BLIND_180"]] = "2DExteriorBlind180"
	},
	somfyEndProductToString = function (slot0)
		if slot0.EndProductName[tonumber(slot0)] ~= nil then
			return slot1
		end

		return "Unknown"
	end,
	OrientationPhysicalUpperBoundFromSomfyEndProduct = {
		[()["SOMFY_ENDPRODUCT_2D_SHEER_SHADE"]] = 90,
		[()["SOMFY_ENDPRODUCT_1D_TILT_ONLY_INTERIOR_BLIND"]] = 90,
		[()["SOMFY_ENDPRODUCT_2D_INTERIOR_BLIND"]] = 90,
		[()["SOMFY_ENDPRODUCT_2D_EXTERIOR_BLIND_90"]] = 90,
		[()["SOMFY_ENDPRODUCT_2D_EXTERIOR_BLIND_180"]] = 90
	},
	getOrientationPhysicalUpperBoundFromSomfyEndProduct = function (slot0)
		return slot0.OrientationPhysicalUpperBoundFromSomfyEndProduct[tonumber(slot0)]
	end,
	OrientationPhysicalLowerBoundFromSomfyEndProduct = {
		[()["SOMFY_ENDPRODUCT_2D_SHEER_SHADE"]] = 0,
		[()["SOMFY_ENDPRODUCT_1D_TILT_ONLY_INTERIOR_BLIND"]] = -90,
		[()["SOMFY_ENDPRODUCT_2D_INTERIOR_BLIND"]] = -90,
		[()["SOMFY_ENDPRODUCT_2D_EXTERIOR_BLIND_90"]] = 0,
		[()["SOMFY_ENDPRODUCT_2D_EXTERIOR_BLIND_180"]] = -90
	},
	getOrientationPhysicalLowerBoundFromSomfyEndProduct = function (slot0)
		return slot0.OrientationPhysicalLowerBoundFromSomfyEndProduct[tonumber(slot0)]
	end
}
