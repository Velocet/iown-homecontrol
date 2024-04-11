/***************************************************************************//**
 * @file key.h
 * @brief Contains key and counter for AES CTR decryption
 * @author VELUX
 * @version 1.00
 *******************************************************************************
 * @section License
 * <b>(C) Copyright 2018 VELUX</b>
 ******************************************************************************/
#ifndef __KEY_H
#define __KEY_H

#define DUMMY_SECRETS  

/** Number of bytes in counter ( Initialization Vector (IV) ) */
#define COUNTER_LENGTH  16

static uint8_t decryptionKey[] = 
                             { 0x2B, 0x7E, 0x15, 0x16, 0x28, 0xAE, 0xD2, 0xA6, 
                               0xAB, 0xF7, 0x15, 0x88, 0x09, 0xCF, 0x4F, 0x3C};

#endif
