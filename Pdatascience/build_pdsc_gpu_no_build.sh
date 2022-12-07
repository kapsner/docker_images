#!/bin/bash

export BUILD_RUNTIME_IMG=nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

cd ../base_image
./build_base_image_gpu.sh

cd ../Pdatascience/
printf "\nBuild pdsc_gpu_nobuild image\n"
docker build -f image_pdsc_gpu/Dockerfile.nobuild -t pdsc_gpu_nobuild .

printf "\nBuild pdsc_gpu_base image\n"
docker build --build-arg BASEIMAGE=pdsc_gpu_nobuild:latest -f image_pdsc_base/Dockerfile -t pdsc_gpu_base .

printf "\nBuild pdsc_gpu image\n"
docker build -f image_pdsc_gpu/Dockerfile -t pdsc_gpu .

printf "\nBuild pdsc_jpylab_gpu image\n"
docker build --build-arg BASEIMAGE=pdsc_gpu:latest -f image_pdsc_jpylab/Dockerfile -t pdsc_jpylab_gpu .
