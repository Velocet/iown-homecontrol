-- local BinaryUtils = depends("BinaryUtils")
-- local CommonUtils = depends("common", "utils")

local channel           = 1
local qrPayload         = "45 2A1F83 2ADDFC13C9976011B1C109FBF3952FA1 4E846341 FFFFFFFF"
local address           = 0x2A1F83                           -- qrPayload:sub(3,  8) -- 2A1F83
local productKey        = 0x2ADDFC13C9976011B1C109FBF3952FA1 -- qrPayload:sub(9, 40) -- 2ADDFC13C9976011B1C109FBF3952FA1
local channelAddress    = (address + channel - 1)
local controllerAddress = channelAddress

print("Address: ",address) -- 2A1F83
print("Product Key: ",productKey) -- 2ADDFC13C9976011B1C109FBF3952FA1
print("channelAddress: ",channelAddress) --
print("controllerAddress: ",controllerAddress) --


# List luajit Files
find -P . -type f -size +50c | while read -r file; do
    if [ $(xxd -l 3 -ps -u $file) = '1B4C4A' ]; then
      basename=$(basename $file)
      echo $file;
    fi
done

while read ljfile; do echo $ljfile >>ljerrors_module_output.txt;python ./main.py --file $ljfile --output "${ljfile}.luac" &>>ljerrors_module_output.txt
done <ljerrors_module.txt
while read ljfile; do echo $ljfile >>ljerrors_lua_output.txt;python ./main.py --file $ljfile --output "${ljfile}c" &>>ljerrors_lua_output.txt
done <ljerrors_lua.txt
while read ljfile; do echo $ljfile >>ljerrors_misc_output.txt;python ./main.py --file $ljfile --output "${ljfile}.luac" &>>ljerrors_misc_output.txt
done <ljerrors_misc.txt

$fileIn="/home/velocet/kizos/kizfs/kizbox2/apps/overkiz/io-homecontrol/bin/io-homecontrold";
python ./main.py --file $fileIn --output "${fileIn}_test.luac"

# Decompile luajit-Files
# NOTE: Input file needs to be one absolute file path per line!
import os
import fileinput
from ljd.tools import set_luajit_version, process_file

set_luajit_version(20)

file = './luafiles.txt'
for line in fileinput.input(file, mode='r', encoding="utf-8"):
    fileIn = os.path.abspath(line)
    fileOut = fileIn.replace(os.path.splitext(fileIn)[1],'.luac')
    print(fileOut)
    print(fileIn)

$> . ./iown-ljlist.sh >luafiles.txt 2>luafiles_errors.txt
$> python iown-ljd.py &>luajitfiles_errors.txt


alias vxd="xxd -u -l 512 -e -a -c 32"
alias vemu="sudo chroot . ./qemu"


alias vrelfarm="arm-linux-gnueabi-readelf --file-header --segments --sections --symbols --relocs --dynamic --version-info --arch-specific --histogram --section-groups --section-details --dyn-syms --lto-syms --no-recurse-limit --notes --unwind --decompress --use-dynamic --lint --wide --demangle $vin"
arm-linux-gnueabi-readelf --wide --demangle --no-recurse-limit --decompress --histogram --usedynamic --lint --arch-specific
arm-none-eabi-readelf --wide --demangle --no-recurse-limit --decompress


vemu usr/bin/luajit usr/share/luajit-2.0.5/jit/dis_arm.lua
vemu usr/bin/luajit -jdump=+irxaT-tbm,iohcd.dump ./apps/overkiz/lib/lua/Overkiz/io-homecontrold

python3 ./main.py --recursive ./<input directory> --dir_out ./<output directory> --catch_asserts
python3 ./main.py --file /home/velocet/connexoon/_372254595/rootB/apps/overkiz/lib/lua/Overkiz/io-homecontrold --output ./iohcdlua --catch_asserts
/home/velocet/connexoon/_372254595/rootB/apps/overkiz/lib/lua/Overkiz/io-homecontrold

usr/share/luajit-2.0.5/jit/dump.lua
apps/overkiz/io-homecontrol/bin/io-homecontrold
luajit -jdump=+tiraxT-bm,iohcd.dump
