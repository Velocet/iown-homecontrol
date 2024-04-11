#!/usr/bin/env python
# -*- coding: utf-8 -*-
# SPDX-License-Identifier: BuyMeABeer-1.0
"""iown-homecontrol configuration.

NOTE: Just set your board and you are good to go.
"""
board = heltec_lora32


"""iown-homecontrol SX1276 configuration.

    Tx Startup Time = TS_TR: 1,268ms (1268us)
    Rx Startup Time = Get SX1276 software and see the timings yourself
"""
iownChannel1           = {'FrfMsb': 0xD9,'FrfMid': 0x10,'FrfLsb': 0x00,} # Channel1: 868.250.000 MHz
iownChannel2           = {'FrfMsb': 0xD9,'FrfMid': 0x3C,'FrfLsb': 0xCD,} # Channel2: 868.950.012 MHz
iownChannel3           = {'FrfMsb': 0xD9,'FrfMid': 0x76,'FrfLsb': 0x66,} # Channel3: 869.849.976 MHz
iownHomeOff            = {'PacketConfig2': 0x00} # io Off
iownPwrFrameeOnHomeOff = {'PacketConfig2': 0x10} # ioPwrFrame On
iownPwrFrameOffHomeOn  = {'PacketConfig2': 0x20} # ioHome On
iownPwrFrameOnHomeOn   = {'PacketConfig2': 0x30} # ioHome / ioPwrFrame On
iownGaussFilterOff     = {'PaRamp': 0x1B}        # No Gaussian Filter
iownGaussFilterOn      = {'PaRamp': 0x3B}        # Gaussian Filter = 1.0
iownTxNormal           = {'PaDac': 0x84}         # +17dBm
iownTxBoost            = {'PaDac': 0x87}         # +20dBm

"""iown-homecontrol board configurations."""
#board_ttgov10 = {'miso':19,'mosi':27,'ss':18,'sck':5,'dio_0':26,'reset':14,'led':2,} # ES32 TTGO v1.0
#board_m5stack_atomatrix = {'miso':23,'mosi':19,'ss':22,'sck':33,'dio_0':25,'reset':21,'led':12,} # M5Stack ATOM Matrix
#board_m5stack = {'miso':19,'mosi':23,'ss':5,'sck':18,'dio_0':26,'reset':36,'led':12,} #M5Stack & LoRA868 Module
"""Heltec Lora32 v2.x board configuration."""
board_heltec_lora32 = {
 #'NAME'   : Value,
  'SPI'    : "VSPI", 'SPIch': 2,
  'MISO'   :     19, 'MOSI'  : 27, 'SS': 18, 'SCK': 5,
  'DIO0'   :     26,
  'DIO1'   :     35, 'DCLK'  : 35,
  'DIO2'   :     34, 'DATA'  : 34,
  'UART'   :      2, 'UARTtx': 34, 'UARTclk': 35,
  'RESET'  :     14,
  'LED'    :     25,
  from machine import Pin

#'PIN_NR':DIRECTION_PULL_MODE_STRENGTH(OPTIONAL)
 'PIN_00':OUT_DOWN_LOW_3
 'PIN_02': IN_

PIN_00.on()                 # set pin to "on" (high) level
PIN_00.off()                # set pin to "off" (low) level
PIN_00.value(1)             # set pin to on/high

print(p2.value())       # get value, 0 or 1

PIN_04 = Pin(4, Pin.IN, Pin.PULL_UP) # enable internal pull-up resistor
PIN_05 = Pin(5, Pin.OUT, value=1) # set pin high on creation
PIN_06 = Pin(6, Pin.OUT, drive=Pin.DRIVE_3) # set maximum drive strength
  }

"""SX1276 io-homecontrol Tx Register Minimal Values = iownMinReg.

  - Mode: Continous
  - Freq: 868.950.012 Hz (Channel 2)
    - FDev: 19.226 Hz
    - Bitrate: 38.415 bps
    - Gaussian Filter: Off
  - DIO Mapping:
    - DIO1: DCLK
    - DIO2: DATA
  - ClkOut: Off
  - PowerAmp @ 17 dBm
    - PaRamp: 1000 us
    - PA1: PA_BOOST
"""
iownMin = {
    'OpMode'        : 0x03,
    'BitrateMsb'    : 0x03,
    'BitrateLsb'    : 0x41,
    'FdevMsb'       : 0x01,
    'FdevLsb'       : 0x3B,
    'FrfMsb'        : 0xD9,
    'FrfMid'        : 0x3C,
    'FrfLsb'        : 0xCD,
    'PaConfig'      : 0xFF,
    'PaRamp'        : 0x1B,
    'Ocp'           : 0x2B,
  #  'Lna'           : 0x20,
  #  'RxConfig'      : 0x00,
  #  'RssiConfig'    : 0x00,
  #  'RssiCollision' : 0x00,
  #  'RssiThresh'    : 0x00,
  #  'RssiValue'     : 0x00,
  #  'RxBw'          : 0x0B,
  #  'AfcBw'         : 0x0B,
  #  'OokPeak'       : 0x00,
  #  'OokFix'        : 0x00,
  #  'OokAvg'        : 0x12,
  #  'Res17'         : 0x47,
  #  'Res18'         : 0x32,
  #  'Res19'         : 0x3E,
  #  'AfcFei'        : 0x02,
  #  'AfcMsb'        : 0x00,
  #  'AfcLsb'        : 0x00,
  #  'FeiMsb'        : 0x00,
  #  'FeiLsb'        : 0x00,
  #  'PreambleDetect': 0x20,
  #  'RxTimeout1'    : 0x00,
  #  'RxTimeout2'    : 0x00,
  #  'RxTimeout3'    : 0x00,
  #  'RxDelay'       : 0x00,
    'Osc'           : 0x07, # Disable ClkOut
  #  'PreambleMsb'   : 0x00,
  #  'PreambleLsb'   : 0x00,
  #  'SyncConfig'    : 0x29,
  #  'SyncValue1'    : 0xFF,
  #  'SyncValue2'    : 0x33,
  #  'SyncValue3'    : 0x55,
  #  'SyncValue4'    : 0x55,
  #  'SyncValue5'    : 0x55,
  #  'SyncValue6'    : 0x55,
  #  'SyncValue7'    : 0x55,
  #  'SyncValue8'    : 0x55,
  #  'PacketConfig1' : 0x08,
    'PacketConfig2' : 0x00,
  #  'PayloadLength' : 0x01,
  #  'NodeAdrs'      : 0x00,
  #  'BroadcastAdrs' : 0x00,
    'FifoThresh'    : 0x80,
    'SeqConfig1'    : 0x14,
    'SeqConfig2'    : 0x4A,
  #  'TimerResol'    : 0x00,
  #  'Timer1Coef'    : 0xF5,
  #  'Timer2Coef'    : 0x20,
  #  'ImageCal'      : 0x07,
  #  'LowBat'        : 0x00,
    'IrqFlags1'     : 0x80,
    'IrqFlags2'     : 0x40,
    'DioMapping1'   : 0xC0,
    'DioMapping2'   : 0xA0,
    'PllHop'        : 0xAD,
    'Tcxo'          : 0x09,
    'PaDac'         : 0x84,
    'BitrateFrac'   : 0x00,
  #  'AgcRef'        : 0x00,
  #  'AgcThresh1'    : 0x00,
  #  'AgcThresh2'    : 0x00,
  #  'AgcThresh3'    : 0x00,
    'Pll'           : 0x90,}

"""SX1276 io-homecontrol RxTx Register Standard Values = iownStdReg."""
iownStd = {
    'Fifo'          : 0x00,
    'OpMode'        : 0x03,
    'BitrateMsb'    : 0x03,
    'BitrateLsb'    : 0x41,
    'FdevMsb'       : 0x01,
    'FdevLsb'       : 0x3B,
    'FrfMsb'        : 0xD9,
    'FrfMid'        : 0x3C,
    'FrfLsb'        : 0xCD,
    'PaConfig'      : 0xFF,
    'PaRamp'        : 0x1B,
    'Ocp'           : 0x2B,
    'Lna'           : 0x20,
    'RxConfig'      : 0x00,
    'RssiConfig'    : 0x00,
    'RssiCollision' : 0x00,
    'RssiThresh'    : 0x00,
    'RssiValue'     : 0x00,
    'RxBw'          : 0x0B,
    'AfcBw'         : 0x0B,
    'OokPeak'       : 0x00,
    'OokFix'        : 0x00,
    'OokAvg'        : 0x12,
    'AfcFei'        : 0x02,
    'AfcMsb'        : 0x00,
    'AfcLsb'        : 0x00,
    'FeiMsb'        : 0x00,
    'FeiLsb'        : 0x00,
    'PreambleDetect': 0x20,
    'RxTimeout1'    : 0x00,
    'RxTimeout2'    : 0x00,
    'RxTimeout3'    : 0x00,
    'RxDelay'       : 0x00,
    'Osc'           : 0x07,
    'PreambleMsb'   : 0x00,
    'PreambleLsb'   : 0x00,
    'SyncConfig'    : 0x29,
    'SyncValue1'    : 0xFF,
    'SyncValue2'    : 0x33,
    'SyncValue3'    : 0x55,
    'SyncValue4'    : 0x55,
    'SyncValue5'    : 0x55,
    'SyncValue6'    : 0x55,
    'SyncValue7'    : 0x55,
    'SyncValue8'    : 0x55,
    'PacketConfig1' : 0x08,
    'PacketConfig2' : 0x00,
    'PayloadLength' : 0x01,
    'NodeAdrs'      : 0x00,
    'BroadcastAdrs' : 0x00,
    'FifoThresh'    : 0x80,
    'SeqConfig1'    : 0x14,
    'SeqConfig2'    : 0x4A,
    'TimerResol'    : 0x00,
    'Timer1Coef'    : 0xF5,
    'Timer2Coef'    : 0x20,
    'ImageCal'      : 0x07,
    'LowBat'        : 0x00,
    'IrqFlags1'     : 0x80,
    'IrqFlags2'     : 0x40,
    'DioMapping1'   : 0xC0,
    'DioMapping2'   : 0xA0,
    'PllHop'        : 0xAD,
    'Tcxo'          : 0x09,
    'PaDac'         : 0x84,
    'BitrateFrac'   : 0x00,
    'AgcRef'        : 0x00,
    'AgcThresh1'    : 0x00,
    'AgcThresh2'    : 0x00,
    'AgcThresh3'    : 0x00,
    'Pll'           : 0x90,}

"""SX1276 Register."""
Register = {
    'Fifo'          : 0x00,
    'OpMode'        : 0x01,
    'BitrateMsb'    : 0x02,
    'BitrateLsb'    : 0x03,
    'FdevMsb'       : 0x04,
    'FdevLsb'       : 0x05,
    'FrfMsb'        : 0x06,
    'FrfMid'        : 0x07,
    'FrfLsb'        : 0x08,
    'PaConfig'      : 0x09,
    'PaRamp'        : 0x0A,
    'Ocp'           : 0x0B,
    'Lna'           : 0x0C,
    'RxConfig'      : 0x0D,
    'RssiConfig'    : 0x0E,
    'RssiCollision' : 0x0F,
    'RssiThresh'    : 0x10,
    'RssiValue'     : 0x11,
    'RxBw'          : 0x12,
    'AfcBw'         : 0x13,
    'OokPeak'       : 0x14,
    'OokFix'        : 0x15,
    'OokAvg'        : 0x16,
    'AfcFei'        : 0x1A,
    'AfcMsb'        : 0x1B,
    'AfcLsb'        : 0x1C,
    'FeiMsb'        : 0x1D,
    'FeiLsb'        : 0x1E,
    'PreambleDetect': 0x1F,
    'RxTimeout1'    : 0x20,
    'RxTimeout2'    : 0x21,
    'RxTimeout3'    : 0x22,
    'RxDelay'       : 0x23,
    'Osc'           : 0x24,
    'PreambleMsb'   : 0x25,
    'PreambleLsb'   : 0x26,
    'SyncConfig'    : 0x27,
    'SyncValue1'    : 0x28,
    'SyncValue2'    : 0x29,
    'SyncValue3'    : 0x2A,
    'SyncValue4'    : 0x2B,
    'SyncValue5'    : 0x2C,
    'SyncValue6'    : 0x2D,
    'SyncValue7'    : 0x2E,
    'SyncValue8'    : 0x2F,
    'PacketConfig1' : 0x30,
    'PacketConfig2' : 0x31,
    'PayloadLength' : 0x32,
    'NodeAdrs'      : 0x33,
    'BroadcastAdrs' : 0x34,
    'FifoThresh'    : 0x35,
    'SeqConfig1'    : 0x36,
    'SeqConfig2'    : 0x37,
    'TimerResol'    : 0x38,
    'Timer1Coef'    : 0x39,
    'Timer2Coef'    : 0x3A,
    'ImageCal'      : 0x3B,
    'Temp'          : 0x3C,
    'LowBat'        : 0x3D,
    'IrqFlags1'     : 0x3E,
    'IrqFlags2'     : 0x3F,
    'DioMapping1'   : 0x40,
    'DioMapping2'   : 0x41,
    'Version'       : 0x42,
    'PllHop'        : 0x44,
    'Tcxo'          : 0x4B,
    'PaDac'         : 0x4D,
    'FormerTemp'    : 0x5B,
    'BitrateFrac'   : 0x5D,
    'AgcRef'        : 0x61,
    'AgcThresh1'    : 0x62,
    'AgcThresh2'    : 0x63,
    'AgcThresh3'    : 0x64,
    'Pll'           : 0x70,}
