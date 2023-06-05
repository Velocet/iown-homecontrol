/** @file
    io-homecontrol (I2G/BHz) devices from Velux, Somfy, etc.

    Copyright (C) 2021 Christian W. Zuckschwerdt <zany@triq.net>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.
*/

#include "decoder.h"

#define SYNCWORDBYTE1 FF
#define SYNCWORDBYTE2 33
#define CONTROLBYTE1_SIZE 1     // Size of Block 1, format A
#define CONTROLBYTE2_SIZE 1     // Size of Block 1, format A
#define SOURCE_ADDR_SIZE 3     // Size of Block 1, format B
#define DESTINATION_ADDR_SIZE 3     // Size of Block 1, format B
#define CMD_ID_SIZE 1     // Size of Block 1, format A
#define PARAMETER_SIZE 1     // Size of Block 1, format B
#define PARAMETERDATA_SIZE 2     // Size of Block 1, format B
#define fori(x) for (int i=0; i<=x; i++)
#define MESSAGELENGTH(x) (x & 1F) // message length in byte [4:0]
/**
io-homecontrol devices (incl. Atlantic I2G, SIMU BHz) from Velux, Somfy, etc.

E.g. Velux remote controller KLI 313 (1W).

    rtl_433 -c 0 -R 0 -g 37.2 -X "n=iohc,m=FSK_PCM,s=26,l=26,t=5,r=286,preamble={24}0x5555ff,decode_uart" -f 868.945M
    rtl_433 -c 0 -R 0 -d 0 -s 1024k -g 37.2 -f 869M -X "name=iown,modulation=FSK_PCM,short=26,long=26,tolerance=5,reset=286,preamble={32}0x5557FD99,decode_uart" -M time:off -M level -vv
    rtl_433 -c 0 -R 0 -d 0 -g 37.2 -f 868.945M -X "name=iown,modulation=FSK_PCM,short=26,long=26,tolerance=5,reset=286,preamble=0xFD99" -M time:off -M level -vv

1W Version Protocol description:

- Preamble (variable length, at least 64 bit) is 55 ... 55.
- Message (incl. sync word) is UART encoded: 8 data bits == 10 packet bits.
  - 16 bit sync word: 0xFF33. UART encoded: 0 FF 1 0 CC 1 = 7FD99 (33 is CC "on the line" (but why? 0o).
- 8 bit frame "control byte" 1: 3 bit type + 5 bit length
- 8 bit frame "control byte" 2 with further info on the frame
- 3 byte destination address (little endian presumably).
- 3 byte source address (little endian presumably).
- 1 byte command id
- n byte variable length payload
- 2 byte optional counter value depending on command id and version
- 6 byte optional HMAC value depending on command id and version
- 2 byte CRC-16/KERMIT (poly=0x1021 init=0 refin=refout=true xorout=0 check=0x2189 residue=0).

Example 1W packets:

    FF33 F6 20 00003F DACDEA 00 01 61 0000 00 00      0BDD FD8EF56F15AD AA1E
    FF33 F6 20 00003F DACDEA 00 01 61 C800 00 00      0BBD 8AA3A9732E10 26D2
    FF33 F6 20 00003F DACDEA 00 01 61 D200 00 00      0B99 15DECACF7E0E 8069
    FF33 F6 00 00003F DACDEA 00 01 61 D200 00 00      0BA1 05175A82DFAE 8BBF
    FF33 F8 00 00007F E1F573 00 01 61 D400 80 C800 00 0D6C 2C3A3123E6AB 7F1E [UP RIGHT]
    FF33 F8 00 00007F C58967 00 01 61 D400 80 C800 00 0C63 04E867ED64AD F055 [UP LEFT]
    FF33 F8 00 00007F 708758 00 01 61 D400 80 C800 00 3BD5 05526875499C 7E72 [UP PSA]
    FF33 F6 00 00003F E1F573 00 01 61 D200 00 00      0D6F 708D89781E43 BC24 [STOP RIGHT]
    FF33 F6 00 00003F C58967 00 01 61 D200 00 00      0C66 4FCF56FB1C72 D31E [STOP LEFT]
    FF33 F6 00 00003F 708758 00 01 61 D200 00 00      3BD2 E6B62CEF54C8 A937 [STOP PSA]
    FF33 F8 00 00007F E1F573 00 01 61 D400 80 C800 00 0D74 9FB9A0665FF4 77A6 [DOWN RIGHT]
    FF33 F8 00 00007F C58967 00 01 61 D400 80 C800 00 0C6B 56FCF691E6A9 2C74 [DOWN LEFT]
    FF33 F8 00 00007F 708758 00 01 61 D400 80 C800 00 3BDF 1EE7A0E30448 7A6B [DOWN PSA]
    FF33 F6 00 00003F 17F523 00 01 47 C800 00 00      18C4 38789CB680CC BC74
    ^    ^  ^  ^      ^      ^  ^  ^  ^    ^  ^    ^  ^    ^            ^CRC
    ^    ^  ^  ^      ^      ^  ^  ^  ^    ^  ^    ^  ^    ^HMAC
    ^    ^  ^  ^      ^      ^  ^  ^  ^    ^  ^    ^  ^Rolling Code
    ^    ^  ^  ^      ^      ^  ^  ^  ^    ^  ^    ^functionparameter2
    ^    ^  ^  ^      ^      ^  ^  ^  ^    ^  ^functionparameter11data
    ^    ^  ^  ^      ^      ^  ^  ^  ^    ^functionparameter1
    ^    ^  ^  ^      ^      ^  ^  ^  ^mainparameter
    ^    ^  ^  ^      ^      ^  ^  ^acei
    ^    ^  ^  ^      ^      ^  ^originator
    ^    ^  ^  ^      ^      ^command
    ^    ^  ^  ^      ^destination
    ^    ^  ^  ^source
    ^    ^  ^controlbyte2
    ^    ^controlbyte1 with length of payload[4:0]
    ^syncword, not included in CRC


    FF33 F8 00 00003F 17F523 20 02 FF0143 01 0E0000   18C5 045EE107363D 59B4
    FF33 F8 00 00003F 17F523 20 02 FF0143 01 05FF00   18C6 A34715CBE012 4F7F

    ^    ^  ^destination
    ^    ^length of payload[4:0]
    ^sync, not included in CRC

    FF33 F8 00 00007F E1F573 00 01 61 D400 80 C800 00 0D9A 4C0E4A0E45AA 995D
    FF33 F8 00 00007F C58967 00 01 61 D400 80 C800 00 0D9A 87AC970B53D1 D80D
*/
// https://stackoverflow.com/questions/18591924/how-can-i-use-a-bitmask#18592049
static int iohc_decode(r_device *decoder, bitbuffer_t *bitbuffer)
{
    uint8_t const preamble_pattern[] = {0x57, 0xfd, 0x99};

    uint8_t b[1 + 31 + 2]; // Length, payload, CRC

    if (bitbuffer->num_rows != 1) return DECODE_ABORT_EARLY;

    unsigned offset = bitbuffer_search(bitbuffer, 0, 0, preamble_pattern, 24) + 24;
    if (offset >= bitbuffer->bits_per_row[0]) return DECODE_ABORT_EARLY;
    int num_bits = bitbuffer->bits_per_row[0] - offset;

    num_bits = MIN((size_t)num_bits, sizeof (b) * 8);

    int len = extract_bytes_uart(bitbuffer->bb[0], offset, num_bits, b);
    if (len < 11) return DECODE_ABORT_LENGTH;

    // Mandatory fields
    // Control byte 1
    // end_flag : 1
    // start_flag : 1
    // protocol_mode : 1
    // frame_length : 5
    int msg_len = b[0] & 0x1f;
    if (len < msg_len + 3) return DECODE_ABORT_LENGTH;
    len = msg_len + 3;
    int msg_end_flag      = (b[0] & 0x80) >> 7;
    int msg_start_flag    = (b[0] & 0x40) >> 6;
    int msg_protocol_mode = (b[0] & 0x20) >> 5;

    // Control byte 2
    // use_beacon : 1
    // is_routed : 1
    // low_power_mode : 1
    // protocol_version : 3
    int msg_use_beacon       = (b[1] & 0x80) >> 7;
    int msg_is_routed        = (b[1] & 0x40) >> 6;
    int msg_low_power_mode   = (b[1] & 0x20) >> 5;
    int msg_protocol_version = (b[1] & 0x03);

    // Addresses
    // dst_addr : 24
    // src_addr : 24
    int msg_dst_addr = (b[2] << 16) | (b[3] << 8) | b[4];
    int msg_src_addr = (b[5] << 16) | (b[6] << 8) | b[7];

    // Command ID
    // cmd_id : 8
    int msg_cmd_id = b[8];

    // optional fields
    int msg_seq_nr = 0;
    char msg_mac[13] = {0};

    char msg_data[31 * 2 + 1]; // variable length, converted to hex string
    unsigned int data_length = msg_len - 8;
    if (msg_protocol_mode == 0 || data_length < 8) {bitrow_snprint(&b[9], data_length * 8, msg_data, sizeof (msg_data));
    } else {
        data_length -= 8;
        bitrow_snprint(&b[9], data_length * 8, msg_data, sizeof (msg_data));
        msg_seq_nr = (b[9 + data_length] << 8) | b[9 + data_length + 1];
        bitrow_snprint(&b[9 + data_length + 2], 6 * 8, msg_mac, sizeof msg_mac);
    }

    // crc : 16;
    //int msg_crc = (b[len - 2] << 8) | b[len - 1];
    // calculate and verify checksum: unreflected poly 0x1021
    if (crc16lsb(b, len, 0x8408, 0x0000) != 0) return DECODE_FAIL_MIC;

    decoder_logf_bitrow(decoder, 2, __func__, b, len * 8, "offset %u, num_bits %u, len %d, msg_len %d", offset, num_bits, len, msg_len);

    /* clang-format off */
    data_t *data = data_make(
            "model",            "",                 DATA_STRING, "io-homecontrol",
            "id",               "Source",           DATA_FORMAT, "%06x", DATA_INT, msg_src_addr,
            "dst_id",           "Target",           DATA_FORMAT, "%06x", DATA_INT, msg_dst_addr,
            "msg_type",         "Command",          DATA_FORMAT, "%02x", DATA_INT, msg_cmd_id,
            "msg",              "Message",          DATA_STRING, msg_data,
            "mode",             "Mode",             DATA_STRING, msg_protocol_mode ? "1W" : "2W",
            "version",          "Version",          DATA_INT,    msg_protocol_version,
            "counter",          "Counter",          DATA_COND,   msg_protocol_mode == 1, DATA_INT,    msg_seq_nr,
            "mac",              "MAC",              DATA_COND,   msg_protocol_mode == 1, DATA_STRING, msg_mac,
            "flag_end",         "End flag",         DATA_INT,    msg_end_flag,
            "flag_start",       "Start flag",       DATA_INT,    msg_start_flag,
            "flag_mode",        "Mode flag",        DATA_INT,    msg_protocol_mode,
            "flag_beacon",      "Beacon flag",      DATA_INT,    msg_use_beacon,
            "flag_routed",      "Routed flag",      DATA_INT,    msg_is_routed,
            "flag_lpm",         "LPM flag",         DATA_INT,    msg_low_power_mode,
            "mic",              "Integrity",        DATA_STRING, "CRC",
            NULL);
    /* clang-format on */

    decoder_output_data(decoder, data);
    return 1;
}

static char const *const output_fields[] = {
        "model",
        "id",
        "dst_id",
        "msg_type",
        "msg",
        "mode",
        "version",
        "counter",
        "mac",
        "flag_end",
        "flag_start",
        "flag_mode",
        "flag_beacon",
        "flag_routed",
        "flag_lpm",
        "mic",
        NULL,
};
0,0260416666666667

// rtl_433 -c 0 -R 0 -g 40 -X "n=uart,m=FSK_PCM,s=26,l=26,r=300,preamble={24}0x57fd99,decode_uart" -f 868.89M
// 1000/38400 = 26,0416us
// 1000/38415 = 26,0314us = (real)
// 38400 +/- 1% or 2% =     max.:25,531us
r_device const iohc = {
        .name        = "io-homecontrol",
        .modulation  = FSK_PULSE_PCM,
        .short_width = (1000/38400) // 26,0416us
        .long_width  = (1000/38400) // 26,0416us
        .tolerance   = 5,   // see corresponding Honeywell (EvoHome, Ramses) protocol
        .reset_limit = 286, // UART encoding has at most 9 0's = nominal 234 us.
        .decode_fn   = &iohc_decode,
        .fields      = output_fields,
};
