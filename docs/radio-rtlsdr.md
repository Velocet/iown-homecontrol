---
icon: material/ear-hearing
---

# Software Defined Radio (SDR)

This document helps you choose, configure and install everything you need to receive io-homecontrol signals with an SDR.

> [!NOTE]
> The description of the io-homecontrol signal can be found here: [Radio](radio.md).

## Basics

This sections helps you understand the concepts and wording.

### IQ correction

SDRs output *IQ* samples:
- *I*: the in-phase part of the signal.
- *Q*: the quadrature (or imaginary) part of the signal.

This allows to process the signal in “3D” (time, amplitude, polarity) instead of just in “2D” (time, amplitude). Due to the circuitry of an SDR, there’s a large frequency spike at whichever frequency you’ve asked the radio to tune itself to. This spike is an unavoidable artifact of how the SDR works.

There are basically two options to remove this spike from received signals:
- Tune the radio slightly ’to the side’ of the frequency you’d actually like to measure, so that the center spike isn’t polluting your real signal.
- Use software to detect and try to remove this spike at the centered frequency. This feature is called IQ correction, because it works by mucking about with the *IQ* samples before delivering them to the rest of the stack.

### Bias-TEE

A circuit within an SDR that provides DC power to an active antenna. Disabled by default so if you own a [rtl-sdr-blog dongle](https://www.rtl-sdr.com/buy-rtl-sdr-dvb-t-dongles/) you need their driver and turn it on so that the antenna receives power.

> [!NOTE]
> This feature is only available with custom RTL devices like the one from [rtl-sdr.com](https://www.rtl-sdr.com/).

> [!CAUTION]
> If you are using a normal antenna (like the one that comes with the dongle) do not turn this feature on!

### Automatic Gain Control (AGC)

A hardware circuit (or software feature) that amplifies weak signals in an effort to improve the signal-to-noise ratio (SNR) of the received data.

### Direct Sampling HF Mode

Allows to listen to HF signals between ~500 kHz to ~28.8 MHz. Only available with [rtl-sdr-blog devices](https://www.rtl-sdr.com/buy-rtl-sdr-dvb-t-dongles/) and the [corresponding driver](https://github.com/rtlsdrblog/rtl-sdr-blog).

Not needed for io-homecontrol reception.

## Hardware

This section covers RTL devices as everyone with another device probably knows how to use their device.

### RTL Dongles

You basically have two options:
- A used RTL based DVB-T stick as there is no reason to get a new one.
- A pimped version from a site like [rtl-sdr.com](https://www.rtl-sdr.com/buy-rtl-sdr-dvb-t-dongles/).

## Software and RTL Drivers

This section is all about the different applications, their setup and which driver to use.

### Drivers

There are different drivers for the device (`rtlsdr.dll` or `librtlsdr.dll`) and USB interface (`libusb.dll`). Always check the used version and get a decent one from GitHub as bad drivers will work but will give worse results. If you are getting errors about a radio not found or when closing an application, then this is due to problems with *libusb*. Google is your friend as we can't cover everything.

#### rtl-sdr-blog driver

If you have a device from [rtl-sdr.com](https://www.rtl-sdr.com/) you first need to get the latest driver: [rtl-sdr-blog driver](https://github.com/rtlsdrblog/rtl-sdr-blog/releases).

> [!CAUTION]
> You need to change the driver for the rtl-sdr-blog device for every application (eg. [rtl_433](https://github.com/merbanan/rtl_433), [Ultimate Radio Hacker](https://github.com/jopohl/urh), [SDR# (SDRsharp)](https://airspy.com/download/)) you are using as those come with the standard *rtlsdr* driver!

### rtl_433

[rtl_433](https://github.com/merbanan/rtl_433) has basic support for io-homecontrol reception and decoding. It was shown that the builtin decoder (`-R 189`) yields better results then a Flex decoder (`-X "..."`) when used with the `decode_uart` option.

> [!NOTE]
> At the time of writing rtl_433 provides [nightly builds](https://github.com/merbanan/rtl_433/releases) in random intervals. This assumes you are using the latest nightly release.

To receive signals you need to tune your RTL slighty off-center (see IQ correction). Let's say you want to receive io-homecontrol channel 2 (868,95 MHz) then tune your radio to 869,89 MHz (`-f 868.89M`).

- Most used command line options:
  - `-c 0`: Disable loading of config files
  - `-R 189`: Only enable builtin ioHome decoder. A 0 means all builtin decoders are disabled.
  - `-M level`: Output extra signal information like RSSI, SNR, time, etc.
  - `-f 868.89M`: Tune the radio to 868.89 MHz
  - `-g 37.2`: Set input gain
  - `-s 1000k`: Set the sample rate. Can also be set to 250k for channel 2.
  - `-Y`
    - `autolevel`: Change the level at which a signal is recognized. Everything else is noise.
    - `squelch`: Skip packets which noise.
    - `magest`: Change the autolevel mode.
  - `-X`: Use a Flex decoder with the following settings.
    - `name`: Custom protocol name.
    - `short`: How long does it take to transmit one bit.
    - `long`: How long does it take to transmit one bit.
    - `reset`: Time when a packet (consisting of frames) is finished and a new one starts.
    - `gap`: Time between each frame.
    - `tolerance`: How many us can the signal deviate from the defined (long/short) value.
    - `preamble`: Which byte sequence does the protocol use to signal a incoming packet.
    - `decode_uart`: Decode everything after the preamble as if it is UART encoded.
    - `unique`: Remove unneeded from the output.

#### Builtin Decoder

Start receiving ioHome signals on channel 2 (1W/2W)
> `rtl_433 -c 0 -R 189 -M level -f 868.89M`

#### Flex Decoder via Configuration File

- Download [rtl_433.conf](https://github.com/Velocet/iown-homecontrol/raw/main/scripts/rtl_433/rtl_433.conf)
- Move *rtl_433.conf* next to your *rtl_433* executable
- Just start *rtl_433*

#### Flex Decoder via Command Line

`rtl_433 -c 0 -R 0 -Y autolevel -Y squelch -Y magest -M level -g 37.2 -s 1000k -f 868.89M -X "name=iown,short=26,long=26,reset=286,gap=286,tolerance=2,preamble=0x7FD9,unique"`

### rtl_433 for SDR# (SDRsharp)

If you prefer a graphical user interface for *rtl_433* you can use a [plugin](https://marco40github.wixsite.com/website/plugin-sdrsharp-pour-rtl-433?lang=en) for [SDR# (SDRsharp)](https://airspy.com/download/). Please follow the instructions from the [GitHub page](https://github.com/marco402/plugin-Rtl433-for-SdrSharp) for installation and usage.

### Ultimate Radio Hacker (URH)

> [!IMPORTANT]
> Please help expand this section with a little tutorial on how to use *URH*.

*URH* is used to analyse the raw signal pulses instead of parsing data like *rtl_433*. This way you can compare the quality of your signal produced by the LoRa32 dongle to a real io-homecontrol device.

### GNU Radio
<!-- TODO link gnuradio scripts and explanations -->
You will find the GNU Radio scripts in the scripts folder.
