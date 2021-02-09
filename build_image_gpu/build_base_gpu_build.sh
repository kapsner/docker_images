#!/bin/bash

printf "\nBuild base_gpu_build image\n"
cd ../base_image
#docker build --build-arg BASEIMAGE=nvidia/cuda:11.0.3-cudnn8-runtime-ubuntu20.04 -f Dockerfile -t base_gpu_build .
docker build --network host --build-arg BASEIMAGE=nvidia/cuda:11.0.3-cudnn8-devel-ubuntu20.04 -f Dockerfile -t base_gpu_build .
