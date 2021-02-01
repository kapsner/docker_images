#!/bin/bash

printf "\nBuild rdsc_base_img image\n"
cd ../base_image
docker build --build-arg BASEIMAGE=ubuntu:20.10 -f Dockerfile -t base_image .
cd ../Rdatascience

printf "\nBuild rdsc_base image\n"
docker build --build-arg BASEIMAGE=base_image:latest -f image_rdsc_base/Dockerfile -t rdsc_base .

printf "\nBuild rdsc_headless image\n"
docker build -f image_rdsc_headless/Dockerfile -t rdsc_headless .

printf "\nBuild rdsc_rstudio image\n"
docker build --build-arg BASEIMAGE=rdsc_headless:latest -f image_rdsc_rstudio/Dockerfile -t rdsc_rstudio .
