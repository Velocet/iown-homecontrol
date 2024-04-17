#!/bin/sh
. /usr/share/kizosenv.sh
[ -f /etc/default/rcS ] && . /etc/default/rcS

MOUNT_POINT="/apps"

mount_apps()
{
  active_root_vol="$(get_cmdline_root_vol | cut -d: -f2)"

  if [ "$active_root_vol" = "$ROOT_VOLUME_NAME" ] ; then
    APPS_VOL="$APPS_VOLUME_NAME"
  elif [ "$active_root_vol" = "$ROOT_B_VOLUME_NAME" ] ; then
    APPS_VOL="$APPS_B_VOLUME_NAME"
  else
   echo "Unknown Root volume used $active_root_vol"
   return 1
  fi

  MOUNT_OPT="chk_data_crc,relatime"

  if have_apps_ro ; then
    MOUNT_OPT="${MOUNT_OPT},ro"
  fi

  if have_authentication ; then
    MOUNT_OPT="${MOUNT_OPT},auth_key=ubifs:rootfs,auth_hash_name=sha256"
  fi

  mount -t ubifs -o $MOUNT_OPT "ubi0:${APPS_VOL}" $MOUNT_POINT
}


case $1 in
start)
  [ "${VERBOSE}" != "no" ] && echo -n "Starting ${0##*/}..."
  if ! grep -qw $MOUNT_POINT /proc/mounts ; then
    if ! mount_apps ; then
      echo "we can't mount apps, maybe system check can fix the problem"
      exit 1
    fi
  fi
  ;;

stop)
  [ "${VERBOSE}" != "no" ] && echo -n "Stopping ${0##*/}..."
  mount | grep -q $MOUNT_POINT && umount $MOUNT_POINT
  ;;

status)
  mount | grep -q $MOUNT_POINT
  ;;

restart|reload)
  $0 stop > /dev/null
  $0 start > /dev/null
  ;;

*)
  echo "Usage: $0 {start|stop|status|restart|reload}"
  exit 1
  ;;
esac


