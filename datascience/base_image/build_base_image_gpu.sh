#!/bin/bash

printf "\nBuild base_image_gpu image\n"
docker build $NOCACHE --build-arg BASEIMAGE=$BUILD_RUNTIME_IMG -f Dockerfile -t base_image_gpu .
