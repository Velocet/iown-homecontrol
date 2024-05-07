/**
  * @file    esp32_api_spi.cpp
  * @author  iown-homecontrol
  * @brief   ESP32 SPI functions
  *
  * #include <LibraryFile.h>
  * #include "LocalFile.h"
  *
  */

#include "esp32_api_spi.h"

uint8_t txData[2] = {};
uint8_t rxData[25] = {};
uint8_t low;
uint8_t high;

uint8_t GetLowBits() {return low;}
int8_t GetHighBits() {return high;}

int fInitializeSPI_Channel( int spiCLK, int spiMOSI, int spiMISO, spi_host_device_t SPI_Host, bool EnableDMA) {
  esp_err_t intError;
  spi_bus_config_t bus_config = { };
  bus_config.sclk_io_num = spiCLK; // CLK
  bus_config.mosi_io_num = spiMOSI; // MOSI
  bus_config.miso_io_num = spiMISO; // MISO
  bus_config.quadwp_io_num = -1; // Not used
  bus_config.quadhd_io_num = -1; // Not used
  intError = spi_bus_initialize(HSPI_HOST, &bus_config, EnableDMA);
  return intError;
}

int fInitializeSPI_Devices( spi_device_handle_t &h, int csPin) {
  esp_err_t intError;
  spi_device_interface_config_t dev_config = { };  // initializes all field to 0
  dev_config.address_bits     = 0;
  dev_config.command_bits     = 0;
  dev_config.dummy_bits       = 0;
  dev_config.mode             = 3 ;
  dev_config.duty_cycle_pos   = 0;
  dev_config.cs_ena_posttrans = 0;
  dev_config.cs_ena_pretrans  = 0;
  dev_config.clock_speed_hz   = 5000000;
  dev_config.spics_io_num     = csPin;
  dev_config.flags            = 0;
  dev_config.queue_size       = 1;
  dev_config.pre_cb           = NULL;
  dev_config.post_cb          = NULL;
  intError = spi_bus_add_device(HSPI_HOST, &dev_config, &h);
  return intError;
}

int fReadSPIdata16bits(spi_device_handle_t &h, int _address) {
  uint8_t address = _address;
    esp_err_t intError = 0;
    low=0; high=0;
    spi_transaction_t trans_desc;
    trans_desc = { };
    trans_desc.addr =  0;
    trans_desc.cmd = 0;
    trans_desc.flags = 0;
    trans_desc.length = (8 * 3); // total data bits
    trans_desc.tx_buffer = txData;
    trans_desc.rxlength = 8 * 2 ; // Number of bits NOT number of bytes
    trans_desc.rx_buffer = rxData;
    txData[0] = address | 0x80;
    intError = spi_device_transmit( h, &trans_desc);
    low = rxData[0]; high = rxData[1];
    if ( intError != 0 ) {
      Serial.print( "Transmitting error = ");
      Serial.println ( esp_err_to_name(intError) );
    }
  return intError;
}

int fWriteSPIdata8bits(spi_device_handle_t &h, int _address, int _sendData) {
  uint8_t address =  _address;
  uint8_t sendData = _sendData;
  esp_err_t intError;
  spi_transaction_t trans_desc;
  trans_desc = { };
  trans_desc.addr =  0;
  trans_desc.cmd = 0;
  trans_desc.flags = 0;
  trans_desc.length = (8 * 2); // total data bits
  trans_desc.tx_buffer = txData;
  trans_desc.rxlength = 0 ; // Number of bits NOT number of bytes
  trans_desc.rx_buffer = NULL;
  txData[0] = address  & 0x7F;
  txData[1] = sendData;
  intError = spi_device_transmit( h, &trans_desc);
  if ( intError != 0 ) {
     Serial.print("Transmitting error = ");
     Serial.println(esp_err_to_name(intError));
   }
  return intError;
}
