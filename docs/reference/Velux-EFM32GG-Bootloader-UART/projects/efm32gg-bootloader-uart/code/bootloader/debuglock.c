/**************************************************************************//**
 * @file debuglock.c
 * @brief Boot Loader debug lock
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

#include <stdio.h>
#include <stdbool.h>

#include "debuglock.h"
#include "em_device.h"

#include "flash.h"
#include "config.h"

#if defined( CoreDebug )        /* In core_cmX.h */

/*************************************************************************//**
 * This is the SWD debug sequence.
 * The first three lines is a simple initialization of the interface and the
 * last sets the powerup request bit, which enables debug mode.
 * By enabling debug mode, we can write to the Debug lock word.
 ****************************************************************************/
uint8_t _DEBUGLOCK_swData[] = {
  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
  0x00, 0x00,
  0xa5, 0x00, 0x00, 0x00, 0x00, 0x00, /* read DP-ID - init sequence ends after this */
  0xa9, 0x00, 0x00, 0x00, 0x00, 0x0a  /* ctrlstat = 0x50000000 (wake up) */
};

/*************************************************************************//**
 * @brief
 *   This functions drives a bit on the SW debug interface by bit-banging
 *   the GPIO->ROUTE register and using the external pull-ups.
 ****************************************************************************/
__ramfunc __INLINE void _DEBUGLOCK_driveBit(int bit)
{
  int i;
  if (bit)
  {
    /* SWDIO high */
#if defined(GPIO_ROUTEPEN_SWDIOTMSPEN)
    GPIO->ROUTEPEN |= GPIO_ROUTEPEN_SWDIOTMSPEN;
#else
    GPIO->ROUTE |= GPIO_ROUTE_SWDIOPEN;
#endif
  }
  else
  {
    /* SWDIO low */
#if defined(GPIO_ROUTEPEN_SWDIOTMSPEN)
    GPIO->ROUTEPEN &= ~(GPIO_ROUTEPEN_SWDIOTMSPEN);
#else
    GPIO->ROUTE &= ~(GPIO_ROUTE_SWDIOPEN);
#endif
  }
  /* Toggle clock. */
  /* Set SWCLK high */
#if defined(GPIO_ROUTEPEN_SWCLKTCKPEN)
  GPIO->ROUTEPEN |= GPIO_ROUTEPEN_SWCLKTCKPEN;
#else
  GPIO->ROUTE |= GPIO_ROUTE_SWCLKPEN;
#endif
  GPIO->P[5].MODEL = GPIO_P_MODEL_MODE0_INPUT;
  /* Small delay, to make sure that any external line is charged. */
  for (i=0; i < 1000; i++);
  /* Set SWCLK low */
#if defined(GPIO_ROUTEPEN_SWCLKTCKPEN)
  GPIO->ROUTEPEN &= ~(GPIO_ROUTEPEN_SWCLKTCKPEN);
#else
  GPIO->ROUTE &= ~(GPIO_ROUTE_SWCLKPEN);
#endif
  GPIO->P[5].MODEL = GPIO_P_MODEL_MODE0_DISABLED;
}

/*************************************************************************//**
 * @brief
 *   This functions enables the debug interface by bit-banging a SWD init
 *   sequence on the debug interface.
 ****************************************************************************/
__ramfunc void DEBUGLOCK_startDebugInterface(void)
{
  int bit, byte;
#ifdef USART_OVERLAPS_WITH_BOOTLOADER
  uint32_t tmp;
  tmp = GPIO->P[5].MODEL;
#endif

  GPIO->P[5].MODEL = 0;
#if defined(_GPIO_ROUTEPEN_MASK)
  GPIO->ROUTEPEN = 0;
#else
  GPIO->ROUTE = 0;
#endif

  for (byte = 0; byte < sizeof(_DEBUGLOCK_swData); byte++)
  {
    for (bit = 0; bit < 8; bit++)
    {
      _DEBUGLOCK_driveBit((_DEBUGLOCK_swData[byte] >> bit) & 1);
    }
  }
#ifdef USART_OVERLAPS_WITH_BOOTLOADER
  GPIO->P[5].MODEL = tmp;
#endif
}
#endif

/*************************************************************************//**
 * @brief
 *   This function locks the debug interface by first enabling debug mode by
 *   bit-banging a SWD init sequence on the SWD interface and then setting
 *   the Debug lock bit in the flash.
 * @return
 *   Returns true if the DLW has been sucessfully set, false otherwise.
 ****************************************************************************/
__ramfunc bool DEBUGLOCK_lock(void)
{

#if defined( CoreDebug )        /* In core_cmX.h */
  /* Start debug interface. */
  DEBUGLOCK_startDebugInterface();
#endif

  /* Set the debug lock word */
  FLASH_writeWord(DEBUG_LOCK_WORD_ADDR, 0x0);
  /* Verify sucessful write by checking the DLW. */
  if (*(uint32_t *)DEBUG_LOCK_WORD_ADDR == 0x0)
  {
    return true;
  }
  return false;
}
