#!/bin/sh
if [ -e ~/.wng/wng.pid ]; then
    PID=`cat ~/.wng/wng.pid`
    ps -p $PID > /dev/null
    STATUS=$?
    if [ $STATUS -eq 0 ]; then
        echo "Wng server already running"
        exit 1
    fi
fi
mkdir -p ~/.wng/
DIR=`dirname "$0"`
cd "${DIR}"
if [ -x jre/bin/java ]; then
    JAVA=./jre/bin/java
else
    JAVA=java
fi
nohup ${JAVA} -cp classes:lib/*:conf:addons/classes -Dwng.runtime.mode=desktop wng.Wng > /dev/null 2>&1 &
echo $! > ~/.wng/wng.pid
cd - > /dev/null
