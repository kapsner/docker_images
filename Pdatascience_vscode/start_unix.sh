#!/bin/bash

docker run --rm -d \
--net=host \
--env="DISPLAY" \
-v="$HOME/.Xauthority:/root/.Xauthority:rw" \
-v="$(pwd)/volume:/home/user/volume" \
p_datascience_vc

docker ps -a
