# Si4461 Register Documentation

The Si4461 (Si4461 Rev C2A) is used in some of the Overkiz (TaHoma, Cozytouch, etc.) boxes. Thanks to the available io-homecontrol (and Somfy RTS) firmware i was able to extract the used commands (and hence the corresponding register values).

Thanks to the amazing work of [Inside the Silicon Labs EZRadioPRO](https://github.com/astuder/Inside-EZRadioPRO/) those extracted values could be remapped to their corresponding registers. Sadly the interpretation is not that easy as it is not possible to load the changed register values with WDS but if you own such a module you can directly go ahead and start loading up the registers to configure your radio.

# Register Values

> [!NOTE] Taken from a Somfy Cozytouch Firmware

| CMD              | ID  | Size | Group | Name                      | Config Data                  | Note     |
| ---------------: | :-: | :--: | ----: | :------------------------ | :--------------------------- | :------- |
| RF_POWER_UP      | 02  | 06   |       |                           | `0100018CBA80`               |          |
| SET_PROPERTY     | 11  | 04   | 0001  | GLOBAL_CLK_CFG            | `0100`                       |          |
| SET_PROPERTY     | 11  | 04   | 0001  | GLOBAL_CLK_CFG            | `0100`                       |          |
| SET_PROPERTY     | 11  | 04   | 0001  | GLOBAL_CLK_CFG            | `0101`                       |          |
| SET_PROPERTY     | 11  | 04   | 0001  | GLOBAL_CLK_CFG            | `0442`                       |          |
| SET_PROPERTY     | 11  | 07   | 0004  | GLOBAL_WUT_CONFIG         | `002E011840`                 |          |
| SET_PROPERTY     | 11  | 08   | 0005  | GLOBAL_WUT_M              | `05007B200A01`               |          |
| SET_PROPERTY     | 11  | 09   | 0006  | GLOBAL_WUT_M              | `0400000160000000`           |          |
| SET_PROPERTY     | 11  | 04   | 0101  | INT_CTL_PH_ENABLE         | `0000`                       |          |
| SET_PROPERTY     | 11  | 07   | 0204  | MISSING                   | `0000000000`                 |          |
| SET_PROPERTY     | 11  | 04   | 1001  | PREAMBLE_CONFIG_STD_1     | `0198`                       |          |
| SET_PROPERTY     | 11  | 04   | 1001  | PREAMBLE_CONFIG_STD_1     | `01A0`                       |          |
| SET_PROPERTY     | 11  | 05   | 2002  | MODEM_DSM_CTRL            | `1E2020`                     |          |
| SET_PROPERTY     | 11  | 06   | 2003  | MODEM_DATA_RATE           | `0A000327`                   |          |
| SET_PROPERTY     | 11  | 12   | 2009  | MODEM_TX_NCO_MODE         | `220055060CAB05C80200`       |          |
| SET_PROPERTY     | 11  | 13   | 200A  | MODEM_FREQ_DEV            | `008800070096000027AC40`     |          |
| SET_PROPERTY     | 11  | 13   | 200A  | MODEM_FREQ_DEV            | `008A00070096000027AC40`     | NonDebug |
| SET_PROPERTY     | 11  | 13   | 200A  | MODEM_FREQ_DEV            | `00EA00070096000027AC40`     | Debug    |
| SET_PROPERTY     | 11  | 13   | 200A  | MODEM_FREQ_DEV            | `2C001280C20243E00000E2`     |          |
| SET_PROPERTY     | 11  | 14   | 200B  | MODEM_FREQ_DEV            | `44D60301890180FF0C000040`   |          |
| SET_PROPERTY     | 11  | 15   | 200C  | MODEM_FREQ_DEV            | `38111313000242AB00280CA403` |          |
| SET_PROPERTY     | 11  | 15   | 210C  | MODEM_CHFLT_RX1_CHFLT_COE | `00FFBA0F51CFA9C9FC1B1E0F01` |          |
| SET_PROPERTY     | 11  | 15   | 210C  | MODEM_CHFLT_RX1_CHFLT_COE | `0CFCFD15FF000FFFBA0F51CFA9` |          |
| SET_PROPERTY     | 11  | 15   | 210C  | MODEM_CHFLT_RX1_CHFLT_COE | `18C9FC1B1E0F01FCFD15FF000F` |          |
| SET_PROPERTY     | 11  | 06   | 2203  | PA_TC                     | `0150003D`                   |          |
| SET_PROPERTY     | 11  | 10   | 2307  | SYNTH_VCO_KVCAL           | `002B0D06060F7F03`           |          |
| SET_PROPERTY     | 11  | 09   | 4006  | FREQ_CONTROL_W_SIZE       | `00410E4EC42762`             |          |
| RF_GPIO_PIN_CFG  | 13  | 06   |       |                           | `0414212018`                 |          |
| RF_GPIO_PIN_CFG  | 13  | 06   |       |                           | `1802140418`                 |          |
| GET_INT_STATUS   | 20  | 03   |       |                           | `000000`                     |          |
| GET_MODEM_STATUS | 22  | 01   |       |                           | `00`                         |          |
| START_TX         | 31  | 04   |       |                           | `00000015`                   |          |
| START_RX         | 32  | 04   |       |                           | `0000FFFF`                   |          |
| CHANGE_STATE     | 34  | 01   |       |                           | `01`                         |          |
| CHANGE_STATE     | 34  | 01   |       |                           | `03`                         |          |

- Calibration Data

  > [!NOTE] Still unknown purpose

  ```PYTHON
  0x0E,0x4E,0xC4
  0x0E,0xBD,0x0B
  0x0F,0x4A,0xD4
  0x00,0x00,0x00
  ```

- RF Chip States (CMD: RF_POWER_UP):

  ```PYTHON
  SIZE,DATA
  0x01,0x02
  0x01,0x03
  0x04,0x20014AFF
  0x04,0x20014A4A
  0x06,0x041421201B00
  0x06,0x22030150003D
  ```
