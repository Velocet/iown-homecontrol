/**
  * @file    iown_mac.h
  * @author  iown-homecontrol
  * @brief   MAC layer definitions and functions
  *
  * #include <LibraryFile.h>
  * #include "LocalFile.h"
  *
  */

#pragma once
/* Define to prevent recursive inclusion */
#ifdef __cplusplus
  extern "C" {
#endif

#include "iown_frame.h"

#define IOWN_IS_BROADCAST_ADDR(addr) (memcmp(addr, iown_broadcast_nodeid, IOWN_LEN_HEADER_MAC) == 0)


#ifdef __cplusplus
}
#endif
