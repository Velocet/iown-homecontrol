import esp32
from iownhcTest import *
from iownhcConfig import *
from machine import Pin, SoftSPI
from sx127x import SX127x

node = 'remote_controller'
node_id = 0x00003F
wifi_config = {'ssid':'iown-homecontrol','password':'SoOpen',}
app_config = {'loop': 200,'sleep': 100,}

spi = SoftSPI(baudrate=10000000,polarity=0,phase=0,bits=8,firstbit=SoftSPI.MSB,sck=Pin(device_config['sck'],Pin.OUT, Pin.PULL_DOWN),mosi=Pin(device_config['mosi'],Pin.OUT,Pin.PULL_UP), miso=Pin(device_config['miso'],Pin.IN,Pin.PULL_UP))
iownSx127x = SX127x(spi,pins=device_config,parameters=iohc_parameters)

if __name__ == '__main__':
    iownhcTest.send(iownSx127x)
