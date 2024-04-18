import warnings
warnings.warn("This script assumes that you decompiled AND CLEANED the luajit daemon prior to running it.")

import codecs
f = open(IoHomecontrold.lua,'r',encoding="utf-8")
for readline in f.readlines():               # read the file line by line
    file,line   = readline.split(' = ')      # split line to get filename and content
    file        = file+'.lua'                # add .lua to our new filename ;)
    data, *crap = codecs.escape_decode(line) # unescape content (always comes as tuple?)
    data        = data[:-1]
    out         = open(file,"bx",buffering=0)
    out.write(data)
    out.close()


f.close()

print("Use this powershell snippet afterwards to decompile the extracted luajit files:")
print("gci -File -Filter "*.lua" | % { sleep -Milliseconds 250; .\luajit-decompiler.exe $_.FullName -s }")
