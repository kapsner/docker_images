#!/bin/bash

printf "\nBuild base_image image\n"
docker build $NOCACHE --build-arg BASEIMAGE=ubuntu:26.04 -f Dockerfile -t base_image .
