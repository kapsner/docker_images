#!/bin/bash

printf "\nBuild gpu_base image\n"
docker build -f Dockerfile -t gpu_base .
