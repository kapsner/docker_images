#!/bin/bash

cd ../gpu_base/
./build_gpu_base.sh
cd ../Rdatascience/

printf "\nBuild rdsc_gpu image\n"
docker build -f image_rdsc_gpu/Dockerfile -t rdsc_gpu .
