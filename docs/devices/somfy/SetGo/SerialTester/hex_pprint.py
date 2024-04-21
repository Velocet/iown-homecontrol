from pprint import PrettyPrinter
from termcolor import colored, cprint
import re


color_maps = []

# single 55
color_maps.append( (re.compile(r'(^55$)'), 'green', 'ACK') )
# opening sequence
color_maps.append( (re.compile(r'^(c0 00 \d\d 01 00 00)'), 'green', 'BEG_FRAME') )
# closing sequence
color_maps.append( (re.compile(r'(c0$)'), 'green', 'END_FRAME') )

# pattern A, starting every incoming frame
color_maps.append( (re.compile(r'(6f f8 7f 48 07 50 f7 a0 e7 8e bd 26 75 be 4d)'), 'red', 'IN_HDR' ) )
# pattern B, trailing most incoming frames
color_maps.append( (re.compile(r'(91 58 77 47 35 04 7a 43 1d 46 f3)'), 'yellow', 'IN_TRAIL') )

# 5 byters
color_maps.append( (re.compile(r'(ef f8 5b 4b 15)'), 'blue', 'ACK_LISTEN_MODE') )



class HexPrettyPrinter(PrettyPrinter):

    # def __init__(self, format_maps):
    #     super(type(self), self).__init__()
    #     self.format_maps = color_maps

    def format(self, object, context, maxlevels, level):
        repr, readable, recursive = PrettyPrinter.format(self, object, context, maxlevels, level)
        if isinstance(object, bytearray):
            #return "{0:x}".format(bytearray(object)), readable, recursive
            objstring = ' '.join(format(x, '02x') for x in object)
            return self.colorize(objstring), readable, recursive
        else:
            return repr, readable, recursive

    def colorize(self, str):
        """ Colorize a string (with ANSI) based on certain patterns """
        for m in color_maps:
            pattern = m[0]
            color = m[1]
            if len(m)>2:
                replacement_text = colored(m[2], color)
            else:
                replacement_text = colored(r'\1', color)
            str = pattern.sub(replacement_text, str)
        return str