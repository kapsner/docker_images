#!/bin/bash

printf "\nBuild rdsc_gpu_base image\n"
source image_rdsc_gpu_base/build_rdsc_gpu_base.sh

printf "\nBuild rdsc_gpu image\n"
source image_rdsc_gpu/build_rdsc_gpu.sh
