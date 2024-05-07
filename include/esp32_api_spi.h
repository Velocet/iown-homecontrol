/**
  * @file    esp32_api_spi.h
  * @author  iown-homecontrol
  * @brief   ESP32 SPI functions
  *
  * #include <LibraryFile.h>
  * #include "LocalFile.h"
  *
  */

#include <Arduino.h>

#pragma once
#ifdef __cplusplus
  extern "C" {
#endif

#include <driver/spi_master.h>

uint8_t GetLowBits();
int8_t GetHighBits();

int fInitializeSPI_Channel( int spiCLK, int spiMOSI, int spiMISO, spi_host_device_t SPI_Host, bool EnableDMA);
int fInitializeSPI_Devices( spi_device_handle_t &h, int csPin);
int fReadSPIdata16bits( spi_device_handle_t &h, int address );
int fWriteSPIdata8bits( spi_device_handle_t &h, int address, int sendData );

#ifdef __cplusplus
}
#endif
