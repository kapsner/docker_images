#!/bin/bash

printf "\nBuild pdsc_base image\n"
docker build -f image_pdsc_base/Dockerfile -t pdsc_base .

printf "\nBuild pdsc_gpu image\n"
docker build -f image_pdsc_gpu/Dockerfile -t pdsc_gpu .
