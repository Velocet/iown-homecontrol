/**************************************************************************//**
 * @file crc.c
 * @brief CRC calculation routines
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

#include "crc.h"
#include "em_device.h"

/**************************************************************************//**
 * @brief
 *   This function calculates the CRC-16-CCIT checksum of a memory range.
 *
 * @note
 *   This implementation uses an initial value of 0, while some implementations
 *   of CRC-16-CCIT uses an initial value of 0xFFFF. If you wish to
 *   precalculate the CRC before uploading the binary to the bootloader you
 *   can use this function. However, keep in mind that the 'v' and 'c' commands
 *   computes the crc of the entire flash, so any bytes not used by your
 *   application will have the value 0xFF.
 *
 * @param start
 *   Pointer to the start of the memory block
 *
 * @param end
 *   Pointer to the end of the block. This byte is not included in the computed
 *   CRC.
 *
 * @return
 *   The computed CRC value.
 *****************************************************************************/
__ramfunc uint16_t CRC_calc(uint8_t *start, uint8_t *end)
{
  uint16_t crc = 0x0;
  uint8_t  *data;

  for (data = start; data < end; data++)
  {
    crc  = (crc >> 8) | (crc << 8);
    crc ^= *data;
    crc ^= (crc & 0xff) >> 4;
    crc ^= crc << 12;
    crc ^= (crc & 0xff) << 5;
  }
  return crc;
}
