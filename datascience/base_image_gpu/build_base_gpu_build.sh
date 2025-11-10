#!/bin/bash

printf "\nBuild base_gpu_build image\n"
cd ../base_image
docker build --build-arg BASEIMAGE=$BUILD_DEVEL_IMG -f Dockerfile -t base_gpu_build .
