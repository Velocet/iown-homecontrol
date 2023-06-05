/**************************************************************************//**
 * @file debug.h
 * @brief Debug printf on USART1 with a fixed baud rate of 115200, useful
 *        for debugging purposes. When Debug is not set this will not be
 *        compiled in. Note that __write is overriden in iar_write.c,
 *        which makes printf work.
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

#ifndef DEBUG_H
#define DEBUG_H

void DEBUG_init(void);
int DEBUG_TxByte(uint8_t data);
int DEBUG_TxBuf(uint8_t *buffer, int nbytes);

#endif
