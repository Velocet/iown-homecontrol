import esp32
import gc, time, struct
from machine import SPI, SoftSPI, Pin



class SX1276_ioHomecontrol:

    def __init__(self, RST_Pin, CS_Pin, SPI_CH, SCK_Pin, MOSI_Pin, MISO_Pin, DIO0_Pin, DIO1_Pin, DIO2_Pin, plus20dBm=False):
  # def __init__(self,spi,device_config,parameters):
        self._spi = spi
        self._pins = device_config
        self._parameters = parameters
        self._pin_dclk = Pin(self._pins["dio_1"], Pin.OUT)

        # 1. Reset Module
        rst_pin = Pin(RST_Pin, Pin.OUT)
        rst_pin.off()
        time.sleep(0.01)
        rst_pin.on()
        time.sleep(0.01)
        # 2. SPI
        '''
        Disable SPI communication first to ensure it only happends when we need.
        Define communication functions read and write. 
        SPI comm is enabled only temporarily for reading and writing and disabled thereafter.
        '''
        self.cs_pin = Pin(CS_Pin, Pin.OUT) # Disable SPI communication
        self.cs_pin.on()                   # Release board from SPI Bus by bringing it into high impedance status.
        # SPI communication = SPI mode 0 (polarity & phase = 0) up to a max of 10MHz.
        self.spi = SPI(SPI_CH, baudrate=10_000_000, polarity=0, phase=0, sck=Pin(SCK_Pin), mosi=Pin(MOSI_Pin), miso=Pin(MISO_Pin))

        # Choose FSK and Test write/read functions
        FskMode = 0b0
        RegOpMode = 0x01
        self.write(RegOpMode, self.Mode['STANDBY'] | FskMode << 7) # Choose FSK mode for SX1276 and put the module in sleep mode
        assert self.read(RegOpMode) == (self.Mode['STANDBY'] | FskMode << 7), "FSK initialization failed" # Test read function

    def config():
        self.write(0x00,0x00) # Fifo
        self.write(0x01,0x03) # OpMode
        self.write(0x02,0x03) # BitrateMsb
        self.write(0x03,0x41) # BitrateLsb
        self.write(0x04,0x01) # FdevMsb
        self.write(0x05,0x3B) # FdevLsb
        self.write(0x06,0xD9) # FrfMsb
        self.write(0x07,0x3C) # FrfMid
        self.write(0x08,0xCD) # FrfLsb
        self.write(0x09,0xFF) # PaConfig
        self.write(0x0A,0x12) # PaRamp
        self.write(0x0B,0x2B) # Ocp
        self.write(0x0C,0x20) # Lna
        self.write(0x0D,0x98) # RxConfig
        self.write(0x0E,0x02) # RssiConfig
        self.write(0x0F,0x0A) # RssiCollision
        self.write(0x10,0xFF) # RssiThresh
        self.write(0x11,0x00) # RssiValue
        self.write(0x12,0x15) # RxBw
        self.write(0x13,0x0B) # AfcBw
        self.write(0x14,0x28) # OokPeak
        self.write(0x15,0x0C) # OokFix
        self.write(0x16,0x12) # OokAvg
        self.write(0x17,0x47) # Res17
        self.write(0x18,0x32) # Res18
        self.write(0x19,0x3E) # Res19
        self.write(0x1A,0x01) # AfcFei
        self.write(0x1B,0x00) # AfcMsb
        self.write(0x1C,0x00) # AfcLsb
        self.write(0x1D,0x00) # FeiMsb
        self.write(0x1E,0x00) # FeiLsb
        self.write(0x1F,0x40) # PreambleDetect
        self.write(0x20,0x00) # RxTimeout1
        self.write(0x21,0x00) # RxTimeout2
        self.write(0x22,0x00) # RxTimeout3
        self.write(0x23,0x00) # RxDelay
        self.write(0x24,0x07) # Osc
        self.write(0x25,0x00) # PreambleMsb
        self.write(0x26,0x02) # PreambleLsb
        self.write(0x27,0x0B) # SyncConfig
        self.write(0x28,0x55) # SyncValue1
        self.write(0x29,0x55) # SyncValue2
        self.write(0x2A,0x55) # SyncValue3
        self.write(0x2B,0x55) # SyncValue4
        self.write(0x2C,0x55) # SyncValue5
        self.write(0x2D,0x55) # SyncValue6
        self.write(0x2E,0x55) # SyncValue7
        self.write(0x2F,0x55) # SyncValue8
        self.write(0x30,0x08) # PacketConfig1
        self.write(0x31,0x00) # PacketConfig2
        self.write(0x32,0x00) # PayloadLength
        self.write(0x33,0x00) # NodeAdrs
        self.write(0x34,0x00) # BroadcastAdrs
        self.write(0x35,0x8F) # FifoThresh
        self.write(0x36,0x14) # SeqConfig1
        self.write(0x37,0x4A) # SeqConfig2
        self.write(0x38,0x00) # TimerResol
        self.write(0x39,0xF5) # Timer1Coef
        self.write(0x3A,0x20) # Timer2Coef
        self.write(0x3B,0x83) # ImageCal
        self.write(0x3C,0x00) # Temp
        self.write(0x3D,0x02) # LowBat
        self.write(0x3E,0x80) # IrqFlags1
        self.write(0x3F,0x40) # IrqFlags2
        self.write(0x40,0xC0) # DioMapping1
        self.write(0x41,0xA0) # DioMapping2
        self.write(0x42,0x11) # Version
        self.write(0x43,0x00) # Test43
        self.write(0x44,0x2D) # PllHop
        self.write(0x4B,0x09) # Tcxo
        self.write(0x4D,0x84) # PaDac
        self.write(0x5B,0x00) # FormerTemp
        self.write(0x5C,0x00) # Test5C
        self.write(0x5D,0x00) # BitrateFrac
        self.write(0x61,0x19) # AgcRef
        self.write(0x62,0x0C) # AgcThresh1
        self.write(0x63,0x4B) # AgcThresh2
        self.write(0x64,0xCC) # AgcThresh3
        self.write(0x70,0x50) # Pll

    def version(): # Check hardware version
        init_try = True
        re_try = 0
        while init_try and re_try < 5:
            version = self.read_register(REG_VERSION)
            re_try = re_try + 1
            if version != 0:
                init_try = False
        if version != 0x12:
            raise Exception('Invalid version.')
        print("SX version: {}".format(version))

    def write(self, reg, data):
        wb = bytes([self.RegTable[reg] | 0x80]) # Create a writing byte
        if isinstance(data, int): data = wb + bytes([data])
        elif isinstance(data, str): data = wb + bytes(data, 'utf-8')
        else: raise
        self.cs_pin.value(0) # Bring CS pin low to enable communication
        self.spi.write(data)
        self.cs_pin.value(1) # Release SPI bus.

    def read(self, reg=None, length=1):
        self.cs_pin.value(0) # https://docs.micropython.org/en/latest/library/machine.SPI.html#machine-softspi
        if length == 1: data = self.spi.read(length+1, self.RegTable[reg])[1]
        else:           data = self.spi.read(length+1, self.RegTable[reg])[1:]
        self.cs_pin.value(1)
        return data

    def send(self, data):
        self.write('RegFifoAddrPtr', self.Fifo_Bottom)
        self.write('RegFifo', data)              # Write Data FIFO
        self.write('RegPayloadLength', len(data))
        self.write('RegOpMode', self.Mode['TX']) # Request Standby so SX1276 sends payload


if __name__ == "__main__":

    iown.write('RegDioMapping1', iown.DioMapping['Dio0']['TxDone'])
    while 1:
        payload = bytes(0x55)
        # print(payload)
        iown.send(payload)
        time.sleep(5)
