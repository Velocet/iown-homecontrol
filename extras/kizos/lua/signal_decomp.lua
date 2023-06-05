slot0 = require("uv")
slot1 = 
-- Decompilation error in this vicinity:
require("Overkiz.Log")()
slot2 = {}

function slot4(slot0)
	slot1 = slot0.new_signal()
	slot1[slot0] = {
		signal = slot1,
		handlers = {}
	}

	slot1:start(slot0, function (slot0)
		slot0:info("Process signal:", slot0)

		if not slot0.info[slot0] then
			slot0:info("No handler registered")

			return
		end

		for slot4, slot5 in pairs(slot1[].handlers) do
			slot6, slot7 = pcall(slot5)

			if not slot6 then
				slot0:error("Error during signal processing.", slot7)
			end
		end
	end)
end

function slot5(slot0)
	slot0[slot0].signal:stop()

	slot0[slot0] = nil
end

return {
	SIGTTIN = "sigttin",
	SIGIO = "sigio",
	SIGCONT = "sigcont",
	SIGWINCH = "sigwinch",
	SIGVTALRM = "sigvtalrm",
	SIGTTOU = "sigttou",
	SIGBREAK = "sigbreak",
	SIGTERM = "sigterm",
	SIGUSR2 = "sigusr2",
	SIGQUIT = "sigquit",
	SIGUSR1 = "sigusr1",
	SIGPIPE = "sigpipe",
	SIGTRAP = "sigtrap",
	SIGXCPU = "sigxcpu",
	SIGLOST = "siglost",
	SIGINT = "sigint",
	SIGXFSZ = "sigxfsz",
	SIGHUP = "sighup",
	SIGPOLL = "sigpoll",
	SIGPWR = "sigpwr",
	SIGSYS = "sigsys",
	SIGPROF = "sigprof",
	SIGURG = "sigurg",
	SIGTSTP = "sigtstp",
	SIGALRM = "sigalrm",
	SIGIOT = "sigiot",
	SIGSTKFLT = "sigstkflt",
	SIGCHLD = "sigchld",
	subscribe = function (slot0, slot1)
		if not slot0[slot0] then
			slot1(slot0)
		end

		table.insert(slot0[slot0].handlers, slot1)
	end,
	unsubscribe = function (slot0, slot1)
		for slot5, slot6 in pairs(slot0[slot0].handlers) do
			if slot6 == slot1 then
				table.remove(slot0[slot0].handlers, slot5)
			end
		end

		if #slot0[slot0].handlers == 0 then
			slot1(slot0)
		end
	end
}
