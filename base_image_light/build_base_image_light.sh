#!/bin/bash

printf "\nBuild base_image_light image\n"
#docker build --build-arg BASEIMAGE=ubuntu:20.10 -f Dockerfile -t base_image_light .
docker build --network host --build-arg BASEIMAGE=ubuntu:20.10 -f Dockerfile -t base_image_light .
