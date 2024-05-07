# io-homecontrol Firmware

> [!NOTE]
> If you can provide firmware images, you can share them here (file an issue) or via Discord/Telegram ;)_

This document and it's corresponding folder provide information about the available firmware binaries.
It does not hold information about reversing those binaries. Please refer to the reverse engineering section and dont't forget to grab the provided SVDs...

Most of this stuff documents Somfy related images as there are no Velux images :(

<!-- TODO Explain where/how to find, extract fw -->
<!-- TODO Change SVD and map strings section correctly -->
<!-- FIX sentences above -->

## Overview

The STM32 firmware is based on uC/OS II with a custom Somfy HAL and uses the official STM32 Standard Peripheral Library.

Other firmware used by Overkiz is based on ContikiOS.

- Somfy uses mostly STM32F101RCT6 in Gateways, Remotes and Actuators.
- Velux uses mostly SiLabs EFR/EFM series.
- Head over to the [Devices](devices.md) section where this information is collected.

- Somfy/Overkiz Firmware Naming Scheme: `$usage-[$type]-$mcu-$datetime.$ext`

- $usage: rf protocol or usage
- $type is optional and can be one of three:
  - $type=""    : Bootloader+Padding+Application
  - $type="boot": Bootloader
  - $type="app" : Application
- $ext is one of three known extensions:
  - bin = unencrypted binary image
  - sec = encrypted binary image
  - seb = decrypted binary image

### Bootloader Type

Get Bootloader Type: `stm32-helper-generic /dev/$tty -r 3 -b 115200 | head -n 1`

Known Bootloader Types:

- Ideal RF
  - 02EB02 !!! Possible Si4461 Firmware Patch Address?
  - 02EB03

### Firmware Data

This section of data can be found in every firmware (io-homecontrol, RTS, IdealRF, etc.) from Somfy/Overkiz.

It consists of the following values:
- Default Serial Number: `SN12345678`
- Default Test Parameter: `abcdefghijklm`
- Default Calibration Data: `0E4EC40EBD0B0F4AD4`
- Bootloader Type: `000000`

These values can be found at the end of the firmware and is in the following form:

> `$SN$TstParam$Cal$BootloaderType = SN12345678abcdefghijklm0E4EC40EBD0B0F4AD4000000`

RTS Data

```SHELL
00 30 00
08 00 53
4E 00 00
00 00 00
00 00 00
00 04 08
0C 10 14 # Test Parameter
00 00 00 # Test Parameter
0E 4E C4 # Calibration Data
0E BD 0B # Calibration Data
0F 4A D4 # Calibration Data
00 00 00 # Bootloader Type
```
## Unknown stuff

This peace can be found in the firmware and a Github search reveals that it is being used in regex (eg. base64)
- `0x18,0x1C,0x20,0x24,0x28,   0,   0,   0,0x40,0x44,0x48,0x4C,0x50,0x54,0x58,   0`

Another comment points to this:
> ```PYTHON
> SEQUENCE_LENGTH = 80  # from McMahan et al AISTATS 2017
> # Vocabulary re-used from the Federated Learning for Text Generation tutorial.
> # https://www.tensorflow.org/federated/tutorials/federated_learning_for_text_generation
> CHAR_VOCAB = list("dhlptx@DHLPTX $(,048cgkoswCGKOSW[_#'/37;?bfjnrvzBFJNRVZ\"&*.26:\naeimquyAEIMQUY]!%)-159\r")
> ```


## io-homecontrol

### STM32 Information

- Used Registers and Peripherals
  - RAM: 20008000 ?? IMPORT RAM_20008000
  - RAM: 2000FFFE
  - TIM3  : 40000400 40000450
  - TIM6  : 40001000 40001030
  - IWDG  : 40003000 40003010
  - SPI2  : 40003800 40003824
  - USART2: 40004400 4000441C
  - USART3: 40004800 4000481C
  - UART4 : 40004C00 40004C18
  - UART5 : 40005000 40005018
  - BKP   : 40006C00 40006CBC
  - PWR   : 40007000 40007008
  - AFIO  : 40010000 40010020
  - EXTI  : 40010400 40010418
  - GPIOA : 40010800 4001081C
  - GPIOB : 40010C00 40010C1C
  - GPIOC : 40011000 4001101C
  -  ???  : 40011400 400123FE
  - FEHLT : 40021000

  - TIM1 : 40012C00 40012C50
  - SPI  : 40013000 40013024
  - TIM8 : 40013400 40013450
  - UART1: 40013800 4001381C
  - TIM9 : 40014C00 40014C3C
  - RCC  : 40021000 40021028
  - Flash: 40022000 40022024
  - STK  : E000E010 STK : E000E01C
  - NVIC : E000E100 NVIC: E000E438
  - SCB  : E000ED00  SCB: E000ED38

### 20210310142941

> `Origin: at91-kizboxmini-2021.2.4-11 (Connexoon) | MCU: STM32`

```PYTHON
APP = io-homecontrol-stm32-20210310142941.bin
BIN = io-homecontrol-boot-stm32-20210310142941.bin
MD5 = F8F83A7CBBF1F51BDA51838A52DA3620

0x8000000:0x27FF  # Bootloader
0x8002800         # Application
0x8003000:0x1F400 # ???
0x803C000:0x0C    # Calibration Data
0x803FF00-0x8040000 (0x00100) # MD5 Reserved Space
0x8003000-0x803FFF0 (0x3CFF0) # MD5 Calculation Space
0x803FFF0-0x803FFFF (0xF) # MD5
```

ROM:08029AB4 RFChipSetPowerStatus "RF_Chip_SetPowerStatus"; XREF: ROM_8025030+8↑o,ROM_8025070↑o ; #Signsrch "AES Rijndael S / ARIA S1 [..256]"
ROM:08029AF4

1W Key: 0x0F,0x28,0x0F,0x00,0x01,0x36,0x00,0x08,0xF1,0x35,0x00,0x08

0F28
0F00
0136
0008
F135
0008


         0xF,0x28,0xF,0,1,0x36,0,8,0xF1,0x35,0,8

## Ideal RF

This image is quite interesting as it seems to be for RF calibration and has the ability to enable USART on the STM32.

### V00.01.47

> `Origin: at91-kizboxmini-2021.2.4-11 (Connexoon) | MCU: STM32`

```PYTHON
APP = idealrf-app-stm32-V00.01.47.bin
BIN = idealrf-boot-stm32-V00.01.47.bin
IDEAL_TMP_FILE_CALIB = $PERSISTENTDIR_APPS/ideal_calib_tmp.bin

0x8000000:0xC000  # Bootloader
0x800C000:0x1F400 # Application
0x803C000:0x0C    # Calibration Data

0E4EC4 0EBD0B 0F4AD4 000000      # STM32 Default Calibration # NOTE: Last 6 digits are always 0
7A6958 7B6BD5 1C8ADF 2C4DF0 A9F638 5F # MD5 of Application

02EB02 # Bootloader Type 1
02EB03 # Bootloader Type 2
```

<!-- TODO document all op codes used for testing -->
<!-- TODO compare to test scripts found on ANIMEO -->
### idealrf Scripts

Some interesting tidbits can be found in the decompiled luajit files...

- `handlePayload()`

  ```SHELL
  # POD_SERIAL="0815-2380-2650"
  $POD_SERIAL="$(sed -En 's/.*CN=(([0-9]{4}-?){3}).*/\1/p' /etc/security/client.crt 2> /dev/null)"
  # luajit pseudo code for better readability
  $UID=ToUint32LE(0x60000000 + (({os.getenv("POD_SERIAL"):sub(1, 9):gsub("%-", "")})[1] or 0)))
  $UID=ToUint32LE(0x60000000 + (({0815,2380,2650})[1] or 0))) # UID=1610613551 (0x60000000 + 0815)
  ```

## RTx (RTS/RTN/RTSD)

These images handle the RTx stuff. RTx means RTS, RTN, RTD, RTDS, etc.

### 20181107104342

> `Origin: at91-kizboxmini-2021.2.4-11 (Connexoon) | MCU: STM32`

```SHELL
APP_BINARY = /apps/overkiz/share/rtx/bin/all-stack-stm32-20181107104342.bin
BINARY     = /apps/overkiz/share/rtx/bin/all-stack-boot-stm32-20181107104342.bin
MD5        = A8F8C4643AC1EC9585B51950FBD49F95

0x8000000                      # Bootloader
0x8002800                      # Application
0x8003000-0x803FFF0 (0x3CFF0)` # MD5:CalculactionSpace(Application)
0x803FF00-0x8040000 (0x00100)` # MD5:ReservedSpace("Saved")
0x803FFF0:0x0F`                # MD5:ActualApplication
0x803C000:0x0C`                # Calibration Data
```

## Velux

### EFM32

#### SiLabs Threads

This is a thread from a Velux employee asking about one of the bootloaders which seems to be used by the KLR200/KLR300 devices. It even includes a AES decryption key which seems to be a placeholder but if anyone wants to try i am happing to report the results here.

Download [C548874603 Files](https://community.silabs.com/s/profile/related/0051M000007jlN3QAI/OwnedContentDocuments?language=en_US)

- C548874603 (VELUX A/S) asked a question: [What version gecko-sdk should I choose for updating standard bootloader for EFM32GG230F512?](https://community.silabs.com/s/question/0D58Y00008C4gaoSAB/what-version-geckosdk-should-i-choose-for-updating-standard-bootloader-for-efm32gg230f512?language=en_US)
  > I have copied the uart bootloader source code from `an0003_efm32_uart_bootloader`. I want to make some changes and use it with *EFM32GG230F512*.
  > It seems, from information in the application note, that the included bin files are built using Gecko-SDK 1.0.
  > If I open a new project in Simplicity Studio and select *EFM32GG230F512*, then SDK Version 3.2 is downloaded.
  > So my question is: which sdk version should I use when I make my changes in the bootloader code, to make sure it runs on *EFM32GG230F512*?
  > Or which versions can I use? Are there any restrictions or risk that certain versions will not work properly?
  > I set the project up with Gecko-SDK 3.2. But I have some problems with missing defines. E.g. here:
  >
  > ![image]()
  >
  > Take f.ex. the line: `CMU->HFPERCLKEN0 |= DEBUG_USART_CLOCK;`. `DEBUG_USART_CLOCK` is defined in `config.h`:
  >
  > ```CPP
  > /******************************************************************************
  >  * USART used for debugging.                         *
  >  ******************************************************************************/
  > #if defined(_SILICON_LABS_32B_SERIES_0) && (defined(_EFM32_GIANT_FAMILY) || defined(_EFM32_WONDER_FAMILY) || defined(_EZR32_LEOPARD_FAMILY))
  > #define DEBUG_USART             UART1
  > #define DEBUG_USART_CLOCK       CMU_HFPERCLKEN0_UART1
  > #define DEBUG_USART_TX_READY() (DEBUG_USART->STATUS & USART_STATUS_TXBL)
  > ```
  >
  > Here `_SILICON_LABS_32B_SERIES_0` and `_EFM32_GIANT_FAMILY` are defined in `efm32gg230f512.h` which is located in `\gecko-sdk\code\platform\Device\SiliconLabs\EFM32GG\Include`.
  >
  > I can find `CMU_HFPERCLKEN0_UART1` in include files for other processors like e.g. `efm32gg280f1024.h`.
  >
  > Why is this, and other, defines missing? If I can use any version of Geco-SDK, including 3.2, then I would expect all necessary defines to be present.
- C548874603 (VELUX A/S)
  > I have run into a new problem with my *EFM32GG230F512* project. About 3 years ago I updated the standard bootloader for *EFM32G230* to use interrupt driven AES. This works fine.
  >
  > Now I wish to do the same for *EFM32GG230F512*, but I have hit a problem. In *EFM32G230* I have added `AES_IRQ` to `vectorTable`:
  > ![image]()
  > Where `#define AES_IRQ AES_IRQn`. `AES_IRQn` has the value `29`.
  > ![image]()
  > `__no_init uint32_t vectorTable[47];` in `bootloader.c`. I tried adding `AES_IRQ` to `vectorTable` in the *EFM32GG230F512* software, but in `efm32gg230f512.h` the value of `AES_IRQn` is increased to `36` and `vectorTable` is not correspondingly increased in size:
  > ![image]()
  > ![image]()
  > I tried to increase the size of vectorTable, but that leads to:
  > `Error[Lp025]: absolute section .noinit (bootloader.o #12) ([0x2000'00bc-0x2000'00bd]) overlaps with absolute section .noinit (bootloader.o #10) ([0x2000'0000-0x2000'00ef])`
  > So how am I to go about using `AES_IRQn` for the *EFM32GG230F512*?
- [Is Flags of a OSFlagPost() buffered when "receiver" not waiting in the corresponding OSFlagPend()?](https://community.silabs.com/s/question/0D58Y00008Q5ueRSAR/is-flags-of-a-osflagpost-buffered-when-receiver-not-waiting-in-the-corresponding-osflagpend?language=en_US)
  > We use OSFlagPost() to signal a task that interrupt ISR's has been called, to let the task do the "heavy" work. Several flags are included in the flag group, to support several interrupts
  >
  > When the task is out of the OSFlagPend() doing work, and an interrupt is fired, Posting a flag into that flag group, will the OSFlagPend() see that flag afterwards or is the flag lost?
  >
  > We have seen some situations where it seems the flag is lost. The interrupt was fired, but the task is not handling the flag. e.g.
  >
  > ```CPP
  > ISR:
  > ...
  >   OSFlagPost(&g_driver_flags, FLAG1, OS_OPT_POST_FLAG_SET, &err);
  > ...
  > TASK:
  > ...
  >   while (DEF_ON) {
  >     flags = OSFlagPend(&g_driver_flags, /*  Pointer to user-allocated event flag. */
  >             DRIVER_FLAG_EVENT_ALL,      /*  Flag bitmask to match.        */
  >             0,                          /*  Wait OS Ticks maximum, 0 = no timeout */
  >             OS_OPT_PEND_FLAG_SET_ANY |  /*  Wait until one of the flags are set  */
  >             OS_OPT_PEND_BLOCKING   |    /*  task will block and          */
  >             OS_OPT_PEND_FLAG_CONSUME,   /*  function will clear the flags.    */
  >             DEF_NULL,                   /*  Timestamp is not used.        */
  >             &err);
  >     if(err.Code == RTOS_ERR_NONE) {
  >       if((flags & FLAG1) == FLAG1) { }
  >       if((flags & FLAG2) == FLAG2) { }
  >       if((flags & FLAG3) == FLAG3) { }
  >       if((flags & FLAG4) == FLAG4) { }
  >       if((flags & FLAG5) == FLAG5) { }
  >     }
  >     else { FATAL_ERROR; }
  >   }
  > ```
