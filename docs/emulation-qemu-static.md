# Emulation and Script Decompilation

<https://wiki.debian.org/QemuUserEmulation>
<https://qemu.readthedocs.io/en/latest/user/main.html>

Extract all KizOs images into one combined directory.

```SHELL
# install qemu-arm-static
sudo apt -y install qemu-user-static

# https://github.com/qemu/qemu/blob/master/scripts/qemu-binfmt-conf.sh
sudo update-binfmts --enable qemu-arm

# run any arm binary you like with a simple chroot
alias iown="sudo chroot ."
# set a absolute chroot path if you want to run arm binaries from any directory
alias iown="sudo chroot /home/velocet/iown/kizos/kizbox2"
iown 

sudo chroot /home/velocet/iown/kizos/kizbox2 ./usr/bin/mkbpk
# copy and rename qemu to root for convenience
# NOTE: Only needed when not using update-binfmts
cp $(which qemu-arm-static) ./qemu


# create alias for faster execution
alias iownbpk="sudo chroot ../ ../qemu ../usr/bin/mkbpk"
```

## Filesystem Extraction

```SHELL
> ll
apps.ubifs
kboot.dtb
kboot-spare.dtb
kboot.zImage
kboot-spare.zImage
persistent.ubifs
persistent-spare.squashfs
root.ubifs
rootB.ubifs
security.squashfs
security-spare.squashfs

> unsquashfs -s security.squashfs
Found a valid SQUASHFS 4:0 superblock on security.squashfs.
Creation or last append time Mon May 14 11:02:46 2018
Filesystem size 6028 bytes (5.89 Kbytes / 0.01 Mbytes)
Compression gzip
Block size 131072
Filesystem is not exportable via NFS
Inodes are compressed
Data is compressed
Uids/Gids (Id table) are compressed
Fragments are compressed
Always-use-fragments option is not specified
Xattrs are not stored
Duplicates are removed
Number of fragments 1
Number of inodes 10
Number of ids 1

> sudo ubidump --savedir ./$UBIFS --preserve $UBIFS.ubifs
> sudo unsquashfs -xattrs -dest ./$SQUASHFS $SQUASHFS.squashfs
> sudo gunzip --name persistent-spare/persistent-spare.gz
> sudo tar --extract --keep-directory-symlink --no-overwrite-dir --atime-preserve --preserve-permissions --preserve-order --acls --xattrs --selinux --directory=persistent-spare_untar --file=persistent-spare
> sudo cpio --extract --directory=initrd --make-directories --preserve-modification-time
> dtc --in-format dtb --out kboot.dts --out-format dts --auto-alias kboot.dtb
```

## Kernel Extraction

```SHELL
$> binwalk kboot.zImage

DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             Linux kernel ARM boot executable zImage (little-endian)
16392         0x4008          gzip compressed data, maximum compression, from Unix, last modified: 1970-01-01 00:00:00 (null date)
4868168       0x4A4848        Flattened device tree, size: 25197 bytes, version: 17

$> dd if=kboot.zImage of=vmlinux.gz ibs=1 skip=16392 count=4851776
$> gunzip --keep --name vmlinux.gz
```

## qemu

```SHELL
$> sudo apt install binfmt-support qemu qemu-user-static
...
$> update-binfmts --display
...
$> cp /usr/bin/qemu-arm-static ./usr/bin/
$> chmod -R +x ./bin ./usr/bin ./sbin ./usr/sbin
$> sudo chroot . bin/busybox.nosuid
   BusyBox v1.30.1 (2020-06-26 07:43:06 UTC) multi-call binary.
...
$> sudo mkdir /etc/qemu-binfmt
$> sudo ln -s /usr/arm-linux-gnueabi /etc/qemu-binfmt/arm
```

```SHELL /etc/init.d/binfmt
binfmt_conf=':luajit:M::\x1bLJ::/usr/bin/luajit:F'
mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc
echo 1 > /proc/sys/fs/binfmt_misc/status
cat $binfmt_conf > /proc/sys/fs/binfmt_misc/register
```

## luaJIT

```SHELL etc/binfmt.d/luajit.conf
::luajit:M::\x1bLJ::/usr/bin/luajit:F
```

```SHELL
$> export LUAJIT_DUMPFILE="/home/velocet/luajit.dump"
LUA_IMPORT_PATH
LUA_IMPORT_DBG
LUA_NOENV=LUA_INIT
LUA_INIT
LUA_PATH="./?.lua;/usr/share/luajit-2.0.5/?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;/usr/share/lua/5.1/?.lua;/usr/share/lua/5.1/?/init.lua"
LUA_CPATH="./?.so;/usr/local/lib/lua/5.1/?.so;/usr/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so"
```

`python3 ../luajitdec/devel/main.py /home/velocet/connexoon/ubi-volume/root/apps/share/knowledge/utils/io-somfy-utils.module --output /mnt/d/sfy/kizboxmini/luajitdec/kniosfyutil.txt`

### Decompilation

Simple function to make life easier:

```SHELL
vrelua() {
  # Base dir. Default: $PWD
  lj_basedir=$PWD

  # Output Directory
  lj_file_out="/mnt/d/sfy/kizboxmini/luajitdec"

  # Strip path (filename) for usage as output filename
  lj_basename=$(basename "$1")
  echo $lj_basename

  # Build absolute path from the two commands above
  lj_file="$lj_basedir/$1"

  python3 /home/velocet/git/luajitdec/devel/main.py "$lj_file" --output "$lj_file_out/$lj_basename.luadec"
}
```

Only three files can be found in the image:
> apps/overkiz/trigger/bin/update-state
> apps/overkiz/trigger/bin/triggerd
> apps/overkiz/idealrf/bin/idealrfd
