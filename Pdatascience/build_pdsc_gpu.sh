#!/bin/bash

export BUILD_DEVEL_IMG=nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04
export BUILD_RUNTIME_IMG=nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

# build basic build image ontop of nvidia/cuda-devel container
printf "\nBuild base_gpu_build image\n"
cd ../build_image_gpu
./build_base_gpu_build.sh

printf "\nBuild pdsc_gpu_build image\n"
docker build -f Dockerfile.py -t pdsc_gpu_build .

# build final image ontop of nvidia/cuda-runtime container
# (could happen in parallel to first 2 steps in the future)
cd ../base_image
./build_base_image_gpu.sh

cd ../Pdatascience/
printf "\nBuild pdsc_gpu_multistage image\n"
docker build -f image_pdsc_gpu/Dockerfile.multi -t pdsc_gpu_multistage .

printf "\nBuild pdsc_gpu_base image\n"
docker build --build-arg BASEIMAGE=pdsc_gpu_multistage:latest -f image_pdsc_base/Dockerfile -t pdsc_gpu_base .

printf "\nBuild pdsc_gpu image\n"
docker build -f image_pdsc_gpu/Dockerfile -t pdsc_gpu .

printf "\nBuild pdsc_jpylab_gpu image\n"
docker build --build-arg BASEIMAGE=pdsc_gpu:latest -f image_pdsc_jpylab/Dockerfile -t pdsc_jpylab_gpu .
