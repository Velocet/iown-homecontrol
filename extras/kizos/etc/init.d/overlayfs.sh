#!/bin/sh

. /usr/share/kizosenv.sh

case $1 in
start)
  [ "${VERBOSE}" != "no" ] && echo -n "Starting ${0##*/}..."
  if ! grep -q ubi0:overlayfs /proc/mounts ; then
    if [ -s $PERSISTENTDIR_BOOT/mount-overlayfs ]  && \
       [ "$(cat $PERSISTENTDIR_BOOT/mount-overlayfs)" = "persistent"  ]; then
      mount-overlayfs.sh persistent
    else
      mount-overlayfs.sh remove
    fi
  fi
  ;;

stop)
  [ "${VERBOSE}" != "no" ] && echo -n "Stopping ${0##*/}..."
  ;;

status)
  mount | grep -q overlayfs
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

