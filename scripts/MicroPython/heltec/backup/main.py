#import LoRaDuplexCallback
#import LoRaPingPong
#import LoRaSender
from examples import LoRaSender
from examples import LoRaReceiver

from config import *
from machine import Pin, SoftSPI
from sx127x import SX127x

device_spi = SoftSPI(baudrate = 10000000, 
        polarity = 0, phase = 0, bits = 8, firstbit = SoftSPI.MSB,
        sck = Pin(device_config['sck'], Pin.OUT, Pin.PULL_DOWN),
        mosi = Pin(device_config['mosi'], Pin.OUT, Pin.PULL_UP),
        miso = Pin(device_config['miso'], Pin.IN, Pin.PULL_UP))

lora = SX127x(device_spi, pins=device_config, parameters=lora_parameters)

node = 'sensor' #sender/relay/gateway

if __name__ == '__main__':
    if node == 'sensor':
        LoRaSender.send(lora)
    if node == 'relay':
        #LoRaReceiver.receive(lora)
        LoRaSender.send(lora)
    if node == 'gateway':
        LoRaReceiver.receive(lora)
