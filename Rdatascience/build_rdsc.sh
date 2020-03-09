#!/bin/bash

printf "\nBuild rdsc_base image\n"
docker build -f Dockerfile -t rdsc_base .

# printf "\nBuild rdsc_bio image\n"
# docker build -f bio/Dockerfile -t rdsc_bio .

# printf "\nBuild gpu images\n"
# docker build -f gpu/Dockerfile-base -t rdsc_gpu_base .
# docker build -f gpu/Dockerfile -t rdsc_gpu .