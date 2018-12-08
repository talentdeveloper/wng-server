#!/bin/sh
if [ -x jre/bin/java ]; then
    JAVA=./jre/bin/java
else
    JAVA=java
fi
${JAVA} -cp classes:lib/*:conf:addons/classes -Dwng.runtime.mode=desktop -Dwng.runtime.dirProvider=wng.env.DefaultDirProvider wng.Wng
