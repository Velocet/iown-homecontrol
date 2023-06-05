#!/usr/bin/env python

#
# find-data.py
#
# A small script to bruteforce embedded compressed data that might not have a header
# Useful for raw binary firmware images that do not contain a standard
# binary header (ELF, PE, MACH-O).
#
# I included a limt on size at 16KB because this has a tendency to create
# lots of small files, which are generally false positives.
# 
# I usually run this over every firmware image I need to analyze.
#
# Usage: python find-data.py "filename.bin"
#

import zlib
import sys
import lzma
import bz2
import zipfile

LIMIT = 1024 * 16

with open(sys.argv[1], 'r') as compressed_data:
    compressed_data = compressed_data.read()
    for i in range(len(compressed_data)):
        try:
            unzipped = zlib.decompress(compressed_data[i:], -zlib.MAX_WBITS)
            if len(unzipped) > LIMIT:
                print ('GZIP: Offset found', i)
                with open('./result-gz-' + str(i) + '.bin', 'w') as result:
                    result.write(unzipped);
                    result.close()
        except Exception as ex:
            pass

        try: 
            unzipped = lzma.decompress(compressed_data[i:])
            if len(unzipped) > LIMIT:
                print ('LZMA: Offset Found', i)
                with open('./result-lzma-' + str(i) + '.bin', 'w') as result:
                    result.write(unzipped);
                    result.close()
        except Exception as ex:
            pass
        try: 
            unzipped = bz2.decompress(compressed_data[i:])
            if len(unzipped) > LIMIT:
                print ('BZ2: Offset Found', i)
                with open('./result-bz2-' + str(i) + '.bin', 'w') as result:
                    result.write(unzipped);
                    result.close()
        except Exception as ex:
            pass
