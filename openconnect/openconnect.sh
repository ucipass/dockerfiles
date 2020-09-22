#!/bin/bash

pidfile="/tmp/openconnect-pid"
CMD="openconnect --pid-file=$pidfile --csd-user=root --csd-wrapper=/root/.cisco/csd-wrapper.sh"

case "$1" in
start)
    if [ -f $pidfile ]; then
        echo "Openconnect already started. Use $0 <start|stop>"
        exit 1
    fi

    if [ -z "$HOST" ]; then
        echo "NO HOST ENVIRONMENT VARIABLE SET! Aborting...."
        exit 1
    fi

    if [ -n "$USER" ]; then
        CMD="$CMD --user=$USER"
    fi

    if [ -n "$PASS" ]; then
        CMD="echo $PASS | $CMD"
    fi

    if [ -n "$GROUP" ]; then
        CMD="$CMD --authgroup=$GROUP"
    fi

    $CMD -b $HOST

    ;;
stop)
    cat $pidfile  | xargs kill -2
    ;;
*)
    echo "$0 <start|stop>"
    exit 1
esac