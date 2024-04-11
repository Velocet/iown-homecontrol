# KizOS Linux

More info and device configs (kb1, kb2, kbmini) could be found (and should be combined) from the following sites:
- https://github.com/Overkiz/at91bootstrap/tree/overkiz
- floss.overkiz.com

## animeo IP

> Spawn Animeo IP Emulator instance:
>
> `/usr/bin/animeoipioemulator --foreground --registeripio=10.1.10.1:10000,10001 --io_nr_emulated=200 -P /var/run/animeoserver10001.pid -c /etc/animeo/default_hardware_virt.subco`

- Webserver
  - Nonce
    > `tmp/$NONCE.nonce`
    > `local nonce = md5.sumhexa(os.time() .. ":" .. math.random(1, 2000000) .. ":435hwe9df8nGh!#")`
  - Session
    > SERVER_PROTOCOL = "1.1",
      REQUEST_URI = "/lua/xml/service_enabled",
      CONTENT_LENGTH = string.len(content),
      headers = {Cookie = "sid=1"}

### Bootloader

Barebox based bootloader using BPK2 image format.

> etc/passwd
> `0e7fb70e41407ca39203aaa9f92cf7513de70809e2f76a54428daf4d94d185cf`

> /data/animeo_ip.pem
>
```TEXT
-----BEGIN RSA PRIVATE KEY-----
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
-----END RSA PRIVATE KEY-----
```

## Kizbox Mini

- at91-kizboxmini (at91-kizboxmini-connexoon)
  > meta,
  > meta-yocto       ="master:0d086b94725947d4d49ed484a8d665f5db164f0a"
  > meta-prvt-overkiz="master:a006cbfe7ec41d60b93dc1a408f476091b7888bc"

## URLs

> Updates, Packages (OPKG), etc.

```SHELL
UPDATE_URL=https://ha-upgrade.overkiz.com
LOGURL    =${UPDATE_URL}/log                    # https://ha-upgrade.overkiz.com/log
IMAGESURL =${UPDATE_URL}/images/at91-kizboxmini # https://ha-upgrade.overkiz.com/images/at91-kizboxmini
PODURL    =${UPDATE_URL}/                       # https://ha-upgrade.overkiz.com/
```

> /etc/opkg/base-feeds.conf

```SHELL
src/gz kizos-all             <https://ha-upgrade.overkiz.com/at91-kizboxmini/all>
src/gz kizos-arm926ejse      <https://ha-upgrade.overkiz.com/at91-kizboxmini/arm926ejse>
src/gz kizos-at91_kizboxmini <https://ha-upgrade.overkiz.com/at91-kizboxmini/at91_kizboxmini>
```

> /etc/opkg/arch.conf

```SHELL
arch all 1
arch any 6
arch noarch 11
arch arm 16
arch armv4 21
arch armv4t 26
arch armv5 31
arch armv5t 36
arch armv5e 41
arch armv5te 46
arch arm926ejste 51
arch arm926ejse 56
arch at91_kizboxmini 61
```

### KizOs Env

```SHELL
#!/bin/sh
# Globale KizOS environment variables
# Sourced by several scripts

# Buildenv
#DISTRO_VERSION=2022.5.4-9 # at91-kizbox2
DISTRO_VERSION=2021.2.4-11 # at91-kizboxmini
DISTRO_DEBUG=false

# Unlimit core file size under DEBUG under the current shell
$DISTRO_DEBUG && ulimit -c unlimited

[ -z "$OVKSECURITYDIR" ] && OVKSECURITYDIR=/etc/security
[ -z "$OVK_LOG_LVL" ] && OVK_LOG_LVL=3
#[ -z "$MACHINE" ] && MACHINE=at91-kizbox2
[ -z "$MACHINE" ] && MACHINE=at91-kizboxmini
[ -z "$PERSISTENTDIR" ] && PERSISTENTDIR=/persistent
[ -z "$PERSISTENTDIR_ROOT" ] && PERSISTENTDIR_ROOT=/persistent/root
[ -z "$PERSISTENTDIR_BOOT" ] && PERSISTENTDIR_BOOT=/persistent/boot
[ -z "$PERSISTENTDIR_APPS" ] && PERSISTENTDIR_APPS=/persistent/apps
[ -z "$LUA_PATH" ] && LUA_PATH='/apps/overkiz/lib/lua/?.lua;;'
[ -z "$LUA_CPATH" ] && LUA_CPATH='/apps/overkiz/lib/lua/?.so;;'

# partition name
BOOTSTRAP_VOLUME_NAME=bootstrap
UBI_VOLUME_NAME=ubi
DTB_VOLUME_NAME=dtb
DTB_SPARE_VOLUME_NAME=dtb-spare
KBOOT_VOLUME_NAME=kboot
KBOOT_SPARE_VOLUME_NAME=kboot-spare
SECURITY_VOLUME_NAME=security
SECURITY_SPARE_VOLUME_NAME=security-spare
PERSISTENT_VOLUME_NAME=persistent
PERSISTENT_SPARE_VOLUME_NAME=persistent-spare
APPS_VOLUME_NAME=apps
APPS_B_VOLUME_NAME=appsB # at91-kizbox2
DATA_VOLUME_NAME=data    # at91-kizbox2
ROOT_VOLUME_NAME=root
ROOT_B_VOLUME_NAME=rootB
BOOT_VOLUME_NAME=boot
BOOT_B_VOLUME_NAME=bootB
UBOOT_VOLUME=uboot
UBOOT_FACTORY=uboot-factory
UBI_DEVICE_NODE=/dev/ubi0

BOOT_INFORMATION_FILE=/persistent/boot/boot_information_file
DBG_LOG_FILE=$PERSISTENTDIR_BOOT/debug_information_file

# Let the dispatcher block upgrade if the distro does not support the next version
SECURITY_VERSION_SUPPORT=4

sav_log() {
  why=$1
  action=$2
  [ -f $DBG_LOG_FILE ] || touch $DBG_LOG_FILE
  noline=$(wc -l < $DBG_LOG_FILE)
  if [ "$noline" -ge 15 ]; then echo "$(tail -n14 $DBG_LOG_FILE)" > $DBG_LOG_FILE
  fi
  dbgmsg="$(date);$why;$action;"
  echo "$dbgmsg" >> $DBG_LOG_FILE
  echo "$dbgmsg"
}

set_update_source() { export TRIGGERED_BY="$1" }

# check if we have u-boot
have_u_boot() {false}

# check if we have k-boot
have_k_boot() {true}

# check if we have encryption
have_encryption() {false}

# check if we have authentication
have_authentication() {false}

# check if we have apps on read only
have_apps_ro() {false}

run_from_usb_loader() {false}

get_unlock_system_key() {
  # Look for key in user's keyring. If present, use, otherwise store.
  if ! keyctl list @u | grep -q "usk$"; then
    # Store unlock-system-key in keyring, as securam will be cleared
    /usr/bin/securam 0xF8045000 32 | keyctl padd user usk @u >/dev/null
  fi

  # get the key number
  num=$(keyctl list @u | grep usk | cut -d ":" -f1)
  # print the key
  keyctl pipe $num
}

get_system_key() { hexdump -v -e '/1 "%02X"' /etc/security/system-key }

encryption() {
  local in="$1"
  local out="$2"
  local key="$3"
  [ -n "$key" ] || key="$(get_system_key)"
  aesdec encrypt "$in" "$out" "$key"
}

decryption() {
  local in="$1"
  local out="$2"
  local key="$3"
  [ -n "$key" ] || key="$(get_system_key)"
  aesdec decrypt "$in" "$out" "$key"
}

mount_squashfs() {
  local mtd_name="$1"
  local directory="$2"
  if ! grep -q "$directory" /proc/mounts; then
    local id=$(mtd-find -i "$mtd_name" 2>/dev/null) || return 1
    [ -n "$id" ] || return 1
    grep -q "/dev/mtdblock$id" /proc/mounts && umount "/dev/mtdblock$id"
    mount -t squashfs "/dev/mtdblock$id" "$directory" || return 1
  fi
  return 0
}

file_copy_or_decryption() {
  local src="$1"
  local dest="$2"

  decryption "$src/system-key.aes" "$dest/system-key" "$(get_unlock_system_key)" || return 1

  local key="$(get_system_key)"
  for s in $src/*; do
      local f=${s##*/}
      if [ "$f" != "system-key.aes" ]; then
        if [ "${f##*.}" = "aes" ]; then decryption "$s" "$dest/${f%.*}" "$key" || return 1
        else cp -a "$s" "$dest/$f" || return 1
        fi
      fi
  done
}

mount_squashfs_in_tmpfs() {
  local part_name="$1"
  local mount_point="$2"
  local temp_name=$(mktemp -d "/tmp/$part_name-XXXXXX")
  mount_squashfs "$part_name" "$temp_name" || return 1
  mount -t tmpfs -o rw,noatime,mode=751 tmpfs "$mount_point" || { umount "$temp_name" ; rmdir "$temp_name"; return 1; }
  umask 026 "$mount_point"
  file_copy_or_decryption "$temp_name" "$mount_point" || { umount "$temp_name" ; rmdir "$temp_name" ; umount "$mount_point" ; return 1; }
  chgrp www-data $mount_point/webserver.* &>/dev/null
  mount -o remount,ro "$mount_point"
  umount "$temp_name" || return 1
  rmdir "$temp_name"
}

mount_security_partition() {
 if have_encryption ; then mount_squashfs_in_tmpfs "$1" $OVKSECURITYDIR || return 1
 else mount_squashfs "$1" $OVKSECURITYDIR || return 1
 fi
}

mount_security() {mount_security_partition "security"}

mount_security_spare() {mount_security_partition "security-spare"}

test -f $OVKSECURITYDIR/envvars && . $OVKSECURITYDIR/envvars

if [ -z "$POD_SERIAL" ]; then
  if [ -f "$OVKSECURITYDIR/serial" ]; then POD_SERIAL=$(cat $OVKSECURITYDIR/serial)
  elif [ -f "$OVKSECURITYDIR/client.crt" ]; then POD_SERIAL="$(sed -En 's/.*CN=(([0-9]{4}-?){3}).*/\1/p' $OVKSECURITYDIR/client.crt 2> /dev/null)"
  fi
  [ -z "$POD_SERIAL" ] && POD_SERIAL=XXXX-XXXX-XXXX
    export POD_SERIAL
fi

export LUA_PATH
export LUA_CPATH

#test -n "${UPDATE_URL}" || UPDATE_URL=https://ha-upgrade-overkiz-2048.overkiz.com  # at91-kizbox2
test -n "${UPDATE_URL}" || UPDATE_URL=https://ha-upgrade.overkiz.com                # at91-kizboxmini
LOGURL=${UPDATE_URL}/log
#IMAGESURL=${UPDATE_URL}/images/at91-kizbox2
IMAGESURL=${UPDATE_URL}/images/at91-kizboxmini
BOOTLOADERURL=${UPDATE_URL}/bootloader
PODURL=${UPDATE_URL}/pod

export UPDATE_URL

# This function is used to post log to the production dispatcher.
upload() {
  [ "$DISPATCH_LOGGER" = disabled ] && return 0 {
    curl --config /etc/curl.d/pod-serial.conf --url "$LOGURL" --data-ascii "@-" $CURLOPTS
    curl_error="$?"
    if [ "$curl_error" -ne 0 ] ; then
      if which logger >/dev/null; then
        logger -t kizos -p user.warn "[$curl_error]: could not send log to server."
      fi
    fi
  } || true
}

# This function is used to post debug message to a local listner which is used
# in automated tests. Stated as debug strings, send standard debug log to the
# dispatcher. Only the secondary arg is used in automated tests.
debug_log() {
  if [ $# -ne 1 ]; then
    echo "debug: Wrong arg count: $*"
    return
  fi

  if [ -f "$PERSISTENTDIR_ROOT/test_report_url" ]; then
    debug_log_url=$(cat "$PERSISTENTDIR_ROOT/test_report_url")
    dbgu=/dev/ttyS0
    if test -e $dbgu; then
      echo $1 > $dbgu
    fi
    curl --silent --connect-timeout 10 "$debug_log_url"/"$1" > /dev/null || true
  fi
}

# @param 1: maximum time allowed for connection in seconds
getenvname() {
  [ "$DISPATCH_LOGGER" = disabled ] && return 0

  if [ -n "$1" ] ; then
    CURL_TIMEOUT="--connect-timeout $1"
  fi

  if envname=$(curl --config /etc/curl.d/pod-serial.conf --url "$UPDATE_URL/envname" $CURL_TIMEOUT $CURLOPTS --show-error 2> /tmp/curl_err_envname); then
    rm -rf /tmp/curl_err_envname
    unset CURL_TIMEOUT
    return 0
  else
    curl_error=$?
    logger -p user.warn -t kizos "getenvname: $curl_error : $(cat /tmp/curl_err_envname)"
    echo "getenvname: warn $curl_error : $(cat /tmp/curl_err_envname))"
    rm -rf /tmp/curl_err_envname
    unset CURL_TIMEOUT
    return $curl_error
  fi
}

get_cmdline_root_vol() {
  awk -F'=' 'BEGIN{RS=" ";} {if($1=="root") printf "\n"$2;}' /proc/cmdline | tail -n 1
}

download_binary() {
# 1. param : file to download
# 2. param : output
# 3. param : hash to test

  output=$2/$1
  curlerr=$2/curlerr
  binurl=$IMAGESURL/$1
  hashCheck=$3
  retry=3
  error=0
  [ -d "$2" ] || mkdir -p "$2"
  while [ "$retry" -gt 0 ]
  do
    if ! curl --config /etc/curl.d/pod-serial.conf --url "$binurl" --output "$output" --show-error 2>"$curlerr"; then
      retry=$((retry-1))
      sleep 1
      continue
    fi
    chmod 444 "$output"
    # Check app binary
    hash=$(md5sum "$output" | cut -d' ' -f1)
    if [ "$hash" = "$hashCheck" ]; then
      break
    fi
    retry=$((retry-1))
    sleep 1
  done
  [ $retry -eq 0 ] && error=1
  return $error
}
```

### RTS SX1243 Kernel Driver

```SHELL modules.dep
rf-sx1243.ko:
  rf-ook.ko
  rf-core.ko
rts.ko:
  rf-ook.ko
  rf-core.ko
  rts_priv.ko

alias symbol rts_priv:
  rts_private_cleanup
  rts_private_init
  rts_private_new
  rts_private_next
  rts_private_stop_frame

alias symbol rf_core:
  rf_device_get_active_user
  rf_device_register
  rf_device_unregister
  rf_ook_frame_info_next rf_ook
  rf_ook_frame_info_reset rf_ook
  rf_ook_info_init rf_ook
  rf_user_config
  rf_user_get_device
  rf_user_is_attached
  rf_user_own_device
  rf_user_register
  rf_user_release_device
  rf_user_send
  rf_user_try_get_device
  rf_user_unregister

kizbox-hardware.list /etc/init.d/sx1243    0100755

root/var/lib/opkg/info/rf-driver.control Depends: kernel-module-rf-sx1243-4.14.178
Package: kernel-module-rf-sx1243-4.14.178 (SX1243 transceiver kernel driver)
```

### Test Config

```LUA
httpServiceUrl         = os.getenv("OVK_TEST_HTTP_SERVICE_URL")          or "http://portainer.int.overkiz.com:1080",
httpbinServiceHost     = os.getenv("OVK_TEST_HTTPBIN_SERVICE_HOST")      or "       portainer.int.overkiz.com:1080",
wsServerURL            = os.getenv("OVK_TEST_WS_SERVER_URL")             or "  ws://portainer.int.overkiz.com:8000/",
wssServerURL           = os.getenv("OVK_TEST_WSS_SERVER_URL")            or " wss://portainer.int.overkiz.com:8001/",
wssServerURLSelfSigned = os.getenv("OVK_TEST_WSS_SELFSIGNED_SERVER_URL") or " wss://portainer.int.overkiz.com:8002/",
downloadURL            = os.getenv("OVK_TEST_DL_URL")                    or "http://code.jquery.com/jquery-3.2.1.slim.min.js",
downloadMD5            = os.getenv("OVK_TEST_DL_URL_MD5")                or "5F48FC77CAC90C4778FA24EC9C57F37D"
```

## Filesystem

How/Where to mount
How/Where is the relevant info?

### UBIfs

`$ ubireader_display_info volume.bin`

```SHELL
    UBI File
    ---------------------
      Min I/O: 2048
      LEB Size: 126976
      PEB Size: 131072
      Total Block Count: 1018
      Data Block Count: 520
      Layout Block Count: 2
      Internal Volume Block Count: 0
      Unknown Block Count: 496
      First UBI PEB Number: 4
      Image: 372254595
    ---------------------
    Image Sequence Num: 372254595
      Volume Name:dtb
      Volume Name:dtb-spare
      Volume Name:kboot
      Volume Name:kboot-spare
      Volume Name:security
      Volume Name:security-spare
      Volume Name:persistent
      Volume Name:root
      Volume Name:apps
      Volume Name:rootB
      Volume Name:persistent-spare
      PEB Range: 0 - 1017

    Volume: dtb
    ---------------------
      Vol ID: 0
      Name: dtb
      Block Count: 1
      alignment: 1
      crc: '0xb0b3a495'
      data_pad: 0
      errors: ''
      flags: 0
      name: 'dtb'
      name_len: 3
      padding: '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
      rec_index: 0
      reserved_pebs: 1
      upd_marker: 0
      vol_type: 'static'

    Volume: dtb-spare
    ---------------------
      Vol ID: 1
      Name: dtb-spare
      Block Count: 1
      alignment: 1
      crc: '0x8b167b45'
      data_pad: 0
      errors: ''
      flags: 0
      name: 'dtb-spare'
      name_len: 9
      padding: '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
      rec_index: 1
      reserved_pebs: 1
      upd_marker: 0
      vol_type: 'static'

    Volume: kboot
    ---------------------
      Vol ID: 2
      Name: kboot
      Block Count: 39
      alignment: 1
      crc: '0xc9347332'
      data_pad: 0
      errors: ''
      flags: 0
      name: 'kboot'
      name_len: 5
      padding: '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
      rec_index: 2
      reserved_pebs: 39
      upd_marker: 0
      vol_type: 'static'

    Volume: kboot-spare
    ---------------------
      Vol ID: 3
      Name: kboot-spare
      Block Count: 39
      alignment: 1
      crc: '0x712e61bc'
      data_pad: 0
      errors: ''
      flags: 0
      name: 'kboot-spare'
      name_len: 11
      padding: '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
      rec_index: 3
      reserved_pebs: 39
      upd_marker: 0
      vol_type: 'static'

    Volume: security
    ---------------------
      Vol ID: 4
      Name: security
      Block Count: 1
      alignment: 1
      crc: '0xcd257646'
      data_pad: 0
      errors: ''
      flags: 0
      name: 'security'
      name_len: 8
      padding: '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
      rec_index: 4
      reserved_pebs: 1
      upd_marker: 0
      vol_type: 'static'

    Volume: security-spare
    ---------------------
      Vol ID: 5
      Name: security-spare
      Block Count: 1
      alignment: 1
      crc: '0x613eb617'
      data_pad: 0
      errors: ''
      flags: 0
      name: 'security-spare'
      name_len: 14
      padding: '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
      rec_index: 5
      reserved_pebs: 1
      upd_marker: 0
      vol_type: 'static'

    Volume: persistent
    ---------------------
      Vol ID: 6
      Name: persistent
      Block Count: 19
      alignment: 1
      crc: '0x6b3ce58f'
      data_pad: 0
      errors: ''
      flags: 0
      name: 'persistent'
      name_len: 10
      padding: '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
      rec_index: 6
      reserved_pebs: 25
      upd_marker: 0
      vol_type: 'dynamic'

    Volume: root
    ---------------------
      Vol ID: 7
      Name: root
      Block Count: 149
      alignment: 1
      crc: '0x49ce6026'
      data_pad: 0
      errors: ''
      flags: 0
      name: 'root'
      name_len: 4
      padding: '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
      rec_index: 7
      reserved_pebs: 208
      upd_marker: 0
      vol_type: 'dynamic'

    Volume: apps
    ---------------------
      Vol ID: 8
      Name: apps
      Block Count: 122
      alignment: 1
      crc: '0x2bd103e6'
      data_pad: 0
      errors: ''
      flags: 0
      name: 'apps'
      name_len: 4
      padding: '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
      rec_index: 8
      reserved_pebs: 199
      upd_marker: 0
      vol_type: 'dynamic'

    Volume: rootB
    ---------------------
      Vol ID: 9
      Name: rootB
      Block Count: 147
      alignment: 1
      crc: '0xec0b18e5'
      data_pad: 0
      errors: ''
      flags: 0
      name: 'rootB'
      name_len: 5
      padding: '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
      rec_index: 9
      reserved_pebs: 206
      upd_marker: 0
      vol_type: 'dynamic'

    Volume: persistent-spare
    ---------------------
      Vol ID: 10
      Name: persistent-spare
      Block Count: 1
      alignment: 1
      crc: '0xe3482839'
      data_pad: 0
      errors: ''
      flags: 0
      name: 'persistent-spare'
      name_len: 16
      padding: '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
      rec_index: 10
      reserved_pebs: 1
      upd_marker: 0
      vol_type: 'static'
```

#### UBIfs Volumes

```SHELL
$ ubireader_display_info apps.ubifs
UBIFS Image
---------------------
  Min I/O: 2048
  LEB Size: 126976

  UBIFS Super Block Node
  File offset: 24
  ---------------------
    default_compr: 1
    errors:
    fanout: 8
    file_offset: 24
    flags:
    fmt_version: 4
    hash_algo: 0
    hash_mst: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    hmac: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    hmac_wkm: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    jhead_cnt: 1
    key_fmt: 0
    key_hash: 0
    leb_cnt: 199
    leb_size: 126976
    log_lebs: 5
    lpt_lebs: 2
    lsave_cnt: 256
    max_bud_bytes: 8388608
    max_leb_cnt: 2048
    min_io_size: 2048
    orph_lebs: 1
    padding: b'\x00\x00'
    padding1: b'\x00\x00'
    padding2: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    ro_compat_version: 0
    rp_gid: 0
    rp_size: 0
    rp_uid: 0
    time_gran: 1000000000
    uuid: b')e\xee\r\xa3gE\x9d\x89\x1b\xf9.\x87\xee\x89\x1b'

  UBIFS Master Block Node
  File offset: 127000
  ---------------------
    cmt_no: 0
    empty_lebs: 1
    errors:
    file_offset: 127000
    flags: No orphans
    gc_lnum: 111
    hash_lpt: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    hash_root_idx: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    highest_inum: 1192
    hmac: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    idx_lebs: 3
    ihead_lnum: 114
    ihead_offs: 40960
    index_size: 293872
    leb_cnt: 115
    log_lnum: 3
    lpt_lnum: 8
    lpt_offs: 574
    lsave_lnum: 0
    lsave_offs: 0
    lscan_lnum: 11
    ltab_lnum: 8
    ltab_offs: 586
    nhead_lnum: 8
    nhead_offs: 2048
    padding: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    root_len: 88
    root_lnum: 114
    root_offs: 39960
    total_dark: 46976
    total_dead: 59056
    total_dirty: 66952
    total_free: 258048
    total_used: 12586632

  UBIFS Master Block Node
  File offset: 253976
  ---------------------
    cmt_no: 0
    empty_lebs: 1
    errors:
    file_offset: 253976
    flags: No orphans
    gc_lnum: 111
    hash_lpt: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    hash_root_idx: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    highest_inum: 1192
    hmac: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    idx_lebs: 3
    ihead_lnum: 114
    ihead_offs: 40960
    index_size: 293872
    leb_cnt: 115
    log_lnum: 3
    lpt_lnum: 8
    lpt_offs: 574
    lsave_lnum: 0
    lsave_offs: 0
    lscan_lnum: 11
    ltab_lnum: 8
    ltab_offs: 586
    nhead_lnum: 8
    nhead_offs: 2048
    padding: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    root_len: 88
    root_lnum: 114
    root_offs: 39960
    total_dark: 46976
    total_dead: 59056
    total_dirty: 66952
    total_free: 258048
    total_used: 12586632
```

## Binaries

### curl & ssl

/usr/sbin/coredump-uploader
/usr/sbin/image-download
/usr/sbin/stm32-upgrader
/usr/share/kizosenv.sh
/usr/share/wait-for-network/scripts/dispatcher

kizbox2/etc/init.d/wait-for-network <> minibox/etc/init.d/dispatcher

> /etc/lighttpd.d/ssl.conf

```SHELL
ssl.pemfile     = "/etc/security/webserver.crt"
ssl.privkey     = "/etc/security/webserver.key"
ssl.ca-file     = "/etc/security/ca.crt"
ssl.ca-dn-file  = "/etc/security/app_ca.crt"
ssl.cipher-list = "EECDH+AESGCM:EDH+AESGCM:AES128+EECDH:AES128+EDH"
```

> /etc/opkg/curl.conf

```SHELL
ssl_cert             /etc/security/client.crt # --cert   /etc/security/client.crt
ssl_key              /etc/security/client.key # --key    /etc/security/client.key
ssl_ca_file          /etc/security/ca.crt     # --cacert /etc/security/ca.crt
ssl_dont_verify_peer 0
 connect_timeout_ms  10000
transfer_timeout_ms  600000
follow_location      1
```

```SHELL
# standard curl conf
$ curl --cacert /etc/security/ca.crt --cert /etc/security/client.crt --key /etc/security/client.key --connect-timeout 30 --max-time 600 --fail
# coredump.conf
$ -X PUT --retry 3
# pod-serial.conf
$ --location --silent
# post log to production dispatcher
$           curl --config /etc/curl.d/pod-serial.conf --url "$LOGURL" --data-ascii "@-" $CURLOPTS
# ???
$ envname=$(curl --config /etc/curl.d/pod-serial.conf --url "$UPDATE_URL/envname" $CURLOPTS)
```

## Kernel

The process follows this path: zImage >  gz > kernel

- The ubifs image (which is also the zImage in this case) has a device tree appended. This happens on build time via a shell script from barebox/u-boot
- Extract
  ```SHELL
  $ file kboot.zImage
  kboot.zImage: Linux kernel ARM boot executable zImage (little-endian)
  $ arm-linux-gnueabi-objdump -EL -b binary -D -m armv5t kboot.zImage | grep -m 1 -i -F 8b1f | egrep -o '^[^:]+'
  4008
  $ echo $((0x4008))
  16392
  $ dd if=kboot.zImage of=kboot.gz bs=1 skip=16392
  ...
  $ file kboot.gz && gunzip kboot.gz
  kboot.gz: gzip compressed data, max compression, from Unix, original size modulo 2^32 4294967295
  gzip: kboot.gz: decompression OK, trailing garbage ignored
  ```

- Convert Kernel image to ELF
  - [vmlinux-to-elf](https://github.com/marin-m/vmlinux-to-elf)
  - `$ vmlinux-to-elf kboot.ubifs kboot.elf`

- bootargs
  - `ubi.mtd=ubi loglevel=2 console=ttyS0,115200`

### initramfs

initramfs is a root filesystem that is embedded into the kernel and loaded at an early stage of the boot process. It is the successor of initrd. It provides early userspace which can do things the kernel can't easily do by itself during the boot process.

### Files and Binaries

- Links
  - <https://wiki.debian.org/initramfs>
  - <https://wiki.gentoo.org/wiki/Custom_Initramfs>

### CVE Check Ignore

Overkiz disabled CVE patches

<details><summary>linux-overkiz-5.4.bbappend</summary>

```MAKE
# We don't use ntfs
CVE_CHECK_IGNORE += "CVE-2022-1973"

# CONFIG_SAMPLES is not set
CVE_CHECK_IGNORE += "CVE-2021-3736"

# CONFIG_NVM is not set
CVE_CHECK_IGNORE += "CVE-2022-2991"

# CONFIG_ROSE is not set
CVE_CHECK_IGNORE += "CVE-2022-1247"
CVE_CHECK_IGNORE += "CVE-2022-2961"

# We dont use KVM hypervisor
CVE_CHECK_IGNORE += "CVE-2022-1263"
CVE_CHECK_IGNORE += "CVE-2022-2153"
CVE_CHECK_IGNORE += "CVE-2022-0171"

# CONFIG_CIFS is not set
CVE_CHECK_IGNORE += "CVE-2022-0168"
CVE_CHECK_IGNORE += "CVE-2022-3595"

# CONFIG_NET_VENDOR_BROADCOM is not set. Affects only bnx2x card.
CVE_CHECK_IGNORE += "CVE-2018-1000026"

# Neither CONFIG_VHOST nor CONFIG_VHOST_RING is set
CVE_CHECK_IGNORE += "CVE-2018-16880"

# CONFIG_DEBUG_FS should not be set in prod, we allow it under DEBUG
CVE_CHECK_IGNORE += "CVE-2019-3819"

# We dont use ntfs fs
CVE_CHECK_IGNORE += "CVE-2022-1973"

# Cause only a crash
CVE_CHECK_IGNORE += "CVE-2022-2873"

# We dont have CONFIG_NETFILTER_NETLINK_QUEUE
CVE_CHECK_IGNORE += "CVE-2022-36946"

# We dont use KVM hypervisor
CVE_CHECK_IGNORE += "CVE-2019-3887"
CVE_CHECK_IGNORE += "CVE-2020-27152"
CVE_CHECK_IGNORE += "CVE-2020-36313"
CVE_CHECK_IGNORE += "CVE-2021-3501"
CVE_CHECK_IGNORE += "CVE-2020-8834"
CVE_CHECK_IGNORE += "CVE-2018-10901"

# CONFIG_SND is not set
CVE_CHECK_IGNORE += "CVE-2020-11725"
CVE_CHECK_IGNORE += "CVE-2018-10902"

# We dont use vm guest
CVE_CHECK_IGNORE += "CVE-2018-14625"

# CONFIG_VFIO is not set
CVE_CHECK_IGNORE += "CVE-2020-12888"

# We use neither ext3 nor ext4 filesystems
CVE_CHECK_IGNORE += "CVE-2020-14314"
CVE_CHECK_IGNORE += "CVE-2018-10840"
CVE_CHECK_IGNORE += "CVE-2018-10876"

# CONFIG_XFS_FS is not set
CVE_CHECK_IGNORE += "CVE-2020-14385"
CVE_CHECK_IGNORE += "CVE-2021-4037"

# We can't change screen size.
CVE_CHECK_IGNORE += "CVE-2020-14390"

# CONFIG_NF_CT_NETLINK is not activated but be careful as we set some
# netfilter options in netfilter4.cfg
CVE_CHECK_IGNORE += "CVE-2020-25211"

# CONFIG_BLK_DEV_RBD is not set
CVE_CHECK_IGNORE += "CVE-2020-25284"

# CONFIG_HUGETLBFS is not set
CVE_CHECK_IGNORE += "CVE-2020-25285"

# CONFIG_HDLC_PPP is not set
CVE_CHECK_IGNORE += "CVE-2020-25643"

# CONFIG_GENEVE is not set
CVE_CHECK_IGNORE += "CVE-2020-25645"

# Vulnerable should fix it
#"CVE-2020-26541"

# We dont use TPM
CVE_CHECK_IGNORE += "CVE-2022-2977"

# We dont use vmwgfx driver
CVE_CHECK_IGNORE += "CVE-2022-36280"
CVE_CHECK_IGNORE += "CVE-2022-38096"
CVE_CHECK_IGNORE += "CVE-2022-38457"
CVE_CHECK_IGNORE += "CVE-2022-40133"

# We dont use efi firmware
CVE_CHECK_IGNORE += "CVE-2022-40307"

# CONFIG_JFS_FS is not set
CVE_CHECK_IGNORE += "CVE-2022-3202"

CVE_CHECK_IGNORE += "CVE-2022-3170"

# CONFIG_I2C_ISMT is not set
CVE_CHECK_IGNORE += "CVE-2022-3077"

# CONFIG_BPF_SYSCALL is not set
CVE_CHECK_IGNORE += "CVE-2020-27194"
CVE_CHECK_IGNORE += "CVE-2022-2905"
CVE_CHECK_IGNORE += "CVE-2022-3623"
CVE_CHECK_IGNORE += "CVE-2022-2785"
CVE_CHECK_IGNORE += "CVE-2022-3606"
CVE_CHECK_IGNORE += "CVE-2022-3531"
CVE_CHECK_IGNORE += "CVE-2022-3532"
CVE_CHECK_IGNORE += "CVE-2022-3533"
CVE_CHECK_IGNORE += "CVE-2022-3541"
CVE_CHECK_IGNORE += "CVE-2022-3543"
CVE_CHECK_IGNORE += "CVE-2021-4204"
CVE_CHECK_IGNORE += "CVE-2022-0500"
CVE_CHECK_IGNORE += "CVE-2022-3534"

# CONFIG_TARGET_CORE is not set
CVE_CHECK_IGNORE += "CVE-2020-28374"

# CONFIG_IO_URING is not set
CVE_CHECK_IGNORE += "CVE-2020-29373"
CVE_CHECK_IGNORE += "CVE-2020-29534"
CVE_CHECK_IGNORE += "CVE-2021-28951"
CVE_CHECK_IGNORE += "CVE-2020-36387"
CVE_CHECK_IGNORE += "CVE-2021-20226"


# We don't have the file
CVE_CHECK_IGNORE += "CVE-2021-4150"
CVE_CHECK_IGNORE += "CVE-2022-26878"
CVE_CHECK_IGNORE += "CVE-2022-0433"

# CONFIG_WLAN_VENDOR_MARVELL is not set
CVE_CHECK_IGNORE += "CVE-2020-36158"
CVE_CHECK_IGNORE += "CVE-2019-3846"

# CONFIG_VSOCKETS is not set
CVE_CHECK_IGNORE += "CVE-2021-26708"

# CONFIG_NFSD is not set
CVE_CHECK_IGNORE += "CVE-2021-3178"
CVE_CHECK_IGNORE += "CVE-2021-4090"
CVE_CHECK_IGNORE += "CVE-2022-43945"

# CONFIG_BLK_DEV_NBD is not set
CVE_CHECK_IGNORE += "CVE-2021-3348"

# Affected but the fix is already integrated
CVE_CHECK_IGNORE += "CVE-2020-29369"
CVE_CHECK_IGNORE += "CVE-2020-29374"


# Not the good arch or fs (mips, powerpc, x86, etc)
CVE_CHECK_IGNORE += "CVE-2021-38300"
CVE_CHECK_IGNORE += "CVE-2021-37576"
CVE_CHECK_IGNORE += "CVE-2021-38200"
CVE_CHECK_IGNORE += "CVE-2021-29657"
CVE_CHECK_IGNORE += "CVE-2021-38198"
CVE_CHECK_IGNORE += "CVE-2021-29154"
CVE_CHECK_IGNORE += "CVE-2020-36310"
CVE_CHECK_IGNORE += "CVE-2020-36311"
CVE_CHECK_IGNORE += "CVE-2021-30178"
CVE_CHECK_IGNORE += "CVE-2021-40490"
CVE_CHECK_IGNORE += "CVE-2021-4032"
CVE_CHECK_IGNORE += "CVE-2010-0298"
CVE_CHECK_IGNORE += "CVE-2017-1000255"
CVE_CHECK_IGNORE += "CVE-2022-32981"

# We don't have the TeleTYpe subsystem
CVE_CHECK_IGNORE += "CVE-2022-1462"




# CONFIG_RDS is not set
CVE_CHECK_IGNORE += "CVE-2021-45480"

# CONFIG_TEE is not set
CVE_CHECK_IGNORE += "CVE-2021-44733"

# CONFIG_PHONET is not set
CVE_CHECK_IGNORE += "CVE-2021-45095"

# CONFIG_DEBUG_FS is not set in prod
CVE_CHECK_IGNORE += "CVE-2021-42327"

# CONFIG_BPF_SYSCALL is not set
CVE_CHECK_IGNORE += "CVE-2021-41864"
CVE_CHECK_IGNORE += "CVE-2021-38166"
CVE_CHECK_IGNORE += "CVE-2021-33624"
CVE_CHECK_IGNORE += "CVE-2021-33200"
CVE_CHECK_IGNORE += "CVE-2021-31829"
CVE_CHECK_IGNORE += "CVE-2021-29155"
CVE_CHECK_IGNORE += "CVE-2021-29648"
CVE_CHECK_IGNORE += "CVE-2020-27170"
CVE_CHECK_IGNORE += "CVE-2020-27171"
CVE_CHECK_IGNORE += "CVE-2022-0264"
CVE_CHECK_IGNORE += "CVE-2022-0264"
CVE_CHECK_IGNORE += "CVE-2021-4001"
CVE_CHECK_IGNORE += "CVE-2021-20268"
CVE_CHECK_IGNORE += "CVE-2021-45402"

# CONFIG_MEMSTICK is not set
CVE_CHECK_IGNORE += "CVE-2022-0487"
# CONFIG_WLAN_VENDOR_MARVELL is not set
CVE_CHECK_IGNORE += "CVE-2019-10126"

# CONFIG_NET_VENDOR_XILINX is not set
CVE_CHECK_IGNORE += "CVE-2021-38205"
CVE_CHECK_IGNORE += "CVE-2021-38207"

# CONFIG_NFC is not set
CVE_CHECK_IGNORE += "CVE-2021-38208"
CVE_CHECK_IGNORE += "CVE-2020-25672"
CVE_CHECK_IGNORE += "CVE-2021-23134"

# CONFIG_USB_HSO is not set
CVE_CHECK_IGNORE += "CVE-2021-37159"

# CONFIG_F2FS_FS is not set
CVE_CHECK_IGNORE += "CVE-2021-3506"
CVE_CHECK_IGNORE += "CVE-2021-44879"

# CONFIG_TIPC is not set
CVE_CHECK_IGNORE += "CVE-2021-29646"
CVE_CHECK_IGNORE += "CVE-2022-0382"

# CONFIG_USB_GADGETFS is not set
CVE_CHECK_IGNORE += "CVE-2022-24958"

CVE_CHECK_IGNORE += "CVE-2022-25265"
CVE_CHECK_IGNORE += "CVE-2014-8171"

# We dont use NVIDIA GPU
CVE_CHECK_IGNORE += "CVE-2017-6264"

# CONFIG_NF_TABLES is not set
CVE_CHECK_IGNORE += "CVE-2021-46283"
CVE_CHECK_IGNORE += "CVE-2022-32250"
CVE_CHECK_IGNORE += "CVE-2022-1015"
CVE_CHECK_IGNORE += "CVE-2022-2078"

# CONFIG_RPMSG is not set
CVE_CHECK_IGNORE += "CVE-2022-34494"
CVE_CHECK_IGNORE += "CVE-2022-34495"

# CONFIG_VIRT_DRIVERS is not set
CVE_CHECK_IGNORE += "CVE-2022-1651"

# CONFIG_AF_RXRPC is not set
CVE_CHECK_IGNORE += "CVE-2022-1671"


# CONFIG_HID_ELO is not set
CVE_CHECK_IGNORE += "CVE-2022-27950"

# Options not used CONFIG_F2FS_FS_XATTR, CONFIG_AQTION, CONFIG_MWIFIEX, CONFIG_DVB_FIREDTV,
# CONFIG_ASPEED_LPC_CTRL, CONFIG_6PACK, CONFIG_ACPI_APEI_EINJ, CONFIG_IPV6_GRE,
# CONFIG_VIRTIO_CONSOLE, CONFIG_NFS_FS, CONFIG_SUNRPC, CONFIG_NFSD, CONFIG_USB_MAX3421_HCD,
# CONFIG_NFC, CONFIG_ARCH_PERSONAL_SERVER, CONFIG_CAN_BCM, CONFIG_INFINIBAND_ADDR_TRANS,
# CONFIG_BLK_DEV_DM, CONFIG_F2FS_FS, CONFIG_QRTR, CONFIG_NET_VENDOR_FREESCALE, CONFIG_VHOST,
# CONFIG_SND_SOC_SDM845
CVE_CHECK_IGNORE += "CVE-2022-0998"
CVE_CHECK_IGNORE += "CVE-2018-16884"
CVE_CHECK_IGNORE += "CVE-2022-24448"
CVE_CHECK_IGNORE += "CVE-2021-43976"
CVE_CHECK_IGNORE += "CVE-2021-42739"
CVE_CHECK_IGNORE += "CVE-2021-42252"
CVE_CHECK_IGNORE += "CVE-2021-42008"
CVE_CHECK_IGNORE += "CVE-2016-3695"
CVE_CHECK_IGNORE += "CVE-2017-5897"
CVE_CHECK_IGNORE += "CVE-2021-38160"
CVE_CHECK_IGNORE += "CVE-2021-38199"
CVE_CHECK_IGNORE += "CVE-2021-38201"
CVE_CHECK_IGNORE += "CVE-2021-38202"
CVE_CHECK_IGNORE += "CVE-2021-38204"
CVE_CHECK_IGNORE += "CVE-2021-38208"
CVE_CHECK_IGNORE += "CVE-2021-32078"
CVE_CHECK_IGNORE += "CVE-2021-34693"
CVE_CHECK_IGNORE += "CVE-2020-36385"
CVE_CHECK_IGNORE += "CVE-2021-31916"
CVE_CHECK_IGNORE += "CVE-2021-3506"
CVE_CHECK_IGNORE += "CVE-2021-29647"
CVE_CHECK_IGNORE += "CVE-2021-29264"
CVE_CHECK_IGNORE += "CVE-2021-29266"
CVE_CHECK_IGNORE += "CVE-2021-28952"
CVE_CHECK_IGNORE += "CVE-2022-24448"
CVE_CHECK_IGNORE += "CVE-2019-18910"
CVE_CHECK_IGNORE += "CVE-1999-0524"
CVE_CHECK_IGNORE += "CVE-1999-0656"
CVE_CHECK_IGNORE += "CVE-2006-2932"
CVE_CHECK_IGNORE += "CVE-2007-2764"
CVE_CHECK_IGNORE += "CVE-2007-4998"
CVE_CHECK_IGNORE += "CVE-2008-4609"
CVE_CHECK_IGNORE += "CVE-2020-10742"
CVE_CHECK_IGNORE += "CVE-2022-29156"


# Not impacted
CVE_CHECK_IGNORE += "CVE-2010-4563"
CVE_CHECK_IGNORE += "CVE-2011-0640"

# we dont use HP Operaitons Manager
CVE_CHECK_IGNORE += "CVE-2014-2648"

# we dont mount /proc via chroot
CVE_CHECK_IGNORE += "CVE-2008-2544"

# We dont use SElinux
CVE_CHECK_IGNORE += "CVE-2021-43057"

# CONFIG_BONDING is not set
CVE_CHECK_IGNORE += "CVE-2022-0286"

# We dont use xen
CVE_CHECK_IGNORE += "CVE-2021-28688"
CVE_CHECK_IGNORE += "CVE-2021-28715"
CVE_CHECK_IGNORE += "CVE-2021-28714"
CVE_CHECK_IGNORE += "CVE-2021-26934"
CVE_CHECK_IGNORE += "CVE-2022-33740"
CVE_CHECK_IGNORE += "CVE-2022-33741"
CVE_CHECK_IGNORE += "CVE-2022-33742"
CVE_CHECK_IGNORE += "CVE-2022-33744"
CVE_CHECK_IGNORE += "CVE-2022-26365"

# CONFIG_IP_DCCP is not set
CVE_CHECK_IGNORE += "CVE-2020-16119"

# We don't use UEFI Secure boot
CVE_CHECK_IGNORE += "CVE-2020-26541"
CVE_CHECK_IGNORE += "CVE-2016-3699"

# We dont use nouveau kernel module
CVE_CHECK_IGNORE += "CVE-2020-27820"

# CONFIG_IP_SCTP is not set
CVE_CHECK_IGNORE += "CVE-2021-23133"
CVE_CHECK_IGNORE += "CVE-2021-3655"

# CONFIG_BPF_JIT is not set
CVE_CHECK_IGNORE += "CVE-2021-34556"
CVE_CHECK_IGNORE += "CVE-2021-35477"

# Not impacted
CVE_CHECK_IGNORE += "CVE-2021-29649"
CVE_CHECK_IGNORE += "CVE-2018-6559"
CVE_CHECK_IGNORE += "CVE-2019-14899"
CVE_CHECK_IGNORE += "CVE-2016-0774"
CVE_CHECK_IGNORE += "CVE-2021-3773"

# We dont have user with CAP_SYS_ADMIN capa
CVE_CHECK_IGNORE += "CVE-2021-3679"

# We dont have CONFIG_ROSE
CVE_CHECK_IGNORE += "CVE-2022-2318"

# We dont use the Nosy driver
CVE_CHECK_IGNORE += "CVE-2021-3483"

CVE_CHECK_IGNORE += "CVE-2022-39842"

CVE_CHECK_IGNORE += "CVE-2022-2308"
CVE_CHECK_IGNORE += "CVE-2022-2663"

CVE_CHECK_IGNORE += "CVE-2022-3078"
CVE_CHECK_IGNORE += "CVE-2021-3714"
CVE_CHECK_IGNORE += "CVE-2021-3669"
CVE_CHECK_IGNORE += "CVE-2021-4218"
CVE_CHECK_IGNORE += "CVE-2022-0400"
CVE_CHECK_IGNORE += "CVE-2021-3759"

CVE_CHECK_IGNORE += "CVE-2022-28796"
CVE_CHECK_IGNORE += "CVE-2021-3847"
CVE_CHECK_IGNORE += "CVE-2021-4148"
CVE_CHECK_IGNORE += "CVE-2022-0995"
CVE_CHECK_IGNORE += "CVE-2020-36516"

# We dont use kvm's amd code
CVE_CHECK_IGNORE += "CVE-2021-3653"
CVE_CHECK_IGNORE += "CVE-2022-1789"
CVE_CHECK_IGNORE += "CVE-2021-4095"
CVE_CHECK_IGNORE += "CVE-2021-4093"
CVE_CHECK_IGNORE += "CVE-2022-0516"
CVE_CHECK_IGNORE += "CVE-2022-1852"
CVE_CHECK_IGNORE += "CVE-2022-39189"
CVE_CHECK_IGNORE += "CVE-2022-3344"

# CONFIG_ISDN is not set
CVE_CHECK_IGNORE += "CVE-2021-43389"

# CONFIG_NET_VENDOR_AQUANTIA is not set
CVE_CHECK_IGNORE += "CVE-2021-43975"

# CONFIG_FANOTIFY is not set
CVE_CHECK_IGNORE += "CVE-2022-1998"

# CONFIG_IO_URING is not set
CVE_CHECK_IGNORE += "CVE-2022-1786"
CVE_CHECK_IGNORE += "CVE-2022-29968"
CVE_CHECK_IGNORE += "CVE-2022-29582"
CVE_CHECK_IGNORE += "CVE-2021-4023"
CVE_CHECK_IGNORE += "CVE-2022-3176"
CVE_CHECK_IGNORE += "CVE-2022-40476"
CVE_CHECK_IGNORE += "CVE-2022-1043"
CVE_CHECK_IGNORE += "CVE-2022-1508"
CVE_CHECK_IGNORE += "CVE-2022-1976"
CVE_CHECK_IGNORE += "CVE-2022-2327"

# CONFIG_F2FS_FS is not set
CVE_CHECK_IGNORE += "CVE-2021-45469"

# CONFIG_BTRFS_FS is not set
CVE_CHECK_IGNORE += "CVE-2021-38203"


CVE_CHECK_IGNORE += "CVE-2020-16120"
CVE_CHECK_IGNORE += "CVE-2017-1000377"

# CONFIG_PCMCIA is not set
CVE_CHECK_IGNORE += "CVE-2022-44032"
CVE_CHECK_IGNORE += "CVE-2022-44033"
CVE_CHECK_IGNORE += "CVE-2022-44034"
CVE_CHECK_IGNORE += "CVE-2022-41848"

# CONFIG_HID_ROCCAT is not set
CVE_CHECK_IGNORE += "CVE-2022-41850"

# CONFIG_FB_SMSCUFX is not set
CVE_CHECK_IGNORE += "CVE-2022-41848"
CVE_CHECK_IGNORE += "CVE-2022-41849"

# CONFIG_AF_KCM is not set
CVE_CHECK_IGNORE += "CVE-2022-3521"

# CONFIG_SYS_SUPPORTS_HUGETLBFS is not set
CVE_CHECK_IGNORE += "CVE-2022-3522"

# CONFIG_XFRM_OFFLOAD is not set
CVE_CHECK_IGNORE += "CVE-2022-3624"
CVE_CHECK_IGNORE += "CVE-2022-3545"
CVE_CHECK_IGNORE += "CVE-2022-3630"

# CONFIG_MACVLAN is not set
CVE_CHECK_IGNORE += "CVE-2022-3526"

# CONFIG_MEDIA_SUPPORT is not set
CVE_CHECK_IGNORE += "CVE-2022-41218"

# CONGIG_DRM is not set
CVE_CHECK_IGNORE += "CVE-2022-36402"

# CONGIG_NET_MEDIATEK_SOC is not set
CVE_CHECK_IGNORE += "CVE-2022-3636"

# Impacted but do not do harm
CVE_CHECK_IGNORE += "CVE-2020-35501"
CVE_CHECK_IGNORE += "CVE-2021-45485"
CVE_CHECK_IGNORE += "CVE-2021-45486"
CVE_CHECK_IGNORE += "CVE-2021-38209"
CVE_CHECK_IGNORE += "CVE-2018-10882"
CVE_CHECK_IGNORE += "CVE-2019-20794"
CVE_CHECK_IGNORE += "CVE-2021-3411"
CVE_CHECK_IGNORE += "CVE-2021-38206"
CVE_CHECK_IGNORE += "CVE-2021-20265"
CVE_CHECK_IGNORE += "CVE-2021-33034"
CVE_CHECK_IGNORE += "CVE-2021-32399"
CVE_CHECK_IGNORE += "CVE-2021-29650"
CVE_CHECK_IGNORE += "CVE-2020-35499"
CVE_CHECK_IGNORE += "CVE-2021-22600"
CVE_CHECK_IGNORE += "CVE-2021-4154"
CVE_CHECK_IGNORE += "CVE-2021-22555"
CVE_CHECK_IGNORE += "CVE-2021-3564"
CVE_CHECK_IGNORE += "CVE-2021-3573"
CVE_CHECK_IGNORE += "CVE-2021-4083"
CVE_CHECK_IGNORE += "CVE-2020-29372"
CVE_CHECK_IGNORE += "CVE-2018-5873"
CVE_CHECK_IGNORE += "CVE-2021-35039"
```

</details>
