#!/bin/sh

if [ -f /etc/profile.d/podserial.sh ] ; then
  source /etc/profile.d/podserial.sh
else
  SECURITYDIR=/etc/security
  mount | grep -qs "$SECURITYDIR" || mount "$SECURITYDIR"
  if test -f $SECURITYDIR/serial ; then
    POD_SERIAL="$(cat $SECURITYDIR/serial)"
  else
    POD_SERIAL="$(sed -En 's/.*CN=(([0-9]{4}-?){3}).*/\1/p' $SECURITYDIR/client.crt 2> /dev/null)"
  fi
fi

if test -n "$POD_SERIAL" ; then
	hostname "gateway-$POD_SERIAL"
elif test -f /etc/hostname ; then
	hostname -F /etc/hostname
fi
