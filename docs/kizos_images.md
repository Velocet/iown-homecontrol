# KizOS Images

In this folder you will find the extracted updates Somfy provided online. At the time of this writing all known download locations (except for 'Animeo IP') are gone.

Somfy provides updates in their own format (BPK/BPK2) which is implemented in Barebox. The source code is available and can be found in the extras folder. Sadly the [official git](https://www.gitorious.org/libbpk) is offline.

To spare you the pain of unpacking those images the subfolders contain all "partitions" from the mentioned BPKs.

## List of Images

- AnimeoIP_1.0.1.654-picocom-release.bpk (8015088 Byte)
  - MD5: DDA30CC6F6FAEAD500C68AE24BD9605D
  - SHA1: 1C66C3BC8B1FD9657E61094FE4A1B831E85C5ED5
- IP_io_Gateway_v1.1.9.1735_release.bpk2 (27898446 Byte)
  - MD5: FCC6F7A2A91B9BC6415BAEAC199C51AB
  - SHA1: A64377E5F565DBD511CA64BB92C15B34C93E5026
- IP_Sensor_Gateway_v1.1.9.1743_release.bpk2 (27730382 Byte)
  - MD5: 5D397CBFD86C2A05F3A23900993046E9
  - SHA1: B327300949C50565F852F2448B0B4872A38D97CD
- Main_Controller_v1.1.9.1709_release.bpk2 (32764324 Byte)
  - MD5: A8D440047B3A702E4DFC9AAFB3D23330
  - SHA1: 47373D354BF403EBB52C8C4C197B565C2C9344D7

## mkbpk - Extract/Create Somfy Binary Partition

- barebox [Kconfig Description](https://git.pengutronix.de/cgit/barebox/tree/fs/Kconfig#n92):
  > Simple update file format developed for Somfy, tools and library are available under LGPLv2 [gitorious.org/libbpk](https://www.gitorious.org/libbpk).
  >
  > This format in the v1.0 allow you to store 6 types a binary stream for a unique hardware id:
  > - bootloader
  > - bootloader_version
  > - description.gz
  > - kernel
  > - rootfs
  > - firmware_version

From the discussions on the mailing list it seems the format wasn't needed at all. Thats why v2 (BPK2) didn't make it into barebox...

If you have an already extracted image the following commands show you the usage for mkbpk:

```sh
# install qemu-arm-static
$> sudo apt -y install qemu-user-static

# https://github.com/qemu/qemu/blob/master/scripts/qemu-binfmt-conf.sh
$> sudo update-binfmts --enable qemu-arm

# copy and qemu to root for convenience
$> cp $(which qemu-arm-static) ./qemu

# create alias for faster execution
$> alias iownbpk="sudo chroot ../ ../qemu ../usr/bin/mkbpk"

#!/usr/bin/env bash
function extract_bpk () {
partition=$(basename "$bpk" | sed 's/\.bpk$//')
name=$(sed 's/^..//;s/.(.*//')
size=$(sed 's/^.*size: //;s/,.*//')
hwid=$(sed 's/^.*=//;s/.$//')
mkbpk -x $bpk "$name:0x$hwid:$partition.$name"
kernel:0x0:AnimeoIP_1.0.1.654-kernel.uImage
$(basename):0x0:AnimeoIP_1.0.1.654-kernel.uImage
  case "$string" in
    *bootloader*)
      # Do stuff
      ;;
    *bootloader_version*)
      # Do stuff
      ;;
    *rootfs*)
      # Do stuff
      ;;
    *kernel*)
      # Do stuff
      ;;
    *" version"*
      # Do stuff
      ;;
  esac
}

# list paritions inside the bpk
$> iownbpk -l ./$image.bpk2
Bpk partitions:
  version (size: 10, hw_id=00000000)
  kernel (size: 101010, hw_id=00000000)
  rootfs (size: 101010, hw_id=00000000)
  bootloader (size: 101010, hw_id=00000000)
  bootloader_version (size: 10, hw_id=00000000)

# extract partitions with info from parition list
$> iownbpk -x ./$image.bpk2 $partition:$hardware_id:$image-$parition.$partitionType

# AnimeoIP_1.0.1.654-picocom-release.bpk
iownbpk -l ./AnimeoIP_1.0.1.654-picocom-release.bpk
iownbpk -x ./AnimeoIP_1.0.1.654-picocom-release.bpk kernel:0x0:AnimeoIP_1.0.1.654-kernel.uImage
iownbpk -x ./AnimeoIP_1.0.1.654-picocom-release.bpk version:0x0:AnimeoIP_1.0.1.654-version.txt
iownbpk -x ./AnimeoIP_1.0.1.654-picocom-release.bpk rootfs:0x0:AnimeoIP_1.0.1.654-rootfs.img
iownbpk -x ./AnimeoIP_1.0.1.654-picocom-release.bpk bootloader:0x0:AnimeoIP_1.0.1.654-bootloader.img
iownbpk -x ./AnimeoIP_1.0.1.654-picocom-release.bpk bootloader_version:0x0:AnimeoIP_1.0.1.654-bootloader_version.txt

# Main_Controller_v1.1.9.1709_release.bpk2
iownbpk -l ./Main_Controller_v1.1.9.1709_release.bpk2
iownbpk -x ./Main_Controller_v1.1.9.1709_release.bpk2 kernel:0x1C62D0:Main_Controller_v1.1.9.1709-kernel.uImage
iownbpk -x ./Main_Controller_v1.1.9.1709_release.bpk2 version:0x1C62D0:Main_Controller_v1.1.9.1709-version.txt
iownbpk -x ./Main_Controller_v1.1.9.1709_release.bpk2 rootfs:0x1C62D0:Main_Controller_v1.1.9.1709-rootfs.img
iownbpk -x ./Main_Controller_v1.1.9.1709_release.bpk2 bootloader:0x1C62D0:Main_Controller_v1.1.9.1709-bootloader.img
iownbpk -x ./Main_Controller_v1.1.9.1709_release.bpk2 bootloader_version:0x1C62D0:Main_Controller_v1.1.9.1709-bootloader_version.txt

# IP_io_Gateway_v1.1.9.1735_release.bpk2
iownbpk -l ./IP_io_Gateway_v1.1.9.1735_release.bpk2
iownbpk -x ./IP_io_Gateway_v1.1.9.1735_release.bpk2 kernel:0x1C62D6:IP_io_Gateway_v1.1.9.1735-kernel.uImage
iownbpk -x ./IP_io_Gateway_v1.1.9.1735_release.bpk2 version:0x1C62D6:IP_io_Gateway_v1.1.9.1735-version.txt
iownbpk -x ./IP_io_Gateway_v1.1.9.1735_release.bpk2 rootfs:0x1C62D6:IP_io_Gateway_v1.1.9.1735-rootfs.img
iownbpk -x ./IP_io_Gateway_v1.1.9.1735_release.bpk2 bootloader:0x1C62D6:IP_io_Gateway_v1.1.9.1735-bootloader.img
iownbpk -x ./IP_io_Gateway_v1.1.9.1735_release.bpk2 bootloader_version:0x1C62D6:IP_io_Gateway_v1.1.9.1735-bootloader_version.txt

# IP_Sensor_Gateway_v1.1.9.1743_release.bpk2
iownbpk -l ./IP_Sensor_Gateway_v1.1.9.1743_release.bpk2
iownbpk -x ./IP_Sensor_Gateway_v1.1.9.1743_release.bpk2 kernel:0x1C62D8:IP_Sensor_Gateway_v1.1.9.1743-kernel.uImage
iownbpk -x ./IP_Sensor_Gateway_v1.1.9.1743_release.bpk2 version:0x1C62D8:IP_Sensor_Gateway_v1.1.9.1743-version.txt
iownbpk -x ./IP_Sensor_Gateway_v1.1.9.1743_release.bpk2 rootfs:0x1C62D8:IP_Sensor_Gateway_v1.1.9.1743-rootfs.img
iownbpk -x ./IP_Sensor_Gateway_v1.1.9.1743_release.bpk2 bootloader:0x1C62D8:IP_Sensor_Gateway_v1.1.9.1743-bootloader.img
iownbpk -x ./IP_Sensor_Gateway_v1.1.9.1743_release.bpk2 bootloader_version:0x1C62D8:IP_Sensor_Gateway_v1.1.9.1743-bootloader_version.txt

# TouchBuCo4Zones_v1.3.0.1011.bpk2
iownbpk -l ./TouchBuCo4Zones_v1.3.0.1011.bpk2
iownbpk -x ./TouchBuCo4Zones_v1.3.0.1011.bpk2 kernel:0x1C629E:TouchBuCo4Zones_v1.3.0.1011-kernel.uImage
iownbpk -x ./TouchBuCo4Zones_v1.3.0.1011.bpk2 version:0x1C629E:TouchBuCo4Zones_v1.3.0.1011-version.txt
iownbpk -x ./TouchBuCo4Zones_v1.3.0.1011.bpk2 rootfs:0x1C629E:TouchBuCo4Zones_v1.3.0.1011-rootfs.img
iownbpk -x ./TouchBuCo4Zones_v1.3.0.1011.bpk2 bootloader:0x1C629E:TouchBuCo4Zones_v1.3.0.1011-bootloader.img
iownbpk -x ./TouchBuCo4Zones_v1.3.0.1011.bpk2 bootloader_version:0x1C629E:TouchBuCo4Zones_v1.3.0.1011-bootloader_version.txt

# TouchBuCoBacnet8Zones_v3.3.0.1759.bpk2
iownbpk -l ./TouchBuCoBacnet8Zones_v3.3.0.1759.bpk2
iownbpk -x ./TouchBuCoBacnet8Zones_v3.3.0.1759.bpk2 kernel:0x1C8A8B:TouchBuCoBacnet8Zones_v3.3.0.1759-kernel.uImage
iownbpk -x ./TouchBuCoBacnet8Zones_v3.3.0.1759.bpk2 version:0x1C8A8B:TouchBuCoBacnet8Zones_v3.3.0.1759-version.txt
iownbpk -x ./TouchBuCoBacnet8Zones_v3.3.0.1759.bpk2 rootfs:0x1C8A8B:TouchBuCoBacnet8Zones_v3.3.0.1759-rootfs.img
iownbpk -x ./TouchBuCoBacnet8Zones_v3.3.0.1759.bpk2 bootloader:0x1C8A8B:TouchBuCoBacnet8Zones_v3.3.0.1759-bootloader.img
iownbpk -x ./TouchBuCoBacnet8Zones_v3.3.0.1759.bpk2 bootloader_version:0x1C8A8B:TouchBuCoBacnet8Zones_v3.3.0.1759-bootloader_version.txt

# RS485SettingTool_5102155A10.bpk
iownbpk -l ./RS485SettingTool_5102155A10.bpk
iownbpk -x ./RS485SettingTool_5102155A10.bpk app:0x4DD56A:RS485SettingTool_5102155A10-app.img
```
