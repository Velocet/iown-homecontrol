#pragma once

#include <Windows.h>
#include <array>
#include <memory>
#include <string>


template <std::size_t size>
class HookPatch
{
	std::uintptr_t address;
	std::array<std::uint8_t, size> backup;

  public:
	HookPatch(std::uintptr_t address_, std::array<std::uint8_t, size>& data)
	    : address(address_)
	{
		HANDLE process = GetCurrentProcess();
		ReadProcessMemory(process, (LPVOID)address, backup.data(), backup.size(), nullptr);
		WriteProcessMemory(process, (LPVOID)address, data.data(), data.size(), nullptr);
		CloseHandle(process);
	}

	~HookPatch()
	{
		if (address != 0) {
			HANDLE process = GetCurrentProcess();
			WriteProcessMemory(process, (LPVOID)address, backup.data(), backup.size(), nullptr);
			CloseHandle(process);
		}
	}
};
