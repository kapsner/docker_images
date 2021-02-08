#!/bin/bash

printf "\nBuild base_gpu_light image\n"
cd ../base_image_light
#docker build --build-arg BASEIMAGE=nvidia/cuda:11.0.3-cudnn8-runtime-ubuntu20.04 -f Dockerfile -t base_gpu_light .
docker build --network host --build-arg BASEIMAGE=nvidia/cuda:11.0.3-cudnn8-runtime-ubuntu20.04 -f Dockerfile -t base_gpu_light .

printf "\nBuild base_gpu image\n"
cd ../base_image/
docker build --network host --build-arg BASEIMAGE=base_gpu_light -f Dockerfile -t base_gpu .
