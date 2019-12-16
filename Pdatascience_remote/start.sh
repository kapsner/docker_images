#!/bin/bash

# bring container up
docker-compose up -d

# start ssh service
docker exec -u root -d pdatascience_re service ssh start

# list login token
sleep 5
# RUNTIMEDIR=$(docker exec pdatascience_re jupyter --runtime-dir)
# echo $RUNTIMEDIR

docker exec pdatascience_re bash -c "source /copy_json.sh"

# get containers ip
printf "\n\nIP-Address of Container:\n\n"
docker inspect pdatascience_re | grep '"IPAddress"'
