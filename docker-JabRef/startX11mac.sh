#!/bin/bash

# https://fredrikaverpil.github.io/2016/07/31/docker-for-mac-and-gui-applications/
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $IP

docker-compose up -d
