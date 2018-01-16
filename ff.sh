#!/bin/bash

netstat -an | grep -q "tcp4.*\*\.6000"

if [ $? -gt 0 ];then
    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
fi

export MAC_IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $MAC_IP
docker run --rm -e DISPLAY=$MAC_IP:0 docker-gui-firefox-quantum
