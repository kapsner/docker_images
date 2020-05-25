#!/bin/bash

# bring container up
docker-compose up -d

# list login token
sleep 5
docker exec -it pdatascience jupyter notebook list

