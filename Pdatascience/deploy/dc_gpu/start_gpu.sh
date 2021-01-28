#!/bin/bash

docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -f ./Dockerfile -t pdsc_jpylab_gpu_run .

docker-compose -f docker-compose_GPU.yml up -d

docker logs -f pdsc_jpylab_gpu_run
