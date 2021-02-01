#!/bin/bash

cd ../base_image_gpu/
./build_gpu_base.sh
cd ../Pdatascience/

printf "\nBuild rdsc_gpu_base image\n"
docker build --build-arg BASEIMAGE=base_image_gpu:latest -f image_rdsc_base/Dockerfile -t rdsc_gpu_base .

printf "\nBuild rdsc_gpu image\n"
docker build -f image_rdsc_gpu/Dockerfile -t rdsc_gpu .

printf "\nBuild rdsc_gpu_rstudio image\n"
docker build --build-arg BASEIMAGE=rdsc_gpu:latest -f image_rdsc_rstudio/Dockerfile -t rdsc_gpu_rstudio .
