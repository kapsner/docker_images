#!/bin/bash

# if [ ! "$(docker network ls | grep miracum-net)" ]; then
# docker network create miracum-net
# fi

source ./.env

file="docker-compose.yml"

if [ -f "$CUSTOM_DOCKER_COMPOSE_FILE" ]; then
    echo "Custom docker-compose file ${CUSTOM_DOCKER_COMPOSE_FILE} exists. Starting it now."
    file=${CUSTOM_DOCKER_COMPOSE_FILE}
else 
    echo "NO custom docker-compose file exists. Starting the default '${file}' now."
fi

## Download the newest image(s):
docker-compose -f ${file} pull

## Spin them up:
docker-compose -f ${file} up -d
