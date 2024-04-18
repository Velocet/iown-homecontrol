return {
	defaultRailDinAllowedTransitions = {
		connected = {
			disconnected = true,
			localAPIPairing = true,
			connected = true
		},
		disconnected = {
			connectionPending = true,
			localAPIPairing = true,
			connected = true
		},
		connectionPending = {
			disconnected = true,
			localAPIPairing = true,
			connected = true
		},
		localAPIPairing = {
			endPairingSuccess = true,
			endPairing = true
		},
		endPairing = {
			disconnected = true,
			connectionPending = true,
			connected = true
		},
		endPairingSuccess = {
			disconnected = true,
			connectionPending = true,
			connected = true
		},
		Unknown = {
			disconnected = true,
			connectionPending = true,
			localAPIPairing = true,
			connected = true
		}
	}
}
