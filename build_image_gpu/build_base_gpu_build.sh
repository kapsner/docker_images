#!/bin/bash

printf "\nBuild base_gpu_build image\n"
cd ../base_image
docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) --build-arg BASEIMAGE=nvidia/cuda:11.0.3-cudnn8-devel-ubuntu20.04 -f Dockerfile -t base_gpu_build .
