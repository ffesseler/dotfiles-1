#!/bin/sh
if [ "`ioreg -rc AppleDisplay`" == "" ]
then
    #echo "noscreen"
    if [ "`blueutil status`" == "Status: on" ]
    then
        blueutil off
    fi
else
    #echo "screen"
    if [ "`blueutil status`" == "Status: off" ]
    then
        blueutil on
    fi
fi
