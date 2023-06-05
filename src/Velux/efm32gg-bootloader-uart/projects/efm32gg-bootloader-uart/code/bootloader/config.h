/**************************************************************************//**
 * @file config.h
 * @brief Bootloader Configuration.
 *    This file defines how the bootloader is set up.
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

#ifndef CONFIG_H
#define CONFIG_H

#include "em_device.h"

/******************************************************************************
 ** Frequency of the LF clock                                                 *
 ******************************************************************************/
#define LFRCO_FREQ           (32768)

/******************************************************************************
 * Number of seconds before autobaud times out and restarts the bootloader    *
 ******************************************************************************/
#define AUTOBAUD_TIMEOUT     (30)

/******************************************************************************
 * Number of milliseconds between each consecutive polling of the SWD pins    *
 ******************************************************************************/
#define PIN_LOOP_INTERVAL    (250)

/******************************************************************************
 * Misc. constants.                                                           *
 ******************************************************************************/
#if defined(_SILICON_LABS_32B_SERIES_0) \
  && (defined(_EFM32_GIANT_FAMILY) || defined(_EFM32_WONDER_FAMILY))
#define BOOTLOADER_SIZE         (4*1024)
#define BOOTLOADER_START_ADDR   (0)
#define APPLICATION_START_ADDR  BOOTLOADER_SIZE

#elif defined(_SILICON_LABS_32B_SERIES_1)
#define BOOTLOADER_SIZE         (10*1024)
#define BOOTLOADER_START_ADDR   (0x0FE10000)
#define APPLICATION_START_ADDR  (0)

#else

#ifndef NDEBUG
#define BOOTLOADER_SIZE         (11*1024)
#else
#define BOOTLOADER_SIZE         (0x00000A00)   // TBD
#endif

#define BOOTLOADER_START_ADDR   (0)
#define APPLICATION_START_ADDR  BOOTLOADER_SIZE
#endif

#define BOOTLOADER_END_ADDR     (BOOTLOADER_START_ADDR + BOOTLOADER_SIZE)
#define DEBUG_LOCK_WORD_ADDR    (0x0FE04000 + (127 * 4))
#define USER_PAGE_START_ADDR    (0x0FE00000)
#define USER_PAGE_END_ADDR      (0x0FE00200)
#define LOCK_PAGE_START_ADDR    (0x0FE04000)
#define LOCK_PAGE_END_ADDR      (0x0FE04200)
#define DEVINFO_START_ADDR      (0x0FE081B0)
#define DEVINFO_END_ADDR        (0x0FE08200)
/** Block size for AES decryption */
#define AES_BLOCKSIZE    16

/******************************************************************************
 * USART used for communication.                                              *
 ******************************************************************************/
#if defined(_EZR32_LEOPARD_FAMILY)
#define BOOTLOADER_USART           USART1
#define BOOTLOADER_USART_CLOCKEN   CMU_HFPERCLKEN0_USART1
#define BOOTLOADER_USART_LOCATION  USART_ROUTE_LOCATION_LOC2

#elif defined(_EFM32_ZERO_FAMILY) || defined(EFM32TG108F4) \
  || defined(_EFM32_HAPPY_FAMILY)
#define BOOTLOADER_USART           LEUART0
#define BOOTLOADER_USART_CLOCKEN   0
#define BOOTLOADER_LEUART_CLOCKEN  CMU_LFBCLKEN0_LEUART0
#define BOOTLOADER_USART_LOCATION  LEUART_ROUTE_LOCATION_LOC3
#define BOOTLOADER_USART_CLEARRX   LEUART_CMD_CLEARRX

#else
#if defined(_SILICON_LABS_32B_SERIES_1) \
  && (defined(_EFM32_GIANT_FAMILY) || defined(_EFM32_TINY_FAMILY))
#define BOOTLOADER_USART           USART2
#define BOOTLOADER_USART_CLOCKEN   CMU_HFPERCLKEN0_USART2
#else
#define BOOTLOADER_USART           USART0
#define BOOTLOADER_USART_CLOCKEN   CMU_HFPERCLKEN0_USART0
#endif

#if defined(_SILICON_LABS_32B_SERIES_1)
#define BOOTLOADER_USART_CLEARRX   USART_CMD_CLEARRX

#if defined(USART_ON_LOC18_FOR_DEBUGGING)
#define BOOTLOADER_USART_TX_LOCATION  USART_ROUTELOC0_TXLOC_LOC18
#define BOOTLOADER_USART_RX_LOCATION  USART_ROUTELOC0_RXLOC_LOC18
#elif defined(_EFM32_GIANT_FAMILY) || defined(_EFM32_TINY_FAMILY)
#define BOOTLOADER_USART_TX_LOCATION  USART_ROUTELOC0_TXLOC_LOC5
#define BOOTLOADER_USART_RX_LOCATION  USART_ROUTELOC0_RXLOC_LOC5
#else
#define BOOTLOADER_USART_TX_LOCATION  USART_ROUTELOC0_TXLOC_LOC24
#define BOOTLOADER_USART_RX_LOCATION  USART_ROUTELOC0_RXLOC_LOC24
#endif

#else
#define BOOTLOADER_USART_LOCATION  USART_ROUTE_LOCATION_LOC0
#endif
#endif

/******************************************************************************
 * USART used for debugging.                                                  *
 ******************************************************************************/
#if defined(_SILICON_LABS_32B_SERIES_0) \
  && (defined(_EFM32_GIANT_FAMILY) || defined(_EFM32_WONDER_FAMILY) \
  || defined(_EZR32_LEOPARD_FAMILY))
#define DEBUG_USART                UART1
#define DEBUG_USART_CLOCK          CMU_HFPERCLKEN0_UART1
#define DEBUG_USART_TX_READY()     (DEBUG_USART->STATUS & USART_STATUS_TXBL)

#elif defined(_EFM32_JADE_FAMILY)
#define DEBUG_USART                LEUART0
#define DEBUG_USART_CLOCK          CMU_LFBCLKEN0_LEUART0
#define DEBUG_USART_TX_READY()     (DEBUG_USART->STATUS & LEUART_STATUS_TXBL)
#define DEBUG_USART_RX_LOCATION    LEUART_ROUTELOC0_RXLOC_LOC0
#define DEBUG_USART_TX_LOCATION    LEUART_ROUTELOC0_TXLOC_LOC0

#else
#define DEBUG_USART                USART1
#define DEBUG_USART_CLOCK          CMU_HFPERCLKEN0_USART1
#define DEBUG_USART_TX_READY()     (DEBUG_USART->STATUS & USART_STATUS_TXBL)
#endif

#if defined(_EFM32_ZERO_FAMILY) || defined(EFM32TG108F4)
#define DEBUG_USART_LOCATION       USART_ROUTE_LOCATION_LOC2
#elif defined(_SILICON_LABS_32B_SERIES_0)                         \
  && (defined(_EFM32_GECKO_FAMILY) || defined(_EFM32_TINY_FAMILY) \
  || defined(_EFM32_HAPPY_FAMILY))
#define DEBUG_USART_LOCATION       USART_ROUTE_LOCATION_LOC0
#else // GIANT/LEOPARD/WONDER/EZR32LG
#define DEBUG_USART_LOCATION       UART_ROUTE_LOCATION_LOC2
#endif

/******************************************************************************
 * TIMERn is used for autobaud. The channel and location must match the       *
 * RX line of BOOTLOADER_USART for this to work properly.                     *
 ******************************************************************************/
#if defined(_EZR32_LEOPARD_FAMILY)
#define AUTOBAUD_TIMER_CHANNEL     0
#define AUTOBAUD_TIMER             TIMER1
#define AUTOBAUD_TIMER_LOCATION    TIMER_ROUTE_LOCATION_LOC4
#define AUTOBAUD_TIMER_IRQn        TIMER1_IRQn
#define AUTOBAUD_TIMER_CLOCK       CMU_HFPERCLKEN0_TIMER1

#elif defined(_EFM32_ZERO_FAMILY) || defined(EFM32TG108F4) \
  || defined(_EFM32_HAPPY_FAMILY)
#define AUTOBAUD_TIMER_CHANNEL     1
#define AUTOBAUD_TIMER             TIMER0
#define AUTOBAUD_TIMER_LOCATION    TIMER_ROUTE_LOCATION_LOC5
#define AUTOBAUD_TIMER_IRQn        TIMER0_IRQn
#define AUTOBAUD_TIMER_CLOCK       CMU_HFPERCLKEN0_TIMER0

#else
#define AUTOBAUD_TIMER_CHANNEL     1
#define AUTOBAUD_TIMER             TIMER1
#define AUTOBAUD_TIMER_LOCATION    TIMER_ROUTE_LOCATION_LOC1
#define AUTOBAUD_TIMER_IRQn        TIMER1_IRQn
#define AUTOBAUD_TIMER_CLOCK       CMU_HFPERCLKEN0_TIMER1
#endif

/******************************************************************************
 * Check for falling edge. Use if UART overlaps with GPIO                     *
 ******************************************************************************/
#if defined(_EFM32_ZERO_FAMILY) || defined(EFM32TG108F4) \
  || defined(_EFM32_HAPPY_FAMILY) || defined(_SILICON_LABS_32B_SERIES_1)
#define USART_OVERLAPS_WITH_BOOTLOADER
#endif

/******************************************************************************
 * Inline functions to setup GPIO for serialports.                            *
 ******************************************************************************/
#if defined(_EZR32_LEOPARD_FAMILY)
__STATIC_INLINE void CONFIG_DebugGpioSetup(void)
{
  // Avoid false start by setting output high.
  GPIO->P[1].DOUT = (1 << 9);
  GPIO->P[1].MODEH = GPIO_P_MODEH_MODE9_PUSHPULL | GPIO_P_MODEH_MODE10_INPUT;
}

__STATIC_INLINE void CONFIG_UsartGpioSetup(void)
{
  // Use USART1 location 2
  // 0 : TX - Pin D7, RX - Pin D6
  // Configure GPIO pins LOCATION 2 as push pull (TX) and input (RX)
  // To avoid false start, configure output high
  GPIO->P[3].DOUT = (1 << 7);
  GPIO->P[3].MODEL = GPIO_P_MODEL_MODE7_PUSHPULL | GPIO_P_MODEL_MODE6_INPUT;
}

#elif defined(_EFM32_ZERO_FAMILY) || defined(EFM32TG108F4) \
  || defined(_EFM32_HAPPY_FAMILY)
#if defined(_EFM32_HAPPY_FAMILY)
__STATIC_INLINE void CONFIG_DebugGpioSetup(void)
{
  // Avoid false start by setting output high.
  GPIO->P[2].DOUT  = (1 << 0);
  GPIO->P[2].MODEL = GPIO_P_MODEL_MODE0_PUSHPULL | GPIO_P_MODEL_MODE1_INPUT;
}

#else
__STATIC_INLINE void CONFIG_DebugGpioSetup(void)
{
  // USART1, location 2:
  // TX: D7, RX: D6
  // To avoid false start, configure output high
  GPIO->P[3].DOUT = (1 << 7);
  GPIO->P[3].MODEL = GPIO_P_MODEL_MODE7_PUSHPULL | GPIO_P_MODEL_MODE6_INPUT;
}
#endif

__STATIC_INLINE void CONFIG_UsartGpioSetup(void)
{
  // LEUART0, location 3:
  // TX: F0, RX: F1
  GPIO->P[5].MODEL = GPIO_P_MODEL_MODE0_PUSHPULL | GPIO_P_MODEL_MODE1_INPUT;
}

#elif defined(_SILICON_LABS_32B_SERIES_0) \
  && (defined(_EFM32_GECKO_FAMILY) || defined(_EFM32_TINY_FAMILY))
__STATIC_INLINE void CONFIG_DebugGpioSetup(void)
{
  // Avoid false start by setting output high.
  GPIO->P[2].DOUT  = (1 << 0);  //lint !e835 

  GPIO->P[2].MODEL = GPIO_P_MODEL_MODE0_PUSHPULL | GPIO_P_MODEL_MODE1_INPUT;
}

__STATIC_INLINE void CONFIG_UsartGpioSetup(void)
{
  // Use USART0 location 0
  // 0 : TX - Pin E10, RX - Pin E11
  // Configure GPIO pins LOCATION 1 as push pull (TX)
  // and input (RX)
  // To avoid false start, configure output high
  GPIO->P[4].DOUT = (1 << 10); //lint !e960
  GPIO->P[4].MODEH = GPIO_P_MODEH_MODE10_PUSHPULL | GPIO_P_MODEH_MODE11_INPUT;
}

#elif defined(_SILICON_LABS_32B_SERIES_1)
__STATIC_INLINE void CONFIG_DebugGpioSetup(void)
{
  // Use LEUART0 TX and RX location 0 and the VCOM switch.
  // TX = port A pin 0, RX = port A pin 1, VCOM enable = port A pin 5.
  // Avoid false start by setting output high.
  GPIO->P[0].DOUT = (1 << 0) | (1 << 5);
  GPIO->P[0].MODEL = GPIO_P_MODEL_MODE0_PUSHPULL | GPIO_P_MODEL_MODE1_INPUT
					 | GPIO_P_MODEL_MODE5_PUSHPULL;
}

__STATIC_INLINE void CONFIG_UsartGpioSetup(void)
{
  // Use USART0 location 24
  // TX = port F pin 0, RX = port F pin 1
  // To avoid false start, configure output high
#if defined(USART_ON_LOC18_FOR_DEBUGGING)
  GPIO->P[3].DOUT = (1 << 10);
  GPIO->P[3].MODEH = GPIO_P_MODEH_MODE10_PUSHPULL | GPIO_P_MODEH_MODE11_INPUT;
#else
  GPIO->P[5].DOUT = (1 << 0);
  GPIO->P[5].MODEL = GPIO_P_MODEL_MODE0_PUSHPULL | GPIO_P_MODEL_MODE1_INPUT;
#endif
}

#else // GIANT/LEOPARD/WONDER
__STATIC_INLINE void CONFIG_DebugGpioSetup(void)
{
  // Avoid false start by setting output high.
  GPIO->P[1].DOUT = (1 << 9);
  GPIO->P[1].MODEH = GPIO_P_MODEH_MODE9_PUSHPULL | GPIO_P_MODEH_MODE10_INPUT;
}

__STATIC_INLINE void CONFIG_UsartGpioSetup(void)
{
  // Use USART0 location 0
  // 0 : TX - Pin E10, RX - Pin E11
  // Configure GPIO pins LOCATION 1 as push pull (TX)
  // and input (RX)
  // To avoid false start, configure output high
  GPIO->P[4].DOUT = (1 << 10);
  GPIO->P[4].MODEH = GPIO_P_MODEH_MODE10_PUSHPULL | GPIO_P_MODEH_MODE11_INPUT;
}
#endif

#endif
