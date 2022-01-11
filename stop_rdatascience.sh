#!/bin/bash

source ./.env

if [ -f "$CUSTOM_DOCKER_COMPOSE_FILE" ]; then
    echo "Custom docker-compose file $CUSTOM_DOCKER_COMPOSE_FILE exists. Starting it now."
    docker-compose -f $CUSTOM_DOCKER_COMPOSE_FILE down
else 
    echo "NO custom docker-compose file exists. Starting the default now."
    docker-compose down
fi

docker system prune -f
