#!/bin/bash

cd ../base_image
./build_base_image.sh
cd ../Rdatascience

printf "\nBuild rdsc_base image\n"
docker build --build-arg BASEIMAGE=base_image:latest -f image_rdsc_base/Dockerfile -t rdsc_base .

printf "\nBuild rdsc_headless image\n"
docker build -f image_rdsc_headless/Dockerfile -t rdsc_headless .

printf "\nBuild rdsc_quarto_headless image\n"
docker build --build-arg BASEIMAGE=rdsc_headless:latest -f image_rdsc_quarto_headless/Dockerfile -t rdsc_quarto_hl .
