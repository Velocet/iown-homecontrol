from machine import Pin, SoftI2C
from ssd1306 import SSD1306_I2C
from time import sleep

oledSDA = Pin(15, Pin.OUT, Pin.PULL_UP)
oledSCL = Pin(4, Pin.OUT, Pin.PULL_UP)
oledRST = Pin(16, Pin.OUT)
oledRST.value(1)
i2c = SoftI2C(oledSDA, oledSCL)
oled = SSD1306_I2C(128, 64, i2c)

def receive(lora):
    print("LoRa Receiver")
    oled.fill(0)
    oled.text("LoRa Receiver", 10, 10)
    oled.show()

    while True:
        if lora.received_packet():
            lora.blink_led()
            payload = lora.read_payload()
            print(payload)
            oled.fill(0)
            oled.text(payload, 10, 10)
            oled.show()
            
