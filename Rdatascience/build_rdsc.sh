#!/bin/bash

printf "JM:"
printf "\nBuild rdsc_base image\n"
docker build -f image_rdsc_base/Dockerfile -t rdsc_base_jm .

printf "\nBuild rdsc_headless image\n"
docker build -f image_rdsc_headless/Dockerfile -t rdsc_headless_jm .

printf "\nBuild rdsc_rstudio image\n"
docker build -f image_rdsc_rstudio/Dockerfile -t rdsc_rstudio_jm .
