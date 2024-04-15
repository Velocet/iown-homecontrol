/**
 * @file main.cpp "main.cpp"
 * @brief iown-homecontrol
 * @author Velocet
 *
 * io-homecontrol (Somfy, Velux, etc.) Implementation for LoRa32 boards
 *
 * MIT License
 * Copyright (c) Velocet
 */

#include <Arduino.h>
#include <SPI.h>
#include <LoRa32.h>
#include <RadioLib.h>
#include "IoHome.h"

// RadioLib: Load RadioLib module with help of the LoRa32 definitions
LORA32_RADIO radio = new Module(LORA32_SPI_CS, LORA32_RADIO_IO0, LORA32_RADIO_RST, LORA32_RADIO_IO1);

// RadioLib: Get common layer pointer "phy"
PhysicalLayer* phy = (PhysicalLayer*)&radio;

// function declarations
// ...
void dummyISR() {} // TODO configure interrupt actions

void setup() { // setup code to run once
  Serial.begin(115200);

  int state = 0;

  state = radio.begin();
  if(state) {Serial.print(F("[RADIO] Init: "));Serial.println(state);while(true);}

  // access common configuration layer through the "phy" pointer
  state = phy->setFrequency(868.95);
  if(state) {Serial.print(F("[PHY] Frequency: "));Serial.println(state);while(true);}

  // interrupt-driven Rx/Tx
  // phy->setPacketReceivedAction(dummyISR);
  // phy->setPacketSentAction(dummyISR);
  // phy->clearPacketReceivedAction(); // clear interrupt actions
  // phy->clearPacketSentAction();     // clear interrupt actions

  // Common SNR/RSSI measurement functions and also a "true" random number generator
  Serial.print(F("[PHY] SNR     (dBm): "));Serial.println(phy->getSNR());
  Serial.print(F("[PHY] RSSI    (dBm): "));Serial.println(phy->getRSSI());
  Serial.print(F("[PHY] RNG (0 - 100): "));Serial.println(phy->random(100));

  state = phy->standby(); // change mode to standby ...
  if(state) {Serial.print(F("[PHY] Standby: "));Serial.println(state);while(true);}

}

void loop() {Serial.println("l00p");} // code to run repeatedly

// function definitions
// ...
