#!/usr/bin/env python

import threading
import serial
import time
import sys
import logging
import pprint
import re
from enum import Enum
from hex_pprint import HexPrettyPrinter


IoState = Enum('IoState', 'IDLE WAIT_SIZE WAIT_HDR WAIT_CMD WAIT_END')


class SerialMouse:

    def __init__(self):
        self.port = '/dev/ttyACM1'
        self.baud = 115200
        self.serial_port = serial.Serial(self.port, self.baud, timeout=0)
        self.logger = logging.getLogger('openio.'+self.__class__.__name__)
        self.state = IoState.IDLE
        self.bytes_in_state = 0
        self.frame = {}
        self.init_frame()
        self.pp = HexPrettyPrinter()
        self.expecting_ack = False
        self.previous_elapsed = 0
        

    def init_frame(self):
        self.frame['raw'] = bytearray()
        self.frame['size'] = 0
        self.frame['header'] = bytearray()
        self.frame['command'] = None
        self.frame['payload'] = bytearray()

    def start_listening_thread(self):
        thread = threading.Thread(target=self.read_blocking, args=(self.serial_port,))
        thread.daemon = True
        thread.start()

    def read_blocking(self, ser):
        while True:
            #self.logger.debug('loop')
            read_bytes = ser.read()
            self.handle_data(read_bytes)

    def send_hex_to_port(self, s, wait_ack = True, sleep = 0):
        """ Sends bytes given as hexadecimal string. 
        wait_ack will cause this method to wait for an ack to be received before returning.
        wait_ack can be used only from the main thread!
        sleep is an additional delay in seconds before returning
        Returns number of bytes sent."""
        self.logger.info(s)
        data = bytearray.fromhex(s)
        if (len(data) == 1) and (data[0] == 0x55):
            logger.fatal('do not use this to send acks, use send_ack instead')
            sys.exit()
        num_sent = self.serial_port.write(data)
        self.logger.debug("Sent {} bytes".format(num_sent))
        if wait_ack:
            self.wait_for_ack()
        time.sleep(sleep)
        return num_sent

    def send_ack(self):
        self.logger.debug('ack')
        data = bytearray.fromhex('55')
        self.serial_port.write(data)

    def set_state(self, new_state):
        """ Change the internal state """
        self.logger.debug('Setting state to {0}'.format(new_state))
        self.state = new_state
        self.bytes_in_state = 0

    def handle_data(self, data):
        if len(data) == 0:
            return
        if len(data) > 1:
            self.logger.fatal('Multi-byte decode not implemented')
            sys.exit()

        hexa_string = ' '.join(format(x, '02x') for x in bytearray(data))
        #self.logger.debug( 'In {}, byte: {}'.format(self.state, hexa_string))

        if self.state == IoState.IDLE:
            if ord(data) == 0xc0:
                # begin new frame
                self.init_frame()
                self.frame['raw'] += data
                self.set_state(IoState.WAIT_SIZE)
            elif ord(data) == 0x55:
                self.logger.debug('ACK received')
                self.expecting_ack = False
            else:
                self.logger.warning('Non frame data received in IDLE: {}'.format(data.encode('hex')))
        elif self.state == IoState.WAIT_SIZE:
            self.frame['raw'] += data
            # assuming 2 bytes for size, MSB first
            if self.bytes_in_state == 0:
                self.frame['size'] == ord(data) * 256
                self.bytes_in_state += 1
            else:
                self.frame['size'] += ord(data)
                self.set_state(IoState.WAIT_HDR)
        elif self.state == IoState.WAIT_HDR:
            self.frame['raw'] += data
            self.frame['header'] += data
            self.bytes_in_state += 1
            if self.bytes_in_state >= 3:
                self.set_state(IoState.WAIT_CMD)
        elif self.state == IoState.WAIT_CMD:
            self.frame['raw'] += data
            if ord(data) not in (0x03, 0x04, 0x05, 0x06, 0x07, 0x0b, 0x0c):
                self.logger.fatal('Unknown command: {}'.format(data))
                sys.exit()
            self.frame['command'] = data
            self.set_state(IoState.WAIT_END)
        elif self.state == IoState.WAIT_END:
            self.frame['raw'] += data
            if len(self.frame['raw']) >= self.frame['size'] + 2:
                if ord(data) == 0xc0:
                    self.handle_frame(self.frame)
                    self.set_state(IoState.IDLE)
                else:
                    self.logger.fatal('No end marker when expected')
                    sys.exit()
            else:
                self.frame['payload'] += data
                self.bytes_in_state += 1
        else:
            self.logger.fatal("Unhandlet IoState")
            sys.exit()

    def handle_frame(self, frame):
        self.logger.info( self.pp.pformat( {'cmd':frame['command'], 'payload': frame['payload']} ) )
        self.send_ack()

    def wait_for_ack(self):
        # use in main thread only
        start_time = time.time()
        while self.expecting_ack:
            time.sleep(0.1)
            elapsed_time = time.time() - start_time
            if elapsed_time > 1.0:
                if (elapsed_time - self.previous_elapsed) > 1.0:
                    self.logger.warning('Waiting for ack: {} seconds.'.format(round(elapsed_time)))
                    self.previous_elapsed = elapsed_time



def main():
    logger = logging.getLogger('openio')
    FORMAT = "[%(lineno)3s - %(funcName)20s() ] %(message)s"
    logging.basicConfig(format=FORMAT)
    logger.setLevel(logging.INFO)

    m = SerialMouse()
    m.start_listening_thread()

    logger.info('Initialisation sequence')
    m.send_hex_to_port('02 04 fa', wait_ack = False)
    time.sleep(0.5)
    m.send_hex_to_port('c0 00 25 01 00 00 06 94 f0 02 31 7b 7f 11 3b 6f 3a a4 85 88 03 26 ed 62 84 16 fa 16 e2 da 56 54 d9 0a e0 55 6e fb c0', sleep=1)
    m.send_hex_to_port('c0 00 25 01 00 00 0c 2b de ca 98 26 0d a3 7f 27 c6 bc 1c 8b 07 42 d6 a5 38 57 67 b3 c5 a1 22 4c 26 4f 58 80 16 f5 c0', sleep=1)
    m.send_hex_to_port('c0 00 25 01 00 00 0c da b8 3a c2 55 9b c2 fe ed a2 42 d3 3a e7 2a 4b 1a da b4 f8 8c 75 b0 93 24 e6 b5 b7 76 25 24 c0', sleep=1)


    # m.send_hex_to_port('c0 00 25 01 00 00 06 65 6c 1b 2c d8 0b d5 c1 47 db 11 f5 28 13 ec 03 a4 1e cb 9b 12 12 62 b3 9a fb 7b 35 a9 47 e6 c0', sleep=1)
    # m.send_hex_to_port('c0 00 25 01 00 00 0c c8 5d 6d fd 01 82 d4 5d ce 41 5d d3 15 e7 96 d4 1c ef 64 23 0f 0a ab c0 86 e0 ff 98 06 f9 c3 c0', sleep=1)
    # m.send_hex_to_port('c0 00 25 01 00 00 0c d7 7e ce 02 9e ab c4 94 cd c5 94 9e bb 49 af f9 cf 52 d9 b1 ef 90 56 e2 f9 59 9b 3a 64 c9 3c c0', sleep=1)

    # logger.info('Setting to listen mode to receive key')
    # m.send_hex_to_port('c0 00 25 01 00 00 03 e8 6f 05 64 7a 66 3d e4 e6 13 2e bb be 77 3a 2c fd a8 4e ad ed a0 31 52 42 bf 36 94 1c 1f e3 c0')
    # logger.info('Waiting to receive security key')
    # time.sleep(5)
    # m.send_hex_to_port('c0 00 25 01 00 00 0b 07 42 7b 1d af fd 48 89 9d ad a1 ad 49 4d f5 dd 7d 3e 4d d0 d9 e6 20 58 d3 83 32 ce 9f b7 fb c0')
    # m.send_hex_to_port('c0 00 25 01 00 00 0c b1 76 79 41 9c 8a 06 79 c4 6c 02 98 3c 51 fa 47 68 04 ef 1f 2b fa 86 8c 2e e6 94 2c f0 08 31 c0')
    # time.sleep(15)
    # m.send_hex_to_port('c0 00 25 01 00 00 03 c4 96 3d 0f 70 bb 2d 83 01 00 3d 69 f7 6b 42 82 28 db 84 67 76 74 79 e8 f7 e1 ff 6a 6a 95 d6 c0')
    #logger.info('trying to retrieve info from roller hall')
    #m.send_hex_to_port('c0 00 25 01 00 00 05 f3 ba 56 64 00 11 fa 0e 85 23 71 01 97 59 fd ab b3 dc 85 82 37 51 95 55 dd fc 78 d2 0b 2f f7 c0')
    
    # keep the main thread running
    while True:
        time.sleep(1)


if __name__ == '__main__':
    main()