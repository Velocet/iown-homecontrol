#!/usr/bin/env python3

import binascii
from typing import Tuple

import aes

# Transfer key used to obfuscate keys transferred during pairing process
transfer_key = bytes.fromhex("34c3466ed88f4e8e16aa473949884373")

def compute_crc_8408_byte(data: int, crc: int = 0) -> int:
  """
  Returns the intermediate CRC value based on a unique byte passed as parameter
  """
  crc ^= data
  for i in range(8):
    remainder = 0x8408 if crc & 1 else 0
    crc = (crc >> 1) ^ remainder
  return crc

def compute_crc_8408(data: bytes, crc: int = 0) -> int:
  """
  Returns the CRC value for the given data frame.
  Used for whole io-homecontrol frames integriy check
  """
  for b in data:
    crc = compute_crc_8408_byte(b, crc)
  return crc

def computeChecksum(frame_byte: int, chksum1: int, chksum2: int) -> Tuple[int, int]:
  """
  Returns what looks like a custom-made CRC for use in intial values
  """
  tmpchksum = frame_byte ^ chksum2
  chksum2 = ((chksum1 & 0x7f) << 1) & 0xff
  if chksum1 & 0x80 == 0:
    if tmpchksum >= 128:
      chksum2 |= 1
    return (chksum2, (tmpchksum << 1) & 0xff)
  if tmpchksum >= 128:
    chksum2 |= 1

  return (chksum2 ^ 0x55, ((tmpchksum << 1) ^ 0x5b) & 0xff)

# If challenge is set, the function switches to 2-Way mode and sequence_number becomes not mandatory
# frame_data must include only the data part of the frame, command ID and parameters
def constructInitialValue(frame_data: bytes, challenge: bytes = None, sequence_number: bytes = None) -> bytes:
  """
  Builds the initial value to be passed to AES in most cases (key exchange and authentication)
  """
  if challenge is None and sequence_number is None:
    print("Cannot create initial value: no mode selected")
    return b''
  initial_value = bytearray(16)
  initial_value[8] = 0
  initial_value[9] = 0
  i = 0
  while i < len(frame_data):
    initial_value[8], initial_value[9] = computeChecksum(frame_data[i], initial_value[8], initial_value[9])
    if i < 8:
      initial_value[i] = frame_data[i]
    i += 1
  if i < 8:
    for j in range(i, 8):
      initial_value[j] = 0x55
  if challenge is None and sequence_number is not None:
    for i in range(12,16):
      initial_value[i] = 0x55
    initial_value[10] = sequence_number[0]
    initial_value[11] = sequence_number[1]
  elif challenge is not None and len(challenge) == 6:
    for i in range(10,16):
      initial_value[i] = challenge[i-10]
  return initial_value

def decrypt_iv_from_key(encrypted: bytes, system_key: bytes) -> bytes:
  """
  Decrypt the IV used for encrypting a key (by using the key encrypted and the transfer key).
  Only useful for debug purposes.
  """
  encrypted_iv = bytearray(16)
  for b in range (0, len(encrypted)):
    encrypted_iv[b] = encrypted[b] ^ system_key[b]
  cipher = aes.AES(transfer_key)
  return cipher.decrypt_block(encrypted_iv)

def create_2W_hmac(challenge: bytes, system_key: bytes, frame_data: bytes) -> bytes:
  """
  Creates a MAC for 2-Way communication (to use in 0x3d answers)
  frame_data must only include the final payload, starting at the command ID
  """
  iv = constructInitialValue(frame_data, challenge)
  cipher = aes.AES(system_key)
  return cipher.encrypt_block(iv)[:6]

def create_1W_hmac(sequence_number: bytes, key: bytes, frame_data: bytes) -> bytes:
  """
  Creates a MAC for 1-Way communication (to append to 1-Way frames)
  frame_data must only include the final payload, starting at the command ID
  """
  iv = constructInitialValue(frame_data, sequence_number=sequence_number)
  cipher = aes.AES(key)
  return cipher.encrypt_block(iv)[:6]

def encrypt_2W_key(challenge: bytes, frame_data: bytes, key: bytes) -> bytes:
  """
  Encrypts (or decrypts if the encrypted key is passed as last parameter) the system key of a 2-way device using the transfer key.
  """
  iv = constructInitialValue(frame_data, challenge=challenge)
  cipher = aes.AES(transfer_key)
  encrypted_iv = bytearray(cipher.encrypt_block(iv))
  for i in range(0, 16):
    encrypted_iv[i] ^= key[i]
  return encrypted_iv

def encrypt_1W_key(node_address: bytes, key: bytes) -> bytes:
  """
  Encrypts (or decrypts if the encrypted key is passed as last parameter) the system key of a 1-way device using the transfer key.
  """
  iv = bytearray(16)
  for i in range(0, 13, 3):
    iv[i] = node_address[0]
    iv[i+1] = node_address[1]
    iv[i+2] = node_address[2]
  iv[15] = node_address[0]
  cipher = aes.AES(transfer_key)
  encrypted_iv = bytearray(cipher.encrypt_block(iv))
  for i in range(0, 16):
    encrypted_iv[i] ^= key[i]
  return encrypted_iv

def demo() -> None:
  """
  Tests and demonstrates the usage of all functions provided by this script.
  """
  print("#### 1-way device key push using command 0x30, node address abcdef and sequence number 0x1234 ####")
  node_address = bytes.fromhex("abcdef")
  sequence_number = bytes.fromhex("1234")
  controller_key = bytes.fromhex("01020304050607080910111213141516")
  print("Initial value used for key encryption:")
  iv = bytearray(16)
  for i in range(0, 13, 3):
    iv[i] = node_address[0]
    iv[i+1] = node_address[1]
    iv[i+2] = node_address[2]
  iv[15] = node_address[0]
  print("  " + binascii.hexlify(iv).decode('utf-8'))
  print("Controller key in clear:")
  print("   " + binascii.hexlify(controller_key).decode('utf-8'))
  encrypted_1W = encrypt_1W_key(node_address, controller_key)
  print("Controller key encrypted:")
  print("   " + binascii.hexlify(encrypted_1W).decode('utf-8'))
  frame_data = b'\x30' + encrypted_1W
  print("Frame data:")
  print("   " + binascii.hexlify(frame_data).decode('utf-8'))
  mac = create_1W_hmac(sequence_number, controller_key, frame_data)
  print("Authentication message:")
  print("   " + binascii.hexlify(mac).decode('utf-8'))
  print("Final frame sent (assuming the controller is built by Somfy):")
  frame = bytes.fromhex("fc 00 00003f") + node_address + b'\x30' + encrypted_1W + b'\x02\x01' + sequence_number + mac
  crc = compute_crc_8408(frame)
  frame = frame + bytes([crc & 0xff, (crc >> 8) & 0xff])
  print("   " + binascii.hexlify(frame).decode('utf-8'))

  print()
  print("#### 2-way device key pull using command 0x38 and challenge 123456789abc ####")
  challenge = bytes.fromhex("123456789abc")
  frame38 = bytes.fromhex("38") + challenge
  system_key = bytes.fromhex("abcdef01020304050607080910111213")
  print("Initial value used for key encryption:")
  print("  " + binascii.hexlify(constructInitialValue(frame38, challenge)).decode('utf-8'))
  print("Encrypted 2-way key to be sent with 0x32:")
  encrypted_2W = encrypt_2W_key(challenge, frame38, system_key)
  print("  " + binascii.hexlify(encrypted_2W).decode('utf-8'))
  frame32 = bytes.fromhex("32") + encrypted_2W
  challenge = bytes.fromhex("123456789abc")
  print("Challenge answer to 123456789abc and last command 0x32 with previously encrypted key:")
  mac_2w = create_2W_hmac(challenge, system_key, frame32)
  print("  " + binascii.hexlify(mac_2w).decode('utf-8'))
  print("Frames sent on the air:")
  # 0x38 ask key transfer
  frame = bytes.fromhex("4e 04 feefee f00f00") + frame38
  crc = compute_crc_8408(frame)
  frame = frame + bytes([crc & 0xff, (crc >> 8) & 0xff])
  print("  " + binascii.hexlify(frame).decode('utf-8'))
  # 0x32 key transfer
  frame = bytes.fromhex("18 04 f00f00 feefee 32") + encrypted_2W
  crc = compute_crc_8408(frame)
  frame = frame + bytes([crc & 0xff, (crc >> 8) & 0xff])
  print("  " + binascii.hexlify(frame).decode('utf-8'))
  # 0x3c challenge
  frame = bytes.fromhex("0e 00 feefee f00f00 3c") + challenge
  crc = compute_crc_8408(frame)
  frame = frame + bytes([crc & 0xff, (crc >> 8) & 0xff])
  print("  " + binascii.hexlify(frame).decode('utf-8'))
  # 0x3d challenge answer
  frame = bytes.fromhex("8e 00 f00f00 feefee 3d") + mac_2w
  crc = compute_crc_8408(frame)
  frame = frame + bytes([crc & 0xff, (crc >> 8) & 0xff])
  print("  " + binascii.hexlify(frame).decode('utf-8'))

  print()
  print("#### 2-way device key push using command 0x31 and challenge 123456789abc ####")
  frame31 = bytes.fromhex("31")
  challenge1 = bytes.fromhex("123456789abc")
  system_key = bytes.fromhex("01020304050607080910111213141516")
  print("Initial value used for key encryption:")
  print("  " + binascii.hexlify(constructInitialValue(frame31, challenge=challenge1)).decode('utf-8'))
  print("Encrypted 2-way key to be sent with 0x32:")
  encrypted_2W = encrypt_2W_key(challenge, frame31, system_key)
  print("  " + binascii.hexlify(encrypted_2W).decode('utf-8'))
  frame32 = bytes.fromhex("32f849584ffcfc442b1e97e4c38df7b143")
  challenge2 = bytes.fromhex("123456789abc")
  print("Challenge answer to challenge 123456789abc and last command 0x32 with previously encrypted key:")
  mac_2w32 = create_2W_hmac(challenge2, system_key, frame32)
  print("  " + binascii.hexlify(mac_2w32).decode('utf-8'))
  print("Frames sent on the air:")
  # 0x31 ask challenge
  frame = bytes.fromhex("48 00 feefee f00f00") + frame31
  crc = compute_crc_8408(frame)
  frame = frame + bytes([crc & 0xff, (crc >> 8) & 0xff])
  print("  " + binascii.hexlify(frame).decode('utf-8'))
  # 0x3c challenge
  frame = bytes.fromhex("0e 00 f00f00 feefee 3c") + challenge1
  crc = compute_crc_8408(frame)
  frame = frame + bytes([crc & 0xff, (crc >> 8) & 0xff])
  print("  " + binascii.hexlify(frame).decode('utf-8'))
  # 0x32 key transfer
  frame = bytes.fromhex("18 00 f00f00 feefee 32") + encrypted_2W
  crc = compute_crc_8408(frame)
  frame = frame + bytes([crc & 0xff, (crc >> 8) & 0xff])
  print("  " + binascii.hexlify(frame).decode('utf-8'))
  # 0x3c challenge
  frame = bytes.fromhex("0e 00 f00f00 feefee 3c") + challenge2
  crc = compute_crc_8408(frame)
  frame = frame + bytes([crc & 0xff, (crc >> 8) & 0xff])
  print("  " + binascii.hexlify(frame).decode('utf-8'))
  # 0x3d challenge answer
  frame = bytes.fromhex("0e 00 feefee f00f00 3d") + mac_2w32
  crc = compute_crc_8408(frame)
  frame = frame + bytes([crc & 0xff, (crc >> 8) & 0xff])
  print("  " + binascii.hexlify(frame).decode('utf-8'))
  # 0x33 key transfer complete
  frame = bytes.fromhex("88 00 f00f00 feefee 33")
  crc = compute_crc_8408(frame)
  frame = frame + bytes([crc & 0xff, (crc >> 8) & 0xff])
  print("  " + binascii.hexlify(frame).decode('utf-8'))

demo()
