# LoRa32 Private Library

Structure of the library `LoRa32`:

```
|--lib
|  |
|  |--LoRa32
|  |  |--src
|  |     |- LoRa32.c
|  |     |- LoRa32.h
|  |  |- library.json (Custom build options, etc.) https://docs.platformio.org/page/librarymanager/config.html
|
|- platformio.ini
|--src
   |- main.cpp
```

Contents of `src/main.cpp`:

```CPP
#include <Arduino.h>
#include <LoRa32.h>  // Include the LoRa32 header file

// This line will automatically configure a RadioLib module based on your board
LORA32_RADIO radio = new Module(LORA32_SPI_CS, LORA32_RADIO_IO0, LORA32_RADIO_RST, LORA32_RADIO_IO1);

// function declarations

void setup() {printf("setup");} // put your setup code here, to run once
void  loop() {printf("loop");}  // put your main code here, to run repeatedly

// function definitions
```
