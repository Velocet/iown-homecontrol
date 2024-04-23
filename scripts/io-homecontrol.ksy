meta:
  id: iohomecontrol_protocol_body
  title: io-homecontrol Frame
  endian: le
  license: CC0-1.0
  ks-version: 0.8
  imports:
    - /network/protocol_body
    - /network/ipv4_packet
    - /network/tcp_segment
    - /network/udp_datagram
    - /network/icmp_packet
doc: |
  Protocol body represents particular payload on transport level (OSI layer 4).

  Typically this payload in encapsulated into network level (OSI layer 3) packet, which includes "protocol number" field that would be used
  to decide what's inside the payload and how to parse it. Thanks to IANA's standardization effort, multiple network level use the same
  IDs for these payloads named "protocol numbers".

  This is effectively a "router" type: it expects to get protocol number as a parameter, and then invokes relevant type parser based on that parameter.

                 d[0]                              d[1]
  7   6   5   4   3   2   1   0     7   6   5   4   3   2   1   0
  a4  a3  a2  a1  a0  b8  b7  b6    b5  b4  b3  b2  b1  b0  c1  c0
  ─────────┬────────  ─────────────────┬──────────────────  ───┬──
           a                           b                       c
 │ ───────────────────────────> │  │ ───────────────────────────> │
        parsing direction       ╷  ↑
                                └┄┄┘
doc-ref: https://github.com/velocet/iown-homecontrol
params:
  - id: protocol_num
    type: u1
    doc: Protocol number as an integer.
seq:
  - id: preamble
    contents: [0x55, 0x55, 0x55, 0x55]
  - id: sync_word
    contents: [0xFF, 0x33]
  - id: header
    type: struct_header
    size: 2
  - id: body
    type:
      switch-on: protocol
      cases:
        'command_enum::000_acei': parameter_acei
        'command_enum::032_prv': parameter_prv
        'command_enum::255_undefined': parameter_na
instances:
  controlbyte1:
    pos: 0
    type:
    value: protocol_num
    enum: command_enum
  controlbyte1:
    value: protocol_num
    enum: command_enum

    value: protocol_num
    enum: command_enum
types:
  struct_header:
    meta:
      bit-endian: be
    seq:
      - id: control_byte_1
        doc: |
                     d[0]
          7   6   5   4   3   2   1   0
          v3  v2  v1  v0  h3  h2  h1  h0
          ───────┬──────  ───────┬──────
              version       len_header
        size: 1
        type: header_byte_1
        seq:
          - id: version
            type: b4
          - id: length
            type: b4
      - id: control_byte_2
        size: 1
        type: header_byte_2
  parameter_acei:
    doc: Standard Parameter (Command) with a Main Parameter and optional Functional Parameter
    seq:
      - id: next_header_type
        type: u1
      - id: hdr_ext_len
        type: u1
      - id: body
        size: hdr_ext_len - 1
      - id: next_header
        type: protocol_body(next_header_type)
  parameter_prv:
    doc: Dummy type for IPv6 "no next header" type, which signifies end of headers chain.
  parameter_na:
    doc: Reserved or Undefined Parameter
enums:
  command_enum:
    00: 000_acei
    20: 032_prv
    255: 255_undefined


meta:
  id: io_homecontrol
  title: io-homecontrol Frame
  endian: le
  xref:
    rfc: 791
    wikidata: Q11103
  license: CC0-1.0
  ks-version: 0.8
  imports:
    - /network/protocol_body
seq:
  - id: control_byte_1
    size: 1
  - id: control_byte_2
    size: 1
  - id: total_length
    type: u2be
  - id: hmac
    size: 2
  - id: ttl
    type: u1
  - id: data
    type: u1
  - id: packet_checksum
    size: 2
  - id: src_node_addr
    size: 4
  - id: dst_node_addr
    size: 4
  - id: options
    type: ipv4_options
    size: ihl_bytes - 20
  - id: body
    size: total_length - ihl_bytes
    type: protocol_body(protocol)
instances:
  version:
    value: (b1 & 0xf0) >> 4
  ihl:
    value: b1 & 0xf
  ihl_bytes:
    value: ihl * 4
types:
  ipv4_options:
    seq:
      - id: entries
        type: ipv4_option
        repeat: eos
  ipv4_option:
    seq:
      - id: b1
        type: u1
      - id: len
        type: u1
      - id: body
        size: 'len > 2 ? len - 2 : 0'
    instances:
      copy:
        value: (b1 & 0b10000000) >> 7
      opt_class:
        value: (b1 & 0b01100000) >> 5
      number:
        value: (b1 & 0b00011111)
