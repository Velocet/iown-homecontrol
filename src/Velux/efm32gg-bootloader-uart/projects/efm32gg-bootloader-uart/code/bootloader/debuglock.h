/**************************************************************************//**
 * @file debuglock.h
 * @brief Bootloader debug lock functions
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

#ifndef DEBUGLOCK_H
#define DEBUGLOCK_H

#include "config.h"
#include <stdint.h>

#if defined( CoreDebug )        /* In core_cmX.h */
__ramfunc void DEBUGLOCK_startDebugInterface(void);
#endif

__ramfunc bool DEBUGLOCK_lock(void);

#endif
