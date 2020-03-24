#!/bin/bash

printf "\nBuild rdsc_base image\n"
docker build -f image_rdsc_base/Dockerfile -t rdsc_base .

printf "\nBuild rdsc_headless image\n"
docker build -f image_rdsc_headless/Dockerfile -t rdsc_headless .

printf "\nBuild rdsc_rstudio image\n"
docker build -f image_rdsc_rstudio/Dockerfile -t rdsc_rstudio .
