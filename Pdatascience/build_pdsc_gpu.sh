#!/bin/bash

cd ../gpu_base/
./build_gpu_base.sh
cd ../Pdatascience/

printf "\nBuild pdsc_gpu image\n"
docker build -f image_pdsc_gpu/Dockerfile -t pdsc_gpu .
