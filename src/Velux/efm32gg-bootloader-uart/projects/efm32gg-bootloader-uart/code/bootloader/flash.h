/**************************************************************************//**
 * @file flash.h
 * @brief Bootloader flash writing functions.
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

#ifndef FLASH_H
#define FLASH_H

/*
 * Flash programming hardware interface
 *
 */

/* Helper functions */
__ramfunc void FLASH_writeWord(uint32_t address, uint32_t data);
__ramfunc void FLASH_writeBlock(void *block_start,
                                uint32_t offset_into_block,
                                uint32_t count,
                                uint8_t const *buffer);
__ramfunc void FLASH_eraseOneBlock(uint32_t blockStart);
void FLASH_init(void);
void FLASH_CalcPageSize(void);

extern uint32_t flashPageSize;
#endif
