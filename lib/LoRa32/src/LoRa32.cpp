/**
 * @file LoRa32.cpp "LoRa32.cpp"
 * @brief Automatic LoRa32 Board Configuration
 * @author Velocet
 *
 * Automatic board configuration for LoRa32 and ESP32 with RadioLib compatible modules.
 *
 * CC-BY License
 * Copyright (c) iown-homecontrol
 */

#include <Arduino.h>

#define _LORA32_SIZE(x) (sizeof(x) / sizeof(*(x)))

// Set given PIN to INPUT so we ship around some interrupt errors
#if defined(LORA32_PINS_INPUT)
  const uint8_t LORA32_INPUT_PINS[] = {LORA32_PINS_INPUT};
  for(uint8_t i = 0; i < _LORA32_SIZE(LORA32_INPUT_PINS); i++){pinMode(pin[i], INPUT);}
#endif
