/**
 * @file LoRa32.h "LoRa32.h"
 * @brief Automatic LoRa32 Board Configuration
 * @author Velocet
 *
 * Automatic board configuration for LoRa32 and ESP32 with RadioLib compatible modules.
 *
 * In PlatformIO (main.cpp) or Arduino Sketch `#include LoRa32.h` and load:
 * LORA32_RADIO radio = new Module(LORA32_SPI_CS, LORA32_RADIO_IO0, LORA32_RADIO_RST, LORA32_RADIO_IO1);
 *
 * See the README.md for more information and on how to add your own board configuration.
 *
 * TODO README.me ;)
 * TODO Add class to init own board config from Sketch
 * TODO Better exclusion of drivers when loading RadioLib
 *
 * CC-BY License
 * Copyright (c) iown-homecontrol
 */

#ifndef LoRa32_h
#define LoRa32_h

#pragma region OPTIONS
#if !defined(LORA32_RADIOLIB)
  #define LORA32_RADIOLIB (1) // Use RadioLib?
#endif
#if !defined(LORA32_CUSTOM)
  #define LORA32_CUSTOM   (0) // Use custom config?
#endif

#if LORA32_CUSTOM > 0
  #warning "[LORA32] Using Custom Board Config!"
  #define LORA32_RADIO        "SX1276" // Module Type
  #define LORA32_PINS_RADIO   PINS(RST, BUSY/IO0, IO1, IO2) // If no IO1/IO2: Use IO0 instead
  #define LORA32_PINS_SPI     PINS(SS, MOSI, MISO, SCK)     // Define SPI PINS if using non-Arduino SPI setup
  #define LORA32_PINS_DISPLAY PINS(RST, SCL, SDA)           // Define the Display and use like that:
  #define DISPLAY_GEOMETRY    "GEOMETRY_128_64"   // `SSD1306 display(0x3c, LORA32_DISPLAY_SDA, LORA32_DISPLAY_SCL, LORA32_DISPLAY_RST, DISPLAY_GEOMETRY);`
#endif
#pragma endregion OPTIONS

#define PINS(...) __VA_OPT__(__VA_ARGS__)

#pragma region RADIOLIB /* RadioLib Build Configuration Options. */
#if LORA32_RADIOLIB > 0
  #define RADIOLIB_DEBUG_BASIC      (0) // Basic Debugging (e.g. reporting GPIO timeouts or module not being found).
  #define RADIOLIB_DEBUG_PROTOCOL   (0) // Protocol Information (e.g. internal information).
  #define RADIOLIB_DEBUG_SPI        (0) // Verbose SPI Communication - produces large debug logs!

  #define RADIOLIB_GODMODE          (1) // Methods and member variables in all classes will be made public.
  #define RADIOLIB_LOW_LEVEL        (1) // Low-level Hardware Access enable.
  #define RADIOLIB_SPI_PARANOID     (0) // Verify SPI writes by a read to improve reliability. Slows down communication.
  #define RADIOLIB_CHECK_PARAMS     (1) // Parameter Range Checking.
  #define RADIOLIB_INTERRUPT_TIMING (0) // Interrupt-based timing: https://github.com/jgromes/RadioLib/wiki/Interrupt-Based-Timing

  // Exclude RadioLib drivers to speed up build process.
  #define RADIOLIB_EXCLUDE_CC1101   (1)
  #define RADIOLIB_EXCLUDE_NRF24    (1)
  #define RADIOLIB_EXCLUDE_RF69     (1)
  #define RADIOLIB_EXCLUDE_RFM2X    (1) // dependent on RADIOLIB_EXCLUDE_SI443X
  #define RADIOLIB_EXCLUDE_SI443X   (1)
  #define RADIOLIB_EXCLUDE_STM32WLX (1) // dependent on RADIOLIB_EXCLUDE_SX126X
  #define RADIOLIB_EXCLUDE_SX1231   (1) // dependent on RADIOLIB_EXCLUDE_RF69
  #define RADIOLIB_EXCLUDE_SX128X   (1)

  // Exclude RadioLib protocols to speed up build process.
  #define RADIOLIB_EXCLUDE_AFSK          (1)
  #define RADIOLIB_EXCLUDE_APRS          (1)
  #define RADIOLIB_EXCLUDE_AX25          (1)
  #define RADIOLIB_EXCLUDE_BELL          (1)
  #define RADIOLIB_EXCLUDE_FSK4          (1)
  #define RADIOLIB_EXCLUDE_HELLSCHREIBER (1)
  #define RADIOLIB_EXCLUDE_LORAWAN       (1)
  #define RADIOLIB_EXCLUDE_MORSE         (1)
  #define RADIOLIB_EXCLUDE_PAGER         (1)
  #define RADIOLIB_EXCLUDE_RTTY          (1)
  #define RADIOLIB_EXCLUDE_SSTV          (1)

  #include <RadioLib.h>
#endif
#pragma endregion RADIOLIB

#pragma region BOARDS
#if LORA32_CUSTOM == 0
#if defined(ARDUINO_TTGO_LORA32_V1)
  #define LORA32_RADIO          SX1276
  #define LORA32_PINS_SPI       PINS(18, 27, 19,  5) // SS, SI, SO, SC
  #define LORA32_PINS_RADIO     PINS(14, 26, 26, 26) // RESET, BUSY/IO0,...IOn
#elif defined(ARDUINO_TTGO_LORA32_V2)
  #define LORA32_RADIO          SX1276
  #define LORA32_PINS_SPI       PINS(18, 27, 19,  5) // SS, SI, SO, SC
  #define LORA32_PINS_RADIO     PINS(12, 26, 26, 26) // RESET, BUSY/IO0,...IOn
#elif defined(ARDUINO_TBEAM)
  #define LORA32_RADIO          SX1276
  #define LORA32_PINS_SPI       PINS(18, 27, 19,  5) // SS, SI, SO, SC
  #define LORA32_PINS_RADIO     PINS(23, 26, 33, 32) // RESET, BUSY/IO0,...IOn
#elif defined(ARDUINO_TTGO_LORA32_V21NEW)
  #define LORA32_RADIO          SX1276
  #define LORA32_PINS_SPI       PINS(18, 27, 19,  5) // SS, SI, SO, SC
  #define LORA32_PINS_RADIO     PINS(23, 26, 33, 32) // RESET, BUSY/IO0,...IOn
#elif defined(ARDUINO_HELTEC_WIRELESS_STICK)
  #define LORA32_RADIO          SX1276
  #define LORA32_PINS_RADIO     PINS(14, 26, 35, 34) // RESET, BUSY/IO0,...IOn
  #define LORA32_PINS_SPI       PINS(18, 27, 19,  5) // SS, SI, SO, SC
  #define LORA32_PINS_DISPLAY   PINS(16, 15, 4)      // RST, SCL, SDA
  #define LORA32_PINS_INPUT     PINS(34, 35)
  #define DISPLAY_GEOMETRY      "GEOMETRY_64_32"
#elif defined(ARDUINO_HELTEC_WIRELESS_STICK_V1)
  #define LORA32_RADIO          SX1276
  #define LORA32_PINS_RADIO     PINS(14, 26, 33, 32) // RESET, BUSY/IO0,...IOn
  #define LORA32_PINS_SPI       PINS(18, 27, 19,  5) // SS, SI, SO, SC
  #define LORA32_PINS_DISPLAY   PINS(16, 15, 4)      // RST, SCL, SDA
  #define LORA32_PINS_INPUT     PINS(33, 32)
  #define DISPLAY_GEOMETRY      "GEOMETRY_64_32"
#elif defined(ARDUINO_HELTEC_WIRELESS_STICK_V3)
  #define LORA32_RADIO          SX1262
  #define LORA32_PINS_RADIO     PINS(12, 13, 14, 14) // RESET, BUSY/IO0,...IOn
  #define LORA32_PINS_SPI       PINS( 8, 10, 11,  9) // SS, SI, SO, SC
  #define LORA32_PINS_DISPLAY   PINS(21, 18, 17)     // RST, SCL, SDA
  #define DISPLAY_GEOMETRY      "GEOMETRY_64_32"
#elif defined(ARDUINO_HELTEC_WIRELESS_STICK_LITE) || defined(ARDUINO_HELTEC_WIRELESS_BRIDGE)
  #define LORA32_RADIO          SX1276
  #define LORA32_PINS_RADIO     PINS(14, 26, 35, 34) // RESET, BUSY/IO0,...IOn
  #define LORA32_PINS_SPI       PINS(18, 27, 19,  5) // SS, SI, SO, SC
  #define LORA32_PINS_INPUT     PINS(35, 34)
#elif defined(ARDUINO_HELTEC_WIRELESS_STICK_LITE_V3)
  #define LORA32_RADIO          SX1262
  #define LORA32_PINS_RADIO     PINS(12, 13, 14, 14) // RESET, BUSY/IO0,...IOn
  #define LORA32_PINS_SPI       PINS(34, 35, 37, 36) // SS, SI, SO, SC
#elif defined(ARDUINO_HELTEC_WIFI_LORA_32)
  #define LORA32_RADIO          SX1276
  #define LORA32_PINS_RADIO     PINS(14, 26, 33, 32) // RESET, BUSY/IO0,...IOn
  #define LORA32_PINS_SPI       PINS(18, 27, 19,  5) // SS, SI, SO, SC
  #define LORA32_PINS_DISPLAY   PINS(16, 15, 4)      // RST, SCL, SDA
  #define LORA32_PINS_INPUT     PINS(33, 32)
  #define DISPLAY_GEOMETRY      "GEOMETRY_128_64"
#elif defined(ARDUINO_HELTEC_WIFI_LORA_32_V2)
  #define LORA32_RADIO          SX1276
  #define LORA32_PINS_RADIO     PINS(14, 26, 35, 34) // RESET, BUSY/IO0,...IOn
  #define LORA32_PINS_SPI       PINS(18, 27, 19,  5) // SS, SI, SO, SC
  #define LORA32_PINS_DISPLAY   PINS(16, 15, 4)      // RST, SCL, SDA
  #define LORA32_PINS_INPUT     PINS(35, 34)
  #define DISPLAY_GEOMETRY      "GEOMETRY_128_64"
#elif defined(ARDUINO_HELTEC_WIFI_LORA_32_V3)
  #define LORA32_RADIO          SX1262
  #define LORA32_PINS_RADIO     PINS(12, 13, 14, 14) // RESET, BUSY/IO0,...IOn
  #define LORA32_PINS_SPI       PINS( 8, 10, 11,  9) // SS, SI, SO, SC
  #define LORA32_PINS_DISPLAY   PINS(16, 15, 4)      // RST, SCL, SDA
  #define DISPLAY_GEOMETRY      "GEOMETRY_128_64"
#endif
#endif
#pragma endregion BOARDS

#pragma region PINS
#if defined(LORA32_PINS_SPI)
  const uint8_t LORA32_SPI[]    = {LORA32_PINS_SPI};
  const uint8_t LORA32_SPI_CS   = LORA32_SPI[0];
  const uint8_t LORA32_SPI_MOSI = LORA32_SPI[1];
  const uint8_t LORA32_SPI_MISO = LORA32_SPI[2];
  const uint8_t LORA32_SPI_SCK  = LORA32_SPI[3];
#endif

#if defined(LORA32_PINS_RADIO)
  const uint8_t LORA32_RADIO_PINS[] = {LORA32_PINS_RADIO};
  const uint8_t LORA32_RADIO_RST    = LORA32_RADIO_PINS[0];
  const uint8_t LORA32_RADIO_IO0    = LORA32_RADIO_PINS[1];
  const uint8_t LORA32_RADIO_IO1    = LORA32_RADIO_PINS[2];
  const uint8_t LORA32_RADIO_IO2    = LORA32_RADIO_PINS[3];
#endif

#if defined(LORA32_PINS_DISPLAY)
  const uint8_t LORA32_DISPLAY_PINS[] = {LORA32_PINS_DISPLAY};
  const uint8_t LORA32_DISPLAY_RST    = LORA32_DISPLAY_PINS[0];
  const uint8_t LORA32_DISPLAY_SCL    = LORA32_DISPLAY_PINS[1];
  const uint8_t LORA32_DISPLAY_SDA    = LORA32_DISPLAY_PINS[2];
#endif
#pragma endregion PINS

#endif // LoRa32_h
