/**************************************************************************//**
 * @file flash.c
 * @brief Bootloader flash writing functions.
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

#include "config.h"
#include "flash.h"

#ifndef NDEBUG
#include <stdio.h>
#endif

#if defined(_SILICON_LABS_32B_SERIES_1)
#include "em_ldma.h"
static LDMA_Descriptor_t descr;
#else
// DMA Control block. We only need 1 block for transfers.
// This control block needs to be aligned to 256 byte boundaries.
#pragma location=0x20000100
__no_init volatile DMA_DESCRIPTOR_TypeDef descr;
#endif

/***************************************************************************//**
*
* @brief
*   Initializes the Flash programmer
*******************************************************************************/
void FLASH_init(void)
{
  // Write MSC unlock code to enable interface.
  MSC->LOCK = MSC_UNLOCK_CODE;

#if defined(EMU_CMD_EM01VSCALE2)
  // Scale voltage up to allow FLASH programming
  EMU->CMD = EMU_CMD_EM01VSCALE2;
  while (EMU->STATUS & EMU_STATUS_VSCALEBUSY);
#endif

  // Enable memory controller.
  MSC->WRITECTRL |= MSC_WRITECTRL_WREN;

#if defined(_SILICON_LABS_32B_SERIES_1)
  // Initialize LDMA controller.
  LDMA->CH[0].REQSEL = ldmaPeripheralSignal_MSC_WDATA;
  descr.xfer.size    = ldmaCtrlSizeWord;
  descr.xfer.dstInc  = ldmaCtrlDstIncNone;
  descr.xfer.link    = 0;
  descr.xfer.dstAddr = (uint32_t)&MSC->WDATA;

#else
  DMA->CONFIG = DMA_CONFIG_EN;          // Enable DMA.
  DMA->CTRLBASE = (uint32_t)&descr;     // Setup the DMA control block.
#endif
}

/**************************************************************************//**
 *
 * Programs a single word into flash.
 *
 * @param adr is the address of the word to program.
 * @param data is the word to program.
 *
 * This function will program one word into the on-chip flash.
 * Programming consists of ANDing the new data with the existing data; in
 * other words bits that contain 1 can remain 1 or be changed to 0, but bits
 * that are 0 can not be changed to 1.  Therefore, a word can be programmed
 * multiple times so long as these rules are followed; if a program operation
 * attempts to change a 0 bit to a 1 bit, that bit will not have its value
 * changed.
 *
 * This function will not return until the data has been programmed.
 *****************************************************************************/
__ramfunc void FLASH_writeWord(uint32_t adr, uint32_t data)
{
  // Check for an active transfer. If a transfer is in progress,
  // we have to delay. Normally, the USART transfer takes more time
  // than writing, but we have to make sure.
#if defined(_SILICON_LABS_32B_SERIES_1)
  while (LDMA->CHEN & 1);
#else
  while (DMA->CHENS & DMA_CHENS_CH0ENS);
#endif

  MSC->ADDRB    = adr;                     // Load address.
  MSC->WRITECMD = MSC_WRITECMD_LADDRIM;
  MSC->WDATA    = data;                    // Load data.
  MSC->WRITECMD = MSC_WRITECMD_WRITEONCE;  // Trigger write once.
  while (MSC->STATUS & MSC_STATUS_BUSY);   // Waiting for the write to complete.
}

/**************************************************************************//**
 *
 * Program flash.
 *
 * @param block_start is a pointer to the base of the flash.
 * @param offset_into_block is the offset to start writing.
 * @param count is the number of bytes to be programmed. Must be a multiple of
 * four.
 * @param buffer is a pointer to a buffer holding the data.
 *
 * This function uses DMA channel 0 to program a buffer of words into
 * onboard flash. It will start the DMA transfer, but will not wait for
 * it's completion. If a DMA transfer is alreay in progress when this
 * function is called, the function will stall waiting for the previous
 * transfer to complete.
 *
 * This function will program a sequence of words into the on-chip flash.
 * Programming consists of ANDing the new data with the existing data; in
 * other words bits that contain 1 can remain 1 or be changed to 0, but bits
 * that are 0 can not be changed to 1.  Therefore, a word can be programmed
 * multiple times so long as these rules are followed; if a program operation
 * attempts to change a 0 bit to a 1 bit, that bit will not have its value
 * changed.
 *
 * Since the flash is programmed a word at a time, the starting address and
 * byte count must both be multiples of four.  It is up to the caller to
 * verify the programmed contents, if such verification is required.
 *****************************************************************************/
__ramfunc void FLASH_writeBlock(void *block_start,
                                uint32_t offset_into_block,
                                uint32_t count,
                                uint8_t const *buffer)
{
#if defined(_SILICON_LABS_32B_SERIES_1)
  while (LDMA->CHEN & 1);                     // Wait for transfer completion.
  while (MSC->STATUS & MSC_STATUS_BUSY);      // Waiting for flash ready.

  MSC->ADDRB    = (uint32_t)block_start + offset_into_block;
  MSC->WRITECMD = MSC_WRITECMD_LADDRIM;

  // Set up a basic memory to peripheral DMA transfer.
  descr.xfer.xferCnt = (count/4)-2;
  descr.xfer.srcAddr = (uint32_t)buffer + 4;
  LDMA->CH[0].LINK   = (uint32_t)&descr & _LDMA_CH_LINK_LINKADDR_MASK;
  LDMA->LINKLOAD = 1;
  LDMA->CHEN     = 1;

  MSC->WDATA    = *(uint32_t *)buffer;      // Load first word into the DMA.
  MSC->WRITECMD = MSC_WRITECMD_WRITETRIG;   // Trigger the transfer.

#else
  // Check for an active transfer. If a transfer is in progress,
  // we have to delay. Normally, the USART transfer takes more time
  // than writing, but we have to make sure.
  while (DMA->CHENS & DMA_CHENS_CH0ENS);

  // Set up a basic memory to peripheral DMA transfer.
  // Load the start address into the MSC.
  MSC->ADDRB    = (uint32_t)block_start + offset_into_block;
  MSC->WRITECMD = MSC_WRITECMD_LADDRIM;

  // Set the MSC as the destination.
  descr.DSTEND = (void *)&MSC->WDATA;

  // Set up the end pointer to copy from the buffer.
  descr.SRCEND = (void *)(buffer + count - 4);

  // Control information.
  descr.CTRL = DMA_CTRL_DST_INC_NONE       // Do not increment destination.
               | DMA_CTRL_DST_SIZE_WORD    // Transfer whole words at a time.
               | DMA_CTRL_SRC_INC_WORD     // Write one word at the time.
               | DMA_CTRL_SRC_SIZE_WORD    // Transfer whole words at a time.
               | DMA_CTRL_R_POWER_1
               | DMA_CTRL_CYCLE_CTRL_BASIC // Basic transfer.
                                           // Number of transfers minus two.
                                           // This field contains the number of transfers minus 1.
                                           // Because one word is transerred using WRITETRIG we
                                           // need to subtract one more
               | (((count / 4) - 2) << _DMA_CTRL_N_MINUS_1_SHIFT);

  // Set channel to trigger on MSC ready for data.
  DMA->CH[0].CTRL = DMA_CH_CTRL_SOURCESEL_MSC
                    | DMA_CH_CTRL_SIGSEL_MSCWDATA;

  MSC->WDATA = *(uint32_t *)buffer;         // Load first word into the DMA.
  DMA->CHENS = DMA_CHENS_CH0ENS;            // Activate channel 0.
  MSC->WRITECMD = MSC_WRITECMD_WRITETRIG;   // Trigger the transfer.
#endif
}


/**************************************************************************//**
 *
 * Erase a block of flash.
 *
 * @param blockStart is the start address of the flash block to be erased.
 *
 * This function will erase one blocks on the on-chip flash.  After erasing,
 * the block will be filled with 0xff bytes.  Read-only and execute-only
 * blocks can not be erased.
 *
 * This function will not return until the block has been erased.
 *****************************************************************************/
__ramfunc void FLASH_eraseOneBlock(uint32_t blockStart)
{
  uint32_t acc = 0xFFFFFFFF;
  uint32_t *ptr;

  // Optimization - check if block is allready erased.
  // This will typically happen when the chip is new.
  for (ptr = (uint32_t *)blockStart;
       ptr < (uint32_t *)(blockStart + FLASH_PAGE_SIZE);
       ptr++)
    acc &= *ptr;

  // If the accumulator is unchanged, there is no need to do an erase.
  if (acc != 0xFFFFFFFF)
  {
    MSC->ADDRB    = blockStart;               // Load address.
    MSC->WRITECMD = MSC_WRITECMD_LADDRIM;
    MSC->WRITECMD = MSC_WRITECMD_ERASEPAGE;   // Send Erase Page command.
    while (MSC->STATUS & MSC_STATUS_BUSY);    // Waiting for erase to complete.
  }
}
