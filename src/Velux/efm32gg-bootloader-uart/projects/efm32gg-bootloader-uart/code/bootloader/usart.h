/**************************************************************************//**
 * @file usart.h
 * @brief USART code for the EFM32 bootloader
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

#ifndef USART_H
#define USART_H

#include <stdint.h>
#include "em_device.h"

__ramfunc void USART_printHex(uint32_t integer);
__ramfunc void USART_txByte(uint8_t data);
__ramfunc uint8_t USART_rxByte(void);
__ramfunc void USART_printString(uint8_t *string);
void USART_init(uint32_t clkdiv);

#endif
