#!/bin/bash

# if [ ! "$(docker network ls | grep miracum-net)" ]; then
# docker network create miracum-net
# fi

source ./.env

if [ -f "$CUSTOM_DOCKER_COMPOSE_FILE" ]; then
    echo "Custom docker-compose file $CUSTOM_DOCKER_COMPOSE_FILE exists. Starting it now."
    docker-compose -f $CUSTOM_DOCKER_COMPOSE_FILE up -d
else 
    echo "NO custom docker-compose file exists. Starting the default now."
    docker-compose up -d
fi
