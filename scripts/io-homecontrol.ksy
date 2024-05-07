meta:
  id: iohomecontrol
  title: io-homecontrol packet
  license: CC0-1.0
  endian: be
doc: |
  describes a io-homecontrol packet (Layer 3; Network)
  It starts with the SFD (Start Frame Delimiter) and ends with a checksum (CRC-16)
  The encoding is big-endian (except the 16-bit checksum)
  example: ff 33 f8 00 00 00 7f 70 87 58 00 01 61 d4 00 80 c8 00 00 3b d5 05 52 68 75 49 9c 7e 72
           |___|       |______| |______|                            |___|                   |___|
            SFD         target   source                            counter                   crc
seq:
  - id: sfd
    doc: Start Frame Delimiter
    contents: [0xFF, 0x33]
  - id: control1
    type: control1
  - id: control2
    type: control2
  - id: target_id
    type: b24
  - id: source_id
    type: b24
  - id: command
    type: u1
    enum: command
  - id: parameter
    doc: payload_length - bytes_already_parsed - counter - mac
    size: control1.payload_length - 8 - 2 - 6
  - id: counter
    type: u2
  - id: mac
    size: 6
  - id: checksum
    doc: CRC-16/KERMIT
    type: u2le

types:
  control1:
    seq:
    - id: order
      type: b2
      enum: order
    - id: mode
      type: b1
      enum: mode
    - id: payload_length
      type: b5
  control2:
    doc: Extended Frame Information
    seq:
    - id: use_beacon
      type: b1
    - id: routed
      type: b1
    - id: low_power_mode
      type: b1
    - id: ack
      type: b1
    - id: unknown
      type: b2
    - id: protocol_version
      type: b2

enums:
  order:
    0: single
    1: next_in_series
    2: next_in_parallel
    3: command_group_end
  mode:
    0: two_way
    1: one_way
  command:
    0x00: execute_function
    0x01: activate_mode
    0x02: direct_command
    0x03: private_command
    0x04: private_command_answer
    0x28: discover
    0x29: discover_answer
    0x2a: discover_remote
    0x2b: discover_remote_answer
    0x2c: discover_actuator_confirmation
    0x2d: discover_confirmation_ack
    0x30: send_key
    0x31: ask_challenge
    0x32: key_transfer
    0x33: key_transfer_ack
    0x36: address_request
    0x37: address_answer
    0x38: launch_key_transfer
    0x39: remove_controller
    0x3c: challenge_request
    0x3d: challenge_response
    0x46: script_upload
    0x47: download_config
    0x4a: rename_file
    0x50: get_name
    0x51: get_name_answer
    0x52: write_name
    0x53: write_name_ack
    0x54: get_general_info_1
    0x55: general_info_1_answer
    0x56: get_general_info_2
    0x57: general_info_2_answer
    0xe0: bootloader_command
    0xe1: bootloader_device
    0xf0: send_raw_message
    0xf2: reboot
    0xf3: service_status_ack
