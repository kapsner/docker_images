#!/bin/bash

printf "\nBuild base_gpu_build image\n"
docker build $NOCACHE --build-arg BASEIMAGE=$BUILD_DEVEL_IMG -f Dockerfile -t base_gpu_build .
