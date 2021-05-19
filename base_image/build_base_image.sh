#!/bin/bash

printf "\nBuild base_image image\n"
docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) --build-arg BASEIMAGE=ubuntu:20.10 -f Dockerfile -t base_image .
