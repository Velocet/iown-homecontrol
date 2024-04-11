/**************************************************************************//**
 * @file xmodem.h
 * @brief XMODEM prototypes and definitions
 * @version 1.74 ( file changed by VELUX )
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

#ifndef XMODEM_H
#define XMODEM_H

#include <stdint.h>
#include <stdbool.h>

#define XMODEM_SOH                1
#define XMODEM_EOT                4
#define XMODEM_ACK                6
#define XMODEM_NAK                21
#define XMODEM_CAN                24
#define XMODEM_NCG                67

#define XMODEM_HEADER_SIZE          4
#define XMODEM_DATA_SIZE          128

#define ENCRYPTED                 true
#define NOT_ENCRYPTED             false

typedef struct
{
  uint8_t padding; /* Padding to make sure data is 32 bit aligned. */
  uint8_t header;
  uint8_t packetNumber;
  uint8_t packetNumberC;
  uint8_t data[XMODEM_DATA_SIZE];
  uint8_t crcHigh;
  uint8_t crcLow;
} XMODEM_packet;

__ramfunc void XMODEM_download(uint32_t baseAddress, uint32_t endAddress, bool encrypted);

#endif
