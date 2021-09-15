#!/bin/bash

# if [ ! "$(docker network ls | grep miracum-net)" ]; then
# docker network create miracum-net
# fi

docker-compose up -d
