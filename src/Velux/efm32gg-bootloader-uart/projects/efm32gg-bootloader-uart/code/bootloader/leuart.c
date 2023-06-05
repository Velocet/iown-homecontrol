/**************************************************************************//**
 * @file leuart.c
 * @brief LEUART code for the EFM32 bootloader
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

#include "em_device.h"
#include "usart.h"
#include "config.h"

/***************************************************************************//**
 * @brief
 *   Prints an int in hex.
 *
 * @param integer
 *   The integer to be printed.
 ******************************************************************************/
__ramfunc void USART_printHex(uint32_t integer)
{
  uint8_t c;
  int i, digit;

  for (i = 0; i <= 7; i++)
  {
    digit = integer >> 28;
    c = digit + 0x30;
    if (digit >= 10)
    {
      c += 7;
    }
    USART_txByte(c);
    integer <<= 4;
  }
}

/**************************************************************************//**
 * @brief Transmit single byte to BOOTLOADER_USART
 *****************************************************************************/
__ramfunc uint8_t USART_rxByte(void)
{
  uint32_t timer = 1000000;
  while (!(BOOTLOADER_USART->STATUS & LEUART_STATUS_RXDATAV) && --timer ) ;
  if (timer > 0)
  {
    return((uint8_t)(BOOTLOADER_USART->RXDATA & 0xFF));
  }
  else
  {
    return 0;
  }
}


/**************************************************************************//**
 * @brief Transmit single byte to BOOTLOADER_USART
 *****************************************************************************/
__ramfunc void USART_txByte(uint8_t data)
{
  /* Check that transmit buffer is empty */
  while (!(BOOTLOADER_USART->STATUS & LEUART_STATUS_TXBL)) ;

  BOOTLOADER_USART->TXDATA = (uint32_t) data;
}

/**************************************************************************//**
 * @brief Transmit null-terminated string to BOOTLOADER_USART
 *****************************************************************************/
__ramfunc void USART_printString(uint8_t *string)
{
  while (*string != 0)
  {
    USART_txByte(*string++);
  }
}

/**************************************************************************//**
 * @brief Intializes BOOTLOADER_USART
 *
 * @param clkdiv
 *   The clock divisor to use.
 *****************************************************************************/
void USART_init(uint32_t clkdiv)
{
  /* Configure BOOTLOADER_USART */
  /* USART default to 1 stop bit, no parity, 8 data bits, so not
   * explicitly set */

  /* Set the clock division */
  BOOTLOADER_USART->CLKDIV = clkdiv;

  /* Enable RX and TX pins and set location 0 */
  BOOTLOADER_USART->ROUTE = BOOTLOADER_USART_LOCATION
                            | LEUART_ROUTE_RXPEN | LEUART_ROUTE_TXPEN;

  /* Enable RX/TX */
  BOOTLOADER_USART->CMD = LEUART_CMD_RXEN | LEUART_CMD_TXEN;
}
