#!/bin/sh
if [ -e ~/.wng/wng.pid ]; then
    PID=`cat ~/.wng/wng.pid`
    ps -p $PID > /dev/null
    STATUS=$?
    echo "stopping"
    while [ $STATUS -eq 0 ]; do
        kill `cat ~/.wng/wng.pid` > /dev/null
        sleep 5
        ps -p $PID > /dev/null
        STATUS=$?
    done
    rm -f ~/.wng/wng.pid
    echo "Wng server stopped"
fi

