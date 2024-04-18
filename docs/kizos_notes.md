
Kizbox Mini (Minibox) Motherboard bootloader args: `=ubi.mtd=ubi loglevel=2 console=ttyS0,115200`
kboot.ubifs:
- bootloader
- kernel (compressed) kboot.kernel_fdt.zImage
  - initramfs.gz >UNPACK> initramfs.cpio
- Flattened Device Tree (.DTB: Can be converted to .DTS file)

$ binwalk kboot.ubifs

HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0x0             Linux kernel ARM boot executable zImage (little-endian)
0x4008          gzip compressed data, maximum compression, from Unix, last modified: 1970-01-01 00:00:00 (null date)
0x4A4848        Flattened device tree, size: 25197 bytes, version: 17

---
COREDUMP_URL=https://coredump.overkiz.com:449/coredump
OVKSECURITYDIR=/etc/security
OVK_LOG_LVL=3
MACHINE=at91-kizboxmini
PERSISTENTDIR=/persistent
PERSISTENTDIR_APPS=/persistent/apps
PERSISTENTDIR_BOOT=/persistent/boot
PERSISTENTDIR_ROOT=/persistent/root
UPDATE_URL=https://ha-upgrade.overkiz.com
IMAGESURL=${UPDATE_URL}/images/at91-kizboxmini # https://ha-upgrade.overkiz.com/images/at91-kizboxmini
SECURITY_URI="$PODURL/security.squashfs"       # https://ha-upgrade.overkiz.com/security.squashfs
BOOTLOADERURL=${UPDATE_URL}/bootloader         # https://ha-upgrade.overkiz.com/bootloader
PODURL=${UPDATE_URL}/pod                       # https://ha-upgrade.overkiz.com/pod
ENVNAME=${UPDATE_URL}/envname                  # https://ha-upgrade.overkiz.com/envname

ROOT_FILE=core-image-kizos-recovery-at91-kizboxmini-rootfs.ubifs.xz
APPS_FILE=core-image-kizos-recovery-at91-kizboxmini-appsfs.ubifs.xz
KBOOT_FILE=zImage-initramfs-at91-kizboxmini-dtb.bin
DTB_FILE=zImage-at91-kizboxmini.dtb
SECURITY_FILE=security.squashfs
BOOTSTRAP_FILE=bootstrap-at91-kizboxmini.bin

if [ -f "/etc/security/serial" ]; then POD_SERIAL=$(cat /etc/security/serial)
else POD_SERIAL="$(sed -En 's/.*CN=(([0-9]{4}-?){3}).*/\1/p' /etc/security/client.crt 2> /dev/null)"
envname=$(curl --config /etc/curl.d/pod-serial.conf --url "$UPDATE_URL/envname" $CURLOPTS);

## curl.conf
ssl_cert=/etc/security/client.crt ssl_key=/etc/security/client.key ssl_ca_file=/etc/security/ca.crt
option ssl_dont_verify_peer 0 follow_location 1 connect_timeout_ms 10000 transfer_timeout_ms 600000

src/gz kizos-all             https://ha-upgrade.overkiz.com/at91-kizboxmini/all
src/gz kizos-arm926ejse      https://ha-upgrade.overkiz.com/at91-kizboxmini/arm926ejse
src/gz kizos-at91_kizboxmini https://ha-upgrade.overkiz.com/at91-kizboxmini/at91_kizboxmini

#!/bin/curl kizos.conf
--cacert ca.crt --cert client.crt --key client.key --location --styled-output --remote-time --remote-name --output-dir ./images --ssl-revoke-best-effort --show-error
--output ./image_curl.bin
--connect-timeout 10 --max-time 1200 --output ./ --head

curl --config ./kizos.conf --url "$IMAGESURL/$1?security-version=2&distro=$(cat /etc/version)" --output "$2" --show-error
curl --config ./kizos.conf --url "https://ha-upgrade.overkiz.com/images/at91-kizboxmini/$1?security-version=2&distro=20210511194540" --output "$2" --show-error


UPDATE_URL=https://ha-upgrade.overkiz.com
envname=$(curl --url "https://ha-upgrade.overkiz.com/envname" --cacert ca.crt --cert client.crt --key client.key --styled-output --location --fail-with-body --fail-early --show-error --connect-timeout 50 --max-time 1200 --remote-time --remote-name)
  pod-serial.conf: --cacert ca.crt --cert client.crt --key client.key --styled-output --location --fail-with-body --fail-early --show-error --connect-timeout 50 --max-time 1200 --remote-time --remote-name

 sudo chroot /home/velocet/fw/mini/kizboxmini ./usr/bin/curl --url "178.32.15.250/envname" --cacert ca.crt --cert client.crt --key client.key --styled-output --location --fail-early --show-error --connect-timeout 50 --max-time 1200 --remote-time --remote-name
