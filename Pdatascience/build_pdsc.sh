#!/bin/bash

printf "\nBuild pdsc_base_img image\n"
cd ../base_image
docker build --build-arg BASEIMAGE=ubuntu:20.10 -f Dockerfile -t base_image .
cd ../Pdatascience

printf "\nBuild pdsc_base image\n"
docker build --build-arg BASEIMAGE=base_image:latest -f image_pdsc_base/Dockerfile -t pdsc_base .

printf "\nBuild pdsc_headless image\n"
docker build -f image_pdsc_headless/Dockerfile -t pdsc_headless .

printf "\nBuild pdsc_jpylab image\n"
docker build --build-arg BASEIMAGE=pdsc_headless:latest -f image_pdsc_jpylab/Dockerfile -t pdsc_jpylab .
