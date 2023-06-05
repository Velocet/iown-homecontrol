# KizOS Reverse Engeneering

Here you will find information about KizOS, the Overkiz Linux Distribution based on Yocto with their own bootloader dubbed *kboot*.

[floss.overkiz.com](floss.overkiz.com) states the following:

  > In order to get full open source code in a digital format, you have to send a mail by regular post to: Overkiz,Allée de la mandallaz,74370 Epagny Metz-Tessy, France. As soon your demand is received, it will be proceded. In order to be able to answer to your request, the following elements are required:
  >
  > - Your product serial number, for providing matching GPL compliance with your firmware
  > - A valid postal address to ship the required sources and licence text.
  > - Shipping (for express mail, payment on delivery) and media will be charged, no profit will be made on this. Amount will be adjusted regarding the destination.
  >
  > Please note that altering the firmware of your product, will avoid your warranty, future updates and any support requests will be refused. Any breaking of general condition of use will drop your access to the service.

Guess i already "avoided" my warranty, my eligability to future updates or any support requests. Let's hope they at least answer with the source code...

Files with Firmware interaction:
animeoip/usr/bin/animeodiag
animeoip/usr/lib/libanimeo-1.so.1.0.1

libtoken: 897cca378530ef7caebe9612717f21b8 https://qmtp.modulotech.fr/

## Internal Files

bootFile_BOOTNEXT_FILE INTERNAL_BOOT_FILE

/ca/local-apps.crl
/ca/local-apps.crl.md5 INTERNAL_CRL_MD5_UPLOAD_URL

/var/volatile/lib/connman/auto.config!INTERNAL_CONNMAN_AUTO_CONFIG
/etc/security/app_ca.crt
/etc/security/client.key INTERNAL_BLUETOOTH_KEY_FILE
/etc/security/client.crt!INTERNAL_BLUETOOTH_CERT_FILE
/etc/security/wifivars!INTERNAL_WIFI_AP_CONFIG_FILE

/usr/share/zoneinfo INTERNAL_ZONEINFO_PATH
/sys/reset/reason INTERNAL_RESETREASON_FILE
/tmp/boot INTERNAL_BOOT_FILE
/etc/recovered INTERNAL_RECOVERED_FILE

/etc/recovered INTERNAL_RECOVERED_FILE
recoveryFile INTERNAL_RECOVERYID_FILE
/scriptsr INTERNAL_SCRIPTSDIRversion
revision_KIZOS_VERSION INTERNAL_KIZOS_REVISIONimageIdunknown
/dev/rtc./apps/overkiz/http-log/etc/properties.xml rtcDev

/etc/security/client.key setPrivateKey
/etc/security/ca.crt setCertificateOfAuthority
/etc/security/client.crt setClientCertificate

/persistent/boot/update/version-hash.txt INTERNAL_UPDATE_STATUS_PATH
/persistent/root/etc#INTERNAL_PERSISTENT_SYSCONFDIR
/persistent/root/etc/ssl/local-apps-crl.pem INTERNAL_CRL_FILE

v1BC7 p0022 d1670 dcEF dsc02 dp01 ic02 isc02 ip00 in02 INTERNAL_MODALIAS

INTERNAL_RECOVERED_FILE
INTERNAL_RECOVERYID_FILE
INTERNAL_SCRIPTSDIRversion

revision_KIZOS_VERSION INTERNAL_KIZOS_REVISION
updateStatusPath-
INTERNAL_MODALIAS

.INTERNAL_APPLOADER_CONFIGS_SEARCH_PATTERN
INTERNAL_APP_CA_FILE


INTERNAL_CRL_UPLOAD_URLcrlFile0
connmanAutoConfigFile*

## Network and Overkiz Cloud

### Ports

- 53 (DNS, UDP+TCP)
- 80 (HTTP, TCP)
- 443 (HTTPS, TCP)
- 123 (NTP, UDP)
- 18888 (TB, UDP)

### Other

case 'tahoma': case 'tahoma_switch': case 'connexoon': case 'somfy_europe': return new CloudApiClient('ha101-1.overkiz.com');
case 'connexoon_rts': case 'somfy_australia': return new CloudApiClient('ha201-1.overkiz.com');
case 'somfy_north_america': return new CloudApiClient('ha401-1.overkiz.com');
case 'flexom': return new CloudApiClient('ha108-1.overkiz.com');
case 'cozytouch': return new CloudJWTApiClient('ha110-1.overkiz.com','https://apis.groupe-atlantic.com/token','https://apis.groupe-atlantic.com/magellan/accounts/jwt','Q3RfMUpWeVRtSUxYOEllZkE3YVVOQmpGblpVYToyRWNORHpfZHkzNDJVSnFvMlo3cFNKTnZVdjBh',);
case 'rexel': return new CloudApiClient('ha112-1.overkiz.com');
case 'hi_kumo': return new CloudApiClient('ha117-1.overkiz.com');

## BPK/BPK2 files

- Unpack with `unblob` or `binwalk`
- locate `mkbpk` and go to the root of the extracted image
- copy qemu: `cp /usr/bin/qemu-arm-static ./qemu`
- run `chroot` in the image root folder and execute `mkbpk` via qemu:

- > ```SHELL
  > mkbpk -l ./$file.bpk2 # List partions to get $type
  > mkbpk -x ./$file.bpk2 $type:$device:$file.$type # Extract Template
  > ```

## random-seed

```LUA <!-- apps/overkiz/lua/etc/start.lua -->
-- Initialize random seed
id = string.gsub("1"..getBoxId(), '-', '')
math.randomseed(tonumber(id)-os.time())

-- Initialize random seed
local getBoxId = require "Overkiz.Kizbox.id"
local id = string.gsub("1"..getBoxId(), '-', '')
math.randomseed(tonumber(id)-os.time())
```

## Set Mode on STM32 via GPIOs

| MODE       | PA2 | PA3<br>Test RF | PA5<br>Boot 0 | PA6<br>Boot 1 |
| ---------: | :-: | :------------: | :-----------: | :-----------: |
| **test**   | 0   | 0              | 0             | 0             |
| **normal** | 0   | 1              | 0             | 0             |
| **update** | 0   | 1              | 0             | 1             |
| **flash**  | 0   | 1              | 1             | 0             |

### STM32 Apps

./ipsensorgw/firmwares/sdnp/stm32-update.sh
./minibox/apps/overkiz/idealrf/lib/Overkiz/HomeAutomation/Protocol/IdealRF/Updater/StmUpdater.lua

./minibox/usr/sbin/stm32-upgrader
./kizbox2/usr/sbin/stm32-upgrader

./minibox/usr/bin/stm32-helper
./kizbox2/usr/bin/stm32-helper
./minibox/usr/bin/stm32-helper-generic
./kizbox2/usr/bin/stm32-helper-generic

./kizbox2/usr/bin/stm32flash
./minibox/usr/bin/stm32flash
./ipiogw/usr/bin/stm32flash
./ipsensorgw/usr/bin/stm32flash

## Syskey De/Encrypt

Ateml SoCs implement a secure module which hosts a battery-backed SRAM that is sectioned into three different areas with different properties:
- 4KiB (0x1000) Auto-Erasable Secure RAM @ `0xF8044000`
- 1KiB (0x400) Non-Auto-Eraseable Secure RAM @ `0xF8045000`
- 32 Bytes (0x20) (Non-Secure) RAM @ `0xF8045400`

```SHELL
# Usage: securam <phys_addr> <Number of bytes>
unlock_syskey() { /usr/bin/securam 0xF8045000 32 }
get_syskey(){ hexdump -v -e '/1 "%02X"' /etc/security/system-key }

key=(unlock_syskey || get_syskey)
encrypt() { openssl enc -e -aes-256-cbc -iter 11111 -in "$src" -out "$dest" -k $(unlock_syskey || get_syskey) }
decrypt() { openssl enc -d -aes-256-cbc -iter 11111 -in "syskey.aes" -out "$syskey" -k $(unlock_syskey || get_syskey) }
```

- Command: `08 FC FF 7F 01 00 00 00` (found in securam binary)
  - LE: 0x7FFF FC08 (2147482632) 0x0000 0001
  - BE: 0x08FC FF7F ( 150798207) 0x0100 0000 (16777216)
- Address: `0xF8045000`
- Length: 32 Bytes

## Crypto so-Libs

- AES.so: Only supported Modes: **ECB, CFB**

## Boot

```SHELL
MOUNTOPTS     = ${    MOUNTOPTS:--o ro}
KERNELIMG     = ${    KERNELIMG:-/boot/zImage}
KERNELINITRD  = ${ KERNELINITRD:-/boot/initrd}
KERNELCMDLINE = ${KERNELCMDLINE:-/boot/cmdline}
SCRIPTVARS    = at91-kizboxmini-bootscript-vars

for img in zImage-initramfs-at91-kizboxmini.bin; do rsa_verify_crt $cert $mountdir/$img;

kernimg   = "/$img";
initrdimg = "/initrd-at91-kizboxmini";
cmdline   = "/cmdline-at91-kizboxmini";
kerneldtb = ${KERNELDTB:-/boot/dtb}
kexec --load "$kernimg" ${initrdimg:+--initrd "$initrdimg"} ${cmdline:+--command-line "$(cat $cmdline)"} ${dtb:+--dtb "$dtb"} "$KEXECOPTS"
```

### Random Stuff

#### Certificates

> - Version: 3 (0x2)
> - Serial Number: 491681 (0x0780A1)
> - Subject: O=Overkiz, OU=Gateway Device, CN=0815-2380-2650
> - *ethmac*: `F8:81:1A:52:F8:61`

<!--PLAYGROUND-
0x12 FB32 821A (0815-2380-2650) PIN
0x52 F861      (     5437537) MAC
0x 7 80A1      (      491681) SERIAL
0x      2      (           3) VERSION
-PLAYGROUND-->

#### Disable Flash Read-Protection

stm32flash -b 115200 -k $TARGET_TTY

### Known USB Vendor/Product IDs

> Used for testing, external products like the ZWave or Zigbee sticks, etc.

| VID    | PID    | Device        | Note                                                  |
| -----: | :----- | :------------ | :---------------------------------------------------- |
| 0x2D71 | -      |               | Overkiz Vendor ID                                     |
| 0x2D71 | 0x0000 |               | Bootloader                                            |
| 0x2D71 | 0x0001 |               | Test/Factory                                          |
| 0x2D71 | 0x0002 |               | Test/Factory                                          |
| 0x2D71 | 0x0600 | MBCF          | Z-Wave                                                |
| 0x2D71 | 0x0601 | MBCF          | Enocean                                               |
| 0x2D71 | 0x0700 | MBRD          | Z-Wave                                                |
| 0x2D71 | 0x0701 | MBRD          | Enocean                                               |
| 0x2D71 | 0x0702 | MBRD          | RTx/RTS                                               |
| 0x2D71 | 0x0703 | MBRD          | io-homecontrol                                        |
| 0x2D71 | 0x0704 | ???           | ???                                                   |
| 0x2D71 | 0x0705 | SiLabs EFR32  | ZigBee / OVK Stick                                    |
| 0x2D71 | 0x0706 | MBRD          | GSM                                                   |
| 0x2D71 | 0x0801 | SiLabs EFR32  | OVK Dongle                                            |
| 0x10C4 |        |               | SiLabs Vendor ID                                      |
| 0x10C4 | 0x8293 | SiLabs EM357  |                                                       |
| 0x10C4 | 0x8A5E | SiLabs EM3588 |                                                       |
| 0x22B3 |        |               | Somfy USB to Serial (usbser) Virtual Com Driver (VCD) |
| 0x22B3 | 0x0000 | Skitter io    | Skitter io Bootloader                                            |
| 0x22B3 | 0x0001 | Set&Go io     | Set&Go io Firmware Loader (SFU)                           |
| 0x22B3 | 0x0032 | Skitter io    | Skitter io Device                                  |
| 0x22B3 | 0x0033 | Set&Go io     | Set&Go io Device                                |

> [[PATCH 06/20] USB: serial: ftdi: Add "Overkiz" FTDI devices VID/PID](https://floss.overkiz.com/build/2022.6/at91-kizbox2/linux-overkiz-5.4.208-r4/0006-USB-serial-ftdi-Add-Overkiz-FTDI-devices-VID-PID.patch)
