#!/bin/bash

printf "\nBuild pdsc_base_img image\n"
cd ../base_image
docker build --build-arg BASEIMAGE=nvidia/cuda:11.0-cudnn8-devel-ubuntu18.04 -f Dockerfile -t base_image_gpu .
cd ../base_image_gpu

printf "\nBuild gpu_base image\n"
docker build -f Dockerfile -t base_image_gpu .
