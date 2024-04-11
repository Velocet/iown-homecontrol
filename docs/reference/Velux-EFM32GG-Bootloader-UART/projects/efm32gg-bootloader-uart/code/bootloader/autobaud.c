/**************************************************************************//**
 * @file autobaud.c
 * @brief Bootloader autobaud functions.
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
#include "config.h"
#include "autobaud.h"

#ifndef NDEBUG
#include <stdio.h>
#endif

#define SAMPLE_MAX    5

volatile uint32_t currentSample = 0;
volatile uint32_t samples[SAMPLE_MAX];

#ifdef USART_OVERLAPS_WITH_BOOTLOADER
volatile uint8_t gpioEvent = 0;
#endif

/**************************************************************************//**
 * @brief
 *   GPIO interrupt handler. The purpose of this is to detect if there is a
 *   debugger attatched (Activity on SWCLK - F0). If there is we should yield
 *   and let the debugger access the pin.
 * @note
 *   This is only required if the bootloader overlaps with the debug pins.
 *****************************************************************************/
#ifdef USART_OVERLAPS_WITH_BOOTLOADER
void GPIO_IRQHandler(void)
{
  /* disable all interrupts */
  NVIC->ICER[0] = 0xFFFFFFFF;
#if ( __CORTEX_M != 0 )
  NVIC->ICER[1] = 0xFFFFFFFF;
#endif
  gpioEvent = 1;
#ifndef NDEBUG
  printf("Activity on SWCLK. Suspending.\n");
#endif
}
#endif

/**************************************************************************//**
 * @brief
 *   AUTOBAUD_TIMER interrupt handler. This function stores the current value of the
 *   timer in the samples array.
 *****************************************************************************/
void TIMER_IRQHandler(void)
{
  uint32_t period;
  /* Clear CC1 flag */
#if AUTOBAUD_TIMER_CHANNEL == 0
  AUTOBAUD_TIMER->IFC = TIMER_IFC_CC0;
#elif AUTOBAUD_TIMER_CHANNEL == 1
  AUTOBAUD_TIMER->IFC = TIMER_IFC_CC1;
#elif AUTOBAUD_TIMER_CHANNEL == 2
  AUTOBAUD_TIMER->IFC = TIMER_IFC_CC2;
#else
#error Invalid timer channel.
#endif

  /* Store CC1 timer value in samples array */
  if (currentSample < SAMPLE_MAX)
  {
    period                 = AUTOBAUD_TIMER->CC[AUTOBAUD_TIMER_CHANNEL].CCV;
    samples[currentSample] = period;
    currentSample++;
  }
}

/**************************************************************************//**
 * @brief
 *   This function uses the samples array to estimate the period of a single
 *   bit flip.
 *
 * @return
 *   The number of HF clock periods (in 24.8 fixed point) per single bit flip.
 *****************************************************************************/
int AUTOBAUD_estimatePeriod(void)
{
  uint32_t minimumPeriod = UINT32_MAX;
  uint32_t i;
  uint32_t periodSum   = 0;
  uint32_t periodCount = 0;
  uint32_t diff;

  /* Find the smallest period. We only want to average the single-bit periods,
   * not any of the potential multi-bit periods */
  for (i = 1; i < currentSample; i++)
  {
    /* This calculation is split across two lines to avoid the compiler
     * complaining about samples being volatile. */
    diff  = samples[i];
    diff -= samples[i - 1];
    if (diff < minimumPeriod)
    {
      minimumPeriod = diff;
    }
  }

  /* average all samples within quarter a period of the smallest period, i.e.
   * the other single-bit periods */
  for (i = 1; i < currentSample; i++)
  {
    /* This calculation is split across two lines to avoid the compiler
     * complaining about samples being volatile. */
    diff  = samples[i];
    diff -= samples[i - 1];
    if (diff < minimumPeriod + (minimumPeriod >> 1))
    {
      periodSum += diff;
      periodCount++;
    }
  }

  /* Each sample is at least two periods. Shift by 7 instead of 8 to
   * get 24.8 format. */
  return (periodSum << 7) / periodCount;
}

/**************************************************************************//**
 * @brief
 *  This function uses AUTOBAUD_TIMER to estimate the needed CLKDIV needed for
 *  BOOTLOADER_USART. It does this by using compare channel
 *  AUTOBAUD_TIMER_CHANNEL and registering how many HF clock cycles occur
 *  between rising edges.
 *
 *  This assumes that AUTOBAUD_TIMER AUTOBAUD_TIMER_CHANNEL overlaps with the
 *  BOOTLOADER_USART RX pin.
 *
 * @return
 *   CLKDIV to use.
 *****************************************************************************/
int AUTOBAUD_sync(void)
{
#ifdef USART_OVERLAPS_WITH_BOOTLOADER
  /* Set up GPIO interrupts on falling edge on the SWCLK. */
  /* If we see such an event, then there is a debugger attatched. */
  /* SWCLK is port F0 */
  GPIO->EXTIPSELL = GPIO_EXTIPSELL_EXTIPSEL0_PORTF;
  GPIO->EXTIFALL = 1;
  GPIO->IFC = 1;
  GPIO->IEN = 1;
#endif

  /* Set a high top value to avoid overflow */
  AUTOBAUD_TIMER->TOP = UINT32_MAX;

  /* Set up compare channel.
   * Trigger on rising edge and capture value */
  AUTOBAUD_TIMER->CC[AUTOBAUD_TIMER_CHANNEL].CTRL = TIMER_CC_CTRL_MODE_INPUTCAPTURE |
                                            TIMER_CC_CTRL_ICEDGE_RISING;

  /* Set up AUTOBAUD_TIMER to location AUTOBAUD_TIMER_LOCATION */
  AUTOBAUD_TIMER->ROUTE = AUTOBAUD_TIMER_LOCATION |
                  /* Enable CC channel 1 */
#if AUTOBAUD_TIMER_CHANNEL == 0
                  TIMER_ROUTE_CC0PEN;
#elif AUTOBAUD_TIMER_CHANNEL == 1
                  TIMER_ROUTE_CC1PEN;
#elif AUTOBAUD_TIMER_CHANNEL == 2
                  TIMER_ROUTE_CC2PEN;
#else
#error Invalid timer channel.
#endif

  /* Enable interrupts */
#if (AUTOBAUD_TIMER_IRQn < 32) && (GPIO_EVEN_IRQn < 32)
  NVIC->ISER[0] = (1 << AUTOBAUD_TIMER_IRQn) | (1 << GPIO_EVEN_IRQn);
#else
  NVIC_EnableIRQ(AUTOBAUD_TIMER_IRQn);
#ifdef USART_OVERLAPS_WITH_BOOTLOADER
  NVIC_EnableIRQ(GPIO_EVEN_IRQn);
#endif
#endif

  /* Enable interrupt on channel capture */
#if AUTOBAUD_TIMER_CHANNEL == 0
  AUTOBAUD_TIMER->IEN = TIMER_IEN_CC0;
#elif AUTOBAUD_TIMER_CHANNEL == 1
  AUTOBAUD_TIMER->IEN = TIMER_IEN_CC1;
#elif AUTOBAUD_TIMER_CHANNEL == 2
  AUTOBAUD_TIMER->IEN = TIMER_IEN_CC2;
#else
#error Invalid timer channel.
#endif

  /* Start the timer */
  AUTOBAUD_TIMER->CMD = TIMER_CMD_START;

  /* Wait for interrupts in EM1 */
  SCB->SCR &= ~SCB_SCR_SLEEPDEEP_Msk;

  /* Fill the sample buffer */
#ifdef USART_OVERLAPS_WITH_BOOTLOADER
  while ((currentSample < SAMPLE_MAX) && (!gpioEvent))
#else
  while (currentSample < SAMPLE_MAX)
#endif
  {
    __WFI();
  }

  /* Disable interrupts in Cortex */
#if (AUTOBAUD_TIMER_IRQn < 32) && (GPIO_EVEN_IRQn < 32)
  NVIC->ICER[0] = (1 << AUTOBAUD_TIMER_IRQn) | (1 << GPIO_EVEN_IRQn);
#else
  NVIC_DisableIRQ(AUTOBAUD_TIMER_IRQn);
#ifdef USART_OVERLAPS_WITH_BOOTLOADER
  NVIC_DisableIRQ(GPIO_EVEN_IRQn);
#endif
#endif

  /* Disable routing of TIMER. */
  AUTOBAUD_TIMER->ROUTE = _TIMER_ROUTE_RESETVALUE;

  /* If there has been a GPIO event, then loop here, so the debugger can
   * do it's stuff. */
#ifdef USART_OVERLAPS_WITH_BOOTLOADER
  while (gpioEvent) ;
#endif

  /* Use the collected samples to estimate the number of clock cycles per
   * bit in transfer */
  return AUTOBAUD_estimatePeriod();
}
