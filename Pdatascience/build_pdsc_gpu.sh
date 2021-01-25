#!/bin/bash

cd ../gpu_base/
./build_gpu_base.sh
cd ../Pdatascience/

printf "\nBuild pdsc_gpu image\n"
docker build -f image_pdsc_gpu/Dockerfile -t pdsc_gpu .

printf "\nBuild pdsc_jpylab_gpu image\n"
docker build --build-arg BASEIMAGE=pdsc_gpu:latest -f image_pdsc_jpylab/Dockerfile -t pdsc_jpylab_gpu .
