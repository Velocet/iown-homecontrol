@ECHO OFF
REM Calculate CRC-16 for Somfy Pakets captured via rtl_433:
REM rtl_433 -c 0 -d 0 -R 0 -g 37 -f 868.95M -s 1024k -X "name=iohomectrl,modulation=FSK_PCM,short=26,long=26,reset=300,gap=300,preamble={24}0x5555ff,decode_uart,unique" -M time:off
TITLE reveng:CRC-16/KERMIT
reveng.exe -m CRC-16/KERMIT -X -c "%*"
