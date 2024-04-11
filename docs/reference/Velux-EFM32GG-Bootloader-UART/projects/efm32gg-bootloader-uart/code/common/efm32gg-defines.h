/*****************************************************************************
*                                                                            *
*                               VELUX A/S                                    *
*                                                                            *
*****************************************************************************/

#ifndef EFM32GGDEFINES_H
#define EFM32GGDEFINES_H 1

/**
* @file efm32gg-defines.h
* @brief This file contains defines that are missing from the Gecko-sdk used. 
* @addtogroup prod_setup Product setup
* @{
*   @addtogroup common Common
*   @{
*/


/*----------------------------------------------------------------------------
                               Defines
----------------------------------------------------------------------------*/

/**< Universal Asynchronous Receiver/Transmitter 1 Clock Enable */
// This define can be found in include files for various other micros, but
// for some reason not for EFM32GG230. This define is the same for all other
// micros in the sdk.
// It is varified by EFM32GG Reference Manual page
// (2016-04-28 - Giant Gecko Family - d0053_Rev1.20, page 151), that it is in 
// fact bit 4 in "High Frequency Peripheral Clock Enable Register 0"
#define CMU_HFPERCLKEN0_UART1      (0x1UL << 4)                         


/**< UART1 base address  */
// It is varified by EFM32GG Reference Manual page
// (2016-04-28 - Giant Gecko Family - d0053_Rev1.20, table 5.3, page 19), 
// that the base address of UART1 is 0x4000E400
#define UART1_BASE        (0x4000E400UL)  


/**< UART1 base pointer */
#define UART1    ((USART_TypeDef *) UART1_BASE)         

/**
*   @}
* @}
*/

#endif
/*----------------------------------------------------------------------------
                          End definition file
----------------------------------------------------------------------------*/

