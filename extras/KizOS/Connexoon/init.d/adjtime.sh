#!/bin/sh
# shellcheck disable=SC2170,SC2086,SC1091,SC2039

if ! test -f /etc/timestamp; then
  echo "Missing timestamp reference file!"
  exit 1
fi

[ -f /etc/default/rcS ] && . /etc/default/rcS

case "$1" in
  start)
    if test -e /dev/rtc; then
      hwclock --utc --hctosys
      if [ "$VERBOSE" != no ]; then
         echo -n "System Clock set to... "
         date
      fi
    fi

    BUILDDATE=$(cat /etc/timestamp)
    COMP_TIME=$BUILDDATE
    TODAY=$(date -u +%4Y%2m%2d%2H%2M%2S)
    # In case of security.squashfs update, we might have the creation date
    # younger than the kizos build time
    if test -s /etc/security/client.crt; then
      SEC_PART=$(stat -c "%Y" /etc/security/client.crt)
      SEC_PART=$(date -u -d @"$SEC_PART" +%4Y%2m%2d%2H%2M%2S)
      if [ "$SEC_PART" -gt "$BUILDDATE" ]; then
          COMP_TIME=$SEC_PART
      fi
    fi

    if ! [ "$TODAY" -gt "$COMP_TIME" ]; then
      if [ "$VERBOSE" != no ]; then
        echo "Adjust time from $TODAY to default $COMP_TIME"
      fi
      # format the timestamp as date expects it (2m2d2H2M4Y.2S)
      TS_YR=${COMP_TIME%??????????}
      TS_SEC=${COMP_TIME#????????????}
      TS_FIRST12=${COMP_TIME%??}
      TS_MIDDLE8=${TS_FIRST12#????}

      date -u ${TS_MIDDLE8}${TS_YR}.${TS_SEC}
      if test -e /dev/rtc; then
        # set system and hardware clock
        hwclock --utc --systohc
      fi
    fi
    ;;

  stop)
    if test -e /dev/rtc; then
      hwclock --utc --systohc
      if [ "$VERBOSE" != no ]; then
        echo "Hardware Clock updated."
      fi
    fi
    ;;
  *)
   echo "Usage: $0 {start|stop}"
esac

