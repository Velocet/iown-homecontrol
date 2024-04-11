return {
	ATSF = "AT$SF=",
	UP = 0,
	DOWN = 1,
	STOP = 2,
	FAVORITE = 3,
	atsf = function (slot0, slot1)
		return slot0.ATSF .. slot0 .. "," .. slot1
	end,
	up = function (slot0)
		return slot0:atsf(slot0.UP)
	end,
	down = function (slot0)
		return slot0:atsf(slot0.DOWN)
	end,
	stop = function (slot0)
		return slot0:atsf(slot0.STOP)
	end,
	favorite = function (slot0)
		return slot0:atsf(slot0.FAVORITE)
	end,
	identify3Cycles = function (slot0, slot1)
		return slot0:up(), nil, slot0:down(), {
			delay = slot1
		}, slot0:up(), {
			delay = slot1 * 2
		}, slot0:down(), {
			delay = slot1 * 3
		}, slot0:up(), {
			delay = slot1 * 4
		}, slot0:down(), {
			delay = slot1 * 5
		}, slot0:stop(), {
			delay = slot1 * 6
		}
	end
}
