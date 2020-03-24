#!/bin/bash

printf "\nBuild rdsc_gpu_base image\n"
docker build -f image_rdsc_gpu_base/Dockerfile -t rdsc_gpu_base .

printf "\nBuild rdsc_gpu image\n"
docker build -f image_rdsc_gpu/Dockerfile -t rdsc_gpu .
