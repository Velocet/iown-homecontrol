"""
Embedded Python Blocks:

Each time this file is saved, GRC will instantiate the first class it finds
to get ports and parameters of your block. The arguments to __init__  will
be the parameters. All of them are required to have default values!
"""

import numpy as np
from gnuradio import gr

def compute_crc_8408_byte(data, crc = 0):
    crc ^= data
    for i in range(8):
        remainder = 0x8408 if crc & 1 else 0
        crc = (crc >> 1) ^ remainder
    return crc

def compute_crc_8408(data, crc = 0):
    for b in data:
        crc = compute_crc_8408_byte(b, crc)
    return crc

class blk(gr.sync_block):  # other base classes are basic_block, decim_block, interp_block
    """IO-HomeControl Decoder 
       Decodes the already demodulated signal to ha hexadecimal message fro further processing
       """

    def __init__(self, samp_rate=1.0, channel=0, showhex=0, hexgroup=2, showbin=1, bingroup=1, msglen=38, msgoffset=0):  # only default arguments here
        """arguments to this function show up as parameters in GRC"""
        gr.sync_block.__init__(
            self,
            name='IO-HomeControl Decoder',   # will show up in GRC
            in_sig=[np.byte],
            out_sig=[]
        )
        # if an attribute with the same name as a parameter is found,
        # a callback is registered (properties work, too).
        self.samp_rate = samp_rate
        self.channel=channel
        self.showhex=showhex
        self.hexgroup=hexgroup
        self.showbin=showbin
        self.bingroup=bingroup
        self.msglen=msglen
        self.msgoffset=msgoffset
        # Internal Variables        
        self.last=0
        self.mode=0
        self.lasttrans=0        
        self.byts = [int(0)] * self.msglen
        self.bits = [int(0)] * self.msglen * 8
        self.nextbit=0
        self.nextsmp=0
        self.period=0
        self.tick=0
        self.unsync_bit_min=8
        self.unsync_bit_max=10
        self.sync_bit_min=7
        self.sync_bit_max=11
        self.sync_lost=13
        self.sync_min_cycles=200
        self.start_bit = False
        self.stop_bit = False
        self.total_bit = 0


    def work(self, input_items, output_items):
        """example: multiply with constant"""
        self.decodeChannel(input_items[0])
        # output_items[0][:] = input_items[0] * 0.1
        return len(input_items[0])


    def makeMessage(self,tick,bits,byts,crc):
        s = "io_home_control_data, ch=%i, tick=%i" %(self.channel,tick)
        if crc:
            s += ", crc=ok"
        else:
            s += ", crc=not_ok"
        
        if self.showhex != 0:
            s+=", hex= "
            if self.hexgroup <= 0:
                for i in range(len(byts)):
                    s+="%02X" %(byts[i])
            else:
                grpctr=self.hexgroup         
                for i in range(len(byts)):
                    s+="%02X" %(byts[i])
                    grpctr-=1
                    if grpctr <= 0:
                        grpctr=self.hexgroup
                        s+=" "
        if self.showbin != 0:
            s+=", bin= "
            if self.bingroup <= 0:
                for i in range(len(bits)):
                    s+="%i" %(bits[i])
            else:
                grpctr=self.bingroup         
                for i in range(len(bits)):
                    s+="%i" %(bits[i])
                    grpctr-=1
                    if grpctr <= 0:
                        grpctr=self.bingroup
                        s+=" "                
        return s
    
    def decodeChannel(self,data) :
        l=len(data)
        for smp in range(0,l):
            i=self.tick
            v=int(data[smp])            
            if self.mode == 0:
                # Unsynced
                if v == 0 and self.last == 1:
                    # high to low
                    delay=i-self.lasttrans
                    if delay >= 8 and delay <= 10:
                        # Valid period
                        self.syncstart = self.lasttrans
                        self.synccount = 1
                        self.mode = 1
                    self.lasttrans=i
            elif self.mode == 1:
                # Sync started
                if v == 0 and self.last == 1:
                    # high to low 
                    delay=i-self.lasttrans
                    if delay >= 7 and delay <= 11:
                        self.synccount+=1
                    else:
                        self.mode = 0
                    self.lasttrans = i
                else:
                    if i - self.lasttrans >= 13:
                        # lost sync
                        self.mode = 0
                        if self.synccount >= 200:
                            # success
                            self.mode = 2
                            self.nextbit = 0                        
                            self.period=(self.lasttrans-self.syncstart)/self.synccount
                            self.byts = [0] * self.msglen
                            self.bits = [0] * self.msglen * 8
                            self.start_bit = False
                            self.stop_bit = False
                            self.total_bit = 0
                            self.nextsmp=int(self.lasttrans-self.period/4+(self.total_bit+3+8+self.msgoffset)*self.period/2)
                            if self.nextsmp <= i:
                                # Error
                                print("Bad Offset - cannot go that far back")
                                self.mode=0
            elif self.mode == 2:
                if i == self.nextsmp:
                    if not self.start_bit:
                        self.start_bit = True
                    elif not self.stop_bit:
                        self.bits[self.nextbit] = v
                        self.byts[int(self.nextbit/8)] |= v << (self.nextbit%8)
                        self.nextbit+=1
                        if self.nextbit % 8 == 0:
                            self.stop_bit = True
                    else:
                        self.stop_bit = False
                        self.start_bit = False
                    
                    self.total_bit += 1
                    
                    self.nextsmp = int(self.lasttrans-self.period/4+(self.total_bit+3+8+self.msgoffset)*self.period/2)
                    if self.nextbit >= len(self.bits):
                        # done
                        self.mode = 0
                        if self.byts[0] == 0x33:
                        	length = self.byts[1] & 0x1f
                        	self.byts = self.byts[:2+length+2] # length of the preamble and length bytes, length of the payload, length of the trailer CRC
                        	crc = compute_crc_8408(bytes(self.byts[1:-2]))
                        	if crc == (self.byts[-1] << 8) + self.byts[-2]:
                        	    crc = True
                        	else:
                        	    crc = False
                        	ms = self.makeMessage(self.syncstart,self.bits,self.byts, crc)
                        	print(ms)
            
            self.last=v
            self.tick+=1            
       
