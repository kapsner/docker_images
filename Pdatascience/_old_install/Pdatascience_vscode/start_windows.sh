#!/bin/bash

IP=$1
export DISPLAY="$IP:0.0"
echo "IP address: $DISPLAY"

# docker run --rm -d \
# --env="DISPLAY" \
# -v="/$(pwd)/volume:/home/user/volume" \
# p_datascience_vc

# workaround with docker-compose, as relative paths do not work in windows
# with "docker run"
docker-compose up -d

docker ps -a
