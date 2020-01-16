#!/bin/bash

printf "\nBuild gpu images\n"
docker build -f Dockerfile-base -t rdsc_gpu_base .
docker build -f Dockerfile -t rdsc_gpu .
