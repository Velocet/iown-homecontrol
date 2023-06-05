import time, struct
from machine import Pin, SPI   

class LoRa:
    def __init__(self, RST_Pin, CS_Pin, SPI_CH, SCK_Pin, MOSI_Pin, MISO_Pin, DIO0_Pin, plus20dBm=False):
        ####################
        #                  #
        #     1.Reset      # 
        #                  #
        ####################   
        # Reset LoRa Module
        rst_pin = Pin(RST_Pin, Pin.OUT)
        rst_pin.off()
        time.sleep(0.01)
        rst_pin.on()
        time.sleep(0.01) 
        ####################
        #                  #
        #      2.SPI       #
        #                  #
        ####################
        '''
        We command LoRa module to perform Tx/Rx operations via the SPI interface.
        We disable SPI communication first to ensure it only happends when we need.
        Define communication functions read and write.
        The SPI comm is enabled temporarily for reading and writing and disabled thereafter.
        '''
        # Disable SPI communication with the LoRa module
        self.cs_pin = Pin(CS_Pin, Pin.OUT)
        self.cs_pin.on() # Release board from SPI Bus by bringing it into high impedance status. 
        
        # SPI communication
        # See datasheet: Device support SPI mode 0 (polarity & phase = 0) up to a max of 10MHz.
        self.spi = SPI(SPI_CH, baudrate=10_000_000, polarity=0, phase=0,
                       sck=Pin(SCK_Pin), mosi=Pin(MOSI_Pin), miso=Pin(MISO_Pin)
                      ) 
        ####################
        #                  #
        #      3.Lora      #
        #                  #
        ####################
        self.RegTable = {  # register table
            'RegFifo'              : 0x00 ,
            'RegOpMode'            : 0x01 , # operation mode
            'RegFrfMsb'            : 0x06 ,
            'RegFrfMid'            : 0x07 ,
            'RegFrfLsb'            : 0x08 ,
            'RegPaConfig'          : 0x09 ,
            'RegFifoTxBaseAddr'    : 0x0e ,
            'RegFifoRxBaseAddr'    : 0x0f ,
            'RegFifoAddrPtr'       : 0x0d ,
            'RegFifoRxCurrentAddr' : 0x10 ,
            'RegIrqFlags'          : 0x12 ,  
            'RegRxNbBytes'         : 0x13 , # Number of received bytes 
            'RegPktSnrValue'       : 0x19 ,
            'RegPktRssiValue'      : 0x1a ,
            'RegRssiValue'         : 0x1b ,
            'RegModemConfig1'      : 0x1d , 
            'RegModemConfig2'      : 0x1e , 
            'RegPreambleMsb'       : 0x20 , 
            'RegPreambleLsb'       : 0x21 ,
            'RegPayloadLength'     : 0x22 ,
            'RegModemConfig3'      : 0x26 , 
            'RegDioMapping1'       : 0x40 , 
            'RegVersion'           : 0x42 , 
            'RegPaDac'             : 0x4d  
        }
        
        self.Mode = { # see Table 16 LoRa ® Operating Mode Functionality 
            'SLEEP'        : 0b000,
            'STANDBY'      : 0b001,
            'TX'           : 0b011,
            'RXCONTINUOUS' : 0b101, 
            'RXSINGLE'     : 0b110,  
            'CAD'          : 0b111, 
        }  

        # Choose LoRa mode and Test write/read functions
        LongRangeMode = 0b1
        # Choose LoRa (instead of FSK) mode for SX1276 and put the module in sleep mode
        self.write('RegOpMode', self.Mode['SLEEP'] | LongRangeMode << 7) 
        # Test read function 
        assert self.read('RegOpMode') == (self.Mode['SLEEP'] | LongRangeMode << 7), "LoRa initialization failed"
         
        # Set modem config: bandwidth, coding rate, header mode, spreading factor, CRC, and etc.  
        # See 4.4. LoRa Mode Register Map 
        Bw                   = {'125KHz':0b0111, '500kHz':0b1001}
        CodingRate           = {5:0b001, 6:0b010, 7:0b011, 8:0b100}
        ImplicitHeaderModeOn = {'Implicit':0b1, 'Explicit':0b0}
        self.write('RegModemConfig1', Bw['125KHz'] << 4 | CodingRate[8] << 1 | ImplicitHeaderModeOn['Explicit'])
        SpreadingFactor  = {7:0x7, 9:0x9, 12:0xC}
        TxContinuousMode = {'normal':0b0, 'continuous':0b1}
        RxPayloadCrcOn   = {'disable':0b0, 'enable':0b1}
        self.write('RegModemConfig2', SpreadingFactor[12] << 4 | TxContinuousMode['normal'] << 3 | RxPayloadCrcOn['enable'] << 2 | 0x00) 
        LowDataRateOptimize = {'Disabled':0b0, 'Enabled':0b1}
        AgcAutoOn = {'register LnaGain':0b0, 'internal AGC loop':0b1}
        self.write('RegModemConfig3', LowDataRateOptimize['Enabled'] << 3 | AgcAutoOn['internal AGC loop'] << 2)  
        
        # Preamble length
        self.write('RegPreambleMsb', 0x0) # Preamble can be (2^15)kb long, much longer than payload
        self.write('RegPreambleLsb', 0x8) # but we just use 8-byte preamble
        
        # See 4.1.4. Frequency Settings
        FXOSC = 32e6 # Freq of XOSC
        FSTEP = FXOSC / (2**19)
        Frf = int(915e6 / FSTEP)
        self.write('RegFrfMsb', (Frf >> 16) & 0xff)
        self.write('RegFrfMid', (Frf >>  8) & 0xff)
        self.write('RegFrfLsb',  Frf        & 0xff)
        
        # Output Power
        '''
        If desired output power is within -4 ~ +15dBm, use PA_LF or PA_HF as amplifier. 
        Use PA_BOOST as amplifier to output +2 ~ +17dBm continuous power or up to 20dBm 
          peak power in a duty cycled operation.
        Here we will always use PA_BOOST. 
        Since we use PA_BOOST, Pout = 2 + OutputPower and MaxPower could be any number (Why not 0b111/0x7?)
        '''
        PaSelect    = {'PA_BOOST':0b1, 'RFO':0b0} # Choose PA_BOOST (instead of RFO) as the power amplifier
        MaxPower    = {'15dBm':0x7, '13dBm':0x2}  # Pmax = 10.8 + 0.6 * 7  
        OutputPower = {'17dBm':0xf, '2dBm':0x0}  
        self.write('RegPaConfig', PaSelect['PA_BOOST'] << 7 | MaxPower['15dBm'] << 4 | OutputPower['2dBm'])
        
        # Enables the +20dBm option on PA_BOOST pin.  
        if plus20dBm: # PA (Power Amplifier) DAC (Digital Analog Converter)
            PaDac = {'default':0x04, 'enable_PA_BOOST':0x07} # Can be 0x04 or 0x07. 0x07 will enables the +20dBm option on PA_BOOST pin
            self.write('RegPaDac', PaDac['enable_PA_BOOST'])  
        
        # FIFO data buffer 
        '''
        SX1276 has a 256 byte memory area as the FIFO buffer for Tx/Rx operations.
        How do we know which area is for Tx and which is for Rx.
        We must set the base addresses RegFifoTxBaseAddr and RegFifoRxBaseAddr independently.
        Since SX1276 work in a half-duplex manner, we better set both base addresses
        at the bottom (0x00) of the FIFO buffer so that we can buffer 256 byte data
        during transmition or reception.
        ''' 
        self.Fifo_Bottom = 0x00 # We choose this value to max buffer we can write (then send out)
        self.write('RegFifoTxBaseAddr', self.Fifo_Bottom)
        self.write('RegFifoRxBaseAddr', self.Fifo_Bottom)
        
        ####################
        #                  #
        #    4.Interrupt   #
        #                  #
        ####################
        '''
        # This section is optional for Tx.
        # It enable an interrupt when Tx is done.
        '''
        self.DioMapping = {
            'Dio0' : {
                         'RxDone'           : 0b00 << 6,
                         'TxDone'           : 0b01 << 6,
                         'CadDone'          : 0b10 << 6
                     },
            'Dio1' : {
                         'RxTimeout'        : 0b00 << 4,
                         'FhssChangeChannel': 0b01 << 4,
                         'CadDetected'      : 0b10 << 4
                     },
            'Dio2' : {},
            'Dio3' : {},
            'Dio4' : {},
            'Dio5' : {},
        } 
         
        self.IrqFlags = {
            'RxTimeout'        : 0b1 << 7,
            'RxDone'           : 0b1 << 6,
            'PayloadCrcError'  : 0b1 << 5,
            'ValidHeader'      : 0b1 << 4,
            'TxDone'           : 0b1 << 3,
            'CadDone'          : 0b1 << 2,
            'FhssChangeChannel': 0b1 << 1,
            'CadDetected'      : 0b1 << 0, 
        }
        
        dio0_pin = Pin(DIO0_Pin, Pin.IN)
        dio0_pin.irq(handler=self._irq_handler, trigger=Pin.IRQ_RISING)
        
        ''' # interrupt flag mask: use to deactive a particular interrupt
        RegIrqFlagsMask = 0x11;
        IrqFlagsMask = {
            'RxTimeoutMask'        : 0b1 << 7,
            'RxDoneMask'           : 0b1 << 6,
            'PayloadCrcErrorMask'  : 0b1 << 5,
            'ValidHeaderMask'      : 0b1 << 4,
            'TxDoneMask'           : 0b1 << 3,
            'CadDoneMask'          : 0b1 << 2,
            'FhssChangeChannelMask': 0b1 << 1,
            'CadDetectedMask'      : 0b1 << 0
        }
        write(RegIrqFlagsMask, IrqFlagsMask['TxDoneMask'])  #  This will deactivate interrupt on TxDone.
        ''' 
        self.write('RegOpMode', self.Mode['STANDBY'])      # Request Standby mode so SX1276 performs reception initialization. 
    
    def write(self, reg, data): 
        wb = bytes([self.RegTable[reg] | 0x80]) # Create a writing byte
        if isinstance(data, int):
            data = wb + bytes([data]) 
        elif isinstance(data, str):
            data = wb + bytes(data, 'utf-8')
        else:
            raise
        self.cs_pin.value(0) # Bring the CS pin low to enable communication 
        self.spi.write(data)
        self.cs_pin.value(1) # release the bus. 

    def read(self, reg=None, length=1):
        self.cs_pin.value(0)
        # https://docs.micropython.org/en/latest/library/machine.SPI.html#machine-softspi
        if length == 1:
            data = self.spi.read(length+1, self.RegTable[reg])[1]
        else:
            data = self.spi.read(length+1, self.RegTable[reg])[1:]
        self.cs_pin.value(1)
        return data
    
    def _irq_handler(self, pin): 
        irq_flags = self.read('RegIrqFlags') 
        self.write('RegIrqFlags', 0xff) # write anything could clear all types of interrupt flags  
        if irq_flags & self.IrqFlags['RxDone']:
            if irq_flags & self.IrqFlags['PayloadCrcError']: 
                print('PayloadCrcError')
            else:
                self.write('RegFifoAddrPtr', self.read('RegFifoRxCurrentAddr')) 
                packet     = self.read('RegFifo', self.read('RegRxNbBytes')) 
                PacketSnr  = self.read('RegPktSnrValue')
                SNR        = struct.unpack_from('b', bytes([PacketSnr]))[0] / 4
                PacketRssi = self.read('RegPktRssiValue') 
                #Rssi = read(RegRssiValue) 
                if SNR < 0:
                    RSSI = -157 + PacketRssi + SNR
                else:
                    RSSI = -157 + 16 / 15 * PacketRssi 
                RSSI = round(RSSI, 2) # Table 7 Frequency Synthesizer Specification 
                self.packet_handler(self, packet, SNR, RSSI)   

        elif irq_flags & self.IrqFlags['TxDone']: 
            self.after_TxDone(self)
        else: 
            for i, j in self.IrqFlags.items():
                if irq_flags & j:
                    print(i) 
                    
    def RxCont(self):    
        self.write('RegDioMapping1', self.DioMapping['Dio0']['RxDone'])  
        self.write('RegOpMode', self.Mode['RXCONTINUOUS']) # Request Standby mode so SX1276 send out payload   
        
    def Tx(self): 
        self.write('RegDioMapping1', self.DioMapping['Dio0']['TxDone'])   
    
    def send(self, data): 
        self.write('RegFifoAddrPtr', self.Fifo_Bottom) 
        self.write('RegFifo', data)            # Write Data FIFO 
        self.write('RegPayloadLength', len(data)) 
        self.write('RegOpMode', self.Mode['TX'])          # Request Standby mode so SX1276 send out payload  
 
    def packet_handler(self, packet, SNR, RSSI):
        pass
    
    def after_TxDone(self):
        pass  

if __name__ == "__main__":
    # RFM95W         Pico GPIO old
    LoRa_MISO_Pin  = 16
    LoRa_CS_Pin    = 17
    LoRa_SCK_Pin   = 18
    LoRa_MOSI_Pin  = 19
    LoRa_G0_Pin    = 20 # DIO0_Pin
    LoRa_EN_Pin    = 21
    LoRa_RST_Pin   = 22
    SPI_CH         =  0  
    Pin(LoRa_EN_Pin, Pin.OUT).on()
    lora = LoRa(LoRa_RST_Pin, LoRa_CS_Pin, SPI_CH, LoRa_SCK_Pin, LoRa_MOSI_Pin, LoRa_MISO_Pin, LoRa_G0_Pin)

    lora.write('RegDioMapping1', lora.DioMapping['Dio0']['TxDone'])     
    lora.after_TxDone = lambda self: print('TxDone')
    import urandom
    while 1:
        payload = str(urandom.randint(100,999))+")abc Hello~"
        print(payload)   
        lora.send(payload)
        time.sleep(5) 