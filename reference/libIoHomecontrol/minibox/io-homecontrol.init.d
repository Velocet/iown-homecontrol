#!/bin/sh

DAEMON="/apps/overkiz/io-homecontrol/bin/io-homecontrold"
EVENTDIR="/apps/overkiz/io-homecontrol/etc/event.d"
RUNDIR="/apps/overkiz/io-homecontrol"
NAME="io-homecontrol"
PIDDIR=/var/run/$NAME
PIDFILE=$PIDDIR/${DAEMON##*/}.pid
DESC="io-homecontrol daemon"
ARGS=""
CONFIG="/apps/overkiz/io-homecontrol/etc/conf.d/io-homecontrol"

# cron_respwan marker. Do not remove nor edit!

test -x "$DAEMON" || { logger -t "initscript" -p user.err "${0##*/}: DAEMON not executable."; exit 1; }
. /usr/share/kizosenv.sh
[ -f /etc/default/rcS ] && . /etc/default/rcS

debug(){
  [ "$VERBOSE" != no ] && echo $*
  return 0
}

run_events()
{
  if [ -d "$EVENTDIR" ]; then
    debug "Running $1 events... "
    run-parts --arg=$1 $EVENTDIR
    debug "done."
  fi
}

is_running() {
  if $0 status >/dev/null; then
    return 0
  else
    return 1
  fi
}

# set loop_n sleep_t (ms)
wait_notrunning() {
  [ "$#" -eq 2 ] || { echo "WRONG args count $#"; exit 1; }
  local loop=0
  while is_running; do
    [ "$loop" -lt "$1" ] || return 1
    _=$((loop++))
    usleep $(($2 * 1000))
  done
}

action="$1"
case "$action" in
  start)
    logger -t "initscript" -p user.notice "io-homecontrol: $*"
    shift
    if is_running; then
      if [ "$1" = "-o" ] || [ "$1" = "--oknodo" ]; then
        logger -t "initscript" -p user.warn "${DAEMON##*/}: already started.  EXIT."
        exit 0
      else
        logger -t "initscript" -p user.warn "${DAEMON##*/}: already started.  EXIT."
        exit 1
      fi
    fi
    run_events init
    if test -s "$CONFIG"; then
      set -a
      . "$CONFIG"
      set +a
    fi
    if cd $RUNDIR && PIDDIR=$PIDDIR $DAEMON ${*:-$ARGS} > /dev/null; then
      run_events start
      debug "done."
    else
      logger -t "initscript" -p user.err "${DAEMON##*/}: failed to start."
      exit 1
    fi
    ;;

  stop)
    logger -t "initscript" -p user.notice "io-homecontrol: $*"
    shift
    if ! pid=$($0 status) || test -z "$pid"; then
      debug "already stopped."
      exit 0
    fi
    debug -n "stopping $DESC: $NAME... "

    kill "$pid" >/dev/null

    wait_notrunning 10 200 || {
      logger -t "initscript" -p user.warn "${DAEMON##*/}: Force killing."
      kill -SIGKILL "$pid"
      rm -f $PIDFILE
    }

    run_events stop
    debug "done."
    ;;

  restart|reload)
    logger -t "initscript" -p user.notice "io-homecontrol: $*"
    shift
    debug -n "restarting $DESC: $NAME... "
    $0 stop || true
    wait_notrunning 10 500 || {
      logger -t "initscript" -p user.warn "${DAEMON##*/}: force starting."
    }

    run_events restart
    $0 start $* > /dev/null
    debug "done."
    ;;

  status|wait)
    pid=$(cat $PIDFILE 2> /dev/null || echo)
    if test -n "$pid"; then
      [ "$(cat /proc/$pid/comm 2> /dev/null || echo)" = "${DAEMON##*/}" ] || exit 1
      if [ "$1" = wait ]; then
        wait $pid
      fi

    else
      # There might be cases where PIDFILE is not filled (running in
      # foreground?)
      if ! pid=$(pidof -sx ${DAEMON##*/}); then
        exit 1
      fi
    fi
    echo "$pid"
    ;;

  foreground|f|strace|gdb|valgrind)
    logger -t "initscript" -p user.notice "io-homecontrol: $*"
    shift
    $0 stop || true
    wait_notrunning 3 500 || {
      logger -t "initscript" -p user.warn "${DAEMON##*/}: Force killing."
      kill -SIGKILL "$pid"
    }

    if test -s "$CONFIG"; then
      set -a
      . "$CONFIG"
      set +a
    fi
    if [ "$action" = gdb ]; then
      DAEMON="gdbserver localhost:1234 $DAEMON"
      # Get default IP adress
      iface_dflt=$(awk '$2 == 00000000 { print $1 }' /proc/net/route)
      ip_dflt=$(ip addr show dev "$iface_dflt" | \
                awk '$1 == "inet" { sub("/.*", "", $2); print $2 }')
      echo "Type 'target remote $ip_dflt:1234' in your remote gdb."
    elif [ "$action" = strace ] || [ "$action" = valgrind ]; then
      DAEMON="$action $DAEMON"
    fi

    echo "running $DESC: $NAME... "
    run_events init
    set -m
    echo "Starting daemon, using debug level $OVK_LOG_LVL."
    cd $RUNDIR && PIDDIR=$PIDDIR $DAEMON ${*:-$ARGS} -f
    run_events stop
    echo "terminated."
    ;;

  *)
    echo "Usage: $0 {start|stop|restart|status|wait|foreground|gdb|strace|valgrind} [OPTIONS]" >&2
    exit 1
    ;;
esac

exit 0
