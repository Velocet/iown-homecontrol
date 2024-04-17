#!/usr/bin/env python

import usb.core
import usb.util
import sys

def main():
    m = IoMouse()

    # the windows app seems to do the following repeatedly
    # when waiting to receive the key from another remote
    data  = m.get_line_coding()
    print "Read line coding: " + hex_array(data)
    print "Setting control line state"
    m.set_control_line_state()
    print "Setting line coding"
    m.set_line_coding()


class IoMouse:

	def __init__(self):
		# find the USB device
	    self._dev = usb.core.find(idVendor=0x22b3, idProduct=0x0033)
	    if self._dev is None:
        	raise "device not found"

        # free the control interface and claim it
	    interface = 0
	    if self._dev.is_kernel_driver_active(interface):
	        print "we need to detach kernel driver"
	        self._dev.detach_kernel_driver(interface)
	        print "claiming device"
	        usb.util.claim_interface(self._dev, interface)

	    # configure the device
	    self._dev.set_configuration()

	    # get the configuration
	    cfg = self._dev.get_active_configuration() 
	    # AFAIK interface 0 with EP3_IN is not used normally (maybe for firmware update?)
	    # inteface 1 has the CDC-data endpoints
	    data_intf = cfg[(1,0)]
	    self._ep1_out = data_intf[0]
	    self._ep2_in = data_intf[1]


	# CDC CLASS Requests
	# from http://sandiaproject.googlecode.com/svn/trunk/UofU_GPSReceiver/Main/USBCDC/USB_Common/usb.h
	#define USB_CDC_GET_LINE_CODING         0x21
	#define USB_CDC_SET_LINE_CODING         0x20
	#define USB_CDC_SET_CONTROL_LINE_STATE  0x22
	# also useful: http://www.silabs.com/Support%20Documents/TechnicalDocs/AN758.pdf
	# and maybe http://www.usb.org/developers/docs/devclass_docs/CDC1.2_WMC1.1_012011.zip


	def get_line_coding(self):
	    #EP0: Read Class 0x21, 7 bytes
	    return self._dev.ctrl_transfer(0xa1, 0x21, 0x0, 0, 7)

	def set_line_coding(self):
		# set line to 115200 bauds, 8N1
	    # http://www.silabs.com/Support%20Documents/TechnicalDocs/AN758.pdf
	    data = [ 0x00, 0xC2, 0x01, 0, 0, 0, 0x08]
	    return self._dev.ctrl_transfer(0x21, 0x20, 0x0, 0, data)

	def set_control_line_state(self):
	    # wValue is 0 so it means:
	    # - deactivate carrier
	    # - DTE is not present
	    return self._dev.ctrl_transfer(0x21, 0x22, 0x0, 0, [])

	def data_out(self, data):
		# to do
		pass





def hex_array(array_alpha):
    """ Return an array of decimal bytes as an array of hexadecimal bytes"""
    return ' '.join(format(x, '02x') for x in array_alpha)

def fuzz():
    # Lets start by Reading 1 byte from the Device using different Requests
    # bRequest is a byte so there are 255 different values
    print "Starting to fuzz"
    for bRequest in range(255):
        try:
            ret = dev.ctrl_transfer(0xC0, bRequest, 0, 0, 1)
            print "bRequest ",bRequest
            print ret
        except:
            # failed to get data for this request
            pass


if __name__ == '__main__':
    main()


# Other doc
#  ser = serial.Serial('/dev/ttyACM0', 115200, timeout=1)