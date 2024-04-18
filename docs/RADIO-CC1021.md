// #include "em_device.h"

#include <stddef.h>
#include "ezradio_cmd.h"
#include "ezradio_prop.h"
#include "ezradio_api_lib.h"
#include "ezradio_api_lib_add.h"
#include "ezradio_plugin_manager.h"
#include "ezradio_comm.h"
#include "ezradio_hal.h"
#include "ezradio_transmit_plugin.h"
ezradiodrv_config.h

Maybe I can add some more info to io-homecontrol and I need some help to calculate frequency from CC1021 from a old velux KUX100. I use a logic analyzer to sniffing the SPI infomation between mcu and CC1021.
I think there are 6 channels. 3 Rx and 3 Tx channels and each Rx channel is connected to each Tx channel. mcu/cc1021 scan every Rx channel for 2.7 ms if there is data on an Rx channel the mcu/cc1021 changes to predetermined Tx channel.

## Init CC1021

> AA = Config Registers Addr | DD = Data | W/R = Write/Read to/from CC1021
> Frequency register A is use for RX. Frequency register B is use for TX

AA DD W/R
04 3A W Frequency register 2A - 8 MSB of frequency control word A
08 3A W Frequency register 2B - 8 MSB of frequency control word B
01 4F W Interface control register:
  - 6 - Use separate pin for RX data output    = DIO is always input, and a separate pin is used for RX data output (synchronous mode: LOCK pin, asynchronous mode: DCLK pin).
  - 3 - Use PA_EN pin to control external PA   = PA_EN pin is asserted when internal PA is turned on
  - 2 - Use LNA_EN pin to control external LNA = LNA_EN pin is asserted when internal LNA is turned on
  - 1 - Polarity of external PA control        = PA_EN pin is “1” when activating external PA
  - 0 - Polarity of external LNA control       = LNA_EN pin is “1” when activating external LNA
02 FF W Digital module reset: Reset everything
03 8F W Automatic power-up sequencing control:
  - 7 - Use PSEL pin to start sequencing: Negative transitions on the PSEL pin will start power-up sequencing
  - 6:4-Waiting time from PLL enters lock until RX power up: Wait for approx. 32 ADC_CLK periods (26 μs)
  - 3-0 - Waiting time for carrier sense from RX power up: Wait 72 FILTER_CLK periods before power down
07 27 W Clock generation register A
  -1:0-Modem clock divider 2 (A):Divide by 8 = MODEM_CLK freq is FREF freq divided by the product of divider 1+2. Baud rate is MODEM_CLK freq divided by 8.
  -4:2-Modem clock divider 1 (A):Divide by 3
  -5-Reference frequency divisor (A):REF_CLK frequency = Crystal frequency / 2
0B 27 W Clock generation register B: same as above
0C 44 W VCO current control register:Control of current in VCO core = 2.8 mA current in VCO core
0D 53 W Modem control register
  -1:0-Modem data format:Transparent asynchronous UART operation, set DCLK=1
  -6:4-ADC clock divisor:ADCfreq = XOSCfreq/12
0E 3B W TX frequency deviation register
0F C6 W RX AFC control register
  -Controls AFC settling time versus accuracy: Slowest settling; frequency averaged over 4 0/1 bit pairs
  RX fdev should be half TX fdev (GFSK).
  RX fdev should be TX fdev for FSK and for GFSK at 100 kBaud data rate and above.
10 22 W Channel filter / RSSI control register
  receiver channel bandwidth < 153.6 kHz
  Decimation clock divisor: 
11 65 W VGA control register 1
  Sets the number of consecutive samples at or above carrier sense level before carrier sense is indicated (for example, on LOCK pin): Set carrier sense after second sample at or above carrier sense level
  Sets the number of consecutive samples below carrier sense level before carrier sense indication (for example, on lock pin) is reset: 1: Carrier sense reset after 2nd sample below carrier sense level. Reduce chance of losing carrier sense due to noise.
12 57 W VGA control register 2
        Maximum LNA2 setting used in VGA = Maximum LNA2 gain for best sensitivity
        Sets how many samples that are used to calculate average output magnitude for AGC/RSSI:  Magnitude is averaged over 16 filter output samples
13 2E W VGA control register 3
        Decides how much the signal strength must be above CS_LEVEL+VGA_UP before VGA gain is decreased: Gain is decreased 6 dB above CS_LEVEL+ VGA_UP (See Figure 5-17 for an explanation of the relationship between RSSI, AGC and carrier sense settings.)
14 2E W VGA control register 4: Gain is increased when signal is below CS_LEVEL+ 1.5 dB
16 76 W Front end bias current control register
17 87 W Analog modules control register
18 50 W LO buffer and prescaler swing control register
19 25 W LO buffer and prescaler bias current control register
1A AE W PLL loop bandwidth / charge pump current control register = 174 kHz?
        Charge pump current scaling/rounding factor. Used to calibrate charge pump current for the desired PLL loop bandwidth. The value is given by: PLL_BW = 174 + 16 log2(fref / 7.126) where fref is the reference frequency in MHz.
1C 00 W Power amplifier output power register
1D F0 W Match capacitor array control register, for RX and TX impedance matching
1E 00 W Phase error compensation control register for LO I/Q
1F 00 W Gain error compensation control register for mixer I/Q
20 00 W Power-down control register
15 23 W Lock control register
        Selection of signals to LOCK pin: LOCK_CONTINUOUS (active low)
        Selects lock accuracy (counter threshold values): Declare lock at counter value 1023, out of lock at value 1007
00 11 W Main control register
00 01 W Main control register
05 28 W Frequency register 1A
06 A3 W Frequency register 0A
00 11 W Main control register
1B B4 W LO buffer and prescaler swing control register
40 07 R Status information register (PLL lock, RSSI, calibration ready, and so on)
40 07 R Status information register (PLL lock, RSSI, calibration ready, and so on)
40 27 R Status information register (PLL lock, RSSI, calibration ready, and so on)
40 07 R Status information register (PLL lock, RSSI, calibration ready, and so on)
40 07 R Status information register (PLL lock, RSSI, calibration ready, and so on)
> CC1021 up and running.
> Loop: Scan every channel for 2.7 ms
CC1021 RX channel 1
04 3A = Frequency register 2A
05 1C = Frequency register 1A
06 7D = Frequency register 0A
>       wait 2.7 ms before changes to new Rx kanal if data on Rx channel changes Tx channel in CC1021 to
CC1021 TX channel 1
08 3A = Frequency register 2B
09 21 = Frequency register 1B
0A D1 = Frequency register 0B
CC1021 RX channel 2
04 3A = Frequency register 2A
05 28 = Frequency register 1A
06 A3 = Frequency register 0A
>       wait 2.7 ms before changes to new Rx kanal if data on Rx channel changes Tx channel in CC1021 to
CC1021 TX channel 2
08 3A = Frequency register 2B
09 2D = Frequency register 1B
0A F9 = Frequency register 0B
CC1021 RX channel 3
04 3A = Frequency register 2A
05 38 = Frequency register 1A
06 43 = Frequency register 0A
>       wait 2.7 ms before changes to new Rx kanal if data on Rx channel changes Tx channel in CC1021 to
CC1021 TX channel 3
08 3A = Frequency register 2B
09 3D = Frequency register 1B
0A 99 = Frequency register 0B
> Start Over

Maybe someone can calculator the Rx/Tx frekvens from the hex code in Frequency register A/B from cc1021 datasheet. CC1021 use 14.7456 MHz Crystal oscillator.