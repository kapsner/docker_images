#!/bin/bash

REBUILD_FLAG=$1

if [$REBUILD_FLAG -eq 1]
then
    printf "\n\nRebuilding image\n\n"
    docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -f ./Dockerfile -t pdsc_jpylab_gpu_run .
else
    printf "\n\nUsing old image\n\n"
fi

docker-compose -f docker-compose_GPU.yml up -d

docker logs -f pdsc_jpylab_gpu_run
