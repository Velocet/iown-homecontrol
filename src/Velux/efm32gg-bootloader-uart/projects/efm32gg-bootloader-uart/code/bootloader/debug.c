/**************************************************************************//**
 * @file debug.c
 * @brief Debug printf on DEBUG_USART with a fixed baud rate of 115200, useful
 *        for debugging purposes. When Debug is not set this will not be
 *        compiled in. Note that __write is overridden in iar_write.c,
 *        which makes this work.
 * @version 1.74  ( file changed by VELUX )
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

#include <stdint.h>
#include "em_device.h"
#include "debug.h"
#include "config.h"
#include "efm32gg-defines.h"
#include "efm32gg_uart.h"

#ifndef NDEBUG
/**************************************************************************//**
 * @brief Initialize DEBUG_USART@115200 for use for debugging purposes.
 *****************************************************************************/
void DEBUG_init(void)
{
  /* Enable clock and I/O for DEBUG_USART */
#if defined(_EFM32_JADE_FAMILY)
  CMU->LFBCLKSEL = CMU_LFBCLKSEL_LFB_HFCLKLE;
  CMU->LFBCLKEN0 = CMU_LFBCLKEN0_LEUART0;
  while (CMU->SYNCBUSY & CMU_SYNCBUSY_LFBCLKEN0);
  while (DEBUG_USART->SYNCBUSY & LEUART_SYNCBUSY_CMD);
  DEBUG_USART->FREEZE = LEUART_FREEZE_REGFREEZE;

  DEBUG_USART->CLKDIV = 20848;    // 115.200 baud
  DEBUG_USART->ROUTEPEN  = LEUART_ROUTEPEN_RXPEN | LEUART_ROUTEPEN_TXPEN;
  DEBUG_USART->ROUTELOC0 = (DEBUG_USART->ROUTELOC0
							& ~(_LEUART_ROUTELOC0_RXLOC_MASK
								| _LEUART_ROUTELOC0_TXLOC_MASK))
						   | (DEBUG_USART_RX_LOCATION
							  << _LEUART_ROUTELOC0_RXLOC_SHIFT)
						   | (DEBUG_USART_TX_LOCATION
							  << _LEUART_ROUTELOC0_TXLOC_SHIFT);

  /* Clear RX/TX buffers */
  DEBUG_USART->CMD = LEUART_CMD_CLEARRX | LEUART_CMD_CLEARTX;
  DEBUG_USART->FREEZE = 0;

  /* Enable RX/TX */
  while (DEBUG_USART->SYNCBUSY & LEUART_SYNCBUSY_CMD);
  DEBUG_USART->CMD = LEUART_CMD_RXEN | LEUART_CMD_TXEN;

#else
  CMU->HFPERCLKEN0 |= DEBUG_USART_CLOCK;
  /* Set clock division. We need 115200 bps, while the core is running
   * at 14 MHz. Using equation 16.2 the CLKDIV must be set to 1688 */
  DEBUG_USART->CLKDIV = 1688;
  DEBUG_USART->ROUTE = USART_ROUTE_RXPEN | USART_ROUTE_TXPEN
					   | DEBUG_USART_LOCATION;

  /* Clear RX/TX buffers */
  DEBUG_USART->CMD = USART_CMD_CLEARRX | USART_CMD_CLEARTX;
  /* Enable RX/TX */
  DEBUG_USART->CMD = USART_CMD_RXEN | USART_CMD_TXEN;
#endif

  CONFIG_DebugGpioSetup();
}

/**************************************************************************//**
 * @brief Transmit a single byte on usart1
 * @param data Character to transmit.
 *****************************************************************************/
int DEBUG_TxByte(uint8_t data)
{
  /* Check that transmit buffer is empty */
  while (!DEBUG_USART_TX_READY());

#if defined(_EFM32_JADE_FAMILY)
  while (DEBUG_USART->SYNCBUSY & LEUART_SYNCBUSY_TXDATA);
#endif

  DEBUG_USART->TXDATA = (uint32_t)data;
  return (int)data;
}

/**************************************************************************//**
 * @brief Transmit buffer to USART1
 * @param buffer Array of characters to send
 * @param nbytes Number of bytes to transmit
 * @return Number of bytes sent
 *****************************************************************************/
int DEBUG_TxBuf(uint8_t *buffer, int nbytes)
{
  int i;

  for (i = 0; i < nbytes; i++)
  {
	DEBUG_TxByte(*buffer++);
  }
  return nbytes;
}

#endif
