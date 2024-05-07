/**
  * @file    iown_mac.cpp
  * @author  iown-homecontrol
  * @brief   MAC header and NodeID
  *
  * #include <LibraryFile.h>
  * #include "LocalFile.h"
  *
  */

#include "iown.h"

static uint8_t iown_nodeid_broadcast[IOWN_LEN_HEADER_MAC] = { 0x00, 0x00, 0x3F };
