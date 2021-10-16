#!/bin/bash

printf "\nBuild base_image_gpu image\n"
# docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) --build-arg BASEIMAGE=nvidia/cuda:11.0.3-cudnn8-runtime-ubuntu20.04 -f Dockerfile -t base_image_gpu .
docker build --build-arg BASEIMAGE=nvidia/cuda:11.0.3-cudnn8-runtime-ubuntu20.04 -f Dockerfile -t base_image_gpu .
