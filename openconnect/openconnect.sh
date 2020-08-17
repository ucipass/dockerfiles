#!/bin/bash

pidfile="/tmp/openconnect-pid"

case "$1" in
start)
    if [ -f $pidfile ]; then
        echo "Openconnect already started. Use $0 <start|stop>"
        exit 1
    elif [ -n "$HOST" ] && [ -n "$USER" ] && [ -n "$PASS" ]
        then
        echo "ENV:HOST,USER,PASS"
        echo $PASS | openconnect --pid-file=$pidfile --csd-user=root --csd-wrapper=/root/.cisco/csd-wrapper.sh --user=$USER -b $HOST

    elif [ -n "$HOST" ] && [ -n "$USER" ]
        then
        echo "ENV:HOST,USER"
        openconnect --pid-file=$pidfile --csd-user=root --csd-wrapper=/root/.cisco/csd-wrapper.sh -b $HOST --user=$USER
    elif [ -n "$HOST" ]
        then
        echo "ENV:HOST"
        openconnect --pid-file=$pidfile --csd-user=root --csd-wrapper=/root/.cisco/csd-wrapper.sh -b $HOST
    else
       echo "NO HOST ENVIRONMENT VARIABLE SET! Aborting...."
    fi
    ;;
stop)
    cat $pidfile  | xargs kill -2
    ;;
*)
    echo "$0 <start|stop>"
    exit 1
esac