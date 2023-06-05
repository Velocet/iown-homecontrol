/**************************************************************************//**
 * @file bootloader.c
 * @brief EFM32 Bootloader. Preinstalled on all new EFM32 devices
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

#include <stdbool.h>
#include "em_device.h"
#include "usart.h"
#include "xmodem.h"
#include "boot.h"
#include "debuglock.h"
#include "autobaud.h"
#include "crc.h"
#include "config.h"
#include "flash.h"
#include "characters.h"
#include "efm32gg-defines.h"
	 
#ifndef UNIT_TEST  // Don't include if unit test
#include "version.h"
#endif

#ifndef NDEBUG
#include "debug.h"
#include <stdio.h>
#endif


// Vector table in RAM. We construct a new vector table to conserve space in
// flash as it is sparsly populated.
#pragma location=0x20000000
#if (_SILICON_LABS_32B_SERIES_1_CONFIG == 2) \
  || (_SILICON_LABS_32B_SERIES_1_CONFIG == 3) \
  || ((_SILICON_LABS_32B_SERIES_1_CONFIG == 1) && defined(_EFM32_GIANT_FAMILY))\
  || ((_SILICON_LABS_32B_SERIES_1_CONFIG == 1) && defined(_EFM32_TINY_FAMILY))
__no_init uint32_t vectorTable[48];
#else
__no_init uint32_t vectorTable[47];
#endif

// This variable holds the computed CRC-16 of the bootloader and is used during
// production testing to ensure the correct programming of the bootloader.
// This can safely be omitted if you are rolling your own bootloader.
#if (_SILICON_LABS_32B_SERIES_1_CONFIG == 2) \
  || (_SILICON_LABS_32B_SERIES_1_CONFIG == 3) \
  || ((_SILICON_LABS_32B_SERIES_1_CONFIG == 1) && defined(_EFM32_GIANT_FAMILY))\
  || ((_SILICON_LABS_32B_SERIES_1_CONFIG == 1) && defined(_EFM32_TINY_FAMILY))
#pragma location=0x200000c0
#else
#pragma location=0x200000bc
#endif
__no_init uint16_t bootloaderCRC;

// If this flag is set the bootloader will be reset when the RTC expires.
// This is used when autobaud is started. If there has been no synchronization
// until the RTC expires the entire bootloader is reset.
// Essentially, this makes the RTC work as a watchdog timer.
bool resetEFM32onRTCTimeout = false;

// Holds flashsize as read from DI page.
uint32_t flashSize;

__ramfunc __noreturn void commandlineLoop(void);
__ramfunc void verify(uint32_t start, uint32_t end);

#if defined(_SILICON_LABS_32B_SERIES_1)
#define RTC_IRQ           RTCC_IRQn
#define RTC_INT_HANDLER   RTCC_IRQHandler
#define RTC_INT_CLEAR()   RTCC->IFC = _RTCC_IFC_MASK
#define RTC_INT_ENABLE()  RTCC->IEN = RTCC_IEN_CC1
#define RTC_COMPSET(x)    RTCC->CC[1].CCV = (x)
#define RTC_START()       RTCC->CTRL = RTCC_CTRL_DEBUGRUN | RTCC_CTRL_ENABLE \
									   | RTCC_CTRL_CCV1TOP;                  \
						  RTCC->CC[1].CTRL = RTCC_CC_CTRL_MODE_OUTPUTCOMPARE \
											 | RTCC_CC_CTRL_ICEDGE_NONE

#else
#define RTC_IRQ           RTC_IRQn
#define RTC_INT_HANDLER   RTC_IRQHandler
#define RTC_INT_CLEAR()   RTC->IFC = RTC_IFC_COMP1 | RTC_IFC_COMP0 | RTC_IFC_OF
#define RTC_INT_ENABLE()  RTC->IEN = RTC_IEN_COMP0
#define RTC_COMPSET(x)    RTC->COMP0 = (x)
#define RTC_START()       RTC->CTRL = RTC_CTRL_COMP0TOP | RTC_CTRL_DEBUGRUN | RTC_CTRL_EN
#endif
											   
#define AES_IRQ           AES_IRQn                                               

/**************************************************************************//**
 * Strings.
 *****************************************************************************/
uint8_t crcString[]     = "\r\nCRC: ";
uint8_t newLineString[] = "\r\n";
uint8_t readyString[]   = "\r\nReady\r\n";
uint8_t okString[]      = "\r\nOK\r\n";
uint8_t failString[]    = "\r\nFail\r\n";
uint8_t unknownString[] = "\r\n?\r\n";
uint8_t chipID[]        = " ChipID: ";

static uint8_t printVersion[24]; 
static uint8_t versionDigit[3];


/**************************************************************************//**
 * Function prototypes.
 *****************************************************************************/
static void createBuildVersionArray(void);
static void generateVectorTable(void);
static __ramfunc void PrintIdOnUart(void);



/**************************************************************************//**
 * @brief RTC IRQ Handler
 *   The RTC is used to keep the power consumption of the bootloader down while
 *   waiting for the pins to settle, or work as a watchdog in the autobaud
 *   sequence.
 *****************************************************************************/
void RTC_INT_HANDLER(void)
{
  RTC_INT_CLEAR();                  // Clear interrupt flags.
  if (resetEFM32onRTCTimeout)       // Check if EFM should be reset on timeout.
  {
#ifndef NDEBUG
	printf("Autobaud Timeout. Resetting EFM32.\r\n");
#endif
	// Write to the Application Interrupt/Reset Command Register to reset
	// the EFM32. See section 9.3.7 in the reference manual.
	SCB->AIRCR = 0x05FA0004;
  }
}

/**************************************************************************//**
 * @brief
 *   This function is an infinite loop. It actively waits for one of the
 *   following conditions to be true:
 *   1) The SWCLK Debug pins is not asserted and a valid application is
 *      loaded into flash.
 *      In this case the application is booted.
 *   OR:
 *   2) The SWCLK pin is asserted and there is an incoming packet
 *      on the USART RX line
 *      In this case we start sensing to measure the baudrate of incoming packets.
 *
 *   If none of these conditions are met, the EFM32G is put to EM2 sleep for
 *   250 ms.
 *****************************************************************************/
static void waitForBootOrUSART(void)
{
  uint32_t SWDpins;
#ifndef NDEBUG
  uint32_t oldPins = 0xf;
#endif

  // Initialize RTC/RTCC.
  RTC_INT_CLEAR();                    // Clear interrupt flags.
  RTC_COMPSET((PIN_LOOP_INTERVAL * LFRCO_FREQ) / 1000); // 250 ms wakeup time.
  RTC_INT_ENABLE();                   // Enable interrupt on compare channel.
  NVIC_EnableIRQ(RTC_IRQ);            // Enable RTC interrupt.
  RTC_START();                        // Start RTC.

  while (1)
  {
	// The SWCLK signal is used to determine if the application
	// Should be booted or if the bootloader should be started
	// SWCLK (F0) has an internal pull-down and should be pulled high
	// to enter bootloader mode.

	// Check input pins.
	SWDpins = GPIO->P[5].DIN & 0x1;

#ifndef NDEBUG
	if (oldPins != SWDpins)
	{
	  oldPins = SWDpins;
	  printf("New pin: %x \r\n", SWDpins);
	}
#endif

	// Check if pins are not asserted AND firmware is valid.
	if ((SWDpins != 0x1) && (BOOT_checkFirmwareIsValid()))
	{
	  // Boot application.
#ifndef NDEBUG
	  printf("Booting application \r\n");
#endif
	  BOOT_boot();
	}

	// SWCLK (F0) is pulled high and SWDIO (F1) is pulled low.
	// Enter bootloader mode.
	if (SWDpins == 0x1)
	{
	  // Increase timeout to 30 seconds.
	  RTC_COMPSET(AUTOBAUD_TIMEOUT * LFRCO_FREQ);
	  // If this timeout occurs the EFM32 is rebooted. This is
	  // done so that the bootloader cannot get stuck in autobaud sequence.
	  resetEFM32onRTCTimeout = true;
#ifndef NDEBUG
	  printf("Starting autobaud sequence\r\n");
#endif
	  return;
	}
	// Go to EM2 and wait for RTC wakeup.
	SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk;
	__WFI();
  }
}

/**************************************************************************//**
 * @brief
 *   Helper function to print flash write verification using CRC
 * @param start
 *   The start of the block to calculate CRC of.
 * @param end
 *   The end of the block. This byte is not included in the checksum.
 *****************************************************************************/
__ramfunc void verify(uint32_t start, uint32_t end)
{
  USART_printString(crcString);
  USART_printHex(CRC_calc((void *) start, (void *) end));
  USART_printString(newLineString);
}


/**************************************************************************//**
 * @brief
 *   Print ID on UART
 *****************************************************************************/
__ramfunc void PrintIdOnUart(void)
{   
  // Send bootloader version on UART
  USART_printString(newLineString);
  USART_printString(printVersion);
 
  // Send the chip ID on UART. This is useful for production tracking.
  USART_printString(chipID);
  USART_printHex(DEVINFO->UNIQUEH);
  USART_printHex(DEVINFO->UNIQUEL);
  USART_printString(newLineString);
}


/**************************************************************************//**
 * @brief
 *   Lock the debug interface if no debug session is active
 *****************************************************************************/
__ramfunc void debugLock(void)
{
	uint8_t *returnString;
	
#ifndef NDEBUG  
	static uint8_t debugActiveMsg[] = "Debug active.\r\n";
#endif
	
#if !defined(NDEBUG) && defined( CoreDebug )
	  // We check if there is a debug session active in DHCSR. If there is we
	  // abort the locking. This is because we wish to make sure that the debug
	  // lock functionality works without a debugger attatched.
	  if ((CoreDebug->DHCSR & CoreDebug_DHCSR_C_DEBUGEN_Msk) != 0x0)
	  {
	  //printf("\r\n\r\n **** WARNING: DEBUG SESSION ACTIVE. NOT LOCKING!  **** \r\n\r\n");
	  USART_printString(debugActiveMsg);
	  }
	  else
	  {
	  //printf("Starting debug lock sequence.\r\n");
#endif
		if (DEBUGLOCK_lock())
		{
		  returnString = okString;
		}
		else
		{
		  returnString = failString;
		}
		USART_printString(returnString);

#if !defined(NDEBUG) && defined( CoreDebug )
	  //printf("Debug lock word: 0x%x \r\n", *(uint32_t *)DEBUG_LOCK_WORD_ADDR);
	}
#endif
}


/**************************************************************************//**
 * @brief
 *   The main command line loop. Placed in Ram so that it can still run after
 *   a destructive write operation.
 *   NOTE: __ramfunc is a IAR specific instruction to put code into RAM.
 *   This allows the bootloader to survive a destructive upload.
 *****************************************************************************/
__ramfunc __noreturn void commandlineLoop(void)
{
  uint8_t  c;

  while (1)                                     // The main command loop.
  {
	c = USART_rxByte();                         // Retrieve new character.
	if (c != 0)
	{
	  USART_txByte(c);                          // Echo the char
	}
	switch (c)
	{
	case CHARACTER_u:                                   // Non encrypted application upload.
	  USART_printString(readyString);
	  XMODEM_download(APPLICATION_START_ADDR, flashSize, NOT_ENCRYPTED);
	  break;

	case CHARACTER_e:                                   // Encrypted application upload.
	  USART_printString(readyString);
	  XMODEM_download(APPLICATION_START_ADDR, flashSize, ENCRYPTED);
	  break;

	case CHARACTER_t:                                   // Write to user page.
	  USART_printString(readyString);
	  XMODEM_download(USER_PAGE_START_ADDR, USER_PAGE_END_ADDR, NOT_ENCRYPTED);
	  break;

	case CHARACTER_p:                                   // Write to lock bits.
#if defined( CoreDebug )        // In core_cmX.h.
	  DEBUGLOCK_startDebugInterface();
#endif
	  USART_printString(readyString);
#if defined(USART_OVERLAPS_WITH_BOOTLOADER) && defined( CoreDebug )
	  // Since the UART overlaps, the bit-banging in
	  // DEBUGLOCK_startDebugInterface() will generate some traffic. To avoid
	  // interpreting this as UART communication, we need to flush the
	  // UART data buffers.
	  BOOTLOADER_USART->CMD = BOOTLOADER_USART_CLEARRX;
#endif
	  XMODEM_download(LOCK_PAGE_START_ADDR, LOCK_PAGE_END_ADDR, NOT_ENCRYPTED);
	  break;

	case CHARACTER_b:             // Boot into new program.
	  BOOT_boot();
	  break;

	case CHARACTER_l:             // Debug lock.
	  debugLock();
	  break;   
	  
	case CHARACTER_i:             // Send build number and chip ID on UART
		PrintIdOnUart();
	  break;

	case CHARACTER_v:             // Verify content by calculating CRC of entire flash.
	  verify(0, flashSize);
	  break;

	case CHARACTER_c:             // Verify content by calculating CRC of application area.
	  verify(APPLICATION_START_ADDR, flashSize);
	  break;

	case CHARACTER_n:             // Verify content by calculating CRC of user page.
	  verify(USER_PAGE_START_ADDR, USER_PAGE_END_ADDR);
	  break;

	case CHARACTER_m:             // Verify content by calculating CRC of lock page.
	  verify(LOCK_PAGE_START_ADDR, LOCK_PAGE_END_ADDR);
	  break;

	case CHARACTER_r:             // Reset command.
	  // Write to the Application Interrupt/Reset Command Register to reset
	  // the EFM32. See section 9.3.7 in the reference manual.
	  SCB->AIRCR = 0x05FA0004;
	  break;

	  break;

	default:
	  USART_printString(unknownString);
	  //lint -fallthrough
	case 0:               // Unknown command.
	  // Timeout waiting for RX - avoid printing the unknown string.
	  break;
	}
  }
}

/**************************************************************************//**
 * @brief  Create a new vector table in RAM.
 *         We generate it here to conserve space in flash.
 *****************************************************************************/
static void generateVectorTable(void)
{
#if defined(_SILICON_LABS_32B_SERIES_1)
  vectorTable[RTC_IRQ + 16]             = (uint32_t)RTC_INT_HANDLER;

#else
  vectorTable[AUTOBAUD_TIMER_IRQn + 16] = (uint32_t) TIMER_IRQHandler;
  vectorTable[RTC_IRQ + 16]             = (uint32_t)RTC_INT_HANDLER;
  vectorTable[AES_IRQ + 16]             = (uint32_t)AES_IRQHandler;
#ifdef USART_OVERLAPS_WITH_BOOTLOADER
  vectorTable[GPIO_EVEN_IRQn + 16]      = (uint32_t) GPIO_IRQHandler;
#endif
#endif
  SCB->VTOR                             = (uint32_t)vectorTable;
}


/**************************************************************************//**
 * @brief  Create an array containing the build number as '.' separated ASCCI
 * characters for printing on UART.
 *****************************************************************************/
static void createBuildVersionArray()
{
  uint8_t i, j, k, nofDigits, singleNumber;
  uint8_t buildVersion[6];
  
  // Convert struct to array of ASCII numbers with '.' as spacers

  buildVersion[COMMAND_VERSION_NUMBER] = stBuildVersion.bCommandVersionNumber;   
  buildVersion[VERSION_WHOLE_NUMBER]   = stBuildVersion.bVersionWholeNumber;
  buildVersion[VERSION_SUB_NUMBER]     = stBuildVersion.bVersionSubNumber;	
  buildVersion[BRANCH_ID]              = stBuildVersion.bBranchID;	
  buildVersion[BUILD_NUMBER]           = stBuildVersion.bBuildNumber;
  buildVersion[MICRO_BUILD]            = stBuildVersion.bMicroBuild;
  
  j = 0;
  
  for (i = 0; i < BOOTLOADER_BUILD_INFORMATION_LENGTH; i++)
  {
	nofDigits = 0;
	singleNumber = buildVersion[i];   
	
	// Find digets in this number
	do
	{
	  versionDigit[2 - nofDigits] = singleNumber - (uint8_t)((singleNumber / 10)*10);
	  singleNumber = (uint8_t)(singleNumber/10);
	  nofDigits++;
	}while (singleNumber > 0);
	
	for (k = 0; k < nofDigits ; k++)
	{
	  printVersion[j] = versionDigit[k + (3-nofDigits)]+0x30; 
	  j++;
	}    
	
	if(i < BOOTLOADER_BUILD_INFORMATION_LENGTH - 1)
	{
		printVersion[j] = CHARACTER_DOT;
		j++;
	}    
  }
  
  // Null termination
  printVersion[j] = CHARACTER_NULL;
}


/**************************************************************************//**
 * @brief  Main function
 *****************************************************************************/
__noreturn void main(void)
{
#if !defined(_SILICON_LABS_32B_SERIES_1)
  uint32_t periodTime24_8;
  uint32_t tuning;
#endif
#if !defined(_SILICON_LABS_32B_SERIES_1) || !defined(NDEBUG)
  uint32_t clkdiv;
#endif

  // Generate a new vector table and place it in RAM.
  generateVectorTable();

  // Calculate CRC16 for the bootloader itself and the Device Information page.
  // This is used for production testing and can safely be omitted in
  // your own code.
  bootloaderCRC  = CRC_calc((void *)BOOTLOADER_START_ADDR,
							(void *)BOOTLOADER_END_ADDR);
  bootloaderCRC |= CRC_calc((void *)(DEVINFO_START_ADDR + 2),
							// Skip first 2 bytes, they are DEVINFO crc.
							(void *)DEVINFO_END_ADDR)
				   << 16;
  // End safe to omit.

  // Enable clocks for peripherals.
#if defined(_SILICON_LABS_32B_SERIES_1)
  CMU->CTRL        = CMU_CTRL_HFPERCLKEN;
  CMU->HFBUSCLKEN0 = CMU_HFBUSCLKEN0_GPIO | CMU_HFBUSCLKEN0_LE
					 | CMU_HFBUSCLKEN0_LDMA;

  // Enable LFRCO for RTC.
  CMU->LFECLKSEL = CMU_LFECLKSEL_LFE_LFRCO;
  CMU->LFECLKEN0 = CMU_LFECLKEN0_RTCC;
  CMU->OSCENCMD  = CMU_OSCENCMD_LFRCOEN;
#else
  CMU->HFPERCLKDIV = CMU_HFPERCLKDIV_HFPERCLKEN;
  CMU->HFPERCLKEN0 = CMU_HFPERCLKEN0_GPIO | BOOTLOADER_USART_CLOCKEN |
					 AUTOBAUD_TIMER_CLOCK ;

  // Enable LE and DMA interface.
  CMU->HFCORECLKEN0 = CMU_HFCORECLKEN0_LE | CMU_HFCORECLKEN0_DMA;

  // Enable LFRCO for RTC.
  CMU->OSCENCMD = CMU_OSCENCMD_LFRCOEN;
  // Setup LFA to use LFRCRO.
  CMU->LFCLKSEL = CMU_LFCLKSEL_LFA_LFRCO | CMU_LFCLKSEL_LFB_HFCORECLKLEDIV2;
  // Enable RTC.
  CMU->LFACLKEN0 = CMU_LFACLKEN0_RTC;
#endif

  // Find the size of the flash. DEVINFO->MSIZE is the size in KB,
  // so left shift by 10.
  flashSize = ((DEVINFO->MSIZE & _DEVINFO_MSIZE_FLASH_MASK)
			   >> _DEVINFO_MSIZE_FLASH_SHIFT)
			  << 10;

#ifndef NDEBUG
  DEBUG_init();
  printf("\r\n\r\n *** Debug output enabled. ***\r\n\r\n");
#endif

  // Wait for a boot operation.
  waitForBootOrUSART();

#if defined( BOOTLOADER_LEUART_CLOCKEN )
  // Enable LEUART.
  CMU->LFBCLKEN0 = BOOTLOADER_LEUART_CLOCKEN;
#endif

#if defined(_SILICON_LABS_32B_SERIES_0)
#if defined (_DEVINFO_HFRCOCAL1_BAND28_MASK)
  // Change to 28MHz internal oscillator to increase speed of
  // bootloader.
  tuning = (DEVINFO->HFRCOCAL1 & _DEVINFO_HFRCOCAL1_BAND28_MASK)
		   >> _DEVINFO_HFRCOCAL1_BAND28_SHIFT;

  CMU->HFRCOCTRL = CMU_HFRCOCTRL_BAND_28MHZ | tuning;
#ifndef NDEBUG
  // Set new clock division based on the 28Mhz clock.
  DEBUG_USART->CLKDIV = 3634;
#endif

#elif defined(_DEVINFO_HFRCOCAL1_BAND21_MASK)
  // Change to 21MHz internal oscillator to increase speed of
  // bootloader.
  tuning = ((DEVINFO->HFRCOCAL1 & _DEVINFO_HFRCOCAL1_BAND21_MASK)
		   >> _DEVINFO_HFRCOCAL1_BAND21_SHIFT);

  CMU->HFRCOCTRL = CMU_HFRCOCTRL_BAND_21MHZ | tuning;
#ifndef NDEBUG
  // Set new clock division based on the 21Mhz clock.
  DEBUG_USART->CLKDIV = 2661;
#endif

#else
#error "Can not make correct clock selection."
#endif
#endif

  // Setup pins for USART.
  CONFIG_UsartGpioSetup();

#if defined(_SILICON_LABS_32B_SERIES_1)
  CMU->HFPERCLKEN0 |= BOOTLOADER_USART_CLOCKEN;
  USART_init(USART_CLKDIV_AUTOBAUDEN);
  // Wait for autobaud completion.
  while (BOOTLOADER_USART->CLKDIV == USART_CLKDIV_AUTOBAUDEN);
#ifndef NDEBUG
  clkdiv = BOOTLOADER_USART->CLKDIV & ~USART_CLKDIV_AUTOBAUDEN;
#endif

#else
  // AUTOBAUD_sync() returns a value in 24.8 fixed point format.
  periodTime24_8 = AUTOBAUD_sync();
#ifndef NDEBUG
  printf("Measured periodtime (24.8): %d.%d\r\n", periodTime24_8 >> 8, periodTime24_8 & 0xFF);
#endif
#endif
#ifndef NDEBUG
  printf("Autobaud complete.\r\n");
#endif

  // When autobaud has completed, we can be fairly certain that
  // the entry into the bootloader is intentional so we can disable the timeout.
  NVIC_DisableIRQ(RTC_IRQ);

#if defined( BOOTLOADER_LEUART_CLOCKEN )
  clkdiv = (periodTime24_8 >> 1) - 256;
#elif !defined(_SILICON_LABS_32B_SERIES_1)
  // To go from the period to the necessary clkdiv we need to use
  // Equation 16.2 in the reference manual. Note that
  // periodTime = HFperclk / baudrate.
  clkdiv = (periodTime24_8 - (16 << 8)) >> 4;

  // Check if the clock division is too small, if it is, we change
  // to an oversampling rate of 4x and calculate a new clkdiv.
  if (clkdiv < 3000)
  {
	clkdiv = (periodTime24_8 - (4 << 8)) >> 2;
	BOOTLOADER_USART->CTRL |= USART_CTRL_OVS_X4;
  }
#endif
#ifndef NDEBUG
  printf("BOOTLOADER_USART clkdiv = %d\r\n", clkdiv);
#endif

#if !defined(_SILICON_LABS_32B_SERIES_1)
  // Initialize the UART.
  USART_init(clkdiv);
#endif

  // Convert struct to byte array with ASCII numbers and '.' as spacers
  createBuildVersionArray();
  
  // Print a message to show that we are in bootloader mode.
  PrintIdOnUart();


  // Initialize flash for writing.
  FLASH_init();

  // Start executing command line.
  commandlineLoop();
}
