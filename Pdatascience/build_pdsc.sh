#!/bin/bash

printf "\nBuild pdsc_base image\n"
docker build -f image_pdsc_base/Dockerfile -t pdsc_base .

printf "\nBuild pdsc_headless image\n"
docker build -f image_pdsc_headless/Dockerfile -t pdsc_headless .


printf "\nBuild pdsc_jpylab image\n"
docker build --build-arg BASEIMAGE=pdsc_headless:latest -f image_pdsc_jpylab/Dockerfile -t pdsc_jpylab .
