-- chunkname: @./BinaryUtils.module

local BinaryUtils = {}

function BinaryUtils.cutGarbageAfterFirstZero(b)
	for i = 1, #b do
		if b[i] == 0 then
			b = b:sub(1, i - 1)

			break
		end
	end

	return b
end

function BinaryUtils.filterIso8859Dash1InvalidChars(b)
	for i = 1, #b do
		if b[i] < 32 or b[i] >= 127 and b[i] <= 159 then
			b[i] = 63
		end
	end
end

function BinaryUtils.extractBitRange(data, bitOffset, bitSize)
	if bitSize > 8 then
		error("Unsupported bitSize : " .. bitSize)
	end

	if data == nil or bitOffset >= #data * 8 or bitSize == 0 then
		return 0
	end

	local finalBitSize = math.min(#data * 8 - bitOffset, bitSize)
	local firstByteIdx = math.floor(bitOffset / 8) + 1
	local offsetGap = bitOffset % 8
	local firstByteProcess = bit.lshift(bit.band(data[firstByteIdx], 255), offsetGap)

	firstByteProcess = bit.rshift(bit.band(firstByteProcess, 255), offsetGap)

	if offsetGap + finalBitSize <= 8 then
		return bit.rshift(bit.band(firstByteProcess, 255), 8 - (offsetGap + finalBitSize))
	else
		return bit.bor(bit.rshift(bit.band(data[firstByteIdx + 1], 255), 16 - (offsetGap + finalBitSize)), bit.lshift(bit.band(firstByteProcess, 255), offsetGap + finalBitSize - 8))
	end
end

function BinaryUtils.writeBitRange(data, bitOffset, bitSize, value)
	if bitSize > 8 then
		error("Unsupported bitSize : " .. bitSize)
	end

	if data == nil or bitOffset >= #data * 8 or bitSize <= 0 then
		return
	end

	local finalBitSize = math.min(#data * 8 - bitOffset, bitSize)
	local offsetGap = bitOffset % 8

	if offsetGap + finalBitSize <= 8 then
		local firstByteIdx = math.floor(bitOffset / 8) + 1
		local maskedValue = bit.band(value, bit.lshift(1, finalBitSize) - 1)
		local mask = bit.lshift(maskedValue, 8 - (offsetGap + finalBitSize))
		local v = data[firstByteIdx]

		v = bit.band(v, bit.bnot(bit.lshift(bit.lshift(1, finalBitSize) - 1, 8 - (offsetGap + finalBitSize))))
		data[firstByteIdx] = bit.bor(v, mask)
	else
		writeBitRange(data, bitOffset, 8 - offsetGap, bit.rshift(value, offsetGap + finalBitSize - 8))
		writeBitRange(data, bitOffset + 8 - offsetGap, offsetGap + finalBitSize - 8, value)
	end
end

function BinaryUtils.setBit(data, bitOffset, value)
	if bitOffset >= #data * 8 then
		return
	end

	local firstByteIdx = math.floor(bitOffset / 8) + 1
	local offsetGap = bitOffset % 8
	local mask = bit.lshift(1, 7 - offsetGap)
	local v = data[firstByteIdx]

	if value > 0 then
		v = bit.bor(v, mask)
	else
		v = bit.band(v, bit.bnot(mask))
	end

	data[firstByteIdx] = v
end

return BinaryUtils
