#!/bin/bash

printf "\nBuild base_image_gpu image\n"
cd ../base_image
# use PYVERSION=3.7 here to avoid strange error with "apt_pgk" lib in ubuntu 18.04
# https://stackoverflow.com/questions/56218562/how-to-fix-modulenotfounderror-no-module-named-apt-pkg
docker build --build-arg BASEIMAGE=nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04 -f Dockerfile -t base_image_gpu .
cd ../base_image_gpu

printf "\nBuild gpu_base image\n"
docker build -f Dockerfile -t gpu_base .
