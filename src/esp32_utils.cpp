/**
  * @file    esp32_utils.cpp
  * @author  iown-homecontrol
  * @brief   ESP32 helper functions
  *
  * #include <LibraryFile.h>
  * #include "LocalFile.h"
  *
  */

#include <Arduino.h>

#if defined(ESP32)
  #include "esp32_api.h"
  #include "esp_crc.h"
  #include "esp_rom_crc.h"
#endif

#pragma region ESP32_CRC

/* Calculates the CRC if the packet has none.
   CRC-16/CCITT (KERMIT)
*/
uint16_t iown_crc_calc(uint8_t *iown_packet, uint8_t iown_packet_len) {
    // iown_packet_t *packet = (iown_packet_t *)iown_packet;

    // uint16_t crc, crc_cal = 0;
    // uint8_t len = 0;

    // len = packet->len + 1;

    // crc = esp_crc16_le(UINT16_MAX, (uint8_t const *)packet, len);

    // if(packet->crc == 0){ // Calculate CRC
    //   packet->crc = crc;
    //   return true;
    // }

    // else {  // Verify CRC
    //   return (packet->crc == crc) ? true : false;
    // }

    return -1;
}
#pragma endregion ESP32_CRC
