/**************************************************************************//**
 * @file boot.h
 * @brief Bootloader boot functions
 * @version 1.74
 ******************************************************************************
 * @section License
 * <b>Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 *******************************************************************************
 *
 * This file is licensed under the Silabs License Agreement. See the file
 * "Silabs_License_Agreement.txt" for details. Before using this software for
 * any purpose, you must agree to the terms of that agreement.
 *
 ******************************************************************************/

#ifndef BOOT_H
#define BOOT_H

#include <stdint.h>
#include <stdbool.h>

__ramfunc void BOOT_boot(void);
bool BOOT_checkFirmwareIsValid(void);

#endif
