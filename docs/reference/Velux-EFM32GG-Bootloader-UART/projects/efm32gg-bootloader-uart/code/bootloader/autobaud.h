/**************************************************************************//**
 * @file autobaud.h
 * @brief Autobaud estimation for BOOTLOADER_USART
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

#ifndef AUTOBAUD_H
#define AUTOBAUD_H

#include <stdint.h>

void TIMER_IRQHandler(void);
void GPIO_IRQHandler(void);
int AUTOBAUD_sync(void);
int AUTOBAUD_estimatePeriod(void);

#endif
