/**
  * @file    iown_frame.h
  * @author  iown-homecontrol
  * @brief   Frame definitions and functions
  *
  * #include <LibraryFile.h>
  * #include "LocalFile.h"
  *
  * Frame (incl. CRC) F8 00 00003F 1A380B 00 01 61 0000 80D8 0500 02A6 24222E8BA351 5F52
  * FRAME = PREAMBLE
  *         SYNC_WORD (SFD = START_FRAME_DELIMITER)
  *         PACKET
  *         FCS (FRAME_CHECK_SEQUENCE)
  *         INTERFRAME_GAP
  *         PACKET = FRAME_CONTROL (CTRL_BYTE_1 + CTRL_BYTE_2)
  *         MAC (SENDER_NODE_ID + DESTINATION_NODE_ID)
  *         PAYLOAD (CMD + PARAMETER + [ROLLING_CODE + HMAC])
  *
  */

#pragma once
/* Define to prevent recursive inclusion */
#ifdef __cplusplus
  extern "C" {
#endif

#include "iown_mac.h"

#pragma region IOWN_LENGTH_DEFS /* ioHC Length Definitions */
// Packet Elements Length Definitions
#define IOWN_LEN_CTRL_BYTE_1  1
#define IOWN_LEN_CTRL_BYTE_2  1
#define IOWN_LEN_NODEID       3  /*!< Length of ioHC nodeID */
#define IOWN_LEN_CMD          1
#define IOWN_LEN_PARAMETER    1  // IOWN_LEN_PARAMETER(cmd_id) (/* TODO calc data based on CommandID */)
#define IOWN_LEN_ROLLING_CODE 2
#define IOWN_LEN_HMAC         6

// Header Length Definitions
#define IOWN_LEN_HEADER_FRAME_CONTROL (IOWN_LEN_CTRL_BYTE_1 + IOWN_LEN_CTRL_BYTE_2)
#define IOWN_LEN_HEADER_MAC           (IOWN_LEN_NODEID * 2) /*!< Length of ioHC MAC header */
#define IOWN_LEN_PAYLOAD              (IOWN_LEN_CMD + IOWN_LEN_PARAMETER)

// Packet Length Definitions
#define IOWN_LEN_PACKET_1W (IOWN_LEN_HEADER_FRAME_CONTROL + IOWN_LEN_HEADER_MAC + IOWN_LEN_PAYLOAD + IOWN_LEN_ROLLING_CODE + IOWN_LEN_HMAC)
#define IOWN_LEN_PACKET_2W (IOWN_LEN_HEADER_FRAME_CONTROL + IOWN_LEN_HEADER_MAC + IOWN_LEN_PAYLOAD)
#define IOWN_LEN_PACKET(IOWN_MODE) ((IOWN_MODE == IOWN_MODE_1W) ? (IOWN_LEN_PACKET_1W) : (IOWN_LEN_PACKET_2W))

// Frame Length Definitions
#define IOWN_LEN_SYNC_WORD 2
#define IOWN_LEN_CRC       2
#define IOWN_LEN_FRAME(IOWN_MODE) (IOWN_LEN_SYNC_WORD + IOWN_LEN_PACKET(IOWN_MODE) + IOWN_LEN_CRC)
#pragma endregion IOWN_LENGTH_DEFS

#define IOWN_FRAME_SIZE_MASK       ((1 << 5) - 1) /* Get the last 5 bits */
#define IOWN_FRAME_SIZE(CTRLBYTE1) (CTRLBYTE1 & IOWN_FRAME_SIZE_MASK)


#ifdef __cplusplus
}
#endif
